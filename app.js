const qrcode = require('qrcode-terminal');

const { Client } = require('whatsapp-web.js');
const client = new Client({
    puppeteer: {
        args: ['--no-sandbox'],
    }
});

client.on('qr', qr => {
    qrcode.generate(qr, { small: true });
});

client.on('ready', () => {
    console.log('Client is ready!');
    // const number = "+917558255268";
    // const text = "test";
    // const chatId = number.substring(1) + "@c.us";
    // client.sendMessage(chatId, text)
});

client.on('message', message => {
    let text = (message.body).split("\n")
    let msg = ""
    let number = ""
    code = text[0]
    text.splice(0, 1);
    if (code === 'send:') {
        for (var i = 0; i < text.length; i++){
            number = String(text[i])
            const chatId = number + "@c.us";
            client.sendMessage(chatId, msg)
            
            let temp = "Message Sent to:" + number
            client.sendMessage(message.from, temp);
        }
    }
    else if (code == 'msg:'){       
        client.sendMessage(message.from, 'ping');
        msg = text.joim(" ")
        let temp = "Your Message is:" + text.joim(" ") 
        console.log(msg)
        client.sendMessage(message.from, temp);
    }
    else if(code == '!msg'){
        client.sendMessage(message.from, msg)
    }

    else if (code === '!ping') {
        client.sendMessage(message.from, 'ping');
    }
}
);

client.initialize();

