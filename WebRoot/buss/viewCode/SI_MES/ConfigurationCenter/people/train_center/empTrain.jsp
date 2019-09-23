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
		<dict:lang value="员工培训记录" />
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
		<bu:header formId ="b12b8175e879434a93d6694e62fbb021"/>

    
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
		<bu:func viewId="85e955dd40c84174bd027d81c94347bf" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="85e955dd40c84174bd027d81c94347bf" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageb12b8175e879434a93d6694e62fbb021" id="formPageb12b8175e879434a93d6694e62fbb021" value="${formPageb12b8175e879434a93d6694e62fbb021}"/>
		<input type="hidden" name="formId" id="formId1" value='b12b8175e879434a93d6694e62fbb021'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="b12b8175e879434a93d6694e62fbb021">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb12b8175e879434a93d6694e62fbb021" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-innerb12b8175e879434a93d6694e62fbb021">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb12b8175e879434a93d6694e62fbb021">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="b12b8175e879434a93d6694e62fbb021" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b12b8175e879434a93d6694e62fbb021" onclick="_selectAjaxTableAllData(this,'b12b8175e879434a93d6694e62fbb021')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="b12b8175e879434a93d6694e62fbb021" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="TRAN_CODE" formId="b12b8175e879434a93d6694e62fbb021" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="TRAN_DATE" formId="b12b8175e879434a93d6694e62fbb021" /></td>
			<td class="datagrid-cell" style="width:200px;display:none;"><bu:uitn colNo="TRAN_USER_ID" formId="b12b8175e879434a93d6694e62fbb021" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="TRAN_USER_ID" formId="b12b8175e879434a93d6694e62fbb021" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="TRAN_NAME" formId="b12b8175e879434a93d6694e62fbb021" /></td>
<!--<td>培训员工数</td>--><td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="TRAN_COUNT" formId="b12b8175e879434a93d6694e62fbb021" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="TRAN_FILE_NAME" formId="b12b8175e879434a93d6694e62fbb021" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDivb12b8175e879434a93d6694e62fbb021" onscroll="ajaxTableScroll(this,'b12b8175e879434a93d6694e62fbb021')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb12b8175e879434a93d6694e62fbb021">
		<tbody id="tbody_b12b8175e879434a93d6694e62fbb021" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb12b8175e879434a93d6694e62fbb021==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchReward&formId=b12b8175e879434a93d6694e62fbb021&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="85e955dd40c84174bd027d81c94347bf" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="85e955dd40c84174bd027d81c94347bf" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
    
    
    
 <script type="text/javascript">
 
 function listAjaxTable(formId){
    var currentPage="";
    var pageRecord="";
    var isFirstLoad;
    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
    var url = "${path}buss/bussModel_listMsData.ms";
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
    
    
function isPage(formId){
    var isPageVal =  $("#formPage"+formId).val();
    if(isPageVal =="1"){    
       return true;
    }
    return false;
}


function query(thisObj){
    var formId = $("#formId1").val();//alert(1);
    searchReward(formId);
}


function clearChildTable(){
    $(".isChilds").empty();
    getFormIdInitChildPage();
}


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
    //utilsFp.alert(msg);
    utilsFp.confirmIcon(3,"","","", msg,"","350","");
    
}


function clearAllSelect(){
    $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
}

function reloadPg(msg,title,width,height,time){
    msgPop(msg,"",title,width,height,time);
}


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
    if($("#DATA_AUTH").length>0){
    	data["DATA_AUTH"] = $("#DATA_AUTH").val();
    }
    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=a56a5505ce2446cab06c4797ef3c47ba";
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
            utilsFp.confirmIcon(3,"","","", "后台操作出错!","","260","145");
        }
    });
}

function setCrossWiseScroll(formId,arrHtml){
    if(arrHtml.length==0){
        var tableWidth = $("#datagrid-btable-ajax"+formId).width();  
        arrHtml.push("<tr  style='width: ");
        arrHtml.push(tableWidth+"px");
        arrHtml.push(";");
        arrHtml.push("height:1000px;'></tr>");
        $("#tableDiv"+formId).css({"overflow-y":"hidden","overflow-x":"auto"});
   }else{
        $("#tableDiv"+formId).css({"overflow-y":"auto","overflow-x":"auto"});    
   }
}


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


function firstLoadThisPage(formId){
    if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
        return true;
    }
    return false;
}


function getFormIdInitChildPage(){
    var tableCount = $("#tableCount").val();
    for ( var i = 2; i <= tableCount; i++) {
        var formId = $("#formId"+i).val();
        if(isPage(formId)){
           initChildPage(formId);
        }
    }
}


function initTableWidth(){
    var width = $(window).width() - 2;
    $(".datagrid-htable,.datagrid-btable").width(width);
}



function init(){
    if($(".leftTable-ajax").length>0){
        $(".leftTable-ajax").show();
    };
    getFormIdInitChildPage();
    initTableWidth();
    listAjaxTable($("#formId1").val());
    
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
                relColVals += $("tr[abbr='"+abbr+"']").find("input[name='"+v+"']").val()+",";
            });
            setSubData(formId1,subFormIds,subRelColIds,relColVals,"","",true);
        });
    };
});

function getRelColVal(arr,obj,colNo){
      if(colNo){
       var arrColNo = colNo.split(",");
          $(arrColNo).each(function(i,v){
             if(v!="ID"){
               arr.push("<input type='hidden' name='"+v+"' value='"+obj[v]+"' />");
             }
          });
      }
}
var isFirstSetScroll = 0;
</script>
 
 
  <script type="text/javascript">
<%--生成异步表格--%>

//$(function(){
//    $.ajax({
//        type: "POST",
//        dataType: "json",
//        url: "${path}buss/bussModel_exeFunc.ms?funcMId=03d223078e8a4535838bd7e68a32c357",
//        data: "",
//        success: function(data){
//            
//        },
//       error: function(msg){
//            
//        }
//    });
//    
//})


function createTableModel(ms,formId){
    /*var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='b12b8175e879434a93d6694e62fbb021'){<%--员工培训记录--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TRAN_CODE' class='datagrid-cell "+ms.tdClass(formId, 'TRAN_CODE')+"' style='"+ms.tdStyle(formId, 'TRAN_CODE')+"' "+ms.tdEvent(formId, 'TRAN_CODE')+">")
            arrHtml.push("<span colno='TRAN_CODE' class='"+ms.uiClass(formId, 'TRAN_CODE')+"' style='"+ms.uiStyle(formId, 'TRAN_CODE')+"' "+ms.uiEvent(formId, 'TRAN_CODE')+" title='"+ms.titleAttr(formId,'TRAN_CODE','IS_TITLE_ATTR',v)+"' >"+v['TRAN_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TRAN_DATE' class='datagrid-cell "+ms.tdClass(formId, 'TRAN_DATE')+"' style='"+ms.tdStyle(formId, 'TRAN_DATE')+"' "+ms.tdEvent(formId, 'TRAN_DATE')+">")
            arrHtml.push("<span colno='TRAN_DATE' class='"+ms.uiClass(formId, 'TRAN_DATE')+"' style='"+ms.uiStyle(formId, 'TRAN_DATE')+"' "+ms.uiEvent(formId, 'TRAN_DATE')+" title='"+ms.titleAttr(formId,'TRAN_DATE','IS_TITLE_ATTR',v)+"' >"+v['TRAN_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TRAN_USER_ID' class='datagrid-cell "+ms.tdClass(formId, 'TRAN_USER_ID')+"' style='"+ms.tdStyle(formId, 'TRAN_USER_ID')+"' "+ms.tdEvent(formId, 'TRAN_USER_ID')+">")
            arrHtml.push("<span colno='TRAN_USER_ID' class='"+ms.uiClass(formId, 'TRAN_USER_ID')+"' style='"+ms.uiStyle(formId, 'TRAN_USER_ID')+"' "+ms.uiEvent(formId, 'TRAN_USER_ID')+" title='"+ms.titleAttr(formId,'TRAN_USER_ID','IS_TITLE_ATTR',v)+"' >"+v['TRAN_USER_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TRAN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'TRAN_NAME')+"' style='"+ms.tdStyle(formId, 'TRAN_NAME')+"' "+ms.tdEvent(formId, 'TRAN_NAME')+">")
            arrHtml.push("<span colno='TRAN_NAME' class='"+ms.uiClass(formId, 'TRAN_NAME')+"' style='"+ms.uiStyle(formId, 'TRAN_NAME')+"' "+ms.uiEvent(formId, 'TRAN_NAME')+" title='"+ms.titleAttr(formId,'TRAN_NAME','IS_TITLE_ATTR',v)+"' >"+v['TRAN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TRAN_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'TRAN_COUNT')+"' style='"+ms.tdStyle(formId, 'TRAN_COUNT')+"' "+ms.tdEvent(formId, 'TRAN_COUNT')+">")
            arrHtml.push("<span colno='TRAN_COUNT' class='"+ms.uiClass(formId, 'TRAN_COUNT')+"' style='"+ms.uiStyle(formId, 'TRAN_COUNT')+"' "+ms.uiEvent(formId, 'TRAN_COUNT')+" title='"+ms.titleAttr(formId,'TRAN_COUNT','IS_TITLE_ATTR',v)+"' >"+v['TRAN_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TRAN_FILE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'TRAN_FILE_NAME')+"' style='"+ms.tdStyle(formId, 'TRAN_FILE_NAME')+"' "+ms.tdEvent(formId, 'TRAN_FILE_NAME')+">")
            arrHtml.push("<span colno='TRAN_FILE_NAME' class='"+ms.uiClass(formId, 'TRAN_FILE_NAME')+"' style='"+ms.uiStyle(formId, 'TRAN_FILE_NAME')+"' "+ms.uiEvent(formId, 'TRAN_FILE_NAME')+" title='"+ms.titleAttr(formId,'TRAN_FILE_NAME','IS_TITLE_ATTR',v)+"' >"+v['TRAN_FILE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    */
    searchReward(formId);
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll();
}





//清除全选
function clearAllSelect(){
    $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
}

//主页面查询按钮触发函数
function searchReward(formId){
    var url = "${path}buss/bussModel_exeFunc.ms?funcMId=94788789f8cb4f3196680058499abb5c";
    SearchRewardList(formId,url);
}

//ajax查询奖惩信息
function SearchRewardList(formId,url){
    var currentPage="";
    var pageRecord="";
    var isFirstLoad;
    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
    if(isPage(formId)){
        isFirstLoad = firstLoadThisPage(formId);
        currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
        pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
    }
    var loginName = $.trim($("#LOGIN_NAME").val());
    var name = $.trim($("#NAME").val());
    var tranName = $.trim($("#TRAN_NAME").val());
    var tranCode = $.trim($("#TRAN_CODE").val());
    //var rewardType = $("#REWARD_TYPE").val();
    var tranDateBegin = $("#TRAN_DATE_BEGIN").val();
    var tranDateEnd = $("#TRAN_DATE_END").val();
    var formId = $("#formId1").val();
    var dataAuth = $("#DATA_AUTH").val();
    util.showLoading("处理中...");
    	$.ajax({
    		type: "POST",
    	    dataType: "json",
    	    url: url,
    	    data:{"paraMap.loginName":loginName,"paraMap.name":name,"paraMap.tranName":tranName,"paraMap.tranCode":tranCode,"paraMap.tranDateBegin":tranDateBegin,"paraMap.tranDateEnd":tranDateEnd,"page.currentPage":currentPage,"page.pageRecord":pageRecord,"dataAuth":dataAuth},
    		success: function(data){
    		        console.log(data);
				util.closeLoading();
				$("#tbody_b12b8175e879434a93d6694e62fbb021").empty();
				if(null != data.ajaxPage.dataList){
					var tempType;	
					var tranList = eval(data.ajaxPage.dataList);
	
					for(var i = 0;i < tranList.length; i++){
						var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
						var fileTd = "<a colno='TRAN_FILE_NAME' href='"
                                + ${path}+"buss/bussModel_dlFileComm.ms?paraMap.fid="+tranList[i].TRAN_FILE_REAL_NAME
                                + "&paraMap.fpath="+tranList[i].TRAN_FILE_PATH+"&paraMap.fname="+tranList[i].TRAN_FILE_NAME
                                + "' title='点击下载文件,文件大小:"+(tranList[i].TRAN_FILE_SIZE/1024).toFixed(2)+"KB' target='_blank'>"
                                + tranList[i].TRAN_FILE_NAME+"</a>";
                        var tranFile = tranList[i].TRAN_FILE_NAME==null?" ":fileTd;
                        var tranDate = tranList[i].TRAN_DATE?tranList[i].TRAN_DATE.substr(0,tranList[i].TRAN_DATE.indexOf('T')):"";
                    	//var dictTy =tranList[i].REWARD_TYPE==null?"":"<dict:lang value='"+dict[rewardList[i].REWARD_TYPE]+"'/>";
	 					var trHtml = "<tr class='datagrid-row "+backgroudColor+" ' id='"+tranList[i].ID+"' abbr='"+tranList[i].ID+"' style='cursor: pointer;'>"
                        + "<input type='hidden' name='ID' value='"+tranList[i].ID+"' />"
                        + "<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+((currentPage-1)*pageRecord+(i+1))+"</span></td>"
                        + "<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
                        + "<input type='checkbox' name='"+formId+"$ID' value='"+tranList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>"
                        + "</td>"
                        + "<td  class='datagrid-cell ' style='width:200px;text-align:center;'>"
                        + "<span   class='datagrid-cell' title='"+tranList[i].DATA_AUTH+"'>"+tranList[i].DATA_AUTH+"</span>"
                        + "<input type='hidden' id='DATA_AUTH_ID_"+tranList[i].ID+"' value='"+tranList[i].AUTHVAL+"' /></td>"                        
                        + "<td colno='TRAN_CODE' class='datagrid-cell ' style='width:200px;text-align:left;'>"
                        + "<span colno='TRAN_CODE'  class='datagrid-cell' title='"+tranList[i].TRAN_CODE+"'>"+tranList[i].TRAN_CODE+"</span>"
                        + "</td>"
                        + "<td colno='TRAN_DATE' class='datagrid-cell'  style='width:200px;text-align:center;' >"
                        + "<span colno='TRAN_DATE' >"+tranDate+"</span>"
                        + "</td>"
                        + "<td colno='TRAN_USER_ID' style='width:80px;display:none'  class='datagrid-cell '>"
                        + "<span colno='TRAN_USER_ID' title='"+tranList[i].USER_ID+"'>"+tranList[i].USER_ID+"</span>"
                        + "</td>"
                        + "<td colno='TRAN_USER_NAME' class='datagrid-cell 'style='width:200px;text-align:center;'>"
                        + "<span colno='TRAN_USER_NAME' title='"+tranList[i].NAME+"'>"+tranList[i].NAME+"</span>"
                        + "</td>"
                        + "<td colno='TRAN_NAME' class='datagrid-cell 'style='width:200px;text-align:center;'>"
                        + "<span colno='TRAN_NAME' title='"+tranList[i].TRAN_NAME+"'>"+tranList[i].TRAN_NAME+"</span>"
                        + "</td>"
                        + "<td colno='TRAN_COUNT' class='datagrid-cell 'style='width:200px;text-align:right;'>"
                        + "<span colno='TRAN_COUNT' title='"+tranList[i].TRAN_COUNT+"'>"+tranList[i].TRAN_COUNT+"</span>"
                        + "</td>"
                        
                        + "<td colno='TRAN_FILE_NAME' class='datagrid-cell' style='width:200px;text-align:center;'>"
                        + tranFile
                        + "</td>"
                        
                        /*
                        + "<td colno='TRAN_FILE_NAME' class='datagrid-cell' style=' text-align:center;'>"
                        + "<a colno='TRAN_FILE_NAME' >"+tranList[i].TRAN_FILE_NAME+"</a>"
                        + "</td>"
                        */
                        + "</tr>";
	 					//if(i==0){
	 					 //   trHtml = trHtml + "<input type='hidden' id='firstGroup' value='"+rccList[i].CIG_SN+"' />";
	 					//}
						$("#tbody_b12b8175e879434a93d6694e62fbb021").append(trHtml);	
						clearAllSelect();
					}
					setPopScroll('.scroll2','.head2');
					pageFun(data.ajaxPage,"b12b8175e879434a93d6694e62fbb021");
					defTableWidthRewrite("b12b8175e879434a93d6694e62fbb021");
					//getFirstItem();
					clickTr('tbody_b12b8175e879434a93d6694e62fbb021');
				}
			},
		error: function(msg){
				util.closeLoading();
				console.log("sss");
				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
		  }
		});
}









function searchTran(paginationImpl){
    var url = "${path}buss/bussModel_exeFunc.ms?funcMId=94788789f8cb4f3196680058499abb5c"; 
    SearchTranList(paginationImpl,url);
}

//修改！！！！！！！！！！！！！！！！！！！！
function SearchTranList(paginationImpl,url){
    var loginName = $.trim($("#T3#LOGIN_NAME").val());
    var name = $.trim($("#T3#NAME").val());
    var tranName = $.trim($("#TRAN_NAME").val());
    //var rewardType = $("#REWARD_TYPE").val();
    var tranDateBegin = $("#TRAN_DATE_BEGIN").val();
    var tranDateEnd = $("#TRAN_DATE_END").val();
    var formId = $("#formId1").val();
    util.showLoading("处理中...");
    	$.ajax({
    		type: "POST",
    	    dataType: "json",
    	    url: url,
    	    data: "paraMap.loginName="+loginName+"&paraMap.name="+name+"&paraMap.tranName="+tranName
    	            + "&paraMap.tranDateBegin="+tranDateBegin+"&paraMap.tranDateEnd="+tranDateEnd
    	            +"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage
    	            + "&page.pageTran=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageTran,
    		success: function(data){
				util.closeLoading();
				console.log(data)
				$("#tbody_b12b8175e879434a93d6694e62fbb021").empty();
				if(null != data.ajaxPage.dataList){
					var tempType;	
					var tranList = eval(data.ajaxPage.dataList);
					for(var i = 0;i < rccList.length; i++){
						var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
						//var reType = tranList[i].REWARD_TYPE;
	 					var trHtml = "<tr class='datagrid-row "+backgroudColor+" ' id='"+tranList[i].ID+"' abbr='"+tranList[i].ID+"' style='cursor: pointer;'>"
                        + "<input type='hidden' name='ID' value='"+tranList[i].ID+"' />"
                        + "<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'></span></td>"
                        + "<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
                        + "<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>"
                        + "</td>"
                        + "<td  class='datagrid-cell ' style='width:200px;' >"
                        + "<span   class='datagrid-cell' >"+tranList[i].DATA_AUTH+"</span>"
                        + "<input type='hidden' id='DATA_AUTH_ID_"+tranList[i].AUTHVAL+"' value='"+tranList[i].AUTHVAL+"' /></td>"                        
                        + "<td colno='TRAN_CODE' class='datagrid-cell ' >"
                        + "<span colno='TRAN_CODE'  class='datagrid-cell' >"+tranList[i].TRAN_CODE+"</span>"
                        + "</td>"
                        + "<td colno='TRAN_DATE' class='datagrid-cell'  text-align:center;' >"
                        + "<span colno='TRAN_DATE' >"+tranList[i].TRAN_DATE+"</span>"
                        + "</td>"
                        + "<td colno='TRAN_NAME' class='datagrid-cell '>"
                        + "<span colno='TRAN_NAME' ME'>"+tranList[i].TRAN_NAME+"</span>"
                        + "</td>"
                        //+ "<td colno='REWARD_TYPE' class='datagrid-cell' >"
                        //+ "<span colno='REWARD_TYPE' >"+rewardList[i].REWARD_TYPE+"</span>"
                        //+ "</td>"
                        + "<td colno='TRAN_COUNT' class='datagrid-cell '>"
                        + "<span colno='TRAN_COUNT' COUNT'>"+tranList[i].TRAN_COUNT+"</span>"
                        + "</td>"
                        + "<td colno='TRAN_FILE_NAME' class='datagrid-cell' style=' text-align:center;'>"
                        + "<a colno='TRAN_FILE_NAME' >"+tranList[i].TRAN_FILE_NAME+"</a>"
                        + "</td>"
                        + "</tr>";
	 					//if(i==0){
	 					 //   trHtml = trHtml + "<input type='hidden' id='firstGroup' value='"+rccList[i].CIG_SN+"' />";
	 					//}
						$("#tbody_b12b8175e879434a93d6694e62fbb021").append(trHtml);
					}
					pageFun(data.ajaxPage,"b12b8175e879434a93d6694e62fbb021");
					//getFirstItem();
				}
			},
		error: function(msg){
				util.closeLoading();
				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
		  }
		});
}

function getCount() {
    var url="${path}buss/bussModel_exeFunc.ms?funcMId=57426c1f7d06413587263c00981aa63a";
    console.log('111');
   // var jsonData = {"tranCode" : tranCode};			
    //var tranCount = "";
	$.ajax({
		type: "post",
		dataType: "json",
		url: url,
	//	data: jsondata,
		success: function(data) {	
		console.log("woshi")
		console.log(data);
           	//tranCount = data.ajaxPage.dataList[0].tranCount; 
        },
    	error: function(msg) {
			util.closeLoading();
			utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "", "");
		}
	})
//	return tranCount;
}


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
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
		}








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
