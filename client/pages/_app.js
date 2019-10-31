import React from "react";
import App, { Container } from "next/app";
import { createStore, applyMiddleware } from "redux";
import { composeWithDevTools } from "redux-devtools-extension";
import appReducers from "~/reducers";
import { Provider } from "react-redux";
import thunk from "redux-thunk";
import NextNprogress from 'nextjs-progressbar';

class MyApp extends App {
  static async getInitialProps({ Component, ctx }) {
    let pageProps = {};

    if (Component.getInitialProps) {
      pageProps = await Component.getInitialProps(ctx);
    }

    return { pageProps };
  }

  render() {
    const { Component, pageProps } = this.props;
    const store = createStore(
      appReducers,
      composeWithDevTools(applyMiddleware(thunk))
    );
    return (
      <Container>
        <NextNprogress
          color="#86ba4b"
          startPosition={10}
          stopDelayMs={200}
          height={3}
        />
        <Provider store={store}>
          <Component {...pageProps} />
        </Provider>
      </Container>
    );
  }
}

export default MyApp;