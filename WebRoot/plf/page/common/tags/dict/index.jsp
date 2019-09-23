<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<html>
	<head>
		<title>数据字典的使用</title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>

	<body class="ContBody">
		<br>
		<div>
			<br>
			<br>
			<b>数据字典的使用：</b>
			<br>
			性别：
			<dict:selectDict id="userDtoSearch_sex" name="userDtoSearch.sex"
				dictCode="sex" dictValue="0"
				custom_option="<option value=''>--请选择--</option>" />
			&nbsp;&nbsp;&nbsp;
			<br/> 
			<br/>
			1[<dict:viewDict dictCode="sex" dictValue="0|b|6|1|2|3|4|5|7|a" />]
			<br/>
			2[<dict:viewDict dictCode="sex" dictValue="0|b|6|1|2|3|4|5|7|a" separator="&nbsp;&nbsp;||&nbsp;&nbsp;" />]
			 [<dict:viewDict dictCode="sex" dictValue="0|b|6|1|2|3|4|5|7|a" separator="," />]
			 [<dict:viewDict dictCode="sex" dictValue="0|b|6|1|2|3|4|5|7|a" separator="&nbsp;" />]
			<br/>
			3[<dict:viewDict dictCode="sex" dictValue="0|b|6|1|2|3|4|5|7|a"  separator="&nbsp;&nbsp;||&nbsp;&nbsp;" lineBreaks="1"/>]
			<br/>
			4[<dict:viewDict dictCode="sex" dictValue="0|b|6|1|2|3|4|5|7|a"  separator="&nbsp;&nbsp;||&nbsp;&nbsp;" lineBreaks="2"/>]
			<br/>
			5[<dict:radioDict id="sex%{#index.count}" name="sex_%{#index.count}" dictCode="sex" dictValue="%{code}" separator="&nbsp;&nbsp;||&nbsp;&nbsp;" lineBreaks="2"/>]
			<br/>
			
			6[<dict:radioDict id="sex2%{#index.count}" name="sex2_%{#index.count}" dictCode="sex" dictValue="0" separator="&nbsp;&nbsp;||&nbsp;&nbsp;" />]
			<br/>--[<dict:radioDict id="sex3%{#index.count}" name="sex2_%{#index.count}" dictCode="sex" dictValue="0" separator="    " lineBreaks="1" />]
			<br/>
			7[<dict:checkBoxDict id="sex_c_1" name="sex_c1" dictCode="sex" dictValue="%{code}" />]
			<br/>
			8[<dict:checkBoxDict id="sex_c_2" name="sex_c2" dictCode="sex" dictValue="0" separator="&nbsp;&nbsp;||&nbsp;&nbsp;" />]
			<br/>
			9[<dict:checkBoxDict id="sex_c_3" name="sex_c3" dictCode="sex" dictValue="0|1|2|3" separator="&nbsp;&nbsp;||&nbsp;&nbsp;" lineBreaks="1"/>]
			<br/>
			10[<dict:checkBoxDict id="sex_c_4" name="sex_c4" dictCode="sex" dictValue="0|1|2|3" separator="&nbsp;&nbsp;||&nbsp;&nbsp;"  lineBreaks="2"/>]
			<br/>
		</div>
		<table width="100%" border="1" class="ContList02">
			<thead>
				<tr>
					<th width="5%">序号</th>
					<th width="35%">编码</th>
					<th width="35%">编码值</th>
					<th width="25%">操作</th>
				</tr>

			</thead>
			<tr>
				<td>1</td>
				<td>0</td>
				<td><dict:viewDict dictCode="sex" dictValue="0" /></td>				
				<td align="center">
					<a href="#" title="查看" ><img src="/bomc/plf/style/css1/images/m_view.gif?_mc_res_version=<%=PlfStaticRes.M_VIEW_GIF %>" /></a>
					||<a href="#" title="修改" ><img src="/bomc/plf/style/css1/images/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
					||<a href="#" title="配置字典值" ><img src="/bomc/plf/style/css1/images/ContImg24.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG24_GIF %>" /></a>
					||<a href="#" title="删除" ><img src="/bomc/plf/style/css1/images/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>1</td>
				<td><dict:viewDict dictCode="sex" dictValue="1" /></td>	
				<td align="center">
					<a href="#" title="查看" ><img src="/bomc/plf/style/css1/images/m_view.gif?_mc_res_version=<%=PlfStaticRes.M_VIEW_GIF %>" /></a>
					||<a href="#" title="修改" ><img src="/bomc/plf/style/css1/images/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
					||<a href="#" title="配置字典值" ><img src="/bomc/plf/style/css1/images/ContImg24.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG24_GIF %>" /></a>
					||<a href="#" title="删除" ><img src="/bomc/plf/style/css1/images/ContImg10.gif_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
					
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>2</td>
				<td><dict:viewDict dictCode="sex" dictValue="2" /></td>	
				<td align="center">
					<a href="#" title="查看" ><img src="/bomc/plf/style/css1/images/m_view.gif?_mc_res_version=<%=PlfStaticRes.M_VIEW_GIF %>" /></a>
					||<a href="#" title="修改" ><img src="/bomc/plf/style/css1/images/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
					||<a href="#" title="配置字典值" ><img src="/bomc/plf/style/css1/images/ContImg24.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG24_GIF %>" /></a>
					||<a href="#" title="删除" ><img src="/bomc/plf/style/css1/images/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
				</td>
			</tr>
		</table>
		<br/>
		<br/>
		<br/>
		<br/>
	</body>
</html>
