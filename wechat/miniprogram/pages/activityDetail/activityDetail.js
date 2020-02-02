var app = getApp()
import QQMapWX from '../../qqmap-wx-jssdk1.2/qqmap-wx-jssdk.js';

// 实例化API核心类
let qqMap = new QQMapWX({
  key: 'B5BBZ-Y7TKD-6PN4L-HMIU2-UOJYQ-S4BCF' // 必填
});

Page({
  data: {
    activity_id:null,
    activityDetail:null,
    votesForActivity:null,
    progressForActivity: null,
    billForActivity: null,
    commentList:null,
    memberList:null,
    canEdit: false // 是否可编辑
  },

  onLoad: function (options) {
    this.setData({ activity_id: options.id, canEdit: options.canEdit})
  },

  onShow:function(){
    this.setMemberWatch();
    this.getDetail();
    this.getOtherDetail();
    this.getComment();
    this.getActivityMember();
  },

  setMemberWatch:function(){
    var user_id = wx.getStorageSync("user_id");
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/activity_member/setMemberWatch',
      data: { user_id: user_id,activity_id: this.data.activity_id },
      success(result) {
        console.log(result.data);
        if (result.data.code == 200) {
        }
      }
    })
  },

  getDetail: function (){
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/activity/get',
      data: { id: this.data.activity_id },
      success(result) {
        console.log(result.data);
        if (result.data.code == 200) {
          that.setData({
            activityDetail: result.data.data
          })
        }
      }
    })
  },

  getOtherDetail: function (options){
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/activity/getOtherDetail',
      data: { activity_id: this.data.activity_id },
      success(result) {
        console.log(result.data);
        if (result.data.code == 200) {
          that.setData({
            votesForActivity: result.data.votes,
            progressForActivity: result.data.progress,
            billForActivity: result.data.bill
          })
        }
      }
    })
  },

  getComment: function () {
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/comment_activity/getAllByActivity',
      data: { activity_id: this.data.activity_id },
      success(result) {
        console.log(result.data);
        if (result.data.code == 200) {
          that.setData({
            commentList: result.data.data
          })
        }
      }
    })
  },

  getActivityMember: function () {
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/activity_member/getActivityMember',
      data: { activity_id: this.data.activity_id },
      success(result) {
        console.log(result.data);
        if (result.data.code == 200) {
          that.setData({
            memberList: result.data.data
          })
        }
      }
    })
  },

  gotoMap: function (e) {
    console.log(e);
    qqMap.geocoder({
      address: e.currentTarget.dataset.address,
      complete: res => {
        console.log(res);   //经纬度对象
        if(res.status == 0){
          wx.openLocation({
            latitude: res.result.location.lat,
            longitude: res.result.location.lng,
            scale: 18,
            name: '活动地址',
            address: res.result.title
          })
        }else{
          wx.showModal({
            title: '提示',
            content: res.message,
          })
        }
      }
      });
  },  

});