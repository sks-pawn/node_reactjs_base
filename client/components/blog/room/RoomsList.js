import React from 'react';
import { Table, Tag } from 'antd';
import Link from 'next/link'

const MyComponent = ({ rooms }) => {
    const columns = [
        {
            title: 'Uuid',
            dataIndex: 'uuid',
            key: 'uuid',
            render: uuid => <a>{uuid}</a>,
        },
        {
            title: 'Action',
            key: 'action',
            dataIndex: 'uuid',
            render: uuid => <Link href={uuid} />

            //     <span>
            //         {tags.map(tag => {
            //             let color = tag.length > 5 ? 'geekblue' : 'green';
            //             if (tag === 'loser') {
            //                 color = 'volcano';
            //             }
            //             return (
            //                 <Tag color={color} key={tag}>
            //                     {tag.toUpperCase()}
            //                 </Tag>
            //             );
            //         })}
            //     </span>
            // ),
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
