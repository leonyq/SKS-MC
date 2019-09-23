<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
    <script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <!-- head里面 -->
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_19" />
        <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>
<body>
    <div class="edit">
            <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
            <jsp:param name="modelName" value="VIEW_TYPE_19" />
             <jsp:param name="location" value="saveForm" />
		</jsp:include>

            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <!--<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>-->
                <div class="optn">
                    <button type="button" onclick="saveData('${formId}','${formIndex}','${curRowSeq}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
                    <button type="button" onclick="closeThisPopWin();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
                </div>
                <div id = "formDataStr" style="display: none;">${formDataStr}</div>
            </div>
            <div class="bd" style="height:234px;">
                <form id="saveForm" name="saveForm" action="#" method="post" <bu:formet exeid="%{exeid}" />
                target="submitFrame">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_19" />
     				   <jsp:param name="location" value="saveForm" />
  				</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="b9f80468a9fe4b74ada4fceff23db738" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="b9f80468a9fe4b74ada4fceff23db738" />
	<input type="hidden" name="b9f80468a9fe4b74ada4fceff23db738" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="editflag" value="${param.flag}" />
		<s:set name="_$viewId" value="'7488ba70464445468a6bb48cbe590988'" />
		<s:set name="_$formId_1" value="'b9f80468a9fe4b74ada4fceff23db738'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CBD_ITEM_CODE" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_ITEM_CODE" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_CODE" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_CODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CBD_ITEM_NAME" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_ITEM_NAME" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_NAME" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CBD_ITEM_SPEC" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_ITEM_SPEC" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_SPEC" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_SPEC}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CBD_UNITS" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_UNITS" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_UNITS" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_UNITS}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CBD_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_POINT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CBD_ITEM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_ITEM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_NUM}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CBD_ITEM_SECTION" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_ITEM_SECTION" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_SECTION" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_SECTION}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CBD_BOTTOM_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_BOTTOM_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_BOTTOM_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_BOTTOM_POINT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CBD_BOTTOM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_BOTTOM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_BOTTOM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_BOTTOM_NUM}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CBD_TOP_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_TOP_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_TOP_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_TOP_POINT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CBD_TOP_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_TOP_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_TOP_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_TOP_NUM}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name"style="width: 68px;" /><span class="dot">*</span><bu:uitn colNo="CBD_ITEM_TYPE" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
			<bu:td cssClass="dec" colNo="CBD_ITEM_TYPE" formId="b9f80468a9fe4b74ada4fceff23db738" ><bu:ui colNo="CBD_ITEM_TYPE" formId="b9f80468a9fe4b74ada4fceff23db738" value="%{CBD_ITEM_TYPE}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="b9f80468a9fe4b74ada4fceff23db738" formIndex="1" />
            </form>
        </div>
    </div>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_19" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>

    <div style="display: none;">
        <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
    </div>

<script type="text/javascript">
    
  
    var parentWindow;
    if(top.$("#"+window.frameElement.name)[0] != null)
    {
       parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
    }
    function init(){
        $(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
    }//初始化方法
    
    // 回填数据
    function saveData(formId,formIndex,curRowSeq){
		var cbdItemCode = document.getElementById("paraMap1_CBD_ITEM_CODE_SHOW");
		var cbdUnits = document.getElementById("paraMap1_CBD_UNITS");
		var cbdPoint = document.getElementById("paraMap1_CBD_POINT");
		var cbdNum = document.getElementById("paraMap1_CBD_ITEM_NUM");
		var flag = $("#editflag").val();
		if(null == $("#paraMap1_CBD_ITEM_CODE").val() || "" ==$("#paraMap1_CBD_ITEM_CODE").val()){
			_alertValMsg(cbdItemCode,"<dict:lang value="该项不能为空" />");
       		return false;
		}
		if(null == $("#paraMap1_CBD_ITEM_NUM").val() || "" ==$("#paraMap1_CBD_ITEM_NUM").val()){
			_alertValMsg(cbdNum,"<dict:lang value="该项不能为空" />");
       		return false;
		}		
		if(null == $("#paraMap1_CBD_UNITS").val() || "" ==$("#paraMap1_CBD_UNITS").val()){
			_alertValMsg(cbdUnits,"<dict:lang value="该项不能为空" />");
       		return false;
		}
		if(null == $("#paraMap1_CBD_POINT").val() || "" ==$("#paraMap1_CBD_POINT").val()){
			_alertValMsg(cbdPoint,"<dict:lang value="该项不能为空" />");
       		return false;
		}
        var formData = form.serialize($("#saveForm"));
        var type = $("#type").val();
        var levelForm = $("#levelForm").val();
        var parentFormId = $("#parentFormId").val();
        if(type == "2"){
            parentWindow.editData(formId,formIndex,changeKey(formData,formIndex,curRowSeq),curRowSeq);
        }else{
        if(flag=="edit"){
          parentWindow.addRowDataNew(formData);  
        }else{
         //parentWindow.addRow(formId,formIndex,changeKey(formData,formIndex,curRowSeq),levelForm,parentFormId);  
         parentWindow.addRowDataNew(formData); 
        }
             
            
        }
        //closeThisPopWin();
       var popId = $("#popId").val();
       parent.closePopWinFp(popId+"pop",popId+"shadow");
    };
    
    function editData(formDataStr){
        var formDataJson = JSON.parse(formDataStr);
        form.deserialize($("#saveForm"),formDataJson);
    }
    
    // 关闭 
    function closeThisPopWin(){
        var popId = $("#popId").val();
		parentWindow.$("#datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738 tr:last").remove();
        parent.closePopWinFp(popId+"pop",popId+"shadow");
		
    }
    
    function changeKey(formData,formIndex,curRowSeq){
        var newKey;
        var oldKey;
        for(key in formData){
            if(key.indexOf("@0#")>-1){
                oldKey = key;
                newKey = key.replace("1@0#",formIndex+"@"+curRowSeq+"#");
                formData[newKey]=formData[oldKey];
            }
        }
        return formData;
    }
    
    $(function(){
        var type = $("#type").val();
        if(type == "2"){
            var formDataStr = $("#formDataStr").text();
            editData(formDataStr);
        };
      $(".dialog-close").attr("class","testff");
    });
</script>

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