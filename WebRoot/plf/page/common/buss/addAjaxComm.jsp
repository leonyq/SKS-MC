<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <title><dict:lang value="新增" /></title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
   
	    <script>
	    var addTableTrMap;
            	 
            	  	    if( window.top != window.self ){
            	  	    	  //加载父ifream中的js\css文件 
                var linkList = window.parent.document.getElementsByTagName("link");
                var scriptList = window.parent.document.getElementsByTagName("script");
                var head = document.getElementsByTagName("head").item(0);
                //外联样式
                for(var i=0;i<linkList.length;i++)
                {
                    var l = document.createElement("link");
                    l.rel = 'stylesheet';
                    l.type = 'text/css';
                    l.href = linkList[i].href;
                    head.appendChild(l);
                }
                
                //去除重复的js引用
                var json = {};
                var scripts = new Array();
                var j = 0;
                for(var i=0;i<scriptList.length;i++)
                {
                    if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
                    {
                        json[scriptList[i].src] = 1;
                        //include(scriptList[i].src);
                        //alert("include "+scriptList[i].src);
                        var script = document.createElement("script");
                        script.type = 'text/javascript';
                        script.src = scriptList[i].src;
                        head.appendChild(script);
                        scripts[j] = script;
                        j++;
                    }
                }
          
                window.scripts = scripts; 
            	  	    	
         }//if( window.top != window.self ){ 
         UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
         UE.Editor.prototype.getActionUrl = function(action){  
             //调用自己写的Controller 
             if(action == 'uploadimage' || action == 'uploadfile'){  
            	 return "${path}/buss/bussModel_editorUploadImg.ms?savePath="+$("#_savePath").val(); //自己controller的action  
             }else if(action == "uploadvideo"){  
                 return "<c:out value='${ctx}' />/ueditor/videoUp";//自己controller的action  
             }else{  
                 return this._bkGetActionUrl.call(this,action);//百度编辑器默认的action  
             }  
         } ; 
         
        	 
            </script>
</head>
<body style="overflow:auto;">
    <div class="edit">
    <form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
                                        target="submitFrame">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                 <div style="margin-left:10px;">
                 	<div class="save-close" title=<dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
	                <s:if test="${isDataAuth == '1'}">
	                		<span class="dot">*</span><dict:lang value="组织机构" />
	                		<s:if test="${fn:length(deptLs)==1}">
	                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
									id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
	                   		</s:if>
	                   		<s:else>
	                			<s:select list="deptLs" headerKey="" theme="simple" headerValue='--%{getText("请选择")}--'
									listKey="id" listValue="name" value="${sessionScope.mcDataAuth}" name="_DATA_AUTH" id="deptLs_data_auth"
									cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
			   				</s:else>
	                	</s:if>	
	             </div>
                <div class="optn">
                    <button type="button" id="saveBtn"  onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
                    <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
                </div>

            <!-- <div class="dialog dialog-s1" style="display:block;left:25%;width:100%;height:100%;">
                <div class="dialog-bd">
                                <div class="bd">

                                </div>
                                    <div class="btn-box">
                                        <input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="btn-add">
                                        <input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="btn-cancel">
                                    </div>
            
                  </div>
                </div>-->
        
            </div>
            <div class="bd" >
                                        
                                        <input type="hidden" name="exeid" value="<c:out value='${exeid}' />">
                                        <input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}' />">
                                        <input type="hidden" name=iframeId value="<c:out value='${iframeId}' />">
                                         <input type="hidden" name="mcTokenKey" value="${mc_token_key}">
                                         <%--<c:set var="fido" value="${person.dog}"/>  
                                        --%><input type="hidden" name="_formToken" value="${mc_token_key}">
                                        <input type="hidden" id ="authIsGanged" name=authIsGanged value="<c:out value='${authIsGanged}'/>">
                                        <s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" value="%{FUNC_CODE_2}" />
                                        <!-- <table class="basic-table">
                                            <tr>
                                                <th colspan="4">
                                                    <span class="Eng">*</span>
                                                    <dict:lang value="为必填项" />
                                                </th>
                                            </tr>
                                        </table>-->
                                        <bu:addcp exeid="%{exeid}" />
                                        <table class="func_table">
                                            <tr>
                                                <td width="100%" align="right">
                        
                                                </td>
                                            </tr>
                                        </table>
            </div>
         </form>
    </div>

    <div style="display: none;">
        <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
    </div>

<script type="text/javascript">
    function init(){
        $(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
         
    }//初始化方法
    
    function resetForm(){
		//$("#addForm .clearField")[0].reset();
		setPrefixInd();
		$(".clearField").not(":button, :submit, :reset").val("").removeAttr("checked").remove("selected");//核心  
		$(".dept_select").trigger("chosen:updated");
		$("#saveBtn").prop("disabled",false);//强制开启“保存”按钮不能禁用 cjdjk 2018-02-09 10:39
	}
    
    function guid() {
        return 'xxxxxxxxxxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
            return v.toString(16);
        });
    }
    
    $(function(){
    	setPrefixInd();
    	
    });
    
    function setPrefixInd(){
    	if($(".multiFileUploadText").length>0){
    		var id = guid();
    		var prefixInd = $("#prefixInd").val();
    		if($("#"+prefixInd.replace('@', '')+"_"+"ID").length>0){
    			$("#"+prefixInd.replace('@', '')+"_"+"ID").remove();
    		}
    		$("#prefixInd").after("<input type='hidden' id="+(prefixInd.replace('@', '')+"_"+"ID")+" name="+(prefixInd+"0#ID")+" value="+id.replace(/-/g, '')+">");
    	};
    };
 	var dataAuthSelect="";
	if("1"=="<c:out value='${mcIsOpenAuth}' />"){
		 dataAuthSelect =
			"<select id='deptLs_data_auth' style='display:none;width: 200px;'   name='_DATA_AUTH' >"
		    +"<option selected='selected' value='${sessionScope.mcDataAuth}'>${sessionScope.mcDataAuthName}</option>"
		    +"</select>"
	        +"<dict:lang value='组织机构' />&nbsp;<select id='deptLs_data_auth_text' style='width: 200px;' class='dept_select' disabled ='disabled' name='_DATA_AUTH_TEXT' >"
	        +"<option value=''>${sessionScope.mcDataAuthName}</option>"
	        +"</select>";
	}
	if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" !="<c:out value='${isOldAuthDataPattern}' />"){
		dataAuthSelect = "<select id='deptLs_data_auth' style='display:none;width: 200px;'   name='_DATA_AUTH' >"
	        +"<option value='${sessionScope.mcDataAuth}'>${sessionScope.mcDataAuthName}</option>"
	        +"</select>";
	}
	
    $(".hd").append(dataAuthSelect);
    $(function(){
    	
        if($("#authIsGanged").val()=="1"){
        	if("1"=="<c:out value='${mcIsOpenAuth}' />"){ //14版本
        		var dataAuth = $("#deptLs_data_auth").val();
           		$(".dept_select").not("#deptLs_data_auth").each(function(){
               		var thisId = $(this).prop("id");
               		if($("#"+thisId+"_formId").length!=0){
               			var formId = $("#"+thisId+"_formId").val();
               			var formColId = $("#"+thisId+"_formColId").val();
               			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
               			var uiType = $("#"+thisId+"_uiType").val();
               			_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
               		};
               	});
        	}
        	if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" !="<c:out value='${isOldAuthDataPattern}' />"){
        		$(".dept_select").each(function(){
               		var thisId = $(this).prop("id");
               		if($("#"+thisId+"_formId").length!=0){
               			var formId = $("#"+thisId+"_formId").val();
               			var formColId = $("#"+thisId+"_formColId").val();
               			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
               			var uiType = $("#"+thisId+"_uiType").val();
               			_controlsDataAuth(formId,"1",thisId,"<c:out value='${sessionScope.mcDataAuth}'/>",formColId,uiType);
               		};
               	});
        	}
        	
        	if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" =="<c:out value='${isOldAuthDataPattern}' />"){ //13版本
        		if($("#deptLs_data_auth").length==0){
            		$(".dept_select").not("#deptLs_data_auth").each(function(){
                		var thisId = $(this).prop("id");
                		if($("#"+thisId+"_formId").length!=0){
                			var formId = $("#"+thisId+"_formId").val();
                			var formColId = $("#"+thisId+"_formColId").val();
                			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                			var uiType = $("#"+thisId+"_uiType").val();
                			var dataAuth = "mCAuthIsNull";
                			_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
                		};
                	});
            	}else{
            		$("#deptLs_data_auth").change(function(){
            			//多组织机构记忆控件改造 新增页面的多组织机构切换的时候重新根据当前组织机构值获取记忆值
                    	try{chkMsSaveMarkUtils.loadConfig("add");}catch(err){}
                    	
                		var dataAuth = $("#deptLs_data_auth").val();
                		if(dataAuth!=""){
                			$(".clearPopVal").val("");
                		}
                		$(".dept_select").not("#deptLs_data_auth").each(function(){
                    		var thisId = $(this).prop("id");
                    		if($("#"+thisId+"_formId").length!=0){
                    			var formId = $("#"+thisId+"_formId").val();
                    			var formColId = $("#"+thisId+"_formColId").val();
                    			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                    			var uiType = $("#"+thisId+"_uiType").val();
                    			if(dataAuth==""){
                    				var option = "";
                    				$("#deptLs_data_auth option").each(function(){
                        				option = $(this).val();
                    					if(option==""){
                    						return true;
                    					}
                    					dataAuth+=option+",";
                    				});
                    				dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
                    			}
                    			
                    			_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
                    		};
                    	});
                    	
                	});
                	$("#deptLs_data_auth").trigger("change");
            	}
        	};
        };
    });
</script>

    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>