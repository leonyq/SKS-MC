<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title><dict:lang value="算法模型信息查看"/></title>
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
		.list-left{
    margin-left: 0px;
}
	</style>
</head>
<body>
    <div class="layui-fluid">
        <div class="headline"><dict:lang value="查看"/></div>
      	<div class="codeView" onclick="toCodeView()"></div>
        <form id="add_form" class="layui-form" name="addForm" action="${path}dmp/DmpAction_algorithModelEdit.ms" method="post">
        	<input type="hidden" value='${dataMap.WPL_DESC}' id="procedureDto_wplDesc">
        	<input type="hidden" value="${dataMap.id}" id="procedureDto_id" name="procedureDto.id">
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="算法名称"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text"  class="layui-input" name="procedureDto.wplCode" id="procedureDto_wplCode" value="${dataMap.WPL_CODE}" disabled="true">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="算法描述"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" class="layui-input" name="procedureDto.wplName" id="procedureDto_wplName" value="${dataMap.WPL_NAME}"disabled="true" >
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="应用分类"/></div>
                <div class="list-right">
                    <div class="pane" >
                     <select disabled="disabled"  verify="required" name="procedureDto.wplType" id="procedureDto_wplType">
                     <c:set var="typeval" value="${dataMap.WPL_TYPE}"></c:set>
                     <option  value=""><dict:lang value="--请选择--"/></option>
                     <c:forEach items="${dataMap.ALG_TYPE}" var="item">
                     <c:if test="${item.MODELTYPE_CODE == typeval}"><option selected value="${item.MODELTYPE_CODE}">${item.MODELTYPE_NAME}</option></c:if>
                     <c:if test="${item.MODELTYPE_CODE != typeval}"><option value="${item.MODELTYPE_CODE}">${item.MODELTYPE_NAME}</option></c:if>
                     </c:forEach>
                     </select>	                     	
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="算法模型详情说明"/></div>
                <div class="list-right">
                        <script id="editor" disabled="true" name="procedureDto.wplDesc" type="text/plain" style="height:350px"  ></script>
                </div>
            </div>
          
        
        <div class="ptop_10"  style="z-index:1000">
         	 <button type="button" class="layui-btn" id="addButten" onclick="preAdd()"><dict:lang value="新增"/></button>   
       	   	 <button type="button" class="layui-btn" id="eidtButten" onclick="preEdit()"><dict:lang value="编辑"/></button> 
             <button type="button" class="layui-btn layui-btn-danger" id="cancelButten" onclick="cancelView()"><dict:lang value="取消"/></button>   
        </div> 
       </form> 
    </div>
 

<script>
bulidEvenForDmpIcon();
function bulidEvenForDmpIcon(){
	$('.search').attr('title',"<dict:lang value='查询'/>");
	$('.icolist').attr('title',"<dict:lang value='列表'/>");
	$('.icocard').attr('title',"<dict:lang value='卡片'/>");
	$('.codeView').attr('title',"<dict:lang value='源码'/>");
	$('.code2').attr('title',"<dict:lang value='源码'/>");
	$('.code3').attr('title',"<dict:lang value='源码'/>");
	$('.add').attr('title',"<dict:lang value='添加'/>");
	$('.toRight').attr('title',"<dict:lang value='右移'/>");
	$('.toLeft').attr('title',"<dict:lang value='左移'/>");
	$('.edit').attr('title',"<dict:lang value='修改'/>");
	$('.close').attr('title',"<dict:lang value='删除'/>");
	$('.play').attr('title',"<dict:lang value='启动'/>");
	$('.pause').attr('title',"<dict:lang value='停止'/>");
	
}


    layui.use(['form'], function(){
        var form = layui.form;
        
        form.render();
    })
    
   
    
    function preAdd(){
        var url = "${path}dmp/DmpAction_preAlgorithModelAdd.ms";
 	    window.location.href= url;
    }
    
    
    function preEdit(){
        var url = "${path}dmp/DmpAction_preAlgorithModelEdit.ms?paraMap.id="+$("#procedureDto_id").val();
 	    window.location.href= url;
    }
    
    function toCodeView(){
     	$.post("${path}dmp/DmpAction_isHaveSourceCode.ms",{code:$("#procedureDto_wplCode").val()},function(res){
  		    if(res.ajaxMap.state==1){
  		    	layer.msg("<dict:lang value='未找到该模型源码'/>", {time: 1000, icon:5});
  		    }else{
  		        var url = "${path}dmp/DmpAction_preAlgorithModelSourceCode.ms?paraMap.code="+$("#procedureDto_wplCode").val()+"&paraMap.id="+$("#procedureDto_id").val();
  	 	    	window.location.href= url;
  		    }
        });
    }
</script>


<script type="text/javascript">
    //实例化编辑器
    var ue = UE.getEditor('editor', {
    toolbars: [
        [
         'undo', //撤销
         'bold', //加粗
         'underline', //下划线
         'preview', //预览
         'horizontal', //分隔线
         'inserttitle', //插入标题
         'cleardoc', //清空文档
         'fontfamily', //字体
         'fontsize', //字号
         'paragraph', //段落格式
         'simpleupload', //单图上传
         'attachment', //附件
         'inserttable', //插入表格
         'justifyleft', //居左对齐
         'justifyright', //居右对齐
         'justifycenter', //居中对
         'justifyjustify', //两端对齐
         'forecolor', //字体颜色
         'fullscreen', //全屏
         'customstyle', //自定义标题
         'template', //模板
             ]
        ]
    });
    ue.addListener("ready",function(){
    	ue.setContent($("#procedureDto_wplDesc").val());
    });
    
    ue.ready(function() {
        //不可编辑
        ue.setDisabled();
     });
         function cancelView(){
         var index = layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
         var url = "${path}dmp/DmpAction_getAlgorithModel.ms?FUNC_CODE=F_b12dbdfb400742e18c2bc59671ce99e0";
        window.location.href= url; 
        layer.close(index);      
        }   
</script>


</body>
</html>