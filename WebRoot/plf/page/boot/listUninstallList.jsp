<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="模块管理" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
				<jsp:param name="zTree" value="1" />
		</jsp:include>
	</head>
	<script src="${path}plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>"></script>
<script src="${path}plf/js/highcharts/fileUpload.js?_mc_res_version=<%=PlfStaticRes.FILEUPLOAD_JS %>"></script>
<body>

<div class="all">	
	<div style="position: relative">
	<form id="searchForm" name="searchForm" action="${path}sys/moduleMagAction_queryUninstallList.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<table class="search_table">
		<tr>
			<td>
			<div class="search_table_wrap">
				<span><dict:lang value="模块名称" /></span>
				<div class="layui-input-inline">
					<s:textfield id="nameSh" name="nameSh" cssClass="input_sh" maxlength="300" />
				</div>
			</div>
			<div class="search_table_wrap">
				<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
			   <input type="button" id="upbtn" value="<dict:lang value="导入" />" class="layui-btn"> <input type="file"
						style="display:none;" id="upfile" name="upfile" >
						<input type="button" id="impbtn" style="display: none;" onclick="importModule()" value="<dict:lang value="导入" />" class="layui-btn"/>
			</div>
			    
		  	</td>
	    </tr>
		</table>
				
			<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
			</form>
			</div>
			<div class="table_div">
    <table id="listTable" class="table_list">
		<s:if test="unsize==0||unsize==null">
		<!-- 查无信息 -->
			<div class="listUninstallListDefaultImg searchResultWrap">
				<div class="searchResult"></div>
				<a href="javascript:void(0)">搜索不到相关内容</a>
			</div>
		</s:if>
		<s:else>
		<thead>
		<tr class="tdcolor">
			<th width="40px"><dict:lang value="序号" /></th>
			<th><dict:lang value="模块名称" /></th>
			<th width="110px"><dict:lang value="模块类型" /></th>
			<th width="110px"><dict:lang value="模块版本号" /></th>
			<th width="200px"><dict:lang value="模块ip端口" /></th>
			<th width="200px"><dict:lang value="操作" />
			</th>
		</tr>
		</thead>
		<tbody>
		
		
			<s:iterator value="uninstallList" id="configPage" status="index">
				<tr id="<s:property value="ID"/>">
					<td><s:property value="#index.count"/></td>
					
					<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="name"/>><s:property value="name"/></td>
					<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="type"/>><s:property value="type"/></td>
					<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="version"/>><s:property value="version"/></td>
					<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="IPPORT"/>><s:property value="IPPORT"/></td>
					<td>
						<a href="javascript:void(0);" class="layui-btn layui-btn-danger layui-btn-xs" onclick="del('<s:property value="name"/>');" title="<dict:lang value="卸载(用户自建表)" />"  >
							<dict:lang value="卸载(用户自建表)" />
						</a>
						<a href="javascript:void(0);" class="layui-btn layui-btn-normal layui-btn-xs" onclick="uninstall('<s:property value="name"/>');" title="<dict:lang value="卸载" />"  >
						<dict:lang value="卸载" />
						</a>
						<!--
						<a href="javascript:void(0);" onclick="overdue('<s:property value="name"/>');" title="<dict:lang value="过期" />" prefix="&nbsp;" >
						<img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>" />
						</a>
						<a href="javascript:void(0);" onclick="delay('<s:property value="name"/>');" title="<dict:lang value="延期" />" prefix="&nbsp;" >
						<img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>" />
						</a>
						-->
					</td>
				</tr>
	</s:iterator>
	
	</tbody>
	</table>
	</div>
	
	
	
	<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
	<input type="hidden" id="name" value="<s:property value="ajaxMap.name"/>">
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
	</s:else>
		<form id="exportForm" action="${path}sys/moduleMagAction_exportMod.ms" method="post" target="submitFrame">
		</form>
			<div style="display: none;">
			<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
		</div>
</div>
<script type="text/javascript">
$("#upfile").change(function() {
	if ($(this).val()) {
		var fileName = $(this)[0].files[0].name;
		$(this).prev().prev().html(fileName);
		$(this).prev().prev().attr("title", fileName);
		//getUpFile(); //上传文件
		upFile();
		//$(this).val("");
		
	} else {
		$(this).prev().prev().html("<dict:lang value="请选择文件" />"+"...");
	}
});
$("#upbtn").click(function() {
	$("#upfile").click();
});

//隐藏table
function hideTable() {
	$("#listTable").hide();
}
//删除
var delId = "";
var uninstallName= "";
function del(name){
	util.confirm(delConfirm,"确定是否删除用户自建表数据?");
	uninstallName= name;
}

function delConfirm(){
   	 $.ajax({
			type: "POST",
		    dataType: "json",
		    url: "${path}sys/moduleMagAction_uninstallModule.ms",
		    data: {'paraMap.moduleName':uninstallName,'paraMap.delFlag':true},
			success: function(data){
					if(data.ajaxMap != null && data.ajaxMap != ""){
						if(data.ajaxMap.status == "true"){
							util.alert("<dict:lang value="卸载成功！" />");
							reloadPgExe();
						}else{
							util.alert(data.ajaxMap.msg);
						}
					}
				},
			error: function(msg){
					util.closeLoading();
					util.alert("error:"+msg);
			  }
			});		
}
//显示table
function showTable() {
	$("#listTable").show();
}

var dataList = null;
function upFile() {
	$.ajaxFileUpload({
		url : "${path}sys/moduleMagAction_importMod.ms",
		secureuri:false,
		fileElementId:"upfile",
		dataType:'text',
		data:{},
		success:function(data,status)
		
		{
			var reg = /<pre.+?>(.+)<\/pre>/g;  
			var result = data.match(reg);  
	        var result1 = RegExp.$1;
			var map1= jQuery.parseJSON(result1);
			if(map1.ajaxMap.status=='false'){
				util.alert(map1.ajaxMap.msg);
			}else{
				 window.location.href = "${path}sys/moduleMagAction_listUninstallList.ms";
			}
			
		},
		complete: function(xmlHttpRequest) {  
            $("#upfile").replaceWith('<input type="file" id="upfile" name="upfile" style="display:none;"/>');  
            $("#upfile").on("change", function(){  
            	var fileName = $(this)[0].files[0].name;
                $("#upfile").prev().prev().html(fileName);
				$("#upfile").prev().prev().attr("title", fileName);
				upFile();
            });  
        }
	});

}

	function flashPage(){
		query(document.getElementById("searchButtonId"));
	}
	function alertInfo(msg){
		util.alert(msg);
	}
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	//卸载
	
	function uninstall(name){
		util.confirm(uninstallConfirm);
		uninstallName = name;
	}
	function uninstallConfirm(){
       	 $.ajax({
    			type: "POST",
    		    dataType: "json",
    		    url: "${path}sys/moduleMagAction_uninstallModule.ms",
    		    data: "paraMap.moduleName="+uninstallName,
    			success: function(data){
         				if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.status == "true"){
    								util.alert("<dict:lang value="卸载成功！" />");
    								reloadPgExe();
    							}else{
    								util.alert(data.ajaxMap.msg);
    							}
         				}
    				},
    			error: function(msg){
    					util.closeLoading();
    					util.alert("error:"+msg);
    			  }
    			});		
	}
	function delay(name){
		util.confirm(delayConfirm);
		uninstallName = name;
	}
	function delayConfirm(){
       	 $.ajax({
    			type: "POST",
    		    dataType: "json",
    		    url: "${path}sys/moduleMagAction_delayModule.ms",
    		    data: "paraMap.moduleName="+uninstallName,
    			success: function(data){
         				if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.status == "true"){
    								util.alert("<dict:lang value="延期成功！" />");
    								reloadPgExe();
    							}else{
    								util.alert("<dict:lang value="延期失败" />:"+data.ajaxMap.msg);
    							}
         				}
    				},
    			error: function(msg){
    					util.closeLoading();
    					util.alert("error:"+msg);
    			  }
    			});		
	}
	function overdue(name){
		util.confirm(overdueConfirm);
		uninstallName = name;
	}
	function overdueConfirm(){
       	 $.ajax({
    			type: "POST",
    		    dataType: "json",
    		    url: "${path}sys/moduleMagAction_overdueModule.ms",
    		    data: "paraMap.moduleName="+uninstallName,
    			success: function(data){
         				if(data.ajaxMap != null && data.ajaxMap != ""){
    							if(data.ajaxMap.status == "true"){
    								util.alert("<dict:lang value="过期成功！" />");
    								reloadPgExe();
    							}else{
    								util.alert("<dict:lang value="过期失败" />:"+data.ajaxMap.msg);
    							}
         				}
    				},
    			error: function(msg){
    					util.closeLoading();
    					util.alert("error:"+msg);
    			  }
    			});		
	}
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchFormDel.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
	function view(id){
		 $.ajax({
 			type: "POST",
 		    dataType: "json",
 		    url: "${path}sys/workMagAction_findClass.ms",
 		    data: "paraMap.id="+id,
 			success: function(data){
      				if(data.ajaxMap != null && data.ajaxMap != ""){
 							if(data.ajaxMap.status == "true"){
 								var id=data.ajaxMap.msg;
 								var url = "${path}sys/JClzAction_showView.ms?paraMap.CODE_ID="+id;
 								showPopWin(url, "95%", "100%",null,"<dict:lang value="自定义类查看" />");
 							}else{
 								util.alert(data.ajaxMap.msg);
 							}
      				}
 				},
 			error: function(msg){
 					util.closeLoading();
 					util.alert("error:"+msg);
 			  }
 			});		
		
	}
	function query(thisObj){
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>