<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%request.setAttribute("isTree","1"); %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
	    <base href="${path}" />
	    <title><dict:lang value="权限配置" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="zTree" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>

  </head>

	<body>
		<div class="edit">
            		<div class="hd">
			    <div class="optn">
			        <button type="button" onclick="save();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="expend();"><i class="ico ico-save"></i><dict:lang value="展开" /></button>
					<button type="button" onclick="copy();"><i class="ico ico-save"></i><dict:lang value="复制" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			</div>
		</div>
			<div class="hd" style="background-color: white;padding-top: 10px;margin-top: 10px;margin-bottom: 0; padding-bottom: 10px;">
				<table style="width: 100%">
					<tr>
						<td style="width: 106px;text-align: right;"><dict:lang value="复制对象" />&nbsp;</td>
						<td style="width: 230px;text-align: left;"><s:select list="roleLs" headerKey="" headerValue="--请选择--"
							listKey="id" listValue="name"  id="roleDto_id" name="roleDto.name" 
								cssStyle="width: 96%" cssClass="dept_select"/></td>
						<td></td>
					</tr>
				</table>
				
			</div>
		<div style="height: 485px;overflow: auto;background-color: white;" />
			<ul id="index_tree" class="ztree" style="padding: 0;margin: 0;width: 100%"></ul>
			<input type="hidden" id="roleDtoId" name="roleDtoId" value="<s:property value="roleDto.id"/>" />
			</table>
		<form id="add_form" name="addForm" action="${path}sys/RoleAction_addRoleFunc.ms" method="post">
			<s:hidden name="roleDto.id" id="roleId"/>
			<input type="hidden" id="ids" name="ids" value="" />
			<input type="hidden" id="parent_ids" name="parentIds" value="" />
			<input type="hidden" id="iframeId" name="paraMap.iframeId"/>
		</form>


		<script type="text/javascript">
		var zTreeObj=null
		var parentNode=null;
		var setting = {
				data: {
					simpleData: {
						enable: true,
						pIdKey: "upId"
					},
					key: {
						url: "xUrl"
					}
				},
				callback: {
					onClick:onSelected
				},
				check: {
					enable: true,
					//chkboxType: { "Y": "ps", "N": "ps" }
					chkboxType: { "Y": "ps", "N": "s" }
				}
			};
		function onSelected(event, treeId, treeNode){
			parentNode=treeNode
		}
		function expend(){
			if(parentNode==null){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择需要展开的节点" />",0,"300","");
				return;
			}
			zTreeObj.expandNode(parentNode, true, true, true);
			parentNode=null;
		}
		 $(function(){
			 var roleDtoId = $("#roleDtoId").val();
		    	$.ajax({
					type: "POST",
				    dataType: "json",
				    url: "${path}sys/FuncAction_getConfAuty.ms",
				    data:{roleDtoId:roleDtoId,iconPath:"plf/js/dhtmlxtree/imgs/new_ui_tree/"},
					success: function(data){
						if(data){
							zTreeObj = $.fn.zTree.init($("#index_tree"), setting, data.ajaxList);
						}
				    },
					error: function(msg){
							//util.alert("error:"+msg.responseText);
					  }
					});
		    });
		
			function save(){
				
				var zTreeObj = $.fn.zTree.getZTreeObj("index_tree");
				var nodes = zTreeObj.getCheckedNodes(); 
				var ids="";
				for (var i = 0; i < nodes.length; i++) { 
					ids += nodes[i].id+",";
			    }
				/**
				var parentIds = tree.getAllPartiallyChecked();
				
				var idRes="";
				document.getElementById("parent_ids").value = parentIds;
				if("" != parentIds){
					idRes =parentIds;
					if("" != ids){
						idRes = idRes+","+ids;
					}
				}else if("" != ids){
					idRes = ids;
				}
				**/
				
				document.getElementById("ids").value = ids;
				//var texts =tree.getAllCheckedText();
				document.forms.add_form.submit();
				//thisObj.onclick = function(){util.alert(util.submit_default_info);}
				util.showLoading();
			}
			
			function copy(){
				var roleId = $("#roleId").val();
				var copyRoleId = $("#roleDto_id").val();
				if (copyRoleId != "") {
					$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_CopyRole.ms",
			    data: "paraMap.id="+roleId+", "+copyRoleId,
				success: function(data){
						window.location.reload();
					},
				error: function(msg){
						util.closeLoading();
						util.alert("error:"+msg);
				  }
				});
				}else{
					utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择复制对象" />",0,"300","");
				}
				
			}

			
			setPopScroll('.containerTableStyle');
		</script>
		
		<script type="text/javascript">
		/* 	function showButton(){
				document.getElementById("td_button").style.display = "";
				if(util.isScroll(document)){
					document.getElementById("td_button_end").style.display = "";
				}
			}
			
			window.onload =function(){
			window.setTimeout("showButton()",100);
		};  */  
	
	$(function(){
    	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
    	
    });
		</script>

	</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>