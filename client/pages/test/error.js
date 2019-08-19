import React from 'react'
import Error from '../_error'
import axios from 'axios'

class Page extends React.Component {
    static async getInitialProps() {
        const res = await axios('https://api.github.com/repos/zeit/next.js')
        console.log(res.status)
        const errorCode = res.status === 200 ? res.status : false
        const { data } = res
        return { errorCode, stars: data.stargazers_count }
    }

    render() {
        if (this.props.errorCode) {
            return <Error statusCode={this.props.errorCode} />
        }

        return <div>Next stars: {this.props.stars}</div>
    }
}

export default Page