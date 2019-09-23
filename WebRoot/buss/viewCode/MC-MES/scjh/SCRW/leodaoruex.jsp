<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_19" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <title><dict:lang value="导入关联表" />
    </title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="serializeForm" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    			<!-- head里面 -->
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_19" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
  <!-- 产品静态资源 -->
<style>
      
#divExcelExport .pic {
    width: 220px;
    height: 100px;
    background-image: url(/mc/plf/page/fp/img/leading-in.png);
    margin-left: 240px;
    margin-top: 30px;
    margin-bottom: 5px;
}      
</style>
</head>
<body>
 
          
 <div class="bd">           
 
              <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_19" />
     				   <jsp:param name="location" value="saveForm" />
  				</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="04fdea69454640d1828d5b903153d18e" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="04fdea69454640d1828d5b903153d18e" />
	<input type="hidden" id="prefixInd" name="04fdea69454640d1828d5b903153d18e" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'2ecf0f22ccd14df291ec2ec429bdd052'" />
		<s:set name="_$formId_1" value="'04fdea69454640d1828d5b903153d18e'" />
		<s:set name="_$type" value="'add'" /> 
      

	
<form id="submitForm1" name="submitForm" target="ifrExcel" enctype="multipart/form-data" method="post" <bu:formet exeid="%{exeid}" />
				target="submitFrame">     
<div id="divExcelExport">
<input type="hidden" id="info60000" value="?电子文档每一个sheet总记录不能超过60000条记录">
<input type="hidden" id="info1000" value="?电子文档每一个sheet总记录不能小于1000条记录">
<input type="hidden" id="infoExportMaxNum" value=" ?导出不能大于">
<input type="hidden" id="controlExportMaxNum" value="100000">
<input type="hidden" value="iframe4" id="iframeId" name="iframeId">
<input type="hidden" value="2ecf0f22ccd14df291ec2ec429bdd052" id="exeid" name="exeid">
<div class="pic"></div>
<input type="file" id="fileimp" style=" margin-left: 240px;margin-top: 30px;margin-bottom: 5px;"/>
<div class="buttons" id="export_but_div" accept="application/vnd.ms-excel" style=" margin-left: 240px;margin-top: 30px;margin-bottom: 5px; ">
<input type="button" value="导 入" id="btnExeclExport" onclick="impExcelproject()">
 <!--<input type="submit" value="导 入" id="btnExeclExport">-->
 <input type="button" value="关 闭" onclick="closeWindow();">
</div>
   <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
  </div>
</form>
   
      </div>	     
<script>
function  impExcelproject(){
  debugger;
  if(checkData()){
   /* $("#submitForm1").ajaxsubmit({
      url:"${path}buss/bussModel_exeFunc.ms?funcMId=409d21c1c7624b4ab9ef10811b0a1113",
      dataType:"text"
    });*/
    var filepath = $("#fileimp").val();
    
    document.forms.submitForm1.action = "${path}buss/bussModel_exeFunc.ms?funcMId=409d21c1c7624b4ab9ef10811b0a1113";
    document.forms.submitForm1.submit();
  } 
}
  $("#fileimp").change(function(){
 
    
     var file = this.files[0];
     var reader = new FileReader();
     reader.onload = function (e) { 
			 $("#fileimp").val() = this.result; 
           
			
		};
   console.log("file>>>"+$("#fileimp").files);
    
   //  var url = getObjectURL(file);
   // console.log("url>>>"+url);
 });
  
 //js校验form表单信息
  function checkData(){
    var fileDir = $("#fileimp").val();
    var suffix = fileDir.substr(fileDir.lastIndexOf("."));
    if(""==fileDir){
      utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="未导入数据表" />", 0, "260", "");
      return false;
    }
    if(".xls" != suffix && ".xlsx" != suffix){
      utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="导入的Excel格式错误" />", 0, "260", "");
      return false;
    }
    return true;
  }
  //获取及释放游览器file的地址
  function getObjectURL(file){
    var url = null;
    if(window.createObjectURL != undefined){
      url = window.createObjectURL(file);
    }else if(window.URL != undefined){
      url = window.URL.createObjectURL(file);
    }else if(window.webkitURL != undefined){
      url = window.webkitURL.createObjectURL(file);
    }
    return url;
  }
  
</script>     
      
  
    <div style="display: none;">
        <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
    </div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_19" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>

    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_19" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
