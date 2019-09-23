<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="在线用户信息列表" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="layui" value="1" />
</jsp:include>
<script type="text/javascript">
	util.initDictMap('["USER_LOGIN_TYPE","USER_USE_TYPE"]');
	util.initLangMap('["确定要强制下线<font class=\\\"hzt\\\">“&lt;%s&gt;用户”</font>吗"]');
	var _GLO_FORM_PAGE_MAP = {};<%-- 子分页map对象 --%>
</script>
<style>
#data_list_tr3 tr{
	height:38px;
}

</style>
</head>
<body>

	<div class="">
		
		<table class="search_table">
			<tr>
				
				<td >
				 <div class="search_table_wrap">
					<dict:lang value="服务器IP" />
					<div class="layui-input-inline">
						<s:textfield id="mip"
								name="userDtoSh.mip" cssClass="input_sh" maxlength="120" />
					</div>
				</div>
				<div class="search_table_wrap">
					<dict:lang value="登录IP" />
					<div class="layui-input-inline">
						<s:textfield id="uLoginIp"
								name="userDtoSh.uLoginIp" cssClass="input_sh" maxlength="120" />
					</div>
				</div>
				<div class="search_table_wrap">
					<dict:lang value="用户名称" />
					<div class="layui-input-inline">
						<s:textfield id="name" name="userDtoSh.name" cssClass="input_sh" maxlength="30" />
					</div>
				</div>
				<div class="search_table_wrap">
					<input type="button" value="<dict:lang value="查询" />"
						onclick="query();" class="layui-btn">
				</div>
				</td>
			</tr>
		</table>
		
		<div class="table_div">
			<table class="table_list">
				<tr class="tdcolor">
					<th width="110px;"><dict:lang value="授权操作员数" /></th>
					<th width="110px;"><dict:lang value="授权开发者数" /></th>
					<th width="110px;"><dict:lang value="授权线体数" /></th>
					<th width="150px;"><dict:lang value="授权开始时间" /></th>
					<th width="110px;"><dict:lang value="授权天数" /></th>
					<th width="150px;"><dict:lang value="授权到期时间" /></th>
				</tr>
				<tbody id="data_list2_tr">
				</tbody>
			</table>
		</div>
		<br>
		<!--P  -->
				<div class="table_div mc-table-container" >
     	<!-- left start -->
			<div class="mc-table-left">
				<!-- left content start -->
				<div class="mc-table-left-content">
	   <table id="listTable" class="table_list">
           <thead>
		<tr class="tdcolor">
			<th width="40px;"><dict:lang value="编号" /></th>
			<th width="150px;"><dict:lang value="应用服务器" /></th>
			<th width="100px;"><dict:lang value="登录用户IP" /></th>
			<th width="90px;"><dict:lang value="用户名称" /></th>
			<th width="70px;"><dict:lang value="登录名称" /></th>
			<th width="150px;"><dict:lang value="登录时间" /></th>
			<th width="90px;"><dict:lang value="单位名称" /></th>
			<th width="70px;"><dict:lang value="用户类型" /></th>
			<th width="60px;"><dict:lang value="终端类型" /></th>
		</tr>
		</thead>
				<tbody id="data_list_tr">
				</tbody>
	</table>
		</div>
			<!-- left content end -->
				
			</div>
			<!-- left end -->
			<!-- right start -->
			<div class="mc-table-right">
			<div class="mc-table-left-content">
				<table  class="table_list">
					<thead>
						<tr>
							<th width="90px;"><dict:lang value="操作" /></th>
						</tr>
					</thead>
					<tbody id="data_list_tr3">
						
					</tbody>
				</table>
			</div></div>
			<!-- right end -->
	</div>
	
	<!-- p -->
	</div>

	<div style="display: none;">
		<%-- 数据提交from(用于实现异步提交) --%>
		<form id="submit_form" name="submitForm" action=""
			target="submit_frame" method="post">
			<input type="hidden" id="del_id" name="userDto.id" /> <input
				type="hidden" id="del_uLoginType" name="userDto.uLoginType" />
				<input type="hidden" id="del_mip" name="userDto.mip" /> 
				<input type="hidden" id="del_mipPort" name="userDto.mipPort" /> 
		</form>
		<%-- 数据提交iframe(用于实现异步提交) --%>
		<iframe id="submit_frame" name="submit_frame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">
	//$("#listTable").css("min-width",1366);
	//setTableStyle("listTable");
	var paginationImpl = new Object();
	
	<%-- 异步刷新用户列表方式 --%>
	function listUserAx(page){
		util.showTopLoading();
		var url = "${path}/sys/UserAction_listAllOnlineUserAx.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paginationImpl.currentPage":page.currentPage,"paginationImpl.pageRecord":page.pageRecord,
	    	"userDtoSh.name":$("#name").val(),"userDtoSh.loginName":$("#loginName").val(),"userDtoSh.mip":$("#mip").val(),"userDtoSh.uLoginIp":$("#uLoginIp").val()},
			success: function(data){util.closeLoading();
				<%-- alert(JSON.stringify(data));--%>
				if(null == data){return;}
				var innerTbody="";
				var innerTbody2="";
				var operHtml = "";
				try{
				if(null !=data.ajaxMap && null !=data.ajaxMap.opUser){
					jQuery.each(data.ajaxMap.opUser, function(i, userDto) {
						<%-- 操作用户或DCT单独登录的 --%>
						if("0" == userDto.uLoginType || ("4" == userDto.uLoginType)){
							innerTbody+=fitDataTable(userDto,i);
							operHtml += operDataTable(userDto);
						}
					});
				}
				if(null !=data.ajaxMap && null !=data.ajaxMap.devUser){
					innerTbody += '<tr style="height:38px;"><td colspan="9" ></td></tr>';
					operHtml += '<tr style="height:38px;"><td colspan="1" ></td></tr>';
					jQuery.each(data.ajaxMap.devUser, function(i, userDto) {
						innerTbody+=fitDataTable(userDto,i);
						operHtml += operDataTable(userDto);
					});
				}
				if(null !=data.ajaxMap && null !=data.ajaxMap.hardRootUser){
					innerTbody += '<tr style="height:38px;"><td colspan="9" ></td></tr>';
					operHtml += '<tr style="height:38px;"><td colspan="1" ></td></tr>';
					jQuery.each(data.ajaxMap.hardRootUser, function(i, dmpDto) {
						dmpDto.mip = "<b>"+"-"+dmpDto.mip +"</b>";
						innerTbody+=fitDataTable(dmpDto,i);
						//operHtml += operDataTable(userDto);
						operHtml += operDataTable(dmpDto);
						if(null !=data.ajaxMap && null !=data.ajaxMap.opUser){
						jQuery.each(data.ajaxMap.opUser, function(i, userDto) {
							<%-- DCT通过DMP登录的 --%>
							if("3" == userDto.uLoginType && dmpDto.id== userDto.hardRootId){
								userDto.mip = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+userDto.mip ;
								innerTbody+=fitDataTable(userDto,i);
								operHtml += operDataTable(userDto);
							}
						});
						}
					});
				}
				
				$("#data_list_tr").html(innerTbody);
				console.log(operHtml);
				$("#data_list_tr3").html(operHtml);

				var opUserCount =0;
				if(null!= data.ajaxMap && null!= data.ajaxMap.opUser){
					opUserCount = data.ajaxMap.opUser.length;
				}

				var devUserCount =0;
				if(null!= data.ajaxMap && null!= data.ajaxMap.devUser){
					devUserCount = data.ajaxMap.devUser.length;
				}
				innerTbody2 += '<tr>';
				innerTbody2 += '<td>'+data.ajaxMap.opUserNo+'('+opUserCount+')'+'</td>';
				innerTbody2 += '<td>'+data.ajaxMap.devUserNo+'('+devUserCount+')'+'</td>';
				innerTbody2 += '<td>'+data.ajaxMap.lineCount+'</td>';
				innerTbody2 += '<td>'+data.ajaxMap.sDate+'</td>';
				innerTbody2 += '<td>'+data.ajaxMap.days+'</td>';
				innerTbody2 += '<td>'+data.ajaxMap.eDate+'</td>';
				innerTbody += '</tr>';
				$("#data_list2_tr").html(innerTbody2);
				util.closeTopLoading();
				isQuery= false;
				initLoaded();
				}catch(e){
					util.closeLoading();
					util.closeTopLoading();
					try{ util.alert(data.ajaxStr); }catch(e1){alert(e);}					
				}
			},
			error: function(msg){
				util.alert("error:"+msg);
				isQuery= false;
				util.closeLoading();
				util.closeTopLoading();
			}
		});
	}
	
	/* 操作table */
	function operDataTable(userDto){
		var operHtml = "";
			 if("1" == userDto.useType){//只有PC用户登录后才有强制下线功能
				operHtml = '<tr><td><a href="javascript:offLine(\''+userDto.id+'\',\''+userDto.name+'\',\''+userDto.uLoginType+'\',\''+userDto.mip+'\',\''+userDto.mipPort+'\')" class="layui-btn layui-btn-danger layui-btn-xs"><dict:lang value="强制下线" /></a></td></tr>';
			}else{
				operHtml = '<tr><td></td></tr>';
			} 
		return operHtml;
	}
	<%-- 填充数据 --%>
	function fitDataTable(userDto,i){
		var innerTbody="";
		var mipPro = toString(userDto.mip)+":"+toString(userDto.mipPort);
		innerTbody += '<tr>';
		innerTbody += '<td>'+(i+1)+'</td>';
		innerTbody += '<td title="'+mipPro+'" style="text-align: left;">'+toString(userDto.mip)+":"+toString(userDto.mipPort)+'</td>';
		innerTbody += '<td>'+toString(userDto.uLoginIp)+'</td>';
		innerTbody += '<td>'+toString(userDto.name)+'</td>';
		innerTbody += '<td>'+toString(userDto.loginName)+'</td>';

		var time = userDto.loginLogTime;
		var timeFmt = "";
		if(typeof time == "number"){
			timeFmt =new Date(time).Format("yyyy-MM-dd hh:mm:ss");
		}
		innerTbody += '<td title="'+timeFmt+'">'+timeFmt+'</td>';
		innerTbody += '<td title="'+toString(userDto.deptName)+'">'+toString(userDto.deptName)+'</td>';
		
		/*
		if("0"==userDto.enable){
			innerTbody += '<td><span style="color: red;" >'+util.getDictShow('USER_STATE',userDto.enable)+'</span></td>';
		}else{
			innerTbody += '<td>'+util.getDictShow('USER_STATE',userDto.enable)+'</td>';
		}*/

		var uLoginType = util.getDictShow("USER_LOGIN_TYPE", userDto.uLoginType);
		if("1" == toString(userDto.uLoginType)){
			uLoginType = '<div style="color:#fff;background:#6666ff">'+uLoginType+'</div>';
		}else{
			uLoginType = '<div style="color:#fff;background:#1E9FFF">'+uLoginType+'</div>';
		}
		innerTbody += '<td>'+uLoginType+'</td>';
		var useType = util.getDictShow("USER_USE_TYPE", toString(userDto.useType));
		
		innerTbody += '<td>'+useType+'</td>';
		/* if("1" == userDto.useType){只有PC用户登录后才有强制下线功能
			innerTbody += '<td><a href="javascript:offLine(\''+userDto.id+'\',\''+userDto.name+'\',\''+userDto.uLoginType+'\',\''+userDto.mip+'\',\''+userDto.mipPort+'\')" class="layui-btn layui-btn-danger layui-btn-xs"><dict:lang value="强制下线" /></a></td>';
		}else{
			innerTbody += '<td></td>';
		}  */
		innerTbody += '</tr>';
		return innerTbody;
	}
	
	function toString(inParam){
		if(typeof inParam == "string"){
			return util.toString(inParam);
		}else if(typeof inParam == "number"){
			return util.toString(inParam);
		}else if( $.isEmptyObject(inParam)){
			return "";
		}else{
			return JSON.stringify(inParam);
		}
	}
	
	var isQuery = false;
	function query(){
		paginationImpl.currentPage = "1";
		queryLs();
	}
	function queryLs(){
		listUserAx(paginationImpl);
		if(isQuery){util.alert(util.submit_default_info);}
		isQuery= true;
	}
	
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		closePopWin();
		queryLs();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function closePopWin(){
		hidePopWin(false);
	}

	var delId = "";
	var del_uLoginType = "";
	var del_mip = "";
	var del_mipPort = "";
	function offLine(id,uname,uLoginType,mip,mipPort){//"确定要强制下线<font class=\"hzt\">“&lt;%s&gt;用户”</font>吗"
		util.confirm(delConfirm,util.getLangShow("确定要强制下线%s用户吗",uname));
		delId = id;
		del_mip=mip;
		del_mipPort=mipPort
		del_uLoginType = uLoginType;
	}
	
	function delConfirm(){
    document.forms.submit_form.action="${path}sys/UserAction_offLineUser.ms";
		$("#del_id").val(delId);
		$("#del_uLoginType").val(del_uLoginType);
		$("#del_mip").val(del_mip);
		$("#del_mipPort").val(del_mipPort);
		document.forms.submit_form.submit();
	}
		
	function initLoaded(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	
	listUserAx(paginationImpl);

</script>
	<%-- 引用弹对话框 --%>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>