
const { PHASE_DEVELOPMENT_SERVER } = require('next/constants')
const { parsed: localEnv } = require('dotenv').config()
const webpack = require('webpack')
const withCss = require('@zeit/next-css')
const compose = require('next-compose-plugins')

const cssConfig = {/** css config here */ }

// fix: prevents error when .css files are required by node
if (typeof require !== 'undefined') {
    require.extensions['.css'] = file => { }
}

const nextConfig = {
    webpack: (config, { isServer }) => {
        config.plugins.push(
            new webpack.EnvironmentPlugin(localEnv)
        )
        if (isServer) {
            const antStyles = /antd\/.*?\/style\/css.*?/;
            const origExternals = [...config.externals];
            config.externals = [ // eslint-disable-line
                (context, request, callback) => { // eslint-disable-line
                    if (request.match(antStyles)) return callback();
                    if (typeof origExternals[0] === 'function') {
                        origExternals[0](context, request, callback);
                    } else {
                        callback();
                    }
                },
                ...(typeof origExternals[0] === 'function' ? [] : origExternals),
            ];

            config.module.rules.unshift({
                test: antStyles,
                use: 'null-loader',
            });
        }
        return config
    },
    env: {
        'APP_KEY': 'C0J3ySOOUcWG19NdhHEtUMfBcMMNpYHN',
        'SERVER_DEV_PROTOCOL': 'http',
        'SERVER_DEV_PROTOCOL_WS': 'ws',
        'SERVER_DEV_HOST': 'localhost',
        'SERVER_DEV_PORT': '3333',
        'SERVER_PRODUCT_PROTOCOL': 'https',
        'SERVER_PRODUCT_PROTOCOL_WS': 'wss',
        'SERVER_PRODUCT_HOST': '381829',
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
