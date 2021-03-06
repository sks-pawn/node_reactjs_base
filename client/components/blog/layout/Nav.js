import React, { Component } from 'react'
import Link from 'next/link'
import { Menu, Avatar, Icon, Tooltip } from 'antd';
import navJson from '~/resources/json/nav.json'
import Router from 'next/router'

const navigation = navJson.map(element => {
  if (element.active) {
    let item = element.avatar ? (<a>
      <Avatar src={element.avatar} size="large" />
      <span><b>
        {element.title}
      </b></span>
    </a>) : <a><Icon type={element.icon} /></a>
    return <Menu.Item key={element.key}>
      <Link href={element.href}>
        <Tooltip placement="bottom" title={element.title}>
          {item}
        </Tooltip>
      </Link>
    </Menu.Item>
  }
})

class MyComponent extends Component {
  constructor(props) {
    super(props);
    this.state = {
      current: '',
    };
  }

  componentDidMount = () => {
    let { pathname } = Router
    let currentPage = navJson.filter(e => pathname.toLowerCase().indexOf(e.key) > -1)
    currentPage = currentPage[currentPage.length - 1]
    if (currentPage) this.setActiveCurrentMenu(currentPage)
  }

  setActiveCurrentMenu = e => {
    this.setState({
      current: e.key,
    });
  }

  render() {

    return (
      <Menu onClick={this.setActiveCurrentMenu} selectedKeys={[this.state.current]} mode="horizontal">
        {navigation}
      </Menu>
    )
  }
}


export default MyComponent
