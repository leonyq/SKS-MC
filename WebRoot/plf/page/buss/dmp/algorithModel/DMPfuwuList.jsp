<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title>算法模型信息列表</title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head_layui.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="dmp" value="1" />
	</jsp:include>
 <style type="text/css">
 .layui-form-select{
 	width: 220px;
 }
 
 .cards2{
 	margin: 0 -8px;
 }
 
	
 </style>
</head>

<body>
    <div class="layui-fluid switch">
        <div class="listOperate">
            <div class="searchSwitch"></div>
            <div class="operates">
                <span class="ico add"></span>
                <span class="ico search"></span>
            </div>
        </div>
        <form class="layui-form searchDiv" id="searchForm" action="">
            <div class="layui-row">
           
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="算法模型代码"/></div>
                    <div class="search_r">
                        <input type="text"  id="paraMap_code" name="paraMap.WPL_CODE" maxlength="30" class="layui-input">
                    </div>
                </div>
                
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="算法模型说明"/></div>
                    <div class="search_r">
                        <input type="text"  id="paraMap_name" name="paraMap.WPL_NAME" maxlength="30"  class="layui-input">
                    </div>
                </div>
                
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="算法模型类型"/></div>
                    <div class="search_r">
                       <dict:selectDict dictCode="ALGORITH_MODEL_TYPE" dictValue="%{TYPE}" name="paraMap.WPL_TYPE" id="paraMap_wplType" custom_option="<option value=''>%{getText('--请选择--')}</option>" />
                    </div>
                </div>
                
            </div>
        </form>
        <div class="cardPane open">
            <div class="layui-row cards2">
                <div class="item active">
                    <div class="p1">DMP程序性能测试服务</div>
                    <div class="p2">DMP001</div>
                    <div class="operates">
                        <span class="ico edit"></span>
                        <span class="ico close"></span>
                        <span class="ico search"></span>
                        <span class="ico play"></span>
                        <span class="ico code"></span>
                    </div>
                </div>
                <div class="item">
                    <div class="p1"><span class="ico"></span>P_SMT_CHECK_TIN_STATUS</div>
                    <div class="p2">SMT校验辅料品质状态SMT校验辅料品校SMT校验</div>
                    <div class="operates">
                        <span class="ico edit"></span>
                        <span class="ico close"></span>
                        <span class="ico search"></span>
                        <span class="ico play"></span>
                        <span class="ico code"></span>
                    </div>
                </div>
                <div class="item pause">
                    <div class="p1"><span class="ico"></span>P_SMT_CHECK_TIN_STATUS</div>
                    <div class="p2">SMT校验辅料品质状态SMT校验辅料品校SMT校验</div>
                    <div class="operates">
                        <span class="ico edit"></span>
                        <span class="ico close"></span>
                        <span class="ico search"></span>
                        <span class="ico pause"></span>
                        <span class="ico code"></span>
                    </div>
                </div>
                <div class="item">
                    <div class="p1"><span class="ico"></span>P_SMT_CHECK_TIN_STATUS</div>
                    <div class="p2">SMT校验辅料品质状态SMT校验辅料品校SMT校验</div>
                    <div class="operates">
                        <span class="ico edit"></span>
                        <span class="ico close"></span>
                        <span class="ico search"></span>
                        <span class="ico play"></span>
                        <span class="ico code"></span>
                    </div>
                </div>
                <div class="item">
                    <div class="p1"><span class="ico"></span>P_SMT_CHECK_TIN_STATUS</div>
                    <div class="p2">SMT校验辅料品质状态SMT校验辅料品校SMT校验</div>
                    <div class="operates">
                        <span class="ico edit"></span>
                        <span class="ico close"></span>
                        <span class="ico search"></span>
                        <span class="ico play"></span>
                        <span class="ico code"></span>
                    </div>
                </div>
                <div class="item">
                    <div class="p1"><span class="ico"></span>P_SMT_CHECK_TIN_STATUS</div>
                    <div class="p2">SMT校验辅料品质状态SMT校验辅料品校SMT校验</div>
                    <div class="operates">
                        <span class="ico edit"></span>
                        <span class="ico close"></span>
                        <span class="ico search"></span>
                        <span class="ico play"></span>
                        <span class="ico code"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript" src="${path}plf/page/bussmodel/dmp/js/echarts.js"></script>
<script>
	layui.use(['element','form'], function(){
        var element = layui.element;
    });
    
    $('.searchSwitch').click(function(){
        $('.layui-fluid').toggleClass('switch')
    });

    $('.cards2 .item').click(function(){
        $(this).addClass('active').siblings().removeClass('active')
    });
</script>	
<script>
        var option = {
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
						color: [[0.2, '#32c4c1'],[0.8, '#52b3fc'],[1, '#da7f80']],
						width : 12
					}
				},
				splitLine : { //大刻度线样式
					length : 12,
					lineStyle: {
						color: '#fff'
					}
				},
				axisTick : { //小刻度线样式
					length : 3,
					splitNumber : 1,
					lineStyle : {
						color : '#fff',
					}
				},
				axisLabel : {//刻度值
					show : true,
					distance : 2,
					textStyle: {
	  	            	fontSize: 10
	  	            }
				},
				pointer : {
					width : 3,
				},
				itemStyle : {
					color:['#198F77','#F7C92F']
				},
				title : {
					offsetCenter : [ 0, '-30%' ],
					textStyle: {
	  	            	fontSize: 10,
	  	            	color: '#666',
	  	            }
				},
				data : [ {
					value : 45,
				},{
					value : 55,
				}]
			} ]
        }
    	
    	var option1 = {
	        tooltip: {
	            trigger: 'item',
	            formatter: "{a} <br/>{b}: {c} ({d}%)"
	        },
	        color: ["#1c9179", "#e6e6e6"],
	        graphic:[{
	            type:'text',
	            left:'center',
	            top:'33%',
	            style:{
	                text:'5607.4G',
	                textAlign:'center',
	                fill:'#1C9179',
	                fontSize: 18,
	            }
	        },{
			    type: 'rect',
			    shape: {
			        x: 20,
			        y: 70,
			        width: 100,
			        height: 1
			    },
			    style:{
	                fill:'#c8c8c8',
	            }
			},{
	            type:'text',
	            left:'center',
	            top:'55%',
	            style:{
	                text:'5607.4G',
	                textAlign:'center',
	                fill:'#e6e6e6',
	                fontSize: 18,
	            }
	        }],
		    series: [
		        {
		            name:'访问来源',
		            type:'pie',
		            radius: ['90%', '100%'],
		            avoidLabelOverlap: false,
		            label: {
		                normal: {
		                    show: false,
		                    position: 'center'
		                },
		                emphasis: {
		                    show: true,
		                    textStyle: {
		                        fontSize: '30',
		                        fontWeight: 'bold'
		                    }
		                }
		            },
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:[
		                {value:335, name:'直接访问'},
		                {value:310, name:'邮件营销'}
		            ]
		        }
		    ]
	    };
    	
        echarts.init(document.getElementById('a')).setOption(option)
        echarts.init(document.getElementById('b')).setOption(option1)
</script>	

</body>
</html>