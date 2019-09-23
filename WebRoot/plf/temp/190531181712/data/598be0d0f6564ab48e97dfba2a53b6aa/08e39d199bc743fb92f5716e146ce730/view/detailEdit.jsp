<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="修改" />
</title>
<style>
.main {
	border-collapse: collapse;
}

.main td {
	border: 1px solid #ccc;
	height: 25px;
	width: 50px;
	text-align: center;
	font-size: 14px;
}

.main td input {
	border: 0;
	width: 50%;
	height: 100%;
	text-align: center;
	float: left;
	font-size: 14px;
	box-sizing: border-box;
	background-color: transparent;	
}

.main td input:focus {
	outline: none;
	border: 1px solid #c3e2fb;
}

.main td .full {
	width: 100%;
}

.main-div table tr:nth-child(2n+1){
	background-color:#f0f4fd;
}

.main-div table tr:nth-child(1),.main-div table tr:nth-child(3){
	background-color:#dbe1ef;
}
</style>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="inHead" />
</jsp:include>
</head>
<body>
	<div class="dlist" style="height:100%;">
		<form id="editForm" name="editForm"  style="height:100%;"
			action="${path}buss/bussModel_editAjaxComm.ms" method="post"
			target="submitFrame" <bu:formet exeid="%{exeid}" />>
			<div class="hd">
				
				<div style="margin-left:40px;">
					<s:if test="${isDataAuth == '1'}">
						<span class="dot">*</span>
						<dict:lang value="组织机构" />
						<s:if test="${fn:length(deptLs)==1}">
							<s:select list="deptLs" listKey="id" listValue="name"
								name="paraMapObj._DATA_AUTH" id="deptLs_data_auth"
								cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select" />
						</s:if>
						<s:else>
							<s:select list="deptLs" headerKey=""
								headerValue='--%{getText("请选择")}--' listKey="id"
								listValue="name" name="paraMapObj._DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;"
								cssClass="_VAL_NULL dept_select" />
						</s:else>
					</s:if>
				</div>
				<div class="optn">
					<button type="button" onclick="addRow();">
						<i class="ico ico-kl"></i>
						<dict:lang value="添加行" />
					</button>
					<button type="button" onclick="delRow();">
						<i class="ico ico-sc"></i>
						<dict:lang value="删除行" />
					</button>
					<button type="button" onclick="addCol();">
						<i class="ico ico-kl"></i>
						<dict:lang value="添加列" />
					</button>
					<button type="button" onclick="delCol();">
						<i class="ico ico-sc"></i>
						<dict:lang value="删除列" />
					</button>
					<button type="button" onclick="editSample(this);">
						<i class="ico ico-save"></i>
						<dict:lang value="保存" />
					</button>
					<button type="button" onclick="closeWindow();">
						<i class="ico ico-cancel"></i>
						<dict:lang value="取消" />
					</button>
					
				</div>

			</div>
			<div class="bd">
				<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
					<jsp:param name="modelName" value="VIEW_TYPE_11" />
					<jsp:param name="location" value="editForm" />
				</jsp:include>
				<bu:set name="paraMapObj" value="${dataId}"
					formId="eec4f10d65b0411eb66da26fd2b55837" type="edit" />
				<div class="search-box">
				<table class="search_table">
					<input type="hidden" name="formIds"
						value="eec4f10d65b0411eb66da26fd2b55837" />
					<input type="hidden" name="eec4f10d65b0411eb66da26fd2b55837"
						value="paraMap1@" />
					<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
					<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
					<input type="hidden" name="sampleArr" id="sampleArr" />
					<s:set name="_$viewId" value="'0cb2052bdab04ee7a063651da40da318'" />
					<s:set name="_$formId_1" value="'eec4f10d65b0411eb66da26fd2b55837'" />
					<s:set name="_$type" value="'edit'" />
					<tr>
						<td>
							<div class="group">
								<div class="name"><bu:uitn colNo="QSP_TEST_STEP" formId="eec4f10d65b0411eb66da26fd2b55837" /></div>
								<div class="dec">	
									<bu:ui colNo="QSP_TEST_STEP" style="width:240px;" formId="eec4f10d65b0411eb66da26fd2b55837" disabled="disabled" dataId="${dataId}" formIndex="1" />
								</div>			
      							</div>
						</td>
						<td>
							<div class="group">
								<div class="name"><bu:uitn colNo="QSP_PLAN_TYPE" formId="eec4f10d65b0411eb66da26fd2b55837" /></div>
								<div class="dec">	
									<bu:ui colNo="QSP_PLAN_TYPE" style="width:240px;" formId="eec4f10d65b0411eb66da26fd2b55837" disabled="disabled" dataId="${dataId}" formIndex="1" />
								</div>			
      							</div>
						</td>
						<td>
							<div class="group">
								<div class="name"><bu:uitn colNo="QSP_PLAN_NAME" formId="eec4f10d65b0411eb66da26fd2b55837" /></div>
								<div class="dec">	
									<bu:ui colNo="QSP_PLAN_NAME" style="width:240px;" formId="eec4f10d65b0411eb66da26fd2b55837" disabled="disabled" dataId="${dataId}" formIndex="1" />
								</div>			
      							</div>
						</td>
					</tr>

				</table>
				</div>
				<div class="main-div"  style="width:100%;overflow:auto;box-sizing: border-box;">
					<table class="main" cellpadding="0" cellspacing="0">
						<s:if test="${ajaxString=='add' }">
							<tr>
								<td></td>
								<td></td>
								<td>AQL</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td><input class="full" onkeyup="value=value.replace(/[^\d.]/g,'')" /></td>
							</tr>
							<tr>
								<td style="width:90px;"><dict:lang value="样本大小代码" /></td>
								<td><dict:lang value="样本数" /></td>
								<td><input value="AC" readonly="readonly"><input
									value="RE" readonly="readonly"></td>

							</tr>
							<tr>
								<td><input class="full"></td>
								<td><input class="full" onkeyup="value=value.replace(/[^\d.]/g,'')"></td>
								<td><input><input></td>
							</tr>
						</s:if>
						<s:else>

							<tr>
								<td></td>
								<td></td>
								<c:forEach items="${dataMap.AQL}">
									<td>AQL</td>
								</c:forEach>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<c:forEach items="${dataMap.AQL}" var="aqlList"
									varStatus="status">
									<td><input class="full" value="${aqlList.QSD_AQL_VALUE }" />
									</td>
								</c:forEach>
							</tr>
							<tr>
								<td style="width:90px;"><dict:lang value="样本大小代码" /></td>
								<td><dict:lang value="样本数" /></td>
								<c:forEach items="${dataMap.AQL}">
									<td><input value="AC" readonly="readonly"><input
										value="RE" readonly="readonly"></td>
								</c:forEach>
							</tr>
							<c:forEach items="${dataMap.rowList}" var="rowList"
								varStatus="status">
								<tr>
									<td><input class="full"
										value="${rowList.QSD_SAMPLE_CODE }"></td>
									<td><input class="full" value="${rowList.QSD_SAMPLE_NUM }">
									</td>
									<c:forEach items="${rowList.QSD_AQL_VALUE}" var="aqlList"
										varStatus="xstatus">
										<c:set value="${xstatus.index}" var="filekey" />
										<td><input value="${aqlList.QSD_AC_VALUE }"> <input
											value="${aqlList.QSD_RE_VALUE }"></td>
									</c:forEach>
								</tr>
							</c:forEach>
						</s:else>
					</table>
				</div>

			</div>
		</form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>
	<bu:script viewId="08e39d199bc743fb92f5716e146ce730" />
	

	<script type="text/javascript">

	
	
		var rowCount = $('.main tr:last td').length;
		$('.main').width(rowCount * 50 + 40);
		
		//点击上下键时，转换成箭头
		$('.main').on(
				'keydown',
				'td input',
				function(event) {
					var e = event || window.event
							|| arguments.callee.caller.arguments[0];
					if (e.keyCode == 38 || e.which == 38) {
						$(this).val('⇑')
					}
					if (e.keyCode == 40 || e.which == 40) {
						$(this).val('⇓')
					}
				})

		function initHeight() {
			$('.main-div').height($(window).height() - 58 - 40 - 39 - 15) //39px为查询条件的高度
			
		}

		$(function() {
			//页面加载完毕执行
			initHeight();
			
			
		})

		$(window).resize(function() {
			//页面改变大小执行
			initHeight();
		});

		function addRow() {
			var rowCount = $('.main tr:last td').length;
			var rowNum = $('.main tr').length;

			var htmlStr = '<tr><td><input class="full" ></td><td><input class="full" onkeyup="value=value.replace(/[^\\d.]/g,\'\')" ></td>';
			for ( var i = 2; i < rowCount; i++) {
				htmlStr += '<td>';
				htmlStr += '<input><input>';
				htmlStr += '</td>';
			}
			htmlStr += '</tr>';
			$('.main').append(htmlStr);
		}

		function addCol() {
			var colCount = $('.main tr').length;
			var width = 0;
			$('.main tr').eq(0).append('<td>AQL</td>');
			$('.main tr').eq(1).append('<td><input class="full" onkeyup="value=value.replace(/[^\\d.]/g,\'\')" ></td>');
			$('.main tr')
					.eq(2)
					.append(
							'<td><input value="AC" readonly="readonly"><input value="RE" readonly="readonly"></td>');
			for ( var i = 3; i < colCount; i++) {
				$('.main tr').eq(i).append('<td><input><input></td>');
			}
			var rowCount = $('.main tr:last td').length;
			$('.main').width(rowCount * 50 + 40);
		}

		function delRow() {
			var colCount = $('.main tr').length;
			if (colCount > 3) {
				utilsFp.confirmIcon(1, '', 'rowDel', '',
						'<dict:lang value="确认删除" />', 1, '300', '');
			}
		}

		function rowDel() {
			$('.main tr:last').remove();
		}

		function delCol() {
			var rowCount = $('.main tr:last td').length;
			if (rowCount > 2) {
				utilsFp.confirmIcon(1, '', 'colDel', '',
						'<dict:lang value="确认删除" />', 1, '300', '');

			}

		}

		function colDel() {
			var rowCount = $('.main tr:last td').length;
			$('.main tr td:nth-of-type(' + rowCount + ')').remove();
			var rowCount = $('.main tr:last td').length;
			$('.main').width(rowCount * 50 + 40);
		}

		function printf() {
			var rowCount = $('.main tr').length //行数
			var colCount = $('.main tr:last td').length//列数
			var str = ''
			for ( var i = 3; i < rowCount; i++) {

				for ( var j = 2; j < colCount; j++) {
					str += $('.main tr').eq(i).find('input').eq(0).val() + ' ' //样本大小字码
					str += $('.main tr').eq(i).find('input').eq(1).val() + ' ' //样本数  
					str += $('.main tr').eq(1).find('input').eq(j - 2).val()
							+ ' ' //AQL
					str += $('.main tr').eq(i).find('input').eq((j - 1) * 2)
							.val()
							+ ' ' //AC
					str += $('.main tr').eq(i).find('input')
							.eq((j - 1) * 2 + 1).val()
							+ ' ' //RE
					str = ''
				}

			}

		}

		function editSample() {
			var rowCount = $('.main tr').length //行数
			var colCount = $('.main tr:last td').length//列数
			var sampleArr = [];
			var sampleS = {};
			var preAql = '';
			for ( var i = 3; i < rowCount; i++) {

				for ( var j = 2; j < colCount; j++) {
					sampleS = {};
					sampleS.QSD_ROW_SEQ = i;
					var code = $('.main tr').eq(i).find('input').eq(0).val(); //样本大小字码

					if (code == '' || code == null) {
						utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="样本大小字码不能为空" />", 0, "260",
								"");
						return false;
					}
					sampleS.QSD_SAMPLE_CODE = code;
					var num = $('.main tr').eq(i).find('input').eq(1).val();//样本数  
					if (num == '' || num == null) {
						utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="样本数不能为空" />", 0, "260", "");
						return false;
					}
					sampleS.QSD_SAMPLE_NUM = num;
					var aql = $('.main tr').eq(1).find('input').eq(j - 2).val();//AQL

					if (aql == '' || aql == null) {
						utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="AQL不能为空" />", 0, "260", "");
						return false;
					}
					if (i == 3 && preAql != '' && Number(aql) <= Number(preAql)) {
						utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="AQL值必须递增" />", 0, "260", "");
						return false;
					}
					preAql = aql;
					sampleS.QSD_AQL_VALUE = aql;
					var ac = $('.main tr').eq(i).find('input').eq((j - 1) * 2)
							.val();//AC
					if (ac == '' || ac == null) {
						utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="AC不能为空" />", 0, "260", "");
						return false;
					}
					if(/^[\u4e00-\u9fa5a-zA-Z]+$/.test(ac)){
             	        utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="AC不能输入英文或中文" />", 0, "260", "");
								return false;
                    }else if(ac!="⇓" && ac!="⇑" ){
                            
                        	if(!/^[0-9]*$/.test(ac)){
             	                  utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="AC请输入数字" />", 0, "260", "");
								return false;
                        }
                        
                    }
					sampleS.QSD_AC_VALUE = ac;
					var re = $('.main tr').eq(i).find('input').eq(
							(j - 1) * 2 + 1).val();//RE
					if (re == '' || re == null) {
						utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="RE不能为空" />", 0, "260", "");
						return false;
					}
				
             if(/^[\u4e00-\u9fa5a-zA-Z]+$/.test(re)){
             	utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="RE不能输入英文或中文" />", 0, "260", "");
								return false;
             }else if(re!="⇓" && re!="⇑" ){
                        	if(!/^[0-9]*$/.test(re)){
             	                  utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="RE请输入数字" />", 0, "260", "");
								return false;
                        }
                        
                    }
        
					sampleS.QSD_RE_VALUE = re;
					sampleArr.push(sampleS);
				}

			}
			util.showLoading();
			$("#sampleArr").val(JSON.stringify(sampleArr));

			document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=51f8468b347a4a9db8e18df85d9dc33f";;
			
			//51f8468b347a4a9db8e18df85d9dc33f
			
			document.forms.editForm.submit();
		}

		function closeAndRefreshTab(msg, title, width, height, time) {
		    
			var iframeId = "${iframeId}";
			console.log("iframeId"+iframeId);
			util.closeLoading();
			msgPop(msg, '', title, width, height, time);
		
			parent.switchTabWithoutReload(iframeId.replace("iframe", ""));
		//	parentWindow.query(iframeId);
			//	console.log("sw");
			//	parent.query("eec4f10d65b0411eb66da26fd2b55837");
			top.document.getElementById(iframeId).contentWindow.query("eec4f10d65b0411eb66da26fd2b55837");
			parent.closeTab(window.frameElement.name.replace("iframe", ""));
			
		   
		    
            
		}


		
	</script>
	<!-- js初始化方法 -->
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_11" />
		<jsp:param name="location" value="jsLoading" />
	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.main-div');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>
