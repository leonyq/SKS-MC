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
	    <title><dict:lang value="设置部门岗位" /></title>
	<style type="text/css">
		body{overflow-y:hidden;}
		.dlist-table thead th,.dlist-table tbody td{
			vertical-align: middle;
		}
	</style>
	</head>
	<body style="background-color: #fff;">
    <div  style="width: 100%;">
    	<div style="width: 30%;float: left;">
			<div class="block1" id='block1' style="width:92%;float: left;border-style:solid;border-width:1px; border-color:#eaeaea;background:#ffffff;padding:5px;overflow: auto;">
       			<div id="index_tree" class="ztree">
      			</div>
      		</div>
      	</div>
        <div  style="width: 70%;float: left;" >
        			
			<div style="width:55%;float:left;">
				<div class="mod">
					<div class="mod-hd">
						<h3 class="tit" style="padding-bottom:0"><dict:lang value="关联的岗位" /></h3>
						<div class="extend-btn"
							style="float: right;margin-right:10px;margin-top:5px;">
							<button type="button"
								onclick="addDeptPost('sys/PostMgrAction_showAddDeptPost.ms');"
								style="padding:0;" title="<dict:lang value='添加' />">
								<i class="ico ico-kl-new-add ico-small"></i>
							</button>
							<button type="button"
								onclick="upDeptPost('sys/PostMgrAction_showUpDeptPost.ms');"
								style="padding:0;" title="<dict:lang value='修改' />">
								<i class="ico ico-xg-new-add ico-small"></i>
							</button>
							<button type="button" onclick="del('sys/PostMgrAction_delDeptPost.ms','postId');" style="padding:0"
								title="<dict:lang value='移除' /> ">
								<i class="ico ico-sc-new-add ico-small"></i>
							</button>


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
						<table class="dlist-table table-line" style="width: 100%;table-layout:fixed;"
							id="postTable">
							
							<tbody id="addPostList">

							</tbody>
						</table>
					</div>
				</div>


			</div>
			       <div style="width:45%;float:left;">
						
						<div class="mod">
					<div class="mod-hd">
						<h3 class="tit" style="padding-bottom:0"><dict:lang value="关联的用户" /></h3>
						<div class="extend-btn"
							style="float: right;margin-right:10px;margin-top:5px;">
							<button type="button"
								onclick="addUserDeptPost();"
								style="padding:0;" title="<dict:lang value='添加' />">
								<i class="ico ico-kl-new-add ico-small"></i>
							</button>
							<button type="button" onclick="del('sys/PostMgrAction_delUserDeptPost.ms','userId');" style="padding:0"
								title="<dict:lang value='移除' /> ">
								<i class="ico ico-sc-new-add ico-small"></i>
							</button>


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
								
								<th style="text-align: center;"><dict:lang value="用户名称" />
								</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div style="height: 360px;overflow: auto;" class="scroll2">
						<table class="dlist-table" style="width: 100%;table-layout:fixed;"
							id="userTable">
							<thead>
							</thead>
							<tbody id="addUserList">

							</tbody>
						</table>
					</div>
				</div>
						
					</div>
        </div>
        <!-- content end -->        
    </div>
	<form id="submit_form" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" id="postDtoSh_id" name="paraMap.id" />
	</form>
		<script>
			
			
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

			var nodeId = "FA174AFF136D496A87B65443D22357E3";
			var deptPositionId; 
			function zTreeOnClick(event, treeId, treeNode) {
				nodeId = treeNode.id;
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
							searchDeptPost('FA174AFF136D496A87B65443D22357E3');
							
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
		$("#allSelect2").click(function(){
    			if($("#allSelect2").attr("checked") == "checked"){
        			$("input[name='userId']").attr("checked","checked");
    			}else{
        			$("input[name='userId']").removeAttr("checked","checked");
    			}
			});
    });
    
    $(window).resize(function(){
    
		initHeight();	  
		
	}); 
    
		function reloadPg(msg,title,width,height,time){
		
    	msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
	function reloadPgExe(){
		
	}
	
	function reloadIframe(){
		$("#deptiframe").attr("src",$("#deptiframe").attr("src"));
		if(nodeId != null && nodeId != "" && nodeId != undefined){
			tree.refreshItem(nodeId);
		}
		
	}
	
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
	
	function addDeptPost(url){
	    
        showPopWinFp(url, 405, 225,null,'<dict:lang value="新增" />','addDeptPost');
	}
	
	function upDeptPost(url){
	    
	        var selCount = 0;
	        var id;
	        var position_id;
	        var position_type;
	      	$("input[name='postId']:checked").each(function(i) {
				selCount++;
				var $tr = $(this).parents("tr");
				id=$(this).val();						
				position_id = $tr.find("td").eq(0).text();
				position_type = $tr.find("td").eq(1).text();		
				
			});
		
		  if (selCount != 1) {
				utilsFp.confirmIcon(1, "", "", "",
						"<dict:lang value="请选择一条记录" />", 0, "260", "");
				return false;
		  }
		  url+="?paraMap.id="+id+"&paraMap.position_id="+position_id+"&paraMap.position_type="+position_type;
	    
        showPopWinFp(url, 405, 225,null,'<dict:lang value="修改" />','addDeptPost');
	}
	
		function del(url,boxname){
		var text = $("input:checkbox[name='"+boxname+"']:checked").map(function(index,elem){
			return $(elem).val();
		}).get().join(';');
		if (text != null && text != "") {
			var paramObj =new Object;
			paramObj.url = url;
			paramObj.id = text;
			utilsFp.confirmIcon(1,"","delConfirm",paramObj, "<dict:lang value="确认删除吗" />",1,"300","");
			
		}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少勾选一条记录" />",0,"300","");
		}
	} 
	
	
			function delConfirm(paramObj) {

				util.showLoading();
				$.ajax({
					url : paramObj.url,
					data : {
						"paraMap.id" : paramObj.id
					},
					type : "post",
					dataType : "json",
					success : function(data) {
						util.closeLoading();
						if (data.ajaxMap != null) {
							if (data.ajaxMap.errmsg != null) {
								utilsFp.confirmIcon(1, "", "", "",
										data.ajaxMap.errmsg, 0, "260", "");
								return false;
							}
						}
						var actionUrl = paramObj.url;
						if (actionUrl.indexOf('delUserDeptPost') != -1) {
							searchUserDeptPost(deptPositionId);
						} else {
							searchDeptPost(nodeId);
						}
						msgPop(data.ajaxMap.alertMsg, '', data.ajaxMap.title, data.ajaxMap.width, data.ajaxMap.height, data.ajaxMap.time);
						

					},
					error : function(msg) {
						util.closeLoading();
						utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0,
								"300", "");
					}
				});

			}

			function searchDeptPost(deptId) {
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
								$("#addUserList").empty();
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

			function searchUserDeptPost(id) {
				deptPositionId = id;
				$
						.ajax({
							type : "POST",
							dataType : "json",
							url : "${path}sys/PostMgrAction_searchUserDeptPost.ms",
							data : {
								"deptPositionId" : id
							},
							success : function(data) {
								util.closeLoading();
								if (null == data) {
									return;
								}
								$("#addUserList").empty();
								if (null != data.ajaxPage.dataList) {
									var posttList = eval(data.ajaxPage.dataList);
									for ( var i = 0; i < posttList.length; i++) {
										$("#addUserList")
												.append(
														"<tr id='"+posttList[i].user_dept_position_id+"' >");
										$("#addUserList tr:last").append(
												"<td style='width:30px;text-align:center;'>"
														+ (i + 1) + "</td>");
										$("#addUserList tr:last")
												.append(
														"<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='userId' value='"+posttList[i].user_dept_position_id+"'/></td>");
										$("#addUserList tr:last")
												.append(
														"<td style='text-align:center;' title=\""+posttList[i].user_name+"\">"
																+ posttList[i].user_name
																+ "</td></tr>");
									}
									var tableTrJs = $("#addUserList  tr");
									_tongLineColor(tableTrJs);
									_clickTr("addUserList");
									setPopScroll('.scroll2');
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

			
			function addUserDeptPost(url) {
				var selCount = 0;
				var deptPositionId;
				$("input[name='postId']:checked").each(function(i) {
					selCount++;
					deptPositionId = $(this).val();
				});

				if (selCount != 1) {
					utilsFp.confirmIcon(1, "", "", "",
							"<dict:lang value="请选择关联的岗位" />", 0, "260", "");
					return false;
				}
				var url = "${path}sys/PostMgrAction_showChooseUser.ms?paraMap.deptPositionId="
						+ deptPositionId + "&paraMap.nodeId=" + nodeId;
				showPopWinFp(url, 800, 462, null, ''
						+ "<dict:lang value="人员选择" />", 'addUserDeptPost');
			}
		</script>
	</body>	
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
	
</html>