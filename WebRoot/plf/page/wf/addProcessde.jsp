<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="添加流程" /> 
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
	     <jsp:param name="layui" value="1" />
		<jsp:param name="popDivWin" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/wf/commonProcess.jsp"%>
	<link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
</head>

    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv='X-UA-Compatible' content='ie=edge'>
    <title></title>
   
</head>
<body>
     <div class="all">
        <div  class="add_table_div">
        <form id="add_form" name="add_form"  class="layui-form" action="${path}comm/WorkFlowAction_saveProcessde.ms" method="post" target="submitFrame" enctype="multipart/form-data">
         <input type="hidden" name="paraMap.flowTypeId" value='<s:property value="paraMap.flowTypeId"/>' >
        	<table class="add_table">
        		<tr>
						<td  class="tr1  title">
							<span class="Eng">*</span><dict:lang value="流程编码" />
						</td>
						
						<td style="width: 270px;">
							<input type="text" id="flowCode" name="paraMap.flowCode"  lay-verify="required">
						</td>
				</tr>
				<tr>
						<td  class="tr1 title">
							<span class="Eng">*</span><dict:lang value="流程名称" />
						</td>
						
						<td class="widget">
							<input type="text" id="flowName" name="paraMap.flowName" lay-verify="required" >
						</td>
				</tr>
				<tr>
						<td  class="tr1 title">
							<span class="Eng">*</span><dict:lang value="类别" />
						</td>
						
						<td class="widget">
							<select id="proc_de_kind_id" name="paraMap.proc_de_kind_id" lay-search="" lay-verify="required" >
								<c:forEach items="${flowTypeList }" var="item">
							      <option value="${item.id}">${item.name}</option>
							   </c:forEach>
							</select>
						</td>
				</tr>
				
				<tr>
						<td  class="tr1 title">
							<span class="Eng">*</span><dict:lang value="组织机构" />
						</td>
						
						<td class="widget">
							<select id="dept_org_id" name="paraMap.dept_org_id" lay-search="" lay-verify="required">
							<c:forEach items="${deptList }" var="item">
							  <option value="${item.ID}">${item.NAME}</option>
							</c:forEach>
								
							</select>
						</td>
				</tr>
				
				
				<tr >
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="图标" />
						</td>
						
						<td style="width: 270px;">
				<span id="photoImg" class="card-icon" >
				 	  <img id="preview"   >				 	
				 </span>
				<input type="hidden" id="iconPath" name="paraMap.iconPath" style="width:180px;" value='' readonly="readonly">	
				<input type="hidden" id="selectType" name="paraMap.selectType" >			
                <input type='button' value='<dict:lang value="系统图标库" />' id="select_system" class="layui-btn" onclick="chooseSysPic()">
				<input type="hidden" name="serverfileName" id="serverfileName" value="" />
				<input type='button' value='<dict:lang value="自定义图标" />' onclick="clickLocale()" id="select_locale" title="<dict:lang value='png透明底，28px*28px' moName='mc_plf' />" class="layui-btn">
				<input type="file" id="upFile" onchange="javascript:selectLoc(this);" style="display:none;" name="upFile" class="input isSubmit  _VAL_OjbsData">
						</td>
				</tr>
				
				<tr>
						<td  class="tr1 title">
							<dict:lang value="发起用户" />
						</td>
						<td class="widget">
							<s:textarea name="paraMap.launch" disabled="true" id="launch" cssStyle="width: 270px;height:60px;vertical-align:middle"/>					
							<input type='button' value='<dict:lang value="选择" />' id="" class="layui-btn" style="vertical-align:middle" onclick="chooseLaunch()">
							<input type="hidden" id="priv_group_ids" name="paraMap.priv_group_ids" />
							<input type="hidden" id="priv_user_ids" name="paraMap.priv_user_ids" />
						</td>
				</tr>
				
				<tr>
						<td  class="tr1 title">
							<dict:lang value="说明" />
						</td>
						<td class="widget">
							<s:textarea name="paraMap.rel_desc"  id="rel_desc" cssStyle="width: 270px;"/>
						</td>
				</tr>
				
        	</table>
    
               <div class="ptop_10 txac">					
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit"><dict:lang value="提交" /></button>
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
		      </div>
        </form>
       </div>
</div>
    <div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
    <jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</body>
</html>

<script type="text/javascript">
var flowTypeId="<c:out value='${paraMap.flowTypeId}' />";
if(flowTypeId!=''){
  $("#proc_de_kind_id").val(flowTypeId);
  $("#proc_de_kind_id").attr("disabled",true);
}
var isSubmit = false;

function configcorp(){
    if(isSubmit){};
 
	var flowName = document.getElementById("flowName");
	if(val.isBlank(flowName)){
	   
	   	_alertValMsg(flowName,"<dict:lang value="流程名称" /> -- <dict:lang value="不能为空" />");
   		return false;
	}	
	document.forms.add_form.submit();
	isSubmit = true;	
}



$(function(){
		layui.use('form', function(){
	    	  var form = layui.form;   	  
			
           
			form.on('submit(filterSubmit)', function (data) {
           	   $("#proc_de_kind_id").attr("disabled",false);
		       return true;
				       
			}); 
           
	    });
	    
	});

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>