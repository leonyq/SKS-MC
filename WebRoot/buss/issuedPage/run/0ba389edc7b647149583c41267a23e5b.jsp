<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
        <jsp:param name="html5" value="1" />
		<jsp:param name="workFlow" value="1" />
		<jsp:param name="spectrum" value="1" />
</jsp:include>
	<link href="${path}plf/page/common/msui/css/css_tab.css"
	rel="stylesheet" type="text/css" />
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script src="${path}plf/js/jsPlumb/newWorkflowchart.js"></script>   
    <script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <script src="${path}buss/js/jsPlumb/flow/topo.js"></script>
	<script src="${path}buss/js/jsPlumb/flow/businessTopo.js"></script>
	<script type="text/javascript" src="${path}buss/js/jsPlumb/flow/jtopo-min.js"></script>
	<script src="${path}buss/js/jsPlumb/flow/jscolor.js"></script>
	<script src="${path}buss/js/jsPlumb/flow/toHex.js"></script>	
	
	<style type="text/css">
	.x-fieldset{border:1px solid #00bfff;padding:10px;margin-botton:10px;display:block;height: 100%}
	.devicetable { table-layout: fixed;}
	.devicetd {
    overflow:hidden;
    white-space:nowrap;
    text-overflow:ellipsis;
    -o-text-overflow:ellipsis;
    -moz-text-overflow: ellipsis;
    -webkit-text-overflow: ellipsis;
}
#block2 td,#block3 td,#block4 td,#block5 td{
border:1px solid #ccc;
}
	</style>
	
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>

  <style>
  
        .bd .content1{
            padding-top:10px;
            box-sizing:border-box;
        }
        
        .bd .content1>div{
            height:100%;
            width:100%;
            float:left;
            display:none;
            box-sizing:border-box;
        }
        
        .bd .content1>div.current{
            display:block;
        }
  </style>

</head>
<body style="background-color:#fff;">
	<div class="edit">
			<div class="bd" style="    height: 480px;border: none;">
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="9ce89b8198274a25b7219ad226eda21e" type="edit" />
		<ul class="tab-list" style="padding-left:12px;">
			<li class="current">	
			   	<a><span>基本信息</span></a> 
			</li>
			<li  onclick="getInfo()" >		
                <a><span>机种关联</span></a> 						
			</li>
			<li onclick="queryRoute()" >		
                <a><span>流程信息</span></a> 						
			</li>
			<li onclick="GetEsop()" >		
                <a><span>ESOP</span></a> 						
			</li>
		</ul>
		<div class="content1" style="height: calc((100% - 36px) - 39px);">
		    <div class="current">
                <table class="basic-table" >
            	<input type="hidden" name="formIds" value="9ce89b8198274a25b7219ad226eda21e" />
            	<input type="hidden" name="formId" id="formId1" value='123456'/>
	            <input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>   	
            	<input type="hidden" name="9ce89b8198274a25b7219ad226eda21e" value="paraMap1@" />
            	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
            	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
            		<s:set name="_$viewId" value="'be4e0c7204a14217ba4611876e7b1cfc'" />
            		<s:set name="_$formId_1" value="'9ce89b8198274a25b7219ad226eda21e'" />
            		<s:set name="_$type" value="'edit'"/>
            		
            		<tr>
            			<td class="name" style="width:76px;"/><bu:uitn colNo="CT_ID" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
            			<bu:td cssClass="dec" colNo="CT_ID"	style="width:23px;" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_ID" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" formIndex="1" /></bu:td>
            		    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>	
            			<td class="name"  style="width:96px;"/><bu:uitn colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
            			<bu:td cssClass="dec"  style="width:270px;" colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
            		</tr>
            		<tr>
            			<td class="name"/><bu:uitn colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
            			<bu:td cssClass="dec" colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" disabled="disabled" formIndex="1" /></bu:td>
            		    <td>&nbsp;</td>	
            			<td class="name"/><bu:uitn colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
            			<bu:td cssClass="dec" colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" disabled="disabled" formIndex="1" /></bu:td>
            		</tr>
            		<tr>
            			<td class="name"/><bu:uitn colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
            			<bu:td cssClass="dec" colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" disabled="disabled" formIndex="1" /></bu:td>
            		    <td>&nbsp;</td>	
            			<td class="name"/><bu:uitn colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
            			<bu:td cssClass="dec" colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" disabled="disabled" formIndex="1" /></bu:td>
            		</tr>
            		<tr>
            			<td class="name"/><bu:uitn colNo="EDIT_USER" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
            			<bu:td cssClass="dec" colNo="EDIT_USER" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="EDIT_USER" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" disabled="disabled" formIndex="1" /></bu:td>
            		<td>&nbsp;</td>	
            			<td class="name"/><bu:uitn colNo="EDIT_TIME" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
            			<bu:td cssClass="dec" colNo="EDIT_TIME" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="EDIT_TIME" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" disabled="disabled" formIndex="1" /></bu:td>
            		</tr>
            		<tr>
            		    <td class="name"/><bu:uitn colNo="CT_STATION_QTY" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
            			<bu:td cssClass="dec" colNo="CT_STATION_QTY" formId="9ce89b8198274a25b7219ad226eda21e" ><bu:ui colNo="CT_STATION_QTY" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" disabled="disabled" formIndex="1" /></bu:td>
            		<td>&nbsp;</td>	
            			<td class="name"/><bu:uitn colNo="CT_PROCESS_PRIOR" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
            			<bu:td cssClass="dec" colNo="CT_PROCESS_PRIOR" formId="9ce89b8198274a25b7219ad226eda21e" style="width:268px;"><bu:ui colNo="CT_PROCESS_PRIOR" formId="9ce89b8198274a25b7219ad226eda21e" disabled="disabled" dataId="${dataId}" formIndex="1" />
            			
            			<bu:uitn colNo="CT_DEFAULT_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" />
            			<bu:ui colNo="CT_DEFAULT_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" disabled="disabled" formIndex="1" />
            			
            			<bu:uitn colNo="CT_VALID_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" />
            			<bu:ui colNo="CT_VALID_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" disabled="disabled" formIndex="1" />
            		        </bu:td>
            		</tr>
            		<tr>
            		<td class="name"/><bu:uitn colNo="CT_MEMO" formId="9ce89b8198274a25b7219ad226eda21e" /></td><!--548px-->
            			<bu:td cssClass="dec" colNo="CT_MEMO" formId="9ce89b8198274a25b7219ad226eda21e" colspan="4"><bu:ui colNo="CT_MEMO" disabled="disabled" formId="9ce89b8198274a25b7219ad226eda21e" dataId="${dataId}" style="width:calc(100% - 40px);height:80px;"  formIndex="1" /></bu:td>
            		</tr>
            	</table>
            </div>
            <div>
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head11 "  id="datagrid-header-inner831b2dbf0dfb494695b7ce66538a1234">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
										</td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="机种" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="机种名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="机种规格" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll11"   style="height:380px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addItemInfo" >
								</tbody>
							</table>
						</div>
					</div>
		 </div>
            </div>
            <div>
            <div class="mod">

                    <div class="mod-bd">
                    
                    <div id="right" style="height: 300px;width: 100%;left: 0;">
                    		<canvas style="border: 1px solid #E4E4E4;margin-left:10px;box-sizing:border-box;" id="canvas" ondrop="drop(event)" ondragover="allowDrop(event)" width='940px' height='436'></canvas>	
                    </div>
                    </div>
                    </div>	
            </div>
            <div>
                <div class="mod" >
			<div class="mod-bd" style="margin-top:5px;border-bottom: none;height:450px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head2"  id="datagrid-header-inner123456">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable123456">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects1" name="allSelects2" onchange="getAll();" />
										</td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="文件编码" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="文件名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="机种料号" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="生产阶别" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="加工面别" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="工序名称" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="版本" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="默认标志" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="有效标志" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="创建人" /></td >
										<td class="datagrid-cell" style="width:160px;" ><dict:lang value="创建时间" /></td >
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll2"   style="height:380px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax123456" >
								<tbody id="addGetEsop" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
            </div>
		</div>
	
			<bu:jsVal formId="9ce89b8198274a25b7219ad226eda21e" formIndex="1" />
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>


        
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
    	<script>
    	$(function(){
    	initContext();//初始化内容
		//showNodeValue();
		billingButton();//绑定按钮事件
            setPopScroll('.scroll11','.head11');
		    setPopScroll('.scroll2','.head2');
    	    $("#paraMapObj_CT_ROUTE_CODE_SHOW").attr("class"," input _VAL_NULL isSubmit input _VAL_DATABASE ico-search readonly  ");
    	    $("#paraMapObj_CT_PREPOSE_TECH_SHOW").attr("class","input isSubmit input _VAL_DATABASE ico-search readonly");
    	   
		//	queryRoute();
			//GetEsop();
    	})
    	    	$('.dialog-bd',parent.document).css('background-color','#fff');
    	    	$('.tab-list li').click(function(){
                    var index = $(this).index()
                    $(this).addClass('current').siblings().removeClass('current')
                    $('.bd .content1>div').eq(index).addClass('current').siblings().removeClass('current')
                })
                
                var trrCount=0;
    function getInfo(){
           var CT_ROUTE_CODE = $("#paraMapObj_CT_ROUTE_CODE").val();
           var step =$("#paraMapObj_CT_PRODUCT_STEP").val();
           
           var face =$("#paraMapObj_CT_PROCESS_FACE").val();
            
           var id = "${dataId}";
           
           $("#addItemInfo").empty();
         
            var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=91bd5516f86e4f33a76e17ed0d3d2e77";
            $.ajax({
                type:"post",
                dataType:"json",
                data:"CT_ROUTE_CODE="+CT_ROUTE_CODE+"&id="+id+"&step="+step+"&face="+face,
                url:loadItemUrl,
                success:function(data){
                    if(null==data){
                        return;
                    }
                    
                    if(null!=data.ajaxString){
                        //var name = eval(data.ajaxString);
                       // alert(name);
                        $("#paraMapObj_CT_ROUTE_CODE_SHOW").val(data.ajaxString);
                    }
                   
                    
                     if(null!=data.ajaxList){
                        var rccList  = eval(data.ajaxList);
                   
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].CTM_MODEL_CODE==null) rccList[i].CTM_MODEL_CODE="";
							if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
							if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
                            
                            $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr"+(trrCount+1)+"' ></tr>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].ID+"'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].CTM_MODEL_CODE+"<input type='hidden' class='CI_ITEM_CODE' name='CI_ITEM_CODE' value='"+rccList[i].CTM_MODEL_CODE+"'/></td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+rccList[i].CI_ITEM_NAME+"</td>");
							$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
							
							trrCount++;
                        }
                       
                    }
                    var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
			defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
                    
                },
                error:function(msg){
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            })
        }
        var paraMapModel = "view";
        var blockIcon;
        var blackConn;
	function queryRoute(){
	    var ctId=$("#paraMapObj_CT_ID").val();
	    var dataId="${dataId}";
	    var routeUrl2="${path}buss/bussModel_exeFunc.ms?funcMId=88a6967c694e4efa874202a13a75c87b&formId=%{formId}";
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: routeUrl2+"&ctId="+ctId+"&dataId="+dataId+"&flag=1",
 			success: function(data){
 			   
 				var pList=data.ajaxList;
 				$("#paraMapObj_PM_START_GROUP").val("");
 				$("#paraMapObj_PM_END_GROUP").val("");
 				cleanScene();
 				if(pList!=null&&pList.length>0){
 				  
 				  $("#paraMapObj_PM_START_GROUP").val(pList[0].CR_MO_INPUT);
 				  $("#paraMapObj_PM_END_GROUP").val(pList[0].CR_MO_OUTPUT);
 				   $("#INPUT_CODE").val(pList[0].INPUT_CODE);
 				  $("#OUTPUT_CODE").val(pList[0].OUTPUT_CODE);
 				  
 				  
 				  //switchTag('tag2','content2','');
 				  var blockIcon = JSON.parse(pList[0].CR_BLOCKS_MSG);
 				  if(blockIcon!=""&&blockIcon!=undefined){
 				  blockIcon=JSON.stringify(blockIcon);
 				   showTopoData(blockIcon);
 				  }
 				 blackConn = JSON.parse(pList[0].CR_CONN_MSG);
        		  initJsPlumb();
        		  showCon();
 				}
 				//alert(utilsFp.jsonToString(pList));
 				
 				
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				
 		   }
 		});
	}
	
	trrCounts=0;
    function GetEsop(){
            var step = $("#paraMapObj_CT_PRODUCT_STEP").val();
           var ctId = $("#paraMapObj_CT_ID").val();
           var face= $("#paraMapObj_CT_PROCESS_FACE").val();
           var dataAuth= $("#paraMapObj_DATA_AUTH").val();
           $("#addGetEsop").empty();
         var succe;
            var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=c97685e799754371a88a030bfb95684e";
            $.ajax({
                type:"post",
                dataType:"json",
                data:"ctId="+ctId+"&step="+step+"&face="+face+"&dataAuth="+dataAuth,
                url:loadItemUrl,
                success:function(data){
                    if(null==data){
                        return;
                    }
                    
                     if(null!=data.ajaxList){
                        var rccList  = eval(data.ajaxList);
                      
                        var tempCheck;
						var tempFreeze;
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].CSI_SN==null) rccList[i].CSI_SN="";
							if(rccList[i].CSI_NAME==null) rccList[i].CSI_NAME="";
							if(rccList[i].CSI_MODEL_CODE==null) rccList[i].CSI_MODEL_CODE="";
							if(rccList[i].STEP==null) rccList[i].STEP="";
							if(rccList[i].FACE==null) rccList[i].FACE="";
							if(rccList[i].CSI_GROUP==null) rccList[i].CSI_GROUP="";
							if(rccList[i].CSI_VERSION==null) rccList[i].CSI_VERSION="";
							if(rccList[i].CSI_DEFAULT_FLAG==null) tempCheck="";
							if(rccList[i].CSI_DEFAULT_FLAG=='Y') tempCheck="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
							if(rccList[i].CSI_DEFAULT_FLAG=='N') tempCheck="<img src='${path}/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
							if(rccList[i].CSI_VALID_FLAG==null) tempFreeze="";
							if(rccList[i].CSI_VALID_FLAG=="Y") tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
							if(rccList[i].CSI_VALID_FLAG=="N") tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
							if(rccList[i].NAME==null) rccList[i].NAME="";
							if(rccList[i].CREATE_TIMES==null) rccList[i].CREATE_TIMES="";
                            
                    
							//	var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
							//	class='datagrid-row "+backgroudColor+"
			 				/*	var temp="<tr id='trr"+(trrCount+1)+"' >"+
							      "<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>"+
							      "<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect2' value='"+rccList[i].ID+"'/></td>"+
							      "<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+rccList[i].CSI_SN+"</td>"+
							      "<td class='datagrid-cell datagrid-cell-4' style='width:120px;text-align: center;'>"+rccList[i].CSI_NAME+"</td>"+
							      "<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+rccList[i].CSI_MODEL_CODE+"</td>"+
							      "<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;'>"+rccList[i].STEP+"</td>"+
							      "<td class='datagrid-cell datagrid-cell-7' style='width:90px;text-align: center;'>"+rccList[i].FACE+"</td>"+
							      "<td class='datagrid-cell datagrid-cell-8' style='width:120px;text-align: center;'>"+rccList[i].CSI_GROUP+"</td>"+
							      "<td class='datagrid-cell datagrid-cell-9' style='width:90px;text-align: center;'>"+rccList[i].CSI_VERSION+"</td>"+
							      "<td class='datagrid-cell datagrid-cell-10' style='width:90px;text-align: center;'>"+rccList[i].CSI_DEFAULT_FLAG+"</td>"+
							      "<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: center;'>"+rccList[i].CSI_VALID_FLAG+"</td>"+
							      "<td class='datagrid-cell datagrid-cell-12' style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>"+
							      "<td class='datagrid-cell datagrid-cell-13' style='width:120px;text-align: center;'>"+rccList[i].CREATE_TIMES+"</td>"+
							      */
							      var temps="<tr id='trr"+(trrCount+1)+"' >"
								         +"<td  style='width:30px;text-align: center;'>"+(i+1)+"</td>"
								         +"<td  style='width:30px;text-align: center;'><input type='checkbox' name='isSelect2' value='"+rccList[i].ID+"'/></td>"
								         +"<td  style='width:150px;text-align: center;'>"+rccList[i].CSI_SN+"</td>"
								         +"<td  style='width:120px;text-align: center;'>"+rccList[i].CSI_NAME+"</td>"
								         +"<td  style='width:120px;text-align: center;'>"+rccList[i].CSI_MODEL_CODE+"</td>"
								         +"<td  style='width:90px;text-align: center;'>"+rccList[i].STEP+"</td>"
								         +"<td  style='width:90px;text-align: center;'>"+rccList[i].FACE+"</td>"
								         +"<td  style='width:120px;text-align: center;'>"+rccList[i].CSI_GROUP+"</td>"
								         +"<td  style='width:90px;text-align: center;'>"+rccList[i].CSI_VERSION+"</td>"
								         +"<td  style='width:90px;text-align: center;'>"+tempCheck+"</td>"
								         +"<td  style='width:90px;text-align: center;'>"+tempFreeze+"</td>"
								         +"<td  style='width:90px;text-align: center;'>"+rccList[i].NAME+"</td>"
								         +"<td  style='width:160px;text-align: center;'>"+rccList[i].CREATE_TIMES+"</td>"
								         
								         
							succe+=temps;
							trrCounts++;
						
                        }
                       
                    }
                    $("#addGetEsop").append(succe);
                    var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
					_tongLineColor(tableTrJs);
					clickTr('datagrid-btable-ajax123456');
					defTableWidthRewrite("123456");
                    
                },
                error:function(msg){
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            })
    }
    function getAllItems(){
		if($("#allSelects").attr("checked")=="checked"){
			$("#addItemInfo :checkbox").attr("checked",true);
		}else{
			$("#addItemInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
     function getAll(){
		if($("#allSelects1").attr("checked")=="checked"){
			$("#addGetEsop :checkbox").attr("checked",true);
		}else{
			$("#addGetEsop :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}           
//点击行寄选中该行
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
				$("#"+trId).css("background-color","#d3eafc");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#d3eafc");
			  }
		  });
}  
    	</script>
    	<script>
        	(function($){
              $(window).on('load',function(){
                 //setPopScroll('.datagrid-body','.datagrid-header-inner');
                 setPopScroll('.scroll11','.head11');
                setPopScroll('.scroll2','.head2');
              })
            })(jQuery)				
        </script>
    <script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
