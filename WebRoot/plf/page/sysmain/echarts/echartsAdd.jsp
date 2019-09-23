<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
<title><dict:lang value="部门信息列表" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="chosen" value="1" />
	
</jsp:include>

<title></title>

<style>
		body{
	   	 	font-size:12px;
		}
		
		.head{
			background-color: #f6f5f7;
    		padding-top: 5px;
    		padding-bottom: 10px;
    		margin-bottom: 10px;
    		height:30px;
		}
		
		.all{
			margin-top:20px;
			padding:0 10px;
			box-sizing:border-box;
		}
		
		.dataSource{
    		overflow-y: auto;
		}
        .dataSource,.attribute{
            /* 左右两块宽度，中间间隔10px */
            width: calc((100% - 10px)/2);
            float: left;
        }
        .attribute{
            margin-left: 10px; 
        } 

        /* 图表属性滚动区域 */
        .attribute .contents{
            overflow: auto;
            height: 408px;
        }

        .dataSource table{
            border-collapse: collapse;
	    border: 1px solid #a8c7ce;		
            width: 100%;
        }
        .attribute table{
            width: 100%;
        }
			.attribute table td{
            border: 1px solid #a8c7ce;	
        }
        textarea{
            width: 100%;
            height: 80px;
            box-sizing: border-box;
        }
        
        td input[type='text']{
            width: 100%;
            height:100%;
            box-sizing: border-box;
        }
		
		input[type='radio']{
			vertical-align: middle;
		}
		
        /* 数据源第一列样式 */
        .dataSource table tr td:nth-of-type(1){
            width: 110px;
            background-color: #f5f7f9;
    	    text-align: right;  
        }


        /* 标题样式 */
        .main h3{
	    	margin:0;
	    	padding:0;
            font-size: 14px;
            font-weight: normal;
        }
        .javaClass,.jsonStr,.line,.lineJavaClass,.lineJsonStr{
        	display: none;
        }
        
        ._save{
        	    border: 1px solid #aace36;
			    border-radius: 2px;
			    background-color: #fff;
			    color: #666;
			    height: 28px;
			    line-height: 26px;
			    padding: 0 10px;
			    cursor: pointer;
			    float:right;
			    position: absolute;
    			right: 10px;
    			top: 5px;
        }
        
        ._save:hover{
        	background-color: #aace36;
    		color: #fff;
        }
        
        ._save .ico{
        	width: 15px;
    		height: 15px;
    		margin-right: 5px;
    		margin-bottom: 3px;
    		background: url(${path}plf/page/fp/img/ico-save.png?_mc_res_version=<%=PlfStaticRes.ICO_SAVE_PNG%>) no-repeat;
        }
        
        ._save:hover .ico{
    		background: url(${path}plf/page/fp/img/ico-save-h.png?_mc_res_version=<%=PlfStaticRes.ICO_SAVE_H_PNG%>) no-repeat;
        }
        
        ._get{
        	width:70px;
        	height:20px;
        	background-color:#6EABEE;
        	border:0;
        	outline:none;
        	color:#fff;
        	margin-left:5px;
        	margin-top:5px;
        	cursor: pointer;
        }
        
        ._get:focus{
        	background-color:#6EABEE;
        	border:0;
        	color:#fff;
        }
        
       
		.sp-replacer{
        	margin-top:0;
        }
        
        .table_list td input[type='text'] {
    		height:100%;
    		width:100%;
    		border:none;
    		box-sizing:border-box;
		}
        
        .attribute td input[type='text']{
            box-sizing: content-box;
            height:100%;
            width:calc(100% - 5px);	
            padding-left:5px;
        }
        
        .attribute td input[type='text']:focus{
        	border:1px solid #6Eabee;
        	width:calc(100% - 7px);	
        }
        
        .dataSource table tr,.dataSource table th{
        	height:30px;
        }
        
        .attribute table tr td:nth-of-type(1){
            width: 166px;  
            padding-right:5px;
        }
        
        .dataSource>table>tbody>tr>td:nth-of-type(1){
        	padding-right:5px;
        }
        
        .mCSB_outside + .mCS-minimal-dark.mCSB_scrollTools_vertical {
		    right: 2px;
		}
		table td{
			word-break:break-all;
		} 
		
		.all{
			overflow-y:auto;
		}
		
		.content{
		  height: 565px;
		  overflow-y:auto;
		}
		
		a{
		 color: blue;
		}
		
        
    </style>
    <jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript" src="${path}/plf/page/sysmain/echarts/js/chartsComm.js?_mc_res_version=<%=PlfStaticRes.CHARTSCOMM_JS %>"></script>
    <script type="text/javascript">
    
    $(function(){
    	$("#CHARTS_TYPE").change(function(){
    		var chartsType = $(this).val();
    		loadChartsPage(chartsType);
    	});
    	
    	function loadChartsPage(chartsType){
    		if(chartsType == "1"){
    			$("#chartsAttr").load("plf/page/sysmain/echarts/pie/add.jsp");
    			$("#isLineTr").hide();
    		}else if(chartsType == "2"){
    			$("#chartsAttr").load("plf/page/sysmain/echarts/line/add.jsp");
    			$("#isLineTr").hide();
    		}else if(chartsType == "3"){
    			$("#chartsAttr").load("plf/page/sysmain/echarts/bar/add.jsp");
    			$("#isLineTr").show();
    		}else if(chartsType == "4"){
    			$("#chartsAttr").load("plf/page/sysmain/echarts/gauge/add.jsp");
    			$("#isLineTr").hide();
    		}else if(chartsType == "5"){
    			$("#chartsAttr").load("plf/page/sysmain/echarts/cal/add.jsp");
    			$("#isLineTr").hide();
    		}
    		$("#CHARTS_DATA_SOURCES").val("1");	
    	}
    	
    	// 数据源切换
	    $("#CHARTS_DATA_SOURCES").change(function(){
	    	var chartsDataSources = $(this).val();
	    	var isLine = $("#isLine").val();
    		if(chartsDataSources=="1"){// sql查询
    			$(".sql").show();
    			$(".javaClass,.jsonStr").hide();
    		}else if(chartsDataSources=="2"){// java类
    			$(".javaClass").show();
    			$(".sql,.jsonStr").hide();
    		}else{//json串
    			$(".jsonStr").show();
    			$(".sql,.javaClass").hide();
    		}
    	});
    	
    	if("<c:out value='${paraMap.CHARTS_TYPE}'/>"){
    		var chartsType = "<c:out value='${paraMap.CHARTS_TYPE}'/>";
    		loadChartsPage(chartsType);
    	}else{
    		$("#chartsAttr").load("plf/page/sysmain/echarts/pie/add.jsp");
    	}
    });
    </script>
</head>
<body style="width:100%;min-width:1000px;background-color:#fff;">
    <div class="head">
    	<span style="display: inline-block;height: 20px;margin-top: 5px;margin-left: 5px;">
        <span>图表类型</span>
		<c:choose>
			<c:when test="${empty paraMap.CHARTS_TYPE}">
				<dict:selectDict dictCode="CHARTS_TYPE" dictValue="1"
					id="CHARTS_TYPE" name="paramList[%{#index.index}].CHARTS_TYPE" />
			</c:when>
			<c:otherwise>
			<c:set var="CHARTS_TYPE" value="${paraMap.CHARTS_TYPE}" />
				<dict:selectDict dictCode="CHARTS_TYPE"
					dictValue="${CHARTS_TYPE}" disabled="disabled"
					id="CHARTS_TYPE" name="paramList[%{#index.index}].CHARTS_TYPE" />
			</c:otherwise>
		</c:choose>
		<span>数据源</span>  
        <dict:selectDict dictCode="CHARTS_DATA_SOURCES" id="CHARTS_DATA_SOURCES" dictValue="%{CHARTS_DATA_SOURCES}" name="paramList[%{#index.index}].CHARTS_DATA_SOURCES"  />
        <input type="hidden" id="cacheId"  value="<c:out value='${paraMap.cacheId}'/>" >
        <input type="hidden" id="isCache"  value="<c:out value='${paraMap.isCache}'/>" >
        <input type="hidden" id="iframeId"  value="<c:out value='${paraMap.iframeId}'/>" >
        <input type="hidden" id="chartsCacheId"  value="<c:out value='${paraMap.chartsCacheId}'/>" >
        <input type="hidden" id="buttonId"  value="<c:out value='${paraMap.buttonId}'/>" >
        <input type="hidden" id="showTypeId"  value="<c:out value='${paraMap.showTypeId}'/>" >
        </span></div>
    <div id="chartsAttr"></div>
</body>
</html>
