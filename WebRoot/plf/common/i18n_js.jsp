<%@page import="com.more.fw.core.common.method.ProductType"%>
<%@page import="com.more.fw.core.common.method.ReadProperties"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%
	//平台客户定制化功能
	String text_confirm_sys=StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("text_confirm_sys"))==null?CommMethodMc.getText("摩尔提示"):StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("text_confirm_sys"));
	String text_tip_sys=StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("text_tip_sys"))==null?CommMethodMc.getText("摩尔提示"):StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("text_tip_sys"));
	
	Object _IS_LOAD_I18N = request.getAttribute("_IS_LOAD_I18N");
	if (!"1".equals(request.getAttribute("pagination")) && !"1".equals(_IS_LOAD_I18N)) {
		request.setAttribute("_IS_LOAD_I18N","1" );
%>
<script type="text/javascript"><%-- 多语言公用JS变量页面  --%>
<!--
var _GLO_MC_VERSION = "<%=com.more.fw.core.common.method.ConstantsMc.VERSION_NO%>";//平台版本号
var _GLO_DATABASE_SET="<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@DATABASE_SET}' />";
var _GLO_DATABASE_SET_MSG = "<dict:lang value="不能超过最大字符长度" />";
var _GLO_VALIDATE_NULL_MSG = "<dict:lang value="不能为空" />";

var _GLO_VALIDATE_NULL_MSG2 = "<dict:lang value="该项不能为空" />";
var _GLO_VALIDATE_NAN_MSG = "<dict:lang value="该字段只能为数值" />";
var _GLO_NO_AUTHORITY_MSG = "<dict:lang value="无权限访问该功能" />";
var _GLO_PAGE_AX_LAB_1 = "<dict:lang value="共" />";
var _GLO_PAGE_AX_LAB_2 = "<dict:lang value="条记录" />";
var _GLO_PAGE_AX_LAB_3 = "<dict:lang value="页" />";
var _GLO_PAGE_AX_LAB_4 = "<dict:lang value="当前第" />";
var _GLO_PAGE_AX_LAB_5 = "<dict:lang value="每页" />";
var _GLO_PAGE_AX_LAB_6 = "<dict:lang value="第一页" />";
var _GLO_PAGE_AX_LAB_7 = "<dict:lang value="上一页" />";
var _GLO_PAGE_AX_LAB_8 = "<dict:lang value="下一页" />";
var _GLO_PAGE_AX_LAB_9 = "<dict:lang value="最后页" />";
var _GLO_PAGE_AX_LAB_10 = "<dict:lang value="条" />";

var _GLO_FP_PAGE_AX_LAB_1 = "<dict:lang value="首页" />";
var _GLO_FP_PAGE_AX_LAB_2 = "<dict:lang value="最后一页" />";
var _GLO_FP_PAGE_AX_LAB_3 = "<dict:lang value="每页" />";
var _GLO_FP_PAGE_AX_LAB_4 = "<dict:lang value="条" />";
var _GLO_FP_PAGE_AX_LAB_5 = "<dict:lang value="共计" />";
var _GLO_FP_PAGE_AX_LAB_6 = "<dict:lang value="请输入大于零的整数" />";
var _GLO_FP_PAGE_AX_LAB_7 = "<dict:lang value="最大页数应" />";

var _GLO_FUNC_CODE="<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />";
var _GLO_VALIDATE_OK = "<dict:lang value="确定" />";
var _GLO_VALIDATE_CANCEL = "<dict:lang value="取消" />";
var _GLO_PATH = "${path}";
var _GLO_ROOTPATH = "${rootPath}";
var _GLO_CONFIRM_ICON_TITLE = "<dict:lang value="摩尔提示" />";
var _GLO_CONFIRM_ICON_NOTICE = "<dict:lang value="注" />";


var _GLO_VALIDATE_USERNAME_NULL_MSG = "<dict:lang value="用户名不能为空" />";
var _GLO_VALIDATE_PWD_NULL_MSG = "<dict:lang value="密码不能为空" />";
var _GLO_VALIDATE_CODE_NULL_MSG = "<dict:lang value="验证码不能为空" />";
var _GLO_VALIDATE_CODE_ERR_MSG = "<dict:lang value="验证码不正确" />";
var _GLO_VALIDATE_CODE_TIMEOUT = "<dict:lang value="验证码超时,请重新获取" />";
var _GLO_VALIDATE_LOADING_MSG = "<dict:lang value="正在登录,请稍候" />";
var _GLO_$CURR_PRO = "<%=com.more.fw.core.sysfa.fil.filter.LoginFilter.getCURR_PRO()%>"; //当前发布产品类型
var _GLO_COPYRIGHT = "<dict:lang value="福建摩尔软件有限公司版权所有" />";
var _GLO_ISBROWSER = "<dict:lang value="不支持IE浏览器，请切换用谷歌、360、火狐、Edge浏览器" />";
var _GLO_PRINT_PLUGIN = "<dict:lang value="摩尔共享标签打印服务(localhost本地)未安装启动!安装后请刷新页面" />";
var JavaBuildCodeMark=10;//cjdjk 2018-01-17 14:27 
var _GLO_USER_TIMEZONE=parseInt("<%=com.more.fw.core.common.method.DateUtilMc.getUserTimezone()%>",10);//获取当前用户的时区
var _GLO_CHOSEN_NO_RESULT_TIP = "<dict:lang value="没有搜索结果" />";
var _GLO_LABEL_PRINT_TIP = "<dict:lang value="标签在打印过程中如关闭窗口会引起漏打。是否确认关闭" />?";

//平台客户定制化功能
var _GLO_CONFIRM_ICON_TITLE_CONFIRM= "<dict:lang value="<%=text_confirm_sys%>" />";
var _GLO_CONFIRM_ICON_TITLE_TIP = "<dict:lang value="<%=text_tip_sys%>" />";

//-->
</script>
<%
	}
%>