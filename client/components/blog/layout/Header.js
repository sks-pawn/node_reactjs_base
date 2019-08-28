
import Head from 'next/head'
import { Layout } from 'antd';
const { Header } = Layout;
import Nav from './Nav'

const MyComponent = () => (
    <div>
        <Head>
            <title>Blog</title>
        </Head>
        <Header style={{ background: '#fff', padding: 0 }}>
            <Nav />
        </Header>
    </div>
)

export default MyComponent
