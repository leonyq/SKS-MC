
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
		<script src="${path}plf/js/dhtmlxtree/dhtmlxtree_json.js?_mc_res_version=<%=PlfStaticRes.DHTMLXTREEJS %>"></script>
	</head>

<body>

<%!
Map<String,File> result = new HashMap<String,File>();
//List<String,Object> jsonResult = new ArrayList<String,Object>();
StringBuilder jsonResult = new StringBuilder();

StringBuilder xmlResult = new StringBuilder();

public void showAllFiles(String path , File dir,String[] filepaths) throws Exception
{
	boolean flag = false;
	File[] fs = dir.listFiles();
	for(File file: fs)
	{
		if(file.isDirectory())
		{
			if(path.endsWith("/WEB-INF/lib") || path.endsWith("/WEB-INF/classes") || path.endsWith("/doc") || path.endsWith("/buss"))
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
			if(path.equals("") || path.endsWith("/WEB-INF") || path.endsWith("/WEB-INF/lib") || path.endsWith("/WEB-INF/classes") || path.endsWith("/doc") || path.endsWith("/buss"))
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
				xmlResult.append("<item id = \\\"leaf:" + path + "/" + file.getName() + "\\\" text=\\\"" + file.getName() + "\\\" checked=\\\"1\\\"></item>");
				flag = false;
			}else
			{
				xmlResult.append("<item id = \\\"leaf:" + path + "/" + file.getName() + "\\\" text=\\\"" + file.getName() +"\\\"></item>");
			}
		}
	}
}
 %>
<%
String paths = request.getAttribute("filepaths").toString();
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
xmlResult.append("<?xml version='1.0' encoding='").append(Constants.CHARACTER_ENCODING_DEFAULT).append(
      "'?>");
xmlResult.append("<tree id = \\\"-1\\\">");
showAllFiles("", file,filepaths);
xmlResult.append("</tree>");
request.setAttribute("treeResult",xmlResult);
%>
  <div>
    <!--  <form id="exportMod" name="exportMod" action="${path}sys/BussModelAction_exportMod.ms" method="post" target="submitFrame">-->
    <form id="exportMod" name="exportMod" action="${path}sys/BussModelAction_saveDependyPath.ms" method="post" target="submitFrame">
		<table class="search_table">
			<tbody>
				<tr>
					<td width="20%" align="right">
						<input type="button" value="保存" id="exportButton" class="botton_img_search"></input>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="table_list">
		<tr>
		    <td>公共文件路径:</td>
		    <td><input type="textareaon" id="filepaths" name="paraMap.filepaths" value="<%=request.getAttribute("filepaths").toString()%>"></input></td>
		</tr>
		</table>
		<div id="treeview" style="text-align:center; margin-left:auto; margin-rightwidth: 250px; height: 218px; background-color: #fffff5; border: 1px solid Silver;">
			</div>
		<table class="table_list">
		<tr>
		    <td>公共class:</td>
		    <td><input type="input" id="datastores" name="paraMap.datastores"></input></td>
		</tr>
		<tr>
		    <td>第三方jar包配置:</td>
		    <td><input type="text" id="extjar" name="paraMap.extjar" value="<%=request.getAttribute("extjar").toString()%>"></input></td>
		</tr>
		</table>
		    <input type="hidden" id="realpath" name="paraMap.realpath" value="<%=filepath%>"></input>
		 	<input type="hidden" id="del_id" name="paraMap.ID" />
			<input type="hidden" id="MID" name="paraMap.MID" value="<c:out value='${param.mid}' />" />
		<br>
	 </form>
	 <div>
	 </div>
	 <!-- <form action="${path}sys/BussModelAction_uploadModuleFile.ms" name="moduleFileform" id="moduleFileform" method="post" enctype="multipart/form-data" target="importFrame">
	   <table>
	   <tr>
	   	<input id = "uploadModuleFile" name="uploadModuleeFile" type= "file" size="30" accept=".zip" multiple="multiple"/>
	   </tr>
	   <input type="hidden" id="MID2" name="paraMap.MID2" value="<s:property value="paraMap.MID"/>"/>
	 </form> -->
	 </div>
	 <div>
	 <!-- <form action="${path}sys/BussModelAction_importMod.ms" name="importform" id="importform" method="post" enctype="multipart/form-data" target="importFrame">
	   <input id = "upfile" name="upfile" type= "file" size="30" accept=".zip" > 
	   <input type="hidden" id="MID2" name="paraMap.MID2" value="<s:property value="paraMap.MID"/>"/>
	   <input type="hidden" id="realpath2" name="paraMap.realpath2" value="<%=filepath%>"></input>
	 </form>
	 </div>
	  <input id="importButton" value="导入" type="button"></input> -->
	
  </div>  
</body>

  <!--  //jquery升级，把原有1.7.2的版本全部升级到1.9.1-->
  <script src="${path}/plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>"></script>
   
   
  <script>
  var treeView = new dhtmlXTreeObject("treeview","100%","100%","-1");
  treeView.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/");
  treeView.enableCheckBoxes(1);
  treeView.enableThreeStateCheckboxes(true);
  var json ="<c:out value='${treeResult}' />";
  //console.log(json);
  treeView.loadXMLString(json);
  $(function()
  {
  	var filepath = document.getElementById("filepaths");
  	var datastore = document.getElementById("datastores");
	var exportButton = document.getElementById("exportButton");
	var midselect =  document.getElementById("mid");
	var filepaths = [];
	
	exportButton.onclick = function(e)
	{
	  var ids = treeView.getAllChecked();
	  filepath.value = ids;
	  document.forms.exportMod.submit();
	};
	var importButton = document.getElementById("importButton");
	importButton.onclick = function(e)
	{
		document.forms.importform.submit();
	}
	//$("file").change(function()
	//{
	//  $("text").val($(this).val());
	//});
  });
  </script>
</body>
<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>