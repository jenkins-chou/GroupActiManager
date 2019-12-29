// miniprogram/pages/voteItemEdit/vote.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    value:null
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

  bindValueChange:function(e){
    this.setData({
      value:e.detail.value
    })
  },
  onAdd:function(){
    if (this.data.value == null){
      wx.showModal({
        title: '提示',
        content: '请输入内容',
      })
      return;
    }
    console.log(this.data.value);

    let pages = getCurrentPages();               //当前页面
    let prevPage = pages[pages.length - 2];     //上一页面
    prevPage.onAddItem(this.data.value);
    wx.navigateBack({
      delta: 1
    })
  }
})