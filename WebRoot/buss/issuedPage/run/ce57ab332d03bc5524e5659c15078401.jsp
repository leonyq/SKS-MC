<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
   
	<!-- head里面 -->
	<script type="text/javascript">
	    	
	    $(function(){
	    	    
	    	   // _getUserEMP();
	    	    addOption();
	    	})
	    	function addOption(){
	    	    $("#itemGenre").prepend("<option value>--请选择--</option>");
	    	    $("#itemGenre").each(function(){
	    	        $(this).find("Option").eq("").prop("selected",true);
	    	    })
	    	}
	    		var wmsOption;
	    	function  _getUserEMP(){
	    	    var GetUserEmpUrl="${path}buss/bussModel_exeFunc.ms?funcMId=393b63d805924ab9ac9a24ab1933c5e0";
	    	    $.ajax({
	    	        type:"post",
	    	        dataType:"json",
	    	        url:GetUserEmpUrl,
	    	        data:"",
	    	        success:function(data){
	    	           wmsOption = "<option value=''>--请选择--</option>";
	    	            if(null==data){
	    	                return;
	    	            }
	    	            if(null!=data.dataList){
	    	                var list=eval(data.dataList);
	    	                for(var i=0;i<list.length;i++){
	    	                    
	    	                   wmsOption = wmsOption + "<option value='"+list[i].LOGIN_NAME+"'>"+list[i].LOGIN_NAME+"</option>";
	    	                }
	    	                
	    	            }
	    	            
	    	        }
	    	            
	    	            
	    	            
	    	        
	    	    });
	    	    
	    	}
	    	
		function addInfo(showId,backId){
			 $("#"+showId+",#"+backId).show();
		//	$("#"+showId).draggable();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			addItemTbody();
		
		}
		function hideDiv(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
		}
		function hideDiv1(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
		}
		var trCount=0;
		function addItemTbody(){
		       
		    var SerachDetail= "${path}buss/bussModel_exeFunc.ms?funcMId=8dc7f69bb6a14476b74cf1fd119a1471";
		        var url1 = SerachDetail;
		        
		    	util.showLoading("处理中...");
			    	
			$.ajax({
				type: "POST",
			    	dataType: "json",
			    	url:url1,
			    	data: "",
				success: function(data){
                    				
					$("#itemTbody").empty();
					util.closeLoading();
					
					if(null==data){
						
						return ;
						
					}
					if(null !=data.ajaxPage.dataList){
					
						var list = eval(data.ajaxPage.dataList);
						   
					    
						for(var i=0; i<list.length; i++){
						
							if(list[i].CI_ITEM_CODE ==null) list[i].CI_ITEM_CODE="";
							if(list[i].CI_ITEM_NAME ==null) list[i].CI_ITEM_NAME="";
							if(list[i].CI_ITEM_SPEC ==null) list[i].CI_ITEM_SPEC="";
							if(list[i].SUPPLIER_NAME ==null) list[i].SUPPLIER_NAME="";
							if(list[i].CI_ITEM_GENRE ==null) list[i].CI_ITEM_GENRE="";
							if(list[i].CI_MIN_PACK==null) list[i].CI_MIN_PACK="";
							$("#itemTbody").append("<tr id='tr1_"+i+"'></tr>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' id='"+(trCount+1)+"' name='isSelect2' value='"+list[i].ID+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:145px;text-align: center;'>"+list[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+(trCount+1)+"' value='"+list[i].CI_ITEM_CODE+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:145px;text-align: center;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+(trCount+1)+"' value='"+list[i].CI_ITEM_NAME+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:165px;text-align: center;' >"+list[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trCount+1)+"' value='"+list[i].CI_ITEM_SPEC+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:125px;text-align: center;' title='"+list[i].SUPPLIER_NAME+"'>"+list[i].SUPPLIER_NAME+"<input type='hidden' id='CI_MIN_PACK"+(trCount+1)+"' value='"+list[i].CI_MIN_PACK+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width: 125px;text-align: center;'>"+list[i].CI_ITEM_GENRE+"<input type='hidden' id='CI_ITEM_GENRE"+(trCount+1)+"' value='"+list[i].CI_ITEM_GENRE+"'/></td>");
						
							trCount++;
							
							
						}
						pageFun(data.ajaxPage,"formId1");
						var tableTrJs = $("#itemTbody tr");
						_tongLineColor(tableTrJs);
					    clickTr('datagrid-btable-ajax1234');
					    defTableWidthRewrite('1234');
					}
					
					
				},
				error:function(){
				    alert(1);
				}
			
			});
		    
		}

		
	</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body>
	<div class="edit" >
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div>
			   <div class="optn">
			         <button type="button" onclick="addDatile();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			         <button type="button" onclick="addInfo('addItem','backItem');"><i class="ico ico-kl"></i><dict:lang value="添加明细" /></button>
			         <button type="button" onclick="delInfos();"><i class="ico ico-sc"></i><dict:lang value="删除明细" /></button>
			         <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="465bfc3dfbec493d8bf3eab7cd53bef4" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="465bfc3dfbec493d8bf3eab7cd53bef4" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="formId" id="formId3" value="1234" />
	<input type="hidden" name="465bfc3dfbec493d8bf3eab7cd53bef4" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'9029e7ef007948d2811df6195358ca46'" />
		<s:set name="_$formId_1" value="'465bfc3dfbec493d8bf3eab7cd53bef4'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><bu:uitn   colNo="WIC_CTRL_EMP" formId="465bfc3dfbec493d8bf3eab7cd53bef4" /></td>
			<bu:td  id="_userName"  cssClass="dec-self" colNo="WIC_CTRL_EMP" formId="465bfc3dfbec493d8bf3eab7cd53bef4" ><bu:ui id="emp"  colNo="WIC_CTRL_EMP" onchange="_getUserName(this);" formId="465bfc3dfbec493d8bf3eab7cd53bef4" value="%{WIC_CTRL_EMP}" formIndex="1" /></bu:td>
			<td class="name-three" /><bu:uitn colNo="T3#NAME" formId="465bfc3dfbec493d8bf3eab7cd53bef4" /></td>
			<bu:td  cssClass="dec-self" colNo="T3#NAME" formId="465bfc3dfbec493d8bf3eab7cd53bef4" ><bu:ui id="_setUserName" colNo="T3#NAME" formId="465bfc3dfbec493d8bf3eab7cd53bef4" value="%{T3#NAME}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="465bfc3dfbec493d8bf3eab7cd53bef4" formIndex="1" />
				
			</div>

	
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
    
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
    	
	
	<div class="mod-hd">		
        
        </div>
        	<div class="mod" style="    height: 400px;">
			<div class="mod-bd" style="border-bottom: none;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head4"  id="datagrid-header-inner1">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
										</td>
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:200px;" ><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >										
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="标准包装数量" /></td >
										<td class="datagrid-cell" style="width:130px;"><dict:lang value="物料类别" /></td >														
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll4"   style="height:360px">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addItemInfo" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
	 	
        </div>
   		</form>
</div> 
	<div id="backItem" class="dialog-mask" style="z-index:1029px;"/></div>
	
		<div class="dialog dialog-s1" id="addItem" style="display:none;z-index:1030;margin-left:0px;left:10px;top:5px;width:780px;height:365px;" >
		 <div class="dialog-hd">
				 <h3 class="tit"><dict:lang value="物料明细"/></h3>
			 </div>	
			
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" style="width:100%;height:430px;">
					<div class="optn optn_div">
			        <button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="SearchDetailFun('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
			    	<td class="name" style="text-align:center;width:90px;" /><dict:lang value="物料料号"/></td>
					<td class="dec" style="text-align:left;"><input type="text" id="itemCode"   name="itemCode" class=" input isSubmit isaddSubmit"/></td>
					<td class="name" style="text-align:center;width:90px;" /><dict:lang value="物料名称"/></td>
					<td class="dec" style="text-align:left;"><input type="text" id="itemName"  name="itemName" class=" input isSubmit isaddSubmit"/></td>
			    	</tr>
			    	<tr>
					<td class="name" style="text-align:center;width:90px;"/><dict:lang value="物料规格"/></td>
					<td class="dec"><input type="text" id="itemSpce"  style="width:230px" name="itemSpce" class=" input isSubmit isaddSubmit"/></td>
					<td class="name" style="text-align:center;width:90px;"/><dict:lang value="物料类别"/></td>
					 <td class="dec"><dict:selectDict id="itemGenre" name="itemGenre" dictCode="CI_ITEM_GENRE" dictValue="%{userDto.CI_ITEM_GENRE}"  style="cursor: pointer;width:230px;" /></td>
			    		
				
			    	</tr>
			    	</table>
			    		<div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
    						<div class="datagrid-header" style="width:100%;">
    							<div class="datagrid-header-inner head3" style="width:100%;" id="datagrid-header-inner1">
    								<table  class="datagrid-htable fixedTable  " id="datagrid-htable1234" >
    									<tbody>
    									<tr class="datagrid-header-row datagrid-title-ajax">
    										<td style="width: 30px;text-align: center;"></td>
                						    <td style="width: 30px;text-align: center;"><input type="checkbox" id="item_list_cb"  onchange="getAllItem();" /></td>
                							<td style="width: 90px;text-align: center;"><dict:lang value="物料料号" /></td>
                							<td style="width: 90px;text-align: center;"><dict:lang value="物料名称" /></td>
                							<td style="width: 90px;text-align: center;"><dict:lang value="物料规格" /></td>
                							<td style="width: 90px;text-align: center;"><dict:lang value="供应商" /></td>
                							<td style="width: 90px;text-align: center;"><dict:lang value="物料类别"/></td>	
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll3"   style="height:250px;">
    							<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajax1234" >
    								<tbody id="itemTbody" >
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
				<div style="background-color: white;" id="pageDiv">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=SearchDetailFun&formId=formId1&showLoading=0" />
                                 </div>		
				</div>
				
        
	</div>

	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
    	<script type="text/javascript">
	
		function _getUserName(obj){
		
		    	
		    var getNameUrl= "${path}buss/bussModel_exeFunc.ms?funcMId=4914832d21fa411ea1d374e5a1e5bc9c";
			var numEmp = obj.value;
			var url2 = getNameUrl;
			$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: url2,
			    data:{
			        "LOGIN_NAME":numEmp,
			    },
			    //data:"LOGIN_NAME="+numEmp,
			    success:function(data){
			           console.log(data.ajaxList);
			        	if(null==data){
						
						return ;
						
					}
			        	if(null !=data.ajaxList){
			        	   
						var list = eval(data.ajaxList);	
					        
                                 
						    	for(var i=0;i<list.length;i++){
						    	     
						    	     $("#_setUserName").val(list[i].NAME);
						    	}
			        	   
			        	}
			    },
			    error:function(){
			        
			        alert("s");
			    }
			    
			});
		}
	
		var paginationImpl={};
		function  SearchDetailFun(paginationImpl,url){
		        //alert(paginationImpl);
		        //alert(url);
		    	util.showLoading("处理中...");
		    	var isFirstLoad = firstLoadThisPage(paginationImpl);
    			var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    			var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    			var itemCode = $("#itemCode").val();
    			var itemName = $("#itemName").val();
    			var itemSpce= $("#itemSpce").val();
    			var itemGenre= $("#itemGenre").val();
    		
			  var SearchDetailFunUrl= "${path}buss/bussModel_exeFunc.ms?funcMId=97e5c26e8a074e5eacd841831449d9bd";
			$.ajax({
				type: "POST",
			    	dataType: "json",
			    	url: SearchDetailFunUrl,
			    	data:{
			    	    "itemName":itemName,
			    	    "itemCode":itemCode,
			    	    "itemSpce":itemSpce,
			    	    "itemGenre":itemGenre,
			    	    "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	    "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    	},
			    	data: "itemName="+itemName+"&itemCode="+itemCode+"&itemSpce="+itemSpce+"&itemGenre="+itemGenre+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    	success:function(data){
			    	    
			    	    $("#itemTbody").empty();
			    	    
			    	    util.closeLoading();
						if(null==data){
						
						return ;
						
					}
					if(null !=data.ajaxPage.dataList){
					
						var list = eval(data.ajaxPage.dataList);
						   
					   
						for(var i=0; i<list.length; i++){
						
							if(list[i].CI_ITEM_CODE ==null) list[i].CI_ITEM_CODE="";
							if(list[i].CI_ITEM_NAME ==null) list[i].CI_ITEM_NAME="";
							if(list[i].CI_ITEM_SPEC ==null) list[i].CI_ITEM_SPEC="";
							if(list[i].SUPPLIER_NAME ==null) list[i].SUPPLIER_NAME="";
							if(list[i].CI_ITEM_GENRE ==null) list[i].CI_ITEM_GENRE="";
							if(list[i].CI_MIN_PACK ==null) list[i].CI_MIN_PACK="";
							$("#itemTbody").append("<tr id='tr1_"+((currentPage-1)*pageRecord+(i+1))+"'></tr>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' id='"+(trCount+1)+"' name='isSelect2' value='"+list[i].ID+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:145px;text-align: center;'>"+list[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE"+(trCount+1)+"' value='"+list[i].CI_ITEM_CODE+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:145px;text-align: center;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME"+(trCount+1)+"' value='"+list[i].CI_ITEM_NAME+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:165px;text-align: center;'>"+list[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trCount+1)+"' value='"+list[i].CI_ITEM_SPEC+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:125px;text-align: center;' title='"+list[i].SUPPLIER_NAME+"'>"+list[i].SUPPLIER_NAME+"<input type='hidden' id='CI_MIN_PACK"+(trCount+1)+"' value='"+list[i].CI_MIN_PACK+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width: 125px;text-align: center;'>"+list[i].CI_ITEM_GENRE+"<input type='hidden' id='CI_ITEM_GENRE"+(trCount+1)+"' value='"+list[i].CI_ITEM_GENRE+"'/></td>");
						
							trCount++;
							
							
							
						}
						pageFun(data.ajaxPage,"formId1");
						var tableTrJs = $("#itemTbody tr");
						_tongLineColor(tableTrJs);
					    clickTr('itemTbody');
					    defTableWidthRewrite('1234');
					}
			    	    
			    	    
			    	},
			    	error:function(msg){
			    	    util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			    	    
			    	}
            });
    	}
    	//选择点击的行				
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
    //全选明细
    function getAllItem(){
            		
        if($("#item_list_cb").attr("checked")=="checked"){
			$("#itemTbody :checkbox").attr("checked",true);
		}else{
			$("#itemTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
        
        
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
    //保存选择的物料
    var trrCount=0;
    
    //保存明细
    function addItemList(showId,backId){
    	var len = $("#addItemInfo tr").length;
    	$("#itemTbody :checkbox").each(function(){
    			if($(this).attr("checked")){
    				
    					$("#addItemInfo").append("<tr id='trr"+(trrCount+1)+"' ></tr>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"<input type='hidden' name='itemId' value=''/></td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+$("#CI_ITEM_CODE"+$(this).attr("id")).val()+"<input type='hidden' name='CI_ITEM_CODE' value='"+$("#CI_ITEM_CODE"+$(this).attr("id")).val()+"'/></td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: center;' title='"+$("#CI_ITEM_NAME"+$(this).attr("id")).val()+"'>"+$("#CI_ITEM_NAME"+$(this).attr("id")).val()+"</td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+$("#CI_ITEM_SPEC"+$(this).attr("id")).val()+"</td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:130px;text-align: center;'>"+$("#CI_MIN_PACK"+$(this).attr("id")).val()+"</td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;text-align: center;'>"+$("#CI_ITEM_GENRE"+$(this).attr("id")).val()+"<input type='hidden'  name='CI_ITEM_GENRE' value='"+$("#CI_ITEM_GENRE"+$(this).attr("id")).val()+"'/></td>");
    
    					len = len+1;
    					trrCount++;
    					
    					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
    					_tongLineColor(tableTrJs);
    					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
    					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
    				
    			}
    	})
    	$("#itemTbody").empty();
    	
    	hideDiv(showId,backId);
    	trCount=0;
    	$("#item_list_cb").attr("checked",false);
    }
    
    
    function delInfos(){
	$("#addItemInfo :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
		}
	});
	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
	var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
	_tongLineColor(tableTrJs);
	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');	
	defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
}

    //重新排序
    function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
    }
    
    function addDatile(){      
                    
                        
                        if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
                return ;
            }
                        var emp=$("#emp").val();
                        if(emp==""){
                             //utilsFp.confirmIcon(1,"","","", "%{getText("请选择人员")}",0,"260","");
                             utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择人员" />",0,"260","");
                           return;
                        }
                        var len = $("#addItemInfo tr").length;
                        if(len<=0){
                           //utilsFp.confirmIcon(1,"","","", "%{getText("请至少添加一条单据明细信息")}",0,"260","");
                            utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少添加一条单据明细信息" />",0,"260","");
                           return;
                        }
                        if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                        

                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=e1e7312708c647fd9d6c84d23dda0e19";
                        document.forms.addForm.submit();
                        
}
    
	</script>
    <script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
    <bu:submit viewId="9029e7ef007948d2811df6195358ca46" />
    <bu:script viewId="9029e7ef007948d2811df6195358ca46" />
    <script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll4','.head4');
     setPopScroll('.scroll3','.head3');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 
