<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
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
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	
			<!-- head里面 -->
  
  
</head>
<body>
<div class="mod">
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
           
			<div class="bd" style="height:400px;border:0;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="39d36d92711a4c7789582bf04f5a16e3" type="edit" />
	<div class="mod-hd">
		<h3 class="tit"><dict:lang value="基本信息" /></h3>
        </div>		
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="39d36d92711a4c7789582bf04f5a16e3" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="39d36d92711a4c7789582bf04f5a16e3" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	
		<s:set name="_$viewId" value="'5359aad0a0514b5b86bd17f73a4614d1'" />
		<s:set name="_$formId_1" value="'39d36d92711a4c7789582bf04f5a16e3'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
		    <td class="name-four" /><bu:uitn colNo="QMI_TEST_STEP" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec-self" colNo="QMI_TEST_STEP" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_TEST_STEP" formId="39d36d92711a4c7789582bf04f5a16e3" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="QMI_MODEL_CODE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec-self" colNo="QMI_MODEL_CODE" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_MODEL_CODE" formId="39d36d92711a4c7789582bf04f5a16e3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>			

		<tr>	
        	<td class="name-four" /><bu:uitn colNo="QMI_ITEM_GENRE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec-self" colNo="QMI_ITEM_GENRE" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_ITEM_GENRE" formId="39d36d92711a4c7789582bf04f5a16e3" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="QMI_MODEL_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec-self" colNo="QMI_MODEL_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_MODEL_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>			

		<tr>		
            <td class="name-four" /><bu:uitn colNo="QMI_MODEL_SPEC" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<bu:td cssClass="dec-self" colNo="QMI_MODEL_SPEC" formId="39d36d92711a4c7789582bf04f5a16e3" ><bu:ui colNo="QMI_MODEL_SPEC" formId="39d36d92711a4c7789582bf04f5a16e3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<div class="mod-hd">
		<h3 class="tit"><dict:lang value="检测项目信息" /></h3>
        </div>	
        
			<bu:jsVal formId="39d36d92711a4c7789582bf04f5a16e3" formIndex="1" />
<div class="mod-hd" style="height:230px;border-bottom: none;">
  <div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"
						id="datagrid-view" style="">
						<div class="datagrid-header">
							<div class="datagrid-header-inner" id="datagrid-header-inner1"
								 >
									<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
											<td class="datagrid-cell" style="width:30px;"></td>
											<td class="datagrid-cell" style="width:30px;"><input
												type="checkbox" id="allSelect" name="allSelect" />
											</td>
											
											<td class="datagrid-cell" style="width:80px;"><dict:lang
													value="检测阶别" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="项目代码" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="项目名称" />
											</td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="项目类型" />
											</td>
											<td class="datagrid-cell" style="width:80px;"><dict:lang
													value="值域" />
											</td>
											<td class="datagrid-cell" style="width:60px;"><dict:lang
													value="上限值" />
											</td>
											<td class="datagrid-cell" style="width:60px;"><dict:lang
													value="下限值" />
											</td>
											<td class="datagrid-cell" style="width:60px;"><dict:lang
													value="单位" />
											</td>
											<td class="datagrid-cell" style="width:120px;"><dict:lang
													value="检测方法" />
											</td>
											<td class="datagrid-cell" style="width:120px;"><dict:lang
													value="检测说明" />
											</td>																						
											<td class="datagrid-cell" style="width:120px;"><dict:lang value="顺序" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="datagrid-body datagrid-div3" id="datagrid-body" style="height:143px;"  >
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addModelList">
<c:forEach items="${dataList0}" var="model" varStatus="status">
	 <tr id='tr${model.ID}' name='trname' >
		 <td id='oseq${model.ID}' style="width:30px;text-align: center;">${status.count}</td>
                 <td id='ocheckbox${model.ID}' style="width:30px;text-align: center;"><input type="checkbox"></td>
		 
		 <td id='ostep${model.QMI_TEST_STEP}' style="width:80px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${model.mStep}<input type="hidden" name="paraStep" id="paraStep" value="${model.QMI_TEST_STEP}"/></td>
		 <td id='oseq${model.QMI_ITEM_SN}' style="width:100px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${model.QMI_ITEM_SN}<input type="hidden" name="qtiSn" id="qtiSn" value="${model.QMI_ITEM_SN}"/></td>
		 <td id='oseq${model.QMI_ITEM_NAME}' style="width:100px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="${model.QMI_ITEM_NAME}">${model.QMI_ITEM_NAME}<input type="hidden" name="qtiName" id="qtiName" value="${model.QMI_ITEM_NAME}"/></td>
		 <td id='oseq${model.QMI_ITEM_TYPE}' style="width:100px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${model.mType}</td>
		 <td id='oseq${model.QMI_ITEM_CLASS}' style="width:80px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${model.mClass}</td>
		 <c:if test="${model.mClass == '范围值'}">
		    <td id='oseq${model.QMI_ITEM_MAXVALUE}' style="width:60px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${model.QMI_ITEM_MAXVALUE}</td>
		    <td id='oseq${model.QMI_ITEM_MINVALUE}' style="width:60px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${model.QMI_ITEM_MINVALUE}</td>
		 </c:if>
		 <c:if test="${model.mClass == '固定值'}">
		    <td id='oseq${model.QMI_ITEM_MAXVALUE}' style="width:60px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${model.QMI_ITEM_MAXVALUE}</td>
		    <td id='oseq${model.QMI_ITEM_MINVALUE}' style="width:60px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"></td>
		 </c:if>
		 <c:if test="${model.mClass == '状态值'}">
		    <td id='oseq${model.QMI_ITEM_MAXVALUE}' style="width:60px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"></td>
		    <td id='oseq${model.QMI_ITEM_MINVALUE}' style="width:60px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"></td>
		 </c:if>
		 <td id='oseq${model.QMI_ITEM_UNIT}' style="width:60px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${model.QMI_ITEM_UNIT}</td>
		 <td id='oseq${model.QMI_TEST_METHOD}' style="width:120px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${model.QMI_TEST_METHOD}</td>
		 <td id='oseq${model.QMI_TEST_CONTENT}' style="width:120px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${model.QMI_TEST_CONTENT}</td>
		 <td id='oseq${model.QMI_TEST_SEQ}' style="width:120px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${model.QMI_TEST_SEQ}<input type="hidden" name="paraModelCode" id="paraModelCode" value="${model.QMI_MODEL_CODE}"/></td>
	 </tr>
</c:forEach>
								</tbody>
							</table>
						</div>



					</div>
				</div>

</div>									
			
		<div >
		<div id="backModel" class="dialog-mask" style="z-index:1029px;"/></div>
		<div class="dialog dialog-s1" id="addModel" style="display:none;z-index:1030;margin-left:0px;left:10px;top:10px;width:780px;height:380px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择检测项目" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addModel','backModel');"></a>
				<div class="dialog-bd-div" style="width:100%;height:80%;">
					<div class="optn optn_div">
			        <button type="button" onclick="addModelListSave('addModel','backModel');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addModel','backModel');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchModelInfo('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table>
				 <tr style="height:35px;">
			    		<td style="width: 90px;text-align: right;" ><dict:lang value="项目类型"/>&nbsp;</td>
			    		<td style="width: 162px;text-align: left;"><select id="searchDevTypeSelect" name="searchDevTypeSelect" class=" input isSubmit dept_select" style="width: 157px;"> <option  value="">--请选择--</option> </select></td>
			    		<td  style="width: 90px;text-align: right;" ><dict:lang value="项目代码"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqSN" class="input" style="width:157px;"/></td>
			    		<td  style="width: 90px;text-align: right;"><dict:lang value="项目名称"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqName" class="input" style="width:157px;"/></td>
			    		
			    	</tr>
			    	</table>
			    	<div style="width:780px;height:35px;">  
			    	<table  width="780px" class="dlist-table table-line " >
				<thead>
			    	<tr>
			    	<th style="width: 30px;text-align: center;"></th >
				<th style="width: 30px;text-align: center;"><input type="checkbox" id="model_list_cb"  onchange="getAllModel();" /></th >
				<th style="width: 120px;text-align: center;"><dict:lang value="项目代码" /></th >
				<th style="width: 112px;text-align: center;"><dict:lang value="项目名称" /></th >
				<th style="width: 127px;text-align: center;"><dict:lang value="项目类型" /></th >
				<th style="width: 89px;text-align: center;"><dict:lang value="值域" /></th >
				<th style="width: 57px;text-align: center;"><dict:lang value="上限值" /></th >
				<th style="width: 57px;text-align: center;"><dict:lang value="下限值" /></th >
				<th style="text-align: center;"><dict:lang value="单位" /></th >
			        </tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div style="width:780px;height:197px;overflow-y: auto;overflow-x: hidden;" >  
			    	<table width="780px" style="table-layout:fixed" class="dlist-table table-line " id="modelTable">
			    	<tbody id="modelTbody">
		                </tbody>
				
				</table>
				<div style="background-color: white;">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchModelInfo&formId=formId2&showLoading=0" />
                                 </div>		
				</div>

				</div>
				

</div>		
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
	 <script>(function($){
  $(window).on('load',function(){
  defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</div>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<script>
function cdis(){
$("input[type='checkbox']").attr("disabled",true);
$('.dialog-bd',parent.document).css('background-color','#fff')
}
 cdis();
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 
 
