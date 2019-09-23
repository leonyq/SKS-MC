<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<script type="text/javascript">
<!--
	var _currentAuth = "<%=request.getSession().getAttribute("mcDataAuth")%>"; //当前组织机构
//-->
</script>
<%
	String pathTmp = request.getContextPath() + "/";
	String pic_title = StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("pic_title"));
	//String basePathTmp = new StringBuffer().append(request.getScheme()).append("://").append(
    //request.getServerName()).append(":").append(request.getServerPort()).append(
    //request.getContextPath()).append("/").toString();
%>
<%!String formatNullStr(String str, String defaultStr)
  {
    if (null == str || str.trim().length() == 0) return defaultStr;
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
  final String CSS_PATH_FP = pathTmp + "plf/page/fp/css";
  final String IMG_PATH_FP = pathTmp + "plf/page/fp/img";

  StringBuilder outSbFp = new StringBuilder();

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
  String popDivWinFp = formatNullStr(request.getParameter("popDivWinFp"), UNLOAD);//前台弹出窗口控件
  String placeholder = formatNullStr(request.getParameter("placeholder"), UNLOAD);//前台弹出窗口控件
  String subStyle = formatNullStr(request.getParameter("subStyle"), LOAD);//subStyle不填时为默认引入
  String style = formatNullStr(request.getParameter("style"), LOAD);//style不填时为默认引入
  String scroll = formatNullStr(request.getParameter("scroll"), UNLOAD);//滚动条

  String jqueryMsg = formatNullStr(request.getParameter("jqueryMsg"), LOAD);//jqueryMsg不填时为默认引入
  String msData = formatNullStr(request.getParameter("msData"), UNLOAD);// 
  String serializeForm = formatNullStr(request.getParameter("serializeForm"), UNLOAD);// 
  String pieChartsFp = formatNullStr(request.getParameter("pieChartsFp"), UNLOAD);//颜色选择器	
  String uEditor = formatNullStr(request.getParameter("uEditor"), UNLOAD);//颜色选择器
  String faviconType = formatNullStr(request.getParameter("faviconType"), LOAD);// favicon不填时为默认引入
  
  String jqueryprint = formatNullStr(request.getParameter("jqueryprint"), UNLOAD);//打印插件
  String iconfont = formatNullStr(request.getParameter("iconfont"), LOAD);//字体图标
  
  String zTree = formatNullStr(request.getParameter("zTree"), UNLOAD);
	String smartMenu = formatNullStr(request.getParameter("smartMenu"), UNLOAD);
  request.setAttribute("JS_PATH", JS_PATH);
  StringBuilder outSb = new StringBuilder();
  outSb.append("		<script type = \"text/javascript\" src = \"").append(JS_PATH).append(
    "/ui/include.js?_mc_res_version=").append(PlfStaticRes.IN_CLUDE).append("\"></script>").append("\n");
  outSb.append("		<link href=\"").append(JS_PATH)
  .append("/ui/searchtext/css/searchText.css?_mc_res_version=").append(PlfStaticRes.SEARCH_TEXT_CSS)
  .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
  
  outSb.append("		<script type = \"text/javascript\" src = \"").append(JS_PATH).append(
    "/ui/searchtext/js/searchText.js?_mc_res_version=").append(PlfStaticRes.SEARCH_TEXT_JS).append("\"></script>").append("\n");
  if (!UNLOAD.equals(jquery))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jquery/jquery-1.7.2.js\"></script>").append("\n");
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH).append(
      "/jquery-fix-clone.js?_mc_res_version=").append(PlfStaticRes.JQUERY_FIX_CLONE).append("\"></script>").append("\n");
  }
  if (LOAD.equals(datePicker))
  {
    outSb.append("		<script type=\"text/javascript\" defer=\"defer\" src=\"").append(JS_PATH).append(
      "/My97DatePicker/WdatePicker.js?_mc_res_version=").append(PlfStaticRes.WDATEPICKER).append("\"></script>").append("\n");
  }
  if (LOAD.equals(smartMenu)) {
	  outSb.append("		<link href=\"").append(JS_PATH).append(
      "/RightMenu/smartMenu.css?_mc_res_version=").append(PlfStaticRes.ZTREE)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n"); 
		  outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
	      "/RightMenu/jquery-smartMenu.js?_mc_res_version=").append(PlfStaticRes.ZTREE).append("\"></script>").append("\n");
		 
		}
//?_mc_res_version=").append(PlfStaticRes.getWdatepicker()).append("\"></script>").append("\n");
  if (LOAD.equals(fusionchar))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/fusioncharts/FusionCharts.js?_mc_res_version=").append(PlfStaticRes.FUSIONCHARTS).append("\"></script>").append("\n");
  }
  if (LOAD.equals(easyui))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/easyui/jquery.easyui.min.js?_mc_res_version=").append(PlfStaticRes.JQUERY_EASY_UI_MIN).append("\"></script>").append("\n");
    outSb.append("		<link href=\"").append(JS_PATH).append(
      "/easyui/themes/default/easyui.css?_mc_res_version=").append(PlfStaticRes.EASYUI_CSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
    outSb.append("		<link href=\"").append(JS_PATH).append(
      "/easyui/themes/icon.css?_mc_res_version=").append(PlfStaticRes.ICON_CSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
  }
  if (LOAD.equals(dhtmlxtree))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/dhtmlxtree/dhtmlxcommon.js?_mc_res_version=").append(PlfStaticRes.DHTML_XCOMMON).append("\"></script>").append("\n");
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/dhtmlxtree/dhtmlxtree.js?_mc_res_version=").append(PlfStaticRes.DHTMLXTREEJS).append("\"></script>").append("\n");
    outSb.append("		<link href=\"").append(JS_PATH).append(
      "/dhtmlxtree/dhtmlxtree.css?_mc_res_version=").append(PlfStaticRes.DHTML_XTREECSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
  }
  if (LOAD.equals(wbox))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/wbox/wbox.js?_mc_res_version=").append(PlfStaticRes.WBOXJS).append("\"></script>").append("\n");
    outSb.append("		<link href=\"").append(JS_PATH).append(
      "/wbox/wbox/wbox.css?_mc_res_version=").append(PlfStaticRes.WBOXCSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
  }
  if (!UNLOAD.equals(popDivWin))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/subModal/submodalsource.js?_mc_res_version=").append(PlfStaticRes.SUBMODALSOURCE).append("\"></script>").append("\n");
    outSb.append("		<link rel=\"stylesheet\" type=\"text/css\" href=\"").append(JS_PATH).append(
      "/subModal/submodal.css?_mc_res_version=").append(PlfStaticRes.SUBMODALCSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
    outSb.append("		<link  href=\"").append(JS_PATH).append(
      "/subModal/style.css?_mc_res_version=").append(PlfStaticRes.STYLECSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
  }
  if (LOAD.equals(highcharts))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/highcharts/highcharts.js?_mc_res_version=").append(PlfStaticRes.HIGHCHARTS).append("\"></script>").append("\n");
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/highcharts/highcharts-more.js?_mc_res_version=").append(PlfStaticRes.HIGHCHARTSMORE).append("\"></script>").append("\n");
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/highcharts/modules/exporting.js?_mc_res_version=").append(PlfStaticRes.EXPORTING).append("\"></script>").append("\n");
  }
  if (LOAD.equals(jqueryBlockUI))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/jqueryblockui/jquery.blockUI.js?_mc_res_version=").append(PlfStaticRes.JQUERYBLOCKUI).append("\"></script>").append("\n");
  }
  if (LOAD.equals(tab))
  {//选项卡页面样式
    outSb.append("		<link href=\"").append(CSS_PATH).append(
      "/css2/css/css_tab.css?_mc_res_version=").append(PlfStaticRes.CSSTAB)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
  }
  if (LOAD.equals(ckeditor))
  {
    outSb.append("		<script defer=\"defer\" type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/ckeditor/ckeditor.js?_mc_res_version=").append(PlfStaticRes.CKEDITOR).append("\"></script>").append("\n");
  }
  if (LOAD.equals(tabIndent))
  {
    outSb.append("		<script type=\"text/javascript\" defer=\"defer\" src=\"").append(JS_PATH).append(
      "/ext/tabIndent.js?_mc_res_version=").append(PlfStaticRes.TABINDENT).append("\"></script>").append("\n");
  }
  if (LOAD.equals(HotKey))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/ms/HotKey.js?_mc_res_version=").append(PlfStaticRes.HOTKEY).append("\"></script>").append("\n");// 表格相关js
  }

  if (LOAD.equals(chosen))
  {
    outSb.append("		<link href=\"").append(CSS_PATH_FP).append(
      "/chosen.css?_mc_res_version=").append(PlfStaticRes.CHOSENCSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
      "/chosen.jquery.js?_mc_res_version=").append(PlfStaticRes.CHOSEN_JQUERY).append("\"></script>").append("\n"); //可输入下拉框

  }

  if (LOAD.equals(popMsgWin))
  {
    outSb.append("		<script src=\"").append(JS_PATH).append(
      "/common/msg/jquery.messager.js?_mc_res_version=").append(PlfStaticRes.JQUERY_MESSAGER).append("\"></script>").append("\n");
  }

  if (LOAD.equals(html5))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH).append(
      "/html5.js?_mc_res_version=").append(PlfStaticRes.HTML5).append("\"></script>").append("\n");
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_COMMON_PATH).append(
      "/excanvas.js?_mc_res_version=").append(PlfStaticRes.EXCANVAS).append("\"></script>").append("\n");
  }

  if (LOAD.equals(workFlow))
  {
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

  if (LOAD.equals(spectrum))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
      "/spectrum/spectrum.js?_mc_res_version=").append(PlfStaticRes.SPECTRUMJS).append("\"></script>").append("\n");
    outSb.append("		<link href=\"").append(JS_PATH).append(
      "/spectrum/spectrum.css?_mc_res_version=").append(PlfStaticRes.SPECTRUMCSS)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");//页面样式
  }
  if (!UNLOAD.equals(jqueryMsg))
  {
    outSb.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append("/msg/jquery.msg.js?_mc_res_version=").append(PlfStaticRes.JQUERYMSG).append("\"></script>").append("\n");
  }

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
  out.println(outSb.toString());

  //用户页面默认引入
  /*
  outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
    "/jquery-1.11.1.min.js\"></script>").append("\n");  */
  outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
    "/jquery-ui.js?_mc_res_version=").append(PlfStaticRes.JQUERY_UI).append("\"></script>").append("\n");

  outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
    "/select-widget-min.js?_mc_res_version=").append(PlfStaticRes.SELECT_WIDGET_MIN).append("\"></script>").append("\n");


    outSbFp.append("<link rel =\"shortcut icon\" type=\"image/x-icon\" href=\"").append(pic_title).append("\">").append("\n");//增加浏览器访问显示小图标

  if (!UNLOAD.equals(style))
  {
    outSbFp.append("		<link href=\"").append(CSS_PATH_FP).append(
      "/style.css?_mc_res_version=").append(PlfStaticRes.CSS_PATH_FP_STYLE)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
  }
  if (!UNLOAD.equals(subStyle))
  {
    outSbFp.append("		<link href=\"").append(CSS_PATH_FP).append(
      "/sub-style.css?_mc_res_version=").append(PlfStaticRes.CSS_PATH_FP_SUB_STYLE)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
  }
  if (LOAD.equals(iconfont))
  {
    outSbFp.append("		<link href=\"").append(CSS_PATH).append(
      "/fonts/iconfont.css?_mc_res_version=").append(PlfStaticRes.ICONFONT_STYLE)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
  }

  /* outSbFp.append("		<link href=\"").append(CSS_PATH_FP).append(
     "/chosen.css\" rel=\"stylesheet\" type=\"text/css\" />").append("\n");*/

  outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
    "/slick.js?_mc_res_version=").append(PlfStaticRes.SLICK).append("\"></script>").append("\n");
  outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
    "/utilsFp.js?_mc_res_version=").append(PlfStaticRes.UTILSFP).append("\"></script>").append("\n");

  if (!UNLOAD.equals(popDivWinFp))
  {
    outSbFp.append("<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
      "/modalWinFp.js?_mc_res_version=").append(PlfStaticRes.MODALWINFP).append("\"></script>").append("\n");
  }

  if (LOAD.equals(placeholder))
  {
    outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
      "/jquery.placeholder.js?_mc_res_version=").append(PlfStaticRes.PLACEHOLDER).append("\"></script>").append("\n");
  }
  if (LOAD.equals(msData))
  {
    outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
      "/MSdata.js?_mc_res_version=").append(PlfStaticRes.MS_DATA).append("\"></script>").append("\n");
  }
  outSbFp.append("		<link  href=\"").append(JS_PATH).append(
    "/mCustomScrollbar/jquery.mCustomScrollbar.css?_mc_res_version=").append(PlfStaticRes.MCUSTOMSCROLLBAR_CSS)
    .append("\" rel=\"stylesheet\" type=\"text/css\">\n");
  outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
    "/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js?_mc_res_version=").append(PlfStaticRes.MCUSTOMSCROLLBAR_CONCAT_MIN).append("\"></script>").append("\n");

  if (LOAD.equals(serializeForm))
  {
    outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
      "/serializeForm.js?_mc_res_version=").append(PlfStaticRes.SERIALIZE_FORM).append("\"></script>").append("\n");
  }
  if (LOAD.equals(pieChartsFp))
  {
    outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
      "/echarts/pieChartsFp.js?_mc_res_version=").append(PlfStaticRes.PIE_CHARTS_FP).append("\"></script>").append("\n");
  }

  /*   if (LOAD.equals(uEditor))
   {
       outSbFp.append("      <script type=\"text/javascript\" src=\"").append(JS_PATH).append(
       "/ueditor/ueditor.config.js\"></script>").append("\n");
       outSbFp.append("      <script type=\"text/javascript\" src=\"").append(JS_PATH).append(
       "/ueditor/ueditor.all.js\"></script>").append("\n");
       if("zh_CN".equals(StringUtilsMc.toString(request.getLocale()))){
        outSbFp.append("      <script type=\"text/javascript\" src=\"").append(JS_PATH).append(
        "/ueditor/lang/zh-cn/zh-cn.js\"></script>").append("\n");
       }else{
        outSbFp.append("      <script type=\"text/javascript\" src=\"").append(JS_PATH).append(
        "/ueditor/lang/en/en.js\"></script>").append("\n");      
       }


   }*/
   
   if (LOAD.equals(zTree)) {
	  outSbFp.append("		<link href=\"").append(JS_PATH).append(
      "/zTree/css/demo.css?_mc_res_version=").append(PlfStaticRes.ZTREE)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n"); 
	  outSbFp.append("		<link href=\"").append(JS_PATH).append(
      "/zTree/css/zTreeStyle/zTreeStyle.css?_mc_res_version=").append(PlfStaticRes.ZTREE)
      .append("\" rel=\"stylesheet\" type=\"text/css\">\n"); 
		  outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
	      "/zTree/js/jquery.ztree.core.js?_mc_res_version=").append(PlfStaticRes.ZTREE).append("\"></script>").append("\n");
		  outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
	      "/zTree/js/jquery.ztree.excheck.js?_mc_res_version=").append(PlfStaticRes.ZTREE).append("\"></script>").append("\n");
		
		  outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH).append(
	      "/zTree/js/jquery.ztree.exedit.js?_mc_res_version=").append(PlfStaticRes.ZTREE).append("\"></script>").append("\n");
		}
		
		if (LOAD.equals(jqueryprint))
	  {
	    outSbFp.append("		<script type=\"text/javascript\" src=\"").append(JS_PATH_FP).append(
	      "/jQuery.print.js?_mc_res_version=").append(PlfStaticRes.JQUERY_PRINT).append("\"></script>").append("\n"); //打印控件
	
	  }  

  out.println(outSbFp.toString());
%>


<script type="text/javascript" 
	src="${path}/plf/page/js_files/comm/search_time_slot.js?_mc_res_version=<%=PlfStaticRes.EXPORT_PAGE_JS %>"></script>
