<%-- 语言选择页面 --%>
<%-- 
使用方法：
在要使用的页面中引入下面代码：
<c:import url="/plf/common/selectUserLanguage.jsp"/>

 --%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<script type="text/javascript">
<!--
    function langSelecter_onChanged() {
        document.langForm.submit();
    }
//-->
</script>

<s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']"/><%--  Constants.STRUTS2_I18N_KEY --%>
<s:bean id="locales" name="com.more.fw.core.common.method.CommMethodMc"/>
<form action="<s:url includeParams="get" encode="true"/>" name="langForm" style="background-color: powderblue; padding-top: 4px; padding-bottom: 4px;">
    <s:property value="%{getText('selectUserLanguage.Language')}" />
    <s:select label="Language" 
        list="#locales.locales" listKey="value"    listValue="key"
        value="#SESSION_LOCALE == null ? locale : #SESSION_LOCALE"
        name="request_locale" id="langSelecter" 
        onchange="langSelecter_onChanged()" theme="simple"/>
</form>