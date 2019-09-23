<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="复制-新增" /> 
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
    <style>
       
        
    </style>
</head>
<body>
     <div class="all" >
        <div  class="add_table_div">
        <form id="add_form" name="add_form"  class="layui-form" action="${path}comm/WorkFlowAction_saveProcessde.ms" method="post" target="submitFrame" enctype="multipart/form-data">
               <input type="hidden" id="copy" name="paraMap.copy" value='1' >
                <input type="hidden" id="flowId" name="paraMap.flowId" value='${paraMap.flowId }' >
        	<table class="add_table">
        		<tr>
						<td  class="tr1  title">
							<span class="Eng">*</span><dict:lang value="流程编码" />
						</td>
						
						<td style="width: 270px;">
							<input type="text" id="flowCode" name="paraMap.flowCode"  value='${paraMap.code }'  lay-verify="required">
						</td>
				</tr>
				<tr>
						<td  class="tr1 title">
							<span class="Eng">*</span><dict:lang value="流程名称" />
						</td>
						
						<td class="widget">
							<input type="text" id="flowName" name="paraMap.flowName" value='${paraMap.proc_de_show_name }' lay-verify="required" >
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
							<span class="Eng">*</span><dict:lang value="来源" />
						</td>
						
						<td class="widget">
							<input type="text" id="fromflowName" name="paraMap.fromflowName" readonly="readonly" disabled="disabled" value='${paraMap.proc_de_show_name }'  >
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
				 	  <img id="preview" src="${path}${paraMap.icon_path}" >				 	
				</span>
				<input type="hidden" id="iconPath" name="paraMap.iconPath" style="width:180px;" value='${paraMap.iconPath }' readonly="readonly">	
				<input type="hidden" id="selectType" name="paraMap.selectType" value='${paraMap.selectType }'>			
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
							<s:textarea name="paraMap.launch" disabled="true"  id="launch" cssStyle="width: 270px;height:60px;vertical-align:middle"/>					
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
							<s:textarea name="paraMap.rel_desc"  id="rel_desc" cssStyle="width: 270px;" value='${paraMap.rel_desc }'/>
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
var flowTypeId="<c:out value='${paraMap.proc_de_kind_id}' />";

if(flowTypeId!=''){
  $("#proc_de_kind_id").val(flowTypeId);
  //$("#proc_de_kind_id").attr("disabled",true);
}
var dept_org_id="<c:out value='${paraMap.dept_org_id}' />";
$("#dept_org_id").val(dept_org_id);
 
var launchHt=[];
var priv_group_ids='';
var priv_user_ids='';
var privName='';
var priv_groupsArr=JSON.parse('${paraMap.priv_groups}');

for(var i=0;i<priv_groupsArr.length;i++)
{
 if(privName=='') privName=priv_groupsArr[i].name;
 else privName+='\n'+priv_groupsArr[i].name;
 
 if(priv_group_ids=='') priv_group_ids=priv_groupsArr[i].id;
 else priv_group_ids+=';'+priv_groupsArr[i].id;
 var launchHtA={};
 launchHtA.id=priv_groupsArr[i].id;
 launchHtA.name=priv_groupsArr[i].name;
 launchHtA.stype=1;
 launchHt.push(launchHtA);
}

var priv_usersArr=JSON.parse('${paraMap.priv_users}');;
for(var i=0;i<priv_usersArr.length;i++)
{
 if(privName=='') privName=priv_usersArr[i].name;
 else privName+='\n'+priv_usersArr[i].name;
 
 if(priv_user_ids=='') priv_user_ids=priv_usersArr[i].id;
 else priv_user_ids+=';'+priv_usersArr[i].id;
var launchHtA={};
 launchHtA.id=priv_usersArr[i].id;
 launchHtA.name=priv_usersArr[i].name;
 launchHtA.stype=2;
 launchHt.push(launchHtA);
}
$("#launch").html(privName);
$("#priv_group_ids").val(priv_group_ids);
$("#priv_user_ids").val(priv_user_ids);

var isSubmit = false;

function exportFlow(){
  var flowId=$("#flowId").val();
  var modelUrl="<c:out value='${modelUrl}' />";
  window.open(modelUrl+flowId,'_blank');
}

function disableFlow(type){
   var paramObj =new Object;
   var flowId=$("#flowId").val();
   paramObj.id=flowId;
   paramObj.type=type;
   if(type==0){
      util.confirm(disableConfirm,"<dict:lang value='确认停用' />",paramObj);
   }
   else{
      util.confirm(disableConfirm,"<dict:lang value='确认启用' />",paramObj);
   }
   
}

function disableConfirm(paramObj){
	  
        	$.ajax({
						url : "${path}comm/WorkFlowAction_disable.ms",
						data: {'paraMap.flowId':paramObj.id,'paraMap.type':paramObj.type},						
						type : "post",
						dataType : "json",
						success : function(data) {
						    
						    if(data.ajaxMap!=null){
						        //alertInfo(data.ajaxMap.message);
							   	top.util.alert(data.ajaxMap.message);
							   	if(data.ajaxMap.flag=='success'){
							   	  closePopWin();
							   	  var mcIframeName="<c:out value='${mcIframeName}' />";
                                  var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
							   	  mcWindow.location.reload();
							   	}
						    }
						    
							
						},
						error : function(msg) {
							util.closeLoading();
							
						}
					});
	}


function copyFlow(){
     var id=$("#flowId").val();
     var mcIframeName="<c:out value='${mcIframeName}' />";
      var url='${path}/comm/WorkFlowAction_editProcessde.ms?paraMap.copy=1&paraMap.flowId='+id+'&mcIframeName='+mcIframeName;
      showPopWin(url, 800, 580,null,"<dict:lang value='复制-新增' />");
    }



$(function(){
		layui.use('form', function(){
	    	  var form = layui.form;   	  
			
           
			form.on('submit(filterSubmit)', function (data) {
           	   $("#proc_de_kind_id").attr("disabled",false);
		       return true;
				       
			}) 
           
	    });
	    
	})

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>