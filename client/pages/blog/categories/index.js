import React, { Component } from 'react'
import { PageHeader } from 'antd';
import MyLayout from '../../../components/blog/layout/index'
import Categorie from '../../../components/blog/shared/Categorie'
class MyPage extends Component {

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
