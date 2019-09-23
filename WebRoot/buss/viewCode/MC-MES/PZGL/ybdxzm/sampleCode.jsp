<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_17" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<head>
<title><dict:lang value="样本大小字码" />
</title>
<style>
.main {
	border-collapse: collapse;
	table-layout: fixed;
}

.main td {
	border: 1px solid #ccc;
	height: 25px;
	width: 90px;
	text-align: center;
	font-size: 14px;
}

.main td input {
	border: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	font-size: 14px;
	box-sizing: border-box;
	background-color: transparent;
}

.main td input:focus {
	outline: none;
}

.main select {
	width: 100%;
	outline:none;
	text-align:center;
	border:none;
	background-color: transparent;
}

.main-div table tr:nth-child(2n){
	background-color:#f0f4fd;
}

.main-div table tr:nth-child(1),.main-div table tr:nth-child(2){
	background-color:#dbe1ef;
}

.main-div tr:nth-child(n+3):hover{
	background-color:#c3e2fb !important;
}
</style>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
	<jsp:param name="msData" value="1" />
	<jsp:param name="scroll" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
<bu:header formId="c8f0e3dea3ef4cc5841a2344c28927d6" />


<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_17" />
	<jsp:param name="location" value="inHead" />
</jsp:include>
<!-- head里面 -->
</head>

<body>
	<div class="content-in">
		<div class="dlist">
			<div class="hd" style="display:none" id="editCode">

				<div class="optn">
					<form id="funForm" name="funForm" action="/mes/buss/bussModel.ms"
						method="post" target="submitFrame">
						<input type="hidden" name="exeid"
							value="13a8f67313db42f4b9b892555ee094ba">
						<table class="func_table">
							<tbody>
								<tr>
									<td width="100%" align="right">
										<button type="button" id="0bdda200ffb74b7faceb48ae5194a701"
											value="" onclick="addRow()" sytle="" class="botton_img_add">
											<i class="ico ico-kl "></i>
											<dict:lang value="添加行" />
										</button>
										<button type="button" id="8c0c325f07184d91b6189fb6305dcc4f"
											value="" onclick="delRow()" sytle="" class="botton_img_add">
											<i class="ico ico-sc "></i>
											<dict:lang value="删除行" />
										</button>

										<button type="button" id="57a2c6dac06a472ea693fa972b22434e"
											value="" onclick="addCol()" sytle="" class="botton_img_add">
											<i class="ico ico-kl "></i>
											<dict:lang value="添加列" />
										</button>
										<button type="button" id="eccf22fbe53c433aabb0c263072fd78f"
											value="" onclick="delCol()" sytle="" class="botton_img_add">
											<i class="ico ico-sc "></i>
											<dict:lang value="删除列" />
										</button>
										<button type="button" onclick="editSample(this);">
											<i class="ico ico-save"></i>
											<dict:lang value="保存" />
										</button>
										<button type="button" onclick="switchButton('view');">
											<i class="ico ico-cancel"></i>
											<dict:lang value="取消" />
										</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="hd" id="viewCode">
				<bu:func viewId="13a8f67313db42f4b9b892555ee094ba" />
			</div>
			<div class="bd">
				<div class="search-box">
					<form id="searchForm" name="searchForm"
						action="${path}buss/bussModel.ms?FUNC_CODE=F6050" method="post">
						<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
							<jsp:param name="modelName" value="VIEW_TYPE_17" />
							<jsp:param name="location" value="searchForm" />
						</jsp:include>

						<bu:search viewId="13a8f67313db42f4b9b892555ee094ba" />
					</form>
					<a href="javascript:void(0);" class="more"></a>
				</div>
				<div class="main-div scroll"
					style="width: 100%;height:calc(100% - 39px); overflow: auto;">
					<table class="main" cellpadding="0" cellspacing="0">
						<tbody id="loadItem">
							<s:if test="${ajaxString=='add' }">
								<tr>
									<td style="width:80px"></td>
									<td style="width:80px"></td>
									<td style="width:130px"><dict:selectDict dictCode="QMS_TEST_LEVEL"  /></td>
								</tr>
								<tr>
									<td><dict:lang value="开始数量" /></td>
									<td><dict:lang value="结束数量" /></td>
									<td><dict:selectDict dictCode="QMS_TEST_GRADE"  /></td>
								</tr>
								<tr>
									<td><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
									</td>
									<td><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
									</td>
									<td><input></td>
								</tr>
							</s:if>
							<s:else>
								<tr>
									<td style="width:80px"></td>
									<td style="width:80px"></td>

									<c:forEach items="${dataMap.rowList[0].CODE}" var="codeList">
										<td style="width:130px">
										<dict:selectDict dictCode="QMS_TEST_LEVEL"  dictValue="${codeList.QSC_TEST_LEVEL}"/>										
										</td>
									</c:forEach>
								</tr>
								<tr>
									<td><dict:lang value="开始数量" /></td>
									<td><dict:lang value="结束数量" /></td>
									<c:forEach items="${dataMap.rowList[0].CODE}" var="codeList">
										<td><dict:selectDict dictCode="QMS_TEST_GRADE"  dictValue="${codeList.QSC_TEST_GRADE}"/></td>
									</c:forEach>
								</tr>
								<c:forEach items="${dataMap.rowList}" var="rowList">
									<tr>
										<td><input onkeyup="value=value.replace(/[^\d.]/g,'')"
											value="${rowList.QSC_START_NUM }">
										</td>
										<td><input onkeyup="value=value.replace(/[^\d.]/g,'')"
											value="${rowList.QSC_END_NUM }">
										</td>
										<c:forEach items="${rowList.CODE}" var="codeList"
											varStatus="xstatus">
											<td><input value="${codeList.QSC_LETTER }">
											</td>
										</c:forEach>
									</tr>
								</c:forEach>


							</s:else>
						</tbody>
					</table>
				</div>



			</div>
		</div>
	</div>
	<form id="submitForm" name="submitForm" action="" target="submitFrame"
		method="post">
		<input type="hidden" name="exeid"
			value="13a8f67313db42f4b9b892555ee094ba">
		<input type="hidden" id="CURR_DATA_AUTH" value="${sessionScope.mcDataAuth}">
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
		<span id="testGradehtml"><dict:selectDict dictCode="QMS_TEST_GRADE" /></span>
		<span id="testLevelhtml"><dict:selectDict dictCode="QMS_TEST_LEVEL" /></span>
	</div>


	<bu:script viewId="13a8f67313db42f4b9b892555ee094ba" />

	<script type="text/javascript">
		function switchButton(type) {
			if (type == 'edit') {
				document.getElementById("viewCode").style.display = "none";
				document.getElementById("editCode").style.display = "block";
			} else if (type == 'view') {
				document.getElementById("viewCode").style.display = "block";
				document.getElementById("editCode").style.display = "none";
			}
		}

		function addRow() {
			var rowCount = $('.main tr:last td').length
			var htmlStr = '<tr>'
			for ( var i = 0; i < rowCount; i++) {
				htmlStr += '<td>'
				if (i == 0 || i == 1) {
					htmlStr += '<input onkeyup="value=value.replace(/[^\\d]/g,\'\')" >'

				} else {
					htmlStr += '<input>'

				}
				htmlStr += '</td>'
			}
			htmlStr += '</tr>'
			$('.main').append(htmlStr)
			$('.scroll').mCustomScrollbar("destroy");
			setPopScroll('.scroll');
		}
		function addCol() {
			var colCount = $('.main tr').length;
			var a=$("#testLevelhtml").html();
			$('.main tr')
					.eq(0)
					.append(
							'<td style="width:130px">'+a+'</td>')
			a=$("#testGradehtml").html();
			for ( var i = 1; i < colCount; i++) {
				if(i==1) $('.main tr').eq(i).append('<td>'+a+'</td>');
				else $('.main tr').eq(i).append('<td><input></td>');
			}
			colWidth();
			$('.scroll').mCustomScrollbar("destroy");
			setPopScroll('.scroll');
		}
		function delRow() {
			var rowCount = $('.main tr').length
			if (rowCount > 3) {
				utilsFp.confirmIcon(1, '', 'rowDel', '', '<dict:lang value="确认删除" />', 1, '300', '')
			}
			$('.scroll').mCustomScrollbar("destroy");
			setPopScroll('.scroll');
		}

		function rowDel() {
			$('.main tr:last').remove()
		
		}
		function delCol() {
			var colCount = $('.main tr:last td').length
			if (colCount > 3) {
				utilsFp.confirmIcon(1, '', 'colDel', '', '<dict:lang value="确认删除" />', 1, '300', '')

			}
       $('.scroll').mCustomScrollbar("destroy");
       setPopScroll('.scroll');
		}

		function colDel() {
			var colCount = $('.main tr:last td').length
			$('.main tr td:nth-of-type(' + colCount + ')').remove()
			colWidth();
			
		}
		/* function closeWindow(){
		   parent.closeTab(window.frameElement.name.replace("iframe", ""));
		}  */
        var saveUrl= "${path}buss/bussModel_exeFunc.ms?funcMId=b9ea74e4cb6b41288e4dd3683c7bd482";
		function editSample() {
			var dataAuth = $("#DATA_AUTH").val();
			var testStep = $("#QSC_TEST_STEP").val();
			/* if (dataAuth == '' || dataAuth == null) {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="组织机构不能为空" />", 0, "260", "");
				return false;
			} */
			if (testStep == '' || testStep == null) {
				utilsFp.confirmIcon(3, "", "", "",
						"<dict:lang value="检测阶别不能为空" />", 0, "260", "");
				return false;
			}
			var rowCount = $('.main tr').length //行数
			var colCount = $('.main tr:last td').length//列数
			var sampleArr = [];
			var sampleS = {};
			var preEndNum = '';
			for ( var i = 2; i < rowCount; i++) {
				var startNum = $('.main tr').eq(i).find('input').eq(0).val(); //开始数量

				if (startNum == '' || startNum == null) {
					utilsFp.confirmIcon(3, "", "", "",
							"<dict:lang value="开始数量不能为空" />", 0, "260", "");
					return false;
				}
				if (preEndNum != '' && Number(startNum) <= Number(preEndNum)) {
					
					utilsFp.confirmIcon(3, "", "", "",
							"<dict:lang value="下一行的开始数量必须大于上一行的结束数量" />", 0,
							"260", "");
					return false;
				}

				var endNum = $('.main tr').eq(i).find('input').eq(1).val();//结束数量
				if (endNum == '' || endNum == null) {
					utilsFp.confirmIcon(3, "", "", "",
							"<dict:lang value="结束数量不能为空" />", 0, "260", "");
					return false;
				}
				if (Number(startNum) >= Number(endNum)) {
					utilsFp.confirmIcon(3, "", "", "",
							"<dict:lang value="结束数量必须大于开始数量" />", 0, "260", "");
					return false;
				}

				preEndNum = endNum;
				for ( var j = 2; j < colCount; j++) {
					sampleS = {};
					sampleS.QSC_START_NUM = startNum;
					sampleS.QSC_END_NUM = endNum;
					var testLevel = $('.main tr').eq(0).find('select')
							.eq(j - 2).val();//检验水平

					if (testLevel == '' || testLevel == null) {
						utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="检验水平不能为空" />", 0, "260", "");
						return false;
					}
					sampleS.QSC_TEST_LEVEL = testLevel;

					var testGrade = $('.main tr').eq(1).find('select').eq(j - 2)
							.val();//水平等级
					if (testGrade == '' || testGrade == null) {
						utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="水平等级不能为空" />", 0, "260", "");
						return false;
					}
					sampleS.QSC_TEST_GRADE = testGrade;

					var letter = $('.main tr').eq(i).find('input').eq(j).val();//样本大小字母
					if (letter == '' || letter == null) {
						utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="样本大小字母不能为空" />", 0, "260",
								"");
						return false;
					}
					sampleS.QSC_LETTER = letter;
					sampleS.QSC_COLUMN_SEQ = j;
					sampleArr.push(sampleS);
				}

			}
			util.showLoading();
			var sampleArr = JSON.stringify(sampleArr);
			
			jQuery
					.ajax({
						type : "POST",
						dataType : "json",
						url : saveUrl,
						data : {
							'sampleArr' : sampleArr,
							'dataAuth' : dataAuth,
							'testStep' : testStep
						},
						success : function(data) {
						        util.closeLoading();
							switchButton('view');
							msgPop(data.ajaxMap.alertMsg, '',
									data.ajaxMap.title, data.ajaxMap.width,
									data.ajaxMap.height, data.ajaxMap.time);
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							util.closeLoading();
							var sessionstatus = XMLHttpRequest
									.getResponseHeader("sessionstatus");
							if (null != sessionstatus
									&& sessionstatus == "noAuthority") {
							} else {
								utilsFp.alert("error:" + errorThrown);
							}
						}
					});
		}
		function initHeight() {
			$('.main-div').height($('#bd').height() - 35); //35px为查询条件的高度
		}

		function colWidth() {
			var colCount = $('.main tr:last td').length;
			$('.main').width(160 + (colCount - 2) * 130);
		}

		function querySample() {
			util.showLoading();
			var testStep = $("#QSC_TEST_STEP").val();
			var dataAuth = $("#DATA_AUTH").val();
			console.log(dataAuth);
			var url = document.getElementById("searchForm").action;
			jQuery.ajax({
				type : "POST",
				url : url +"&"+ $('#searchForm').serialize(),
				data : {
					'dataAuth' : dataAuth,
					'testStep' : testStep
				},
				success : function(data) {
					var content = $(data).find("#loadItem");
					$("#loadItem").html(content.html());
					colWidth();
					util.closeLoading();
				}
			});

		}

		$(function() {
			//页面加载完毕执行
			initHeight();
			colWidth();
			$('#QSC_TEST_STEP,#DATA_AUTH').change(function() {
				querySample();
			});
		})

		$(window).resize(function() {
			//页面改变大小执行
			initHeight();
		});
	</script>
	<script type="text/javascript"
		src="/mes/plf/page/fp/js/paginationMultAx.js"></script>

	<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>

<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll');
  })
})(jQuery)</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_17" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>
