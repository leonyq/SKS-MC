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
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                
			    <div class="optn">
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style=" height: 280px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="42b9b2cc92644ef5816d1463256152ff" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="42b9b2cc92644ef5816d1463256152ff" />
	<input type="hidden" name="42b9b2cc92644ef5816d1463256152ff" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'9c46499ba24f416abe89239b1e2a4259'" />
		<s:set name="_$formId_1" value="'42b9b2cc92644ef5816d1463256152ff'" />
		<s:set name="_$type" value="'add'" />
		
		<tr>
			<td class="name" /><bu:uitn colNo="CPF_REPLY_CONTENT" formId="42b9b2cc92644ef5816d1463256152ff" /></td>
			<bu:td cssClass="dec" colNo="CPF_REPLY_CONTENT" formId="42b9b2cc92644ef5816d1463256152ff" style="height:190px;" ><bu:ui style="height:100%" colNo="CPF_REPLY_CONTENT" formId="42b9b2cc92644ef5816d1463256152ff" value="%{CPF_REPLY_CONTENT}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="42b9b2cc92644ef5816d1463256152ff" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<script>
	    var pronlemSn = '${param.pronlemSn}';
	    var beReplyEmp = '${param.beReplyEmp}';
	    var beReplyId = '${param.beReplyId}';
	    var parentWindow;
    	$(function(){
    	    parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
    	})
    	var isQuery = false;
    	function addCal(){
    	    if($("#paraMap1_CPF_REPLY_CONTENT").val()==""){
    	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="回复内容不能为空"/>",0,"300","");
    	        return ;
    	    }
    	    if(isQuery){
    	        utilsFp.confirmIcon(1,"","","", "<dict:lang value="数据正在提交，请稍候..."/>",0,"300","");
    	        
    	    }
    	    if(!val.valNullData()){alert(2);
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
                return ;
            }
            $.ajax({
                type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=4c7ed9ff98be45469f83e9e79043fbe9",
			    data: {
			        pronlemSn: pronlemSn,
			        beReplyEmp: beReplyEmp,
			        beReplyId: beReplyId,
			        repContent: $("#paraMap1_CPF_REPLY_CONTENT").val()
			    },
			    success: function(data){
			        if(null == data){return;}
					if(null != data){
    						if(data.ajaxMap.returnMsg=="addSucc"){
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    								parentWindow.loadDetailInfo("formId2");
    								closeWindow();
    								isQuery = true;
    						}
    						if(data.ajaxMap.returnMsg=="addError"){
	                                utilsFp.confirmIcon(3,"","","", "<dict:lang value="回复失败"/>",0,"300","");
    								return;
    						}
    				}
			    },
			    error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
            });
            
    	}
	</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
