import React from 'react'
import Head from 'next/head'
import Nav from '../../components/blog/layout/Nav'
const Search = () => (
  <div>
    <Head>
      <title>Search</title>
    </Head>
    <Nav />

    <div className='hero'>
      <h1 className='title'>Search!</h1>
    </div>
  </div>
)

export default Search
