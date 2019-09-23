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
			       
			        <button type="button" onclick="saveMTInfo()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" type="add" />
   <div class="mod">		
   <div class="mod-hd">		
   <h3 class="tit"><dict:lang value="保养信息"/></h3>	
   </div>
	 <div class="mod-hd" style="height:160px;border-bottom: none;z-index: 1;">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9fe40c6681484bbdaeeee44cc7fe3c2a" />
	<input type="hidden" name="9fe40c6681484bbdaeeee44cc7fe3c2a" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="ids" id="ids"/>
	<input type="hidden" name="sns" id="sns"/>  
	<input type="hidden" name="codes" id="codes"/>  
	<input type="hidden" name="names" id="names"/> 
	<input type="hidden" name="types" id="types"/> 
	<input type="hidden" name="specs" id="specs"/> 
	<input type="hidden" name="cfmId" id="cfmId" value="0"/>
	
		<s:set name="_$viewId" value="'30a234c36f704b378f9cc974598b8b1f'" />
		<s:set name="_$formId_1" value="'9fe40c6681484bbdaeeee44cc7fe3c2a'" />
		<s:set name="_$type" value="'add'" />
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_TYPE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCFM_TYPE}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_REPORTER" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCFM_REPORTER}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_MT_MAN" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCFM_MT_MAN}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCFM_AUDIT" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCFM_AUDIT}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec" colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCF_EC_CODE" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCF_EC_CODE}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec" colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" ><bu:ui colNo="TCF_EC_DES" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCF_EC_DES}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" /></td>
			<bu:td cssClass="dec-self" colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" colspan="8"><bu:ui colNo="TCFM_DEFECT_REMARK" formId="9fe40c6681484bbdaeeee44cc7fe3c2a" value="%{TCFM_DEFECT_REMARK}" formIndex="1" style="height:80px;"/></bu:td>
		</tr>
	</table>
	</div>
	
	<div style="width:100%;">
	 <div class="mod-hd">		
     <h3 class="tit"><dict:lang value="Feeder信息"/></h3>	
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
			<th class="datagrid-cell" style="width:5%"><dict:lang value="Feeder SN"/> </th>
			<th class="datagrid-cell" style="width:5%"><dict:lang value="Feeder规格"/></th>
			<th class="datagrid-cell" style="width:5%"><dict:lang value="Feeder类型"/></th>
			<th class="datagrid-cell" style="width:10%"><dict:lang value="最后保养时间"/></th>		
		</tr>
		</thead>
		<tbody id="showZJFront">
		</tbody>
		</table>
		
	 
		<div class="" id="backShadow"  style="position: absolute; top: 0px; left: 3px; width: 965px; height: 450px; z-index: 3099;display: none;background-color: white;">
		 <div style="display: block;" >
			<div class="dialog dialog-s1" id="addRole" style="width:965px;display:block;margin-left:-482px;margin-top:-100px;">
			<div class="dialog-hd">		            
				<h3 class="tit">选择Feeder信息</h3>
			</div>
			</div>
		</div>
			
			<div class="optn" style="top:40px;">
				        <button type="button" onclick="choseZjList('backShadow','zjalert')"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
				        <button type="button" onclick="closeAlert('backShadow','zjalert');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
				        <button type="button" onclick="getZjList('formId1')"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
		    </div>
		    	   
		    	<div id="zjalert" style="z-index:9999;margin-top: 90px;">
				 Feeder SN <input type="text"  class="dec-self input" id="zj_sn" name="zj_sn"/> 
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Feeder 类型 
				 <select class="dec-self input" id="zj_type" name="zj_type">
				     <option value="0">--请选择--</option>	
				     <option value="1">单通道</option>	
				     <option value="2">双通道</option>	
				     <option value="3">三通道</option>	
				 </select>
				
				<div>
					   <table  class="dlist-table table-line " style="width:100%;"  target="secondTable" >
				
								<thead style="width:100%;">
								<tr class="thcolor" style="display: block;width:100%; ">
									<th class="datagrid-cell" style="width:8%; text-align:center;"><span></span></th>
									<th class="datagrid-cell" style="width:8%; text-align:center"><span><input type="checkbox" id="selectAll1" onclick="selectAll()" style="cursor: pointer;" title="全选"></span></th>
									<th class="datagrid-cell" style="width:24%"><dict:lang value="Feeder SN"/> </th>
									<th class="datagrid-cell" style="width:15%"><dict:lang value="Feeder规格"/></th>
									<th class="datagrid-cell" style="width:15%"><dict:lang value="Feeder类型"/></th>
									<th class="datagrid-cell" style="width:30%"><dict:lang value="最后保养时间"/></th>		
								</tr>
								</thead>
								<tbody id="zjTbody" style="background-color:white;display: block; height: 250px; overflow-y: auto; ">
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
			<bu:jsVal formId="9fe40c6681484bbdaeeee44cc7fe3c2a" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
		<bu:submit viewId="30a234c36f704b378f9cc974598b8b1f" />
		<bu:script viewId="30a234c36f704b378f9cc974598b8b1f" />
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		if('${dataList[0].CFM_FIX_SN}'){
		
		
		$("#paraMap1_TCFM_REPORTER_SHOW").val('${dataList[1].cfmReporterShow}');
		//$("#paraMap1_TCFM_MT_MAN").val("%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}");
		
		
		$("#paraMap1_TCFM_TYPE").val('${dataList[0].TCFM_TYPE}');
		$("#paraMap1_TCFM_TYPE").trigger("chosen:updated");
		
		$("#paraMap1_TCFM_REPORTER").val('${dataList[0].TCFM_REPORTER}'); 
		$("#paraMap1_TCFM_DEFECT_REMARK").val('${dataList[0].TCFM_DEFECT_REMARK}');
        $('#paraMap1_TCFM_MT_MAN').val('${dataList[0].TCFM_MT_MAN}');
        $('#paraMap1_TCFM_AUDIT').val('${dataList[0].TCFM_AUDIT}');
        $('#cfmId').val('${dataList[0].ID}');
         
	     $("#showZJFront").append("<tr class='showZJFront' id='' name=''></tr>");
	     $("#showZJFront tr:last").append("<td style='width:2%; text-align:center;'><span>1</span></td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:3%; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].TCF_FEEDER_SN}'/> </td>");//
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].TCS_SPEC}'/> </td>");
	     $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].TCT_TYPE}'/> </td>");
	 	 /*$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='${dataList[0].CFM_ITEM_NAME}'/> </td>");*/
	 	 $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:10%; text-align:center;'><dict:lang value='${dataList[0].TCF_MT_LASTTIME}'/> </td>");
		 $("#front_add").attr("disabled", true); 
         $("#front_delete").attr("disabled", true); 
		
		}else{
			$("#front_add").attr("disabled", false); 
            $("#front_delete").attr("disabled", false); 
		}
		
		
		//$("#").val('');
		//$("#paraMap1_TCFM_TYPE_chosen").val('${dataList[0].TCFM_TYPE}');
	
          
         
         	
                
                $('#paraMap1_TCF_EC_CODE').attr("disabled","disabled");   
                $('#paraMap1_TCF_EC_DES').attr("readonly","readonly"); 
                $('#paraMap1_TCF_EC_DES').addClass("readonly");
                $("#paraMap1_TCF_EC_CODE").trigger("chosen:updated");
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	        $("#paraMap1_TCFM_TYPE").change(function(){
	           var type=$(this).val();
	           //alert(type);
	           if(type==0){
	             //保养
	             $('#paraMap1_TCF_EC_CODE').val("");
                     $('#paraMap1_TCF_EC_DES').val(""); 
	             $('#paraMap1_TCF_EC_CODE').attr("disabled","disabled"); 
               
              $('#paraMap1_TCF_EC_DES').attr("readonly","readonly"); 
              $('#paraMap1_TCF_EC_DES').addClass("readonly");
              $("#paraMap1_TCF_EC_CODE").trigger("chosen:updated");
              
	           }else if(type==1){
	             $('#paraMap1_TCF_EC_CODE').removeAttr("disabled");
             $('#paraMap1_TCF_EC_DES').removeAttr("disabled"); 
              $('#paraMap1_TCF_EC_DES').removeAttr("readonly");
              $('#paraMap1_TCF_EC_DES').removeClass("readonly");
              $("#paraMap1_TCF_EC_CODE").trigger("chosen:updated");
              
	           }
	        });
	        
	        
	        
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
	 	 var listUrl=getUrl();
	 	
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
	 					     var tct_type="";
	 					     var lastTime="";
	 					    for(var i = 0;i < zjLists.length; i++){
	 						var zj= zjLists[i];
	 					    j=++j;
	 					    if(zj.TCT_TYPE=="1"){
 				              tct_type="单通道";
 				            }else if(zj.TCT_TYPE=="2"){
 				              tct_type="双通道";
 				            }else if(zj.TCT_TYPE=="3"){
 				              tct_type="三通道";
 				            }
 				            if(zj.TCF_MT_LASTTIME==null){
 				              lastTime="";
 				            }else{
 				              lastTime=zj.TCF_MT_LASTTIME;
 				            }
	 						$("#zjTbody").append("<tr class='datagrid-row' id=zjId_"+zj.ID+" name=zjId_"+zj.ID+"></tr>");
	 						$("#zjTbody tr:last").append("<td style='width:2%; text-align:center;'><span>"+j+"</span></td>");
	 						$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:3%; text-align:center;'><span><input type='checkbox' id='selectAll_9fe40c6681484bbdaeeee44cc7fe3c2a' style='cursor: pointer;'></span></td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+zj.TCF_FEEDER_SN+"'/> </td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+zj.TCS_SPEC+"'/> </td>");
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+tct_type+"'/> </td>");
	 					    /*$("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+zj.ASSISTANTTOOLNAME+"'/> </td>");*/
	 					    $("#zjTbody tr:last").append("<td class='datagrid-cell' style='width:10%; text-align:center;'><dict:lang value='"+lastTime+"'/> </td>");	
	 					}
	 					console.log(data.ajaxPage);
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
	 		  $("#showZJFront").append("<tr class='showZJFront' id=f"+trId+" name=f"+trId+">"+index+"</tr>");
	 		  $("#showZJFront tr:last").append("<td style='width:2%; text-align:center;'><span></span></td>");
	 		  $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:3%; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
	 	      $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+tr_id.find("td:eq(2)").text()+"'/> </td>");
	 	      $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+tr_id.find("td:eq(3)").text()+"'/> </td>");
	          $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+tr_id.find("td:eq(4)").text()+"'/> </td>");
	 	      $("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:5%; text-align:center;'><dict:lang value='"+tr_id.find("td:eq(5)").text()+"'/> </td>");
	 	      /*$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:10%; text-align:center;'><dict:lang value='"+tr_id.find("td:eq(6)").text()+"'/> </td>");*/
	 	}
	 	
	 	function saveFix(){
	 		var ids="";
	 		var sns="";
	 		var codes="";
	 		var names="";
	 		var types="";
	 		var specs="";
	 		var trs=$("#showZJFront tr");
	 		for(var i = 0;i < trs.length; i++){
              
            var id=$("#showZJFront tr:eq("+i+")").attr("id");
            id=$.trim(id);       
	 	 	ids+=id+",";
	 	 	
	 	 	var sn=$("#showZJFront tr:eq("+i+")").find("td:eq(2)").text();
	 	 	sn=$.trim(sn);
	 	 	sns+=sn+",";
	 	 	
	 	    var type=$("#showZJFront tr:eq("+i+")").find("td:eq(4)").text();
	 	    type=$.trim(type);
	 	 	types+=type+",";
	 	 	 
	 	 	var code=$("#showZJFront tr:eq("+i+")").find("td:eq(4)").text();
	 	 	code=$.trim(code);
	 	 	codes+=code+",";
	 	 	 
	 	 	var name=$("#showZJFront tr:eq("+i+")").find("td:eq(3)").text();
	 	 	name=$.trim(name);
	 	 	names+=name+",";
	 	 	
	 	 	var spec=$("#showZJFront tr:eq("+i+")").find("td:eq(3)").text();
	 	 	spec=$.trim(spec);
	 	 	specs+=spec+",";
	 	 	 
	 	   }
	 		$("#ids").val(ids);
	 		$("#sns").val(sns);
	 		$("#codes").val(codes);
	 		$("#names").val(names);
	 		$("#types").val(types);
	 		$("#specs").val(names);
	 		//console.log(ids);
	 		//console.log(sns);
	 		//console.log(types);
	 		//console.log(names);
	 		//console.log(specs);
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
	 	
	 	
	         
	         $("#paraMap1_TCF_EC_CODE").change(function(){
	 		
	 		var ecCode=$("#paraMap1_TCF_EC_CODE").val(); 		
	 		//alert(cfm_type);
	 	         var jsondata="";
	 	 	jsondata ={"ecCode":ecCode};
	  
	 	         var listUrl=getEcDescUrl();
	 	 	 $.ajax({
	 			type:"post",
	 			dataType:"json",
	 			url:listUrl,
	 			data:jsondata,
	 			success:function(data){
	 			        //alert(data);
	 				var cd=data.ajaxList;
	 				$("#paraMap1_TCF_EC_DES").val(cd[0].CEC_DESC);
	 				//alert(cd[0].CEC_DESC);
	 			},
	 			error:function(msg){
	 				util.closeLoading();
	 				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	 			}  
	 		
	 	   });
	 	
	         }); 
	 	
</script>

<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
