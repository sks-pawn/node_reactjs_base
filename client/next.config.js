
const { PHASE_DEVELOPMENT_SERVER } = require('next/constants')
const { parsed: localEnv } = require('dotenv').config()
const webpack = require('webpack')
const withCss = require('@zeit/next-css')
const compose = require('next-compose-plugins')

const cssConfig = {/** css config here */ }

if (typeof require !== 'undefined') {
    require.extensions['.css'] = file => { }
}

const nextConfig = {
    webpack: (config) => {
        config.plugins.push(
            new webpack.EnvironmentPlugin(localEnv)
        )
        return config
    },
    env: {
        'KEY_APP': 'sweet',
        'SERVER_DEV_PROTOCOL': 'http',
        'SERVER_DEV_HOST': 'localhost',
        'SERVER_DEV_PORT': '8080',
        'SERVER_PRODUCT_PROTOCOL': 'http',
        'SERVER_PRODUCT_HOST': 'localhost',
        'SERVER_PRODUCT_PORT': '8080'
    }
};


module.exports = compose([
    [withCss, cssConfig],
    [
        (phase, { defaultConfig }) => {
            return {}
        },
        [PHASE_DEVELOPMENT_SERVER]
    ]
], nextConfig)
