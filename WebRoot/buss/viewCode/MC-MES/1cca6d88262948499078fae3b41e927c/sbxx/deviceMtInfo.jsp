<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="VM-设备保养信息" />
    </title>
    <style type="text/css">
	 .datagrid-body1 td{
    		border-width: 0 1px 1px 0;
    		border-style: solid;
    		margin: 0;
    		border-color:#dbe1ef;
	}
    </style>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="4981cf692e39466b9f092273166c00b4"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="ee09ce03efad4c3ab4db3ee14d35661c" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="ee09ce03efad4c3ab4db3ee14d35661c" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage4981cf692e39466b9f092273166c00b4" id="formPage4981cf692e39466b9f092273166c00b4" value="${formPage4981cf692e39466b9f092273166c00b4}"/>
		<input type="hidden" name="formId" id="formId1" value='4981cf692e39466b9f092273166c00b4'/>
		<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
		<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='d6ecb86009984f57b8d7cea32de1e200'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='6194088e0d9e4294b0f17214bfdb0a60'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4981cf692e39466b9f092273166c00b4">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4981cf692e39466b9f092273166c00b4" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner4981cf692e39466b9f092273166c00b4">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4981cf692e39466b9f092273166c00b4" style="">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4981cf692e39466b9f092273166c00b4" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4981cf692e39466b9f092273166c00b4" onclick="_selectAjaxTableAllData(this,'4981cf692e39466b9f092273166c00b4')" style="cursor: pointer;"title="全选"/></span></td>
	    	<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDM_DEVICE_SN" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDM_DEVICE_TYPE" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDM_DEVICE_NAME" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDM_DEVICE_CLASS" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDM_MT_LONG" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDM_MT_MEMO" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDM_MT_EMP" formId="4981cf692e39466b9f092273166c00b4" /></td>
			<td class="datagrid-cell" style="width:160px;"><bu:uitn colNo="CDM_LAST_TIME" formId="4981cf692e39466b9f092273166c00b4" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body1 datagrid-div3 datagrid-body-ajax" id="tableDiv4981cf692e39466b9f092273166c00b4" onscroll="ajaxTableScroll(this,'4981cf692e39466b9f092273166c00b4')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4981cf692e39466b9f092273166c00b4">
		<tbody id="tbody_4981cf692e39466b9f092273166c00b4" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4981cf692e39466b9f092273166c00b4==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4981cf692e39466b9f092273166c00b4&showLoading=0" />
			</div>
		</c:if>
		<div class="panel-ajax datagrid datagrid-div1"  >
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="" style="">
		<div class="datagrid-header">
		<!--<div class="datagrid-header-inner" id="">-->
		<div class="" id="">
		<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="保养项目" /></SPAN> </A>
									
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="更换配件" /></SPAN> </A>
									
								</LI>
								
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
			<div class="mod" >
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head1" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									    <td class="datagrid-cell" style="width:	30px;"></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="项目代码" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="项目名称" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="下限值" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="实际值" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="单位" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="保养内容" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:120px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addDeviceItem_1" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
			</DIV>
			<DIV id="content2" style="display:none" data-tab="tag2">
			<div class="mod" >
			<div class="mod-bd"> 
					<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header">
							<div class="datagrid-header-inner head2" id="" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a5678">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" style="width:	30px;"></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="领料单号" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="配件料号" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="配件数量" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="更换原因" /></td >
										<td class="datagrid-cell" style="width:180px;"><dict:lang value="备注" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll2"   style="height:120px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678" >
								<tbody id="addFitting" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
		 </div>		
		 				</DIV>
		 				

						</DIV>

	</DIV>

		<input type="hidden" id="relColVals" name="relColVals" value='ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="ee09ce03efad4c3ab4db3ee14d35661c" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="ee09ce03efad4c3ab4db3ee14d35661c" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    </div>
</div>
</div>
		</div>

		
<script>
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='4981cf692e39466b9f092273166c00b4'){<%--FM-设备保养信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' onclick=\"showInfo('"+v.ID+"');\" abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center; "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDM_DEVICE_SN')+"' style='"+ms.tdStyle(formId, 'CDM_DEVICE_SN')+"' "+ms.tdEvent(formId, 'CDM_DEVICE_SN')+">")
            arrHtml.push("<span colno='CDM_DEVICE_SN' class='"+ms.uiClass(formId, 'CDM_DEVICE_SN')+"' onclick='itemJump1(\""+v['CDM_DEVICE_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CDM_DEVICE_SN')+" title='"+ms.titleAttr(formId,'CDM_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['CDM_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_DEVICE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CDM_DEVICE_TYPE')+"' style='"+ms.tdStyle(formId, 'CDM_DEVICE_TYPE')+"' "+ms.tdEvent(formId, 'CDM_DEVICE_TYPE')+">")
            arrHtml.push("<span colno='CDM_DEVICE_TYPE' class='"+ms.uiClass(formId, 'CDM_DEVICE_TYPE')+"' style='"+ms.uiStyle(formId, 'CDM_DEVICE_TYPE')+"' "+ms.uiEvent(formId, 'CDM_DEVICE_TYPE')+" title='"+ms.titleAttr(formId,'CDM_DEVICE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CDM_DEVICE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_DEVICE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CDM_DEVICE_NAME')+"' style='"+ms.tdStyle(formId, 'CDM_DEVICE_NAME')+"' "+ms.tdEvent(formId, 'CDM_DEVICE_NAME')+">")
            arrHtml.push("<span colno='CDM_DEVICE_NAME' class='"+ms.uiClass(formId, 'CDM_DEVICE_NAME')+"' style='"+ms.uiStyle(formId, 'CDM_DEVICE_NAME')+"' "+ms.uiEvent(formId, 'CDM_DEVICE_NAME')+" title='"+ms.titleAttr(formId,'CDM_DEVICE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CDM_DEVICE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_DEVICE_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'CDM_DEVICE_CLASS')+"' style='"+ms.tdStyle(formId, 'CDM_DEVICE_CLASS')+"' "+ms.tdEvent(formId, 'CDM_DEVICE_CLASS')+">")
            arrHtml.push("<span colno='CDM_DEVICE_CLASS' class='"+ms.uiClass(formId, 'CDM_DEVICE_CLASS')+"' style='"+ms.uiStyle(formId, 'CDM_DEVICE_CLASS')+"' "+ms.uiEvent(formId, 'CDM_DEVICE_CLASS')+" title='"+ms.titleAttr(formId,'CDM_DEVICE_CLASS','IS_TITLE_ATTR',v)+"' >"+v['CDM_DEVICE_CLASS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_MT_LONG' class='datagrid-cell "+ms.tdClass(formId, 'CDM_MT_LONG')+"' style='text-align:right;"+ms.tdStyle(formId, 'CDM_MT_LONG')+"' "+ms.tdEvent(formId, 'CDM_MT_LONG')+">")
            arrHtml.push("<span colno='CDM_MT_LONG' class='"+ms.uiClass(formId, 'CDM_MT_LONG')+"' style='"+ms.uiStyle(formId, 'CDM_MT_LONG')+"' "+ms.uiEvent(formId, 'CDM_MT_LONG')+" title='"+ms.titleAttr(formId,'CDM_MT_LONG','IS_TITLE_ATTR',v)+"' >"+v['CDM_MT_LONG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_MT_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CDM_MT_MEMO')+"' style='"+ms.tdStyle(formId, 'CDM_MT_MEMO')+"' "+ms.tdEvent(formId, 'CDM_MT_MEMO')+">")
            arrHtml.push("<span colno='CDM_MT_MEMO' class='"+ms.uiClass(formId, 'CDM_MT_MEMO')+"' style='"+ms.uiStyle(formId, 'CDM_MT_MEMO')+"' "+ms.uiEvent(formId, 'CDM_MT_MEMO')+" title='"+ms.titleAttr(formId,'CDM_MT_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CDM_MT_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_MT_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CDM_MT_EMP')+"' style='text-align:center;"+ms.tdStyle(formId, 'CDM_MT_EMP')+"' "+ms.tdEvent(formId, 'CDM_MT_EMP')+">")
            arrHtml.push("<span colno='CDM_MT_EMP' class='"+ms.uiClass(formId, 'CDM_MT_EMP')+"' style='"+ms.uiStyle(formId, 'CDM_MT_EMP')+"' "+ms.uiEvent(formId, 'CDM_MT_EMP')+" title='"+ms.titleAttr(formId,'CDM_MT_EMP','IS_TITLE_ATTR',v)+"' >"+v['CDM_MT_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDM_LAST_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CDM_LAST_TIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'CDM_LAST_TIME')+"' "+ms.tdEvent(formId, 'CDM_LAST_TIME')+">")
            arrHtml.push("<span colno='CDM_LAST_TIME' class='"+ms.uiClass(formId, 'CDM_LAST_TIME')+"' style='"+ms.uiStyle(formId, 'CDM_LAST_TIME')+"' "+ms.uiEvent(formId, 'CDM_LAST_TIME')+" title='"+ms.titleAttr(formId,'CDM_LAST_TIME','IS_TITLE_ATTR',v)+"' >"+v['CDM_LAST_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;
    defTableWidthRewrite("4981cf692e39466b9f092273166c00b4");
}

//tab页切换
var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		//document.getElementById("content3").style.display="";
		//document.getElementById("content4").style.display="";
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			$("#" + tag).addClass("current").siblings().removeClass("current");
			if ("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}

//根据设备保养信息id查询保养项目与配件信息
function showInfo(mtId){
var getInfo="${path}buss/bussModel_exeFunc.ms?funcMId=bdb8016d2b5e4ee4bed6032388a03a4a&formId=%{formId}";//VM-设备保养信息 操作功能  根据保养id获取信息
var dataAuth= $("#DATA_AUTH").val();
util.showLoading("处理中...");
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: getInfo,
			    data:{
			        'mtId':mtId,
			        'dataAuth':dataAuth
			    },
				success: function(data){
						util.closeLoading();
						//console.log(data.ajaxList);
						$("#addDeviceItem_1").empty();
						$("#addFitting").empty();
						if(null == data){return ;}
						if(null != data.ajaxMap){
						    
							var mtList =data.ajaxMap.mtList;
								console.log(mtList);
							var fittingList =data.ajaxMap.fittingList;
							var tempItemClass;
							for(var i = 0;i < mtList.length; i++){
								if(mtList[i].CDMI_ITEM_CODE==null) mtList[i].CDMI_ITEM_CODE="";
								if(mtList[i].CDMI_ITEM_NAME==null) mtList[i].CDMI_ITEM_NAME="";
								if(mtList[i].CDMI_ITEM_CLASS==0)	tempItemClass="范围值";
								if(mtList[i].CDMI_ITEM_CLASS==1)	tempItemClass="固定值";
								if(mtList[i].CDMI_ITEM_CLASS==2)	tempItemClass="状态值";
								if(mtList[i].CDMI_ITEM_MAXVALUE==null||mtList[i].CDMI_ITEM_MAXVALUE=='undefined') mtList[i].CDMI_ITEM_MAXVALUE="";
								if(mtList[i].CDMI_ITEM_MINVALUE==null||mtList[i].CDMI_ITEM_MINVALUE=='undefined') mtList[i].CDMI_ITEM_MINVALUE="";
								if(mtList[i].CDMI_ITEM_REAL==null) mtList[i].CDMI_ITEM_REAL="";
								if(mtList[i].CDMI_ITEM_UNIT==null) mtList[i].CDMI_ITEM_UNIT="";
								if(mtList[i].CDMI_MT_CONTENT==null) mtList[i].CDMI_MT_CONTENT="";
			
        
								$("#addDeviceItem_1").append("<tr id='"+mtList[i].ID+"' name='"+mtList[i].ID+"'></tr>");
	                            $("#addDeviceItem_1 tr:last").append("<td class='datagrid-cell' style='width:30px;'>"+(i+1)+"</td>");
								$("#addDeviceItem_1 tr:last").append("<td class='datagrid-cell' style='width:180px;' title='"+mtList[i].CDMI_ITEM_CODE+"'>"+mtList[i].CDMI_ITEM_CODE+"</td>");
								$("#addDeviceItem_1 tr:last").append("<td class='datagrid-cell' style='width:180px;' title='"+mtList[i].CDMI_ITEM_NAME+"'>"+mtList[i].CDMI_ITEM_NAME+"</td>");
								$("#addDeviceItem_1 tr:last").append("<td class='datagrid-cell' style='width:180px;text-align:center;' title='"+tempItemClass+"' >"+tempItemClass+"</td>");
								$("#addDeviceItem_1 tr:last").append("<td class='datagrid-cell' style='width:180px;text-align:right;' title='"+mtList[i].CDMI_ITEM_MAXVALUE+"'>"+mtList[i].CDMI_ITEM_MAXVALUE+"</td>");
								$("#addDeviceItem_1 tr:last").append("<td class='datagrid-cell' style='width:180px;text-align:right;' title='"+mtList[i].CDMI_ITEM_MINVALUE+"'>"+mtList[i].CDMI_ITEM_MINVALUE+"</td>");
								if(mtList[i].CDMI_ITEM_CLASS!=2){
										   	$("#addDeviceItem_1 tr:last").append("<td class='datagrid-cell' style='width:180px;text-align:right;' title='"+mtList[i].CDMI_ITEM_REAL+"'>"+mtList[i].CDMI_ITEM_REAL+"</td>");
										}else{
										    if(mtList[i].CDMI_ITEM_REAL==0){
										    $("#addDeviceItem_1 tr:last").append("<td class='datagrid-cell' style='width:180px;text-align:right;' title='OK'>"+"OK"+"</td>");
										}else{
										    $("#addDeviceItem_1 tr:last").append("<td class='datagrid-cell' style='width:180px;text-align:right;' title='NG'>"+"NG"+"</td>");
										}
										}
								$("#addDeviceItem_1 tr:last").append("<td class='datagrid-cell' style='width:180px;' title='"+mtList[i].CDMI_ITEM_UNIT+"'>"+mtList[i].CDMI_ITEM_UNIT+"</td>");
								$("#addDeviceItem_1 tr:last").append("<td class='datagrid-cell' style='width:180px;' title='"+mtList[i].CDMI_MT_CONTENT+"'>"+mtList[i].CDMI_MT_CONTENT+"</td>");
								
							}

							for(var j = 0;j < fittingList.length; j++){
								if(fittingList[j].CDF_ITEM_LIST==null) fittingList[j].CDF_ITEM_LIST="";
								if(fittingList[j].CDF_ITEM_CODE==null) fittingList[j].CDF_ITEM_CODE="";
								if(fittingList[j].CI_ITEM_NAME==null) fittingList[j].CI_ITEM_NAME="";
								if(fittingList[j].CI_ITEM_SPEC==null) fittingList[j].CI_ITEM_SPEC="";
								if(fittingList[j].CDF_CHANGE_REASON==null) fittingList[j].CDF_CHANGE_REASON="";
								if(fittingList[j].CDF_MEMO==null) fittingList[j].CDF_MEMO="";

								$("#addFitting").append("<tr id='"+fittingList[j].ID+"' name='"+fittingList[j].ID+"'></tr>");
								 $("#addFitting tr:last").append("<td class='datagrid-cell' style='width:30px;'>"+(j+1)+"</td>");
								$("#addFitting tr:last").append("<td class='datagrid-cell' style='width:180px;' title='"+fittingList[j].CDF_ITEM_LIST+"'>"+fittingList[j].CDF_ITEM_LIST+"</td>");
								$("#addFitting tr:last").append("<td class='datagrid-cell' style='width:180px;' title='"+fittingList[j].CDF_ITEM_CODE+"'><span onclick='itemJump2(\""+fittingList[j].CDF_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+fittingList[j].CDF_ITEM_CODE+"</span></td>");
								$("#addFitting tr:last").append("<td class='datagrid-cell' style='width:180px;' title='"+fittingList[j].CI_ITEM_NAME+"'>"+fittingList[j].CI_ITEM_NAME+"</td>");
								$("#addFitting tr:last").append("<td class='datagrid-cell' style='width:180px;' title='"+fittingList[j].CI_ITEM_SPEC+"'>"+fittingList[j].CI_ITEM_SPEC+"</td>");
								$("#addFitting tr:last").append("<td class='datagrid-cell' style='width:180px;' text-align:right;title='"+fittingList[j].CDF_ITEM_NUM+"'>"+fittingList[j].CDF_ITEM_NUM+"</td>");
								$("#addFitting tr:last").append("<td class='datagrid-cell' style='width:180px;' title='"+fittingList[j].CDF_CHANGE_REASON+"'>"+fittingList[j].CDF_CHANGE_REASON+"</td>");
								$("#addFitting tr:last").append("<td class='datagrid-cell' style='width:180px;' title='"+fittingList[j].CDF_MEMO+"'>"+fittingList[j].CDF_MEMO+"</td>");
							}
							
						}
						//pageFun(data.ajaxPage,"formId2");
							var tableTrJs1 = $("#addDeviceItem_1 tr");
							_tongLineColor(tableTrJs1);
							var tableTrJs2 = $("#addFitting tr");
							_tongLineColor(tableTrJs2);
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
						//newScroll(".datagrid-body2")
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

function initHeight(){
	
}

$(function(){
$("#tag1").addClass("current");
$("#57a4f3f308e9426d953f983d118bd1d4").attr("style","display:none;");
})
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//设备建档
function itemJump1(obj){
      winOptMethod.jump("574da5a0885547d58d4ea2db64af2158","F3181","jumpId",obj);
}  


//物料信息
function itemJump2(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 

</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll2','.head2');
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
