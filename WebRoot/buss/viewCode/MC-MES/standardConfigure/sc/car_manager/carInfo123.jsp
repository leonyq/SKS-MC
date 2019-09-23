<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_19" />
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
        <jsp:param name="serializeForm" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    			<!-- head里面 -->
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_19" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
  <!-- 产品静态资源 -->

</head>
<body>
    <div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
                <div class="optn">
                    <button type="button" onclick="saveData('${formId}','${formIndex}','${curRowSeq}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
                    <button type="button" onclick="closeThisPopWin();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
                </div>
                <div id = "formDataStr" style="display: none;">${formDataStr}</div>
            </div>
            <div class="bd">
                <form id="saveForm" name="saveForm" action="#" method="post" <bu:formet exeid="%{exeid}" />
                target="submitFrame">
                 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_19" />
     				   <jsp:param name="location" value="saveForm" />
  				</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="4cebf85514984e61b05a9214165d9239" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="4cebf85514984e61b05a9214165d9239" />
	<input type="hidden" id="prefixInd" name="4cebf85514984e61b05a9214165d9239" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'10fa843806a64273bb052576e4501ba7'" />
		<s:set name="_$formId_1" value="'4cebf85514984e61b05a9214165d9239'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><bu:uitn colNo="Z_CAR_ID" formId="4cebf85514984e61b05a9214165d9239" /></td>
			<bu:td cssClass="dec-self" colNo="Z_CAR_ID" formId="4cebf85514984e61b05a9214165d9239" ><bu:ui colNo="Z_CAR_ID" formId="4cebf85514984e61b05a9214165d9239" value="%{Z_CAR_ID}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="Z_CAR_EMP_NAME" formId="4cebf85514984e61b05a9214165d9239" /></td>
			<bu:td cssClass="dec-self" colNo="Z_CAR_EMP_NAME" formId="4cebf85514984e61b05a9214165d9239" ><bu:ui colNo="Z_CAR_EMP_NAME" formId="4cebf85514984e61b05a9214165d9239" value="%{Z_CAR_EMP_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="Z_CAR_MACHINE" formId="4cebf85514984e61b05a9214165d9239" /></td>
			<bu:td cssClass="dec-self" colNo="Z_CAR_MACHINE" formId="4cebf85514984e61b05a9214165d9239" ><bu:ui colNo="Z_CAR_MACHINE" formId="4cebf85514984e61b05a9214165d9239" value="%{Z_CAR_MACHINE}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="4cebf85514984e61b05a9214165d9239" formIndex="1" />
            </form>
        </div>
    </div>
    <div style="display: none;">
        <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
    </div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_19" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>

    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_19" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
