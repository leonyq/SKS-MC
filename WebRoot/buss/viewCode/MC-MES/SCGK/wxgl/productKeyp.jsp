<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
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
			head.appendChild(l);
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
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
	</script>
<script type="text/javascript">
		var addTableTrMap;
	</script>
</head>
<body>
	<div class="edit">
		<div class="hd">

			<div class="optn">
				<button type="button" onclick="saveKeyP(this);">
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
		    <div class="mod">
                    <div class="mod-hd" style="height:290px;border:none;">
			<form id="addForm" name="addForm" action="" method="post"
				enctype="multipart/form-data" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}"> <input
					type="hidden" name="definedMsg" value="${definedMsg}"> <input
					type="hidden" name="formId" value="${formId}"> <input
					type="hidden" name=iframeId value="${iframeId}"> 
					<input type="hidden" name="componentArr" id="componentArr" value="" />
                    <input type="hidden" name="modelCode" id="modelCode" value="" />
                    <input type="hidden" name="workStation" id="workStation" value="" />
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
					<s:set name="_$viewId" value="'a1dd9d91ef1b45b697372e7f7dfa4b10'" />
					<s:set name="_$formId_1" value="'99b52ba36c464464aef5216e173ca678'" />
					<s:set name="_$type" value="'add'" />
					<tr>
						<td class="name-three" >
						<span><dict:lang value="组件条码" /><span>
						</span></span></td>
						<td  class="dec-self">
							<input type="text" value="" id="componentSn" name="componentSn" class=" input isSubmit" >
						</td>
					</tr>
					

				</table>
				<bu:jsVal formId="99b52ba36c464464aef5216e173ca678" formIndex="1" />
				<div style="padding:1px;"></div>
				<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"
						id="datagrid-view" style="">
						<div class="datagrid-header">
							<div class="datagrid-header-inner head1" id="datagrid-header-inner"
							>
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
											<td class="datagrid-cell" style="width:30px;"></td>
											<td class="datagrid-cell" style="width:30px;"><input
												type="checkbox" id="allSelect" name="allSelect" /></td>
											<td class="datagrid-cell" style="width:100px;"><dict:lang
													value="组件SN" /></td>
											<td class="datagrid-cell" style="width:200px;"><dict:lang
													value="组件料号" /></td>
											<td class="datagrid-cell" style="width:200px;"><dict:lang
													value="组件名称" /></td>
											<td class="datagrid-cell" style="width:200px;"><dict:lang value="生产工序" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>


						<div class="datagrid-body datagrid-div3 scroll1" id="datagrid-body"
							style="height:215px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addLoadItem">
									<c:forEach items="${dataList}" var="cdlList" varStatus="status">
										<tr id="${status.index+1}" name="${status.index+1}">
											<td class="datagrid-cell datagrid-cell-0"
												style="text-align: center;width:30px;">
												${status.index+1}</td>
											<td class="datagrid-cell datagrid-cell-1"
												style="text-align: center;width:30px;"><input
												type="checkbox" name="isSelect1" value="${status.index+1}" />
												<input type="hidden"
												id="WKI_ID${status.index+1}"
												value="${cdlList.WKI_ID}" /> <input
												type="hidden" id="WKI_ITEM_CODE${status.index+1}"
												value="${cdlList.WKI_ITEM_CODE}" /></td>
												
											<td class="datagrid-cell datagrid-cell-2"
												style="width:100px;">${cdlList.WKI_KEYP_SN}</td>
											<td class="datagrid-cell datagrid-cell-3"
												style="width:200px;">${cdlList.WKI_ITEM_CODE}</td>
											<td class="datagrid-cell datagrid-cell-4" style="width:200px;">
												${cdlList.CI_ITEM_NAME}</td>
                                            <td 	style="width:200px;" class="datagrid-cell datagrid-cell-5">
												${cdlList.WKI_GROUP_CODE}</td>
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
		</div>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>

	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>

	<script type="text/javascript">
	function init(){
		$("#allSelect").click(function(){
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
			});
		clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	
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
		
	
		var piframeId='<c:out value="${param.piframeId}"/>';
		var formId='<c:out value="${param.formId}"/>';
	function addParentData(msg,title,width,height,time){
	        msgPop(msg,'',title,width,height,time);	        
		    closeCurrentWindow();		    
	    }
	function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	
	function saveKeyP(thisObj) {
		var componentSn = document.getElementById("componentSn").value;
		if (componentSn == "") {
			utilsFp.confirmIcon(3, "", "", "","<dict:lang value='请输入组件条码'/>"	, "", "360", "145");
			document.getElementById("componentSn").focus();			
            return;
		} else { 
		  
			var seqs = "";
			var selCount=0;
			var componentArr=[];
			
			$("input[name='isSelect1']:checked").each(function(i) {
                var deviceS={};
                selCount++;
				seqs = $(this).val();
				deviceS.WKI_ID=$("#WKI_ID"+seqs).val();
				deviceS.WKI_ITEM_CODE=$("#WKI_ITEM_CODE"+seqs).val();

				componentArr.push(deviceS);
			});
			if(selCount==0||selCount>1){
                 utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择一条记录" />","","260","145");
                 return false;
              }

			$("#componentArr").val(JSON.stringify(componentArr));
			var parentWindows = $(window.parent.document).contents().find("#"+piframeId)[0].contentWindow;      
		    var modelCode=parentWindows.$("#paraMap1_WT_MODEL_CODE").val();   
		    $("#modelCode").val(modelCode);
		    var workStation=parentWindows.$("#paraMap1_WT_WORK_STATION").val();   
		    $("#workStation").val(workStation);
			
		}
        var componentUrl="${path}buss/bussModel_exeFunc.ms?funcMId=e1d9f0dd8c2b498cb2609d1ab2d6c6f9";
		document.forms.addForm.action = componentUrl;
		document.forms.addForm.submit();
	}
</script>
<script>(function($){
  $(window).on('load',function(){
   
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
	<bu:script viewId="a1dd9d91ef1b45b697372e7f7dfa4b10" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
