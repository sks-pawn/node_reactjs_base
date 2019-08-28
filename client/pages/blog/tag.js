import React from 'react'
import Head from 'next/head'
import MyLayout from '../../components/blog/layout/index'
const MyPage = () => (
  <MyLayout>
    <Head>
      <title>Tag</title>
    </Head>
    <div className='hero'>
      <h1 className='title'>Tag!</h1>
    </div>
  </MyLayout>
)

export default MyPage
