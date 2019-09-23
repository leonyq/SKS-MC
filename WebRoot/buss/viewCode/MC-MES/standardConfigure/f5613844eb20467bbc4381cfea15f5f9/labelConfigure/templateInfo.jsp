<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_17" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<head>
<title><dict:lang value="VM_标签模板" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
	<jsp:param name="msData" value="1" />
	<jsp:param name="scroll" value="1" />
</jsp:include>
 <%@ include file="/buss/inc_files/inc_dev.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
<bu:header formId="401c8c8677384f7cae40ebef4c1290df" />


<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_17" />
	<jsp:param name="location" value="inHead" />
</jsp:include>
<!-- head里面 -->
   <script src="${path}plf/page/mlabel/page/labelDesigner/js/jscolor.js?version=<%=JSCOLOR_JS %>"></script>
    <script src="${path}plf/page/mlabel/page/labelDesigner/js/colpick.js?version=<%=COLPICK_JS %>"></script>
    <script src="${path}plf/page/mlabel/page/labelDesigner/js/topo.js?version=<%=TOPO_JS %>"></script>
	<script src="${path}plf/page/mlabel/page/labelDesigner/js/businessTopo.js?version=<%=BUSINESSTOPO_JS %>"></script>
	<script type="text/javascript" src="${path}plf/page/mlabel/page/labelDesigner/js/jtopo-min1.js?version=<%=JTOPOMIN1_JS %>"></script>
	<script src="${path}plf/page/mlabel/page/labelDesigner/js/toHex.js?version=<%=TOHEX_JS %>"></script>
	<script src="${path}plf/page/mlabel/page/labelDesigner/js/spectrum.js?version=<%=SPECTRUM_JS %>"></script>
 <script language="javascript" src="${path}plf/page/mlabel/page/labelDesigner/js/LodopFuncs.js?version=<%=LODOPFUNCS_JS %>"></script>
<script language="javascript" src="${path}plf/page/mlabel/page/labelDesigner/js/CLodopfuncs.js?version=<%=CLODOPFUNCS_JS %>"></script> 
<script src="http://localhost:18000/CLodopfuncs.js?priority=0"></script>
    <script src="http://localhost:8000/CLodopfuncs.js?priority=1"></script>
   <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
 <link rel="stylesheet" href="${path}plf/page/mlabel/css/listLabel.css?version=<%=LISTLABEL_CSS %>"> 
<style>
li .operation .buttons>div {
	width: 100%;
}

li .operation .buttons>div .ico {
	margin-left: 80px;
}

/* 按钮图片 */
li .operation .buttons>div:nth-of-type(1) .ico {
	background-image: url(${path}plf/page/mlabel/img/ico-data-item.png);
}

li .operation .buttons>div:nth-of-type(2) .ico {
	background-image: url(${path}plf/page/mlabel/img/ico-redact.png);
}

li .operation .buttons>div:nth-of-type(3) .ico {
	background-image: url(${path}plf/page/mlabel/img/ico-pack.png);
}

li .operation .buttons>div:nth-of-type(4) .ico {
	background-image: url(${path}plf/page/mlabel/img/ico-authorize.png);
}

li .operation .buttons>div:nth-of-type(5) .ico {
	background-image: url(${path}plf/page/mlabel/img/ico-example.png);
}

li .operation .buttons>div:nth-of-type(6) .ico {
	background-image: url(${path}plf/page/mlabel/img/ico-print.png);
}

li .operation .buttons>div:nth-of-type(7) .ico {
	background-image: url(${path}plf/page/mlabel/img/ico-print.png);
}

li .operation .buttons>div:nth-of-type(8) .ico {
	background-image: url(${path}plf/page/mlabel/img/ico-print.png);
}

#addLabel>span {
    display: block;
    width: 248px;
    height: 50px;
    cursor: pointer;
    background: #f2f2f2;
    margin-left:0px;
    margin-top:0;
    line-height: 50px;
    text-align: center;
}

#addLabel>span:hover{
    background:#ddd;
}

#addLabel>span .ico{
    width:15px;
    height:15px;
    display:inline-block;
    margin:0;
    margin-right:5px;
    margin-top: -2px;
}
li>.p1 span:nth-of-type(1) {
	display: block;
	width: 200px;
	float: left;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.check {
	width: 12px;
	height: 12px;
	display: inline-block;
	background-color: #fff;
	background-image: url(${path}plf/page/mlabel/img/unchecked.png);
	margin-top: 5.5px;
	margin-left: 8px;
}
#addLabel>span:nth-of-type(1) .ico{
    background-image:url(${path}plf/page/fp/img/ico-zaixiantongbu.png);
}

#addLabel>span:nth-of-type(2) .ico{
    background-image:url(${path}plf/page/fp/img/ico-lixiantongbu.png);
}
/*查询栏样式*/
.search{
    margin-top:7px;
    margin-bottom:2px;
    height:30px;
}
.search>div{
    float:right;
    margin-right:20px;
    position: relative;
}

.search>div>*{
    float:left;
}

.search .ico{
    width: 15px;
    height: 15px;
    position: absolute;
    left: 7px;
    top: 8px;
    background-image:url(../img/search.png);
}

.search .input{
    width:200px;
    height:30px;
    margin-right:10px;
    padding-left:30px;
}

.search .btn{
    color:#fff;
    background-color:#004098;
    width:60px;
    height:30px;
    text-align:center;
    line-height:30px;
    border-radius:2px;
    cursor: pointer;
}

.search .btn:hover{
    background-color:#003884;
}
</style>
</head>

<body>
<div style="display: none" id="strCLodopInstall"><dict:lang value="摩尔共享标签打印服务(localhost本地)未安装启动!安装后请刷新页面" /></div>
	 <input type="hidden" name="pathId" value="${path}" id="pathId">
	<div class="content-in">
		<div class="dlist">
			<div class="bd" style="padding:5px;height:calc(100% - 10px);">
			
			<div class="search">
				    <div>
				        <i class="ico"></i>
				        <input type="text" id="labelNameSearch" placeholder="<dict:lang value="标签名称" />" class="input"  onkeypress="checkEnterSeach();">	
                        <div class="btn" onclick="listAjaxTable()"><dict:lang value="查询" /></div>
				    </div>
	    
    			</div>
				<div class="search-box">
					<form id="searchForm" name="searchForm"
						action="${path}buss/bussModel.ms" method="post">
						<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
							<jsp:param name="modelName" value="VIEW_TYPE_17" />
							<jsp:param name="location" value="searchForm" />
						</jsp:include>
					</form>
				</div>
				<div style="height:calc(100% - 37px);overflow:auto;" class="scroll">
					<form action="" method="post" id="listForm" style="height:100%;">
						<input type="hidden" name="formId" id="formId1"
							value='456232dd31a0406693c9bc494bd6a702' /> <input type="hidden"
							name="delId" id="delId" value='' />
						<ul id="template_data" style="height:100%;">

						</ul>
					</form>
				</div>

			</div>
		</div>
	</div>

<form id="uploadForm" name="uploadForm" action="buss/bussModel_exeFunc.ms?funcMId=6f442e978ad84464a5be95a57116770b" method="post" enctype="multipart/form-data" >
    <input id="file" name="upFile" type="file" onchange="doUpload()" style="display:none" />
    <input type="hidden" name="iframeId" id="iframeId" value='' />
</form>

	<bu:submit viewId="d3cc0dc008f241eba12f3483c3ddf0cc" />
	<bu:script viewId="d3cc0dc008f241eba12f3483c3ddf0cc" />
	<script type="text/javascript">
	
		function reloadPg(msg, title, width, height, time, isCloseWin) {
			msgPop(msg, reloadPgExe, title, width, height, time, isCloseWin);
		}
		function reloadPgExe(isCloseWin) {
			query("formId1");
			if ("0" == isCloseWin || undefined == isCloseWin) {
				top.$(".dialog-close").click();
			}
			//checkboxAll("joblist");
		}
		function alertInfo(msg) {
			util.closeLoading();
			utilsFp.confirmIcon(3, "", "", "", msg, 0, "300", "");
		}
	</script>
	<script type="text/javascript">
		var onUrl = '${path}plf/page/mlabel/img/ico-on.png'
		var offUrl = '${path}plf/page/mlabel/img/ico-off.png'
		var checkedUrl = '${path}plf/page/mlabel/img/checked2.png'
		var uncheckedUrl = '${path}plf/page/mlabel/img/unchecked2.png'


		//关闭放大
		function closeBig() {
			$('.shadow_div').remove();
			$('.master_map').remove();
			$('.close_img').remove();
		}
		$('body').on('click', '.shadow_div', closeBig)
		$('body').on('click', '.close_img', closeBig)

		//当file发生改变时，展示图片
		$('ul').on('change', '.upLoad', function() {
			file = this.files[0];
			var url = URL.createObjectURL(file);
			$(this).parents('li').find('img').attr('src', url);
		})

		$('ul').on('mouseenter', 'li .pic', function() {
			$('.operation').css('display', 'none');
			$('.count').css('display', 'block');
			$(this).parent().find('.operation').slideDown('fast');
			// $(this).parent().find('.operation').css('display','block');
			$(this).parent().find('.count').css('display', 'none');
		})

		$('ul').on('mouseleave', 'li .operation', function() {
			$('.operation').slideUp('fast');
			// $(this).css('display','none');
			$(this).prev().css('display', 'block');
		})
	</script>
	<script type="text/javascript">
		$(function() {
			listAjaxTable();
		});

		function showPic(sample) {
			var url;
			if (sample == null || sample == '' || sample == 'null') {
				url = '${path }plf/page/mlabel/img/default.png';
			} else
				url = '${path }' + sample;
			$("<div class='shadow_div'>").appendTo('body');
			$("<img class ='master_map' src='" + url + "'>").appendTo('body');
			$('.master_map').css('left',
					'calc((100% - ' + $('.master_map').width() + 'px)/2)');
			$('.master_map').css('top',
					'calc((100% - ' + $('.master_map').height() + 'px)/2)');
			$("<div class='close_img'>").appendTo('body');
		}
		
	function checkEnterSeach(obj){
		if(event.keyCode == 13){
		    listAjaxTable();			
		}
	 }
		/*异步请求数据*/
		function listAjaxTable() {
			var labelNameSearch=$("#labelNameSearch").val();
			util.showLoading('<dict:lang value="处理中"/>' + '...');
			$
					.ajax({
						url : "buss/bussModel_exeFunc.ms?funcMId=694772b330a94a9aa0c28337273bd045",
						data : {'type':'listTemplate','labelNameSearch':labelNameSearch},
						type : "post",
						dataType : "json",
						success : function(data) {
							util.closeLoading();
							createTable(data.ajaxMap.templateList);
						},
						error : function(msg) {
							util.closeLoading();
							utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
									0, "300", "");
						}
					});
		}

		/*创建列表 */
		function createTable(dataList) {
			var htmlArr = [];
			htmlArr.push("<li id='addLabel'>");
			htmlArr.push("<span style='margin-top:63px;'><span class='ico'></span>同步标签模板</span>");
	        htmlArr.push("<span style='margin-top:20px;'><span class='ico'></span>离线同步模板</span>");
			htmlArr.push("</li>");
			$
					.each(
							dataList,
							function(i, v) {

								htmlArr.push("<li>");
								htmlArr.push("<div class='pic'>");
								htmlArr
										.push("<img src='"
												+ (v.SAMPLE_MAP == null ? "${path}plf/page/mlabel/img/default.png"
														: v.SAMPLE_MAP) + "'>");
								htmlArr.push("</div>");
								htmlArr.push("<div class='p1'>");
								htmlArr.push("<span>" + v.LABEL_NAME
										+ "</span>");

								htmlArr.push("<span class='switch' isOn='"
										+ (v.STATUS == 1 ? 'true' : 'false')
										+ "' ></span>");
								htmlArr.push("</div>");
								htmlArr.push("<div class='p2'>");
								htmlArr
										.push("<p><dict:lang value="标签尺寸" /><span>"
												+ v.LABEL_LENGTH
												+ "*"
												+ v.LABEL_WIDTH
												+ "("
												+ v.SIZE_UNIT + ")</span></p> ");
								htmlArr.push("</div>");
								htmlArr.push("<div class='count'><span>"
										+ (v.PRINT_NUM) + "</span></div>");

								htmlArr.push("<div class='operation'>");
								htmlArr
										.push("<div class='delete' onclick=\"ajaxDel('"
												+ v.ID + "')\"></div>");
								htmlArr.push("<div class='buttons'>");

								htmlArr
										.push("<div style='margin-top:45px;' onclick=\"ajaxEditItem('"
												+ v.ID
												+ "')\"> <span class='ico'></span><span><dict:lang value='数据项'/></span></div>");
								
								htmlArr
										.push("<div onclick=\"printLable('"
												+ v.ID
												+ "')\"> <span class='ico'></span><span><dict:lang value='预览'/></span></div>");
								
								htmlArr.push("</div>");
								htmlArr.push("</div>");

								htmlArr.push("</li>");
							});
			$("#template_data").html(htmlArr.join(""));
			$("#addLabel>span").eq(0).click(function() {
				addAjax();
			});
			$("#addLabel>span").eq(1).click(function() {
				openDialog();
			});
		}
		
function addAjax(){
  util.showTopLoading();
  $.ajax({
	url : "${path}buss/bussModel_exeFunc.ms?funcMId=b9db6b2d4242443ea8b25d792b9e5e27",
	data : {
		LOGINNAME: "csh",
		PWD: "123456"
	},
	type : "post",
	async : false,
	dataType : "json",
	success : function(data) {
		util.closeLoading();
		if (data.res == 'success') {
			query("formId1");
			msgPop(data.alertMsg,"",data.title,data.width,data.height,data.time,"");
			//utilsFp.confirmIcon(1, "", "", "","<dict:lang value='导入标签模板成功'/>", 0, "300", "");
		} else {
			utilsFp.confirmIcon(3, "", "", "", data.msg, 0, "300", "");
		}
	},
	error : function(msg) {
		util.closeLoading();
		utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
	}
	});
}


function commExcelImport(){ 
  var url='sys/excel/ExcelAction_ImportPage.ms?exeid=%{exeid}&iframeId='+_currentFrame; 
  showPopWinFp(url, 1200, 600,null,"<dict:lang value='导入标签模板'/>"); 
}   

		function printLable(id) {
			util.showTopLoading();
			var url;
			$.ajax({
						url : "${path}buss/bussModel_exeFunc.ms?funcMId=694772b330a94a9aa0c28337273bd045",
						data : {
							type: 'printLable',
							dataId: id
						},
						type : "post",
						async : false,
						dataType : "json",
						success : function(data) {
							util.closeLoading();
							if (data.res == 'success') {
							printLableData(data);
								url = data.url;

							} else {
								utilsFp.confirmIcon(3, "", "", "", data.msg, 0,
										"300", "");
							}
						},
						error : function(msg) {
							util.closeLoading();
							utilsFp.confirmIcon(3, "", "", "", "error:" + msg,
									0, "300", "");
						}
					});
			if (url != null && url != '')
				window.open(url);
		}

		function query() {
			listAjaxTable();
		}
		/**
	 	* 打印预览数据
	 	*/
		function printLableData(data){
		
		var lableCss=data.LABELCSS;
    	lableCss=JSON.parse(lableCss);
    	var pageInfo=lableCss.page;
		var paperWidth=pageInfo.paperWidth+"mm";
		var paperHeight=pageInfo.paperHeight+"mm";
		var spaceNum=pageInfo.spaceNum;
		var spaceVal=pageInfo.spaceVal;
		var lableWidth=pageInfo.lableWidth;
		var lableHeight=pageInfo.lableHeight;
		ieBrowser=isIeBrowser();
		if(ieBrowser.result==false){
			utilsFp.confirmIcon(3,"","","", ieBrowser.msg,0,"260","");
			return false;
		}
		var resultTemp=CheckIsInstall();
        if(resultTemp.result==false){
          window.open(resultTemp.url,"_self");
        }
        if(resultTemp.result==false){
          return false;
        }
		var baseXValue=(spaceVal/2)*5;//纸张左边距
		LODOP=getLodop(document.getElementById('LODOP1'),document.getElementById('LODOP_EM1'));
		LODOP.SET_PRINT_PAGESIZE(1,paperWidth,paperHeight);
		for(var i=0;i<spaceNum;i++){
			CreatePrintPage(baseXValue,parseFloat(lableWidth)+parseFloat(spaceVal),lableHeight,i,lableCss,lableCss.containerX,lableCss.containerY);
			printLine(baseXValue,parseFloat(lableWidth)+parseFloat(spaceVal),lableHeight,i,lableCss,lableCss.containerX,lableCss.containerY);
		}
		LODOP.PREVIEW();
		}
		
function ajaxDel(id){
	utilsFp.confirmIcon(1,"","delConfirmCheck",id, "<dict:lang value='是否确认删除'/>","1","260","");


}

function delConfirmCheck(id){
	delConfirm(id);
	/* $.ajax({
		type: "POST",
		dataType: "json",
		url: "buss/bussModel_exeFunc.ms?funcMId=0b5d25890e944cba9edf879ba45cc379",
		data: {
		'dataId': id
		},
		success: function(data){
			if ("supplier" == data) {
				utilsFp.confirmIcon(1,"","delConfirm",id, "标签模板已授权，删除后将无法正常打印，是否确认删除?","1","300","");
			}else{
				delConfirm(id);
			}
		},
		error: function(msg){
			util.closeLoading();
			utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
		}	
	}); */
}

function delConfirm(id){
   $("#delId").val(id);
  var oldUrl = document.forms.listForm.action;
  var oldTarget = document.forms.listForm.target;
  document.forms.listForm.action="buss/bussModel_exeFunc.ms?funcMId=58e02e88da2e4a9f844d837ec47b2377";
  document.forms.listForm.target = "submitFrame";
  document.forms.listForm.submit();
  document.forms.listForm.action = oldUrl;
  document.forms.listForm.target = oldTarget;
}

function getSelCount() {
  var sel = $("ul input[type='radio']:checked");
  return sel.size() >0;

}	
		
	
	function openDialog() { 
  		//util.showTopLoading();
		$("#file").val("");
		document.getElementById("file").click(); 
	}
	function doUpload() {
		if("" != $("#file").val()){
  	  	    util.showTopLoading();
		}
	  $("#iframeId").val(window.name);
	  var oldUrl = document.forms.uploadForm.action;
	  var oldTarget = document.forms.uploadForm.target;
	  document.forms.uploadForm.action="buss/bussModel_exeFunc.ms?funcMId=6f442e978ad84464a5be95a57116770b";
	  document.forms.uploadForm.target = "submitFrame";
	  document.forms.uploadForm.submit();
	  document.forms.uploadForm.action = "buss/bussModel_exeFunc.ms?funcMId=6f442e978ad84464a5be95a57116770b";
	  document.forms.uploadForm.target = oldTarget;
	  //document.getElementById("uploadForm").submit();
	}
	
		
		
	</script>
	<script>
		(function($) {
			$(window).on('load', function() {
				setPopScroll('.scroll');
			})
		})(jQuery)
	</script>
	<script type="text/javascript"
		src="${path}plf/page/fp/js/paginationMultAx.js"></script>
	<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_17" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>
