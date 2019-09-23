<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="角色列表" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="chosen" value="1" />
	<jsp:param name="dhtmlxtree" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<link href="${path}buss/taskCenter/css/taskCenter.css" rel="stylesheet"
	type="text/css" />
<script
	src="${path}/plf/page/fp/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${path}/plf/page/fp/js/slick.js"></script>
<script src="${path}/plf/page/fp/js/chosen.jquery.js"></script>

<style>
</style>
</head>
<body>

	<div class="content-in"  >
		<div class="dlist" >
			<div class="hd">
				<input type="hidden" id="iframe_id" name="iframeId"/>
				<div class="optn">
					<table class="func_table">
						<tr>
							<td width="100%" align="right"><bu:funOper funcNo="F6427"
									type="button" onclick="addAjax('@{funcUrl}');" /> <bu:funOper
									funcNo="F6473" type="button" onclick="ajaxEdit('@{funcUrl}');" />
								<bu:funOper funcNo="F6480" type="button"
									onclick="del2('@{funcUrl}');" /> <%-- <bu:funOper funcNo="F43" type="button" onclick="confUser('@{funcUrl}');" /> --%>

								<%-- <button type="button" onclick="query('formId1');">
									<i class="ico ico-search-new"></i>
									<dict:lang value="查询" />
								</button>--%>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="bd" style="width: 600px;">
				<%-- <div class="search-box">
					<form id="search_form" name="searchForm"
						action="${path}sys/RoleAction_listRole.ms" method="post">
						<s:hidden
							name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
						<table class="search_table">
							<tr>

								<td width="30%" style="white-space: nowrap;">
									&#x3000;&#x3000;&#x3000;<dict:lang value="角色名称" />： <input
									class="input" id="roleDtoSh_name" name="roleDtoSh.name"
									cssClass="input_sh" maxlength="30" />
								</td>

							</tr>
						</table>
					</form>
				</div>--%>

				<div class="left-list"  style="width:65%;float: left;" >
					<table id="listTable-h" class="dlist-table table-line"
						style="width:100%;margin-top: 10px;table-layout: fixed;">
						<thead>
							<tr class="tableHead">
								<td style="width:30px;"></td>
								<td style="width:30px;text-align:center;"><input
									type="checkbox" id="SelectAll" onclick="selectAll();"
									style="margin:0;"></td>
								<td style="width:300px;text-align:center;"><dict:lang
										value="角色名称" /></td>
								<td style="text-align:center;"><dict:lang value="角色描述" />
								</td>
							</tr>
						</thead>
					</table>
					<div class="main" id="main"
						style="width:100%;overflow-y: auto; height:100px;overflow-x: hidden;">
						<table id="listTable" class="dlist-table "
							style="width: 100%;table-layout: fixed;">
							<tbody id="rolelist">
								<s:iterator value="roleLs" status="index">
									<tr id="${id}" ondblclick="seeDetailed('${id}')">
										<td style="width:30px;text-align:center;"><s:property
												value="#index.count" />
										</td>
										<td style="width:30px;text-align:center;"><input
											type="checkbox" name="roleDtoId" id="subcheck" value="${id}"
											style="margin:0;">
										</td>
										<td style="text-align:center;"><s:property value="name" />
										</td>
										<td style="text-align:left;"
											title='<s:property value="remark"/>'><s:property
												value="remark" />
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
				</div>


				<div class="right-tree" style="width:30%;float: right;" >
					<div class="customer-box" style="width:100%">
						<div class="tit" >
							<i class="ico ico-cus"></i>
							<dict:lang value="角色功能权限" />：
						</div>

						<div class="customer-con"
							style="height:420px;min-height: 250px;overflow: auto;">
							<div id="index_tree" class="tree">
							<script>
								
							</script>
							</div>
						</div>
					</div>
				</div>
				<div class="clear" style="clear: both;"></div>

				<%--<div class="center">
					<s:include
						value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />

				</div>
				
			--%></div>


			<form id="submit_form" name="submitForm" action=""
				target="submit_frame" method="post">
				<input type="hidden" id="roleDtoSh_id" name="roleDtoSh.id" />
			</form>
			<div style="display: none;">
				<iframe id="submit_frame" name="submit_frame" src="" width="0"
					height="0"></iframe>
			</div>
		</div>
		
		
		
		
	</div>





	<script src="${path}/plf/page/fp/js/iframe-design.js"></script>
	<script type="text/javascript">
		$(function(){
			//获取当前iframe名称
			var ptfs = window.parent.frames;
			for ( var i = 0; i < ptfs.length; i++) {
				if (ptfs[i] == window) {
					$("#iframeId").val(window.name);
				}
			}
		});
		//点击行寄选中该行
		$("#listTable tr").on("click", function(e) {
			var trId = $(this).attr("id");
			if ($("#" + trId + " :checkbox").attr("checked")) {
				$("#" + trId + " :checkbox").attr("checked", false);
				$("#" + trId).css("background-color", "");
			} else {
				$("#listTable input[type='checkbox']").each(function() {
					if ($(this).attr("checked")) {
						$(this).attr("checked", false);
						$(this).parents("tr").css("background-color", "");
					}
				});
				$("#" + trId + " :checkbox").attr("checked", true);
				$("#" + trId).css("background-color", "#d3eafc");
			}
		});

		$("#listTable tr input[type=checkbox]").click(function(e) {
			e.stopPropagation();
			var style = $(this).parents("tr").attr("style");
			if (style && style.indexOf("background-color") > -1) {
				$(this).parents("tr").css("background-color", "");
			} else {
				$(this).parents("tr").css("background-color", "#d3eafc");
			}
		});

		function initHeight() {
			$('.main').height(
					$(parent.window).height() - 65 - 100 - 35 - 36 + 20);
			$('.dlist .bd').height($(parent.window).height() - 65 - 36 - 15);
			$('.dlist .bd').width($(window).width() - 2);
			$('#listTable').width($(window).width() - 2);
		}

		$(function() {
			$('.dept_select').chosen();
			initHeight();
			//_newScroll("main");
			getRole();
		});

		$(window).resize(function() {
			initHeight();
		});

		function selectAll() {
			if ($("#SelectAll").attr("checked")) {
				$(":checkbox").attr("checked", true);
				$("#listTable :checkbox").parents("tr").css("background-color",
						"#a0c8e5");
			} else {
				$(":checkbox").attr("checked", false);
				$("#listTable :checkbox").parents("tr").css("background-color",
						"");
			}
		}
		

		var paginationImpl = {};
		function query(paginationImpl) {
			util.showTopLoading();
			var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1
					: _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20
					: _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
			$
					.ajax({
						type : "POST",
						dataType : "json",
						url : "${path}sys/RoleAction_searchlistRole.ms",
						data : "roleName="
								+ $("#roleDtoSh_name").val()
								+ "&page.currentPage="
								+ _GLO_FORM_PAGE_MAP[paginationImpl].currentPage
								+ "&page.pageRecord="
								+ _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
						success : function(data) {
							util.closeLoading();
							if (null == data) {
								return;
							}
							$("#rolelist").empty();
							if (null != data.ajaxPage.dataList) {
								var roleList = eval(data.ajaxPage.dataList);
								for ( var i = 0; i < roleList.length; i++) {
									if (roleList[i].REMARK == null) {
										roleList[i].REMARK = "";
									}
									$("#rolelist")
											.append(
													"<tr id='"+roleList[i].ID+"' ></tr>");
									$("#rolelist tr:last")
											.append(
													"<td style='width:30px;text-align:center;'>"
															+ ((currentPage - 1)
																	* pageRecord + (i + 1))
															+ "</td>");
									$("#rolelist tr:last")
											.append(
													"<td style='width:30px;text-align:center;'><input type='checkbox' id='subcheck' name='roleDtoId' value='"+roleList[i].ID+"'/></td>");
									$("#rolelist tr:last").append(
											"<td style='text-align:center;'>"
													+ roleList[i].NAME
													+ "</td>");
									$("#rolelist tr:last").append(
											"<td style='text-align:left;'>"
													+ roleList[i].REMARK
													+ "</td>");
								}
								init();
								checkboxAll("rolelist");
								pageFun(data.ajaxPage, "formId1");
							}
						},
						error : function(msg) {
							util.closeLoading();
							utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
									0, "300", "");
						}
					});
		}

		//点击行寄选中该行
		function checkboxAll(tableId) {
			$("#" + tableId + " tr").unbind("click");
			$("#" + tableId + " tr input[type=checkbox]").unbind("click");
			$("#" + tableId + " tr")
					.on(
							"click",
							function(e) {
								var trId = $(this).attr("id");
								if ($("#" + trId + " :checkbox")
										.attr("checked")) {
									$("#" + trId + " :checkbox").attr(
											"checked", false);
									$("#" + trId).css("background-color", "");
								} else {
									$("#" + tableId + " input[type='checkbox']")
											.each(
													function() {
														if ($(this).attr(
																"checked")) {
															$(this).attr(
																	"checked",
																	false);
															$(this)
																	.parents(
																			"tr")
																	.css(
																			"background-color",
																			"");
														}
													});
									$("#" + trId + " :checkbox").attr(
											"checked", true);
									$("#" + trId).css("background-color",
											"#a0c8e5");
								}
							});

			$("#" + tableId + " tr input[type=checkbox]").click(function(e) {
				e.stopPropagation();
				var style = $(this).parents("tr").attr("style");
				if (style && style.indexOf("background-color") > -1) {
					$(this).parents("tr").css("background-color", "");
				} else {
					$(this).parents("tr").css("background-color", "#a0c8e5");
				}
			});
		}

		function reloadPg(msg, title, width, height, time, isCloseWin) {
			msgPop(msg, reloadPgExe, title, width, height, time, isCloseWin);
		}

		function reloadPgExe(isCloseWin) {
			/* document.forms.search_form.submit();
			util.showTopLoading(); */
			//query("formId1");
			getRole();
			if ("0" != isCloseWin) {
				top.$(".dialog-close").click();
			}

		}

		function getUpId() {
			return $("#funcDtoSh_upId").val();
		}


		function init() {
			var tableTrJs = $("#listTable tbody tr");
			//_toClickColor(tableTrJs);
			_tongLineColor(tableTrJs);
		}

		function newScroll(id) {
			$("#" + id).mCustomScrollbar({
				axis : "yx",
				snapAmount : 40,
				theme : "minimal-dark",
				keyboard : {
					scrollAmount : 40
				},
				mouseWheel : {
					deltaFactor : 40,
					preventDefault : true
				},
				scrollInertia : 80,
			});
		}
		

	</script>
	<%--<script type="text/javascript"
		src="${path}plf/page/fp/js/popMultPage.js"></script>
	--%><bu:submit viewId="11cf38a542974601992b33fdc2cff740" />
	<bu:script viewId="11cf38a542974601992b33fdc2cff740" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>