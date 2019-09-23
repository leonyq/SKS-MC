
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="视图模型" />
	<dict:lang value="列表" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="dhtmlxtree" value="1" />
	<jsp:param name="layui" value="1" />
	
</jsp:include>
<script
	src="${path}plf/js/dhtmlxtree/dhtmlxtree_json.js?_mc_res_version=<%=PlfStaticRes.DHTMLXTREEJS %>"></script>
	<style type="text/css">
	.standartTreeImage2 + td {width: 10px;}
	
	</style>
</head>
<script type="text/javascript">
util.showTopLoading("数据加载中 请稍后。。。。")
</script>
<body onload="init()">
	<div class="crumbs" id="crumbs" style="margin:5px 0px 0px 37px;">
    </div>
	<%!
Map<String,File> result = new HashMap<String,File>();
//List<String,Object> jsonResult = new ArrayList<String,Object>();
StringBuilder jsonResult = new StringBuilder();

StringBuilder xmlResult = new StringBuilder();
// path=上一层级的目录名   dir=遍历的目录 filepaths=所选的文件 a,b,c
public void showAllFiles(String path , File dir,String[] filepaths) throws Exception
{
	boolean flag = false;
	File[] fs = dir.listFiles();
	for(File file: fs)
	{
		if(file.isDirectory())
		{
			if(path.endsWith("/WEB-INF/lib") || path.endsWith("/WEB-INF/classes") || path.endsWith("/doc") || path.endsWith("/plf") || file.getName().endsWith("plf"))
			{
				continue;
			}
			for(String filepath : filepaths)
			{
				if(filepath.equals(path + "/" + file.getName()))
				{
					flag = true;
					break;
				}
			}
			if(flag)
			{
				xmlResult.append("<item id = \\\"" + path + "/" + file.getName() + "\\\" text=\\\"" + file.getName() +"\\\" checked=\\\"1\\\">");
				flag = false;
			}
			else
			{
				xmlResult.append("<item id = \\\"" + path + "/" + file.getName() + "\\\" text=\\\"" + file.getName() +"\\\">");
			}
			showAllFiles(path + "/" + file.getName(), file,filepaths);
			xmlResult.append("</item>");
		}
		else
		{
			if(path.equals("") || path.endsWith("/WEB-INF") || path.endsWith("/WEB-INF/lib") || path.endsWith("/WEB-INF/classes") || path.endsWith("/doc") || path.endsWith("/plf"))
			{
				continue;
			}
			for(String filepath : filepaths)
			{
				if(filepath.equals(path + "/" + file.getName()))
				{
					flag = true;
					break;
				}
			}
			if(flag)
			{
				xmlResult.append("<item id = \\\"" + path + "/" + file.getName() + "\\\" text=\\\"" + file.getName() + "\\\" checked=\\\"1\\\"></item>");
				flag = false;
			}else
			{
				xmlResult.append("<item id = \\\"" + path + "/" + file.getName() + "\\\" text=\\\"" + file.getName() +"\\\"></item>");
			}
		}
	}
}

	public List<Map<String,String>> listFiles(String libDir) {
	  File dir = new File(libDir);
	  List<Map<String,String>> list = new ArrayList<Map<String,String>>();
	  DecimalFormat format = new DecimalFormat("###,###.##");
	  for(File file:dir.listFiles()) {
	    if(file.isFile()) {
	    	String name =  file.getName();
	        String size =  format.format((double)file.length()/1024)+"KB";
	        String path = file.getPath().replaceAll("\\"+File.separator, "/");
	        Map<String,String> bean = new HashMap<String,String> ();
	        bean.put("name", name);
	        bean.put("size", size);
	        bean.put("path", path);
	        list.add(bean);
	    }
	  }
	  return list;
	}
 %>
	<%
//String paths = request.getParameter("filepaths").toString();
String paths = "";
//String classpaths = request.getAttribute("classpaths").toString();
String[] oldfilepaths = paths.split(",");
String[] filepaths = new String[oldfilepaths.length];
int i = 0;
for(String filepath : oldfilepaths)
{
	if(filepath.startsWith("leaf:"))
	{
		filepaths[i] = filepath.substring(5);
	}
	else
	{
		filepaths[i] = filepath;
	}
	i++;
}
String filepath = application.getRealPath("/");
File file = new File(filepath);
xmlResult = new StringBuilder();
xmlResult.append("<?xml version='1.0' encoding='").append(ConstantsMc.CHARACTER_ENCODING_DEFAULT).append(
      "'?>");
xmlResult.append("<tree id = \\\"-1\\\">");
showAllFiles("", file,filepaths);
xmlResult.append("</tree>");
request.setAttribute("treeResult",xmlResult);

request.setAttribute("fileList", listFiles(filepath+"WEB-INF"+File.separator+"lib"));
%>
	<div style="width: 100%">
		<div style="overflow:hidden; width: 100%; margin: 10px 0 5px 0;">
			<!-- tree -->
			<div id="fileDiv"
				style="float: left;width: 250px;height: 410px;overflow-y: visibility; overflow-x: auto; margin: 0 0 0 10px;">
				<p><h3 class="moduleTitle" style="margin:5px;">资源文件选择</h3></p>
				<div id="fileContent"></div>
			</div>
			<!-- jar包显示 -->
			<div id="libDiv"
				style="float: right; width: calc(100% - 320px); height:425px;overflow: auto;margin-right: 30px;">
				<p style="font-weight: bold; "><h3 class="moduleTitle" style="margin:5px;">第三方jar包选择</h3></p>
				<div id="libContent">
					<table id="listTable" class="table_list">
						<thead>
							<tr class="tdcolor">
								<th width="40px"><input type="checkbox"
									onclick='selectAll(this)' style="width:40px;height:18px;vertical-align: middle;">
								</th>
								
								<th width="40px"><dict:lang value="序号" />
								</th>
								
								<th width=""><dict:lang value="名称" />
								</th>
								<th width=""><dict:lang value="文件大小" />
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${fileList }" var="file"
								varStatus="status">
								<tr>
									<td width="5%">
									<input name='jarpath' type="checkbox"
										value="${file.path }" onchange="selectChange(this)" style="width:40px;height:18px;vertical-align: middle;">
									</td>
									
									<td width="5%">${status.count }</td>
									
									<td width="25%">${file.name }</td>
									<td width="25%">${file.size }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		
		<div class="ptop_10 txac">
				<input id="nextButton" type="button" value="<dict:lang value="完成" />"  onclick="save(this);" class="layui-btn">
				<input id="upButton" type="button" value="<dict:lang value="上一步" />"  onclick="up(this);" class="layui-btn layui-btn-warm">
				<input id="nextButton" type="button" value="<dict:lang value="下一步" />"  onclick="next(this);" class="layui-btn layui-btn-warm">
				
		</div>
		
	</div>
<div style="display: none;" >
				<form action="${path}sys/moduleMagAction_commClass.ms" id="submitForm" method="post"target="submitFrame1">
				
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				
				<s:hidden id="exportModule" name="paraMap.exportModule"></s:hidden>
				<s:hidden id="MODEL_NAME" name="paraMap.MODEL_NAME"></s:hidden>
				<s:hidden id="MODEL_SHOW_NAME" name="paraMap.MODEL_SHOW_NAME"></s:hidden>
				<s:hidden id="MODEL_VERSION" name="paraMap.MODEL_VERSION"></s:hidden>
				<s:hidden id="MODELS_NAME" name="paraMap.MODELS_NAME"></s:hidden>
				<s:textarea id="MODEL_MEMO" name="paraMap.MODEL_MEMO"  cssStyle="display:none;word-wrap: normal;" wrap="off"></s:textarea>
				<s:hidden id="MODEL_START_ORDER" name="paraMap.MODEL_START_ORDER"></s:hidden>
				<s:hidden id="MODEL_TYPE" name="paraMap.MODEL_TYPE"></s:hidden>
				<s:hidden id="MODEL_ID" name="paraMap.ID"></s:hidden>
				<s:hidden id="MODEL_DATABASE" name="paraMap.MODEL_DATABASE"></s:hidden>
				<s:hidden id="codeType" name="paraMap.paraCodeType"/>
				<s:hidden id="paraCodeId" name="paraMap.paraCodeId"/>
				<s:textarea id="classCode" name="paraMap.paraClsCode" value="%{paraMap.paraClsCode}" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:hidden id="className" name="paraMap.paraCodeName"/>
				<s:hidden id="MC_ID_MYSQL" name="paraMap.MC_ID_MYSQL" />
				<s:hidden id="MC_ID_SQLSERVER" name="paraMap.MC_ID_SQLSERVER" />
				<s:hidden id="MC_ID_ORACLE" name="paraMap.MC_ID_ORACLE" />
				<s:hidden id="MC_ID_BASE" name="paraMap.MC_ID_BASE" />
				<s:hidden id="MC_ID_PG" name="paraMap.MC_ID_PG"  />
				<s:hidden id="PAGE_ORDER" name="paraMap.PAGE_ORDER"/>
				</form>
				<iframe id="submitFrame1" name="submitFrame1" src="" width="0" height="0"></iframe>
		</div>
</body>
<script
	src="${path}/plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>"></script>
<script>
var exportModule = {};	

var json = "${treeResult}";

var treeView = new dhtmlXTreeObject("fileContent", "100%", "100%", "-1");
treeView.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
treeView.enableCheckBoxes(1);
treeView.enableTreeLines(false); 
treeView.enableThreeStateCheckboxes(true);
//console.log(json);
treeView.loadXMLString(json);
treeView.setOnCheckHandler(function() {
	var filepaths = treeView.getAllChecked();
	exportModule.file = filepaths;
	if(window.parent.exportModule.file == "") {
		delete exportModule.file;
	}
});
function init(){
	var em=$("#exportModule").val()
	if(em!=""){
		exportModule=JSON.parse(em);
	}
	var filepaths=exportModule.file
	if(filepaths!=""&&filepaths!=undefined){
		var files=filepaths.split(",");
		for(var i=0;i<files.length;i++){
			treeView.selectItem(files[i]);
			treeView.setCheck(files[i],1)//勾选节点
		}
	}
	var jarpaths=exportModule.jar
	if(jarpaths!=""&&jarpaths!=undefined){
		var jars=jarpaths.split(",");
		for(var i=0;i<jars.length;i++){
			$("input[type='checkbox'][name='jarpath']").each(function(i,e) {
				if(containBussDetail(jars, e.value)) {
					e.checked = true;
				}
			});
		}
	}
	util.closeTopLoading();
}
//包含业务模型子集
function containBussDetail(arr,obj) {
	for(var i=0; i<arr.length; i++) {
		if(arr[i] == obj) {
			return true;
		}
	}
	
	return false;
}

function up(){
	document.getElementById("submitForm").target="";
	$("#exportModule").val(JSON.stringify(exportModule));
<%--	alert($("#exportModule").val());--%>
	document.getElementById("submitForm").action="${path}sys/moduleMagAction_classExport.ms"
	document.forms.submitForm.submit();
}
function next(){
	document.getElementById("submitForm").target="";
	$("#exportModule").val(JSON.stringify(exportModule));
	document.getElementById("submitForm").action="${path}sys/moduleMagAction_trigTree.ms"
	document.forms.submitForm.submit();
}
function save()
{
	document.getElementById("submitForm").target="submitFrame1";
	$("#exportModule").val(JSON.stringify(exportModule));
	var MODEL_ID=$("#MODEL_ID").val();
	if(MODEL_ID!=null&&MODEL_ID!=""){
		document.getElementById("submitForm").action="${path}sys/moduleMagAction_modifyModule.ms";
	}else{
		document.getElementById("submitForm").action="${path}sys/moduleMagAction_saveModule.ms";
	}
	
	document.getElementById("curIframeName").value=window.frameElement.name;
	
	document.forms.submitForm.submit();
}
function alertInfo(msg){
	util.alert(msg);
}
function selectAll(obj) {
	$("input[type='checkbox'][name='jarpath']").attr("checked",obj.checked);
	//$("input[name='jarpath']").trigger("change");
	var arr = [];
	$("input[name='jarpath']:checked").each(function (i,e) {
		arr.push(e.value);
	});
	if(arr.length > 0) {
		exportModule.jar = arr.join(",");
	}
}

function selectChange(obj) {
	var arr = [];
	$("input[name='jarpath']:checked").each(function (i,e) {
		arr.push(e.value);
	});
	if(arr.length > 0) {
		exportModule.jar = arr.join(",");
	}
	if(!obj.checked){
		exportModule.jar=indexOf(exportModule.jar, obj.value, null);
		if(exportModule.jar.length==0){
			delete exportModule.jar
		}
	}
	
}
function indexOf(arr, value) {
	var arrs=arr.split(",");
	for(var i = 0; i < arrs.length; i++) {
			if(arrs[i] == value) {
				arr=arr.replace(value,"");
			}
		}
	return arr;
}
function containFile(jarArr,jar) {
	var flag = false;
	for(var i=0 ; i<jarArr.length; i++) {
		if(jarArr[i] == jar) {
			flag = true;
			break;
		}
	}
	return flag;
}
var currentOrder=7;
$(function() {
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
  						$("#PAGE_ORDER").val("1,2,3,4,5,6,7");
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
		document.getElementById("submitForm").target="";
		document.getElementById("submitForm").action=url;
		document.forms.submitForm.submit();
}	
</script>
</body>
<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>