<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="模块管理" /></title>

<%@ include file="/plf/common/pub_meta.jsp"%>

<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
</jsp:include>

<style type="text/css">
#moduletable {
	width: 90%;
}

#moduleLisTable>tr {
	width: 90%;
	height: 90px;
}

.lanExportLeftWrap {
	
}

.lanExportLeftWrap li {
	border: 1px solid #e9e9e9;
	margin: 2px auto;
}

.lanExportLeftWrap li a,span {
	display: block;
	padding: 10px 0 10px 10px;
	color: rgb(51, 51, 51);
	font-size: 12px;
	font-weight: bold;
}

.lanExportLeftWrap li a:hover {
	background-color: #009688;
	color: #FFFFFF;
}

.menucolor {
	background-color: #009688;
}

li.menucolor a {
	color: #FFFFFF;
}

ul,li {
	list-style-type: none;
}

.search {
	margin: 0 50px 10px 0px;
}

.tabFixed {
	table-layout: fixed; /* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
}

.tabFixed  td {
	word-break: keep-all; /* 不换行 */
	white-space: nowrap; /* 不换行 */
	overflow: hidden; /* 内容超出宽度时隐藏超出部分的内容 */
	text-overflow: ellipsis; /* for IE */
	-moz-text-overflow: ellipsis; /* for Firefox,mozilla,在chrome中测试也通过了*/
}

html,body {
	height: 100%;
}
</style>
<script>
	
	function initdata(){
		var jsonObj = window.parent.exportModule;
		for(key in jsonObj) {
				$("input[type='checkbox'][name='id']").each(function(i,e) {
					if(key==e.value)
					{
						e.checked = true;
					}});
				
				}
				
	}
	
	$(function(){
		var tableTrJs = $("#listTable tbody tr");	
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
		menuList($("#noMM"),'2');
	});
	
	var menuName = "无模块归属";
	
	//菜单的点击事件
	function menuList(objthis,num){
	<%--		util.showTopLoading();--%>
		 getMenuColor(objthis);
		 if(num=='1'){
		 $("#paraMap_MSGNAME").val("");
		 menuName=$(objthis).html()=="平台"?"mc_plf":$(objthis).html();
		 }
		 
		 
		$.ajax({
 			type: "POST",
 		    dataType: "json",
 		    url: "${path}sys/moduleMagAction_getLanguageList.ms",
 		    data: "paraMap.menuName="+menuName,
 			success: function(data){
 				
 				if(data){
 				
      			var languageData = data.ajaxMap.languageList;//数据
      			var languageType = data.ajaxMap.languageTypeList;//语种
      			
      			var num=0;
      			var table="";
      			var MSGNAME="";
      			var CHINESE = "";
      			var ENGLISH = "";
      			var TRADITIONAL = "";
      			//数据
      			$("#configPageX").empty();
      		 	for(var i = 0,k=languageData.length; i < k; i++,num++){ 
      		 		
      		 		if(languageData[i].CHINESE==null)languageData[i].CHINESE="";
      		 		if(languageData[i].ENGLISH==null)languageData[i].ENGLISH="";
      		 		if(languageData[i].TRADITIONAL==null)languageData[i].TRADITIONAL="";
      		 		
      		 		
      		 		 MSGNAME = encodeHtml(languageData[i].MSGNAME);
      		 		 CHINESE = encodeHtml(languageData[i].CHINESE);
      		 		 ENGLISH  = encodeHtml(languageData[i].ENGLISH);
      		 		 TRADITIONAL = encodeHtml(languageData[i].TRADITIONAL);
      		 		 
		     		table+="<tr>";
		     		table+="<td title='"+(i+1)+"'>"+(i+1)+"</td>";
					table+="<td style='width:50px;text-align:center;'><input  type='checkbox' name='id' onchange='selectChange(this)' value='"+MSGNAME+"' style='margin:0'></td>";
					table+="<td title='"+MSGNAME+"'><input type='hidden' id='"+MSGNAME+"_module' value='"+encodeHtml(languageData[i].MC_MODULE_NAME)+"' >"+MSGNAME+"</td>";
					table+="<td title='"+CHINESE+"'>"+CHINESE+" </td>";
					table+="<td title='"+ENGLISH+"'>"+ENGLISH+"</td>";
					table+="<td title='"+TRADITIONAL+"'>"+TRADITIONAL+"</td>";
					
					var ar =languageData[i].LIST;
					
					if(languageData[i].LIST!=null){
					for(var j = 0,p=ar.length; j <p ; j++){
						table+="<td title='"+encodeHtml(ar[j])+"'>"+encodeHtml(ar[j])+"</td>";
					}
					}
					table+="</tr>";
					if(num > 100||i == k-1){
					
					$("#configPageX").append(table);
					table="";
					num=0;
					}
					
      			} 
      			
      			//语种
      			$(".colFlag").remove();
      				for(var z = 0; z < languageType.length; z++){
						$("#addData tr:last").append("<th width='110px' class='colFlag'>"+encodeHtml(languageType[z])+"</th>");
					}	
      			}
      				initdata();
      				util.closeTopLoading(); 
      				
 				},
 			error: function(msg){
 					util.closeLoading();
 					util.alert("error:"+msg);
 			  }
 			});	
	}
	
	//查询
	function searchx(){
		<%--		util.showTopLoading();--%>
		var valStr=$("#paraMap_MSGNAME").val();//查询的值
		valStr = _mcBase64JsToJava.getMcDealBase64Encode(valStr); 
		 
		$.ajax({
 			type: "POST",
 		    dataType: "json",
 		    url: "${path}sys/moduleMagAction_searchLanguageList.ms",
 		    data: "paraMap.valStr="+valStr+"&paraMap.menu="+menuName,
 			success: function(data){
      				
      				if(data){
 				
      			var languageData = data.ajaxMap.languageList;//数据
      			var languageType = data.ajaxMap.languageTypeList;//语种
      			
      			var num=0;
      			var table="";
      			var MSGNAME="";
      			var CHINESE = "";
      			var ENGLISH = "";
      			var TRADITIONAL = "";
      			//数据
      			$("#configPageX").empty();
      		 	for(var i = 0,k=languageData.length; i < k; i++,num++){ 
      		 		
      		 		if(languageData[i].CHINESE==null)languageData[i].CHINESE="";
      		 		if(languageData[i].ENGLISH==null)languageData[i].ENGLISH="";
      		 		if(languageData[i].TRADITIONAL==null)languageData[i].TRADITIONAL="";
      		 		
      		 		
      		 		 MSGNAME = encodeHtml(languageData[i].MSGNAME);
      		 		 CHINESE = encodeHtml(languageData[i].CHINESE);
      		 		 ENGLISH  = encodeHtml(languageData[i].ENGLISH);
      		 		 TRADITIONAL = encodeHtml(languageData[i].TRADITIONAL);
      		 		 
		     		table+="<tr>";
		     		table+="<td title='"+(i+1)+"'>"+(i+1)+"</td>";
					table+="<td style='width:50px;text-align:center;'><input  type='checkbox' name='id' onchange='selectChange(this)' value='"+MSGNAME+"' style='margin:0'></td>";
					table+="<td title='"+MSGNAME+"'><input type='hidden' id='"+MSGNAME+"_module' value='"+encodeHtml(languageData[i].MC_MODULE_NAME)+"' >"+MSGNAME+"</td>";
					table+="<td title='"+CHINESE+"'>"+CHINESE+" </td>";
					table+="<td title='"+ENGLISH+"'>"+ENGLISH+"</td>";
					table+="<td title='"+TRADITIONAL+"'>"+TRADITIONAL+"</td>";
					
					var ar =languageData[i].LIST;
					
					if(languageData[i].LIST!=null){
					for(var j = 0,p=ar.length; j <p ; j++){
						table+="<td title='"+encodeHtml(ar[j])+"'>"+encodeHtml(ar[j])+"</td>";
					}
					}
					table+="</tr>";
					if(num > 100||i == k-1){
					
					$("#configPageX").append(table);
					table="";
					num=0;
					}
					
      			} 
      			
      			//语种
      			$(".colFlag").remove();
      				for(var z = 0; z < languageType.length; z++){
						$("#addData tr:last").append("<th width='110px' class='colFlag'>"+encodeHtml(languageType[z])+"</th>");
					}	
      			}
      				initdata();
      				util.closeTopLoading(); 
 				},
 			error: function(msg){
 					util.closeLoading();
 					util.alert("error:"+msg);
 			  }
 			});	
	}
	
	//获取菜单颜色
	function getMenuColor(objthis){
		$(".menucolor").removeClass("menucolor");
		$(objthis).parent().addClass("menucolor");		
	}
	//完成
	
	//包含业务模型子集
	function containBussDetail(arr,obj) 
	{
		for(var i=0; i<arr.length; i++) {
			if(arr[i].id == obj) {
				return true;
			}
		}
		
		return false;
	}
	
	
	// 全选复选框
	function selectAll(obj) 
	{
	
		if(obj.checked) {
			var dom = $("input[type='checkbox'][name='id']:not(:checked)");
			dom.prop("checked",obj.checked);
			dom.trigger("change");
		}else {
			var dom = $("input[type='checkbox'][name='id']:checked");
			dom.prop("checked",obj.checked);
			dom.trigger("change");
		}
		
	}
	
	//复选框选中
	function selectChange(obj) {
		var id=obj.value;
		var jsonObj = window.parent.exportModule;
			if(!jsonObj[id]) {
				jsonObj[id] = [];
			}

			
			if(obj.checked) {
				jsonObj[id].push({
					"modType": "language",
					"type": "language",
					"moduleName":document.getElementById(id+"_module").value,//$("#"+id+"_module").val()
					"id":id
				});
			} else {
				delete jsonObj[id];

			}
	} 
	
	/* function query(thisObj){
		document.getElementById("searchForm").target="";
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		
		<%--		util.showTopLoading();--%>
	} */
	
	function alertInfo(msg){
		util.alert(msg);
	}
	function reloadPg(msg){
		 isSubmit = false;
		window.parent.reloadPg(msg); 
	}
	function reloadPgExe(){
		 document.forms.searchFormDel.submit();
	<%--		util.showTopLoading();--%> 
	}
	
		function indexOf(arr, id, type) {
		for(var i = 0; i < arr.length; i++) {
			if(arr[i].mid == id) {
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
		searchx();
	}
	</script>
</head>
<body>

	<script type="text/javascript">
<%--		util.showTopLoading("数据加载中 请稍后。。。。")--%>
	</script>
	<div
		style="width:27%;height:100%;float:left;overflow:auto;overflow-x:hidden;margin-top: 15px;">


		<ul id="moduletable" class="lanExportLeftWrap" style="margin:auto;">
			<li class="menucolor"><a href="javascript:void(0);"
				onclick="menuList(this,'1')" id="noMM" >无模块归属</a></li>
			<li><a href="javascript:void(0);" onclick="menuList(this,'1')">平台</a>
			</li>
			<s:iterator value="dataMap.moduleList" id="configPage" status="index">
				<li><a href="javascript:void(0);" onclick="menuList(this,'1')"><s:property
							value="MC_MODULE_NAME" /> </a>
				</li>
			</s:iterator>

		</ul>

	</div>


	<div
		style="width:72%;height:100%;margin-right:0px;float:right;overflow:auto;overflow-x:hidden;margin-top: 15px;">
		<div class="search">
			<form id="searchForm" name="searchForm"
				action="${path}sys/BussModelAction_languageExport.ms" method="post">

				<div style="position: relative; ">
				   <label><dict:lang value="属性名称" /></label>
					<s:textfield id="paraMap_MSGNAME" name="paraMap.MSGNAME"
						cssClass="input_sh" maxlength="33" cssStyle="width:180px;margin-left:10px;" />
					<input style="margin-left: 10px;margin-top: 3px;" type="button"
						value="<dict:lang value="查询" />" onclick="searchx();"
						class="botton_img_search">
				</div>

				<s:hidden id="exportModule" name="paraMap.exportModule"></s:hidden>
				<s:hidden id="MODEL_NAME" name="paraMap.MODEL_NAME"></s:hidden>
				<s:hidden id="MODEL_SHOW_NAME" name="paraMap.MODEL_SHOW_NAME"></s:hidden>
				<s:hidden id="MODEL_VERSION" name="paraMap.MODEL_VERSION"></s:hidden>
				<s:hidden id="MODELS_NAME" name="paraMap.MODELS_NAME"></s:hidden>
				<s:textarea id="MODEL_MEMO" name="paraMap.MODEL_MEMO"
					cssStyle="display:none;word-wrap: normal;" wrap="off"></s:textarea>
				<s:hidden id="MODEL_TYPE" name="paraMap.MODEL_TYPE"></s:hidden>
				<s:hidden id="MODEL_ID" name="paraMap.ID"></s:hidden>
				<s:hidden id="MODEL_START_ORDER" name="paraMap.MODEL_START_ORDER"></s:hidden>
				<s:hidden id="MODEL_DATABASE" name="paraMap.MODEL_DATABASE"></s:hidden>
				<s:hidden id="codeType" name="paraMap.paraCodeType" />
				<s:hidden id="paraCodeId" name="paraMap.paraCodeId" />
				<s:hidden id="className" name="paraMap.paraCodeName" />
				<s:textarea id="classCode" name="paraMap.paraClsCode"
					value="%{paraMap.paraClsCode}"
					cssStyle="display:none;word-wrap: normal;" wrap="off" />
				<s:hidden id="MC_ID_MYSQL" name="paraMap.MC_ID_MYSQL" />
				<s:hidden id="MC_ID_SQLSERVER" name="paraMap.MC_ID_SQLSERVER" />
				<s:hidden id="MC_ID_ORACLE" name="paraMap.MC_ID_ORACLE" />
				<s:hidden id="MC_ID_BASE" name="paraMap.MC_ID_BASE" />
				<s:hidden id="MC_ID_PG" name="paraMap.MC_ID_PG" />
			</form>
		</div>
		<iframe id="submitFrame1" name="submitFrame1" src="" width="0"
			height="0"></iframe>

		<div style="overflow:auto;overflow-x:auto;height:82%;margin: 0 15px;">
			<table id="listTable" style="table-layout: fixed;"
				class="tabFixed table_list">
				<thead id="addData">
					<tr class="tdcolor">
						<th width="40px"><dict:lang value="序号" />
						</th>
						<th width="40px"><input type="checkbox" id="SelectAll"
							onclick="selectAll(this)" style="margin:0">
						</th>
						<th ><dict:lang value="属性名称" />
						</th>
						<th width="110px"><dict:lang value="中文属性值" />
						</th>
						<th width="110px"><dict:lang value="英文属性值" />
						</th>
						<th width="110px"><dict:lang value="繁体属性值" />
						</th>
						<s:iterator value="dataMap.languageTypeList" status="state">
							<th width="110px" class="colFlag"><c:out
									value='${dataMap.languageTypeList[state.index]}' />
							</th>
						</s:iterator>
					</tr>
				</thead>
				<tbody id="configPageX">
				
				</tbody>
			</table>
		</div>



<%--		<div class="ptop_10 txac" style="margin-top:10px;">--%>
<%--			<input id="nextButton" type="button" value="<dict:lang value="完成" />"--%>
<%--				onclick="save(this);" class="botton_img_update"> <input--%>
<%--				id="upButton" type="button" value="<dict:lang value="上一步" />"--%>
<%--				onclick="up(this);" class="botton_img_add"> <input--%>
<%--				id="nextButton" type="button" value="<dict:lang value="下一步" />"--%>
<%--				onclick="next(this);" class="botton_img_add">--%>
<%--		</div>--%>

	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>