import React from 'react'
import Link from 'next/link'
import Head from 'next/head'
import cards from '~/resources/js/cards'
import '~/static/css/blog/layout.css'

const cardRow = cards.map(e => {
  return <Link key={e.key} href={e.href}>
    <a className='card'>
      <h3>{e.title}</h3>
      <p>{e.description}</p>
    </a>
  </Link>
})

const MyPage = () => (
  <div>
    <Head>
      <title>MyPage</title>
    </Head>
    <div className='hero'>
      <h1 className='title'>Welcome to Next.js!</h1>
      <p className='description'>
        To get started, edit <code>pages/index.js</code> and save to reload.
      </p>
      <div className='row'>
        {cardRow}
      </div>
    </div>
  </div>
)

export default MyPage
