<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>算法模型信息新增</title>
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
	
	</style>
</head>
<body>
    <div class="layui-fluid">
        <div class="headline"><dict:lang value="动作模型信息-查看"/></div>
        <form id="add_form" class="layui-form" name="addForm" action="${path}dmp/DmpMotionAction_MotionModelEdit.ms" method="post">
        	<input type="hidden" value="${dataMap.TOA_REMARK}" id="procedureDto_toaRemark">
        	<input type="hidden" value="${dataMap.id}" id="procedureMotionDto_id" name="procedureMotionDto.id">
            <div class="layui-form-item">
                <div class="list-left">动作代码</div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text"  class="layui-input" name="procedureMotionDto.toaCode" id="procedureMotionDto_toaCode" value="${dataMap.TOA_CODE}" disabled="true">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left">动作说明</div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" class="layui-input" name="procedureMotionDto.toaName" id="procedureMotionDto_toaName" value="${dataMap.TOA_NAME}" disabled="true" >
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left">提示信息</div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" class="layui-input" name="procedureMotionDto.toaMsgCode" id="procedureMotionDto_toaMsgCode" value="${dataMap.TOA_MSG_CODE}" disabled="true" >
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left">参数代码</div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" class="layui-input" name="procedureMotionDto.toaParamCode" id="procedureMotionDto_toaParamCode" value="${dataMap.TOA_PARAM_CODE}" disabled="true" >
                    </div>
                </div>
            </div>
            
            
            <div class="layui-form-item">
                <div class="list-left">动作模型类型</div>
                <div class="list-right">
                    <div class="pane" >
                     	<dict:selectDict  disabled="true"  dictCode="TOA_CLASSIFY" dictValue="%{dataMap.TOA_CLASSIFY}" name="procedureMotionDto.toaClassify" id="procedureMotionDto_toaClassify" custom_option="<option value=''>%{getText('--请选择--')}</option>" />
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left">备注</div>
                <div class="list-right">
                        <textarea class="layui-input" style="height:350px" cols="50" name="procedureMotionDto.toaRemark" id="procedureMotionDto_toaRemark" value="" >${dataMap.TOA_REMARK}</textarea>
                </div>
            </div>
          
        
        <div class="ptop_10">
         	 <button type="button" class="layui-btn" id="addButten" onclick="preAdd()"><dict:lang value="新增"/></button>   
       	   	 <button type="button" class="layui-btn" id="eidtButten" onclick="preEdit()"><dict:lang value="编辑"/></button> 
             <button type="button" class="layui-btn layui-btn-danger" id="cancelButten" onclick="window.history.back()"><dict:lang value="取消"/></button>   
        </div> 
       </form> 
    </div>
 

<script>
   
    
   
    
    function preAdd(){
       var url = "${path}dmp/DmpMotionAction_preMotionModelAdd.ms";
 	    window.location.href= url;
    }
    
    
    function preEdit(){
        var url = "${path}dmp/DmpMotionAction_preMotionModelEdit.ms?paraMap.id="+$("#procedureMotionDto_id").val();
 	    window.location.href= url;
    }
    
  
</script>


<script type="text/javascript">
    
    
</script>
</body>
</html>