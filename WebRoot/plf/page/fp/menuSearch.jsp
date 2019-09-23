<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
	<title><dict:lang value="菜单搜索" moName="mc_plf" /></title>
	<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	<%-- <link rel="stylesheet" href="${path}plf/page/globalhelp/css/style.css" media="all"> --%>
	<link href="${path}plf/style/layui/layuiadmin/layui/css/layui.css?_mc_res_version=<%=PlfStaticRes.LAYUI_LAYER_CSS %>" rel="stylesheet" type="text/css">
	<style>
	 
	.content-in .dlist .hd {
		height: 40px;
	}
	.search-input-box .layui-icon-search {
		right: 10px;
    	top: 3px;
	}
	table.add_table  {
		width: 100%;
		margin-top: 4px;
	}
	div.search-input-box {
		width: 330px;
		display: inline-block;
		position: relative;
	}
	.serch-font-style {
		color: #159588;
	}
	#menuList .MODEL {
		border-bottom: 1px solid #eaeaea;
	}
	
	#menuList .MODEL {
		margin-bottom: 10px;
    	padding-left: 10px;
    	padding-bottom: 5px;
	}
	#menuList .MODEL .space a:hover {
		color: #01AAED;
		text-decoration: underline;
	}
	#menuList .MODEL .key-word {
		color: #01AAED;
	}
	#menuList .MODEL p.main-small-title {
		margin-bottom: 10px!important;
		font-size: 14px;
	}
	#menuList .MODEL .space {
		margin-bottom: 5px!important;
		font-size: 12px;
	}
	.dlist .bd {
		height: calc(100% - 50px - 10px);
		padding-top: 10px;
	}
	#page_wordkey {
		height: 33px;
		line-height: 33px;
	}
	
	</style>
</head>
<body style="overflow: hidden;">

<div class="content-in">
	<div class="dlist">
		<div class="hd">
			
			<div class="hd-title" style="float:left; margin-right: 10px;margin-top: 7px; ">
				<dict:lang value="菜单名称" moName="mc_plf" />
			</div>
			<div class="hd-content" style="float:left; margin-top: 6px;">
				<div class="search-input-box" style="float:left; margin-right:20px;">
					<i class="layui-icon layui-icon-search" id="menuSearchBtn" style="position: absolute;cursor: pointer;" layadmin-event="iconSerach"></i>
					<input type="text" id="page_wordkey" name="wordkey" value="<c:out value='${paraMap.wordkey}' />" placeholder="<dict:lang value="请输入菜单名称，按Enter键或点击查询"  moName="mc_plf" />"  lay-verify="checkNew" class=" layui-input" maxlength="30"">
				</div>
				<div id="serchBox" style="display: none; float:left;">
		            <p style="font-size: 14px;">
		              <span class="serch-font-style">"<span id="ser_wordkey"></span>"</span> ,<dict:lang value="共查询到"  moName="mc_plf" /> 
		              <span class='serch-font-style'  id="ser_total"></span><dict:lang value="个相关内容" moName="mc_plf" />
		              <span class="layadmin-font-em serch-font-style" style="margin-left: 20px"><dict:lang value="耗时" moName="mc_plf" />：<span id="ser_time"></span>ms</span>
		            </p>
	            </div>
			</div>
		</div>
		<div class="bd">
			<div class="search-box">
				<div class="main" id="main" style="overflow-y: auto;overflow-x: hidden;">
					<div id="menuList">
					</div>
				</div>

				<div class="center">
					<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
				</div>
			</div>
		</div>
	
		<div style="width: 85%;" >
			<div style="width:45%;float: left;">
			    <table  class="dlist-table table-line " id="roletable">
				</table>
			</div>
			<div style="width:45%;float: right;">
				<table  class="dlist-table table-line " id="jobtable">
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	function initHeight(){
		$('.main').height($(window).height() - 100 -6);
	 	$('#listTable').width($(window).width() - 2);
	}
	
	$(function(){
		initHeight();
		_newScroll("main");
          
		//回车事件绑定
	    $('#page_wordkey').bind('keyup', function(event) {
	        if (event.keyCode == "13") {
	            //回车执行查询
	            setNull();
	            query("formId1",null,'');	
	        }
	    });
	    
	    $('#menuSearchBtn').on('click',function(){
	    	setNull();
			query("formId1",null,'');	
		});
          
    });
    
      
    $(window).resize(function(){  
		initHeight();	  		
	});
 
	function addTab(obj){
		var url= $(obj).attr("data-url");
		var name= $(obj).attr("data-name");
		var id= $(obj).attr("data-id");
		window.parent.addTab(url,name,id);
	}

	function setNull(){
		$("#serchBox").hide();
		$(".search-box").hide();
		$("#ser_wordkey").text("");
		$("#ser_total").text("");
		$("#ser_time").text("");
	} 
	
      
    var paginationImpl = {};
	function query(paginationImpl,obj,sort_name){
		util.showTopLoading();
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		
		 
		$.ajax({
			url : "${path}sys/FuncAction_menuSearch.ms",
			data : {
				"wordkey": $("#page_wordkey").val(),
		    	"page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
		    	"page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			type : "POST",
			dataType : "json",
			success: function(data){
					util.closeLoading();
					if(null == data){return ;}
				 
					if(null != data.ajaxMap){
						var wordkey= data.ajaxMap.wordkey;
						var totalRecord= data.ajaxPage.totalRecord;
						var time= data.ajaxMap.time;
						$("#ser_wordkey").text(wordkey);
						$("#ser_total").text(totalRecord);
						$("#ser_time").text(time);
						$("#serchBox").show();
						$(".search-box").show();
					}
					
					$("#menuList").empty();
					var menuHtml="";
					if(null != data.ajaxPage && null != data.ajaxPage.dataList && data.ajaxPage.dataList.length>0){
						var menuList = data.ajaxPage.dataList;
						for(var i = 0;i < menuList.length; i++){
							var menu = menuList[i];
							var menuUrl='${path}sys/FuncAction_shoUserFunc.ms?funcDtoSh.id='+menu.id+'&MENU_FC='+menu.funcCode+'&FUNC_CODE='+menu.funcCode;
							var remarkText="";
							if(null!=menu.remarkText && ""!=menu.remarkText){
								remarkText= doText(menu.remarkText);
							}
							var path="";
							if(null!=menu.path && ""!=menu.path){
								path= doText(menu.path);
							}
							var fullPath="";
							if(null!=menu.fullPath && ""!=menu.fullPath){
								fullPath= doText(menu.fullPath);
							}
							var name="";
							if(null!=menu.name && ""!=menu.name){
								name= doText(menu.name);
							}
							
							menuHtml+="<li class='MODEL'>";
							menuHtml+="	<div class='layui-serachlist-text search-mian-font'>";
							menuHtml+="		<p class='space main-small-title'>";
							menuHtml+="			<a href='javascript:void(0);' data-url='"+menuUrl+"' data-name='"+menu.name+"' data-id='"+menu.id+"' onclick='addTab(this)'>"+name+"</a>";
							menuHtml+="		</p>";
							menuHtml+="		<p class='space' style='margin-bottom: 0;'><dict:lang value='菜单路径' moName='mc_plf' />："+path+"  |  <dict:lang value='视图路径'  moName='mc_plf' />："+fullPath+"</p>";
							//menuHtml+="		<p class='space' style='margin-bottom: 0;'>视图路径："+fullPath+"</p>";
							menuHtml+="		<p class='space' style='margin-bottom: 0;' title='"+menu.remarkText+"'><dict:lang value='备注说明'  moName='mc_plf' />："+remarkText+"</p>";
							menuHtml+="	</div>";
							menuHtml+="</li>";
						}
				 
						//console.log(menuHtml);
						$("#menuList").html(menuHtml);
						pageFun(data.ajaxPage,"formId1");
					}else{
						data.ajaxPage.totalPage=0;
						data.ajaxPage.totalRecord=0;
						pageFun(data.ajaxPage,"formId1");
					}
				},
				 	error: function(msg){
					util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300",""); 
			  	}
			});
	}
	
	function doText(str){
		var reStr="";
		var page_wordkey= $("#page_wordkey").val();
		if(str.length>160){
			str=str.substring(0,160);
		}
		if(str.indexOf(page_wordkey)>=0){
			 var strCss='<span class="key-word">'+page_wordkey+'</span>';
			 var reg = new RegExp( page_wordkey , "g" )
			 reStr = str.replace(reg, strCss);
		}else{
			 reStr=str;
		}
		return reStr;
	}
	
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>
<script type="text/javascript" src="${path}plf/js/colResizable/colResizable-1.6.js"></script>
<script type="text/javascript" src="${path}plf/js/colResizable/colResizable-1.6.min.js"></script>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>