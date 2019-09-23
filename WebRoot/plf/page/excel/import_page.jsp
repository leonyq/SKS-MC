<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	<script type = "text/javascript" 
	src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	<script type="text/javascript" 
	src="${path}plf/page/js_files/excel/import_page.js?_mc_res_version=<%=PlfStaticRes.IMPORT_PAGE_JS %>"></script>
 
  <style>
            .main{
                margin-top:10px;
            }            			
            
	    	.main table {
	    	    width:100%;
	    	    table-layout:fixed;
	    	}
	    	
	    	.main table tr{
	    	    height:30px;
	    	}
	    	
	    	.main table td{
	    	    border:1px solid #dbe1ef;
	    	    box-sizing:border-box;
	    	    text-align:center;
	    	}
	    	
	    	.main .scroll{
	    	    height:230px;
	    	    overflow:auto;
	    	}
	    	
	    	.main .scroll table tr:nth-of-type(1) td{
	    	    border-top:0;
	    	}
	    	
	    	.main .scroll table tr:nth-of-type(2n){
	    	    	background-color:#f0f4fd;
	    	}
	    	
	    	
	    	.main .scroll table select{
	    	    width:100%;
	    	    height:100%;
	    	    outline:none;
	    	    border:0;
	    	    background-color:transparent;
	    	}
	    	
	    	.foot{
	    	    margin-top:10px;
	    	}
	    	
	    	.foot span{
	    	    font-size:16px;
	    	    font-weight:bold;
	    	    color:#f00;
	    	}
	    	
	    	.button{
	    	    display:inline-block;
	    	    height:25px;
	    	    width:60px;
	    	    background-color:#74c3fe;
	    	    color:#fff;
	    	    text-align:center;
	    	    cursor:pointer;
	    	}
	    	
	    	.optn button.disabled:hover {
			    background-color: #fff;
			    color: #666;
			    border: 1px solid #dbdbdb;
			    cursor:not-allowed;
			    
			}
			
			.optn .disabled:hover .ico-lead{
				background-image: url(${path}plf/page/fp/img/ico-lead.png) ;
			}
  </style>
	<!-- head里面 -->
</head>
<body>
	<div class="edit">
		<%-- <form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame"> --%>
					
            <div class="hd">
            	
                 <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <%--<div style="margin-left:10px;">
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
               
  --%><iframe id="ifrExcel" name="ifrExcel"  style="display: none;"></iframe>
  <input type="hidden" id="infoFileNotEmptt" value='<dict:lang value="文件上传不能为空!" />'/>
  <input type="hidden" id="infoExtErr" value='<dict:lang value="目前只支持xlsx、xls文件上传!" />'/>
  		
  
  <input type="hidden" id="infoImportAttrList" value='<dict:lang value="导入所需要的字段" />'/>
 

<!--  <input type="file" id="fileUp" name="upFile" accept=".xlsx,.xls" /> -->
		<!--  <input type="button" value="上传" onclick="getUpFile()"/> -->
		<!--  <input type="button" value="导入" onclick="importExcel()"/> -->

 <!-- </form> -->
                

			    <div class="optn" id="opbut">
			        <button type="button" id="importBtn" class="disabled" disabled="disabled" onclick="importExcel()"><i class="ico ico-lead"></i><dict:lang value="开始导入" /></button>
			        <button type="button" onclick="saveExcelModel()"><i class="ico ico-save"></i><dict:lang value="保存模板" /></button>
			        <button type="button" onclick="window.location.href='${path}sys/excel/ExcelAction_downloadExcelModel.ms?exeid=<%=CommMethodMc.escapeJs( request.getParameter("exeid")) %>'"><i class="ico ico-save"></i><dict:lang value="下载模板" /></button>
			    </div>
			   
			</div>
			
			<div class="bd"	style="height:500px;">
			 <form id="myfrm" name="myfrm" target="ifrExcel" enctype="multipart/form-data" method="post" action="${path}sys/excel/ExcelAction_ImportSaveFile.ms">
			    <div style="height:30px;">
			        <!-- <p style="float:left;">默认值：<span>男</span>&#x3000;值映射：<span>男：0；女：1</span></p>	 -->	
			        <!--  
			        <span title="当类全路径不为空时，开始导入执行该类中的指定方法">类全路径名:</span>
			        <input class="input" type="text" style="width: 200px" id="className" title="当类全路径不为空时，开始导入执行该类中的指定方法">.customImport
                    -->
                    
                    <!--  //多组织机构数据权限改造lth
                    <span class="dot">*</span>组织机构
                    <s:if test="${fn:length(deptLs)==1}">
                 		<s:select list="deptLs" listKey="id" listValue="name"  name="dept_auth"
						id="dept_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                 	</s:if>
                 	
                 	<s:else>
              			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
						listKey="id" listValue="name"  name="dept_auth" id="dept_auth"
						cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
   					</s:else>
   					-->
			   			
			   	    <!--  	
                    <s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
					listKey="id" listValue="name"  id="dept_auth" name="dept_auth" 
					cssStyle="width: 200px;" cssClass="dept_select"/> 
					-->
					
                    <label style="float:right;">
                        <span><dict:lang value="请选择文件"/>...</span>
                        <span class="button" ><dict:lang value="上传"/></span>
                        <input type="file"  style="display:none;" id="fileUp" name="upFile" accept=".xlsx,.xls" >
                    </label>
                    <div id="tempDiv">
                    	
                    </div>
			    </div>
	    	</form>
				<div class="main">
				    <table style="background-color:#e6eaf4;">
				        <tr>
				            <td><dict:lang value="电子表格字段" /> </td>
						        <td><dict:lang value="数据库表字段" /> </td>
						        <td style="width:60px"><dict:lang value="必填项" /> </td>
						        <td style="width:40px"><dict:lang value="主键" /></td>
						        <td><dict:lang value="默认值" /></td>
						        <td><dict:lang value="值映射" /></td>
						        <td><dict:lang value="对照表" /></td>
						        <td><dict:lang value="对照字段" /></td>
						        <td><dict:lang value="取值字段" /></td>
				        </tr>
				    </table>
				    <div class="scroll">
				    <form id="dataForm" action="${path }sys/excel/ExcelAction_saveExcelModel.ms" method="post">
				    	 <input type="hidden" value="${path }sys/excel/ExcelAction_valiExcelFinal.ms" id="valiEFinalUrl" />
						 <input type="hidden" value="${path }sys/excel/ExcelAction_importExcel.ms" id="importUrl" />
						 <input type="hidden" value="${path }buss/bussModel_ImportStep01AtrrInfo.ms" id="step01" />
						 <input type="hidden" value="" name='tableName' id="tableName" />
						     <input type="hidden" value="<%=CommMethodMc.escapeJs( request.getParameter("iframeId")) %>" id="iframeId" name="iframeId" />
						  <input type="hidden" id="exeid" value='<%=CommMethodMc.escapeJs( request.getParameter("exeid")) %>' name="exeid"/>
						  <input type="hidden" id="formId" value='<%=CommMethodMc.escapeJs( request.getParameter("formId")) %>' name="formId"/>
						  <input type="hidden" value="${path }sys/excel/ExcelAction_loadExcelModel.ms" id="loadExcelUrl">
				        	<table id="tbodyDataLst">
			        	    	
				        	</table>
				        	</form>
				    </div>
				    <div class='msg_sctoll' style="width:100%;height:200px;overflow: auto;"  id="msgDiv">
				   		
				    
				    </div>
				</div>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
	<div style="display: none;overflow: auto;word-break: break-all;padding: 10px 20px;box-sizing: border-box;" id="errinfo_div">
		
	</div>
	
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	   <script>
	        		$("#fileUp").change(function(){
	        			if($(this).val()) {
	        				var fileName = $(this)[0].files[0].name;
	        				$(this).prev().prev().html(fileName);
			            	$(this).prev().prev().attr("title", fileName);
			            	getUpFile(); //上传文件
			            	$(this).val("");
	        			}else {
	        				$(this).prev().prev().html("请选择文件...");
	        			}
	        		   // var fileName = $(this)[0].files[0].name;
	        		   // alert($(this).val());
			          
			            
	        		});
	   </script>
	    
    	<script>(function($){
            $(window).on('load',function(){
                setPopScroll('.scroll');
                setPopScroll("#msgDiv");
               //setPopScroll(".msg_sctoll");
              //  $("#msgDiv").mCustomScrollbar();
            });
        })(jQuery);											
        </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
