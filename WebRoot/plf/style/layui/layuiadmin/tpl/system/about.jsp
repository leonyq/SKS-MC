<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<div class="layui-card-header">版本信息</div>
<div class="layui-card-body layui-text layadmin-about">
  <!--  
  <script type="text/html" template>
    <p>当前版本：layuiAdmin-v{{ layui.admin.v }}</p>
  </script>
  -->
  <p id="currentVersion">
  	<p>当前版本：<%=com.more.fw.core.common.method.ConstantsMc.VERSION_NO%></p>
  </p>
</div>

<div class="layui-card-header">关于版权</div>
<div class="layui-card-body layui-text layadmin-about">
  
  <blockquote class="layui-elem-quote" style="border: none;">
  MC 制造核心平台 是新一代工业软件（MES/WMS等）的快速构建器。包含了WisIDE 云开发平台和Wislib云智造组件库，平台融合丰富的工业及行业知识，行业套件、开源代码、数据算法模型、微服务组件、工具箱等，为工业软件的开发和应用提供知识解构与复用，帮助企业设计、执行、监控和优化工业软件，助力中国工业软件的发展、赋能企业实现智能制造。
  </blockquote>
  <p>Copyright? 2011-2018 摩尔元数（厦门）科技有限公司 </p>
  
</div>