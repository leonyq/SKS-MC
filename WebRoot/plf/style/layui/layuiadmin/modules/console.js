/**

 @Name：layuiAdmin 主页控制台
 @Author：贤心
 @Site：http://www.layui.com/admin/
 @License：GPL-2
    
 */


layui.define(function(exports){
  
  /*
    下面通过 layui.use 分段加载不同的模块，实现不同区域的同时渲染，从而保证视图的快速呈现
  */
  
  
  //区块轮播切换
  layui.use(['admin', 'carousel'], function(){
    var $ = layui.$
    ,admin = layui.admin
    ,carousel = layui.carousel
    ,element = layui.element
    ,device = layui.device();

    //轮播切换
    $('.layadmin-carousel').each(function(){
      var othis = $(this);
      carousel.render({
        elem: this
        ,width: '100%'
        ,arrow: 'none'
        ,interval: othis.data('interval')
        ,autoplay: othis.data('autoplay') === true
        ,trigger: (device.ios || device.android) ? 'click' : 'hover'
        ,anim: othis.data('anim')
      });
    });
    
    element.render('progress');
    
  });

  //数据概览
  layui.use(['admin', 'echarts'], function(){
    var $ = layui.$
    ,admin = layui.admin
    ,echarts = layui.echarts;
    
    //系统cpu
    var option1 = {	
        	title: {
        		text: 'System cpu',
        		x: 'center',
  	            y: 'bottom',
  	            textStyle: {
  	            	fontSize: 18,
  	            	color: "#333"
  	            }
        	},
			series : [ {
				name : 'System cpu',
				radius : '95%',
				splitNumber : 10, //每段的多少个
				title : {
					color : '#333',
				},
				type : 'gauge',
				detail : {
					formatter : '{value}%',
					offsetCenter: [0, "20%"],
					height: 10,
					textStyle : {
						color: '#009688',
						fontSize: 16
					}
				},
				axisLine : { //刻度区域样式
					lineStyle : {
						width : 8
					}
				},
				splitLine : { //小刻度线样式
					length : 10,
					lineStyle: {
						color: '#fff'
					}
				},
				axisTick : { //大刻度线样式
					length : 3,
					splitNumber : 5,
					lineStyle : {
						color : '#fff',
					}
				},
				axisLabel : {//刻度值
					show : true,
					distance : 2,
					textStyle: {
	  	            	fontSize: 8
	  	            }
				},
				pointer : {
					width : 3,
				},
				title : {
					offsetCenter : [ 0, '-30%' ],
					textStyle: {
	  	            	fontSize: 10,
	  	            	color: '#666',
	  	            }
				},
				data : [ {
					value : 25,
					name : '使用率',
				} ]
			} ]
	}
    //jvm cpu
    var option2 = {	
        	title: {
        		text: 'jvm cpu',
        		x: 'center',
  	            y: 'bottom',
  	            textStyle: {
  	            	fontSize: 18,
  	            	color: "#333"
  	            }
        	},
			series : [ {
				name : 'jvm cpu',
				radius : '95%',
				splitNumber : 10, //每段的多少个
				title : {
					color : '#666',
				},
				type : 'gauge',
				detail : {
					formatter : '{value}%',
					offsetCenter: [0, "20%"],
					height: 10,
					textStyle : {
						color: '#009688',
						fontSize: 16
					}
				},
				axisLine : { //刻度区域样式
					lineStyle : {
						width : 8
					}
				},
				splitLine : { //小刻度线样式
					length : 10,
					lineStyle: {
						color: '#fff'
					}
				},
				axisTick : { //大刻度线样式
					length : 3,
					splitNumber : 5,
					lineStyle : {
						color : '#fff',
					}
				},
				axisLabel : {//刻度值
					show : true,
					distance : 2,
					textStyle: {
	  	            	fontSize: 8
	  	            }
				},
				pointer : {
					width : 3,
				},
				title : {
					offsetCenter : [ 0, '-30%' ],
					textStyle: {
	  	            	fontSize: 10,
	  	            	color: '#666',
	  	            }
				},
				data : [ {
					value : 25,
					name : '使用率',
				} ]
			} ]
		}
  //今日流量趋势
    var option3 = {
    		title: {
	          text: '最近7天操作用户 / 开发用户登录数量',
	          x: 'center',
	          y: 0,
	          textStyle: {
	            fontSize: 14
	          }
	     	},
	        grid: {
	        	x: 40,
	        	y: 50,
	        	x2: 15,
	        	y2: 50
	        },
	        tooltip : {
	          trigger: 'axis'
	        },
	        legend: {
	          data:['PV:操作用户数','UV:开发用户数'],
	          y: 25
	        },
	        xAxis : [{
	          type : 'category',
	          boundaryGap : false,
	          data: ['周一','周二','周三','周四','周五','周六','周日']
	        }],
	        yAxis : [{
	          type : 'value'
	        }],
	        series : [{
	          name:'PV:操作用户数',
	          type:'line',
	          smooth:true,
	          itemStyle: {normal: {areaStyle: {type: 'default'}}},
	          data: [111,222,333,444,555,666,500]
	        },{
	          name:'UV:开发用户数',
	          type:'line',
	          smooth:true,
	          itemStyle: {normal: {areaStyle: {type: 'default'}}},
	          data: [11,22,33,44,55,66,333]
	        }]
	}
    
    
    
    var echartsApp = [], options = [option1,option2,option3]
    
    ,elemDataView = $('.LAY-index-dataview').children('div')
    ,renderDataView = function(index){
      echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
      echartsApp[index].setOption(options[index]);
      //window.onresize = echartsApp[index].resize;
      admin.resize(function(){
        echartsApp[index].resize();
      });
    };
    
    //没找到DOM，终止执行
    if(!elemDataView[0]) return;
    
    
    renderDataView(0);
    renderDataView(1);
    renderDataView(2);
    
    
    var pathName = window.document.location.pathname
    var path = pathName.substring(0, pathName.substr(1).indexOf('/') + 1)
  
    $.ajax({
	  url: path + "/performance/performanceMonitorAction_listPerformanceMonitor.ms",
	  type : "get",
	  dataType: "json",
	  success: function(data){
		  option1.series[0].data[0].value = data.ajaxMap.nodeDetailList[0].INUSE_CPU?data.ajaxMap.nodeDetailList[0].INUSE_CPU:0
		  option2.series[0].data[0].value = data.ajaxMap.nodeDetailList[0].JVM_CPU?data.ajaxMap.nodeDetailList[0].JVM_CPU:0
		  renderDataView(0);
		  renderDataView(1);
	  },
	});
    
    
    $.ajax({
  	  url: path + "/buss/bussModel_findMcLoginInfo.ms",
  	  type : "get",
  	  dataType: "json",
  	  success: function(data){
  		  
		  option3.xAxis[0].data = data.ajaxMap.date
		  var arr1 = [],arr2 = [],arr3 = [],arr4 = []
  		  $.each(data.ajaxMap.operation,function(index,item){
			  arr1.push(item.LI_TIME)
		  })
		  
  		  $.each(data.ajaxMap.date,function(index,item){
  			  if(arr1.indexOf(item) >= 0){
				  	$.each(data.ajaxMap.operation,function(i,value){
				  		if(value.LI_TIME == item){
				  			arr2.push(value.OPERATION)
				  		}
				  	})
  			  }else{
  				  arr2.push(0)
  			  }
  		  })
  		  
  		  $.each(data.ajaxMap.programmer,function(index,item){
			  arr3.push(item.LI_TIME)
		  })
		  
		  $.each(data.ajaxMap.date,function(index,item){
  			  if(arr3.indexOf(item) >= 0){
				  	$.each(data.ajaxMap.programmer,function(i,value){
				  		if(value.LI_TIME == item){
				  			arr4.push(value.PROGRAMMER)
				  		}
				  	})
  			  }else{
  				  arr4.push(0)
  			  }
  		  })
  		  
		  option3.series[0].data = arr2
		  option3.series[1].data = arr4
		  renderDataView(2);
  	  },
  	  
  	});
    
    //切换ip
    $('#IPs').on('click','a',function(){
    	renderDataView(0);
        renderDataView(1);
    })
    
    //监听数据概览轮播
    var carouselIndex = 0;
    /*
    carousel.on('change(LAY-index-dataview)', function(obj){
      renderDataView(carouselIndex = obj.index);
    });
    */
    
    //监听侧边伸缩
    layui.admin.on('side', function(){
      setTimeout(function(){
    	  renderDataView(0);
    	  renderDataView(1);
    	  renderDataView(2);
      }, 300);
    });
    
    //监听路由
    layui.admin.on('hash(tab)', function(){
      layui.router().path.join('') || renderDataView(0) || renderDataView(1) || renderDataView(2);;
    });
  });

  //最新订单
  /*
  layui.use('table', function(){
    var $ = layui.$
    ,table = layui.table;
    
    //今日热搜
    table.render({
      elem: '#LAY-index-topSearch'
      ,url: layui.setter.base + 'json/console/top-search.js' //模拟接口
      ,page: true
      ,cols: [[
        {type: 'numbers', fixed: 'left'}
        ,{field: 'keywords', title: '关键词', minWidth: 300, templet: '<div><a href="https://www.baidu.com/s?wd={{ d.keywords }}" target="_blank" class="layui-table-link">{{ d.keywords }}</div>'}
        ,{field: 'frequency', title: '搜索次数', minWidth: 120, sort: true}
        ,{field: 'userNums', title: '用户数', sort: true}
      ]]
      ,skin: 'line'
    });
    
    //今日热贴
    table.render({
      elem: '#LAY-index-topCard'
      ,url: layui.setter.base + 'json/console/top-card.js' //模拟接口
      ,page: true
      ,cellMinWidth: 120
      ,cols: [[
        {type: 'numbers', fixed: 'left'}
        ,{field: 'title', title: '标题', minWidth: 300, templet: '<div><a href="{{ d.href }}" target="_blank" class="layui-table-link">{{ d.title }}</div>'}
        ,{field: 'username', title: '发帖者'}
        ,{field: 'channel', title: '类别'}
        ,{field: 'crt', title: '点击率', sort: true}
      ]]
      ,skin: 'line'
    });
  });
  */
  exports('console', {})
});