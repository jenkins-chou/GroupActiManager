// miniprogram/pages/m y.js

var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    title:'',
    start_time: '1',
    end_time: '',
    address:'',
    programme_main:'',
    programme_spare:'',
    selected_user: [],
    selected_user_id: [],
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
    if (this.data.title == ''
      || this.data.start_time == ''
      || this.data.end_time == ''
      || this.data.programme_main == ''
      || this.data.programme_spare == ''){
      wx.showModal({
        title: '提示',
        content: '请完善信息',
      })
      return;
    }
    if (this.data.selected_user_id.length <=0){
      wx.showModal({
        title: '提示',
        content: '请选择参加人员',
      })
      return;
    }
    try{
      var user_id = wx.getStorageSync("user_id");
      this.data.creator = user_id;
      console.log(this.data);
      var data = this.data;
      wx.request({
        url: app.globalBaseUrl + '/activity/addWithDetail',
        data: data,
        success(result) {
          console.log(result);
          if(result.data.code == 200){
            wx.navigateBack({
              
            });
            wx.showToast({
              title: '提交成功',
            })
          }
        }
      })
    }catch(e){
    }
  },

  startTimeDetail: function(e){
    console.log(e);
    this.setData({
      start_time: e.detail.time
    })
  },
  endTimeDetail: function (e) {
    console.log(e);
    this.setData({
      end_time: e.detail.time
    })
  }

})