
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<script type="text/javascript">
<!--
	var _currentAuth = "<%=request.getSession().getAttribute("mcDataAuth")%>"; //当前组织机构
//-->
</script>
<%
	String pathTmp = request.getContextPath() + "/";
	//String basePathTmp = new StringBuffer().append(request.getScheme()).append("://").append(request.getServerName())
	//		.append(":").append(request.getServerPort()).append(request.getContextPath()).append("/").toString();
%>
<%!String formatNullStr(String str, String defaultStr) {
		if (null == str || str.trim().length() == 0)
			return defaultStr;
		return str.trim();
	}%>
<%
	//定义常量
	final String JS_PATH = pathTmp + "plf/js";
	final String JS_COMMON_PATH = pathTmp + "plf/js/common";
	final String CSS_PATH = pathTmp + "plf/style";
	final String LOAD = "1";//表示引入
	final String UNLOAD = "0";//0表示不引入
	final String JS_PATH_FP = pathTmp + "plf/page/fp/js";
	//获取参数(0：不引入，1：引入)
	String jquery = formatNullStr(request.getParameter("jquery"), LOAD);//jqyery不填时为默认引入
	String datePicker = formatNullStr(request.getParameter("datePicker"), UNLOAD);//日期控件
	String fusionchar = formatNullStr(request.getParameter("fusionchar"), UNLOAD);//fusionchar图表控件
	String easyui = formatNullStr(request.getParameter("easyui"), UNLOAD);//easyui控件
	String dhtmlxtree = formatNullStr(request.getParameter("dhtmlxtree"), UNLOAD);//dhtmlxtree树菜单控件
	String wbox = formatNullStr(request.getParameter("wbox"), UNLOAD);//wbox控件
	//....可自行扩展
	String popDivWin = formatNullStr(request.getParameter("popDivWin"), UNLOAD);//弹出窗口控件
	String highcharts = formatNullStr(request.getParameter("highcharts"), UNLOAD);//highcharts控件
	String jqueryBlockUI = formatNullStr(request.getParameter("jqueryBlockUI"), UNLOAD);//jquery.blockUI控件
	String tab = formatNullStr(request.getParameter("tab"), UNLOAD);//引选项卡
	String ckeditor = formatNullStr(request.getParameter("ckeditor"), UNLOAD);//引用编辑器
	String tabIndent = formatNullStr(request.getParameter("tabIndent"), UNLOAD);//引用textarea使用tab按键功能
	String HotKey = formatNullStr(request.getParameter("HotKey"), UNLOAD);//使用热键
	String chosen = formatNullStr(request.getParameter("chosen"), UNLOAD);//可输入下拉框
	String popMsgWin = formatNullStr(request.getParameter("popMsgWin"), UNLOAD);//弹出消息提示窗口
	String html5 = formatNullStr(request.getParameter("html5"), UNLOAD);//html5支持
	String workFlow = formatNullStr(request.getParameter("workFlow"), UNLOAD);//工作流包
	String spectrum = formatNullStr(request.getParameter("spectrum"), UNLOAD);//颜色选择器	
	String multiselect = formatNullStr(request.getParameter("multiselect"), LOAD);//滚动条
	String json2 = formatNullStr(request.getParameter("json2"), UNLOAD);//json工具类
	String newTabCss = formatNullStr(request.getParameter("newTabCss"), UNLOAD);//新tab样式
	String ace = formatNullStr(request.getParameter("ace"), UNLOAD);//弹出消息提示窗口
    String faviconType = formatNullStr(request.getParameter("faviconType"), LOAD);// favicon不填时为默认引入
	String zTree = formatNullStr(request.getParameter("zTree"), UNLOAD);
	String serializeForm = formatNullStr(request.getParameter("serializeForm"), UNLOAD);// 
    
	String layui = formatNullStr(request.getParameter("layui"), UNLOAD);
	String pageWidth = formatNullStr(request.getParameter("pageWidth"), UNLOAD);
    
	String smartMenu = formatNullStr(request.getParameter("smartMenu"), UNLOAD);
	request.setAttribute("JS_PATH", JS_PATH);

	StringBuilder outSb = new StringBuilder();
	if (!UNLOAD.equals(jquery)) { 
		    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jquery/jquery.min.js?_mc_res_version=").append(PlfStaticRes.JQUERY_172_JS).append("\"></script>").append("\n");
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH).append(
      "/jquery-fix-clone.js?_mc_res_version=").append(PlfStaticRes.JQUERY_FIX_CLONE).append("\"></script>").append("\n");
 		   
				
	}
	if (LOAD.equals(datePicker)) {
		  outSb.append("		<script type=\"text/javascript\" defer=\"defer\" src=\"").append(JS_PATH).append(
      "/My97DatePicker/WdatePicker.js?_mc_res_version=").append(PlfStaticRes.WDATEPICKER).append("\"></script>").append("\n");
  }
	 
  if (LOAD.equals(fusionchar))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/fusioncharts/FusionCharts.js?_mc_res_version=").append(PlfStaticRes.FUSIONCHARTS).append("\"></script>").append("\n");
  }
	if (LOAD.equals(easyui)) {
	/*
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
				.append("/easyui/jquery.easyui.min.js\"></script>").append("\n");
		outSb.append("		<link href=\"").append(JS_PATH)
				.append("/easyui/themes/default/easyui.css\" rel=\"stylesheet\" type=\"text/css\">").append("\n");
		outSb.append("		<link href=\"").append(JS_PATH)
				.append("/easyui/themes/icon.css\" rel=\"stylesheet\" type=\"text/css\">").append("\n");
	*/			
	    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/easyui/jquery.easyui.min.js?_mc_res_version=").append(PlfStaticRes.JQUERY_EASY_UI_MIN).append("\"></script>").append("\n");
    outSb.append("		<link href=\"").append(JS_PATH).append(
      "/easyui/themes/default/easyui.css?_mc_res_version=").append(PlfStaticRes.EASYUI_CSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
    outSb.append("		<link href=\"").append(JS_PATH).append(
      "/easyui/themes/icon.css?_mc_res_version=").append(PlfStaticRes.ICON_CSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");  
				
	}
	
	
	if (LOAD.equals(zTree)) {
	  outSb.append("		<link href=\"").append(JS_PATH).append(
      "/zTree/css/demo.css?_mc_res_version=").append(PlfStaticRes.ZTREE)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n"); 
	  outSb.append("		<link href=\"").append(JS_PATH).append(
      "/zTree/css/zTreeStyle/zTreeStyle.css?_mc_res_version=").append(PlfStaticRes.ZTREE)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n"); 
		  outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
	      "/zTree/js/jquery.ztree.core.js?_mc_res_version=").append(PlfStaticRes.ZTREE).append("\"></script>").append("\n");
		 
		  outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
	      "/zTree/js/jquery.ztree.excheck.js?_mc_res_version=").append(PlfStaticRes.ZTREE).append("\"></script>").append("\n");
		
		  outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
	      "/zTree/js/jquery.ztree.exedit.js?_mc_res_version=").append(PlfStaticRes.ZTREE).append("\"></script>").append("\n");
		}
	
	//if (LOAD.equals(layui)) {
	  outSb.append("		<link href=\"").append(CSS_PATH).append(
      "/layui/layuiadmin/layui/css/layui.css?_mc_res_version=").append(PlfStaticRes.LAYUI_LAYER_CSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n"); 
	
		  outSb.append("		<script type=\"text/javascript\" src=\"").append(CSS_PATH).append(
	      "/layui/layuiadmin/layui/layui.js?_mc_res_version=").append(PlfStaticRes.LAYUI_LAYER_JS).append("\"></script>").append("\n");
		  
		  outSb.append("		<link href=\"").append(CSS_PATH).append(
			      "/layui/layuiadmin/style/admin.css?_mc_res_version=").append(PlfStaticRes.LAYUI_ADMIN_CSS)
			      .append("\" rel=\"stylesheet\" type=\"text/css\">\n"); 
	//}
	outSb.append("<script src=\"").append(JS_PATH).append("/popmenu.js?_mc_res_version=").append(PlfStaticRes.POPMEN_JS).append("\"></script>");
	
	
	if (LOAD.equals(smartMenu)) {
	  outSb.append("		<link href=\"").append(JS_PATH).append(
      "/RightMenu/smartMenu.css?_mc_res_version=").append(PlfStaticRes.ZTREE)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n"); 
		  outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
	      "/RightMenu/jquery-smartMenu.js?_mc_res_version=").append(PlfStaticRes.ZTREE).append("\"></script>").append("\n");
		 
		}
	if (LOAD.equals(dhtmlxtree)) {
	/*
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
				.append("/dhtmlxtree/dhtmlxcommon.js\"></script>").append("\n");
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
				.append("/dhtmlxtree/dhtmlxtree.js\"></script>").append("\n");
		outSb.append("		<link href=\"").append(JS_PATH)
				.append("/dhtmlxtree/dhtmlxtree.css\" rel=\"stylesheet\" type=\"text/css\" />").append("\n");
	*/
	  outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/dhtmlxtree/dhtmlxcommon.js?_mc_res_version=").append(PlfStaticRes.DHTML_XCOMMON).append("\"></script>").append("\n");
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/dhtmlxtree/dhtmlxtree.js?_mc_res_version=").append(PlfStaticRes.DHTMLXTREEJS).append("\"></script>").append("\n");
    outSb.append("		<link href=\"").append(JS_PATH).append(
      "/dhtmlxtree/dhtmlxtree.css?_mc_res_version=").append(PlfStaticRes.DHTML_XTREECSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n"); 
	
	}
	if (LOAD.equals(wbox)) {
	/*
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append("/wbox/wbox.js\"></script>")
				.append("\n");
		outSb.append("		<link href=\"").append(JS_PATH)
				.append("/wbox/wbox/wbox.css\" rel=\"stylesheet\" type=\"text/css\">").append("\n");
	*/
	 outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/wbox/wbox.js?_mc_res_version=").append(PlfStaticRes.WBOXJS).append("\"></script>").append("\n");
    outSb.append("		<link href=\"").append(JS_PATH).append(
      "/wbox/wbox/wbox.css?_mc_res_version=").append(PlfStaticRes.WBOXCSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
	
	
	}
	if (!UNLOAD.equals(popDivWin)) {
	/*
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
				.append("/subModal/submodalsource.js\"></script>").append("\n");
		outSb.append("		<link rel=\"stylesheet\" type=\"text/css\" href=\"").append(JS_PATH)
				.append("/subModal/submodal.css\" />").append("\n");
		outSb.append("		<link rel=\"stylesheet\" type=\"text/css\" href=\"").append(JS_PATH)
				.append("/subModal/style.css\" />").append("\n");
				
			*/
			    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/subModal/submodalsource.js?_mc_res_version=").append(PlfStaticRes.SUBMODALSOURCE).append("\"></script>").append("\n");
    outSb.append("		<link rel=\"stylesheet\" type=\"text/css\" href=\"").append(JS_PATH).append(
      "/subModal/submodal.css?_mc_res_version=").append(PlfStaticRes.SUBMODALCSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
    outSb.append("		<link  href=\"").append(JS_PATH).append(
      "/subModal/style.css?_mc_res_version=").append(PlfStaticRes.STYLECSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");	
				
	}
	if (LOAD.equals(highcharts)) {
	/*
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
				.append("/highcharts/highcharts.js\"></script>").append("\n");
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
				.append("/highcharts/highcharts-more.js\"></script>").append("\n");
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
				.append("/highcharts/modules/exporting.js\"></script>").append("\n");
				
				*/
				 outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/highcharts/highcharts.js?_mc_res_version=").append(PlfStaticRes.HIGHCHARTS).append("\"></script>").append("\n");
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/highcharts/highcharts-more.js?_mc_res_version=").append(PlfStaticRes.HIGHCHARTSMORE).append("\"></script>").append("\n");
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/highcharts/modules/exporting.js?_mc_res_version=").append(PlfStaticRes.EXPORTING).append("\"></script>").append("\n");
				
	}
	if (LOAD.equals(jqueryBlockUI)) {/*
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
				.append("/jqueryblockui/jquery.blockUI.js\"></script>").append("\n");
				*/
	 outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jqueryblockui/jquery.blockUI.js?_mc_res_version=").append(PlfStaticRes.JQUERYBLOCKUI).append("\"></script>").append("\n");

				
	}
	if (LOAD.equals(tab)) {
	/*
	  //选项卡页面样式
		outSb.append("		<link href=\"").append(CSS_PATH)
				.append("/css2/css/css_tab.css\" rel=\"stylesheet\" type=\"text/css\" />").append("\n");
	
	***/
	//选项卡页面样式
    outSb.append("		<link href=\"").append(CSS_PATH).append(
      "/css2/css/css_tab.css?_mc_res_version=").append(PlfStaticRes.CSSTAB)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
	
	}
	if (LOAD.equals(ckeditor)) {
	/*
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
				.append("/ckeditor/ckeditor.js\" defer=\"defer\" ></script>").append("\n");
			***/	
	 outSb.append("		<script defer=\"defer\" type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/ckeditor/ckeditor.js?_mc_res_version=").append(PlfStaticRes.CKEDITOR).append("\"></script>").append("\n");
 
				
				
	}
	if (LOAD.equals(tabIndent)) {/*
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
				.append("/ext/tabIndent.js\" defer=\"defer\" ></script>").append("\n");
				****/
	  outSb.append("		<script type=\"text/javascript\" defer=\"defer\" src=\"").append(JS_PATH).append(
      "/ext/tabIndent.js?_mc_res_version=").append(PlfStaticRes.TABINDENT).append("\"></script>").append("\n");
 			
				
				
	}
	if (LOAD.equals(HotKey)) {
	/***
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).
		append("/ms/HotKey.js\"></script>")
				.append("\n");// 表格相关js
				*****/
		 outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/ms/HotKey.js?_mc_res_version=").append(PlfStaticRes.HOTKEY).append("\"></script>").append("\n");// 表格相关js
 		
				
				
	}

	if (LOAD.equals(chosen)) {
	
 
		outSb.append("		<script src=\"").append(JS_PATH).
		append("/jchose/chosen.jquery.min.js?_mc_res_version=").append(PlfStaticRes.ChosenJqueryMin_JS).append("\"></script>").append("\n"); //可输入下拉框
		outSb.append("		<link rel=\"stylesheet\" href=\"").append(JS_PATH).
		append("/jchose/chosen.css?_mc_res_version=").append(PlfStaticRes.Chosen_CSS).append("\"/>	").append("\n");
 
	 
	
	}

	if (LOAD.equals(popMsgWin)) {
	//	outSb.append("		<script src=\"").append(JS_PATH).append("/common/msg/jquery.messager.js\"></script>").append("\n");
	
	    outSb.append("		<script src=\"").append(JS_PATH).append(
      "/common/msg/jquery.messager.js?_mc_res_version=").append(PlfStaticRes.JQUERY_MESSAGER).append("\"></script>").append("\n");
  
	
	}
	
	if (LOAD.equals(html5)) {
	/**************
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH)
		.append("/html5.js\"></script>").append("\n");
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH)
		.append("/excanvas.js\"></script>").append("\n");	
		***********/
	    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH).append(
      "/html5.js?_mc_res_version=").append(PlfStaticRes.HTML5).append("\"></script>").append("\n");
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH).append(
      "/excanvas.js?_mc_res_version=").append(PlfStaticRes.EXCANVAS).append("\"></script>").append("\n");
  	
		
	}
	
	if (LOAD.equals(workFlow)) {
	/****
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/external/jquery-ui-1.9.2.min.js\"></script>").append("\n");
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/external/jquery.ui.touch-punch-0.2.2.min.js\"></script>").append("\n");
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/external/querySelector.polyfill.js\"></script>").append("\n");
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/lib/jsBezier-0.6.js\"></script>").append("\n");
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/lib/biltong-0.2.js\"></script>").append("\n");
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/util.js\"></script>").append("\n");		
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/browser-util.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/dom-adapter.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/jsPlumb.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/endpoint.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/connection.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/anchors.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/defaults.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/connectors-bezier.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/connectors-statemachine.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/connectors-flowchart.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/connector-editors.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/renderers-svg.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/renderers-vml.js\"></script>").append("\n");	
		
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/jsPlumb/src/jquery.jsPlumb.js\"></script>").append("\n");	
		
		outSb.append("		<link href=\"").append(JS_PATH)
		.append("/jsPlumb/workflowchart.css\" rel=\"stylesheet\" type=\"text/css\" />").append("\n");//页面样式		
	
	******************/
	 outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/external/jquery-ui-1.9.2.min.js?_mc_res_version=").append(PlfStaticRes.JQUERY_UI_192_MIN).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/external/jquery.ui.touch-punch-0.2.2.min.js?_mc_res_version=").append(PlfStaticRes.JQUERY_UI_TOUCHPUNCH_022_MIN).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/external/querySelector.polyfill.js?_mc_res_version=").append(PlfStaticRes.QUERY_SELECT_ORPOLY_FILL).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/lib/jsBezier-0.6.js?_mc_res_version=").append(PlfStaticRes.JSBEZIER_06).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/lib/biltong-0.2.js?_mc_res_version=").append(PlfStaticRes.BILTONG_02).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/util.js?_mc_res_version=").append(PlfStaticRes.UTIL_JS).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/browser-util.js?_mc_res_version=").append(PlfStaticRes.BROWSERUTIL).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/dom-adapter.js?_mc_res_version=").append(PlfStaticRes.DOMADAPTER).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/jsPlumb.js?_mc_res_version=").append(PlfStaticRes.JSPLUMB).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/endpoint.js?_mc_res_version=").append(PlfStaticRes.ENDPOINT).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/connection.js?_mc_res_version=").append(PlfStaticRes.CONNECTION).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/anchors.js?_mc_res_version=").append(PlfStaticRes.ANCHORS).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/defaults.js?_mc_res_version=").append(PlfStaticRes.DEFAULTS).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/connectors-bezier.js?_mc_res_version=").append(PlfStaticRes.CONNECTORSBEZIER).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/connectors-statemachine.js?_mc_res_version=").append(PlfStaticRes.CONNECTORSSTATEMACHINE).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/connectors-flowchart.js?_mc_res_version=").append(PlfStaticRes.CONNECTORSFLOWCHART).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/connector-editors.js?_mc_res_version=").append(PlfStaticRes.CONNECTOREDITORS).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/renderers-svg.js?_mc_res_version=").append(PlfStaticRes.RENDERERSSVG).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/renderers-vml.js?_mc_res_version=").append(PlfStaticRes.RENDERERSVML).append("\"></script>").append("\n");

    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jsPlumb/src/jquery.jsPlumb.js?_mc_res_version=").append(PlfStaticRes.JQUERYJSPLUMB).append("\"></script>").append("\n");

    /*     outSb.append("		<link href=\"").append(JS_PATH).append(
     "/jsPlumb/workflowchart.css\" rel=\"stylesheet\" type=\"text/css\" />").append("\n");//页面样式 */
    outSb.append("		<link href=\"").append(JS_PATH).append(
      "/jsPlumb/newWorkflowchart.css?_mc_res_version=").append(PlfStaticRes.NEWWORKFLOWCHART)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");//页面样式		
 
	
	
	
	}
	
	if (LOAD.equals(spectrum)) {
	/***
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
		.append("/spectrum/spectrum.js\"></script>").append("\n");
		outSb.append("		<link href=\"").append(JS_PATH)
		.append("/spectrum/spectrum.css\" rel=\"stylesheet\" type=\"text/css\" />").append("\n");//页面样式
	***********/
	    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/spectrum/spectrum.js?_mc_res_version=").append(PlfStaticRes.SPECTRUMJS).append("\"></script>").append("\n");
    outSb.append("		<link href=\"").append(JS_PATH).append(
      "/spectrum/spectrum.css?_mc_res_version=").append(PlfStaticRes.SPECTRUMCSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");//页面样式
	
	}	

	if (LOAD.equals(json2)) {
		outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH)
		.append("/json2.js?_mc_res_version=").append(PlfStaticRes.Json2_JS).append("\"></script>").append("\n");	
	}

	if (LOAD.equals(pageWidth)){
		outSb.append("<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH)
		.append("/pageWidthConfig.js?_mc_res_version=").append(PlfStaticRes.PAGEWIDTHCONFIG_JS).append("\"></script>").append("\n");	
	}
	
	if (LOAD.equals(newTabCss)) {
	outSb.append("		<link href=\"").append(CSS_PATH)
			.append("/css2/css/new_tab.css?_mc_res_version=").append(PlfStaticRes.New_Tab_CSS).append("\" rel=\"stylesheet\" type=\"text/css\" />").append("\n");//页面样式	
	}	

	if (LOAD.equals(ace)) {
		outSb.append("<script src=\""+JS_PATH+"/ace/ace.js?_mc_res_version=")
		.append(PlfStaticRes.ACE_JS)
		.append("\" type=\"text/javascript\" charset=\"utf-8\"></script>");
		outSb.append("<script src=\""+JS_PATH+"/ace/ext-language_tools.js?_mc_res_version=")
		.append(PlfStaticRes.Ext_Language_Tools_JS).append("\" type=\"text/javascript\" charset=\"utf-8\"></script>");
	}
	
	
	//默认引入
	outSb.append("		<link href=\"").append(CSS_PATH)
			.append("/css2/css/pub.css?_mc_res_version=").append(PlfStaticRes.Pub_CSS).append("\" rel=\"stylesheet\" type=\"text/css\" />").append("\n");//页面样式
	
	/****
	outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH)
	.append("/util.js\"></script>")
			.append("\n");//公用js方法
	outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH)
			.append("/validate.js\"></script>").append("\n");//公用js验证	 
	outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH)
	.append("/ms/msTable.js?_mc_res_version=").append(PlfStaticRes.ChosenJqueryMin_JS).append("\"></script>")
			.append("\n");// 表格相关js
	//outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH).append("/grayscale.js\"></script>").append("\n");// 全网灰色页面
	outSb.append("<script type=\"text/javascript\" src=\"").append(JS_PATH)
	.append("/ui/textform/js/jquery.validate.js?_mc_res_version=").append(PlfStaticRes.ChosenJqueryMin_JS).append("\"></script>\n");
	outSb.append("<link rel =\"shortcut icon\" href=\"").append(pathTmp).append(
    "favicon.ico\" type=\"image/x-icon\" />\n");//增加浏览器访问显示小图标

*************/
 // 框架默认引入
  outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH).append(
    "/util.js?_mc_res_version=").append(PlfStaticRes.UTIL_JS).append("\"></script>").append("\n");//公用js方法
  outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH).append(
    "/validate.js?_mc_res_version=").append(PlfStaticRes.VALIDATE).append("\"></script>").append("\n");//公用js验证	 
  outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
    "/ms/msTable.js?_mc_res_version=").append(PlfStaticRes.MSTABLE).append("\"></script>").append("\n");// 表格相关js
  //outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH).append("/grayscale.js\"></script>").append("\n");// 全网灰色页面
  outSb.append("<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
    "/ui/textform/js/jquery.validate.js?_mc_res_version=").append(PlfStaticRes.JQUERY_VALIDATE).append("\"></script>").append("\n");
       
    outSb.append("<link rel =\"shortcut icon\" type=\"image/x-icon\" href=\"")
    .append(pathTmp).append("favicon.ico?_mc_res_version=").append(PlfStaticRes.FAVICON).append("\">").append("\n");//增加浏览器访问显示小图标
 
    if (!UNLOAD.equals(serializeForm))
	  {
	   outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
	      "/serializeForm.js?_mc_res_version=").append(PlfStaticRes.SERIALIZE_FORM).append("\"></script>").append("\n");
	  }
	  
	  //dmp
	  String dmp = formatNullStr(request.getParameter("dmp"), UNLOAD);
	   if (LOAD.equals(dmp)) {
	      outSb.append("		<link href=\"").append(pathTmp).append(
      "/plf/page/bussmodel/dmp/css/dmp.css?_mc_res_version=").append(PlfStaticRes.JQUERY_DMP)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");  
      
      outSb.append("		<link href=\"").append(pathTmp).append(
      "/plf/page/bussmodel/dmp/css/DMPmain.css?_mc_res_version=").append(PlfStaticRes.JQUERY_DMPMAIN)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");  
	      
	      
	   }
    
	out.println(outSb.toString());
%>



<script type="text/javascript">

$(function(){
  //cjd 2018-01-29 11:51 begin 
  try{   
  $(document).click( function(){
      if (window.top.monitor !=undefined) 
        if (window.top.monitor.sysmain !=undefined){ 
             window.top.monitor.sysmain.main.page.clickInitStartDate(); 
          }  
   
   });		
  } catch(e){  }
 //cjd 2018-01-29 11:53 end  
  
  var mcIframeName = "<c:out value='${ mcIframeName}'/>";
  var curIframeName;
  
  try{
	  curIframeName = window.frameElement.name;  //获取当前窗口的名字
  }
  catch(err){
	  
  }
  if(mcIframeName || curIframeName){
  	 var forms =  $("body").find("form");
  	 if(forms){
  		forms.each(function(){
  	  		 var _this = $(this);
  	  		 _this.append("<input type='hidden' name='mcIframeName' id='mcIframeName' value='"+mcIframeName+"'/>");
  	  		 if(curIframeName){
  	  			_this.append("<input type='hidden' name='curIframeName' id='curIframeName' value='"+curIframeName+"'/>");
  	  		 }
  	  	 });
  	 }
  }
});		

</script>