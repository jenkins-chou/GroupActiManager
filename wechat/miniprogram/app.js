//app.js

App({
  onLaunch: function () {

    //更改为自己部署的服务器
    this.globalBaseUrl = "https://zzj.mynatapp.cc"
    
    if (!wx.cloud) {
      console.error('请使用 2.2.3 或以上的基础库以使用云能力')
    } else {
      // wx.cloud.init({
      //   // env 参数说明：
      //   //   env 参数决定接下来小程序发起的云开发调用（wx.cloud.xxx）会默认请求到哪个云环境的资源
      //   //   此处请填入环境 ID, 环境 ID 可打开云控制台查看
      //   //   如不填则使用默认环境（第一个创建的环境）
      //   // env: 'my-env-id',
      //   traceUser: true,
      // })
    }

    this.globalData = {}

    var that = this;
    wx.getSetting({
      success(res) {
        if (res.authSetting["scope.userInfo"] == true) {
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
    if (this.globalData.hasLogin === false || this.globalData.hasLogin == undefined) {
      wx.login({
        success(res) {
          if (res.code) {
            wx.request({
              url: that.globalBaseUrl + '/wechat/getWechatOpenid',
              data: {
                code: res.code
              },
              success(result) {
                // console.log(res.data)
                console.log(result)
                if (result.data && result.data.code == 200) {
                  _getUserInfo(result.data.data)
                } else {
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
            url: that.globalBaseUrl + '/base_user/updateUserInfo',
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

        }
      })
    }
  },

  checkUserLogin:function(){
    try {
      var user_id = wx.getStorageSync("user_id");
      if (user_id != undefined && user_id != null && user_id != ''){
        return true;
      }
    } catch (e) {

    }
    return false;
  }
})
