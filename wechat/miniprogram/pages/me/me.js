var app = getApp()
Page({
  data: {
    hasUserInfo: false,
    user_id:null
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    wx.getSetting({
      success(res) {
        if (res.authSetting["scope.userInfo"]==true){
          that.getUserInfo();
        }
        console.log(res.authSetting)
        // res.authSetting = {
        //   "scope.userInfo": true,
        //   "scope.userLocation": true
        // }
      }
    })
    
  },
  getUserInfo: function () {
    var that = this

    //console.log("app.globalData.hasLogin" + app.globalData.hasLogin)
    if (app.globalData.hasLogin === false || app.globalData.hasLogin == undefined) {

      wx.login({
        success(res) {
          if (res.code) {
            wx.request({
              url: app.globalBaseUrl+'/wechat/getWechatOpenid',
              data:{
                code:res.code
              },
              success(result) {
                // console.log(res.data)
                console.log(result)
                if (result.data && result.data.code == 200){
                  that.setData({
                    user_id: result.data.data.id
                  })
                  _getUserInfo(result.data.data)
                }else{
                  wx.showModal({
                    title: '温馨提示',
                    content: '请重新登录',
                  })
                }
                
              }
            })
            
          } else {
            console.log('登录失败！' + res.errMsg)
          }
        }
      })
    } else {
      _getUserInfo()
    }

    function _getUserInfo(params) {
      console.log('登录成功！')
      console.log(params)
      wx.getUserInfo({
        success: function (res) {

          wx.setStorage({
            key: "user_id",
            data: params.id
          })

          wx.request({
            url: app.globalBaseUrl +'/base_user/updateUserInfo',
            data: {
              id: params.id,
              nickName: res.userInfo.nickName,
              avatarUrl: res.userInfo.avatarUrl
            },
            success(result) {
              console.log("数据更新成功");
            }
          })

          console.log(res)
          that.setData({
            hasUserInfo: true,
            userInfo: res.userInfo
          })
          // // 读取user_id
          // wx.getStorage({
          //   key: 'user_id',
          //   success(res) {
          //     console.log("user_id:"+res.data)
          //   }
          // })

        }
      })
    }
  },

  clear: function () {
    this.setData({
      hasUserInfo: false,
      userInfo: {}
    })
  }
})
