// miniprogram/pages/selectUser/se le c t U se r.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list: [],
    selected:[]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;

    try {
      var user_id = wx.getStorageSync("user_id");
      wx.request({
        url: app.globalBaseUrl + '/base_user/getAll',
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
  checkboxChange: function (e) {
    this.setData({
      selected: e.detail.value
    })
    console.log('checkbox发生change事件，携带value值为：', e.detail.value)
  },
  backto:function(){

    let select_users = [];
    let pages = getCurrentPages();               //当前页面
    let prevPage = pages[pages.length - 2];     //上一页面
    var that = this;
    if (this.data.selected != null && this.data.list != null){
      for (var i = 0; i < this.data.selected.length; i++) {
        for (var j = 0; j < this.data.list.length; j++) {

          console.log("this.data.list["+j+"].id:"+this.data.list[j].id);
          console.log("this.data.selected["+i+"]:" + this.data.selected[i]);

          if (this.data.list[j].id == this.data.selected[i]){
            select_users.push(this.data.list[j]);
          }
        }
      }
      //console.log(select_users);
      prevPage.setData({
        selected_user: select_users,
        selected_user_id: that.data.selected
      });
    }
  
    wx.navigateBack({
      delta: 1
    })
  }
})