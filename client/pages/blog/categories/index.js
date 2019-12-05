import React, { Component } from 'react'
import { PageHeader } from 'antd';
import MyLayout from '~/components/blog/layout/index'
import Categorie from '~/components/blog/shared/Categorie'
import Api from '~/ultils/apiCaller'

class MyPage extends Component {
  async componentDidMount() {
    // try {
    //   let result = await Api.post("/ttt", {
    //     "email": "anhthanh1996vp@gmail.com",
    //     "password": "ass"
    //   }, false);
    //   if (result && result.data) {
    //     console.log(result.data)
    //   }
    // } catch (error) {
    //   if (error && error.data) {
    //     console.log(error.data)
    //   }
    // }
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
