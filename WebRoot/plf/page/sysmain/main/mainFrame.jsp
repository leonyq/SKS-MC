<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="popMsgWin" value="1" />
	<jsp:param name="faviconType" value="1" />
	<jsp:param name="iconfont" value="1" />
</jsp:include>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="layui" value="1" />
</jsp:include>
<title><%=CommMethodMc.getText(ConstantsMc.MC_SHOW_TITLE) %></title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<script type="text/javascript">
		var _$url_type = "1";
</script>

<%@ include file="/plf/common/message.jsp"%>
<style type="text/css">
html,body {
	height: 100%;
}

.search-input{
	display: inline-block;
    vertical-align: middle;
     height: 32px;
     width:450px;
     float:left;
   /* border: none; */
    cursor: text;
}
.search-select > .layui-form-select{
	width:100px;
	color:#666666;
	height:32px ;
}
.search-select .layui-form-select dl {
    top: 32px !important; 
 }
 .search-select .layui-form-select .layui-this:after{
    height: 0 !important;
 }
.search-select{
	 float: left;
   margin-left:0px !important;
}

.layui-form-item{
margin-bottom:0px;
}
.search-select > .layui-form-select > .layui-select-title > .layui-input{
	height:32px !important;
	border-right: none;
}
.search-input-border{
   border-left: none;
}
.search-input-box{
    margin-left: -1px;
  display: inline-block;
  position: relative;
}
.search-input-box i{
    position: absolute;
    color: #000;
    right: 5px;
    top: -8px !important;
}
.search-input-box input::-webkit-input-placeholder{
   color:#666;
}
dl.layui-anim-upbit dd a {
	cursor: pointer;
}
</style>

<script type="text/javascript">
		 var monitorControlSecond=<%=com.more.fw.core.common.method.ReadProperties.getPorpertie("system.properties","MONITOR_CONTROL_SECOND")%>;
 
		if(util.isChrome()){<%-- 如果是谷哥浏览器则增加关闭浏览器时提示功能 --%>
			$(window).bind('beforeunload',function(){
				    return "";
				});
		}
		
			 function getHeight(){
		        	return $(window).height();
		        }
		    //设置箭头的位置   
		    function setHeight(){
		    	$("#arrowId").css("top",getHeight()/2);	
		    }    
		        
	        window.onresize = function(){
	       		setHeight();
	        }		        
		
			$(function(){
				setHeight();	
				$("#arrowId").toggle(
					function(){
						$("#arrowImgId").attr("src","${path}plf/images/arrow-right.png?_mc_res_version=<%=PlfStaticRes.ARROW_RIGHT_PNG%>");
						$(this).attr("title","<dict:lang value="展开菜单" />");
						window.frames._topIframe.bottomFrame.cols = "0,*";
					},function(){
						$("#arrowImgId").attr("src","${path}plf/images/arrow-left.png?_mc_res_version=<%=PlfStaticRes.ARROW_LEFT_PNG%>");
						$(this).attr("title","<dict:lang value="收缩菜单" />");
						window.frames._topIframe.bottomFrame.cols = "230,*";
					}
				);
				
				$("#arrowId").mouseenter(function(){
					$(this).css("left",0);
				});
				$("#arrowId").mouseleave(function(){
					$(this).css("left","-10px");
				});				
			});		
			
			function changeMsg(id){
  				$.post("${path}comm/MsgAction_readHMsg.ms",{"paraMap.id":id});
				//showMsgCount();
			}
		</script>

</head>
<body class="layui-layout-body" style="min-width:1220px;">

	<div id="LAY_app">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header layui-form layui-form-pane">
				<!-- 头部区域 -->
				<ul class="layui-nav layui-layout-left">
					<li class="layui-nav-item layadmin-flexible" lay-unselect><a
						href="javascript:;" layadmin-event="flexible" title="<%=CommMethodMc.getText("侧边伸缩") %>"> <i
							class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
					</a></li>
					<li class="layui-nav-item layui-hide-xs" lay-unselect><a
						href="javascript:window.open(window.location.hash+'${path }fp/FpAction_mainFrameFp.ms')" target="_blank" title="<%=CommMethodMc.getText("访问前台") %>">
							<i class="layui-icon layui-icon-website"></i> </a></li>
					<li class="layui-nav-item" lay-unselect><a href="javascript:;"
						layadmin-event="refresh" title="<%=CommMethodMc.getText("刷新") %>"> <i
							class="layui-icon layui-icon-refresh-3"></i> </a></li>
					
					<%--  <li class="layui-nav-item layui-hide-xs" lay-unselect style="height: auto;"><input
						type="text" placeholder="搜索..." autocomplete="off"
						class="layui-input layui-input-search" layadmin-event="serach"
						lay-action="${path}sys/FuncAction_searchModule.ms?wordkey=">
						</li>  --%>
						
					<li class="layui-nav-item layui-hide-xs" lay-unselect style="height: auto;">
						<div class="layui-form-item">
						 <div class=" search-select"  >
						      <select name="searchType" lay-filter="searchType" style="width:30px;" >
						        <option value="ALL" selected>全部</option>
						        <option value="MODEL">业务模型</option>
						        <option value="COMMCLASS" >公用类</option>
						        <option value="COMMPAGE">公用页面</option>
						        <option value="FUNCMENU">功能菜单</option>
						        <option value="CLASSCODE">类源码</option>
						        <option value="INTERFACE">对外接口</option>
						        <option value="TASK">任务管理</option>
						        <option value="TIMER">触发器</option>
						      </select>
						  </div>
						<div class="search-input-box">
						<input type="text" placeholder="搜索..."   autocomplete="off" class="layui-input search-input search-input-border" layadmin-event="serach" id="wordkey"
						lay-action="${path}search/SearchAction_searchModule.ms?searchType=ALL&wordkey=" style="padding-right:20px;">
						   <i class="layui-icon layui-icon-search" style="position: absolute;cursor: pointer;" layadmin-event="iconSerach"></i>
						 </div>
						  </div>
						</li>
					 
				</ul>
				<ul class="layui-nav layui-layout-right"
					lay-filter="layadmin-layout-right">

					<li class="layui-nav-item" lay-unselect><a
						lay-href="${path}sys/FuncAction_showDevUserFunc.ms?funcDtoSh.id=af968f0513b64cb8972e7b6d27fc8a80&MENU_FC=F404" layadmin-event="message"
						lay-text="消息发送" title="<%=CommMethodMc.getText("消息发送") %>"> <i class="layui-icon layui-icon-notice"></i>

							<!-- 如果有新消息，则显示小圆点  <span class="layui-badge-dot"></span>--> </a></li>
					<li class="layui-nav-item layui-hide-xs" lay-unselect><a
						href="javascript:;" layadmin-event="theme" title="<%=CommMethodMc.getText("换肤") %>"> <i
							class="layui-icon layui-icon-theme"></i> </a></li>
					<!--  
					<li class="layui-nav-item layui-hide-xs" lay-unselect><a
						href="javascript:;" layadmin-event="note"> <i
							class="layui-icon layui-icon-note"></i> </a></li>
					-->
					<li class="layui-nav-item layui-hide-xs" lay-unselect><a
						href="javascript:;" layadmin-event="fullscreen" title="<%=CommMethodMc.getText("全屏") %>"> <i
							class="layui-icon layui-icon-screen-full"></i> </a></li>
					<li class="layui-nav-item" lay-unselect><a href="javascript:;">
							<cite><s:property
								value="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].name}" /></cite> </a>
						<dl class="layui-nav-child">
							<dd style="text-align: center;">
								<a onclick="exit()"><dict:lang value="退出" /></a>
							</dd>
						</dl></li>

					<li class="layui-nav-item layui-hide-xs" id="mcVersion" lay-unselect><a
						href="javascript:;" layadmin-event="about"><i
							class="layui-icon layui-icon-more-vertical"></i>
					</a></li>
					<li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm"
						lay-unselect><a href="javascript:;" layadmin-event="more"><i
							class="layui-icon layui-icon-more-vertical"></i>
					</a></li>
				</ul>
			</div>

			<!-- 侧边菜单 -->
			<div class="layui-side layui-side-menu">
				<div class="layui-side-scroll">
					<div class="layui-logo" lay-href="home/console.html">
						<span></span>
					</div>

					<ul class="layui-nav layui-nav-tree" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu" lay-shrink="all"></ul>
				</div>
			</div>

			<!-- 页面标签 -->
			<div class="layadmin-pagetabs" id="LAY_app_tabs">
				<div class="layui-icon layadmin-tabs-control layui-icon-prev"
					layadmin-event="leftPage"></div>
				<div class="layui-icon layadmin-tabs-control layui-icon-next"
					layadmin-event="rightPage"></div>
				<div class="layui-icon layadmin-tabs-control layui-icon-down">
					<ul class="layui-nav layadmin-tabs-select"
						lay-filter="layadmin-pagetabs-nav">
						<li class="layui-nav-item" lay-unselect><a
							href="javascript:;"></a>
							<dl class="layui-nav-child layui-anim-fadein">
								<dd layadmin-event="closeThisTabs">
									<a href="javascript:;"><%=CommMethodMc.getText("关闭当前标签页") %></a>
								</dd>
								<dd layadmin-event="closeOtherTabs">
									<a href="javascript:;"><%=CommMethodMc.getText("关闭其它标签页") %></a>
								</dd>
								<dd layadmin-event="closeAllTabs">
									<a href="javascript:;"><%=CommMethodMc.getText("关闭全部标签页") %></a>
								</dd>
							</dl></li>
					</ul>
				</div>
				<div class="layui-tab" lay-unauto lay-allowClose="true"
					lay-filter="layadmin-layout-tabs">
					<ul class="layui-tab-title" id="LAY_app_tabsheader">
						<li lay-id="home/console.html" lay-attr="home/console.html"
							class="layui-this"><i class="layui-icon layui-icon-home"></i>
						</li>
					</ul>
				</div>
			</div>


			<!-- 主体内容 -->
			<div class="layui-body" id="LAY_app_body" style="overflow-x:auto">
				<div class="layadmin-tabsbody-item layui-show">
					<iframe src="${path}plf/page/sysmain/main/console.jsp" frameborder="0"
						class="layadmin-iframe"></iframe>
				</div>
			</div>

			<!-- 辅助元素，一般用于移动设备下遮罩 -->
			<div class="layadmin-body-shade" layadmin-event="shade"></div>
		</div>
	</div>
  
  <script>
  layui.config({
    base: '${path}plf/style/layui/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use('index',function(){
	  var element = layui.element;
	  $.ajax({
			type: "POST",
		    dataType: "json",
		    url: "${path}sys/FuncAction_listUserPlfFuncByZtree.ms",
			success: function(data){
				if(data){
					//console.log(data.ajaxList);
					var menuObj = {
							resultData: data.ajaxList,
							menuList:""
					};
					
					//整理二位数组 [[level=1数组],[level=2数组],[level=3数组]...]
					function getArrLevel(data){
						var arr_level = [];
						var arr_obj_index = {};
						var DEFAULT_INDEX = 0;
						for(var i=0; i<data.length; i++){
							var level = data[i].level;
							if(arr_obj_index["level_"+level]){
								arr_obj_index["level_"+level].push(data[i]);
							}
							else {
								arr_obj_index["level_"+level] = [];
								arr_obj_index["level_"+level].push(data[i]);
							}
							//eval("var arr_"+result_data[i].level)
						}
						for(var obj in arr_obj_index){
							arr_level.push(arr_obj_index[obj])
						}
						return arr_level;
					}
					
					//拼接菜单栏字符串
					function showTree(obj){
						if(obj["level"] ==1){
							//str+= '<li class="layui-nav-item"><a href="javascript:;"lay-href="/mc/sys/FuncAction_showDevUserFunc.ms?funcDtoSh.id='+obj["id"]+'&MENU_FC='+obj["funcCode"]+'"> <i class="layui-icon layui-icon-set"></i> <cite>'+ obj["name"]+'</cite>';
							if(obj["chilsTreeViews"].length >0){
								menuObj.menuList+= '<li class="layui-nav-item"><a lay-tips="'+obj["name"]+'" lay-direction="2"> <i class="mc-font '+ obj["menuIcon"] +'"></i> <cite>'+ obj["name"]+'</cite>';
								menuObj.menuList+='<span class="layui-nav-more"></span></a><dl class="layui-nav-child">';
								var arr_1 = obj["chilsTreeViews"]
								for(var i=0; i<arr_1.length; i++){
									showTree(arr_1[i]);
								}
								menuObj.menuList+="</dl>";
							}
							else {
								menuObj.menuList+= '<li class="layui-nav-item"><a lay-tips="'+obj["name"]+'" lay-href="${path}sys/FuncAction_showDevUserFunc.ms?funcDtoSh.id='+obj["id"]+'&MENU_FC='+obj["funcCode"]+'" lay-direction="2" data-openType='+obj["openType"]+'> <i class="mc-font '+obj["menuIcon"]+'"></i> <cite>'+ obj["name"]+'</cite>';
								menuObj.menuList+='</a>';
							}
							menuObj.menuList+='</li>';
							return;
						}
						else {
							//str+='<dd><a href="javascript:;">'+obj["name"];
							if(obj["chilsTreeViews"].length >0){
								menuObj.menuList+='<dd><a class="mc-pointer"><i class="mc-font '+ obj["menuIcon"] +'"></i><cite>'+obj["name"];
								menuObj.menuList+='</cite><span class="layui-nav-more"></span></a><dl class="layui-nav-child">';
								var arr_2 = obj["chilsTreeViews"];
								for(var j=0; j<arr_2.length; j++){
									showTree(arr_2[j]);
								}
								menuObj.menuList+="</dl>";
							}
							else {
								menuObj.menuList+='<dd><a lay-href="${path}sys/FuncAction_showDevUserFunc.ms?funcDtoSh.id='+obj["id"]+'&MENU_FC='+obj["funcCode"]+'"  data-openType='+obj["openType"]+'><i class="mc-font '+ obj["menuIcon"] +'"></i><cite>'+obj["name"];
								menuObj.menuList+='</cite></a></dd>';
								return;
							}
						}
					}
					
					//左侧菜单栏
					;!function(){
						var ArrLevel = getArrLevel(menuObj.resultData);
						for(var i=0; i<ArrLevel[0].length; i++){
							showTree(ArrLevel[0][i]);
						}
						
						$("#LAY-system-side-menu").html(menuObj.menuList);
						element.render("nav");
						
					}() 
					
				}
		    },
			error: function(msg){
					util.alert("error:"+msg.responseText);
			}
		});
	  
	  
  }).use('form', function(){
  	  var form = layui.form;
  	  
  	  form.on('select(searchType)', function(data){
  	  
  	  var url="${path}search/SearchAction_searchModule.ms?";
  	  
  	  var currVal = data.value;
  	  
  	  var urlAction = url+"searchType="+currVal+"&wordkey=";
		  
	$("#wordkey").attr("lay-action",urlAction);
	});

  	  form.render();
  });
  
  
  </script>
  
  <script>
  function exit(){
	  util.confirm(exit_run,"<dict:lang value="确认退出系统吗？" />",null);
	}
  
  function exit_run(){
	  var url = "${path}sys/LoginAction_logout.ms?__random__timeSeq="+new Date();
		window._canClose();
		window.top.location.href = url;
  }
  
  var mcVersion = "<%=com.more.fw.core.common.method.ConstantsMc.VERSION_NO%>";
   
   //$("#currentVersion").html("当前版本："+currentVersion);
  </script>
  <script
	src="${path}/plf/js/common/monitor.sysmain.main.page.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>
</body>
</html>