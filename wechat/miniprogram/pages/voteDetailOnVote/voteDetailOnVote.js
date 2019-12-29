// miniprogram/pages/progressForActivity/progressForActivity.js
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list: null,
    vote_id: null,
    selected_item_id:null,
    selected_item_title: null
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      vote_id: options.vote_id
    })

    this.getVoteItemList();
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
    //this.getOtherDetail();
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
      selected_item_id: e.detail.value
    })
    //console.log('checkbox发生change事件，携带value值为：', e.detail.value)
  },
  getVoteItemList: function () {
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/vote_item/getAllByVoteId',
      data: { vote_id: that.data.vote_id },
      success(result) {
        console.log(result.data);
        if (result.data.code == 200) {
          that.setData({
            list: result.data.data,
          })
        }
      }
    })
  },
  submitVoteOn:function(){
    if (this.data.selected_item_id == null || this.data.selected_item_id == undefined){
      wx.showModal({
        title: '提示',
        content: '请选择任意一个选项',
      })
      return;
    }

    for (var i = 0; i < this.data.list.length;i++){
      console.log(this.data.list[i]);
      if (this.data.list[i].id == this.data.selected_item_id){
        console.log(this.data.list[i]);
        this.setData({
          selected_item_title: this.data.list[i].title
        });
      }
    }

    try {
      var user_id = wx.getStorageSync("user_id");
      var that = this;
      wx.request({
        url: app.globalBaseUrl + '/vote_member/updateVoteOn',
        data: { 
          user_id: user_id,
          vote_id: that.data.vote_id,
          vote_item_id: that.data.selected_item_id,
          vote_item: that.data.selected_item_title
        },
        success(result) {
          //console.log(result.data.data);
          if (result.data.code == 200) {
            wx.navigateBack({
              delta: 1
            })
            
            wx.showToast({
              title: '提交成功',
            })

          }
        }
      })
    } catch (e) {

    }


  }
})