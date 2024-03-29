// miniprogram/pages/billForActivityEdit/billForActivityEdit.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    progress:null,
    complete_time:null,
    activity_id: null
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
  bindProgressChange:function(e){
    this.setData({
      progress:e.detail.value
    })
  },
  bindCompleteTimeChange: function (e) {
    this.setData({
      complete_time: e.detail.value
    })
  },
  submit:function(){
    console.log(this.data.progress);
    console.log(this.data.complete_time);
    console.log(this.data.activity_id);
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/activity/addProgressForActivity',
      data: that.data,
      success(result) {
        if (result.data.code == 200) {
          wx.navigateBack({
            delta:1
          })
        } else {
          wx.showModal({
            title: '提示',
            content: '操作失败请重试',
          })
        }
      }
    })
  }
})