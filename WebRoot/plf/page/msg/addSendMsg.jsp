<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="发送消息新增" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
	</jsp:include>
	<link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
		<style>
			.right{
				float:right;
			}
		</style>
		
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}comm/MsgAction_sendMsg.ms" method="post" target="submitFrame">
				
				<s:hidden name="paraMap.UP_ID" />
				<s:hidden name="paraMap.recList" id="recList" />
				
				<input type="hidden" name="mcIframeName" value="${paraMap.mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				<table class="add_table">
					<%-- <tr>
						<td colspan="6">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					<blockquote class="layui-elem-quote"><dict:lang value="前台功能菜单发布" />
							<span class="Point"><span class="Eng">*</span> <dict:lang value="为必填项" />
							</span>
					</blockquote>--%>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="消息类型" />
						</td>
						<td colspan="4">
							<dict:selectDict id="msgDto_type" name="msgDto.type" dictCode="MSGDTO_TYPE" cssClass="_VAL_NULL" />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="消息接收类型" />
						</td>
						<td colspan="4">
							<%-- <dict:selectDict id="msgDto_recObjType" name="msgDto.recObjType" dictCode="REC_OBJ_TYPE" cssClass="_VAL_NULL" 
								onchange="showSelRecObjTxt(this);"/>
							&nbsp;&nbsp;<a href="javascript:selRecObj();"><span id="selRecObj_txt"></span></a> --%>
							<sapn  id="showSelect"></sapn>
							<a href="javascript:openWindow();" class="layui-btn layui-btn-xs">添加</a>
							<a href="javascript:selectedObj();" class="layui-btn layui-btn-normal layui-btn-xs">详情</a>
							
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="消息标题" />
						</td>
						<td colspan="4">
							<input type="text"  lay-verify="required" id="msgDto_title" name="msgDto.title" class="_VAL_NULL _VAL_DATABASE" style="width:100%;" maxlength="300"/>
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="消息内容" />
						</td>
						<td colspan="4">
							<textarea name="msgDto.text" lay-verify="required" id="msgDto_text"  rows="11" style="width:100%" class="_VAL_NULL _VAL_DATABASE" maxlength="3500" ></textarea>
						</td>
					</tr> 
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="提交" />" lay-submit lay-filter="*" onclick="/*add(this);*/" class="layui-btn">
					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
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
	
	var showDep = new Array;
	var showRole= new Array;
	var showUser= new Array;
	
	var DepList= new Array;
	var RoleList= new Array;
	var UserList= new Array;
	var flag=0;
	
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	};
	
	layui.use('form', function(){
  	  var form = layui.form;
  		form.render("select");
  		form.on('submit(*)', function(data){
  			document.getElementById("curIframeName").value=window.frameElement.name;
  			add();
  	 	});
	});
	
	function add(thisObj){
	
		  if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		
		if(!val.valDataBaseSetData()){
			return false;
		}
		
		var depAjax  = "{'recType':'1','deptId':'"+DepList+"'}";
		var roleAjax = "{'recType':'2','roleId':'"+RoleList+"'}";
		var userAjax = "{'recType':'3','userId':'"+UserList+"'}";
		//这里多加判断， 如果为空就不传。
		/* var str = ",";
		if(depAjax){
			str = str+depAjax+",";
		}
		if(RoleList){
			str = str+RoleList+",";
		}
		if(UserList){
			str = str+UserList+",";
		} */
		
		var myArray =  "["+depAjax+","+roleAjax+","+userAjax+"]";
		 
		var recList = "{'recList':"+myArray+"}";
		$("#recList").val(recList);
		document.forms.addForm.action="${path}comm/MsgAction_sendMsg.ms";
		document.forms.addForm.submit();
		isSubmit = true;  
		/* showDep="";
		showRole="";
		showUser="";
		DepList="";
		RoleList="";
		UserList="";  */
	}
	
	function openWindow(){
		var piframeName = window.frameElement.name;
		var url = "${path}comm/MsgAction_showMsgReceiveType.ms?paraMap.isMsgType=2&paraMap.piframeName="+piframeName;
      	showPopWin(url, 1000, 580,null,"<dict:lang value="接收对象选择" />");
	}
	
	
	
	//展示选中的
	function showSelected(){

		//拼接展示
		var showStr="";
		//查看是否有展示的信息，如果有拼接
		if(flag==0){
			var showedStr = $("#showSelect").text();
		}else{
			var showedStr = "";
		}
		flag=0;

		if(showDep){
			 for(var i = 0; i < showDep.length; i++){
     			 showStr = showStr+","+showDep[i];
  			 }
		}
		
		if(showRole){
			for(var i = 0; i < showRole.length; i++){
			 showStr = showStr+","+showRole[i];
			}
		}
		
		if(showUser){
			for(var i = 0; i < showUser.length; i++){
			 showStr = showStr+","+showUser[i];
			}
		}
		
		/* if(showedStr){//0,1,2,3,4
			showStr=showedStr+showStr;
		}else{//,1,2,3,4
			showStr=showStr.substring(1,showStr.length);
		} */
		showStr=showStr.substring(1,showStr.length);
		//限制字符个数
		  var maxwidth=23;
		  if(showStr.length > maxwidth){
		    $("#showSelect").text(showStr.substring(0,maxwidth));
		   	$("#showSelect").html($("#showSelect").text()+'<a href="javascript:void(0);" onclick="selectedObj();" title="<dict:lang value="我的消息" />">... 更多>></a>');
		  }else{
		  	$("#showSelect").text(showStr);
		  } 
	

	};
	
	
	
	//对于已选对象进行筛选
	function selectedObj(){
		//var url = "${path}comm/MsgAction_selectedObj.ms?dataMap.showDep="+showDep+"&dataMap.showRole="+showRole+"&dataMap.showUser="+showUser+"&dataMap.DepList="+DepList+"&dataMap.RoleList="+RoleList+"&dataMap.UserList="+UserList;
      	var piframeName = window.frameElement.name;
		var url = "${path}comm/MsgAction_selectedObj.ms?paraMap.piframeName="+piframeName;
      	showPopWin(url, 950, 450,null,"<dict:lang value="已选择对象" />");
	};
	
	
	

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
