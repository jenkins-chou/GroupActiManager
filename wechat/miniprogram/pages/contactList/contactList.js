// miniprogram/pages/selectUser/se le c t U se r.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list:null
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
    this.getAllByOwner();
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

  bindKeyChange:function(e){
    if(e.detail.value){
      this.searchAllByOwner(e.detail.valu);
    }else{
      this.getAllByOwner();
    }
  },

  getAllByOwner: function(){
    var that = this;
    try {
      var user_id = wx.getStorageSync("user_id");
      wx.request({
        url: app.globalBaseUrl + '/contact/getAllByOwner',
        data: { owner: user_id },
        success(result) {
          //console.log(result.data.data);
          if (result.data.code == 200) {
            that.setData({
              list: result.data.data
            })
          } else {
            that.setData({
              data: null
            })

          }
        }
      })
    } catch (e) {

    }
  },
  searchAllByOwner: function (key) {
    var that = this;
    try {
      var user_id = wx.getStorageSync("user_id");
      wx.request({
        url: app.globalBaseUrl + '/contact/searchAllByOwner',
        data: { owner: user_id,key:key},
        success(result) {
          //console.log(result.data.data);
          if (result.data.code == 200) {
            that.setData({
              list: result.data.data
            })
          } else {
            that.setData({
              data: null
            })

          }
        }
      })
    } catch (e) {

    }
  }
})