<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="模块管理" /></title>

<%@ include file="/plf/common/pub_meta.jsp"%>

<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="layui" value="1" />
</jsp:include>

<style type="text/css">
html,body {
	height: 100%;
}
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

.language {
	padding: 80px 0 80px 0;
	height: 100%;
	box-sizing: border-box;
	position: relative;
}

.language-body {
	height: 100%;
}
.crumbs {
	position: absolute;
	top: 10px;
	left: 47px;
	padding: 0;
}

</style>
<script>

	var exportModule={};
	function load(){
		var em=$("#exportModule").val();
		//alert(em);
		if(em!=""){
			exportModule=JSON.parse(em);
			//alert(exportModule);
		}
		
		//initdata();
		//util.closeTopLoading(); 
	}
	
	function initdata(){
		for(key in exportModule) {
				$("input[type='checkbox'][name='id']").each(function(i,e) {
					if(key==e.value)
					{
						e.checked = true;
					}});
				
				}
				
	}
	
	var currentOrder=10;
	$(function(){
		var tableTrJs = $("#listTable tbody tr");	
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
		menuList($("#noMM"),'2');
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
  			            "<div class=\"line\"></div>"+
  			            "<div class=\"text\"><a>"+pagename+"</a></div></li>";
  						$("#PAGE_ORDER").val("1,2,3,4,5,6,7,8,9,10");
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
  				            "<div class=\"line\"></div>"+
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
	});
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
	var menuName = "无模块归属";
	
	//菜单的点击事件
	function menuList(objthis,num){
		//util.showTopLoading();
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
		     		table+="<td style='width:50px;text-align:center;'><input  type='checkbox' name='id' onchange='selectChange(this)' value='"+MSGNAME+"' style='width:40px;height:18px;vertical-align: middle;'></td>";
		     		table+="<td title='"+(i+1)+"'>"+(i+1)+"</td>";
					
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
 					if(msg!=null && msg!=''){
			                top.util.alert("error:"+msg);
			            }
 			  }
 			});	
	}
	
	//查询
	function searchx(){
		//util.showTopLoading();
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
		     		table+="<td style='width:50px;text-align:center;'><input  type='checkbox' name='id' onchange='selectChange(this)' value='"+MSGNAME+"' style='margin:0'></td>";
		     		
		     		table+="<td title='"+(i+1)+"'>"+(i+1)+"</td>";
					
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
 					if(msg!=null && msg!=''){
		                top.util.alert("error:"+msg);
		              }
 			  }
 			});	
	}
	
	//获取菜单颜色
	function getMenuColor(objthis){
		$(".menucolor").removeClass("menucolor");
		$(objthis).parent().addClass("menucolor");		
	}
	//完成
	function save(thisobj)
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
	
	//下一步
	function next(thisobj)
	{
	document.getElementById("searchForm").target="";
	$("#exportModule").val(JSON.stringify(exportModule));
	document.getElementById("searchForm").action="${path}sys/moduleMagAction_dictExport.ms"
	document.forms.searchForm.submit();
	}
	
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
	
	//上一步
    function up(objthis)
	{
    	document.getElementById("searchForm").target="";
		$("#exportModule").val(JSON.stringify(exportModule));
		//alert($("#exportModule").val())
		document.getElementById("searchForm").action="${path}sys/moduleMagAction_interIframe.ms"
		document.forms.searchForm.submit();
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
		var jsonObj = exportModule;
			if(!jsonObj[id]) {
				jsonObj[id] = [];
			}

			
			if(obj.checked) {
				jsonObj[id].push({
					"modType": "language",
					"type": "language",
					"moduleName":document.getElementById(id+"_module").value//$("#"+id+"_module").val()
				});
				var oldname = document.getElementById(id+"_module").value;//$("#"+id+"_module").val();
				if(oldname!=null&&oldname!=""&&oldname!="null"&&oldname)
				{
					var nowname=$('#MODELS_NAME').val()+"."+$('#MODEL_NAME').val();
					if(oldname!=nowname)
					{
						util.alert("选择'"+id+"'会导致本模块与"+oldname+"模块冲突,本模块将无法与"+oldname+"模块共同安装");
					}
				}
			} else {
				delete jsonObj[id];

			}
		$("#exportModule").val(JSON.stringify(exportModule));
	} 
	
	/* function query(thisObj){
		document.getElementById("searchForm").target="";
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		
		util.showTopLoading();
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
		//util.showTopLoading(); 
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
<body onload="load()">
<!-- body start -->
<div class="language">

	<div class="crumbs" id="crumbs">
    </div>
	<script type="text/javascript">
		//util.showTopLoading("数据加载中 请稍后。。。。")
	</script>
	<div class="language-body clearfix">
	
	
	<div style="width:27%;height:80%;float:left;overflow:auto;overflow-x:hidden;">


		<ul id="moduletable" class="lanExportLeftWrap" style="margin:auto;">
			<h3 class="moduleTitle" style="margin-top:10px;">模块列表</h3>
			<li class="menucolor"><a href="javascript:void(0);"
				onclick="menuList(this,'1')" id="noMM" >无模块归属</a></li>
			<li><a href="javascript:void(0);" onclick="menuList(this,'1')">平台</a>
			</li>
			<s:iterator value="dataMap.moduleList" id="configPage" status="index">
				<li><a href="javascript:void(0);" onclick="menuList(this,'1')" ><s:property
							value="MC_MODULE_NAME" /> </a>
				</li>
			</s:iterator>

		</ul>

	</div>


	<div style="width:72%;height:100%;margin-right:0px;float:right;">
		<div class="clearfix">
			<form id="searchForm" name="searchForm"
				action="${path}sys/moduleMagAction_languageExport.ms" method="post">

				<div style="float:left;margin:15px;">
					<dict:lang value="属性名称"/>
					<s:textfield id="paraMap_MSGNAME" name="paraMap.MSGNAME"
						cssClass="input_sh" maxlength="33" cssStyle="width:180px;height:38px;margin-left:10px;text-indent:10px;" />
					<input style="margin-left: 10px;margin-top: 3px;" type="button"
						value="<dict:lang value="查询" />" onclick="searchx();"
						class="botton_img_search">
				</div>

				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				
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
				<s:hidden id="PAGE_ORDER" name="paraMap.PAGE_ORDER"/>
			</form>
		</div>
		

		<div style="overflow:auto;overflow-x:auto;height:80%;width:100%;">
			<table id="listTable" style="table-layout: fixed;"
				class="tabFixed table_list">
				<thead id="addData">
					<tr class="tdcolor">
						<th width="40px"><input type="checkbox" id="SelectAll"
							onclick="selectAll(this)" style="width:40px;height:18px;vertical-align: middle;">
						</th>
						
						<th width="40px"><dict:lang value="序号" />
						</th>
						
						<th width="110px"><dict:lang value="属性名称" />
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

		<iframe id="submitFrame1" name="submitFrame1" src="" width="0" height="0"></iframe>
	</div>
	<div class="ptop_10 txac">
		<input id="nextButton" type="button" value="<dict:lang value="完成" />"
			onclick="save(this);" class="layui-btn"> <input
			id="upButton" type="button" value="<dict:lang value="上一步" />"
			onclick="up(this);" class="layui-btn layui-btn-warm"> <input
			id="nextButton" type="button" value="<dict:lang value="下一步" />"
			onclick="next(this);" class="layui-btn layui-btn-warm">
	</div>
</div>

</div>
<!-- body end -->
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>