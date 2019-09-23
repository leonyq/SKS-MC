<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@ include file="/plf/common/pub_cloud.jsp"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<html>
<head>
<%
  
%>
<script type="text/javascript">
	var zcount=1000;  
    var monitorControlSecond=<%=com.more.fw.core.common.method.ReadProperties
					.getPorpertie("system.properties", "MONITOR_CONTROL_SECOND")%>;
 
	</script>

<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
	<jsp:param name="spectrum" value="1" />
	<jsp:param name="popMsgWin" value="1" />
	<jsp:param name="smartMenu" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<title><%=StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("text_title3"))%></title>
<script type="text/javascript">
	    	var _$url_type = "0";
	    </script>
<%@ include file="/plf/page/fp/messageFp.jsp"%>
<link rel="stylesheet"
	href="${path}/plf/page/fp/css/jquery.mCustomScrollbar.css?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CSS %>"
	type="text/css" />
	

<script
	src="${path}/plf/js/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>
<style type="text/css">
body {
	overflow: hidden;
}

#fp_menu .mCSB_scrollTools {
	width: 0px;
}

#fp_menu:hover .mCSB_scrollTools {
	width: 12px;
}

#fp_menu .mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
	background: #fff;
	opacity: 0.2;
}

.imA {
	width: 100px;
	height: 33px;
	overflow: hidden;
}
.imFrame {
	border: 0;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="topbar">
			<div class="topbar-in">
				<a href="javascript:void(0);"
					onclick="switchTag('tag1','content1','${path}plf/page/fp/index.jsp');this.blur();"
					class="logo"><img
					src="${path}<%=StringUtilsMc.toString( ConstantsMc.CUSTCONFIG_MAP.get("logo_tab_index"))%>"
					width="110" height="20" alt="" /> </a>
				<div class="nav">
					<div class="nav-in js-nav" id="navId">
						<div class="item" id="tag1" data-id="1">
							<a href="javascript:void(0);" id="selectli1"
								onclick="switchTag('tag1','content1','${path}plf/page/fp/index.jsp');this.blur();"
								class="slick-slide cur"><img
								src="${path}plf/page/fp/img/ico-home-s.png?_mc_res_version=<%=PlfStaticRes.ICO_HOME_S_PNG %>"
								width="12" height="10" alt="" /> <dict:lang value="首页" /> </a>
						</div>
						<span class="slick-prev"></span> <span class="slick-next"></span>
					</div>
				</div>
				<div class="user">
					<span class="arrow-down" onclick="toggleUserDrop();"></span>
					<div class="info" id="infoDiv" onclick="toggleUserDrop();">
						<img
							src="${path}plf/page/fp/img/tx.jpg?_mc_res_version=<%=PlfStaticRes.TX_JPG %>"
							id="photoId" width="25" height="25" style="top:0" alt="" /> <span class="name">
							<s:property
								value="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].name}" />
							<!-- <a href="javascript:void(0);" onclick="upMyUser();" title="<dict:lang value="个人信息修改" />">
									<s:property value="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].name}" />
								</a> --> </span>
					</div>
					<div class="user-drop">
						<div id="doList"></div>

					</div>
				</div>
				<div class="state">
					<div class="s4" onclick="menuSearch();" title="<%=CommMethodMc.getText("菜单搜索") %>"></div>
					
					<div class="s1">
						<!-- 换肤 -->
						
						<div class="s1-drop">
							<span class="green"
								onclick="switchTheSkin('style_green')"></span>
							<span class="red"
								onclick="switchTheSkin('style_red')"></span>
							<span class="deep"
								onclick="switchTheSkin('style_deep')"></span>
						</div>
					
					</div>
					
					<div class="s2">
						<div class="s2-drop">
							<%-- <a href="javascript:void(0);" onclick="upMyUser();" title="<dict:lang value="用户信息" />"><i class="ico ico-zx"></i><dict:lang value="用户信息" /></a>
                    <a href="javascript:void(0);" onclick="openDevPg();" title="<dict:lang value="转到开发平台" />"><i class="ico ico-development"></i><dict:lang value="开发平台" /></a> 
                    <a href="javascript:void(0);" title="<dict:lang value="我的消息" />"><span class="count">10</span><dict:lang value="我的消息" /></a>--%>
							<a href="javascript:void(0);" onclick="showMsgData();"
								title="<dict:lang value="我的消息" />"><span id="msgCountLabel"></span>
								<dict:lang value="我的消息" /> </a> <a href="javascript:void(0);"
								onclick="showUserSetting();" title="<dict:lang value="用户设置" />"><i
								class="ico ico-user-set"></i> <dict:lang value="用户设置" /> </a> <a
								href="javascript:void(0);" onclick="flushIndex();"
								title="<dict:lang value="刷新首页" />"><i
								class="ico ico-refresh"></i> <dict:lang value="刷新首页" /> </a>
								<%if("1".equals(CommMethodMc.getIsOpenAuth())){%>
									<a href="javascript:void(0);" onclick="showOrganization();"
									title="<dict:lang value="组织机构" />"><i
									class="ico ico-organization"></i> <dict:lang value="组织机构" /> </a>
								<%} %>
							
							<c:if test="${cloud_mod ne '0'}">
								<a href="javascript:void(0);" onclick="gotoCloud();"
									title="<dict:lang value="摩尔云" />"><i
									class="ico ico-more-cloud"></i> <dict:lang value="摩尔云" /> </a>
							</c:if>
							<a href="#" onclick="exit();return false;"><i
								class="ico ico-off"></i> <dict:lang value="退出系统" /> </a>
							<a href="#" onclick="return false;" class="imA" id="im_aid">
								<iframe src="" class="imFrame"></iframe>
							</a>
								

						</div>
						<div class="roundDot"></div>
					</div>
					<a href="javascript:void(0);" id="fullScreenBtn" class="s3"></a>
				</div>
			</div>
		</div>


		<div class="content">
			<div id="content">
				<div id="content1">
					<iframe id="iframe1" name="iframe1"
						src="${path}sys/UserTargetDataAction_goToIndex.ms" frameBorder="0"
						width="100%" onload="dynIframesize('iframe1');"> </iframe>
				</div>
			</div>
		</div>
		<ul class="menu" id="fp_menu">

		</ul>
		<!-- content end -->
	</div>
	<input type="hidden" id="_mcDataAuth" value="<c:out value="${sessionScope.mcDataAuth}"/>"/><!-- 存放当前登录权限，以备切换组织机构时能获取最新的，切换组织机构够后，showOrganization.jsp页面会更新此值 -->
	<div id="cls"></div>
	<script type="text/javascript">
	    var page;//二级菜单当前页
	    var pageLiCount;//每页的li个数
	    var liCount;//li的总个数
	    var pageCount;//共多少页
	    var timerEnter = null; //定时器进入
		var timerOut = null; //定时器离开
	    //下拉显示
	    function toggleUserDrop(){
	    	$(".user-drop").toggle(
		    		function(){
						//console.log(this.);
						if($(".topbar-in .user span").hasClass("arrow-down")){
			    			//$(".topbar-in .user span").addClass("arrow-up").removeClass("arrow-down");
			    			$(".topbar-in .user .arrow-down").remove();
			    			$(".topbar-in .user").prepend("<span class=\"arrow-up\" onclick=\"toggleUserDrop();\"></span>");
			    			$(".topbar-in .user ").css({"border-left":"1px solid #d9d9d9","border-right":"1px solid #d9d9d9","border-top":"1px solid #d9d9d9"});
			    			
			    			

						}else{
			    			$(".topbar-in .user ").css({"border-left":"","border-right":"","border-top":""});
		    			
		    				
		    				
			    			$(".topbar-in .user .arrow-up").remove();
			    			$(".topbar-in .user").prepend("<span class=\"arrow-down\" onclick=\"toggleUserDrop();\"></span>");
			    			
		    				/*$(".topbar-in .user span").removeClass("arrow-up").addClass("arrow-down");*/
						}
		    		}	    		
		    	);	    	
	    }
	    
	    $(".user-drop").mouseout(function () {
            var s = event.toElement || event.relatedTarget;
            if (!this.contains(s)) { $(this).hide("slow"); }
        });

	    //全屏
	    function fullScreen(){
	    	var el = document.documentElement;
	    	var rfs = el.requestFullScreen || el.webkitRequestFullScreen || el.mozRequestFullScreen || el.msRequestFullScreen;
	    	
	    	if(typeof rfs != "undefined" && typeof rfs != undefined && rfs){
	    		
	    		rfs.call(el);
	    		
	    	}else if(typeof window.ActiveXObject != "undefined" && typeof window.ActiveXObject != undefined){
	    		//for Ie
	    		var wscript = new ActiveXObject("WScript.Shell");
	    		if(wscript != null){
	    			wscript.SendKeys("{F11}");
	    		}
	    		
	    	}
	    }
	    
	    //退出全屏
	    function exitFullScreen() {
			  var el = document;
			  var cfs = el.cancelFullScreen || el.webkitCancelFullScreen ||
			      el.mozCancelFullScreen || el.exitFullScreen;
			  if(typeof cfs != "undefined" && cfs) {
			    cfs.call(el);
			  } else if(typeof window.ActiveXObject != "undefined") {
			    //for IE，这里和fullScreen相同，模拟按下F11键退出全屏
			    var wscript = new ActiveXObject("WScript.Shell");
			    if(wscript != null) {
			        wscript.SendKeys("{F11}");
			    }
			  }
		}
	    //刷新首页
	    function flushIndex(){
	    	document.getElementById("iframe1").src="${path}sys/UserTargetDataAction_goToIndex.ms";
	    	addNineFunc();
	    	switchTag('tag1','content1','${path}plf/page/fp/index.jsp');
	    	 var photoName = "<s:property value="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].photoName}" />";
	    	 if(photoName != null && photoName != ""){
					$("#photoId").attr("src","${path}plf/userPhoto/"+photoName+"?"+Math.random());
		       }else{
		       		$("#photoId").attr("src","${path}plf/images/user.png");
		       }
	    }
	    function addNineFunc(){
	    	var url="${path}sys/FootPlatformAction_ajaxQueryComList.ms";
	    	$.ajax({
	    		type: "POST",
			    dataType: "json",
			    url: url,
				success: function(data){
	    			var nineCommList=data.ajaxList
	    			var nineCommHtml="";
	    			var picPath=${path}
	    			var funcCode=null;
	    			var url=null;
	    			for(var i=0;i<nineCommList.length;i++){
	    				var j=i+1;
	    				
	                  	if(nineCommList[i].showOrder==j){
	                  			url=nineCommList[i].url;
	                  			if(url!=null&&url!=undefined){
		                  			if(url.indexOf("?exeid=")==-1||url.indexOf("?")==-1){
		                  				funcCode="?FUNC_CODE="+nineCommList[i].funcCode;
		                  			}else{
		                  				funcCode="&FUNC_CODE="+nineCommList[i].funcCode;
		                  			}
	                  			}
	                  			nineCommHtml+=" <div class=\"item\"  title='"+nineCommList[i].menuName+"'>"
	                  				+"<a href=\"javascript:void(0);\" onclick=\"addUserTab('"+picPath+nineCommList[i].url+funcCode+"','"+nineCommList[i].menuName+"','"+nineCommList[i].menuId+"')\"  class=\"con\"  >"
			   	                if(nineCommList[i].img!=null){
			   	                	nineCommHtml+="<img src='"+picPath+nineCommList[i].img+"?_mc_res_version=<%=PlfStaticRes.NINE_COMM_LIST_IMG%>' width=\"36\" height=\"36\" alt=\"\" />"	                 			  	
			   	                 }else{
			   	                  	nineCommHtml+="<img src='"+picPath+"plf/page/fp/img/ico-menu-default.png?_mc_res_version=<%=PlfStaticRes.ICO_MENU_DEFAULT_PNG%>' width=\"36\" height=\"36\" alt=\"\" />"
			   	                  	//模块没图标时
			   	                  	
			   	                 }
	                  			nineCommHtml+="	<span style=\"white-space: nowrap;overflow:hidden;text-overflow: ellipsis;\" class=\"tt\" >"+nineCommList[i].menuName+"</span>"
	                  			+" </a>"     			 
		                  		+" </div> "
	                  	}else{
	                  			nineCommHtml+="<div class=\"item\" >"
		                  				+"<a href=\"javascript:void(0);\"  class=\"con\"  >"
			   		                    +"<img src='"+picPath+"plf/page/fp/img/sudoku.png?_mc_res_version=<%=PlfStaticRes.SUDOKU_PNG%>' width=\"36\" height=\"36\" style=\"padding-top:12px;\" alt=\"\"  />"
			   		                    +" </a>	"	     			 
		   	             			+"</div>"
	   	             	}
	    			}
	    			$("#doList").html(nineCommHtml);
	    		},
	    		error: function(data){
	    			util.closeLoading();
					util.alert("error:"+data);
			  	}	
	    		
	    	});
	    }
	    function addUserTab(url,name,id){
	    	$(".user-drop").toggle(
		    		function(){
						//console.log(this.);
						if($(".topbar-in .user span").hasClass("arrow-down")){
			    			//$(".topbar-in .user span").addClass("arrow-up").removeClass("arrow-down");
			    			$(".topbar-in .user .arrow-down").remove();
			    			$(".topbar-in .user").prepend("<span class=\"arrow-up\" onclick=\"toggleUserDrop();\"></span>");
			    			$(".topbar-in .user ").css({"border-left":"1px solid #d9d9d9","border-right":"1px solid #d9d9d9","border-top":"1px solid #d9d9d9"});
			    			
			    			$(".topbar-in .user .info ").css("padding-bottom","10px");

						}else{
			    			$(".topbar-in .user ").css({"border-left":"","border-right":"","border-top":""});
		    			
		    				$(".topbar-in .user .info ").css("padding-bottom","");	
		    				
			    			$(".topbar-in .user .arrow-up").remove();
			    			$(".topbar-in .user").prepend("<span class=\"arrow-down\" onclick=\"toggleUserDrop();\"></span>");
			    			
		    				/*$(".topbar-in .user span").removeClass("arrow-up").addClass("arrow-down");*/
						}
		    		}	    		
		    	);	    	
	    	addTab(url,name,id);
	    }
			function exit(){
				//utilsFp.confirmIcon("1",exitSys,"<dict:lang value="确定退出系统吗" />",null);
				utilsFp.confirmIcon("1","","exitSys","","<dict:lang value="您确定要安全退出本次登录吗" />？","1",320,150);
			}
			function exitSys(){
				var url = "${path}fp/FpAction_logoutFp.ms?__random__timeSeq="+new Date();
				_canClose();
				window.location.href = url;
			}
			
			function upMyUser(){
				var url = "${path}sys/UserAction_showUpMyUser.ms";
				showPopWinFp(url, 305, 205,null,"<dict:lang value="个人信息修改"/>");
				//window.location.href = url;
			}
			
			function showUserSetting(){
				var url = "${path}sys/UserAction_showUserSetting.ms";
				showPopWinFp(url, 800, 576,null,"<dict:lang value="用户设置"/>","userSettingIframeId");
				//window.location.href = url;
			}
			
			function showOrganization(){
				var url = "${path}sys/UserAction_showOrganization.ms";
				showPopWinFp(url, 600, 423,null,"<dict:lang value="组织机构选择"/>");
			}
			
			//我的消息标签页
			function showMsgData(){
				addTab("${path}comm/MsgAction_fpShowList.ms","<dict:lang value="我的消息"/>","messagerPage");
			};
			
			//菜单搜索
			function menuSearch(){
				addTab("${path}plf/page/fp/menuSearch.jsp","<dict:lang value="菜单搜索"/>","menuSearchPage");
			};
			
			//我的消息标签页数量
			function showMsgCount(){
				var url = "${path}comm/MsgAction_msgCount.ms";
				$.post(url,null,function(data){
				 var count = data.ajaxStr;
				 var htmlStr;
				 if(count==0){
				 	htmlStr="<i class=\"ico ico-my-msg\"></i>";
				 }else{
				    htmlStr="<span class=\"count\">"+count+"</span>";
				 }
				 $("#msgCountLabel").html(htmlStr);
				});
			}
			
			<%-- 
			function openDevPg(){
				var url = "${path}sys/LoginAction_mainFrame.ms";
				window.open(url);
			}		--%>
			
			function gotoCloud(){
				//var url = "${userCenterAddress}/static/auth/login.html?platform=1&mcMask=${serverMask}";
				//window.open(url);
				var params={};
				$.ajax({
					url:"${path}sys/UserAction_getAccessToken.ms",
					type:"post",
					dataType: "json",
					data: params,
 					success:function(data) {
 						if(data.ajaxMap.flag=="success"){
 							window.location.href=data.ajaxMap.url;
 						}else{
 							utilsFp.confirmIcon(3,"","","", "<dict:lang value="获取用户中心的AccessToken失败" />","","260","145");	
 						}
 						
 					},
 					error:function(data) {
 						isSubmit = false;
 						utilsFp.confirmIcon(3,"","","", data,"","300","145");
 					}
 				});
			}
			
			//父级字体颜色保持不变
			function parentFontShow(e){
				var self = e;
				$(self).prev().addClass('fontColor');
				$(self).prev().addClass('after');
			}
			//移开后还原
			function parentFontHide(e){
				var self = e;
				$(self).prev().removeClass('fontColor');
				$(self).prev().removeClass('after');
			}
			
			//显示菜单
			function showSub(id,sub,e){

				var self = e;
				if(sub == "sub_"){
					$("#"+sub+id).show();
					
					page = 0;
					pageLiCount =  parseInt(( $("#"+sub+id).height() - 5) / 50);//每页的li个数
					liCount = $("#"+sub+id).children('li').length;//总共的li个数
					pageCount = parseInt((liCount - 1) / pageLiCount);//共多少页
					
					$("#"+sub+id).children('.triangle_up').css('display','none');
					$("#"+sub+id).children('.triangle_down').css('display','none');   //初始隐藏
					$("#"+sub+id).children('li').css('display','block');
					if(pageLiCount < liCount){   //当每页可存放的项小于总的项数时，显示下一页按钮，居中显示
						
						$("#"+sub+id).children('.triangle_down').addClass('triangle_center').css('display','block');
						$("#"+sub+id).children('li').css('display','none');
						$("#"+sub+id).children('li').slice(0,pageLiCount).css('display','block');
					}
				}
				
				
				if(sub == "sub_sub_"){
					//$("#"+sub+id).show();
					clearTimeout(timerEnter);
					timerEnter = setTimeout(function(){
						//显示前将所有三级菜单先全部隐藏 
						$(self).parent().find(".menu-sub-sub").css("display","none");
						$("#"+sub+id).show();
					},200)
					
					
					 if($(self).hasClass('item-sub-active')){
					 	
					 	 $(self).children('a').addClass('after')
					 	 $('<div>').addClass('triangle').appendTo($(self).children('a'));
					 }
					 
					 $('.menu-sub-sub').mCustomScrollbar({
				          scrollInertia:150
				     });
				}
			}
			
			//隐藏菜单
			function hideSub(id,sub,e){
				var self = e;
				//$("#"+sub+id).hide();
				if(sub == "sub_"){
					$("#"+sub+id).hide();
				}
				if(sub == "sub_sub_"){
					clearTimeout(timerOut);
					timerOut = setTimeout(function(){
						$("#"+sub+id).hide();
					},200)
					$(self).children('a').removeClass('after');
					$(self).children('a').children('div').remove();
					 
					 //$(".menu-sub-sub").mCustomScrollbar("destroy");
				}
			}
			
			//上一页(二级菜单)
			function turnUp(e){
				if(page > 0){
					page--;
				}
				if(page == 0){ //若是第一页，则显示向下按钮，隐藏向上按钮
					$(e).css('display','none');
					$(e).parent().children('.triangle_down').addClass('triangle_center').css('display','block');
				}else{ //若是其他情况，都显示，且移除居中显示
					$(e).removeClass('triangle_center').css('display','block');
					$(e).parent().children('.triangle_down').removeClass('triangle_center').css('display','block');
				}
				
				changContent(e);
			}
			
			//下一页(二级菜单)
			function turnDown(e){
				if(pageCount > page){
					page++;
				}
				if(pageCount == page){  //若是最后一页，则显示向上按钮，隐藏向下按钮
					$(e).css('display','none');
					$(e).parent().children('.triangle_up').addClass('triangle_center').css('display','block');
				}else{    //其他情况都显示，且移除居中显示
					$(e).removeClass('triangle_center').css('display','block');
					$(e).parent().children('.triangle_up').removeClass('triangle_center').css('display','block');
				}
								
				changContent(e);
			}
			
			//改变内容(二级菜单)
			function changContent(e){
				$(e).parent().children('li').css('display','none');
				$(e).parent().children('li').slice(page * pageLiCount, (page + 1) * pageLiCount).css('display','block');
			}
			
			
			<%--获取前台菜单 --%>
			function getFpMenu(){
				var url = "${path}sys/FuncAction_getStrongFpMenu.ms";
				util.showLoading("<dict:lang value="加载中" />...");
				$.ajax({
					type: "POST",
				    dataType: "json",
				    url: url,
				    //data: "paraMap.sql="+val2,//+upColId,
					success: function(data){
							util.closeLoading();
							var menuHtml = "<li class=\"item-logo item-home\" style=\"cursor:pointer;\">"
								           +"     <a class=\"item-in\" href=\"javascript:void(0);\" onclick=\"switchTag('tag1','content1','${path}plf/page/fp/index.jsp');this.blur();\">"
							               +"     	<img src=\"${path}<%=StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("logo_menu_index"))%>\" width=\"28\" height=\"24\" style=\"margin-top: 10px;\"/>"
							               +" 	</a>"
							               +"</li>";
							if(null != data.ajaxList){
								var menuHtmlSub = "";//二级菜单
								var menuHtmlSubSub = "";	//三级菜单 
								var aList = eval(data.ajaxList);
								var countSub = 0;//二级菜单计数
								var countSubSub = 0;//三级菜单计数
								var subCls = "";//子菜单样式
								var menuHtml2 = "";
								for(var i = 0;i < aList.length; i++){
									var menuUrl = "";
									var img = "";
									var subMenuId = "";
									var styleP = "";									
									if(aList[i].type == "1"){
									    <%-- 目前修改成统一走后台功能跳转 --%>
										var funcUrl = "${path}sys/FuncAction_shoUserFunc.ms?funcDtoSh.id="+aList[i].id+"&MENU_FC="+aList[i].funcCode;
										var connStr = "?";
										if(null!=funcUrl && funcUrl.indexOf("?")>0){
											connStr = "&";
										}
										menuUrl = " onclick=\"addTab('"+funcUrl+connStr+"FUNC_CODE="+aList[i].funcCode+"','"+aList[i].name+"','"+aList[i].id+"',"+aList[i].openType+")\" ";
									}else{
										menuUrl = "";
									}

									if(aList[i].level == "1"){
										if(aList[i].img != "" && aList[i].img != null){
											img = "  <img src=\"${path}"+aList[i].img+"?_mc_res_version=<%=PlfStaticRes.ALIST_IMG%>\" width=\"32\" height=\"34\" />";
										}
						            	if(countSubSub > 0){
						            		countSubSub = 0;
						            		menuHtml2 += "</ul>";
						            	}									               
										if(countSub > 0){
											countSub = 0;
											menuHtml2 += "</ul>";
										}
										menuHtml+="<li class=\"item\" style=\"cursor:pointer;\" id=\"m_"+aList[i].id+"\"  onmouseenter=\"showSub('"+aList[i].id+"','sub_',this);\" onmouseleave=\"hideSub('"+aList[i].id+"','sub_',this)\">"
										           +"     <a class=\"item-in\" "+menuUrl+" >"
									               //+"     	<img src=\"${path}"+aList[i].img+"\" width=\"32\" height=\"34\" />"
									               +img
									               +"<p>"+aList[i].name+"</p>"	
									               +" 	</a>";
									               
									   if(aList[i].type == "1" || i == (aList.length - 1)){
										   menuHtml += "</li>";
									   }

									   }else if(aList[i].level == "2"){
											if(aList[i].type == "0"){
												subCls = "item-sub-active";
											}else{
												subCls = "";
											}
						            	
							            	if(countSubSub > 0){
							            		countSubSub = 0;
							            		menuHtml2 += "</ul>";
							            	}								
										
											if(countSub == 0){
												menuHtml2 +="<ul class=\"menu-sub\" id=\"sub_"+aList[i].upId+"\" style=\"display:none;\"><div class='triangle_up' onclick='turnUp(this)'></div>&nbsp;&nbsp;&nbsp;<div class='triangle_down' onclick='turnDown(this)'></div>";
											}
										
										
											if(aList[i].img != "" && aList[i].img != null){
												img = "<img src=\"${path}"+aList[i].img+"?_mc_res_version=<%=PlfStaticRes.ALIST_IMG%>\" width=\"20\" height=\"20\" alt=\"\" />";
											}else{
												img = "<img src='${path}plf/page/fp/img/ico-menu-default.png?_mc_res_version=<%=PlfStaticRes.ICO_MENU_DEFAULT_PNG%>' width='20' height='20'>";
											}
										
											menuHtml2 +="<li class=\"item-sub "+subCls+"\"  title=\""+aList[i].name+"\" style=\"cursor:pointer;\" onmouseenter=\"showSub('"+aList[i].id+"','sub_sub_',this);\" onmouseleave=\"hideSub('"+aList[i].id+"','sub_sub_',this)\">"
						              				+"	<a "+menuUrl+"style='position: relative;'>"
						              				+img
						              				+aList[i].name+"<span></span></a>";
										    if(aList[i].type == "1" || i == (aList.length - 1)){
											    menuHtml2 += "</li>";
										    }						              				
						            				
						            		countSub ++;
											
										}else if(aList[i].level == "3"){
											
											
											if(countSubSub == 0){
												menuHtml2 += "<ul class=\"menu-sub-sub\" id=\"sub_sub_"+aList[i].upId+"\" style=\"display:none;\" onmouseenter='parentFontShow(this)' onmouseleave='parentFontHide(this)'>"
											}
											menuHtml2 += "<li class=\"item-sub-sub\" style=\"cursor:pointer;\" title=\""+aList[i].name+"\"><a "+menuUrl+">"+aList[i].name+"</a></li>";
											countSubSub ++;
							            	if(i == (aList.length - 1)){
							            		menuHtml2 += "</ul></li></ul></li>";
							            	}
										}
								}
							}
							
							$("#fp_menu").append(menuHtml);
							$(".wrap").append(menuHtml2);
							$('#fp_menu').mCustomScrollbar({
							    axis:"y",
								snapAmount:80,
								theme:"minimal-dark",
								keyboard:{scrollAmount:40},
								mouseWheel:{deltaFactor:40,preventDefault:true},
								scrollInertia:100,
								autoHideScrollbar:true
						    });
						},
					error: function(msg){
							util.closeLoading();
							util.alert("error:"+msg);
					  }
					});				
				
			}
			
			//tab滑动初始化
			function slickInit(){
				var width = 0;
				$('.js-nav').slick({
		            dots: false,
		            autoplay: false,
		            infinite:false,
		            arrows:false,
		            slidesToScroll:1,
		            slidesToShow:8,     
		        });	
		        
				var slickLegth = $('.slick-track').children().length;//tab个数
		        for(var i = 1;i <= slickLegth;i++){
		        	width += $('.slick-track').children(i).width();
		        }
		        $('.slick-track').css('min-width',width + 'px');
		        
		        if(slickLegth > 8 ){//如果tab个数大于8个，则显示新添加的tab
		        //console.log(slickLegth);
					var newLeft = $('.slick-list').scrollLeft() + width;
					$('.slick-list').animate({scrollLeft:newLeft},300);
			    } 
			}
			
			//tab上一页
			$('.slick-prev').click(function(){
				var newLeft = $('.slick-list').scrollLeft() - $('.slick-track').children(1).width();
				$('.slick-list').animate({scrollLeft:newLeft},300);		
			})
			
			//tab下一页
			$('.slick-next').click(function(){
				var newLeft = $('.slick-list').scrollLeft() + $('.slick-track').children(1).width();
				$('.slick-list').animate({scrollLeft:newLeft},300);
			})
			
			//鼠标移到二级菜单时使得对应的一级菜单高亮，移开时取消
			$('.wrap').on('mouseover','.menu-sub',function(){
				$(this).css('display','block')
				var id = $(this).attr('id').substr(4)
				$('#m_' + id).addClass('hoverColor')
			})
			
			$('.wrap').on('mouseout','.menu-sub',function(){
				$(this).css('display','none')
				var id = $(this).attr('id').substr(4)
				$('#m_' + id).removeClass('hoverColor')
			})
			
			function closeTab(seq){
				if(currentTag == "tag"+seq){
					//console.log($("#"+currentTag).next());
					//console.log($("#"+currentTag).prev());
					//右边有兄弟节点就切换到右边，否则切换到左边
					var nextSeq = 1;
					var nextSrc = "${path}plf/page/fp/index.jsp";
					if($("#"+currentTag).next().length > 0){
						nextSeq = $("#"+currentTag).next().attr("id").replace("tag","");
					}else{
						nextSeq = $("#"+currentTag).prev().attr("id").replace("tag","");
					}
					nextSrc = $("#iframe"+nextSeq).attr("src");
					//switchTag('tag1','content1','${path}plf/page/fp/index.jsp');
					switchTag("tag"+nextSeq,"content"+nextSeq,nextSrc);
				}
				$("#tag"+seq).remove();
				$("#content"+seq).remove();
				if($("#tag1").siblings().length <= 7){
					$('.js-nav').unslick();
					slickInit();					
				}
			}
			var seqarr=[];
			//新增TAB	页function addTab(url,name,id){
			function addTab(url,name,id,openType){
				if(openType== null || openType=="0") {
					
					var hightPix = $(window).height() - 58 ; //内容到上边的距离
					var openFlag = false;
					$("#tag1").siblings().each(function(seq,item){
						//打开过的标签不再重复打开
						if(id == $(item).data("id")){
							var count = item.id.substring(3);
							switchTag(item.id,"content"+count,url);
							openFlag = true;
							return;
						}
					});
					
					if(openFlag){
						return;
					}else{
						$('.js-nav').unslick();
					}
					tab_len ++;
					seqarr.push(tab_len)
					var tabTitle = "<div class=\"item item-click\" data-id=\""+id+"\" id=\"tag"+tab_len+"\" title=\""+name+"\">"
				                	+"<a href=\"javascript:void(0);\" id=\"selectli"+tab_len+"\" onclick=\"switchTag('tag"+tab_len+"','content"+tab_len+"','"+url+"');this.blur();\" class=\"slick-slide\">"+name+"</a>"
				                	+"<a href=\"javascript:void(0);\" onclick=\"closeTabConfirm('"+tab_len+"');\" class=\"close\"></a>"
				              		+"</div>";
			              		
					var iframeHtml = "<div id=\"content"+tab_len+"\"><iframe id=\"iframe"+tab_len+"\" name=\"iframe"+tab_len+"\""
									+"src=\""+url+"\" frameBorder=\"0\""
									+"scrolling=\"auto\" height=\""+hightPix+"px\" width=\"100%\" onload=\"dynIframesize('iframe"+tab_len+"');\">"
									+"</iframe></div>";
							
			        $("#tag1").siblings().last().after(tabTitle);
			        
			        slickInit();
/* 			        $('.js-nav').slickAdd(tabTitle);//添加tab
			        var slickLegth = $('.slick-track').children().length;//tab个数
			        if(slickLegth > 8 ){//如果tab个数大于8个，则显示新添加的tab
			        	$('.js-nav').slickNext();
			        } */
					//$("#navId>div>div").html(ht+tabTitle);
					$("#content").append(iframeHtml); 
					
					$("#selectli"+tab_len).bind("mousedown", (function (e) {
					
				        if (e.which == 3) {  
				        
				        var    opertionn = {  
				                name: "",  
				                offsetX: 2,  
				                offsetY: 2,  
				                textLimit: 10,  
				                beforeShow: $.noop,  
				                afterShow: $.noop  
				            };  
				  
				            var imageMenuData = [  
				    [ {  
				        text: "关闭当前",  
				        func: function () {
				        	
				        	var crruentId=this.id;
				        	var ids=crruentId.split("selectli");
				        	closeTabConfirm(ids[1])
				        }  
				    }, {  
				        text: "关闭左边",  
				        func: function () {
				        	var crruentId=this.id;
				        	var ids=crruentId.split("selectli");
							for(var i=0; i<seqarr.length; i++) {
								    if(seqarr[i] == ids[1]) {
								    	for(var j=i-1;j>=0;j--){
								    		if(seqarr[j]!=null){
								    			closeTab(seqarr[j]);
								    			seqarr.splice(j, 1,null);
								    		}	
								    	}
								      break;
								    }
							}
				        }  
				    },{  
				        text: "关闭右边",  
				        func: function () {  
				        	var crruentId=this.id;
				        	var ids=crruentId.split("selectli");
							for(var i=0; i<seqarr.length; i++) {
								    if(seqarr[i] == ids[1]) {
								    
								    for(var j=i+1;j<seqarr.length;j++){
							    		if(seqarr[j]!=null){
							    			closeTab(seqarr[j]);
							    			seqarr.splice(j, 1,null);
							    		}	
							    	}
								      break;
								    }
							}
				        }  
				    },{  
				        text: "全部关闭",  
				        func: function () {
				        	 for(var i=0; i<seqarr.length; i++) {
				        		 closeTabConfirm(seqarr[i]);
							}
				        	 seqarr=[];
				        }  
				    }]];   
				            if ($(e.target).hasClass('td_selected')) {  
				                $(e.target).removeClass('td_selected');  
				            } else {  
				                $(e.target).addClass('td_selected');  
				            }   
				            $(this).smartMenu(imageMenuData, opertionn);   
				        }   
				    }));
					switchTag("tag"+tab_len,"content"+tab_len,url); 
					//cjdjk@139.com 2018-01-25 14:25 begin
					$("#iframe"+tab_len).on("load", function(event){ 
						try{
							$( this.contentDocument).click(function(){ 
						        monitor.fp.main.page.clickInitStartDate();
						   });
						}
						catch(err){
							console.log(err);
						}
					   
				    });
				//cjdjk@139.com 2018-01-25 14:25 end
				}else if(openType==1) { //浏览器打开方式
					window.open(url);
				
				}
				
			}
				
			var loaded = 1;
			var tab_len = 1;
		    var currentTag ;
		    function closeTabConfirm(seq){
				//utilsFp.confirm(closeTab,"<dict:lang value="确定关闭该标签页吗" />",seq);
				removeByValue(seqarr, seq)
				closeTab(seq);
			}
			function removeByValue(seqarr, seq) {
				  for(var i=0; i<seqarr.length; i++) {
				    if(seqarr[i] == seq) {
				   	seqarr.splice(i, 1,null);
				      break;
				    }
				  }
			}
			function switchTag(tag, content,url) {
					if(currentTag == tag){
						return false;
					}
					//$($("#"+tag).siblings().find("a").get(0)).removeClass("cur");
					for (i = 1; i < (tab_len+1); i++) {<%-- 下标从1开始 --%>
						if ("tag" + i == tag) {
							if(!$($("#"+tag+"").find("a").get(0)).hasClass("cur")){
								$($("#"+tag+"").find("a").get(0)).addClass("cur");
							}
						} else {
							if($($("#tag" + i).find("a").get(0)).hasClass("cur")){
								$($("#tag" + i).find("a").get(0)).removeClass("cur");
							}
						}
						if ("content" + i == content) {
							currentTag = tag;
							document.getElementById(content).className = "";
							if("" == document.getElementById("iframe" + i).src || "" != url){
								/*currentIframe = document.getElementById("iframe" + i).contentWindow;
								if (typeof(currentIframe.loadedState) == "undefined" && currentIframe.loadedState != false) {//第一次点击才加载
									document.getElementById("iframe" + i).src = url;
								}*/
								var openFlag = true;
								if(tag="tag1"){
									openFlag = false;
								}
								$("#tag1").siblings().each(function(seq,item){
									//console.log($(item).data("id"));
									//打开过的标签不再重复打开
									if(item.id == tag){
										openFlag = false;
										return;
									}
								});	
								
								if(openFlag){//第一次点击才加载
									document.getElementById("iframe" + i).src = url;
								}
								
							}
							dynIframesize("iframe" + i);
						} else {
							//document.getElementById("content" + i).className = "hidecontent";
							$("#content" + i).addClass("hidecontent");
						}
						document.getElementById("content").className = content;
					}
				}

				var iframehide = "yes";
				function dynIframesize(frameId) {
						if (document.getElementById) {
							dyniframe = document.getElementById(frameId);
							if (dyniframe && !window.opera) {
								dyniframe.style.display = "block";
							}
						}
						if ((document.all || document.getElementById) && iframehide == "no") {
							var tempobj = document.all ? document.all[iframeids[i]] : document.getElementById(iframeids[i]);
							tempobj.style.display = "block";
						}
				}
				
				function _dynIframesize() {
					var tabIndex = 1;
					if(null != currentTag && "" != currentTag){
						tabIndex = currentTag.substr(3,currentTag.length);
					}
					dynIframesize("iframe"+tabIndex);
				}
				
				
				if (window.addEventListener) {
					window.addEventListener("resize", _dynIframesize, false);
				} else {
					if (window.attachEvent) {
						window.attachEvent("onresize", _dynIframesize);
					} else {
						window.onresize = _dynIframesize;
					}
				}
				
				//激活窗口不刷新
				function switchTabWithoutReload(seq){
					var tag = "tag"+seq;
					var content = "content"+seq;
					for (i = 1; i < (tab_len+1); i++) {<%-- 下标从1开始 --%>
						if ("tag" + i == tag) {
							if(!$($("#"+tag+"").find("a").get(0)).hasClass("cur")){
								$($("#"+tag+"").find("a").get(0)).addClass("cur");
							}
						} else {
							if($($("#tag" + i).find("a").get(0)).hasClass("cur")){
								$($("#tag" + i).find("a").get(0)).removeClass("cur");
							}
						}
						if ("content" + i == content) {
							currentTag = tag;
							document.getElementById(content).className = "";
					
						} else {
							//document.getElementById("content" + i).className = "hidecontent";
							$("#content" + i).addClass("hidecontent");
						}
						document.getElementById("content").className = content;
					}					
				}
				
		         /*$('.menu-sub').mCustomScrollbar({
		          scrollInertia:150
		        });*/

		
		        function Height(){
		          var H = getHeight();
		          $(".menu").css("height",H);
		          
		          //不是弹窗，则设置高度
		          $("#content iframe").each(function(){
						//console.log(this.name);
							$(this).css("height",H - 58);
		          });

		        }
		        
		        function getHeight(){
		        	return $(window).height();
		        }
		        
		 	$(function(){
				getFpMenu();
				slickInit();
		        Height();
		        addNineFunc();
		        showMsgCount();
		        
		        postAjaxPage();
		        
		        try{
		        	fullScreen();
		        	$("#fullScreenBtn").toggle(function(){fullScreen();},function(){exitFullScreen();});
		        	}catch(e){
		        	
		        }

		        /*if(document.all){
		        	document.getElementById("fullScreenBtn").click();
		        }else{
		        	var e = document.createEvent("MouseEvents");
		        	e.initEvent("click",true,true);
		        	document.getElementById("fullScreenBtn").dispatchEvent(e);
		        }*/
		       var photoName = "<s:property value="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USERDTO_KEY].photoName}" />";
		       if(photoName != null && photoName != ""){
					$("#photoId").attr("src","${path}plf/userPhoto/"+photoName);
		       }else{
		       		$("#photoId").attr("src","${path}plf/images/user.png");
		       }
		       
		       
		 	});
			
		    /*    $(window).resize(function(){
		          $('.content').mCustomScrollbar("destroy");
		          Height();
		        });		*/		
	        window.onresize = function(){
	       		Height();
	        }
	        
	        //前台消息弹窗触发事件
  			function changeMsg(id){
     			event.stopPropagation();
     			
     			//调用message.jsp定义的
     			$.messager.closeMe(id);
  				
     			$.post("${path}comm/MsgAction_readHMsg.ms",{"paraMap.id":id},function(data){
  					showMsgCount();
  				});
				
			}
	        
	        //换肤
	       	function switchTheSkin(val){
	       		event.stopPropagation();
	       		if(util.isChrome()){
					$(window).unbind('beforeunload');
				}
	       		$.post("${path}buss/bussModel_switchTheSkin.ms",{"SESSION_THEMETYPE_KEY":val},function(data){
	       			console.log(data);
	       			if(data.ajaxMap && data.ajaxMap.state == "1"){
	       				window.location.href= "${path}fp/FpAction_mainFrameFp.ms";
	       			}
  				});
	        }
	        
	        //postMessage
	        window.addEventListener('message', function(event){ 
	        	if(window.parent !== event.srcElement){
	        		return
	        	} 
	        	var dataStr = event.data;
	        	//console.log(typeof dataStr)
	        	if(typeof dataStr =='string'){
	        		var dataObj = JSON.parse(dataStr);
	        	}
	        	var runMethod = dataObj["method"];
	        	
	        	//function addTab(url,name,id,openType)
	        	
	        	if(runMethod == 'addTab'){
	        		addTab(openurl_im,'IM','im001');
	        	}
	        	
	        }, false);
	        
	        
	        var openurl_im;
	        //访问
	        function postAjaxPage(){
	        	var mcData = {"methodName":"tabOpen"};
	        	var param = {
	        		mcData: JSON.stringify(mcData),
	        		mcUrl: window.location.origin
	        	}
	        	$.ajax({
	        		url: '${path}/comm/InteAuthAction_geturl_im.ms',
	        		type: 'get',
	        		data: param,
	        		success: function(data){
	        			if(data){
	        				var iframe_url_im = data.ajaxMap.iframe_url_im;
		        			openurl_im = data.ajaxMap.openurl_im;
		        			//$(".imFrame")[0].setAttribute("src",iframe_url_im);
		        			
		        			if(iframe_url_im!=null && iframe_url_im!=''){
		        				$(".imFrame").attr("src",iframe_url_im);
		        			}else{
		        				$("#im_aid").css('display','none'); 
		        			}
		        			
	        			}
	        			else {
	        				console.log(data);
	        			}
	        			
	        		},
	        		error: function(err){
	        			console.log(err);
	        		}

	        	})
	        }

	    </script>
</body>

<script
	src="${path}/plf/js/common/monitor.fp.main.page.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>

</html>