<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>

	<!-- head里面 -->
	
	<!-- 产品静态资源 -->

	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" enctype="multipart/form-data"  action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                
			    <div class="optn">
			        <button type="button" onclick="btImport();"><i class="ico ico-lead"></i><dict:lang value="导入" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:441px">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="465bfc3dfbec493d8bf3eab7cd53bef4" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="465bfc3dfbec493d8bf3eab7cd53bef4" />
	<input type="hidden" name="465bfc3dfbec493d8bf3eab7cd53bef4" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'749fa929404d4e6b97eb4e7c06cc61d0'" />
		<s:set name="_$formId_1" value="'465bfc3dfbec493d8bf3eab7cd53bef4'" />
		<s:set name="_$type" value="'add'" />
		

					<tr>
						<td class="name">选择文件</td>

						<td class="dec-self" colspan="2">
						
						<input type="file" name="upFile" id="upFile" accept=".xlsx" style="width:180px"><dict:lang value="(只支持导入1000条数据)" />
						
						
						</td>
						<td class="dec-self"><a href="javascript:void(0)" onclick="downTemplate();"><font color="blue"><dict:lang value="库管员物料管控导入模板" /></font></a>
						</td>
					</tr>
					
	</table>
<!--导出结果表格-->

						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="" >
								<table  class=" fixedTable  " id="resImport" style="width:100%;">
									<tbody>
									<tr class="thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" style="width:100px;"><dict:lang value="员工号" /></td >
										<td class="datagrid-cell" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:100px;"><dict:lang value="状态" /></td >
										<td class="datagrid-cell" ><dict:lang value="描述" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:360px;">
							<table class=" dlist-table table-line " style="width:100%;table-layout: fixed;height: calc(100% - 136px);"  id="itemDetail" >
								<tbody id="addResImport" >
								</tbody>
							</table>
						</div>
						
					</div>
				
				    <div style="background-color: white;margin-top:0px;" id="" >
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId2&showLoading=0" />
                    </div>
                  </div>               		
			</div><!---->

			<bu:jsVal formId="465bfc3dfbec493d8bf3eab7cd53bef4" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	 <form id="dowm_form" name="downForm" action="${path}sys/UserAction_downTemplate.ms" method="post">
       <input type="hidden" name="paraMap.fileName" value="<dict:lang value="库管员物料管控导入模板" />.xlsx">
       <input type="hidden" name="paraMap.filePath" value="plf/template/SuppliesControlS.xlsx">
     </form>
	</div>
	
	
	
	
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	
	
<script type="text/javascript">	

    	function downTemplate(){
		document.forms.dowm_form.submit();
		thisObj.onclick = function(){utilsFp.confirmIcon(1,"","","","<dict:lang value="模板正在下载中..." />",0,"300","");};
	}
	
	function btImport(){
	util.showLoading("处理中...");
	
    var oInput = document.getElementById("upFile").files[0];
    if(oInput==null){
     util.closeLoading();
     utilsFp.confirmIcon(3,"","","", "未选择任何文件",0,"300","");
        return;
    }
    /*
    var depName= document.getElementById("deptLs_data_auth").value;
    	if(depName==""){
    	util.closeLoading();
    	utilsFp.confirmIcon(3,"","","", "未选择组织机构",0,"300","");
        return;
    	}
    	*/
	var statusStr;

var createTables = "${path}buss/bussModel_exeFunc.ms?funcMId=0c27be6f14fd429391b4a581663dd8be";//VM-物料管控-导入 操作功能 导入
    	 var formData = new FormData();
        formData.append("upFile", document.getElementById("upFile").files[0]); 
       // formData.append("dep", document.getElementById("deptLs_data_auth").value);
            
    $.ajax({
        type:"POST",
        dataType:"json",
        url:createTables,
        contentType: false,
        processData: false,
        data:formData,
        success:function(data){
        util.closeLoading();
    	    	            if(data.ajaxString=="empty"){
    	    	                $("#addResImport").empty();
    	    	                utilsFp.confirmIcon(3,"","","", "导入格式错误,请按照模板导入。",0,"300","");
    	    	                return;
    	    	            }
                             if(data.ajaxString=="fail"){	
                                $("#addResImport").empty();
    	    	                utilsFp.confirmIcon(3,"","","", "导入文档不允许为空数据。",0,"300","");
    	    	                return;
    	    	            }
    	    	            if(data.ajaxString=="out"){	
                                $("#addResImport").empty();
    	    	                utilsFp.confirmIcon(3,"","","", "导入数据不允许超过1000行。",0,"300","");
    	    	                return;
    	    	            }
    	    	                $("#addResImport").empty();
    	    	                if(null==data){
    	    	                    return;
    	    	                }
    	    	                if(null!=data.ajaxPage.dataList)
    	    	                    var list = eval(data.ajaxPage.dataList);
    	    	                    
    	    	      for(var i=0;i<list.length;i++){
    	    	          if(list[i].userName==null) list[i].userName="";
                           if(list[i].itemNo==null) list[i].itemNo="";
                           if(list[i].des==null) list[i].des="";
                           if(list[i].status!="fail") {
                           statusStr="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px;border-radius:2px;'><dict:lang value="成功" /></td ></span>";
                           }else{
                           statusStr="<span class='state' style='background-color:red;color:#FFFFFF;width:45px;border-radius:2px;'><dict:lang value="失败" /></span>";
                           }
                           
                            $("#addResImport ").append("<tr  ></tr>");
							$("#addResImport tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#addResImport tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='text-align: center;width:100px;' title='"+list[i].userName+"'>"+list[i].userName+"</td>");
							$("#addResImport tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;width:263px;' title='"+list[i].itemNo+"'>"+list[i].itemNo+"</td>");
							$("#addResImport tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: center;width:100px;' title='"+list[i].des+"'>"+statusStr+"</td>");
							$("#addResImport tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;' >"+list[i].des+"</td>");
                       }
                       pageFun(data.ajaxPage,"formId2");
                       var tableTrJs = $("#itemDetail tbody tr");
						_tongLineColor(tableTrJs);
                      
    	    	           utilsFp.confirmIcon(2,"","","", "导入成功。",0,"300","");             
    	    	                   
    	    	            },
        error:function(msg){
           util.closeLoading();
           utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
    });
    
/** 
var obj = document.getElementById('upFile') ;  
obj.outerHTML=obj.outerHTML;  

   document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=0c27be6f14fd429391b4a581663dd8be";
	document.forms.addForm.submit();*/
	};
	

</script>
	<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<!-- 页面结束 -->

