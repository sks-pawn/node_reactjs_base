import React, { useState } from 'react';
import Head from 'next/head'
import MyLayout from '~/components/blog/layout/index'
import Button from '~/components/blog/chat/form/Button';
import { ROOM_CREATE } from '~/actions';
import Router from 'next/router'

const MyPage = () => {
    const [loading, setLoading] = useState(false);

    const handleRoomCreate = async () => {
        setLoading(true);
        let room = await ROOM_CREATE();
        let { uuid } = room;
        setLoading(false);
        Router.push(`/blog/room/${uuid}`);
    };

    return (
        <MyLayout>
            <Head>
                <title>Room chat</title>
            </Head>
            <div className='hero'>
                <h1 className='title'>Room chat!</h1>
                <div className="flex h-screen flex-col justify-center">
                    <div className="container mx-auto p-3">
                        <h1>AdonisJS sockets demo</h1>
                        <p className="mt-3 mb-5 text-muted">
                            Create a chatroom, open it in various tabs, send messages and watch the sockets flow. (Check the console!)
                         </p>
                        <Button onClick={handleRoomCreate} disabled={loading}>
                            Create a new room
                        </Button>
                    </div>
                </div>
            </div>
        </MyLayout>
    )
}
export default MyPage




