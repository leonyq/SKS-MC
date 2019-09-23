<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="在线料表" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="11ff50fd76e4429382befd74804e9d00"/>
         <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="8d7fa08b561b48d5bffaaf279b932a45" />
            </div>
            <div class="bd" >
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
		<bu:search viewId="8d7fa08b561b48d5bffaaf279b932a45" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage11ff50fd76e4429382befd74804e9d00" id="formPage11ff50fd76e4429382befd74804e9d00" value="${formPage11ff50fd76e4429382befd74804e9d00}"/>
		<input type="hidden" name="formId" id="formId1" value='11ff50fd76e4429382befd74804e9d00'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="11ff50fd76e4429382befd74804e9d00">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax11ff50fd76e4429382befd74804e9d00" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner11ff50fd76e4429382befd74804e9d00">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable11ff50fd76e4429382befd74804e9d00" style="min-width:1880px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="11ff50fd76e4429382befd74804e9d00" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_11ff50fd76e4429382befd74804e9d00" onclick="_selectAjaxTableAllData(this,'11ff50fd76e4429382befd74804e9d00')" style="cursor: pointer;"title="全选"/></span></td>
	    	<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CMO_AREA_SN" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CMO_DEVICE_SEQ" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CMO_TABLE_NO" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CMO_LOADPOINT" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CMO_TRACK" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CMO_CHANEL_SN" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CMO_ITEM_CODE" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="B#CI_ITEM_NAME" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="B#CI_ITEM_SPEC" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:50px;"><bu:uitn colNo="CMO_POINT_NUM" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CMO_POINT_LOCATION" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CMO_LOAD_FLAG" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CMO_SHKIP_FLAG" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CMO_MODEL_CODE" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CMO_MO_NUMBER" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CMO_PROCESS_FACE" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CMO_TRY_FLAG" formId="11ff50fd76e4429382befd74804e9d00" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CMO_GROUP_CODE" formId="11ff50fd76e4429382befd74804e9d00" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv11ff50fd76e4429382befd74804e9d00" onscroll="ajaxTableScroll(this,'11ff50fd76e4429382befd74804e9d00')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax11ff50fd76e4429382befd74804e9d00" style="min-width:1880px;">
		<tbody id="tbody_11ff50fd76e4429382befd74804e9d00" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage11ff50fd76e4429382befd74804e9d00==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=11ff50fd76e4429382befd74804e9d00&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="8d7fa08b561b48d5bffaaf279b932a45" />
		      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="8d7fa08b561b48d5bffaaf279b932a45" />
    <script type="text/javascript">
    
    //线体选择记忆功能

    	/*$(document).on('change','#CMO_AREA_SN',function(){
        localStorage.selecto = $('#CMO_AREA_SN').val();
    	//console.log(1);
    });
    
    $(function(){
        
        //listAjaxTable($("#formId1").val());
        
    })*/
    
    <%--主列表--%>
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CMO_AREA_SN,CMO_LOAD_FLAG\"}";
        //var url = "${path}buss/bussModel_listMsData.ms";
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
            data:searchParams +"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
            success: function(data){
                if(data.RES){
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms,formId);
                    if(isPage(formId)){
                        initPage(page,formId);
                    }
                    clearChildTable();
                }else{
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    }
    
    <%--判断是否分页--%>
    function isPage(formId){
        var isPageVal =  $("#formPage"+formId).val();
        if(isPageVal =="1"){    
           return true;
        }
        return false;
    }
    
    <%--查询--%>
    var areaFlag = 1;
    function query(thisObj){
    	if(areaFlag==1){
            if($("#CMO_AREA_SN").val()==""){
              if( $("#CMO_DEVICE_SEQ").val()!=""){
                      utilsFp.confirmIcon(1,"","","", "请选择一条线别","","230","");
                      }else{
                          var formId = $("#formId1").val();
                  listAjaxTable(formId);
                      }
            }else{
              var formId = $("#formId1").val();
              listAjaxTable(formId);
            }
        }else if(areaFlag==2){
          var formId = $("#formId1").val();
          listAjaxTable(formId);
          areaFlag = 1;
        }
        
    }
    
    <%--清空表格--%>
    function clearChildTable(){
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }
    
   <%--当出现滚动条时动态设置表格宽度 --%>
   function setTableWidth(formId){
        /**
        *var scrollHeight = $("#tableDiv"+formId)[0].scrollHeight;
        var height = $("#tableDiv"+formId).height();
        var datagridHeaderWidth = $("#datagrid-view-ajax"+formId+" .datagrid-header").width();
        if(scrollHeight-height>0){
          $("#datagrid-htable"+formId).css("width",datagridHeaderWidth-20+'px');
          $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth-20+'px');
        }else{
          $("#datagrid-htable"+formId).css("width",datagridHeaderWidth+'px');
          $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth+'px');    
        }
        *
        */
    }

    
    function alertInfo(msg){
        utilsFp.alert(msg);
    }
    
    <%--清空全选 --%>
    function clearAllSelect(){
        $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
    }
    
   function reloadPg(msg,title,width,height,time,isCloseWin){
    msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
  }


function reloadPgExe(isCloseWin){
    /* document.forms.search_form.submit();
    util.showTopLoading(); */
    query("formId1");
    if ("0" == isCloseWin) {
      top.$(".dialog-close").click();
    }
    checkboxAll("joblist");
    
  }
    
    <%--子列表 --%>
    function listChildAjaxTable(formId,paramList){
        var data = {
            "paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,
            "paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,
            "paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,
            "paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,
            "paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
            "paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
        };
        if(isPage(formId)){
            data["page.currentPage"] = _GLO_FORM_PAGE_MAP[formId].currentPage;
            data["page.pageRecord"] = _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        if(paramList != null && paramList != ""){
            data["paramList"] = paramList;
        }
        var url = "${path}buss/bussModel_listMsCasData.ms?exeid=${exeid}";
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:data,
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
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    }
    <%-- 数据为空时设置横向滚动条 --%>
    function setCrossWiseScroll(formId,arrHtml){
        if(arrHtml.length==0){
            var tableWidth = $("#datagrid-btable-ajax"+formId).width();  
            arrHtml.push("<tr  style='width: ");
            arrHtml.push(tableWidth+"px");
            arrHtml.push(";");
            arrHtml.push("height:1000px;'");
            $("#tableDiv"+formId).css({"overflow-y":"hidden","overflow-x":"auto"});
       }else{
            $("#tableDiv"+formId).css({"overflow-y":"auto","overflow-x":"auto"});    
       }
   }
    
    <%-- 初始化子分页 --%>
    function initChildPage(formId){
        var ajaxPage = new Object();
        ajaxPage.currentPage = 1;
        ajaxPage.pageRecord = 20;
        ajaxPage.totalRecord = 0;
        ajaxPage.totalPage = 1;
        ajaxPage.first = true;
        ajaxPage.last = true;
        pageFun(ajaxPage,formId);
    }
    
    
    <%-- 初始化分页插件 --%>
    function initPage(page,formId){
        var ajaxPage = new Object();
        ajaxPage.currentPage = parseInt(page.currentPage);
        ajaxPage.pageRecord = parseInt(page.pageRecord);
        ajaxPage.totalPage = parseInt(page.totalPage);
        ajaxPage.totalRecord = parseInt(page.totalRecord);
        ajaxPage.first = page.first;
        ajaxPage.last = page.last;
        pageFun(ajaxPage,formId);
    };
    
    <%-- 判断是否首次异步访问 --%>
    function firstLoadThisPage(formId){
        if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
            return true;
        }
        return false;
    }
    
    <%-- 初始化子表单 --%>
    function getFormIdInitChildPage(){
        var tableCount = $("#tableCount").val();
        for ( var i = 2; i <= tableCount; i++) {
            var formId = $("#formId"+i).val();
            if(isPage(formId)){
               initChildPage(formId);
            }
        }
    }
    
    <%-- 初始化表格宽度 --%>
    function initTableWidth(){
        var width = $(window).width() - 2;
        $(".datagrid-htable,.datagrid-btable").width(width);
    }
    
    
    clearChildTable();
    function init(){
        	
    	$("#CMO_DEVICE_SEQ").attr("onchange","getTable()");
    	$("#CMO_AREA_SN").attr("onchange","getDeviceSeq()");
    	
    //	getDeviceSeq();
        if($(".leftTable-ajax").length>0){
            $(".leftTable-ajax").show();
        };
      //  getFormIdInitChildPage();
        //initTableWidth();
        
        listAjaxTable($("#formId1").val());
        var arerId=$('#CMO_AREA_SN').val();
        if(arerId!=""){
             getDeviceSeqs(arerId );
        }
       // $('#DATA_AUTH_').val(localStorage.selecto1);
     //   <s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
         // $('#CMO_AREA_SN').val(localStorage.selecto);
          
     }
     
     //根据设备序号获取Table并生成下拉框
	function getTable(){
	        var getDeviceUrl="${path}buss/bussModel_exeFunc.ms?funcMId=80c2b653b1ac482aa55ac7dad90db02e&formId=%{formId}";//VM-在线料表 操作功能 加载Table
	        var areaId = $("#CMO_AREA_SN").val();
	        var tableSeq = $("#CMO_DEVICE_SEQ").val();
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	        url: getDeviceUrl,
 	    	        data:{
 	    	            "type":"deviceTable",
 	    	            "tableSeq":tableSeq,
 	    	            "areaId":areaId
 	    	        },
 			success: function(data){
 				var pList=data.ajaxList;
 				var tempOption = "";
 				for(var i=0;i<pList.length;i++){
 				    tempOption = tempOption + "<option value='"+pList[i].CMO_TABLE_NO+"'>"+pList[i].CMO_TABLE_NO+"</option>" ;
 				}
 				$("#CMO_TABLE_NO").empty();
 				$("#CMO_TABLE_NO").append("<option value=''>--请选择--</option>");
 				$("#CMO_TABLE_NO").append(tempOption);
 				$("#CMO_TABLE_NO").trigger("chosen:updated");
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
	
	//根据线别获取当前在线料表里的设备序号并生成下拉框
	function getDeviceSeq(){
	   // localStorage.selecto = $('#CMO_AREA_SN').val();
	 //   localStorage.selecto1 = $('#DATA_AUTH').val();
	        var getDeviceSeqUrl="${path}buss/bussModel_exeFunc.ms?funcMId=36a64f9987f8416286b306affa3574ea&formId=%{formId}";//VM-在线料表 操作功能 首页加载设备序号
	        var areaId = $("#CMO_AREA_SN").val();
	        $("#CMO_TABLE_NO").empty();
 		$("#CMO_TABLE_NO").append("<option value=''>--请选择--</option>");
 		$("#CMO_TABLE_NO").trigger("chosen:updated");
	        //var tableSeq = $("#CMO_DEVICE_SEQ").val();
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	        url: getDeviceSeqUrl,
 	    	        data:{
 	    	            "type":"deviceTable",
 	    	            "areaId":areaId
 	    	        },
 			success: function(data){
 				var pList=data.ajaxList;
 				var tempOption = "";
 				for(var i=0;i<pList.length;i++){
 				    tempOption = tempOption + "<option value='"+pList[i].CMO_DEVICE_SEQ+"'>"+pList[i].CMO_DEVICE_SEQ+"</option>" ;
 				}
 				$("#CMO_DEVICE_SEQ").empty();
 				$("#CMO_DEVICE_SEQ").append("<option value=''>--请选择--</option>");
 				$("#CMO_DEVICE_SEQ").append(tempOption);
 				$("#CMO_DEVICE_SEQ").trigger("chosen:updated");
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

		function getDeviceSeqs(arerId){
	    
	        var getDeviceSeqUrl="${path}buss/bussModel_exeFunc.ms?funcMId=36a64f9987f8416286b306affa3574ea&formId=%{formId}";
	        var areaId =arerId;
	        	console.log(areaId);
	        $("#CMO_TABLE_NO").empty();
 		$("#CMO_TABLE_NO").append("<option value=''>--请选择--</option>");
 		$("#CMO_TABLE_NO").trigger("chosen:updated");
	        //var tableSeq = $("#CMO_DEVICE_SEQ").val();
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	        url: getDeviceSeqUrl,
 	    	        data:{
 	    	           "type":"deviceTable",
 	    	           "areaId":areaId
 	    	        },
 			success: function(data){
 				var pList=data.ajaxList;
 				console.log(pList);
 				var tempOption = "";
 				for(var i=0;i<pList.length;i++){
 				    tempOption = tempOption + "<option value='"+pList[i].CMO_DEVICE_SEQ+"'>"+pList[i].CMO_DEVICE_SEQ+"</option>" ;
 				}
 				$("#CMO_DEVICE_SEQ").empty();
 				$("#CMO_DEVICE_SEQ").append("<option value=''>--请选择--</option>");
 				$("#CMO_DEVICE_SEQ").append(tempOption);
 				$("#CMO_DEVICE_SEQ").trigger("chosen:updated");
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

    $(function(){	
        
        var colNo = $("#relColVals").val();
        var subRelColIds = $("#subRelColIds").val();
        var subFormIds = $("#subFormIds").val();
        if(subRelColIds!="null"){
            var formId1 = $("#formId1").val();
            $(".isParents tr").live("click",function(){
                var _this = $(this);
                var relColVals = "";
                var abbr = _this.attr("abbr");
                var arrColNo = colNo.split(",");
                $(arrColNo).each(function(i,v){
                    var childVal = $("tr[abbr='"+abbr+"']").find("input[type='hidden']").val();
                    relColVals += childVal+",";
                });
                setSubData(formId1,subFormIds,subRelColIds,relColVals,"","",true);
            });
        };
    });
</script>
<script>
var isFirstSetScroll=0;
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='11ff50fd76e4429382befd74804e9d00'){<%--在线料表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'CMO_AREA_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'CMO_AREA_SN')+"' "+ms.tdEvent(formId, 'CMO_AREA_SN')+">")
            arrHtml.push("<span colno='CMO_AREA_SN' class='"+ms.uiClass(formId, 'CMO_AREA_SN')+"' style='"+ms.uiStyle(formId, 'CMO_AREA_SN')+"' "+ms.uiEvent(formId, 'CMO_AREA_SN')+" title='"+ms.titleAttr(formId,'CMO_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['CMO_AREA_SN']+"</span>")
            arrHtml.push("<input type='hidden' id='area_"+v.ID+"' value='"+uiRaw[i].CMO_AREA_SN+"'></td>");
            arrHtml.push("<td colno='CMO_DEVICE_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'CMO_DEVICE_SEQ')+"' style='width:80px;text-align: center;"+ms.tdStyle(formId, 'CMO_DEVICE_SEQ')+"' "+ms.tdEvent(formId, 'CMO_DEVICE_SEQ')+">")
            arrHtml.push("<span colno='CMO_DEVICE_SEQ' class='"+ms.uiClass(formId, 'CMO_DEVICE_SEQ')+"' style='"+ms.uiStyle(formId, 'CMO_DEVICE_SEQ')+"' "+ms.uiEvent(formId, 'CMO_DEVICE_SEQ')+" title='"+ms.titleAttr(formId,'CMO_DEVICE_SEQ','IS_TITLE_ATTR',v)+"' >"+v['CMO_DEVICE_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_TABLE_NO' class='datagrid-cell "+ms.tdClass(formId, 'CMO_TABLE_NO')+"' style='width:110px;"+ms.tdStyle(formId, 'CMO_TABLE_NO')+"' "+ms.tdEvent(formId, 'CMO_TABLE_NO')+">")
            arrHtml.push("<span colno='CMO_TABLE_NO' class='"+ms.uiClass(formId, 'CMO_TABLE_NO')+"' style='"+ms.uiStyle(formId, 'CMO_TABLE_NO')+"' "+ms.uiEvent(formId, 'CMO_TABLE_NO')+" title='"+ms.titleAttr(formId,'CMO_TABLE_NO','IS_TITLE_ATTR',v)+"' >"+v['CMO_TABLE_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_LOADPOINT' class='datagrid-cell "+ms.tdClass(formId, 'CMO_LOADPOINT')+"' style='width:110px;"+ms.tdStyle(formId, 'CMO_LOADPOINT')+"' "+ms.tdEvent(formId, 'CMO_LOADPOINT')+">")
            arrHtml.push("<span colno='CMO_LOADPOINT' class='"+ms.uiClass(formId, 'CMO_LOADPOINT')+"' style='"+ms.uiStyle(formId, 'CMO_LOADPOINT')+"' "+ms.uiEvent(formId, 'CMO_LOADPOINT')+" title='"+ms.titleAttr(formId,'CMO_LOADPOINT','IS_TITLE_ATTR',v)+"' >"+v['CMO_LOADPOINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_TRACK' class='datagrid-cell "+ms.tdClass(formId, 'CMO_TRACK')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CMO_TRACK')+"' "+ms.tdEvent(formId, 'CMO_TRACK')+">")
            arrHtml.push("<span colno='CMO_TRACK' class='"+ms.uiClass(formId, 'CMO_TRACK')+"' style='"+ms.uiStyle(formId, 'CMO_TRACK')+"' "+ms.uiEvent(formId, 'CMO_TRACK')+" title='"+ms.titleAttr(formId,'CMO_TRACK','IS_TITLE_ATTR',v)+"' >"+v['CMO_TRACK']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_CHANEL_SN' class='datagrid-cell "+ms.tdClass(formId, 'CMO_CHANEL_SN')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CMO_CHANEL_SN')+"' "+ms.tdEvent(formId, 'CMO_CHANEL_SN')+">")
            arrHtml.push("<span colno='CMO_CHANEL_SN' class='"+ms.uiClass(formId, 'CMO_CHANEL_SN')+"' style='"+ms.uiStyle(formId, 'CMO_CHANEL_SN')+"' "+ms.uiEvent(formId, 'CMO_CHANEL_SN')+" title='"+ms.titleAttr(formId,'CMO_CHANEL_SN','IS_TITLE_ATTR',v)+"' >"+v['CMO_CHANEL_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CMO_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CMO_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CMO_ITEM_CODE')+">")
            arrHtml.push("<span colno='CMO_ITEM_CODE' class='"+ms.uiClass(formId, 'CMO_ITEM_CODE')+"' onclick='itemJump1(\""+v['CMO_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CMO_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CMO_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CMO_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='B#CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'B#CI_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'B#CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'B#CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='B#CI_ITEM_NAME' class='"+ms.uiClass(formId, 'B#CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'B#CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'B#CI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'B#CI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['B#CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='B#CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'B#CI_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'B#CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'B#CI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='B#CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'B#CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'B#CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'B#CI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'B#CI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['B#CI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_POINT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'CMO_POINT_NUM')+"' style='width:50px;text-align: right;"+ms.tdStyle(formId, 'CMO_POINT_NUM')+"' "+ms.tdEvent(formId, 'CMO_POINT_NUM')+">")
            arrHtml.push("<span colno='CMO_POINT_NUM' class='"+ms.uiClass(formId, 'CMO_POINT_NUM')+"' style='"+ms.uiStyle(formId, 'CMO_POINT_NUM')+"' "+ms.uiEvent(formId, 'CMO_POINT_NUM')+" title='"+ms.titleAttr(formId,'CMO_POINT_NUM','IS_TITLE_ATTR',v)+"' >"+v['CMO_POINT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_POINT_LOCATION' class='datagrid-cell "+ms.tdClass(formId, 'CMO_POINT_LOCATION')+"' style='width:90px;"+ms.tdStyle(formId, 'CMO_POINT_LOCATION')+"' "+ms.tdEvent(formId, 'CMO_POINT_LOCATION')+">")
            arrHtml.push("<span colno='CMO_POINT_LOCATION' class='"+ms.uiClass(formId, 'CMO_POINT_LOCATION')+"' style='"+ms.uiStyle(formId, 'CMO_POINT_LOCATION')+"' "+ms.uiEvent(formId, 'CMO_POINT_LOCATION')+" title='"+ms.titleAttr(formId,'CMO_POINT_LOCATION','IS_TITLE_ATTR',v)+"' >"+v['CMO_POINT_LOCATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_LOAD_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CMO_LOAD_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CMO_LOAD_FLAG')+"' "+ms.tdEvent(formId, 'CMO_LOAD_FLAG')+">")
            arrHtml.push("<span colno='CMO_LOAD_FLAG' class='"+ms.uiClass(formId, 'CMO_LOAD_FLAG')+"' style='"+ms.uiStyle(formId, 'CMO_LOAD_FLAG')+"' "+ms.uiEvent(formId, 'CMO_LOAD_FLAG')+" title='"+ms.titleAttr(formId,'CMO_LOAD_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CMO_LOAD_FLAG']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+uiRaw[i].CMO_LOAD_FLAG+"'></td>");
            arrHtml.push("<td colno='CMO_SHKIP_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CMO_SHKIP_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CMO_SHKIP_FLAG')+"' "+ms.tdEvent(formId, 'CMO_SHKIP_FLAG')+">")
            arrHtml.push("<span colno='CMO_SHKIP_FLAG' class='"+ms.uiClass(formId, 'CMO_SHKIP_FLAG')+"' style='"+ms.uiStyle(formId, 'CMO_SHKIP_FLAG')+"' "+ms.uiEvent(formId, 'CMO_SHKIP_FLAG')+" title='"+ms.titleAttr(formId,'CMO_SHKIP_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CMO_SHKIP_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CMO_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CMO_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CMO_MODEL_CODE')+">")
            arrHtml.push("<span colno='CMO_MODEL_CODE' class='"+ms.uiClass(formId, 'CMO_MODEL_CODE')+"' onclick='itemJump2(\""+v['CMO_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CMO_MODEL_CODE')+" title='"+ms.titleAttr(formId,'CMO_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['CMO_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'CMO_MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'CMO_MO_NUMBER')+"' "+ms.tdEvent(formId, 'CMO_MO_NUMBER')+">")
            arrHtml.push("<span colno='CMO_MO_NUMBER' class='"+ms.uiClass(formId, 'CMO_MO_NUMBER')+"' onclick='itemJump3(\""+v['CMO_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CMO_MO_NUMBER')+" title='"+ms.titleAttr(formId,'CMO_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['CMO_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CMO_PROCESS_FACE')+"' style='width:70px;text-align: center;"+ms.tdStyle(formId, 'CMO_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CMO_PROCESS_FACE')+">")
            arrHtml.push("<span colno='CMO_PROCESS_FACE' class='"+ms.uiClass(formId, 'CMO_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CMO_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CMO_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'CMO_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['CMO_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_TRY_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CMO_TRY_FLAG')+"' style='width:110px;text-align:center;"+ms.tdStyle(formId, 'CMO_TRY_FLAG')+"' "+ms.tdEvent(formId, 'CMO_TRY_FLAG')+">")
            arrHtml.push("<span colno='CMO_TRY_FLAG' class='"+ms.uiClass(formId, 'CMO_TRY_FLAG')+"' style='"+ms.uiStyle(formId, 'CMO_TRY_FLAG')+"' "+ms.uiEvent(formId, 'CMO_TRY_FLAG')+" title='"+ms.titleAttr(formId,'CMO_TRY_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CMO_TRY_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CMO_GROUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CMO_GROUP_CODE')+"' style='width:150px; "+ms.tdEvent(formId, 'CMO_GROUP_CODE')+">")
            arrHtml.push("<span colno='CMO_GROUP_CODE' class='"+ms.uiClass(formId, 'CMO_GROUP_CODE')+"' style='"+ms.uiStyle(formId, 'CMO_GROUP_CODE')+"' "+ms.uiEvent(formId, 'CMO_GROUP_CODE')+" title='"+ms.titleAttr(formId,'CMO_GROUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['CMO_GROUP_CODE']+"</span>")
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
    //setTableWidth(formId);
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
    //alert(localStorage.selecto);
       // $('#CMO_AREA_SN').val(localStorage.selecto);
        //$('#DATA_AUTH').val(localStorage.selecto1);
}

$(function(){
    
     $("#CMO_AREA_SN").attr("class"," null IS_SELECT_FILTER dept_select");
})


</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料信息
function itemJump1(obj){
      winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
}  


//BOM管理
function itemJump2(obj){
    winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
} 

//制令单信息
function itemJump3(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 


</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>