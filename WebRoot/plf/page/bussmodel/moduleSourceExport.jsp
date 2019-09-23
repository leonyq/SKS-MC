
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
</jsp:include>
<script
	src="${path}plf/js/dhtmlxtree/dhtmlxtree_json.js?_mc_res_version=<%=PlfStaticRes.DHTMLXTREEJS %>"></script>
	<style type="text/css">
	.standartTreeImage2 + td {width: 10px;}
	
	</style>
</head>

<body>

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
	<div style="width: 100%;">
		<div id="fileDiv"
			style="float: left;width: 25%;border: 1px solid #ccc;height: 500px;overflow: auto;">
			<p><dict:lang value="资源文件选择"/>:</p>
			<div id="fileContent"></div>
		</div>
		<div id="libDiv"
			style="float: right;width: 73%;border: 1px solid #ccc;height: 500px;overflow: auto;">
			<p><dict:lang value="第三方jar包选择"/>:</p>
			<div id="libContent">
				<table id="listTable" class="table_list">
					<thead>
						<tr class="tdcolor">
							<th width="40px"><input type="checkbox"
								onclick='selectAll(this)'>
							</th>
							<th width="40px"><dict:lang value="序号" />
							</th>
							
							<th width="200px"><dict:lang value="名称" />
							</th>
							<th><dict:lang value="文件大小" />
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${fileList }" var="file"
							varStatus="status">
							<tr>
								<td width="5%"><input name='jarpath' type="checkbox"
									value="<c:out value='${file.path }' />" onchange="selectChange(this)">
								</td>
								<td width="5%">${status.count }</td>
								
								<td width="25%"><c:out value='${file.name }' /></td>
								<td width="25%"><c:out value='${file.size }' /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>

</body>
<script
	src="${path}/plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>"></script>
<script>
	var treeView = new dhtmlXTreeObject("fileContent", "100%", "100%", "-1");
	treeView.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
	treeView.enableCheckBoxes(1);
	treeView.enableTreeLines(false); 
	treeView.enableThreeStateCheckboxes(true);
	var json = "${treeResult }";
	//console.log(json);
	treeView.loadXMLString(json);
	treeView.setOnCheckHandler(function() {
		var filepaths = treeView.getAllChecked();
		window.parent.exportModule.file = filepaths;
		if(window.parent.exportModule.file == "") {
			delete window.parent.exportModule.file;
		}
	});
<%--	$(function() {--%>
<%--		var filepath = document.getElementById("filepaths");--%>
<%--		var datastore = document.getElementById("datastores");--%>
<%--		var exportButton = document.getElementById("exportButton");--%>
<%--		var midselect = document.getElementById("mid");--%>
<%--		var filepaths = [];--%>
<%----%>
<%--		exportButton.onclick = function(e) {--%>
<%--			var ids = treeView.getAllChecked();--%>
<%--			filepath.value = ids;--%>
<%--			document.forms.exportMod.submit();--%>
<%--		};--%>
<%--		var importButton = document.getElementById("importButton");--%>
<%--		importButton.onclick = function(e) {--%>
<%--			document.forms.importform.submit();--%>
<%--		}--%>
<%--		//$("file").change(function()--%>
<%--		//{--%>
<%--		//  $("text").val($(this).val());--%>
<%--		//});--%>
<%--	});--%>
</script>
<script type="text/javascript">
function selectAll(obj) {
	$("input[type='checkbox'][name='jarpath']").attr("checked",obj.checked);
	//$("input[name='jarpath']").trigger("change");
	var arr = [];
	$("input[name='jarpath']:checked").each(function (i,e) {
		arr.push(e.value);
	});
	if(arr.length > 0) {
		window.parent.exportModule.jar = arr.join(",");
	}
}

function selectChange() {
	var arr = [];
	$("input[name='jarpath']:checked").each(function (i,e) {
		arr.push(e.value);
	});
	if(arr.length > 0) {
		window.parent.exportModule.jar = arr.join(",");
	}
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


</script>
</body>
<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>