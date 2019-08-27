import React from 'react'
import Head from 'next/head'
import Nav from '../../components/blog/layout/Nav'
const Categories = () => (
  <div>
    <Head>
      <title>Categories</title>
    </Head>
    <Nav />

    <div className='hero'>
      <h1 className='title'>Categories!</h1>
    </div>
  </div>
)

export default Categories
