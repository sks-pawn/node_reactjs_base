import React from 'react'
import Head from 'next/head'
import Nav from '../../components/blog/layout/Nav'
const Popular = () => (
  <div>
    <Head>
      <title>Popular</title>
    </Head>
    <Nav />

    <div className='hero'>
      <h1 className='title'>Popular!</h1>
    </div>
  </div>
)

export default Popular
