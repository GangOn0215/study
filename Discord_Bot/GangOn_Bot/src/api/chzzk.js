// https://api.chzzk.naver.com/service/v1/channels/${channelID}                 >> 채널 정보
// https://api.chzzk.naver.com/polling/v1/channels/${channelID}/live-status     >> 라이브 상태
// https://api.chzzk.naver.com/service/v1/channels/${chhanelID}/live-detail     >> 라이브 디테일
// https://api.chzzk.naver.com/service/v1/channels/${chhanelID}/videos          >> 채널 비디오
// https://api.chzzk.naver.com/service/v1/videos/{video_no}                     >> 비디오 상세정보

import axios from 'axios';
import { config } from 'dotenv';

config();

class ChzzkApi {
  constructor(channelID) {
    this.channelID = channelID || null;
    this.channelName = null;
    this.channelImageUrl = null;
    this.verifiedMark = false;
    this.channelType = null;
    this.channelDescription = '';
    this.followerCount = null;
    this.openLive = false;
    this.baseURL = 'https://api.chzzk.naver.com/service/v1';
  }

  setchannelID(channelID) {
    this.channelID = channelID;
  }

  getchannelID() {
    return this.channelID;
  }

  getApiChannelInfo() {
    return new Promise((reslove, reject) => {
      axios({
        method: "get",
        url: `${this.baseURL}/channels/${this.channelID}`,
      })
        .then((res) => {

          // 통신이 성공적
          if(res.data.code !== 200) {
            reject(res.data.message);

            return;
          }
          
          this.setChannelInfo(res.data.content);
          reslove({status: true});
        })
        .catch((error) => {
          reject(error);
        });
    })
  }

  setChannelInfo(row) {
    this.channelName = row.channelName;
    this.channelImageUrl = row.channelImageUrl;
    this.verifiedMark = row.verifiedMark;
    this.channelType = row.channelType;
    this.channelDescription = row.channelDescription || '';
    this.followerCount = row.followerCount;
    this.openLive = row.openLive;
  }
}

export { ChzzkApi } 