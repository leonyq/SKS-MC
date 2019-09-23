<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->
  
		<style type="text/css">
	.x-fieldset{border:1px solid #00bfff;padding:10px;margin-bottom:10px;display:block;height: 100%}
	</style>
	<script src="${path}buss/js/flow/topo.js"></script>
	<script src="${path}buss/js/flow/businessTopo.js"></script>
	<script type="text/javascript" src="${path}buss/js/flow/jtopo-min.js"></script>
	<script src="${path}buss/js/flow/jscolor.js"></script>
	<script src="${path}buss/js/flow/toHex.js"></script>
	<script>
	$(function(){
		initContext();//初始化内容
		billingButton();//绑定按钮事件
	});
	</script>
	<script src="${path}plf/js/jsPlumb/flow/jscolor.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/toHex.js"></script>
	 <style>
        .bd .main{
            padding:0 20px;
            box-sizing:border-box;
            height:calc(100% - 39px);
        }
        
        .bd .main .left{
            width:200px;
            float:left;
            height:calc(100% - 10px);
            border:1px solid #e4e4e4;
            box-sizing:border-box;
            overflow:auto;
        }
        
        .bd .main .right{
            width:calc(100% - 215px);
            margin-left:15px;
            float:left;
            height:calc(100% - 10px);
            box-sizing:border-box;
            position: relative;
        }
        
        .bd .main .left .item{
            width:100%;
            height:50px;
            cursor: pointer;
            padding:10px 15px;
            box-sizing:border-box;
            display: block;
            float:left;
        }
        
        .bd .main .left .item:hover{
            background-color:#ebeff8;
        }
        
        .bd .main .left .item:hover .name{
            color:#004098;
        }
        
        .bd .main .left .item img{
            width:46px;
            height:30px;
            border:1px solid #e4e4e4;
            vertical-align: middle;
            box-sizing:border-box;
            margin-right:6px;
        }
        
        .bd .main .right .operate{
            border:1px solid #ccc;
            border-bottom:none;
            position: absolute;
            top:-17px;
            left:calc(50% - 329px);
            height:30px;
            box-sizing:border-box;
            padding:6px 20px;
            z-index:10000;
            
        }
        
        .bd .main .right .operate .item{
            display:inline-block;
            width:18px;
            height:18px;
            margin:0 15px;
            cursor:pointer;
        }
        
        .bd .main .right .operate div:nth-of-type(1){
            background-image: url(${path}/plf/page/fp/img/point-icon.png);
        }
        
        .bd .main .right .operate div:nth-of-type(1):hover{
            background-image: url(${path}/plf/page/fp/img/point-icon-h.png);
        }
        
        .bd .main .right .operate div:nth-of-type(2){
            background-image: url(${path}/plf/page/fp/img/straight-icon.png);
        }
        
        .bd .main .right .operate div:nth-of-type(2):hover{
            background-image: url(${path}/plf/page/fp/img/straight-icon-h.png);
        }
        
         .bd .main .right .operate div:nth-of-type(3){
            background-image: url(${path}/plf/page/fp/img/broken-icon.png);
        }
        
        .bd .main .right .operate div:nth-of-type(3):hover{
            background-image: url(${path}/plf/page/fp/img/broken-icon-h.png);
        }
        .bd .main .right .operate div:nth-of-type(4){
            background-image: url(${path}/plf/page/fp/img/revers.png);
        }
        
        .bd .main .right .operate div:nth-of-type(4):hover{
            background-image: url(${path}/plf/page/fp/img/revers-h.png);
        }
        
        .bd .main .right .operate div:nth-of-type(5){
            background-image: url(${path}/plf/page/fp/img/empty.png);
        }
        
        .bd .main .right .operate div:nth-of-type(5):hover{
            background-image: url(${path}/plf/page/fp/img/empty-h.png);
        }
        
         .bd .main .right .operate div:nth-of-type(6){
            background-image: url(${path}/plf/page/fp/img/ico-clear.png);
        }
        
        .bd .main .right .operate div:nth-of-type(6):hover{
            background-image: url(${path}/plf/page/fp/img/ico-clear-h.png);
        }
        
        .bd .main .right .operate div:nth-of-type(7){
            background-image: url(${path}/plf/page/fp/img/ico-align-left.png);
        }
        
        .bd .main .right .operate div:nth-of-type(7):hover{
            background-image: url(${path}/plf/page/fp/img/ico-align-hover-left.png);
        }
        
        .bd .main .right .operate div:nth-of-type(8){
            background-image: url(${path}/plf/page/fp/img/ico-align-right.png);
        }
        
        .bd .main .right .operate div:nth-of-type(8):hover{
            background-image: url(${path}/plf/page/fp/img/ico-align-hover-right.png);
        }
        
        .bd .main .right .operate div:nth-of-type(9){
            background-image: url(${path}/plf/page/fp/img/ico-align-top.png);
        }
        
        .bd .main .right .operate div:nth-of-type(9):hover{
            background-image: url(${path}/plf/page/fp/img/ico-align-hovor-top.png);
        }
        
        .bd .main .right .operate div:nth-of-type(10){
            background-image: url(${path}/plf/page/fp/img/ico-align-bottom.png);
        }
        
        .bd .main .right .operate div:nth-of-type(10):hover{
            background-image: url(${path}/plf/page/fp/img/ico-align-hover-bottom.png);
        }
        
        .bd .main .right .operate div:nth-of-type(11){
            background-image: url(${path}/plf/page/fp/img/icon-enlarge.png);
        }
        
        .bd .main .right .operate div:nth-of-type(11):hover{
            background-image: url(${path}/plf/page/fp/img/icon-hover-enlarge.png);
        }
        
        .bd .main .right .operate div:nth-of-type(12){
            background-image: url(${path}/plf/page/fp/img/ico-narrow.png);
        }
        
        .bd .main .right .operate div:nth-of-type(12):hover{
            background-image: url(${path}/plf/page/fp/img/ico-hovor-narrow.png);
        }
        
         .bd .main .right .operate div:nth-of-type(13){
            background-image: url(${path}/buss/images/icon/ico-horizontal-line.png);
        }
        
        .bd .main .right .operate div:nth-of-type(13):hover{
           background-image: url(${path}/buss/images/icon/ico-horizontal-line.png);
        }
        
         .bd .main .right .operate div:nth-of-type(14){
            background-image: url(${path}/buss/images/icon/ico-vertical-line.png);
        }
        
        .bd .main .right .operate div:nth-of-type(14):hover{
           background-image: url(${path}/buss/images/icon/ico-vertical-line.png);
        }
        
        .bd .main .right .operate div:nth-of-type(15){
            background-image: url(${path}/buss/images/icon/ico-slash-line.png);
        }
        
        .bd .main .right .operate div:nth-of-type(15):hover{
           background-image: url(${path}/buss/images/icon/ico-slash-line.png);
        }
        
        
    </style>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		          <div class="optn">
			        <button type="button" onclick="saveFlow();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                        <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                            <jsp:param name="modelName" value="VIEW_TYPE_17" />
                            <jsp:param name="location" value="searchForm" />
                        </jsp:include>
		                <bu:search viewId="7302495b1a9e48d0a591c5cea0d4fce1" />
                   </form>
                </div>  
                <div class="main" >
               	    <div class="left" id="leftImgDetail">
               	    </div>
               	    <div class="right">
               	        <div class="operate">
               	            <div class="item" title="指针"  onclick="gainPointType(this)" ></div>
               	            <div class="item" title="直线" onclick="changeLineType('straight',this)"></div>
               	            <div class="item" title="折线" onclick="changeLineType('broken',this)"></div>
               	             <div class="item" title="翻折" onclick="foldingLine()"></div>
               	            <div class="item" title="删除" onclick="upDelete()"></div>
               	            <div class="item" title="清除" onclick="upClear()"></div>
               	            <div class="item" title="向左对齐"  onclick="alignSide(1)"></div>
               	            <div class="item" title="向右对齐"  onclick="alignSide(2)"></div>
               	            <div class="item" title="向上对齐"  onclick="alignSide(3)"></div>
               	            <div class="item" title="向下对齐"  onclick="alignSide(4)"></div>
               	            <div class="item" title="放大" onclick="changeSceneSize(1)"></div>
               	            <div class="item" title="缩小" onclick="changeSceneSize(2)"></div>
               	           <div class="item" title="横线" onclick="changeLineType('horizontal',this)"></div>
               	           <div class="item" title="直线" onclick="changeLineType('vertical',this)"></div>
               	           <div class="item" title="斜线" onclick="changeLineType('slash',this)"></div>
               	            
               	        </div>
               	        <div id="content" style="width:100%;height:99%;padding-top: 11px;">
					
    	            <canvas width="1000px" height="450" style="border: 1px solid #E4E4E4;margin-left:10px;box-sizing:border-box;" id="canvas" ondrop="drop(event)" ondragover="allowDrop(event)"></canvas>
				
                </div>				
               	    </div>
               	</div>
            </div>
        </div>
    </div>
<div class="dialog-mask" id="addCrcoStecshadow" style="z-index:1029"></div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>
	$(document).ready(function(){
	        var	viewShow = document.getElementById("content");
			var viewShowHeight = viewShow.offsetHeight; //高度
			var viewShowWidth = viewShow.offsetWidth; //宽度
			rulerWidth = 40 //尺子宽度
    		document.getElementById("canvas").height =viewShowHeight-20;
    		document.getElementById("canvas").width =viewShowWidth - rulerWidth;
  			gainToolImg();
  			
		
		});
	/**
	 * 保存数据
	 */
	function saveFlow(){
		var result=saveTopoInfo();	
		//var dataAuth = $("#DATA_AUTH").val();
		var dataAuth = $("#deptLs_data_auth").val();
		result=JSON.stringify(result);
		$.ajax({
            url : "buss/bussModel_exeFunc.ms?funcMId=0073ee4c8b0644b4bba2c25318b5cf2f",
            data : {
                "dataAuth":dataAuth,
            	editType:2,
            	dataInfo:result
            },
            type : "post",
            dataType : "json",
            success : function(data) { 
            	msgPop("保存成功","","摩尔提示",200,150,3000);
			  },
            error : function(msg) {
              util.closeLoading();
              utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
                  0, "300", "");
            }
          });
			
	}
	/**
	 * 展示视图数据
	 */
	function showTopoDataInfo(){
	    var dataAuth = $("#deptLs_data_auth").val();
		$.ajax({
            url : "buss/bussModel_exeFunc.ms?funcMId=0073ee4c8b0644b4bba2c25318b5cf2f",
            data : {
                "dataAuth":dataAuth,
            	editType:1
            },
            type : "post",
            dataType : "json",
            success : function(data) { 
            	var dataList=data.ajaxList;
            	if(dataList.length>0){
            		showTopoData(dataList[0].CONFIG_DATA);
            	}
			  },
            error : function(msg) {
              util.closeLoading();
              utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
                  0, "300", "");
            }
          });
	
	}
	/**
	 * 获取工具栏图片
	 */
	function gainToolImg(){
	    var dataAuth = $("#DATA_AUTH").val();
	    console.log(dataAuth);
		$.ajax({
            url : "buss/bussModel_exeFunc.ms?funcMId=91d03cdf83a0444cac96970d29d7058c",
            data : {"dataAuth":dataAuth},
            type : "post",
            dataType : "json",
            success : function(data) { 
            	var dataList=data.ajaxList;
            	var html="";
             	for(var i=0;i<dataList.length;i++){
             		html+="<div class='item'>";
             		html+="<img src='${path}up_load/comm/"+dataList[i].CFI_PATH+"'  dataType='"+dataList[i].ID+"'  name='${path}up_load/comm/"+dataList[i].CFI_PATH+"'  draggable='true' ondragstart='drag(event)' id='img"+i+"'>";
					html+="<span class='name' >"+dataList[i].CFI_FUNC_NAME+"</span>";		
					html+="</div>";		
				}
				$("#leftImgDetail").html(html);
				showTopoDataInfo();
				console.log(data);
            },
            error : function(msg) {
              util.closeLoading();
              utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
                  0, "300", "");
            }
          });
	
	}
	
	
	
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
