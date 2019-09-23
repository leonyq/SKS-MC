<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="导出Excel文件" />   </title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="popDivWinFp" value="1" />
	</jsp:include>
		<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
  <script type = "text/javascript" 
	src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  

	
	<script type="text/javascript" src="${path}plf/page/js_files/excel/export_page.js?_mc_res_version=<%=PlfStaticRes.EXPORT_PAGE_JS %>"></script>
	<style type="text/css">
		body{
			background-color:#fff;
		}
		
		#divExcelExport .pic{
			width:220px;
			height:100px;
			background-image:url(${path}plf/page/fp/img/leading-in.png);
			margin-left:240px;
			margin-top:30px;
			margin-bottom:5px;
		}
		
		#divExcelExport p{
			height:25px;
			line-height:25px;
			margin-top:25px;
			margin-left:130px;
		}
		
		#divExcelExport p .num{
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
		
		.buttons{
			text-align:center;
			margin-top:50px;
		}
		
		.buttons input[type='button']{
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

<body >

<form id="submitForm" name="submitForm" target="ifrExcel">

<div id="divExcelExport"> 
    <input type="hidden" id="info60000" 
   value='<%=com.more.fw.core.common.method.CommMethodMc
   .getText("电子文档每一个sheet总记录不能超过%s条记录",
   com.more.fw.core.common.method.ReadProperties.getPorpertie("system.properties","CurrentPageMaxNum")) %>'/>
   
    <input type="hidden" id="info1000"   
      value='<%=com.more.fw.core.common.method.CommMethodMc
   .getText("电子文档每一个sheet总记录不能小于%s条记录",
   com.more.fw.core.common.method.ReadProperties.getPorpertie("system.properties","CurrentPageMinNum")) %>'  />
     
    <input type="hidden" id="infoExportMaxNum" value=' <dict:lang value="导出不能大于" />'/>
     
    <input type="hidden" id="controlExportMaxNum"
 value='<%=com.more.fw.core.common.method.ReadProperties.getPorpertie("system.properties","ExportMaxNum") %>'/>

    <input type="hidden" value="<%=CommMethodMc.escapeJs(request.getParameter("iframeId") )%>"
     id="iframeId" name="iframeId" />
    
    <input type="hidden" value="<%=CommMethodMc.escapeJs(request.getParameter("exeid")) %>"
     id="exeid" name="exeid" />
     
    <div class="pic"></div>	
    
    <!--  
    <p><span class="num">1</span>
    	<label><input type="radio" name="radioExcelExportMark" value="10" checked/><dict:lang value="当前数据" /></label>	
    	<label><input type="radio" name="radioExcelExportMark" value="20"  style="margin-left:30px;"/><dict:lang value="全部数据" /></label>		
    </p>	
    -->
    <p><span class="num">1</span>
    	<dict:lang value="请选择文件格式" />
    	<select name="ExcelExportFileExt" id="ExcelExportFileExt">
		    <option value=".xlsx">.xlsx </option>
		    <option value=".xls">.xls </option>
		</select>
    </p>
    
    <p><span class="num">2</span>
    	<!--
    	<dict:lang value="请选择文件格式" />
    	<select name="ExcelExportFileExt" id="ExcelExportFileExt">
		    <option value=".xlsx">.xlsx </option>
		    <option value=".xls">.xls </option>
		</select>，
		-->
		
		<select name="ExportMark" id="ExportMark"  style="display: none;">
		    <option value="20"><dict:lang value="数据分析" /></option>
		    <option value="10"><dict:lang value="数据视图" /></option>
		</select>
				
		<dict:lang value="生成一个sheet" /> 
		<input type="text" size="5" id="excelExportNum"
  		name="excelExportNum" value="5000"  maxlength="5" > <dict:lang value="条记录" />
    </p>
    	
    <div class="buttons" id="export_but_div">
    	<input type="button" value="<dict:lang value="导 出" />" id="btnExeclExport" style="background-color:#aace36;color:#fff;border:none;">
		<input type="button" value="<dict:lang value="关 闭" />" onclick="closeWindow();" >
    </div>

  
 <div id="divShowSQL" style="display: none;">
    <br/>
	 sql语句
	<textarea  id="textareaShowSQL" name="textareaShowSQL" style="height:90px;width90px;resize:none">
	
	
	</textarea>
</div>


<iframe id="ifrExcel" name="ifrExcel"  style="display: none;"></iframe>

</div>

<div style="display: none;overflow: auto;word-break: break-all;padding: 10px 20px;box-sizing: border-box;" id="errinfo_div">
		
</div>

<script type="text/javascript" 
src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>

</form>
	<script type="text/javascript">
		$('.dialog .dialog-bd',parent.document).css('padding','0')
	</script>

</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>




