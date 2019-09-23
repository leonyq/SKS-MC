<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="模块管理" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
				<jsp:param name="zTree" value="1" />
				<jsp:param name="layui" value="1" />
		</jsp:include>
	</head>

	<script type="text/javascript">
util.showTopLoading("数据加载中 请稍后。。。。")
</script>
<div >	
	<form id="searchForm" name="searchForm" action="" method="post">
		<input type="hidden" id="MID" name="MID" value="${paraMap.MID }"/>
		
		<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		        <input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		        
			<table class="search_table">
				<tr>
					<td>
					<!--  
					<td width="100%">
						<div class="search_div">
							<div
								style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"
								class="search_text">
								<dict:lang value="模块名称" />
							</div>
							<div class="search_value">
								<s:textfield id="paraMap_MODEL_NAME" name="paraMap.MODEL_NAME1"
									cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />	
							</div>
						</div>
						<input style="margin-left: 10px;margin-top: 3px;" type="button" value="<dict:lang value="查询" />" onclick="query(1);" class="botton_img_search">
						</td>
						-->
						
					  	<div class="search_table_wrap">
				         <span><dict:lang value="模块名称" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="paraMap_MODEL_NAME" name="paraMap.MODEL_NAME1"
							cssClass="input_sh" maxlength="33"  />
				          </div>
				        </div>
				        
					  	<div class="search_table_wrap">
				         
				          <div class="layui-input-inline">
				             <input type="button" value="<dict:lang value="查询" />" onclick="query(1);" class="layui-btn"> 
				          </div>
				        </div>
				
					</td>
				</tr>
			</table>
		
			</form>
	<div>
	<div class="table_div">
    <table id="listTable" style="table-layout: fixed;"  width="600px" class="table_list">
		<thead>
		<tr >
			<th width="40px"><input  type="checkbox" id="SelectAll" onclick="selectAll(this)" style="width:40px;height:18px;vertical-align: middle;"></th>
			
			<th width="80px"><dict:lang value="编号" /></th>
			<th width=""><dict:lang value="模块名称" /></th>
			<th width=""><dict:lang value="模块说明" /></th>
			<th width="110px"><dict:lang value="接口类型" /></th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="configPage" status="index">
		<tr>
	<tr>
		   
			<td style="width:30px;text-align:center;"><input type="checkbox"   name='id' onchange="selectChange(this)" value="<c:out value='${ID}'/>"  style="width:40px;height:18px;vertical-align: middle;"></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"><s:property value="ID"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">
			<input type="hidden" id = "${ID}_MODEL_NAME"  value="${MODEL_NAME}">
			<input type="hidden" id = "${ID}_INTERFACEID"  value="${INTERFACEID}">
			<s:property value="MODEL_NAME"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"><s:property value="MODEL_MEMO"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">
			<input type="hidden" id = "${ID}_FLAG"  value="${FLAG}">
			<input type="hidden" id = "${ID}_module"  value="${MC_MODULE_NAME}">	
			<s:if test="FLAG==0">
				webservice服务端		
		</s:if>
		<s:elseif test="FLAG==1">
		    webservice客户端
		</s:elseif>
				<s:elseif test="FLAG==2">
		   http服务端
		</s:elseif>

		</td>


			

		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
	
	<%--
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>
--%>

<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
	
</div>
<script type="text/javascript">
util.closeTopLoading();
	$(function(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
		exportModule=window.parent.exportModule;		
		for(key in exportModule) {
		
				if(key.indexOf("cls") != 0 && key.indexOf("page") != 0 && key.indexOf("file") != 0 && key.indexOf("jar") != 0) {
					if(key == document.getElementById("MID").value) {
						var moduleDetailArr = exportModule[key];
			$("input[type='checkbox'][name='id']").each(function(i,e) {
							if(containBussDetail(moduleDetailArr, e.value)) {
					e.checked = true;
							}
						});
					}
				}
			
			}
		
	})
	
		//包含业务模型子集
	function containBussDetail(arr,obj) {
		for(var i=0; i<arr.length; i++) {
			if(arr[i].id == obj) {
				return true;
			}
		}
		
		return false;
	}

		//包含业务模型子集
	function CheckFromSource(arr,obj) {
		for(var i=0; i<arr.length; i++) {
			if(arr[i].id == obj) {
				return true;
			}
		}
		
		return false;
	}
	function save()
	{
		$("#exportModule").val(JSON.stringify(exportModule));
		var MODEL_ID=$("#MODEL_ID").val();
		if(MODEL_ID!=null&&MODEL_ID!=""){
			document.getElementById("submitForm").action="${path}sys/moduleMagAction_modifyModule.ms";
		}else{
			document.getElementById("submitForm").action="${path}sys/moduleMagAction_saveModule.ms";
		}
		document.forms.submitForm.submit();
	}
	
/* 	   function selectAll(){
		if ($("#SelectAll").attr("checked")){
			$(":checkbox").attr("checked",true);
			$("#listTable :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$(":checkbox").attr("checked",false);
			$("#listTable :checkbox").parents("tr").css("background-color","");
		}
	} */
	
		function selectAll(obj) {
		
		
		if(obj.checked) {
			var dom = $("input[type='checkbox'][name='id']:not(:checked)");
			dom.prop("checked",obj.checked);
			var str="";
			dom.trigger("change");
		
			
		}else {
			var dom = $("input[type='checkbox'][name='id']:checked");
			dom.prop("checked",obj.checked);
		
			dom.trigger("change");
			
			
		}
	}
	
	function selectChange(obj) {
		
			var mid = $("#MID").val();
			var id=obj.value;
			var flag = $("#"+id+ "_FLAG").val();
			var name= $("#"+id+ "_MODEL_NAME").val();
		var jsonObj = window.parent.exportModule;
			if(!jsonObj[mid]) {
				jsonObj[mid] = [];
			}

		
			if(obj.checked) {
				jsonObj[mid].push({
					"name":name,
					"id":id,
					"interfaceid":$("#"+id+"_INTERFACEID").val(),
					"type":"inter",
					"modType":"inter",
					"source":"auto",
					"flag":flag,
					"moduleName":$("#"+id+"_module").val()
				});
				var oldname = $("#"+id+"_module").val();
				if(oldname!=null&&oldname!="")
				{
					var nowname=$('#MODELS_NAME').val()+"."+$('#MODEL_NAME').val();
					if(oldname!=nowname)
					{
						util.alert("选择'"+name+"'会导致本模块与"+oldname+"模块冲突,本模块将无法与"+oldname+"模块共同安装");
					}
				}
			
				

			} else {
				var array=jsonObj[mid];
				var tag=false;
				for(var j = 0,len = array.length; j < len; j++)
				{
					if(array[j].id==id&&array[j].source=="dingshi")
					{
						$("input[type='checkbox'][value='"+id+"']").prop("checked", true);
					
						return;
					}
				}
					
				var index = indexOf(jsonObj[mid], id, null);
				if(index != -1) {
			
					jsonObj[mid].splice(index, 1);
				}

			}

			if(jsonObj[mid].length == 0) {
				delete jsonObj[mid];
			}

		$("#exportModule").val(JSON.stringify(exportModule));
		console.log(jsonObj)
	}
	
		function indexOf(arr, id, type) {
		for(var i = 0; i < arr.length; i++) {
			if(arr[i].id == id) {
				if(type != null) {
					if(arr[i].type == type) {
						return i;
					}
				}

				return i;

			}
		}

		return -1;
	}
	function flashPage(){
		query(document.getElementById("searchButtonId"));
	}
	function alertInfo(msg){
		util.alert(msg);
	}
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	function reloadPgExe(){
		document.forms.searchFormDel.submit();
		util.showTopLoading();
	}

	function query(thisObj){		
		//_pageCurrentPageObj.value="1";
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