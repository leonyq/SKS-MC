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
		<dict:lang value="VM-参数配置" />
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
		<bu:header formId ="076c88e377ff4b5abf801455c055a202"/>

    <style>
    	#funInfo thead{
    		background:#e6eaf4;
    	}
    	
    	#funInfo td{
    		border:1px solid #dbe1ef;
    		text-align:center;
    	}
        .diycss1{
            
        }	
    </style>
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <script src="${path}buss/js/flow/topo.js"></script>
	<script src="${path}buss/js/flow/businessTopo1.js"></script>
	<script type="text/javascript" src="${path}buss/js/flow/jtopo-min.js"></script>
	<script src="${path}buss/js/flow/jscolor.js"></script>
	<script src="${path}buss/js/flow/toHex.js"></script>
    <script type="text/javascript">
	var loaded = 1;
	var tab_len = 2;
	var currentTag;
	var tabs = "";
	function switchTag(elem) {
		var index = $(elem).parents('li').index();
        $(elem).parents('li').addClass('current').siblings().removeClass('current')
        $('.bd #content>div').eq(index).css('display','block').siblings().css('display','none');
        if(index==1){
        	showTopoDataInfo();
        }
	}
$(function(){
	$("#tag1").addClass("current");
	$(document.getElementById('T2#WRD_DOC_TYPE')).closest('.group').attr("style","display:none;");
	initContext();//初始化内容
    $("#DATA_AUTH").bind("change", function(){
    showTopoDataInfo();
    });	
})




//全选
     	function getAllItem(){
		if($("#allSelect").attr("checked")=="checked"){
			$("#addItemDetail :checkbox").attr("checked",true);
		}else{
			$("#addItemDetail :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
  //全选1
     	function getAllItem1(){
		if($("#allSelect1").attr("checked")=="checked"){
			$("#addSecondItemDetail :checkbox").attr("checked",true);
		}else{
			$("#addSecondItemDetail :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
</script>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
            		<bu:func viewId="9f12416429794a75a031e437d71d4bae" />  
            	<!--
            		<form id="searchFormTop" name="searchFormTop" action="#"  method="post"><div id="timeBucketId"></div></form>
            		<div class="optn">
            		    <form id="funForm" name="funForm" action="/N2/buss/bussModel.ms" method="post" target="submitFrame">
                        <input type="hidden" name="exeid" value="9f12416429794a75a031e437d71d4bae">
                        <table class="func_table">
                        <tbody>																		
                            <tr>
                            <td width="100%" align="right">
                            <button type="button" id="37cb8bfb760c46979a692b210c0b9f64" value="" onclick="addShow()" sytle="" class="botton_img_add"><i class="ico ico-wlxx "></i>管控配置</button>
                            <button type="button" id="31ad14f0d3cd4e1386d518164a45ca5f" value="" onclick="addProject1()" sytle="" class="botton_img_add"><i class="ico ico-wlxx "></i>系统功能</button>
                            <!--<button type="button" id="demo" value=""  sytle="" class="botton_img_add"><i class="ico ico-wlxx "></i>test双击</button> 
                            <button type="button" id="2fd3aafb510e4d0a95ac647dba407a60" value="" onclick="addAjax()" sytle="" class="botton_img_add"><i class="ico ico-kl "></i>新增</button>
                            <button type="button" id="14217150138a4ca58de53e6167550b33" value="" onclick="ajaxEdit()" sytle="" class="botton_img_add"><i class="ico ico-xg "></i>修改</button>
                            <button type="button" id="972e4de7084346b383ffadd90f679438" value="" onclick="delWorkS()" sytle="" class="botton_img_add"><i class="ico ico-sc "></i>删除</button>
                            <button type="button" class="botton_img_add" onclick="query(this)"><i class="ico ico-search-new"></i>查询</button>      </td>
                            </tr>
                        </tbody>						
                        </table>
                        </form>
                    </div>
                    -->
            </div>
            <div class="bd">
                 <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		        <bu:search viewId="9f12416429794a75a031e437d71d4bae" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm"  style="height:calc(100% - 78px);" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage076c88e377ff4b5abf801455c055a202" id="formPage076c88e377ff4b5abf801455c055a202" value="${formPage076c88e377ff4b5abf801455c055a202}"/>
		<input type="hidden" name="formId" id="formId1" value='076c88e377ff4b5abf801455c055a202'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="iframeid" name="iframeid" value='null'/>
		<input type="hidden" id="close" name="close" value=''/>
		<div class="js-tab" style="height:100%">
					<DIV id="container"  style="box-sizing: border-box;height:100%">
						<DIV class="hd">
							<UL class="tab-list tab" style="padding-left:12px;">
								
								<LI id="tag1"><A class=""
									onclick="switchTag(this);this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="参数配置" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag(this);this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="管控配置" /></SPAN> </A>
								</LI>
								

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="height:100%;margin-top: 15px;padding-bottom: 15px;box-sizing: border-box;">
			<DIV id="content1" style="height:407px;margin-top:4px;" data-tab="tag1">
		<div class="panel-ajax datagrid datagrid-div1 "   id="076c88e377ff4b5abf801455c055a202">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax076c88e377ff4b5abf801455c055a202" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner076c88e377ff4b5abf801455c055a202">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable076c88e377ff4b5abf801455c055a202">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="076c88e377ff4b5abf801455c055a202" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_076c88e377ff4b5abf801455c055a202" onclick="_selectAjaxTableAllData(this,'076c88e377ff4b5abf801455c055a202')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
	
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="VR_CLASS" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="VR_ITEM" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center"><bu:uitn colNo="VR_TYPE" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center"><bu:uitn colNo="PRG_NAME" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="VR_FUNC" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="VR_VALUE" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="VR_DESC" formId="076c88e377ff4b5abf801455c055a202" /></td>
			<td class="datagrid-cell" style="width:100px;text-align:center"><bu:uitn colNo="VR_DEF_VALUE" formId="076c88e377ff4b5abf801455c055a202" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv076c88e377ff4b5abf801455c055a202" onscroll="ajaxTableScroll(this,'076c88e377ff4b5abf801455c055a202')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax076c88e377ff4b5abf801455c055a202">
		<tbody id="tbody_076c88e377ff4b5abf801455c055a202" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage076c88e377ff4b5abf801455c055a202==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=076c88e377ff4b5abf801455c055a202&showLoading=0" />
			</div>
		</c:if>
		</div>
        <DIV id="content2" style="display:none;height:100%;overflow:auto;" data-tab="tag2">
				<div id="contentValue" style="width:100%;height:452px;">
					
    	            <canvas width="1000px" height="450" style="border: 1px solid #E4E4E4;margin-left:10px;box-sizing:border-box;" id="canvas" ondrop="drop(event)" ondragover="allowDrop(event)"></canvas>
				
                </div>		
				
		</DIV>
		 				

	</DIV>

</DIV>
        
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
    <div id="funInfo" style="width:360px;position: absolute;border:4px solid rgba(51,51,51,0.2);border-radius: 4px;">
    		<table style="width:360px;">
    			<thead>
    				<tr>
    					<td>项目名称</td>
    					<td>管控值</td>
    					<td>管控描述</td>
    				</tr>
    			</thead>
    			<tbody id="tableValue" style="background-color: #ffffff">
    				
    			</tbody>
    		</table>
    <div/>
    
		<bu:submit viewId="9f12416429794a75a031e437d71d4bae" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="9f12416429794a75a031e437d71d4bae" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
function getPage(){
	
	    window.location.reload();
	}
function reloadPg(msg,title,width,height,time,isCloseWin){
       
      
      var isClose=$("#close").val();
      if(isClose=="1"){
           msgPop(msg,reloadPgExes,title,width,height,time,isClose);
      }else{
           msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
      }
        
     
    }
    function reloadPgExe(isCloseWin){
       // console.log("222");
      /* document.forms.search_form.submit();
      util.showTopLoading(); */
      query("formId1");
      
      if ("0" == isCloseWin || undefined == isCloseWin) {
          top.$(".dialog-close").click();
      }
      
      //checkboxAll("joblist");
}
function reloadPgExes(isCloseWin){
       // console.log("333");
      /* document.forms.search_form.submit();
      util.showTopLoading(); */
      query("formId1");
      
      if ("0" == isCloseWin || undefined == isCloseWin) {
          top.$(".dialog-close").click();
      }
      
      //checkboxAll("joblist");
}
/*
//添加系统功能
	function addProject(){
		try{
			var urlDetail = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F11113&funcMId=31ad14f0d3cd4e1386d518164a45ca5f&formId=076c88e377ff4b5abf801455c055a202&iframeId="+_currentFrame;
			//var urlDetail = "${path}buss/bussModel.ms?exeid=050e0c82cc1241059045e238b73676b4&formId=076c88e377ff4b5abf801455c055a202";
			showPopWinFp(urlDetail , 500, 400,null,"<dict:lang value='系统功能'/>","");
		}
		catch(error){
			console.error(error);
		}
	}
	
//跳转到系统功能
function addProject(){
  var formId = $("#formId1").val();
  // var url = "${path}buss/bussModel.ms?exeid=97fc6a2a9b084def89e728fd212e62e7&formId="+formId+"&iframeId="+_currentFrame;
  var url = "${path}buss/bussModel.ms?exeid=97fc6a2a9b084def89e728fd212e62e7&FUNC_CODE=F11194&formId="+formId+"&iframeId="+_currentFrame;
  showPopWinFp(url, 800, 400,null,"<dict:lang value="系统功能" />",null,1);
}
*/
function addProject1(){

  var formId = $("#formId1").val();//F11251
  // var url = "${path}buss/bussModel.ms?exeid=97fc6a2a9b084def89e728fd212e62e7&formId="+formId+"&iframeId="+_currentFrame;
  var url = "${path}buss/bussModel.ms?exeid=950f89f0886d4a909aa123e351c3a1af&FUNC_CODE=F11251&formId="+formId+"&iframeId="+_currentFrame;
  showPopWinFp(url, 1100, 485,null,"<dict:lang value="系统功能" />","");
}

$("button#demo").dblclick(function(){
  var formId = $("#formId1").val();
  var dataId ="SMT0011";
  var frameId=_currentFrame;
   var url = "${path}buss/bussModel.ms?exeid=2784136ec9e0455fbbb0944da12d6006&FUNC_CODE=F12751&formId="+formId+"&iframeId="+frameId+"&dataId="+dataId;
  showPopWinFp(url, 800, 457,null,"<dict:lang value="参数设置" />","");
  
});

function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,VR_TYPE,ID\"}";
                    //var url = "/N2/buss/bussModel_listMsData.ms";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
                    if(isPage(formId)){
                        var isFirstLoad = firstLoadThisPage(formId);
                        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
                        var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    util.showLoading("处理中...");
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                            clearChildTable();
                        	util.closeLoading();
                        },
                        error: function(msg){
                        	util.closeLoading();
                            utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                        }
                    });
                }


<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='076c88e377ff4b5abf801455c055a202'){<%--FM-参数配置--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VR_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'VR_CLASS')+"' style='width:100px;"+ms.tdStyle(formId, 'VR_CLASS')+"' "+ms.tdEvent(formId, 'VR_CLASS')+">")
            arrHtml.push("<span colno='VR_CLASS' class='"+ms.uiClass(formId, 'VR_CLASS')+"' style='"+ms.uiStyle(formId, 'VR_CLASS')+"' "+ms.uiEvent(formId, 'VR_CLASS')+" title='"+ms.titleAttr(formId,'VR_CLASS','IS_TITLE_ATTR',v)+"' >"+v['VR_CLASS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VR_ITEM' class='datagrid-cell "+ms.tdClass(formId, 'VR_ITEM')+"' style='width:200px;"+ms.tdStyle(formId, 'VR_ITEM')+"' "+ms.tdEvent(formId, 'VR_ITEM')+">")
            arrHtml.push("<span colno='VR_ITEM' class='"+ms.uiClass(formId, 'VR_ITEM')+"' style='"+ms.uiStyle(formId, 'VR_ITEM')+"' "+ms.uiEvent(formId, 'VR_ITEM')+" title='"+ms.titleAttr(formId,'VR_ITEM','IS_TITLE_ATTR',v)+"' >"+v['VR_ITEM']+"</span>")
            arrHtml.push("<input type='hidden' id='VR_TYPE_"+v.VR_CLASS+"' name='VR_TYPE' value='"+uiRaw[i].VR_TYPE+"' /></td>");
            arrHtml.push("<td colno='VR_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'VR_TYPE')+"' style='width:80px;"+ms.tdStyle(formId, 'VR_TYPE')+"' "+ms.tdEvent(formId, 'VR_TYPE')+">")
            arrHtml.push("<span colno='VR_TYPE' class='"+ms.uiClass(formId, 'VR_TYPE')+"' style='"+ms.uiStyle(formId, 'VR_TYPE')+"' "+ms.uiEvent(formId, 'VR_TYPE')+" title='"+ms.titleAttr(formId,'VR_TYPE','IS_TITLE_ATTR',v)+"' >"+v['VR_TYPE']+"</span>")
            arrHtml.push("<input type='hidden' id='DEL_FLAG' name='DEL_FLAG' value='"+v.DEL_FLAG+"' /></td>");
            arrHtml.push("<td colno='PRG_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PRG_NAME')+"' style='width:80px;"+ms.tdStyle(formId, 'PRG_NAME')+"' "+ms.tdEvent(formId, 'PRG_NAME')+">")
            arrHtml.push("<span colno='PRG_NAME' class='"+ms.uiClass(formId, 'PRG_NAME')+"' style='"+ms.uiStyle(formId, 'PRG_NAME')+"' "+ms.uiEvent(formId, 'PRG_NAME')+" title='"+ms.titleAttr(formId,'PRG_NAME','IS_TITLE_ATTR',v)+"' >"+v['PRG_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VR_FUNC' class='datagrid-cell "+ms.tdClass(formId, 'VR_FUNC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'VR_FUNC')+"' "+ms.tdEvent(formId, 'VR_FUNC')+">")
            arrHtml.push("<span colno='VR_FUNC' class='"+ms.uiClass(formId, 'VR_FUNC')+"' style='"+ms.uiStyle(formId, 'VR_FUNC')+"' "+ms.uiEvent(formId, 'VR_FUNC')+" title='"+ms.titleAttr(formId,'VR_FUNC','IS_TITLE_ATTR',v)+"' >"+v['VR_FUNC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VR_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'VR_VALUE')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'VR_VALUE')+"' "+ms.tdEvent(formId, 'VR_VALUE')+">")
            arrHtml.push("<span colno='VR_VALUE' class='"+ms.uiClass(formId, 'VR_VALUE')+"' style='"+ms.uiStyle(formId, 'VR_VALUE')+"' "+ms.uiEvent(formId, 'VR_VALUE')+" title='"+ms.titleAttr(formId,'VR_VALUE','IS_TITLE_ATTR',v)+"' >"+v['VR_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VR_DESC' class='datagrid-cell "+ms.tdClass(formId, 'VR_DESC')+"' style='width:200px;"+ms.tdStyle(formId, 'VR_DESC')+"' "+ms.tdEvent(formId, 'VR_DESC')+">")
            arrHtml.push("<span colno='VR_DESC' class='"+ms.uiClass(formId, 'VR_DESC')+"' style='"+ms.uiStyle(formId, 'VR_DESC')+"' "+ms.uiEvent(formId, 'VR_DESC')+" title='"+ms.titleAttr(formId,'VR_DESC','IS_TITLE_ATTR',v)+"' >"+v['VR_DESC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VR_DEF_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'VR_DEF_VALUE')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'VR_DEF_VALUE')+"' "+ms.tdEvent(formId, 'VR_DEF_VALUE')+">")
            arrHtml.push("<span colno='VR_DEF_VALUE' class='"+ms.uiClass(formId, 'VR_DEF_VALUE')+"' style='"+ms.uiStyle(formId, 'VR_DEF_VALUE')+"' "+ms.uiEvent(formId, 'VR_DEF_VALUE')+" title='"+ms.titleAttr(formId,'VR_DEF_VALUE','IS_TITLE_ATTR',v)+"' >"+v['VR_DEF_VALUE']+"</span>")
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
}



</script>
<script type="text/javascript">
$(function(){
    
    $("#iframeid").val(window.name);
    $(document.getElementById('VR_FLAG')).closest('.group').attr("style","display:none;");
    
})
        function init(){
                   
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    
                    $(document.getElementById('VR_FLAG')).val('Y');
                    getFormIdInitChildPage();
                    initTableWidth();
                    listAjaxTable($("#formId1").val());
                   
                     
                 }
                 
                 
function initHeight(){
    	/*
	$('.panel-ajax').height(($(window).height() - 56 - 78 - 10 - 45  - 10)/2 - 30);
	$('.datagrid-body').css('height','calc(100% - 32px)');
	$('.panel1').height($(window).height() - 56 - 78 - 10 - 45 - 30);
	*/
	$('.panel-ajax').height(($(window).height() - 26 - 110 - 15  - 10) - 60);
//	$('.datagrid-body1').css('height','calc(100% - 80px)');//32
	$('.datagrid-body').css('height','calc(100% - 32px)');//32
	$('.panel1').height(($(window).height() - 56 - 110 - 15  - 10) - 60);
	//$('.panel1').height($(window).height() - 56 - 195 - 15 - 70);
	
}

$(function(){
	initHeight();
	setPopScroll("#content2");
	var widthValue=$('#mCSB_1_container').width();
    $("#canvas").attr("width",widthValue);
})

$(window).resize(function(){
	initHeight();
})

/**
	 * 展示视图数据
	 */
	function showTopoDataInfo(){
		cleanScene();
		var dataAuth = $("#DATA_AUTH").val();
		$.ajax({
            url : "buss/bussModel_exeFunc.ms?funcMId=0073ee4c8b0644b4bba2c25318b5cf2f",
            data : {
            	editType:1,
            	"dataAuth":dataAuth
            },
            type : "post",
            dataType : "json",
            success : function(data) { 
            	var dataList=data.ajaxList;
            	if(dataList.length>0){
            		showTopoData(dataList[0].CONFIG_DATA);
            		setNoDrag();
            		var widthValue=$('#mCSB_1_container').width();
            	    if(widthValue<=100){
            	        $("#canvas").attr("width",1264);
            	    }else{
            	        $("#canvas").attr("width",widthValue);
            		
            	    }	
                    
            		
            	}
			  },
            error : function(msg) {
              util.closeLoading();
              utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
                  0, "300", "");
            }
          });
	
	}
	//鼠标移过去事件
	function nodeMouseOver(funcId,event,node){
		$("#funInfo").css({
				top:event.pageY,
				left:event.pageX+30
			}).show();
		gainFunInfo(funcId);
	}
	//鼠标离开事件
	function nodeMouseLeave(){
		$("#funInfo").hide();
	}
	//双击点击画布事件
	function nodeMouseDbc(funcId,event,node){
	var formId = $("#formId1").val();
  	var dataId =funcId;
  	var frameId=_currentFrame;
   	var url = "${path}buss/bussModel.ms?exeid=2784136ec9e0455fbbb0944da12d6006&FUNC_CODE=F12751&formId="+formId+"&iframeId="+frameId+"&dataId="+dataId;
  	showPopWinFp(url, 800, 457,null,"<dict:lang value="参数设置" />","");
	}
	
	//获取管控功能
	function gainFunInfo(funcId){
		$.ajax({
            url : "buss/bussModel_exeFunc.ms?funcMId=24b7f18d5783473ca03215ac98495968",
            data : {
            	CLAS:funcId
            },
            type : "post",
            dataType : "json",
            success : function(data) { 
            	 var html="";
            	 var dataInfo=data.ajaxList;
            	 for(var i=0;i<dataInfo.length;i++){
            	    if(dataInfo[i].VR_VALUE==null) dataInfo[i].VR_VALUE="";
            	    if(dataInfo[i].VR_DESC==null) dataInfo[i].VR_DESC="";
            	 	html+="<tr>"+
            	 		  "<td style='text-align:left;padding-left:5px'>"+dataInfo[i].VR_ITEM+"</td>"+
            	 		  "<td>"+dataInfo[i].VR_VALUE+"</td>"+
            	 		   "<td>"+dataInfo[i].VR_DESC+"</td>"+
            	 		  "</tr>";
            	 }
            	 $("#tableValue").html(html);
			  },
            error : function(msg) {
              util.closeLoading();
              utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
                  0, "300", "");
            }
          });
	
	}
	

</script>


<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
