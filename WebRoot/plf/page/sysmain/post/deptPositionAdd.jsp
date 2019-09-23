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
	    <title><dict:lang value="岗位信息" /></title>
	<style type="text/css">
		body{overflow-y:hidden;}
		.dlist-table thead th,.dlist-table tbody td{
			vertical-align: middle;
		}
	</style>
	</head>
	<body style="background-color: #fff;">
    <div  style="width: 100%;">
    	<div style="width: 40%;float: left;">
			<div class="block1" id='block1' style="width:92%;float: left;border-style:solid;border-width:1px; border-color:#eaeaea;background:#ffffff;padding:5px;overflow: auto;">
       			<div id="index_tree" class="ztree">
      			</div>
      		</div>
      	</div>
        <div  style="width: 60%;float: left;" >
        		
						
				<div class="mod" style=" height:100%">
					<div class="mod-hd" style="border: 0">						
						<div class="optn">
							<button type="button" onclick="add();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
							<button type="button" onclick="closeTopPopWinFp('deptPositionAddpop');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
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
								<input type="checkbox" id="allSelect1" name="allSelect1" />
								</th>
								<th
									style="text-align: center;box-sizing: border-box;"><dict:lang
										value="岗位名称" />
								</th>
								<th style="width: 100px;text-align: center;"><dict:lang value="岗位类型" />
								</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div style="height: 360px;overflow: auto;" class="scroll1">
						<table class="dlist-table" style="width: 100%;table-layout:fixed;"
							id="postTable">
							<thead>
							</thead>
							<tbody id="addPostList">

							</tbody>
						</table>
					</div>
					
				</div>
						
					
        </div>
        <!-- content end -->        
    </div>
	<form id="submit_form" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" id="postDtoSh_id" name="paraMap.id" />
	</form>
		<script>
		var deptPositionId ="<c:out value='${paraMap.deptPositionId}' />"	;
			var parentWindows = $(window.parent.document).contents().find("#deptPosition")[0].contentWindow;
			
			var setting = {
				data: {
					simpleData: {
						enable: true,
						pIdKey: "upId"
					}
				},
				callback: {
					onClick: zTreeOnClick
				}
			};

			var nodeId = "<c:out value='${paraMap.nodeId}' />";
			var nodeName= "<c:out value='${paraMap.nodeName}' />";
			function zTreeOnClick(event, treeId, treeNode) {
				nodeId = treeNode.id;
				nodeName=treeNode.name;
				searchDeptPost(nodeId);
				
			};
		    $(function(){
		    	$.ajax({
					type: "POST",
				    dataType: "json",
				    url: "${path}sys/FuncAction_listDeptTreeByZtree.ms",
					success: function(data){
						if(data){
							$.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
							
							var treeObj = $.fn.zTree.getZTreeObj("index_tree");
							var node = treeObj.getNodeByParam("id", "FA174AFF136D496A87B65443D22357E3", null);
							if(node!=null){
								treeObj.expandNode(node, true, false, true);
							}
							searchDeptPost(nodeId);
							
						}
				    },
					error: function(msg){
							util.alert("error:"+msg.responseText);
					  }
					});
		    });
	
	function initHeight(){
		$('.block1').height($(window).height() - 40 - 12 - 10);//40:距离顶部  12：padding+border  10:距离底部
    	$('#deptiframe').height($(window).height()); 
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
    	newScroll("block1");
    	$("#allSelect1").click(function(){
    			if($("#allSelect1").attr("checked") == "checked"){
        			$("input[name='postId']").attr("checked","checked");
    			}else{
        			$("input[name='postId']").removeAttr("checked","checked");
    			}
			});
    });
    
    $(window).resize(function(){
    
		initHeight();	  
		
	}); 
    
	
	function newScroll(id){   
	 	$("#" + id).mCustomScrollbar({
		    axis:"yx",
			snapAmount:40,
			theme:"minimal-dark",
			keyboard:{scrollAmount:40},
			mouseWheel:{deltaFactor:40,preventDefault:true},
			scrollInertia:80,
	  	});
	}
	
	function searchDeptPost(deptId) {
	  if(deptId=='') return false;
				$
						.ajax({
							type : "POST",
							dataType : "json",
							url : "${path}sys/PostMgrAction_searchDeptPost.ms",
							data : {
								"deptId" : deptId
							},
							success : function(data) {
								util.closeLoading();
								//console.log(data)
								if (null == data) {
									return;
								}
								$("#addPostList").empty();
								if(data.ajaxMap.errmsg!=null)
						        {
						          utilsFp.confirmIcon(1, "", "", "",data.ajaxMap.errmsg, 0, "300", "");
				                  return false;
						        }
								if (null != data.ajaxPage.dataList) {
									var posttList = eval(data.ajaxPage.dataList);
									for ( var i = 0; i < posttList.length; i++) {
										$("#addPostList")
												.append(
														"<tr id='"
																+ posttList[i].id
																+ "' onclick=searchUserDeptPost('"
																+ posttList[i].id
																+ "')>");
										$("#addPostList tr:last")
												.append(
														"<td style='display:none;'>"
																+ posttList[i].position_id
																+ "</td>");
										$("#addPostList tr:last")
												.append(
														"<td style='display:none;'>"
																+ posttList[i].position_type
																+ "</td>");
										$("#addPostList tr:last").append(
												"<td style='width:30px;text-align:center;'>"
														+ (i + 1) + "</td>");
										$("#addPostList tr:last")
												.append(
														"<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='postId' value='"+posttList[i].id+"'/></td>");
										$("#addPostList tr:last")
												.append(
														"<td style='text-align:center;' title=\""+posttList[i].position_name+"\">"
																+ posttList[i].position_name
																+ "</td>");
										$("#addPostList tr:last")
												.append(
														"<td style='width:100px;text-align:center;' title=\""+posttList[i].position_type_name+"\">"
																+ posttList[i].position_type_name
																+ "</td></tr>");
									}
									var tableTrJs = $("#addPostList  tr");
									_tongLineColor(tableTrJs);
									_clickTr("addPostList");
									setPopScroll('.scroll1');
									//pageFun(data.ajaxPage,"formId1");
								}
							},
							error : function(msg) {
								util.closeLoading();
								utilsFp.confirmIcon(3, "", "", "", "error:"
										+ msg, 0, "300", "");
							}
						});

			}
	
	
	
	
		
		function add(thisObj){
		 if($("input:checkbox[name='postId']:checked").length==0)
		 {
		   utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
			return false;
		 }
		 var flag=false;
		 $("input:checkbox[name='postId']:checked").each(function(index){
			var deptPositionId = $(this).val();			
			parentWindows.$("#addPostList  tr input:checkbox[name='postId']").each(function(j,ele){
			  if($(ele).val()==deptPositionId){
			    flag=true;
			    utilsFp.confirmIcon(1,"","","", "<dict:lang value="请勿选择相同岗位"  moName="plf"/>",0,"300","");
			    return false;			    
			  }
			});
			if(flag) return false;
		});
		if(flag) return false;
		 $("input:checkbox[name='postId']:checked").each(function(index){
			var deptPositionId = $(this).val();
			var $tr = $(this).parents("tr");
			var position_name=  $tr.find("td").eq(4).text();
			var position_type_name=  $tr.find("td").eq(5).text();
			parentWindows.addRowPost(util.getUUID(),deptPositionId,nodeId ,nodeName,position_name,position_type_name);
		});
		parentWindows.tableHandel();
		closeTopPopWinFp('deptPositionAddpop');
		
        
	}
	
		</script>
	</body>	
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
	
</html>