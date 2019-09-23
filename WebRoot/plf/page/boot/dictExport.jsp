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
	height: 21px;
    line-height: 21px;
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
	margin: 10px 5px 40px 0px;
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

	</head>


<body onload="init()" >
<script type="text/javascript">
		//util.showTopLoading("数据加载中 请稍后。。。。")
</script>
<div>

	<div class="crumbs" id="crumbs" style="margin:5px 0px 0px 37px;">
    </div>
<!-- 改造代码 -->
<div style="overflow: hidden;">
<div style="width:27%;height:80%;float:left;overflow:auto;overflow-x:hidden;">
			<!-- 模块列表  -->
			
			
			<ul id="moduletable" class="lanExportLeftWrap" style="margin:auto;">
			<h3 class="moduleTitle" style="margin-top:10px;">模块列表</h3>
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
		
		
<div style="width:72%;height:450px;margin-right:0px;float:left;overflow:auto;overflow-x:hidden;" >
			
		<div class="clearfix">	
		<form id="searchForm" name="searchForm" action="${path}/sys/moduleMagAction_dictExport.ms" method="post" target="submitFrame1">
		
		<div style="float:left;margin:15px;">
		<dict:lang value="编码值" />
		<s:textfield id="paraMap_VALUE" name="paraMap.VALUE" cssClass="input_sh" maxlength="33" cssStyle="width:180px;height:38px;margin-left:10px;text-indent:10px;" />
		<input style="margin-left: 10px;margin-top: 3px;" type="button" value="<dict:lang value="查询" />" onclick="query_new();" class="botton_img_search">
		</div>					
					
					<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				
					<s:hidden id="exportModule" name="paraMap.exportModule"></s:hidden>
					<s:hidden id="MODEL_NAME" name="paraMap.MODEL_NAME"></s:hidden>
					<s:hidden id="MODEL_SHOW_NAME" name="paraMap.MODEL_SHOW_NAME"></s:hidden>
					<s:hidden id="MODEL_VERSION" name="paraMap.MODEL_VERSION"></s:hidden>
					<s:hidden id="MODELS_NAME" name="paraMap.MODELS_NAME"></s:hidden>
					<s:textarea id="MODEL_MEMO" name="paraMap.MODEL_MEMO"  cssStyle="display:none;word-wrap: normal;" wrap="off"></s:textarea>
					<s:hidden id="MODEL_TYPE" name="paraMap.MODEL_TYPE"></s:hidden>
					<s:hidden id="MODEL_ID" name="paraMap.ID"></s:hidden>
					<s:hidden id="MODEL_START_ORDER" name="paraMap.MODEL_START_ORDER"></s:hidden>
					<s:hidden id="MODEL_DATABASE" name="paraMap.MODEL_DATABASE"></s:hidden>
					<s:hidden id="codeType" name="paraMap.paraCodeType"/>
					<s:hidden id="paraCodeId" name="paraMap.paraCodeId"/>
					<s:hidden id="className" name="paraMap.paraCodeName"/>
					<s:textarea id="classCode" name="paraMap.paraClsCode" value="%{paraMap.paraClsCode}" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
					<s:hidden id="MC_ID_MYSQL" name="paraMap.MC_ID_MYSQL" />
					<s:hidden id="MC_ID_SQLSERVER" name="paraMap.MC_ID_SQLSERVER" />
					<s:hidden id="MC_ID_ORACLE" name="paraMap.MC_ID_ORACLE" />
					<s:hidden id="MC_ID_BASE" name="paraMap.MC_ID_BASE" />
					<s:hidden id="MC_ID_PG" name="paraMap.MC_ID_PG"  />
					<s:hidden id="PAGE_ORDER" name="paraMap.PAGE_ORDER"/>
		</form>		
		</div>
		
		<!-- 模块列表数据 -->		
		<div style="overflow:auto;overflow-x:auto;height:80%;width:100%;">
			<table id="listTable" style="table-layout: fixed;"
				class="tabFixed table_list">
				<thead id="addData">
				<tr class="tdcolor">
					<th width="40px"><input  type="checkbox" id="SelectAll" onclick="selectAll(this)" style="width:40px;height:18px;vertical-align: middle;"></th>
					<th width="40px"><dict:lang value="序号" /></th>
					
					<th width=""><dict:lang value="编码(key)" /></th>
					<th width=""><dict:lang value="编码值(value)" /></th>
					<th width=""><dict:lang value="备注" /></th>
					
				</tr>
				</thead>
				
				<tbody id="module_dict_tbody">
				
					<%-- 
					<s:iterator value="ajaxMap.dataList" id="configPage" status="index">
						<tr>
							   
								<td style="width:30px;text-align:center;"><input type="checkbox"   name='id' onchange="selectChange(this)" value="<c:out value='${DICT_ID}'/>"  style="margin:0"></td>
								<td>
									<input type="hidden" id = "${DICT_ID}_C"  value="${CODE}">
									<input type="hidden" id = "${DICT_ID}_module"  value="${MC_MODULE_NAME}">	
								<s:property value="CODE"/></td>
								<td  id = "${DICT_ID}_V" ><s:property value="VALUE"/></td>
								<td><s:property value="REMARK"/></td>
		
						</tr>
					</s:iterator>
					--%>
				
				</tbody>
				
			</table>
		</div>
			
		<iframe id="submitFrame1" name="submitFrame1" src="" width="0" height="0"></iframe>

		<%--  
		<div class="center">
			<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
		</div>
		--%>
		
		<div class="ptop_10 txac">
							<input id="nextButton"type="button" value="<dict:lang value="完成" />"  onclick="save(this);" class="layui-btn">
							<input id="upButton"type="button" value="<dict:lang value="上一步" />"  onclick="up(this);" class="layui-btn layui-btn-warm">
					</div>
			<div style="display: none;">
					<form action="${path}sys/moduleMagAction_moduleSourceExport.ms" id="submitForm" method="post">
	
					</form>
			</div>
	</div>
</div>	
</div>
<!-- 改造代码 -->
	
	
	
	
	
<script type="text/javascript">	
	/* 公用js   begin */
	var moduletype_val='';
	
	var exportModule={};
	function init(){
		var em=$("#exportModule").val();
		if(em!=""){
			exportModule=JSON.parse(em);
			//alert(exportModule);
		}
		util.closeTopLoading();
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
		//util.showTopLoading();
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
		for(key in exportModule) {
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
	           url:'${path}/sys/moduleMagAction_ajaxdictlist.ms',
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
		
	               }else{
	               	document.getElementById('module_dict_tbody').innerHTML='';
	               
	               }
	               
	           }
	           
		});
		
		
    }
    var currentOrder=11;
	$(function(){
		var tableTrJs = $("#listTable tbody tr");
		//_toClickColor(tableTrJs);
		//_tongLineColor(tableTrJs);
		
		//异步加载模块下数据字典数据
		ajaxdictlist('');
		 var PAGE_ORDER=$("#PAGE_ORDER").val();
			var html="<ul>";
	  		var countPage=0;
	  		if(PAGE_ORDER!=""){
	  			var pageorders=PAGE_ORDER.split(",");
	  				if(pageorders.length!=11){
	  					if(pageorders.length==currentOrder-1){//从前一个页面进入 
	  						for(var i=0;i<pageorders.length;i++){
	  							pagename=null;
	  							pageName(pageorders[i])
	  							if(pageorders[i]==1){//当前为1时
	  								html+="<li class=\"done\"><div class=\"line transparent\"></div>"+
	  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  					            "<div class=\"line\"></div>"+
	  					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
	  					            continue;
	  					         }
	  							if(pageorders[i]==currentOrder){//当前为1时
	  								html+="<li class=\"doing\"> <div class=\"line transparent\"></div>"+
	  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  					            "<div class=\"line\"></div>"+
	  					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
	  								continue;
	  							}else{
	  									html+="<li class=\"done\"> <div class=\"line\"></div>"+
	  						            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  						            "<div class=\"line line_right\"></div>"+
	  						            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
	  						            continue;
	  							}
	  				       	}
	  						pageName(currentOrder)
	  						html+="<li class=\"doing\"> <div class=\"line\"></div>"+
	  			            "<div class=\"num\">"+currentOrder+"</div>"+
	  			            "<div class=\"text\"><a>"+pagename+"</a></div></li>";
	  						$("#PAGE_ORDER").val("1,2,3,4,5,6,7,8,9,10,11");
	  						countPage=2
	  					}else if(pageorders.length==currentOrder){
	  						for(var i=0;i<pageorders.length;i++){
	  							pagename=null;
	  							pageName(pageorders[i])
	  							if(pageorders[i]==1){//当前为1时
	  								html+="<li class=\"done\"><div class=\"line transparent\"></div>"+
	  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  					            "<div class=\"line\"></div>"+
	  					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
	  					            continue;
	  					         }
	  							if(pageorders[i]==currentOrder){//当前为1时
	  								html+="<li class=\"doing\"> <div class=\"line\"></div>"+
	  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  					            "<div class=\"line\"></div>"+
	  					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
	  								continue;
	  							}else{
	  									html+="<li class=\"done\"> <div class=\"line\"></div>"+
	  						            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  						            "<div class=\"line line_right\"></div>"+
	  						            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
	  						            continue;
	  							}
	  				       	}
	  						countPage=1
	  					}else{
	  						for(var i=0;i<pageorders.length;i++){
	  							pagename=null;
	  							pageName(pageorders[i])
	  							if(pageorders[i]==1){//当前为1时
	  								html+="<li class=\"done\"><div class=\"line transparent\"></div>"+
	  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  					            "<div class=\"line\"></div>"+
	  					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
	  					            continue;
	  					         }
	  							if(pageorders[i]==currentOrder){//当前为1时
	  								html+="<li class=\"doing\"> <div class=\"line\"></div>"+
	  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  					            "<div class=\"line\"></div>"+
	  					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
	  								continue;
	  							}else{
	  									html+="<li class=\"done\"> <div class=\"line\"></div>"+
	  						            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  						            "<div class=\"line line_right\"></div>"+
	  						            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
	  						            continue;
	  							}
	  				       	}
	  						countPage=1
	  					}
	  					for(var j=pageorders.length+countPage;j<12;j++){
	  							pagename=null;
	  							pageName(j)
	  							if(j==11){
	  								html+="<li class=\"undone\"> <div class=\"line\"></div>"+
	  					            "<div class=\"num\">"+j+"</div>"+
	  					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
	  					            continue;
	  							}else{
	  								html+="<li class=\"undone\"> <div class=\"line\"></div>"+
	  					            "<div class=\"num\">"+j+"</div>"+
	  					            "<div class=\"line\"></div>"+
	  					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
	  					            continue;
	  							}
	  					}
	  			}else{
	  				for(var i=0;i<pageorders.length;i++){
	  						pagename=null;
	  						pageName(pageorders[i])
	  						if(pageorders[i]==1){//当前为1时
	  							html+="<li class=\"done\"> <div class=\"line transparent\"></div>"+
	  				            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  				            "<div class=\"line\"></div>"+
	  				            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
	  							continue;
	  						}
	  						if(pageorders[i]==currentOrder){//当前为1时
	  							html+="<li class=\"doing\"> <div class=\"line\"></div>"+
	  				            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  				            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
	  							continue;
	  						}else if(i==pageorders.length-1){
	  								html+="<li class=\"done\"> <div class=\"line\"></div>"+
	  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
	  					            continue;
	  						}else{
	  								html+="<li class=\"done\"> <div class=\"line\"></div>"+
	  					            "<div class=\"num\">"+pageorders[i]+"</div>"+
	  					            "<div class=\"line\"></div>"+
	  					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
	  					            continue;
	  						}
	  	            }
	  			}
	  			html+="</ul>";
	  		}
	          
	  		$("#crumbs").html(html);

	})
	function pageName(order){
		if(order==1){
			pagename="模块基本信息"	 
		}else if(order==2){
			pagename="模块依赖关系" 
		}else if(order==3){
			pagename="模块菜单" 
		}else if(order==4){
			pagename="业务模型" 
		}else if(order==5){
			pagename="公用页面"; 
		}else if(order==6){
			pagename="公用类" 
		}else if(order==7){
			pagename="静态资源" 
		}else if(order==8){
			pagename="触发器" 
		}else if(order==9){
			pagename="对外接口" 
		}else if(order==10){
			pagename="多语言" 
		}else if(order==11){
			pagename="数据字典" 
		}
	}
	function pageGo(order,pagename){
			var url=null;
			if(order==1){
			url="${path}sys/moduleMagAction_moduleName.ms";
			}else if(order==2){
			url="${path}sys/moduleMagAction_moduleType.ms";
			}else if(order==3){
			url="${path}sys/moduleMagAction_moduleFunc.ms";
			}else if(order==4){
			url="${path}sys/moduleMagAction_bussExport.ms";
			}else if(order==5){
			url="${path}sys/moduleMagAction_pageExport.ms";
			}else if(order==6){
			url="${path}sys/moduleMagAction_classExport.ms";
			}else if(order==7){
			url="${path}sys/moduleMagAction_moduleSourceExport.ms";
			}else if(order==8){
			url="${path}sys/moduleMagAction_trigTree.ms";
			}else if(order==9){
			url="${path}sys/moduleMagAction_interIframe.ms";
			}else if(order==10){
			url="${path}sys/moduleMagAction_languageExport.ms";
			pagename="多语言";
			}else if(order==11){
			url="${path}sys/moduleMagAction_dictExport.ms";
			}
			$("#exportModule").val(JSON.stringify(exportModule));
			document.getElementById("searchForm").target="";
			document.getElementById("searchForm").action=url;
			document.forms.searchForm.submit();
	}	
	//点击上一步?
    function up(){
    	document.getElementById("searchForm").target="";
		$("#exportModule").val(JSON.stringify(exportModule));
		document.getElementById("searchForm").action="${path}sys/moduleMagAction_languageExport.ms"
		document.forms.searchForm.submit();
	}
	
	//点击完成?
	function save()
	{
		document.getElementById("searchForm").target="submitFrame1";
		$("#exportModule").val(JSON.stringify(exportModule));
		var MODEL_ID=$("#MODEL_ID").val();
		if(MODEL_ID!=null&&MODEL_ID!=""){
			document.getElementById("searchForm").action="${path}sys/moduleMagAction_modifyModule.ms";
		}else{
			document.getElementById("searchForm").action="${path}sys/moduleMagAction_saveModule.ms";
		}
		
		document.getElementById("curIframeName").value=window.frameElement.name;
		
		document.forms.searchForm.submit();
	}
	
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
			var jsonObj = exportModule;
			if(!jsonObj[id]) {
				jsonObj[id] = [];
			}

		
			if(obj.checked) {
				jsonObj[id].push({
					"code": code,
					"vaule":value,
					"type": "dict",
					"modType": "dict",
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
		//util.showTopLoading();
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