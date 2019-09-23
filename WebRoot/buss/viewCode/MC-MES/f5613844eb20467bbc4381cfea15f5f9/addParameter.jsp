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
	<script type="text/javascript">
	
	    function upperCase(){
	         var arr=$("#paraMap1_VR_DESC").val();
		  	 var len=arr.split("|");
		  	 
		  	    var strs= new Array(); //定义一数组 

                
                for (i=0;i<len.length ;i++ ) 
                 { 
                    var h = len[i].split(":");
                    
                    if(h.length==2){
                        strs.push(h[0]);
                        strs.push(h[1]);
                    }else{
                        strs.push(h[0]);
                    }
  
                } 
                
		  	 if(strs.length%2!=0){
		  	   $("#paraMap1_VR_DESC").val("");
		  	    _alertValMsg($('#paraMap1_VR_DESC'),"<dict:lang value="该按照说明来填写项目描述" />");
		  	 }
	        
	    }
            			
	    function wuchans(thisObj){
	    
		if(thisObj=="2"){
		   // $("#paraMap1_VR_VALUE").parent().empty();
		  // style='display: none;'
		  //selected = 'true'
		    var arr=$("#paraMap1_VR_DESC").val();
		  
		  	 var len=arr.split("|");
		  	
		  	 
		  	    var strs= new Array(); //定义一数组 

                
                 for (i=0;i<len.length ;i++ ) 
                 { 
                    var h = len[i].split(":");
                    
                    
                    if(h.length >=2){
                                if(h.length==2){
                                strs.push(h[0]);
                                strs.push(h[1]);
                                }else{
                                    strs.push(h[0]);
                                }
                            }else{
                                
                                var R =len[i].split("：");
                                
                                if(R.length==2){
                                strs.push(R[0]);
                                strs.push(R[1]);
                                }else{
                                    strs.push(R[0]);
                                }
                            }
                    
                } 
               
		  	 if(strs.length%2!=0){
		  	   $("#paraMap1_VR_DESC").val("");
		  	    _alertValMsg($('#paraMap1_VR_DESC'),"<dict:lang value="该按照说明来填写项目描述" />");
		  	 }else{
		  	     $("#paraMap1_VR_VALUE").remove();
    		     var htmlText = "<select id='paraMap1_VR_VALUE'  name='paraMap1@0#VR_VALUE' maxlength='32' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select'   >";
    		     htmlText=htmlText+"<option  value=''>"+"---请选择---"+"</option>";
    		     var optin="";
		  	     for(var i=0;i<strs.length;i++){
		         if(i%2==0){
		           optin=optin+"<option  value='"+strs[i]+"'>"+strs[i+1]+"</option>";
		          
		             }
		         }
    		     if(optin!=""){
    		         htmlText=htmlText+optin;
    		     }else{
    		         _alertValMsg($('#paraMap1_VR_DESC'),"<dict:lang value="该按照说明来填写项目描述" />");
    		     }
    		     htmlText=htmlText+"</select>";
    		     $("#VR_VALUE").append(htmlText);
    		  	     
    		  	 }
		  	 
		  	 
		  	 
		    
		}else{
		     $("#paraMap1_VR_VALUE").remove();	
            var htmlText="<input type='text' id='paraMap1_VR_VALUE' name='paraMap1@0#VR_VALUE' value='' maxlength='128' class=' input isSubmit  _VAL_DATABASE'>";
             $("#VR_VALUE").append(htmlText);
		}
		$('.chosen-container').css("width","230px");
	}
	</script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
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
                </div>
			    <div class="optn">
			        <button type="button" onclick="adds();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:343px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="076c88e377ff4b5abf801455c055a202" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="076c88e377ff4b5abf801455c055a202" />
	<input type="hidden" name="076c88e377ff4b5abf801455c055a202" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d0ba4375f6174cc6941cc9e9a1b6abb5'" />
		<s:set name="_$formId_1" value="'076c88e377ff4b5abf801455c055a202'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-four" /><bu:uitn colNo="PRG_NAME" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="PRG_NAME" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="PRG_NAME" formId="076c88e377ff4b5abf801455c055a202" value="%{PRG_NAME}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="VR_TYPE" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_TYPE" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_TYPE" formId="076c88e377ff4b5abf801455c055a202" value="%{VR_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			 <td class="name-fou" /><span class="dot">*</span><bu:uitn colNo="VR_CLASS" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_CLASS" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_CLASS" formId="076c88e377ff4b5abf801455c055a202" value="%{VR_CLASS}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="VR_ITEM" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_ITEM" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_ITEM" formId="076c88e377ff4b5abf801455c055a202" value="%{VR_ITEM}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="VR_DESC" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_DESC" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_DESC" formId="076c88e377ff4b5abf801455c055a202" value="%{VR_DESC}" formIndex="1" onblur="upperCase()"/></bu:td>
	
			<td class="name-four" /><bu:uitn colNo="VR_NAME" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_NAME" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_NAME" formId="076c88e377ff4b5abf801455c055a202" value="%{VR_NAME}" formIndex="1" onchange="wuchans(this.value)"/></bu:td>
		</tr>
		
		<tr>
			<td class="name-four" /><bu:uitn colNo="VR_VALUE" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_VALUE" formId="076c88e377ff4b5abf801455c055a202" id="VR_VALUE"><bu:ui colNo="VR_VALUE"  formId="076c88e377ff4b5abf801455c055a202" value="%{VR_VALUE}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="VR_DEF_VALUE" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_DEF_VALUE" formId="076c88e377ff4b5abf801455c055a202" id="VR_DEF_VALUE"><bu:ui colNo="VR_DEF_VALUE" formId="076c88e377ff4b5abf801455c055a202" value="%{VR_DEF_VALUE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		     <td class="name-four" /><bu:uitn colNo="VR_FUNC" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_FUNC" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_FUNC" formId="076c88e377ff4b5abf801455c055a202" value="%{VR_FUNC}" formIndex="1" /></bu:td>
		
		
		
		    <td class="name"><bu:uitn colNo="VR_FLAG" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<td class="dec"><bu:ui colNo="VR_FLAG" formId="076c88e377ff4b5abf801455c055a202" value="%{VR_FLAG}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <bu:uitn colNo="DEL_FLAG" formId="076c88e377ff4b5abf801455c055a202" />
			<bu:ui colNo="DEL_FLAG" formId="076c88e377ff4b5abf801455c055a202" value="%{DEL_FLAG}" formIndex="1" /></td>

			<!--
		    <td class="name-four" /><bu:uitn colNo="VR_FLAG" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_FLAG" formId="076c88e377ff4b5abf801455c055a202" id="VR_VALUE"><bu:ui colNo="VR_FLAG" formId="076c88e377ff4b5abf801455c055a202" value="%{VR_FLAG}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="DEL_FLAG" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="DEL_FLAG" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="DEL_FLAG" formId="076c88e377ff4b5abf801455c055a202" value="%{DEL_FLAG}" formIndex="1" /></bu:td>
            -->
		
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="VR_MEMO" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_MEMO" formId="076c88e377ff4b5abf801455c055a202" colspan="3"><bu:ui colNo="VR_MEMO" formId="076c88e377ff4b5abf801455c055a202" value="%{VR_VALUE}" formIndex="1" style="height:80px;width:92%;"/></bu:td>
		
		</tr>
		<tr>
			<td class="name-four" />说明：</td>
			<bu:td cssClass="dec-self" colNo="说明" formId="076c88e377ff4b5abf801455c055a202" colspan="2">项目描述需用“项值:描述”区分，多个项用‘|’分隔</bu:td>
	
	</table>
			<bu:jsVal formId="076c88e377ff4b5abf801455c055a202" formIndex="1" />
				
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
	    	function adds(){
	    	    if($("#paraMap1_VR_CLASS").val()==""){
    	        _alertValMsg($('#paraMap1_VR_CLASS'),"<dict:lang value="项目编码不能为空" />");
    	    }
	    	    	
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

   document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=7fae2a9c4f6148efb0199c6d2f3e966e";
   document.forms.addForm.submit();
	    	}
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
