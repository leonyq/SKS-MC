<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="服务支持" /></title>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="chosen" value="1" />
		</jsp:include>
		 <style>
        body{
            margin: 0;
            font-size: 14px;
            background-color: #fff;
        }

        p{
            margin: 0;
        }

        .bd{
            
            padding: 20px 12px;
            box-sizing: border-box;
           
        }
        
        .block .title{
            height: 30px;
            border-bottom: 1px solid #ededed;
        }

        h3{
            height: 30px;
            line-height: 30px;
            font-size: 14px;
            margin: 0;
            border-bottom: 1px solid #aace36;
            font-weight: normal;
            color: #aace36;
            float: left;
        }

        .block p{
            padding:0 25px 0 60px;
            height: 30px;
            line-height: 30px;
            margin-top: 15px;
            box-sizing: border-box;
        }

        .block p img{
            height: 30px;
            width: 30px;
            margin-right: 20px;
            vertical-align: middle;
        }

        .block p span{
            height: 100%;
            width: 100px;
            background-color: #fff;
            border:1px solid #dbdbdb; 
            display: block;
            text-align: center;
            color: #666;
            border-radius: 2px;
            float: right;
            cursor: pointer;
        }

        .block p span:hover{
            background-color: #aace36;
            border: 1px solid #aace36;
            color: #fff;
        }
    </style>
	</head>
<body>
 <div class="bd">
       <div class="block">
            <div class="title"><h3><dict:lang value="资料下载"/></h3></div>
            <p><img src="${path}/plf/page/mlabel/img/ico-instructions.png"><dict:lang value="产品说明书"/><span  onclick="downLoadDesigner('<dict:lang value="产品说明书"/>','plf/page/mlabel/page/download/MoreLabel-instructions.rar')"><dict:lang value="立即下载"/></span></p>
            <p><img src="${path}/plf/page/mlabel/img/ico-primer.png"><dict:lang value="入门手册"/><span  onclick="downLoadDesigner('<dict:lang value="入门手册"/>','plf/page/mlabel/page/download/MoreLabel-primer.rar')"><dict:lang value="立即下载"/></span></p>
            <p><img src="${path}/plf/page/mlabel/img/ico-manual.png"><dict:lang value="用户手册-企业"/><span  onclick="downLoadDesigner('<dict:lang value="用户手册-企业"/>','plf/page/mlabel/page/download/MoreLabel-manual.rar')"><dict:lang value="立即下载"/></span></p>
            <p><img src="${path}/plf/page/mlabel/img/ico-supplier.png"><dict:lang value="用户手册-供应商"/><span  onclick="downLoadDesigner('<dict:lang value="用户手册-供应商"/>','plf/page/mlabel/page/download/MoreLabel-supplier.rar')"><dict:lang value="立即下载"/></span></p>           
            <p><img src="${path}/plf/page/mlabel/img/ico-API.png"><dict:lang value="WebAPI说明书"/><span  onclick="downLoadDesigner('<dict:lang value="WebAPI说明书"/>','plf/page/mlabel/page/download/MoreLabel-WebAPI.rar')"><dict:lang value="立即下载"/></span></p>
        </div>
        <div class="block">
            <div class="title"><h3><dict:lang value="咨询服务"/></h3></div>
            <p><img src="${path}/plf/page/mlabel/img/ico-phone.png">400-887-4949</p>
            <p><img src="${path}/plf/page/mlabel/img/ico-mail.png">morelabel@morewis.com</p>
            <p><img src="${path}/plf/page/mlabel/img/ico-QQ.png">904205911</p>
            <p><img src="${path}/plf/page/mlabel/img/ico-WeChat.png"><dict:lang value="摩尔软件"/></p>
        </div>
        
    </div>
<form id="dowm_form" name="downForm" action="${path}buss/bussModel_exeFunc.ms?funcMId=640c49edce8d4cd8b51dda4b70ff6d3b" method="post">
       <input type="hidden" name="fileName" id="fileName" value="">
       <input type="hidden" name="filePath" id="filePath" value="">
     </form>

<script type="text/javascript">
   function downLoadDesigner(fileName,filePath){
        $("#fileName").val(fileName);
        $("#filePath").val(filePath);
		document.forms.dowm_form.submit();
		thisObj.onclick = function(){utilsFp.confirmIcon(1,"","","","<dict:lang value="正在下载中..." />",0,"300","");};
	}
	

</script>

</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>