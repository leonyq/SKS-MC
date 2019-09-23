<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="新增" /></title>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
</head>
<body>
	<div class="edit">
		<div class="hd">
			<!--<div style="margin-left:10px;">
				<input type="checkbox" checked id="isCloseWin" name="isCloseWin"
					value="0" />
				<dict:lang value="保存并关闭窗口" />
			</div>-->
			<div class="optn">
				<button type="button"  onclick="uploadExcel(this);">
					<i class="ico ico-save"></i>
					<dict:lang value="保存" />
				</button>
				<button type="button" onclick="closeCurrentWindow();">
					<i class="ico ico-cancel"></i>
					<dict:lang value="取消" />
				</button>
			</div>

		</div>
		<div class="bd">
			<form id="addForm" name="addForm"
				action="" method="post"
				enctype="multipart/form-data" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}"> <input
					type="hidden" name="definedMsg" value="${definedMsg}"> <input
					type="hidden" name="formId" value="${formId}"> <input
					type="hidden" name=iframeId value="${iframeId}">
					<input type="hidden" name="deviceArr" id="deviceArr" value="" />
				    <input type="hidden" name="modelCode" id="modelCode" value="" />
				    <input type="hidden" name="flag" id="flag" value="" />
				<s:token />
				<table class="func_table">
					<tr>
						<td width="100%" align="right"></td>
					</tr>
				</table>
				<bu:set name="paraMapObj" value="${dataId}"
					formId="99b52ba36c464464aef5216e173ca678" type="add" />
				<table class="basic-table">
					<input type="hidden" name="formIds"
						value="99b52ba36c464464aef5216e173ca678" />
					<input type="hidden" name="99b52ba36c464464aef5216e173ca678"
						value="paraMap1@" />
					<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
					<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
					<s:set name="_$viewId" value="'07e5aa1695024ab4816b4538020d83a7'" />
					<s:set name="_$formId_1" value="'99b52ba36c464464aef5216e173ca678'" />
					<s:set name="_$type" value="'add'" />
					<tr>
						<td class="name-three" style="width:80px" />
						<bu:uitn colNo="CMD_DEVICE_TYPE"
							formId="671b570d08854e6e86c84a8a249ae59e" />
						</td>
						<bu:td cssClass="dec-self" colNo="CMD_DEVICE_TYPE"
							formId="671b570d08854e6e86c84a8a249ae59e">
							<bu:ui colNo="CMD_DEVICE_TYPE"
								formId="671b570d08854e6e86c84a8a249ae59e"
								value="%{CMD_DEVICE_TYPE}" formIndex="1" />
						</bu:td>

						<td class="name-three" style="width:80px" />
						<bu:uitn colNo="CML_AREA_SN"
							formId="99b52ba36c464464aef5216e173ca678" />
						</td>
						<bu:td cssClass="dec-self" colNo="CML_AREA_SN"
							formId="99b52ba36c464464aef5216e173ca678">
							<input type="text" value="${dataList[0].CA_ID}" class=" input isSubmit  readonly" disabled="disabled">
						</bu:td>
					</tr>
					<tr>
						<td class="name-three" /><dict:lang value="选择文件" /></td>

						<td class="dec-self" colspan="2" >
						<input type="file" name="upFile" id="upFile" accept=".xls"/>
						</td>
						<td class="dec-self" ><a href="plf/template/materialTemplate.xls" download="料站表导入模板.xls" onclick="/*downTemplate();*/"><font color="blue"><dict:lang value="下载料站表导入模板" /></font></a>
						</td>
					</tr>

				</table>
				<bu:jsVal formId="99b52ba36c464464aef5216e173ca678" formIndex="1" />
				<div style="padding:1px;"></div>
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"
						id="datagrid-view" style="">
						<div class="datagrid-header">
							<div class="datagrid-header-inner" id="datagrid-header-inner"
								style="width:100%">
								<table id="datagrid-htable" class="datagrid-htable fixedTable  ">

									<tbody>
										<tr class="thcolor">
											<td class="datagrid-cell" style="width:30px;"></td>
											<td class="datagrid-cell" style="width:30px;"><input
												type="checkbox" id="allSelect" name="allSelect" />
											</td>
											<td class="datagrid-cell" style="width:130px;"><dict:lang
													value="设备代码" />
											</td>
											<td class="datagrid-cell" style="width:230px;"><dict:lang
													value="设备名称" />
											</td>
											<td class="datagrid-cell"><dict:lang value="所属线别" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>


						<div class="datagrid-body datagrid-div3" id="datagrid-body"
							style="height:160px;">
							<table class="datagrid-btable fixedTable" id="deviceTable">
								<tbody id="addLoadItem">
									<c:forEach items="${dataList}" var="cdlList" varStatus="status">
										<tr id="${status.index+1}" name="${status.index+1}" >
											<td class="datagrid-cell datagrid-cell-0"
												style="text-align: center;width:30px;">
												${status.index+1}</td>
											<td class="datagrid-cell datagrid-cell-1"
												style="text-align: center;width:30px;"><input
												type="checkbox" name="isSelect1" value="${status.index+1}"/>
												<input type="hidden" id="CAD_DEVICE_SEQUENCE${status.index+1}" value="${cdlList.CAD_DEVICE_SEQUENCE}" />
											<input type="hidden" id="CD_DEVICE_SN${status.index+1}" value="${cdlList.CD_DEVICE_SN}" />
									
											</td>
											<td class="datagrid-cell datagrid-cell-2"
												style="width:130px;">${cdlList.CD_DEVICE_SN} </td>
											<td class="datagrid-cell datagrid-cell-3"
												style="width:230px;">${cdlList.CD_DEVICE_NAME}</td>
											<td class="datagrid-cell datagrid-cell-4">
												${cdlList.CA_ID}</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
				</div>


			</form>
		</div>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	 <form id="dowm_form" name="downForm" action="${path}sys/UserAction_downTemplate.ms" method="post">
       <input type="hidden" name="paraMap.fileName" value="料站表导入模板.xls">
       <input type="hidden" name="paraMap.filePath" value="plf/template/materialTemplate.xls">
     </form>
	</div>

	<script type="text/javascript">
	$(function(){
	    var model='${param.modelCode}';
	    var flag='${param.flag}';
	    $("#modelCode").val(model);
	    $("#flag").val(flag);
	    
	})
	function init(){
		$("#allSelect").click(function(){
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
			});
		clickTr('deviceTable');
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	function downTemplate(){//cs
	
		document.forms.dowm_form.submit();
		thisObj.onclick = function(){utilsFp.confirmIcon(1,"","","","<dict:lang value="模板正在下载中..." />",0,"300","");};
	}
	
	function closeCurrentWindow(){
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	
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
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
		}
		var piframeId='${param.piframeId}';
		var formId='${param.formId}';
	function addParentData(resdata){
	     var obj;
	     util.showLoading();
	     console.log(resdata);
		 var parentWindows = $(window.parent.document).contents().find("#"+piframeId)[0].contentWindow;
		 
		 		 try{
		
		   obj=JSON.parse(resdata);  
		 }catch(e){
		   util.closeLoading();
		   utilsFp.confirmIcon(3,"","delConfirm","","模板不规范！请检查是否有特殊字符或换行"+e,"0","260","");  
		 }
		
		 console.log(obj);
		 //parentWindows.$("#addTable_"+formId+" tr").remove();	
		 parentWindows.addData(piframeId,formId,obj.length);
		 var deviceType;
		  $.each(obj, function(i, v) {
                 
			$.each(v, function(colNo, colNoValue) {
				parentWindows.editData(formId,colNo,colNoValue,i);
			});
			deviceType=$("#paraMap1_CMD_DEVICE_TYPE").val();
			parentWindows.editData(formId,'CMD_DEVICE_TYPE',deviceType,i);
			parentWindows.editData(formId,'CMD_SHKIP_FLAG','N',i);
		});
		
		util.closeLoading();
		parentWindows.calItemCount(formId);
		closeCurrentWindow();
	}
	function uploadExcel(thisObj) {
		var file = document.getElementById("upFile").value;
		if (file == "") {
		//	utilsFp.confirmIcon(3, "", "", "","%{getText("请选择要上传的excel文档")}"
		//			, "", "360", "145");
					
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择要上传的excel文档" />",0,"260","");		
         return;
		} else {
                        var fileL=file.toLowerCase();
var pos = fileL.lastIndexOf('.xls');
var posx = fileL.lastIndexOf('.xlsx');
    if(pos == -1&&posx==-1)  {
        		//utilsFp.confirmIcon(3, "", "", "","%{getText("请选择要上传的excel文档")}"
				//	, "", "360", "145");
			 utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择要上传的excel文档" />",0,"260","");
    return false;
}
			var seqs = "";
			var deviceArr=[];
			
			$("input[name='isSelect1']:checked").each(function(i) {
                var deviceS={};

				seqs = $(this).val();
				deviceS.CAD_DEVICE_SEQUENCE=$("#CAD_DEVICE_SEQUENCE"+seqs).val();
				deviceS.CD_DEVICE_SN=$("#CD_DEVICE_SN"+seqs).val();

				deviceArr.push(deviceS);
			});
			if (seqs == "") {
							//utilsFp.confirmIcon(3, "", "", "","%{getText("请至少选择一条记录")}"
					//	, "", "260", "145");
    	        utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
			 return;}

			$("#deviceArr").val(JSON.stringify(deviceArr));
			
		}
                
        var flag='${param.flag}';
        var funid;
       // if(flag==1){
        //    funid='a335f091391b4eb8bc7fa363acaa7fb0';
        //}else{
            funid='eb49be3431a8451bbc907372b6383a1b';
       // }
       // alert(flag);
		document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId="+funid;
		document.forms.addForm.submit();
	}
	
	
</script>
	<bu:script viewId="07e5aa1695024ab4816b4538020d83a7" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
 
