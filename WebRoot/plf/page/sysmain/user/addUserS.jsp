<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="导入员工" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<style>
		body{
			background-color:#fff;
		}
		
		#template{
			position: relative;
		}
		
		
		#template .pic{
			width:220px;
			height:100px;
			background-image:url(${path}plf/page/fp/img/leading-in.png);
			margin-left:240px;
			margin-top:30px;
			margin-bottom:5px;
		}
		
		#template p{
			height:25px;
			line-height:25px;
			margin-top:25px;
			margin-left:70px;
		}
	
		#template p .num{
			float:left;
			width:25px;
			height:25px;
			line-height:25px;
			text-align:center;
			border-radius: 50%;
			background-color:#004098;
			color:#fff;
			margin-right:20px;
		}
		
		#template p .highLight{
			font-size:16px;
			color:#004098;
			cursor: pointer;
			text-decoration: underline;
    		text-decoration-color: #004098;
		}
		
		#template p .highLight:hover{
			color:#0d54b5;
    		text-decoration-color: #0d54b5;
		}
		
		.ptop_10{
			text-align:center;
			margin-top:50px;
		}
		
		.ptop_10 input[type='button']{
			width:90px;
			height:30px;
			border-radius:2px;
			outline:none;
			border:1px solid #DDD;
			background-color:#fff;
			margin:0 10px;
			line-height:30px;
			cursor: pointer;
		}
	</style>
	</head>
<body>
	<div>
	<form id="add_form" name="addForm" action="${path}sys/UserAction_addUserS.ms" method="post" enctype="multipart/form-data">
		<div>
		<input type="hidden" id="iframeId" name="paraMap.iframeId"/>
		<div id="template">
			<div class="pic"></div>
			<p><span class="num">1</span><dict:lang value="使用导入功能时，员工信息需要与模板中的格式一致！" /><dict:lang value="若无模板，请" /><span class="highLight" onclick="down()">下载模板</span>!</p>
			<p><span class="num">2</span><dict:lang value="上传员工信息（只支持xls或xlsx文件）！" /><input type="file" id="upFile" name="upFile"/></p>	
			<div class="ptop_10 txac" >
				<input type="button" value="<dict:lang value="导 入" />" onclick="add();" class="botton_img_add" style="background-color:#aace36;color:#fff;border:none;">
				<input type="button" value="<dict:lang value="关 闭" />" onclick="closeWindow();" class="botton_img_search">
			</div>
		</div>
			
				 
	</div>
     </form>
     <form id="dowm_form" name="downForm" action="${path}sys/UserAction_downTemplate.ms" method="post">
       <input type="hidden" name="paraMap.fileName" value="员工导入模板.xls">
       
       <input type="hidden" name="paraMap.filePath" value="">
					
     </form>
     <form id="list_form" name="listForm" action="${path}sys/UserAction_listUser.ms" method="post"></form>
   </div>
<script type="text/javascript">
	$('.dialog .dialog-bd',parent.document).css('padding','0')
	function add(){
		
		var file = $("#upFile").val();
		if (file!=null && file!="") {
		document.forms.add_form.submit();
		thisObj.onclick = function(){utilsFp.confirmIcon(1,"","","","<dict:lang value="数据正在提交，请稍候..." />",0,"300","");}; 
		}else{
				utilsFp.confirmIcon(3,"","","", "<dict:lang value='请选择Excel文件,只支持xls或xlsx文件' />",0,"300","");
		}
	}

	function down(){
		document.forms.dowm_form.submit();
		thisObj.onclick = function(){utilsFp.confirmIcon(1,"","","","<dict:lang value="模板正在下载中..." />",0,"300","");};
	}
	function shut(){
		parent.closePopWin();
		window.parent.location.reload();
	}	    
	
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
<%@ include file="/plf/common/pub_end.jsp" %>