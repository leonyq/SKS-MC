<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="模块导入" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	 <jsp:param name="layui" value="1" />
</jsp:include>
<script src="${path}plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>"></script>
<script src="${path}plf/js/highcharts/fileUpload.js?_mc_res_version=<%=PlfStaticRes.FILEUPLOAD_JS %>"></script>
<style>
	#listTable tr td:nth-of-last-type(1){
		text-align:left;
	}
	input[type="checkbox"] {
	position: relative;top: 4px;
}
</style>
</head>
<body>

	<div class="all">
		<div align="center">
			<form id="search_form" name="searchForm" action="" method="post">
				<label style=""> <span id="filename"><dict:lang value="请选择文件" />...</span>
					<%--<span class="button"><dict:lang
							value="上传" /> </span> --%>
					<input type="button" id="upbtn" value="<dict:lang value="上传" />" style="margin: 15px 0 15px 20px;" class="layui-btn"> <input type="file"
					style="display:none;" id="upfile" name="upfile" class="layui-btn" >
					<input type="button" id="impbtn" style="display: none;margin-left: 10px" onclick="importModule()" value="<dict:lang value="导入" />" class="layui-btn"/>
				</label>
			</form>
		</div>

		<div class="table_div">
			<table id="listTable" style="table-layout:fixed;" class="table_list">
				<thead id="importTitle">
					<tr class="tdcolor">
						<th style="width: 40px;"><dict:lang value="序号" />
						</th>
						<th style="width: 100px;"><dict:lang value="业务类型" />
						</th>
						<th ><dict:lang value="模块名称" />
						</th>
						<th style="width: 140px;"><dict:lang value="唯一ID" />
						</th>
						<th style="width: 200px;"><dict:lang value="名称" />
						</th>
						<th style="width: 100px;"><dict:lang value="类型" />
						</th>
						<th style="width: 140px;">
							<input type="checkbox" style="width: 40px;" id="selectAll"   onclick="selectAll(this)"><span id="resultType"><dict:lang value="导入类型" /></span>
						</th>
					</tr>
				</thead>
				<tbody id="importData">
					
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

	<script>
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
		
		//显示table
		function showTable() {
			$("#listTable").show();
		}
		
		var dataList = null;
		function upFile() {
			$.ajaxFileUpload({
				url : "${path}sys/BussModelAction_showModuleName.ms",
				secureuri:false,
				fileElementId:"upfile",
				dataType:'text',
				data:{},
				success:function(data,status)
				{	
					//alert(data);
					$("#selectAll").show();
					$("#selectAll").prop("checked",false);
					$("#impbtn").show();
					$("#resultType").text("<dict:lang value="导入类型" />");
					dataList = JSON.parse(data);
					var html = [];
					var count=null
					if(dataList[dataList.length-1].reversion==undefined){
						count=dataList.length;
					}else{
						count=dataList.length-1;
					}
					for(var i=0 ; i<count; i++) {
						html.push("<tr>");
						html.push("<td>" +(i+1)+ "</td>");
						if(dataList[i].mtype =="language"){
							html.push("<td>" +"<dict:lang value="多语言" />"+ "</td>");
						}else if(dataList[i].mtype =="dict"){
							html.push("<td>" +"<dict:lang value="数据字典" />"+ "</td>");
						}else if(dataList[i].mtype =="msnewmodel"){
							html.push("<td>" +"<dict:lang value="对外接口" />"+ "</td>");
						}else{
							html.push("<td>" +(dataList[i].mtype =="trig" ? "<dict:lang value="定时器" />" : (dataList[i].mtype == "buss" ? "<dict:lang value="业务模型" />" : (dataList[i].mtype=="commclass" ? "<dict:lang value="公用类" />" : (dataList[i].mtype=="commPage" ? "<dict:lang value="公用视图" />" :""))))+ "</td>");
						}
						html.push("<td title="+dataList[i].mname+">" +dataList[i].mname+ "</td>");
						html.push("<td title="+dataList[i].id+" >"+ (dataList[i].mid ? "<input type='hidden' value='"+ dataList[i].mid+"'>" :"") +dataList[i].id+ "</td>");
						html.push("<td title="+dataList[i].name+">" +dataList[i].name+ "</td>");
						html.push("<td>" + (dataList[i].type =="trig" ? "" : (dataList[i].type =="orm" ? "<dict:lang value="持久模型" />" : (dataList[i].type =="form" ? "<dict:lang value="表单模型" />" : (dataList[i].type =="mcls" ? "<dict:lang value="类管理" />" : (dataList[i].type =="view" ? "<dict:lang value="视图模型" />" :(dataList[i].mtype == "commclass" && dataList[i].type == "0" ? "<dict:lang value="普通类" />" :(dataList[i].mtype == "commclass" && dataList[i].type == "1" ? "<dict:lang value="公用类" />" : (dataList[i].mtype == "commPage" && dataList[i].type == "1" ? "<dict:lang value="弹出" />" : ""))))))))+ "</td>");
						html.push("<td style='text-align:left;'><span style='display:  inline-block;width: 40%;text-align:  right;'><input type='checkbox' "+ (data[i].optype=="1" ? "checked":"") +" style='width:25px;' name='id'  value='"+ dataList[i].id+"_"+dataList[i].mtype+"_"+dataList[i].type+"'></span>")
						if(dataList[i].optype == "1")
						{
							html.push("<span style='color:green'><dict:lang value="新增" /></span>"+ "</td>" );
						}
						else if(dataList[i].optype == "2")
						{
							html.push("<span style='color:red'><dict:lang value="覆盖" /></span>"+ "</td>" );
						}
						else if(dataList[i].optype == "ormexist")
						{
							html.push("<span style='color:red'><dict:lang value="表已存在" /></span>"+ "</td>" );
						}
						html.push("</tr>");
					}
					if(dataList[dataList.length-1].reversion==undefined){
					}else{
						if(dataList[dataList.length-1].reversion!=dataList[dataList.length-1].curversion){
							util.alert("导入系统版本为"+dataList[dataList.length-1].reversion+",当前版本为"+dataList[dataList.length-1].curversion);
						}
					}
					$("#importData").html(html.join(""));
				},
				complete: function(xmlHttpRequest) {  
                    $("#upfile").replaceWith('<input type="file" id="upfile" name="upfile" style="display:none;"/>');  
                    $("#upfile").on("change", function(){  
                    	var fileName = $(this)[0].files[0].name;
                        $("#upfile").prev().prev().html(fileName);
        				$("#upfile").prev().prev().attr("title", fileName);
        				upFile();
                    });  
                },
			});

		}
		
		function selectAll(obj) {
			$("input[name='id'][type='checkbox']").attr("checked",obj.checked);
		}
		
		function importModule() {
			if($("input[name='id'][type='checkbox']:checked").length == 0) {
				window.util.alert("<dict:lang value="请勾选要导入的模块" />");
				return;
			}
			for(var i=0;i<dataList.length;i++){
				var tempList=dataList[i].mid
				if(dataList[i].mtype =="language"){
					tempList=tempList.replace(/&amp;/g,"&");
					tempList=tempList.replace(/&quot;/g,"\"");
					tempList=tempList.replace(/&lt;/g,"<");
					tempList=tempList.replace(/&gt;/g,">");
					tempList=tempList.replace(/&#39;/g,"'");
					dataList[i].mid=tempList
				}
				
			}	
			
			var upData = [];
			$.extend(upData,dataList);
			//alert($("input[name='id'][type='checkbox']:not(:checked)").length); 10
			$("input[name='id'][type='checkbox']:not(:checked)").each(function(i,e) {
				
				for(var j=0; j<upData.length; j++) {
					if(e.value == (upData[j].id+"_" + upData[j].mtype + "_" + upData[j].type) ) {
						upData.splice(j,1);
						break;
					} 
				}
			});
			//异步导入
			var filename = $("#filename").text();
			$.post("${path}sys/BussModelAction_importMod.ms",{"paraMap.idlist":JSON.stringify(upData),"paraMap.filename":filename},function(data){
				//TODO
				$("#impbtn").hide();
				$("#selectAll").hide();
				$("#resultType").text("<dict:lang value="导入结果" />");
				var html = [];
				var count=null
				if(data[data.length-1].reversion==undefined){
					count=data.length;
				}else{
					count=data.length-1;
				}
				for(var i=0 ; i<count ; i++) {
					html.push("<tr>");
					html.push("<td>" +(i+1)+ "</td>");
					if(dataList[i].mtype =="language"){
						html.push("<td>" +"<dict:lang value="多语言" />"+ "</td>");
					}else if(dataList[i].mtype =="dict"){
						html.push("<td>" +"<dict:lang value="数据字典" />"+ "</td>");
					}else if(dataList[i].mtype =="msnewmodel"){
						html.push("<td>" +"<dict:lang value="对外接口" />"+ "</td>");
					}else{
					html.push("<td>" +(data[i].mtype == "trig" ? "<dict:lang value="定时器" />" :(data[i].mtype == "buss" ? "<dict:lang value="业务模型" />" : (data[i].mtype=="commclass" ? "<dict:lang value="公用类" />" : (data[i].mtype=="commPage" ? "<dict:lang value="公用视图" />" :""))))+ "</td>");
					}
					html.push("<td>" +data[i].mname+ "</td>");
					html.push("<td>"+ (data[i].mid ? "<input type='hidden' value='"+ data[i].mid+"'>" :"") +data[i].id+ "</td>");
					html.push("<td>" +data[i].name+ "</td>");
					html.push("<td>" +(data[i].type =="trig" ? "" :(data[i].type =="orm" ? "<dict:lang value="持久模型" />" : (data[i].type =="form" ? "<dict:lang value="表单模型" />" : (data[i].type =="mcls" ? "<dict:lang value="类管理" />" : (data[i].type =="view" ? "<dict:lang value="视图模型" />" :(data[i].mtype == "commclass" && data[i].type == "0" ? "<dict:lang value="普通类" />" :(data[i].mtype == "commclass" && data[i].type == "1" ? "<dict:lang value="公用类" />" : (data[i].mtype == "commPage" && data[i].type == "1" ? "<dict:lang value="弹出" />" : ""))))))))+ "</td>");
					html.push("<td><input type='hidden' id='resMsg_"+i+"' value='"+data[i].resMsg+"'/><input type='hidden' value='"+data[i].process+"'/><input type='hidden' value='"+data[i].error+"'/>");
					if(data[i].res == "1")
					{
						html.push("<span style='color:green;'><dict:lang value="成功" /></span>" + "</td>" );
					}
					else if(data[i].res == "2")
					{
						html.push("<u style='color:red;cursor:pointer;' id='msg_"+i+"'onclick=\"showProcess(this)\" ><dict:lang value="失败" /><img  id=\"resMsg_img_"+i+"\" src=\"${path}plf/page/fp/img/icon/search_down.png?_mc_res_version=<%=PlfStaticRes.TRIG_OPEN_GIF%> \" width=\"15\" height=\"15\" style=\"padding-bottom:5px\"title=\"查看日志\"/></u>"+ "</td>" );
					}
					else if(data[i].res == "4")
					{
						html.push("<u style='color:orange;cursor:pointer;' onclick=\"showBulidMsg(this)\" title=\"点击查看出错内容\" ><dict:lang value="编译失败" /></u>"+ "</td>" );
					}
					html.push("</tr>");
					//html.push("<div><textarea>"+data[i].resMsg +"</textarea><div>")
				}
				$("#importData").html(html.join(""));
			},"json");
			
			//alert(JSON.stringify(upData));
		}
		var obj=null;
		function showProcess(msg) {
			var msgId=$(msg).attr("id")
			var error  = $(msg).prev().val();
			var process  = $(msg).prev().prev().val();
			var errorMsg  = $(msg).prev().prev().prev().val();
			var errorMsgId  = $(msg).prev().prev().prev().attr("id");
			var oders=msgId.split("_")
			$("#resMsg_img_"+oders[1]).attr("src","${path}plf/page/fp/img/icon/search_up.png?_mc_res_version=<%=PlfStaticRes.TRIG_OPEN_GIF%>");
			$("#resMsg_img_"+oders[1]).attr("width","18");
			$("#resMsg_img_"+oders[1]).attr("height","18");
			$("#resMsg_img_"+oders[1]).css("padding-bottom","5px");
			var num=  $(msg).parent().parent().index();
			var trs=document.getElementById('listTable').insertRow(parseInt(num)+parseInt(2));
			var tds=trs.insertCell(0)
			tds.colSpan =7;
			$(tds).attr("style","white-space: normal; overflow: visible;");
			if(process==""||process==null){
				tds.innerHTML="<div style='text-align:left;word-break: break-all'><span style='color:red;' title='点击查看出错内容' onclick='showFailMsg(\""+errorMsgId+"\")'>"+error+"</span></div>"
			}else{
				tds.innerHTML="<div style='text-align:left;word-break: break-all'><span style='color:green;'>"+process+"</span><span style='color:red;' title='点击查看出错内容' onclick='showFailMsg(\""+errorMsgId+"\")'>"+error+"</span></div>"
			}
			$(msg).attr('onclick','').unbind('click').click(function(){deleteProcess(msg);});
		}
		function deleteProcess(msg){
			var msgId=$(msg).attr("id")
			var oders=msgId.split("_")
			$("#resMsg_img_"+oders[1]).attr("src","${path}plf/page/fp/img/icon/search_down.png?_mc_res_version=<%=PlfStaticRes.TRIG_OPEN_GIF%>");
			$("#resMsg_img_"+oders[1]).attr("width","15");
			$("#resMsg_img_"+oders[1]).attr("height","15");
			var num=  $(msg).parent().parent().index();
			var trs=document.getElementById('listTable').deleteRow(parseInt(num)+parseInt(2));
			$(msg).attr('onclick','').unbind('click').click(function(){showProcess(msg);});
		}
		function showBulidMsg(msg){
			var errorMsgId  = $(msg).prev().prev().prev().attr("id");
			showFailMsg(errorMsgId);
		}
		function showFailMsg(id){
			var resMsg=$("#"+id).val();
			var iframeId=window.name;//获取当前iframId
			var url = "${path}sys/BussModelAction_showEorror.ms?paraMap.id="+id+"&paraMap.parentId="+iframeId;
			showPopWin(url, "90%", "70%",null,"<dict:lang value="出错内容"/>");
		}
		function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	</script>
<a></a>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>