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
		<dict:lang value="考核项目" />
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
		<bu:header formId ="144b88b89cbf4e988bdac5f3d1fea6f6"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

<style>
input {
    
//    border: 0px!important;
    //	outline:medium!important;
    //background-color:transparent!important;
}

</style>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="8148374d73844c5b98d85b5462d5e245" />
            </div>
            <div class="bd">
                <div class="search-box" style="display:none">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="8148374d73844c5b98d85b5462d5e245" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage144b88b89cbf4e988bdac5f3d1fea6f6" id="formPage144b88b89cbf4e988bdac5f3d1fea6f6" value="${formPage144b88b89cbf4e988bdac5f3d1fea6f6}"/>
		<input type="hidden" name="formId" id="formId1" value='144b88b89cbf4e988bdac5f3d1fea6f6'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="144b88b89cbf4e988bdac5f3d1fea6f6">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax144b88b89cbf4e988bdac5f3d1fea6f6" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner144b88b89cbf4e988bdac5f3d1fea6f6">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable144b88b89cbf4e988bdac5f3d1fea6f6">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="144b88b89cbf4e988bdac5f3d1fea6f6" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center">		<span><input type="checkbox" id="selectAll_144b88b89cbf4e988bdac5f3d1fea6f6" onclick="_selectAjaxTableAllData(this,'144b88b89cbf4e988bdac5f3d1fea6f6')" style="cursor: pointer;"title="全选"/></span>	</td>
			<td class="datagrid-cell"><bu:uitn colNo="ITEM_NAME" formId="144b88b89cbf4e988bdac5f3d1fea6f6" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ITEM_SCORE" formId="144b88b89cbf4e988bdac5f3d1fea6f6"  /></td>
			
			<td class="datagrid-cell"><bu:uitn colNo="GRAPE_DEPT_ID" id="MMZ_TD" formId="144b88b89cbf4e988bdac5f3d1fea6f6" style="font-size:0px" />
			

			</td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv144b88b89cbf4e988bdac5f3d1fea6f6" onscroll="ajaxTableScroll(this,'144b88b89cbf4e988bdac5f3d1fea6f6')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax144b88b89cbf4e988bdac5f3d1fea6f6">
		<tbody id="tbody_144b88b89cbf4e988bdac5f3d1fea6f6" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage144b88b89cbf4e988bdac5f3d1fea6f6==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=144b88b89cbf4e988bdac5f3d1fea6f6&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
    
     
           
     <!--*测试自增DIV-->
    <div class="edit">
    <div class="bd" style="height:150px;">
    	<div id="backItem" class="dialog-mask" style="z-index:1029px;opacity:0;"/></div>
		<div class="dialog dialog-s1 " id="addItem" style="display:none;z-index:1030;margin-left:0px;left:16px;top:10px;width:530px;height:300px;">
			<div class="dialog-hd" id="mmz_dialog-hd">
			<h3 class="tit" id="mmz_title">
			<dict:lang  value="新增" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" id="mmz_dialog-bd-div" style="width:100%;height:300Px;">
					<div class="optn optn_div" style="width:517px;height:158Px;">
			        <button type="button"  id="mmz_btn" onclick="mmz_add(this)"><i class="ico ico-save"></i><dict:lang  value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				  <div  class="dialog-bd-div" id="mmz_dialog-bd-div" style="width:518px;height:118Px;padding-top:10px">       
				 <table class="basic-table" style="margin-left:-70px;margin-top:15">
	                 <tr style="width:64.2px;">
			    		<td class="name" /><span class="dot">*</span><dict:lang value="项目名称"/></td>
					<td  class="dec" style="width:310px" ><input type="text" id="MMZ_ITEM_NAME" name="MMZ_ITEM_NAME" class=" input isSubmit isaddSubmit" style="width:300px" /></td>
			    	</tr>
	                 <tr >
			    		<td class="name" /><span class="dot">*</span><dict:lang value="最大分值"/></td>
					<td  class="dec" style="width:310px"><input type="text" id="MMZ_ITEM_SCORE" name="MMZ_ITEM_SCORE" class=" input isSubmit isaddSubmit" style="width:300px" /></td>
			    	</tr>
	                 <tr>
			    		<td   class="name"	/><span class="dot">*</span><dict:lang value="所属部门"/></td>
					  <td class="dec" style="width:310px" id="MMZ_ADD_TD"> 
					  <!--选择部门-->
					   </td>
			    	</tr>
			    </table>
			       </div>
			     </div>
            </div>
	</div>
	<div class="bd" style="height:500px;">
	</div>
	    </div>
	    </div>
    <!--新增结束-->
   
     
     
    
		<bu:submit viewId="8148374d73844c5b98d85b5462d5e245" />
     
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="8148374d73844c5b98d85b5462d5e245" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
<%--生成异步表格--%>
var check = true;
var check_item; 
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='144b88b89cbf4e988bdac5f3d1fea6f6'){<%--考核项目--%>
        $.each(uiTxt,function(i,v){
            if(check&&i==0){
                check_item=v['GRAPE_DEPT_ID'];
            }
            if(check&&v['GRAPE_DEPT_ID']==check_item){
            console.log("22222222");
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'ITEM_NAME')+"' "+ms.tdEvent(formId, 'ITEM_NAME')+">")
            arrHtml.push("<span colno='ITEM_NAME' class='"+ms.uiClass(formId, 'ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'ITEM_NAME')+"' "+ms.uiEvent(formId, 'ITEM_NAME')+" title='"+ms.titleAttr(formId,'ITEM_NAME','IS_TITLE_ATTR',v)+"'><input type='text' id='ITEM_NAME_"+v.ID+"' name='ITEM_NAME_"+v.ID+"' class=' input isSubmit isaddSubmit' style='width:300px;outline:medium;' value='"+v['ITEM_NAME']+"' /></span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_SCORE' class='datagrid-cell "+ms.tdClass(formId, 'ITEM_SCORE')+"' style='"+ms.tdStyle(formId, 'ITEM_SCORE')+"' "+ms.tdEvent(formId, 'ITEM_SCORE')+">")
            arrHtml.push("<span colno='ITEM_SCORE' class='"+ms.uiClass(formId, 'ITEM_SCORE')+"' style='"+ms.uiStyle(formId, 'ITEM_SCORE')+"' "+ms.uiEvent(formId, 'ITEM_SCORE')+" title='"+ms.titleAttr(formId,'ITEM_SCORE','IS_TITLE_ATTR',v)+"' ><input type='text' id='ITEM_SCORE_"+v.ID+"' name='ITEM_SCORE_"+v.ID+"' class=' input isSubmit isaddSubmit' style='outline:medium;width:300px' value='"+v['ITEM_SCORE']+"' /></span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='GRAPE_DEPT_ID' class='datagrid-cell "+ms.tdClass(formId, 'GRAPE_DEPT_ID')+"' style='"+ms.tdStyle(formId, 'GRAPE_DEPT_ID')+"' "+ms.tdEvent(formId, 'GRAPE_DEPT_ID')+">")
            arrHtml.push("<span colno='GRAPE_DEPT_ID' class='"+ms.uiClass(formId, 'GRAPE_DEPT_ID')+"' style='"+ms.uiStyle(formId, 'GRAPE_DEPT_ID')+"' "+ms.uiEvent(formId, 'GRAPE_DEPT_ID')+" title='"+ms.titleAttr(formId,'GRAPE_DEPT_ID','IS_TITLE_ATTR',v)+"' ><input type='text' id='GRAPE_DEPT_ID_"+v.ID+"' name='GRAPE_DEPT_ID_"+v.ID+"' class=' input isSubmit isaddSubmit' style='width:300px' value='"+v['GRAPE_DEPT_ID']+"' /></span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
            }else if(!check){
            console.log("11111111");
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'ITEM_NAME')+"' "+ms.tdEvent(formId, 'ITEM_NAME')+">")
            arrHtml.push("<span colno='ITEM_NAME' class='"+ms.uiClass(formId, 'ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'ITEM_NAME')+"' "+ms.uiEvent(formId, 'ITEM_NAME')+" title='"+ms.titleAttr(formId,'ITEM_NAME','IS_TITLE_ATTR',v)+"'><input type='text' id='ITEM_NAME_"+v.ID+"' name='ITEM_NAME_"+v.ID+"' class=' input isSubmit isaddSubmit' style='width:300px;outline:medium;' value='"+v['ITEM_NAME']+"' /></span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_SCORE' class='datagrid-cell "+ms.tdClass(formId, 'ITEM_SCORE')+"' style='"+ms.tdStyle(formId, 'ITEM_SCORE')+"' "+ms.tdEvent(formId, 'ITEM_SCORE')+">")
            arrHtml.push("<span colno='ITEM_SCORE' class='"+ms.uiClass(formId, 'ITEM_SCORE')+"' style='"+ms.uiStyle(formId, 'ITEM_SCORE')+"' "+ms.uiEvent(formId, 'ITEM_SCORE')+" title='"+ms.titleAttr(formId,'ITEM_SCORE','IS_TITLE_ATTR',v)+"' ><input type='text' id='ITEM_SCORE_"+v.ID+"' name='ITEM_SCORE_"+v.ID+"' class=' input isSubmit isaddSubmit' style='outline:medium;width:300px' value='"+v['ITEM_SCORE']+"' /></span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='GRAPE_DEPT_ID' class='datagrid-cell "+ms.tdClass(formId, 'GRAPE_DEPT_ID')+"' style='"+ms.tdStyle(formId, 'GRAPE_DEPT_ID')+"' "+ms.tdEvent(formId, 'GRAPE_DEPT_ID')+">")
            arrHtml.push("<span colno='GRAPE_DEPT_ID' class='"+ms.uiClass(formId, 'GRAPE_DEPT_ID')+"' style='"+ms.uiStyle(formId, 'GRAPE_DEPT_ID')+"' "+ms.uiEvent(formId, 'GRAPE_DEPT_ID')+" title='"+ms.titleAttr(formId,'GRAPE_DEPT_ID','IS_TITLE_ATTR',v)+"' ><input type='text' id='GRAPE_DEPT_ID_"+v.ID+"' name='GRAPE_DEPT_ID_"+v.ID+"' class=' input isSubmit isaddSubmit' style='width:300px' value='"+v['GRAPE_DEPT_ID']+"' /></span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
                
            }
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
     check = false;
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
 
 <script>
 
    $(function mmz_check(){
           $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=c6b60f6b908142febb9689564b6c1407",
            data:"",
            success: function(data){
              	$("#MMZ_TD").append('<select class="dept_select" id="mmz_select" style="font-size:15px;width:160px;opacity:0.5;" name="GRAPE_DEPT_ID" onchange="select_dept(this)"></select>');
                $("#MMZ_ADD_TD").append('<select class="dept_select" id="MMZ_DEPT_ID" style="font-size:15px;width:300px;opacity:0.5;" name="GRAPE_DEPT_ID" onchange="select_dept(this)"></select>');
              //$("#CPI_GRAPE_DEPT_ID").html("");class="null dept_select"  id="MMZ_DEPT_ID"  
                //$("#mmz_select").append('<option value=""> &nbsp&nbsp&nbsp&nbsp&nbsp --所属部门--</option>');
             //$("#CPI_GRAPE_DEPT_ID").append('<option value="">--所属部门--</option>');
             for(var i=0;i<data.ajaxPage.dataList.length;i++){
                $("#mmz_select").append('<option value="'+data.ajaxPage.dataList[i].ID+'">'+data.ajaxPage.dataList[i].NAME+'</option>');
                $("#MMZ_DEPT_ID").append('<option value="'+data.ajaxPage.dataList[i].ID+'">'+data.ajaxPage.dataList[i].NAME+'</option>');
            	}
            	//$("#mmz_select").attr("style","width:120px;");	
            },
            error: function(msg){
                console.log(msg);
            }
        });
    }
);		
var item_val;
function select_dept(obj){
    $("#GRAPE_DEPT_ID").val(obj.value);
    $(".search_table").attr("display","none");
    $("#MMZ_DEPT_ID").val(obj.value);
    $("#mmz_select").val(obj.value);
    query(obj);
}

     


//显示div增修窗口
function popItemDiv(showId,backId){
            $("#itemCode").val("");
		    $("#"+showId+",#"+backId).show();
			//$("#"+showId).popItemDiv();
			
		//	addItemInfo();
			
}
function hideDiv(showId,backId){
			$("#"+showId+",#"+backId).hide(); 
			closeDivFp(showId+"pop");
}


///添加
function v_add(){
  popItemDiv('addItem','backItem');
    
}


   //新增       
    function mmz_add(obj){//ID ITEM_SCORE=$("#MMZ_LEVEL_SCORE")  ITEM_NAME=$("#MMZ_LEVEL_NAME")  GRAPE_DEPT_ID = $("#MMZ_DEPT_ID").val()   
      
        var j = {};//MMZ_ITEM_SCORE  MMZ_ITEM_NAME  
        j.ID  = $("#MMZ_DEPT_ID").val();
        j.ITEM_SCORE = $("#MMZ_LEVEL_SCORE").val();
        j.ITEM_NAME = $("#MMZ_LEVEL_NAME").val();
    /*
        if(!checkScore(j.ITEM_SCORE,$("#MMZ_LEVEL_SCORE"))){
            return false;
        }
        
        if(!checkName(j.ITEM_NAME,$("#MMZ_LEVEL_NAME"))){
            return false;
        }
      */  
        j.model = "add"; 
        
           $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=f86ec031e2fd4271bea6ebde709bb77d",
            data:j,
            success: function(data){
 
        	 msgPop('保存成功',"",'提示',200,150,3000,5000);
             window.location.reload(true);           
            
            
            },
            error: function(msg){
               
               
                utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
        }		
 
 //删除
 


 //       
 //验证
function checkName(tempVal,obj){//  /^[0-9a-zA-Z\u4e00-\u9fa5_]{3,16}$/.test("add123百度true")
	if(!(/^[0-9a-zA-Z\u4e00-\u9fa5_]{2,16}$/.test( tempVal ))){
	obj =$("#MMZ_ITEM_NAME");
	//_alertValMsg(obj,"该项必须为小于100的正整数");
	_alertValMsg(obj,"输入2到16位合法字符");
		return false;  
	}
	return true; 
}
var max ="";
function checkScore(tempVal,obj){
	if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal <= 0|| tempVal>100){
	//	_alertValMsg(obj,"该项必须为正整数");
		return false;  
	}else if(max!=""){
	   if(tempVal>max)
	    _alertValMsg(obj,"超出当前最大限制:"+max);
	    return false;
	}
	return true; 
}


//div拖动
 $( "#addItem" ).draggable({ handle: '#mmz_dialog-hd'});

 </script>
 
 
 
