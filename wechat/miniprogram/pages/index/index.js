//index.js
const app = getApp()

Page({
  data: {
    avatarUrl: './user-unlogin.png',
    userInfo: {},
    logged: false,
    takeSession: false,
    requestResult: '',

    background: ['green', 'red', 'yellow'],
    imagePath: ['../../images/acti_demo1.jpg','../../images/acti_demo2.jpeg', '../../images/acti_demo3.jpg'],
    indicatorDots: true,
    vertical: false,
    autoplay: true,
    interval: 4000,
    duration: 1000,

    actiNotiList:[],
    voteNotiList:[]
  },

  changeIndicatorDots: function (e) {
    this.setData({
      indicatorDots: !this.data.indicatorDots
    })
  },
  changeVertical: function (e) {
    this.setData({
      vertical: !this.data.vertical
    })
  },
  changeAutoplay: function (e) {
    this.setData({
      autoplay: !this.data.autoplay
    })
  },
  intervalChange: function (e) {
    this.setData({
      interval: e.detail.value
    })
  },
  durationChange: function (e) {
    this.setData({
      duration: e.detail.value
    })
  },

  onLoad: function() {
    if (!wx.cloud) {
      wx.redirectTo({
        url: '../chooseLib/chooseLib',
      })
      return
    }

    // 获取用户信息
    wx.getSetting({
      success: res => {
        if (res.authSetting['scope.userInfo']) {
          // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
          wx.getUserInfo({
            success: res => {
              this.setData({
                avatarUrl: res.userInfo.avatarUrl,
                userInfo: res.userInfo
              })
            }
          })
        }
      }
    })

    this.getNotification();

    
  },

  onGetUserInfo: function(e) {
    if (!this.data.logged && e.detail.userInfo) {
      this.setData({
        logged: true,
        avatarUrl: e.detail.userInfo.avatarUrl,
        userInfo: e.detail.userInfo
      })
    }
  },

  onGetOpenid: function() {
    // 调用云函数
    wx.cloud.callFunction({
      name: 'login',
      data: {},
      success: res => {
        console.log('[云函数] [login] user openid: ', res.result.openid)
        app.globalData.openid = res.result.openid
        wx.navigateTo({
          url: '../userConsole/userConsole',
        })
      },
      fail: err => {
        console.error('[云函数] [login] 调用失败', err)
        wx.navigateTo({
          url: '../deployFunctions/deployFunctions',
        })
      }
    })
  },

  // 上传图片
  doUpload: function () {
    // 选择图片
    wx.chooseImage({
      count: 1,
      sizeType: ['compressed'],
      sourceType: ['album', 'camera'],
      success: function (res) {

        wx.showLoading({
          title: '上传中',
        })

        const filePath = res.tempFilePaths[0]
        
        // 上传图片
        const cloudPath = 'my-image' + filePath.match(/\.[^.]+?$/)[0]
        wx.cloud.uploadFile({
          cloudPath,
          filePath,
          success: res => {
            console.log('[上传文件] 成功：', res)

            app.globalData.fileID = res.fileID
            app.globalData.cloudPath = cloudPath
            app.globalData.imagePath = filePath
            
            wx.navigateTo({
              url: '../storageConsole/storageConsole'
            })
          },
          fail: e => {
            console.error('[上传文件] 失败：', e)
            wx.showToast({
              icon: 'none',
              title: '上传失败',
            })
          },
          complete: () => {
            wx.hideLoading()
          }
        })

      },
      fail: e => {
        console.error(e)
      }
    })
  },

  bindNavigate:function(e){
    if (!app.checkUserLogin()){
      wx.showModal({
        title: '提示',
        content: '当前未登录，请前往我的页面进行登录操作',
      })
      return;
    }
    console.log("------->");
    console.log(e);
    console.log(e.currentTarget.dataset.url);

    let urlTemp = e.currentTarget.dataset.url;
    wx.navigateTo({
      url: urlTemp,
    })
  },

  getNotification: function(){

    var date = new Date('2019-10-17 10:17');
    var time1 = date.getTime();
    console.log('------->>>time:'+time1);//1398250549123

    if (app.checkUserLogin()) {
      this.getActivityNoti();
      this.getVoteNoti();
    }
  },

  getActivityNoti: function(){
    let that = this;
    var user_id = wx.getStorageSync("user_id");
    wx.request({
      url: app.globalBaseUrl + '/activity/getAllByPartake',
      data: { user_id: user_id },
      success(result) {
        console.log("------getActivityNoti");
        console.log(result);
        if (result.data.code == 200) {

          for (var i = 0; i < result.data.data.length;i++){
            let item = result.data.data[i];
            let end_time = item.end_time;
            let end_timestamp = new Date(end_time);
            let current_timestamp = new Date().getTime();
            if (end_timestamp - current_timestamp > 24 * 60 * 60 * 1000){
              result.data.data[i].last_time = '大于1天';
            } else if (end_timestamp - current_timestamp <0){
              result.data.data[i].last_time = '已经超时';
            }else{
              let ls = parseInt((end_timestamp - current_timestamp) / 1000);
              var hh = parseInt(ls / 60 / 60 % 24, 10);
              var mm = parseInt(ls / 60 % 60, 10);
              var ss = parseInt(ls % 60, 10);
              var last_timestr = hh + '时' + mm + '分' + ss + '秒';
              result.data.data[i].last_time = last_timestr;
            }
          }
          that.setData({
            actiNotiList: result.data.data
          })
        }
      }
    })
  },
  getVoteNoti: function () {
    let that = this;
    var user_id = wx.getStorageSync("user_id");
    wx.request({
      url: app.globalBaseUrl + '/vote/getAllByPartake',
      data: { user_id: user_id },
      success(result) {
        console.log("------getVoteNoti");
        console.log(result);
        if (result.data.code == 200) {

          for (var i = 0; i < result.data.data.length; i++) {
            let item = result.data.data[i];
            let end_time = item.end_time;
            let end_timestamp = new Date(end_time);
            let current_timestamp = new Date().getTime();
            if (end_timestamp - current_timestamp > 24 * 60 * 60 * 1000) {
              result.data.data[i].last_time = '大于1天';
            } else if (end_timestamp - current_timestamp < 0) {
              result.data.data[i].last_time = '已经超时';
            } else {
              let ls = parseInt((end_timestamp - current_timestamp)/1000);
              var hh = parseInt(ls / 60 / 60 % 24, 10);
              var mm = parseInt(ls / 60 % 60, 10);
              var ss = parseInt(ls % 60, 10);
              var last_timestr = hh + '时' + mm + '分' + ss + '秒';
              result.data.data[i].last_time = last_timestr;
            }
          }

          that.setData({
            voteNotiList: result.data.data
          })
        }
      }
    })
  }

})
