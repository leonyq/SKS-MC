<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="我发起的列表" /></title>
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
		           <div style="display: inline-block;vertical-align: top;">
			          <input type="text" name="titleName" id="titleName" class="input input-box">
			          <span  class="input-name"><dict:lang value="审批类型" /></span>
						<div class="input-lable">
							<select id="procDeId" class="dept_select IS_SELECT_FILTER"
								style="display: none;">
							</select>
						</div>
						<div class="input-lable">
			               <select id="procStatus" name="procStatus" class="dept_select" style="width: 240px;" >
								<option value="">--<dict:lang value="请选择" />--</option>
								<option value="0"><dict:lang value="审批中" /></option>
								<option value="1"><dict:lang value="审批完成" /></option>
								<option value="2"><dict:lang value="已撤销" /></option>
							</select>
			          </div>
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
	       	<button type="button" onclick="revoke();" ><i class="ico ico-cx"></i><dict:lang value="撤销" /></button>
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
		util.showTopLoading();console.log(1)
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/ProcessAction_searchRequestList.ms",
			    data: {
			    	"paraMap.titleName" : $("#titleName").val(),
			    	"paraMap.createUser" : $("#createUser").val(),
			    	"paraMap.procDeId" : $("#procDeId").val(),
			    	"paraMap.procStatus" : $("#procStatus").val(),
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
						
						if(null != data.ajaxPage.dataList){
							var usertList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < usertList.length; i++){
								if(usertList[i].process_name==null) usertList[i].process_name="";
								if(usertList[i].procsn==null) usertList[i].procsn="";
								if(usertList[i].start_time==null) usertList[i].start_time="";								
								if(usertList[i].end_time==null) usertList[i].end_time="";
								$("#listTable").append("<tr id='"+usertList[i].process_id+"' ondblclick=\"showDetail('"+usertList[i].id+"','"+usertList[i].process_id+"','requestFlow')\"></tr>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#listTable tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='userDtoId' /></td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].procsn+"</td>");								
								$("#listTable tr:last").append("<td style='text-align:center;width:300px' title='"+usertList[i].process_name+"'>"+usertList[i].process_name+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].start_time+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].end_time+"</td>");
								$("#listTable tr:last").append("<td style='text-align:center;'>"+usertList[i].proc_status_name+"</td>");
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
	
	function revoke(){
	   var selCount = 0;
	    var process_id;
	  	$("input[name='userDtoId']:checked").each(function(i) {
				selCount++;
				var $tr = $(this).parents("tr");						
				process_id = $tr.attr('id');		
				
			});
		
		if (selCount != 1) {
				utilsFp.confirmIcon(1, "", "", "",
						"<dict:lang value="请选择一条记录" />", 0, "260", "");
				return false;
		}
		var piframeId = parent.window.frameElement.id;
		var url="${path}comm/ProcessAction_revoke.ms?piframeId="+piframeId+"&procId="+process_id;
		showPopWinFp(url, 450, 300,null,'<dict:lang value="撤销" />','');
	}
	
	             
	

</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>