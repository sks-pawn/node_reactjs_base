const { PHASE_DEVELOPMENT_SERVER } = require('next/constants')
const withCss = require('@zeit/next-css')

if (typeof require !== 'undefined') {
    require.extensions['.css'] = file => { }
}

module.exports = (phase, { defaultConfig }) => {
    if (phase === PHASE_DEVELOPMENT_SERVER) {
        return {
            /* development only config options here */
        }
    }

    return {
        /* config options for all phases except development here */
    }
}

module.exports = withCss()