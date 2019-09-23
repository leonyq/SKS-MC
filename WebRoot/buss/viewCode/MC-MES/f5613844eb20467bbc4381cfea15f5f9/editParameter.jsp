<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
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
	         var arr=$("#paraMapObj_VR_DESC").val();
		  
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
		  	   $("#paraMapObj_VR_DESC").val("");
		  	    _alertValMsg($('#paraMapObj_VR_DESC'),"<dict:lang value="该按照说明来填写项目描述" />");
		  	 }
	        
	    }
	    
	    function wuchans(thisObj){
	    
		if(thisObj=="2"){
		   // $("#paraMap1_VR_VALUE").parent().empty();
		  // style='display: none;'
		  //selected = 'true'
		    var arr=$("#paraMapObj_VR_DESC").val();
		  
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
		  	   $("#paraMapObj_VR_DESC").val("");
		  	    _alertValMsg($('#paraMapObj_VR_DESC'),"<dict:lang value="该按照说明来填写项目描述" />");
		  	 }else{
		  	     $("#paraMapObj_VR_VALUE").remove();
    		     var htmlText = "<select id='paraMapObj_VR_VALUE'  name='paraMapObj.VR_VALUE' maxlength='32' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select'   >";
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
    		         _alertValMsg($('#paraMapObj_VR_DESC'),"<dict:lang value="该按照说明来填写项目描述" />");
    		     }
    		     htmlText=htmlText+"</select>";
    		     $("#VR_VALUE").append(htmlText);
    		  	     
    		  	 }
		  	 
		  	 
		  	 
		    
		}else{
		     $("#paraMapObj_VR_VALUE").remove();	
            var htmlText="<input type='text' id='paraMapObj_VR_VALUE' name='paraMapObj.VR_VALUE' value='' maxlength='128' class=' input isSubmit  _VAL_DATABASE'>";
             $("#VR_VALUE").append(htmlText);
		}
		$('.chosen-container').css("width","230px");
	}
	</script>
	
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>
			    	<div class="optn">
			    	        <button type="button" onclick="edits();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm1();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="height:343px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="076c88e377ff4b5abf801455c055a202" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="076c88e377ff4b5abf801455c055a202" />
	<input type="hidden" name="076c88e377ff4b5abf801455c055a202" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d9af389106ba4bd69f091f1d68c74489'" />
		<s:set name="_$formId_1" value="'076c88e377ff4b5abf801455c055a202'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-four" /><bu:uitn colNo="PRG_NAME" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="PRG_NAME" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="PRG_NAME" formId="076c88e377ff4b5abf801455c055a202" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name-four" /><bu:uitn colNo="VR_TYPE" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_TYPE" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_TYPE" formId="076c88e377ff4b5abf801455c055a202"  formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name-fou" /><span class="dot">*</span><bu:uitn colNo="VR_CLASS" formId="076c88e377ff4b5abf801455c055a202" /></td>

			<bu:td cssClass="dec-self" colNo="VR_CLASS" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_CLASS" formId="076c88e377ff4b5abf801455c055a202"  formIndex="1" readonly="readonly"/></bu:td>
			<td class="name-four" /><bu:uitn colNo="VR_ITEM" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_ITEM" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_ITEM" formId="076c88e377ff4b5abf801455c055a202"  formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="VR_DESC" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_DESC" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_DESC" formId="076c88e377ff4b5abf801455c055a202"  formIndex="1" /></bu:td>

			<td class="name-four" /><bu:uitn colNo="VR_NAME" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_NAME" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_NAME" formId="076c88e377ff4b5abf801455c055a202"  formIndex="1" dataId="${dataId}" onchange="wuchans(this.value)"/></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="VR_VALUE" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_VALUE" id="VR_VALUE" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_VALUE" formId="076c88e377ff4b5abf801455c055a202"  formIndex="1" /></bu:td>
	
			<td class="name-four" /><bu:uitn colNo="VR_DEF_VALUE" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_DEF_VALUE" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_DEF_VALUE" formId="076c88e377ff4b5abf801455c055a202"  formIndex="1" /></bu:td>
		</tr>
		<tr>	
		    	<!--
		    <td class="name-four" /><bu:uitn colNo="VR_FLAG" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_FLAG" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_FLAG" formId="076c88e377ff4b5abf801455c055a202"  formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="DEL_FLAG" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="DEL_FLAG" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="DEL_FLAG" formId="076c88e377ff4b5abf801455c055a202"  formIndex="1" /></bu:td>
		    	-->
		     <td class="name-four" /><bu:uitn colNo="VR_FUNC" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_FUNC" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_FUNC" formId="076c88e377ff4b5abf801455c055a202"  formIndex="1" /></bu:td>
			
		    	
		    <td class="name" /><bu:uitn colNo="VR_FLAG" formId="076c88e377ff4b5abf801455c055a202" /></td>
						<bu:td cssClass="dec" colNo="VR_FLAG" formId="076c88e377ff4b5abf801455c055a202" ><bu:ui colNo="VR_FLAG" formId="076c88e377ff4b5abf801455c055a202" dataId="${dataId}" formIndex="1" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<bu:uitn colNo="DEL_FLAG" formId="076c88e377ff4b5abf801455c055a202" />
						<bu:ui colNo="DEL_FLAG" formId="076c88e377ff4b5abf801455c055a202" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="VR_MEMO" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<bu:td cssClass="dec-self" colNo="VR_MEMO" formId="076c88e377ff4b5abf801455c055a202" colspan="3"><bu:ui colNo="VR_MEMO" formId="076c88e377ff4b5abf801455c055a202"  formIndex="1" style="height:80px;width:92%;"/></bu:td>
		</tr>	
		<tr>
			<td class="name-four" />说明：</td>
			<bu:td cssClass="dec-self" colNo="说明" formId="076c88e377ff4b5abf801455c055a202" colspan="2">项目描述需用“项值:描述”区分，多个项用‘|’分隔</bu:td>
		   
		</tr>
	</table>
			<bu:jsVal formId="076c88e377ff4b5abf801455c055a202" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
	    	function init(){
	    	    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    listAjaxTable($("#formId1").val());
                    
	    	}
    	    $(function(){
    	    getInfo();
    	   
    	});
    	function resetForm1(){
    	    	
                        $("#editForm")[0].reset();
                        $(".dept_select").trigger("chosen:updated");
                        getInfo();
                    }
    	
    	function getInfo(){
    	    var dataId = "${param.dataId}";
    	    
    	    
    	    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=0e967c9a91424cd4a72f0e3fc6deb338";
    	    $.ajax({
    	        type:"post",
    	        dataType:"json",
    	        data://"CLAS="+CLAS,
    	         {
                "dataId" : dataId,
                },
    	        url:getInfoUrl,
    	        success:function(data){
    	            console.log(data);
    	            if(null==data){
    	                return;
    	            }
    	            if(null!=data.ajaxList){
    	                var list = eval(data.ajaxList);
    	                //console.log(list[0].VR_NAME);
    	                if(list[0].VR_CLASS==null) list[0].VR_CLASS="";
    	                if(list[0].VR_ITEM==null) list[0].VR_ITEM="";
    	                if(list[0].VR_DESC==null) list[0].VR_DESC="";
    	                if(list[0].PRG_NAME==null) list[0].PRG_NAME="";
    	                if(list[0].VR_TYPE==null) list[0].VR_TYPE="";
    	                if(list[0].VR_NAME==null) list[0].VR_NAME="";
    	                if(list[0].VR_FLAG==null) list[0].VR_FLAG="";
    	                if(list[0].DEL_FLAG==null) list[0].DEL_FLAG="";
    	                if(list[0].VR_VALUE==null) list[0].VR_VALUE="";
    	                if(list[0].VR_MEMO==null)list[0].VR_MEMO="";
    	                if(list[0].VR_DEF_VALUE==null)list[0].VR_DEF_VALUE="";
    	                if(list[0].VR_FUNC==null)list[0].VR_FUNC="";
    	                
    	                $("#paraMapObj_VR_MEMO").val(list[0].VR_MEMO);
    	                $("#paraMapObj_VR_CLASS").val(list[0].VR_CLASS);
    	                $("#paraMapObj_VR_ITEM").val(list[0].VR_ITEM);
    	                $("#paraMapObj_VR_DESC").val(list[0].VR_DESC);
    	                $("#paraMapObj_VR_DEF_VALUE").val(list[0].VR_DEF_VALUE);
    	                $("#paraMapObj_PRG_NAME").val(list[0].PRG_NAME);
    	                $("#paraMapObj_VR_TYPE").val(list[0].VR_TYPE);
    	                $("#paraMapObj_VR_NAME").val(list[0].VR_NAME);
    	               $("#paraMapObj_VR_FUNC").val(list[0].VR_FUNC);
    	                $("#paraMapObj_VR_TYPE").trigger("chosen:updated");
    	                $("#paraMapObj_PRG_NAME").trigger("chosen:updated");
    	                $("#paraMapObj_VR_FUNC").trigger("chosen:updated");
    	                $("#paraMapObj_VR_NAME").trigger("chosen:updated");
    	                
    	                $(".dept_select").trigger("chosen:updated");
    	                if(list[0].VR_FLAG =="Y"){
    	                    $("#paraMapObj_VR_FLAG_1").attr("checked",true);
    	                }else{
    	                    $("#paraMapObj_VR_FLAG_1").attr("checked",false);
    	                }
    	                if(list[0].DEL_FLAG =="Y"){
    	                    $("#paraMapObj_DEL_FLAG_1").attr("checked",true);
    	                }else{
    	                    $("#paraMapObj_DEL_FLAG_1").attr("checked",false);
    	                }
    	                if(list[0].VR_NAME=="2"){
    	                    var arr=$("#paraMapObj_VR_DESC").val();
		  
		  	                var len=arr.split("|");
		  	            
		  	 
        		  	    var strs= new Array(); //定义一数组 
        
                        
                        for (i=0;i<len.length ;i++ ) 
                         { 
                            var h = len[i].split(":");
                            
                            if(h.length >=2){
                                if(h.length==2){
                                strs.push(h[0]);
                                strs.push(h[1]);
                                }
                            }else{
                                
                                var R =len[i].split("：");
                                
                                if(R.length==2){
                                strs.push(R[0]);
                                strs.push(R[1]);
                                }
                            }			
                            
                    
                    
                            } 
                            
            		  	 if(strs.length%2!=0){
            		  	   $("#paraMapObj_VR_DESC").val("");
            		  	    _alertValMsg($('#paraMapObj_VR_DESC'),"<dict:lang value="该按照说明来填写项目描述" />");
            		  	 }else{
            		  	     $("#paraMapObj_VR_VALUE").remove();
                		     var htmlText = "<select id='paraMapObj_VR_VALUE'  name='paraMapObj.VR_VALUE' maxlength='32' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select'   >";
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
                		         _alertValMsg($('#paraMapObj_VR_DESC'),"<dict:lang value="该按照说明来填写项目描述" />");
                		     }
                		     htmlText=htmlText+"</select>";
                		     $("#VR_VALUE").append(htmlText);
                		     $("#paraMapObj_VR_VALUE").val(list[0].VR_VALUE);
                		  	     
                		  	 }
    	                }else{
    	                    $("#paraMapObj_VR_VALUE").val(list[0].VR_VALUE);
    	                }
    	                
    	                
    	            }
    	        },
    	        error:function(msg){
    	            alert(msg);
    	            
    	        }
    	    });
    	}
    	
    	
    	function edits(){
    	    if($("#paraMapObj_VR_CLASS").val()==""){
    	        _alertValMsg($('#paraMapObj_VR_CLASS'),"<dict:lang value="项目编码不能为空" />");
    	    }
            
            if(!val.valNullData()){ 
                   return ;
             }
   
            if(!valData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
		        return ;
	        }
			if(!val.valOjbsData()){
        		return ;
        	}
        document.forms.editForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=f6a6a7ad966945289e366701333caa01"; 
        document.forms.editForm.submit();  
    }
    
    </script>	
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
