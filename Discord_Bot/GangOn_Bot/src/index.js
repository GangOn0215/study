import { config } from 'dotenv'
import { Client, EmbedBuilder, GatewayIntentBits, REST, Routes } from 'discord.js';
import { ChzzkApi } from './api/chzzk.js';

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
    name: "get_channel_info",
    description: '스트리머의 채널',
    options: [
      {
        name: 'channel_id',
        description: '채널 정보',
        type: 3,
        required: true,
      }
    ]
  }
]

const commandsList = {
  ping: 'pong',
  channelInfo: '1234'
}

// 2. sent Application Command 를 감지 후 이벤트 발생
client.on('interactionCreate', async (interaction) => {
  if(!interaction.isChatInputCommand()) return;

  if(interaction.commandName === 'get_channel_info') {
    const tempChannelID = interaction.options.get('channel_id').value;

    if(tempChannelID.length !== 32) {
      interaction.reply('채널 아이디 길이가 다릅니다.');

      return;
    }

    const channelRow = new ChzzkApi(tempChannelID);

    channelRow.getApiChannelInfo()
      .then((result) => {

        console.log(channelRow);
        
        // 성공적
        if(result.status) {
          const embed = new EmbedBuilder()
          .setTitle('치지직 비공식 API')
          .setDescription(`해당 방송은 ${channelRow.channelName}님의 방송 입니다. \n\n`)
          .setColor('Random')
          .addFields(
            {
              name: '채널 이름',
              value: channelRow.channelName,
              inline: true
            },
            {
              name: '채널 팔로우 수',
              value: channelRow.followerCount.toString(),
              inline: true
            },
            {
              name: '채널 설명',
              value: channelRow.channelDescription ? channelRow.channelDescription : 'Empty'
            }
          )
          .setImage(channelRow.channelImageUrl)
            

          interaction.reply({embeds: [embed]});
        }
      })
      .catch((error) => {
        console.log(error);
      })


  }

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