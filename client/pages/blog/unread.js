import React from 'react'
import Head from 'next/head'
import Nav from '../../components/blog/layout/Nav'
const Unread = () => (
  <div>
    <Head>
      <title>Unread</title>
    </Head>
    <Nav />

    <div className='hero'>
      <h1 className='title'>Unread!</h1>
    </div>
  </div>
)

export default Unread
