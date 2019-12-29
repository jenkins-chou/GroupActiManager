// miniprogram/pages/votesForActivity/votesForActivity.js
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list:null,
    activity_id:null,
    selected: null,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      activity_id: options.activity_id
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
    this.getOtherDetail();
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
  getOtherDetail: function () {
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/activity/getOtherDetail',
      data: { activity_id: that.data.activity_id },
      success(result) {
        console.log(result.data);
        if (result.data.code == 200) {
          that.setData({
            list: result.data.votes,
          })
        }
      }
    })
  },
  checkboxChange: function (e) {
    this.setData({
      selected: e.detail.value
    })
    //console.log('checkbox发生change事件，携带value值为：', e.detail.value)
  },
  deleteFunc: function () {
    console.log(this.data.selected)
    console.log(this.data.activity_id)
    if (this.data.selected == null) {
      wx.showModal({
        title: '提示',
        content: '请至少选择一个',
      })
      return;
    }
    if (this.data.activity_id == null) {
      wx.showModal({
        title: '提示',
        content: '获取不到活动信息，请重新进入此页面',
      })
      return;
    }
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/activity/deleteVotesForActivity',
      data: {
        activity_id: that.data.activity_id,
        vote_ids: this.data.selected
      },
      success(result) {
        //console.log(result.data.data);
        if (result.data.code == 200) {
          that.setData({ list:null});
          that.getOtherDetail();
        }else{
          wx.showModal({
            title: '提示',
            content: '操作失败请重试',
          })
        }
      }
    })
  }
})