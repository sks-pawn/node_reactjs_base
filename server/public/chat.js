let ws = null

$(function () {
    // Only connect when username is available
    if (window.username) {
        startChat()
    }
})

function startChat() {
    // client makes a WebSocket connection
    ws = adonis.Ws().connect()

    ws.on('open', () => {
        $('.connection-status').addClass('connected')
        subscribeToChannel()
    })

    ws.on('error', () => {
        $('.connection-status').removeClass('connected')
    })
}

// they are required to subscribe to a topic in order to exchange messages.
function subscribeToChannel() {
    const chat = ws.subscribe('chat:alb')
    chat.on('error', () => {
        $('.connection-status').removeClass('connected')
    })

    chat.on('message', message => {
        console.log('message :', message);
        $('.messages').append(`
        <div class="message"><h3> ${message.username} </h3> <p> ${message.body} </p> </div>
      `)
    })
}

$('#message').keyup(function (e) {
    if (e.which === 13) {
        e.preventDefault()

        const message = $(this).val()
        $(this).val('')

        ws.getSubscription('chat:alb').emit('message', {
            username: window.username,
            body: message
        })
        return
    }
})

