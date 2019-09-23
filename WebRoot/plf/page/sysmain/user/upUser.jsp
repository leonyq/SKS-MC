<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="员工信息修改" /></title>
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
			.timeClass .active-result{
					overflow: hidden;
		    		text-overflow: ellipsis;
		   			 white-space: nowrap;
}	
	</style>
<body style="overflow:hidden;">
  <div class="mod" style="margin-top: 47px;height: 550px;">
	<div>
			    <div class="optn" style="top:5px;">
			        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
				    <button type="button" onclick="resetForm();"><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			<div class="scroll7" style="overflow-y: auto;height: 450px;">
	<form id="up_form" name="upForm" action="${path}sys/UserAction_upUser.ms" method="post" enctype="multipart/form-data"  style="padding:10px 20px;" target="submitFrame">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" value="F29" />
		<s:token />
		<s:hidden name="userDto.id" id="userId"/>
		<s:hidden name="userDto.pw" id="userPw"/>
		<s:hidden name="userDto.editPwTime" id="usereditPwTime"/>
		<s:hidden id="userDto_photoName" name="userDto.photoName"/>
		<s:hidden id="userDto_empCustCode_name" name="userDto.eccName"/>
		<s:hidden id="userDto_empSupCode_name" name="userDto.escName"/>
		<s:hidden id="userDto_empCustCode" name="userDto.empCustCode"/>
		<s:hidden id="userDto_empSupCode" name="userDto.empSupCode"/>
		<s:hidden id="userPhotoPath" value="${path}"/>
		<input type="hidden" id="iframeId" name="paraMap.iframeId"/><!-- 
		<input type="hidden" id="empSupCode_s" name="userDto.empSupCode"/>
		<input type="hidden" id="empCustCode_s" name="userDto.empCustCode"/> -->
	   <%-- <div class="ptop_10 txac">
			<input type="button" value="<dict:lang value="提 交" />" onclick="edit(this);" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="reset" value="<dict:lang value="重 置" />"class="botton_img_search" />
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="关 闭" />" onclick="closeWindow();" class="botton_img_search">
		</div> --%>
	<table class="basic-table">
       <%-- <tr>
          <th colspan="6">员工信息修改<span class="Point"><dict:lang value="（带 " /><span class="Eng">*</span> <dict:lang value="为必填项）" /></span>
          </th>
       </tr> --%>
        <tr>
			<td class="name" style="width: 84px;"><span class="dot">*</span><dict:lang value="员工编号" /></td>
			<td class="dec" style="width:220px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="userDto.loginName" maxlength="60" />
				<span class="Eng"><span id="userDto_loginName_err"><c:out value='${errors["userDto.loginName"][0]}' /></span></span>
			</td>
			<td class="name"  style="width: 77px;"><span class="dot">*</span><dict:lang value="员工名称" /></td>
			<td class="dec" style="width:220px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="userDto.name" maxlength="15" />
				<span class="Eng"><span id="userDto_name_err"><c:out value='${errors["userDto.name"][0]}' /></span></span>
			</td>
			<td style="width: 200px;" rowspan="3">
			<div id="photoImg">
					<img id="userPhoto" style="margin-left: 15px;width:100px;height:100px;" title="<dict:lang value="支持图像大小在${fn:escapeXml(photoSizeInt)}K以内" />"/>
       				<img id="preview" style="display: none;margin-left: 15px;width:100px;height:100px;" title="<dict:lang value="支持图像大小在2M以内" />">
       				<span class="Eng"><span id="userDto_photo_err"></span></span>
       			</div>
			</td>
       </tr>
       
       <tr>
			<td class="name"><span class="dot">*</span><dict:lang value="组织机构" /></td>
			<td class="dec" >
				<select name='userDto.data_auth' id='data_auth' class="dept_select" style="width: 200px; " onchange="data_auth_change(this.value)">
					<option value=''>--请选择--</option>
				</select>
				<span class="Eng"><span id="userDto_dataauth_err"><c:out value='${errors["userDto.data_auth"][0]}' /></span></span>
			</td>
			
			<td class="name"><span class="dot">*</span><dict:lang value="所属部门" /></td>
			<td class="dec">
				<s:select list="deptLs" headerKey="" headerValue="--%{getText('请选择')}--"
					listKey="id" listValue="levleName"  id="userDto_deptId" name="userDto.deptId" 
					cssStyle="cursor: pointer;width: 200px;" cssClass="dept_select"/>
				<span class="Eng"><span id="userDto_deptId_err"><c:out value='${errors["userDto.deptId"][0]}' /></span></span>
			</td>
			
		</tr>
				       	
        <tr>
        	<td class="name"><dict:lang value="英文名称" /></td>
			<td class="dec">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="userDto.englishName" maxlength="30"/>
			</td>
			
			<td style="text-align: right;"><span class="dot">*</span><dict:lang value="所在时区" /></td>
			<td class="dec timeClass" style="">
			<select id ="usTimeZone" name="userDto.usTimeZone" style="cursor: pointer;width:200px;" class="dept_select IS_SELECT_FILTER ">
			<s:iterator value="@com.more.fw.core.dict.ui.DictInit@getCachedDict('TIME_ZONE')" id="ls" >
				<option value="<s:property value="code" />" title="<s:property value="%{getText(value)}"/>">GMT <s:property value="code" />(<s:property value="%{getText(value)}" />)</option>
			</s:iterator>
			</select>	
			
			
       </tr>
       
       <tr>
       		<td class="name"><dict:lang value="座机电话" /></td>
       		<td class="dec">
       			<s:textfield cssClass="input" cssStyle="width: 200px;" id="userPhone" name="userDto.phone" maxlength="17" />
				<span class="Eng"><span id="userDto_phone_err"></span></span>
			</td>
			<td class="name"><dict:lang value="移动电话" /></td>
       		<td class="dec">
       			<s:textfield cssClass="input" cssStyle="width: 200px;" id="userMobile" name="userDto.mobile" maxlength="11" />
				<span class="Eng"><span id="userDto_mobile_err"></span></span>
			</td>
       </tr>
       <tr>
       		<td class="name"><dict:lang value="微信账号" /></td>
       		<td class="dec">
       			<s:textfield cssClass="input" cssStyle="width: 200px;" id="userWeixin" name="userDto.weixin" maxlength="30" />
				<span class="Eng"><span id="userDto_weixin_err"></span></span>
			</td>
			<td class="name"><dict:lang value="电子邮箱" /></td>
       		<td class="dec">
       			<s:textfield cssClass="input" cssStyle="width: 200px;" id="userEmail" name="userDto.email" maxlength="50" />
				<span class="Eng"><span id="userDto_email_err"></span></span>
			</td>
			<td class="dec" style="padding:0;">
				
				<div ><!-- style="display: none;" -->
				<input type="file" id="photo" name="upFile" onchange="javascript:setImagePreview();" style="width:200px;margin-left:15px;"/>				
				</div>
			</td>
       </tr>
       <tr>
			<td class="name"><span class="dot">*</span><dict:lang value="员工状态" /></td>
			<td class="dec">
				<dict:selectDict id="userEnable" name="userDto.enable" dictCode="USER_STATE" dictValue="%{userDto.enable}" style="cursor: pointer;width:200px;" cssClass="dept_select"/>
			</td>
       		<td class="name"><span class="dot">*</span><dict:lang value="员工类型" /></td>
       		<td class="dec">
				<dict:selectDict id="userType" name="userDto.userType" dictCode="USER_TYPE" dictValue="%{userDto.userType}" onchange="utChange();" style="cursor: pointer;width:200px;" cssClass="dept_select"/>
			</td>
			
       </tr>
       <tr>
       		<td class="name"><dict:lang value="所属客户" /></td>
       		<td class="dec">
       		<input type="text" id="empCustCode" name="empCustCode" class="input ico-search-input" style="width: 200px;" onclick="popECCDiv('addEmpCustCode','backShadow');" readonly="readonly">
			<%-- <button type="button" class="ico ico-search-input" id="paraMap1_CTI_MODEL_CODE_SHOW_BUTTON" onclick="popECCDiv('addEmpCustCode','backShadow');" title="<dict:lang value="点击选择 所属客户" />" style="left: 215px;"></button>
			 --%></td>
       		<td class="name"><dict:lang value="所属供应商" /></td>
       		<td class="dec">
       		<input type="text" id="empSupCode" name="empSupCode" class="input ico-search-input" style="width: 200px;" onclick="popESCDiv('addEmpSupCode','backShadow');" readonly="readonly">
			<%-- <button type="button" class="ico ico-search-input" id="paraMap1_CTI_MODEL_CODE_SHOW_BUTTON" onclick="popESCDiv('addEmpSupCode','backShadow');" title="<dict:lang value="点击选择 所属供应商" />" style="left: 215px;"></button>
			 --%></td>
       </tr>
       
       <tr>
       		<td class="name"  style="width: 77px;"><dict:lang value="钉钉编码" /></td>
			<td class="dec" style="width:220px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="userDto.ding_user_id" maxlength="100" />
				<span class="Eng"><span id="userDto_ding_user_id_err"><c:out value='${errors["userDto.ding_user_id"][0]}' /></span></span>
			</td>
			
			<td class="name"  style="width: 77px;"><dict:lang value="微信编码" /></td>
			<td class="dec" style="width:220px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="userDto.wx_user_id" maxlength="100" />
				<span class="Eng"><span id="userDto_wx_user_id_err"><c:out value='${errors["userDto.wx_user_id"][0]}' /></span></span>
			</td>
			
       </tr>
       <tr>
			<td class="name"><dict:lang value="职位信息" /></td>
       		<td class="dec" colspan="3">
       		    <textarea id="deptPosition"  onclick="deptPositionSet();" readonly="readonly" class="" style="width:497px;height: 50px;" >
       		    </textarea>
       		    <img onclick="deptPositionSet();" alt="" src="${path }/plf/page/fp/img/ico-kl.png" 
       		    style="cursor: pointer;position: absolute; top:20px;vertical-align: top" >
				<span class="Eng"><span id="userDto_post_user_id_err"></span></span>
				<input type='hidden' name="userDeptPosition" id="userDeptPosition" />
			</td>	
       </tr>
        
     </table>
     <s:hidden id="usTz" name="paraMap.usTimeZone" />
		<div class="dialog-mask" id="backShadow" style="z-index:1029"></div>
        
     

     	

	<div style="width:30%;float: left;margin-right:5%;">
		<div class="mod-hd" style="border:0">		
  		<h3 class="tit" style="border:0"><dict:lang value="角色信息" /></h3>
  		<div class="extend-btn" style="float: right;margin-top:10px;">

			<button type="button" onclick="popRoleDiv('addRole','backShadow');"><i class="ico ico-kl-new-add ico-small" title=<dict:lang value="新增" />></i></button>
			<button type="button" onclick="delRoleRow();"><i class="ico ico-sc-new-add ico-small" title=<dict:lang value="删除" />></i></button>     		        
   		</div>	
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
	

	<div style="width:30%;float: left;margin-right:5%;">
		<div class="mod-hd" style="border:0">		
  		<h3 class="tit" style="border:0"><dict:lang value="工种信息" /></h3>
  		<div class="extend-btn" style="float: right;margin-top:10px;">

			<button type="button" onclick="popJobDiv('addJob','backShadow');"><i class="ico ico-kl-new-add ico-small" title=<dict:lang value="新增" />></i></button>
			<button type="button" onclick="delJobRow();"><i class="ico ico-sc-new-add ico-small" title=<dict:lang value="删除" />></i></button>     		        
   		</div>	
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
	<div style="height: 120px;overflow: auto;"  class="scroll2">
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
	  		<h3 class="tit" style="border:0"><span class="dot">*</span><dict:lang value="组织机构权限" /></h3>

	  		<div class="extend-btn" style="float: right; margin-top:10px;">

	  			<button type="button" onclick="popDeptDiv('addDept','backShadow');"><i class="ico ico-kl-new-add ico-small" title=<dict:lang value="新增" />></i></button>
				<button type="button" onclick="delDeptRow();"><i class="ico ico-sc-new-add ico-small" title=<dict:lang value="删除" />></i></button>     		        
	   		</div>	
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
		<div style="height: 120px;overflow: auto;"  class="scroll3">
		    <table  class="dlist-table"style="width: 100%;table-layout:fixed;" id="deptTable">
				<thead>
				</thead>
				<tbody id="addDeptList">
					<s:iterator value="deptUserLs" status="index">
						<tr id="trs<s:property value="id"/>" >
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

     </form>
</div>
   </div>
   </div>
	


   	<div class="dialog dialog-s1" id="addEmpCustCode" style="display:none;z-index:1030;margin-left:0px;left:20px;top:50px;width:790px;height:365px;" >
			 <div class="dialog-hd">
				 <h3 class="tit"><dict:lang value="所属客户"/></h3>
			 </div>	
			 <a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addEmpCustCode', 'backShadow');"></a>
			  <div class="dialog-bd-div" style="width:100%;height:380px;">
			<div class="optn optn_div">
				<button type="button" onclick="addECCList('addEmpCustCode','backShadow');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addEmpCustCode','backShadow');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchECC('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>
			<div style="padding-top: 10px;">
			    <table style="width: 100%;background-color: white;">
			    	<tr>
			    		<td style="width: 106px;text-align: right;"><dict:lang value="客户编号"/></td>
			    		<td style="width: 157px;text-align: left;">&nbsp;<input class="input" style="width: 157px;" type="text" id="searchECCode"/></td>
			    		<td style="width: 106px;text-align: right;"><dict:lang value="客户名称"/></td>
			    		<td style="width: 157px;text-align: left;">&nbsp;<input class="input" style="width: 157px;" type="text" id="searchECName"/></td>
			    		<td style="width: 239px;"></td>
			    	</tr>
			    </table>
			</div>
	<table class="dlist-table table-line" style="width: 100%;table-layout:fixed;margin-top: 10px;">
		<thead>
			<tr>
				<th style="width: 30px;"></th >
				<th style="width: 30px;"></th >
				<th style="width: 145px;"><dict:lang value="客户编号" /></th >
				<th style="width: 145px;"><dict:lang value="客户名称" /></th >
				<th style="width: 165px;"><dict:lang value="客户简称" /></th >
				<%-- <th style=""><dict:lang value="客户组" /></th > --%>
				<th style="width: 125px;"><dict:lang value="等级" /></th >
				<th ><dict:lang value="状态" /></th >
			</tr>
		</thead>
	</table>
<div style="max-height: 210px;overflow: auto;background-color: white;height: 210px;">
	<table class="dlist-table" style="width: 100%;table-layout:fixed;">
		<tbody id="eccTbody">
		
		</tbody>
	</table>
	</div>
		<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchECC&formId=formId1&showLoading=0" />
	</div>
	</div>
	
	
	<div class="dialog dialog-s1" id="addEmpSupCode" style="display:none;z-index:1030;margin-left:0px;left:110px;top:60px;width:596px;height:365px;" >
		 <div class="dialog-hd">
			 <h3 class="tit"><dict:lang value="所属供应商"/></h3>
		 </div>	
		 <a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addEmpSupCode', 'backShadow');"></a>
		  <div class="dialog-bd-div" style="width:100%;height:380px;">
			<div class="optn optn_div">
				<button type="button" onclick="addESCList('addEmpSupCode','backShadow');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addEmpSupCode','backShadow');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchESC('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>
			<div style="padding-top: 10px;background-color: white;">
			    <table style="width: 100%;">
			    	<tr>
			    		<td style="width: 106px;text-align: right;"><dict:lang value="供应商代号"/></td>
			    		<td style="width: 157px;text-align: left;">&nbsp;<input class="input" style="width: 157px;" type="text" id="searchESCode"/></td>
			    		<td style="width: 106px;text-align: right;"><dict:lang value="供应商名称"/></td>
			    		<td style="width: 157px;text-align: left;">&nbsp;<input class="input" style="width: 157px;" type="text" id="searchESName"/></td>
			    		<td style="width: 50px;"></td>
			    	</tr>
			    </table>
			</div>
	<table class="dlist-table table-line" style="width: 100%;table-layout:fixed;margin-top: 10px">
		<thead>
			<tr>
				<th style="width: 30px;"></th >
				<th style="width: 30px;"></th >
				<th style="width: 180px;"><dict:lang value="供应商代码" /></th >
				<th style="width: 180px;"><dict:lang value="供应商名称" /></th >
				<th ><dict:lang value="供应商简称" /></th >
			</tr>
		</thead>
	</table>
	<DIV style="max-height: 210px;overflow: auto;background-color: white;height: 210px;">
	<table class="dlist-table" style="width: 100%;table-layout:fixed;">
		<tbody id="escTbody">
		
		</tbody>
	</table>
	</DIV>
		<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchESC&formId=formId2&showLoading=0" />
	</div>
	</div>
	
	
	
	
	
	<div class="dialog dialog-s1" id="addRole" style="display:none;z-index:1030;margin-left:0px;left:170px;top:70px;width:520px;height:365px;" >
	 <div class="dialog-hd">
		 <h3 class="tit"><dict:lang value="角色信息"/></h3>
	 </div>	
	 <a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addRole', 'backShadow');"></a>
	  <div class="dialog-bd-div" style="width:100%;height:380px;">
			<div class="optn optn_div">
				<button type="button" onclick="addRoleList('addRole','backShadow');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addRole','backShadow');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchRole('formId3');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>
			<div style="padding-top:10px;background-color: white;">
			    <table style="width: 100%;">
			    	<tr>
			    		<td style="width: 106px;text-align: right;"><dict:lang value="角色名称"/></td>
			    		<td style="width: 157px;text-align: left;">&nbsp;<input class="input" style="width: 157px;" type="text" id="searchRoleName"/></td>
			    		<td style="width: 146px;"></td>
			    	</tr>
			    </table>
			</div>
	<table class="dlist-table table-line " style="width: 100%;table-layout:fixed;margin-top: 10px;">
		<thead>
			<tr>
				<th style="width: 30px;text-align: center;">&nbsp;</th>
				<th style="width: 30px;text-align: center;"><input type="checkbox" id="role_list_cb" onchange="getAllRole();" /></th >
				<th style="width: 80px;text-align: center;"><dict:lang value="角色名称" /></th >
				<th style="text-align: center;"><dict:lang value="角色描述" /></th >
			</tr>
		</thead>
	</table>
<div style="overflow: auto;background-color: white;height: 234px;" class="scroll4">
	<table class="dlist-table" style="width: 100%;table-layout:fixed;">
		<tbody id="roleTbody">
		
		</tbody>
	</table>
	</div>
	<!---->
	<div style="">
		<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchRole&formId=formId3&showLoading=0" />
	</div>
	</div>
	</div>
	
	
	
	
	
	
	<div class="dialog dialog-s1" id="addJob" style="display:none;z-index:1030;margin-left:0px;left:170px;top:70px;width:520px;height:365px;" >
		 <div class="dialog-hd">
			 <h3 class="tit"><dict:lang value="工种信息"/></h3>
		 </div>	
		 <a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addJob', 'backShadow');"></a>
		  <div class="dialog-bd-div" style="width:100%;height:380px;">
			<div class="optn optn_div">
				<button type="button" onclick="addJobList('addJob','backShadow');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addJob','backShadow');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchJob('formId4');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>
			<div style="padding-top: 10px;background-color: white;">
			    <table style="width: 100%;">
			    	<tr>
			    		<td style="width: 106px;text-align: right;"><dict:lang value="工种名称"/></td>
			    		<td style="width: 157px;text-align: left;">&nbsp;<input class="input" style="width: 157px;" type="text" id="searchJobName"/></td>
			    		<td style="width: 146px"></td>
			    	</tr>
			    </table>
			</div>
	<table class="dlist-table table-line " style="width: 100%;table-layout:fixed;margin-top: 10px">
		<thead>
			<tr>
				<th style="width: 30px;text-align: center;">&nbsp;</th >
				<th style="width: 30px;text-align: center;"><input type="checkbox" id="job_list_cb" onchange="getAllJob();" /></th >
				<th style="width: 120px;text-align: center;"><dict:lang value="工种名称" /></th >
				<th style="text-align: center;"><dict:lang value="工种描述" /></th >
			</tr>
		</thead>
	</table>
	<DIV style="overflow: auto;background-color: white;height: 234px;" class="scroll5">
	<table class="dlist-table" style="width: 100%;table-layout:fixed;">
		<tbody id="jobTbody">
		
		</tbody>
	</table>
	</div>
	<!---->
	<div style="">
		<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchJob&formId=formId4&showLoading=0" />
	</div>
	</div>
	</div>
	<div class="dialog dialog-s1" id="addDept" style="display:none;z-index:1030;margin-left:0px;left:170px;top:70px;width:520px;height:365px;" >
	 <div class="dialog-hd">
		 <h3 class="tit"><dict:lang value="组织机构"/></h3>
	 </div>	
	 <a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addDept', 'backShadow');"></a>

	  <div class="dialog-bd-div" style="width:100%;height:380px;">

			<div class="optn optn_div">

				<button type="button" onclick="addDeptList('addDept','backShadow');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addDept','backShadow');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="getDept('formId5');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>

			<div style="padding-top:10px;background-color: white;">

			    <table style="width: 100%;">
			    	<tr>
			    		<td style="width: 106px;text-align: right;"><dict:lang value="部门名称"/></td>
			    		<td style="width: 157px;text-align: left;">&nbsp;<input class="input" style="width: 157px;" type="text" id="searchDeptName"/></td>
			    		<td style="width: 146px;"></td>
			    	</tr>
			    </table>
			</div>
	<table class="dlist-table table-line " style="width: 100%;table-layout:fixed;margin-top: 10px;">
		<thead>
			<tr>
				<th style="width: 30px;text-align: center;">&nbsp;</th>
				<th style="width: 30px;text-align: center;"><input type="checkbox" id="dept_list_cb" onchange="getAllDept();" /></th >
				<th style="text-align: center;"><dict:lang value="部门名称" /></th >
			</tr>
		</thead>
	</table>
<div style="overflow: auto;background-color: white;height: 234px;"  class="scroll6">
	<table class="dlist-table" style="width: 100%;table-layout:fixed;">
		<tbody id="deptTbody">
		
		</tbody>
	</table>
	</div>
	<!---->
	<div style="">
		<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=getDept&formId=formId5&showLoading=0" />
	</div>
	</div>
	</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script >

//用户类型——客户、供应商能否编辑
	function utChange(){
		if (0 == parseInt($("#userType").val())) {
			 $("#empCustCode").attr("disabled",true);
			 $("#empSupCode").attr("disabled",true);
		}else if (1 == parseInt($("#userType").val())) {
			 $("#empCustCode").attr("disabled",false);
			 $("#empSupCode").attr("disabled",false);
		}
	}

	//双击显示备注详情
	function remark(obj){
	utilsFp.popRemark("",obj.title,"");
	}
		
	function getAllRole(){
		if($("#role_list_cb").attr("checked")=="checked"){
			$("#roleTbody :checkbox").attr("checked",true);
			$("#roleTbody :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$("#roleTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			$("#roleTbody :checkbox").parents("tr").css("background-color","");
			});
		}
	}
	
	function getAllDept(){
		if($("#dept_list_cb").attr("checked")=="checked"){
			$("#deptTbody :checkbox").attr("checked",true);
			$("#deptTbody :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$("#deptTbody :checkbox").each(function(){
				$(this).attr("checked",false);
				$("#deptTbody :checkbox").parents("tr").css("background-color","");
			});
		}
	}
	
	function getAllRole_s(){
		if($("#role_list_cb_s").attr("checked")=="checked"){
			$("#roletbodyList :checkbox").attr("checked",true);
			$("#roletbodyList :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$("#roletbodyList :checkbox").each(function(){
				$(this).attr("checked",false);
			$("#roletbodyList :checkbox").parents("tr").css("background-color","");
			});
		}
	}	
	
	function getAllDept_s(){
		if($("#dept_list_cb_s").attr("checked")=="checked"){
			$("#addDeptList :checkbox").attr("checked",true);
			$("#addDeptList :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$("#addDeptList :checkbox").each(function(){
				$(this).attr("checked",false);
				$("#addDeptList :checkbox").parents("tr").css("background-color","");
			});
		}
	}
	
	function getAllJob(){
		if($("#job_list_cb").attr("checked")=="checked"){
			$("#jobTbody :checkbox").attr("checked",true);
			$("#jobTbody :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$("#jobTbody :checkbox").each(function(){
				$(this).attr("checked",false);
				$("#jobTbody :checkbox").parents("tr").css("background-color","");
			});
		}
	}	
	
		function getAllJob_s(){
		if($("#job_list_cb_s").attr("checked")=="checked"){
			$("#jobtbodyList :checkbox").attr("checked",true);
			$("#jobtbodyList :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$("#jobtbodyList :checkbox").each(function(){
				$(this).attr("checked",false);
				$("#jobtbodyList :checkbox").parents("tr").css("background-color","");
			});
		}
	}
function setImagePreview(){
	var hhotoObj = document.getElementById("photo");
	var imgObjPreview = document.getElementById("preview");
	document.getElementById("userPhoto").style.display="none";
	if (hhotoObj.files && hhotoObj.files[0]) {
		//火狐下，直接設img属性
		imgObjPreview.style.display = 'block';
		imgObjPreview.src = window.URL.createObjectURL(hhotoObj.files[0]);
	}else{
		//IE下，使用滤镜
		//$("#photo").parent().show();
		hhotoObj.select();
		var imgSrc = document.selection.createRange().text;
		document.selection.empty();
		//$("#photo").parent().hide();
		var imgId = document.getElementById("photoImg");
		try {
			imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
		} catch (e) {
						utilsFp.confirmIcon(3,"","","", "<dict:lang value="您上传的图片格式不正确" />",0,"300","");
			return false;
		}
		imgObjPreview.style.display = 'none';
		//document.selection.empty();
	}
	return true;
}
	//重置	
	function resetForm(){
		$("#up_form")[0].reset();
		$("#empSupCode").val(eccNameStr);
		$("#empCustCode").val(eccNameStr);
		$("#userDto_empCustCode").val(eccStr);
		$("#userDto_empSupCode").val(escStr);
		$("#userDto_deptId").trigger("chosen:updated");
		$("#userEnable").trigger("chosen:updated");
		$("#userType").trigger("chosen:updated");
	}
</script>
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
	};
	
	function lendexd(tableId){
		var len = $("#"+tableId+" tr").length;
			for(var i=0;i<len;i++){
				$("#"+tableId+" tr:eq("+i+") td:first").text(i+1);
			} 
	}
	
	function popWorkDiv(showId,backId){
			$("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			//$('.chosen-container').css("width","230px");
		}
	function popRoleDiv(showId,backId){
			popWorkDiv(showId,backId);
			getRole();
		}
		
	function popJobDiv(showId,backId){
			popWorkDiv(showId,backId);
			getJob();
		}
		
	function popESCDiv(showId,backId){
			popWorkDiv(showId,backId);
			getESC();
		}

	function popECCDiv(showId,backId){
			popWorkDiv(showId,backId);
			getECC();
		}
	function popDeptDiv(showId,backId){
		popWorkDiv(showId,backId);
		getDept("formId5");
	}

	function hideDiv(showId,backId){
		$("#searchECName").val("");
		$("#searchECCode").val("");
		$("#searchESName").val("");
		$("#searchESCode").val("");
		$("#searchRoleName").val("");
		$("#searchJobName").val("");
		$("#job_list_cb").attr("checked",false);
		$("#role_list_cb").attr("checked",false);
		$("#"+showId+",#"+backId).hide();
		}
		
var paginationImpl = {};
function getECC(paginationImpl){
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_getECC.ms",
			    data: "",
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							$("#eccTbody").empty();
							for(var i = 0;i < rccList.length; i++){
								$("#eccTbody").append("<tr id='"+rccList[i].CODE+"' onclick=\"ECCRow('"+rccList[i].CODE+"');\" ondblclick=\"addECCList('addEmpCustCode','backShadow')\"></tr>");
								$("#eccTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#eccTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='cb_"+rccList[i].CODE+"' name='"+rccList[i].NAME+"' value='"+rccList[i].CODE+"'/></td>");
								$("#eccTbody tr:last").append("<td style='width: 145px;text-align: left;'>"+rccList[i].CODE+"</td>");
								$("#eccTbody tr:last").append("<td style='width: 145px;text-align: left;'>"+rccList[i].NAME+"</td>");
								if (rccList[i].ABBREVIATION == null) {
									rccList[i].ABBREVIATION = "";
								}
								$("#eccTbody tr:last").append("<td style='width: 165px;text-align: center;'>"+rccList[i].ABBREVIATION+"</td>");
								if (rccList[i].GRADE == null) {
									rccList[i].GRADE = "";
								}
								$("#eccTbody tr:last").append("<td style='width: 125px;text-align: center;'>"+rccList[i].GRADE+"</td>");
								/* $("#escTbody tr:last").append("<td>"+rscList[i].+"</td>"); */
								if (rccList[i].ENABLE == "Y") {
									rccList[i].ENABLE = "<dict:lang value="启动" />";
								}else{
									rccList[i].ENABLE = "<dict:lang value="禁用" />";
								}
								$("#eccTbody tr:last").append("<td style='text-align: center;'>"+rccList[i].ENABLE+"</td>");
							}
							init();
							pageFun(data.ajaxPage,"formId1");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});

	}

function searchECC(paginationImpl){
		var ECCName = $("#searchECName").val();
		var ECCCode = $("#searchECCode").val();
		util.showLoading("处理中...");
		$("#eccTbody").empty();
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_searchECC.ms",
			    data: "paraMap.ECCName="+ECCName+"&paraMap.ECCCode="+ECCCode+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				util.closeLoading();
						if(null == data){
						return ;}
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							$("#eccTbody").empty();
							for(var i = 0;i < rccList.length; i++){
								$("#eccTbody").append("<tr id='"+rccList[i].CODE+"' onclick=\"ECCRow('"+rccList[i].CODE+"');\" ondblclick=\"addECCList('addEmpCustCode','backShadow')\"></tr>");
								$("#eccTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#eccTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='cb_"+rccList[i].CODE+"' name='"+rccList[i].NAME+"' value='"+rccList[i].CODE+"'/></td>");
								$("#eccTbody tr:last").append("<td style='width: 145px;width: 145px;text-align: left;'>"+rccList[i].CODE+"</td>");
								$("#eccTbody tr:last").append("<td style='width: 145px;text-align: left;'>"+rccList[i].NAME+"</td>");
								if (rccList[i].ABBREVIATION == null) {
									rccList[i].ABBREVIATION = "";
								}
								$("#eccTbody tr:last").append("<td style='width: 165px;text-align: left;'>"+rccList[i].ABBREVIATION+"</td>");
								if (rccList[i].GRADE == null) {
									rccList[i].GRADE = "";
								}
								$("#eccTbody tr:last").append("<td style='width: 125px;text-align: center;'>"+rccList[i].GRADE+"</td>");
								/* $("#escTbody tr:last").append("<td>"+rscList[i].+"</td>"); */
								if (rccList[i].ENABLE == "1") {
									rccList[i].ENABLE = "<dict:lang value="启动" />";
								}else{
									rccList[i].ENABLE = "<dict:lang value="禁用" />";
								}
								$("#eccTbody tr:last").append("<td style='text-align: center;'>"+rccList[i].ENABLE+"</td>");
							}
							init();
							pageFun(data.ajaxPage,"formId1");
						}
				},
				 	error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}	
	
	function ECCRow(code){
		$("#eccTbody input[type='checkbox']").attr("checked",false);
		$("#cb_"+code).attr("checked",true);
		$("#eccTbody input[type='checkbox']").each(function(){
			if (!$(this).attr("checked")) {
				$(this).parents("tr").css("background-color","");
			}
		});
		$("#"+code).css("background-color","#d3eafc");
	}
	
	function addECCList(showId,backId){
		$("#eccTbody input[type='checkbox']").each(function(){
			if ($(this).attr("checked")) {
				$("#empCustCode").val($(this).attr("name"));
				$("#userDto_empCustCode").val($(this).attr("value"));
			}
		});
		hideDiv(showId,backId);
	}

function getESC(paginationImpl){
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_getESC.ms",
			    data: "",
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var rscList = eval(data.ajaxPage.dataList);
							$("#escTbody").empty();
							for(var i = 0;i < rscList.length; i++){
								$("#escTbody").append("<tr id='"+rscList[i].CODE+"' onclick=\"ESCRow('"+rscList[i].CODE+"');\" ondblclick=\"addESCList('addEmpSupCode','backShadow')\"></tr>");
								$("#escTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#escTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='cb_"+rscList[i].CODE+"' name='"+rscList[i].NAME+"' value='"+rscList[i].CODE+"'/></td>");
								$("#escTbody tr:last").append("<td style='width: 180px;text-align: left;'>"+rscList[i].CODE+"</td>");
								$("#escTbody tr:last").append("<td style='width: 180px;text-align: left;'>"+rscList[i].NAME+"</td>");
								if (rscList[i].SHORTNAME == null) {
									rscList[i].SHORTNAME = "";
								}
								$("#escTbody tr:last").append("<td style='text-align: left;'>"+rscList[i].SHORTNAME+"</td>");
							}
							init();
							pageFun(data.ajaxPage,"formId2");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});

	}

function searchESC(paginationImpl){
			var ESCName = $("#searchESName").val();
			var ESCCode = $("#searchESCode").val();
			util.showLoading("处理中...");
			$("#escTbody").empty();
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_searchESC.ms",
			    data: "paraMap.ESCName="+ESCName+"&paraMap.ESCCode="+ESCCode+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				util.closeLoading();
						if(null == data){
						return ;}
						if(null != data.ajaxPage.dataList){
							var rscList = eval(data.ajaxPage.dataList);
							$("#escTbody").empty();
							for(var i = 0;i < rscList.length; i++){
								$("#escTbody").append("<tr id='"+rscList[i].CODE+"' onclick=\"ESCRow('"+rscList[i].CODE+"');\" ondblclick=\"addESCList('addEmpSupCode','backShadow')\"></tr>");
								$("#escTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#escTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='cb_"+rscList[i].CODE+"' name='"+rscList[i].NAME+"' value='"+rscList[i].CODE+"'/></td>");
								$("#escTbody tr:last").append("<td style='width: 180px;text-align: left;'>"+rscList[i].CODE+"</td>");
								$("#escTbody tr:last").append("<td style='width: 180px;text-align: left;'>"+rscList[i].NAME+"</td>");
								if (rscList[i].SHORTNAME == null) {
									rscList[i].SHORTNAME = "";
								}
								$("#escTbody tr:last").append("<td style='text-align: left;'>"+rscList[i].SHORTNAME+"</td>");
							}
							init();
							pageFun(data.ajaxPage,"formId2");
						}
				},
				 	error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}	
	
	function ESCRow(code){
		$("#escTbody input[type='checkbox']").attr("checked",false);
		$("#cb_"+code).attr("checked",true);
		$("#escTbody input[type='checkbox']").each(function(){
			if (!$(this).attr("checked")) {
					$(this).parents("tr").css("background-color","");
			}
		});
		$("#"+code).css("background-color","#d3eafc");
	}
	
	function addESCList(showId,backId){
		$("#escTbody input[type='checkbox']").each(function(){
			if ($(this).attr("checked")) {
				$("#empSupCode").val($(this).attr("name"));
				$("#userDto_empSupCode").val($(this).attr("value"));
			}
		});
		hideDiv(showId,backId);
	}
	

function getRole(paginationImpl){
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_getRole.ms",
			    data: "",
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var roleList = eval(data.ajaxPage.dataList);
							$("#roleTbody").empty();
							for(var i = 0;i < roleList.length; i++){
							if(roleList[i].REMARK==null){
								roleList[i].REMARK="";
							}
								$("#roleTbody").append("<tr id='"+roleList[i].ID+"'></tr>");
								$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+roleList[i].ID+"' name='"+roleList[i].NAME+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 80px;text-align: center;'>"+roleList[i].NAME+"<input type='hidden' id='remark_"+roleList[i].ID+"' value='"+roleList[i].REMARK+"' /></td>");
								$("#roleTbody tr:last").append("<td style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'ondblclick=\"remark(this);\"title='"+roleList[i].REMARK+"'>"+roleList[i].REMARK+"</td>");
							}
							init();
							checkboxAll("roleTbody");
							pageFun(data.ajaxPage,"formId3");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});

	}

function getJob(paginationImpl){
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_getJob.ms",
			    data: "",
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var jobList = eval(data.ajaxPage.dataList);
							$("#jobTbody").empty();
							for(var i = 0;i < jobList.length; i++){
							if(jobList[i].REMARK==null){
								jobList[i].REMARK="";
							}
								$("#jobTbody").append("<tr id='"+jobList[i].ID+"'></tr>");
								$("#jobTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+jobList[i].ID+"' name='"+jobList[i].JOBNAME+"' /></td>");
								$("#jobTbody tr:last").append("<td style='width: 120px;text-align: center;'>"+jobList[i].JOBNAME+"<input type='hidden' id='remark_"+jobList[i].ID+"' value='"+jobList[i].REMARK+"'/></td>");
								$("#jobTbody tr:last").append("<td style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;' ondblclick=\"remark(this);\"title='"+jobList[i].REMARK+"'>"+jobList[i].REMARK+"</td>");
							}
							init();
							checkboxAll("jobTbody");
							pageFun(data.ajaxPage,"formId4");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});

	}


function searchRole(paginationImpl){
		var roleName = $("#searchRoleName").val();
		util.showLoading("处理中...");
		$("#roleTbody").empty();
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_searchRole.ms",
			    data: "paraMap.roleName="+roleName+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				util.closeLoading();
						if(null == data){
						return ;}
						if(null != data.ajaxPage.dataList){
							var roleList = eval(data.ajaxPage.dataList);
							$("#roleTbody").empty();
							for(var i = 0;i < roleList.length; i++){
							if(roleList[i].REMARK==null){
								roleList[i].REMARK="";
							}
								$("#roleTbody").append("<tr id='"+roleList[i].ID+"'></tr>");
								$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+roleList[i].ID+"' name='"+roleList[i].NAME+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 80px;text-align: center;'>"+roleList[i].NAME+"<input type='hidden' id='remark_"+roleList[i].ID+"' value='"+roleList[i].REMARK+"'/> </td>");
								$("#roleTbody tr:last").append("<td style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+roleList[i].REMARK+"'>"+roleList[i].REMARK+"</td>");
							}
							init();
							checkboxAll("roleTbody");
							pageFun(data.ajaxPage,"formId3");
						}
				},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
						
				});

	}	
function searchJob(paginationImpl){
			var jobName = $("#searchJobName").val();
			util.showLoading("处理中...");
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			$("#jobTbody").empty();
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_searchJob.ms",
			    data: "paraMap.jobName="+jobName+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				util.closeLoading();
						if(null == data){
						return ;}
						if(null != data.ajaxPage.dataList){
							var jobList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < jobList.length; i++){
							if(jobList[i].REMARK==null){
								jobList[i].REMARK="";
							}
								$("#jobTbody").append("<tr id='"+jobList[i].ID+"'></tr>");
								$("#jobTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+jobList[i].ID+"' name='"+jobList[i].JOBNAME+"' /></td>");
								$("#jobTbody tr:last").append("<td style='width: 120px;text-align: left;'>"+jobList[i].JOBNAME+"<input type='hidden' id='remark_"+jobList[i].ID+"' value='"+jobList[i].REMARK+"'/> </td>");
								$("#jobTbody tr:last").append("<td style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+jobList[i].REMARK+"'>"+jobList[i].REMARK+"</td>");
							}
							init();
							checkboxAll("jobTbody");
							pageFun(data.ajaxPage,"formId4");
						}
				},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }	
				});
	}	

	 function addRoleList(showId,backId){
			 $("#roleTbody :checkbox").each(function(){
					if($(this).attr("checked")){
						if (!$("#trr"+$(this).attr("id")).length) {
							$("#up_form").append("<input type='hidden' name='userDto.roleId' id='itrr"+$(this).attr("id")+"' value='"+$(this).attr("id")+"'/>");
							$("#roletbodyList").append("<tr id='trr"+$(this).attr("id")+"' name='trname'></tr>");
							$("#roletbodyList tr:last").append("<td style='width: 30px;text-align: center;box-sizing:border-box;'></td>");
							$("#roletbodyList tr:last").append("<td style='width: 30px;text-align: center;box-sizing:border-box;'><input type='checkbox' style='margin:0'/></td>");
							$("#roletbodyList tr:last").append("<td style='width: 80px;text-align: left;box-sizing:border-box;'>"+$(this).attr("name")+"</td>");
							$("#roletbodyList tr:last").append("<td style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'ondblclick=\"remark(this);\"title='"+$("#remark_"+$(this).attr("id")).val()+"'>"+$("#remark_"+$(this).attr("id")).val()+"</td>");
						}
					}
				});
				init();
				checkboxAll("roletbodyList");
				lendexd("roleTable");
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#role_list_cb").attr("checked",false);
			
		} 
	
		var TrRoleId = "";
		function getTrRoleId(trId){
			$("#roleTable").find("tr").each(function(){
				$(this).removeClass("selected");
			});
			if ($("#trr"+trId+" :checkbox").attr("checked")) {
				$("#trr"+trId+" :checkbox").attr("checked",false);
				$("#trr"+trId).css("background-color","");
			}else{
				$("#roleTable input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).attr("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				}); 
			$("#trr"+trId+" input[type='checkbox']").attr("checked",true); 
			//$("#trr"+trId).addClass("selected");
			$("#trr"+trId).css("background-color","#d3eafc");
			checkboxAll("roleTable");
			TrRoleId = trId;
			//init();
				}
		}	
		
		$("#roleTable tr").on("click",function(e){
		var trId = $(this).attr("id");
		if ($("#"+trId+" :checkbox").attr("checked")) {
			$("#"+trId+" :checkbox").attr("checked",false);
			$("#"+trId).css("background-color","");
		}else{
			$("#roleTable input[type='checkbox']").each(function(){
				if ($(this).attr("checked")) {
					$(this).attr("checked",false);
					$(this).parents("tr").css("background-color","");
				}
			});
			$("#"+trId+" :checkbox").attr("checked",true);
			$("#"+trId).css("background-color","#d3eafc");
		}
	});
	
	  $("#roleTable tr input[type=checkbox]").click(function(e) {
		  e.stopPropagation();
		  var style = $(this).parents("tr").attr("style");
		  if(style && style.indexOf("background-color") > -1){
			  $(this).parents("tr").css("background-color","");
		  }else{
			  $(this).parents("tr").css("background-color","#d3eafc");
		  }
	  });
		
	$("#jobTable tr").on("click",function(e){
		var trId = $(this).attr("id");
		if ($("#"+trId+" :checkbox").attr("checked")) {
			$("#"+trId+" :checkbox").attr("checked",false);
			$("#"+trId).css("background-color","");
		}else{
			$("#jobTable input[type='checkbox']").each(function(){
				if ($(this).attr("checked")) {
					$(this).attr("checked",false);
					$(this).parents("tr").css("background-color","");
				}
			});
			$("#"+trId+" :checkbox").attr("checked",true);
			$("#"+trId).css("background-color","#d3eafc");
		}
	});
	
	  $("#jobTable tr input[type=checkbox]").click(function(e) {
		  e.stopPropagation();
		  var style = $(this).parents("tr").attr("style");
		  if(style && style.indexOf("background-color") > -1){
			  $(this).parents("tr").css("background-color","");
		  }else{
			  $(this).parents("tr").css("background-color","#d3eafc");
		  }
	  });
		
		//点击行寄选中该行
		function checkboxAll(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").attr("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).attr("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").attr("checked",true);
				$("#"+trId).css("background-color","#d3eafc");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#d3eafc");
			  }
		  });
		}
		
		function delRoleRow(){
			$("#roletbodyList :checkbox").each(function(){
				if($(this).attr("checked")){
					var trid = $(this).parent().parent().attr("id");
					$("#i"+trid).remove();
					$("#"+trid).remove();
					//TrRoleId = "";
				}
			});
			lendexd("roleTable");
			var len = $("#roleTable tr").length;
			for(var i=0;i<len;i++){
				$("#roleTable tr:eq("+i+") td:first").text(i+1);
			} 
		}
	

	 function addJobList(showId,backId){
			 $("#jobTbody :checkbox").each(function(){
					if($(this).attr("checked")){
						if (!$("#trj"+$(this).attr("id")).length) {
							$("#up_form").append("<input type='hidden' name='userDto.jobId' id='itrj"+$(this).attr("id")+"' value='"+$(this).attr("id")+"'/>");
							$("#jobtbodyList").append("<tr id='trj"+$(this).attr("id")+"' name='trname' onclick=\"getTrJobId('"+$(this).attr("id")+"')\"></tr>");
							$("#jobtbodyList tr:last").append("<td style='width: 30px;text-align: center;box-sizing:border-box;'></td>");
							$("#jobtbodyList tr:last").append("<td style='width: 30px;text-align: center;box-sizing:border-box;'><input type='checkbox' style='margin:0;'/></td>");
							$("#jobtbodyList tr:last").append("<td style='width: 120px;text-align: left;box-sizing:border-box;'>"+$(this).attr("name")+"</td>");
							$("#jobtbodyList tr:last").append("<td style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'ondblclick=\"remark(this);\"title='"+$("#remark_"+$(this).attr("id")).val()+"'>"+$("#remark_"+$(this).attr("id")).val()+"</td>");
						}
					}
				});
				init();
				checkboxAll("jobtbodyList");
				lendexd("jobTable");
			//$("#jobTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#job_list_cb").attr("checked",false);
			
		} 
	 
	 function getDept(paginationImpl){
			util.showLoading("处理中...");
			var deptName = $("#searchDeptName").val();
			var currentPage = _GLO_FORM_PAGE_MAP[paginationImpl].currentPage || 1;
			var pageRecord =  _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord || 20;
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/DeptAction_getDept.ms",
			    data: "paraMap.deptName="+deptName+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
				success: function(data){
					    console.log("[dept_data]==="+data);
						util.closeLoading();
						if(null == data){return ;}
						$("#deptTbody").empty();
						if(null != data.ajaxPage.dataList){
							var deptList = eval(data.ajaxPage.dataList);
							
							for(var i = 0;i < deptList.length; i++){
							
								$("#deptTbody").append("<tr id='"+deptList[i].ID+"'></tr>");
								$("#deptTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#deptTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+deptList[i].ID+"' name='"+deptList[i].NAME+"' /></td>");
								$("#deptTbody tr:last").append("<td style='text-align: center;'>"+deptList[i].NAME+"<input type='hidden' id='remark_"+deptList[i].ID+"' value='"+deptList[i].REMARK+"' /></td>");
							}
							init();
							checkboxAll("deptTbody");
							pageFun(data.ajaxPage,"formId5");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
						
				  }
				});

		}

		function addDeptList(showId,backId){
			 $("#deptTbody :checkbox").each(function(){
					if($(this).attr("checked")){
						if (!$("#trs"+$(this).attr("id")).length) {
							$("#up_form").append("<input type='hidden' name='userDto.deptIdList' id='itrs"+$(this).attr("id")+"' value='"+$(this).attr("id")+"'/>");
							$("#addDeptList").append("<tr id='trs"+$(this).attr("id")+"' name='trname' onclick=\"getTrRoleId('"+$(this).attr("id")+"')\"></tr>");
							$("#addDeptList tr:last").append("<td style='width: 30px;text-align: center;box-sizing: border-box;'></td>");
							$("#addDeptList tr:last").append("<td style='width: 30px;text-align: center;box-sizing: border-box;'><input type='checkbox' style='margin:0;'/></td>");
							$("#addDeptList tr:last").append("<td style='text-align: left;box-sizing: border-box;'>"+$(this).attr("name")+"</td>");
							//$("#addDeptList tr:last").append("<td style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+$("#remark_"+$(this).attr("id")).val()+"'>"+$("#remark_"+$(this).attr("id")).val()+"</td>");
						}
					}
				});
				init();
				$("#deptTable tr input[type=checkbox]").click(function(e) {
					  e.stopPropagation();
					  var style = $(this).parents("tr").attr("style");
					  if(style && style.indexOf("background-color") > -1){
						  $(this).parents("tr").css("background-color","");
					  }else{
						  $(this).parents("tr").css("background-color","#d3eafc");
					  }
				  });
			var len = $("#addDeptList tr").length;
			for(var i=0;i<len;i++){
				$("#addDeptList tr:eq("+i+") td:first").text(i+1);
			} 
			$("#deptTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#dept_list_cb").attr("checked",false);
		}
	
		var TrJobId = "";
		function getTrJobId(trId){
			$("#jobTable").find("tr").each(function(){
				$(this).removeClass("selected");
			});
			$("#trj"+trId).addClass("selected");
			TrJobId = trId;
			init();
		}
		
		function  delJobRow(){
			//if (TrJobId!="") {
				$("#jobtbodyList :checkbox").each(function(){
				if($(this).attr("checked")){
					var trid = $(this).parent().parent().attr("id");
					$("#i"+trid).remove();
					$("#"+trid).remove();
					//TrRoleId = "";
				}
			});
			/* 	TrJobId = "";
			}else{
				utilsFp.alert("<dict:lang value='请选择要删除的角色' />");
			} */
			lendexd("jobTable");
		}	
		
		function delDeptRow(){
			
			$("#addDeptList :checkbox").each(function(){
				if($(this).attr("checked")){
					var trid = $(this).parent().parent().attr("id");
					$("#i"+trid).remove();
					$("#"+trid).remove();
					//TrRoleId = "";
				}
			});
		$("#dept_list_cb_s").attr("checked",false);
			var len = $("#addDeptList tr").length;
			for(var i=0;i<len;i++){
				$("#addDeptList tr:eq("+i+") td:first").text(i+1);
			} 
		}
		
	function edit(thisObj){
		if(!valData()){
			return ;
		}
		//$("#photo").parent().show();
		var len = document.getElementById("photo").value.length;
		if (len!=0) {
			if (($.trim(document.getElementById("photo").value.substring(len-3,len))).toLocaleLowerCase()=="jpg"
					||($.trim(document.getElementById("photo").value.substring(len-3,len))).toLocaleLowerCase()=="png"
					||($.trim(document.getElementById("photo").value.substring(len-3,len))).toLocaleLowerCase()=="bmp"
					||($.trim(document.getElementById("photo").value.substring(len-3,len))).toLocaleLowerCase()=="gif") {
			//$("#photo").parent().hide();
			userSubmit();
		//	thisObj.onclick = function(){utilsFp.confirmIcon(1,"","","","<dict:lang value="数据正在提交，请稍候..." />",0,"300","");};
		}else{
			//$("#photo").parent().hide();
			//userSubmit();
			document.getElementById("userDto_photo_err").innerHTML = "<dict:lang value='图片格式不支持，请重新选择！(.jpg,.png,.bmp,.gif)' />";
		}
		}else{
			//$("#photo").parent().hide();
			userSubmit();
		//	thisObj.onclick = function(){utilsFp.alert("<dict:lang value='数据正在提交，请稍候...' />");};
		}
	}
      
    
	function userSubmit(){
	var langs = _mcBase64JsToJava.getMcDealBase64Encode($("#userDto_loginName").val());
		$.ajax({
			type: "POST",
		    dataType: "json",
		    url: "${path}sys/UserAction_loginNameVal.ms",
		    data: {
		    	"paraMap.loginName" : langs,
		    	"paraMap.userId" : $("#userId").val()
		    },
			success: function(data){
					if(null == data){
					return ;}
					if(data.ajaxMap != null && data.ajaxMap.msg !=null){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+data.ajaxMap.msg,0,"300","");
							return ;
						}
					if(null != data.ajaxList){
						if (data.ajaxList.length>0) {
							var loginName = document.getElementById("userDto_loginName");
							_alertValMsg(loginName,"<dict:lang value="员工编号已存在" />");
			    			//roleDtoName.focus();
			    			return false;
					}else{
						document.forms.up_form.submit();
					}
						}
						
			},
				error: function(msg){
					util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			  }	
			});
	}
        function alertInfo(msg){
		utilsFp.confirmIcon(3,"","","", msg,0,"300","");
	}
    function valData(){
    	var userDtoName = document.getElementById("userDto_name");
    	if(val.isBlank(userDtoName)){
   			_alertValMsg(userDtoName,"<dict:lang value="员工名称不能为空" />");
    		userDtoName.focus();
    		return false;
    	}
    	var userDtoLoginName = document.getElementById("userDto_loginName");
    	if(val.isBlank(userDtoLoginName)){
   			_alertValMsg(userDtoLoginName,"<dict:lang value="登录名称不能为空" />");
    		userDtoLoginName.focus();
    		return false;
    	}
    	
    	var data_auth = document.getElementById("data_auth");
  	if(val.isBlank(data_auth)){
 			_alertValMsg(data_auth,"<dict:lang value="组织机构不能为空" />");
  		data_auth.focus();
  		return false;
  	}
  	
    	var userDtoDeptId = document.getElementById("userDto_deptId");
    	if(val.isBlank(userDtoDeptId)){
   			_alertValMsg(userDtoDeptId,"<dict:lang value="所属部门不能为空" />");
    		userDtoDeptId.focus();
    		return false;
    	}
    	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		var reg = /^[1][3578]\d{9}$/;
		var m = /^((0\d{2,3}-))(\d{7,8})(-(\d{3,}))?$/;
		var userPhone = document.getElementById("userPhone");
		var phone = $("#userPhone").val();
		if (!val.isBlank(userPhone) && phone.length>17) {
   			_alertValMsg(userPhone,"<dict:lang value="电话长度不能大于17位" />");
    		userPhone.focus();
    		return false;
		}else if (!val.isBlank(userPhone) && phone.length<8) {
   			_alertValMsg(userPhone,"<dict:lang value="电话长度不能小于8位" />");
    		userPhone.focus();
    		return false;
		} else if (!val.isBlank(userPhone) && !m.test(phone)) {
   			_alertValMsg(userPhone,"<dict:lang value='请输入正确格式的电话号码，如：0591-83838383(-123)'/>");
    		userPhone.focus();
    		return false;
		}  
    	var userMobile = document.getElementById("userMobile");
		var mobel = $("#userMobile").val();
		if (!val.isBlank(userMobile) && mobel.length!=11 && (!reg.test(mobel))) {
   			_alertValMsg(userMobile,"<dict:lang value="请输入正确11位有效的电话号码" />");
    		userMobile.focus();
    		return false;
		}else{
    		document.getElementById("userDto_mobile_err").innerHTML = "";
    	}
    	var userEmail = document.getElementById("userEmail");
		if (!val.isBlank(userEmail) && !myreg.test($("#userEmail").val())) {
   			_alertValMsg(userEmail,"<dict:lang value="请输入正确的邮箱格式，如1234@163.com" />");
    		userEmail.focus();
    		return false;
		}
		var usTimeZone = document.getElementById("usTimeZone");
	  	if(val.isBlank(usTimeZone)){
	 			_alertValMsg(usTimeZone,"<dict:lang value="所在时区不能为空" />");
	 			usTimeZone.focus();
	  		return false;
	  	}
	  	
	  	var deptIdList=$('input[name="userDto.deptIdList"]').val();
		if (deptIdList==null || deptIdList=='' || typeof(deptIdList) == "undefined") { 
   			_alertValMsg(document.getElementById("addDeptList"),"<dict:lang value="请配置组织机构权限" />");
	 		document.getElementById("addDeptList").focus();
	  		return false;
		} 
		
    	return true;
    }
    
   	function init(){
		$(".dlist-table").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			//_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
		
	}
	var userDeptPositionTable;
	function deptPositionSet(){
	    var piframeId = window.frameElement.id;
	    var url="${path}sys/PostMgrAction_deptPosition.ms?paraMap.piframeId="+piframeId;
        showPopWinFp(url, 550, 350,null,'<dict:lang value="设置岗位" />','deptPosition');
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
				  var arrHtml = [];
				  for(var i=0;i<data.ajaxList.length;i++)
				  {
				   deptPositionName+=data.ajaxList[i].DEPT_NAME;
				   deptPositionName+='/'+data.ajaxList[i].POSITION_NAME;
				   deptPositionName+='/'+data.ajaxList[i].POSITION_TYPE_NAME;
				   if(i!=data.ajaxList.length-1){deptPositionName+='\n';}
				   userDeptPositionTable+=("<tr id='"+data.ajaxList[i].ID+"' >");								
		userDeptPositionTable+=("<td style='width:30px;text-align:center;'>"+(i+1)+"</td>");
		userDeptPositionTable+=("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='postId' value='"+data.ajaxList[i].DEPT_POSITION_ID+"'/></td>");
		userDeptPositionTable+=("<td style='display:none;' >"+data.ajaxList[i].DEPT_ID+"</td>");
		userDeptPositionTable+=("<td style='text-align:center;' title=\""+data.ajaxList[i].DEPT_NAME+"\">"+data.ajaxList[i].DEPT_NAME+"</td>");
		userDeptPositionTable+=("<td style='width:120px;text-align:center;' title=\""+data.ajaxList[i].POSITION_NAME+"\">"+data.ajaxList[i].POSITION_NAME+"</td>");
		userDeptPositionTable+=("<td style='width:100px;text-align:center;' title=\""+data.ajaxList[i].POSITION_TYPE_NAME+"\">"+data.ajaxList[i].POSITION_TYPE_NAME+"</td></tr>");
				  }
				 $("#deptPosition").html(deptPositionName);
				 
				}

			},
			error: function(msg){
				
			}
		});
	}
	 
	
    $(function(){
    	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
		var usTz=$("#usTz").val();
	  	$("#usTimeZone").val(usTz);
	  	$("#usTimeZone").trigger('chosen:updated');
	  	$('.timeClass .chosen-single span').mouseover(function(){
	  		$(this).attr('title',$(this).text())
	  	})
  	utChange();
  	queryDeptPosition();
    });
    
    $(function(){
  	listdeptAx();
  	
  });
    
    function listdeptAx(page){
    	var data_auth='${paraMap.data_auth}';
		var url = "${path}/sys/UserAction_listSysdeptAx.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {},
			success: function(data){
				var operHtml='<option value="">--请选择--</option>';
				if(null !=data.ajaxMap && null !=data.ajaxMap.deptlist){
					jQuery.each(data.ajaxMap.deptlist, function(i, deptDto) {
						if(data_auth==deptDto.ID){
							operHtml += '<option value="'+deptDto.ID+'" selected="selected">'+deptDto.NAME+'</option>';
						}else{
							operHtml += '<option value="'+deptDto.ID+'">'+deptDto.NAME+'</option>';
						}
						
					});
				}
				$("#data_auth").html(operHtml);
				$('.dept_select').trigger('chosen:updated'); 
				
				data_auth_change(data_auth); 

			},
			error: function(msg){
				
			}
		});
	}
	
	function data_auth_change(dataauth){
		var url = "${path}/sys/UserAction_listHasSysdeptAx.ms";
		var deptId='${userDto.deptId}';
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.dataauth":dataauth},
			success: function(data){
				var operHtml='<option value="">--请选择--</option>';
				if(null !=data.ajaxMap && null !=data.ajaxMap.deptlist){
					jQuery.each(data.ajaxMap.deptlist, function(i, deptDto) {
						if(deptId==deptDto.ID){
							operHtml += '<option value="'+deptDto.ID+'" selected="selected">'+deptDto.NAME+'</option>';
						}else{
							operHtml += '<option value="'+deptDto.ID+'">'+deptDto.NAME+'</option>';
						}
					});
				}
				$("#userDto_deptId").html(operHtml);
				$('.dept_select').trigger('chosen:updated');  

			},
			error: function(msg){
				
			}
		});
		
	}

</script>

<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1');
    setPopScroll('.scroll2');
    setPopScroll('.scroll3');
    setPopScroll('.scroll4');
    setPopScroll('.scroll5');  
    setPopScroll('.scroll6');
    setPopScroll('.scroll7');
  })
})(jQuery)</script>

<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>