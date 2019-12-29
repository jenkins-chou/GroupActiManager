var app = getApp()
Page({
  data: {
    activity_id:null,
    activityDetail:null,
    votesForActivity:null,
    progressForActivity: null,
    billForActivity: null,
    commentList:null
  },

  onLoad: function (options) {
    this.setData({activity_id:options.id})
    
  },
  onShow:function(){
    this.getDetail();
    this.getOtherDetail();
    this.getComment();
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
  }
});