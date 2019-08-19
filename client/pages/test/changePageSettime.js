import React, { Component } from 'react'
import { withRouter } from 'next/router'

class MyLink extends Component {
    componentDidMount() {
        const { router } = this.props
        router.prefetch('/dynamic')
    }

    render() {
        const { router } = this.props

        return (
            <a onClick={() => setTimeout(() => router.push('/dynamic'), 100)}>
                A route transition will happen after 100ms
      </a>
        )
    }
}

export default withRouter(MyLink)