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
		<dict:lang value="影响系数" />
    </title>
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
		<bu:header formId ="334ae8dac2684a3289964a13b26049cd"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="b6e1c5648cb44fb0a03fda0857b1d020" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="b6e1c5648cb44fb0a03fda0857b1d020" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage334ae8dac2684a3289964a13b26049cd" id="formPage334ae8dac2684a3289964a13b26049cd" value="${formPage334ae8dac2684a3289964a13b26049cd}"/>
		<input type="hidden" name="formId" id="formId1" value='334ae8dac2684a3289964a13b26049cd'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="334ae8dac2684a3289964a13b26049cd">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax334ae8dac2684a3289964a13b26049cd" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner334ae8dac2684a3289964a13b26049cd">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable334ae8dac2684a3289964a13b26049cd">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="334ae8dac2684a3289964a13b26049cd" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_334ae8dac2684a3289964a13b26049cd" onclick="_selectAjaxTableAllData(this,'334ae8dac2684a3289964a13b26049cd')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PPQ_PRODUCT_STEP" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PPQ_AREA_SN" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PPQ_DEVICE_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PPQ_MANPOWER_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PPQ_EFFICIENCY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PPQ_QUALITY_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PPQ_DUAL_QUOTIETY" formId="334ae8dac2684a3289964a13b26049cd" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv334ae8dac2684a3289964a13b26049cd" onscroll="ajaxTableScroll(this,'334ae8dac2684a3289964a13b26049cd')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax334ae8dac2684a3289964a13b26049cd">
		<tbody id="tbody_334ae8dac2684a3289964a13b26049cd" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage334ae8dac2684a3289964a13b26049cd==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=334ae8dac2684a3289964a13b26049cd&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="b6e1c5648cb44fb0a03fda0857b1d020" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<!--<bu:script viewId="b6e1c5648cb44fb0a03fda0857b1d020" />-->
    <bu:script viewId="b6e1c5648cb44fb0a03fda0857b1d020" />
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
 <script type="text/javascript">
  var comp;
  
  function addAjax(){
  
    
    
    if(comp!="2"){
    var formId = $("#formId1").val();
    //var url = "${path}buss/bussModel_exeFunc.ms?funcMId=a3ab7a28a24745b49b55621ea6e821ab&formId="+formId+"&iframeId="+_currentFrame;
    var url = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F8732&funcMId=a3ab7a28a24745b49b55621ea6e821ab&formId="+formId+"&iframeId="+_currentFrame;
    showPopWinFp(url, 550,350,null,"新增");
  
    }else{
        utilsFp.confirmIcon(3,"","","", "没有可新增的生产阶别",0,"300","");
    }
    
  }
  
  function ajaxEdit(){
      var selCount = getNewSelectedCount();
      if(selCount==1){
        var formId = $("#formId1").val();
        var url = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F8733&funcMId=db9074410c2d4a21a9db1f23239570b9&formId="+formId+"&dataId="+_selectedEditTr.attr("id")+"&iframeId="+_currentFrame;
        showPopWinFp(url, 800, 350,null,"修改");
    }else{
        return false;
    }
  }
  
  function ajaxDel(){
  var isDataAuth = dataAuthentication();
  
if(!isDataAuth){return false;};
    if(checkNewIsSelected()){
  	utilsFp.confirmIcon(1,"","delConfirm","", "是否确认删除？","1","260","");
    }else{
  	return false;
    }
  }
  
  function delConfirm(){
    var oldUrl = document.forms.listForm.action;
    var oldTarget = document.forms.listForm.target;
    document.forms.listForm.action="${path}buss/bussModel_delAjaxComm.ms?FUNC_CODE=F8734&funcMId=0b63f1017e074f138c885df3eaa50e62";
    document.forms.listForm.target = "submitFrame";
    document.forms.listForm.submit();
    document.forms.listForm.action = oldUrl;
    document.forms.listForm.target = oldTarget;
  }
 

 function getInfo(){
	    	   
	    	    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=254fedbd4e15463c8fdf01e71837ac81"; 
	    	    $.ajax({
	    	        type:"post",
	    	        dataType:"json",
	    	        data:"",
	    	        url:loadItemUrl,
	    	        success:function(date){
	    	            if(null==date){
	    	                return;
	    	            }
	    	            
	    	            if(null!=date.ajaxString){
	    	                 comp=eval(date.ajaxString);
	    	                 
	    	                 
	    	            }
	    	            console.log("comp===>",comp);
	    	        },
	    	        error:function(msg){
	    	            utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	    	        }
	    	        
	    	    });
	    	    
	    	    
	    	} 
          
  </script>     
    
<script>
function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExeAx(isCloseWin){
  	query("formId1");//alert(_currentFrame);
  	//document.getElementById(_currentFrame).contentWindow.clearInfo();
  	//window.frames[_currentFrame].document.getElementByIdx_x("addItemInfo").empty();
  	//window.top.$("#addItemInfo").empty();console.log(window.top);
  	
  	//$("#popupFrameFpId")[0].contentWindow().clearInfo();
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}else{
  	    
  	    top.document.getElementById("popupFrameFpId").contentWindow.getInfos();
  	}
   	//checkboxAll("joblist");
}
function reloadPgExe(isCloseWin){
  	query("formId1");

  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
  	console.log("sss");
    		top.$(".dialog-close").click();
  	}else{
  	    
  	    top.document.getElementById("popupFrameFpId").contentWindow.getInfos();
  	}
   	
}


<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='334ae8dac2684a3289964a13b26049cd'){<%--产能影响系数信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PPQ_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'PPQ_PRODUCT_STEP')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'PPQ_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'PPQ_PRODUCT_STEP')+">")
            arrHtml.push("<span colno='PPQ_PRODUCT_STEP' class='"+ms.uiClass(formId, 'PPQ_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'PPQ_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'PPQ_PRODUCT_STEP')+" title='"+ms.titleAttr(formId,'PPQ_PRODUCT_STEP','IS_TITLE_ATTR',v)+"' >"+v['PPQ_PRODUCT_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PPQ_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'PPQ_AREA_SN')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'PPQ_AREA_SN')+"' "+ms.tdEvent(formId, 'PPQ_AREA_SN')+">")
            arrHtml.push("<span colno='PPQ_AREA_SN' class='"+ms.uiClass(formId, 'PPQ_AREA_SN')+"' style='"+ms.uiStyle(formId, 'PPQ_AREA_SN')+"' "+ms.uiEvent(formId, 'PPQ_AREA_SN')+" title='"+ms.titleAttr(formId,'PPQ_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['PPQ_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PPQ_DEVICE_QUOTIETY' class='datagrid-cell "+ms.tdClass(formId, 'PPQ_DEVICE_QUOTIETY')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'PPQ_DEVICE_QUOTIETY')+"' "+ms.tdEvent(formId, 'PPQ_DEVICE_QUOTIETY')+">")
            arrHtml.push("<span colno='PPQ_DEVICE_QUOTIETY' class='"+ms.uiClass(formId, 'PPQ_DEVICE_QUOTIETY')+"' style='"+ms.uiStyle(formId, 'PPQ_DEVICE_QUOTIETY')+"' "+ms.uiEvent(formId, 'PPQ_DEVICE_QUOTIETY')+" title='"+ms.titleAttr(formId,'PPQ_DEVICE_QUOTIETY','IS_TITLE_ATTR',v)+"' >"+v['PPQ_DEVICE_QUOTIETY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PPQ_MANPOWER_QUOTIETY' class='datagrid-cell "+ms.tdClass(formId, 'PPQ_MANPOWER_QUOTIETY')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'PPQ_MANPOWER_QUOTIETY')+"' "+ms.tdEvent(formId, 'PPQ_MANPOWER_QUOTIETY')+">")
            arrHtml.push("<span colno='PPQ_MANPOWER_QUOTIETY' class='"+ms.uiClass(formId, 'PPQ_MANPOWER_QUOTIETY')+"' style='"+ms.uiStyle(formId, 'PPQ_MANPOWER_QUOTIETY')+"' "+ms.uiEvent(formId, 'PPQ_MANPOWER_QUOTIETY')+" title='"+ms.titleAttr(formId,'PPQ_MANPOWER_QUOTIETY','IS_TITLE_ATTR',v)+"' >"+v['PPQ_MANPOWER_QUOTIETY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PPQ_EFFICIENCY_QUOTIETY' class='datagrid-cell "+ms.tdClass(formId, 'PPQ_EFFICIENCY_QUOTIETY')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'PPQ_EFFICIENCY_QUOTIETY')+"' "+ms.tdEvent(formId, 'PPQ_EFFICIENCY_QUOTIETY')+">")
            arrHtml.push("<span colno='PPQ_EFFICIENCY_QUOTIETY' class='"+ms.uiClass(formId, 'PPQ_EFFICIENCY_QUOTIETY')+"' style='"+ms.uiStyle(formId, 'PPQ_EFFICIENCY_QUOTIETY')+"' "+ms.uiEvent(formId, 'PPQ_EFFICIENCY_QUOTIETY')+" title='"+ms.titleAttr(formId,'PPQ_EFFICIENCY_QUOTIETY','IS_TITLE_ATTR',v)+"' >"+v['PPQ_EFFICIENCY_QUOTIETY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PPQ_QUALITY_QUOTIETY' class='datagrid-cell "+ms.tdClass(formId, 'PPQ_QUALITY_QUOTIETY')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'PPQ_QUALITY_QUOTIETY')+"' "+ms.tdEvent(formId, 'PPQ_QUALITY_QUOTIETY')+">")
            arrHtml.push("<span colno='PPQ_QUALITY_QUOTIETY' class='"+ms.uiClass(formId, 'PPQ_QUALITY_QUOTIETY')+"' style='"+ms.uiStyle(formId, 'PPQ_QUALITY_QUOTIETY')+"' "+ms.uiEvent(formId, 'PPQ_QUALITY_QUOTIETY')+" title='"+ms.titleAttr(formId,'PPQ_QUALITY_QUOTIETY','IS_TITLE_ATTR',v)+"' >"+v['PPQ_QUALITY_QUOTIETY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PPQ_DUAL_QUOTIETY' class='datagrid-cell "+ms.tdClass(formId, 'PPQ_DUAL_QUOTIETY')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'PPQ_DUAL_QUOTIETY')+"' "+ms.tdEvent(formId, 'PPQ_DUAL_QUOTIETY')+">")
            arrHtml.push("<span colno='PPQ_DUAL_QUOTIETY' class='"+ms.uiClass(formId, 'PPQ_DUAL_QUOTIETY')+"' style='"+ms.uiStyle(formId, 'PPQ_DUAL_QUOTIETY')+"' "+ms.uiEvent(formId, 'PPQ_DUAL_QUOTIETY')+" title='"+ms.titleAttr(formId,'PPQ_DUAL_QUOTIETY','IS_TITLE_ATTR',v)+"' >"+v['PPQ_DUAL_QUOTIETY']+"</span>")
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
    setScroll();
    getInfo();
}
            
</script>
<script type="text/javascript">


</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
