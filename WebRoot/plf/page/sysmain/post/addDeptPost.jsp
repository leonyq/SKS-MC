<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="岗位关联" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
<body>
	<div style="background-color: white;margin-top: 37px;">
		<div class="hd">
			<div style="margin-left:10px;margin-top: -35px;">
				<div class="save-close" title="<dict:lang value='保存并关闭窗口' />" onclick="saveClose(this)"></div>
				<input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
				<%--<input type="checkbox" checked id="isCloseWin_s"/>
				<dict:lang value="保存并关闭窗口" />--%>
			</div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value='保存' /></button>
			        <button type="button" onclick="closeTopPopWinFp('addDeptPostpop');"><i class="ico ico-cancel"></i><dict:lang value='取消' /></button>
			    </div>
			</div>
			<div style="height: 180px;margin-top: -30px;">
	<form id="add_form" name="addForm" action="${path}sys/PostMgrAction_addPost.ms" method="post" target="submitFrame">
	<s:token />
		<input type="hidden" id="iframeId" name="iframeId"/>
		<input type="hidden" id="isCloseWin_s" name="paraMap.isCloseWin"/>
	<table class="basic-table" >
        
        <tr>
			<td style="width: 116px;text-align: right;"><span class="dot">*</span><dict:lang value="岗位" /></td>
			<td style="text-align:left;padding-left:5px;">
				<s:select list="#request.postList" headerKey="" headerValue='--%{getText("请选择")}--' 
					listKey="id" listValue="name"  id="position_id" name="paraMap.position_id" 
					cssStyle="width: 200px;" cssClass="dept_select" />
				<span class="Eng"><span id="postName_err"><c:out value='${errors["paraMap.postName"][0]}' /></span></span>
			</td>
       </tr>
       
       <tr>
        <td style="width: 116px;text-align: right;"><dict:lang value="类型" /></td>
       	<td style="text-align: left;padding-left:5px;height: 80px;">
       			<dict:selectDict  id="position_type" name="paraMap.position_type" dictCode="POSITION_TYPE" custom_option="<option value=''>--请选择--</option>"  style="cursor: pointer;width:200px;" cssClass="dept_select" />
       	</td>
       </tr>
     </table>
     </form>
   </div>
</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	   
	
	var parentWindows = $(window.parent.document).contents().find("#confPostFpId")[0].contentWindow;
		
	$(function(){
    	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
    	
    });

	function add(thisObj){
		if(!valData()){
			return ;
		}
		
		jQuery.ajax({
				type : "POST",
				dataType : "json",
				url :"sys/PostMgrAction_saveDeptPost.ms",
				data:{'position_id':$("#position_id").val(),'position_type':$("#position_type").val(),'dept_id':parentWindows.nodeId},
				success : function(data) {
				    if(data.ajaxMap != null)
				   {
				      if(data.ajaxMap.errmsg!=null)
				      {
				        //util.alert(data.ajaxMap.errmsg);
				         utilsFp.confirmIcon(1, "", "", "",data.ajaxMap.errmsg, 0, "260", "");
				        return false;
				      }
				       msgPop(data.ajaxMap.alertMsg, '', data.ajaxMap.title, data.ajaxMap.width, data.ajaxMap.height, data.ajaxMap.time);
				       parentWindows.searchDeptPost(parentWindows.nodeId);
				   }
				
					if($("#isCloseWin").attr('checked')){
	  	               closeTopPopWinFp(window.frameElement.id + "pop");
	                }			

				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					util.closeLoading();

				}
			});
        
	}
      
    function valData(){
    	var positionId = document.getElementById("position_id");
    	if(val.isBlank(positionId)){
   			_alertValMsg(positionId,"<dict:lang value="岗位名称不能为空" />");
    		positionId.focus();
    		return false;
    	}
    	var positionType = document.getElementById("position_type");
    	if(val.isBlank(positionType)){
   			_alertValMsg(positionType,"<dict:lang value="岗位名称不能为空" />");
    		positionType.focus();
    		return false;
    	}
    	
    	return true;
    }

</script>

</body>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<%@ include file="/plf/common/pub_end.jsp" %>