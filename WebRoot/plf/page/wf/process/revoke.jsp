<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->

	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
               
			    <div class="optn">
			        <button type="button" onclick="revoke(this,'<c:out value="${formId}" />');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
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
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
	function revoke()
	{
	  if(!valData()){
         return ;
      }
      if(!val.valNullData()){
		 return ;
	  }
	  var procId='<c:out value="${param.procId}" />';
	  var reason=$("#reason").val();
	  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/ProcessAction_revokeSave.ms",
			    data: {
			    	'paraMap.procId' : procId,
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
				      else{				      
				      var piframeId='<c:out value="${param.piframeId}" />';
		              var parentWindows = $(window.parent.document).contents().find("#"+piframeId).contents().find("#ifr3")[0].contentWindow;
				      parentWindows.reloadPg(data.ajaxMap.alertMsg,  data.ajaxMap.title, data.ajaxMap.width, data.ajaxMap.height, data.ajaxMap.time);
        	         
				      }		     
				     
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

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
