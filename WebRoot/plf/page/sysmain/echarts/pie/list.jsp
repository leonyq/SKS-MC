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
  </head>
  
  <body>
  <ul>
  	<li><a href="${path}charts/barAction_preAdd">新建配置</a><br/></li>
  </ul>
  
  <div class="all" style="height: 500px;overflow-y:auto; ">			
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
								<a href="${path}charts/pieAction_preUpdate.ms?chartsConfig.id=<s:property value="id" />">修改</a>
								&nbsp;
								<a href="${path}charts/pieAction_show.ms?chartsConfig.id=<s:property value="id" />">预览</a>
								&nbsp;
								<a href="${path}charts/pieAction_ajaxDemo.ms?chartsConfig.id=<s:property value="id" />">ajax</a>
							</td>
						</tr>
					</s:iterator>
				</tbody>
		</table>
	</div>
	
  </body>
</html>
