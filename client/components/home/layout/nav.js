import React, { Component } from 'react'
import Link from 'next/link'
import { Menu, Icon } from 'antd';
import navJson from '../../../static/json/nav.json'
import Router from 'next/router'

const navigation = navJson.map(element => {
  return (
    <Menu.Item key={element.key}>
      <Link href={element.href}>
        <a><Icon type={element.icon} /></a>
      </Link>
    </Menu.Item>
  )
})

class Nav extends Component {
  constructor(props) {
    super(props);
    this.state = {
      current: '',
    };
  }

  componentDidMount = () => {
    console.log('Router :', Router.pathname);
  }

  setActiveCurrentMenu = e => {
    this.setState({
      current: e.key,
    });
  }

  handleClick = e => {
    setActiveCurrentMenu(e)
  };

  render() {

    return (
      <Menu onClick={this.handleClick} selectedKeys={[this.state.current]} mode="horizontal">
        {navigation}
      </Menu>
    )
  }
}


export default Nav
