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
		<dict:lang value="葡萄图等级配置" />
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
	<bu:header formId ="53e8ef46c6cd4a2f96cbd7d6caa9ff54"/>
	<!--额外加的-->
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>


     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
	
		
  
	
	
    <!-- 产品静态资源 -->
 <!-- 添加颜色编辑器 js 和 css-->
    <script type = "text/javascript" src = "${path}plf/js/spectrum/spectrum.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <link rel=stylesheet type=text/css
		href="${path}plf/js/spectrum/spectrum.css" />
  	<!-- 自定义颜色编辑器样式 -->
    <style type="text/css">
    .deptcss {
    text-align: left!important;

}
    .sp-preview {
    position:relative;
    width:15px;
     height: 15px;
    border: solid 0px #222;
	border-radius: 50%;
   -moz-border-radius: 50%; 
   -webkit-border-radius: 50%;
    margin-right: 5px;
    float:left;
    z-index: 0;
    }
 
.sp-preview-inner{
	display:block;
    position:absolute;
    top:0;left:0;bottom:0;right:0;
    width:15px;
    height: 15px;
	border: solid 1px #a1a1a1;
	border-radius: 50%;
   -moz-border-radius: 50%; 
   -webkit-border-radius: 50%;
    margin-right: 5px;
    float:left;
    z-index: 0;

}

.sp-replacer {
    margin:0;
    overflow:hidden;
    cursor:pointer;
    padding: 4px;
    display:inline-block;
    *zoom: 1;
    *display: inline;
    border: solid 1px #91765d;
    background: #eee;
    color: #333;
    vertical-align: middle;
}
.sp-replacer:hover, .sp-replacer.sp-active {
    border-color: #F0C49B;
    color: #111;
}

  </style>



<style type="text/css">
 
 /*设计同心圆*/ 
.circle{ 
   width: 100%;     
   height: 100%; 
   margin: 1px ;
   background-color:write;   
   border-radius: 50%;
   -moz-border-radius: 50%; 
   -webkit-border-radius: 50%;
   }
    .circle-line{
	width: 17px;     
   height: 17px; 
   /* padding: 1px;
    border: solid 1px #a1a1a1; */   
   border-radius: 50%;
   -moz-border-radius: 50%; 
   -webkit-border-radius: 50%;

 }
 .mmz_color{
    text-align:center!important;
     
 }
 
 </style>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="75c829bea1554bffadbd91983697619a" />
            </div>
            <div class="bd" style="height:480px;">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="75c829bea1554bffadbd91983697619a" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage53e8ef46c6cd4a2f96cbd7d6caa9ff54" id="formPage53e8ef46c6cd4a2f96cbd7d6caa9ff54" value="${formPage53e8ef46c6cd4a2f96cbd7d6caa9ff54}"/>
		<input type="hidden" name="formId" id="formId1" value='53e8ef46c6cd4a2f96cbd7d6caa9ff54'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="53e8ef46c6cd4a2f96cbd7d6caa9ff54">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax53e8ef46c6cd4a2f96cbd7d6caa9ff54" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner53e8ef46c6cd4a2f96cbd7d6caa9ff54">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable53e8ef46c6cd4a2f96cbd7d6caa9ff54">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_53e8ef46c6cd4a2f96cbd7d6caa9ff54" onclick="_selectAjaxTableAllData(this,'53e8ef46c6cd4a2f96cbd7d6caa9ff54')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="LEVEL_CODE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="LEVEL_SCORE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="LEVEL_COLOR" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv53e8ef46c6cd4a2f96cbd7d6caa9ff54" onscroll="ajaxTableScroll(this,'53e8ef46c6cd4a2f96cbd7d6caa9ff54')">
		<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax53e8ef46c6cd4a2f96cbd7d6caa9ff54">
		<tbody id="tbody_53e8ef46c6cd4a2f96cbd7d6caa9ff54" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage53e8ef46c6cd4a2f96cbd7d6caa9ff54==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=53e8ef46c6cd4a2f96cbd7d6caa9ff54&showLoading=0" />
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
    	<div id="backItem" class="dialog-mask" style="z-index:11111;"/></div>
		<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:11111;margin-left:0px;left:16px;top:10px;width:530px;height:168px;">
			<div class="dialog-hd" id="mmz_dialog-hd">
			<h3 class="tit" id="mmz_title">
			<dict:lang  value="新增" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" id="mmz_dialog-bd-div" style="width:100%;height:130Px;">
					<div class="optn optn_div hd">
					      <div style="margin-left:10px;">
               
                  <div class="save-close" id="savelose"  onclick="saveClose(this)"></div>	
                <input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                  <div style="float:left" class="deptcss"><span class="dot">*</span><dict:lang value="组织机构"/> 
                  <select disabled class="dept_select IS_SELECT_FILTER" id="addfuncauth" ><option>--请选择--</option></select>
                  </div>	

                   	
          
                </div>
			        <button type="button"  id="mmz_btn"><i class="ico ico-save"></i><dict:lang  value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				         </div>
				      
				<table class="basic-table">
				    <tr style="display:none">
	        		    <td class="name-three" style="width:64.2px;"/><bu:uitn colNo="LEVEL_SCORE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
			            <bu:td cssClass="dec-self" colNo="LEVEL_SCORE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" ><bu:ui colNo="LEVEL_SCORE"   formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" value="%{LEVEL_SCORE}" formIndex="1" style="width:300px" /></bu:td><!-- <button type="button" onclick="check(this);">确认</button>-->
	                </tr>
	                 <tr >
			    		<td class="name" style="width:64.2px;"/><span class="dot">*</span><dict:lang value="分数"/></td>
					<td class="dec"><input type="text" id="MMZ_LEVEL_SCORE" name="MMZ_LEVEL_SCORE" class=" input isSubmit isaddSubmit" style="width:300px" /></td>
			    	</tr>
		             <tr>
			    		<td class="name" /><dict:lang value="颜色"/></td>
					<td class="dec"><input type="text"  style ="display:none" id="MMZ_LEVEL_COLOR" name="MMZ_LEVEL_COLOR" class=" input isSubmit isaddSubmit"/>
						<!-- 添加颜色编辑器 -->
						<input id="full" style="height:10px;width:10px">
					</td>
			    	</tr>
			    </table>
			   
            </div>
	</div>
	<div class="bd" style="height:500px;">
	</div>
	    </div>
	    </div>
    <!--新增结束-->
		<bu:submit viewId="75c829bea1554bffadbd91983697619a" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="75c829bea1554bffadbd91983697619a" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
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
    if(formId=='53e8ef46c6cd4a2f96cbd7d6caa9ff54'){<%--葡萄图等级--%>
      
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr  class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><div onclick='alert()'><span class='_noedit' >");
            arrHtml.push("<input type='checkbox' ; name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'> </div>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px; text-align:center"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='LEVEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'LEVEL_CODE')+"' style='width:120px; text-align:center"+ms.tdStyle(formId, 'LEVEL_CODE')+"' "+ms.tdEvent(formId, 'LEVEL_CODE')+">")
            arrHtml.push("<span colno='LEVEL_CODE' class='"+ms.uiClass(formId, 'LEVEL_CODE')+"' style='"+ms.uiStyle(formId, 'LEVEL_CODE')+"' "+ms.uiEvent(formId, 'LEVEL_CODE')+" title='"+ms.titleAttr(formId,'LEVEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['LEVEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LEVEL_SCORE' class='datagrid-cell "+ms.tdClass(formId, 'LEVEL_SCORE')+"' style='width:120px; text-align:center"+ms.tdStyle(formId, 'LEVEL_SCORE')+"' "+ms.tdEvent(formId, 'LEVEL_SCORE')+">")
            arrHtml.push("<span colno='LEVEL_SCORE' class='"+ms.uiClass(formId, 'LEVEL_SCORE')+"' style='"+ms.uiStyle(formId, 'LEVEL_SCORE')+"' "+ms.uiEvent(formId, 'LEVEL_SCORE')+" title='"+ms.titleAttr(formId,'LEVEL_SCORE','IS_TITLE_ATTR',v)+"' >"+v['LEVEL_SCORE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LEVEL_COLOR' class='datagrid-cell "+ms.tdClass(formId, 'LEVEL_COLOR')+"' style='width:120px; text-align:center"+ms.tdStyle(formId, 'LEVEL_COLOR')+"' "+ms.tdEvent(formId, 'LEVEL_COLOR')+">")
            arrHtml.push("<span colno='LEVEL_COLOR' class='"+ms.uiClass(formId, 'LEVEL_COLOR')+"' style='"+ms.uiStyle(formId, 'LEVEL_COLOR')+"' "+ms.uiEvent(formId, 'LEVEL_COLOR')+" title='"+ms.titleAttr(formId,'LEVEL_COLOR','IS_TITLE_ATTR',v)+"' >123<div style='width:10px;height:10px;background-color:"+v['LEVEL_COLOR']+"'></div>"+v['LEVEL_COLOR']+"</span>")
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




/*

 $("tr").each(function(i,obj){
        	    console.log(i);
        	     $(obj).click(function(){
        	         console.log(1);
        	         this.checked=true;
        	     });
        	 });*/









    //配置颜色选择器 	
        function updateBorders(color) {
            var hexColor = "transparent";
            if(color) {
                hexColor = color.toHexString();
            }
            $("#docs-content").css("border-color", hexColor);

		}
		var grape_color = '#000000';
	 	var slo;		
        var a =$("#mmz_dialog-bd-div");
        
		   function slower(){
              a.css({
                 height: function(index, value) {
                 if(parseFloat(value)<136){
                    self.clearInterval(slo);
                }
                    return parseFloat(value)-9;
              }

            });
             
        };

	        
    //初始化 LEVEL_COLOR 默认颜色
    $("#paraMap1_LEVEL_COLOR").val(grape_color);
        $("#full").spectrum({
            allowEmpty:true,
            color: grape_color, //默认颜色
            showInput: true,
            containerClassName: "full-spectrum",
            showInitial: true,
            showPalette: true,
            showSelectionPalette: true,
            //showAlpha: true, 透明度条
            maxPaletteSize: 10,
            preferredFormat: "hex",
            localStorageKey: true,
            hideAfterPaletteSelect: false,
            move: function (color) {
                updateBorders(color);
            },
            show: function () {

            },
            change: function(color){
          //  $(".circle").css("background-color",color.toHexString());
				grape_color = color.toHexString();    
            },
            beforeShow: function () {
                    var a =$("#mmz_dialog-bd-div");
                	a.css("height","348"); 
                	
	
            },
            hide: function (color) {
                updateBorders(color);
				grape_color = color.toHexString();
				$("#paraMap1_LEVEL_COLOR").val(grape_color);
           slo = self.setInterval("slower()",1);     	
            },
            palette: [
                ["rgb(0, 0, 0)", "rgb(67, 67, 67)", "rgb(102, 102, 102)", /*"rgb(153, 153, 153)","rgb(183, 183, 183)",*/
                "rgb(204, 204, 204)", "rgb(217, 217, 217)", /*"rgb(239, 239, 239)", "rgb(243, 243, 243)",*/ "rgb(255, 255, 255)"],
                ["rgb(152, 0, 0)", "rgb(255, 0, 0)", "rgb(255, 153, 0)", "rgb(255, 255, 0)", "rgb(0, 255, 0)",
                "rgb(0, 255, 255)", "rgb(74, 134, 232)", "rgb(0, 0, 255)", "rgb(153, 0, 255)", "rgb(255, 0, 255)"],
                ["rgb(230, 184, 175)", "rgb(244, 204, 204)", "rgb(252, 229, 205)", "rgb(255, 242, 204)", "rgb(217, 234, 211)",
                "rgb(208, 224, 227)", "rgb(201, 218, 248)", "rgb(207, 226, 243)", "rgb(217, 210, 233)", "rgb(234, 209, 220)",
                "rgb(221, 126, 107)", "rgb(234, 153, 153)", "rgb(249, 203, 156)", "rgb(255, 229, 153)", "rgb(182, 215, 168)",
                "rgb(162, 196, 201)", "rgb(164, 194, 244)", "rgb(159, 197, 232)", "rgb(180, 167, 214)", "rgb(213, 166, 189)",
                "rgb(204, 65, 37)", "rgb(224, 102, 102)", "rgb(246, 178, 107)", "rgb(255, 217, 102)", "rgb(147, 196, 125)",
                "rgb(118, 165, 175)", "rgb(109, 158, 235)", "rgb(111, 168, 220)", "rgb(142, 124, 195)", "rgb(194, 123, 160)",
                "rgb(166, 28, 0)", "rgb(204, 0, 0)", "rgb(230, 145, 56)", "rgb(241, 194, 50)", "rgb(106, 168, 79)",
                "rgb(69, 129, 142)", "rgb(60, 120, 216)", "rgb(61, 133, 198)", "rgb(103, 78, 167)", "rgb(166, 77, 121)",
                /*"rgb(133, 32, 12)", "rgb(153, 0, 0)", "rgb(180, 95, 6)", "rgb(191, 144, 0)", "rgb(56, 118, 29)",
                "rgb(19, 79, 92)", "rgb(17, 85, 204)", "rgb(11, 83, 148)", "rgb(53, 28, 117)", "rgb(116, 27, 71)",*/
                "rgb(91, 15, 0)", "rgb(102, 0, 0)", "rgb(120, 63, 4)", "rgb(127, 96, 0)", "rgb(39, 78, 19)",
                "rgb(12, 52, 61)", "rgb(28, 69, 135)", "rgb(7, 55, 99)", "rgb(32, 18, 77)", "rgb(76, 17, 48)"]
            ]
        });

var  mmz_dososo = false;//是否触发刷新判断

<%--生成异步表格--%>
function createTableModel(ms,formId){

    if(mmz_dososo){
     update();
        //ms = null;
       window.location.reload(true); 
      //parent.iframe4.location.reload(true);
        
     //document.execCommand('Refresh') ;
        
    }
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='53e8ef46c6cd4a2f96cbd7d6caa9ff54'){<%--葡萄图等级--%>
        console.log(uiTxt);
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input  type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px; text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='LEVEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'LEVEL_CODE')+"' style='width:120px; text-align:center;"+ms.tdStyle(formId, 'LEVEL_CODE')+"' "+ms.tdEvent(formId, 'LEVEL_CODE')+">")
            arrHtml.push("<span colno='LEVEL_CODE' class='"+ms.uiClass(formId, 'LEVEL_CODE')+"' style='"+ms.uiStyle(formId, 'LEVEL_CODE')+"' "+ms.uiEvent(formId, 'LEVEL_CODE')+" title='"+ms.titleAttr(formId,'LEVEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['LEVEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LEVEL_SCORE' class='datagrid-cell "+ms.tdClass(formId, 'LEVEL_SCORE')+"' style='width:120px; text-align:center;"+ms.tdStyle(formId, 'LEVEL_SCORE')+"' "+ms.tdEvent(formId, 'LEVEL_SCORE')+">")
            arrHtml.push("<span colno='LEVEL_SCORE' class='"+ms.uiClass(formId, 'LEVEL_SCORE')+"' style='text-align:center;"+ms.uiStyle(formId, 'LEVEL_SCORE')+"' "+ms.uiEvent(formId, 'LEVEL_SCORE')+" title='"+ms.titleAttr(formId,'LEVEL_SCORE','IS_TITLE_ATTR',v)+"' >"+v['LEVEL_SCORE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LEVEL_COLOR' class='datagrid-cell mmz_color"+ms.tdClass(formId, 'LEVEL_COLOR')+"' style='width:120px; text-align:center;"+ms.tdStyle(formId, 'LEVEL_COLOR')+"'  "+ms.tdEvent(formId, 'LEVEL_COLOR')+">")
            arrHtml.push("<span colno='LEVEL_COLOR' class='"+ms.uiClass(formId, 'LEVEL_COLOR')+"' style='"+ms.uiStyle(formId, 'LEVEL_COLOR')+"' "+ms.uiEvent(formId, 'LEVEL_COLOR')+" title='"+ms.titleAttr(formId,'LEVEL_COLOR','IS_TITLE_ATTR',v)+"' ><div class='circle-line' style='margin:0 auto;text-align:center;'><div class='circle' style='margin:0 auto; text-align: center; background-color:"+v['LEVEL_COLOR']+"'></div></div></span>")//<!--v框获得值-->
            arrHtml.push("</td>");
       	//   arrHtml.push("<td style='display:none' colno='ID' class='datagrid-cell "+ms.tdClass(formId, 'ID')+"' style='"+ms.tdStyle(formId, 'ID')+"' "+ms.tdEvent(formId, 'ID')+">")
         //   arrHtml.push("<span colno='ID' class='"+ms.uiClass(formId, 'ID')+"' style='"+ms.uiStyle(formId, 'ID')+"' "+ms.uiEvent(formId, 'ID')+" title='"+ms.titleAttr(formId,'ID','IS_TITLE_ATTR',v)+"' >"+v['ID']+"</span>")
           // arrHtml.push("</td>");
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
//document.location.reload(true);
}
/*
$(function(){ 

    $.ajax({
            type: "POST",
            async: false,
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=6d36d4c00a484f25bd38d051d1bed92f",
            data:{"model":"del"},
            success: function(data){
             //utilsFp.confirmIcon(2,"","","", "保存成功",0,"300","");
             console.log(data);
            },
            error: function(msg){
                console.log(msg);
                //utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });

    
});*/
/*
//获得焦点时候刷新页面
  window.onfocus = function() {
        console.log("获得焦点");
           
    };
    window.onblur = function() {
        console.log("失去焦点");

    };

 */

function update(){
$.ajax({
            type: "POST",
            ajax:false,
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=6d36d4c00a484f25bd38d051d1bed92f",
            data:{"model":"del"},
            success: function(data){
             //utilsFp.confirmIcon(2,"","","", "保存成功",0,"300","");
             console.log(data);
           //  window.location.reload();
            },
            error: function(msg){
                console.log(msg);
                //utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
}


//阻止事件向上冒泡
$("#datagrid-btable-ajax53e8ef46c6cd4a2f96cbd7d6caa9ff54").on('click','tr td input',function(e){
     e.stopPropagation(); 
})

$("#datagrid-btable-ajax53e8ef46c6cd4a2f96cbd7d6caa9ff54").on('click','tr',function(e){
     $(this).toggleClass("datagrid-row tr-hover-flag datagrid-selected");
})
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

var trCount=0;
//弹出div物料信息
function addItemInfo(){
		util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=10fa4e9c1bf54521bb2908f556188e03",
			    data: "",
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].ITEM_TYPE==null) rccList[i].ITEM_TYPE="";
								if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
								$("#itemTable tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' name='isSelect1'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:180px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;'>"+rccList[i].ITEM_TYPE+"<input type='hidden' id='CI_MIN_PACK"+(trCount+1)+"' value='"+rccList[i].CI_MIN_PACK+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#itemTable tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('itemTable');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//div物料信息分页
var paginationImpl = {};
function searchItemInfo(paginationImpl){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	var itemCode = $.trim($("#itemCode").val());
    	util.showLoading("处理中...");
    	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=dacc93bddbed4920963eccd4afcf0d25",
			    data: "paraMap.type=1&paraMap.itemCode="+itemCode+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				                 $("#itemTbody").empty();
						util.closeLoading();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i=0;i<rccList.length;i++){
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].ITEM_TYPE==null) rccList[i].ITEM_TYPE="";
								if(rccList[i].CI_MIN_PACK==null) rccList[i].CI_MIN_PACK="0";
								$("#itemTable tbody:last").append("<tr id='tr1_"+((currentPage-1)*pageRecord+(i+1))+"' ></tr>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+(trCount+1)+"' type='checkbox' name='isSelect1'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:180px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_NAME+"'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trCount+1)+"' value='"+rccList[i].CI_ITEM_SPEC+"'/></td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;'>"+rccList[i].SUPPLIER_NAME+"</td>");
								$("#itemTable tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='text-align: center;'>"+rccList[i].ITEM_TYPE+"<input type='hidden' id='CI_MIN_PACK"+(trCount+1)+"' value='"+rccList[i].CI_MIN_PACK+"'/></td>");
								trCount++;
							}
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#itemTable tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('itemTable');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

var wmsOption;
//获取仓库信息
function getWmsSel(){
		$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=22d8b5e68fb84cabadff3d45e674c625",
			    data: "",
				success: function(data){
						//console.log(data.ajaxMap.samplList);
						wmsOption = "<option value=''>--请选择--</option>";
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i = 0;i < rccList.length; i++){
								wmsOption = wmsOption + "<option value='"+rccList[i].WA_AREA_SN+"'>"+rccList[i].WA_AREA_NAME+"</option>";
							}
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//设置下拉框样式
function mySetChosen(){
	
	var curWinHeight = $(document).height();//当前窗口高度
	$(".dept_select").chosen({
		//inherit_select_classes:true,//继承select class
		//width:"100%",
		//disable_search:true,//是否隐藏搜索框
		disable_search_threshold:15//少于15项，隐藏搜索框
	});

	//大于10个选项的，显示搜索框
	var len1 = $(".dept_select").length;
	$(".dept_select").each(function(index,item){
		if(item.id!=""&&item.id.indexOf("#")<0){
		if(item != null && item.length > 10){
			//.chosen-container-single .chosen-search
			$("#"+item.id+"_chosen .chosen-search").css("display","block");
		}

		var offset = $("#"+item.id+"_chosen").offset(); //计算当前下拉框的偏移量
		
		var maxHeight = $("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height").replace("px","");//下拉高度
		
		var searchHeight = 0;//下拉搜索框的高度，默认为0
		//如果有显示搜索框，则需多计算搜索框的高度
		if(!$("#"+item.id+"_chosen .chosen-drop .chosen-search").is(":hidden")){
			searchHeight = 35;
		}
		//如果下拉框在窗口位置比窗口高度的一半还往下，则往上拉
		if(offset.top > (curWinHeight/2)){
			$("#"+item.id+"_chosen .chosen-drop").css({"top":"auto","bottom": "100%","border-top":"1px solid #75c4ff","border-bottom": 0,"background-color":"#f8fcff"});
			//console.log($("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height"));
			//console.log(itemHeight);
			if(offset.top < (maxHeight+searchHeight) && offset.top < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":offset.top-5-searchHeight});
			}
		}else{
			var itemHeight = curWinHeight - offset.top;
			if(itemHeight < (maxHeight+searchHeight) && itemHeight < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":itemHeight-32-searchHeight});
			}
		}
		}

	});
}
function delRow(){
	$("#itemInfo :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
		}
	});
	reSort("itemInfo");
	var tableTrJs = $("#itemInfo tbody tr");
	_tongLineColor(tableTrJs);
	clickTr('itemInfo');		        
}
//重新排序
function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
}
   //全选
     	function getAllItem(){
		if($("#item_list_cb").attr("checked")=="checked"){
			$("#itemTbody :checkbox").attr("checked",true);
		}else{
			$("#itemTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
	//全选2
     	function getAllItems(){
		if($("#allSelects").attr("checked")=="checked"){
			$("#addItemInfo :checkbox").attr("checked",true);
		}else{
			$("#addItemInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 

//验证
function checkNum(tempVal,obj){
	if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal < 0 ||tempVal>100){
	obj =$("#MMZ_LEVEL_SCORE");
	//_alertValMsg(obj,"该项必须为小于100的正整数");
	_alertValMsg(obj,"请输入0~"+100+"整数");
		return false;  
	}
	
	return true; 
}
function checkNum1(tempVal,tempId){
	if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal <= 0){
		_alertValMsg(tempId,"<dict:lang value="该项必须为正整数" />");
		return "0";  
	}else 
	return "1"; 
}

      
   // function closePopIcoFp(tempPopupDivId){重写关闭弹窗方法
      //  return null;    
    //} 
        $( "#addItem" ).draggable({ handle: '#mmz_dialog-hd'});

    
function v_add(){
    
      $("#mmz_btn").html("<i class='ico ico-save'></i><dict:lang  value='保存'/>");
    $("#mmz_title").html("<dict:lang value='新增' />");
    $("#MMZ_LEVEL_SCORE").val("");
    grape_color= '#000000';
   $(".sp-preview-inner").css("background-color",grape_color);
    $("#mmz_btn").on("click",function(){
        mmz_add(this);
    });
  popItemDiv('addItem','backItem');
}
   //新增       
      var clickmore = true;//禁止连续点击保存
        function mmz_add(obj){
        var j = {};
        j.level_code= 1;
        j.level_score= $("#MMZ_LEVEL_SCORE").val();
        j.level_color= grape_color;
        
        if(!checkNum(j.level_score,$("#MMZ_LEVEL_SCORE"))){
            return false;
        }
        if(null==j.level_code||j.level_code==""){
           j.level_code ==0;
        }
        
        j.model = "add"; 
       if(!clickmore)return;
        clickmore = false;
        console.log(JSON.stringify(j));
           $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=6d36d4c00a484f25bd38d051d1bed92f",
            data:j,
             success: function(data){
            if(data.ajaxMap.returnMsg=="error"){
                console.log("Sssssssssssss");
                utilsFp.confirmIcon(3,"","","", "分数不能相同",0,"300","");
                clickmore =true;
                return;
            }else{
                msgPop('保存成功',"",'提示',200,150,3000,5000);
                 //window.location.reload(true);    
                 clickmore =true;
                 if(saveose=="0"){
        			  hideDiv('addItem','backItem');
        			}
                 //window.location.reload(true);          
                 query("formId1");
            }
        	 	 
            },
            error: function(msg){				
                clickmore =true;
                console.log(msg);
                utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
        }
var sel_id;//选中id


    /*修改视图*/	
    function v_modify(cnt,id,sc,co){
    sel_id=id;
    popItemDiv('addItem','backItem');
    $("#mmz_btn").html("<i class='ico ico-save'></i><dict:lang  value='保存'/>");
    $("#mmz_title").html("<dict:lang value='修改' />");
    $("#mmz_btn").on("click",function(){
        mmz_modify(this);
    });
   var k = co.split(",")
   r = k[0].substr(4);
   g = k[1];
   b = k[2].substring(0,k[2].length-1);
   co = rgbToHex(r,g,b)
   co = "#"+co;
   grape_color= co;
   $(".sp-preview-inner").css("background-color",grape_color);
    $("#MMZ_LEVEL_SCORE").val(sc);
  }
  
function rgbToHex(r, g, b) { return ((r << 16) | (g << 8) | b).toString(16); }//转 rgb格式

/*修改*/
 function mmz_modify(obj){
        var j = {};
        j.id = sel_id;
         j.level_score=  $("#MMZ_LEVEL_SCORE").val();
        j.level_color= grape_color;
           
         if(!checkNum(j.level_score,$("#MMZ_LEVEL_SCORE"))){//验证
            return false;
        }
        /*
      '  if(null==j.level_score||j.level_score==""){
            j.level_score ==0;
        }
        if(null==j.level_code||j.level_code==""){
            j.level_code ==0;
        }
        */
        j.model = "modify"; 
        console.log(JSON.stringify(j));
           $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=6d36d4c00a484f25bd38d051d1bed92f",
            data:j,
            success: function(data){
            
        	 msgPop('修改成功',"",'提示',200,150,3000,5000);
             window.location.reload(true);                 
             
           
           
            },
            error: function(msg){				
                clickmore =true;
                console.log(msg);
                utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
        }

$(function(){
	  
	    setDataAuth();
	})
function setDataAuth(){
    		    $.ajax({
		        type:"post",
		        dataType:"json",
		        data:"",
		        url:"${path}buss/bussModel_exeFunc.ms?funcMId=47ef403e2fb04c2cbdb40754b90e9f80",
		        success: function(data){
		            var list = data.ajaxList;
		            $("#addfuncauth").empty();
		            $("#addfuncauth").append("<option value='"+list[0].ID+"'>"+list[0].NAME+"</option>");
		            $("#addfuncauth").trigger("chosen:updated");
		            $("#editfuncauth").empty();
		            $("#editfuncauth").append("<option value='"+list[0].ID+"'>"+list[0].NAME+"</option>");
		            $("#editfuncauth").trigger("chosen:updated");		            
		        },
		        error:function(msg){
		            
		        }
		        })
}

var saveAndClose = true;
	    var	 saveose="0"; 
		function saveClose(self){
		 
			if(saveAndClose == true){
			   
				$(self).addClass('save-not-close');
				$(self).attr("title","?开启保存并关闭窗口");
				saveAndClose = false;
				$('#isCloseWin').attr('checked',false);
			    $('#isCloseWin').val("1");
			    
			    saveose="1"; 
			 
			}
			else if(saveAndClose == false){
			   
				$(self).removeClass('save-not-close');
				$(self).attr("title","?关闭保存并关闭窗口");
				saveAndClose = true;
				$('#isCloseWin').attr('checked',true);
				$('#isCloseWin').val("0");
			
                saveose="0";
              
			}
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
</script>
	 <script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

 

 
 
 
 
 
 
