<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title></title>
  </head>
  
  <body>
  <ul>
  	<li><a href="<%=basePath%>charts/pieAction_preAdd.ms">新建配置</a><br/></li>
  </ul>
  
  <div class="all">			
    	<table id="listTable" width="100%" border="1" class="table_list" >
    	<thead>
			<tr class="tdcolor">
				<th width="15%">id</th>
				<th>标题</th>
				<th width="25%">副标题</th>
				<th width="20%">&nbsp;</th>
			</tr>
			</thead>
				<tbody>
					<s:iterator value="#request.dataList" id="list" status="index">
						<tr>
							<td><s:property value="id" /></td>
							<td><s:property value="titleText" /></td>
							<td><s:property value="titleSubtext" /></td>
							<%-- 
							<td>
								<s:if test="#list.labelNormalShow==1">
									显示
								</s:if>
								<s:else>
									&nbsp;
								</s:else>
							</td>
							<td>
								<s:if test="#list.tooltipTrigger=='item'">
									显示
								</s:if>
								<s:else>
									&nbsp;
								</s:else>
							</td>
							<td><s:property value="seriesName" /></td>
							<td>
								<s:if test="#list.legendOrient=='horizontal'">
									横向排列
								</s:if>
								<s:else>
									竖向排列
								</s:else>
							</td>
							<td><s:property value="seriesRadius" /></td>
							<td>(<s:property value="seriesCenterX" />&nbsp;&nbsp;,&nbsp;&nbsp;<s:property value="seriesCenterY" />)</td>
							 --%>
							<td align="center">
								<a href="<%=basePath%>charts/pieAction_preUpdate.ms?chartsConfig.id=<s:property value="id" />">修改</a>
								&nbsp;
								<a href="<%=basePath%>charts/pieAction_show.ms?chartsConfig.id=<s:property value="id" />">预览</a>
								&nbsp;
								<a href="<%=basePath%>charts/pieAction_ajaxDemo.ms?chartsConfig.id=<s:property value="id" />">ajax</a>
							</td>
						</tr>
					</s:iterator>
				</tbody>
		</table>
	</div>
	
  </body>
</html>
