import React, { Component } from 'react'
import Link from 'next/link'
import { Menu, Icon, Avatar } from 'antd';
import navJson from '../../../static/data/json/nav.json'
import Router from 'next/router'

const navigation = navJson.map(element => {
  if (element.image) {
    return <Menu.Item key={element.key}>
      <Link href={element.href}>
        <a>
          <Avatar src={element.image} size="large" />
          <span><b>{element.title}</b></span>
        </a>
      </Link>
    </Menu.Item>
  }
  return <Menu.Item key={element.key}>
    <Link href={element.href}>
      <a><Icon type={element.icon} /></a>
    </Link>
  </Menu.Item>
})

class Nav extends Component {
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


export default Nav
