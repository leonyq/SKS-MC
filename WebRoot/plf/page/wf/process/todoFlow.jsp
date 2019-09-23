<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="待办事宜" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		<jsp:param name="datePicker" value="1" />
		</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/wf/process/common.jsp"%>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	<link href="${path}plf/page/wf/process/css/style.css?_mc_res_version=<%=PlfStaticRes.WF_STYLE_CSS %>" rel="stylesheet" type="text/css" />
	
	</head>
<body style="overflow: hidden;" class="work-content">
    <div class="children-page-search">
	    <div class="children-search-box">
	        <div class="search-box-content">
	           <div class="search-box-group">
	              <span  class="input-name"><dict:lang value="标题" /></span>
	              <input type="text" name="" id="titleName" class="input input-box">
	           </div>
	           <div class="search-box-group">
	              <span  class="input-name"><dict:lang value="发起人" /></span>
	              <input type="text" name="" id="createUser" class="input input-box">
	              <img onclick="queryUser()" src="${path }plf/page/fp/img/ico-search-h-c.png" style="position:absolute;top: 55px;left: 316px;cursor:pointer;">
	           </div>
	           
	        </div>
	       <div class="search-box-content">
	           <div class="search-box-group">
	              <span  class="input-name"><dict:lang value="审批类型" /></span>
	               <div class="input-lable">
		                <select id="procDeId" class="dept_select IS_SELECT_FILTER" style="display: none;width: 230px;">
			                    
			                     
			            </select>
		            </div>
	           </div>
	           <div class="search-box-group">
	              <span  class="input-name"><dict:lang value="发起时间" /></span>
	              <div class="input-box">
		               <div  style="display:inline-block">	
						      <input id="createTime0" style="width: 160px;"  value="" class=" input  WdateNomorl" onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'createTime1\')}' })" readonly="readOnly" autocomplete="off" save_mark="0">
					   </div>
					  <span class="txt">~</span>
					  <div  style="display:inline-block">	
						 <input id="createTime1" style="width: 160px;"  value="" class=" input  WdateNomorl" onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'createTime0\')}' })" readonly="readOnly" autocomplete="off" save_mark="0">
					  </div>     
					 
			      </div>
			  </div>
	           
	        </div>
	    </div>
	    <div class="optn work-time-optn">
	       <button type="button" onclick="handle('formId1');" ><i class="ico ico-audit"></i><dict:lang value="审核" /></button>
		   <button type="button" onclick="query('formId1');" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>

        </div>
	</div>
		<div class="bd">			
				<table id="listTable-h" class="dlist-table table-line"
					style="width: 100%;table-layout: fixed;">
					<thead>
						<tr>
							<td width="30px" style="text-align:center;"></td>
							<td width="30px" style="text-align:center;"><input
								type="checkbox" id="SelectAll" onclick="selectAll();"
								style="margin:0">
							</td>
							<td style="text-align:center;"><dict:lang value="审批编号" moName="mc_plf"/>
							</td>
							<td style="text-align:center;width:300px"><dict:lang value="请求标题" />
							</td>
							<td style="text-align:center;"><dict:lang value="发起人" />
							</td>
							<td style="text-align:center;"><dict:lang value="发起时间" />
							</td>
							
						</tr>
					</thead>
				</table>

				<div class="main" id="main"
					style="overflow-y: auto;overflow-x: hidden;">
					<table id="listTable" class="dlist-table"
						style="width: 100%;table-layout: fixed;">
						<tbody>
						</tbody>
					</table>
				</div>

				<div class="center">
					<s:include
						value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
				</div>
			</div>


	<div style="display: none;">
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
	</div>
	
<script type="text/javascript">
	

	function initHeight(){
		$('.main').height($(window).height() - 158);
	 	$('#listTable').width($(window).width() - 2);
	}
	
	$(function(){
          $('.dept_select').chosen();
          initHeight();
          _newScroll("main");          
          query('formId1');
          queryProcess('procDeId');
    });
      
    $(window).resize(function(){  
		initHeight();	  		
	});
    
		
	
    var paginationImpl = {};
	function query(paginationImpl){
		util.showTopLoading();
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/ProcessAction_searchTodoList.ms",
			    data: {
			        "paraMap.titleName" : $("#titleName").val(),
			    	"paraMap.createUser" : $("#createUser").val(),
			    	"paraMap.procDeId" : $("#procDeId").val(),
			    	"paraMap.createTime0" : $("#createTime0").val(),
			    	"paraMap.createTime1" : $("#createTime1").val(),			    	
			    	"page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			    	"page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
			    	"page.totalRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].totalRecord
			    },
				success: function(data){
				
						util.closeLoading();
						$("#listTable").empty();
						if(null == data){return ;}
						if(data.ajaxMap.errmsg!=null)
				        {
				          utilsFp.confirmIcon(1, "", "", "",data.ajaxMap.errmsg, 0, "300", "");
		                  return false;
				        }
						if(null != data.ajaxPage.dataList){
							var usertList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < usertList.length; i++){
								if(usertList[i].process_name==null) usertList[i].process_name="";
								if(usertList[i].procsn==null) usertList[i].procsn="";								
								
								$("#listTable").append("<tr id='"+usertList[i].id+"'  ondblclick=\"dbHandel('"+usertList[i].id+"','"+usertList[i].process_id+"')\" ></tr>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='userDtoId' value='"+usertList[i].ID+"'/></td>");
								$("#listTable tr:last").append("<td style='display:none;'>"+usertList[i].id+"</td>");
								$("#listTable tr:last").append("<td style='display:none;'>"+usertList[i].process_id+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].procsn+"</td>");								
								$("#listTable tr:last").append("<td style='text-align:center;width:300px' title='"+usertList[i].process_name+"'>"+usertList[i].process_name+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].start_by_name+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].start_time+"</td>");
								}
							init();
							pageFun(data.ajaxPage,"formId1");
							_clickTr('listTable');
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
		
		
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_tongLineColor(tableTrJs);
	}
	
	function handle(){
	    	var selCount = 0;
	    	var id;//任务ID
	    	var process_id;
	  	$("input[name='userDtoId']:checked").each(function(i) {
				selCount++;
				var $tr = $(this).parents("tr");						
				id = $tr.find("td").eq(2).text();
				process_id = $tr.find("td").eq(3).text();		
				
			});
		
		if (selCount != 1) {
				utilsFp.confirmIcon(1, "", "", "",
						"<dict:lang value="请选择一条记录" />", 0, "260", "");
				return false;
		}
		
		dbHandel(id,process_id);
		
	   }
	   
	   function dbHandel(id,process_id){
	      $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/ProcessAction_queryTaskView.ms",
			    data: {
			    	'paraMap.taskId' : id,
			    	'paraMap.processId' : process_id
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
				      var formId=data.ajaxMap.formId;
				      var flowType=4;
				      var isSubmitActivity=data.ajaxMap.isSubmitActivity;
				      if(isSubmitActivity==1)
				      {
				       flowType=2;
				       piframeId+="_reloadPgClose";
				      }
				      var url = "${path}buss/bussModel.ms?iframeId="+piframeId+"&exeid="+viewId+"&taskId="+id+"&processId="+process_id+"&flowType="+flowType;
					  if(dataId!=null&&dataId!='')
					  {
					    url+="&dataId="+dataId;
					  }
					  if(formId!=null&&formId!='')
					  {
					    url+="&formId="+formId;
					  }
					  showPopWinFp(url, 900, 600, "", "<dict:lang value="审核"/>","audit", "");
				     
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
	   
	
                   
                   
                  

</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>