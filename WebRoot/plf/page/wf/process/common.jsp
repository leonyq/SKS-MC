<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<script type="text/javascript"><%-- 业务模型公用JS页面 --%>
function reloadPg(msg,title,width,height,time){                      
     msgPop(msg,reloadPgExe,title,width,height,time);
}
function reloadPgExe(){                       
         query('formId1');
         top.$(".dialog-close").click();
}
function queryProcess(bar){
        $("#"+bar).empty();
	    //$("#"+bar).append("<option value='' class='select_name'>--<dict:lang value='请选择' />--</option>");	  
	  jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}comm/ProcessAction_queryProcess.ms",
 			success: function(data){
 				var pList=data.ajaxMap.listData; 
 				var arr = [];
 				arr.push("<option value=''>--<dict:lang value='请选择' />--</option>");
 				for(var i=0;i<pList.length;i++){ 	
 					arr.push("<option value='"+pList[i].proc_de_id+"'>"+pList[i].name+"</option>");
 				}
 				$("#"+bar).html(arr.join(""));
 				$("#"+bar).trigger("chosen:updated");

 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				
 		   }
 		});

	}	   
	function selectAll(){
		if ($("#SelectAll").attr("checked")){
			$(":checkbox").attr("checked",true);
			$("#listTable :checkbox").parents("tr").css("background-color","#d3eafc");
		}else{
			$(":checkbox").attr("checked",false);
			$("#listTable :checkbox").parents("tr").css("background-color","");
		}
	}
	
function showDetail(task_id,process_id,type){	    	
		
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/ProcessAction_queryTaskView.ms",
			    data: {
			    	'paraMap.taskId' : task_id,
			    	'paraMap.processId' : process_id,
			    	'paraMap.type' : type
			    },
				success: function(data){
				   if(data.ajaxMap != null)
				   {
				      if(data.ajaxMap.errmsg!=null)
				      {
				        utilsFp.confirmIcon(1, "", "", "",data.ajaxMap.errmsg, 0, "300", "");
		                return false;
				      }
				      var piframeId = parent.window.frameElement.id;
				      var viewId=data.ajaxMap.viewId;
				      var dataId=data.ajaxMap.dataId;
				      var url = "${path}buss/bussModel.ms?piframeId="+piframeId+"&exeid="+viewId+"&taskId="+task_id+"&processId="+process_id+"&flowType=3";
					  if(dataId!=null&&dataId!='')
					  {
					    url+="&dataId="+dataId;
					  }
					  showPopWinFp(url, 900, 600, "", "<dict:lang value='查看'/>","showDetail", "");
				   }
				},
				error: function(msg){
						
					if(msg.readyState!=0){
     					util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
					}
				  }
				});
	}	
	function queryUser()
    {
       var piframeId = parent.window.frameElement.id;
       var ciframeId = window.frameElement.id;
       var url = "${path}comm/ProcessAction_queryUserPage.ms?piframeId="+piframeId+"&ciframeId="+ciframeId;
       showPopWinFp(url, 800, 465,null,'<dict:lang value="人员选择" />','queryUserPage');        
    }	
</script>