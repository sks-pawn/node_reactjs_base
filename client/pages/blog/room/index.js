import React, { Component } from 'react';
import Router from 'next/router'
import Head from 'next/head'
import MyLayout from '~/components/blog/layout/index'
import RoomsList from '~/components/blog/room/RoomsList'
import { ROOM_FETCH, ROOM_CREATE } from '~/actions';
import { Form, Input, Button, Icon, notification } from 'antd';
import _ from 'lodash';

class MyPage extends Component {
    constructor(props) {
        super(props)
        this.state = {
            rooms: [],
            loading: false,
            username: ""
        }
    }

    componentDidMount() {
        this.setState({ username: localStorage.getItem("username") })
        this.fetchRooms();
    }

    fetchRooms = async () => {
        try {
            let rooms = await ROOM_FETCH()
            this.setState({ rooms })
        } catch (error) {
            notification['error']({
                message: error.name,
                description: error.message
            })
        }
    }

    handleRoomCreate = async () => {
        if (!this.state.username) return
        this.setState({ loading: true })
        try {
            let room = await ROOM_CREATE()
            let { uuid } = room;
            this.setState({ loading: false })
            Router.push(`/blog/room/${uuid}`)
        } catch (error) {
            notification['error']({
                message: error.name,
                description: error.message
            })
            this.setState({ loading: false })
        }
    }

    onChange = ({ target }) => {
        const { name, value } = target;
        this.setState({
            [name]: value
        })
        if (name === "username" && !_.isEmpty(value)) localStorage.setItem("username", value);
    }

    render() {
        let { username, loading, rooms } = this.state
        return (
            <MyLayout>
                <Head>
                    <title>Room chat</title>
                </Head>
                <div className='hero'>
                    <h1 className='title'>AdonisJS sockets demo - Room chat!</h1>
                    <div>
                        <Form layout="inline">
                            <Form.Item validateStatus={!username ? 'error' : 'success'} help={!username ? 'Please input your username!' : ''}>
                                <Input placeholder="username"
                                    prefix={<Icon type="user" style={{ color: 'rgba(0,0,0,.25)' }} />}
                                    allowClear
                                    name="username"
                                    value={username}
                                    onChange={this.onChange} />
                            </Form.Item>
                            <Button onClick={this.handleRoomCreate} loading={loading} htmlType="submit">
                                Create a new room
                            </Button>
                        </Form>
                    </div>
                    <div>
                        <RoomsList rooms={rooms} />
                    </div>
                </div>
            </MyLayout >
        )
    }
}


export default MyPage