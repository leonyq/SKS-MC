<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
                <div class="optn">
                    <button type="button" onclick="saveData('${formId}','${formIndex}','${curRowSeq}');"><i class="ico ico-save"></i><dict:lang value="存" /></button>
                    <button type="button" onclick="closeThisPopWin();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
                </div>
		<div id = "formDataStr" style="display: none;">${formDataStr}</div>
            </div>
            <div class="bd">
                <form id="saveForm" name="saveForm" action="#" method="post" <bu:formet exeid="%{exeid}" />
                target="submitFrame">
                <input type="hidden" name="formId" value="${formId}">
                <input type="hidden" name=iframeId value="${iframeId}">
                <input type="hidden" id = "popId" name="popId" value="${popId}">
              <input type="hidden" id = "type" name="type" value="${type}">
               <input type="hidden" id = "levelForm" name="levelForm" value="${levelForm}">
                 <input type="hidden" id = "parentFormId" name="parentFormId" value="${parentFormId}">
                <s:token />
                <table class="func_table">
                    <tr>
                        <td width="100%" align="right">

                        </td>
                    </tr>
                </table>
		<bu:set name="paraMapObj" value="${dataId}" formId="677346fc6b47486ba7a9164f03017738" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="677346fc6b47486ba7a9164f03017738" />
	<input type="hidden" name="677346fc6b47486ba7a9164f03017738" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'6867953fd832411c9a4a77c7f69d2362'" />
		<s:set name="_$formId_1" value="'677346fc6b47486ba7a9164f03017738'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><bu:uitn colNo="A" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<bu:td cssClass="dec-self" colNo="A" formId="677346fc6b47486ba7a9164f03017738" ><bu:ui colNo="A" formId="677346fc6b47486ba7a9164f03017738" value="%{A}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="B" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<bu:td cssClass="dec-self" colNo="B" formId="677346fc6b47486ba7a9164f03017738" ><bu:ui colNo="B" formId="677346fc6b47486ba7a9164f03017738" value="%{B}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="C" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<bu:td cssClass="dec-self" colNo="C" formId="677346fc6b47486ba7a9164f03017738" ><bu:ui colNo="C" formId="677346fc6b47486ba7a9164f03017738" value="%{C}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="D" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<bu:td cssClass="dec-self" colNo="D" formId="677346fc6b47486ba7a9164f03017738" ><bu:ui colNo="D" formId="677346fc6b47486ba7a9164f03017738" value="%{D}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="E" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<bu:td cssClass="dec-self" colNo="E" formId="677346fc6b47486ba7a9164f03017738" ><bu:ui colNo="E" formId="677346fc6b47486ba7a9164f03017738" value="%{E}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="PID" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<bu:td cssClass="dec-self" colNo="PID" formId="677346fc6b47486ba7a9164f03017738" ><bu:ui colNo="PID" formId="677346fc6b47486ba7a9164f03017738" value="%{PID}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="677346fc6b47486ba7a9164f03017738" formIndex="1" />
            </form>
        </div>
    </div>
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
        var formData = form.serialize($("#saveForm"));
        var type = $("#type").val();
           var levelForm = $("#levelForm").val();
        var parentFormId = $("#parentFormId").val();
        if(type == "2"){
        	parentWindow.editData(formId,formIndex,changeKey(formData,formIndex,curRowSeq),curRowSeq);
        }else{
        	parentWindow.addRow(formId,formIndex,changeKey(formData,formIndex,curRowSeq),levelForm,parentFormId);
        }
        closeThisPopWin();
        
    };
    
    function editData(formDataStr){
    	var formDataJson = JSON.parse(formDataStr);
    	form.deserialize($("#saveForm"),formDataJson);
    }
    
    // 关闭窗口
    function closeThisPopWin(){
        var popId = $("#popId").val();
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
    		};
    	}
    	console.log(formData)
    	return formData;
    }
     $(function(){
    	var type = $("#type").val();
    	if(type == "2"){
    		var formDataStr = $("#formDataStr").text();
    		editData(formDataStr);
    	};
    });
</script>

    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
