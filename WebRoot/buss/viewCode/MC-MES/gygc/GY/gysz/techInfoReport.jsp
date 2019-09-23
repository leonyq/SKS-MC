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
		<dict:lang value="VM-工艺信息报表" />
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
		<bu:header formId ="53cdfd3c141e43a8b35bd606c34eac75"/>
<script src="${path}plf/js/jsPlumb/newWorkflowchart.js"></script>  
<script src="${path}plf/js/jsPlumb/flow/topo.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/businessTopo.js"></script>
	<script type="text/javascript" src="${path}plf/js/jsPlumb/flow/jtopo-min.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/jscolor.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/toHex.js"></script>    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
    <style>
       
    </style>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
	        <div class="optn">
	        <button type="button" id="querybtn" onclick="queryAllProData();" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
	        </div>
            </div>
            <div class="bd">
                <div class="search-box">
                   <div class="group">
                   <div class="name"><dict:lang value="工艺代码"/></div>
                   <div class="dec"><input id="CT_NAME" type="text" class="input"></div>
                   </div>
                   <div class="group">
                   <div class="name"><dict:lang value="机种料号"/></div>
                   <div class="dec">
                        <!--<input id="MITEM_CODE" class = "IS_SELECT_FILTER dept_select"/>-->
                        <input id="MITEM_CODE" type="text" value="" name="MITEM_CODE" style="padding-left:5px;height:24px;border:1px solid #ccc;" />
                    </div> 
                   </div>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
                     <DIV id="container" style="margin-bottom:5px;">
                        <DIV>
                            <UL class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
                                <LI id="tag1" class="current"><A class=""
                                    onclick="switchTag('tag1','content1','');this.blur();"
                                    href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="基本信息"/></SPAN>
                                </A>
                                </LI>
                                <LI id="tag2"><A class=""
                                    onclick="switchTag('tag2','content2','');this.blur();"
                                    href="javascript:void(0);"> <SPAN><dict:lang value="流程"/></SPAN> </A>
                                </LI>
                               <LI id="tag3"><A class=""
                                    onclick="switchTag('tag3','content3','');this.blur();"
                                    href="javascript:void(0);"> <SPAN><dict:lang value="物料管控"/></SPAN> </A>
                                </LI>                          
                            </UL>
                        </DIV>
        </DIV> 
               <form id="listForm" name="listForm" style="height:calc(100%-39px)" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage53cdfd3c141e43a8b35bd606c34eac75" id="formPage53cdfd3c141e43a8b35bd606c34eac75" value="${formPage53cdfd3c141e43a8b35bd606c34eac75}"/>
		<input type="hidden" name="formId" id="formId1" value='53cdfd3c141e43a8b35bd606c34eac75'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1 dd01"  id="53cdfd3c141e43a8b35bd606c34eac75">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax53cdfd3c141e43a8b35bd606c34eac75" style="">

         	<table style="width: 100%;height:30%;">
        	<tr >
        	<td ><div class="name" ><dict:lang value="工艺代码" /></div></td><td><div class="dec"><input readonly  id="techId" class="input coc" style="width:200px;"></div></td>
        	<td ><div class="name" ><dict:lang value="工艺名称" /></div></td><td><div class="dec"><input readonly id="techName" class="input coc" style="width:200px;"></div></td>
        	<td ><div class="name" ><dict:lang value="生产阶别" /></div></td><td><div class="dec"><input readonly id="proStep" class="input coc" style="width:200px;"></div></td>
        	<td ><div class="name" ><dict:lang value="加工面别" /></div></td><td><div class="dec"><input readonly id="face" class="input coc"  style="width:200px;"></div></td>
        	</tr>
        	<tr>
        	<td ><div class="name" ><dict:lang value="流程名称" /></div></td><td><div class="dec"><input readonly id="rountName" class="input coc" style="width:200px;"></div></td>
        	<td ><div class="name" ><dict:lang value="前置工艺" /></div></td><td><div class="dec"><input readonly id="proTech" class="input coc" style="width:200px;"></div></td>
        	<td ><div class="name" ><dict:lang value="默认标志" /></div></td><td><div class="dec"><input readonly id="defFlag" class="input coc" style="width:200px;"></div></td>
        	<td ><div class="name" ><dict:lang value="有效标志" /></div></td><td><div class="dec"><input readonly id="valFlag" class="input coc" style="width:200px;"></div></td>
        	</tr>
        	<tr>
        	<td ><div class="name" ><dict:lang value="创建人" /></div></td><td><div class="dec"><input readonly id="createPer" class="input coc" style="width:200px;"></div></td>
        	<td ><div class="name" ><dict:lang value="创建时间" /></div></td><td><div class="dec"><input readonly id="createTime" class="input coc" style="width:200px;"></div></td>
        	<td ><div class="name" ><dict:lang value="修改人" /></div></td><td><div class="dec"><input readonly id="editPer" class="input coc" style="width:200px;"></div></td>
        	<td ><div class="name" ><dict:lang value="修改时间" /></div></td><td><div class="dec"><input readonly id="editTime" class="input coc" style="width:200px;"></div></td>
        	</tr>
        	</table>
		
		
		</div>
		</div>
				<div class="panel-ajax datagrid datagrid-div1 dd02"  id="53cdfd3c141e43a8b35bd606c34eac75">
               <canvas style="border: 1px solid #E4E4E4;margin-left:10px;box-sizing:border-box;" id="canvas" ondrop="drop(event)" ondragover="allowDrop(event)" width='1240px' height='426'></canvas>
		</div>
				<div class="panel-ajax datagrid datagrid-div1 dd03"  id="53cdfd3c141e43a8b35bd606c34eac75">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax53cdfd3c141e43a8b35bd606c34eac75" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner scroll001" id="datagrid-header-inner53cdfd3c141e43a8b35bd606c34eac75">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable53cdfd3c141e43a8b35bd606c34eac75">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="53cdfd3c141e43a8b35bd606c34eac75" i18n="1"/></td>
            <td style="width:160px; text-align:center;"><dict:lang value="机种料号"/></td>
            <td style="width:160px; text-align:center;"><dict:lang value="机种名称"/></td>
            <td style="width:160px; text-align:center;"><dict:lang value="机种规格"/></td>
            <td style="width:80px; text-align:center;"><dict:lang value="管控类型"/></td>
            <td style="width:160px; text-align:center;"><dict:lang value="管控料号"/></td>
            <td style="width:160px; text-align:center;"><dict:lang value="物料名称"/></td>
            <td style="width:160px; text-align:center;"><dict:lang value="物料规格"/></td>
            <td style="width:80px; text-align:center;"><dict:lang value="生产阶别"/></td>
            <td style="width:80px; text-align:center;"><dict:lang value="加工面别"/></td>
            <td style="width:160px; text-align:center;"><dict:lang value="管控工序"/></td>
            <td style="width:80px; text-align:center;"><dict:lang value="管控数量"/></td>
            <td style="width:80px; text-align:center;"><dict:lang value="管控方式"/></td>
            <td style="width:80px; text-align:center;"><dict:lang value="物料来源"/></td>
            <td style="width:100px; text-align:center;"><dict:lang value="创建人"/></td>
            <td style="width:200px; text-align:center;"><dict:lang value="创建时间"/></td>            
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll1" style="height:350px;" id="tableDiv53cdfd3c141e43a8b35bd606c34eac75" onscroll="ajaxTableScroll(this,'53cdfd3c141e43a8b35bd606c34eac75')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax53cdfd3c141e43a8b35bd606c34eac75">
		<tbody id="tbody_tab3" class="isParents">
		</tbody>
		</table>		</div>
		</div>
				<div class="center" style="margin-top:-50px;" id="page1">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=queryItemInfo2&formId=formId1&showLoading=0" />
			</div>
		</div>
				

	

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="ab7fd048ac884ead9706952262e9c496" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="ab7fd048ac884ead9706952262e9c496" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
/*function mItemSelect(){

    	   $.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=080c69b259c345608c561fdf7d189cd0",
 	    	data:"",
 			success: function(data){
 		      var resList = data.ajaxList;
 		      $("#MITEM_CODE").append("<option >--请选择--</option>");
 		      for(var i=0;i<resList.length;i++){
 		          $("#MITEM_CODE").append("<option >"+resList[i].CI_ITEM_CODE+"</option>");
 		      }
 		       $("#MITEM_CODE").trigger("chosen:updated");
 			},
 			error:function(msg){
 			    
 			}
 			})
}*/
$(function(){
    $("#tag1").addClass("current");
    $("#tag2").removeClass("current");    
    $("#tag3").removeClass("current");
    $('.dd01').css('display','block');
    $('.dd02').css('display','none');
    $('.dd03').css('display','none'); 
    $('#page1').css('display','none'); 
    $("#tbody_tab2").empty();
    $("#tbody_tab3").empty();
    var jumpId = $("#jumpId").val();  
              if(jumpId!=""){
                    $("#CT_NAME").val(jumpId);
                    queryAllProData();
                  }
    //mItemSelect();
    		initContext();//初始化内容
    		
		scene.mousedrag(function(event) {
			scene.translateX=0;
			scene.translateY=0;
			
		})
		billingButton();//绑定按钮事件
})
function queryAllProData(){
    
    queryTechInfo();
    queryItemInfo();
   var caId = $("#CT_NAME").val();
 //  queryRoute(caId);
}
function switchTag(tag, content, url){
    if(tag=="tag1"){
    $("#tag1").addClass("current");
    $("#tag2").removeClass("current");    
    $("#tag3").removeClass("current");
    $('.dd01').css('display','block');
    $('.dd02').css('display','none');
    $('.dd03').css('display','none');  
  $('#page1').css('display','none');
    }else if(tag=="tag2"){
    $("#tag2").addClass("current");
    $("#tag1").removeClass("current");
    $("#tag3").removeClass("current");
    $('.dd01').css('display','none');
    $('.dd03').css('display','none');
    $('.dd02').css('display','block'); 
    $('#page1').css('display','none');
    }else if(tag=="tag3"){
    $("#tag3").addClass("current");
    $("#tag1").removeClass("current");
    $("#tag2").removeClass("current");
    $('.dd01').css('display','none');
    $('.dd03').css('display','block');
    $('.dd02').css('display','none');
    $('#page1').css('display','block');
    }
}
    var blockIcon;
    var blackConn;
    var paraMapModel = "view";
	function queryRoute(key,dataId){
	    var routeUrl2="${path}buss/bussModel_exeFunc.ms?funcMId=88a6967c694e4efa874202a13a75c87b&formId=%{formId}";
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: routeUrl2+"&ctId="+key+"&flag=1&dataId="+dataId,
 			success: function(data){
 			console.log(data);
 				var pList=data.ajaxList;
 				cleanScene();
 				if(pList!=null&&pList.length>0){
 				  var blockIcon = JSON.parse(pList[0].CR_BLOCKS_MSG);
 				  if(blockIcon!=""&&blockIcon!=undefined){
 				   stage.mode="drag";//场景模式
 				  blockIcon=JSON.stringify(blockIcon);
 				   showTopoData(blockIcon);
 				  }
 				 blackConn = JSON.parse(pList[0].CR_CONN_MSG);
        		  initJsPlumb();
        		  showCon();
 				}
 				
 				
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				
 		   }
 		});
	}
	function queryTechInfo(){
	    var caId = $("#CT_NAME").val();//工艺Id
	   $.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=ba6d89fc9d3a4d87a9b615eaba7b43fb",
 	    	data:{
 	    	    'caId':caId
 	    	},
 			success: function(data){
 			    var resList = data.ajaxList;
 			    var dataId = null;
 			    console.log(resList);
 			    $(".coc").val("");
 			    if(null!=resList && resList.length!=0){
 			    $("#techId").val(resList[0].CT_ID);$("#techName").val(resList[0].CT_NAME);
 			    $("#proStep").val(resList[0].CT_PRODUCT_STEP);$("#face").val(resList[0].CT_PROCESS_FACE);
 			    $("#rountName").val(resList[0].CT_ROUTE_CODE);$("#proTech").val(resList[0].CT_PREPOSE_TECH);
 			    $("#defFlag").val(resList[0].CT_DEFAULT_FLAG=="Y"?"是":"否");$("#valFlag").val(resList[0].CT_VALID_FLAG=="Y"?"是":"否");
 			    $("#createPer").val(resList[0].CREATE_USER);$("#createTime").val(resList[0].CREATE_TIME);
 			    $("#editPer").val(resList[0].EDIT_USER);$("#editTime").val(resList[0].EDIT_TIME); 	
 			    dataId = resList[0].ID;
 			    }
 			    if(dataId!=null){
 			        queryRoute(caId,dataId);
 			    }
 			    

 			},
 			error:function(msg){
 			    
 			}
 			})
	}
	function queryItemInfo(){
	    var caId = $("#CT_NAME").val();//工艺Id
	    var modelCode = $("#MITEM_CODE").val();
	    console.log("caid="+caId);
	    console.log("modelCode="+modelCode);
	   $.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=49048cc086ab4f169a64c0a2b620cfda",
 	    	data:{
 	    	    'caId':caId,
 	    	    'modelCode':modelCode
 	    	},
 			success: function(data){
 			    console.log(data)
 			    var reslist = data.ajaxPage.dataList;
               $("#tbody_tab3").empty();
              if(null != reslist){
                  for(var i=0;i<reslist.length;i++){
                    $("#tbody_tab3").append("<tr></tr>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+reslist[i].ROWNUM_+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'><span onclick='itemJump1(\""+reslist[i].CTI_MODEL_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].CTI_MODEL_CODE==null?"":reslist[i].CTI_MODEL_CODE)+"</span></td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].CTI_MODEL_NAME==null?"":reslist[i].CTI_MODEL_NAME)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].CTI_MODEL_SPET==null?"":reslist[i].CTI_MODEL_SPET)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:center;'>"+(reslist[i].CTI_ITEM_TYPE==null?"":reslist[i].CTI_ITEM_TYPE)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'><span onclick='itemJump2(\""+reslist[i].CTI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].CTI_ITEM_CODE==null?"":reslist[i].CTI_ITEM_CODE)+"</span></td>");
                    if(reslist[i].CTI_ITEM_TYPE=="辅料制具"){
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].ASSISTANTTOOLNAME==null?"":reslist[i].ASSISTANTTOOLNAME)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].ASSISTANTTOOLSPEC==null?"":reslist[i].ASSISTANTTOOLSPEC)+"</td>");                        
                    }else{
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].CI_ITEM_NAME==null?"":reslist[i].CI_ITEM_NAME)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].CI_ITEM_SPEC==null?"":reslist[i].CI_ITEM_SPEC)+"</td>");                        
                    }
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:center;'>"+(reslist[i].CTI_PRODUCT_STEP==null?"":reslist[i].CTI_PRODUCT_STEP)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:center;'>"+(reslist[i].CTI_PROCESS_FACE==null?"":reslist[i].CTI_PROCESS_FACE)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].CTI_GROUP==null?"":reslist[i].CTI_GROUP)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:right;'>"+(reslist[i].CTI_ASSB_QTY==null?"":reslist[i].CTI_ASSB_QTY)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:center;'>"+(reslist[i].CTI_CONTROL_MODE==null?"":reslist[i].CTI_CONTROL_MODE)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:center;'>"+(reslist[i].CTI_ITEM_SOURCE==null?"":reslist[i].CTI_ITEM_SOURCE)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:100px; text-align:center;'>"+(reslist[i].CREATE_USER==null?"":reslist[i].CREATE_USER)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px; text-align:center;'>"+(reslist[i].CREATE_TIME==null?"":reslist[i].CREATE_TIME)+"</td>");
                  }
                  setScroll();
                 var tableTrJs = $("#tbody_tab3 tr");_tongLineColor(tableTrJs);
                 pageFun(data.ajaxPage,"formId1");
                 }
 			},
 			error:function(msg){
 			    
 			}
 			})
	}	
	var paginationImpl = {};
	function queryItemInfo2(paginationImpl){
	    var caId = $("#CT_NAME").val();//工艺Id
	   $.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=49048cc086ab4f169a64c0a2b620cfda",
 	    	data:{
 	    	    'caId':caId,
 	    	    'page.currentPage':_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
 	    	    'page.pageRecord':_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
 	    	},
 			success: function(data){
 			    var reslist = data.ajaxPage.dataList;
               $("#tbody_tab3").empty();
              if(null != reslist){
                  for(var i=0;i<reslist.length;i++){
                    $("#tbody_tab3").append("<tr></tr>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+reslist[i].ROWNUM_+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'><span onclick='itemJump1(\""+reslist[i].CTI_MODEL_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].CTI_MODEL_CODE==null?"":reslist[i].CTI_MODEL_CODE)+"</span></td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].CTI_MODEL_NAME==null?"":reslist[i].CTI_MODEL_NAME)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].CTI_MODEL_SPET==null?"":reslist[i].CTI_MODEL_SPET)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:center;'>"+(reslist[i].CTI_ITEM_TYPE==null?"":reslist[i].CTI_ITEM_TYPE)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'><span onclick='itemJump2(\""+reslist[i].CTI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].CTI_ITEM_CODE==null?"":reslist[i].CTI_ITEM_CODE)+"</span></td>");
                    if(reslist[i].CTI_ITEM_TYPE=="辅料制具"){
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].ASSISTANTTOOLNAME==null?"":reslist[i].ASSISTANTTOOLNAME)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].ASSISTANTTOOLSPEC==null?"":reslist[i].ASSISTANTTOOLSPEC)+"</td>");                        
                    }else{
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].CI_ITEM_NAME==null?"":reslist[i].CI_ITEM_NAME)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].CI_ITEM_SPEC==null?"":reslist[i].CI_ITEM_SPEC)+"</td>");                        
                    }
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:center;'>"+(reslist[i].CTI_PRODUCT_STEP==null?"":reslist[i].CTI_PRODUCT_STEP)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:center;'>"+(reslist[i].CTI_PROCESS_FACE==null?"":reslist[i].CTI_PROCESS_FACE)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px; text-align:left;'>"+(reslist[i].CTI_GROUP==null?"":reslist[i].CTI_GROUP)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:right;'>"+(reslist[i].CTI_ASSB_QTY==null?"":reslist[i].CTI_ASSB_QTY)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:center;'>"+(reslist[i].CTI_CONTROL_MODE==null?"":reslist[i].CTI_CONTROL_MODE)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px; text-align:center;'>"+(reslist[i].CTI_ITEM_SOURCE==null?"":reslist[i].CTI_ITEM_SOURCE)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:100px; text-align:center;'>"+(reslist[i].CREATE_USER==null?"":reslist[i].CREATE_USER)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px; text-align:center;'>"+(reslist[i].CREATE_TIME==null?"":reslist[i].CREATE_TIME)+"</td>");
                  }
                  setScroll();
                 var tableTrJs = $("#tbody_tab3 tr");_tongLineColor(tableTrJs);
                 pageFun(data.ajaxPage,"formId1");
                 }
 			},
 			error:function(msg){
 			    
 			}
 			})
	}		
<%--生成异步表格--%>
function createTableModel(ms,formId){
    setScroll(formId);
}


</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料管控
function itemJump1(obj){
      winOptMethod.jump("941ff4a8c7d34ee7983c8a215ef4fe27","F7470","jumpId",obj);
}  


//物料管控
function itemJump2(obj){
    winOptMethod.jump("941ff4a8c7d34ee7983c8a215ef4fe27","F7470","jumpId2",obj);
} 


</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.scroll001');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
