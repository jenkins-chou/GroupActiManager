// miniprogram/pages/m y.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    title: '',
    start_time: '2019-09-01',
    end_time: '2019-09-01',
    detail: '',
    vote_item:[],
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
  bindStartTimeChange: function (e) {
    //console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      start_time: e.detail.value
    })
  }
  ,
  bindEndTimeChange: function (e) {
    //console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      end_time: e.detail.value
    })
  },
  bindTitleChange: function (e) {
    console.log("bindTitleChange:" +e.detail.value);
    this.setData({
      title: e.detail.value
    })
  },
  bindDetailChange: function (e) {
    console.log("bindDetailChange:" + e.detail.value);
    this.setData({
      detail: e.detail.value
    })
  },
  submit: function () {
    console.log("submit");
    try {
      var user_id = wx.getStorageSync("user_id");
      this.data.creator = user_id;
      console.log(this.data);
      var data = this.data;
      wx.request({
        url: app.globalBaseUrl + '/vote/add',
        data: data,
        success(result) {
          console.log(result);
        }
      })
    } catch (e) {
      console.log(e);
    }
  },onAddItem:function(item){
    let vote_items = this.data.vote_item;
    vote_items.push(item);
    this.setData({
      vote_item: vote_items
    })
  },deleteItem:function(event){
    let vote_items = this.data.vote_item;
    vote_items.splice(event.target.dataset.index,1);
    this.setData({
      vote_item: vote_items
    })
    console.log(event);
  }
})