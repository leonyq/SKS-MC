/**
 * 图表控件显示公用函数
 * by:zm;
 * date:2017-11-28
 * ***/
function ShowMchart(){
    /**
     * 生成柱状图
     * 参数：chartId 为图表ID, showId为显示位置容器ID，jsonParam为传入参数，数据格式为json字符串
     ***/
    this.barMchart = function(chartId,showId,jsonParam){
          if (chartId!=null && typeof(chartId)!="undefined" && chartId!=""){
                $.ajax({
                    type: "post",
                    url: "charts/barAction_ajaxBar.ms",
                    data:"chartsConfig.id="+chartId,
                    success: function(data){
                        if (data!=""){
                            var dataResult=data.toString().replace(/\n|\r|\t/g,"");
                            var result1=eval(dataResult.split("(@@@)")[0]);
                            var eventClick = jsonParam.eventClick ? jsonParam.eventClick: result1.eventClick;
                            mchart.setChartAttr(jsonParam,showId,result1);
                            var myChart = echarts.init(document.getElementById(showId)); 
                            myChart.setOption(result1); 
                            if (eventClick!=null && typeof(eventClick)!="undefined" && eventClick!=""){
                                myChart.on('click',function(params){
                                	 utilsFp.confirmIcon(1,"","","", params.value+"|"+params.name,"","260","145");
                                	//alert (params.value+"|"+params.name);
                                    return eventClick;
                                });
                            }                                
                        /*    var result2=eval(dataResult.split("(@@@)")[1]);
                            var canvasHeight2 = result2.canvasHeight2;
                            var canvasWidth2 = result2.canvasWidth2;

                            $("#bar_${chartsConfig.id}_2").css("height", canvasHeight2+"px");
                            $("#bar_${chartsConfig.id}_2").css("width", canvasWidth2+"px");

                            var myChart2 = echarts.init(document.getElementById('bar_${chartsConfig.id}_2')); 
                            
                            myChart2.setOption(result2);                 */            
                        }
                    }
                });
            } 
        };
    /**
     * 生成饼图
     * 参数：chartId 为图表ID, showId为显示位置容器ID，jsonParam为传入参数，数据格式为json字符串
     ***/
    this.pieMchart = function(chartId,showId,jsonParam){
          if (chartId!=null && typeof(chartId)!="undefined" && chartId!=""){
                $.ajax({
                    type: "post",
                    url: "charts/pieAction_ajaxPie.ms",
                    data:"chartsConfig.id="+chartId,
                    success: function(data){
                        if (data!=""){
                            var result=eval(data.toString().replace(/\n|\r|\t/g,""));
                            mchart.setChartAttr(jsonParam,showId,result);
                            var eventClick = jsonParam.eventClick ? jsonParam.eventClick: result.eventClick;
                            var myChart = echarts.init(document.getElementById(showId)); 
                            myChart.setOption(result); 
                            if (eventClick!=null && typeof(eventClick)!="undefined" && eventClick!=""){
                                myChart.on('click',function(params){
                                    //此处的点击事件还要修改
                                	 utilsFp.confirmIcon(1,"","","", params.value+"|"+params.name,"","260","145");
                                	//alert (params.value+"|"+params.name);
                                    return eventClick;
                                });
                            }                                
                        }
                    }
                });
            } 
      };
    
    /**
     * 生成折线图
     * 参数：chartId 为图表ID, showId为显示位置容器ID，jsonParam为传入参数，数据格式为json字符串
     ***/
    this.lineMchart = function(chartId,showId,jsonParam){
          if (chartId!=null && typeof(chartId)!="undefined" && chartId!=""){
              $.ajax({
                    type: "post",
                    url: "charts/lineAction_ajaxLine.ms",
                    data:"chartsConfig.id="+chartId,
                    success: function(data){
                        if (data!=""){
                            var result=eval(data.toString().replace(/\n|\r|\t/g,""));
                            mchart.setChartAttr(jsonParam,showId,result);
                            var eventClick = jsonParam.eventClick ? jsonParam.eventClick: result.eventClick;
                            var myChart = echarts.init(document.getElementById(showId)); 
                            myChart.setOption(result); 
                            if (eventClick!=null && typeof(eventClick)!="undefined" && eventClick!=""){
                                myChart.on('click',function(params){
                                	 utilsFp.confirmIcon(1,"","","", params.value+"|"+params.name,"","260","145");
                                	//alert (params.value+"|"+params.name);
                                    return eventClick;
                                });
                            }                                
                        }
                    }
                });
            } 
      };
    
    /**
     * 生成日历图
     * 参数：chartId 为图表ID, showId为显示位置容器ID，jsonParam为传入参数，数据格式为json字符串
     ***/
    this.calMchart = function(chartId,showId,jsonParam){
          if (chartId!=null && typeof(chartId)!="undefined" && chartId!=""){
              $.ajax({
                    type: "post",
                    url: "charts/calAction_ajaxCal.ms",
                    data:"chartsConfig.id="+chartId,
                    success: function(data){
                        if (data!=""){
                            var result=eval(data.toString().replace(/\n|\r|\t/g,""));
                            mchart.setChartAttr(jsonParam,showId,result);
                            var eventClick = jsonParam.eventClick ? jsonParam.eventClick: result.eventClick;
                            var myChart = echarts.init(document.getElementById(showId)); 
                            myChart.setOption(result); 
                            if (eventClick!=null && typeof(eventClick)!="undefined" && eventClick!=""){
                                myChart.on('click',function(params){
                                	 utilsFp.confirmIcon(1,"","","", params.value+"|"+params.name,"","260","145");
                                	//alert (params.value+"|"+params.name);
                                    return eventClick;
                                });
                            }                                
                        }
                    }
                });
            } 
      }
    ;
    /**
     * 生成仪表图
     * 参数：chartId 为图表ID, showId为显示位置容器ID，jsonParam为传入参数，数据格式为json字符串
     ***/
    this.gagueMchart = function(chartId,showId,jsonParam){
          if (chartId!=null && typeof(chartId)!="undefined" && chartId!=""){
              $.ajax({
                    type: "post",
                    url: "charts/gaugeAction_ajaxGauge.ms",
                    data:"chartsConfig.id="+chartId,
                    success: function(data){
                        if (data!=""){
                            var result=eval(data.toString().replace(/\n|\r|\t/g,""));
                            mchart.setChartAttr(jsonParam,showId,result);
                            var eventClick = jsonParam.eventClick ? jsonParam.eventClick: result.eventClick;
                            var myChart = echarts.init(document.getElementById(showId)); 
                            myChart.setOption(result); 
                            if (eventClick!=null && typeof(eventClick)!="undefined" && eventClick!=""){
                                myChart.on('click',function(params){
                                	 utilsFp.confirmIcon(1,"","","", params.value+"|"+params.name,"","260","145");
                                	//alert (params.value+"|"+params.name);
                                    return eventClick;
                                });
                            }                                
                        }
                    }
                });
            } 
      };
    /**
     * 设置相应属性
     * 参数：result 为图表属性集, showId为显示位置容器ID，jsonParam为传入参数，数据格式为json字符串
     ***/
    this.setChartAttr = function(jsonParam,showId,result){
        var canvasHeight = jsonParam.canvasHeight ? jsonParam.canvasHeight:result.canvasHeight;
        var canvasWidth = jsonParam.canvasWidth ? jsonParam.canvasWidth:result.canvasWidth;
        var backgroundUrl = jsonParam.backgroundUrl ? jsonParam.backgroundUrl:result.backgroundUrl;
        var backgroundAlpha = jsonParam.backgroundAlpha ? jsonParam.backgroundAlpha: result.backgroundAlpha;
        var backgroundOpacity = jsonParam.backgroundOpacity ? jsonParam.backgroundOpacity: result.backgroundOpacity;
        $("#"+showId).css("height", canvasHeight+"px");
        $("#"+showId).css("width", canvasWidth+"px");
        $("#"+showId).css("background-image", "url('"+backgroundUrl+"')");
        $("#"+showId).css("opacity", backgroundOpacity);
    };
}
var mchart = new ShowMchart();