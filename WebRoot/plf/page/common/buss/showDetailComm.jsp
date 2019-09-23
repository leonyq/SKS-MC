<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <title><dict:lang value="查看" /></title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    
    <script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
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
</head>
<body style="overflow:auto;">

    <div class="edit">
            <div class="bd" style="border: none">
                <input type="hidden" name="exeid" value="<c:out value='${exeid}' />">
                <input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}' />">
                <input type="hidden" name="formId" value="<c:out value='${formId}' />">
                <input type="hidden" name="dataId" value="<c:out value='${dataId}' />">
                <input type="hidden" name=iframeId value="<c:out value='${iframeId}' />" >
                        <!-- <table class="basic-table">
                            <tr>
                                <th colspan="4">
                                    <span class="Eng">*</span>
                                    <dict:lang value="为必填项" />
                                </th>
                            </tr>
                        </table>-->
                        <bu:detailcp exeid="%{exeid}" formId="%{formId}" dataId="%{dataId}" />
                        <table class="func_table">
                            <tr>
                                <td width="100%" align="right">
        
                                </td>
                            </tr>
                        </table>
            </div>
        
    </div>


    <div style="display: none;">
        <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
    </div>

    <script type="text/javascript">
    
        var parentWindow;
        $(function(){
             parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
        });
        var isQuery = false;
        var fileMap = new Map();//临时存放file相关input
        function edit(thisObj){
            if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
            if(!val.valNullData()){
                return ;
            }
            if(!val.valDataBaseSetData()){
                return ;
            }
            if(!valData()){
                return ;
            }
            if(!val.valOjbsData()){
                return ;
            }
            if($("#isCloseWin")){
                $("#editForm").append($("#isCloseWin").clone());
            }
            //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题    
            emptyValToHide();
            
            document.forms.editForm.submit();
            isQuery = true;
        }
        
        function alertInfo(msg){
            isQuery = false;
            utilsFp.alert(msg);
        }
        
        function reloadPg(msg){
            isQuery = false;
            parentWindow.reloadPg(msg);
        }

        var FORM_COL_ID_D=null;
        function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
            util.showLoading();
            var url ="${path}buss/bussModel_editSubDataAx.ms";
            var addTtable = $('#addTable_'+tableId);
            var tableTrJq = addTtable.find("tbody tr");
            var row_count = tableTrJq.length;
            if(row_count == 0){
                curRowSeq=0;
            }
            var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
          jQuery.ajax({
                type: "POST",
            dataType: "json",
            url: url,
            data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal,'paraMap.show_type':'see'},
                success: function(data){
                    util.closeLoading();
                    if("" == $("#aaaa").val()){
                    $("#aaaa").val(data.ajaxPage.tableData);
                    }else{
                    $("#bbbb").val(data.ajaxPage.tableData);
                    }
                    var row = $(data.ajaxPage.tableData);
                
                    _toClickColor(row);// <%-- 行点击着色 --%>
                    addTtable.append(row);
                    var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
                    dataCountObj.val(row_count+ 1);
                    curRowSeq=curRowSeq+row.length;
                    $(".glxb-table tbody tr td:last").remove();
                },
                error: function(XMLHttpRequest, textStatus, errorThrown){
                    util.closeLoading();
                    var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
                    if (null != sessionstatus && sessionstatus == "noAuthority") {
                    }else{
                        util.alert("error:"+errorThrown);
                    }
               }
            });
        }
        

        
        function init(){
            initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
            /*
            var formIds = $("input[type='hidden'][name='formIds']").val();
            var formIdLs = formIds.split(",");
            for(var i=0,j=formIdLs.length;i<j;i++){
                getEditRows(formIdLs[i],"0");
            }
            */
        }
    //重置    
    function resetForm(){
        $("#editForm")[0].reset();
    }
    <%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
    var maxLen =5;
    if(thisObj.value.length < maxLen ){
        _alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
        return false;
    }else{
        return true;
    }
     --%>

</script>

    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="popConfirm" value="1" />
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>