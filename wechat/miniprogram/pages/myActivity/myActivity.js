// miniprogram/pages/createActivity/createActivity.js
Page({

  /**
   * 页面的初始数据
   */
  data: {

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

  selectTypeToShowActi: function(){
    wx.showActionSheet({
      itemList: ['我参与的', '我创建的'],
      success(res) {
        console.log(res.tabIndex)
        switch (res.tapIndex){
          case 0:
            wx.navigateTo({
              url: '../myActivityPartakeList/myActivityPartakeList',
            })
          break;
          case 1:
            wx.navigateTo({
              url: '../myActivityList/myActivityList',
            })
          break;
        }
        
      },
      fail(res) {
        console.log(res.errMsg)
      }
    })
  },
  selectTypeToShowVote: function () {
    wx.showActionSheet({
      itemList: ['我参与的', '我创建的'],
      success(res) {
        console.log(res)
        switch (res.tapIndex) {
          case 0:
            wx.navigateTo({
              url: '../myVotePartakeList/myVotePartakeList',
            })
            break;
          case 1:
            wx.navigateTo({
              url: '../myVoteList/myVoteList',
            })
            break;
        }
      },
      fail(res) {
        console.log(res.errMsg)
      }
    })
  }
})