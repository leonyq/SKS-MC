<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title><dict:lang value="消息通用模板查看" /></title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="查看" /></title>
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
        <div class="headline"><dict:lang value="消息通用模板" />-<dict:lang value="查看" /></div>
      
        <form id="add_form" class="layui-form" name="addForm" action="" method="post">

            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="标题" /></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" class="layui-input" lay-verify="required" disabled="true" name="templateDto.title" id="templateDto_title" value="${dataMap.TITLE}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="模型编码" /></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" class="layui-input" lay-verify="required" disabled="true" name="templateDto.code" id="templateDto_code" value="${dataMap.CODE}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="是否默认模板" /></div>
                <div class="list-right">
                    <div class="pane" >
                     	<dict:selectDict dictCode="YOrN" dictValue="%{dataMap.IS_DEFAULT}" name="templateDto.isDefault" disabled="true" id="templateDto_isDefault" custom_option="<option value=''>%{getText('--请选择--')}</option>" />
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="微信默认模板" /></div>
                <div class="list-right">
                    <div class="pane" >
                        <select id="templateDto_wxTemplateId" name="templateDto.wxTemplateId" lay-verify="required" class="layui-select" disabled="true">
                            <option value><dict:lang value="请选择" /></option>
                            <c:forEach items="${ajaxList}" var="wxTemplate">
                                <c:if test="${wxTemplate.ID eq dataMap.WX_TEMPLATE_ID}">
                                    <option selected="selected" value="<c:out value='${wxTemplate.ID }'/>"><c:out value='${wxTemplate.CODE }'/></option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="模板内容" /></div>
                <div class="list-right">
                    <textarea id="templateDto_template" lay-verify="required" class="layui-textarea" disabled="true" name="templateDto.template" maxlength="3000"><s:property value="dataMap.TEMPLATE"/></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="模板例子" /></div>
                <div class="list-right">
                    <textarea id="templateDto_example" class="layui-textarea" disabled="true" name="templateDto.example" maxlength="3000"><s:property value="dataMap.example"/></textarea>
                </div>
            </div>
        
        <div class="ptop_10">
            <button class="layui-btn layui-btn-danger" id="cancelButten" onclick="closePopWin()"><dict:lang value="关闭" /></button>
        </div> 
       </form> 
    </div>
 

<script type="text/javascript">
    layui.use(['form'], function(){
        var form = layui.form;
        form.render();


        form.on('submit(filterSubmit)', function (data) {
            // var flag=saveT();
            // if(!flag){
            //     return false;
            // }else{
            //     return true;
            // }
        });
    });
    

</script>


</body>
</html>