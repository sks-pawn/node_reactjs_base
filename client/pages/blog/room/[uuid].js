// import { useRouter } from 'next/router'
// import Link from 'next/link'

// const Post = () => {
//     const router = useRouter()
//     const { uuid } = router.query
//     return <div>
//         <p>Post: {uuid}</p>
//         <Link href="/blog/room/[uuid]" as="/blog/room/abc">
//             <a>First Post</a>
//         </Link>
//         <div>
//             Click <span>here</span> to read more
//     </div>
//         <Link href="/" prefetch={false}>
//             <a>About</a>
//         </Link>
//     </div>
// }

// export default Post

import React, { Component } from 'react';
// import SocketConnection from '~/lib/socket'
import Ws from 'adonis-websocket-client'
import { URL_WS } from '~/constants/Config'



// import { ROOM_FETCH } from '~/actions';


import Messages from '~/components/blog/chat/Messages';
import AddMessage from '~/components/blog/chat/AddMessage';

// a global variable so we can disconnect once we unmount
let subscription;

class MyPage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            messages: []
        };
    }

    componentDidMount() {
        let a = Ws(URL_WS, {
        }).channel('room:*').connect()
        console.log('a :', a);
        // SocketConnection.connect();

        // storing the subscription in the global variable
        // passing the incoming data handler fn as a second argument
        // subscription = SocketConnection.subscribe(`room:${this.props.id}`, this.handleMessageAdd);

        // loading existing messages
        // this.fetchMessages();
    }

    componentWillUnmount() {
        // subscription.close();
    }

    handleMessageAdd = message => {
        const { type, data } = message;

        // you could handle various types here, like deleting or editing a message
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
            const room = await ROOM_FETCH(this.props.id);
            this.setState({ messages: room.messages });
        } catch (_) {
            this.props.history.push('/');
        }
    };

    render() {
        const { messages } = this.state;
        const { id } = this.props;

        return (
            <div className="mx-auto p-3 flex flex-col h-screen justify-between" style={{ maxWidth: '800px' }}>
                <Messages data={messages} />
                <AddMessage roomId={id} />
            </div>
        )
    }
}

export default MyPage;
