import { useRouter } from 'next/router'
import Link from 'next/link'
import Router from 'next/router'

const handler = () => {
  Router.push({
    pathname: '/post',
    query: { name: 'Zeit' },
  })
}


const Post = () => {
  const router = useRouter()
  const { pid } = router.query

  return <div>
    <p>Post: {pid}</p>
    <Link href="/post/[pid]" as="/post/abc">
      <a>First Post</a>
    </Link>
    <div>
      Click <span onClick={handler}>here</span> to read more
    </div>
    <Link href="/" prefetch={false}>
      <a>About</a>
    </Link>
  </div>
}

export default Post