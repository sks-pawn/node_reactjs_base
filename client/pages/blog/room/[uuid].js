

//         <Link href="/" prefetch={false}>
//             <a>About</a>
//         </Link>

import React, { Component } from 'react';
import { withRouter } from 'next/router'
import SocketConnection from '~/lib/socket'
// import { ROOM_FETCH } from '~/actions';
import Messages from '~/components/blog/chat/Messages';
import AddMessage from '~/components/blog/chat/AddMessage';

// a global variable so we can disconnect once we unmount

class MyPage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            uuid: props.router.query.uuid,
            messages: []
        };
    }

    componentDidMount() {
        SocketConnection.connect();

        // storing the subscription in the global variable
        // passing the incoming data handler fn as a second argument

        this.subscription = SocketConnection.subscribe(`room:${this.state.uuid}`);

        // loading existing messages
        // this.fetchMessages();
    }

    // componentWillUnmount() {
    // subscription.close();
    // }

    handleMessageAdd = message => {
        const { type, data } = message;
        console.log('message', this.state);
        // you could handle various types here, like deleting or editing a message
        // switch (type) {
        //     case 'room:newMessage':
        //         this.setState(prevState => ({
        //             messages: [...prevState.messages, data]
        //         }));
        //         break;
        //     default:
        // }
    };

    fetchMessages = async () => {
        try {
            const room = await ROOM_FETCH(this.state.uuid);
            this.setState({ messages: room.messages });
        } catch (_) {
            this.props.history.push('/');
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
