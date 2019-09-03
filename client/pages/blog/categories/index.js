import React, { Component } from 'react'
import { PageHeader } from 'antd';
import MyLayout from '../../../components/blog/layout/index'
import Categorie from '../../../components/blog/shared/Categorie'

// import vvv from '../../../services/vvv'
class MyPage extends Component {
  componentDidMount() {
    console.log('process.env.DB_HOST :', process.env);
    // console.log('vvv.find() :', vvv.find());
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
