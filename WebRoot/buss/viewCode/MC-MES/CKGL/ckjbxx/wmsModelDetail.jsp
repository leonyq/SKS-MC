<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	<style>
	.aclass{
	    float:left;
	    margin-top: -40px;
	}
	</style>
</head>
<body>
    			 <!--   <div class="aclass">
			     	<button type="button" onclick="addWMS();"><i class="ico ico-kl"></i><dict:lang value="新增仓库" /></button>
			    	<button type="button" onclick="addSubrange();"><i class="ico ico-kl"></i><dict:lang value="新增子区域" /></button>
			        <button type="button" onclick="edit();"><i class="ico ico-xg"></i><dict:lang value="修改" /></button>
			        <button type="button" onclick="del();"><i class="ico ico-sc"></i><dict:lang value="删除" /></button>
			        <button type="button" onclick="ligthUp();"><i class="ico ico-ld"></i><dict:lang value="亮灯" /></button>
			        <button type="button" onclick="ligthOff();"><i class="ico ico-md"></i><dict:lang value="灭灯" /></button>
			        <button type="button" onclick="freeLigthUp();"><i class="ico ico-ld"></i><dict:lang value="空闲库位亮灯" /></button>
			        <button type="button" onclick="freeLigthOff();"><i class="ico ico-md"></i><dict:lang value="空闲库位灭灯" /></button> 
			        <select  class="dept_select "><option >--请选择--</option> </select>       
			        
			    </div> -->
	<div class="content-in">
	<div class="dlist">
            <div >
             
            

			    
			<bu:func viewId="a7fdc4cd506a496b802df01b54758186" /> </div>
			<div class="bd" style='margin-top:40px;'>
	    	<form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">		
				 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  				 </jsp:include>	
		<bu:set name="paraMapObj" value="${dataId}" formId="7e97b82277324898b85d8a12875adab9" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="areaSn" id="areaSn" value="${dataMap.areaSn}" />
	<input type="hidden" name="myiframeid" id="myiframeid" value="${dataMap.iframeid}" />
	<input type="hidden" name="formIds" value="7e97b82277324898b85d8a12875adab9" />
	<input type="hidden" name="7e97b82277324898b85d8a12875adab9" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="dataAuth" value="${param.dataAuth}">
	<input type="hidden" name="lgDataAuth" id="lgDataAuth" value="${sessionScope.mcDataAuth}" />  
		<s:set name="_$viewId" value="'a7fdc4cd506a496b802df01b54758186'" />
		<s:set name="_$formId_1" value="'7e97b82277324898b85d8a12875adab9'" />
		<s:set name="_$type" value="'add'" />
		<tr>
		    <td class="name" /><bu:uitn colNo="WA_AREA_TYPE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<td colno="WA_AREA_TYPE" class="dec">				
			<input type="text" id="paraMap1_WA_AREA_TYPE" name="paraMap1@0#WA_AREA_TYPE" value="" class="_VAL_NULL input isSubmit" disabled="disabled">
			</td>
	
	        <td class="name" /><bu:uitn colNo="WA_SUPERIOR_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<td colno="WA_SUPERIOR_SN" class="dec">				
			<input type="text" id="paraMap1_WA_SUPERIOR_SN" name="paraMap1@0#WA_SUPERIOR_SN" value="" class="_VAL_NULL input isSubmit" disabled="disabled">
			</td>
	
	        <td class="name" /><bu:uitn colNo="WA_STAROGE_TYPE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<td colno="WA_STAROGE_TYPE" class="dec">				
			<input type="text" id="paraMap1_WA_STAROGE_TYPE" name="paraMap1@0#WA_STAROGE_TYPE" value="" class="_VAL_NULL input isSubmit" disabled="disabled">
			</td>
		    
			
		</tr>
		<tr>
			<td class="name" style="width:120px;"/><bu:uitn colNo="WA_AREA_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" style="width:250px;" colNo="WA_AREA_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_AREA_SN" disabled="disabled" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_AREA_SN}" formIndex="1" /></bu:td>

			<td class="name" /><bu:uitn colNo="WA_AREA_NAME" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_AREA_NAME" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_AREA_NAME" disabled="disabled" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_AREA_NAME}" formIndex="1" /></bu:td>

		    <td class="name" /><bu:uitn colNo="WA_RELATE_ORDERSET" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<td colno="WA_RELATE_ORDERSET" class="dec">				
			<input type="text" id="paraMap1_WA_RELATE_ORDERSET" name="paraMap1@0#WA_RELATE_ORDERSET" value="" class="_VAL_NULL input isSubmit" disabled="disabled">
			</td>
			
		</tr>
		<tr>
	        <td class="name" /><bu:uitn colNo="WA_FACE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_FACE" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_FACE" disabled="disabled" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_FACE}" formIndex="1" /></bu:td>

			 <td class="name" /><bu:uitn colNo="WA_SHELF_IP" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SHELF_IP" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SHELF_IP" disabled="disabled" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SHELF_IP}" formIndex="1" /></bu:td>
	        				
            <td class="name" /><bu:uitn colNo="WA_SHELF_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SHELF_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SHELF_SN" disabled="disabled" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SHELF_SN}" formIndex="1" /></bu:td>
		
			
	        
	       
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="WA_STOREY_NO" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STOREY_NO" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STOREY_NO" disabled="disabled" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_STOREY_NO}" formIndex="1" /></bu:td>

			 <td class="name" /><bu:uitn colNo="WA_FLOW_NUM" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_FLOW_NUM" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_FLOW_NUM" disabled="disabled" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_FLOW_NUM}" formIndex="1" /></bu:td>
	        				
            <td class="name" /><bu:uitn colNo="WA_FLOW_NO" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_FLOW_NO" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_FLOW_NO" disabled="disabled" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_FLOW_NO}" formIndex="1" /></bu:td>
		
			
		</tr>
		<tr>
			 <td class="name" /><bu:uitn colNo="WA_STORAGE_CAPACITY" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STORAGE_CAPACITY" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STORAGE_CAPACITY" disabled="disabled" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_STORAGE_CAPACITY}" formIndex="1" /></bu:td>

			 <td class="name" /><bu:uitn colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_VOLUME" disabled="disabled" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_VOLUME}" formIndex="1" /></bu:td>
			
			<!--
			<td class="name" /><bu:uitn colNo="WA_STORAGE_FLAG" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STORAGE_FLAG" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STORAGE_FLAG" disabled="disabled" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_STORAGE_FLAG}" formIndex="1" /></bu:td>
			-->
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WA_MEMO" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_MEMO" formId="7e97b82277324898b85d8a12875adab9" style="height:80px;" colspan="5"><bu:ui colNo="WA_MEMO" disabled="disabled" style="height:100%;width:98%;" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_MEMO}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" />说明：</td>
			<bu:td cssClass="dec-self" colNo="说明" formId="076c88e377ff4b5abf801455c055a202" style="height:50px;" colspan="5">容量按个体算,容积单位为m³;新增货位需填写所属层数及流水位数;货位有单面/正面/反面之分,
			默认为单面;电子货架需设置货架服务IP及库位硬体编码。
			</bu:td>
		</tr>
	</table>
			<bu:jsVal formId="7e97b82277324898b85d8a12875adab9" formIndex="1" />
		
			</div>
			</form>	
	</div>
	</div>
<bu:script viewId="a7fdc4cd506a496b802df01b54758186" />
         <bu:submit viewId="a7fdc4cd506a496b802df01b54758186" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
<script type="text/javascript">
var areaType;
var highSn;
var areaId;
var _select_info3="您没有操作该组织机构的权限";
$(function(){
	//util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=7473519517ab493e9c750f9c9a906831",
			    data: {"dataAuth":"${param.dataAuth}","areaSn":$("#areaSn").val()},
				success: function(data){
						//util.closeLoading();
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							areaType = rccList[0].WA_AREA_TYPE;
							highSn = rccList[0].WA_AREA_SN;
							areaId = rccList[0].ID;
							if(rccList[0].WA_SUPERIOR_SN=='-1')  rccList[0].WA_SUPERIOR_SN="";
							if(rccList[0].WA_STAROGE_TYPE=='1') rccList[0].WA_STAROGE_TYPE="电子货架";
							if(rccList[0].WA_STAROGE_TYPE=='2') rccList[0].WA_STAROGE_TYPE="普通货架";
							$("#paraMap1_WA_AREA_SN").val(rccList[0].WA_AREA_SN);
							$("#paraMap1_WA_AREA_NAME").val(rccList[0].WA_AREA_NAME);
							$("#paraMap1_WA_AREA_TYPE").val(rccList[0].AREA_TYPE_NAME);
							$("#paraMap1_WA_SUPERIOR_SN").val(rccList[0].WA_SUPERIOR_SN);
							$("#paraMap1_WA_STORAGE_CAPACITY").val(rccList[0].WA_STORAGE_CAPACITY);
							$("#paraMap1_WA_RELATE_ORDERSET").val(rccList[0].RELATE_ORDERSET_NAME);
							$("#paraMap1_WA_SHELF_SN").val(rccList[0].WA_SHELF_SN);
							$("#paraMap1_WA_SHELF_IP").val(rccList[0].WA_SHELF_IP);
							$("#paraMap1_WA_STORAGE_FLAG").val(rccList[0].WA_STORAGE_FLAG);
							$("#paraMap1_WA_STAROGE_TYPE").val(rccList[0].WA_STAROGE_TYPE);
							$("#paraMap1_WA_MEMO").val(rccList[0].WA_MEMO);
							$("#paraMap1_WA_FACE").val(rccList[0].WA_FACE);
							 $("#paraMap1_WA_FACE").trigger("chosen:updated");
							 $("#paraMap1_WA_FLOW_NUM").val(rccList[0].WA_FLOW_NUM);
							 $("#paraMap1_WA_STOREY_NO").val(rccList[0].WA_STOREY_NO);
							 $("#paraMap1_WA_FLOW_NO").val(rccList[0].WA_FLOW_NO);
							 $("#paraMap1_WA_VOLUME").val(rccList[0].WA_VOLUME);
						}
						
					},
				error: function(msg){
							if(msg.readyState!=0){
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     			       }
				  }
				});
})
function query(){
    //var parentWindows = $(window.parent.document).contents().find("#areaiframe")[0].contentWindow;
    parent.qtree();
    
}
/*

function addWMS(){
 
   var formId = $("#formId1").val();
   console.log("formId::"+formId);
   console.log("iframeId::"+$("#myiframeid").val());
  // var url = "${path}buss/bussModel.ms?exeid=97fc6a2a9b084def89e728fd212e62e7&formId="+formId+"&iframeId="+_currentFrame;
  var url = "${path}buss/bussModel.ms?exeid=831ebaf8a0e14a9cbfc590e3e2320040&formId="+formId+"&iframeId="+$("#myiframeid").val()+"&areaType="+areaType;
  showPopWinFp(url, 700, 400,null,"<dict:lang value="新增仓库" />","");
}

function addSubrange(){
  var formId = $("#formId1").val();
  if(areaType==undefined){
   // utilsFp.confirmIcon(3,"","","", "%{getText("只能新增仓库")}",0,"260","");
    utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择一条记录" />",0,"260","");
          return;
  }
  if(areaType==3){
   // utilsFp.confirmIcon(3,"","","", "%{getText("请选择其他类别进行新增")}",0,"290","");
    utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择其他类别进行新增" />",0,"290","");
          return;
  }
  var url = "${path}buss/bussModel.ms?exeid=11342af687e94be694af08dda82e4e84&&formId="+formId+"&iframeId="+$("#myiframeid").val()+"&areaType="+areaType+"&highSn="+highSn;
  //showPopWinFp(url, 900, 450,null,"%{getText("新增子区域")}");
  showPopWinFp(url, 900, 450,null,"<dict:lang value="新增子区域" />","");
}

function edit(){
      var formId = $("#formId1").val();
      if($("#areaSn").val()==null||$("#areaSn").val()==""){
      //utilsFp.confirmIcon(1,"","","", "%{getText("请选择一条记录")}",0,"290","");
      utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一条记录" />",0,"290","");
      //showPopWinFp(url, 700, 400,null,"<dict:lang value="请选择一条记录" />","");
          return;
      }
      var url = "${path}buss/bussModel.ms?exeid=66762ec235564663a097cea70f25d92a&&formId="+formId+"&areaSn="+$("#areaSn").val()+"&iframeId="+$("#myiframeid").val();
     // showPopWinFp(url, 930, 400,null,"%{getText("修改")}");
      showPopWinFp(url, 930, 400,null,"<dict:lang value="修改" />","");
}

function del(){
      if($("#areaSn").val()==null||$("#areaSn").val()==""){
      //utilsFp.confirmIcon(1,"","","", "%{getText("请选择一条记录")}",0,"290","");
       utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一条记录" />",0,"290","");
          return;
      }else{
      utilsFp.confirmIcon(1,"","delConfirm","", "是否确认删除？","1","260","");
      }
}

function delConfirm(){
  var oldUrl = document.forms.listForm.action;
  var oldTarget = document.forms.listForm.target;
  document.forms.listForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=5724da56346f4942b2641563bc14ca54&areaSn="+$("#areaSn").val();
  document.forms.listForm.target = "submitFrame";
  document.forms.listForm.submit();
  document.forms.listForm.action = oldUrl;
  document.forms.listForm.target = oldTarget;
}

function ligthUp(){
      if($("#areaSn").val()==null||$("#areaSn").val()==""){
    //  utilsFp.confirmIcon(1,"","","", "%{getText("请选择一条记录")}",0,"290","");
     utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一条记录" />",0,"290","");
          return;
      }else{
      
  var oldUrl = document.forms.listForm.action;
  var oldTarget = document.forms.listForm.target;
  document.forms.listForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=f26a75fccd8744f7b2b943ff2b0fc246&areaSn="+$("#areaSn").val();
  document.forms.listForm.target = "submitFrame";
  document.forms.listForm.submit();
  document.forms.listForm.action = oldUrl;
  document.forms.listForm.target = oldTarget;
     }
}

function ligthOff(){
      if($("#areaSn").val()==null||$("#areaSn").val()==""){
      //utilsFp.confirmIcon(1,"","","", "%{getText("请选择一条记录")}",0,"290","");
       utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一条记录" />",0,"290","");
          return;
      }else{
      
  var oldUrl = document.forms.listForm.action;
  var oldTarget = document.forms.listForm.target;
  document.forms.listForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=5249c339f7ad4e7285f29213d013f011&areaSn="+$("#areaSn").val();
  document.forms.listForm.target = "submitFrame";
  document.forms.listForm.submit();
  document.forms.listForm.action = oldUrl;
  document.forms.listForm.target = oldTarget;
     }
}

function freeLigthUp(){
      if($("#areaSn").val()==null||$("#areaSn").val()==""){
      //utilsFp.confirmIcon(1,"","","", "%{getText("请选择一条记录")}",0,"290","");
       utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一条记录" />",0,"290","");
          return;
      }else{
      
  var oldUrl = document.forms.listForm.action;
  var oldTarget = document.forms.listForm.target;
  document.forms.listForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=55e797e5926940a3ac833583f74ccf95&areaSn="+$("#areaSn").val();
  document.forms.listForm.target = "submitFrame";
  document.forms.listForm.submit();
  document.forms.listForm.action = oldUrl;
  document.forms.listForm.target = oldTarget;
     }
}

function freeLigthOff(){
      if($("#areaSn").val()==null||$("#areaSn").val()==""){
      //utilsFp.confirmIcon(1,"","","", "%{getText("请选择一条记录")}",0,"290","");
       utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一条记录" />",0,"290","");
          return;
      }else{
      
  var oldUrl = document.forms.listForm.action;
  var oldTarget = document.forms.listForm.target;
  document.forms.listForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=d405028a6d114d13ac2bcbe59b2e1e70&areaSn="+$("#areaSn").val();
  document.forms.listForm.target = "submitFrame";
  document.forms.listForm.submit();
  document.forms.listForm.action = oldUrl;
  document.forms.listForm.target = oldTarget;
     }
}
*/






function reloadPg(msg,title,width,height,time,isCloseWin){
    console.log("333");
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
        
        if(isCloseWin==undefined){
            parent.location=parent.location;
        }
        //console.log(isCloseWin);
  	/*query("formId1");
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
    		
  	}
   	checkboxAll("joblist");*/
}
function reloadPgAx(msg,title,width,height,time,isCloseWin){
       
		msgPop(msg,reloadPgExeAx,title,width,height,time,isCloseWin);
	}
					
	function reloadPgExeAx(isCloseWin){
	 console.log("222");
	    query("formId1");
		util.showTopLoading();
		if(isCloseWin == "0"){
			top.$(".dialog-close").click();
		}
	} 
	
	function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
//	msgPop("新增成功","","摩尔提示",200,150,3000);
	}
	

</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<bu:script viewId="4ea66f95eb4340f0a18662260737e3c2" />
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
