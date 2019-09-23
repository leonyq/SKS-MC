<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%
  String basePathTmp = new StringBuffer().append(request.getScheme()).append("://").append(
    request.getServerName()).append(":").append(request.getServerPort()).append(
    request.getContextPath()).append("/").toString();
final String JS_PATH = basePathTmp + "plf/js";
StringBuilder outComm = new StringBuilder();
      outComm.append("      <script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/ueditor/ueditor.config.js?_mc_res_version=").append(PlfStaticRes.UEDITOR_CONFIG_JS).append("\"></script>").append("\n");
      outComm.append("      <script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/ueditor/ueditor.all.js?_mc_res_version=").append(PlfStaticRes.UEDITOR_ALL_JS).append("\"></script>").append("\n");
      if("zh_CN".equals(StringUtilsMc.toString(request.getLocale()))){
          outComm.append("      <script type=\"text/javascript\" src=\"").append(JS_PATH).append(
          "/ueditor/lang/zh-cn/zh-cn.js?_mc_res_version=").append(PlfStaticRes.ZH_CN_JS).append("\"></script>").append("\n");
      }else{
          outComm.append("      <script type=\"text/javascript\" src=\"").append(JS_PATH).append(
          "/ueditor/lang/en/en.js?_mc_res_version=").append(PlfStaticRes.EN_JS).append("\"></script>").append("\n");      
      }
      out.println(outComm.toString());
 %>
<script type="text/javascript"><%-- 公用新增JS页面 --%>
		var isQuery = false;
		var parentWindow;
		$(function(){
			if(top.$("#"+window.frameElement.name) != null && top.$("#"+window.frameElement.name).length > 0 && 
					top.$("#"+window.frameElement.name)[0].contentWindow != undefined){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			}
			
			//setPopScroll('.bd');
			
		});
		
		//是否保存并关闭
		var saveAndClose = true;
		function saveClose(self){
			if(saveAndClose == true){
				$(self).addClass('save-not-close');
				$(self).attr("title","<dict:lang value="开启保存并关闭窗口"/>");
				saveAndClose = false;
				$('#isCloseWin').attr('checked',false);
			}
			else if(saveAndClose == false){
				$(self).removeClass('save-not-close');
				$(self).attr("title","<dict:lang value="关闭保存并关闭窗口"/>");
				saveAndClose = true;
				$('#isCloseWin').attr('checked',true);
			}
		}
		
		//var parentWindow=top.$("#"+window.frameElement.name)[0].contentWindow;
		function add(thisObj){
		 
			isQuery = false;
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
			<%-- 让只读的select,checkbox,radio 设置成disable --%>
			$DisInput = $(":input[disabled='disabled'][class*='<%=ConstantsMc.IS_ADD_SUBMIT%>']");
			$DisInput.attr("disabled", false);<%-- //处理之前, 全部打开 --%> 
			if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
			 
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled",true);
			try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);<%-- //处理之后, 再次关闭 --%>
		}
		
		 //流程保存
		 function addFlow(thisObj){
                if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
                if(!valData()){
                    return ;
                }
                if(!val.valNullData()){
				    return ;
			    }
			
			    if(!val.valOjbsData()){
				    return ;
			    }
			    if(!val.valDataBaseSetData()){
                    return ;
                }
                var variables = [];                
       	        $(".input.isSubmit").each(function () {
       	           if(this.name.indexOf('paraMap1@0#')==0){
       	              var propertyMap= {};
                      propertyMap.name = this.name.replace('paraMap1@0#','');
                      propertyMap.value=this.value;
                      variables.push(propertyMap);
                   }
       	        });
       	        $("#_variables").val(JSON.stringify(variables)); 
       	        var res= _nextUser($('#_flowId').val(),$('#dept_position').val(),JSON.stringify(variables),thisObj,"1"); 
       	        if(!res){
       	          add(thisObj);
       	        }
            }
            
		 
    function _nextUser(processdeId,userDeptPositionId,variables,thisObj,flowType)
	{
	  var res=false;
	  $.ajax({
				type: "POST",
			    dataType: "json",
			    async:false,
			    url: "${path}comm/ProcessAction_next.ms",
			    data: {
			    	'paraMap.processdeId' : processdeId,
			    	'paraMap.userDeptPositionId' : userDeptPositionId,
			    	'paraMap.variables' : variables,
			    	'paraMap.flowType' : flowType
			    },
				success: function(data){
				 
				   if(data.ajaxMap.nextUser!= null&&data.ajaxMap.nextUser!='' )
				   {				   
				     res=true;
				     $("#_nextUser").val(data.ajaxMap.nextUser);     
				     var piframeId = window.frameElement.id;
	                 var url="${path}comm/ProcessAction_chooseUser.ms?paraMap.piframeId="+piframeId+"&paraMap.flowType="+flowType;
                     showPopWinFp(url, 550, 350,null,'<dict:lang value="人员选择" />','chooseUser');
				   }
				   
				   
				},
				error: function(msg){
						
					if(msg.readyState!=0){
     					util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
					}
				  }
				  });	
	      return res;
	    }
	
		/* 
		保存不关闭  
		backFun:成功回调函数 比如重置 resetForm
		isReload 重新加载查询列表刷新 true
		*/		
		function saveAdd(thisObj,backFun,isReload) {		  
			$DisInput = $(":input[disabled='disabled'][class*='<%=ConstantsMc.IS_ADD_SUBMIT%>']");
			$DisInput.attr("disabled", false);<%-- //处理之前, 全部打开 --%> 
			var formData;
			var iscontentType="application/x-www-form-urlencoded";
			var isprocessData=true;
			if(typeof FormData == "undefined"){
			     formData=$('#addForm').serialize();	   
			     
			}
            else{
             formData=new FormData($('#addForm')[0]); 
             isprocessData= false;
			 iscontentType= false;
           }            
             $.ajax({
					type : "POST",
					cache:false,					
					contentType: iscontentType,
			        processData: isprocessData, 
					url : "${path}buss/bussModel_saveAdd.ms",
					data : formData,
					async : false,
					error : function(request) {
						//utilsFp.alert("Connection error");
						utilsFp.confirmIcon(3,"","","", "Connection error","","260","145");
					},
					success : function(data) {
				 
					 //   msgPop(data.ajaxMap.msg);
					    //utilsFp.confirmIcon(2,"","","", data.ajaxMap.msg,"","260","145");
					    if(isReload==true){
					       parentWindow.query(thisObj);
					    }
						if(data.ajaxMap.isSuccess==true){
						   
						   if(typeof backFun=="function" ){
						      backFun();
						   }
						}						
						
					}
				});
        
				$DisInput.attr("disabled", true);<%-- //处理之后, 再次关闭 --%>
	}
			
		function saveForm(thisObj,formId){
			isQuery = false;
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
			<%-- 让只读的select,checkbox,radio 设置成disable --%>
			$DisInput = $(":input[disabled='disabled'][class*='<%=ConstantsMc.IS_ADD_SUBMIT%>']");
			$DisInput.attr("disabled", false);<%-- //处理之前, 全部打开 --%> 
			if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);<%-- //处理之后, 再次关闭 --%>
		}
		
		
		function alertInfo(msg){
			isQuery = false;
			$("#saveBtn").prop("disabled",false);
			//utilsFp.alert(msg);
			utilsFp.confirmIcon(3,"","","", msg,"","280","");
		}
	
		function reloadPg(msg,title,width,height,time){
			isQuery = false;
			//closeWindow();
			var iframeId = "<c:out value='${iframeId}' />";
			var isTab = "<c:out value='${isTab}' />";
			if(isTab == null || isTab == "" || iframeId == null || iframeId == undefined || iframeId == ""){
				parentWindow.reloadPg(msg,title,width,height,time);
			}else if(top.$("#"+iframeId)[0].contentWindow){
				<%--  document.frames("<c:out value='${iframeId}' />").reloadPg(msg);
				//top.addTab("","",iframeId);
				--%>
				top.switchTabWithoutReload(iframeId.replace("iframe",""));
				top.$("#"+iframeId)[0].contentWindow.reloadPg(msg,title,width,height,time);
				<%-- 
				/*var iframeSeq = parentWindow.name.replace("iframe","");
				top.closeTab(iframeSeq);*/
				--%>
				closeWindow();
			}else{
				closeWindow();
			}
			
		}
		<%-- 追加行数据 --%>
		var formSplit = "<s:property value='%{@com.more.fw.core.bd.bcm@DATA_LEVEL_SPLIT}' escape='false' />";
		var dataSplit = "<s:property value='%{@com.more.fw.core.bd.bcm@DATA_SPLIT}' escape='false' />";
		var FORM_PAGE_DATA_COUNT_FLAG = "<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FORM_PAGE_DATA_COUNT_FLAG}' escape='false' />";
		var curRowSeq = 1;
		function getCurRow()
		{
			return curRowSeq;
		}
		function addRow1xxx(tableId,formIndex){
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var row = $($('#_addTableTr_'+tableId).val());
			row[0].id= "addTableTr"+curRowSeq+"_"+tableId;
			row.find("td").each(function(seq) {
				if(seq==0){
					$(this).find("span").text(curRowSeq+1);
				}
				$(this).find(".isSubmit").each(function(seq) {
					var oldName = $(this).attr("name");
					var editName = $(this).attr("editName");
					if (typeof(oldName) != "undefined"){
						var relName = oldName.substring(oldName.indexOf(dataSplit)+dataSplit.length,oldName.length);<%-- 取得字段名称 --%>
						$(this).attr("name","paraMap"+formIndex+formSplit+(curRowSeq)+dataSplit+relName);
					}
					if(typeof(editName) != "undefined"){
						var relName = editName.substring(editName.indexOf(dataSplit)+dataSplit.length,editName.length);<%-- 取得字段名称 --%>
						$(this).attr("editName","paraMap"+formIndex+formSplit+(curRowSeq)+dataSplit+relName);
					}
			});
			//alert($(this).html());
			});
			if(row_count % 2 != 0){
				row.addClass("tr1");//<%-- 隔行着色 --%>
			}
			addTtable.append(row);
			var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
			dataCountObj.val(row_count+ 1);
			curRowSeq++;
		}
		
		
		var FORM_COL_ID_D=null;
		function addRow(tableId,formIndex){
			util.showLoading();
			var url ="${path}buss/bussModel_ajaxAddSubComm.ms?FUNC_CODE=F285";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				//curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq},
				success: function(data){
					util.closeLoading();
					var row = $(data.ajaxString);
					if(row_count % 2 != 0){
						row.addClass("tr1");//<%-- 隔行着色 --%>
					}
					_toClickColor(row);//<%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq++;
					setChosen();//设置下拉框样式
					$(".glxb-table .chosen-container").css("width","100%");
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						utilsFp.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		function delRow(thisObj){
			//alert($(thisObj).parent().parent().html());
			$(thisObj).parent().parent().remove();
		}
		
		function delEditRow(thisObj,id,formId){
			var paramObj =new Object;
			paramObj.obj=thisObj;
			paramObj.id=id;
			paramObj.formId=formId;
	  	utilsFp.confirm(_delEditRow,"",paramObj);
	  }
		
		function _delEditRow(paramObj){
			var url ="${path}buss/bussModel_ajaxDelEditRow.ms";
			util.showLoading();
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.formId':paramObj.formId,'paraMap.ID':paramObj.id},
				success: function(data){
					util.closeLoading();
					if(null != data && data.ajaxString == "1"){
						delRow(paramObj.obj);
					}else{
						//utilsFp.alert("删除失败");
						utilsFp.confirmIcon(3,"","","", "<dict:lang value="删除失败" />","","260","145");
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						utilsFp.alert("error:"+errorThrown);
					}
					paramObj.obj.disabled = false;
					paramObj.obj.value = oldValue;
			   }
			});
			
		}
		
		function addRowPop(tableId,formIndex,colParams,datas,type,viewid,hidecol){

			util.showLoading();
			var url ="${path}buss/bussModel_ajaxAddSubCommPop.ms?FUNC_CODE=F285";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				//curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();
		  jQuery.ajax({
				type: "POST",
				async:false,
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.colParams':colParams,'paraMap.type':type,'paraMap.viewid':viewid,'paraMap.hidecol':hidecol},
				success: function(data){
					util.closeLoading();
					//console.log("data.ajaxString:" + data.ajaxString);
					var row = $(data.ajaxString);
					if(row_count % 2 != 0){
						row.addClass("tr1");//<%-- 隔行着色 --%>
					}
					_toClickColor(row);//<%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					
					dataCountObj.val(row_count+ 1);
					curRowSeq++;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						utilsFp.alert("error:"+errorThrown);
					}
			   }
			});
			return "paraMap"+formIndex+'@'+ (curRowSeq - 1);
		}
		
		function addEditRowPop(tableId,formIndex,colParams,viewid,data){
			util.showLoading();
			var url ="${path}buss/bussModel_ajaxEditSubCommPop.ms?FUNC_CODE=F285";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				//curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.colParams':colParams,'paraMap.viewid':viewid,'paraMap.data':data},
				success: function(data){
					util.closeLoading();
					var row = $(data.ajaxString);
					if(row_count % 2 != 0){
						row.addClass("tr1");//<%-- 隔行着色 --%>
					}
					_toClickColor(row);//<%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq++;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						utilsFp.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		//单击行选中
		function _selectExtend(e,thisObj,subformids){	
			var target=e.target||e.srcElement;     
		    if(target.type!='checkbox'){//非点击复选框单选
		           var trs=$(thisObj).parent('tbody').find('tr');  
		            $.each(trs,function(index,item){
		                 $(item).find('td:eq(0) input').prop('checked',false);
		             });
		            $(thisObj).find('td:eq(0) input').prop('checked',true);
		            
		     }
		    if(subformids=='null'||subformids==''||subformids==null||subformids==undefined){
		       return false;
		    }
		    var subformidArray=subformids.split(',');
		    for(var k=0;k<subformidArray.length;k++){		    
		        var subformid=subformidArray[k];		        
		        
                var colNoRel=$("input[name='COL_NO"+subformid+"']").val();            
                var relValue=$(thisObj).find('td').find(":input[name^='paraMap'][name$='"+colNoRel+"']").val();            
                var colNo=$("input[name='COL_NO_D"+subformid+"']").val();            
		        $("#addTable_"+subformid+" tbody tr td").find(":input[name^='paraMap'][name$='"+colNo+"']").each(function(){
                           var relV=$(this).val();                          
                           if(relV!=relValue){
                              $(this).parent().parent().hide();
                           }
                           else if(relV==relValue){ 
                              $(this).parent().parent().show();
                           }
                 });
		      }
		}
		
		//视图扩展新增追加行
		function _addRowExtend(tableId,formIndex,getSelectedCountExtend,ptableId,subformid,pCols,selCols){
		    var flag=false;
		    if(typeof getSelectedCountExtend=="function" ){
				var selCount=getSelectedCountExtend(ptableId,tableId,1);
				if(selCount==0||selCount>1){
				  return false;
				}
				
				$("input[name='checkbox"+ptableId+"']:checked").each(function() {
                       var ptrIndex = $(this).parents("tr").index();  
                       
                       var colNoUp=$("input[name='COL_NO"+tableId+"']").val();
                       var selectValue=getColObjBySeq(ptableId,ptrIndex,colNoUp);
                       if(selectValue==null){
                         flag=true;
                         utilsFp.confirmIcon(3,"","","", "<dict:lang value="关联字段未配置显示或隐藏" />","","360","145");
                         return;
                       }
                       
                       var colNo=$("input[name='COL_NO_D"+tableId+"']").val();
                       $("#addTable_"+tableId+" tbody tr td").find(":input[name^='paraMap'][name$='"+colNo+"']").each(function(){
                           var relV=$(this).val();
                           if(relV!=selectValue[0].value){
                           $(this).parent().parent().hide();
                           }
                           else if(relV==selectValue[0].value){
                           $(this).parent().parent().show();
                           }
                       });
                     
                });
				
			}
	        if(flag) return;
			util.showLoading();
			var url ="${path}buss/bussModel_ajaxAddRowExtend.ms?FUNC_CODE=F285";
			
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				//curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    async:false,
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.subformid':subformid,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq},
				success: function(data){
					util.closeLoading();
	
					var row = $(data.ajaxString);
					if(row_count % 2 != 0){
						row.addClass("tr1");//<%-- 隔行着色 --%>
					}
					_toClickColor(row);//<%-- 行点击着色 --%>
					addTtable.append(row);
					if(typeof getSelectedCountExtend=="function" ){
				       getSelectedCountExtend(ptableId,tableId,2,pCols,selCols);
				    }
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq++;
					setChosen();//设置下拉框样式
					$(".glxb-table .chosen-container").css("width","100%");
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						utilsFp.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		//视图扩展新增追加行
		function _addRowExtendFlag(tableId,formIndex,rowCount){		  
			util.showLoading();
			var url ="${path}buss/bussModel_ajaxAddRowExtend.ms?FUNC_CODE=F285";
			
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    async:false,
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.rowCount':rowCount},
				success: function(data){
					util.closeLoading();
	
					var row = $(data.ajaxString);
					addTtable.append(row);
					
				     <%-- if(row_count % 2 != 0){
						row.addClass("tr1");//隔行着色
					  } --%>
					 _toClickColor(row);//<%-- 行点击着色 --%>
					  //setChosen();//设置下拉框样式
					  //$(".glxb-table .chosen-container").css("width","100%");
					
					

					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ rowCount);
					curRowSeq+=Number(rowCount);
					
					
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						utilsFp.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		//全选
		function _selectAllExtend(thisObj,formId){
    		var curCheck = $(thisObj).prop("checked");
		    $("#addTable_"+formId).find("tbody tr").each(function(seq) {
		    if($(this).is(':hidden')) return true;
			var listTableCheck = $(this).find(":checkbox");
			listTableCheck.prop("checked",curCheck);
		    if(curCheck){
		    	listTableCheck.parents('tr').addClass('selected');
		    }else{
		    	listTableCheck.parents('tr').removeClass('selected');
		    }
		   });
	    }
		//添加校验，回填
		function getSelectedCountExtend(ptableId,tableId,type,pCols,selCols){
		    var selCount = 0;
		    if(type==1){
		        $("input[name='checkbox"+ptableId+"']:checked").each(function() { // 遍历选中的checkbox
                selCount++;
              });
              
              if(selCount==0||selCount>1){
                 utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择一条记录" />","","260","145");
                 
              }
		    }
		    else if(type==2){//选择回填
		       $("input[name='checkbox"+ptableId+"']:checked").each(function() {
                       var ptrIndex = $(this).parents("tr").index();  
                       var colNoUp=$("input[name='COL_NO"+tableId+"']").val();
                       var selectValue=getColObjBySeq(ptableId,ptrIndex,colNoUp);
                       if(selectValue==null){
                         
                          return true;
                       }
                       
                       var colNo=$("input[name='COL_NO_D"+tableId+"']").val();
                       $("#paraMap"+curRowSeq+"_"+colNo).val(selectValue[0].value);
                       
                       if(pCols==undefined||pCols==''||pCols==null||pCols=='null'){
		                   return true;
		               }
                       var pColsArray=pCols.split(',');
                       var selColsArray=selCols.split(',');
		               for(var k=0;k<pColsArray.length;k++){
		                  selectValue=getColObjBySeq(ptableId,ptrIndex,pColsArray[k]);//取上层，需要回填的
                          if(selectValue==null){
                            return true;
                          }
                          $("#paraMap"+curRowSeq+"_"+selColsArray[k]).val(selectValue[0].value);//本层 字段赋值
		               }	
                       
                }); 
		    }
			
            return selCount;
		}
		
		function _delRowExtend(tableId,subformids){
		  if($("input[name='checkbox"+tableId+"']:checked").length==0){
		     utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />","","260","145");
		     return;
		  }
		  var obj = new Object();
		  obj.tableId = tableId;
		  obj.subformids = subformids;
		  utilsFp.confirmIcon(1,"","_delRowExtendConfirm",obj, "<dict:lang value="确认删除？" />","1","","");
		}
		
		//删除本身及子表单
		function _delRowExtendConfirm(obj){
		    var tableId=obj.tableId;
		    var subformids=obj.subformids;
		    
			$("input[name='checkbox"+tableId+"']:checked").each(function() { // 遍历选中的checkbox
                var trIndex = $(this).parents("tr").index();  
                $("#addTable_"+tableId).find("tr:eq("+trIndex+")").remove();
                if(subformids=='null'||subformids==''||subformids==null||subformids==undefined){
		           return true;
		        }
		        var subformidArray=subformids.split(',');
		        for(var k=0;k<subformidArray.length;k++){		  
		           var subformid=subformidArray[k];
		           var colNoRel=$("input[name='COL_NO"+subformid+"']").val();
            
                   var relValue=$(this).parents("tr").find('td').find(":input[name^='paraMap'][name$='"+colNoRel+"']").val();
            
                   var colNo=$("input[name='COL_NO_D"+subformid+"']").val();
                   $("#addTable_"+subformid+" tbody tr td").find(":input[name^='paraMap'][name$='"+colNo+"']").each(function(){
                           var relV=$(this).val();
                           if(relV==relValue){
                              $(this).parent().parent().remove();
                           }
                  });
		        }
              });
              
		}
		
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			if(relColVal==''||relColVal==null||relColVal==undefined||relColVal=='null'){
			     var colNo=$("input[name='COL_NO"+tableId+"']").val();
			     if(colNo=='ID') relColVal=$("input[type='hidden'][name='dataId']").val();
			     else{
			        relColVal=$("input[name='"+colNo+"']").val();
			     }
			}
			var url ="${path}buss/bussModel_editExtendSubDataAx.ms";
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
		    async:false,
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					/* if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					} */
					var row = $(data.ajaxPage.tableData);
					
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var relV="";
					var colNo=$("input[name='COL_NO_D"+tableId+"']").val();
					$("#addTable_"+tableId+" tbody tr td").find(":input[name^='paraMap'][name$='"+colNo+"']").each(function(k){
                           if(k>0) relV+=";";
                           relV+=$(this).val();
                           
                    });
                    if(relV=='') relV=relColVal;
                    var input=document.createElement("input");
                    input.type="hidden";
                    input.name=tableId+'_'+colNo;
                    input.value=relV;
                    document.getElementById('editForm').appendChild(input);
					
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
					setChosen();//设置下拉框样式
					$(".glxb-table .chosen-container").css("width","100%");
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
		
		<%-- 根据行ID号取得字段对象 --%>
		function getColObj(trId,colName){
			var res =null;
			$("#"+trId).find(":input[name^='paraMap'][name$='"+colName+"']").each(function(){
	　　　　		res = $(this);
				return false;
	　　		});
			return res;
		}
		
		<%-- 根据选中的行取得字段对象 --%>
		function getSelColObj(colName){
			if(null!=_oldSselectedTr){
				return getColObj(_oldSselectedTr.attr("id"),colName);
			}else{
				return null;
			}
		}
		<%-- 取得主表单字段对象 --%>
		function getMColObj(colName){
			var res =null;
		<%-- 如果表单的表格对象有变动则这里需要修改 <table class="add_table"> --%>
			$("table.add_table").find(":input[name^='paraMap0@0#'][name$='"+colName+"']").each(function(){
				res = $(this);
				return false;
		　　});
			return res;
		}

		<%-- 根据行序号取得字段对象 --%>
		<%-- tableId:表ID，seq：行序号，colName:字段名称 --%>
		function getColObjBySeq(tableId,seq,colName){
			var res =null;
			$($("#addTable_"+tableId+" tbody tr").get(seq)).find(":input[name^='paraMap'][name$='"+colName+"']").each(function(){
	            res = $(this);
				return false;
	        });
			return res;
		}

		<%-- 取得列表单元格对象 --%>
		function getListColObj(thisObj){
			$(thisObj).html($(thisObj).html()+"<span>"+$(thisObj).val()+"</span>");
			return $(thisObj).find("span");
		}
		
		<%-- 根据行号列号取得单元格对象 --%>
		<%-- tableId:表ID，seqRow：行序号，seqCol:列号 --%>
		function getListColObjBySeq(tableId,seqRow,seqCol){
			return $(tableId);
		}		
		
		function closeWindow(){
			if(parent.$(".dialog-close").length > 0){
				parent.$(".dialog-close").click();				
			}else if(parentWindow != null){
				var iframeSeq = parentWindow.name.replace("iframe","");
				parent.closeTab(iframeSeq);
			}
			
		}
		
		/***解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题
		参数：defaultVal 默认值
		****/
		function emptyValToHide(defaultVal){
			//解决附件清空时，无法传到后台的问题
			if($("input[type='file']").prop("name") != undefined){
				var fileInput = $("input[type='file']");
				for(var j = 0; j < fileInput.length; j++){
					if(($("input[type='file'][name='"+fileInput[j].name+"']").val() == null ||
							$("input[type='file'][name='"+fileInput[j].name+"']").val() == "") && 
							fileMap.get(fileInput[j].name) != null){
						$("input[type='file'][name='"+fileInput[j].name+"']").remove();
						$("#editForm").append(fileMap.get(fileInput[j].name));
					}
				}
			}

			//解决checkbox清空时，无法传到后台的问题			
			if($("input[type='checkbox']") != undefined && $("input[type='checkbox']").length > 0){
				var chkObj = $("input[type='checkbox']");
				var checkBoxName = new Map();
				var tempName = "";				
				//循环第一次，判断有几组checkbox
				for(var i = 0 ; i <　chkObj.length; i ++){
					if(tempName.indexOf(chkObj[i].name) == -1){
						checkBoxName.put(chkObj[i].name,chkObj[i].name);
					}
					tempName += chkObj[i].name+";";
				}
				
				if(!checkBoxName.isEmpty()){
					var chkInpHtml = "";
					//根据checkbox名称，查找checkbox
					checkBoxName.each(function (key, value, index) {
						//s += index + ":" + key + "=" + value + "\n";
						var ifChecked = false;
						var chkName = "";
						//判断该组checkbox是否全部未选中，如果是，则默认在form后面添加个隐藏文本域提交
						$("input[type='checkbox'][name='"+key+"']").each(function(){
							if(this.checked){
								ifChecked = true;
								return false;
							}
							chkName = this.name;
						});
						if(!ifChecked && $("input[type='hidden'][name='"+chkName+"']").length == 0){
							if(defaultVal == "" || defaultVal == null || defaultVal == undefined ){
								chkInpHtml += "<input type='hidden' id='"+chkName+"' name='"+chkName+"' value=''/>";
							}else{
								chkInpHtml += "<input type='hidden' id='"+chkName+"' name='"+chkName+"' value='"+defaultVal+"'/>";
							}
							
						}
					});
					
					$("#editForm").append(chkInpHtml);				
				}
			}			
		}
        
		//附件onchange触发事件
		function _changeFile(obj){
			$(obj).siblings().remove();
			$(obj).prop("name",$(obj).prop("name").replace("@SHOW",""));
			
			file_size_valid(obj);//验证上传附件大小
		}
		
		/**删除附件
		*参数:a 标签ID，文件名，文件路径，输入框ID，输入框名称
		**/
		function _delFile(aId,fileName,filePath,inputId,inputName){
			var obj = new Object();
			obj.fileName = fileName;
			obj.filePath = filePath;
			obj.inputId = inputId;
			//obj.inputName = inputName;
			obj.inputName = inputId;
			obj.aId = aId;
			
			//util.confirm(delFileConFirm,"<dict:lang value="删除之后不可恢复，确定删除吗？" />",obj);
			utilsFp.confirmIcon(1,"","_delFileConFirm",obj, "<dict:lang value="删除之后不可恢复，确定删除吗？" />","1","","");
		}
		
		function _delFileimg(aId,fileName,filePath,inputId,inputName){
			var obj = new Object();
			obj.fileName = fileName;
			obj.filePath = filePath;
			obj.inputId = inputId;
			obj.inputName = inputName;
			//obj.inputName = inputId;
			obj.aId = aId;
			//util.confirm(delFileConFirm,"<dict:lang value="删除之后不可恢复，确定删除吗？" />",obj);
			utilsFp.confirmIcon(1,"","_delFileConFirm",obj, "<dict:lang value="删除之后不可恢复，确定删除吗？" />","1","","");
		}
		
		function _delFileConFirm(obj){
			var formId=$("input[name='formId']").val();
			var dataId=$("input[name='dataId']").val();
		
			if(obj == "" || obj == null || obj == undefined){
				return;
			}
			util.showLoading();
			var url ="${path}buss/bussModel_delFileAx.ms";
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data:{'paraMap.FILENAME':obj.fileName,'paraMap.FILEPATH':obj.filePath,'paraMap.INPUTNAME':obj.inputName,'paraMap.FORMID':formId,'paraMap.DATAID':dataId},
					success: function(data){
						util.closeLoading();
						if(data.ajaxMap != null){
							if(data.ajaxMap.msg == "1"){
								//util.alert("<dict:lang value="删除成功！" />");
								utilsFp.confirmIcon(2,"","","", "<dict:lang value="删除成功！" />","","260","");
								$("#"+obj.aId).parent().find("input").each(function(idx){
									this.value = "";
								});
								$("#"+obj.aId).prev("a").remove();
								
								//$("#"+obj.aId).remove();
								$("#"+obj.aId).css('display','none');
								var tempz=obj.aId.replace('_a','').replace('_','.');
								if($("input[name='"+tempz+"']")!=null){
									$("input[name='"+tempz+"']").val('');
								}
								
								var img_obj= document.getElementById('preview'+obj.inputId);
								if(img_obj!=null){
									img_obj.src='plf/page/fp/img/MoreWis_s.png';
								}
								
								var file_field_map=data.ajaxMap.file_field_map;
								if(file_field_map.file_size!=null && file_field_map.file_size!=''){
									var file_size_obj=document.getElementById('paraMapObj_'+file_field_map.file_size)
									if(file_size_obj!=null){
										file_size_obj.value='';
									}
									
								}
								if(file_field_map.file_name!=null && file_field_map.file_name!=''){
									var file_name_obj=document.getElementById('paraMapObj_'+file_field_map.file_name)
									if(file_name_obj!=null){
										file_name_obj.value='';
									}
									
								}
								if(file_field_map.file_path!=null && file_field_map.file_path!=''){
									var file_path_obj=document.getElementById('paraMapObj_'+file_field_map.file_path)
									if(file_path_obj!=null){
										file_path_obj.value='';
									}
									
								}
								
								if(file_field_map.file_stream!=null && file_field_map.file_stream!=''){
									var file_stream_obj=document.getElementById('paraMapObj_'+file_field_map.file_stream)
									if(file_stream_obj!=null){
										file_stream_obj.value='';
									}
									
								}
								
								if(obj.inputName!=null && obj.inputName!=''){
								    //$("input[type='file'][name='"+obj.inputName+"']").remove();
									var hidden_f=$("input[type='hidden'][name='"+obj.inputName+"_FILEUPLODA_HIDDEN']");
									if(hidden_f!=null){
										hidden_f.val('');
									}
									
								}
								
								/*$("#"+obj.aId).siblings().each(function(idx){
										$(this).remove();
								});*/
								
								/*$("#"+obj.aId).parent().find("input").each(function(idx){
									//this.value = "";
									$(this).remove();
								});*/

								/*
								fileMap.put(obj.inputName,$("#"+obj.aId).parent().find("input"));
								$("#"+obj.aId).parent().html("<input type='file' name='"+obj.inputName+"' id='"+obj.inputId+"'/>");*/
							}else{
								//util.alert("error:"+data.ajaxMap.msg);
								utilsFp.confirmIcon(3,"","","", ""+data.ajaxMap.msg+"","","","");
							}
						}else{
							utilsFp.confirmIcon(3,"","","", "<dict:lang value="服务器无响应，请稍候再试！" />","","","");
							//util.alert("<dict:lang value="服务器无响应，请稍候再试！" />");
						}
					},
					error: function(XMLHttpRequest, textStatus, errorThrown){
						util.closeLoading();
						var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
						if (null != sessionstatus && sessionstatus == "noAuthority") {
						}else{
							//util.alert("error:"+errorThrown);
							utilsFp.confirmIcon(3,"","","", "error:"+errorThrown+"","","","");
						}
				   }
			});
		}        
        
     //图片上传控件预览
	function _setImagePreview(photoImgID,previewID,upFileID){
			//显示删除图片按钮
			//新增
			var del_img_id=photoImgID.replace("photoImg","").replace("$","");
			if(photoImgID.indexOf('_a')==-1){
				del_img_id=del_img_id+'_a';
			}
			var del_img_obj=document.getElementById(del_img_id);
			if(del_img_id!=null && del_img_id!='' && del_img_obj!=null){
				del_img_obj.style.display = '';
			}
			//编辑
			var tmp='upFile'+del_img_id;
			tmp=tmp.replace("_a","");
			if(document.getElementById(tmp)!=null){
				var tname=$('#'+tmp).attr('name');
				if(tname!=null){
					var temp=tname.replace(".","_")+"_a";
					if(temp!=null){
						if(document.getElementById(temp)!=null){
							document.getElementById(temp).style.display = '';
						}
						
					}
					
				}
				
			}
	
			var hhotoObj = document.getElementById(upFileID);
			var imgObjPreview = document.getElementById(previewID);
			if (hhotoObj.files && hhotoObj.files[0]) {
				//火狐下，直接設img属性
				imgObjPreview.style.display = 'block';
				//imgObjPreview.style.width = '120px';
				//imgObjPreview.style.height = '60px';
				imgObjPreview.src = window.URL.createObjectURL(hhotoObj.files[0]);
			}else{
				//IE下，使用滤镜
				hhotoObj.select();
				var imgSrc = document.selection.createRange().text;
				document.selection.empty();
				var imgId = document.getElementById(photoImgID);
				//imgId.style.width = '120px';
				//imgId.style.height = '60px';
				try {
					imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
					imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				} catch (e) {
					utilsFp.confirmIcon(3,"","","", "<dict:lang value='图片格式不支持，请重新选择(.png后缀格式的图片)' />",0,"300","");
					return false;
				}
				imgObjPreview.style.display = 'none';
				//document.selection.empty();
			}
			return true;
		}
		<%--
		函数名称 ：swControl 开关按钮控制
		新建者：cjd
		新建时间:2017-12-13 15:22
		修改者:cjd
		修改时间:2017-12-13 15:22
		参数：
		imgObj,<img>
		swObj,隐藏对象
		oneVal,第一个值也叫默认值对象值
		twoVal,第二个值
		实例
		  <img src='' onclick="swControl(this,$("#sex"),'0','1')">
		 引用地方：1、  com.more.fw.core.cont.formui.StatusUi
		--%>
		function swControl(imgObj,swObj,oneVal,twoVal){
		    var imgOn="${path}plf/page/fp/img/ico-state-h.png?_mc_res_version=<%=PlfStaticRes.ICO_STATE_H_PNG %>";  
		    var imgOff="${path}plf/page/fp/img/ico-state.png?_mc_res_version=<%=PlfStaticRes.ICO_STATE_PNG %>";  
		    if($(swObj).val()==oneVal){ 
		       $(imgObj).attr("src",imgOff);
		       $(swObj).val(twoVal );   
		    } 
		   else {  
		       $(imgObj).attr("src",imgOn);
		       $(swObj).val(oneVal );   
		   }  
		}//function swControl(){
		
		function swSaveMarkControl(imgObj,swObj,oneVal,twoVal)
		{
		  var imgOn="${path}plf/page/fp/img/ico-state-h.png?_mc_res_version=<%=PlfStaticRes.ICO_STATE_H_PNG %>";  
		    var imgOff="${path}plf/page/fp/img/ico-state.png?_mc_res_version=<%=PlfStaticRes.ICO_STATE_PNG %>";  
		    if($(swObj).val()==oneVal) 
		       $(imgObj).attr("src",imgOn);  
		   else  
		       $(imgObj).attr("src",imgOff);  
		}
		
		//验证上传附件大小
		function file_size_valid(obj){
			if(obj.files[0]!=null){
				var fileSize = obj.files[0].size / 1024; 
		        if(fileSize>(1024*500)){
		        	obj.value='';
		        	utilsFp.confirmIcon(3,"","","", "上传文件不能超过500M","","300","145");
		        }
		        
			}
	        
	    }
	    
	    function _delFileimg_reset(aId,fileName,filePath,inputId,inputName){
			document.getElementById('upFile$'+aId).value='';
			document.getElementById('preview$'+aId).src='plf/page/fp/img/MoreWis_s.png';
			document.getElementById(aId+'_a').style.display = 'none';
			
		}
		
		//帮助
		function help_mc(exeid){
			//alert(exeid);
			top.window.open("${path}/sys/BussModelAction_showHelp.ms?paraMap.VIEW_ID="+exeid,"_blank");
			
		}
		
</script>