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
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" 
					target="submitFrame" enctype="multipart/form-data" >
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <!--
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                -->
                </div>
			    <div class="optn">
			        <button type="button" onclick="adds();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="175c4afd1c0149a092c2d0bacf445401" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="175c4afd1c0149a092c2d0bacf445401" />
	<input type="hidden" id="prefixInd" name="175c4afd1c0149a092c2d0bacf445401" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'186c737eeb004c5f86747599c595f91a'" />
		<s:set name="_$formId_1" value="'175c4afd1c0149a092c2d0bacf445401'" />
		<s:set name="_$type" value="'add'" />
	
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_NAME" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_NAME}" formIndex="1" /></bu:td>
		</tr>
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_PHOTO}" formIndex="1" /></bu:td>
		</tr>
		-->
		<tr>
                		    <td class="name"    style="width:64px;vertical-align: bottom;" /><bu:uitn colNo="TAM_MENU_PHOTO" formId="175c4afd1c0149a092c2d0bacf445401" /></td>	
                			<td class="dec"   rowspan="1"  style="width:150px;vertical-align: bottom;">
                			<div id="photoImg"  style="margin-bottom:14px;height:60px;" > 
                			<img alt="" id="img0" src="plf/page/fp/img/MoreWis_s.png" align="bottom" style="width:120px;height:60px;float:left;" > 
                			<!--	<span style="font-size:12px;color:#999;float:left;margin-top:46px;margin-left:5px;">支持100KB以内</span> 	-->	
                			</div>
                <!--	<input type="file" accept="image/*" id="paraMap1_CFI_PHOTO" name="upFile" value="" class="isSubmit input">	-->	

                			<input type='button' value='<dict:lang value="导航默认图片" />' id="select_system" onclick="choosePic('1')"> 
                			<input type="hidden" name="serverfileName" id="serverfileName" value="" />
                			<input type="file" id="paraMap1_TAM_MENU_PHOTO" onchange="javascript:_setImagePreview('photoImg','img0','paraMap1_TAM_MENU_PHOTO');" style="display:none;" name="upFile" class=" input isSubmit  _VAL_OjbsData">
                			</td>
                		</td>
                		</tr>
		<!--
		<tr>
			<td class="name-three" /><bu:uitn colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" /></td>
			<bu:td cssClass="dec-self" colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" ><bu:ui colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" value="%{TAM_MENU_PHOTO2}" formIndex="1" /></bu:td>
		</tr>
		-->
			<tr>
                		  <td class="name"    style="width:64px;vertical-align: bottom;" /><bu:uitn colNo="TAM_MENU_PHOTO2" formId="175c4afd1c0149a092c2d0bacf445401" /></td>	
                			<td class="dec"   rowspan="1"  style="width:150px;vertical-align: bottom;">
                			<div id="photoImgs"  style="margin-bottom:14px;height:60px;" > 
                		<img alt="" id="img2" src="plf/page/fp/img/MoreWis_s.png" align="bottom" style="width:120px;height:60px;float:left;" >  
                			<!--	<span style="font-size:12px;color:#999;float:left;margin-top:46px;margin-left:5px;">支持100KB以内</span> 	-->	
                			</div>
                <!--				<input type="file" accept="image/*" id="paraMap1_CFI_PHOTO2" name="upFile2" value="" class="isSubmit input"> -->			

                	<input type='button' value='<dict:lang value="导航选中图片" />' id="select_systems" onclick="choosePic('2')">  
                			<input type="hidden" name="serverfileName2" id="serverfileName2" value="" />
                			<input type="file" id="paraMap1_TAM_MENU_PHOTO2" onchange="javascript:_setImagePreview('photoImgs','img2','paraMap1_TAM_MENU_PHOTO2');" style="display:none;" name="upFile2" class=" input isSubmit  _VAL_OjbsData">  
                			</td>
                		</td>
                		</tr>
	
	</table>
			<bu:jsVal formId="175c4afd1c0149a092c2d0bacf445401" formIndex="1" />
				
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

</body>
<script>
 function choosePic(types) {
				
				var piframeId = window.frameElement.id;
				var type=types;
				var url = "${path}buss/bussModel.ms?exeid=092b086f9047468f88727645640197cc&piframeId="+piframeId+"&type="+type;						

				showPopWinFp(url, 552, 350, "", "<dict:lang value="选择导航菜单图片"/>",
						"choosePic", "");
	}
	
		
	function closeWindow(){
			if(parent.$(".dialog-close").length > 0){
			parentWindow.$("#close").val("0");
				parent.$(".dialog-close").click();				
			}else if(parentWindow != null){
				var iframeSeq = parentWindow.name.replace("iframe","");
				//parentWindow.$("#close").val("0");
				parent.closeTab(iframeSeq);
			}
			
		}
    	var saveTestInfoUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=99905a7e1e7a4036a3a63d028a09c77a";
		function add(){
    
            isQuery = false;
	        /*
			if($("#upFile$f5c76b95ad9d4116a5dd9f5bb5e6153c").val()=="" || $("#upFile$f5c76b95ad9d4116a5dd9f5bb5e6153c").val()==undefined){
			
	        	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: saveTestInfoUrl,
			    data: $("#addForm").serialize(),
			    success: function(data){
						    if(null == data){return;}
						    if(null != data){
							    if(data.ajaxMap.returnMsg=="addcount"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="功能编号已存在" />",0,"260","");
    								return;
    							}	

    							if(data.ajaxMap.returnMsg=="addSucc"){	
                                    
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    							     hideDiv('addItem','backItem');
    							     	query("formId1");
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
    								return;
    							}
						    }
					},
			    error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
			});
	        }else{
	        */
	        /*
	        	var formData = new FormData(document.getElementById("addForm"));
	        	console.log(formData);
	        	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: saveTestInfoUrl,
			    data: formData,
			    //cache: false,
			    processData:false,
                contentType:false,
			    success: function(data){
			                if(null == data){return;}
						    if(null != data){
						    
						       
    							
    							if(data.ajaxMap.returnMsg=="nullName"){	
                                    
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="导航菜单名称不能为空" />",0,"260","");
    								return;
    							}
							
    							
    							if(data.ajaxMap.returnMsg=="addSucc"){	
                                    
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    							    
    								    $("#paraMap1_paraMap1_TAM_MENU_NAME").val("");
    								  
                                        $("#img0").attr("src", "plf/page/fp/img/MoreWis_s.png") ;
                                        $("#paraMap1_TAM_MENU_PHOTO").val("");
                                       
    							
    							if(data.ajaxMap.returnMsg=="addError"){
    								utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
    								return;
    							}
						    }
                                
					}
			   
			},
			 error: function(msg){
						
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
	       // }
            })
            */
            
            
            
}


function adds(){
	 
	    	    	
	    	    if(!val.valNullData()){
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
	    	
	    	    
	    	
   if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
	$("#addForm").append($("#isCloseWin").clone());
	$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
   }
   //alert($("#serverfileName").val());
   document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=99905a7e1e7a4036a3a63d028a09c77a";
   
   //console.log($("#addForm").serialize()); 
   document.forms.addForm.submit();
   
	    	}
//add(this,'${formId}');
	</script>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
