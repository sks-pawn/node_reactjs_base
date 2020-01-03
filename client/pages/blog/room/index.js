import React, { Component } from 'react';
import Router from 'next/router'
import Head from 'next/head'
import MyLayout from '~/components/blog/layout/index'
import { ROOM_CREATE } from '~/actions';
import { Row, Col, Input, Button, Icon } from 'antd';

class MyPage extends Component {
    constructor(props) {
        super(props)
        this.state = {
            loading: false,
            name: ""
        }
    }

    componentDidMount() {
        this.fetchRooms();
    }

    fetchRooms = async () => {
        
    }

    handleRoomCreate = async () => {
        if (!this.state.name) return
        localStorage.setItem("name", this.state.name);
        this.setState({ loading: true })
        let room = await ROOM_CREATE()
        let { uuid } = room;
        this.setState({ loading: false })
        if (!uuid) return;
        Router.push(`/blog/room/${uuid}`)
    }

    onChange = ({ target }) => {
        const { name, value } = target;
        this.setState({
            [name]: value
        })
    }

    render() {
        return (
            <MyLayout>
                <Head>
                    <title>Room chat</title>
                </Head>
                <div className='hero'>
                    <h1 className='title'>AdonisJS sockets demo - Room chat!</h1>
                    <div>
                        <Row gutter={[8, 8]}>
                            <Col span={12}>
                                <Input placeholder="Name"
                                    prefix={<Icon type="user" style={{ color: 'rgba(0,0,0,.25)' }} />}
                                    allowClear
                                    name="name"
                                    value={this.state.name}
                                    onChange={this.onChange} />
                            </Col>
                            <Col span={12}>
                                <Button onClick={this.handleRoomCreate} loading={this.state.loading}>
                                    Create a new room
                                </Button>
                            </Col>
                        </Row>
                    </div>
                    <div>
                    </div>
                </div>
            </MyLayout>
        )
    }
}


export default MyPage