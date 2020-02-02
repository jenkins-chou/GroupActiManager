// miniprogram/pages/contactAdd/contactAdd.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    value:''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

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
  bindValueChange: function (e) {
    this.setData({
      value: e.detail.value
    })
  },

  onSubmit:function(){


    var user_id = wx.getStorageSync("user_id");
    var that = this;
    if (!that.data.value) {
      wx.showModal({
        title: '提示',
        content: '未输入手机号',
      })
      return;
    }
    wx.request({
      url: app.globalBaseUrl + '/contact/addContact',
      data: { user_id: user_id, key: that.data.value },
      success(result) {
        if (result.data.code == 200) {
          wx.showToast({
            title: '添加成功',
          })
        } else {
          wx.showModal({
            title: '提示',
            content: result.data.message,
          })
        }
      }
    })
  }
})