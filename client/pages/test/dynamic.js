import dynamic from 'next/dynamic'

const DynamicComponent = dynamic(() => import('./changePageSettime'))

function Home() {
  return (
    <div>
      <DynamicComponent />
      <p>HOME PAGE is here!</p>
    </div>
  )
}

export default Home