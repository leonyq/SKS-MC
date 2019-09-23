<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
		<dict:lang value="cs-yi-b10-zm" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="0" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="46a69fb9850f4b81909589215ac5053a"/>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="f2cc2a8cfbfa481c854a15cb874d18bd" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                       <input type="hidden" name="exeid" value="${exeid}" />
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                       <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="f2cc2a8cfbfa481c854a15cb874d18bd" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                   <input type="hidden" name="exeid" value="${exeid}" />
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage46a69fb9850f4b81909589215ac5053a" id="formPage46a69fb9850f4b81909589215ac5053a" value="${formPage46a69fb9850f4b81909589215ac5053a}"/>
		<input type="hidden" name="formId" id="formId1" value='46a69fb9850f4b81909589215ac5053a'/>
		<div class="datagrid-div6 tableContainer-ajax"  id="tableContainer46a69fb9850f4b81909589215ac5053a">
		<div class="datagrid-div5 leftTable-ajax" id="leftTable-ajax46a69fb9850f4b81909589215ac5053a">
		<div class="panel-ajax datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
		<div class="datagrid-div2 datagrid-div6 left-datagrid-view-ajax" id="left-datagrid-view-ajax46a69fb9850f4b81909589215ac5053a" style="">
		<div class="datagrid-header left-datagrid-header-ajax datagrid-div6">
		<div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 left-datagrid-htable-ajax" id="left-datagrid-htable46a69fb9850f4b81909589215ac5053a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row left-datagrid-title-ajax" id="left-datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center" ><bu:thSeq formId="46a69fb9850f4b81909589215ac5053a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_46a69fb9850f4b81909589215ac5053a" onclick="_selectAjaxTableAllData(this,'46a69fb9850f4b81909589215ac5053a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="NAME" formId="46a69fb9850f4b81909589215ac5053a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div4 left-datagrid-body-ajax datagrid-div6" id="leftTableDiv46a69fb9850f4b81909589215ac5053a" >
		<table class="datagrid-btable fixedTable "  id="left-datagrid-btable-ajax46a69fb9850f4b81909589215ac5053a">
			<tbody id="left-tbody_46a69fb9850f4b81909589215ac5053a" class="isParents">
			</tbody>		</table>		</div>
		</div>
		</div>
		</div>
		<div class="datagrid-div7 contentTable"  id="contentTable46a69fb9850f4b81909589215ac5053a">
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='838ca5844aa648d193678e96bd870742,8c6a9b933e49400aaf2134d7ba44cbc3'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='677346fc6b47486ba7a9164f03017738,612afe7157ae46479b87fdd32cb77485'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax46a69fb9850f4b81909589215ac5053a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable46a69fb9850f4b81909589215ac5053a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell"><bu:uitn colNo="SEX" formId="46a69fb9850f4b81909589215ac5053a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="QQ" formId="46a69fb9850f4b81909589215ac5053a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="AGE" formId="46a69fb9850f4b81909589215ac5053a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv46a69fb9850f4b81909589215ac5053a" onscroll="ajaxTableScroll(this,'46a69fb9850f4b81909589215ac5053a')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax46a69fb9850f4b81909589215ac5053a">
		<tbody id="tbody_46a69fb9850f4b81909589215ac5053a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		</div>
		</div>
		<c:if test="${formPage46a69fb9850f4b81909589215ac5053a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=46a69fb9850f4b81909589215ac5053a&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPage677346fc6b47486ba7a9164f03017738" id="formPage677346fc6b47486ba7a9164f03017738" value="${formPage677346fc6b47486ba7a9164f03017738}"/>
		<input type="hidden" name="formId" id="formId2" value='677346fc6b47486ba7a9164f03017738'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="677346fc6b47486ba7a9164f03017738">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax677346fc6b47486ba7a9164f03017738" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable677346fc6b47486ba7a9164f03017738">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="677346fc6b47486ba7a9164f03017738" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_677346fc6b47486ba7a9164f03017738" onclick="_selectAjaxTableAllData(this,'677346fc6b47486ba7a9164f03017738')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="B" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="C" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="D" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="E" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PID" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="A" formId="677346fc6b47486ba7a9164f03017738" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv677346fc6b47486ba7a9164f03017738" onscroll="ajaxTableScroll(this,'677346fc6b47486ba7a9164f03017738')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax677346fc6b47486ba7a9164f03017738">
		<tbody id="tbody_677346fc6b47486ba7a9164f03017738" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage677346fc6b47486ba7a9164f03017738==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=677346fc6b47486ba7a9164f03017738&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="formPage612afe7157ae46479b87fdd32cb77485" id="formPage612afe7157ae46479b87fdd32cb77485" value="${formPage612afe7157ae46479b87fdd32cb77485}"/>
		<input type="hidden" name="formId" id="formId3" value='612afe7157ae46479b87fdd32cb77485'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="612afe7157ae46479b87fdd32cb77485">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax612afe7157ae46479b87fdd32cb77485" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable612afe7157ae46479b87fdd32cb77485">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="612afe7157ae46479b87fdd32cb77485" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_612afe7157ae46479b87fdd32cb77485" onclick="_selectAjaxTableAllData(this,'612afe7157ae46479b87fdd32cb77485')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="PID" formId="612afe7157ae46479b87fdd32cb77485" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="NAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TYPENAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TESTNAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv612afe7157ae46479b87fdd32cb77485" onscroll="ajaxTableScroll(this,'612afe7157ae46479b87fdd32cb77485')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax612afe7157ae46479b87fdd32cb77485">
		<tbody id="tbody_612afe7157ae46479b87fdd32cb77485" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage612afe7157ae46479b87fdd32cb77485==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=612afe7157ae46479b87fdd32cb77485&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" id="relColVals" name="relColVals" value='ID,ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='3' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="f2cc2a8cfbfa481c854a15cb874d18bd" />
		<bu:script viewId="f2cc2a8cfbfa481c854a15cb874d18bd" />
    <script type="text/javascript">
    /**
 * 取样式表、属性、事件对象
 * by:hxh;
 * date:2017-05-17
 * ***/
function MSdata(paraJson){
	var pJson = paraJson;
	console.log(paraJson);
	//如果是json字符串，则转成json对象
	if(typeof paraJson == "string"){
		pJson = $.parseJSON(paraJson);
	}
	/**
	 * 获取分页信息
	 * 参数：表单ID
	 * 返回分页对象
	 ***/
	this.page = function(formId){
		return pJson[formId].page;
	}
/*********************tr begin**********************************************/	
	/**
	 * 获取Tr样式
	 * 参数：表单ID
	 * 返回样式字符串
	 ***/
	this.trClass = function(formId){
		return pJson[formId].tr.cssClass;
	}
	
	/**
	 * 获取Tr属性
	 * 参数：表单ID
	 * 返回属性字符串
	 ***/
	this.trStyle = function(formId){
		return pJson[formId].tr.style;
	}	
	
	/**
	 * 获取Tr事件
	 * 参数：表单ID
	 * 返回事件字符串
	 ***/
	this.trEvent = function(formId){
		return pJson[formId].tr.event;
	}
/*****************tr end***********************ui begin**************************************/	
	/**
	 * 获取ui事件
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.uiEvent = function(formId,fieldNo){
		var formJson = pJson[formId];
		return pJson[formId].ui[fieldNo].event;
	}
	
	/**
	 * 获取ui样式表
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.uiClass = function(formId,fieldNo){
		var formJson = pJson[formId];
		return pJson[formId].ui[fieldNo].cssClass;
	}
	
	/**
	 * 获取ui属性
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.uiStyle = function(formId,fieldNo){
		var formJson = pJson[formId];
		return pJson[formId].ui[fieldNo].style;
	}
	
	/*****************ui end***********************td begin**************************************/		
	/**
	 * 获取td事件
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.tdEvent = function(formId,fieldNo){
		var formJson = pJson[formId];
		return pJson[formId].td[fieldNo].event;
	}
	
	/**
	 * 获取td样式表
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.tdClass = function(formId,fieldNo){
		var formJson = pJson[formId];
		return pJson[formId].td[fieldNo].cssClass;
	}
	
	/**
	 * 获取td属性
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.tdStyle = function(formId,fieldNo){
		var formJson = pJson[formId];
		return pJson[formId].td[fieldNo].style;
	}
	
	/*****************td end***********************title begin**************************************/
	/**
	 * 获取title属性(当有传字段时，返回该字段名称，当传入的字段为空时，返回所有字段名称集)
	 * 参数：表单ID，字段(可传空)
	 * 返回单个title中文名或所有title json串
	 ***/
	this.title = function(formId,fieldNo){
		var formJson = pJson[formId];
		//return pJson[formId].td[fieldNo].style;
		if(fieldNo == null || fieldNo == ""){
			return pJson[formId].title;
		}else{
			return pJson[formId].title[fieldNo];
		}
	}
	/*****************title end*********************** formAttr begin**************************************/
	/**
	 * 获取表单属性（当属性名称不为空时，字段必填）
	 * 参数：表单ID，字段(可传空)，属性名称(可传空)
	 * 返回某个特定字段的属性值，或某个特定字段的所有属性，或所有字段的所有属性
	 ***/
	this.formAttr = function(formId,fieldNo,attrName){
		var formJson = pJson[formId];
		//return pJson[formId].td[fieldNo].style;
		//当字段和属性名为空时，返回所有字段的所有属性
		if((fieldNo == null || fieldNo == "") && (attrName == null || attrName == "")){
			return pJson[formId].formAttr;
		}else if((fieldNo != null && fieldNo != "") && (attrName == null || attrName == "")){
			//当字段名不为空，属性名为空时，获取该字段所有属性
			return pJson[formId].formAttr[fieldNo];
		}else if((fieldNo == null || fieldNo == "") && (attrName != null && attrName != "")){
			//当字段为空且属性不为空，返回空
			return "";
		}else{
			//返回某个字段的某个属性
			return pJson[formId].formAttr[fieldNo][attrName];
		}
	}
	/*****************formAttr end*************************uiTxt begin************************************/
	/**
	 * 获取列表内容
	 * 参数：表单ID
	 * 返回列表对象
	 ***/
	this.uiTxt = function(formId){
		var formJson = pJson[formId];
		//返回某个字段的某个属性
		return pJson[formId].data.uiTxt;
	 }
	
	/*****************uiTxt end***********************userDefined begin**************************************/
	/**
	 * 获取用户自定义属性内容
	 * 参数：表单ID，自定义名称
	 * 返回
	 ***/
	this.userDefined = function(formId,definedName){
		var formJson = pJson[formId];
		//返回用户自定义的属性
		return pJson[formId][definedName];
	 }	
	/*****************userDefined end*************************************************************/		
}
/*var dj = "{\"e7f5bbc2329c46be837ce886e0536227\":{\"ui\":\"aaaa\",\"haha\":\"heihei\"}}";//"{\"e7f5bbc2329c46be837ce886e0536227\":\"aaa\"}";
console.log(MSdata.userDefined("e7f5bbc2329c46be837ce886e0536227","haha", dj));*/
/*$.ajax({
	type: "POST",
    dataType: "json",
    url: "/mes/buss/bussModel.ms?exeid=1fab3da4ee42455697f9d96ac3823c54",
    //data: "paraMap.sql="+val2,//+upColId,
	success: function(data){
			//console.log(data);
			console.log(MSdata.uiTxt("e7f5bbc2329c46be837ce886e0536227", data));
		},
	error: function(msg){
			util.closeLoading();
			util.alert("error:"+msg);
	  }
	});	*/
   
    function aaa(){
     var MSdata = new MSdata({"ss":111});
      console.log(MSdata);
    }
    aaa();
    // 主列表
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms";
        if(isPage(formId)){
            var isFirstLoad = firstLoadThisPage(formId);
            var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
            var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        //util.showLoading("处理中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:$("#searchForm").serialize()+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
            success: function(data){
                if(data.RES){
                console.log(data);
                    var ms = new MSdata(data);
                   
                    var page = ms.page(formId);
                    createTableModel(ms,formId);
                    if(currentPage>20){
                        setTableHeight(formId);
                    }
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
    
    function isPage(formId){
        var isPageVal =  $("#formPage"+formId).val();
        if(isPageVal =="1"){    
           return true;
        }
        return false;
    }
    function query(thisObj){
        var formId = $("#formId1").val();
        listAjaxTable(formId);
    }
    
    // 清空表格
    function clearChildTable(){
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }
    
    function setTableHeight(){
        $(".datagrid-htable").css("width",$(".datagrid-header").width()-20+'px');
        $(".datagrid-btable").css("width",$(".datagrid-header").width()-20+'px');
    }
    
    function alertInfo(msg){
        utilsFp.alert(msg);
    }
    
    // 清空全选
    function clearAllSelect(){
    	$(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
    }
    
    function reloadPg(msg,title,width,height,time){
        msgPop(msg,"",title,width,height,time);
    }
    
    // 子列表
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
    
    // 初始化子分页
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
    
    
    // 初始化分页插件
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
    
    // 判断是否首次异步访问
    function firstLoadThisPage(formId){
        if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
            return true;
        }
        return false;
    }
    
    // 初始化子表单
    function getFormIdInitChildPage(){
        var tableCount = $("#tableCount").val();
        for ( var i = 2; i <= tableCount; i++) {
            var formId = $("#formId"+i).val();
            if(isPage(formId)){
               initChildPage(formId);
            }
        }
    }
    
    function init(){
        if($(".leftTable-ajax").length>0){
            $(".leftTable-ajax").show();
        };
        getFormIdInitChildPage();
        listAjaxTable($("#formId1").val());
        <s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
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
//生成异步表格
function createTableModel(MSdata,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = MSdata.uiTxt(formId)==null?[]:MSdata.uiTxt(formId);
    var trClass = MSdata.trClass(formId);
    var trStyle = MSdata.trStyle(formId);
    var trEvent = MSdata.trEvent(formId);
    if(formId=='46a69fb9850f4b81909589215ac5053a'){<%--测试异步--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            if($("#"+formId).find(".left-datagrid-title-ajax").length>0){
                arrLeftHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrLeftHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrLeftHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrLeftHtml.push("</td>");
            }else{
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
            }
                arrLeftHtml.push("<td colno='NAME' class='datagrid-cell "+MSdata.tdClass(formId, 'NAME')+"' style='"+MSdata.tdStyle(formId, 'NAME')+"' "+MSdata.tdEvent(formId, 'NAME')+">")
                arrLeftHtml.push("<span colno='NAME' class='"+MSdata.uiClass(formId, 'NAME')+"' style='"+MSdata.uiStyle(formId, 'NAME')+"' "+MSdata.uiEvent(formId, 'NAME')+" >"+v['NAME']+"</span>")
                arrLeftHtml.push("</td>");
                arrHtml.push("<td colno='SEX' class='datagrid-cell "+MSdata.tdClass(formId, 'SEX')+"' style='"+MSdata.tdStyle(formId, 'SEX')+"' "+MSdata.tdEvent(formId, 'SEX')+">")
                arrHtml.push("<span colno='SEX' class='"+MSdata.uiClass(formId, 'SEX')+"' style='"+MSdata.uiStyle(formId, 'SEX')+"' "+MSdata.uiEvent(formId, 'SEX')+" >"+v['SEX']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='QQ' class='datagrid-cell "+MSdata.tdClass(formId, 'QQ')+"' style='"+MSdata.tdStyle(formId, 'QQ')+"' "+MSdata.tdEvent(formId, 'QQ')+">")
                arrHtml.push("<span colno='QQ' class='"+MSdata.uiClass(formId, 'QQ')+"' style='"+MSdata.uiStyle(formId, 'QQ')+"' "+MSdata.uiEvent(formId, 'QQ')+" >"+v['QQ']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='AGE' class='datagrid-cell "+MSdata.tdClass(formId, 'AGE')+"' style='"+MSdata.tdStyle(formId, 'AGE')+"' "+MSdata.tdEvent(formId, 'AGE')+">")
                arrHtml.push("<span colno='AGE' class='"+MSdata.uiClass(formId, 'AGE')+"' style='"+MSdata.uiStyle(formId, 'AGE')+"' "+MSdata.uiEvent(formId, 'AGE')+" >"+v['AGE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='612afe7157ae46479b87fdd32cb77485'){<%--子表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            if($("#"+formId).find(".left-datagrid-title-ajax").length>0){
                arrLeftHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrLeftHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrLeftHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrLeftHtml.push("</td>");
            }else{
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
            }
                arrHtml.push("<td colno='PID' class='datagrid-cell "+MSdata.tdClass(formId, 'PID')+"' style='"+MSdata.tdStyle(formId, 'PID')+"' "+MSdata.tdEvent(formId, 'PID')+">")
                arrHtml.push("<span colno='PID' class='"+MSdata.uiClass(formId, 'PID')+"' style='"+MSdata.uiStyle(formId, 'PID')+"' "+MSdata.uiEvent(formId, 'PID')+" >"+v['PID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='NAME' class='datagrid-cell "+MSdata.tdClass(formId, 'NAME')+"' style='"+MSdata.tdStyle(formId, 'NAME')+"' "+MSdata.tdEvent(formId, 'NAME')+">")
                arrHtml.push("<span colno='NAME' class='"+MSdata.uiClass(formId, 'NAME')+"' style='"+MSdata.uiStyle(formId, 'NAME')+"' "+MSdata.uiEvent(formId, 'NAME')+" >"+v['NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TYPENAME' class='datagrid-cell "+MSdata.tdClass(formId, 'TYPENAME')+"' style='"+MSdata.tdStyle(formId, 'TYPENAME')+"' "+MSdata.tdEvent(formId, 'TYPENAME')+">")
                arrHtml.push("<span colno='TYPENAME' class='"+MSdata.uiClass(formId, 'TYPENAME')+"' style='"+MSdata.uiStyle(formId, 'TYPENAME')+"' "+MSdata.uiEvent(formId, 'TYPENAME')+" >"+v['TYPENAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TESTNAME' class='datagrid-cell "+MSdata.tdClass(formId, 'TESTNAME')+"' style='"+MSdata.tdStyle(formId, 'TESTNAME')+"' "+MSdata.tdEvent(formId, 'TESTNAME')+">")
                arrHtml.push("<span colno='TESTNAME' class='"+MSdata.uiClass(formId, 'TESTNAME')+"' style='"+MSdata.uiStyle(formId, 'TESTNAME')+"' "+MSdata.uiEvent(formId, 'TESTNAME')+" >"+v['TESTNAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='677346fc6b47486ba7a9164f03017738'){<%--子表2--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            if($("#"+formId).find(".left-datagrid-title-ajax").length>0){
                arrLeftHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrLeftHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrLeftHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrLeftHtml.push("</td>");
            }else{
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
            }
                arrHtml.push("<td colno='B' class='datagrid-cell "+MSdata.tdClass(formId, 'B')+"' style='"+MSdata.tdStyle(formId, 'B')+"' "+MSdata.tdEvent(formId, 'B')+">")
                arrHtml.push("<span colno='B' class='"+MSdata.uiClass(formId, 'B')+"' style='"+MSdata.uiStyle(formId, 'B')+"' "+MSdata.uiEvent(formId, 'B')+" >"+v['B']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='C' class='datagrid-cell "+MSdata.tdClass(formId, 'C')+"' style='"+MSdata.tdStyle(formId, 'C')+"' "+MSdata.tdEvent(formId, 'C')+">")
                arrHtml.push("<span colno='C' class='"+MSdata.uiClass(formId, 'C')+"' style='"+MSdata.uiStyle(formId, 'C')+"' "+MSdata.uiEvent(formId, 'C')+" >"+v['C']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='D' class='datagrid-cell "+MSdata.tdClass(formId, 'D')+"' style='"+MSdata.tdStyle(formId, 'D')+"' "+MSdata.tdEvent(formId, 'D')+">")
                arrHtml.push("<span colno='D' class='"+MSdata.uiClass(formId, 'D')+"' style='"+MSdata.uiStyle(formId, 'D')+"' "+MSdata.uiEvent(formId, 'D')+" >"+v['D']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='E' class='datagrid-cell "+MSdata.tdClass(formId, 'E')+"' style='"+MSdata.tdStyle(formId, 'E')+"' "+MSdata.tdEvent(formId, 'E')+">")
                arrHtml.push("<span colno='E' class='"+MSdata.uiClass(formId, 'E')+"' style='"+MSdata.uiStyle(formId, 'E')+"' "+MSdata.uiEvent(formId, 'E')+" >"+v['E']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PID' class='datagrid-cell "+MSdata.tdClass(formId, 'PID')+"' style='"+MSdata.tdStyle(formId, 'PID')+"' "+MSdata.tdEvent(formId, 'PID')+">")
                arrHtml.push("<span colno='PID' class='"+MSdata.uiClass(formId, 'PID')+"' style='"+MSdata.uiStyle(formId, 'PID')+"' "+MSdata.uiEvent(formId, 'PID')+" >"+v['PID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='A' class='datagrid-cell "+MSdata.tdClass(formId, 'A')+"' style='"+MSdata.tdStyle(formId, 'A')+"' "+MSdata.tdEvent(formId, 'A')+">")
                arrHtml.push("<span colno='A' class='"+MSdata.uiClass(formId, 'A')+"' style='"+MSdata.uiStyle(formId, 'A')+"' "+MSdata.uiEvent(formId, 'A')+" >"+v['A']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
