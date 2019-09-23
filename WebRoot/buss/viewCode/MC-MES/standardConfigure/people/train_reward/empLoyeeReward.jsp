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
		<dict:lang value="员工奖惩记录表" />
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
		<bu:header formId ="1355857367cc4b2bb5a807aae7d37a48"/>

    
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
		<bu:func viewId="429ab2829568490a9aca8d898fe2f93b" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="429ab2829568490a9aca8d898fe2f93b" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
                     
		<input type="hidden" name="formPage1355857367cc4b2bb5a807aae7d37a48" id="formPage1355857367cc4b2bb5a807aae7d37a48" value="${formPage1355857367cc4b2bb5a807aae7d37a48}"/>
		<input type="hidden" name="formId" id="formId1" value='1355857367cc4b2bb5a807aae7d37a48'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="para_Dict" />
		<div class="panel-ajax datagrid datagrid-div1"  id="1355857367cc4b2bb5a807aae7d37a48">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax1355857367cc4b2bb5a807aae7d37a48" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-inner1355857367cc4b2bb5a807aae7d37a48">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable1355857367cc4b2bb5a807aae7d37a48">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="1355857367cc4b2bb5a807aae7d37a48" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_1355857367cc4b2bb5a807aae7d37a48" onclick="_selectAjaxTableAllData(this,'1355857367cc4b2bb5a807aae7d37a48')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="REWARD_CODE" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="REWARD_DATE" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="REWARD_NAME" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="REWARD_TYPE" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
			<td  class="datagrid-cell" style="width:200px;">奖惩员工数</td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="REWARD_FILE_NAME" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv1355857367cc4b2bb5a807aae7d37a48" onscroll="ajaxTableScroll(this,'1355857367cc4b2bb5a807aae7d37a48')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax1355857367cc4b2bb5a807aae7d37a48">
		<tbody id="tbody_1355857367cc4b2bb5a807aae7d37a48" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage1355857367cc4b2bb5a807aae7d37a48==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchReward&formId=1355857367cc4b2bb5a807aae7d37a48&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="429ab2829568490a9aca8d898fe2f93b" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="429ab2829568490a9aca8d898fe2f93b" />
    
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
function createTableModel(ms,formId){

   /* var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='1355857367cc4b2bb5a807aae7d37a48'){<%--员工奖惩记录表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='REWARD_CODE' class='datagrid-cell "+ms.tdClass(formId, 'REWARD_CODE')+"' style='"+ms.tdStyle(formId, 'REWARD_CODE')+"' "+ms.tdEvent(formId, 'REWARD_CODE')+">")
            arrHtml.push("<span colno='REWARD_CODE' class='"+ms.uiClass(formId, 'REWARD_CODE')+"' style='"+ms.uiStyle(formId, 'REWARD_CODE')+"' "+ms.uiEvent(formId, 'REWARD_CODE')+" title='"+ms.titleAttr(formId,'REWARD_CODE','IS_TITLE_ATTR',v)+"' >"+v['REWARD_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='REWARD_DATE' class='datagrid-cell "+ms.tdClass(formId, 'REWARD_DATE')+"' style='"+ms.tdStyle(formId, 'REWARD_DATE')+" text-align:center;' "+ms.tdEvent(formId, 'REWARD_DATE')+">")
            arrHtml.push("<span colno='REWARD_DATE' class='"+ms.uiClass(formId, 'REWARD_DATE')+"' style='"+ms.uiStyle(formId, 'REWARD_DATE')+"' "+ms.uiEvent(formId, 'REWARD_DATE')+" title='"+ms.titleAttr(formId,'REWARD_DATE','IS_TITLE_ATTR',v)+"' >"+v['REWARD_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='REWARD_NAME' class='datagrid-cell "+ms.tdClass(formId, 'REWARD_NAME')+"' style='"+ms.tdStyle(formId, 'REWARD_NAME')+"' "+ms.tdEvent(formId, 'REWARD_NAME')+">")
            arrHtml.push("<span colno='REWARD_NAME' class='"+ms.uiClass(formId, 'REWARD_NAME')+"' style='"+ms.uiStyle(formId, 'REWARD_NAME')+"' "+ms.uiEvent(formId, 'REWARD_NAME')+" title='"+ms.titleAttr(formId,'REWARD_NAME','IS_TITLE_ATTR',v)+"' >"+v['REWARD_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='REWARD_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'REWARD_TYPE')+"' style='"+ms.tdStyle(formId, 'REWARD_TYPE')+"' "+ms.tdEvent(formId, 'REWARD_TYPE')+">")
            arrHtml.push("<span colno='REWARD_TYPE' class='"+ms.uiClass(formId, 'REWARD_TYPE')+"' style='"+ms.uiStyle(formId, 'REWARD_TYPE')+"' "+ms.uiEvent(formId, 'REWARD_TYPE')+" title='"+ms.titleAttr(formId,'REWARD_TYPE','IS_TITLE_ATTR',v)+"' >"+v['REWARD_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='REWARD_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'REWARD_COUNT')+"' style='"+ms.tdStyle(formId, 'REWARD_COUNT')+"' "+ms.tdEvent(formId, 'REWARD_COUNT')+">")
            arrHtml.push("<span colno='REWARD_COUNT' class='"+ms.uiClass(formId, 'REWARD_COUNT')+"' style='"+ms.uiStyle(formId, 'REWARD_COUNT')+"' "+ms.uiEvent(formId, 'REWARD_COUNT')+" title='"+ms.titleAttr(formId,'REWARD_COUNT','IS_TITLE_ATTR',v)+"' >"+v['REWARD_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='REWARD_FILE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'REWARD_FILE_NAME')+"' style='"+ms.tdStyle(formId, 'REWARD_FILE_NAME')+" text-align:center;' "+ms.tdEvent(formId, 'REWARD_FILE_NAME')+">")
            arrHtml.push("<a colno='REWARD_FILE_NAME' class='"+ms.uiClass(formId, 'REWARD_FILE_NAME')+"' style='"+ms.uiStyle(formId, 'REWARD_FILE_NAME')+" ' "+ms.uiEvent(formId, 'REWARD_FILE_NAME')+" title='"+ms.titleAttr(formId,'REWARD_FILE_NAME','IS_TITLE_ATTR',v)+"' >"+v['REWARD_FILE_NAME']+"</a>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }*/
    ajaxGetDict(formId);
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll();
}

//获取数据字典奖惩类型
function ajaxGetDict(formId){
    var url = "${path}buss/bussModel_exeFunc.ms?funcMId=c3f7a916e8f443ac8240405af5c78844";
    $.ajax({
       type: 'POST',
       dataType: 'json',
       url: url,
       success: function(data) {					

            data = eval(data.ajaxMap.dictList);
        	var dict = {};
			//console.log(data);
        	for (var i = 0; i < data.length; i++) {
        	    var code = data[i].CODE;
        	    dict[code] = data[i].VALUE;
        	}
        	dict = JSON.stringify(dict);
        //	console.log(dict);
        	$("#para_Dict").val(dict);
        	searchReward(formId);
       },
       error: function(msg) {
		   utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
       }
        
    });
}

//清除全选
function clearAllSelect(){
    $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
}

//主页面查询按钮触发函数
function searchReward(formId){
    var url = "${path}buss/bussModel_exeFunc.ms?funcMId=98b24947a46249759fe9b2f94cb5c244";
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
    var rewardName = $.trim($("#REWARD_NAME").val());
    var rewardType = $("#REWARD_TYPE").val();
    var rewardDateBegin = $("#REWARD_DATE_BEGIN").val();
    var rewardDateEnd = $("#REWARD_DATE_END").val();
    var formId = $("#formId1").val();
    var dataAuth = $("#DATA_AUTH").val();
    util.showLoading("处理中...");
    	$.ajax({
    		type: "POST",
    	    dataType: "json",
    	    url: url,
    	    data: {
            "paraMap.loginName" : loginName,
            "paraMap.name" : name,
            "paraMap.rewardName" : rewardName,
            "paraMap.rewardType" : rewardType,
            "paraMap.rewardDateBegin" : rewardDateBegin,
            "paraMap.rewardDateEnd" : rewardDateEnd,
            "page.currentPage" : currentPage,
            "page.pageRecord" : pageRecord,
            "dataAuth":dataAuth
					
            },
    	    
    	    //"paraMap.loginName="+loginName+"&paraMap.name="+name+"&paraMap.rewardName="+rewardName+"&paraMap.rewardType="+rewardType
    	    //        + "&paraMap.rewardDateBegin="+rewardDateBegin+"&paraMap.rewardDateEnd="+rewardDateEnd+"&page.currentPage="+currentPage		
            //        + "&page.pageRecord=" + pageRecord,
    		success: function(data){
    		        		//console.log('>>1')
    		        	//	console.log(data)
				util.closeLoading();
				$("#tbody_1355857367cc4b2bb5a807aae7d37a48").empty();
				if(null != data.ajaxPage.dataList){
					var tempType;	
					var rewardList = eval(data.ajaxPage.dataList);

			        //ajaxGetDict();	
					var dict = JSON.parse($("#para_Dict").val());
		
					console.log("rewardList::"+rewardList)
					for(var i = 0;i < rewardList.length; i++){
						var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
						var dictTy;
						var fileTd = "<a colno='REWARD_FILE_NAME' href='"
                                + ${path}+"buss/bussModel_dlFileComm.ms?paraMap.fid="+rewardList[i].REWARD_FILE_REAL_NAME
                                + "&paraMap.fpath="+rewardList[i].REWARD_FILE_PATH+"&paraMap.fname="+rewardList[i].REWARD_FILE_NAME
                                + "' title='点击下载文件,文件大小:"+(rewardList[i].REWARD_FILE_SIZE/1024).toFixed(2)+"KB' target='_blank'>"
                                + rewardList[i].REWARD_FILE_NAME+"</a>";
                        var rewardFile	= rewardList[i].REWARD_FILE_NAME==null?" ":fileTd;
                        var rewardDate = rewardList[i].REWARD_DATE?rewardList[i].REWARD_DATE.substr(0,rewardList[i].REWARD_DATE.indexOf('T')):"";
                        if(rewardList[i].VALUE==null){
                             rewardList[i].VALUE="";
                        }
                        
                         //dictTy=rewardList[i].REWARD_TYPE==null?"":"<dict:lang value='"+rewardList[i].REWARD_TYPE+"'/>";
                    	//var dictTy =rewardList[i].REWARD_TYPE==null?"":"<dict:lang value='"+dict[rewardList[i].REWARD_TYPE]+"'/>";
                        	
	 					var trHtml = "<tr class='datagrid-row "+backgroudColor+" ' id='"+rewardList[i].ID+"' abbr='"+rewardList[i].ID+"' style='cursor: pointer;'>"
                        + "<input type='hidden' name='ID' value='"+rewardList[i].ID+"' />"
                        + "<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+((currentPage-1)*pageRecord+(i+1))+"</span></td>"
                        + "<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
                        + "<input type='checkbox' name='"+formId+"$ID' value='"+rewardList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>"
                        + "</td>"
                        + "<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH' style='width:200px;text-align:center;'>"
                        + "<span colno='DATA_AUTH'  class='datagrid-cell' title='"+rewardList[i].DATA_AUTH+"'>"+rewardList[i].DATA_AUTH+"</span>"
                        + " <input type='hidden' id='DATA_AUTH_ID_"+rewardList[i].ID+"' value='"+rewardList[i].AUTHVAL+"' /></td>"                        
                        + "<td colno='REWARD_CODE' class='datagrid-cell ' style='width:200px;'>"
                        + "<span colno='REWARD_CODE'  class='datagrid-cell' title='"+rewardList[i].REWARD_CODE+"'>"+rewardList[i].REWARD_CODE+"</span>"
                        + "</td>"
                        + "<td colno='REWARD_DATE' class='datagrid-cell'  style='text-align:center;width:140px;' >"
                        + "<span colno='REWARD_DATE' >"+rewardDate+"</span>"
                        + "</td>"
                        + "<td colno='REWARD_NAME' class='datagrid-cell 'style='width:200px;'>"
                        + "<span colno='REWARD_NAME' title='"+rewardList[i].REWARD_NAME+"'>"+rewardList[i].REWARD_NAME+"</span>"
                        + "</td>"
                      //+ "<td colno='REWARD_TYPE' class='datagrid-cell' >"
                     //+ "<span colno='REWARD_TYPE' title='"+rewardList[i].REWARD_TYPE+"'> " +rewardList[i].REWARD_TYPE + "</span>"
                        + "<td colno='REWARD_TYPE' class='datagrid-cell' style='width:200px;'>"
                        + "<span colno='REWARD_TYPE' title='"+ rewardList[i].VALUE+"'> " +rewardList[i].VALUE + "</span>"
                        + "</td>"
                        + "<td colno='REWARD_COUNT' class='datagrid-cell ' style=' text-align:right;width:200px;'>"
                        + "<span colno='REWARD_COUNT' title='"+rewardList[i].REWARD_COUNT+"'>"+rewardList[i].REWARD_COUNT+"</span>"
                        + "</td>"
                        + "<td colno='REWARD_FILE_NAME' class='datagrid-cell' style=' text-align:center;width:200px;'>"
                        + rewardFile
                        + "</td>"
                        + "</tr>";
	 					//if(i==0){
	 					 //   trHtml = trHtml + "<input type='hidden' id='firstGroup' value='"+rccList[i].CIG_SN+"' />";
	 					//}
						$("#tbody_1355857367cc4b2bb5a807aae7d37a48").append(trHtml);	
						clearAllSelect();

					}
					setPopScroll('.scroll2','.head2');
					pageFun(data.ajaxPage,"1355857367cc4b2bb5a807aae7d37a48");
						defTableWidthRewrite("1355857367cc4b2bb5a807aae7d37a48");
					//getFirstItem();
						clickTr('tbody_1355857367cc4b2bb5a807aae7d37a48');
				}
				
			},
		error: function(msg){
				util.closeLoading();
				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
		  }
		});
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
