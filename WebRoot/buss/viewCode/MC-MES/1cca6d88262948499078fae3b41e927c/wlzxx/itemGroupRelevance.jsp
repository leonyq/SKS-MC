<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="物料组关联" /></title>
	
	
	
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<script src="${path}plf/js/ui/textform/js/jquery.validate.js"></script>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<style>
		
		
	    <%--.datagrid-header,.datagrid-div3{
	       width:100% !important;
	      }
	
	
		.bd{
			height:513px !important;
		}
		
		.mCSB_scrollTools .mCSB_draggerContainer{
		    	right:-8px !important;    
		}--%>
		
	</style>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script>
	//加载父ifream中的js\css文件

		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			//head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
			//	head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
		
	</script>
	<style type="text/css">
		.x-fieldset{border:1px solid #B5B8C8;padding:10px;margin-botton:10px;display:block;}
	</style>
	<script type="text/javascript">
		//function selectItem(itemGroupSn){
	//	var urlDetail = "${path}buss/bussModel_exeFunc.ms?funcMId=d882255ff2f7465392e6eb65f888907c&groupSn="+itemGroupSn;
   //   		showPopWinFp(urlDetail , 700, 552,null,"%{getText("选择物料")}",'add_itemId');

  //  }
	
	
	
	function delItem(groupSn){
       var urlDetail = "${path}buss/bussModel_exeFunc.ms?funcMId=8b4f61e3f7194bd8b978c71118f273f1";
       delItemRow(urlDetail,groupSn);
}
	
	function delItemRow(url,groupSn){
	var dataAuth = $("#deptLs_data_auth").val();
	var falg = 0; 
		$("input[name='isSelect1']:checkbox").each(function () { 
			if ($(this).attr("checked")) { 
			falg =1; 
			} 
			});
			if (falg > 0) {
		$("input[name='isSelect1']:checked").each(function() { // 遍历选中的checkbox
	           // var n = $(this).parents("#loadItem tr").index();  // 获取checkbox所在行的顺序
	            var ci_item_code=$(this).val();
	            	$.ajax({
						url:url,
						type:"post",
						data:{"ITEM_CODE":ci_item_code,"groupSn":groupSn,"dataAuth":dataAuth},
						success:function(data){
							if(null == data){return ;}
							var suc_Map=data.dataMap;
							//alert('${dataMap.suc_msg}');
							//listAx("submitForm");
							location.reload();
							$("#productSn").val();
							
						},
						error: function(msg){
							util.closeLoading();
							util.alert("error:"+msg);
		  				}
					});
        	 });
        	 }else
        	 utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
		}
		document.onkeyup = function (e){
var checkInputSnUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=f0702f12afbd41bd8f814c3404eae6b8";
        e = e || window.event;
        var keycode = e.keyCode;
        if (keycode == 13){
         //console.log(checkInputSnUrl);
          	 searchItem('formId1');
           $("#productSn").select();
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
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body style="overflow:hidden;">
   <div class="hd">
   			    	<div class="optn">
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
   </div>
  <div class="mod" style="hight:405px;">
	<div>
			<div class="bd" style="padding:0 20px;">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="iframeId" value="${iframeId}">
								<input type="hidden" name="dataId" value="${dataId}">
										
		<bu:set name="paraMapObj" value="${dataId}" formId="4e26051dfc65446098d440a56f1c41f8" type="edit" />
		
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
</div>
	<table class="basic-table" id="table1" name="table1">
	<input type="hidden" name="formIds" value="4e26051dfc65446098d440a56f1c41f8" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="4e26051dfc65446098d440a56f1c41f8" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c4c89176f8d54bddacf8a95be0526259'" />
		<s:set name="_$formId_1" value="'4e26051dfc65446098d440a56f1c41f8'" />
		<s:set name="_$type" value="'edit'" />
		<input type="hidden" name="temp_cig_sn" value="${paraMapObj.CIG_SN}"/>
		<tr>
			<td class="name" style="width:76px;"/><span class="dot">*</span><bu:uitn colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec"  colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" /></bu:td>
			<td class="name" style="width:76px;"/><span class="dot">*</span><bu:uitn colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="dec" colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" ><bu:ui colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" dataId="${dataId}" formIndex="1"  disabled="disabled" /></bu:td>
			
		
			<td class="name-six"/><span>物料料号</span></td>
			<td class="dec-self"><input type="text" id="productSn" name="productCode" class=" input isSubmit" placeholder="请输入物料料号，然后按Enter键"/></td>
		
		</tr>
	</table>
</form>
	<DIV id="content1">
<div class="mod-hd" style=" margin-bottom: 5px;">		
  <h3 class="tit"><dict:lang value="物料信息" /></h3>	
  <div class="extend-btn" style="float:right;margin-top:5px;">
<button type="button" href="javascript:void(0);" onclick="selectItem('${paraMapObj.CIG_SN}');" title="<dict:lang value="添加" />"><i class="ico ico-kl-new-add ico-small"></i></button>
<button type="button" href="javascript:void(0);" onclick="delItem('${paraMapObj.CIG_SN}');" title="<dict:lang value="删除" />"><i class="ico ico-sc-new-add ico-small"></i></button>
</div>
</div>  
<form id="submitForm" name="submitForm" action="" method="post"
					target="submitFrame">
	
<div class="panel datagrid datagrid-div1">
	<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="">
			<div class="datagrid-header">
				<div class="datagrid-header-inner head1" id="datagrid-header-inner">
				<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
						<td class="datagrid-cell" style="width:30px;"  ></td >
						<td class="datagrid-cell" style="width:30px;" ><input type="checkbox" id="allSelect" name="allSelect"/></td >
						<td class="datagrid-cell" style="width:135px;"  ><dict:lang value="物料料号" /></td >
						<td class="datagrid-cell" style="width:235px;"  ><dict:lang value="物料名称" /></td >
						<td class="datagrid-cell" style="width:185px;"  ><dict:lang value="物料规格" /></td >
						<td class="datagrid-cell"  style="width:185px;" ><dict:lang value="物料类型" /></td >
					</tr>
					</tbody>
	          </table>
	 </div>
</div>
								
							
	<div class="datagrid-body datagrid-div3 scroll1" id="datagrid-body" style="height:280px;">
			<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
					
					<tbody id="addLoadItem">
					
				
					</tbody>
	</table>
	</div>
	
</div>
</div>
</form>	
	</div>
		<div style="background-color: white;">
		     <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItem&formId=formId1&showLoading=0" />
		</div>				
			</div>
		
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			document.forms.editForm.submit();
			isQuery = true;
		}
		

		
		//页面刷新时查询物料组里面的物料
		function init(){
		var dataAuth = $("#deptLs_data_auth").val();
		var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=49fcae7110a74a918c7098db20942c90";
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadItemUrl,//+"&groupSn="+'${paraMapObj.CIG_SN}',
			    data:  { "groupSn" : '${paraMapObj.CIG_SN}',
			             "dataAuth" : dataAuth
			    },
				success: function(data){
						util.closeLoading();
							$("#addLoadItem").empty();
						
						if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
						
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null){ rccList[i].CI_ITEM_SPEC="";}
								
			 					if(rccList[i].CI_ITEM_TYPE!=null){
			 					
			 					if(rccList[i].CI_ITEM_TYPE==1){
			 					    	tempType="原料";
			 					}else if(rccList[i].CI_ITEM_TYPE==2){
			 					    	tempType="半成品";
			 					}else if(rccList[i].CI_ITEM_TYPE==3){
			 					    	tempType="成品";
			 					}else{
			 					     tempType="";
			 					}
			 					
			 					}else{
			 					    tempType="";
			 					} 
			 					
								$("#addLoadItem").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"'></tr>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width: 135px;'>"+rccList[i].CI_ITEM_CODE+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width: 235px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 185px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width: 185px;'>"+tempType+"</td>");
							}
							//setPopScroll('.scroll');
						
							
							
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
				
				
		
		
		$("#allSelect").click(function(){
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
        			$('#addLoadItem input:checkbox').parents("tr").css("background-color","#d3eafc")
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
        			$('#addLoadItem input:checkbox').parents("tr").css("background-color","")
    			}
			});
			
		}
		
		var paginationImpl = {};
		function SearchItem(paginationImpl,url){
		var dataAuth = $("#deptLs_data_auth").val();
		var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			var groupCode = $.trim($("#productSn").val());
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,//+"&groupCode="+groupCode+"&groupSn="+'${paraMapObj.CIG_SN}'+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    data:  {

            "groupCode" : groupCode,
            "groupSn" :'${paraMapObj.CIG_SN}',
            "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
            "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			"dataAuth":dataAuth		
            },
				success: function(data){
						util.closeLoading();
							$("#addLoadItem").empty();
							
						if(null == data){return ;}
						if(null != data.ajaxPage.dataList){
							var tempType;	
							var rccList = eval(data.ajaxPage.dataList);
						
							for(var i = 0;i < rccList.length; i++){
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].CI_ITEM_TYPE!=null){
			 					if(rccList[i].CI_ITEM_TYPE==1){
			 					    	tempType="原料";
			 					}else if(rccList[i].CI_ITEM_TYPE==2){
			 					    	tempType="半成品";
			 					}else if(rccList[i].CI_ITEM_TYPE==3){
			 					    	tempType="成品";
			 					}else{
			 					     tempType="";
			 					}
			 					}else{ 								
                                    tempType="";
                                }			 					
								$("#addLoadItem").append("<tr id='"+rccList[i].ROWNUM+"' name='"+rccList[i].ROWNUM+"' ></tr>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width: 30px;text-align: center;'>"+((currentPage - 1) * pageRecord + (i + 1))+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width: 30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+rccList[i].CI_ITEM_CODE+"'/></td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width: 135px;'>"+rccList[i].CI_ITEM_CODE+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width: 235px;'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 185px;'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								$("#addLoadItem tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width: 185px;'>"+tempType+"</td>");
							}
							
						
						}
						pageFun(data.ajaxPage,"formId1");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		}
		function editCal(){

var url = "${path}buss/bussModel_exeFunc.ms?funcMId=789e75b5cd6843348af5286254e6d7e7";

  document.forms.editForm.action = url;
  document.forms.editForm.submit();
}


function searchItem(paginationImpl){

        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=bc7d859fdb014b45b2a3f0c9ae669d02"; 
	SearchItem(paginationImpl,url);
}
</script>
<script type="text/javascript">
  function selectItem(itemGroupSn){
                  var type = $("#paraMapObj_CIG_TYPE").val();
  		var urlDetail = "buss/bussModel_exeFunc.ms?FUNC_CODE=F5321&funcMId=d882255ff2f7465392e6eb65f888907c&dataId=&formId=4e26051dfc65446098d440a56f1c41f8&groupSn="+itemGroupSn+"&type="+type;
        		showPopWinFp(urlDetail , 700, 552,null,"选择物料",'add_itemId');
  
     }
  </script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
   
  })
})(jQuery)</script>
<bu:script viewId="c4c89176f8d54bddacf8a95be0526259" />
<bu:submit viewId="c4c89176f8d54bddacf8a95be0526259" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
</body>

<%@ include file="/plf/common/pub_end.jsp"%>
