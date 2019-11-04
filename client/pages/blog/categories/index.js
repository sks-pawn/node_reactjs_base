import React, { Component } from 'react'
import { PageHeader } from 'antd';
import MyLayout from '~/components/blog/layout/index'
import Categorie from '~/components/blog/shared/Categorie'
import Api from '~/ultils/apiCaller'

class MyPage extends Component {
  async componentDidMount() {
    var a = await Api.get();
    console.log(a)
  }
  render() {
    return (
      <MyLayout>
        <div className='hero'>
          <div>
            <PageHeader title="Categories" />
          </div>
          <Categorie />
        </div>
      </MyLayout>
    )
  }
}

export default MyPage
