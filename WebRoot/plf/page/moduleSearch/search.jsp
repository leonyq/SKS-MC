<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="搜索结果" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="layui" value="1" />
		</jsp:include>
		<link rel="stylesheet" href="${path}plf/style/layui/layuiadmin/style/template.css" media="all">
	</head>
	<style>
	
	a{
		font-size:14px;
	}
	
	.table_div{
		text-align: center;
	}
	
	.layui-text{
		border-bottom:0px  !important;
	}
	.serch-font-style{
	  color:#f94549;
	} 
	.search-title{
	   padding-left: 10px;
	   font-size:14px;
	   height:40px;
	   background: #f5f5f5;
	   line-height:40px;
	}  
	.search-title a,span{
	 font-size:14px;
	  color:#159588 !important;
	} 
	.space{
	 margin-bottom: 12px;
	 padding-left: 10px;
	}

	.layui-card-space{
	  padding:0 !important;
	}
	.li-space{
	   padding-bottom: 0px !important;
	}
	.main-small-title{
	 color:#333 !important;
	
	}
	</style>
<body>
	<form id="searchForm" name="searchForm" action="${path}search/SearchAction_searchModule.ms" method="post">
	<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
	<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
	
	<input type="hidden" id="page_wordkey" name="wordkey" value="<c:out value='${paraMap.wordkey}' />"  />
	<input type="hidden" id="page_searchType" name="searchType" value="<c:out value='${paraMap.searchType}' />"  />
	</form>
			
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card layadmin-serach-main">
          <div class="layui-card-header">
            <p style="font-size: 16px;">
              <span class="serch-font-style" id="mainFont">"<c:out value='${paraMap.wordkey}' />"</span> ,共查询到 
              <span class='serch-font-style'><c:out value='${page.totalRecord}' /></span>个相关内容
              <span class="layadmin-font-em" style="margin-left: 20px">耗时：<c:out value='${paraMap.time}' />ms</span>
            </p>
            
          </div>
          <div class="layui-card-body  layui-card-space">
            
            <ul class="layadmin-serach-list layui-text">
            
            	<s:iterator value="dataList"  status="index">
            	
								
								<li class="<s:property value="CLASS"/><s:property value="#index.index"/> <s:property value="CLASS"/>">
									<div class="layui-serachlist-text search-mian-font">
										<p class="space main-small-title">
											<a href='javascript:void(0);' onclick='openTab("<s:property value="HREF"/>","<s:property value="TITLE"/>","<s:property value="FLAG"/>")'><s:property value="TITLE"/></a>
										</p>
										<%-- <p class="space"><s:property value="INFO"/></p> --%>
										<p class="space" style="margin-bottom: 0;"><s:property value="PATH"/></p>
									</div>
								</li>
								
							</s:iterator>
             
            </ul>
            </div>
        <div id="currentPageDiv" class="table_div" ></div>
			<s:include value="/plf/common/layui_pagination.jsp" />
			</div>
      </div>
    </div>
  </div>
  
  <script>



$(function(){

	//关键词高亮
	var wordkey;
	$(".search-mian-font p").each(function(){
		wordkey =$("#page_wordkey").val();
		var tx = $(this).text().replace(wordkey,"<span style='color:red'>"+wordkey+"</span>");
		//$(this).html(tx);
	});
     
	//document.getElementById('mainFont').innerText="\""+wordkey+"\"";
	//查询结果只在第一页显示
	var pageCurrentPage = $("#page_currentPage").val();
	if("1" != pageCurrentPage){
	 $(".layui-card-header").hide();
	}

	/* 
	BUSS 业务模型
	COMMCLASS 公用类
	COMMPAGE 公共页面
	FUNCMENU 功能菜单
	CLASSCODE 类源码
	NEWMODEL 对外接口
	TASK 任务管理
	TRIGGER 触发器
	 */
	
	/* $(".BUSS").eq(0).before(getHeadHtml("业务模型"));
	$(".COMMCLASS").eq(0).before(getHeadHtml("公用类"));
	$(".COMMPAGE").eq(0).before(getHeadHtml("公共页面"));
	$(".FUNCMENU").eq(0).before(getHeadHtml("功能菜单"));
	$(".CLASSCODE").eq(0).before(getHeadHtml("类源码"));
	$(".NEWMODEL").eq(0).before(getHeadHtml("对外接口"));
	$(".TASK").eq(0).before(getHeadHtml("任务管理"));
	$(".TRIGGER").eq(0).before(getHeadHtml("触发器")); */
	
	
});

	function openTab(url,text,blank){
		if(blank=='1'){
			window.open(url,"_blank");
		}else{
			top.layui.index.openTabsPage(url,text); 
		}
		
	};
	
function eachColor(p,t){
	var nt ='<span style="color:red">'+t+'</span>';
	var reg = RegExp(t,"g");
	return p.text().replace(reg,nt);
}

function query(thisObj){//queryDate
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
	
	function getHeadHtml(title){
	 var html ='<li class="li-space"><div class="layui-serachlist-text search-mian-font"><div class="search-title space">'+
	 			'<span>'+title+'</span></div></div></li>';
	 		return html;	
	}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>