import { config } from 'dotenv';
import { Client, GatewayIntentBits } from 'discord.js';

config(); // env 초기화

const client = new Client({ 
  intents: [
    GatewayIntentBits.DirectMessages,
    GatewayIntentBits.Guilds, 
    GatewayIntentBits.GuildMessages,
    GatewayIntentBits.MessageContent
  ] 
});

// BOT_TOKEN을 env로 받아옴 (github같은 public에 공개하면 봇 털림)
const { BOT_TOKEN } = process.env;

// Bot이 시작 되었을때 실행 할 이벤트
client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}!`);
});

// 메세지가 올라오면 실행 할 이벤트
client.on('messageCreate', (message) => {
  console.log(message.content);
});

client.login(BOT_TOKEN);