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
  
	<!-- head里面 -->
<script type="text/javascript">
//重新排序
function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
}
//添加行
var ttCount=0;
function addMyRow(){
	var len = $("#addDetailInfo tr").length;
	var tempT = "<input type=\"text\" style=\"width:100%;\" maxlength=\"9\"  class=\"_VAL_NULL input isSubmit\" id='BAKE_TEMP"+(ttCount+1)+"' name=\"BAKE_TEMP\" onkeyup=\"value=value.replace(/[^\\d.]/g,'')\"/>";
	var tempT1 = "<input type=\"text\" style=\"width:100%;\" maxlength=\"9\"  class=\"_VAL_NULL input isSubmit\" id='BAKE_TIME"+(ttCount+1)+"' name=\"BAKE_TIME\" onkeyup=\"value=value.replace(/[^\\d.]/g,'')\"/>";
	var tempT3 = "<input type=\"text\" style=\"width:100%;\" maxlength=\"9\"  class=\"_VAL_NULL input isSubmit\" id='BAKE_MAX"+(ttCount+1)+"' name=\"BAKE_MAX\" onkeyup=\"value=value.replace(/[^\\d.]/g,'')\"/>";
	var tempT2 = "<input type=\"text\" style=\"width:100%;\" maxlength=\"9\"  class=\"_VAL_NULL input isSubmit\" id='TEMP_DEPARTURE"+(ttCount+1)+"'  name=\"TEMP_DEPARTURE\" onkeyup=\"value=value.replace(/[^\\d.]/g,'')\"/>";
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+(ttCount+1)+"'></tr>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align:center;'>"+(len+1)+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align:center;'><input type='checkbox'/></td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:180px;text-align:center;padding:0;'>"+tempT+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:180px;text-align:center;padding:0;'>"+tempT1+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:180px;text-align:center;padding:0;'>"+tempT3+"</td>");
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:180px;text-align:center;padding:0;'>"+tempT2+"</td>");
	ttCount++;
	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
	defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
}
//删除行
function delMyRow(){
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
		}
	});
	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');	
}
//校验输入的温度是否有交叉
function checkVal(){
	var backTemp = $("input[name='BAKE_TEMP']");//烘烤温度
	var tempDep= $("input[name='TEMP_DEPARTURE']");//偏差温度
	var po = 0;
	var ps=0;
	for(var i=0;i<backTemp.length;i++){
		if(i!=backTemp.length-1){
		if(parseFloat(backTemp[i+1].value)>=parseFloat(backTemp[i].value)){
		    po++;		
            if(ps>0){
                utilsFp.confirmIcon(3,"","","", "<dict:lang value = "请按升序或降序排序输入温度" />",0,"300","");
				return "0";
            }
            
            console.log("1::"+parseFloat(backTemp[i].value));
            console.log("2::"+parseFloat(tempDep[i].value));
            console.log("3::"+parseFloat(backTemp[i+1].value));
            console.log("4::"+parseFloat(tempDep[i+1].value));
            
			if((parseFloat(backTemp[i].value)+parseFloat(tempDep[i].value))>= (parseFloat(backTemp[i+1].value)-parseFloat(tempDep[i+1].value))){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value = "输入的温度区域存在交叉" />",0,"300","");
				return "0";
			    }
			}else{
			    ps++;
			    if(po>0){
                utilsFp.confirmIcon(3,"","","", "<dict:lang value = "请按升序或降序排序输入温度" />",0,"300","");
				return "0";
            }
			   if((parseFloat(backTemp[i].value)-parseFloat(tempDep[i].value))<=(parseFloat(backTemp[i+1].value)+parseFloat(tempDep[i+1].value))){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value = "输入的温度区域存在交叉" />",0,"300","");
				return "0";
			    } 
			}
		}
	}

}
//校验烘烤时长是否为0
function checkNum(){
    var backTime = $("input[name='BAKE_TIME']");
    var backMax = $("input[name='BAKE_MAX']");
    for(var i=0;i<backTime.length;i++){
        if(backTime[i].value==0){
            utilsFp.confirmIcon(3,"","","", "<dict:lang value = "烘烤下限不能为0" />",0,"300","");
			return "0";
        }
        if(backMax[i].value==0){
            utilsFp.confirmIcon(3,"","","", "<dict:lang value = "烘烤上限不能为0" />",0,"300","");
			return "0";
        }
       	// if(parseFloat(backTime[i].value)>+parseFloat(backMax[i].value)){
            if(Number(backTime[i].value)>+Number(backMax[i].value)){
                utilsFp.confirmIcon(3,"","","", "<dict:lang value = "烘烤下限应小于烘烤上限" />",0,"300","");
			    return "0";
            }
            
      //  }
    }
}
//校验[暴露时限]、[烘烤总时长]、[烘烤次数上限]是否为0
function checkZero(){
    if($("#paraMap1_WSR_EXPOSE_LIMIT").val()==0){
        _alertValMsg(document.getElementById("paraMap1_WSR_EXPOSE_LIMIT"),"<dict:lang value="该项不能为0" />");
        return "0";
    }
    if($("#paraMap1_WSR_BAKE_LIMIT").val()==0){
        _alertValMsg(document.getElementById("paraMap1_WSR_BAKE_LIMIT"),"<dict:lang value="该项不能为0" />");
        return "0";
    }
    if($("#paraMap1_WSR_BAKE_TIMES").val()==0){
        _alertValMsg(document.getElementById("paraMap1_WSR_BAKE_TIMES"),"<dict:lang value="该项不能为0" />");
        return "0";
    }
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
function getAllItems(){
		if($("#allSelect").attr("checked")=="checked"){
			$("#addDetailInfo :checkbox").attr("checked",true);
		}else{
			$("#addDetailInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
} 

function addCal(){      
                    
                        
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
                    
                    var tempFl = checkZero();
                    if(tempFl=="0"){
                         return ;
                    }

                        var tempFlag1 = checkVal();
                    if(tempFlag1=="0"){
                         return ;
                    }
                    var tempFlag2 = checkNum();
                    if(tempFlag2=="0"){
                         return ;
                    }
                
                        var len = $("#addDetailInfo tr").length;
                        if(len<=0){
                           //utilsFp.confirmIcon(1,"","","", "%{getText("请添加规则明细信息")}",0,"260","");
                            utilsFp.confirmIcon(3,"","","", "<dict:lang value="请添加规则明细信息" />",0,"260","");
                           return;
                        }
                        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        

                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=bf823f1398534d51ae53171301de34af";
                        document.forms.addForm.submit();
                        
}
</script>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
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
		<bu:set name="paraMapObj" value="${dataId}" formId="6ddfecb9814a43318da4c008221c87c6" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="6ddfecb9814a43318da4c008221c87c6" />
	<input type="hidden" name="6ddfecb9814a43318da4c008221c87c6" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'87152898ea214bde8f6ba8618c394d6d'" />
		<s:set name="_$formId_1" value="'6ddfecb9814a43318da4c008221c87c6'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WSR_RULE_SN" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<bu:td cssClass="dec" colNo="WSR_RULE_SN" formId="6ddfecb9814a43318da4c008221c87c6" ><bu:ui colNo="WSR_RULE_SN" formId="6ddfecb9814a43318da4c008221c87c6" value="%{WSR_RULE_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WSR_RULE_NAME" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WSR_RULE_NAME" formId="6ddfecb9814a43318da4c008221c87c6" ><bu:ui colNo="WSR_RULE_NAME" formId="6ddfecb9814a43318da4c008221c87c6" value="%{WSR_RULE_NAME}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WSR_EXPOSE_LIMIT" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<bu:td cssClass="dec" colNo="WSR_EXPOSE_LIMIT" formId="6ddfecb9814a43318da4c008221c87c6" ><bu:ui colNo="WSR_EXPOSE_LIMIT" onkeyup="value=value.replace(/[^\d.]/g,'')" formId="6ddfecb9814a43318da4c008221c87c6" value="%{WSR_EXPOSE_LIMIT}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WSR_BAKE_LIMIT" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<bu:td cssClass="dec" colNo="WSR_BAKE_LIMIT" formId="6ddfecb9814a43318da4c008221c87c6" ><bu:ui colNo="WSR_BAKE_LIMIT" onkeyup="value=value.replace(/[^\d.]/g,'')" formId="6ddfecb9814a43318da4c008221c87c6" value="%{WSR_BAKE_LIMIT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WSR_BAKE_TIMES" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<bu:td cssClass="dec" colNo="WSR_BAKE_TIMES" formId="6ddfecb9814a43318da4c008221c87c6" ><bu:ui colNo="WSR_BAKE_TIMES" formId="6ddfecb9814a43318da4c008221c87c6" value="%{WSR_BAKE_TIMES}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WSR_BAKE_DECAY" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<bu:td cssClass="dec" colNo="WSR_BAKE_DECAY" formId="6ddfecb9814a43318da4c008221c87c6" ><bu:ui colNo="WSR_BAKE_DECAY"  formId="6ddfecb9814a43318da4c008221c87c6" value="%{WSR_BAKE_DECAY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			
			<td class="name" /><bu:uitn colNo="WSR_DEFAULT_FLAG" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<bu:td cssClass="dec" colNo="WSR_DEFAULT_FLAG" formId="6ddfecb9814a43318da4c008221c87c6" ><bu:ui colNo="WSR_DEFAULT_FLAG" formId="6ddfecb9814a43318da4c008221c87c6" value="%{WSR_DEFAULT_FLAG}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSR_MEMO" formId="6ddfecb9814a43318da4c008221c87c6" /></td>
			<bu:td cssClass="dec" colNo="WSR_MEMO" formId="6ddfecb9814a43318da4c008221c87c6" style="height:80px;" colspan="3"><bu:ui colNo="WSR_MEMO" style="width:100%;height:100%;" formId="6ddfecb9814a43318da4c008221c87c6" value="%{WSR_MEMO}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<div class="mod">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="规则明细信息" /></h3>	
        <div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
        	<button type="button" onclick="addMyRow();" style="padding:0;" title="新增">
        		<i class="ico ico-kl-new-add ico-small"></i>
        	</button>
        	<button type="button" onclick="delMyRow();" style="padding:0" title="删除">
        		<i class="ico ico-sc-new-add ico-small"></i>
        	</button>
		</div>
        </div>
        
        	<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view">
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllItems();"/></td >
						
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="烘烤温度(℃)" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="烘烤下限(H)" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="烘烤上限(H)" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="偏差温度(℃)" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"   style="height:185px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addDetailInfo" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
	</div>	 
			<bu:jsVal formId="6ddfecb9814a43318da4c008221c87c6" formIndex="1" />
				
			</div>
		 </form>
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>	
<bu:script viewId="87152898ea214bde8f6ba8618c394d6d" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>
$('#paraMap1_WSR_BAKE_DECAY').bind('keyup', function () {
	            var calwStart=$("#paraMap1_WSR_BAKE_DECAY");
             if(  ! /^(1)$|^100$|^[1-9][0-9]?$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_WSR_BAKE_DECAY'),"<dict:lang value="该项只能为不大于100的数字" />");
             }
         });

</script>	
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 
