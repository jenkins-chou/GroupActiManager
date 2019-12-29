// miniprogram/pages/m y.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    title:'',
    start_time: '2019-09-01',
    end_time: '2019-09-01',
    address:'',
    programme_main:'',
    programme_spare:''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    //console.log(this.data.date);
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
  bindTitleChange:function(e){
    this.setData({
      title: e.detail.value
    })
  },
  bindAddressChange: function (e) {
    this.setData({
      address: e.detail.value
    })
  },
  bindProgrammeMainChange: function (e) {
    this.setData({
      programme_main: e.detail.value
    })
  },
  bindProgrammeSpareChange: function (e) {
    this.setData({
      programme_spare: e.detail.value
    })
  },
  submit:function(){
    
    try{
      
      var user_id = wx.getStorageSync("user_id");
      this.data.creator = user_id;
      console.log(this.data);
      var data = this.data;
      wx.request({
        url: app.globalBaseUrl + '/activity/add',
        data: data,
        success(result) {
          console.log(result);
        }
      })
    }catch(e){

    }
    
    
  }
})