<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="APP功能配置" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="cde7667fb3bc47d1b64355437e9de4ef"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
    <style type="text/css">
    ._data button{
			height: 22px;
		    width: 70px;
		    margin-top: 1px;
		    background-color: #75c4ff;
		    border: 0;
		    border-radius: 2px;
		    color: #fff;
		    cursor:pointer;
		}
		
		._data button:hover{
			background-color: #369EEE;
		}
		._pic{
			display:inline-block;
			height:26px;
			width:26px;
			background-color:#dbdbdb;
			border-radius:50%;
			position: relative;
		}
		
		._pic .small_button{
			height: 10px;
		    width: 10px;
		    position: absolute;
		    background-image: url(plf/page/fp/img/ico-set-pic.png);
		    bottom: 0;
		    right: 0;
		    cursor:pointer;
		}


    </style>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="5392c5573d3f4f58bff89fd5af482aa7" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="5392c5573d3f4f58bff89fd5af482aa7" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagecde7667fb3bc47d1b64355437e9de4ef" id="formPagecde7667fb3bc47d1b64355437e9de4ef" value="${formPagecde7667fb3bc47d1b64355437e9de4ef}"/>
		<input type="hidden" name="formId" id="formId1" value='cde7667fb3bc47d1b64355437e9de4ef'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="aaa" name="aaa" value='${index.picName}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="cde7667fb3bc47d1b64355437e9de4ef">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxcde7667fb3bc47d1b64355437e9de4ef" style="width:100%;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head" id="datagrid-header-innercde7667fb3bc47d1b64355437e9de4ef">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablecde7667fb3bc47d1b64355437e9de4ef"  style="">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="cde7667fb3bc47d1b64355437e9de4ef" i18n="1"/></td>
			<!--<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_cde7667fb3bc47d1b64355437e9de4ef" onclick="_selectAjaxTableAllData(this,'cde7667fb3bc47d1b64355437e9de4ef')" style=" width:30px; cursor: pointer;"title="全选"/></span></td> -->
		    <td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="SelectAll" onclick="selectAll();" style=" width:30px; cursor: pointer;"title="全选"/></span></td> 
			<!--	<th style="width:30px;text-align:center;"><input type="checkbox" id="SelectAll" onclick="selectAll();" style="margin:0"></th> -->
			<!--	<td class="datagrid-cell"  style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>  -->
			<td class="datagrid-cell" style="width:165px;"><bu:uitn colNo="TAS_MENU_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<td style="display:none;">
				<dict:selectDict id="menuId" name="menuId" dictCode="MAIN_MENU" />
				<dict:selectDict id="showType" name="showType" dictCode="APP_SHOW_TYPE" />
				<dict:selectDict id="isCheck" name="isCheck" dictCode="YOrN" />
			</td >
		
			<td class="datagrid-cell"  style="width:165px;"><bu:uitn colNo="TAS_MOUDLE_ID" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<td class="datagrid-cell"  style="width:165px;"><bu:uitn colNo="TAS_SHOW_TYPE" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<td class="datagrid-cell"  style="width:165px;"><bu:uitn colNo="TAS_FUN_NAME" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			<td class="datagrid-cell"  style="width:165px;"><dict:lang value="数据" /></td>
			<td class="datagrid-cell"  style="width:165px;"><dict:lang value="图片" /></td>
		<!--	<td class="datagrid-cell"  style="width:100px;"><bu:uitn colNo="TAS_IS_DEFAULT" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td> -->
			<td class="datagrid-cell"  style="width:165px;"><bu:uitn colNo="TAS_SEQ" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
		<!--	<td class="datagrid-cell"  style="width:100px;"><bu:uitn colNo="TAS_STATUS" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td> -->
			
		<!--	<td class="datagrid-cell"  style="width:30px;"><bu:uitn colNo="TAS_DISPLAY_MODE" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td> -->
			<td class="datagrid-cell"  style="width:165px;"><bu:uitn colNo="TAS_FUNCTION_LINK" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td>
			
		<!--	<td class="datagrid-cell"  style="width:30px;"><bu:uitn colNo="TAS_UNIT" formId="cde7667fb3bc47d1b64355437e9de4ef" /></td> -->
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll" id="tableDivcde7667fb3bc47d1b64355437e9de4ef" >
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajaxcde7667fb3bc47d1b64355437e9de4ef" style="table-layout: fixed;">
		<tbody id="addAppInfo">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagecde7667fb3bc47d1b64355437e9de4ef==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=cde7667fb3bc47d1b64355437e9de4ef&showLoading=0" />
			</div>
		</c:if>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />
		
               </form>
               <form id="submit_Form" name="submitForm" action="" target="submitFrame" method="post">
                <table id="submitTable" style="display: none;" >
        		</table>
        	  </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="5392c5573d3f4f58bff89fd5af482aa7" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="5392c5573d3f4f58bff89fd5af482aa7" />
    
<script>
function alertInfo(msg){
	utilsFp.confirmIcon(3,"","","", msg,0,"300","");
}
function reloadPg(msg,title,width,height,time){
    msgPop(msg,"",title,width,height,time);
    queryMoudleInfo();
}
$(function(){
	queryMoudleInfo();
});
function query(){

    $('.scroll').mCustomScrollbar("destroy");
    queryMoudleInfo();	
    setPopScroll('.scroll','.head');
    $('.head')[0].scrollLeft = 0

	
}




//复选框功能
function selectAll(){
		if ($("#SelectAll").prop("checked")){
			$(":checkbox").prop("checked",true);
			$("#adminDataList :checkbox").parents("tr").addClass("selected");
		}else{
			$(":checkbox").prop("checked",false);
			$("#adminDataList :checkbox").parents("tr").removeClass("selected");
		}
	}


//加载导航菜单下拉框
function setAselect1(obj){
    var sid = obj.id;
    var sval = obj.value;
    var ssid =sid.replace("menu","smenu");
    
    //var intid2 = sid.replace("smenu","intmenu");
    
    
    
    	$("#"+sid).removeAttr('onclick');
    	$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=d8844bf06cb94c0291a7e92f86bb0751",
			    data: {
			    	"selectType" : "1"
			    },
				success: function(data){
				    var list = data.ajaxList;
				    $("#"+sid).empty();
				    $("#"+sid).append("<select id='"+ssid+"' name='"+ssid+"' style='width:100px;' onchange='chgAselect1(this)'></select>");
				    $("#"+ssid).append("<option value=''>--请选择--</option>");
				    for(var i=0;i<list.length;i++){
				    $("#"+ssid).append("<option value="+list[i].CODE+">"+list[i].VALUE+"</option>");    
				    }
				    //$("#"+sid).trigger("chosen:updated");
				},error: function(){
				    
				}
				});
}
function chgAselect1(obj){
    var sid = obj.id;
    var sval = obj.value;
    var mid = sid.replace("smenu","moudle");
    var intid = sid.replace("smenu","intmenu");
    $('#'+intid).val(sval);
    //alert(mid);
    $("#"+mid).empty();
    var smenuId = mid.replace("moudle","smenu");
    var menuId = $("#"+smenuId).val();
    var ssid =mid.replace("moudle","smoudle");
    $("#"+mid).removeAttr('onclick');
    	$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=d8844bf06cb94c0291a7e92f86bb0751",
			    data: {
			    	"menuId" : menuId,
			    	"selectType" : "2"
			    },
				success: function(data){
				    var list = data.ajaxList;
				    $("#"+mid).empty();
				    $("#"+mid).append("<select id='"+ssid+"' style='width:100px;' onchange='chgAselect2(this)'></select>");
				    $("#"+ssid).append("<option value=''>--请选择--</option>");
				    for(var i=0;i<list.length;i++){
				    $("#"+ssid).append("<option value="+list[i].ID+">"+list[i].TAM_MOUDLE_NAME+"</option>");    
				    }
				    //$("#"+sid).trigger("chosen:updated");
				},error: function(){
				   alert("error"); 
				}
				});    
}
function setAselect2(obj){
    var sid = obj.id;
    var sval = obj.value;
    var smenuId = sid.replace("moudle","menu");
    
    /*
     $('#'+intid).val(sval);
    //alert(mid);
    $("#"+mid).empty();
    var smenuId = mid.replace("moudle","smenu");
    var menuId = $("#"+smenuId).val();
    //var ssid =mid.replace("moudle","smoudle");
    */
     
    
    
    var menuId = $("#"+smenuId).text();

    var ssid =sid.replace("moudle","smoudle");
    
    
    $("#"+sid).removeAttr('onclick');
    	$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=8605d82b2bd945acbd3307dd0282dcaf",
			    data: {
			    	"menuId" : menuId
			    },
				success: function(data){
				    var list = data.ajaxList;
				  
				    $("#"+sid).empty();
				    $("#"+sid).append("<select id='"+ssid+"' style='width:100px;' onchange='chgAselect2(this)'></select>");
				    $("#"+ssid).append("<option value=''>--请选择--</option>");
				    for(var i=0;i<list.length;i++){
				    $("#"+ssid).append("<option value="+list[i].ID+">"+list[i].TAM_MOUDLE_NAME+"</option>");    
				    }
				    //$("#"+sid).trigger("chosen:updated");
				},error: function(){
				   // alert("1");
				}
				});
}



function chgAselect2(obj){
    var sid = obj.id;
    var sval = obj.value;
    var intid = sid.replace("smoudle","intmoudle");
    $('#'+intid).val(sval);
 
}





function setAselect3(obj){
    //alert("加载导航菜单下拉框");
    var sid = obj.id;
    var sval = obj.value;
    var ssid =sid.replace("type","stype");
    
    
    /*
     var intid = sid.replace("type","inttype");
    $('#'+intid).val(sval);
    //alert(mid);
    $("#"+mid).empty();
    var smenuId = mid.replace("stype","type");
    var menuId = $("#"+smenuId).val();
    var ssid =mid.replace("type","stype");
    */
    
    
    
    $("#"+sid).removeAttr('onclick');
    	$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=d8844bf06cb94c0291a7e92f86bb0751",
			    data: {
			    	"selectType" : "3"
			    },
				success: function(data){
				    var list = data.ajaxList;
				    $("#"+sid).empty();
				    $("#"+sid).append("<select id='"+ssid+"' style='width:100px;' onchange='chgAselect3(this)'></select>");
				    $("#"+ssid).append("<option value=''>--请选择--</option>");
				    for(var i=0;i<list.length;i++){
				    $("#"+ssid).append("<option value="+list[i].CODE+">"+list[i].VALUE+"</option>");    
				    }
				    //$("#"+sid).trigger("chosen:updated");
				},error: function(){
				    
				}
				});
}

function chgAselect3(obj){
    var sid = obj.id;
    var sval = obj.value;
    var intid = sid.replace("stype","inttype");
      $('#'+intid).val(sval);

}

//加载功能配置信息
function queryMoudleInfo(){
  	var menuId = $("#TAS_MENU_ID").val();
  	var moudleId = $("#TAS_MOUDLE_ID").val();
  	var funName = $("#TAS_FUN_NAME").val();
  	
  	util.showLoading("处理中...");
	$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=191249b20458471e857675c5c8dab4fd",
			    data: {
			    	"menuId" : menuId,
			    	"moudleId" :  moudleId,
			    	"funName" :  funName
			    
			    },
				success: function(data){
				        $("#addAppInfo").empty();
						util.closeLoading();
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
						
							
							for(var i=0;i<rccList.length;i++){

							 //   var arrHtml = [];
							// if(rccList[i].DATA_AUTH==null) rccList[i].DATA_AUTH="";
								var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
								var menuIdOp = $("#menuId").html();
								var menuIdOption = menuIdOp.substring(menuIdOp.indexOf('<option'));
								var menuIdSel = "<select id='menuId"+(i+1)+"' name='menuId' class=' input isSubmit 'style=' cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;' onchange=\"changeShowType('"+(i+1)+"')\";onchange='setModify(this);'><option value=''>--请选择--</option>"+ menuIdOption +"</select>";
								var showTypeOp = $("#showType").html();
								var showTypeOption = showTypeOp.substring(showTypeOp.indexOf('<option'));
								var showTypeSel = "<select id='showType"+(i+1)+"' name='showType' class=' input isSubmit ' style=' cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;' onchange='setModify(this);'><option value=''>--请选择--</option>"+ showTypeOption +"</select>";
								var isCheckOp = $("#isCheck").html();
								var isCheckOption = isCheckOp.substring(isCheckOp.indexOf('<option'));
							 //   var isDefaultSel = "<select id='isDefault"+(i+1)+"' name='isDefault'  class=' input isSubmit   onfocus'this.defaultIndex=this.selectedIndex; 'onchange='this.selectedIndex=this.defaultIndex;' 'style='cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;' onchange='setModify(this);showDefaultSel(this)'>"+ isCheckOption +"</select>";
							//var isDefaultSel = "<select id='isDefault"+(i+1)+"' name='isDefault' class=' input isSubmit 'style='cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;' onchange='setModify(this);'>"+ isCheckOption +"</select>";
						   	//var isStatusSel = "<select id='isStatus"+(i+1)+"' name='isStatus' class=' input isSubmit 'style=' cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;'  onchange='setModify(this);setShowDefault(this)'>"+ isCheckOption +"</select>";
						    
						    //	var isStatusSel = "<select id='isStatus"+(i+1)+"' name='isStatus' class=' input isSubmit 'style=' cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;' onchange='setModify(this);'>"+ isCheckOption +"</select>";
						    	
						    	var arrHtml = [];
						    	
						    	
						    	
						    	
						    	//var displayModeOp = $("#displayMode").html();
						    	//alert(displayModeOp);
								//var displayModeOption = displayModeOp.substring(displayModeOp.indexOf('<option'));
								//var displayModeSel = "<select id='displayMode"+(i+1)+"' name='displayMode' class=' input isSubmit ' style='cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;'><option value=''>--请选择--</option>"+ displayModeOption +"</select>";
						    	
						    	
						    	
						    	
						    	
								
								if(rccList[i].TAS_FUN_NAME==null) rccList[i].TAS_FUN_NAME="";
								if(rccList[i].TAS_SEQ==null) rccList[i].TAS_SEQ="";
								if(rccList[i].TAS_FUNCTION_LINK==null) rccList[i].TAS_FUNCTION_LINK="";
						     //	if(rccList[i].TAS_UNIT==null) rccList[i].TAS_UNIT=""; 
								
								var jsObj = {};
								if(rccList[i].TAS_DATA_CONTENT!=null){
								    jsObj = JSON.parse(rccList[i].TAS_DATA_CONTENT);
								}
								
								
								
								arrHtml.push("<tr class='datagrid-row "+backgroudColor+"' id='"+(i+1)+"' style=' width:30px; cursor: pointer;'>");
								arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+(i+1)+"</span></td>");
							    arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
							    arrHtml.push("<input type='checkbox' name='selectName' id='"+rccList[i].ID+"' value='"+rccList[i].ID+"' class='isSubmit _selectdata' style='width:30px; onchange='setModify(this);' cursor: pointer;margin:0'>");
							    arrHtml.push("</td>");
							   
							   // arrHtml.push("<td class='datagrid-cell ' style='width:200px;' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</td>");
							   
							    arrHtml.push("<td  class='datagrid-cell ' style='width:100px;text-align:center;padding:0;'>");
							    arrHtml.push("<span id='menu_"+rccList[i].ID+"' style='width:100px;' onclick='setAselect1(this)'>"+rccList[i].FUNCNAME+"</span><input type='hidden'  name='menuId' id='intmenu_"+rccList[i].ID+"' value='"+rccList[i].TAS_MENU_ID+"' >");
							    arrHtml.push("</td>");	
							    arrHtml.push("<td  class='datagrid-cell ' style='display:none; text-align:center;padding:0;'>");
							    arrHtml.push("</td>");
							    arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
							    arrHtml.push("<span  id='moudle_"+rccList[i].ID+"' style='width:100px;' onchange='setModify(this);' onclick='setAselect2(this)'>"+rccList[i].TAM_MOUDLE_NAME+"</span><input type='hidden' name='moudleId' id='intmoudle_"+rccList[i].ID+"' value='"+rccList[i].TAS_MOUDLE_ID+"' >");//
							    arrHtml.push("</td>");
							    arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
							    arrHtml.push("<span  id='type_"+rccList[i].ID+"' style='width:100px;' onchange='setModify(this);' onclick='setAselect3(this)'>"+rccList[i].TYPENAME+"</span><input type='hidden' name='showType' id='inttype_"+rccList[i].ID+"' value='"+rccList[i].TAS_SHOW_TYPE+"' >");
							    arrHtml.push("</td>");
							    arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;'>");
							    arrHtml.push("<input type='text' id='funName"+(i+1)+"' name='funName_1' maxlength='50' value='"+rccList[i].TAS_FUN_NAME+"' onchange='setModify();' onblur='Modify(this,"+(i+1)+")'  style='width: 100%;text-align:center;border:0px;background-color:transparent;'/>");
							    arrHtml.push("</td>");
							   
							   
							    arrHtml.push("<td class='_data' style='width:100px; text-align:center;'>");
							    if(rccList[i].TAS_DATA_TYPE!=null){
							    	arrHtml.push("<button type='button' id='button_id"+(i+1)+"' onclick='setDatabase(this);setModify(this)' title='单击配置数据源' class='isSubmit' >已配置</button>");
							    }else{
							    	arrHtml.push("<button type='button' id='button_id"+(i+1)+"' onclick='setDatabase(this);setModify(this)' title='单击配置数据源' class='isSubmit' >未配置</button>");
							    }
							    arrHtml.push("<input type='hidden' name='dataType' value='"+rccList[i].TAS_DATA_TYPE+"' id='DATA_TYPE"+(i+1)+"' class='isSubmit' onchange='setModify(this);' />");
							    arrHtml.push("<input type='hidden' name='paraArgs' value='' id='PARA_ARGS"+(i+1)+"' class='isSubmit' />");
							    arrHtml.push("<textarea name='dataComment' cols='' rows='' wrap='off' id='DATA_COMMENT"+(i+1)+"' class='isSubmit' style='width:30px; display:none;word-wrap: normal;'></textarea>");
							    arrHtml.push("<input type='hidden' name='classCode' value='' id='MS_CLASS_CODE_ID"+(i+1)+"' class='isSubmit' />");
							    arrHtml.push("<input type='hidden' name='codeType' value='' id='CODE_TYPE"+(i+1)+"' class='isSubmit'/>");
							    arrHtml.push("<input type='hidden' name='className' value='' id='CLASS_NAME"+(i+1)+"' class='isSubmit' />");
							    arrHtml.push("<textarea name='commSql' cols='' rows='' wrap='off' id='COMM_SQL"+(i+1)+"' class='isSubmit' style='width:100px; display:none;word-wrap: normal;'>"+jsObj.commql+"</textarea>");
							    arrHtml.push("<textarea name='sqlserverSql' cols='' rows='' wrap='off' id='SQLSERVER_SQL"+(i+1)+"' class='isSubmit' style='width:100px; display:none;word-wrap: normal;'>"+jsObj.sqlserver+"</textarea>");
							    arrHtml.push("<textarea name='oracleSql' cols='' rows='' wrap='off' id='ORACLE_SQL"+(i+1)+"' class='isSubmit' style='width:100px; display:none;word-wrap: normal;'>"+jsObj.oracle+"</textarea>");
							    arrHtml.push("<textarea name='mysqlSql' cols='' rows='' wrap='off' id='MYSQL_SQL"+(i+1)+"' class='isSubmit' style='width:100px; display:none;word-wrap: normal;'>"+jsObj.mysql+"</textarea>");
							    arrHtml.push("<textarea name='pgSql' cols='' rows='' wrap='off' id='PG_SQL"+(i+1)+"' class='isSubmit' style='display:none;word-wrap: normal;'>"+jsObj.pg+"</textarea>");
							    arrHtml.push("</td>");
							    
							    if(rccList[i].TAS_PIC_PATH!=null){
							         arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;'>");
    							    arrHtml.push("<div class='_pic'><img src='${path}/plf/userPhoto/"+rccList[i].TAS_PIC_PATH+"?_mc_res_version=20180205' title='双击配置图片'  width='18px' height='18px' style='width:30px;  cursor:pointer;margin-top:3px;'");
    							    arrHtml.push(" id='PIC_URL"+(i+1)+"'  name='picUrl' class='isSubmit'  ondblclick='setPic(this);setModify1(this)'>");
    							    arrHtml.push("<input type='hidden' id='PIC_ID"+(i+1)+"' name='picId' value='"+rccList[i].TAS_PIC_ID+"'  class='isSubmit' /><div class='small_button'></div>");
    							    arrHtml.push("</td>");
							    }else{
							         arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;'>");
    							    arrHtml.push("<div class='_pic'><img src='plf/page/fp/img/ad5.png' title='双击配置图片'  width='18px' height='18px' style='width:30px;  cursor:pointer;margin-top:3px;'");
    							    arrHtml.push(" id='PIC_URL"+(i+1)+"' name='picUrl' class='isSubmit'  ondblclick='setPic(this);setModify1(this)'>");
    							    arrHtml.push("<input type='hidden' id='PIC_ID"+(i+1)+"' name='picId' value='"+rccList[i].TAS_PIC_ID+"' class='isSubmit'/><div class='small_button'></div>");
    							    arrHtml.push("</td>");
							    }
							    
							   
							    
							    
							    
							   // arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
							   // arrHtml.push(isDefaultSel);
							   // arrHtml.push("</td>");
							    arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
							    arrHtml.push("<input type='text' id='showSeq"+(i+1)+"' name='showSeq' maxlength='5' value='"+rccList[i].TAS_SEQ+"'   onblur='Modify(this,"+(i+1)+")'  style='width: 100%;text-align:center;border:0px;background-color:transparent;' onchange='setModify(this);' onkeyup=\"this.value=this.value.replace(/[^0-9]/gi,'')\"/>");
							    arrHtml.push("</td>");
							   // arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
							   // arrHtml.push(isStatusSel);
							   // arrHtml.push("</td>");
							    
							    
							    //arrHtml.push("<td class='datagrid-cell ' style='text-align:center;padding:0;'>");
							    //arrHtml.push(displayModeSel);
							   // arrHtml.push("</td>");
							    
							    
							    
							    arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
							    arrHtml.push("<input type='text' id='functionLink"+(i+1)+"' name='functionLink' maxlength='200' value='"+rccList[i].TAS_FUNCTION_LINK+"' onchange='setModify(this);' style='width:30px; width: 100%;text-align:center;border:0px;background-color:transparent;' />");//onkeyup=\"this.value=this.value.replace(/[^0-9]/gi,'')\"
							    arrHtml.push("</td>");
							    
							   $("#addAppInfo").append(arrHtml.join(""));
							    
							    
							   // arrHtml.push("<td class='datagrid-cell ' style='width:30px; text-align:center;padding:0;'>");
							   // arrHtml.push("<input type='text' id='unit"+(i+1)+"' name='unit' maxlength='100' value='"+rccList[i].TAS_UNIT+"' style='width:30px; width: 100%;text-align:center;border:0px;background-color:transparent;' />");//onkeyup=\"this.value=this.value.replace(/[^0-9]/gi,'')\"
							   // arrHtml.push("</td>");
							    
							    
							    
							    if(rccList[i].TAS_MENU_ID=="1"){ //||rccList[i].TAS_MENU_ID=="4"
                                    $("#showType"+(i+1)).attr("disabled","disabled");
                                }else if(rccList[i].TAS_MENU_ID!=""){
                                	$("#showType"+(i+1)+" option[value='0']").remove();
                                   // $("#funName"+(i+1)).attr("disabled","disabled");
                                }
                                
                              //  if(rccList[i].TAS_STATUS=="N"){ //||rccList[i].TAS_MENU_ID=="4"
                                  //  $("#isDefault"+(i+1)).addClass("readonly","readonly");
                              //     $("#isDefault"+(i+1)).attr("disabled","disabled");
                                    
                                    
                              //  }
                               // else if(rccList[i].TAS_STATUS!=""){
                               // 	$("#isDefault"+(i+1)+" option[value='0']").remove();
                                   // $("#funName"+(i+1)).attr("disabled","disabled");
                              //  }
                                
                             /*   
                            $("#addAppInfo").append(arrHtml.join(""));
							    if(rccList[i].TAS_STATUS=="N"){ //||rccList[i].TAS_MENU_ID=="4"
                                    $("#isDefault"+(i+1)).attr("disabled","disabled");
                                }else if(rccList[i].TAS_MENU_ID!=""){
                                	$("#isDefault"+(i+1)+" option[value='0']").remove();
                                   // $("#funName"+(i+1)).attr("disabled","disabled");
                                }
                                */
                                
                                
                                
                                
                                // $("#addAppInfo").append(arrHtml.join(""));
							    //if(rccList[i].TAS_MENU_ID=="1"||rccList[i].TAS_MENU_ID=="4"){
                                //    $("#displayMode"+(i+1)).attr("disabled","disabled");
                                //}else if(rccList[i].TAS_MENU_ID!=""){
                                //	$("#displayMode"+(i+1)+" option[value='0']").remove();
                                   // $("#funName"+(i+1)).attr("disabled","disabled");
                               // }
                                
                                
                                
                                //获取功能模块
                               
                                //getFunModule(rccList[i].TAS_MENU_ID,(i+1));
                              
							    $("#menuId"+(i+1)).val(rccList[i].TAS_MENU_ID);
							    $("#moudleId"+(i+1)).val(rccList[i].TAS_MOUDLE_ID);
							    $("#showType"+(i+1)).val(rccList[i].TAS_SHOW_TYPE);
							   // $("#isDefault"+(i+1)).val(rccList[i].TAS_IS_DEFAULT);
							   // $("#isStatus"+(i+1)).val(rccList[i].TAS_STATUS);
							   
							   
							   
							   
							   // $("#displayMode"+(i+1)).val(rccList[i].TAS_DISPLAY_MODE);
							    
                              //  $("#addAppInfo").append(arrHtml.join(""));
							}
							
							
							
						}
					  defTableWidthRewrite("cde7667fb3bc47d1b64355437e9de4ef");	
					},
				error: function(msg){
						if(msg.readyState!=0){
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     			       }
				  }
	});
}


//复选框功能
	function selectAll(){
		if ($("#SelectAll").attr("checked")){
			$(":checkbox").attr("checked",true);
			$("#adminDataList :checkbox").parents("tr").addClass("selected");
		}else{
			$(":checkbox").attr("checked",false);
			$("#adminDataList :checkbox").parents("tr").removeClass("selected");
		}
	}




//新增行
function addMyRow(){
	var row_count = $("#addAppInfo tr").length;//总的记录数
	var backgroudColor = (row_count+1)%2 == 0 ? "tr-hover" : "";
	var menuIdOp = $("#menuId").html();
	var menuIdOption = menuIdOp.substring(menuIdOp.indexOf('<option'));
	var menuIdSel = "<select id='menuId"+(row_count+1)+"' name='menuId' class=' input isSubmit 'style='width:30px; cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;' onchange=\"changeShowType('"+(row_count+1)+"')\"><option value=''>--请选择--</option>"+ menuIdOption +"</select>";
	var showTypeOp = $("#showType").html();
	var showTypeOption = showTypeOp.substring(showTypeOp.indexOf('<option'));
	var showTypeSel = "<select id='showType"+(row_count+1)+"' name='showType' class=' input isSubmit ' style='width:30px; cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;'><option value=''>--请选择--</option>"+ showTypeOption +"</select>";
	var isCheckOp = $("#isCheck").html();
	var isCheckOption = isCheckOp.substring(isCheckOp.indexOf('<option'));
	var isDefaultSel = "<select id='isDefault"+(row_count+1)+"' name='isDefault' class=' input isSubmit 'style='width:30px; cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;'>"+ isCheckOption +"</select>";
	var isStatusSel = "<select id='isStatus"+(row_count+1)+"' name='isStatus' class=' input isSubmit 'style='width:30px; cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;' >"+ isCheckOption +"</select>";
	//var isStatusSel = "<select id='isStatus"+(row_count+1)+"' name='isStatus' class=' input isSubmit 'style='width:30px; cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;' onchange='setModify(this);setShowDefault(this)' >"+ isCheckOption +"</select>";
	//var displayModeOp = $("#displayMode").html();
	//var displayModeOption = displayModeOp.substring(displayModeOp.indexOf('<option'));
	//var displayModeSel = "<select id='displayMode"+(row_count+1)+"' name='displayMode' class=' input isSubmit ' style='cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;'><option value=''>--请选择--</option>"+ displayModeOption +"</select>";
	
	var arrHtml = [];
	arrHtml.push("<tr class='datagrid-row "+backgroudColor+"' id='addTr"+(row_count+1)+"' style='width:30px; cursor: pointer;'>");
	arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+(row_count+1)+"</span></td>");
    arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
    arrHtml.push("<input type='checkbox' name='selectName' value='' class='isSubmit _selectdata' style='width:30px; cursor: pointer;margin:0'>");
    arrHtml.push("</td>");
    arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
    arrHtml.push(menuIdSel);
    arrHtml.push("</td>");
    arrHtml.push("<td style='display:none'>");
    arrHtml.push("</td>");
    arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
    arrHtml.push("<select id='moudleId"+(row_count+1)+"' name='moudleId' class=' input isSubmit ' style='cursor: pointer;width:100%;height:100%;border:0;background-color:transparent;'><option value='' >--请选择--</option></select>");
    arrHtml.push("</td>");
    arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
    arrHtml.push(showTypeSel);
    arrHtml.push("</td>");
    
   //var arrHtml = [];
	
    arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;'>");
    arrHtml.push("<input type='text' id='funName"+(row_count+1)+"' name='funName_1'  maxlength='50'     onblur='Modify(this,"+(row_count+1)+")' style='width: 100%;text-align:center;border:0px;background-color:transparent;'/>");
    arrHtml.push("</td>");
    arrHtml.push("<td class='_data' style='width:100px; text-align:center;'>");
    arrHtml.push("<button type='button' id='button_id"+(row_count+1)+"' onclick='setDatabase(this);/*setModify(this)*/' title='单击配置数据源' class='isSubmit' >未配置</button>");
    arrHtml.push("<input type='hidden' name='dataType' value='' id='DATA_TYPE"+(row_count+1)+"' class='isSubmit' />");
    arrHtml.push("<input type='hidden' name='paraArgs' value='' id='PARA_ARGS"+(row_count+1)+"' class='isSubmit' />");
    arrHtml.push("<textarea name='dataComment' cols='' rows='' wrap='off' id='DATA_COMMENT"+(row_count+1)+"' class='isSubmit' style='width:30px; display:none;word-wrap: normal;'></textarea>");
    arrHtml.push("<input type='hidden' name='classCode' value='' id='MS_CLASS_CODE_ID"+(row_count+1)+"' class='isSubmit' />");
    arrHtml.push("<input type='hidden' name='codeType' value='' id='CODE_TYPE"+(row_count+1)+"' class='isSubmit'/>");
    arrHtml.push("<input type='hidden' name='className' value='' id='CLASS_NAME"+(row_count+1)+"' class='isSubmit' />");
    arrHtml.push("<textarea name='commSql' cols='' rows='' wrap='off' id='COMM_SQL"+(row_count+1)+"' class='isSubmit' style='width:30px; display:none;word-wrap: normal;'></textarea>");
    arrHtml.push("<textarea name='sqlserverSql' cols='' rows='' wrap='off' id='SQLSERVER_SQL"+(row_count+1)+"' class='isSubmit' style='width:30px; display:none;word-wrap: normal;'></textarea>");
    arrHtml.push("<textarea name='oracleSql' cols='' rows='' wrap='off' id='ORACLE_SQL"+(row_count+1)+"' class='isSubmit' style='width:30px; display:none;word-wrap: normal;'></textarea>");
    arrHtml.push("<textarea name='mysqlSql' cols='' rows='' wrap='off' id='MYSQL_SQL"+(row_count+1)+"' class='isSubmit' style='width:30px; display:none;word-wrap: normal;'></textarea>");
    arrHtml.push("<textarea name='pgSql' cols='' rows='' wrap='off' id='PG_SQL"+(row_count+1)+"' class='isSubmit' style='width:30px; display:none;word-wrap: normal;'></textarea>");
    arrHtml.push("</td>");
    arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;'>");
    arrHtml.push("<div class='_pic'><img src='plf/page/fp/img/ad5.png' title='双击配置图片'  width='18px' height='18px' style='width:30px; cursor:pointer;margin-top:3px;'");
    arrHtml.push(" id='PIC_URL"+(row_count+1)+"' name='picUrl"+(row_count+1)+"' class='isSubmit' ondblclick='setPic(this);setModify1(this)'>");
    arrHtml.push("<input type='hidden' id='PIC_ID"+(row_count+1)+"' name='picId'  class='isSubmit'/><div class='small_button'></div>");
    arrHtml.push("</td>");
   // arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
   // arrHtml.push(isDefaultSel);
   // arrHtml.push("</td>");
    arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
    arrHtml.push("<input type='text' id='showSeq"+(row_count+1)+"' name='showSeq'  maxlength='5'       onblur='Modify(this,"+(row_count+1)+")'  style='width: 100%;text-align:center;border:0px;background-color:transparent;' onkeyup=\"this.value=this.value.replace(/[^0-9]/gi,'')\"/>");
    arrHtml.push("</td>");
 //   arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
  //  arrHtml.push(isStatusSel);
  //  arrHtml.push("</td>");
    
     arrHtml.push("<td class='datagrid-cell ' style='width:100px; text-align:center;padding:0;'>");
	 arrHtml.push("<input type='text' id='functionLink"+(row_count+1)+"' name='functionLink' maxlength='100' style='width: 100%;text-align:center;border:0px;background-color:transparent;' />");//onkeyup=\"this.value=this.value.replace(/[^0-9]/gi,'')\"
	 arrHtml.push("</td>");
	 
	 
	
    
    
   // arrHtml.push("<td class='datagrid-cell ' style='text-align:center;padding:0;'>");
   //  arrHtml.push(displayModeSel);
  //	arrHtml.push("</td>");
	
	
	
	// arrHtml.push("<td class='datagrid-cell ' style='text-align:center;padding:0;'>");
	 //arrHtml.push("<input type='text' id='functionLink"+(i+1)+"' name='functionLink' maxlength='100' value='"+rccList[i].TAS_FUNCTION_LINK+"' style='width: 100%;text-align:center;border:0px;background-color:transparent;' onkeyup=\"this.value=this.value.replace(/[^0-9]/gi,'')\"/>");
	 //arrHtml.push("</td>");
	
	
	
    defTableWidthRewrite("cde7667fb3bc47d1b64355437e9de4ef");
    
    $("#addAppInfo").append(arrHtml.join(""));
    
}

function setModify1(thisObj){//让当前行被选中
		$(thisObj).parent().parent().parent().find("td").eq(1).find("input[type='checkbox']").prop("checked",true);
	}

function setModify(thisObj){
		$(thisObj).parent().parent().find("td").eq(1).find("input[type='checkbox']").prop("checked",true);
	}
	
function setModify111(){
        
	}
	
	

	
	
	function showDefaultSel(thisObj){
		if("Y" == thisObj.value){
			$(thisObj).parent().parent().find("td").eq(9).find("input").show();
		}else{
			$(thisObj).parent().parent().find("td").eq(9).find("input").hide();
		}
	}
	function setShowDefault(thisObj){
	
	    	//alert(thisObj.value);
	
		if("N" == thisObj.value){
		/*
			$(thisObj).parent().parent().find("td").eq(8).find("select").find("option[value='N']").prop("selected","selected");
			$(thisObj).parent().parent().find("td").eq(8).find("select").attr("disabled","disabled");
			$(thisObj).parent().parent().find("td").eq(9).find("input").hide();
			*/
			
			$(thisObj).parent().parent().find("td").eq(9).find("select").find("option[value='N']").prop("selected","selected");
		//	$(thisObj).parent().parent().find("td").eq(9).find("select").attr("readonly","readonly");
			$(thisObj).parent().parent().find("td").eq(9).find("select").addClass("readonly","readonly");
			$(thisObj).parent().parent().find("td").eq(10).find("input").hide();
		}else{
			
			$(thisObj).parent().parent().find("td").eq(9).find("select").find("option[value='Y']").prop("selected","selected");
		    $(thisObj).parent().parent().find("td").eq(9).find("select").removeAttr("disabled");
			$(thisObj).parent().parent().find("td").eq(10).find("input").show();
		}
	}

	
	






	




function changeShowType(count){
    var menuId = $("#menuId"+count).val();
    if(menuId=="1"){
        $("#showType"+count).val("1");
        $("#showType"+count).attr("disabled","disabled");
        $("#funName"+count).val("");
        $("#funName"+count).removeAttr("disabled");
       // $("#displayMode"+count).val("1");
       // $("#displayMode"+count).attr("disabled","disabled");
    }else if(menuId!=""){
    	$("#showType"+count+" option[value='0']").remove();
        $("#showType"+count).val("");
        $("#showType"+count).removeAttr("disabled");
        $("#funName"+count).val("");
        $("#funName"+count).removeAttr("disabled");
        
       // $("#displayMode"+count+" option[value='0']").remove();
       // $("#displayMode"+count).val("");
       // $("#displayMode"+count).removeAttr("disabled");
    }else{
    	$("#showType"+count).empty();
    	var showTypeOp = $("#showType").html();
		var showTypeOption = showTypeOp.substring(showTypeOp.indexOf('<option'));
		$("#showType"+count).append("<option value='' >--请选择--</option>"+showTypeOption);
		
	//	$("#displayMode"+count).empty();
    //	var showTypeOp = $("#displayMode").html();
	//	var showTypeOption = showTypeOp.substring(showTypeOp.indexOf('<option'));
	//	$("#displayMode"+count).append("<option value='' >--请选择--</option>"+displayModeOption);
    }
    //获取功能模块
    getFunModule(menuId,count);
}

/*
function changeisDefault(count){
    var isStatus = $("#isStatus"+count).val();
    if(isStatus=="N"){
        $("#isDefault"+count).val("	N");
        $("#isDefault"+count).attr("disabled","disabled");
    }else {
        $("#isDefault"+count).val("Y");
        $("#isDefault"+count).removeAttr("disabled");
       // $("#displayMode"+count+" option[value='0']").remove();
       // $("#displayMode"+count).val("");
       // $("#displayMode"+count).removeAttr("disabled");
    }
	//	$("#displayMode"+count).empty();
    //	var showTypeOp = $("#displayMode").html();
	//	var showTypeOption = showTypeOp.substring(showTypeOp.indexOf('<option'));
	//	$("#displayMode"+count).append("<option value='' >--请选择--</option>"+displayModeOption);
    //获取功能模块
    getFunModule(isStatus,count);
}
*/


//获取功能模块

var moudleOpt = "";
function getFunModule(menuId,count){
    	//alert(menuId);
	moudleOpt = "<option value='' >--请选择--</option>";
	util.showLoading("处理中...");
	$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=d8844bf06cb94c0291a7e92f86bb0751",
			    data: {
			    	"menuId" : menuId,
			    	"selectType":"2"
			    },
			    async:false,
				success: function(data){
						util.closeLoading();
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
						
							for(var i=0;i<rccList.length;i++){
								moudleOpt += "<option value='"+rccList[i].ID+"'>"+rccList[i].TAM_MOUDLE_NAME+"</option>";
							}
							$("#moudleId"+count).empty();
                            $("#moudleId"+count).append(moudleOpt);
						}
						defTableWidthRewrite("cde7667fb3bc47d1b64355437e9de4ef");
					},
				error: function(msg){
				        	//	alert("l");
						if(msg.readyState!=0){
     					util.closeLoading();
			    		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     			       }
				  }
	});
}

function setPic(thisObj){
		var picUrlId=$(thisObj).attr("id");//图片Url的img标签的ID
		var picIdId=$(thisObj).siblings().attr("id");//图片Id的输入框ID
		var picIdValue=$(thisObj).siblings().attr("value");//图片Id的值
		var iframeId=window.name;//获取当前iframId
	


	showPopWinFp("sys/AdminTargetDataAction_goToSetPic.ms?picIdId="+picIdId+"&picIdValue="+picIdValue+"&iframeId="+iframeId+"&picUrlId="+picUrlId, 482, 500,null,''+"<dict:lang value="图片配置" />","setPicIframe");
		
}
function saveMoudle(){

//undefined

//alert($("#smenu_1").val());

                				var i=0;
                				var doc ;
                				var menuidd;
            			 $("#addAppInfo tr").each(function(seq) {
                         if($(this).find(":checkbox").prop("checked")){
			 if(i==0){
			  doc = $(this).attr("id"); 
			  menuidd=$("#ssmenu_1"+doc).val();
			 }else{
			  doc = doc + "," + $(this).attr("id"); 
			 menuidd=menuidd+ "," +$("#ssmenu_1"+$(this).attr("id")).val();
			 }
			 i++;
                         }
		}); 
	
		
		
		
	//	$("#this").removeAttr("disabled");
		
		
		
    getSubmitTable();
  
    var falg = 0;
    $("input[name='selectName']:checkbox").each(function(){
         if ($(this).attr("checked")) { 
			falg =1;
			return false;
		 } 
    });
    if(falg==1){
    	$("#submitTable :input[name='menuId']").each(function(){
    		if($(this).val()==""){
    			utilsFp.confirmIcon(1,"","","","<dict:lang value="导航菜单不能为空" />",0,"260","");
    			falg = 0;
				return false;
    		}
    	});
    	if(falg==0){
    	    return;
    	}
    	$("#submitTable :input[name='moudleId']").each(function(){
    		if($(this).val()==""){
    			utilsFp.confirmIcon(1,"","","","<dict:lang value="功能模块不能为空" />",0,"260","");
				falg = 0;
				return false;
    		}
    	});
    	if(falg==0){
    	    return;
    	}
    	$("#submitTable :input[name='showType']").each(function(){
    		if($(this).val()==""){
    			utilsFp.confirmIcon(1,"","","","<dict:lang value="显示类型不能为空" />",0,"260","");
				falg = 0;
				return false;
    		}
    		$(this).removeAttr("disabled");
    	});
    	if(falg==0){
    	    return;
    	}
    	$("#submitTable :input[name='funName']").each(function(){
    		if($(this).val()==""&&!$(this).attr("disabled")){
    			utilsFp.confirmIcon(1,"","","","<dict:lang value="功能细项不能为空" />",0,"260","");
				falg = 0;
				return false;
    		}
    	});
    	if(falg==0){
    	    return;
    	}
    	$("#submitTable :input[name='dataType']").each(function(){
    		if($(this).val()==""){
    			utilsFp.confirmIcon(1,"","","","<dict:lang value="数据源配置不能为空" />",0,"260","");
				falg = 0;
				return false;
    		}
    	});
    	
    	
    		if(falg==0){
    	    return;
    	}
    	
    	
    	
    	//顺序不可以为空
    	$("#submitTable :input[name='showSeq']").each(function(){
    		if($(this).val()==""){
    			utilsFp.confirmIcon(1,"","","","<dict:lang value="显示顺序不能为空" />",0,"260","");
				falg = 0;
				return false;
    		}
    	});
    	
    	
    		if(falg==0){
    	    return;
    	}
    	
    	//$("#submitTable :input[name='displayMode']").each(function(){
    	//	if($(this).val()==""){
    	//		utilsFp.confirmIcon(1,"","","","<dict:lang value="显示方式不能为空" />",0,"260","");
		//		falg = 0;
		//		return false;
    	//	}
    	//	$(this).removeAttr("disabled");
    //	});
    	
    	
    	
    	if(falg==0){
    	    return;
    	}
    	$("#submitTable input[name='showType']").each(function(){
    		$(this).removeAttr("disabled");
    	});
    	$("#submitTable input[name='funName']").each(function(){
    		$(this).removeAttr("disabled");
    	});
    		
    		//$("isDefault").removeAttr("disabled");
    	
    	
    	//document.forms.submit_Form.action="/N2/sys/AdminTargetDataAction_editAdminTargetDatalist.ms";
    		$("isDefault").removeAttr("disabled");
    	document.forms.submit_Form.action="${path}buss/bussModel_exeFunc.ms?funcMId=1b12b13bae4242898c27163f63595fee";
		document.forms.submit_Form.submit();
    }else{
    	utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
    	return;
    }
   // getSubmitTable();

}
function getSubmitTable(){
		var submitTable = $("#submitTable");
		submitTable.empty();
    	$("#datagrid-btable-ajaxcde7667fb3bc47d1b64355437e9de4ef").find("tbody tr").each(function (seq){
    	if($(this).find("td").find("input[type='checkbox']").prop("checked")){
    		var rowClone = $(this).clone(true);
				submitTable.append(rowClone);
			}
    	});
}
//删除
function delMoudle(){
    var falg = 0;
    var delId = "";
    $("#datagrid-btable-ajaxcde7667fb3bc47d1b64355437e9de4ef input[name='selectName']:checkbox").each(function(){
         if ($(this).attr("checked")) { 
			falg =1;
			return false;
		 } 
    });
    if(falg==1){
    	getSubmitTable();
    	utilsFp.confirmIcon(1,"","delReal","", "是否确认删除？","1","260","");
        /*$("input[name='selectName']:checked").each(function(i){
           if($(this).val()!=""){
               if(i==0){
                   delId = $(this).val();
               }else{
                   delId = delId + "," + $(this).val();
               }	
               var trid = $(this).parent().parent().parent().attr("id");
			   $("#"+trid).remove();
           }else{
               var trid = $(this).parent().parent().parent().attr("id");
			   $("#"+trid).remove();
           }
        });
        reSort("appInfo");
        $("#appInfo tbody tr").each(function(){
            var trs = $(this).find("td").eq(0).text();
            var backgroudColor = (parseInt(trs)+1)%2 == 0 ? "" : "tr-hover";
            $(this).attr("class","datagrid-row "+backgroudColor);
        });*/
    }else{
        utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
        return;
    }
}
function delReal(){
	document.forms.submit_Form.action="${path}buss/bussModel_exeFunc.ms?funcMId=f0cfd836fe774329a9a067734ac7f2dc";
	document.forms.submit_Form.submit();
	$("#submitTable").empty();
}
function reSort(objid){
    var i = 1;
        $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
}

function Modify(thisObj,trId){
   

   var meuVal=$("#"+trId).find("td").eq(2).find("input[type='hidden']").val();
   
   
   if(meuVal==undefined)
   {
       meuVal=$("#menuId"+trId).val();
   }
  
   
   var mouVal=$("#"+trId).find("td").eq(4).find("input[type='hidden']").val();
   
    if(mouVal==undefined)
   {
       mouVal=$("#moudleId"+trId).val();
   }
   
   var seqVal=$("#"+trId).find("td").eq(9).find("input[type='text']").val();  
   
   if(seqVal==undefined)
   {
       seqVal=$("#showSeq"+trId).val();
   }
    
     $("#datagrid-btable-ajaxcde7667fb3bc47d1b64355437e9de4ef  tbody tr").each(function(i){
        
        var meuId= $(this).find("td").eq(2).find("input[type='hidden']").val();
        var mouId= $(this).find("td").eq(4).find("input[type='hidden']").val();
        var name= $(this).find("td").eq(6).find("input[type='text']").val();
         var seq= $(this).find("td").eq(9).find("input[type='text']").val();
        console.log("meuVal::::"+meuVal);	
        console.log("mouVal::::"+mouVal);
        console.log("seqVal::::"+seqVal);
        if(this.id!=trId){
         console.log("this.id::::"+this.id);	
        console.log("trId::::"+trId);
            if(meuVal==meuId && mouVal==mouId){
            console.log("thisObj.value::::"+thisObj.value);
            console.log("name::::"+name);
            if(thisObj.value==name){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="同一功能模块下功能细项名称相同，请更改" />",0,"260","");
               return false;
            }
            
           
              
            }
            
             if(meuVal==meuId && mouVal==mouId){
            
           if(seqVal==seq){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="同一功能模块下顺序相同，请更改" />",0,"260","");
               return false;
            } 
            
           
              
            }
            
        }
        
        
        
        
      });
  
}


function Modify1(thisObj,trId){
   

   var meuVal1=$("#"+trId).find("td").eq(2).find("input[type='hidden']").val();
   
  
   
   var mouVal1=$("#"+trId).find("td").eq(4).find("input[type='hidden']").val(); 
   
   var seqVal1=$("#"+trId).find("td").eq(9).find("input[type='text']").val();  
    
     $("#datagrid-btable-ajaxcde7667fb3bc47d1b64355437e9de4ef  tbody tr").each(function(row_count){
        
        var meuId1= $(this).find("td").eq(2).find("input[type='hidden']").val();
        var mouId1= $(this).find("td").eq(4).find("input[type='hidden']").val();
        var name1= $(this).find("td").eq(6).find("input[type='text']").val();
         var seq1= $(this).find("td").eq(9).find("input[type='text']").val();
        
        if(this.id!=trId){
         console.log("this.id::::"+this.id);	
        console.log("trId::::"+trId);
            if(meuVal1==meuId1 && mouVal1==mouId1){
            console.log("thisObj.value::::"+thisObj.value);
            console.log("name::::"+name);
            if(thisObj.value==name1){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="同一功能模块下功能细项名称相同，请更改" />",0,"260","");
               return false;
            }
            
           
              
            }
            
             if(meuVal1==meuId1 && mouVal1==mouId1){
            
           if(seqVal1==seq1){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="同一功能模块下顺序相同，请更改" />",0,"260","");
               return false;
            } 
            
           
              
            }
            
        }
        
        
        
        
      });
  
}




       var _alertValMsgCount = 0;
		function _alertVal(obj,msg) {//显示验证信息
		//如果是下拉框，则判断生成的chosen位置，以解决chosen美化过的下拉框显示非空提示信息时，位置错乱的问题
		if(obj.tagName == "SELECT" && $("#"+obj.id+"_chosen")&& $("#"+obj.id+"_chosen").length>0){
			obj = $("#"+obj.id+"_chosen");
		}
				if(null == obj){util.alert("?验证信息对象为空!");
			return false;
		}
			//console.log($(obj).closest("div").html());
		//判断对象是否在tab标签页内，是标签页的，必需含有data-tab标签
		/*if($(obj).closest("div").length > 0 
			&& $(obj).closest("div").attr("data-tab") != undefined && $(obj).closest("div").attr("data-tab") != null){
			var objId = $(obj).closest("div").attr("id");
			//如果该标签页为隐藏状态时，则切换到该标签页
			if(!$("#"+objId).is(":visible")){
				switchTag(""+$(obj).closest("div").attr("data-tab")+"",""+objId+"","");
			}
		 }else{*/
			if($(obj).parents(".datagrid-btable-pop").length > 0 || $(obj).parents(".tabDiv").length > 0){
				switchTag(obj);
			}
			else{
				var divs = $(obj).parents("div");
			 	$.each(divs,function(i,item){
			 		if($(item).attr("data-tab")){
						var objId = $(item).attr("id");
						//如果该标签页为隐藏状态时，则切换到该标签页
						if(!$("#"+objId).is(":visible")){
							switchTag(""+$(obj).closest("div").attr("data-tab")+"",""+objId+"","");
						}
			 			return;
			 		}
			 	});
			}
		 //}
			
		var isShow = $("#_alertValMsgDiv").css("display");
		var offset = $(obj).offset(); //  计算文本框的偏移量
		var location = _getScroll();//新加的代码，计算滚动条的位置
		$("#_alertValMsgDiv").css("left", "0px");
		$("#_alertValMsgDiv").css("top", "0px");
		$("#_alertValMsgDiv").css("z-index", "1330");
		if(_alertValMsgCount == 0){
			$("#_alertValMsgDiv").offset({
				top : offset.top + location.top + $(obj).height() + 5,
				left : offset.left + location.left
			});
		}else{
			$("#_alertValMsgDiv").offset({
				top : offset.top +  $(obj).height() + 5,
				left : offset.left
			});
		}
		//重新设置弹出框的偏移量，根据文本框的位置和滚动条的位置
		$("#_alertValMsgDiv").html(msg);
		$("#_alertValMsgDiv").show();//显示弹出框
		window.setTimeout("_closeValMsg()", 3000);

		obj.focus();
		_alertValMsgCount++;
	}
function _closeValMsg() {
		_alertValMsgCount--;
		if (_alertValMsgCount < 1) {
			$("#_alertValMsgDiv").hide();
		}
	}


function Modifys(){
    
    
      var arr=$("#paraMap1_TAS_MENU_ID").val();
      var arr=$("#paraMap1_TAS_MOUDLE_ID").val();
      var arr=$("#paraMap1_TAS_SEQ").val();
 	
    
}










function setDatabase(thisObj){//跳转到设置数据库页面
		var DATA_TYPE_ID="";
		var DATA_TYPE_VALUE="";
		var PARA_ARGS_ID="";
		var PARA_ARGS_VALUE="";
		var DATA_COMMENT_ID="";
		var DATA_COMMENT_VALUE="";
		var MS_CLASS_CODE_ID_ID="";
		var MS_CLASS_CODE_ID_VALUE="";
		var CODE_TYPE_ID="";
		var CODE_TYPE_VALUE="";
		var CLASS_NAME_ID="";
		var CLASS_NAME_VALUE="";
		var COMM_SQL_ID="";
		var SQLSERVER_SQL_ID="";
		var MYSQL_SQL_ID="";
		var ORACLE_SQL_ID="";
		var PG_SQL_ID="";
		$(thisObj).nextAll().each(function(seq,item){
			if(seq==0){
				DATA_TYPE_VALUE=item.value;
				DATA_TYPE_ID=item.id;
			}if(seq==1){
				PARA_ARGS_ID=item.id;
				PARA_ARGS_VALUE=item.value;
			}if(seq==2){
				DATA_COMMENT_ID=item.id;
				DATA_COMMENT_VALUE=item.value;
			}if(seq==3){
				MS_CLASS_CODE_ID_ID=item.id;
				MS_CLASS_CODE_ID_VALUE=item.value;
			}if(seq==4){
				CODE_TYPE_ID=item.id;
				CODE_TYPE_VALUE=item.value;
			}if(seq==5){
				CLASS_NAME_ID=item.id;
				CLASS_NAME_VALUE=item.value;
			}if(seq==6){
				COMM_SQL_ID=item.id;
			}if(seq==8){
				ORACLE_SQL_ID=item.id;
			}if(seq==7){
				SQLSERVER_SQL_ID=item.id;
			}if(seq==9){
				MYSQL_SQL_ID=item.id;
			}if(seq==10){
				PG_SQL_ID=item.id;
			}
			
		});
		var iframeId=window.name;//获取当前iframId
		var url="${path}buss/bussModel.ms?exeid=8c79c62e76f24a609fc94edd9d947fe7&paraMap.DATA_TYPE_ID="+DATA_TYPE_ID+"&paraMap.DATA_TYPE_VALUE="+DATA_TYPE_VALUE+
		"&paraMap.PARA_ARGS_ID="+PARA_ARGS_ID+"&paraMap.PARA_ARGS_VALUE="+PARA_ARGS_VALUE+
		"&paraMap.DATA_COMMENT_ID="+DATA_COMMENT_ID+"&paraMap.DATA_COMMENT_VALUE="+DATA_COMMENT_VALUE+
		"&paraMap.MS_CLASS_CODE_ID_ID="+MS_CLASS_CODE_ID_ID+"&paraMap.MS_CLASS_CODE_ID_VALUE="+MS_CLASS_CODE_ID_VALUE+
		"&paraMap.CODE_TYPE_ID="+CODE_TYPE_ID+"&paraMap.CODE_TYPE_VALUE="+CODE_TYPE_VALUE+"&paraMap.iframeId="+iframeId+
		"&paraMap.CLASS_NAME_ID="+CLASS_NAME_ID+"&paraMap.CLASS_NAME_VALUE="+CLASS_NAME_VALUE+"&paraMap.BUTTON_ID="+$(thisObj).attr("id")+
		"&paraMap.COMM_SQL_ID="+COMM_SQL_ID+"&paraMap.ORACLE_SQL_ID="+ORACLE_SQL_ID+"&paraMap.SQLSERVER_SQL_ID="+SQLSERVER_SQL_ID+"&paraMap.MYSQL_SQL_ID="+MYSQL_SQL_ID+"&paraMap.PG_SQL_ID="+PG_SQL_ID;
		url = url.replace(/\</g, "%3C"); 
		url = url.replace(/\>/g, "%3E");
		showPopWinFp(url, 750, 500,null,''+"数据源配置","setDataBaseIframe");
}
function _getScroll() { //计算滚动条的位置
		var t, l;
		if (document.documentElement && document.documentElement.scrollTop) {
			t = document.documentElement.scrollTop;
			l = document.documentElement.scrollLeft;
		} else if (document.body) {
			t = document.body.scrollTop;
			l = document.body.scrollLeft;
		} else {
			t = 0;
			l = 0;
		}
		return {
			top : t,
			left : l
		};
	}


</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
