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
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                
			    <div class="optn">
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="55eb4787d33d4dbbaa1708806ece31b5" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="55eb4787d33d4dbbaa1708806ece31b5" />
	<input type="hidden" id="prefixInd" name="55eb4787d33d4dbbaa1708806ece31b5" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'8caf15b429a14f5c91a8ff8848195bb2'" />
		<s:set name="_$formId_1" value="'55eb4787d33d4dbbaa1708806ece31b5'" />
		<s:set name="_$type" value="'add'" />
		<tr style="display:none;">
		    <td class="name-six" /><bu:uitn colNo="TWD_SCLH" formId="55eb4787d33d4dbbaa1708806ece31b5" /></td>
			<bu:td cssClass="dec-self" colNo="TWD_SCLH" formId="55eb4787d33d4dbbaa1708806ece31b5" ><bu:ui colNo="TWD_SCLH" formId="55eb4787d33d4dbbaa1708806ece31b5" value="%{TWD_SCLH}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><dict:lang value="产品合格证号" /></td>
			<bu:td cssClass="dec-self" colspan="3" colNo="TWD_NO" formId="55eb4787d33d4dbbaa1708806ece31b5" ><bu:ui style="width:100%" colNo="TWD_NO" formId="55eb4787d33d4dbbaa1708806ece31b5" value="%{TWD_NO}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><dict:lang value="产品SN" /></td>
			<bu:td cssClass="dec-self" colspan="3" colNo="TWD_NO" formId="55eb4787d33d4dbbaa1708806ece31b5" >
    			<div id="myDiv" style="height:130px;border:1px solid #ccc">	
                </div>
                <input type="hidden" id="proSn" name="proSn"/>
			</bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="55eb4787d33d4dbbaa1708806ece31b5" formIndex="1" />
				
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
<script>
    $(function(){
        $("#paraMap1_TWD_NO").attr("placeholder","输入产品合格证号回车");
        $("#paraMap1_TWD_NO").focus();
        $("#paraMap1_TWD_NO").keyup(function(event){
            if(event.keyCode ==13){	
                getProSnInfo();
            }
        }); 
    })
    //根据合格证号获取绑定的产品信息
    var tempCount = 0;
    function getProSnInfo(){
        var quNo = $.trim($("#paraMap1_TWD_NO").val());
            util.showLoading("处理中...");
    			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=b154c95cf91845f49264fe8eb321dc91";
    	       $.ajax({
    	           type:"post",
    	           dataType:"json",
    	           data: {
    	               "qualityNo" : quNo
    	           },
    	           url:loadItemUrl,
    	           success:function(data){		
                    	util.closeLoading();
                    	if(null==data){
                    	    return;
                    	}
                    	$("#myDiv").empty();
                    	var pList=data.ajaxList;
                    	for(var i=0;i<pList.length;i++){
                    	    //拼接html并展示
    			 			tempCount++;
    			 			var tempHtml = "<div id='"+tempCount+"' style='float: left;margin-left: 6px;'><span id='sp_"+tempCount+"' name='wspsn'>"+pList[i].WSP_SN+"</span><a href='javascript:void(0);' onclick='delTest("+tempCount+");'><img class='imgClass' alt='删除' src='plf/js/jsPlumb/images/close2.png'></a></div>";
    			        	$("#myDiv").append(tempHtml);
                    	}
    	           },
    	           error:function(msg){
    	                if(msg.readyState!=0){
        	               util.closeLoading();
        	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
    	                }
    	           }
    	       });
    }
function delTest(count){
    $("#"+count).html("");
}
//保存
function addCal(){
    var sns = "";
    $("span[name='wspsn']").each(function(i){
        if(sns==""){
            sns = $(this).html();
        }else{
            sns = sns + "," + $(this).html();
        }
    });
    util.showLoading("处理中...");
    			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=22a4d1140667403e9e9d29ac10702be2";
    			var quNo = $.trim($("#paraMap1_TWD_NO").val());
    	       $.ajax({
    	           type:"post",
    	           dataType:"json",
    	           data: {
    	               "sns" : sns,
    	               "quNo" : quNo
    	           },
    	           url:loadItemUrl,
    	           success:function(data){		
                    	util.closeLoading();
                    	msgPop("保存成功","","摩尔提示",200,150,3000);
                    	closeWindow();
    	           },
    	           error:function(msg){
    	                if(msg.readyState!=0){
        	               util.closeLoading();
        	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
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
