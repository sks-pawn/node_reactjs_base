import React, { Component } from 'react';
import Router, { withRouter } from 'next/router'
import SocketConnection from '~/lib/socket'
import { ROOM_SHOW } from '~/actions';
import Messages from '~/components/blog/chat/Messages';
import AddMessage from '~/components/blog/chat/AddMessage';
class MyPage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            uuid: props.router.query.asPath,
            messages: []
        };
    }

    componentDidMount() {
        console.log(this.props.router);
        // SocketConnection.connect();
        // this.subscription = SocketConnection.subscribe(`room:${this.state.uuid}`, this.handleMessageAdd);
        // this.fetchMessages();
    }

    componentWillUnmount() {
        this.subscription.close();
    }

    handleMessageAdd = message => {
        const { type, data } = message;
        switch (type) {
            case 'room:newMessage':
                this.setState(prevState => ({
                    messages: [...prevState.messages, data]
                }));
                break;
            default:
        }
    };

    fetchMessages = async () => {
        try {
            const room = await ROOM_SHOW(this.state.uuid);
            this.setState({ messages: room.relaMessages });
        } catch (_) {
            Router.push(`/blog/room`);
        }
    };

    render() {
        const { messages, uuid } = this.state;

        return (
            <div className="mx-auto p-3 flex flex-col h-screen justify-between" style={{ maxWidth: '800px' }}>
                <Messages data={messages} />
                <AddMessage roomId={uuid} />
            </div>
        )
    }
}

export default withRouter(MyPage)
