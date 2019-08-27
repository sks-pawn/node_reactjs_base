import React from 'react'
import Head from 'next/head'
import Nav from '../../components/blog/layout/Nav'
const Recent = () => (
  <div>
    <Head>
      <title>Recent</title>
    </Head>
    <Nav />

    <div className='hero'>
      <h1 className='title'>Recent!</h1>
    </div>
  </div>
)

export default Recent
