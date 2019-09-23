<%@page import="com.more.fw.core.common.method.StringUtils"%>
<%@page import="com.more.fw.core.common.method.Constants"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<html>
	<head>
	<script type="text/javascript">
	 var zcount=1000;
	 var monitorControlSecond=<%=com.more.fw.core.common.method.ReadProperties.getPorpertie("system.properties","MONITOR_CONTROL_SECOND")%>;
 
	</script>
	 
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
		<%@ include file="/plf/common/pub_meta.jsp"%>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="datePicker" value="1" />
			<jsp:param name="chosen" value="1" />
			<jsp:param name="spectrum" value="1" />
			<jsp:param name="popMsgWin" value="1" />
		</jsp:include>
		<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	    <title><dict:lang value="摩尔共享标签" /></title>
	    <script type="text/javascript">
	    	var _$url_type = "0";
	    </script>
		<%@ include file="/plf/common/message.jsp"%>
		<link rel="stylesheet" href="${path}/plf/page/fp/css/jquery.mCustomScrollbar.css?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CSS %>" type="text/css" />
		<script src="${path}/plf/page/fp/js/jquery.mCustomScrollbar.concat.min.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>
	<style type="text/css">
		body{overflow:hidden;}
	</style>
	</head>
	<body>
    <div class="wrap">
        <div class="topbar">
          <div class="topbar-in">
            <a href="javascript:void(0);" onclick="switchTag('tag1','content1','${path}plf/page/fp/index.jsp');this.blur();" class="logo"><img src="${path}plf/page/fp/img/logo_blue.png?_mc_res_version=<%=PlfStaticRes.LOGO_BLUE_PNG %>" width="110" height="20" alt="" /></a>
            <div class="nav">
              <div class="nav-in js-nav" id="navId">
              <div class="item" id="tag1" data-id="1">
                <a href="javascript:void(0);" id="selectli1" onclick="switchTag('tag1','content1','${path}plf/page/fp/index.jsp');this.blur();" class="slick-slide cur"><img src="${path}plf/page/fp/img/ico-home-s.png?_mc_res_version=<%=PlfStaticRes.ICO_HOME_S_PNG %>" width="12" height="10" alt="" /><dict:lang value="首页" /></a>
              </div>
              <span class="slick-prev"></span>
              <span class="slick-next"></span>
              </div>
            </div>
            <div class="user" style="right:75px">
		              <div class="info" id="infoDiv" style="cursor:auto" >
		                <img src="${path}plf/page/fp/img/tx.jpg?_mc_res_version=<%=PlfStaticRes.TX_JPG %>" id="photoId" width="25" height="25" alt="" />
		                	<span class="name">
		                		<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}" />
		                		<!-- <a href="javascript:void(0);" onclick="upMyUser();" title="<dict:lang value="个人信息修改" />">
									<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}" />
								</a> -->
		                	</span>
		              </div>
		              <div class="user-drop">
				              <div id="doList">
				            		
				              </div>
		                	
		              </div>
            </div>
            <div class="state">
              <!-- <a href="#" target="_blank" class="s1"></a> -->
              <div class="s2">
                <div class="s2-drop">
                    <%-- <a href="javascript:void(0);" onclick="upMyUser();" title="<dict:lang value="用户信息" />"><i class="ico ico-zx"></i><dict:lang value="用户信息" /></a> --%>
                    <a href="javascript:void(0);" onclick="flushIndex();" title="<dict:lang value="刷新首页" />"><i class="ico ico-refresh"></i><dict:lang value="刷新首页" /></a>
                    <a href="javascript:void(0);" onclick="showUserSetting();" title="<dict:lang value="用户设置" />"><i class="ico ico-user-set"></i><dict:lang value="用户设置" /></a>
                    <a href="javascript:void(0);" onclick="showDesignerDownLoad()" title="<dict:lang value="服务支持" />"><i class="ico" style="width: 12px;height: 15px;background:url(${path}/plf/page/fp/img/ico-dataDownload.png) no-repeat;"></i><dict:lang value="服务支持" /></a>
                    <a href="javascript:void(0);" onclick="showProposal();" title="<dict:lang value="建议反馈" />"><i class="ico" style="width: 12px;height: 15px;background:url(${path}/plf/page/fp/img/ico-feedback.png) no-repeat;"></i><dict:lang value="建议反馈" /></a>
                    <a href="#" onclick="exit();return false;"><i class="ico ico-off"></i><dict:lang value="退出系统" /></a>
                </div>
              </div>
              <a href="javascript:void(0);" id="fullScreenBtn" class="s3"></a>
            </div>
          </div>
        </div>
   
        <ul class="menu" id="fp_menu">
            
        </ul>
        
        <div class="content" >
        	<div id="content">
	        	<div id="content1">
					<iframe id="iframe1" name="iframe1"
							src="${path}sys/UserTargetDataAction_goToIndex.ms" frameBorder="0"
							scrolling="auto" width="100%" onload="dynIframesize('iframe1');">
					</iframe>
				</div>
			</div>
        </div>
        <!-- content end -->        
    </div>

    <div id="cls"></div>
	    <script type="text/javascript">
	    
	    var page;//二级菜单当前页
	    var pageLiCount;//每页的li个数
	    var liCount;//li的总个数
	    var pageCount;//共多少页
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
	    }
	    

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
	    }
	    function addNineFunc(){
	    	var url="${path}sys/FootPlatformAction_ajaxQueryComList.ms";
	    	$.ajax({
	    		type: "POST",
			    dataType: "json",
			    url: url,
				success: function(data){
	    			var nineCommList=data.ajaxList;
	    			var nineCommHtml="";
	    			var picPath=;${path}
	    			var funcCode=null;
	    			var url=null;
	    			for(var i=0;i<nineCommList.length;i++){
	    				var j=i+1;
	    				
	                  	if(nineCommList[i].showOrder==j){
	                  			url=nineCommList[i].url;
	                  			if(url.indexOf("?exeid=")==-1||url.indexOf("?")==-1){
	                  				funcCode="?FUNC_CODE="+nineCommList[i].funcCode;
	                  			}else{
	                  				funcCode="&FUNC_CODE="+nineCommList[i].funcCode;
	                  			}
	                  			nineCommHtml+=" <div class=\"item\"  title='"+nineCommList[i].menuName+"'>"
	                  				+"<a href=\"javascript:void(0);\" onclick=\"addUserTab('"+picPath+nineCommList[i].url+funcCode+"','"+nineCommList[i].menuName+"','"+nineCommList[i].menuId+"')\"  class=\"con\"  >";
			   	                if(nineCommList[i].img!=null){
			   	                	nineCommHtml+="<img src='"+picPath+nineCommList[i].img+"?_mc_res_version=<%=PlfStaticRes.NINE_COMM_LIST_IMG%>' width=\"36\" height=\"36\" alt=\"\" />"	                 			  	
			   	                 }else{
			   	                  	nineCommHtml+="<img src='"+picPath+"plf/page/fp/img/u"+j+".png?_mc_res_version=<%=PlfStaticRes.J_PNG%>' width=\"36\" height=\"36\" alt=\"\" />"
			   	                 }
	                  			nineCommHtml+="	<span style=\"white-space: nowrap;overflow:hidden;text-overflow: ellipsis;\" class=\"tt\" >"+nineCommList[i].menuName+"</span>"
	                  			+" </a>"     			 
		                  		+" </div> "
	                  	}else{
	                  			nineCommHtml+="<div class=\"item\" >"
		                  				+"<a href=\"javascript:void(0);\"  class=\"con\"  >"
			   		                    +"<img src='"+picPath+"plf/page/fp/img/u"+j+".png?_mc_res_version=<%=PlfStaticRes.J_PNG%>' width=\"36\" height=\"36\" alt=\"\"  />"
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
				var url = "${path}mlabel/MlAction_logout.ms?__random__timeSeq="+new Date();
				_canClose();
				window.location.href = url;
			}
			
			function upMyUser(){
				var url = "${path}sys/UserAction_showUpMyUser.ms";
				showPopWinFp(url, 305, 205,null,"<dict:lang value="个人信息修改"/>");
				//window.location.href = url;
			}
			
			function showDesignerDownLoad(){
				var url = "${path}sys/UserAction_showDesignerDownLoad.ms";
				showPopWinFp(url, 640, 490,null,"<dict:lang value="服务支持"/>","designerDownLoadIframeId");
			}
			
			function showProposal(){
				var url = "${path}buss/bussModel.ms?exeid=05b06543d0994109955c0366217a17c3";
				showPopWinFp(url, 780, 600,null,"<dict:lang value="建议反馈"/>","proposalIframeId");
			}
			
			function showUserSetting(){
				var url = "${path}sys/UserAction_showUserSetting.ms";
				showPopWinFp(url, 800, 576,null,"<dict:lang value="用户设置"/>","userSettingIframeId");
				//window.location.href = url;
			}
			
			function openDevPg(){
				var url = "${path}sys/LoginAction_mainFrame.ms";
				window.open(url);
			}		
			
			//父级字体颜色保持不变
			function parentFontShow(e){
				var self = e;
				$(self).prev().css('color','#3691fb');
				$(self).prev().addClass('after');
			}
			//移开后还原
			function parentFontHide(e){
				var self = e;
				$(self).prev().css('color','');
				$(self).prev().removeClass('after');
			}
			
			//显示菜单
			function showSub(id,sub,e){

				var self = e;
				
				$("#"+sub+id).show();
				
				if(sub == "sub_"){
					page = 0;
					pageLiCount =  parseInt(( $(self).children('ul').height() + 5 ) / 50);//每页的li个数
					liCount = $(self).children('ul').children('li').length;//总共的li个数
					pageCount = parseInt((liCount - 1) / pageLiCount);//共多少页
					
					$(self).children('ul').children('.triangle_up').css('display','none');
					$(self).children('ul').children('.triangle_down').css('display','none');   //初始隐藏
					$(self).children('ul').children('li').css('display','block');
					if(pageLiCount < liCount){   //当每页可存放的项小于总的项数时，显示下一页按钮，居中显示
						
						$(self).children('ul').children('.triangle_down').addClass('triangle_center').css('display','block');
						$(self).children('ul').children('li').css('display','none');
						$(self).children('ul').children('li').slice(0,pageLiCount).css('display','block');
					}
				}
				
				
				if(sub == "sub_sub_"){
					 
					 if($(self).hasClass('item-sub-active')){
					 	
					 	 $(self).children('a').addClass('after');
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
				$("#"+sub+id).hide();
				
				if(sub == "sub_sub_"){
					 $(self).children('a').removeClass('after');
					 $(self).children('a').children('div').remove();
					 $(".menu-sub-sub").mCustomScrollbar("destroy");
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
			
			//获取前台菜单
			function getFpMenu(){
				
				var url = "${path}sys/FuncAction_getFpMenu.ms";
				util.showLoading("<dict:lang value="加载中" />...");
				$.ajax({
					type: "POST",
				    dataType: "json",
				    url: url,
				    //data: "paraMap.sql="+val2,//+upColId,
					success: function(data){
							//alert(JSON.stringify(data));
							//util.alert(data.ajaxMap.nextselectId);
							util.closeLoading();
							var menuHtml = "<li class=\"item-logo item-home\" style=\"cursor:pointer;\">"
								           +"     <a class=\"item-in\" href=\"javascript:void(0);\" onclick=\"switchTag('tag1','content1','${path}plf/page/fp/index.jsp');this.blur();\">"
							               +"     	<img src=\"${path}plf/page/fp/img/i-home.png?_mc_res_version=<%=PlfStaticRes.I_HOME_PNG%>\" width=\"23\" height=\"22\" />"
							               +" 	</a>"
							               +"</li>";
							//console.log($("#fp_menu").html());
							//if(null == data){return ;}
							//if(null == data.ajaxMap){return ;}
							if(null != data.ajaxList){
								var menuHtmlSub = "";//二级菜单
								var menuHtmlSubSub = "";	//三级菜单 
								var aList = eval(data.ajaxList);
								var countSub = 0;//二级菜单计数
								var countSubSub = 0;//三级菜单计数
								var subCls = "";//子菜单样式
								
								for(var i = 0;i < aList.length; i++){
									var menuUrl = "";
									var img = "";
									var subMenuId = "";
									var styleP = "";
									
									if(aList[i].type == "1"){
										//menuUrl = "href=\""+aList[i].url+"\"";
										//var funcUrl = aList[i].url;
										var funcUrl = "${rootPath}sys/FuncAction_shoUserFunc.ms?funcDtoSh.id="+aList[i].id+"&MENU_FC="+aList[i].funcCode;
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
						            		menuHtml += "</ul></li>";
						            	}									               
										if(countSub > 0){
											countSub = 0;
											menuHtml += "</ul></li>";
										}
										
										menuHtml+="<li class=\"item\" style=\"cursor:pointer;\" id=\"m_"+aList[i].id+"\"  onmouseenter=\"showSub('"+aList[i].id+"','sub_',this);\" onmouseleave=\"hideSub('"+aList[i].id+"','sub_',this)\">"
										           +"     <a class=\"item-in\" "+menuUrl+" >"
									               //+"     	<img src=\"${path}"+aList[i].img+"\" width=\"32\" height=\"34\" />"
									               +img
									               +" 		<p>"+aList[i].name+"</p>"	
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
						            		menuHtml += "</ul></li>";
						            	}
						            											
										
										if(countSub == 0){
											menuHtml +="<ul class=\"menu-sub\" id=\"sub_"+aList[i].upId+"\" style=\"display:none;\"><div class='triangle_up' onclick='turnUp(this)'></div><div class='triangle_down' onclick='turnDown(this)'></div>";
										}
										
										
										if(aList[i].img != "" && aList[i].img != null){
											img = "<img src=\"${path}"+aList[i].img+"?_mc_res_version=<%=PlfStaticRes.ALIST_IMG%>\" width=\"20\" height=\"20\" alt=\"\" />";
										}else{
											//styleP = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
											img = "<img src='${path}plf/page/fp/img/ico-menu-default.png?mc_res_version=<%=PlfStaticRes.ICO_MENU_DEFAULT_PNG%>' width='20' height='20'>";
										}
										
										menuHtml +="<li class=\"item-sub "+subCls+"\"  title=\""+aList[i].name+"\" style=\"cursor:pointer;\" onmouseenter=\"showSub('"+aList[i].id+"','sub_sub_',this);\" onmouseleave=\"hideSub('"+aList[i].id+"','sub_sub_',this)\">"
						              				+"	<a "+menuUrl+"style='position: relative;'>"
						              				//+"<img src=\"${path}"+aList[i].img+"\" width=\"20\" height=\"20\" alt=\"\" />"
						              				+img
						              				+aList[i].name+"<span></span></a>";
										   if(aList[i].type == "1" || i == (aList.length - 1)){
											   menuHtml += "</li>";
										   }						              				
						            				//+"</li>";
						            	countSub ++;

						            	if(i == (aList.length - 1)){
						            		menuHtml += "</ul></li>";
						            	}
  
									}else if(aList[i].level == "3"){
										if(countSubSub == 0){
											menuHtml += "<ul class=\"menu-sub-sub\" id=\"sub_sub_"+aList[i].upId+"\" style=\"display:none;\" onmouseenter='parentFontShow(this)' onmouseleave='parentFontHide(this)'>"
										}
										
										menuHtml += "<li class=\"item-sub-sub\" style=\"cursor:pointer;\" title=\""+aList[i].name+"\"><a "+menuUrl+">"+aList[i].name+"</a></li>";
										countSubSub ++;
						            	if(i == (aList.length - 1)){
						            		menuHtml += "</ul></li></ul></li>";
						            	}
									}
								}
							}
							$("#fp_menu").append(menuHtml);
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

		        for(var i = 1;i <=  $('.slick-track').children().length;i++){
		        	width += $('.slick-track').children(i).width()
		        }
		        $('.slick-track').css('min-width',width + 'px')
		  
			}
			
			//tab上一页
			$('.slick-prev').click(function(){
				var newLeft = $('.slick-list').scrollLeft() - $('.slick-track').children(1).width();
				$('.slick-list').animate({scrollLeft:newLeft},300)		
			});
			
			//tab下一页
			$('.slick-next').click(function(){
				var newLeft = $('.slick-list').scrollLeft() + $('.slick-track').children(1).width();
				$('.slick-list').animate({scrollLeft:newLeft},300)		
			});
			
			//关闭标签页
			function closeTabConfirm(seq){
				//utilsFp.confirm(closeTab,"<dict:lang value="确定关闭该标签页吗" />",seq);
				closeTab(seq);
			}
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
			
			//新增TAB	页
			function addTab(url,name,id){
				var hightPix = $(window).height() - 58 ; //内容到上边的距离
				var openFlag = false;
				$("#tag1").siblings().each(function(seq,item){
					//打开过的标签不再重复打开
					if(id == $(item).data("id")){
						var count = item.id.substring(3);
						switchTag(item.id,"content"+count,url);
						openFlag = true;

					}
				});
				
				if(openFlag){
					return;
				}else{
					$('.js-nav').unslick();
				}
				tab_len ++;
				
				var tabTitle = "<div class=\"item item-click\" data-id=\""+id+"\" id=\"tag"+tab_len+"\" title=\""+name+"\">"
			                	+"<a href=\"javascript:void(0);\" id=\"selectli"+tab_len+"\" onclick=\"switchTag('tag"+tab_len+"','content"+tab_len+"','"+url+"');this.blur();\" class=\"slick-slide\">"+name+"</a>"
			                	+"<a href=\"javascript:void(0);\" onclick=\"closeTabConfirm('"+tab_len+"');\" class=\"close\"></a>"
			              		+"</div>";
		              		
				var iframeHtml = "<div id=\"content"+tab_len+"\"><iframe id=\"iframe"+tab_len+"\" name=\"iframe"+tab_len+"\""
								+"src=\""+url+"\" frameBorder=\"0\""
								+"scrolling=\"auto\" height=\""+hightPix+"px\" width=\"100%\" onload=\"dynIframesize('iframe"+tab_len+"');\">"
								+"</iframe></div>";
						
		        $("#tag1").after(tabTitle);
		        
		        slickInit();
		        
				//$("#navId>div>div").html(ht+tabTitle);
				$("#content").append(iframeHtml);
				switchTag("tag"+tab_len,"content"+tab_len,url);
				
			}
				
			var loaded = 1;
			var tab_len = 1;
		    var currentTag ;
		    
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
		       var photoName = "<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].photoName}" />";
		       if(photoName != null && photoName != ""){
					$("#photoId").attr("src","${path}plf/userPhoto/"+photoName);
		       }else{
		       		$("#photoId").attr("src","${path}plf/images/user.png?_mc_res_version=<%=PlfStaticRes.USER_PNG%>");
		       }
		 	});
			
		    /*    $(window).resize(function(){
		          $('.content').mCustomScrollbar("destroy");
		          Height();
		        });		*/		
	        window.onresize = function(){
	       		Height();
	        }
	        
	        
		    
	    </script>
	</body>	
	
<script src="${path}/plf/js/common/monitor.fp.main.page.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>

</html>