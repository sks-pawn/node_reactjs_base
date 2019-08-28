import { Layout } from 'antd';
import MyHeader from './Header'
import MyFooter from './Footer'
const { Content } = Layout;
import '../../../static/css/blog/layout.css'

const MyLayout = (props) => (
    <Layout className="layout">
        <MyHeader />
        <Content className="content">
            {props.children}
        </Content>
        <MyFooter />
    </Layout>
)

export default MyLayout
