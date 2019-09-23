<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>

<script>
$(function(){
	layui.use('laypage', function(){
		  var laypage = layui.laypage;
		  laypage.render({
		    elem: 'currentPageDiv', //注意，这里的 test1 是 ID，不用加 # 号
		    limit:"<c:out value='${page.pageRecord}'/>",
		    hash:'fenye',
		    layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
		    curr: "<c:out value='${page.currentPage}' />",
		    count: "<c:out value='${page.totalRecord}' />",
		    jump: function(obj, first){
    	    //首次不执行
    	    if(!first){
   	    	    $("#page_currentPage").val(obj.curr);
   	    	    $("#page_pageRecord").val(obj.limit);
   	    	    query(this);
    	    }
		   }
		});
	});
	
});

function setTableStyle(id,minWidth){
	if(typeof(minWidth)=="undefined"||minWidth==""){
		$("#"+id).css("min-width",1366);
	}else{
		$("#"+id).css("min-width",minWidth);
	}
}
	
</script>
  </head>
  
  <body>
  </body>
</html>
