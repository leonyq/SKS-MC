  <%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="工种列表" /></title>
		<style>
			._pic{
				display:inline-block;
				height:26px;
				width:26px;
				background-color:#dbdbdb;
				border-radius:50%;
				position: relative;
			}
		</style>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
		<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
		</head>
	<body style="height:100%">
			<div class="content-in">
              <div class="dlist">
                  <div class="hd" style="margin-top:5px;">
		                  <div class="optn" style="top:5px;">
		                  <table class="func_table">
		                  <tr>
						<td width="100%" align="right" style="padding-right: 5px;">
					   	<button type="button" onclick="return commit(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
					    <button type="button" onclick="query(this);"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
						 <button type="button" onclick="closeCurrentWindow();"><i class="ico ico-cancel"></i>取消</button>
						</td>
			    		</tr>
						</table>
						</div>
					</div>
             
                  <div class="bd" style="height: calc(100% - 40px - 5px);">
                       <div class="search-box">
							<form id="search_form" name="searchForm" action="${path}sys/UserTargetDataAction_queryAdminPageListBySh.ms" method="post">
								<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
							<table class="search_table">
								<tr>
									<td width="50%" >
									  	&#x3000;&#x3000;&#x3000;<dict:lang value="指标名称" />
									  	<input class="input" id="target_name" name="targetNameSh" cssClass="input_sh" maxlength="30" width="230px" value="<c:out value='${targetNameSh}'/>"/>
								  	</td>
								  	<td class="dec" >
									  	&#x3000;&#x3000;&#x3000;<dict:lang value="类别" />
									  	<dict:selectDict dictCode="TARGET_TYPE"   id="target_type" name="targetTypeSh" 
									  	style="cursor: pointer;width:200px;" cssClass="dept_select" dictValue="${targetTypeSh}"
									  	custom_option="<option value=''>%{getText('--请选择--')}</option>"  />
								  	</td>
							    </tr>
							</table>
							<s:hidden id="showOrder1" name="paraMap.showOrder" value="${showOrder}"></s:hidden>
							</form>
							</div>
						
	
						<div class="main" style="margin-top: 15px;overflow-y: auto;overflow-x: hidden;height: calc(100% - 40px - 30px);">
								<table class="dlist-table table-line" style="width: 100%;table-layout: fixed;">
									<thead>	
										<tr class="tableHead">
										<th style="width:30px;text-align:center;"></th>
										<th style="width:30px;text-align:center;"><dict:lang value="序号" /></th>
										<th style="width:150px;text-align:center;"><dict:lang value="指标名称" /></th>
										<th style="text-align:center;width:70px;"><dict:lang value="类别" /></th>
										<th style="width:100px;text-align:center;"><dict:lang value="数据" /></th>
										<th style="width:70px;text-align:center;"><dict:lang value="单位" /></th>
										<th style="text-align:center;"><dict:lang value="关联菜单名称" /></th>
										<th style="width:50px;text-align:center;"><dict:lang value="图片" /></th>
<%--										<th style="width:70px;text-align:center;border-right: 0;"><dict:lang value="显示顺序" /></th>--%>
										</tr>
									</thead>
								</table>
						<div class="scroll" style="height:calc(100% - 31px);overflow:auto;">
							<table id="addTable" class="dlist-table table-line" style="width: 100%;table-layout: fixed;">
								<tbody id="adminPageDataList">
									<s:iterator value="adminPageDataList" status="index" id="adto">
											
											
											<s:if test="${paraMap.targetId==id}">
											<tr onclick="setModify(this)" class="selected">
											<td style="width:30px;text-align:center;"><input type="radio" name="radioId" value="<c:out value='${id}'/>"  style="margin:0" checked="checked"></td><!-- 复选框 -->
											</s:if>
											<s:else>
											<tr onclick="setModify(this)" >
											<td style="width:30px;text-align:center;"><input type="radio" name="radioId" value="<c:out value='${id}'/>"  style="margin:0"></td><!-- 复选框 -->
											</s:else>
											<td style="width:30px;text-align:center;" ><s:property value="#index.count"/></td><!-- 序号 -->
											<td style="width:150px;text-align:center;">
												<s:property value="%{targetName}"/>
											</td>
											<td style="width:70px;text-align:center;">
												<dict:viewDict dictCode="TARGET_TYPE" dictValue="%{type}"/>
												<!-- 类型-->
											</td>
											<td style="width:100px;text-align:center;">
												<s:if test="${dataType!=null}">
													<dict:lang value="已配置"/>
												</s:if>
												<s:else>
													<dict:lang value="未配置"/>
												</s:else>
													<!--数据 -->
											</td>
											<td style="width:70px;text-align:center;">
												<dict:viewDict dictCode="CI_UNIT" dictValue="%{unit}"/>
												<!-- 单位-->
											</td>
											<td style="text-align:center;">
												<s:property value="%{menuName}"/>
											</td>
											<td style="width:50px;text-align:center;">
												<div class="_pic">
													<img src="${path}plf/userPhoto/<c:out value='${picName}'/>?_mc_res_version=<%=PlfStaticRes.PICNAME%>"  width="18px" height="18px" style="margin-top: 3px;cursor:pointer;" id="PIC_URL_${index.index}" >
												</div>	
											</td>
<%--											<td style="width:70px;text-align:center;border-right: 0;">--%>
<%--												<s:property value="%{showOrder}"/>--%>
<%--											</td>--%>
										</tr>
								 	</s:iterator>
								 	</tbody>
							</table>
						</div>
						
						
	</form>
	<s:form id="submit_form" name="submitForm"  method="post">
		<s:hidden id="showOrder" name="showOrder" ></s:hidden>
	</s:form>
</div>
<div class="center">
	<s:include value="/plf/page/fp/pagination.jsp?formId=search_form&resetSearchVal=resetSearchVal" />
</div>
</div>
   </div>
			</div>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

<script type="text/javascript">
function query(thisObj){
	var showOrder=$("#showOrder").val();
	document.forms.search_form.action="${path}sys/UserTargetDataAction_queryAdminPageListBySh.ms";	
	document.forms.search_form.submit();		
}
function closeCurrentWindow()
{
	closePopDivFp(window.frameElement.id + "pop");
}
function commit(thisObj){
	var radioId=$('input[name="radioId"]:checked').val();
	if(radioId==undefined||radioId==null){
		utilsFp.confirmIcon("3","","","","<dict:lang value="请至少选择一条记录" />","",320,150);
		return false;
	}
	var showOrder=$("#showOrder").val();
	document.forms.submit_form.action="${path}sys/UserTargetDataAction_editUserData.ms?targetId="+radioId;	
	document.forms.submit_form.submit();
}
function setModify(thisObj){
	$(thisObj).find("td").find("input[type='radio']").prop("checked",true);
	$(thisObj).addClass('selected').siblings().removeClass('selected');
}

(function($){
  	$(window).on("load",function(){
  		$('.scroll').mCustomScrollbar({
       	scrollInertia:150,
       	autoHideScrollbar:true,
       	theme:"minimal-dark",
     	});
  	})
  	
  })(jQuery);

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>