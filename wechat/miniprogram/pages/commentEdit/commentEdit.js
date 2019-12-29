// miniprogram/pages/commentEdit/commentEdit.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    fromWhere:null,
    vote_id:null,
    activity_id:null,
    comment:""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      activity_id: options.activity_id,
      fromWhere: options.fromWhere,
      vote_id: options.vote_id
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },
  bindCommentValueChange: function (e) {
    this.setData({
      comment: e.detail.value
    })
  },
  submit: function () {
    console.log(this.data);
    var that = this;

    try {

      var user_id = wx.getStorageSync("user_id");
      this.data.user_id = user_id;

      wx.request({
        url: app.globalBaseUrl + that.getSubmitUrl(),
        data: that.data,
        success(result) {
          if (result.data.code == 200) {
            wx.navigateBack({
              delta: 1
            })
          } else {
            wx.showModal({
              title: '提示',
              content: '操作失败请重试',
            })
          }
        }
      })
    }catch(e){
      wx.showModal({
        title: '提示',
        content: '操作失败请重试',
      })
    }
    
  },
  getSubmitUrl:function(){
    console.log(this.data);
    switch (this.data.fromWhere) {
      case "activity":
        return '/comment_activity/add';
      break;
      case "vote":
        return '/comment_vote/add';
      break;
      default:
        return '/comment_activity/add';
      break;
    }
  }
})