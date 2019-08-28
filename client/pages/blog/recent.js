import React from 'react'
import Head from 'next/head'
import MyLayout from '../../components/blog/layout/index'
const MyPage = () => (
  <MyLayout>
    <Head>
      <title>Recent</title>
    </Head>
    <div className='hero'>
      <h1 className='title'>Recent!</h1>
    </div>
  </MyLayout>
)

export default MyPage
