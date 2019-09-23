<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="选择接口页面" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	
		<div >
			<div  class="add_table_div">
			<form id="addForm" name="addForm" class="layui-form" method="post" target="submitFrame">
				<table class="add_table">
					<!--  
					<tr>
						<td colspan="4">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					-->
					
					<tr>
						<td class="tr1 title">
							<dict:lang value="包路径" />
						</td>
						<td class="widget">
							<input type="text" lay-verify="required" id="packPath" class="_VAL_NULL"  />
						</td>
					</tr> 
					
					<tr>
					<td class="tr1 title">
							<dict:lang value="实现接口" />
						</td>
						<td class="widget">
							
							<dict:selectDict name="config.Inter" id="Inter"  dictCode="INTERF_SELECT" dictValue="${fn:escapeXml(paramMap.Inter)}" />
						</td>
					</tr>
					
					<tr>
						<td class="tr1 title">
							<dict:lang value="类名" />
						</td>
						<td class="widget">
							<input type="text" id="className" class="_VAL_NULL" />
						</td>
					</tr> 
				</table>	
				<input type="hidden" id="id" name="paraMap.id" value="<s:property value="ajaxMap.id"/>">
			</form>
			</div>
			
		</div>
		<div class="ptop_10 txac">
			<input type="button" value="<dict:lang value="生成模版" />" onclick="save(this);" class="layui-btn">
			<input type="button" value="<dict:lang value="不生成模版" />" onclick="cancle(this);" class="layui-btn layui-btn-danger">
		</div>


	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function save(thisObj){
		var Inter = $("#Inter").val();
		var packPath = $("#packPath").val();
		var className = $("#className").val();
		
		//parent.showSelectMeth(Inter,packPath,className);
		var obj={"isFramesetMethod":false,"type":"window"};
		getSrcDom(obj).showSelectMeth(Inter,packPath,className,window.frameElement.name,'${listIframeName}');
		
	}
	function cancle(thisObj){
		//parent.showBlankMeth();
		var obj={"isFramesetMethod":false,"type":"window"};
		getSrcDom(obj).showBlankMeth(window.frameElement.name,'${listIframeName}');
	}
	
	$(function(){
		layui.use('form', function(){
	    	  var form = layui.form;
	    	  
           
	    });
	    
	})
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>