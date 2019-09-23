<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="角色新增" />
</title>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="dhtmlxtree" value="1" />
</jsp:include>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="needValidate" value="1" />

</jsp:include>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
</head>
<body>
	<div style="background-color: white;margin-top: 37px;">
		<div class="hd">
			<div style="margin-left:10px;margin-top: -35px;">
				<div class="save-close" title="<dict:lang value='保存并关闭窗口' />"
					onclick="saveClose(this)"></div>
				<input type="checkbox" checked id="isCloseWin" name="isCloseWin"
					value="0" style="display:none;" />
			</div>
			<div class="optn">
				<button type="button" onclick="roleNameVal();">
					<i class="ico ico-save"></i><dict:lang value='保存' />
				</button>
				<button type="button" onclick="closeWindow();">
					<i class="ico ico-cancel"></i><dict:lang value='取消' />
				</button>
			</div>
		</div>
		<div style="height: 100%;margin-top: -30px;">
			<div class="left-add" style="width: 45%;float:left;" >
				<form id="add_form" name="addForm"
				action="${path}sys/RoleAction_addRole.ms" method="post"
				target="submitFrame">
				<s:token />
				<input type="hidden" id="iframeId" name="iframeId" /> <input
					type="hidden" id="isCloseWin_s" name="paraMap.isCloseWin" />
				<table class="basic-table">
					<%-- <tr>
          <td colspan="6"><dict:lang value="角色新增" /><span class="Point"><dict:lang value="（带" /> <span class="Eng">*</span><dict:lang value=" 为必填项）" /></span></td>
       </tr> --%>
					<tr>

						<td style="width: 116px;text-align: right;"><span class="dot">*</span>
						<dict:lang value="角色名称" />
						</td>
						<td style="text-align: left;padding-left:5px;"><input
							type="text" class="input" name="roleName" id="roleDto_name"
							maxlength="30" style="width: 200px;" /> <span class="Eng"><span
								id="roleDto_name_err">${errors["roleDto.name"][0]}</span>
						</span></td>
					</tr>
					<tr>

						<td style="width: 116px;text-align: right;"><dict:lang
								value="角色描述" />
						</td>
						<td style="text-align: left;padding-left:5px;height: 280px;">
							<textarea name="roleRemark" id="roleDto_remark"
								style="width: 200px;height: 100%;" maxlength="200"></textarea></td>
					</tr>
					<tr>
						<td>
							<input id="func_id" name="funcId" type="hidden"/>
						</td>
					</tr>
				</table>
			</form>
			</div>
			
			<div class="right-func" style="width: 45%;float: right;">
				<div class="customer-box" style="width: 100%;">
				<div class="tit">
					<i class="ico ico-cus"></i>
					<dict:lang value="角色功能权限" />：
				</div>

				<div class="customer-con"
					style="height:100px;min-height: 250px;overflow: auto;">
					<div id="index_tree" class="tree" style="display: inline-block; border: 1px solid white;" >
					<script>
						var tree = new dhtmlXTreeObject("index_tree", "100%",
								"100%", "-1");
						tree
								.setImagePath("${rootPath}plf/js/dhtmlxtree/imgs/new_ui_tree/");
						tree.enableCheckBoxes(1);//设置复选框;
						tree.enableThreeStateCheckboxes(true);//是否级联选中，当启用checkbox时设置才有效
						
						var funcTreeXml = "${dataMap['funcTreeXml']}";
						if(funcTreeXml && funcTreeXml !="") {
							tree.loadXMLString("${dataMap['funcTreeXml']}");
						}
						
						
					</script>
					</div>
				</div>
			</div>
			</div>

			<div class="clear" style="clear: both;"></div>			
		</div>
	</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script type="text/javascript">


		function valData() {
			var roleDtoName = document.getElementById("roleDto_name");
			if (val.isBlank(roleDtoName)) {
				_alertValMsg(roleDtoName, "<dict:lang value="角色名称不能为空" />");
				roleDtoName.focus();
				return false;
			}
			
			if(roleDtoName.value.length > 20) {
				alert(roleDtoName.value);
				_alertValMsg(roleDtoName, "<dict:lang value="角色名称长度必须小于20个字符" />");
				roleDtoName.focus();
				return false;
			}
			if($("#roleDto_remark").val().length>60) {
				_alertValMsg(roleDtoName, "<dict:lang value="角色描述长度必须小于60个字符" />");
				$("#roleDto_remark").focus();
				return false;
			}
			
			

			return true;
		}

		$(function() {
			//获取当前iframe名称
			var ptfs = window.parent.frames;
			for ( var i = 0; i < ptfs.length; i++) {
				if (ptfs[i] == window) {
					$("#iframeId").val(window.name);
				}
			}
		});
		
	
	</script>
	<bu:submit viewId="ed88752e28b644bd8e52cfc84c41d57f" />
	<bu:script viewId="ed88752e28b644bd8e52cfc84c41d57f" />
</body>
<%@ include file="/plf/common/pub_end.jsp"%>