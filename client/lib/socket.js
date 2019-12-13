import Ws from 'adonis-websocket-client'
import { URL_WS } from '~/constants/Config'

export class SocketConnection {
    connect() {
        this.ws = Ws(URL_WS)
            // .withApiToken(token)
            .connect();

        this.ws.on('open', () => {
            console.log('Connection initialized')
        });

        this.ws.on('close', () => {
            console.log('Connection closed')
        });

        this.ws.on('error', () => {
            console.log('Connection error')
        })

        return this
    }

    subscribe(channel, handler) {
        if (!this.ws) {
            setTimeout(() => this.subscribe(channel), 1000)
        } else {
            const result = this.ws.subscribe(channel);

            result.on('message', message => {
                console.log('Incoming', message);
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