<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="选择人员" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->
	<style type="text/css">
	
	li{
	     height: 25px
	}
	
	</style>

	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
			    <div class="optn">
			       
			    
			     <input type="hidden" id="_flowId" name="_flowId"  />			       
			       <input type="hidden" id="_variables" name="_variables"  />
			       <input type="hidden" id="_processTitle" name="_processTitle"  />
			        <button type="button" onclick="send(this);"><i class="ico ico-save"></i><dict:lang value="发送" /></button>
			       
			        <button type="button" onclick="closeCurrentWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    
			    </div>
			   
			</div>
			<div class="bd"     style='height: 300px;'>
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="5c2f3b4ea8794c74bbb3f75f07ac8c1d" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="5c2f3b4ea8794c74bbb3f75f07ac8c1d" />
	<input type="hidden" id="prefixInd" name="5c2f3b4ea8794c74bbb3f75f07ac8c1d" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d2dff6a9508743488b8c5d1c7c655b3f'" />
		<s:set name="_$formId_1" value="'5c2f3b4ea8794c74bbb3f75f07ac8c1d'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name"><span class="dot">*</span><dict:lang value="下一节点" /></td>
			<td class="dec" >
				<select name='usertask_name' id='usertask_id' class="dept_select" style="width: 240px; " onchange="usertask_change(this.value)">
					<option value=''></option>
				</select>
				<span class="Eng"><span id="userDto_dataauth_err"><c:out value='${errors["userDto.data_auth"][0]}' /></span></span>
			</td>		
		</tr>
		<tr>
			<td class="name"><span class="dot">*</span><dict:lang value="人员选择" /></td>
			<td class="dec" ><span></span>  </td>
		</tr>
		<tr>
		  <td class="name"></td>
		  <td class="dec" id="users_data">
		  
		  
		  </td>
		
		</tr>
		
	</table>
			<bu:jsVal formId="5c2f3b4ea8794c74bbb3f75f07ac8c1d" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	
	<script type="text/javascript">
	  var piframeId="<c:out value='${paraMap.piframeId}' />";
	  var flowType="<c:out value='${paraMap.flowType}' />";
	  var parentWindows = $(window.parent.document).contents().find("#"+piframeId)[0].contentWindow;
	  var _next=parentWindows.$("#_nextUser").val();
	  parentWindows.$("#_nextUser").val('');
	  var itemJson=JSON.parse(_next);
	  var next_tasks=itemJson.next_tasks;
	  //console.log(itemJson.next_tasks);
	  //$("#usertask_id").append("<option value='' class='select_name'>--<dict:lang value='请选择' />--</option>");
	  for(var i=0;i<next_tasks.length;i++){
	     $("#usertask_id").append("<option value='"+next_tasks[i].usertask_id+"'>"+next_tasks[i].usertask_name+"<option>");
	  }
	  $("#usertask_id").val(next_tasks[0].usertask_id);
	  $("#usertask_id").trigger("chosen:updated");
	  
	  var next_users=itemJson.next_users;
	  var htmlArr = [];
	  for(var i=0;i<next_users.length;i++){
	    htmlArr.push("<ul id='"+next_users[i].usertask_id+"' style='display:none;overflow:auto;height:190px'>");
	    var users=next_users[i].users;
	    for(var j=0;j<users.length;j++)
	    {
	       htmlArr.push("<li id='"+users[j].id+"' group_id='"+users[j].group_id+"' group_type='"+users[j].group_type+"'> ");
	       htmlArr.push("<input type='checkbox'>"+users[j].name+"（"+users[j].group_name+"）</li>");
	    }
	    htmlArr.push("</ul>");
	  }
	  $("#users_data").html(htmlArr.join(""));
	  document.getElementById(next_tasks[0].usertask_id).style.display="block";
	 
	  function send(){
                if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
                
                var next_users = []; 
                var isCheck;               
       	        $("#users_data ul").each(function (i,ele) {       	           
       	              var propertyMap= {};
                      propertyMap.usertask_id = $(ele).attr('id');
                      var users = []; 
                      $(ele).find('li').each(function (j) {
                        isCheck= $(this).find('input')[0].checked;
                        if(isCheck){
                           var userMap= {};
                           userMap.group_id=$(this).attr('group_id');
                           userMap.group_type=$(this).attr('group_type');
                           userMap.id=$(this).attr('id');
                           users.push(userMap);
                        }
                        
                      });
                      if(users.length==0)
                      {
                       return true;
                      }
                      propertyMap.users=users;
                      next_users.push(propertyMap);
                  
       	        });
       	        if(next_users.length==0)
                {
                   utilsFp.confirmIcon(1, "", "", "","<dict:lang value="请选择人员" />", 0, "260", "");
		           return false;
                 }
       	        
      	        parentWindows.$("#_nextUser").val(JSON.stringify(next_users)); 
      	        if(flowType=="1"){ //流程新增
      	        	 parentWindows.add();
      	        }else if(flowType=="2"){//流程修改
      	        	parentWindows.editFlowForm();
      	        }else if(flowType=="4"){//流程shenghe
      	            var type="<c:out value='${paraMap.type}' />";	      	            
      	        	parentWindows._complete(Number(type));
      	        }
      	        /* if(type!=''&&type!=null) 
      	        {//完成待办
      	          parentWindows._complete(type);
      	        } 
                else{
                  parentWindows.add();
                } */
                closeCurrentWindow();
            }
            
            
        function closeCurrentWindow(){
		   closeTopPopWinFp(window.frameElement.id + "pop");
	    }
	    
	    function usertask_change(value)
	    {
	       $("#users_data ul").css("display","none");
	       $("#"+value).css("display","block");
	    }
	    
	
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
