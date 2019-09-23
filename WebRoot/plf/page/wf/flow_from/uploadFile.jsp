<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="流程表单" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		<jsp:param name="datePicker" value="1" />
		</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
     <link href="${path}plf/js/bootstrap-fileinput-master/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path}plf/js/bootstrap-fileinput-master/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="${path}plf/js/bootstrap-fileinput-master/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="${path}plf/js/bootstrap-fileinput-master/themes/explorer-fa/theme.css" media="all" rel="stylesheet" type="text/css"/>
   <!--  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>   -->
    <script src="${path}plf/js/jquery/jquery.min.js"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/plugins/sortable.js" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/fileinput.js" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/locales/fr.js" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/locales/es.js" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/themes/explorer-fa/theme.js" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/themes/fa/theme.js" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/popper.min.js" type="text/javascript"></script>
    <script src="${path}plf/js/bootstrap-fileinput-master/js/bootstrap.min.js" type="text/javascript"></script>
 
    
    
   



	</head>

<body style="overflow: hidden;">


<div class="container my-4" style="background: #fff;">
   <form enctype="multipart/form-data" style="background: #fff;">
        <div class="file-loading">
            <input id="kv-explorer" type="file" multiple>
        </div>
        <br>
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-outline-secondary">Reset</button>
    </form>
</div>
	
	              
<script>
   
   
   

    
    $(document).ready(function () {
  
        $("#kv-explorer").fileinput({
            'theme': 'explorer-fas',
            'uploadUrl': '#',
            overwriteInitial: false,
            initialPreviewAsData: true,
            initialPreview: [
            ],
            initialPreviewConfig: [
            ]
        });
       
    });
</script>	
	
	
	
	
	
  

   
   
  


<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>