 <%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script>
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
	</script>
	<script type="text/javascript">
		var addTableTrMap;
	</script>
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			       
			        <button type="button" onclick="fixUrl()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
				
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="${formId}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="9e447f80074441dcb0541aa75341e0b5" type="add" />
   <div class="mod">		
   <div class="mod-hd">		
   <h3 class="tit"><dict:lang value="保养信息"/></h3>	
   </div>
	 <div class="mod-hd" style="height:160px;border-bottom: none;z-index: 1;">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9e447f80074441dcb0541aa75341e0b5" />
	<input type="hidden" name="9e447f80074441dcb0541aa75341e0b5" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="ids" id="ids"/>
	<input type="hidden" name="sns" id="sns"/>  
	<input type="hidden" name="codes" id="codes"/>  
	<input type="hidden" name="names" id="names"/> 
	<input type="hidden" name="types" id="types"/> 
	<input type="hidden" name="cfmId" id="cfmId" value="0"/>
	
		<s:set name="_$viewId" value="'32883234cc4f41fba0cfe46899b52012'" />
		<s:set name="_$formId_1" value="'9e447f80074441dcb0541aa75341e0b5'" />
		<s:set name="_$type" value="'add'" />
		
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_TYPE" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_TYPE}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_REPORTER" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_REPORTER}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_MT_MAN" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_MT_MAN}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_AUDIT" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_AUDIT}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" ><bu:ui colNo="CFM_EC_CODE" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_EC_CODE}" formIndex="1" /></bu:td>
		    <td>&nbsp;</td>
			<td class="name-six" />不良描述</td>
			<bu:td cssClass="dec-self" colNo="CFM_DESC" formId="9e447f80074441dcb0541aa75341e0b5" ><input type="text" id="CFM_DESC" name="CFM_DESC" class=" input isSubmit "></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" /></td>
			<bu:td cssClass="dec-self" colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" colspan="8"><bu:ui colNo="CFM_DEFECT_REMARK" formId="9e447f80074441dcb0541aa75341e0b5" value="%{CFM_DEFECT_REMARK}" formIndex="1" style="height:80px;"/></bu:td>
		</tr>
	</table>
	</div>
	
	<div style="width:100%;">
	 <div class="mod-hd">		
     <h3 class="tit"><dict:lang value="制具信息"/></h3>	
     </div>
     <div class="extend-btn" style="float:right;">
			<button type="button" id="front_add" onclick="popWorkDiv('backShadow','zjalert')" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" id="front_delete" onclick="delFrontList();" style="padding:0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>     		        
   	</div>	
	 </div>
	  <div class="mod-hd" style="height:150px;border-bottom: none;clear:both;overflow: auto;"> 
	   <table  class="dlist-table table-line " style="display:block;" target="secondTable" >
		
		<thead>
		<tr class="thcolor">
			<th class="datagrid-cell" style="width:2%; text-align:center;"><span></span></th>
			<th class="datagrid-cell" style="width:3%; text-align:center"><span><input type="checkbox" id="selectAll2" onclick="select_All()" style="cursor: pointer;" title="全选"></span></th>
			<th class="datagrid-cell" style="width:5%"><dict:lang value="制具SN"/> </th>
			<th class="datagrid-cell" style="width:5%"><dict:lang value="制具类型"/></th>
			<th class="datagrid-cell" style="width:5%"><dict:lang value="制具料号"/></th>
			<th class="datagrid-cell" style="width:5%"><dict:lang value="制具名称"/></th>
			<th class="datagrid-cell" style="width:10%"><dict:lang value="最后保养时间"/></th>		
		</tr>
		</thead>
		<tbody id="showZJFront">
		</tbody>
		</table>
		
	 
		<div class="" id="backShadow"  style="position: absolute; top: 0px; left: 3px; width: 965px; height: 500px; z-index: 3099;display: none;background-color: white;">
		 <div style="display: block;" >
			<div class="dialog dialog-s1" id="addRole" style="width:965px;display:block;margin-left:-482px;margin-top:-100px;">
			<div class="dialog-hd">		            
				<h3 class="tit">选择制具</h3>
			</div>
			</div>
		</div>
			
			<div class="optn" style="top:40px;">
				        <button type="button" onclick="choseZjList('backShadow','zjalert')"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
				        <button type="button" onclick="closeAlert('backShadow','zjalert');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
				        <button type="button" onclick="getZjList('formId1')"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
		    </div>
		    	   
		    	<div id="zjalert" style="z-index:9999;margin-top: 90px;">
				 制具SN <input type="text"  class="dec-self input" id="zj_sn" name="zj_sn"/> 
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;制具类型 
				 <select class="dec-self input" id="zj_type" name="zj_type">
				     <option value="0">--请选择--</option>	
				     <option value="2">钢网</option>	
				     <option value="3">刮刀</option>	
				 </select>
				
				<div>
					   <table  class="dlist-table table-line "  target="secondTable" >
				
								<thead>
								<tr class="thcolor">
									<th class="datagrid-cell" style="width:2%; text-align:center;"><span></span></th>
									<th class="datagrid-cell" style="width:3%; text-align:center"><span><input type="checkbox" id="selectAll1" onclick="selectAll()" style="cursor: pointer;" title="全选"></span></th>
									<th class="datagrid-cell" style="width:5%"><dict:lang value="制具SN"/> </th>
									<th class="datagrid-cell" style="width:5%"><dict:lang value="制具类型"/></th>
									<th class="datagrid-cell" style="width:5%"><dict:lang value="制具料号"/></th>
									<th class="datagrid-cell" style="width:5%"><dict:lang value="制具名称"/></th>
									<th class="datagrid-cell" style="width:10%"><dict:lang value="最后保养时间"/></th>		
								</tr>
								</thead>
								<tbody id="zjTbody">
								</tbody>
						</table>
				</div>
			 
			    <div style="background-color: white;">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=getZjList&formId=formId1&showLoading=0" />
				</div>
			     
			     
				</div>
		    </div>
	    </div>
 
		</div>
	
	
	</div>
			<bu:jsVal formId="9e447f80074441dcb0541aa75341e0b5" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
		<bu:submit viewId="32883234cc4f41fba0cfe46899b52012" />
		<bu:script viewId="32883234cc4f41fba0cfe46899b52012" />
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		
	
		
		if('${dataList[0].CFM_FIX_SN}'){
		
		
		$("#paraMap1_CFM_REPORTER_SHOW").val('${dataList[1].cfmReporterShow}');
		
		
		
		$("#paraMap1_CFM_TYPE").val('${dataList[0].CFM_TYPE}');
		$("#paraMap1_CFM_TYPE").trigger("chosen:updated");
		
		
		
		$("#paraMap1_CFM_REPORTER").val('${dataList[0].CFM_REPORTER}'); 
		$("#paraMap1_CFM_DEFECT_REMARK").val('${dataList[0].CFM_DEFECT_REMARK}');
        $('#paraMap1_CFM_MT_MAN').val('${dataList[0].CFM_MT_MAN}');
        $('#paraMap1_CFM_AUDIT').val('${dataList[0].CFM_AUDIT}');
        $('#cfmId').val('${dataList[0].ID}');
         
	     $("#showZJFront").append("<tr class='showZJFront' id='' name=''></tr>");
	     $("#showZJFront tr:last").append("<td style='width:2%; text-align:center;'><span>1</span></td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:3%; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_FIX_SN}'/> </td>");//
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_TYPE}'/> </td>");
	     $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_CODE}'/> </td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_NAME}'/> </td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:10%; text-align:center;'><dict:lang value='${dataList[0].CFM_MT_TIME}'/> </td>");
		 $("#front_add").attr("disabled", true); 
         $("#front_delete").attr("disabled", true); 
		
		}else{
			$("#front_add").attr("disabled", false); 
            $("#front_delete").attr("disabled", false); 
		}
		
		
	          $('#paraMap1_CFM_EC_CODE').attr("disabled","disabled");   
              $('#CFM_DESC').attr("readonly","readonly"); 
              $('#CFM_DESC').addClass("readonly");
              $("#paraMap1_CFM_EC_CODE").trigger("chosen:updated");
	
          
         
         	
       
       
         
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	 	function popWorkDiv(showId,backId){
	 	$("#"+showId).show(); 
	 	$("#"+backId).show();
	 	getZjList(paginationImpl);
		}
	 	
	 	function closeAlert(showId,backId){
	 		$("#"+showId).hide();
	 		$("#"+backId).hide();
	 		
	 	}
var paginationImpl = {};
	 	function getZjList(paginationImpl){
	 		
	 	//	&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"
	 	//	&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
	 		
	 	 util.showLoading("处理中...");
	 	 var zj_sn=$("#zj_sn").val();
	 	 var zj_type=$("#zj_type").val();
	 	 var jsondata="";
	 	 if($("#cfmId").val()==0){
	 	 	 jsondata ={"zj_sn":zj_sn,"zj_type":zj_type};
	 	 }else{
	 	 	jsondata ={"zj_sn":zj_sn,"zj_type":zj_type,"page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,"page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord};
	 	 }
	 	 var listUrl=getListUrl();
	 	
	 		$.ajax({
	 			type:"post",
	 			dataType:"json",
	 			url:listUrl,
	 			data:jsondata,
	 			success:function(data){
	 				util.closeLoading();
	 				//var zjLists=data.ajaxMap.zjList;   data.ajaxPage.dataList.
	 				
	 				var zjLists=data.ajaxPage.dataList;
	 				//if(null==data.ajaxMap.zjList){	
	 				if(null==data.ajaxPage.dataList){
	 					utilsFp.alert("没查询到数据");
	 					 $("#zjTbody").html("");
	 				}else{	 
	 					     $("#zjTbody").html("");
	 					     var j=0;
	 					    for(var i = 0;i < zjLists.length; i++){
	 						var zj= zjLists[i];
	 					    j=++j;
	 						$("#zjTbody").append("<tr class='datagrid-row' id=zjId_"+zj.ID+" name=zjId_"+zj.ID+"></tr>");
	 						$("#zjTbody tr:last").append("<td style='width:2%; text-align:center;'><span>"+j+"</span></td>");
	 						$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:3%; text-align:center;'><span><input type='checkbox' id='selectAll_9e447f80074441dcb0541aa75341e0b5' style='cursor: pointer;'></span></td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+zj.CFI_FIX_SN+"'/> </td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+zj.VALUE+"'/> </td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+zj.CFI_ITEM_CODE+"'/> </td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+zj.ASSISTANTTOOLNAME+"'/> </td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:10%; text-align:center;'><dict:lang value='"+zj.CFI_INSTOCK_TIME+"'/> </td>");	
	 				 
                           $("#zjId_"+zj.ID).click(function(event){
                           	
                         	if($(':checkbox',this).prop('checked')==true){
                           		$(':checkbox',this).attr("checked", false);
                           		$(this).css("background-color","");
                          } else{
                           		$(':checkbox',this).attr("checked",true);
                           		$(this).css("background-color","#a0c8e5");
                           }  
                             event.stopPropagation();
                           });
                           
                      
                            $(':checkbox',"#zjId_"+zj.ID).click(function(event){
                         	if($(':checkbox',this).prop('checked')==true){
                           	     $(':checkbox',this).attr("checked", false);
                           	     $(this).css("background-color","");
                          } else{
                           		$(':checkbox',this).attr("checked",true);
                           		$(this).css("background-color","#a0c8e5");
                           }  
                             event.stopPropagation();
                          });
	 					    }
	 					    
	 					 pageFun(data.ajaxPage,"formId1");   
	 				}
	 			},
	 			error:function(msg){
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}
	 		});
	 		
             	 

	 	}
	 	
	 	
	 	function choseZjList(showId,backId){
	 	  $("#showZJFront").html("");
	 	  var i=0;
	 	  $("#zjTbody :checkbox").each(function(){
	 			 if($(this).attr("checked")){
	 				var trid = $(this).parent().parent().parent().attr("id");
	 				getInfoToFront(trid,i);
	 				i++;
	 			} 
	 		});  
	 		if(i==0){
              utilsFp.confirmIcon(3,"","","", "请选择要添加的数据",0,"","");
	 		}else{
	 			$("#"+showId).hide();
	 		    $("#"+backId).hide();
	 		    $("#selectAll1").attr("checked",false);
	 		}
	 		
	 		 
	 	}
	 	
	 	
	 	function getInfoToFront(trId,index){
	 	      var  tr_id=$("#"+trId);
	 		  $("#showZJFront").append("<tr onclick='check_box()' class='showZJFront' id=f"+trId+" name=f"+trId+">"+index+"</tr>");
	 		  $("#showZJFront tr:last").append("<td style='width:2%; text-align:center;'><span></span></td>");
	 		  $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:3%; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
	 	      $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+tr_id.find("td:eq(2)").text()+"'/> </td>");
	 	      $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+tr_id.find("td:eq(3)").text()+"'/> </td>");
	          $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+tr_id.find("td:eq(4)").text()+"'/> </td>");
	 	      $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+tr_id.find("td:eq(5)").text()+"'/> </td>");
	 	      $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:10%; text-align:center;'><dict:lang value='"+tr_id.find("td:eq(6)").text()+"'/> </td>");
	 	    
	 	          $("#f"+trId).click(function(event){
                           	
                         	if($(':checkbox',this).prop('checked')==true){
                           		$(':checkbox',this).attr("checked", false);
                           		$(this).css("background-color","");
                          } else{
                           		$(':checkbox',this).attr("checked",true);
                           		$(this).css("background-color","#a0c8e5");
                           }  
                             event.stopPropagation();
                           });
                           
                      
                            $(':checkbox',"#f"+trId).click(function(event){
                         	if($(':checkbox',this).prop('checked')==true){
                           	     $(':checkbox',this).attr("checked", false);
                           	     $(this).css("background-color","");
                          } else{
                           		$(':checkbox',this).attr("checked",true);
                           		$(this).css("background-color","#a0c8e5");
                           }  
                             event.stopPropagation();
                           });
                           
	 	}
	 	
	 	function saveFix(){
	 		var ids="";
	 		var sns="";
	 		var codes="";
	 		var names="";
	 		var types="";
	 		var trs=$("#showZJFront tr");
	 		for(var i = 0;i < trs.length; i++){
              
            var id=$("#showZJFront tr:eq("+i+")").attr("id");
            id=$.trim(id);       
	 	 	ids+=id+",";
	 	 	
	 	 	var sn=$("#showZJFront tr:eq("+i+")").find("td:eq(2)").text();
	 	 	sn=$.trim(sn);
	 	 	sns+=sn+",";
	 	 	
	 	    var type=$("#showZJFront tr:eq("+i+")").find("td:eq(3)").text();
	 	    type=$.trim(type);
	 	 	types+=type+",";
	 	 	 
	 	 	var code=$("#showZJFront tr:eq("+i+")").find("td:eq(4)").text();
	 	 	code=$.trim(code);
	 	 	codes+=code+",";
	 	 	 
	 	 	var name=$("#showZJFront tr:eq("+i+")").find("td:eq(5)").text();
	 	 	name=$.trim(name);
	 	 	names+=name+",";
	 	 	 
	 	   }
	 		$("#ids").val(ids);
	 		$("#sns").val(sns);
	 		$("#codes").val(codes);
	 		$("#names").val(names);
	 		$("#types").val(types);
	 		
	 		
}
	 	
	 	function selectAll(){
	 		if($("#selectAll1").attr("checked")){
	 			$("#zjTbody :checkbox").each(function(){
	 			$(this).attr("checked",true);
	 		});
	 		}else{
	 			$("#zjTbody :checkbox").each(function(){
	 			$(this).attr("checked",false);
	 		});
	 		}
	 		
	 	}
	 	
	 	function select_All(){
	 		if($("#selectAll2").attr("checked")){
	 			$("#showZJFront :checkbox").each(function(){
	 			$(this).attr("checked",true);
	 		});
	 		}else{
	 			$("#showZJFront :checkbox").each(function(){
	 			$(this).attr("checked",false);
	 		});
	 		}
	 	}
	 	
	 	
	 	
	 	
	 	function delFrontList(){
	 		    var i=0;
	 			$("#showZJFront :checkbox").each(function(){
	 			 if($(this).attr("checked")){
	 			 	i++;
	 			 	var trid = "#"+$(this).parent().parent().parent().attr("id");
	 	            $(trid).remove();
	 			 }
	 		 });
	 		 $("#selectAll2").attr("checked",false);
	 		 if(i==0){
              utilsFp.confirmIcon(3,"","","", "请选择要删除的数据",0,"","");
	 		}
	 	}
	 	
	 	
	 	 $("#paraMap1_CFM_TYPE").change(function(){
	 	 	 
            if($(this).val()==0){//保养 
 
              $('#paraMap1_CFM_EC_CODE').attr("disabled","disabled"); 
               
              $('#CFM_DESC').attr("readonly","readonly"); 
              $('#CFM_DESC').addClass("readonly");
              $("#paraMap1_CFM_EC_CODE").trigger("chosen:updated");
              $('#CFM_DESC').val("");
              $("#paraMap1_CFM_EC_CODE option[value='']").attr("selected",true); 
       		  $("#paraMap1_CFM_EC_CODE").trigger("chosen:updated"); 
              
            }else{//维修
              
              $('#paraMap1_CFM_EC_CODE').removeAttr("disabled");
             
             
              $("#paraMap1_CFM_EC_CODE").trigger("chosen:updated");
             }
    });
	 	
	 	
	 	
	 	$("#paraMap1_CFM_EC_CODE").change(function(){
	 		
	 		var cfm_type=$("#paraMap1_CFM_EC_CODE").val(); 		
	 		alert(cfm_type=="");
	 		if(cfm_type==""){
	 			$("#CFM_DESC").val("");
	 		}else{
	 			  var jsondata="";
	 	 	jsondata ={"cfm_type":cfm_type};
	  
	 	     var listUrl=getEcType();
	 			 	 $.ajax({
	 			type:"post",
	 			dataType:"json",
	 			url:listUrl,
	 			data:jsondata,
	 			success:function(data){
	 				 
	 					var cd=data.ajaxMap.cecDesc;
	 				    $("#CFM_DESC").val(cd[0].CEC_DESC);
	 				 
	 				//	
	 				 
	 				
	 			},
	 			error:function(msg){
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}  
	 		
	 	});
	 		
	 			
	 		}
	 		
	 	  
	 
	}); 	
	
	
 
		 
	
	 	
</script>

<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
