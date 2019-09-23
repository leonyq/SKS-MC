<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<html>
	<head>
	<script type="text/javascript">
	var zcount=1000;
	</script>
	 
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
		<%@ include file="/plf/common/pub_meta.jsp"%>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="datePicker" value="1" />
			<jsp:param name="zTree" value="1" />
			<jsp:param name="chosen" value="1" />
		</jsp:include>
		<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	    <title><dict:lang value="员工信息-设置岗位" /></title>
	<style type="text/css">
		body{overflow-y:hidden;}
		.dlist-table thead th,.dlist-table tbody td{
			vertical-align: middle;
		}
	</style>
	</head>
	<body style="background-color: #fff;">
    <div  style="width: 100%;">
    			
				<div class="mod" style="background-color: #f6f5f7; height:100%">
					<div class="mod-hd" style="border: 0">						
						<div class="optn">
							<button type="button" onclick="save();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
							<button type="button" onclick="deptPositionAdd();"><i class="ico ico-kl"></i><dict:lang value="新增" /></button>
							<button type="button" onclick="del();"><i class="ico ico-sc"></i><dict:lang value="删除" /></button>
						</div>
					</div>
				</div>
				
				<div>
					<table class="dlist-table table-line "
						style="width: 100%;table-layout:fixed;">
						<thead>
							<tr class="thcolor">
								<th style="width: 30px;text-align: center;box-sizing: border-box;"></th>
								<th style="width: 30px;text-align: center;box-sizing: border-box;">
								<input type="checkbox" id="allSelect2" name="allSelect2" />
								</th>
								<th style="text-align: center;"><dict:lang value="部门" />
								<th style="width: 120px;text-align: center;"><dict:lang value="岗位名称" />
								<th style="width: 100px;text-align: center;"><dict:lang value="岗位类型" />
								</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div style="height: 330px;overflow: auto;" class="scroll1">
						<table class="dlist-table" style="width: 100%;table-layout:fixed;"
							id="postTable">
							<thead>
							</thead>
							<tbody id="addPostList">

							</tbody>
						</table>
					</div>
					
				</div>
			
        <!-- content end -->        
    </div>
	<form id="submit_form" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" id="postDtoSh_id" name="paraMap.id" />
	</form>
		<script>
		var deptPositionId ="<c:out value='${paraMap.deptPositionId}' />";
		var piframeId="<c:out value='${paraMap.piframeId}' />";		
		var parentWindows = $(window.parent.document).contents().find("#"+piframeId)[0].contentWindow;
		var userDeptPositionTableHtml=parentWindows.userDeptPositionTable;	
		
		if(userDeptPositionTableHtml!=null&&userDeptPositionTableHtml!='')
		{
		  $("#addPostList").html(userDeptPositionTableHtml);
		  tableHandel();
		}

	function initHeight(){
    	
	}
			
	$(function(){
    	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#deptDtoUp_iframeid").val(window.name);
			}
		}
    	
    	initHeight();	
    
    	$("#allSelect2").click(function(){
    			if($("#allSelect2").attr("checked") == "checked"){
        			$("input[name='postId']").attr("checked","checked");
    			}else{
        			$("input[name='postId']").removeAttr("checked","checked");
    			}
			});
    });
    
    $(window).resize(function(){
    
		initHeight();	  
		
	}); 
    
		
	
	function addRowPost(id,deptPositionId,dept_id ,dept_name,position_name,position_type_name)
	{   var i=$("#addPostList tr").length;
	    $("#addPostList").append("<tr id='"+id+"' >");								
		$("#addPostList tr:last").append("<td style='width:30px;text-align:center;'>"+(i+1)+"</td>");
		$("#addPostList tr:last").append("<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='postId' value='"+deptPositionId+"'/></td>");
		$("#addPostList tr:last").append("<td style='display:none;' >"+dept_id+"</td>");
		$("#addPostList tr:last").append("<td style='text-align:center;' title=\""+dept_name+"\">"+dept_name+"</td>");
		$("#addPostList tr:last").append("<td style='width:120px;text-align:center;' title=\""+position_name+"\">"+position_name+"</td>");
		$("#addPostList tr:last").append("<td style='width:100px;text-align:center;' title=\""+position_type_name+"\">"+position_type_name+"</td></tr>");
	
	}
	
	function tableHandel(){
	         var tableTrJs = $("#addPostList  tr");
		     _tongLineColor(tableTrJs);
			_clickTr("addPostList");
			setPopScroll('.scroll1');
	
	}
	
	
		
		function deptPositionAdd()
		{
		    //var piframeId = window.frameElement.id;
		    var nodeId=parentWindows.$("#userDto_deptId").val();
		    var nodeName=parentWindows.$("#userDto_deptId option:selected").text();
	        var url="${path}sys/PostMgrAction_deptPositionAdd.ms?paraMap.nodeName="+nodeName+"&paraMap.nodeId="+nodeId;
            showPopWinFp(url, 650, 350,null,'<dict:lang value="岗位选择" />','deptPositionAdd');
		}
		
		function del(){
		 if($("input:checkbox[name='postId']:checked").length==0)
		 {
		   utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
			return false;
		 }
		 utilsFp.confirmIcon(1,"","delConfirm","", "<dict:lang value="确认删除吗" />",1,"300","");
		 
		}
		
		function delConfirm(){
		  $("input:checkbox[name='postId']:checked").each(function(index){			
			 $(this).parents("tr").remove();			
		 });
		   $('#addPostList  tr').find('td:eq(0)').each(function (i, elem) {
                $(elem).html(i + 1);
            });
		}
		
		function save(){
			var $itemtr = $('#addPostList  tr');
		    var rowCount=$itemtr.length;
		if ($itemtr.length==0) {	
			//utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
			//return false;
		}
		 	var itemS;
		 	var itemArr = [];
		 	var deptPositionName='';
			for ( var i = 0; i < rowCount; i++) {
				itemS = {};
				itemS.dept_position_id = $itemtr.eq(i).find('td').eq(1).find('input').val();
				itemS.dept_id = $itemtr.eq(i).find('td').eq(2).text();
				itemS.id = $itemtr.eq(i).attr('id');
				itemArr.push(itemS);
				deptPositionName+=$itemtr.eq(i).find('td').eq(3).text();
				deptPositionName+='/'+$itemtr.eq(i).find('td').eq(4).text();
				deptPositionName+='/'+$itemtr.eq(i).find('td').eq(5).text();
				if(i!=rowCount-1){deptPositionName+='\n';}
			}
			parentWindows.$("#userDeptPosition").val(JSON.stringify(itemArr));
			parentWindows.$("#deptPosition").html(deptPositionName);
			parentWindows.userDeptPositionTable=$('#addPostList').html();
			
		    closeTopPopWinFp('deptPositionpop');
        
	}
	
		</script>
	</body>	
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
	
</html>