<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title><dict:lang value="动作配置查看"/></title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="dmp" value="1" />
		<jsp:param name="uEditor" value="1" />
	</jsp:include>
	<style>
	.layui-fluid{
		overflow:auto;
		padding-bottom:68px;
	}
	.layui-form-select dl {
		position: absolute;
		left: 0;
		top: 42px;
		padding: 5px 0;
		z-index: 1000;
		min-width: 100%;
		border: 1px solid #d2d2d2;
		max-height: 300px;
		overflow-y: auto;
		background-color: #fff;
		border-radius: 2px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, .12);
		box-sizing: border-box
	}
	.layui-form-item {
	 margin-bottom: 10px;
	}
	.headline{
	 margin-bottom: 10px;
	}	
	</style>
</head>
<body>
    <div class="layui-fluid">
        <div class="headline"><dict:lang value="查看"/></div>
        <form id="add_form" class="layui-form" name="addForm" action="${path}dmp/DmpMotionAction_MotionModelEdit.ms" method="post">
        	<input type="hidden" value="${dataMap.TOA_REMARK}" id="procedureDto_toaRemark">
        	<input type="hidden" value="${dataMap.id}" id="procedureMotionDto_id" name="procedureMotionDto.id">
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="动作编码"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text"  class="layui-input" name="procedureMotionDto.toaCode" id="procedureMotionDto_toaCode" value="${dataMap.TOA_CODE}" disabled="true">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="动作名称"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" class="layui-input" name="procedureMotionDto.toaName" id="procedureMotionDto_toaName" value="${dataMap.TOA_NAME}" disabled="true" >
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="提示信息"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" class="layui-input" name="procedureMotionDto.toaMsgCode" id="procedureMotionDto_toaMsgCode" value="${dataMap.TOA_MSG_CODE}" disabled="true" >
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="参数"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" class="layui-input" name="procedureMotionDto.toaParamCode" id="procedureMotionDto_toaParamCode" value="${dataMap.TOA_PARAM_CODE}" disabled="true" >
                    </div>
                </div>
            </div>
            
            
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="应用分类"/></div>
                <div class="list-right">
                    <div class="pane" style="position:relative" >
                    <div class="layui-form" lay-filter="pane1" style="position:absolute;float:left;" id="acttype0" >                     
                     <c:set var="typeval" value="${dataMap.TOA_CLASSIFY}"></c:set>
                     <select disabled verify="required" name="procedureMotionDto.toaClassify" id="procedureMotionDto_toaClassify">
                     <option  value=""><dict:lang value="--请选择--"/></option>
                     <c:forEach items="${dataMap.ACT_TYPE}" var="item">
                     <c:if test="${item.ACTIONTYPE_CODE==typeval}"><option selected value="${item.ACTIONTYPE_CODE}">${item.ACTIONTYPE_NAME}</option></c:if>
                     <c:if test="${item.ACTIONTYPE_CODE!=typeval}"><option  value="${item.ACTIONTYPE_CODE}">${item.ACTIONTYPE_NAME}</option></c:if>                     
                     </c:forEach>
                     </select>	
                    </div>
                     </div>
            </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="备注"/></div>
                <div class="list-right">
                <div class="pane">        
                        <input class="layui-input" style="height:38px;padding:8px;" disabled="true" cols="50" name="procedureMotionDto.toaRemark" id="procedureMotionDto_toaRemark" value="${dataMap.TOA_REMARK}" />
                </div> 
                </div>
            </div>
          
        
        <div class="ptop_10">
         	 <button type="button" class="layui-btn" id="addButten" onclick="preAdd()"><dict:lang value="新增"/></button>   
       	   	 <button type="button" class="layui-btn" id="eidtButten" onclick="preEdit()"><dict:lang value="编辑"/></button> 
             <button type="button" class="layui-btn layui-btn-danger" id="cancelButten" onclick="cancelView()"><dict:lang value="取消"/></button>   
        </div> 
       </form> 
    </div>
 

<script>
    layui.use(['form'], function(){
        var form = layui.form;
        form.render();
    })
    
   
    
    function preAdd(){
       var url = "${path}dmp/DmpMotionAction_preMotionModelAdd.ms";
 	    window.location.href= url;
    }
    
    
    function preEdit(){
        var url = "${path}dmp/DmpMotionAction_preMotionModelEdit.ms?paraMap.id="+$("#procedureMotionDto_id").val();
 	    window.location.href= url;
    }
         function cancelView(){
         var index = layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
         var url = "${path}dmp/DmpMotionAction_getMotionModel.ms?FUNC_CODE=F_1a394a7fda3a4856a594260b308eef69";
         window.location.href= url; 
         layer.close(index);      
        }       
  
</script>



</body>
</html>