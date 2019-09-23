<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <title>信息管理系统主框架</title>
		<jsp:include page="/plf/common/pub_head.jsp" >
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="newTabCss" value="1" />
			<jsp:param name="smartMenu" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		<script type="text/javascript" src="${path}plf/page/fp/js/slick.js?_mc_res_version=<%=PlfStaticRes.SLICK_JS %>"></script>
	</head>
	<body>
        <div class="topbar">
          <div class="topbar-in">
            <!-- <a href="javascript:void(0);" onclick="switchTag('tag1','content1','${path}plf/page/fp/index.jsp');this.blur();" class="logo"><img src="${path}plf/page/fp/img/logo_blue.png" width="140" height="25" alt="" /></a>-->
            <div class="nav">
              <div class="nav-in js-nav" id="navId">
              <div class="item" id="tag1" data-id="1">
                <a href="javascript:void(0);" id="selectli1" onclick="switchTag('tag1','content1','${path}plf/page/fp/index.jsp');this.blur();" class="slick-slide cur"><img src="${path}plf/page/fp/img/ico-home-s.png?_mc_res_version=<%=PlfStaticRes.ICO_HOME_S_PNG%>" width="12" height="10" alt="" /><dict:lang value="首页" /></a>
              </div>
              <span class="slick-prev"></span>
              <span class="slick-next"></span>
              </div>
            </div>            
            
          </div>
        </div>
        
        <div class="content" >
        	<div id="content">
	        	<div id="content1">
					<iframe id="iframe1" name="iframe1"
							src="<%=CommMethodMc.getMainFrameUrl(request)%>" frameBorder="0"
							scrolling="no" width="100%" onload="dynIframesize('iframe1');">
					</iframe>
				</div>
			</div>
        </div>
        
        <script type="text/javascript">
        
        
       $(window).resize(function(){
			//$("#iframe1",document.frames("iframe1").document).cover();
			$("#iframe1").attr({"height":getHeight()});
			window.frames["iframe1"].cover();
		});
        
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
				
			var seqarr=[];	
				
				    			//关闭标签页
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
				if($("#tag1").siblings().length <= 9){
					$('.js-nav').unslick();
					slickInit();					
				}
			
			}
			
			//新增TAB	页
			function addTab(url,name,id){
				var hightPix = getHeight()-60;
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
			                	+"<a href=\"javascript:void(0);\" id=\"selectli"+tab_len+"\" onclick=\"switchTag('tag"+tab_len+"','content"+tab_len+"','"+url+"');fixSize('iframe"+tab_len+"');this.blur();\" class=\"slick-slide\">"+name+"</a>"
			                	+"<a href=\"javascript:void(0);\" onclick=\"closeTabConfirm('"+tab_len+"');\" class=\"close\"></a>"
			              		+"</div>";

				var iframeHtml = "<div id=\"content"+tab_len+"\"><iframe id=\"iframe"+tab_len+"\" name=\"iframe"+tab_len+"\""
								+"src=\""+url+"\" frameBorder=\"0\""
								+"scrolling=\"auto\" height=\""+hightPix+"px\" width=\"100%\" onload=\"dynIframesize('iframe"+tab_len+"');\">"
								+"</iframe></div>";
								
		        $("#tag1").parent().find('>div:last').after(tabTitle);
		        
		        slickInit();
		        
				//$("#navId>div>div").html(ht+tabTitle);
				$("#content").append(iframeHtml);
				$('#selectli'+tab_len).bind("mousedown", (function (e) {
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
				
			}
			
			//修改密码
			function upMyUser(){
				var url = "${path}sys/UserAction_showUpMyUser.ms";
				//showPopWin(url, "500", "350",null,"<dict:lang value="修改密码"/>");
			}
			
			//调整iframe尺寸,解决chrome底下iframe切换回来时,滚动条会不见的bug
			function fixSize(iframeId){
				var iframeObj = document.getElementById(iframeId);
				iframeObj.height = "99%";
				iframeObj.scrollWidth;
				iframeObj.height = (getHeight()-60);
			}
			
        
        	//tab滑动初始化
			function slickInit(){
				$('.js-nav').slick({
		            dots: false,
		            autoplay: false,
		            infinite:false,
		            slidesToScroll:1,
		            slidesToShow:10
		        });				
			}
			
				function getHeight(){
		        	return $(window).height();
		        }
		        
			$(function(){
				slickInit();
				$("#iframe1").attr({"src":"<%=CommMethodMc.getMainFrameUrl(request)%>","height":getHeight()});
			});
        
        </script>
	</body>
<%@ include file="/plf/common/pub_end.jsp" %>