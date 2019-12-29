import * as echarts from '../../ec-canvas/echarts';

const app = getApp();
var dataSrc = [];
var chart;
function initChart(canvas, width, height) {
  const chart = echarts.init(canvas, null, {
    width: width,
    height: height
  });
  canvas.setChart(chart);

  var option = {
    backgroundColor: "#ffffff",
    color: ["#37A2DA", "#32C5E9", "#67E0E3", "#91F2DE", "#FFDB5C", "#FF9F7F"],
    series: [{
      label: {
        normal: {
          fontSize: 14
        }
      },
      type: 'pie',
      center: ['50%', '50%'],
      radius: [0, '60%'],
      data: dataSrc,
      itemStyle: {
        emphasis: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 2, 2, 0.3)'
        }
      }
    }]
  };

  chart.setOption(option);
  return chart;
}

function refreshData(data) {
  if (chart != null){
    //刷新数据
    var option = chart.getOption();
    option.series[0].data = data;
    chart.setOption(option);
  }
  
}

Page({
  onShareAppMessage: function (res) {
    return {
      title: 'ECharts 可以在微信小程序中使用啦！',
      path: '/pages/index/index',
      success: function () { },
      fail: function () { }
    }
  },
  data: {
    ec: {
    },
    vote_id:null,
    voteDetail: null,
    commentList:null,
    voteOnList:[]
  },
  onLoad: function (options){
    this.setData({
      vote_id: options.id,
    })
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/vote/get',
      data: { id: options.id },
      success(result) {
        console.log(result.data);
        if (result.data.code == 200) {
          that.setData({
            voteDetail: result.data.data
          })
        }
      }
    })

    wx.request({
      url: app.globalBaseUrl + '/vote_item/getAllByVoteId',
      data: { vote_id: options.id },
      success(result) {
        console.log(result.data);
        if (result.data.code == 200) {
          that.setData({
            vote_item: result.data.data
          })
        }
      }
    })
  },
  onReady() {
  },

  onShow:function(){
    this.getComment();
    this.getVoteOnDetail();
  },

  echartInit(e) {
    chart = initChart(e.detail.canvas, e.detail.width, e.detail.height);
  },
  getComment: function () {
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/comment_vote/getAllByVote',
      data: { vote_id: this.data.vote_id },
      success(result) {
        console.log(result.data);
        if (result.data.code == 200) {
          that.setData({
            commentList: result.data.data
          })
        }
      }
    })
  },
  gotoVoteOn:function(){
    wx.navigateTo({
      url: '../voteDetailOnVote/voteDetailOnVote?vote_id=' + this.data.vote_id,
    })
  },
  getVoteOnDetail:function(){
    var that = this;
    wx.request({
      url: app.globalBaseUrl + '/vote_member/getVoteOnDetail',
      data: { vote_id: this.data.vote_id },
      success(result) {
        console.log("getVoteOnDetail-------------");
        console.log(result.data);
        if (result.data.code == 200) {
          //dataSrc = result.data.data;
          refreshData(result.data.data);

        }
      }
    })
  }
});