import { config } from 'dotenv'
import { Client, GatewayIntentBits, REST, Routes } from 'discord.js';

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
const { BOT_TOKEN, CLIENT_ID, GUILD_ID } = process.env;

// 아직 파악중
const rest = new REST({version: 10}).setToken(BOT_TOKEN);

// Bot이 시작 되었을 때 실행 될 이벤트
client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}!`);
});

/**
 * 메세지가 올라오면 실행 할 이벤트 
 * https://discord.com/developers/docs/topics/rpc#messagecreatemessageupdatemessagedelete
 */
client.on('messageCreate', (message) => {
  console.log(message.content);
});

/**
 * Guild User가 application command 를 보낼 때 발생하는 이벤트
 * https://discord.com/developers/docs/topics/gateway-events#interaction-create
 */
const commands = [
  {
    name: 'ping',
    description: 'will say pong'
  },
  {
    name: 'foo',
    description: 'will say bar'
  },
  {
    name: 'discord',
    description: 'will say hi discord'
  }
]

const commandsList = {
  ping: 'pong',
  foo: 'bar',
  discord: 'hi discord'
}

// 2. sent Application Command 를 감지 후 이벤트 발생
client.on('interactionCreate', async (interaction) => {
  if(!interaction.isChatInputCommand()) return;

  // if 또는 switch로 도배하기에는 너무 코드가 더러워질것 같아서 객체로 따로 빼내주어 관리
  if(commandsList.hasOwnProperty(interaction.commandName)) {
    await interaction.reply(commandsList[interaction.commandName]);
  } 
});

async function main() {
    try {
      console.log('Started refreshing application (/) commands.');

      // 1. Application Guild Commands Setting
      await rest.put(Routes.applicationGuildCommands(CLIENT_ID, GUILD_ID), {
        body: commands,
      });

      client.login(BOT_TOKEN);
    } catch (error) {
        console.log(error);
    }
}

main();