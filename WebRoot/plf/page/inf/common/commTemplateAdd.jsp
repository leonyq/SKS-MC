<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title><dict:lang value="消息通用模板新增" /></title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
    <title><dict:lang value="新增" /></title>
    <jsp:include page="/plf/common/pub_head.jsp">
        <jsp:param name="popDivWin" value="1" />
        <jsp:param name="serializeForm" value="1" />
        <jsp:param name="dmp" value="1" />
        <jsp:param name="uEditor" value="1" />
    </jsp:include>
    <jsp:include page="/plf/common/pub_dom.jsp">
        <jsp:param name="needValidate" value="1" />
    </jsp:include>
    <style>
        .list-left{
            width: calc(50% - 200px);
            margin-left: 0px;
        }


    </style>
</head>
<body>
    <div class="layui-fluid all">
        <div class="headline"><dict:lang value="消息通用模板" />-<dict:lang value="新增" /></div>

        <form id="add_form" class="layui-form" name="addForm" action="${path}infComm/infCommAction_commTemplateAdd.ms" method="post"<%-- target="submitFrame"--%>>
            <%--            <input type="hidden" name="mcIframeName" value="${mcIframeName}">
                        <input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">--%>

            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="标题" /></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" class="layui-input" lay-verify="required|checkV1" name="templateDto.title" id="templateDto_title">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="模型编码" /></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" class="layui-input" lay-verify="required|checkV2" name="templateDto.code" id="templateDto_code">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="是否默认模板" /></div>
                <div class="list-right">
                    <div class="pane" >
                        <dict:selectDict dictCode="YOrN" dictValue="%{TYPE}" name="templateDto.isDefault" id="templateDto_isDefault" custom_option="<option value=''>%{getText('请选择')}</option>" />
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="微信默认模板" /></div>
                <div class="list-right">
                    <div class="pane" >
                        <select id="templateDto_wxTemplateId" name="templateDto.wxTemplateId" lay-verify="required" class="layui-select">
                            <option value><dict:lang value="请选择" /></option>
                            <c:forEach items="${ajaxList}" var="wxTemplate">
                                <option value="<c:out value='${wxTemplate.ID }'/>"><c:out value='${wxTemplate.CODE }'/></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="模板内容" /></div>
                <div class="list-right">
                    <textarea id="templateDto_template" lay-verify="required|checkV3" class="layui-textarea" name="templateDto.template" maxlength="3000"><s:property value="ajaxMap.template"/></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="模板例子" /></div>
                <div class="list-right">
                    <textarea id="templateDto_example" class="layui-textarea" name="templateDto.example" maxlength="3000"><s:property value="ajaxMap.example"/></textarea>
                </div>
            </div>

            <div class="ptop_10">
                <button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit"><dict:lang value="提交" /></button>
                <button type="button" class="layui-btn layui-btn-danger" id="cancelButten" onclick="closePopWin()"><dict:lang value="取消" /></button>
            </div>
        </form>
    </div>


<script type="text/javascript">
    layui.use(['form'], function(){
        var form = layui.form;
        form.render();

        //监听提交
        form.verify({
            checkV1: function(value,item){
                if(value.indexOf("'")!=-1 ||value.indexOf('"')!=-1 ||value.indexOf('<')!=-1 ||value.indexOf('>')!=-1 ||value.indexOf('/')!=-1 ||value.indexOf('?')!=-1){
                    value =value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
                    return "<dict:lang value="标题不能输入单引号双引号<>/?" />";
                }
            },
            checkV2: function(value,item){
                if(value.indexOf("'")!=-1 ||value.indexOf('"')!=-1 ||value.indexOf('<')!=-1 ||value.indexOf('>')!=-1 ||value.indexOf('/')!=-1 ||value.indexOf('?')!=-1){
                    value =value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
                    return "<dict:lang value="模板编码不能输入单引号双引号<>/?" />";
                }
            },
            checkV3: function(value,item){
                if(value.indexOf("'")!=-1 ||value.indexOf('"')!=-1 ||value.indexOf('<')!=-1 ||value.indexOf('>')!=-1 ||value.indexOf('/')!=-1 ||value.indexOf('?')!=-1){
                    value =value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
                    return "<dict:lang value="模板内容不能输入单引号双引号<>/?" />";
                }
            }
        });

        form.on('submit(filterSubmit)', function (data) {
            //document.getElementById("mcIframeName").value='';
            // var flag=saveT();
            // if(!flag){
            //     return false;
            // }else{
            //     return true;
            // }
        });
    });

    var isSubmit = false;
    function saveT(){
        if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}<%-- 防止重复提交 --%>
        if(!valData()){
            return false;
        }
        return true;
        //document.forms.add_form.submit();
        // thisObj.onclick = function(){util.alert("数据正在提交，请稍候...");}
    }

    function valData(){
        var templateDto_title = document.getElementById("templateDto_title");
        if(val.isBlank(templateDto_title)){
            _alertValMsg(templateDto_title,"<dict:lang value="标题" /> -- <dict:lang value="不能为空" />");
            return false;
        }

        var templateDto_code = document.getElementById("templateDto_code");
        if(val.isBlank(templateDto_code)){
            _alertValMsg(templateDto_code,"<dict:lang value="模型编码" /> -- <dict:lang value="不能为空" />");
            return false;
        }

        var templateDto_isDefault = document.getElementById("templateDto_isDefault");
        if(val.isBlank(templateDto_isDefault)){
            _alertValMsg(templateDto_isDefault,"<dict:lang value="是否默认模板" /> -- <dict:lang value="不能为空" />");
            return false;
        }

        var templateDto_template = document.getElementById("templateDto_template");
        if(val.isBlank(templateDto_template)){
            _alertValMsg(templateDto_template,"<dict:lang value="模板内容" /> -- <dict:lang value="不能为空" />");
            return false;
        }


        return true;
    }



    // function closePopWin(){
    //     hidePopWin(false);
    // }
</script>


</body>
</html>