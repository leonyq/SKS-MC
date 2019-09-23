<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	
	    <script>
	    
           
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
          }  
            </script>
</head>
<body>

	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
			<div style="margin-left:40px;">
			    <s:if test="${isDataAuth == '1'}">
			       <span class="dot">*</span><dict:lang value="组织机构" />
	               <s:if test="${fn:length(deptLs)==1}">
	                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH"
						id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
	                   </s:if>
	               <s:else>
	                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
						listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
						id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
			  		</s:else>
     		   </s:if>
             </div>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                	<%--<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>--%>
			    	<div class="optn">
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
					
								<input type="hidden" name="exeid" value="<c:out value='${exeid}' />">
								<input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}' />">
								<input type="hidden" name="formId" value="<c:out value='${formId}' />">
								<input type="hidden" name="dataId" value="<c:out value='${dataId}' />" >
								<input type="hidden" name=iframeId value="<c:out value='${iframeId}' />" >
								<input type="hidden" id ="authIsGanged" name=authIsGanged value="<c:out value='${authIsGanged}'/>">
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<bu:editcp exeid="%{exeid}" formId="%{formId}" dataId="%{dataId}" />
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
	
		var parentWindow;
		$(function(){
				try {
					parentWindow =top.$("#"+window.frameElement.name)[0].contentWindow;
				}
				catch(err) {
					parentWindow =window.parent;
				}
		});
		var isQuery = false;
		var fileMap = new Map();//临时存放file相关input
		function edit(thisObj){
		//cjd edit
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
                return ;
            }
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			if($("#isCloseWin")){
				$("#editForm").append($("#isCloseWin").clone());
			}
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg,title,width,height,time){
			isQuery = false;
			parentWindow.reloadPg(msg,title,width,height,time);
		}

		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
					}
			   }
			});
		}
		

		
		function init(){
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
	//重置	
	function resetForm(){
		$("#editForm")[0].reset();
		$(".dept_select").trigger("chosen:updated");
	}
	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>
	 var dataAuthSelect="";
	    if("1"=="<c:out value='${mcIsOpenAuth}' />"){
	   		 dataAuthSelect =
	  			"<select id='deptLs_data_auth' style='display:none;width: 200px;'   name='paraMapObj._DATA_AUTH' >"
	  		    +"<option value='${sessionScope.mcDataAuth}'>${sessionScope.mcDataAuthName}</option>"
	  		    +"</select>"
	  	        +"<span class='dot'>*</span><dict:lang value='组织机构' />&nbsp;<select id='deptLs_data_auth_text' style='width: 200px;' class='dept_select' disabled ='disabled' name='_DATA_AUTH_TEXT' >"
	  	        +"<option value=''>${sessionScope.mcDataAuthName}</option>"
	  	        +"</select>";
	   	}
	    if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" !="<c:out value='${isOldAuthDataPattern}' />"){
	   		dataAuthSelect = "<select id='deptLs_data_auth' style='display:none;width: 200px;'   name='paraMapObj._DATA_AUTH' >"
		        +"<option value='${sessionScope.mcDataAuth}'>${sessionScope.mcDataAuthName}</option>"
		        +"</select>";
	   	}
     $(".hd").append(dataAuthSelect);
	 $(function(){
	        if($("#authIsGanged").val()=="1"){
	        	if("1"=="<c:out value='${mcIsOpenAuth}' />"){ //14版本 
	     		$(".dept_select").not("#deptLs_data_auth").each(function(){
	         		var thisId = $(this).prop("id");
	         		if($("#"+thisId+"_formId").length!=0){
	         			var formId = $("#"+thisId+"_formId").val();
	         			var formColId = $("#"+thisId+"_formColId").val();
	         			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
	         			var uiType = $("#"+thisId+"_uiType").val();
	         			var dataAuth = $("#deptLs_data_auth").val();
	         			_controlsDataAuth(formId,"1",thisId,"${sessionScope.mcDataAuth}",formColId,uiType);
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
            			_controlsDataAuth(formId,"1",thisId,"${sessionScope.mcDataAuth}",formColId,uiType);
            		};
        	   });	
           	 }	
	         if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" =="<c:out value='${isOldAuthDataPattern}' />"){
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
	 				 $("#deptLs_data_auth").change(function(event, param){
	 					    var dataAuth = $("#deptLs_data_auth").val();
	 			    		if(dataAuth!="" && param!="1" ){
	 			    			$(".clearPopVal").val("");
	 			    		}				 
	 			    		$(".dept_select").not("#deptLs_data_auth").each(function(){
	 			        		var thisId = $(this).prop("id");
	 			        		if($("#"+thisId+"_formId").length!=0){
	 			        			var formId = $("#"+thisId+"_formId").val();
	 			        			var formColId = $("#"+thisId+"_formColId").val();
	 			        			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
	 			        			var uiType = $("#"+thisId+"_uiType").val();
	 			        			var dataAuth = $("#deptLs_data_auth").val();
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
	 			    	$("#deptLs_data_auth").trigger("change",["1"]);
	 			}
	         }
	       }
	    });
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>