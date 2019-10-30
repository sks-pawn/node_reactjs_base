import React, { Component } from 'react'
import { Comment, Avatar } from 'antd';
import Link from 'next/link'
import '~/static/css/blog/categorie.css'

class MyComponent extends Component {
  render() {
    return (
      <Comment
        author={
          <Link href="dsadsa">
            <a className="categorie-title">Han Solo</a>
          </Link>}
        avatar={
          <Avatar
            className="categorie-avatar"
            src="https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/160/h/160"
            size={56}
            alt="Han Solo"
          />
        }
        content={
          <p>
            We supply a series of design principles, practical patterns and high quality design
            resources
            </p>
        }
      />
    );
  }
}

export default MyComponent
