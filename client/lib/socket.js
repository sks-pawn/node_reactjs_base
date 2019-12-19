import { URL_WS } from '~/constants/Config'

export class SocketConnection {
    connect() {
        const Ws = require('@adonisjs/websocket-client');
        this.ws = Ws(URL_WS)
            // .withApiToken(token)
            .connect();

        this.ws.on('open', () => {
            console.log('Connection initialized')
        });

        this.ws.on('close', () => {
            console.log('Connection closed')
        });

        this.ws.on('error', (error) => {
            console.error(error)
        })

        return this
    }

    subscribe(channel, handler) {
        if (!this.ws) {
            setTimeout(() => this.subscribe(channel, handler), 1000)
        } else {
            const result = this.ws.subscribe(channel);

            result.on('message', message => {
                handler(message)
            });

            result.on('error', (error) => {
                console.error(error)
            });

            return result
        }
    }
}

export default new SocketConnection()