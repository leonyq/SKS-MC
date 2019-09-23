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
	/*
            $(function(){
	    	    
	    	    
	    	    addOption();
	    	})
        	function addOption(){

	    	    $("#ITEM_SIZE1").prepend("<option value>--请选择--</option>");
	    	    $("#ITEM_SIZE1").each(function(){
	    	        $(this).find("Option").eq("").prop("selected",true);
	    	    })
	    	    $("#ITEM_SIZE").prepend("<option value>--请选择--</option>");
	    	    $("#ITEM_SIZE").each(function(){
	    	        $(this).find("Option").eq("").prop("selected",true);
	    	    })
	    	}
       */
    </script>
	
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
	<!-- head里面 -->
	<style>
	    .lkz{
	        width:30px !important;
	    }
	</style>
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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:534px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="d9ea51e4ac084f0b8b227807c5b6539d" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="d9ea51e4ac084f0b8b227807c5b6539d" />
	<input type="hidden" name="d9ea51e4ac084f0b8b227807c5b6539d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b14ab5d4efb34ba79b22107f665d7022'" />
		<s:set name="_$formId_1" value="'d9ea51e4ac084f0b8b227807c5b6539d'" />
		<s:set name="_$type" value="'add'" />
		<tr>
		    <td class="name-four" /><span class="dot">*</span><bu:uitn colNo="WEC_SN" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_SN" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_SN" formId="d9ea51e4ac084f0b8b227807c5b6539d" value="%{WEC_SN}" formIndex="1" /></bu:td>
	
			<td class="name-four" /><bu:uitn colNo="WEC_NAME" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_NAME" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_NAME" formId="d9ea51e4ac084f0b8b227807c5b6539d" value="%{WEC_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="WEC_SHELF_IP" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_SHELF_IP" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_SHELF_IP" formId="d9ea51e4ac084f0b8b227807c5b6539d" value="%{WEC_SHELF_IP}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="WEC_DATE" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_DATE" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_DATE" formId="d9ea51e4ac084f0b8b227807c5b6539d" value="%{WEC_DATE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="WEC_DEPT" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_DEPT" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_DEPT" formId="d9ea51e4ac084f0b8b227807c5b6539d" value="%{WEC_DEPT}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="WEC_EMP" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_EMP" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_EMP" formId="d9ea51e4ac084f0b8b227807c5b6539d" value="%{WEC_EMP}" formIndex="1" /></bu:td>
		</tr>
		<tr>
				<td class="name-four" /><bu:uitn colNo="WEC_MEMO" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_MEMO" formId="d9ea51e4ac084f0b8b227807c5b6539d" colspan="3"><bu:ui colNo="WEC_MEMO" formId="d9ea51e4ac084f0b8b227807c5b6539d" value="%{WEC_MEMO}" formIndex="1" style="height:80px;width:90%;"/></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="d9ea51e4ac084f0b8b227807c5b6539d" formIndex="1" />
				
			
			<div class="dialog dialog-s1" id="addFCWT" 
											style="display:none;z-index:1130;margin-left:0px;left: calc(50% - 195px);top: calc(50% - 180px);width:390px;height:360px;"><!--180px-->
											<div class="dialog-hd">
												<h3 class="tit">
													<dict:lang value="电子料车" />
												</h3>
											</div>
						<a class="dialog-close" href="javascript:void(0);"
								onclick="hideDiv('addFCWT','back');"></a>
							<div class="dialog-bd" style="width:100%;height:380px;">
									<br />
									<div class="optn" style="margin-top:46px;">
									
			        				<button type="button" onclick="addLoadPoint('addFCWT','back');"><i class="ico ico-save"></i>保存</button>
			        				<button type="button" onclick="hideDiv('addFCWT','back');"><i class="ico ico-cancel"></i>取消</button>
			    					</div>
			    					<div style="background-color: #fff;margin-top: 20px;padding-top: 10px;">
							 <table class="basic-table" style="background-color: white;">
								<tr>
									<td style="width: 27%;text-align: right;" class="name"><dict:lang value="新增方式" /></td>
									<td class="dec">
										<select id="addWay" name="addWay" class=" input isSubmit" onchange="changeWay();">
	                						<option value="0" selected="selected"><dict:lang value="单个" /></option>
											<option value="1"><dict:lang value="批量" /></option>
										</select>
									</td>
								</tr>
								<tbody id="addDiv1">
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="货位编码"/></td>
												<td class="dec"><input type="text" id="STORAGE_SN" onkeyup="javascript: utilsFp.replaceLikeVal(this)" class=" input isSubmit"/>
												<span class="Eng"><span id="STORAGE_SN_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="硬体编码"/></td>
												<td class="dec"><input type="text" id="SHELF_SN" onkeyup="javascript: utilsFp.replaceLikeVal(this)" class=" input isSubmit "/>
												<span class="Eng"><span id="SHELF_SN_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="料盘尺寸"/></td>
												<td class="dec"><dict:selectDict id="ITEM_SIZE" name="ITEM_SIZE" dictCode="ITEM_SIZE" dictValue="%{userDto.ITEM_SIZE}"  style="cursor: pointer;width:230px;" /></td>
											</tr>	
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="货位容量"/></td>
												<td class="dec"><input type="text" id="WEC_CAPACITY" class=" input isSubmit"/></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="说明"/></td>
												<td class="dec"><textarea id="WEC_MEMO" onkeyup="javascript: utilsFp.replaceLikeVal(this)" style="height: 62px;" class=" input isSubmit "></textarea></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name">&nbsp;&nbsp;</td>
												<td class="dec">&nbsp;&nbsp;</td>
											<tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name">&nbsp;&nbsp;</td>
												<td class="dec">&nbsp;&nbsp;</td>
											<tr>
											
								</tbody>
								<tbody id="addDiv2" style="display: none;">
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="货位编码前缀"/></td>
												<td class="dec"><input type="text" onkeyup="javascript: utilsFp.replaceLikeVal(this)" id="STORAGE_SN1" class=" input isSubmit"/></td>
												<span class="Eng"><span id="STORAGE_SN_err1"></span></span></td>
											</tr>
											
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="硬体编码前缀"/></td>
												<td class="dec"><input type="text" onkeyup="javascript: utilsFp.replaceLikeVal(this)" id="SHELF_SN1" class=" input isSubmit"/>
												<span class="Eng"><span id="SHELF_SN_err1"></span></span></td>
											</tr>
											
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="料盘尺寸"/></td>
												<td class="dec"><dict:selectDict id="ITEM_SIZE1"  dictCode="ITEM_SIZE" dictValue="%{userDto.ITEM_SIZE}"  style="cursor: pointer;width:230px;" /></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="货位起始流水"/></td>
												<td class="dec"><input type="text" id="CDL_STAR"  class=" input isSubmit"/>
												<span class="Eng"><span id="CDL_STAR_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="硬体起始流水"/></td>
												<td class="dec"><input type="text" id="SHELF_STAR"  class=" input isSubmit"/>
												<span class="Eng"><span id="SHELF_STAR_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="数量"/></td>
												<td class="dec"><input type="text" id="LOADPOINT_COUNT" class=" input isSubmit"/></td>
												<span class="Eng"><span id="LOADPOINT_COUNT_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="货位容量"/></td>
												<td class="dec"><input type="text" id="WEC_CAPACITY1" class=" input isSubmit"/></td>
												<span class="Eng"><span id="WEC_CAPACITY_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" onkeyup="javascript: utilsFp.replaceLikeVal(this)" class="name"><dict:lang value="说明"/></td>
												<td class="dec"><textarea id="WEC_MEMO1" style="height: 62px;" class=" input isSubmit"></textarea></td>
											</tr>
								</tbody>
							 </table>
							 </div>
						</div>
					</div>
					<div class="dialog-mask" id="back" ></div>
<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>			
<div class="mod">
<div class="mod-hd" style="margin-bottom:5px;">
    			
        
				 <h3 class="tit"><dict:lang value="基本信息"/></h3>
				 <div class="extend-btn" style="float: right;margin-top:5px;margin-bottom:5px;">
<button href="javascript:void(0);" type="button" onclick="popLoadpointDiv('addFCWT','back');" title="添加"><i class="ico ico-kl-new-add ico-small"></i></button>
<button href="javascript:void(0);" type="button" onclick="delLoadpointRow();" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>
</div>
	</div>	





<div class="panel datagrid datagrid-div1">
	<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="width:100%;height:100%">
			<div class="datagrid-header">
				<div class="datagrid-header-inner" id="datagrid-header-inner">
				<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
						<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
						<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllItems();"/></td >
						<td class="datagrid-cell" style="width:131px;" ><dict:lang value="货位编码" /></td >
						<td class="datagrid-cell" style="width:134px;" ><dict:lang value="硬体编码" /></td >
						<td class="datagrid-cell" style="width:137px;" ><dict:lang value="料盘尺寸" /></td >
						<td class="datagrid-cell" style="width:120px;" ><dict:lang value="货位容量" /></td >
						<td class="datagrid-cell" style="width:120px;"><dict:lang value="说明" /></td >
					</tr>
					</tbody>
					
				</table>
			</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body" style="height: 230px;">
		<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
					<tbody id="addLoadPoint">
					</tbody>
		</table>
					</div>
	
		    </div>
	    </div>
	</div>

			</form>
  
	</div>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
	    function popLoadpointDiv(showId,backId){
			/*document.getElementById(showId).style.display = 'block';
			document.getElementById(backId).style.display = 'block';*/
			$("#"+showId+",#"+backId).show();
			//$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			$("#"+showId).draggable();
			//$('.chosen-container').css("width","230px");
		}
		function changeWay(){
			var addWay = document.getElementById("addWay").value;
			if(addWay=="1"){
				document.getElementById("addDiv1").style.display="none";
				document.getElementById("addDiv2").style.display="";
			}else{
				document.getElementById("addDiv2").style.display="none";
				document.getElementById("addDiv1").style.display="";
			}	
		}
		var trCount = 0;
		function addLoadPoint(showId,backId){
			if(!checkData()){
      				return ;
  			}
			var loadPointCount = $("#LOADPOINT_COUNT").val();
			var addWay2 = document.getElementById("addWay").value;
			
			//alert(loadPointCount);
			if(addWay2=="0"){
				trCount++;
				var STORAGE="STORAGE_SN_"+trCount;
				var SHELF="SHELF_SN_"+trCount;
				var ITEM="ITEM_SIZE_"+trCount;
			    var tempMemo="WEC_MEMO_"+trCount;
			    var WEC="WEC_CAPACITY_"+trCount;
	
			
				
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+trCount+"' ></tr>");
			
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-0 lkz' style='width:30px;text-align: center;'>"+$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length+"</td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1 lkz' style='width:30px;text-align: center;'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' name='STORAGE_SN' align='left' style='width:131px;'>"+$("#STORAGE_SN").val()+"<input name='STORAGE' type='hidden' id='STORAGE' value='"+$("#STORAGE_SN").val()+"'></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' name='SHELF_SN' align='left' style='width:134px;'>"+$("#SHELF_SN").val()+"<input name='SHELF' type='hidden' id='SHELF' value='"+$("#SHELF_SN").val()+"'></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' name='ITEM_SIZE' align='left' style='width:137px;'>"+$('#ITEM_SIZE option:selected').text()+"<input name='ITEM' type='hidden' id='ITEM' value='"+$("#ITEM_SIZE").val()+"'></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' name='WEC_CAPACITY' align='left' style='width:120px;'>"+$('#WEC_CAPACITY').val()+"<input name='WEC' type='hidden' id='WEC' value='"+$("#WEC_CAPACITY").val()+"'></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' name='WEC_MEMO' align='left'><div style='width:120px;'>"+$("#WEC_MEMO").val()+"</div><input name='tempMemo' type='hidden' id='tempMemo' value='"+$("#WEC_MEMO").val()+"'></td>");
			/*	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);*/
				var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
				_tongLineColor(tableTrJs);
				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
			}else if(addWay2=="1"){
				if(loadPointCount<=1){
					var tableWork1 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
					var count1= tableWork1.rows.length;//alert(tableWork1.rows[i].cells[1].innerHTML);
					if (count1>0) {
					        for ( var z = 0; z < count1; z++) {
								if (($("#STORAGE_SN1").val()+$("#CDL_STAR").val()) == tableWork1.rows[z].cells[2].innerHTML ) {
								var STORAGE_SN1 = document.getElementById("STORAGE_SN1");
								_alertValMsg(STORAGE_SN1,"<dict:lang value="货位编码不能相同" />");
								return false;
								}
							}		

							for ( var j = 0; j < count1; j++) {
								if (($("#SHELF_SN1").val()+$("#SHELF_STAR").val()) == tableWork1.rows[j].cells[3].innerHTML) {
								var SHELF_SN1 = document.getElementById("SHELF_SN1");
								_alertValMsg(SHELF_SN1,"<dict:lang value="硬体编码不能相同" />");
								return false;
								}
							}
							
					}	
					trCount++;
					var STORAGE="STORAGE_SN_"+trCount;
			    	var SHELF="SHELF_SN_"+trCount;
				    var ITEM="ITEM_SIZE_"+trCount;
				    var tempMemo="WEC_MEMO_"+trCount;
				     var WEC="WEC_CAPACITY_"+trCount;
			
					
					
					console.log($("#CDL_STAR").val());
					
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+trCount+"' ></tr>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-0 lkz' style='width:30px;text-align: center;'>"+$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1 lkz' style='width:30px;text-align: center'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' name='STORAGE_SN' align='left' style='width:131px;'>"+$("#STORAGE_SN1").val()+$("#CDL_STAR").val()+"<input name='STORAGE' type='hidden' id='STORAGE' value='"+$("#STORAGE_SN1").val()+$("#CDL_STAR").val()+"'></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' name='SHELF_SN' align='left' style='width:134px;'>"+$("#SHELF_SN1").val()+$("#SHELF_STAR").val()+"<input name='SHELF' type='hidden' id='SHELF' value='"+$("#SHELF_SN1").val()+$("#SHELF_STAR").val()+"'></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' name='ITEM_SIZE' align='left' style='width:137px;'>"+$('#ITEM_SIZE1 option:selected').text()+"<input name='ITEM' type='hidden' id='ITEM' value='"+$("#ITEM_SIZE1").val()+"'></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' name='WEC_CAPACITY' align='left' style='width:120px;'>"+$("#WEC_CAPACITY1").val()+"<input name='WEC' type='hidden' id='WEC' value='"+$("#WEC_CAPACITY1").val()+"'></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' name='WEC_MEMO' align='left' style='width:120px;'>"+$("#WEC_MEMO1").val()+"<input name='tempMemo' type='hidden' id='tempMemo' value='"+$("#WEC_MEMO1").val()+"'></td>");
				/*	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);*/
					
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					
				}else if(loadPointCount>1){
				  
					for(var i=1;i<=loadPointCount;i++){
					
						var tableWork2 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
						var count2= tableWork2.rows.length;
						if (count2>0) {
						    for ( var w = 0; w < count2; w++) {
								if (($("#STORAGE_SN1").val()+(parseInt($("#CDL_STAR").val())+i-1)) == tableWork2.rows[w].cells[2].innerHTML ) {
								var STORAGE_SN1 = document.getElementById("STORAGE_SN1");
								_alertValMsg(STORAGE_SN1,"<dict:lang value="货位编码不能相同" />");
								return false;
								}
							}
							
							for ( var k = 0; k < count2; k++) {
								if (($("#SHELF_SN1").val()+(parseInt($("#SHELF_STAR").val())+i-1)) == tableWork2.rows[k].cells[3].innerHTML) {
								var SHELF_SN1 = document.getElementById("SHELF_SN1");
								_alertValMsg(SHELF_SN1,"<dict:lang value="硬体编码不能相同" />");
								return false;
								}
							}
						}
						
						trCount=trCount+1;
						var STORAGE="STORAGE_SN_"+trCount;
			    	    var SHELF="SHELF_SN_"+trCount;
				        var ITEM="ITEM_SIZE_"+trCount;
				        var tempMemo="WEC_MEMO_"+trCount;
				         var WEC="WEC_CAPACITY_"+trCount;
				
						var hH = (parseInt($("#SHELF_STAR").val())+i-1);
						console.log(hH.toString().length);
						
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+trCount+"' ></tr>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-0 lkz' style='width:30px;text-align: center;'>"+$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length+"</td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1 lkz' style='width:30px;text-align: center'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' name='STORAGE_SN' align='left' style='width:131px;'>"+$("#STORAGE_SN1").val()+(parseInt($("#CDL_STAR").val())+i-1)+"<input name='STORAGE' type='hidden' id='STORAGE' value='"+$("#STORAGE_SN1").val()+(parseInt($("#CDL_STAR").val())+i-1)+"'></td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' name='SHELF_SN' align='left' style='width:134px;'>"+$("#SHELF_SN1").val()+(parseInt($("#SHELF_STAR").val())+i-1)+"<input name='SHELF' type='hidden' id='SHELF' value='"+$("#SHELF_SN1").val()+(parseInt($("#SHELF_STAR").val())+i-1)+"'></td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' name='ITEM_SIZE' align='left' style='width:137px;'>"+$('#ITEM_SIZE1 option:selected').text()+"<input name='ITEM' type='hidden' id='ITEM' value='"+$("#ITEM_SIZE1").val()+"'></td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' name='WEC_CAPACITY' align='left' style='width:120px;'>"+$("#WEC_CAPACITY1").val()+"<input name='WEC' type='hidden' id='WEC' value='"+$("#WEC_CAPACITY1").val()+"'></td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' name='WEC_MEMO' align='left' >"+$("#WEC_MEMO1").val()+"<input name='tempMemo' type='hidden' id='tempMemo' value='"+$("#WEC_MEMO1").val()+"'></td>");
                       /* $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);	*/				    		

					    var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
						_tongLineColor(tableTrJs);
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					}
				}
			}
			//trCount++;			
            
			document.getElementById("STORAGE_SN").value="";
			document.getElementById("SHELF_SN").value="";
			document.getElementById("ITEM_SIZE").value="1";
			document.getElementById("WEC_MEMO").value="";
            document.getElementById("WEC_CAPACITY").value="1";			

			document.getElementById("STORAGE_SN1").value="";
			document.getElementById("SHELF_SN1").value="";
			document.getElementById("CDL_STAR").value="";
			document.getElementById("SHELF_STAR").value="";
			document.getElementById("LOADPOINT_COUNT").value="";
			document.getElementById("ITEM_SIZE1").value="1";
			document.getElementById("WEC_MEMO1").value="";
			document.getElementById("WEC_CAPACITY1").value="1";
			
			/*
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';*/
			$("#"+showId+",#"+backId).hide();
			$("#saveInfo").attr("onclick","addCal("+trCount+")");
			clickTr("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			return;
		}
		function checkData(){
			var addWay1 = document.getElementById("addWay").value;
			document.getElementById("STORAGE_SN_err").innerHTML="";
			document.getElementById("SHELF_SN_err").innerHTML="";
			document.getElementById("SHELF_SN_err1").innerHTML="";
			document.getElementById("SHELF_SN_err1").innerHTML="";
			document.getElementById("LOADPOINT_COUNT_err").innerHTML="";
			document.getElementById("CDL_STAR_err").innerHTML="";
			document.getElementById("WEC_CAPACITY_err").innerHTML="";
			document.getElementById("SHELF_STAR_err").innerHTML="";
			var tableWork = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			var count = tableWork.rows.length;
			if (addWay1=="0") {
				if($("#STORAGE_SN").val() == null || $("#STORAGE_SN").val() ==""){
					var STORAGE_SN = document.getElementById("STORAGE_SN");
					_alertValMsg(STORAGE_SN,"<dict:lang value="货位编码不能为空" />");
					return false;
				}
				if($("#SHELF_SN").val() == null || $("#SHELF_SN").val() ==""){
					var SHELF_SN = document.getElementById("SHELF_SN");
					_alertValMsg(SHELF_SN,"<dict:lang value="硬体编码不能为空" />");
					return false;
				}
				if($("#WEC_CAPACITY").val() == null || $("#WEC_CAPACITY").val() ==""){
					var SHELF_SN = document.getElementById("WEC_CAPACITY");
					_alertValMsg(WEC_CAPACITY,"<dict:lang value="货位容量不能为空" />");
					return false;
				}
				if (count>0) {
					for ( var i = 0; i < count; i++) {
						if ($("#STORAGE_SN").val() == tableWork.rows[i].cells[2].innerHTML ) {
								var STORAGE_SN = document.getElementById("STORAGE_SN");
								_alertValMsg(STORAGE_SN,"<dict:lang value="货位编码不能相同" />");
								return false;
							}
							if ($("#SHELF_SN").val() == tableWork.rows[i].cells[3].innerHTML ) {
								var SHELF_SN = document.getElementById("SHELF_SN");
								_alertValMsg(SHELF_SN,"<dict:lang value="硬体编码不能相同" />");
								return false;
								}
						}
						
				}
			}else if(addWay1=="1"){
			    /*
				if($("#STORAGE_SN1").val() == null || $("#STORAGE_SN1").val() ==""){
					var STORAGE_SN1 = document.getElementById("STORAGE_SN1");
					_alertValMsg(STORAGE_SN1,"<dict:lang value="货位编码不能为空" />");
					return false;
				}
				if($("#SHELF_SN1").val() == null || $("#SHELF_SN1").val() ==""){
					var SHELF_SN1 = document.getElementById("SHELF_SN1");
					_alertValMsg(SHELF_SN1,"<dict:lang value="硬体编码不能为空" />");
					return false;
				}
				*/
				if($("#CDL_STAR").val() == null || $("#CDL_STAR").val() ==""){
					var CDL_STAR = document.getElementById("CDL_STAR");
					_alertValMsg(CDL_STAR,"<dict:lang value="货位起始流水不能为空" />");
					return false;
				}
				if($("#SHELF_STAR").val() == null || $("#SHELF_STAR").val() ==""){
					var SHELF_STAR = document.getElementById("SHELF_STAR");
					_alertValMsg(SHELF_STAR,"<dict:lang value="硬件起始流水不能为空" />");
					return false;
				}
				if($("#WEC_CAPACITY1").val() == null || $("#WEC_CAPACITY1").val() ==""){
					var SHELF_SN = document.getElementById("WEC_CAPACITY1");
					_alertValMsg(WEC_CAPACITY,"<dict:lang value="货位容量不能为空" />");
					return false;
				}
				if($("#LOADPOINT_COUNT").val() == null || $("#LOADPOINT_COUNT").val() ==""){
					var LOADPOINT_COUNT = document.getElementById("LOADPOINT_COUNT");
					_alertValMsg(LOADPOINT_COUNT,"<dict:lang value="数量不能为空" />");
					return false;
				}
				/*if (count>1) {
					for ( var i = 1; i < count; i++) {
						if ($("#CDL_TABLE1").val() == tableWork.rows[i].cells[1].innerHTML) {
								document.getElementById("CDL_TABLE1_err").innerHTML = "<dict:lang value="Table名称已存在" />";
								return false;
							}
						}
				}*/
			}
			return true;
		}
		function hideDiv(showId,backId){
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			document.getElementById("STORAGE_SN").value="";
			document.getElementById("SHELF_SN").value="";
			document.getElementById("ITEM_SIZE").value="1";
			document.getElementById("WEC_MEMO").value="";
			document.getElementById("WEC_CAPACITY").value="1";
			document.getElementById("STORAGE_SN_err").innerHTML="";
			document.getElementById("SHELF_SN_err").innerHTML="";

			document.getElementById("STORAGE_SN1").value="";
			document.getElementById("SHELF_SN1").value="";
			document.getElementById("SHELF_STAR").value="";
			document.getElementById("CDL_STAR").value="";
			document.getElementById("LOADPOINT_COUNT").value="";
			document.getElementById("ITEM_SIZE1").value="1";
			document.getElementById("WEC_MEMO1").value="";
			document.getElementById("WEC_CAPACITY1").value="1";
			document.getElementById("STORAGE_SN_err1").innerHTML="";
			document.getElementById("SHELF_SN_err1").innerHTML="";
			document.getElementById("LOADPOINT_COUNT_err").innerHTML="";
			document.getElementById("CDL_STAR_err").innerHTML="";
			document.getElementById("SHELF_STAR_err").innerHTML="";
			document.getElementById("WEC_CAPACITY_err").innerHTML="";
			$("#"+showId+",#"+backId).hide();
		}
		
		//删除电子料站
			var tCount=0;
		function delLoadpointRow(){
		//alert(trCount);
		//var tempTrCount = 0;
		var falg = 0; 
		$("input[name='isSelect1']:checkbox").each(function () { 
			if ($(this).attr("checked")) { 
			falg =1; 
			} 
			});
			if (falg > 0) {
		$("input[name='isSelect1']:checked").each(function() { // 遍历选中的checkbox
	            var n = $(this).parents("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").index();  // 获取checkbox所在行的顺序
	            var temp=$(this).val();
			var hidDiv="#hidDiv_"+temp;
			$(hidDiv).html("");	
	            //tempTrCount++;
	          
	           
	            var trId=document.getElementById(temp);
	            var table1=document.getElementById("addLoadPoint");
	            table1.removeChild(trId);
	             //$("#loadPoint").find("tr:eq("+temp+")").remove();
        	 });
        	 tCount=0;
        	 $("#addLoadPoint tr").each(function(){ 
        	 tCount++;
                     $(this).children("td:first").html(tCount); 
                     
                 }) ;
                   //alert(trCount-tempTrCount);
        	 }else {
        	     utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
        	 }
        	 defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
        	 
		}
		//点击行寄选中该行
		function clickTr(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").prop("checked",true);
				$("#"+trId).css("background-color","#d3eafc");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#d3eafc");
			  }
		  });
		}
		function addCal(){
		    
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
			
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false);
                        			
                       if($("#isCloseWin") && $("#addCalForm").find("#isCloseWin").length == 0){
				$("#addCalForm").append($("#isCloseWin").clone());
				$("#addCalForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
			
			var tableWork3 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
					var len= tableWork3.rows.length;
                        if(len<=0){
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少添加一条料站信息" />",0,"260","");
                           return;
                        }
                        console.log($("#paraMap1_WEC_EMP").val());
                        document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=bbdd1781c44343989896f336242c800f&trCount="+trCount;
                         document.forms.addForm.submit();
                        isQuery = true;
			$DisInput.attr("disabled", true);
		    
		}
		
         $('#LOADPOINT_COUNT').bind('keyup', function () {
	            var calwStart=$("#LOADPOINT_COUNT");
             if(  ! /^(1)$|^100$|^[1-9][0-9]?$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#LOADPOINT_COUNT'),"<dict:lang value="该项只能为不大于100的数字" />");
             }
         });
         $('#SHELF_STAR').bind('keyup', function () {
	            var calwStart=$("#SHELF_STAR");
             if(!/^[1-9]\d*$/gi.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#SHELF_STAR'),"<dict:lang value="该项只能为数字" />");
             }
         });
         $('#CDL_STAR').bind('keyup', function () {
	            var calwStart=$("#CDL_STAR");
             if(!/^[1-9]\d*$/gi.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#CDL_STAR'),"<dict:lang value="该项只能为数字" />");
             }
         });
         $('#WEC_CAPACITY').bind('keyup', function () {
	            var calwStart=$("#WEC_CAPACITY");
             if(!/^[1-9]\d*$/gi.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#WEC_CAPACITY'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         $('#WEC_CAPACITY1').bind('keyup', function () {
	            var calwStart=$("#WEC_CAPACITY1");
             if(!/^[1-9]\d*$/gi.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#WEC_CAPACITY1'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         $(function(){
             $("#WEC_CAPACITY1").val("1");
             $("#WEC_CAPACITY").val("1");
         })
		window.onload = function() {
        		$('#saveInfo').attr("onclick","addCal('"+trCount +"')"); 
        		$('#paraMap0_CD_VALID_FLAG_1').attr("checked","checked");
   
  		}
  		function getAllItems(){
        if($("#allSelect").attr("checked")=="checked"){
			$("#addLoadPoint :checkbox").attr("checked",true);
		}else{
			$("#addLoadPoint :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
        
        
    }
	</script>
	 <script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 
