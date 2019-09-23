<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="java.util.Map"%>

 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>

<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="任务代理" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>

 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
               <jsp:param name="modelName" value="VIEW_TYPE_11" />
                <jsp:param name="location" value="editForm" />
            </jsp:include> 
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>

</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                
			    <div class="optn">
			    	        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="overflow:auto;height:430px" id="main" >
				
					<table>
						<tr>
							<td class="name" style="width:150px"><input type="checkbox"
								id='agent_all_status'
								<c:if test="${defaultTimeMap.status==1 }"> checked="checked" </c:if>><span><dict:lang
										value="所有代理时间设置为" />
							</span>
							</td>
							<td class="dec" style="width:400px">
								<div style="display:inline-block">
									<input id="agent_all_start_time" style="width: 160px;"
										value="${defaultTimeMap.start_time }" class=" input  WdateNomorl"
										onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'createTime1\')}' })"
										readonly="readOnly" autocomplete="off" save_mark="0">
								</div> <span class="txt">~</span>
								<div style="display:inline-block">
									<input id="agent_all_end_time" style="width: 160px;"
										value="${defaultTimeMap.end_time }" class=" input  WdateNomorl"
										onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'createTime0\')}' })"
										readonly="readOnly" autocomplete="off" save_mark="0">
								</div></td>
						</tr>
					</table>
				
<div class="mod" >
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="默认设置" /></h3>	
  </div>
  <div class="mod-hd" style="height:50px;border-bottom:0;">
	<table >
	
		<tr>		        
			<td class="name" style="width:90px"><span><dict:lang value="默认代理人" /></span></td>
			<td  class="dec" style="width:300px"> 
			 <input type="hidden" id='agent_default_userId' value="${defaultMap.agent_user_id }">
			 <input type="text"  id="agent_default_userName" class="input input-box" readonly="readonly" value="${defaultMap.agent_user_name }">
	              <img onclick="queryUser('agent_default_userId','agent_default_userName')" src="${path }plf/page/fp/img/ico-search-h-c.png" style="position:relative;top: 1px;left: -20px;cursor:pointer;">
			</td>
					
		    <td class="name" style="width:90px"><span><dict:lang value="默认代理时间" /></span></td>
			<td  class="dec" style="width:400px"> 						     
                    <div  style="display:inline-block">	
						      <input id="createTime0" style="width: 160px;"  value="${defaultMap.start_time }" class=" input  WdateNomorl" onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'createTime1\')}' })" readonly="readOnly" autocomplete="off" save_mark="0">
					   </div>
					  <span class="txt">~</span>
					  <div  style="display:inline-block">	
						 <input id="createTime1" style="width: 160px;"  value="${defaultMap.end_time }" class=" input  WdateNomorl" onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'createTime0\')}' })" readonly="readOnly" autocomplete="off" save_mark="0">
					  </div>   			
		    </td>	
		    
		    <td class="name" style="width:90px"><input type="checkbox" id='agent_default_status' <c:if test="${defaultMap.status==1 }"> checked="checked" </c:if> ><span><dict:lang value="启用" /></span></td>   
		</tr>
	
	</table>
	</div>
		
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="按岗位设置" /></h3>	
        </div>
        <div class="mod-hd" style="height:auto;border-bottom:0;">	
	     
					<table class="dlist-table table-line "
						style="width: 80%;table-layout:fixed;">
						<thead>
							<tr class="thcolor">
								
								<th style="width: 120px;text-align: center;"><dict:lang value="岗位" /></th>
								<th style="width: 350px;text-align: center;"><dict:lang value="代理时间" /></th>
								<th style="width: 200px;text-align: center;"><dict:lang value="代理人" /></th>
								<th style="width: 100px;text-align: center;"></th>
							</tr>
						</thead>
						
					</table>
					<div style="height: auto;" >
						<table class="dlist-table" style="width: 80%;table-layout:fixed;"
							id="postTable">
							
						<tbody id="addPostList">
							<c:forEach items="${position }" var="p" varStatus="status">
							<tr>
							 <td style="width: 120px;text-align: center;">
							 <input type="hidden" id="user_dept_position_id${status.index}" value="${p.user_dept_position_id}"  >							 
							 ${p.dept_position_name}</td>
							 <td style="width: 350px;text-align: center;">
							 <div  style="display:inline-block">	
						      <input id="startTime${status.index}" style="width: 160px;"  value="${p.start_time }" class=" input  WdateNomorl" onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endTime${status.index}\')}' })" readonly="readOnly" autocomplete="off" save_mark="0">
					         </div>
					         <span class="txt">~</span>
					         <div  style="display:inline-block">	
						        <input id="endTime${status.index}" style="width: 160px;"  value="${p.end_time }" class=" input  WdateNomorl" onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startTime${status.index}\')}' })" readonly="readOnly" autocomplete="off" save_mark="0">
					         </div>
							 </td>
							 <td style="width: 200px;text-align: center;">
							<input type="hidden" id="agent_positions_userId${status.index}"  value="${p.agent_user_id }" class="_VAL_NULL isSubmit input _VAL_DATABASE">
							<input  type="text" id="agent_positions_userName${status.index}" value="${p.agent_user_name }" class="input _VAL_NULL isSubmit input _VAL_DATABASE ico-search-input" 
							onclick="queryUser('agent_positions_userId${status.index}','agent_positions_userName${status.index}')" readonly="readonly"> </td>
							 <td style="width: 100px;text-align: center;"><input type="checkbox" id="agent_positions_status${status.index}" <c:if test="${p.status==1 }"> checked="checked" </c:if> ><span><dict:lang value="启用" /></span></td>
							</tr>
							
							</c:forEach>
							</tbody>
						</table>
					</div>
				
	</div>
	
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="按流程设置" /></h3>	
        <div class="extend-btn"
							style="float: right;margin-right:240px;margin-top:5px;">
							<button type="button"
								onclick="addProcess();"
								style="padding:0;" title="<dict:lang value='添加' />">
								<i class="ico ico-kl-new-add ico-small"></i>
							</button>
							
							<button type="button" onclick="delProcess();" style="padding:0"
								title="<dict:lang value='移除' /> ">
								<i class="ico ico-sc-new-add ico-small"></i>
							</button>


						</div>
        </div>
        <div class="mod-hd" style="height:auto;border-bottom:0;">	
	     
					<table class="dlist-table table-line "
						style="width: 80%;table-layout:fixed;">
						<thead>
							<tr class="thcolor">
								<th style="width: 30px;text-align: center;box-sizing: border-box;">
								<input type="checkbox" id="allSelect2" name="allSelect2" />
								</th>
								<th style="text-align: center;"><dict:lang value="流程名称" /></th>
								<th style="width: 350px;text-align: center;"><dict:lang value="代理时间" /></th>
								<th style="width: 240px;text-align: center;"><dict:lang value="代理人" /></th>
								<th style="width: 100px;text-align: center;"></th>
							</tr>
						</thead>
						
					</table>
					<div style="height: auto" >
						<table class="dlist-table" style="width: 80%;table-layout:fixed;"
							id="processTable">
							
						<tbody id="addProcessList">
							<c:forEach items="${process }" var="p" varStatus="status">
							<tr id="${p.id}">
							<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='processId' value=''/></td>
							
							 <td style="text-align: center;">
							 <input type="hidden" id="proc_de_id${p.id}" value="${p.proc_de_id}"  >							 
							 ${p.proc_de_name}</td>
							 <td style="width: 350px;text-align: center;">
							 <div  style="display:inline-block">	
						      <input id="startTime${p.id}" style="width: 160px;"  value="${p.start_time }" class=" input  WdateNomorl" onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endTime${p.id}\')}' })" readonly="readOnly" autocomplete="off" save_mark="0">
					         </div>
					         <span class="txt">~</span>
					         <div  style="display:inline-block">	
						        <input id="endTime${p.id}" style="width: 160px;"  value="${p.end_time }" class=" input  WdateNomorl" onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startTime${p.id}\')}' })" readonly="readOnly" autocomplete="off" save_mark="0">
					         </div>
							 </td>
							 <td style="width: 240px;text-align: center;">
							<input type="hidden" id="agent_positions_userId${p.id}"  value="${p.agent_user_id }" class="_VAL_NULL isSubmit input _VAL_DATABASE">
							<input  type="text" id="agent_positions_userName${p.id}" value="${p.agent_user_name }" class="input _VAL_NULL isSubmit input _VAL_DATABASE ico-search-input" 
							onclick="queryUser('agent_positions_userId${p.id}','agent_positions_userName${p.id}')" readonly="readonly"> </td>
							 <td style="width: 100px;text-align: center;"><input type="checkbox" id="agent_positions_status${p.id}" <c:if test="${p.status==1 }"> checked="checked" </c:if> ><span><dict:lang value="启用" /></span></td>
							</tr>
							
							</c:forEach>
							</tbody>
						</table>
					</div>
				
	</div>
	
	           </div>
	      </div>

       </form>
   </div>
		

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
	function queryUser(domId,domName)
    {
       var piframeId = '';
       var ciframeId = window.frameElement.id;
       var url = "${path}comm/ProcessAction_queryUserPage.ms?piframeId="+piframeId+"&ciframeId="+ciframeId+"&domId="+domId+"&domName="+domName;
       showPopWinFp(url, 800, 465,null,'<dict:lang value="人员选择" />','queryUserPage');        
    }
    
    function addProcess()
    {
       
       var ciframeId = window.frameElement.id;
       var url = "${path}comm/ProcessAction_selProcessPage.ms?ciframeId="+ciframeId;
       showPopWinFp(url, 800, 465,null,'<dict:lang value="流程选择" />','selProcessPage');        
    }
    
    function delProcess()
    {
     if($("input:checkbox[name='processId']:checked").length==0)
	{
		utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		return false;
	}
	 utilsFp.confirmIcon(1,"","delConfirm","", "<dict:lang value="确认删除吗" />",1,"300","");
    
    }
    
    function delConfirm(){
		$("input:checkbox[name='processId']:checked").each(function (){
           $(this).parents('tr').remove();
        });
   }
    
    function addProcessRow(flowId,flowName)
    {
    var uuid=util.getUUID();
     var str ="<tr id='"+uuid+"' >";	
	 str += "<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='processId' value=''/></td>";
	 str +="<td style='text-align: center;'>";
	 str +=	"  <input type='hidden' id='proc_de_id"+uuid+"' value='"+flowId+"'  >"+flowName+"</td>";
	 str +="<td style='width: 350px;text-align: center;'>";
	str +=	"<div  style='display:inline-block'>";				 	
	str +=	" <input id='startTime"+uuid+"' style='width: 160px;'  value='' class=' input  WdateNomorl' onclick=\"WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\\'endTime"+uuid+"\\')}' })\" readonly='readOnly' autocomplete='off' >";
	str +=	"				         </div>";
	str +=	"				         <span class='txt'>~</span>";
	str +=	"				         <div  style='display:inline-block'>";	
	str +=	"					        <input id='endTime"+uuid+"' style='width: 160px;'  value='${p.end_time }' class=' input  WdateNomorl' onclick=\"WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\\'startTime"+uuid+"\\')}' })\" readonly='readOnly' autocomplete='off' >";
	str +=	"				         </div>";
	str +=	"						 </td>";
	str +=	"	<td style='width: 240px;text-align: center;'>";
	str +=	"	<input type='hidden' id='agent_positions_userId"+uuid+"'   class='_VAL_NULL isSubmit input _VAL_DATABASE'>";
	str +=	"	<input  type='text' id='agent_positions_userName"+uuid+"'  class='input _VAL_NULL isSubmit input _VAL_DATABASE ico-search-input'";
	str +=	"		onclick=\"queryUser('agent_positions_userId"+uuid+"','agent_positions_userName"+uuid+"')\" readonly='readonly'> </td>";
	str +=	"	<td style='width: 100px;text-align: center;'><input type='checkbox' id='agent_positions_status"+uuid+"'  ><span><dict:lang value='启用' /></span></td>";
	str +=	"						</tr>	";	
	$("#addProcessList").append(str);														
    }
    
    function add(thisObj){
		
		var agent_all_time={};
		agent_all_time.start_time=$('#agent_all_start_time').val();
		agent_all_time.end_time=$('#agent_all_end_time').val();
		agent_all_time.status=0;
		if($('#agent_all_status').is(":checked")){
		  agent_all_time.status=1;
		}
		
		var agent_default={};
		agent_default.agent_user_id=$('#agent_default_userId').val();
		agent_default.start_time=$('#createTime0').val();
		agent_default.end_time=$('#createTime1').val();
		agent_default.status=0;
		if($('#agent_default_status').is(":checked")){
		  agent_default.status=1;
		}
		
		var agent_positions=[];
		var $itemtr = $('#addPostList  tr');
		var rowCount=$itemtr.length;
		if ($itemtr.length>0) {	
			var itemS;		 	
			for ( var i = 0; i < rowCount; i++) {
				itemS = {};
				//itemS.user_dept_position_id = $itemtr.eq(i).find('td').eq(1).find('input').val();
				itemS.start_time = $("#startTime"+i).val();
				itemS.end_time = $("#endTime"+i).val();
				itemS.agent_user_id = $("#agent_positions_userId"+i).val();
				itemS.user_dept_position_id=$("#user_dept_position_id"+i).val();
				itemS.status=0;
				if($('#agent_positions_status'+i).is(":checked")){
		          itemS.status=1;
		        }
				agent_positions.push(itemS);
				}
		}
		
		var agent_wflow=[];
		var $itemtr = $('#addProcessList  tr');
		var rowCount=$itemtr.length;
		if ($itemtr.length>0) {	
			var itemS;		 	
			for ( var i = 0; i < rowCount; i++) {
				itemS = {};
				var uid = $itemtr.eq(i).attr('id');
				itemS.start_time = $("#startTime"+uid).val();
				itemS.end_time = $("#endTime"+uid).val();
				itemS.agent_user_id = $("#agent_positions_userId"+uid).val();
				itemS.proc_de_id=$("#proc_de_id"+uid).val();
				itemS.status=0;
				if($('#agent_positions_status'+uid).is(":checked")){
		          itemS.status=1;
		        }
				agent_wflow.push(itemS);
				}
		}
		
		jQuery.ajax({
				type : "POST",
				dataType : "json",
				url :"comm/ProcessAction_saveAgent.ms",
				data:{'agent_all_time':JSON.stringify(agent_all_time),'agent_default':JSON.stringify(agent_default),
				'agent_positions':JSON.stringify(agent_positions),'agent_wflow':JSON.stringify(agent_wflow)},
				success : function(data) {
				    if(data.ajaxMap != null)
				   {
				      if(data.ajaxMap.errmsg!=null)
				      {
				        //util.alert(data.ajaxMap.errmsg);
				         utilsFp.confirmIcon(1, "", "", "",data.ajaxMap.errmsg, 0, "260", "");
				        return false;
				      }
				       msgPop(data.ajaxMap.alertMsg, '', data.ajaxMap.title, data.ajaxMap.width, data.ajaxMap.height, data.ajaxMap.time);
				     
				   }
				
						

				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					util.closeLoading();

				}
			});
        
	}
      
	$(function() {
            _newScroll("main");  
		});
	
	</script>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
