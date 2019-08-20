import Document, { Head, Main, NextScript, Html } from 'next/document'
import Router from 'next/router'

class MyDocument extends Document {
    static async getInitialProps(ctx) {
        // const originalRenderPage = ctx.renderPage

        // ctx.renderPage = () =>
        //     originalRenderPage({
        //         // useful for wrapping the whole react tree
        //         enhanceApp: App => App,
        //         // useful for wrapping in a per-page basis
        //         enhanceComponent: Component => Component,
        //     })

        const initialProps = await Document.getInitialProps(ctx)
        return { ...initialProps }
    }

    render() {
        // <Route sensitive
        //   render={props => <Redirect to={`${props.location.pathname.toLowerCase()}`} />} />
        return (
            <Html>
                <Head />
                <body>
                    <Main />
                    <NextScript />
                </body>
            </Html>
        )
    }
}

export default MyDocument