// https://api.chzzk.naver.com/service/v1/channels/${channelID}                 >> 채널 정보
// https://api.chzzk.naver.com/polling/v1/channels/${channelID}/live-status     >> 라이브 상태
// https://api.chzzk.naver.com/service/v1/channels/${chhanelID}/live-detail     >> 라이브 디테일
// https://api.chzzk.naver.com/service/v1/channels/${chhanelID}/videos          >> 채널 비디오
// https://api.chzzk.naver.com/service/v1/videos/{video_no}                     >> 비디오 상세정보

import axios from 'axios';
import { config } from 'dotenv';

config();

const userID = process.env.USER_ID;
const baseURL = 'https://api.chzzk.naver.com/service/v1';

console.log(process.env);
console.log(`${baseURL}/channels/${userID}`);

axios({
    method: "get",
    url: `${baseURL}/channels/${userID}`,
})
.then((res) => {
    console.log(res.data);
})
.catch((error) => {
    console.log(error.response.data);
})
