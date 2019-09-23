
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="java.io.*" %> 
<%@page import="java.util.*"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="视图模型"/><dict:lang value="列表"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="dhtmlxtree" value="1" />
		</jsp:include>
		
	</head>
  </head>
<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>
<%
String filepath = application.getRealPath("/");
%>
<body>
	<div id = "importDiv">
		<table class="search_table">
			<tbody>
				<tr>
					<td width="20%" align="right">
	  					<input id= "importButton" value="导入" type="button" disabled="disabled" class="botton_img_disable"></input>
					</td>
				</tr>
			</tbody>
		</table>
		<form action="${path}sys/BussModelAction_importMod.ms" name="importform" id="importform" method="post" enctype="multipart/form-data">
		   <table class="table_list">
			<tr>
			    <td>
			    <input id = "upfile" name="upfile" type= "file" accept="application/zip" size=30></input><!--  multiple="multiple"  -->
			    
			    <input id = "upfileText" name="paraMap.upfileText" type= "text" style="display:none"></input>
			    </td>
			    <!--  
			    <input id = "upfileText" name="upfileText" type= "text" size="30"></input>
			    </td>
			    <td>
			    <input id = "upfileButton" name="upflieButton" type="button" value="选择文件"></input>
			    </td>
			    -->
			    <td>
			    <input id = "preview" name="preview" type="button" value="上传" ></input>
				
			    </td>
			    
			</tr>
			<tr>
			<td colspan="2">
			<span class="Eng"><span id="error_msg"></span></span>
			</td>
			
			</tr>
				
			</table>
		    <div id = "context"></div>
	 	</form>
	  	
	</div>
</body>

<!--  //jquery升级，把原有1.7.2的版本全部升级到1.9.1 -->
<script src="${path}plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>"></script>

 
<script src="${path}plf/js/highcharts/fileUpload.js?_mc_res_version=<%=PlfStaticRes.FILEUPLOAD_JS %>"></script>
  <script>
  $(function()
  {
  	var importButton = document.getElementById("importButton");
  	var previewButton = document.getElementById("preview");
  	var importDiv = document.getElementById("importDiv");
  	var contextElement = document.getElementById("context");
  	//var upfileButton = document.getElementById("upfileButton");
  	var upfile = document.getElementById("upfile");
  	var upfileText = document.getElementById("upfileText");
  	/*upfileButton.onclick = function(e)
  	{
  		var ie = navigator.appName=="Microsoft Internet Explorer"? true:false;
  		if(ie)
  		{
  			upfile.click();
  			upfileText.value = upfile.value;
  		}
  		else
  		{
  			var event = document.createEvent("MouseEvents");
  			event.initEvent("click",true,true);
  			upfile.dispatchEvent(event);
  		}

  	};*/

  	importButton.onclick = function(e)
	{
		upfileText.value = upfile.value;
		document.forms.importform.submit();
	};
	previewButton.onclick = function(e)
	{
		var fileName =document.getElementById("upfile").value;
		 if(fileName==""||fileName==undefined){
			 	document.getElementById("error_msg").innerHTML = "<dict:lang value="请先选择文件,再点击上传"/>";
		    	window.setTimeout("closeValMsg('error_msg')", 2000);
		    	return false;
		 }
		
		$.ajaxFileUpload({
			url : "${path}sys/BussModelAction_showModuleName.ms",
			secureuri:false,
			fileElementId:"upfile",
			dataType:'text',
			data:{},
			success:function(data,status)
			{
				if(data==""){
					document.getElementById("error_msg").innerHTML = "<dict:lang value="上传内容不是指定规格内容,请重新上传！"/>";
			    	window.setTimeout("closeValMsg('error_msg')", 5000);
			    	$("#importButton").removeClass();
					$("#importButton").attr("disabled",true)
					$("#importButton").addClass("botton_img_disable");
					$("div").remove("#context div"); 
					return false
				}
				data = eval("(" + data + ")");
				var context = "";
				$("div").remove("#context div"); 
				$("#context").append("<div><table class=\"table_list\"><tr><td>" + fileName + "</td></tr></table></div>");
				$("#context").append("<div><table class=\"table_list\"><tr><td>导入的模块信息</td></tr></table></div>");
				for(var key in data)
				{
					$("#context").append("<div><table class=\"table_list\"><tr><td>"+ data[key] +"</td></tr></table></div>");
				}
				$("#importButton").removeClass();
				$("#importButton").attr("disabled",false)
				$("#importButton").addClass("botton_img_search");
				summary.value = context;
			}
		});
	};
  });
  function closeValMsg(objthis){
  	document.getElementById(objthis).innerText = "";
  }
  </script>

<%@ include file="/plf/common/pub_end.jsp" %>