<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    
    <script type="text/javascript">
            $(function(){
	    	    
	    	    
	    	    addOption();
	    	})
        	function addOption(){

	    	    $("#itemGenre").prepend("<option value>--请选择--</option>");
	    	    $("#itemGenre").each(function(){
	    	        $(this).find("Option").eq("").prop("selected",true);
	    	    })
	    	}
       
    </script>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>     
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>
			    	<div class="optn">
			    	       <button type="button" onclick="editDatile();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
	                        <button type="button" onclick="addInfo('addItem','backItem');"><i class="ico ico-kl"></i><dict:lang value="添加明细" /></button>
			                <button type="button" onclick="delInfo();"><i class="ico ico-cancel"></i><dict:lang value="删除明细" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					
			    </div>


			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="465bfc3dfbec493d8bf3eab7cd53bef4" type="edit" />
	<table class="basic-table" id="csstable">
	<input type="hidden" id="delIds" name="delIds" value="" />
	<input type="hidden" name="formIds" value="465bfc3dfbec493d8bf3eab7cd53bef4" />
	<input type="hidden" name="formId" id="formId3" value="1234" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="465bfc3dfbec493d8bf3eab7cd53bef4" value="paraMap1@" />
	<input type="hidden" name="WIC_CTRL_EMP" id="WIC_CTRL_EMP" value="${param.WIC_CTRL_EMP}" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'2c943cfe708b4f5cbe932282a1893ea2'" />
		<s:set name="_$formId_1" value="'465bfc3dfbec493d8bf3eab7cd53bef4'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-three" /><bu:uitn colNo="T3#NAME" formId="465bfc3dfbec493d8bf3eab7cd53bef4" /></td>
			<bu:td cssClass="dec-self" colNo="T3#NAME" formId="465bfc3dfbec493d8bf3eab7cd53bef4" ><bu:ui colNo="T3#NAME" id="_emps" formId="465bfc3dfbec493d8bf3eab7cd53bef4" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name-three" /><bu:uitn colNo="WIC_CTRL_EMP" formId="465bfc3dfbec493d8bf3eab7cd53bef4" /></td>
			
			<bu:td cssClass="dec-self" colNo="WIC_CTRL_EMP" formId="465bfc3dfbec493d8bf3eab7cd53bef4" ><input type="text" style="width:230px;" readonly="true" value=""; id="emp" name="WIC_CTRL_EMP" /></bu:td>
		</tr>

	</table>
			<bu:jsVal formId="465bfc3dfbec493d8bf3eab7cd53bef4" formIndex="1" />
									
			</div>
	
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<div class="mod-hd">		
        
        </div>
        	<div class="mod" style="height:400px;">
			<div class="mod-bd" style="border-bottom: none;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head4" style="width:100%;" id="datagrid-header-inner1">
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
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="物料类别" /></td >														
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll4" style="height:325px;"  >
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addItemInfo" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div style="background-color: white;" >
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=getItemInfo&formId=formId2&showLoading=0" />
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
				<div class="dialog-bd-div" style="width:100%;height:450px;">
					<div class="optn optn_div">
			        <button type="button" onclick="addItemList('addItem','backItem');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="SearchDetailFun('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table class="basic-table">
				 <tr>
			    		<td class="name" style="text-align:center;width:100px;"/><dict:lang value="物料料号"/></td>
					<td class="dec"><input type="text" id="itemCode"   name="itemCode" class=" input isSubmit isaddSubmit"/></td>
					<td class="name" style="text-align:center;width:100px;"/><dict:lang value="物料名称"/></td>
					<td class="dec"><input type="text" id="itemName"   name="itemName" class=" input isSubmit isaddSubmit"/></td>

			    	</tr>
			    	<tr>
					<td class="name" style="text-align:center;width:100px;"/><dict:lang value="物料规格"/></td>
					<td class="dec"><input type="text" id="itemSpce"   name="itemSpce" class=" input isSubmit isaddSubmit"/></td>			    	
			    		<td class="name" style="text-align:center;width:100px;"/><dict:lang value="物料类别"/></td>
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
                							<td style="width: 145px;text-align: center;"><dict:lang value="物料料号" /></td>
                							<td style="width: 145px;text-align: center;"><dict:lang value="物料名称" /></td>
                							<td style="width: 165px;text-align: center;"><dict:lang value="物料规格" /></td>
                							<td style="width: 125px;text-align: center;"><dict:lang value="供应商" /></td>
                							<td style="width: 125px;text-align: center;"><dict:lang value="物料类别"/></td>	
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll3"   style="height:250px;">
    							<table class="datagrid-btable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajax1234" >
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

	<!-- js初始化方法 -->
	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
    <bu:submit viewId="2c943cfe708b4f5cbe932282a1893ea2" />
    <bu:script viewId="2c943cfe708b4f5cbe932282a1893ea2" />
    <script type="text/javascript">
      $(function(){
            var ll="${dataList[0].LOGIN_NAME}";
           // var ll="${dataList[0].ID}";
           $("#paraMapObj_WIC_CTRL_EMP").val(ll); 
           $("#emp").val(ll);
           var ee = "${dataList[0].name}";
           $("#_emps").val(ee);
            _getBackfillMessage();
       });
       //添加明细表
        function addInfo(showId,backId){
			 $("#"+showId+",#"+backId).show();
				$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			
			addItemTbody();
		
	    }
	    //获取当前明细表中的所有物料代码
	    function getItemCodeList(){
	       //查询已有物料并添加到数组
		 var $tds = $("#addItemInfo").find("input[name='CI_ITEM_CODE']"); 
		 var itemCodeAttr = [];
    	 	$.each($tds,function(ele,i){
    		    itemCodeAttr.push($(this).val());
    		});
		    return itemCodeAttr+"";
	    }
        //关闭弹窗
		function hideDiv(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
		}
		//关闭弹窗
		function hideDiv1(showId,backId){
			$("#"+showId+",#"+backId).hide();
			closeDivFp(showId+"pop");
		}
		var trCount=0;
		function addItemTbody(){
		  var EMP="${dataList[0].LOGIN_NAME}"; 
		 
	        itemCodeStr = getItemCodeList();
		    var SearchDetail ="${path}buss/bussModel_exeFunc.ms?funcMId=966c122bc1cc4fa79b93d984ae73a050"; //VM-物料管控-修改 操作功能 加载明细信息
		        var url1 = SearchDetail;
		        
		    	util.showLoading("处理中...");
			    	
			$.ajax({
				type: "POST",
			    	dataType: "json",
			    	url:url1,
			    	data: {
    			    	"itemCodes":itemCodeStr
			    	    
			    	},
				success: function(data){
                    				
					$("#itemTbody").empty();
					util.closeLoading();
					
					if(null==data){
						
						return ;
						
					}
					if(null !=data.ajaxPage.dataList){
					
						var list = eval(data.ajaxPage.dataList);
						for(var i=0; i<list.length; i++){
						    var flag = false;
							if(list[i].CI_ITEM_CODE ==null) list[i].CI_ITEM_CODE="";
							if(list[i].CI_ITEM_NAME ==null) list[i].CI_ITEM_NAME="";
							if(list[i].CI_ITEM_SPEC ==null) list[i].CI_ITEM_SPEC="";
							if(list[i].SUPPLIER_NAME ==null) list[i].SUPPLIER_NAME="";
							if(list[i].CI_ITEM_GENRE ==null) list[i].CI_ITEM_GENRE="";
							if(list[i].CI_MIN_PACK ==null) list[i].CI_MIN_PACK="";
							$("#itemTbody").append("<tr id='tr1_"+i+"'></tr>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' id='"+list[i].ID+"' name='isSelect2' value='"+list[i].ID+"'/></td>");
							//$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:145px;text-align: center;'>"+list[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE_"+(trCount+1)+"'  value='"+list[i].CI_ITEM_CODE+"'/></td>");
							  $("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:145px;text-align: center;'>"+list[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE_"+list[i].ID+"' value='"+list[i].CI_ITEM_CODE+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:145px;text-align: center;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME_"+list[i].ID+"' value='"+list[i].CI_ITEM_NAME+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:165px;text-align: center;'title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC_"+list[i].ID+"' value='"+list[i].CI_ITEM_SPEC+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:125px;text-align: center;' title='"+list[i].SUPPLIER_NAME+"'>"+list[i].SUPPLIER_NAME+"<input type='hidden' id='CI_MIN_PACK_"+list[i].ID+"' value='"+list[i].CI_MIN_PACK+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:125px;text-align: center;'>"+list[i].CI_ITEM_GENRE+"<input type='hidden' id='CI_ITEM_GENRE_"+list[i].ID+"' value='"+list[i].CI_ITEM_GENRE+"'/></td>");
						
							trCount++;
							
							
							
						}
						pageFun(data.ajaxPage,"formId1");
						var tableTrJs = $("#itemTbody tr");
						_tongLineColor(tableTrJs);
					   clickTr('itemTbody');
					   defTableWidthRewrite('1234');
					}
					
					
				},
				error:function(){
				    alert(1);
				}
			
			});
		    
		}
		/*
		//加载信息
	    var	trrCount=0;
       function _getBackfillMessage(){
            		
           var WIC_CTRL_EMP="${dataList[0].LOGIN_NAME}";
           var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=7bc05b84ad4b485cb9684adf8efffa64";
           $.ajax({
               type:"post",
               dataType: "json",
			    url: itemUrl,
			    data: {"WIC_CTRL_EMP":WIC_CTRL_EMP},
              	success:function(data){
              	 
                   $("#addItemInfo").empty();
                   if(null==data){
                       
                       return ;
                   }
                   var htmp;         
                   if(null!=data.ajaxPage.dataList){
                       var list=eval(data.ajaxPage.dataList);
                        console.log(list);
                       for(var i=0;i<list.length;i++){
                            
                           if(list[i].CI_ITEM_NAME==null)list[i].CI_ITEM_NAME="";
                           if(list[i].CI_ITEM_SPEC==null)list[i].CI_ITEM_SPEC="";
                           if(list[i].CI_ITEM_GENRE==null)list[i].CI_ITEM_GENRE="";
                           if(list[i].CI_MIN_PACK==null)list[i].CI_MIN_PACK="";
                           if(list[i].CI_ITEM_CODE==null)list[i].CI_ITEM_CODE="";
                         
							
							
								var temps="<tr id='trr"+(trrCount+1)+"' >"
								         +"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>"
								         +"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+list[i].ID+"' type='checkbox' name='isSelect1' value='"+list[i].ID+"'/></td>"
								         +"<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+list[i].CI_ITEM_CODE+"<input type='hidden' name='CI_ITEM_CODE' id='CI_ITEM_CODE"+(trrCount+1)+"' value='"+list[i].CI_ITEM_CODE+"'/></td>"
								         +"<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: center;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"<input type='hidden' name='itemId' value='"+list[i].ID+"'/></td>"
								         +"<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trrCount+1)+"' value='"+list[i].CI_ITEM_SPEC+"'/></td>"
								         +"<td class='datagrid-cell datagrid-cell-6' style='width:130px;text-align: center;'>"+list[i].CI_MIN_PACK+"<input type='hidden' id='CI_MIN_PACK"+(trrCount+1)+"' value='"+list[i].CI_MIN_PACK+"'/></td>"
								         +"<td class='datagrid-cell datagrid-cell-7' style='width:130px;text-align: center;'>"+list[i].CI_ITEM_GENRE+"<input type='hidden' id='CI_ITEM_GENRE"+(trrCount+1)+"' value='"+list[i].CI_ITEM_GENRE+"'/></td>"
							    htmp+=temps;
							
							trrCount++;
                       }
                    
                       $("#addItemInfo").append(htmp);
                       	pageFun(data.ajaxPage,"formId2");
						var tableTrJs = $("#addItemInfo tr");
						_tongLineColor(tableTrJs);
					    clickTr('addItemInfo');
					    defTableWidthRewrite('831b2dbf0dfb494695b7ce66538a1234');
                   
                   }
               }
               
               
           });
           
       }
       */
       //加载信息
	    var	trrCount=0;
       function _getBackfillMessage(){
            		
          //var WIC_CTRL_EMP="${dataList[0].LOGIN_NAME}";
           var WIC_CTRL_EMP=$("#WIC_CTRL_EMP").val();
           console.log(WIC_CTRL_EMP);
           var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=7bc05b84ad4b485cb9684adf8efffa64";//VM-物料管控-修改 操作功能 回填入库信息
           $.ajax({
               type:"post",
               dataType: "json",
			    url: itemUrl,
			    data: {"WIC_CTRL_EMP":WIC_CTRL_EMP},
			    //data: {"WIC_CTRL_EMP":WIC_CTRL_EMP},
              	success:function(data){
              	  
                   $("#addItemInfo").empty();
                   if(null==data){
                       
                       return ;
                   }
                   if(null!= data.ajaxList){
                       var list=eval(data.ajaxList);
                      
                       for(var i=0;i<data.ajaxList.length;i++){
                            
                           if(list[i].CI_ITEM_NAME==null)list[i].CI_ITEM_NAME="";
                           if(list[i].CI_ITEM_SPEC==null)list[i].CI_ITEM_SPEC="";
                           if(list[i].CI_ITEM_GENRE==null)list[i].CI_ITEM_GENRE="";
                           if(list[i].CI_MIN_PACK==null)list[i].CI_MIN_PACK="";
                           if(list[i].CI_ITEM_CODE==null)list[i].CI_ITEM_CODE="";
                           
                            $("#addItemInfo ").append("<tr id='trr"+list[i].ID+"' ></tr>");
							$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+list[i].IDS+"' type='checkbox' name='isSelect1' value='"+list[i].IDS+"'/></td>");
							$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+list[i].CI_ITEM_CODE+"<input type='hidden' name='CI_ITEM_CODE' id='CI_ITEM_CODE"+(trrCount+1)+"' value='"+list[i].CI_ITEM_CODE+"'/></td>");
							$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: center;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"<input type='hidden' name='itemId' value='"+list[i].ID+"'/></td>");
							$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trrCount+1)+"' value='"+list[i].CI_ITEM_SPEC+"'/></td>");
							$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:130px;text-align: center;'>"+list[i].CI_MIN_PACK+"<input type='hidden' id='CI_MIN_PACK"+(trrCount+1)+"' value='"+list[i].CI_MIN_PACK+"'/></td>");
							$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;text-align: center;'>"+list[i].CI_ITEM_GENRE+"<input type='hidden' id='CI_ITEM_GENRE"+(trrCount+1)+"' value='"+list[i].CI_ITEM_GENRE+"'/></td>");
							
							trrCount++;
                       }
                       
                       var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
						_tongLineColor(tableTrJs);
                       clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
                       defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
                   }
               }
               
               
           });
           
       }
       
       
        	var paginationImpl={};
       function getItemInfo(paginationImpl,url){
           	util.showLoading("处理中...");
		    var isFirstLoad = firstLoadThisPage(paginationImpl);
    		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord; 		
           //var WIC_CTRL_EMP="${dataList[0].LOGIN_NAME}";
           var WIC_CTRL_EMP=$("#WIC_CTRL_EMP").val();
           var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=7bc05b84ad4b485cb9684adf8efffa64";//VM-物料管控-修改 操作功能 回填入库信息
           $.ajax({
               type:"post",
               dataType: "json",
			    url: itemUrl,
			    data: {
			    "WIC_CTRL_EMP":WIC_CTRL_EMP,
			    "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord   
			        
			    },
              	success:function(data){
              	  util.closeLoading();
                   $("#addItemInfo").empty();
                   if(null==data){
                       
                       return ;
                   }
                   var htmp;         
                   if(null!= data.ajaxPage.dataList){
                       var list=eval(data.ajaxPage.dataList);
                       
                       for(var i=0;i<data.ajaxList.length;i++){
                            
                           if(list[i].CI_ITEM_NAME==null)list[i].CI_ITEM_NAME="";
                           if(list[i].CI_ITEM_SPEC==null)list[i].CI_ITEM_SPEC="";
                           if(list[i].CI_ITEM_GENRE==null)list[i].CI_ITEM_GENRE="";
                           if(list[i].CI_MIN_PACK==null)list[i].CI_MIN_PACK="";
                           if(list[i].CI_ITEM_CODE==null)list[i].CI_ITEM_CODE="";
                         
							
							
								var temps="<tr id='trr"+list[i].ID+"' >"
								         +"<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>"
								         +"<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+list[i].IDS+"' type='checkbox' name='isSelect1' value='"+list[i].IDS+"'/></td>"
								         +"<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+list[i].CI_ITEM_CODE+"<input type='hidden' name='CI_ITEM_CODE' id='CI_ITEM_CODE"+(trrCount+1)+"' value='"+list[i].CI_ITEM_CODE+"'/></td>"
								         +"<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: center;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"<input type='hidden' name='itemId' value='"+list[i].ID+"'/></td>"
								         +"<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC"+(trrCount+1)+"' value='"+list[i].CI_ITEM_SPEC+"'/></td>"
								         +"<td class='datagrid-cell datagrid-cell-6' style='width:130px;text-align: center;'>"+list[i].CI_MIN_PACK+"<input type='hidden' id='CI_MIN_PACK"+(trrCount+1)+"' value='"+list[i].CI_MIN_PACK+"'/></td>"
								         +"<td class='datagrid-cell datagrid-cell-7' style='width:130px;text-align: center;'>"+list[i].CI_ITEM_GENRE+"<input type='hidden' id='CI_ITEM_GENRE"+(trrCount+1)+"' value='"+list[i].CI_ITEM_GENRE+"'/></td>"
							    htmp+=temps;
							
							trrCount++;
                       }
                    
                       $("#addItemInfo").append(htmp);
                       	pageFun(data.ajaxPage,"formId2");
						var tableTrJs = $("#addItemInfo tr");
						_tongLineColor(tableTrJs);
					    clickTr('addItemInfo');
					    defTableWidthRewrite('831b2dbf0dfb494695b7ce66538a1234');
                   
                   }
               }
               
               
           });
           
       }
        //查询分页
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
    		    var EMP="${dataList[0].LOGIN_NAME}";
    		    var itemCodeStr = getItemCodeList();
			var GetBackfillPage="${path}buss/bussModel_exeFunc.ms?funcMId=bf2b1ab3cb774e778c057e4c11d6ba4d";//VM-物料管控-修改 操作功能 查询明细信息
			$.ajax({
				type: "POST",
			    	dataType: "json",
			    	url: GetBackfillPage,
			    	data:{
			    	    "itemName":itemName,
			    	    "itemCode":itemCode,
			    	    "itemSpce":itemSpce,
			    	    "itemGenre":itemGenre,	
                        "EMP":EMP,
			    	    "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	    "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    	    "itemCodes": itemCodeStr
			    	},
			    	//data: "itemName="+itemName+"&itemCode="+itemCode+"&itemSpce="+itemSpce+"&itemGenre="+itemGenre+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
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
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' id='"+list[i].ID+"' name='isSelect2' value='"+list[i].ID+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:145px;text-align: center;'>"+list[i].CI_ITEM_CODE+"<input type='hidden' id='CI_ITEM_CODE_"+list[i].ID+"' value='"+list[i].CI_ITEM_CODE+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:145px;text-align: center;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"<input type='hidden' id='CI_ITEM_NAME_"+list[i].ID+"' value='"+list[i].CI_ITEM_NAME+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:165px;text-align: center;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"<input type='hidden' id='CI_ITEM_SPEC_"+list[i].ID+"' value='"+list[i].CI_ITEM_SPEC+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:125px;text-align: center;' title='"+list[i].SUPPLIER_NAME+"'>"+list[i].SUPPLIER_NAME+"<input type='hidden' id='CI_MIN_PACK_"+list[i].ID+"' value='"+list[i].CI_MIN_PACK+"'/></td>");
							$("#itemTbody tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:125px;text-align: center;'>"+list[i].CI_ITEM_GENRE+"<input type='hidden' id='CI_ITEM_GENRE_"+list[i].ID+"' value='"+list[i].CI_ITEM_GENRE+"'/></td>");
						
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
    /*
    //保存明细
    function addItemList(showId,backId){
    	var len = $("#addItemInfo tr").length;
    	var codes;
    	 var WIC_CTRL_EMP="${dataList[0].LOGIN_NAME}";
    	var url="${path}buss/bussModel_exeFunc.ms?funcMId=4d681ca5eda64bd4b04da3945211dc34";
    	$("#itemTbody :checkbox").each(function(i){
    			if($(this).attr("checked")){
    				if(i==0){
    				    codes=$("#CI_ITEM_CODE_"+$(this).attr("id")).val();
    				}else{
    				    codes=codes+","+$("#CI_ITEM_CODE_"+$(this).attr("id")).val();
    				}
    			}
    	})
    	$.ajax({
    	   type:"post",
    	   dataType:"json",
    	   url:url,
    	   data:{
    	       "CI_ITEM_CODE":codes,
    	       "WIC_CTRL_EMP":WIC_CTRL_EMP
    	   },
    	   success:function(data){
    	        if(null == data){return;}
			    if(null != data){
			    
					if(data.ajaxMap.returnMsg=="addSucc"){	
                        
						msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
					        $("#itemTbody").empty();
						     hideDiv('addItem','backItem');
						    _getBackfillMessage();
					}
					if(data.ajaxMap.returnMsg=="addError"){
						utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
						return;
					}
			
			    }
    	   },
    	   error:function(msg){
    	       
    	   }
    	})
    	
    
    	/*
    	$("#itemTbody").empty();
    	
    	hideDiv(showId,backId);
    	trCount=0;
    	$("#item_list_cb").attr("checked",false);
    	*/
   //    }
   
   
   
   
   //保存明细
    function addItemList(showId,backId){
    	var len = $("#addItemInfo tr").length;
    	$("#itemTbody :checkbox").each(function(){
    			if($(this).attr("checked")){
    			     console.log("1==>",$(this).attr("id"));
			        console.log("2==>",$("#trr"+$(this).attr("id")).length);
    				 if (!$("#trr"+$(this).attr("id")).length) {  
    					$("#addItemInfo").append("<tr id='trr"+$(this).attr("id")+"' ></tr>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"<input type='hidden' name='itemId' value=''/></td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' id='"+$(this).attr("id")+" name='isSelect1'/></td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;'>"+$("#CI_ITEM_CODE_"+$(this).attr("id")).val()+"<input type='hidden' name='CI_ITEM_CODE' value='"+$("#CI_ITEM_CODE_"+$(this).attr("id")).val()+"'/></td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: center;' title='"+$("#CI_ITEM_NAME_"+$(this).attr("id")).val()+"'>"+$("#CI_ITEM_NAME_"+$(this).attr("id")).val()+"</td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+$("#CI_ITEM_SPEC_"+$(this).attr("id")).val()+"'>"+$("#CI_ITEM_SPEC_"+$(this).attr("id")).val()+"</td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:130px;text-align: center;'>"+$("#CI_MIN_PACK_"+$(this).attr("id")).val()+"</td>");
    					$("#addItemInfo tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:130px;text-align: center;'>"+$("#CI_ITEM_GENRE_"+$(this).attr("id")).val()+"<input type='hidden'  name='CI_ITEM_GENRE' value='"+$("#CI_ITEM_GENRE_"+$(this).attr("id")).val()+"'/></td>");
    
    					len = len+1;
    					trrCount++;
    					
    					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
    					_tongLineColor(tableTrJs);
    					clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
    					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
    				}
    			}
    	})
    	$("#itemTbody").empty();
    	
    	hideDiv(showId,backId);
    	trCount=0;
    	$("#item_list_cb").attr("checked",false);
    }
   
   
   
   

    //删除明细
    
    function delInfo(){
        var falg =0;
        var delId;
        $('input[name="isSelect1"]:checkbox').each(function () { 
		    if ($(this).attr("checked")) { 
		    	falg =1; 
		    	return false;
	    	} 
	    });
	    if(falg==1){
		    $('input[name="isSelect1"]:checked').each(function(i){
    			if(i==0){
    			   
        			delId = $(this).val();
        			
    			}else{
        			delId = delId + "," +$(this).val();
    			} 
		    });
	    }else{
		    utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return;
	    }
	    $("#delIds").val(delId);
	    
    	$("#addItemInfo :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
	    	}
	    });
	    console.log("delId===>",delId);
    	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
	    var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
	    _tongLineColor(tableTrJs);
    	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
    	defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
    }
    /*
     function delInfo(){
        var falg =0;
        var delId;
        $('input[name="isSelect1"]:checkbox').each(function () { 
		    if ($(this).attr("checked")) { 
		    	falg =1; 
		    	return false;
	    	} 
	    });
	    if(falg==1){
		    $('input[name="isSelect1"]:checked').each(function(i){
    			if(i==0){
    			   
        			delId = $(this).val();
        			
    			}else{
        			delId = delId + "," +$(this).val();
    			} 
		    });
	    }else{
		    utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return;
	    }
	    $("#delIds").val(delId);
	    var WIC_CTRL_EMP="${dataList[0].LOGIN_NAME}";
    	var url="${path}buss/bussModel_exeFunc.ms?funcMId=f569d17ea44e4d0a9cb0ac500a887761";
	    
	    $.ajax({
    	   type:"post",
    	   dataType:"json",
    	   url:url,
    	   data:{
    	       "delId":delId,
    	       "WIC_CTRL_EMP":WIC_CTRL_EMP
    	   },
    	   success:function(data){
    	        if(null == data){return;}
			    if(null != data){
			    
					if(data.ajaxMap.returnMsg=="addSucc"){	
                        
						msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
					        $("#itemTbody").empty();
						     hideDiv('addItem','backItem');
						    _getBackfillMessage();
					}
					if(data.ajaxMap.returnMsg=="addError"){
						utilsFp.confirmIcon(3,"","","", "<dict:lang value="操作失败" />",0,"260","");
						return;
					}
			
			    }
    	   },
    	   error:function(msg){
    	       
    	   }
    	})
    	*/
	    
	    
	    
	    
	    
	    /*
    	$("#addItemInfo :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
	    	}
	    });
	    */
    /*	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
	    var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
	    _tongLineColor(tableTrJs);
    	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
    	defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
    }*/
    //全选
    function getAllItems(){
        if($("#allSelects").attr("checked")=="checked"){
			$("#addItemInfo :checkbox").attr("checked",true);
		}else{
			$("#addItemInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
        
        
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
    //重新排序
    function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
    }
    function editDatile(){
                      
                        
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
                         var emp=$("#paraMapObj_WIC_CTRL_EMP").val();
                          
                          
                        var len = $("#addItemInfo tr").length;
                        if(len<=0){
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少添加一条物料信息" />",0,"260","");
                           return;
                        }
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=54d356ade4474a169b221fba86707161";
  document.forms.editForm.submit();
}
    
    
    
    </script>

<script>(function($){
  $(window).on('load',function(){
   setPopScroll('.scroll4','.head4');
     setPopScroll('.scroll3','.head3');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 
