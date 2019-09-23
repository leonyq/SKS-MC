<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="事物http" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp"> 
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<style>
#menu {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 5px;
    border-bottom: 1px solid #ccc;
    padding:0 5px;
    height: 30px;
    margin-top: 5px;
}

#menu li {
	text-decoration: none;
	list-style: none;
	display: inline-block;
	border: 1px solid #CCC;
	border-bottom:none;
	padding:4px 10px;
	height: 20px;
	line-height: 20px;
	text-align: center;
	background-color: #95c4e6;
	float:left;
	margin: 0 1px;
	margin-top: 2px;
}

#menu li.current{
	background-color: #FCFCFC;
}


#menu li:hover {
	background-color: #FCFCFC;
}
</style>
<body>
	<div class="all" >
		<div class="add_table_div">
			<form id="addForm"  class="layui-form" name="addForm" action="${path}eventHttp/eventHttpManageAction_update.ms" method="post" target="submitFrame">
				<table class="add_table">
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口名称" />
						</td>
						<td colspan="4">
							<s:textfield  id="MODEL_NAME" cssStyle="width:100%" maxlength="100" name="paraMap.MODEL_NAME"  cssClass="_VAL_NULL _VAL_DATABASE" onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
					</tr>
					<tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口说明" />
						</td>
						<td colspan="4">
							<s:textfield  maxlength="300" cssStyle="width:100%" id="MODEL_MEMO" name="paraMap.MODEL_MEMO" cssClass="_VAL_NULL _VAL_DATABASE"  onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="name" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="name" lay-verify="required" name="paraMap.name" value="<s:property value="ajaxMap.name"/>" class="_VAL_NULL"  onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
						<td>
							&nbsp;
						</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="详细描述" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="detail" lay-verify="required" name="paraMap.detail" value="<s:property value="ajaxMap.detail"/>" class="_VAL_NULL"  maxlength="500" onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="url" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="url" lay-verify="required" name="paraMap.url" value="<s:property value="ajaxMap.url"/>" class="_VAL_NULL" onkeyup="javascript:replaceLikeVal1(this)"/>
						</td>
						<td>
							&nbsp;
						</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="请求方式" />
						</td>
						<td style="width: 270px;">
							<dict:selectDict name="paraMap.method"  dictCode="RQ_TYPE" dictValue="%{${fn:escapeXml(ajaxMap.method)}}"   onchange="hidenContext()" id="RQ_TYPE" onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
					</tr>
				</table>
				<DIV id=title class="mc-tab">
					<UL class="layui-tab-title" style="margin-top: 10px;">
							<LI id="tag1"><A
							onclick="switchTag('tag1','content1','');this.blur();showHeaders(this);"
							href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="Headers"/></SPAN> </A></LI>
						
						<LI id="tag2"><A
							onclick="switchTag('tag2','content2','');this.blur();showBody(this);"
							href="javascript:void(0);"> <SPAN><dict:lang value="body"/></SPAN> </A></LI>
						
					</UL>
				</DIV>
				<table id="contextHeaderBody" style="display: none;">
					<tr>
						<td>
							<ul id="menu">
							<li class="current"><a href="javascript:void(0);" class="item-con" id="head" type="radio" onclick="showHeaders(this)" ><dict:lang
							value="Headers:" /></a>
							</li>
							<li><a href="javascript:void(0);" class="item-con" type="radio" onclick="showBody(this)"><dict:lang value="body:" /></a>
							</li>
							</ul>
						</td>
					</tr>
				</table>
				<%-- <table class="add_table">
					<tr>
						<td width="50%" class="tr1">
							<input id="head" name="check" type="radio" onclick="showHeaders()"/><dict:lang value="Headers：" /><span class="Eng">*</span>
						</td>
						<td width="50%" class="tr1">
							<input name="check" type="radio" onclick="showBody()"/><dict:lang value="body：" /><span class="Eng">*</span>
						</td>
					</tr>
				</table> --%>
				<DIV class=content1 id="content">
				<DIV id="content1" data-tab="tag1">
				<table id="addHeaders" class="add_table">
					<tr>
						<td>
							<input type="text" id="headerName"  style="width:90%;" onkeyup="javascript:replaceLikeVal(this)"/><span class="Eng">*</span>
						</td>
						<td>
							<input type="text" id="headerValue"  style="width:98%;" onkeyup="javascript:replaceLikeVal(this)" /><span class="Eng">*</span>
						</td>
						<td>
							<bu:funOper funcNo="F626" type="a" href="javascript:void(0);" onclick="addHeader('${IMG_PATH}');" title="%{getText('增加')}" cssClass="layui-btn layui-btn-normal layui-btn-xs">
									<dict:lang value="增加" />
							</bu:funOper>
						</td>
					</tr>
				</table>
				</DIV>
				<DIV id="content2" style="display:none" data-tab="tag2">
				<table id="checkBody" style="display:none; margin-top: 10px;" >
					<tr>
						<td class="mc-database-radio-td">
						<label><input name="select" type="radio" value="key_value" checked onclick="showKey_value()" title="<dict:lang value="FORM" />"/></label>
						
						<label><input name="select" type="radio" value="areaBig" onclick="showArea()" title="<dict:lang value="大文本" />"/></label>
						</td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td>
							<select id="selectHeader" name="selectHeader" onchange="setHeader(this.options[this.options.selectedIndex].value)">
								<option id="0"><dict:lang value="自动生成头部信息" /></option>
								<option id="1">JSON</option>
								<option id="2">FORM</option>
							</select>
						</td>
					</tr>
				</table>
				<table id="addBodys" class="add_table" style="display:none">
					<tr>
						<td width="35%">
							<input type="text" id="addBodys1" style="width:90%;" onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
						<td width="43%" >
							<input type="text" id="addBodys2" style="width:98%;" onkeyup="javascript:replaceLikeVal(this)"/>
						</td>
						<td width="7%">
							<bu:funOper funcNo="F626" type="a" href="javascript:void(0);" onclick="addBody('${IMG_PATH}');" title="%{getText('增加')}" cssClass="layui-btn layui-btn-normal layui-btn-xs">
									<dict:lang value="增加" />
							</bu:funOper>
						</td>
					</tr>
				</table>
				<table id="area" style="display:none">
					<tr>
						<td>
							<textarea id="areaText" rows="8" cols="100" ><%-- <s:property value="ajaxMap.bodys"/> --%></textarea>
						</td>
					</tr>
				</table>
				</DIV>
				</DIV>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="保存" />" lay-submit lay-filter="*" onclick="/*update(this);*/" class="layui-btn">
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<input type="hidden" id="id" name="paraMap.id" value="<s:property value="ajaxMap.id"/>">
				<input type="hidden" id="headers" name="paraMap.headers" value="<s:property value="ajaxMap.headers"/>">
				<input type="hidden" id="bodys" name="paraMap.bodys" value="<s:property value="ajaxMap.bodys"/>">
			<s:hidden id="moduleId" name="paraMap.moduleId"/>
			</form>
		</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		//document.getElementById("content3").style.display="";
		//document.getElementById("content4").style.display="";
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			$("#" + tag).addClass("current").siblings().removeClass("current");
			if ("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
		if(tag=="tag1"){
			//loadItem();
			//$("#allSelect").removeAttr("checked");
		}
		
	}
	
	var path = "${IMG_PATH}";
	function replaceLikeVal(comp){  
		util.replaceLikeVal(comp)
    }
	function replaceLikeVal1(comp){
		  if (comp.value.indexOf("'") != -1 ||comp.value.indexOf("\"") != -1||comp.value.indexOf("<") != -1||comp.value.indexOf(">") != -1
	        		||comp.value.indexOf("{") != -1||comp.value.indexOf("}") != -1||comp.value.indexOf("[") != -1||comp.value.indexOf("]") != -1
	        		||comp.value.indexOf("(") != -1||comp.value.indexOf(")") != -1) {  
	            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"")
	            .replace(/{/g,"").replace(/\(/g,"").replace(/\)/g,"").replace(/\[/g,"").replace(/\]/g,"").replace(/\}/g,"");
	            util.alert("不能输入单引号双引号<>{}()[]");
	        }  
  } 
	$(function(){
		$("#RQ_TYPE").attr("lay-filter","hidenContext");
		$("#selectHeader").attr("lay-filter","setHeader");
		$("#MODEL_NAME").attr("lay-verify","required");
		$("#MODEL_MEMO").attr("lay-verify","required");
		switchTag("tag1", "content1", "");
	});
	layui.use('form', function(){
  	  var form = layui.form;
  	  form.on('select(hidenContext)',function(data){   
		  var val=data.value;
		  if(val=="2"){
				$("#addHeaders").hide();
				$("#addBodys").hide();
				$("#contextHeaderBody").hide();
				
				$("#title").hide();
				$("#content").hide();
			}else{
				$("#addHeaders").show();
				//$("#contextHeaderBody").show();
				
				$("#title").show();
				$("#content").show();
			}
			//console.info(val);
		});
  		form.on('select(setHeader)',function(data){
		  var val=data.elem[data.elem.selectedIndex].text;
		  $("#headerName").val("Content-Type");
			if(val=="FORM"){
				$("#headerValue").val("application/x-www-form-urlencoded");
			}else if(val=="JSON"){
				$("#headerValue").val("application/json");
			}
		  
		});
  		form.render("select");
  		form.on('submit(*)', function(data){
  			update();
  	 	});
	});
	
	function init(){
	var methName=$("#RQ_TYPE").val();
	if(methName=="1"){
	/**初始化 header**/
		var first=1;
		var headerString=$("#headers").val();
		var headers=eval('('+headerString+')');
		var headerAdd="";
		var reg = new RegExp("^[0-9]*$");
		for(var j in headers){
		   if(!reg.test(j)){
		   		break;
		   }
			var obj = headers[j];
			 if(first==1){
			 	headerAdd += "<tr>"
					  + "<td width='35%'><input type='text' id='headerName'  style=\"width:90%;\" value="+obj.key+" /><span class=\"Eng\">*</span></td>"
					  + "<td width='43%'><input type='text' id='headerValue'  style=\"width:98%;\" value="+obj.value+" /><span class=\"Eng\">*</span></td>"
					  + "<td width='7%'>"
					  + "<a class='layui-btn layui-btn-normal layui-btn-xs' onclick=\"addHeader('"+path+"')\" title='增加' href='javascript:javascript:void(0);'>"
					  + "<dict:lang value='增加' /></a>";
				headerAdd += "</td></tr>";
				//headerAdd += "<img src=\""+path+"/m_add.gif?_mc_res_version=<%=PlfStaticRes.M_ADD_GIF%>\" onclick=\"addHeader('"+path+"')\"/>";
				first++;
			}else{
				headerAdd += "<tr>"
					  + "<td width='35%'><input type='text'  style=\"width:90%;\" value="+obj.key+" /><span class=\"Eng\">*</span></td>"
					  + "<td width='43%'><input type='text'  style=\"width:98%;\" value="+obj.value+" /><span class=\"Eng\">*</span></td>"
					  + "<td width='7%'>"
					  + "<a class='layui-btn layui-btn-danger layui-btn-xs' onclick=\"deleteTrRow(this);\" title='删除' href='javascript:javascript:void(0);'>"
					  + "<dict:lang value='删除' /></a>";
				//headerAdd += "<img src=\""+path+"/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>\" onclick=\"deleteTrRow(this)\"/>";
			 	headerAdd += "</td></tr>";
			};
		}
		$("#addHeaders").html(headerAdd);
		$("#head").parent().addClass("current").siblings().removeClass(
					"current");
		showHeaders();
		
	/**初始化 body**/
		first=1;
		var bodysString=$("#bodys").val();
		if(bodysString.endWith("keyValueFlag")){
		$("input[name='select'][value='key_value']").attr("checked",true);
		bodysString=bodysString.substring(0,bodysString.length-12);
		var bodys=eval('('+bodysString+')');
		var bodysAdd="";
		for(var j in bodys){
			if(!reg.test(j)){
		   		break;
		    }
			var obj = bodys[j];
			 if(first==1){
			 	bodysAdd += "<tr>"
					  + "<td width='35%'><input type='text'  style=\"width:90%;\" value="+obj.key+" /><span class=\"Eng\">*</span></td>"
					  + "<td width='43%'><input type='text'  style=\"width:98%;\" value="+obj.value+" /><span class=\"Eng\">*</span></td>"
					  + "<td width='7%'>"
					  + "<a class='layui-btn layui-btn-normal layui-btn-xs' onclick=\"addBody('"+path+"')\" title='增加' href='javascript:javascript:void(0);'>"
					  + "<dict:lang value='增加' /></a>";
				//bodysAdd += "<img src=\""+path+"/m_add.gif?_mc_res_version=<%=PlfStaticRes.M_ADD_GIF%>\" onclick=\"addBody('"+path+"')\"/>";
				bodysAdd += "</td></tr>";
				first++;
			}else{
				bodysAdd += "<tr>"
					  + "<td width='35%'><input type='text' style=\"width:90%;\" value="+obj.key+" /><span class=\"Eng\">*</span></td>"
					  + "<td width='43%'><input type='text' style=\"width:98%;\" value="+obj.value+" /><span class=\"Eng\">*</span></td>"
					  + "<td width='7%'>"
					  + "<a class='layui-btn layui-btn-danger layui-btn-xs' onclick=\"deleteTrRow(this);\" title='删除' href='javascript:javascript:void(0);'>"
					  + "<dict:lang value='删除' /></a>";
				//bodysAdd += "<img src=\""+path+"/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>\" onclick=\"deleteTrRow(this)\"/>";
			 	bodysAdd += "</td></tr>";
			};
		}
		$("#addBodys").html(bodysAdd);
		}else{
			$("#areaText").val($("#bodys").val());
		}
		}else{
			$("#addHeaders").css("display","none");
			$("#addBodys").css("display","none");
			$("#contextHeaderBody").css("display","none");
		}
	}
	function showEditCode(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
		var url = "${path}httpService/httpMgrAction_toEditCode.ms";
		showPopWin(url, "99%", "99%",null,"<dict:lang value="修改类源码"/>");
	}
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function update(thisObj){
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		if(!val.valDataBaseSetData()){
			isSubmit=false;
			return false;
		}
		var methName=$("#RQ_TYPE").val();
		if(methName=="1"){
		var tdArr;
		var key;
		var value;
		var jsonHeader="";
		var jsonBody="";
		var headerList = new Array();
		var bodyList = new Array();
		var first=1;
		$("#addHeaders tr").each(function(){
			if(first!=1){
				headerList.push(",");
				first++;
			}
			tdArr = $(this).children();
			key = tdArr.eq(0).find("input").val();
			value = tdArr.eq(1).find("input").val();
			jsonHeader="{key:\""+key+"\",value:\""+value+"\"}";
			headerList.push(jsonHeader);
		});
		/* 校验头部不能为空 */
		var flagEnd=0;
		$("#addHeaders tr").each(function(){
			tdArr = $(this).children();
			key = tdArr.eq(0).find("input").val();
			value = tdArr.eq(1).find("input").val();
			if(key.trim()==""){
				flagEnd=1;
				//return false;
			}
			if(value.trim()==""){
				flagEnd=2;
				//return false;
			}
			//return false;
		});
		if(flagEnd==1){
			util.alert("<dict:lang value="Headers中key不能为空" />...");
			return;
		}
		if(flagEnd==2){
			util.alert("<dict:lang value="Headers中value不能为空" />...");
			return;
		}
		
		
		var sel=$('input:radio[name="select"]:checked').val();
		if(sel=="key_value"){
			first=1;
			$("#addBodys tr").each(function(){
			if(first!=1){
				bodyList.push(",");
				first++;
			}
			tdArr = $(this).children();
			key = tdArr.eq(0).find("input").val();
			value = tdArr.eq(1).find("input").val();
			if(key.trim()==""){
				flagEnd=1;
				//return;
			}
			if(value.trim()==""){
				flagEnd=2;
				//return ;
			}
			jsonBody="{key:\""+key+"\",value:\""+value+"\"}";
			bodyList.push(jsonBody);
		});
		if(flagEnd==1){
			util.alert("<dict:lang value="body中key不能为空" />...");
			return;
		}
		if(flagEnd==2){
			util.alert("<dict:lang value="body中value不能为空" />...");
			return;
		}
		$("#bodys").val("["+bodyList+"]keyValueFlag");
		}else{
			if($("#areaText").val().trim()==""){
				util.alert("<dict:lang value="大文本不能为空" />...");
				return;
			}
			$("#bodys").val($("#areaText").val().trim());
		}
		$("#headers").val("["+headerList+"]");
		}
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.addForm.submit();
		isSubmit = true;
	}
	function addHeader(path){
		var tables = $("#addHeaders");
		var headerAdd = $("<tr>"
					  + "<td width='35%'><input type='text'id='headers"+new Date()+"' onkeyup=\"javascript:replaceLikeVal(this)\" style=\"width:90%;\" /><span class=\"Eng\">*</span></td>"
					  + "<td width='43%'><input type='text' id='headers"+new Date()+"' onkeyup=\"javascript:replaceLikeVal(this)\"style=\"width:98%;\" /><span class=\"Eng\">*</span></td>"
					  + "<td width='7%'>"
					  + "<a class='layui-btn layui-btn-danger layui-btn-xs' onclick=\"deleteTrRow(this);\" title='删除' href='javascript:javascript:void(0);'>"
					  + "<dict:lang value='删除' /></a>"
					  //+ "<img src=\""+path+"/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>\" onclick=\"deleteTrRow(this)\"/>"
					  + "</td>"
					  + "</tr>");
		headerAdd.appendTo(tables);
	}
	function addBody(path){
		var tables = $("#addBodys");
		var bodyAdd = $("<tr>"
					  + "<td width='35%'><input type='text' id='bodys"+new Date()+"' onkeyup=\"javascript:replaceLikeVal(this)\"style=\"width:90%;\" /><span class=\"Eng\">*</span></td>"
					  + "<td width='43%'><input type='text' id='bodys"+new Date()+"' onkeyup=\"javascript:replaceLikeVal(this)\"style=\"width:98%;\" /><span class=\"Eng\">*</span></td>"
					  + "<td width='7%'>"
					  + "<a class='layui-btn layui-btn-danger layui-btn-xs' onclick=\"deleteTrRow(this);\" title='删除' href='javascript:javascript:void(0);'>"
					  + "<dict:lang value='删除' /></a>"
					  //+ "<img src=\""+path+"/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>\" onclick=\"deleteTrRow(this)\"/>"
					  + "</td>"
					  + "</tr>");
		bodyAdd.appendTo(tables);
	}
	function deleteTrRow(tr){
		$(tr).parent().parent().remove();
	}
	function showKey_value(){
		$("#addBodys").show();
		$("#area").hide();
	}
	
	function showArea(){
		$("#addBodys").hide();
		$("#area").show();
	}
	function showHeaders(obj){
		$("#addBodys").hide();
		$("#area").hide();
		$("#checkBody").hide();
		$("#addHeaders").show();
		$(obj).parent().addClass("current").siblings().removeClass(
					"current");
	}
	function showBody(obj){
		$("#addHeaders").hide();
		$("#checkBody").show();
		$(obj).parent().addClass("current").siblings().removeClass(
					"current");
		if($("#areaText").val().trim()!=""){
			$("input[name='select'][value='areaBig']").prop("checked",true);
			showArea();
		}else{
			$("#addBodys").show();
			$("input[name='select'][value='key_value']").prop("checked",true);
			showKey_value();
		}
	}
	String.prototype.endWith=function(str){
		if(str==null||str==""||this.length==0||str.length>this.length){
			return false;
		}
		if(this.substring(this.length-str.length)==str){
			return true;
		}else{
			return false;
		}
		return true;
	};
	function setHeader(name){
		$("#headerName").val("Content-Type");
		if(name=="FORM"){
			$("#headerValue").val("application/x-www-form-urlencoded");
		}else if(name=="JSON"){
			$("#headerValue").val("application/json");
		}
	}
	function hidenContext(){
		var methName=$("#RQ_TYPE").val();
		if(methName=="2"){
			$("#addHeaders").hide();
			$("#addBodys").hide();
			$("#contextHeaderBody").hide();
			$("#title").hide();
			$("#content").hide();
		}else{
			$("#addHeaders").show();
			//$("#contextHeaderBody").show();
			$("#title").show();
			$("#content").show();
		}
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>