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
		<dict:lang value="员工考核记录" />
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
		<bu:header formId ="8908aae883f6400f82375bedb9a6ac3f"/>

    
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
		<bu:func viewId="037651f1eabb447d97b7d745a0115621" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="037651f1eabb447d97b7d745a0115621" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
                     
		<input type="hidden" name="formPage8908aae883f6400f82375bedb9a6ac3f" id="formPage8908aae883f6400f82375bedb9a6ac3f" value="${formPage8908aae883f6400f82375bedb9a6ac3f}"/>
		<input type="hidden" name="formId" id="formId1" value='8908aae883f6400f82375bedb9a6ac3f'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="para_Dict_B" />
		<input type="hidden" id="para_Dict_A" />
		<div class="panel-ajax datagrid datagrid-div1"  id="8908aae883f6400f82375bedb9a6ac3f">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax8908aae883f6400f82375bedb9a6ac3f" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-inner8908aae883f6400f82375bedb9a6ac3f">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable8908aae883f6400f82375bedb9a6ac3f">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="8908aae883f6400f82375bedb9a6ac3f" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_8908aae883f6400f82375bedb9a6ac3f" onclick="_selectAjaxTableAllData(this,'8908aae883f6400f82375bedb9a6ac3f')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="ASSESS_CODE" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="ASSESS_DATE" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="ASSESS_LEVEL_B" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="ASSESS_LEVEL_A" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="ASSESS_COUNT" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<td class="datagrid-cell" style="width:200px;"><span><dict:lang value="附件" /><span></span></span></td>
		<!--	<td class="datagrid-cell"><bu:uitn colNo="ASSESS_FILE" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>-->
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv8908aae883f6400f82375bedb9a6ac3f" onscroll="ajaxTableScroll(this,'8908aae883f6400f82375bedb9a6ac3f')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax8908aae883f6400f82375bedb9a6ac3f">
		<tbody id="tbody_8908aae883f6400f82375bedb9a6ac3f" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage8908aae883f6400f82375bedb9a6ac3f==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchAssess&formId=8908aae883f6400f82375bedb9a6ac3f&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
             
            </div>
        </div>
    </div>
		<bu:submit viewId="037651f1eabb447d97b7d745a0115621" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="037651f1eabb447d97b7d745a0115621" />
    
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
    searchAssess(formId);
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
           initChildPage("formId1");
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
    if(formId=='8908aae883f6400f82375bedb9a6ac3f'){<%--员工奖惩记录表--%>
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
  // ajaxGetDict(formId);
  	searchAssess(formId);
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll();
}

//获取数据字典奖惩类型
function ajaxGetDict(formId){
   var url = "${path}buss/bussModel_exeFunc.ms?funcMId=3a0c6b96937c45cba28e95a8af4d1be8";
    $.ajax({
       type: 'POST',
       dataType: 'json',
       url: url,
       success: function(data) {					

            data = eval(data.ajaxMap.dictList);
        	var dict1 = {};
        	var dict2 ={};
			//console.log(data);
        	for (var i = 0; i < data.length; i++) {
        	    var code = data[i].CODE;
        	    dict1[code] = data[i].VALUE;
        	    dict2[code] =data[i].VALUE;
        	}
        	dict1 = JSON.stringify(dict1);
        	dict2 = JSON.stringify(dict2);
        //	console.log(dict);
        	$("#para_Dict_B").val(dict1);
        	$("#para_Dict_A").val(dict2);
        	searchAssess(formId);
       },
       error: function(msg) {
		   utilsFp.confirmIcon(3,"","","", "error:eee"+msg,0,"300","");
       }
        
    });
}

//清除全选
function clearAllSelect(){
    $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
}

//主页面查询按钮触发函数
function searchAssess(formId){
    var url = "${path}buss/bussModel_exeFunc.ms?funcMId=88ca65992ac341279714ad78550c8027";
    SearchAssessList(formId,url);
}

//ajax查询奖惩信息
function SearchAssessList(formId,url){
    var currentPage="";
    var pageRecord="";
    var isFirstLoad;
    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
    if(isPage(formId)){
        isFirstLoad = firstLoadThisPage(formId);
        currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
        pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
    }
    var  loginName= $.trim($("#LOGIN_NAME").val());
    var name = $.trim($("#NAME").val());
    var assessLevelB = $.trim($("#ASSESS_LEVEL_B").val());
    var assessLevelA = $.trim($("#ASSESS_LEVEL_A").val());
    var assessCode = $("#ASSESS_CODE").val();
    var assessDateBegin = $("#ASSESS_DATE_BEGIN").val();
    var assessDateEnd = $("#ASSESS_DATE_END").val();
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
            "paraMap.assessLevelB" : assessLevelB,			
            "paraMap.assessLevelA" : assessLevelA,			
            "paraMap.assessDateBegin" : assessDateBegin,
            "paraMap.assessDateEnd" : assessDateEnd,
            "page.currentPage" : currentPage,
            "paraMap.assessCode" : assessCode,
            "page.pageRecord" : pageRecord,
            "dataAuth":dataAuth
            },
    	    
    	    //"paraMap.loginName="+loginName+"&paraMap.name="+name+"&paraMap.assessLevelB="+assessLevelB+"&paraMap.assessLevelA="+assessLevelA
    	    //        + "&paraMap.assessDateBegin="+assessDateBegin+"&paraMap.assessDateEnd="+assessDateEnd+"&page.currentPage="+currentPage	
    	    //        +"&paraMap.assessCode="+assessCode	 + "&page.pageRecord=" + pageRecord,
    		success: function(data){
    		        		console.log('>>1')
    		        		console.log(data)
				util.closeLoading();
				$("#tbody_8908aae883f6400f82375bedb9a6ac3f").empty();
				if(null != data.ajaxPage.dataList){
					var tempType;	
					var assessList = eval(data.ajaxPage.dataList);

			        //ajaxGetDict();	
				//	var dict1 = JSON.parse($("#para_Dict_B").val());
				//	var dict2 = JSON.parse($("#para_Dict_A").val());
		
				//	console.log(dict)
					for(var i = 0;i < assessList.length; i++){
						var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
						
						var fileTd = "<a colno='ASSESS_FILE' href='"
                                + ${path}+"buss/bussModel_dlFileComm.ms?paraMap.fid="+assessList[i].ASSESS_FILE_REAL_NAME
                                + "&paraMap.fpath="+assessList[i].ASSESS_FILE_PATH+"&paraMap.fname="+assessList[i].ASSESS_FILE
                                + "' title='点击下载文件,文件大小:"+(assessList[i].ASSESS_FILE_SIZE/1024).toFixed(2)+"KB' target='_blank'>"
                                + assessList[i].ASSESS_FILE+"</a>";
                        var assessFile	= assessList[i].ASSESS_FILE==null?" ":fileTd;
                        var assessDate = assessList[i].ASSESS_DATE?assessList[i].ASSESS_DATE.substr(0,assessList[i].ASSESS_DATE.indexOf('T')):"";
                    //	var dictTy_B =assessList[i].ASSESS_LEVEL_B==null?"":"<dict:lang value='"+dict1[assessList[i].ASSESS_LEVEL_B]+"'/>";
                    //	var dictTy_A =assessList[i].ASSESS_LEVEL_A==null?"":"<dict:lang value='"+dict2[assessList[i].ASSESS_LEVEL_A]+"'/>";
                        	
	 					var trHtml = "<tr class='datagrid-row "+backgroudColor+" ' id='"+assessList[i].ID+"' abbr='"+assessList[i].ID+"' style='cursor: pointer;'>"
                        + "<input type='hidden' name='ID' value='"+assessList[i].ID+"' />"
                        + "<td class='datagrid-cell' style='width:23px;text-align:center;' ><span class='_noedit'>"+((currentPage-1)*pageRecord+(i+1))+"</span></td>"
                        + "<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
                        + "<input type='checkbox' name='"+formId+"$ID' value='"+assessList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>"
                        + "</td>"
                        + "<td  class='datagrid-cell TD_DATA_AUTH' style='width:200px;text-align:center;'>"
                        + "<span  class='datagrid-cell ' title='"+assessList[i].DATA_AUTH2+"'>"+assessList[i].DATA_AUTH2+"</span>"
                        + "<input type='hidden' id='DATA_AUTH_ID_"+assessList[i].ID+"' value='"+assessList[i].DATA_AUTH+"' /></td>"                        
                        + "<td colno='ASSESS_CODE' class='datagrid-cell ' style='width:200px;'>"
                        + "<span colno='ASSESS_CODE'  class='datagrid-cell' title='"+assessList[i].ASSESS_CODE+"'>"+assessList[i].ASSESS_CODE+"</span>"
                        + "</td>"
                        + "<td colno='ASSESS_DATE' class='datagrid-cell'  style='width:140px;text-align:center;' >"
                        + "<span colno='ASSESS_DATE' >"+assessDate+"</span>"
                        + "</td>"
                        + "<td colno='ASSESS_LEVEL_B' class='datagrid-cell' style='width:200px;'>"
                        + "<span colno='ASSESS_LEVEL_B' title='"+ assessList[i].VALUE1+"'> " +assessList[i].VALUE1+ "</span>"
                        + "</td>"
                        + "<td colno='ASSESS_LEVEL_A' class='datagrid-cell'style='width:200px;' >"
                        + "<span colno='ASSESS_LEVEL_A' title='"+ assessList[i].VALUE2+"'> " +assessList[i].VALUE2 + "</span>"
                        + "</td>"
                      //  + "<td colno='ASSESS_LEVEL_B' class='datagrid-cell' >"
                      //  + "<span colno='ASSESS_LEVEL_B' title='"+dictTy_B+"'> " +dictTy_B+ "</span>"
                      //  + "</td>"
                     //   + "<td colno='ASSESS_LEVEL_A' class='datagrid-cell' >"
                     //   + "<span colno='ASSESS_LEVEL_A' title='"+dictTy_A+"'> " +dictTy_A+ "</span>"
                    //    + "</td>"
                        + "<td colno='ASSESS_COUNT' class='datagrid-cell ' style=' 'width:200px;text-align:right;'>"
                        + "<span colno='ASSESS_COUNT' title='"+assessList[i].ASSESS_COUNT+"'>"+assessList[i].ASSESS_COUNT+"</span>"
                        + "</td>"
                        + "<td colno='ASSESS_FILE' class='datagrid-cell' style=' 'width:200px;text-align:center;'>"
                        + assessFile
                        + "</td>"
                        + "</tr>";
	 					//if(i==0){
	 					 //   trHtml = trHtml + "<input type='hidden' id='firstGroup' value='"+rccList[i].CIG_SN+"' />";
	 					//}
						$("#tbody_8908aae883f6400f82375bedb9a6ac3f").append(trHtml);	
						clearAllSelect();

					}
					setPopScroll('.scroll2','.head2');
					pageFun(data.ajaxPage,"8908aae883f6400f82375bedb9a6ac3f");
						defTableWidthRewrite("8908aae883f6400f82375bedb9a6ac3f");
					//getFirstItem();
					clickTr('tbody_8908aae883f6400f82375bedb9a6ac3f');
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
      
      
    
      
  <!--  
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
    if(formId=='8908aae883f6400f82375bedb9a6ac3f'){<%--员工考核管理--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSESS_CODE' class='datagrid-cell "+ms.tdClass(formId, 'ASSESS_CODE')+"' style='"+ms.tdStyle(formId, 'ASSESS_CODE')+"' "+ms.tdEvent(formId, 'ASSESS_CODE')+">")
            arrHtml.push("<span colno='ASSESS_CODE' class='"+ms.uiClass(formId, 'ASSESS_CODE')+"' style='"+ms.uiStyle(formId, 'ASSESS_CODE')+"' "+ms.uiEvent(formId, 'ASSESS_CODE')+" title='"+ms.titleAttr(formId,'ASSESS_CODE','IS_TITLE_ATTR',v)+"' >"+v['ASSESS_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSESS_DATE' class='datagrid-cell "+ms.tdClass(formId, 'ASSESS_DATE')+"' style='"+ms.tdStyle(formId, 'ASSESS_DATE')+"' "+ms.tdEvent(formId, 'ASSESS_DATE')+">")
            arrHtml.push("<span colno='ASSESS_DATE' class='"+ms.uiClass(formId, 'ASSESS_DATE')+"' style='"+ms.uiStyle(formId, 'ASSESS_DATE')+"' "+ms.uiEvent(formId, 'ASSESS_DATE')+" title='"+ms.titleAttr(formId,'ASSESS_DATE','IS_TITLE_ATTR',v)+"' >"+v['ASSESS_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSESS_LEVEL_B' class='datagrid-cell "+ms.tdClass(formId, 'ASSESS_LEVEL_B')+"' style='"+ms.tdStyle(formId, 'ASSESS_LEVEL_B')+"' "+ms.tdEvent(formId, 'ASSESS_LEVEL_B')+">")
            arrHtml.push("<span colno='ASSESS_LEVEL_B' class='"+ms.uiClass(formId, 'ASSESS_LEVEL_B')+"' style='"+ms.uiStyle(formId, 'ASSESS_LEVEL_B')+"' "+ms.uiEvent(formId, 'ASSESS_LEVEL_B')+" title='"+ms.titleAttr(formId,'ASSESS_LEVEL_B','IS_TITLE_ATTR',v)+"' >"+v['ASSESS_LEVEL_B']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSESS_LEVEL_A' class='datagrid-cell "+ms.tdClass(formId, 'ASSESS_LEVEL_A')+"' style='"+ms.tdStyle(formId, 'ASSESS_LEVEL_A')+"' "+ms.tdEvent(formId, 'ASSESS_LEVEL_A')+">")
            arrHtml.push("<span colno='ASSESS_LEVEL_A' class='"+ms.uiClass(formId, 'ASSESS_LEVEL_A')+"' style='"+ms.uiStyle(formId, 'ASSESS_LEVEL_A')+"' "+ms.uiEvent(formId, 'ASSESS_LEVEL_A')+" title='"+ms.titleAttr(formId,'ASSESS_LEVEL_A','IS_TITLE_ATTR',v)+"' >"+v['ASSESS_LEVEL_A']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSESS_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'ASSESS_COUNT')+"' style='"+ms.tdStyle(formId, 'ASSESS_COUNT')+"' "+ms.tdEvent(formId, 'ASSESS_COUNT')+">")
            arrHtml.push("<span colno='ASSESS_COUNT' class='"+ms.uiClass(formId, 'ASSESS_COUNT')+"' style='"+ms.uiStyle(formId, 'ASSESS_COUNT')+"' "+ms.uiEvent(formId, 'ASSESS_COUNT')+" title='"+ms.titleAttr(formId,'ASSESS_COUNT','IS_TITLE_ATTR',v)+"' >"+v['ASSESS_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ASSESS_FILE' class='datagrid-cell "+ms.tdClass(formId, 'ASSESS_FILE')+"' style='"+ms.tdStyle(formId, 'ASSESS_FILE')+"' "+ms.tdEvent(formId, 'ASSESS_FILE')+">")
            arrHtml.push("<span colno='ASSESS_FILE' class='"+ms.uiClass(formId, 'ASSESS_FILE')+"' style='"+ms.uiStyle(formId, 'ASSESS_FILE')+"' "+ms.uiEvent(formId, 'ASSESS_FILE')+" title='"+ms.titleAttr(formId,'ASSESS_FILE','IS_TITLE_ATTR',v)+"' >"+v['ASSESS_FILE']+"</span>")
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


function getCount() {
    var url="${path}buss/bussModel_exeFunc.ms?funcMId=88ca65992ac341279714ad78550c8027";
    console.log('111');
   // var jsonData = {"rewardCode" : rewardCode};			
    //var rewardCount = "";
	$.ajax({
		type: "post",
		dataType: "json",
		url: url,
	//	data: jsondata,
		success: function(data) {	
		console.log("woshi")
		console.log(data);
           	//rewardCount = data.ajaxPage.dataList[0].rewardCount; 
        },
    	error: function(msg) {
			util.closeLoading();
			utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "", "");
		}
	})
//	return rewardCount;
}



</script>  -->
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
