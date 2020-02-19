import React from 'react';
import { Table, Tag } from 'antd';
import Link from 'next/link'

const MyComponent = ({ rooms }) => {
    const columns = [
        {
            title: 'Uuid',
            dataIndex: 'uuid',
            key: 'uuid',
            render: uuid => <p>{uuid}</p>,
        },
        {
            title: 'Action',
            key: 'action',
            dataIndex: 'uuid',
            render: uuid => <Link href={'/blog/room/' + uuid}>
                <Tag color='green' >
                    <a>View</a>
                </Tag>
            </Link>
        }
    ];

    if (rooms.length > 0) {
        return (
            <div>
                <Table columns={columns} dataSource={rooms} />
            </div>

        )
    }
    return null
};

export default MyComponent;
