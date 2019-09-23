<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="待办事宜" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="datePicker" value="1" />
		</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/wf/process/common.jsp"%>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	<link href="${path}plf/page/wf/process/css/style.css?_mc_res_version=<%=PlfStaticRes.WF_STYLE_CSS %>" rel="stylesheet" type="text/css" />
	
	</head>
<body style="overflow: hidden;" class="work-content">
 <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
    <div class="children-page-search">
	    <div class="children-search-box">
	        <div class="search-box-content">
	           <div class="search-box-group">
	              <span  class="input-name"><dict:lang value="标题" /></span>
	              <input type="text" name="paraMap.titleName" id="titleName" class="input input-box">
	           </div>
	           <div class="search-box-group">
	              <span  class="input-name"><dict:lang value="发起人" /></span>
	              <input type="text" name="paraMap.createUser" id="createUser" class="input input-box">
	              <img onclick="queryUser()" src="${path }plf/page/fp/img/ico-search-h-c.png" style="position:absolute;top: 55px;left: 316px;cursor:pointer;">
	           </div>  
	           
	        </div>
	       <div class="search-box-content">
	           <div class="search-box-group">
	              <span  class="input-name"><dict:lang value="审批类型" /></span>
	               <div class="input-lable">
		                <select id="procDeId" name='paraMap.procDeId' class="dept_select IS_SELECT_FILTER" style="width: 230px;">
			                     
			            </select>
		            </div>
		            <div class="input-lable">
			               <select id="procStatus" name="paraMap.procStatus" class="dept_select" style="width: 240px;" >
								<option value="">--<dict:lang value="请选择" />--</option>
								<option value="0"><dict:lang value="审批中" /></option>
								<option value="1"><dict:lang value="审批完成" /></option>
								<option value="2"><dict:lang value="已撤销" /></option>
							</select>
			          </div>
	           </div>
	         <div class="search-box-group">
	              <span  class="input-name"><dict:lang value="发起时间" /></span>
	              <div class="input-box">
		               <div  style="display:inline-block">	
						      <input id="createTime0" name='paraMap.createTime0' style="width: 160px;"  value="" class=" input  WdateNomorl" onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'createTime1\')}' })" readonly="readOnly" autocomplete="off" save_mark="0">
					   </div>
					  <span class="txt">~</span>
					  <div  style="display:inline-block">	
						 <input id="createTime1" style="width: 160px;" name='paraMap.createTime1' value="" class=" input  WdateNomorl" onclick="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'createTime0\')}' })" readonly="readOnly" autocomplete="off" save_mark="0">
					  </div>     
					 
			      </div>
			  </div>
	           
	        </div>
	    </div>
	    <div class="optn work-time-optn">
	       <button type="button" onclick="undo('formId1');" ><i class="ico ico-cx"></i><dict:lang value="撤销" /></button>
	       <button type="button" onclick="detail();" ><i class="ico ico-view"></i><dict:lang value="查看" /></button>
		   <button type="button" onclick="query('formId1');" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>

        </div>
	</div>
	</form>
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
							<td style="text-align:center;"><dict:lang value="审批编号" />
							</td>
							<td style="text-align:center;width:300px"><dict:lang value="请求标题" />
							</td>
							<td style="text-align:center;"><dict:lang value="发起人" />
							</td>
							<td style="text-align:center;"><dict:lang value="发起时间" />
							</td>
							<td style="text-align:center;"><dict:lang value="完成时间" />
							</td>
							<td style="text-align:center;"><dict:lang value="状态" />
							</td>
						</tr>
					</thead>
				</table>

				<div class="main" id="main"
					style="overflow-y: auto;overflow-x: hidden;">
					<table id="listTable" class="dlist-table"
						style="width: 100%;table-layout: fixed;">
						<tbody id="flowAdminLs">
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
		$('.main').height($(window).height() - 154);
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
		var url = "${path}comm/ProcessAction_findFlowAdminList.ms";
		var formData = form.serialize($("#searchForm"));
		formData["page.currentPage"] = _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		formData["page.pageRecord"] = _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		formData["page.totalRecord"] = _GLO_FORM_PAGE_MAP[paginationImpl].totalRecord;
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data: formData,
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						if(data.ajaxMap.errmsg!=null)
				        {
				          utilsFp.confirmIcon(1, "", "", "",data.ajaxMap.errmsg, 0, "300", "");
		                  return false;
				        }
						if(null != data.ajaxPage.dataList){
							var usertList = eval(data.ajaxPage.dataList);
							var tableHtml = [];
							$.each(usertList,function(i,v){
			            		tableHtml.push("<tr id='"+v.process_id+"' ondblclick=\"findDetail('"+v.process_id+"')\">");
			            		tableHtml.push("<td style='width:30px;text-align:center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
			            		tableHtml.push("<td style='width: 30px;text-align: center;'><input type='checkbox'  name='processId'  value='"+v.process_id+"'/></td>");
			            		tableHtml.push("<td style='text-align: center;'>"+(v.procsn==null?"":v.procsn)+"</td>");
			            		tableHtml.push("<td style='text-align: center;width:300px' title='"+v.process_name+"'>"+(v.process_name==null?"":v.process_name)+"</td>");
			            		tableHtml.push("<td style='text-align: center;'>"+(v.start_user_name==null?"":v.start_user_name)+"</td>");
			            		tableHtml.push("<td style='text-align: center;'>"+(v.start_time==null?"":v.start_time)+"</td>");
			            		tableHtml.push("<td style='text-align: center;'>"+(v.end_time==null?"":v.end_time) +"</td>");
			            		tableHtml.push("<td style='text-align: center;'>"+(v.proc_status_name==null?"":v.proc_status_name)+"</td>");
			            		tableHtml.push("</tr>")
			            	});
			            	$("#flowAdminLs").html(tableHtml.join(""));
							init();
							pageFun(data.ajaxPage,"formId1");
							_clickTr('flowAdminLs');
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
		
	function undo(){
		var selCount = 0;
    	var id;//任务ID
    	var procId;
	  	$("input[name='processId']:checked").each(function(i) {
				selCount++;
				procId = $(this).val();		
				
			});
		if (selCount != 1) {
				utilsFp.confirmIcon(1, "", "", "",
						"<dict:lang value="请选择一条记录" />", 0, "260", "");
				return false;
		}
		var iframeId =  window.frameElement.name;
		showPopWinFp("${path}comm/ProcessAction_undoForm.ms?procId="+procId+"&iframeId="+iframeId, 450, 300, "", "<dict:lang value="撤销"/>","undo", "");
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_tongLineColor(tableTrJs);
	}
	
	function reloadPage(){
		query("formId1");
	}
	function queryUser()
    {
       var piframeId = '';
       var ciframeId = window.frameElement.id;
       var url = "${path}comm/ProcessAction_queryUserPage.ms?piframeId="+piframeId+"&ciframeId="+ciframeId;
       showPopWinFp(url, 800, 465,null,'<dict:lang value="人员选择" />','queryUserPage');        
    }
	
	function detail(){
    	var selCount = 0;
    	var id;//任务ID
    	var process_id;
  	$("input[name='processId']:checked").each(function(i) {
			selCount++;
			process_id = $(this).val();	
		});
	
	if (selCount != 1) {
			utilsFp.confirmIcon(1, "", "", "",
					"<dict:lang value="请选择一条记录" />", 0, "260", "");
			return false;
	}
	findDetail(process_id);
   }
	
	function findDetail(process_id){
		$.ajax({
			type: "POST",
		    dataType: "json",
		    url: "${path}comm/ProcessAction_queryDetailView.ms",
		    data: {
		    	'paraMap.process_id' : process_id
		    },
			success: function(data){
			   if(data.ajaxMap != null)
			   {
			      if(data.ajaxMap.errmsg!=null)
			      {
			        utilsFp.confirmIcon(1, "", "", "",data.ajaxMap.errmsg, 0, "300", "");
	                return false;
			      }
			      var piframeId = window.frameElement.id;
			      var viewId=data.ajaxMap.viewId;
			      var dataId=data.ajaxMap.dataId;
			      var url = "${path}buss/bussModel.ms?piframeId="+piframeId+"&exeid="+viewId+"&processId="+process_id+"&flowType=3";
				  if(dataId!=null&&dataId!='')
				  {
				    url+="&dataId="+dataId;
				  }
				  showPopWinFp(url, 900, 600, "", "<dict:lang value="查看"/>","detail", "");
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
	
	$(function(){
		var process_id;
		$(document).on("dblclick",".rowTr",function(){
			process_id = $(this).find("input[name='processId']").val();
			findDetail(process_id);
		});
	});
	      
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>