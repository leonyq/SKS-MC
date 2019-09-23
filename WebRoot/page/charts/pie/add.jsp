<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"%>
<%-- <%@ include file="/common/pub_tag.jsp"%> --%>
<head>
<s:include value="/include/head.jsp"></s:include>
<title></title>

<style type="text/css">
table td{word-break:break-all;
		} 

</style>

</head>
<body>

	<div class="all">
		<form id="addForm" name="addForm" action="${pageContext.request.contextPath}/charts/pieAction_doAdd.ms" method="post" >
	    	<table id="listTable" width="100%" border="1" class="table_list" >
				<tr>
					<td width="30%">标题</td>
					<td><input type="text" name="chartsConfig.titleText" style="width:95%" /></td>
				</tr>
				<tr>
					<td width="30%">标题字体</td>
					<td>
						<input type="radio" name="chartsConfig.titleTextFontFamily" checked value="sans-serif">sans-serif
						<input type="radio" name="chartsConfig.titleTextFontFamily" value="宋体">宋体
						<input type="radio" name="chartsConfig.titleTextFontFamily" value="黑体">黑体
					</td>
				</tr>
				<tr>
					<td width="30%">标题颜色</td>
					<td><input type="text" name="chartsConfig.titleTextColor" style="width:95%" value="#000000" /></td>
				</tr>
				<tr>
					<td width="30%">标题字号</td>
					<td><input type="text" name="chartsConfig.titleTextFontSize" style="width:95%" value="15" /></td>
				</tr>
				<tr>
					<td width="30%">标题文字样式</td>
					<td>
						<input type="radio" name="chartsConfig.titleTextFontWeight" checked value="normal">正常
						<input type="radio" name="chartsConfig.titleTextFontWeight" value="bold">粗体
					</td>
				</tr>
				<tr>
					<td width="30%">副标题</td>
					<td><input type="text" name="chartsConfig.titleSubtext" style="width:95%" /></td>
				</tr>
				<tr>
					<td width="30%">副标题字体</td>
					<td>
						<input type="radio" name="chartsConfig.titleSubtextFontFamily" checked value="sans-serif">sans-serif
						<input type="radio" name="chartsConfig.titleSubtextFontFamily" value="宋体">宋体
						<input type="radio" name="chartsConfig.titleSubtextFontFamily" value="黑体">黑体
					</td>
				</tr>
				<tr>
					<td width="30%">副标题颜色</td>
					<td><input type="text" name="chartsConfig.titleSubtextColor" style="width:95%" value="#cccccc" /></td>
				</tr>
				<tr>
					<td width="30%">副标题字号</td>
					<td><input type="text" name="chartsConfig.titleSubtextFontSize" style="width:95%" value="12" /></td>
				</tr>
				<tr>
					<td width="30%">副标题文字样式</td>
					<td>
						<input type="radio" name="chartsConfig.titleSubtextFontWeight" checked value="normal">正常
						<input type="radio" name="chartsConfig.titleSubtextFontWeight" value="bold">粗体
					</td>
				</tr>
				<tr>
					<td width="30%">画布宽度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasWidth" style="width:95%" value="600" /></td>
				</tr>
				<tr>
					<td width="30%">画布高度(像素绝对值)</td>
					<td><input type="text" name="chartsConfig.canvasHeight" style="width:95%" value="600" /></td>
				</tr>
				<tr>
					<td width="30%">是否显示加载动画</td>
					<td>
						<input type="radio" name="chartsConfig.animation" checked value="true">显示
						<input type="radio" name="chartsConfig.animation" value="false">不显示
					</td>
				</tr>	
				<tr>
					<td width="30%">饼图点击事件</td>
					<td><input type="text" name="chartsConfig.eventClick" style="width:95%" /></td>
				</tr>
				<tr>
					<td width="30%">背景图url</td>
					<td><input type="text" name="chartsConfig.backgroundUrl" style="width:95%" /></td>
				</tr>
				<tr>
					<td width="30%">背景图透明度(100为完全不透明,0为完全透明)</td>
					<td><input type="text" name="chartsConfig.backgroundAlpha" style="width:95%" value="100" /></td>
				</tr>
				<%-- *************************************************************************************************** --%>
				<%-- ************************************以上为公共属性配置********************************************** --%>
				<%-- *************************************************************************************************** --%>
				<tr>
					<td colspan="2" bgcolor="#eeeeee">&nbsp;</td>
				</tr>
				<tr>
					<td width="30%">图例说明的排列方式</td>
					<td>
						<input type="radio" name="pie.legendOrient" checked value="vertical">竖向排列
						<input type="radio" name="pie.legendOrient" value="horizontal">横向排列						
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的水平位置</td>
					<td>
						<input type="radio" name="pie.legendX" checked value="left">居左
						<input type="radio" name="pie.legendX" value="center">居中			
						<input type="radio" name="pie.legendX" value="right">居右							
					</td>
				</tr>
				<tr>
					<td width="30%">图例说明的垂直位置</td>
					<td>
						<input type="radio" name="pie.legendY" checked value="top">顶部
						<input type="radio" name="pie.legendY" value="middle">居中			
						<input type="radio" name="pie.legendY" value="bottom">底部							
					</td>
				</tr>
				<tr>
					<td width="30%">是否显示标签</td>
					<td>
						<input type="radio" name="pie.labelNormalShow" checked value="true">显示
						<input type="radio" name="pie.labelNormalShow" value="false">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">标签内容</td>
					<td>
						<input type="checkbox" name="pie.labelFormatterC" checked value="true">分类数值
						&nbsp;
						<input type="checkbox" name="pie.labelFormatterD" checked value="true">分类百分比
					</td>
				</tr>
				<tr>
					<td width="30%">鼠标指上时是否显示提示信息</td>
					<td>
						<input type="radio" name="pie.tooltipTrigger" checked value="item">显示
						<input type="radio" name="pie.tooltipTrigger" value="none">不显示
					</td>
				</tr>
				<tr>
					<td width="30%">提示信息上的标题</td>
					<td><input type="text" name="pie.seriesName" style="width:95%" /></td>
				</tr> 
				<tr>
					<td width="30%">图形显示面积(可填页面百分比或绝对值)</td>
					<td><input type="text" name="pie.seriesRadius" style="width:95%" value="60%" /></td>
				</tr>
				<tr>
					<td width="30%">饼图圆心x轴位置(可填页面百分比或坐标绝对值)</td>
					<td><input type="text" name="pie.seriesCenterX" style="width:95%" /></td>
				</tr>
				<tr>
					<td width="30%">饼图圆心y轴位置(可填页面百分比或坐标绝对值)</td>
					<td><input type="text" name="pie.seriesCenterY" style="width:95%" /></td>
				</tr>			
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="添加" />
					</td>
				</tr>
			</table>
			<input type="hidden" name="chartsConfig.type" value="1"/>
		</form>
	</div>

</body>