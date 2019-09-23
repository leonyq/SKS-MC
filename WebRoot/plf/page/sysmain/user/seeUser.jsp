<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="员工信息查看" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
		<style type="text/css">
		.black_overlay{
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: #f8fcff;
			z-index: 1001;
			opacity:0.5;
			filter:alpha(opacity=88);	
		}
		.white_content{
			display: none;
			position: absolute;
			top: 25%;
			left: 25%;
			width: 50%;
			height: 54%;
			padding: 10px;
			border: 1px solid #cbe9ff;
			background-color: #f8fcff;
			z-index: 1002;
			overflow: auto;
		}
		.white_content_s{
				display: none;
				position: absolute;
				top: 22%;
				left: 20%;
				width: 70%;
				height: 54%;
				padding: 10px;
				border: 1px solid #cbe9ff;
				background-color: #f8fcff;
				z-index: 1002;
				overflow: auto;
			}		
	</style>
<body contenteditable="false"  >
  <div class="mod" style="height: 495px;padding:10px 20px;" contenteditable="false" >
	
	<s:hidden id="userDto_photoName" name="userDto.photoName"/>
		<s:hidden id="userPhotoPath" value="${path}"/>
		<s:hidden name="userDto.id" id="userId"/>
	   
	<table class="basic-table">
       
        <tr>
			<td class="name" style="width: 84px;"><span class="dot">*</span><dict:lang value="员工编号" /></td>
			<td class="dec" style="width:220px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" readonly="true" name="userDto.loginName" maxlength="60" />
				<span class="Eng"><span id="userDto_loginName_err"><c:out value='${errors["userDto.loginName"][0]}' /></span></span>
			</td>
			<td class="name"  style="width: 77px;"><span class="dot">*</span><dict:lang value="员工名称" /></td>
			<td class="dec" style="width:220px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="userDto.name" readonly="true" maxlength="15" />
				<span class="Eng"><span id="userDto_name_err"><c:out value='${errors["userDto.name"][0]}' /></span></span>
			</td>
			<td style="width: 200px;" rowspan="3">
			<div id="photoImg">
				<img id="userPhoto" style="margin-left: 15px;width:100px;height:100px;" title="<dict:lang value="支持图像大小在2M以内" />"/>
       				<img id="preview" style="display: none;margin-left: 15px;width:100px;height:100px;" title="<dict:lang value="支持图像大小在2M以内" />">
       				<span class="Eng"><span id="userDto_photo_err"></span></span>
       			</div>
			</td>
       </tr>
       
          <tr>
        	<td class="name"><span class="dot">*</span><dict:lang value="组织机构" /></td>
			<td class="dec" >
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="userDto.data_auth_name" readonly="true" maxlength="60" />
			</td>
			<td class="name"><span class="dot">*</span><dict:lang value="所属部门" /></td>
			<td class="dec">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="userDto.deptName" readonly="true" maxlength="60" />
			</td>
							
       </tr>
       
        <tr>
        	<td class="name"><dict:lang value="英文名称" /></td>
			<td class="dec">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="userDto.englishName" readonly="true" maxlength="30"/>
			</td>
			
			<td style="text-align: right;"><span class="dot">*</span><dict:lang value="所在时区" /></td>
							<td class="dec timeClass" style="padding-bottom: 15px">
							<select id ="usTimeZone" name="userDto.usTimeZone" style="cursor: pointer;width:200px;" disabled="true" class="dept_select IS_SELECT_FILTER ">
							<s:iterator value="@com.more.fw.core.dict.ui.DictInit@getCachedDict('TIME_ZONE')" id="ls" >
								<option value="<s:property value="code" />" title="<s:property value="%{getText(value)}"/>">GMT <s:property value="code" />(<s:property value="%{getText(value)}" />)</option>
							</s:iterator>
							</select>	
								<span class="Eng"><span id="userDto_usTimeZone_err"><c:out value='${errors["userDto.usTimeZone"][0]}' /></span></span>
							</td>
							
       </tr>
       
       <tr>
       		<td class="name"><dict:lang value="座机电话" /></td>
       		<td class="dec">
       			<s:textfield cssClass="input" cssStyle="width: 200px;" id="userPhone" name="userDto.phone" readonly="true" maxlength="17" />
				<span class="Eng"><span id="userDto_phone_err"></span></span>
			</td>
			<td class="name"><dict:lang value="移动电话" /></td>
       		<td class="dec">
       			<s:textfield cssClass="input" cssStyle="width: 200px;" id="userMobile" name="userDto.mobile" readonly="true" maxlength="11" />
				<span class="Eng"><span id="userDto_mobile_err"></span></span>
			</td>
       </tr>
       <tr>
       		<td class="name"><dict:lang value="微信账号" /></td>
       		<td class="dec">
       			<s:textfield cssClass="input" cssStyle="width: 200px;" id="userWeixin" name="userDto.weixin" readonly="true" maxlength="30" />
				<span class="Eng"><span id="userDto_weixin_err"></span></span>
			</td>
			<td class="name"><dict:lang value="电子邮箱" /></td>
       		<td class="dec">
       			<s:textfield cssClass="input" cssStyle="width: 200px;" id="userEmail" name="userDto.email" readonly="true" maxlength="50" />
				<span class="Eng"><span id="userDto_email_err"></span></span>
			</td>
       </tr>
       <tr>
			<td class="name"><span class="dot">*</span><dict:lang value="员工状态" /></td>
			<td class="dec">
			    <dict:selectDict name="userDto.enable" dictCode="USER_STATE" dictValue="%{userDto.enable}" style="cursor: pointer;width:200px;" cssClass="dept_select" disabled="true"/>
			</td>
       		<td class="name"><span class="dot">*</span><dict:lang value="员工类型" /></td>
       		<td class="dec">
				<dict:selectDict id="userType" name="userDto.userType" dictCode="USER_TYPE" dictValue="%{userDto.userType}" onchange="utChange();" style="cursor: pointer;width:200px;" cssClass="dept_select" disabled="true"/>
			</td>
			<td class="dec" style="padding:0;">
				
			</td>
       </tr>
       <tr>
       		<td class="name"><dict:lang value="所属客户" /></td>
       		<td class="dec">
       		<input type="text" id="empCustCode" name="empCustCode" class="input _VAL_NULL input isSubmit _VAL_OjbsData" style="width: 200px;"  readonly="readonly">
			</td>
       		<td class="name"><dict:lang value="所属供应商" /></td>
       		<td class="dec">
       		<input type="text" id="empSupCode" name="empSupCode" class="input _VAL_NULL input isSubmit _VAL_OjbsData" style="width: 200px;"  readonly="readonly">
			</td>
       </tr>
       
       <tr>
          <td class="name"  style="width: 77px;"><dict:lang value="钉钉编码" /></td>
      <td class="dec" style="width:220px;">
        <s:textfield cssClass="input" cssStyle="width: 200px;" name="userDto.ding_user_id" maxlength="15" readonly="true"/>
      </td>
      
      <td class="name"  style="width: 77px;"><dict:lang value="微信编码" /></td>
      <td class="dec" style="width:220px;">
        <s:textfield cssClass="input" cssStyle="width: 200px;" name="userDto.wx_user_id" maxlength="15" readonly="true"/>
      </td>
      
       </tr>
       <tr>
			<td class="name"><dict:lang value="职位信息" /></td>
       		<td class="dec" colspan="3">
       		    <textarea id="deptPosition"   readonly="readonly" class="" style="width: 500px;height: 50px;" >
       		    </textarea>
       
			</td>	
       </tr>
     </table>
     
		<div class="dialog-mask" id="backShadow" style="z-index:1029"></div>
        
     
     	<div >
	<div style="width:30%;float: left;margin-right:5%;">
		<div class="mod-hd" style="border:0">		
  		<h3 class="tit" style="border:0"><dict:lang value="角色信息" /></h3>
	</div>	
	<div >
		
    <table  class="dlist-table table-line "style="width: 100%;table-layout:fixed;">
		<thead>
		<tr>
			<th style="width: 30px;text-align: center;box-sizing: border-box;">&nbsp;&nbsp;</th>
			<th style="width: 30px;text-align: center;box-sizing: border-box;"><input type="checkbox" id="role_list_cb_s" onchange="getAllRole_s();" style="margin:0" /></th >
			<th style="width: 80px;text-align: center;box-sizing: border-box;"><dict:lang value="角色名称" /></th>
			<th style="text-align: center;"><dict:lang value="角色描述" /></th>
		</tr>
		</thead>
     </table>
    <div style="height: 120px;overflow: auto;" class="scroll1">
    <table  class="dlist-table" style="width: 100%;table-layout:fixed;" id="roleTable">
		<tbody id="roletbodyList">
	<s:iterator value="roleLsY" status="index">
		<tr id="trr<c:out value='${id}' />">
			<td style="width: 30px;text-align: center;box-sizing: border-box;"></td>
			<td style="width: 30px;text-align: center;box-sizing: border-box;"><input type="checkbox" style="margin:0"/></td >
			<td style="width: 80px;text-align: left;box-sizing: border-box;"><input type="hidden" name="userDto.roleId" value="<c:out value='${id}' />"><s:property value="name"/></td>
			<td style="text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" ondblclick="remark(this);" ondblclick="remark(this);" title="<s:property value="remark"/>"><s:property value="remark"/></td>
		</tr>
	</s:iterator>
		</tbody>
	</table>
	</div>
	</div>
	</div>
	
	<div style="width:30%;float:left;margin-right:5%;">
		<div class="mod-hd" style="border:0">		
  		<h3 class="tit" style="border:0"><dict:lang value="工种信息" /></h3>
	</div>
		<div >
		
	    <table  class="dlist-table table-line "style="width: 100%;table-layout:fixed;">
		<thead>
		<tr>
			<th style="width: 30px;text-align: center;box-sizing:border-box;">&nbsp;</th>
			<th style="width: 30px;text-align: center;box-sizing:border-box;"><input type="checkbox" id="job_list_cb_s" onchange="getAllJob_s();" style="margin:0"/></th >
			<th style="width: 80px;text-align: center;box-sizing:border-box;"><dict:lang value="工种名称" /></th>
			<th style="text-align: center;"><dict:lang value="工种描述" /></th>
		</tr>
		</thead>
		</table>
	<div style="height: 120px;overflow: auto;" class="scroll2">
		<table  class="dlist-table" style="width: 100%;table-layout:fixed;" id="jobTable">
		<tbody id="jobtbodyList">
	<s:iterator value="jobLsY" status="index">
		<tr id="trj<s:property value="id"/>" >
			<td style="width: 30px;text-align: center;"></td>
			<td style="width: 30px;text-align: center;"><input type="checkbox"/></td >
			<td style="width: 80px;text-align: left;"><input type="hidden" name="userDto.jobId" value="<c:out value='${id}' />"><s:property value="JobName"/></td>
			<td style="text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"ondblclick="remark(this);" title="<s:property value="remark"/>"><s:property value="remark"/></td>
		</tr>
	</s:iterator>
		</tbody>
	</table>
	</div>
	</div>
	</div>


		<div style="width:30%;float: left;">
		<div class="mod-hd" style="border:0">		
	  		<h3 class="tit" style="border:0"><dict:lang value="组织机构权限" /></h3>
	  			
		</div>
		<div >
	
	
	
	    <table  class="dlist-table table-line "style="width: 100%;table-layout:fixed;">
			<thead>
			<tr class="thcolor">
				<th style="width: 30px;text-align: center;box-sizing: border-box;"></th>
				<th style="width: 30px;text-align: center;box-sizing: border-box;"><input type="checkbox" id="dept_list_cb_s" onchange="getAllDept_s();" style="margin:0;" /></th >
				<th style="text-align: center;box-sizing: border-box;"><dict:lang value="组织机构权限" /></th>
			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div style="height: 120px;overflow: auto;" class="scroll3">
		    <table  class="dlist-table"style="width: 100%;table-layout:fixed;" id="deptTable">
				<thead>
				</thead>
				<tbody id="addDeptList">
					<s:iterator value="deptUserLs" status="index">
						<tr id="trj<s:property value="id"/>" >
							<td style="width: 30px;text-align: center;"></td>
							<td style="width: 30px;text-align: center;"><input type="checkbox"/></td >
							<td style="text-align: left;"><input type="hidden" name="userDto.deptIdList" value="<c:out value='${id}' />"><s:property value="name"/></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		</div>
		</div>
	
</div>
   </div>
 
	


<script type="text/javascript">
	var escNameStr = "";
	var eccNameStr = "";
	var escStr = "";
	var eccStr = "";
	window.onload=function(){
		document.getElementById("userPhoto").src = $("#userPhotoPath").val()+"plf/userPhoto/"+$("#userDto_photoName").val();
		if ($("#userDto_photoName").val()=="") {
		document.getElementById("userPhoto").src = $("#userPhotoPath").val()+"plf/images/user.png";
		}
		var userId = $("#userId").val();
		lendexd("roleTable");
		lendexd("jobTable");
		lendexd("deptTable");
		escNameStr = $("#userDto_empSupCode_name").val();
		eccNameStr = $("#userDto_empCustCode_name").val();
		escStr = $("#userDto_empSupCode").val();
		eccStr = $("#userDto_empCustCode").val();
		$("#empSupCode").val(escNameStr);
		$("#empCustCode").val(eccNameStr);
		queryDeptPosition();
	};

		
	function lendexd(tableId){
		var len = $("#"+tableId+" tr").length;
			for(var i=0;i<len;i++){
				$("#"+tableId+" tr:eq("+i+") td:first").text(i+1);
			} 
	}
    
function queryDeptPosition()
	 {
	    var userId=$("#userId").val();
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: "${path}/sys/UserAction_queryDeptPosition.ms",
	    data: {'userId':userId},
			success: function(data){
				if(data.ajaxList!=null)
				{
				  var deptPositionName='';
				
				  for(var i=0;i<data.ajaxList.length;i++)
				  {
				   deptPositionName+=data.ajaxList[i].DEPT_NAME;
				   deptPositionName+='/'+data.ajaxList[i].POSITION_NAME;
				   deptPositionName+='/'+data.ajaxList[i].POSITION_TYPE_NAME;
				   if(i!=data.ajaxList.length-1){deptPositionName+='\n';}				  
				   $("#deptPosition").html(deptPositionName);				 
				}
				}
			},
			error: function(msg){
				
			}
		});
	}
	 

</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.mod');
    setPopScroll('.scroll1');
    setPopScroll('.scroll2');
    setPopScroll('.scroll3');
    
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>