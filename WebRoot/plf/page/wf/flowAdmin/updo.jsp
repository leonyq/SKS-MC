<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="工作流新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	<!-- head里面 -->
	<style type="text/css">
	.theme-explorer-fa{
		padding: 10px;
	}
	.downFlowFile{
	   color: blue;
       cursor: pointer;
	}
	
	</style>
	
	<!-- 产品静态资源 -->
	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
                
			    <div class="optn">
			       <input type="hidden" id="procId" name="procId" value="<c:out value='${procId}' />" /> 
			       <input type="hidden" id="iframeId" name="iframeId" value="<c:out value='${iframeId}' />" /> 
			          <button type="button" onclick="undo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
				      <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			     </div>
			   
			</div>
		
			<div class="bd" style="height:240px">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		
	<table class="basic-table" >
	
		<tr>
                <td class="name"><span class="dot">*</span><span><dict:lang value="原因" /> <span></span></span></td>
                <td class="dec">	<textarea id="reason" name="reason" value="" maxlength="100" class="_VAL_NULL  isSubmit  " style="height:80px;width:350px;"  ></textarea>
                 </td>
        </tr>
		
	</table>
			<bu:jsVal formId="5c2f3b4ea8794c74bbb3f75f07ac8c1d" formIndex="1" />
				
			</div>
		 </form>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<script type="text/javascript">
	function undo(){
	    var reason = $("#reason").val();
	    var iframeId = $("#iframeId").val();
	    if(!val.valNullData()){
		  return ;
	    }
	    
	    var _body = window.parent;
        var _iframe1=_body.document.getElementById(iframeId);
		$.ajax({
			type: "POST",
		    dataType: "json",
		    url: "${path}comm/ProcessAction_revokeSave.ms",
		    data: {
		    	'paraMap.procId' : $("#procId").val(),
		    	'paraMap.reason' : reason
		    },
			success: function(data){
			   if(data.ajaxMap != null)
			   {
			      if(data.ajaxMap.errmsg!=null)
			      {
			        utilsFp.confirmIcon(1, "", "", "",data.ajaxMap.errmsg, 0, "300", "");
	                return false;
			      }
			      var parentWindows = $(window.parent.document).contents().find("#"+iframeId)[0].contentWindow;
				  parentWindows.reloadPg(data.ajaxMap.alertMsg,  data.ajaxMap.title, data.ajaxMap.width, data.ajaxMap.height, data.ajaxMap.time);
        	         
			   }
			},
			error: function(msg){
				if(msg.readyState!=0){
 					util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				}
			  }
		});
		
	}
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

 <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
