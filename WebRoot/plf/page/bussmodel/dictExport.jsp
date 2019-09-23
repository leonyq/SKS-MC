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
		
		
	
<style type="text/css">
	#moduletable{
		width:90%;
	}
	
	#moduleLisTable > tr{
		width:90%;
		height:90px;
	}
	.lanExportLeftWrap {
	}
	    .lanExportLeftWrap li {
	    	border: 1px solid #e9e9e9;
	    	margin: 2px auto;
	    	
	    }
	.lanExportLeftWrap li a {
		display: block;
		padding: 10px 0 10px 10px;
		color: rgb(51, 51, 51);
		font-size: 12px;
		font-weight: bold;
	}
	.lanExportLeftWrap li a:hover {
		background-color: #009688;
	}
	.lanExportLeftWrap li a.cur {
		background-color: #009688;
	}
	li.menucolor a {
		color: #FFFFFF;
	}
	ul, li {
	  list-style-type: none;
	}
	html{
	    background-color: #FFFFFF;
	}
</style>

	</head>


<body  >
<script type="text/javascript">
<%--		util.showTopLoading("数据加载中 请稍后。。。。")--%>
</script>

<!-- 改造代码 -->
	 
<div style="width:27%;height:618px;float:left;overflow:auto;overflow-x:hidden;margin-top: 15px;">
			<!-- 模块列表  -->
			
			<ul id="moduletable" class="lanExportLeftWrap" style="margin:auto;">
				<!-- 
				<li>
					<a href="#">无模块归属</a>
				</li>
				 -->

				<s:iterator value="ajaxMap.moduleList" id="moduleList" status="index">
					<s:if test="module_type=='无模块归属'">
						<li style='background-color: #009688' id='module_${module_type}'>
							<a href="javascript:void(0);" onclick="ajaxdictlist('${module_type}')" >${module_type}</a>
						</li>
						
					</s:if>
					<s:else>
						<li id='module_${module_type}'>
							<a href="javascript:void(0);" onclick="ajaxdictlist('${module_type}')" >${module_type}</a>
						</li>
					
					</s:else>
							
				</s:iterator>
				
			</ul>
			 
</div>
		
		
<div style="width:72%;height:height:508px;margin-right:0px;float:left;overflow:auto;overflow-x:hidden;margin-top: 15px;" >
			
		<div class="all">	
		
		<form id="searchForm" name="searchForm" action="${path}/sys/BussModelAction_dictExport.ms" method="post" target="submitFrame1">
		<div>
		<div style="position: relative; ">
		<dict:lang value="编码值" />
		<s:textfield id="paraMap_VALUE" name="paraMap.VALUE" cssClass="input_sh" maxlength="33" cssStyle="width:180px;margin-left:10px;" />
		<input style="margin-left: 10px;margin-top: 3px;" type="button" value="<dict:lang value="查询" />" onclick="query_new();" class="botton_img_search">
			</div>					
				</div>	
					</tr>
				</table>
				
					<s:hidden id="exportModule" name="paraMap.exportModule"></s:hidden>
		</form>
		<iframe id="submitFrame1" name="submitFrame1" src="" width="0" height="0"></iframe>
		
		
		<!-- 模块列表数据 -->		
		<div style="overflow:auto;overflow-x:hidden;height:500px;margin-top: 12px;">
				<table id="listTable" style="table-layout: fixed;" class="table_list">
				<thead>
				<tr class="tdcolor">
					<th width="40px"><dict:lang value="序号" /></th>
					<th width="40px"><input  type="checkbox" id="SelectAll" onclick="selectAll(this)" style="margin:0"></th>
					<th width="110px"><dict:lang value="编码(key)" /></th>
					<th width="110px"><dict:lang value="编码值(value)" /></th>
					<th><dict:lang value="备注" /></th>
					
				</tr>
				</thead>
				
				<tbody id="module_dict_tbody">
				
				</tbody>
				
			</table>
		</div>
			
		

		
	</div>
		
</div>
<!-- 改造代码 -->
	
	
	
	
	
<script type="text/javascript">	
	/* 公用js   begin */
	var moduletype_val='';
	
	
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
<%--		util.showTopLoading();--%>
	}

	//包含业务模型子集
	function containBussDetail(arr,obj) {
		for(var i=0; i<arr.length; i++) {
			if(arr[i].id == obj) {
				return true;
			}
		}
		
		return false;
	}
	
	/* 公用js   end */
	
</script>	
	
	
<script type="text/javascript">		
	/* 业务js   begin */
	
	//初始化选中数据
    function init_checkbox(){
    	//取出上一步传下来的数据进行选中初始化?
    			var jsonObj = window.parent.exportModule;
		for(key in jsonObj) {
			$("input[type='checkbox'][name='id']").each(function(i,e) {
				if(key==e.value){
					e.checked = true;
				}
			});
			
		}
		
    }
    
    //异步加载模块下数据字典数据
    function ajaxdictlist(moduletype){    	
    	if(moduletype==null || moduletype==''){
    		moduletype="无模块归属";
    		
    	}
    	
    	moduletype_val=moduletype;
    	
    	var ul = document.getElementById('moduletable');
		var lis = ul.getElementsByTagName('li');
		for(var i=0;i<lis.length;i++){
				var obj=lis[i];
				var cur_id=obj.getAttribute('id');
				var id='module_'+moduletype;
				if(cur_id==id){
					document.getElementById(cur_id).setAttribute('style', 'background-color: #009688');
				}else{	
					document.getElementById(cur_id).setAttribute('style', 'background-color: ');
				}
		}
    	
    	var modulename=document.getElementById("paraMap_VALUE").value;
    	
		$.ajax({
	           url:'${path}/sys/BussModelAction_ajaxdictlist.ms',
	           type:'GET',
	           dataType:'json',
	           data: {
	           	"paraMap.moduletype":moduletype,
	           	"paraMap.modulename":modulename
	           },
	           success:function (res) {
	           	   var dict_str=res.ajaxMap.dictlist_str;
	               //alert(dict_str);
	               if(dict_str!=null && dict_str!=''){
	               		document.getElementById('module_dict_tbody').innerHTML=dict_str;
	               		
	               		//初始化选中数据
						init_checkbox();
<%--	               		util.closeTopLoading();--%>
		
	               }else{
	               	document.getElementById('module_dict_tbody').innerHTML='';
	               
	               }
	               
	           }
	           
		});
		
		
    }
	
	$(function(){
		var tableTrJs = $("#listTable tbody tr");
		//_toClickColor(tableTrJs);
		//_tongLineColor(tableTrJs);
		
		//异步加载模块下数据字典数据
		ajaxdictlist('');

	})

	//全选?
	function selectAll(obj) {
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
	
	//勾选变更	exportModule ?
	function selectChange(obj) {
			var id=obj.value;
			var value = $("#"+id+"_V").text();
			var code = $("#"+id+"_C").val();
			var jsonObj = window.parent.exportModule;
			if(!jsonObj[id]) {
				jsonObj[id] = [];
			}

		
			if(obj.checked) {
				jsonObj[id].push({
					"code": code,
					"vaule":value,
					"type": "dict",
					"modType": "dict",
					"id": id,
					"moduleName":$("#"+id+"_module").val()
				});
				var oldname = $("#"+id+"_module").val();
				if(oldname!=null&&oldname!="")
				{
					var nowname=$('#MODELS_NAME').val()+"."+$('#MODEL_NAME').val();
					if(oldname!=nowname)
					{
						util.alert("选择'"+code+"'会导致本模块与"+oldname+"模块冲突,本模块将无法与"+oldname+"模块共同安装");
					}
				}
			} else {
				delete jsonObj[id];
			}

			//alert(JSON.stringify(exportModule));
			$("#exportModule").val(JSON.stringify(exportModule));
			console.log(jsonObj)
	}
	
	//查询?
	function query(thisObj){
		document.getElementById("searchForm").target="";
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
<%--		util.showTopLoading();--%>
	}
	
	function query_new(){
		ajaxdictlist(moduletype_val);
		
	}
	
	/* 业务js   end */
	
	
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>