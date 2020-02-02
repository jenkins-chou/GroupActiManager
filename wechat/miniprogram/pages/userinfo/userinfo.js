// miniprogram/pages/userinfo/use ri n fo.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userinfo:null,
    isEdit:false,
    phone:''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    console.log(options);
    wx.request({
      url: app.globalBaseUrl + '/base_user/get',
      data: { id: options.user_id },
      success(result) {
        if (result.data.code == 200) {
          that.setData({
            userinfo: result.data.data
          })
        }
      }
    })

    this.setData({
      isEdit:options.isEdit
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

  bindPhoneChange: function(e){
    this.setData({
      phone: e.detail.value
    })
  },

  onUpdateUser: function(){

    var user_id = wx.getStorageSync("user_id");
    var that = this;
    if (!that.data.phone){
      wx.showModal({
        title: '提示',
        content: '未输入手机号或未更改',
      })
      return;
    }
    wx.request({
      url: app.globalBaseUrl + '/base_user/update',
      data: { id: user_id, phone: that.data.phone},
      success(result) {
        if (result.data.code == 200) {
          wx.showToast({
            title: '更新成功',
          })
        }else{
          wx.showToast({
            title: '更新失败，请重试',
          })
        }
      }
    })
  }
})