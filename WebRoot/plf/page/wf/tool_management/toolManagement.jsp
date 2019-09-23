<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!DOCTYPE html>
<html>
<%
  Map processdeMap=(Map)request.getAttribute("processdeMap");
 %>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
  <title><dict:lang value="工具管理" /></title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <jsp:include page="/plf/common/pub_head.jsp">
      <jsp:param name="popDivWin" value="1" />
	  <jsp:param name="layui" value="1" />
  </jsp:include>
    <link href="/mc/plf/style/fonts/iconfont.css" rel="stylesheet" type="text/css">
    <link href="${path}/plf/page/wf/tool_management/css/style.css" rel="stylesheet" type="text/css">

</head>
<body>
  
<div class="layui-fluid process">
  <div class="workFlowIndex-header clear-float">
	<div class="search_table_wrap">
	   <form id="searchform" name="searchform"  class="layui-form" action="" method="post">
		  <div class="layui-input-inline search-box">
			<input type="text"  class="input_sh search-input" placeholder="<dict:lang value='搜索...' />" style="width:240px;text-indent: 10px;">
			<img src="images/search.png" class="search-png">
		   </div>
		  <input type="button"  id="" value="<dict:lang value='全部' />" onclick="" class="layui-btn">
		  <input type="button"  id="" value="<dict:lang value='已安装' />" onclick="" class="layui-btn layui-btn-primary">
		  <input type="button"  id="" value="<dict:lang value='未安装' />" onclick="" class="layui-btn layui-btn-primary">
	  </form>
	  
	</div>
	 <div class="btn-group">
	   <input type="button" onclick="upload()" value="<dict:lang value='上传' />"  class="layui-btn">	    
	 </div>
   </div>


	<div class="">
		  <div class="process-management clear-float" id="mainCard">
			    <div class="card-title">
			        <span  class="card-title-font">加密算法(3)</span>
			      <div class="card-body-toggle">
			            <i class="layui-icon layui-icon-down" style="font-size:14px;font-weight: bold;"></i>
			      </div>     
			    </div>
			    <div class="tools-box">
			        <div class="tool-item">
			             <div class="tool-img">
			                   <img src="images/test.jpg">
			             </div>
			             <div class="tool-item-content">
				              <div class="tool-font">
				                 <p><span>MD加密算法</span></span></p>
				                 <p><span>详细信息</span></p>
				              </div>
				             <div class="item-btn">
			                    <input type="button"  class="btn-uninstall" onclick="uninstall()" value="<dict:lang value='卸载' />"> 
			                 </div>
			              </div>
			             <div class="install-sign">
			                 <span>已安装</span>
			             </div>
			             
			        </div>
			        <div class="tool-item">
			             <div class="tool-img">
			                  <img src="images/test.jpg">
			             </div>
			             <div class="tool-item-content">
				              <div class="tool-font">
				                 <p><span>MD加密算法</span></span></p>
				                 <p><span>详细信息</span></p>
				              </div>
				              <div class="item-btn">
			                    <input type="button"  onclick="" value="<dict:lang value='安装' />"> 
			                 </div>
			              </div>
			             <div class="install-sign uninstall-sign">
			                 <span>未安装</span>
			             </div>
			          
			        </div>
			         <div class="tool-item  overdue">
			             <div class="tool-img">
			                  <img src="images/test.jpg">
			             </div>
			             <div class="tool-item-content">
			               <div class="tool-font">
			                 <p><span>MD加密算法</span></span></p>
			                 <p><span>详细信息</span></p>
			               </div>
			                <div class="overdue-sign">
			                  <img src="images/overdue.png">
			                </div>
			             </div>
			              
			             <div class="install-sign uninstall-sign">
			                 <span>未安装</span>
			             </div>
			          
			             
			        </div>
			      
			   </div>
		  </div>
		  
	</div>


</div>

  <script>
$(function(){

	 $('.card-body-toggle').click(function(){
		  $(this).parents("#mainCard").children(".tools-box").toggle();
		  if($(this).parents("#mainCard").children(".tools-box").css('display')==="none"){
			  $(this).children("i").removeClass('layui-icon-down');
			  $(this).children("i").addClass('layui-icon-up');
		  }
		  if($(this).parents("#mainCard").children(".tools-box").css('display')==="block"){
			  $(this).children("i").removeClass('layui-icon-up');
			  $(this).children("i").addClass('layui-icon-down');
		  }
	  });
	    /*$(".tool-item").click(function(){
	    	$(this).children(".select-sign").toggle();
	    	if($(this).children(".select-sign").css('display')==="block"){
	    		$(this).css("border","1px solid #009689");
	    	}
	    	if($(this).children(".select-sign").css('display')==="none")
	    	{
	    		$(this).css("border","1px solid #e2e2e2");
	    	}
	    	
	    })*/
	   

		
})
 
  var uploadUrl='${path}/plf/page/wf/tool_management/toolsUpload.jsp';
  var promptUrl='${path}/plf/page/wf/tool_management/uninstallTip.jsp';
	function upload(){
		showPopWin(uploadUrl, 600, 400,null,"<dict:lang value='工具上传' />");
	  }
    function uninstall(){
    	showPopWin(promptUrl, 260, 150,null,"<dict:lang value='摩尔提示' />");
    }
  
  </script>
  
  <jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>
</body>
</html>

