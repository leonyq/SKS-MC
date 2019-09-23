<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="属性列表" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
		
	</jsp:include>
	<style>
	
	table,td {
		border-collapse: collapse;
	}
	
	.ellipsis_span {
		display: block;
		width: 200px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	
	._edit {
		display: none;
	}
	
	table {
		border-collapse: collapse;
		border-spacing: 0px;
		width: 100%;
		border: #000 solid 0px;
	}
	
	table td {
		border: 1px solid #000;
		height: 25px;
		text-align: center;
		border-left: 0px;
	}
	
	table th {
		background: #edd3d4;
		color: #a10333;
		border: #000 solid 1px;
		white-space: nowrap;
		height: 23px;
		border-top: 0px;
		border-left: 0px;
	}
	
	.t_left {
		width: 29%;
		height: auto;
		float: left;
		border-top: 1px solid #000;
		border-left: 1px solid #000;
	}
	
	/*t_r_content和cl_freeze高度相差20px， 高度为外观显示高度，可根据情况调整*/
	.t_r_content {
		width: 100%;
		height: 520px;
		background: #fff;
		overflow: auto;
	}
	
	.cl_freeze {
		height: 503px;
		overflow: hidden;
		width: 100%;
	}
	
	/* width 调整左边标题列宽度（左侧外观显示宽度）; 指定为width:auto 在Opera下显示有问题; height比 t_r_content 高度小20px*/
		/* width 宽度为 右侧外观显示宽度 实际显示宽度大小为“t_r”宽度加上“cl_freeze”宽度 */
		/* 如果显示不正常，调整 t_r的width 使其和t_left的width之和小于100%；等于100%时会有问题*/
	.t_r {
		width: 70%;
		height: auto;
		float: left;
		border-top: 1px solid #000;
		border-right: 1px solid #e6e6e6;
	}
	
	.t_r table {
		/*width: 3585px;需要修改总宽度 */
	}
	 
	td {word-wrap:break-word;word-break:break-all;}
	
	.t_r .t_r_title table {
		/*width: 3605px;需要修改总宽度 */
	}  /*宽度比 t_r table 大20px （至少大20，小了滚动条滑到右侧显示有问题）*/
	.t_r_t {
		width: 100%;
		overflow: hidden;
	}
	
	.bordertop {
		border-top: 0px;
	}
	.table_list tr th{
		 white-space:nowrap;overflow:visible!important;word-break:keep-all;
	}
	#editTable tr td{
		 white-space:nowrap;overflow:hidden;word-break:keep-all;
	}
	.fixedTable{table-layout:fixed;}
	.fixedTable_td {white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.table_list td {
		padding: 0
	}
	.tdDefWidth {
	   width: 60px;
	}
	
	.tdDefWidth2 {
	   width: 70px;
	}
	
	.tdDefWidth3 {
	   width: 90px;
	}
	.tdDefWidth4 {
	   width: 120px;
	}
	
	.tdDefWidth5 {
	   width: 140px;
	}
	
	.tdDefWidth6 {
	   width: 110px;
	}
	.trLeftColor{
	   background-color: #F5F7F9;
	}
	.tdDefWidth7{
	 width: 210px;
	}
</style>
	
	<script>
		<%-- 冻结滚动 --%>
		function frozenScroll(){
			var a=document.getElementById("t_r_content").scrollTop;
			var b=document.getElementById("t_r_content").scrollLeft;
			document.getElementById("cl_freeze").scrollTop=a;
			document.getElementById("t_r_t").scrollLeft=b;
			$("#paraMap_scrollLeft").val($("#t_r_content").scrollLeft());
			$("#paraMap_scrollTop").val($("#t_r_content").scrollTop());
		}
		$(function() {
			$(".table_list td").css("line-height",$(".table_list td").css("font-size"));
		})
	</script>

</head>
<body>
	<div class="all" style="margin-bottom:0px;">
		<div>
		<form id="addForm" name="addForm" action="${path}sys/BussModelAction_dataForm.ms" method="post" target="submitFrame">
			<s:hidden name="paraMap.MID" />
			<s:hidden name="paraMap.ID" />
			<input type="hidden" name="paraMap.scrollLeft" id="paraMap_scrollLeft" value="<c:out value='${paraMap.scrollLeft}' />" />
			<input type="hidden" name="paraMap.scrollTop" id="paraMap_scrollTop" value="<c:out value='${paraMap.scrollTop}' />" />
			<input type="hidden" name="paraMap.curRow" id="paraMap_curRow" value="<c:out value='${paraMap.curRow}' />" />
			<!--  
			<table class="func_table">
				<tr>
					<td width="100%" align="right">
						<input type="reset" value="<dict:lang value="重置" />" onclick="reset();" class="botton_img_search" />
						<input type="button" value="<dict:lang value="提交" />" onclick="add();" class="botton_img_add">
					</td>
				</tr>
			</table>
			-->

			<div style="width: 100%;margin-bottom:80px;" class="clearfix">
				<div class="t_left" style="border-top:none;border-left:none;">
					<div style="width: 100%;">
						<table class="table_list fixedTable" >
							<tr>
							<th class="fixedTable_td" style="width:15%; "><dict:lang value="序号" /></th>
							<th class="fixedTable_td" style="width:40%; "><dict:lang value="字段列名" /></th>
							<th class="fixedTable_td" style="width:20%; "><dict:lang value="用途" /></th>
							<!-- cjd 2017-12-08 begin 锁写标题-->
							 <th class="fixedTable_td" style="width:25%; "><dict:lang value="字段标题" /></th>
							 <!-- cjd 2017-12-08 end 锁写标题-->
							
							
							</tr>
						</table>
					</div>
					<div class="cl_freeze" id="cl_freeze" >
						<table id="left_data_table" class="table_list fixedTable table-mc-form">
					<s:iterator value="dataMap.formColLs" status="index">
							<tr class="trLeftColor" abbr="<s:property value="ID"/>">
								<td class="_noedit fixedTable_td" id="left_data_td_<s:property value="%{#index.count}"/>" style="width:15%;line-height: 34px;" >
									<s:property value="%{#index.count}"/></td>
								<td class="_noedit fixedTable_td" style="width:40%;" title="<s:property value="COL_NO"/>" >
									<s:property value="COL_NO"/>
								</td>
								<td style="width:20%;" >
								<span class="_show" title='<dict:viewDict dictCode="COL_SCENE" dictValue="%{COL_SCENE}" />'><dict:viewDict dictCode="COL_SCENE" dictValue="%{COL_SCENE}" /></span>
								</td>
								 <!-- zjb 2018/5/23 begin 当字段标题描述是多行时，多行下面的字段和UI操作框无法对齐 进行下面的修改 -->
								 <!-- cjd 2017-12-08 begin 锁写标题 -->
								<td class="mc-input" style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;width:25%;" title="<s:property value="TITLE_NAME"/>">  
										<span class="_show" >
											<s:property value="TITLE_NAME" />
										</span> 
										
									    <span class="_edit">
									    <input type="text" name="paramList[<s:property value="#index.index"/>].TITLE_NAME" 
									    value="<s:property value="TITLE_NAME"/>"  
									    class="_VAL_NULL mc-list-input-edit" />
									    </span>
								
								
								
								 
								</td>
								 <!-- cjd 2017-12-08 end 锁写标题-->
								 <!-- zjb 2018/5/23 begin 当字段标题描述是多行时，多行下面的字段和UI操作框无法对齐 进行下面的修改 -->
								
							</tr>
						</s:iterator>
						</table>
					</div>
				</div>
				<div class="t_r" style="border-top:none;">
					<div class="t_r_t" id="t_r_t">
						<div class="t_r_title">
							<table class="table_list fixedTable table-mc-form">
								<tr>
								 
								<th class="tdDefWidth"><dict:lang value="显示" /></th>
								<s:iterator value="dataMap.formColLs" status="index">
									<s:if test="\"0\" != ORM_TYPE && #index.index == 0">
										<th class="tdDefWidth"><dict:lang value="新增" /></th>
										<th class="tdDefWidth"><dict:lang value="新增编辑" /></th>
										<th class="tdDefWidth"><dict:lang value="显示修改" /></th>
										<th class="tdDefWidth"><dict:lang value="允许修改" /></th>
									</s:if>
								</s:iterator>								
								<th class="tdDefWidth"><dict:lang value="显示顺序" /></th>
								<th class="tdDefWidth2"><dict:lang value="国际化" /></th>
								<th class="tdDefWidth7"><dict:lang value="初始化控件" /></th>
								<th class="tdDefWidth6"><dict:lang value="查看UI组件" /></th>
								<s:iterator value="dataMap.formColLs" status="index">
									<s:if test="\"0\" != ORM_TYPE && #index.index == 0">
										<th class="tdDefWidth6"><dict:lang value="新增UI组件" /></th>
										<th class="tdDefWidth6"><dict:lang value="修改UI组件" /></th>
										<th class="tdDefWidth2"><dict:lang value="最大字符数" /></th>
										<th class="tdDefWidth"><dict:lang value="UI默认值" /></th>
									</s:if>
								</s:iterator>								
								<th class="tdDefWidth5" title="<dict:lang value="多个属性之间用;号分隔" />"><dict:lang value="UI样式属性" /></th>
								<th class="tdDefWidth5" title="<dict:lang value="多个样式表之间用 空格分开" />"><dict:lang value="UI样式表" /></th>
								<th class="tdDefWidth5"><dict:lang value="UI事件" /></th>
								<th class="tdDefWidth"><dict:lang value="允许排序" /></th>
								
								<th class="tdDefWidth"  title="默认排序需要和排序顺序同时配置"><dict:lang value="默认排序" /></th>
								<th class="tdDefWidth3" title="排序顺序需要和默认排序同时配置"><dict:lang value="排序顺序" /></th>
								
								<th class="tdDefWidth3"><dict:lang value="单元格宽" /></th>
								<th class="tdDefWidth3"><dict:lang value="单元格高" /></th>
								<th class="tdDefWidth6" title="<dict:lang value="多个属性之间用;号分隔" />"><dict:lang value="单元格样式属性" /></th>
								<th class="tdDefWidth6" title="<dict:lang value="多个样式表之间用 空格分开" />"><dict:lang value="单元格样式表" /></th>
								<th class="tdDefWidth6"><dict:lang value="单元格事件" /></th>
								<th class="tdDefWidth3"><dict:lang value="标题高" /></th>
								<th class="tdDefWidth3"><dict:lang value="标题宽" /></th>
								<th class="tdDefWidth3" title="<dict:lang value="多个属性之间用;号分隔" />"><dict:lang value="标题样式属性" /></th>
								<th class="tdDefWidth3" title="<dict:lang value="多个样式表之间用 空格分开" />"><dict:lang value="标题样式表" /></th>
								
								<s:iterator value="dataMap.formColLs" status="index">
									<s:if test="\"0\" != ORM_TYPE && #index.index == 0">
										<th class="tdDefWidth3"><dict:lang value="标题事件" /></th>
										<th class="tdDefWidth3"><dict:lang value="空值验证" /></th>
										<th class="tdDefWidth4"><dict:lang value="有效性验证JS方法体" /></th>
										<th class="tdDefWidth5"><dict:lang value="有效性验证JAVA方法名" /></th>
										<th class="tdDefWidth6"><dict:lang value="有效性验证类源码" /></th>
										<th class="tdDefWidth4" title="<dict:lang value="连续编辑清空" />"><dict:lang value="连续编辑清空" /></th>
								        <th class="tdDefWidth3"><dict:lang value="左边固定" /></th>
					                    <th class=" tdDefWidth4"><dict:lang value="去除左右空格" /></th>
								        <th class=" tdDefWidth4"><dict:lang value="显示悬停标题" /></th>
								        <th class=" tdDefWidth4"><dict:lang value="标题别名" /></th>
								        </s:if>
								</s:iterator>
								<th class="tdDefWidth3"><dict:lang value="导出" /></th>  
								<th class="tdDefWidth3"><dict:lang value="导出排序" /></th>  
								<th class="tdDefWidth3" title='模板下载是否显示该字段'><dict:lang value="导入" /></th>
								<th>&nbsp;</th>
								</tr>
							</table>
						</div>
					</div>
					<div class="t_r_content" id="t_r_content" onscroll="frozenScroll()">
						<table id="editTable" class="table_list fixedTable table-mc-form">
							<s:iterator value="dataMap.formColLs" status="index" id="formColLs">
							<input type="hidden" name="paramList[<s:property value="#index.index"/>].ID" value="<s:property value="ID"/>" />
							<tr class="trRightColor" abbr="<s:property value="ID"/>">
								 
								<td class="tdDefWidth">
									<span class="_show">
									<dict:viewDict dictCode="IS_SHOW" dictValue="%{IS_SHOW}" /></span>
									<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="IS_SHOW" dictValue="%{IS_SHOW}" name="paramList[%{#index.index}].IS_SHOW" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>
								</td>
								
								<s:if test="\"0\" != ORM_TYPE">
									<td class="tdDefWidth">
										<span class="_show"><dict:viewDict dictCode="IS_SHOW" dictValue="%{IS_ADD_SHOW}" /></span>
										<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="IS_SHOW" dictValue="%{IS_ADD_SHOW}" name="paramList[%{#index.index}].IS_ADD_SHOW" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>
									</td>
									<td class="tdDefWidth">
										<span class="_show"><dict:viewDict dictCode="YESNO" dictValue="%{IS_ADD_EDIT}" /></span>
										<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="YESNO" dictValue="%{IS_ADD_EDIT}" name="paramList[%{#index.index}].IS_ADD_EDIT" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>
									</td>
									<td class="tdDefWidth">
										<span class="_show"><dict:viewDict dictCode="IS_SHOW" dictValue="%{IS_EDIT_SHOW}" /></span>
										<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="IS_SHOW" dictValue="%{IS_EDIT_SHOW}" name="paramList[%{#index.index}].IS_EDIT_SHOW" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>
									</td>
									<td class="tdDefWidth">
										<span class="_show"><dict:viewDict dictCode="YESNO" dictValue="%{IS_EDIT}" /></span>
										<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="YESNO" dictValue="%{IS_EDIT}" name="paramList[%{#index.index}].IS_EDIT" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>
									</td>
								</s:if>	
								<td class="tdDefWidth mc-input">
									<span class="_show"><s:property value="SHOW_ORDER" /></span>
									<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].SHOW_ORDER" value="<s:property value="SHOW_ORDER" />"
										maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" /></span>
								</td>
								<td class="tdDefWidth2">
									<span class="_show"><dict:viewDict dictCode="YESNO" dictValue="%{IS_I18N}" /></span>
									<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="YESNO" dictValue="%{IS_I18N}" name="paramList[%{#index.index}].IS_I18N" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>
								</td>
								
								<td class="tdDefWidth7 initComponent">
			             		<span class="ver-align-mid">
			             		<input type="checkbox" id="viewComponent<s:property value="#index.index"/>" name="viewComponent" <s:if test="null == UI_IMG_VIEW"> disabled="disabled" </s:if> value="<s:property value="UI_COMP_VIEW" />" maxlength="64" style="border: 0px;width:20px;">
        						<label for="viewComponent<s:property value="#index.index"/>">查看</label>
			             		<input type="checkbox" id="addComponent<s:property value="#index.index"/>" name="addComponent" <s:if test="null == UI_IMG_ADD"> disabled="disabled" </s:if> value="<s:property value="UI_COMP_ADD" />" maxlength="64" style="border: 0px;width:20px;">
        						<label for="addComponent<s:property value="#index.index"/>">新增</label>
								<input type="checkbox" id="editComponent<s:property value="#index.index"/>" name="editComponent" <s:if test="null == UI_IMG_EDIT"> disabled="disabled" </s:if> value="<s:property value="UI_COMP_EDIT" />" maxlength="64" style="border: 0px;width:20px;">
        						<label for="editComponent<s:property value="#index.index"/>">修改</label>
        						
        						<!--  
								<input type="button" id="clearUI" value="<dict:lang value="清除" />" onclick="clearPop(this,'<s:property value="UI_COMP_VIEW" />','<s:property value="UI_COMP_ADD" />','<s:property value="UI_COMP_EDIT" />');"  maxlength="64" style="width:50px;">
								-->
								<a id="clearUI" class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);" onclick="clearPop(this,'<s:property value="UI_COMP_VIEW" />','<s:property value="UI_COMP_ADD" />','<s:property value="UI_COMP_EDIT" />');" title="<dict:lang value="清除" />" >清除
								</a>
				
								</span>
								</td>
								
								<td class="tdDefWidth6" style=" cursor: pointer;">
									<span class="_show" style="text-align: left;">
									<s:if test="null != UI_IMG_VIEW">
										<IMG src="${UI_IMG_PATH}/<s:property value="UI_IMG_VIEW" />?_mc_res_version=<%=PlfStaticRes.UI_IMG_VIEW %>" style="vertical-align:middle;" />
									</s:if>
									<s:property value="UI_NAME_VIEW" />
									</span>
									<span class="_edit">
									
									<input type="button" class="layui-btn layui-btn-sm" value="<dict:lang value="查看配置" />" onclick="cfgViewUI(this,'<s:property value="ID" />','<s:property value="UI_COMP_VIEW" />','<s:property value="paraMap.ID" />','<s:property value="TITLE_NAME.replaceAll(\"'\",\"\\\\\\\\'\")"/>');" />
									
									</span>
								</td>
								<s:if test="\"0\" != ORM_TYPE">
									<td class="tdDefWidth6" style=" cursor: pointer;">
										<span class="_show" style="text-align: left;">
										<s:if test="null != UI_IMG_ADD">
											<IMG src="${UI_IMG_PATH}/<s:property value="UI_IMG_ADD" />?_mc_res_version=<%=PlfStaticRes.UI_IMG_ADD %>" style="vertical-align:middle;" />
										</s:if>
										<s:property value="UI_NAME_ADD" />
										</span>
										<span class="_edit">
										
										<input type="button" class="layui-btn layui-btn-sm" value="<dict:lang value="新增配置" />" onclick="cfgAddUI(this,'<s:property value="ID" />','<s:property value="UI_COMP_ADD" />','<s:property value="paraMap.ID" />','<s:property value="TITLE_NAME.replaceAll(\"'\",\"\\\\\\\\'\")"/>');" />
									
										</span>
									</td>
									<td class="tdDefWidth6" style=" cursor: pointer;">
										<span class="_show" style="text-align: left;">
										<s:if test="null != UI_IMG_EDIT">
											<IMG src="${UI_IMG_PATH}/<s:property value="UI_IMG_EDIT" />?_mc_res_version=<%=PlfStaticRes.UI_IMG_EDIT %>" style="vertical-align:middle;" />
										</s:if>
										<s:property value="UI_NAME_EDIT" />
										</span>
										<span class="_edit">
										
										<input type="button" class="layui-btn layui-btn-sm" value="<dict:lang value="修改配置" />" onclick="cfgEditUI(this,'<s:property value="ID" />','<s:property value="UI_COMP_EDIT" />','<s:property value="paraMap.ID" />','<s:property value="TITLE_NAME.replaceAll(\"'\",\"\\\\\\\\'\")"/>');" />
									
										</span>
									</td>
										<td class="tdDefWidth2 mc-input">
											<span class="_show"><s:property value="UI_MAX_LEN" /></span>
											<span class="_edit"><input type="text"  class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].UI_MAX_LEN" value="<s:property value="UI_MAX_LEN" />" onblur="checkLenth('<c:out value='${formColLs.MODEL_LEN}'/>','<c:out value='${formColLs.UI_MAX_LEN}'/>',this)" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" /></span>
											<s:hidden value="MODEL_LEN" id="MODEL_LEN_${index.index}"/>
										</td>
									
									<td class="tdDefWidth mc-input">
										<span class="_show"><s:property value="UI_DEF_VAL" /></span>
										<span class="_edit"><input type="text"  class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].UI_DEF_VAL" value="<s:property value="UI_DEF_VAL" />" /></span>
									</td>
								</s:if>								
								<td class="tdDefWidth5 mc-input">
									<span class="_show"><s:property value="UI_STYLE" /></span>
									<span class="_edit"><input type="text"  class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].UI_STYLE" value="<s:property value="UI_STYLE" />" /></span>
								</td>
								<td class="tdDefWidth5 mc-input">
									<span class="_show"><s:property value="UI_CLASS" /></span>
									<span class="_edit"><input type="text"  class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].UI_CLASS" value="<s:property value="UI_CLASS" />" /></span>
								</td>
								<td class="tdDefWidth5 mc-input">
									<span class="_show"><s:property value="UI_FUN" /></span>
									<span class="_edit"><input type="text"  class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].UI_FUN" value="<s:property value="UI_FUN" />" /></span>
								</td>
								<td class="tdDefWidth">
									<span class="_show"><dict:viewDict dictCode="YESNO" dictValue="%{IS_SORT}" /></span>
									<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="YESNO" dictValue="%{IS_SORT}" name="paramList[%{#index.index}].IS_SORT" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>
								</td>
								<td class="tdDefWidth">
									<span class="_show"><dict:viewDict dictCode="SORT" dictValue="%{DEFAULT_SORT}" /></span>
									<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="SORT" dictValue="%{DEFAULT_SORT}" name="paramList[%{#index.index}].DEFAULT_SORT" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>
								</td>
								
								<td class=" tdDefWidth3 mc-input">
									<span class="_show"><s:property value="ORDER_BY_NUM" /></span>
									<span class="_edit">
									<input type="text"  class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].ORDER_BY_NUM"  
									value="<s:property value='ORDER_BY_NUM' />"   maxlength="3" 
									onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" /></span>									
								</td>
								
								<td class="tdDefWidth3 mc-input">
									<span class="_show"><s:property value="TD_WIDTH" /></span>
									<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].TD_WIDTH" value="<s:property value="TD_WIDTH" />" /></span>
								</td>
								<td class="tdDefWidth3 mc-input">
									<span class="_show"><s:property value="TD_HEIGHT" /></span>
									<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].TD_HEIGHT" value="<s:property value="TD_HEIGHT" />" /></span>
								</td>
								<td class="tdDefWidth6 mc-input">
									<span class="_show"><s:property value="TD_STYLE" /></span>
									<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].TD_STYLE" value="<s:property value="TD_STYLE" />" /></span>
								</td>
								<td class="tdDefWidth6 mc-input">
									<span class="_show"><s:property value="TD_CLASS" /></span>
									<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].TD_CLASS" value="<s:property value="TD_CLASS" />" /></span>
								</td>
								<td class="tdDefWidth6 mc-input">
									<span class="_show"><s:property value="TD_FUN" /></span>
									<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].TD_FUN" value="<s:property value="TD_FUN" />" /></span>
								</td>
								<td class="tdDefWidth3 mc-input">
									<span class="_show"><s:property value="COL_HEIGHT" /></span>
									<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].COL_HEIGHT" value="<s:property value="COL_HEIGHT" />" /></span>
								</td>
								<td class="tdDefWidth3 mc-input">
									<span class="_show"><s:property value="COL_WIDTH" /></span>
									<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].COL_WIDTH" value="<s:property value="COL_WIDTH" />" /></span>
								</td>
								<td class="tdDefWidth3 mc-input">
									<span class="_show"><s:property value="COL_STYLE" /></span>
									<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].COL_STYLE" value="<s:property value="COL_STYLE" />" /></span>
								</td>
								<td class="tdDefWidth3 mc-input">
									<span class="_show"><s:property value="COL_CLASS" /></span>
									<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].COL_CLASS" value="<s:property value="COL_CLASS" />" /></span>
								</td>
								<s:if test="\"0\" != ORM_TYPE">
									<td class="tdDefWidth3 mc-input">
										<span class="_show"><s:property value="COL_FUN" /></span>
										<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].COL_FUN" value="<s:property value="COL_FUN" />" /></span>
									</td>
									<td class="tdDefWidth3">
										<span class="_show"><dict:viewDict dictCode="YESNO" dictValue="%{VAL_NULL}" /></span>
										<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="YESNO" dictValue="%{VAL_NULL}" name="paramList[%{#index.index}].VAL_NULL" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>
									</td>
									<td class="_noedit tdDefWidth4">
										<span class="_edit ellipsis_span"><s:property value="VAL_JSFUN" /></span>
										<span class="_show"><textarea name="paramList[<s:property value="#index.index"/>].VAL_JSFUN" rows="2" title="<dict:lang value="双击弹出编辑窗口" />"
												style="width: 100%;" ondblclick="editJsValFun(this);"><s:property value="VAL_JSFUN" /></textarea></span>
									</td>
									<td  class="_noedit tdDefWidth5">
										<span class="_show" id="CLASS_NAME_TEXT_<s:property value="#index.index"/>"><s:property value="VAL_JAVAFUN" /></span>
									</td>
									<td  style="text-align: center;" class="cursor_hand tdDefWidth6">
										<span class="_show"><dict:lang value="源码" /></span>
										<span class="_edit">
										<input type="button" class="layui-btn layui-btn-sm" name="paramList[<s:property value="#index.index"/>].MS_CLASS_CODE_ID" 
											onclick="showEditCode('<s:property value="MS_CLASS_CODE_ID"/>','<s:property value="ID" />','CLASS_NAME_TEXT_<s:property value="#index.index"/>','MS_CLASS_CODE_ID','<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUN_REL_CODE_FORM_VAL"/>');" 
											  value="<dict:lang value="编辑" />" /></span>								
									</td>
									<td class=" tdDefWidth4">
										<span class="_show"><dict:viewDict dictCode="YESNO" dictValue="%{IS_CLEAR_FIELD}" /></span>
										<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="YESNO" dictValue="%{IS_CLEAR_FIELD}" name="paramList[%{#index.index}].IS_CLEAR_FIELD" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>									
									</td>
								<td class="tdDefWidth3">
									<span class="_show"><dict:viewDict dictCode="IS_LEFT" dictValue="%{IS_LEFT}" /></span>
									<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="IS_LEFT" dictValue="%{IS_LEFT}" name="paramList[%{#index.index}].IS_LEFT" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>
								</td>
								<td class=" tdDefWidth4">
									<span class="_show"><dict:viewDict dictCode="YESNO" dictValue="%{IS_BLANK}" /></span>
									<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="YESNO" dictValue="%{IS_BLANK}" name="paramList[%{#index.index}].IS_BLANK" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>									
								</td>
								<td class=" tdDefWidth4">
									<span class="_show"><dict:viewDict dictCode="IS_TITLE_ATTR" dictValue="%{IS_TITLE_ATTR}" /></span>
									<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="IS_TITLE_ATTR" dictValue="%{IS_TITLE_ATTR}" name="paramList[%{#index.index}].IS_TITLE_ATTR" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>
								</td>
								<td class=" tdDefWidth4 mc-input">
								  	<span class="_show"><s:property value="TITLE_ALIAS" /></span>
									<span class="_edit"><input type="text" class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].TITLE_ALIAS" value="<s:property value="TITLE_ALIAS" />" onkeyup="titlecheckLenth(this)"  /></span>
								
								</td>
								</s:if>
					 			<td class=" tdDefWidth3">
									<span class="_show"><dict:viewDict dictCode="YESNO" dictValue="%{IS_EXPORT}" /></span>
									<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="YESNO" dictValue="%{IS_EXPORT}" name="paramList[%{#index.index}].IS_EXPORT" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>									
								</td>
								<td class=" tdDefWidth3 mc-input">
									<span class="_show"><s:property value="EXPORT_SORT" /></span>
									<span class="_edit">
									<input type="text"  class="mc-list-input-edit" name="paramList[<s:property value="#index.index"/>].EXPORT_SORT"  
									value="<s:property value='EXPORT_SORT' />"   maxlength="3" 
									onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" /></span>									
								</td>
								
								<td class=" tdDefWidth3">
									<span class="_show"><dict:viewDict dictCode="YESNO" dictValue="%{IS_IMPORT_MOULD}" /></span>
									<span class="_edit"><dict:selectDict cssClass="mc-list-input-edit" dictCode="YESNO" dictValue="%{IS_IMPORT_MOULD}" name="paramList[%{#index.index}].IS_IMPORT_MOULD" custom_option="<option value=''>%{getText('--请选择--')}</option>" /></span>									
								</td>
								
							</tr>
						</s:iterator>
						</table>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			
			<div class="ptop_10 txac">	
					<input type="button" value="<dict:lang value="提交" />" onclick="add();" class="layui-btn">				
					<input type="reset" value="<dict:lang value="重置" />" onclick="reset();" class="layui-btn layui-btn-primary" />
					
					
			</div>
			
			</form>
			
		</div>
	</div>
  
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	 	inputFocus(); //执行input focus/blur
		var isSubmit = false;
		function reloadPg(msg){
			isSubmit = false;
			util.alert(msg,reloadPgExe);
		}
		function reloadPgExe(){
			window.location.href = "${path}sys/BussModelAction_showDataForm.ms?paraMap.ID=<s:property value="paraMap.ID" />&paraMap.scrollLeft="+$("#paraMap_scrollLeft").val()+"&paraMap.scrollTop="+$("#paraMap_scrollTop").val()+"&paraMap.curRow="+$("#paraMap_curRow").val();
		}
		
		function alertInfo(msg){
			isSubmit = false;
			util.alert(msg);
		}
		
		  function clearPop(thisObj,viewId,addId,editId){
			    var params = "";
			    var viewComponent = $(thisObj).parent("span").find("input[name='viewComponent']");
			    var addComponent = $(thisObj).parent("span").find("input[name='addComponent']");
			    var editComponent = $(thisObj).parent("span").find("input[name='editComponent']");
			    if(viewComponent.is(':checked')){
			      params+="paraMap.viewId="+viewComponent.val();
			    }
			    if(addComponent.is(':checked')){
			       if(params == "")
			           params+="paraMap.addId="+addComponent.val();
			        else
			           params+="&paraMap.addId="+addComponent.val();
			    }
			    if(editComponent.is(':checked')){
			        if(params == "")
			          params+="paraMap.editId="+editComponent.val();
			        else
			          params+="&paraMap.editId="+editComponent.val();
			    };
			    if(params == ""){
			      util.alert("请选中要清除的记录！");
			      return;
			    }
			      $.ajax({
		                type: "POST",
		                dataType: "json",
		                url: "${path}sys/BussModelAction_restoreComponent.ms",
		                data:params,
		                success: function(data){
		                  window.location.reload();
		                },
		                error: function(msg){
		                }
		            });
			     
			   }
		
		
		function add(){
			if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!valData()){
				return ;
			}
			document.forms.addForm.submit();
			isSubmit = true;
		}
	
		function reset() {
			document.forms.addForm.reset();
		}
		
		function cfgAddUI(thisObj,id,UI_COMP,FORM_ID,TITLE_NAME){
			cfgUI(thisObj,id,UI_COMP,FORM_ID,TITLE_NAME,"UI_COMP_ADD");
		}
		
		function cfgEditUI(thisObj,id,UI_COMP,FORM_ID,TITLE_NAME){
			cfgUI(thisObj,id,UI_COMP,FORM_ID,TITLE_NAME,"UI_COMP_EDIT");
		}
		
		function cfgViewUI(thisObj,id,UI_COMP,FORM_ID,TITLE_NAME){
			cfgUI(thisObj,id,UI_COMP,FORM_ID,TITLE_NAME,"UI_COMP_VIEW");
		}
		
		function cfgUI(thisObj,id,UI_COMP,FORM_ID,TITLE_NAME,UI_COMP__TYPE){//alert(UI_COMP);
			var mcIframeName = window.frameElement.name; //外层iframe的name
			var url = "${path}sys/BussModelAction_cfgUICompFrame.ms?paraMap.id="+id+"&paraMap.UI_COMP="+UI_COMP+"&paraMap.FORM_ID="+FORM_ID+"&paraMap.UI_COMP__TYPE="+UI_COMP__TYPE+"&mcIframeName="+mcIframeName;
			
			var UI_COMP__TYPENAME='';
			if(UI_COMP__TYPE=='UI_COMP_ADD'){
				UI_COMP__TYPENAME='新增';
			}
			if(UI_COMP__TYPE=='UI_COMP_EDIT'){
				UI_COMP__TYPENAME='修改';
			}
			if(UI_COMP__TYPE=='UI_COMP_VIEW'){
				UI_COMP__TYPENAME='查看';
			}
			
			showPopWin(url, 870, 500,null,TITLE_NAME+" "+UI_COMP__TYPENAME+"<dict:lang value="配置"/>");
			
		}

		function valData(){
		  var pass = true;
	   		$("._VAL_NULL").each(function(seq) {
		   	if(val.isBlank(this)){
		   		$(this).parent().parent().click();
		   		_alertValMsg(this,"<dict:lang value="字段说明" /> -- <dict:lang value="不能为空" />");
		   		pass = false;
		   		return false;
		   	}
	   	});
	    
			return pass;
		}
		
		var curJsFunObj;
		function getJsFunCode(){
			return curJsFunObj.value;
		}
		
		function setJsFunCode(code){
			curJsFunObj.value = code;
		}
		
		function setJsFunObjFoucue(){
			curJsFunObj.focus();
		}
	
		function titlecheckLenth(comp)
		{
			 if (comp.value.indexOf("'") != -1 || comp.value.indexOf("\"") != -1|| comp.value.indexOf("<") != -1|| comp.value.indexOf(">") != -1) 
	        {  
	            //comp.value = comp.value.substring(0, comp.value.length-1);  
	            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"");  
	            _alertValMsg($(comp),"<dict:lang value="不能输入单引号双引号<>" />");
	        } 
			if($(comp).val().length>10)
			{
			 util.alert("<dict:lang value="输入的字符长度超过最大字符长度，请重新输入" />");
			}
	
			
		}
		function checkLenth(obj1,obj2,obj3){//obj1 持久模型长度，obj2 用户设置长度，obj3用户输入长度
			if(val.isBlank(obj3)){
				return;
			}
			if(!val.isBlank(obj1)){
				if(parseInt(obj1)<parseInt(obj3.value)){
					if(val.isBlank(obj2)){
						obj3.value=obj1;
					}
					if(!val.isBlank(obj2)){
						obj3.value=obj2;
					}
					util.alert("<dict:lang value="输入的字符长度超过持久模型最大字符长度，请重新输入" />");
				}
			}
		}
		function editJsValFun(thisObj){
			curJsFunObj = thisObj;
			oldStop=document.documentElement.scrollTop;
			oldSleft=document.documentElement.scrollLeft;
			window.scrollTo(0,0);
			var mcIframeName = window.frameElement.name; //外层iframe的name
			var url = "${path}sys/BussModelAction_forEditJsValFun.ms?mcIframeName="+mcIframeName;
			showPopWin(url, '99%', '99%',resetScrollPos,"<dict:lang value="有效性验证JS方法"/> <dict:lang value="配置"/>");
		}
		
		var oldStop=document.documentElement.scrollTop;
		var oldSleft=document.documentElement.scrollLeft;
		function closePopWin(){
			hidePopWin(false);
			resetScrollPos();
		}
		function resetScrollPos(){
			hidePopWin(false);
			window.scrollTo(oldSleft,oldStop);
		}
	
		function showEditCode(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
			var mcIframeName = window.frameElement.name; //外层iframe的name
			var tableName = "<s:property value="%{@com.more.fw.core.bd.model.TableName@MS_FORM_COL_MODEL}"/>";
			var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
					+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID+"&paraMap.tableName="
					+tableName+"&paraMap.colName="+colName+"&paraMap.tpl=dataValible"+"&mcIframeName="+mcIframeName+"&paraMap.toFlag=dataform";
			showPopWin(url, '99%', '99%',null,"<dict:lang value="类源码"/> <dict:lang value="修改"/>");
			//window.open(url);
		}
		
		function updateCLASS_NAME_TEXT(id,txt){
			//$("#"+id).html(txt);
			window.location.href = "${path}sys/BussModelAction_showDataForm.ms?paraMap.MID=<s:property value="paraMap.MID" />&paraMap.ID=<s:property value="paraMap.ID" />";
		}
	
		function init(){
			var tableTrJq = $("#editTable").find("tbody tr");
			//_toClickColor(tableTrJq);
			_tongLineColor(tableTrJq);
		}

		$(function(){
			scrollLeftInit();
			util.setEditTable("left_data_table");
			util.setEditTable("editTable");
			$("#editTable").find("tr").each(function(i1) {//设置左边的行高与数据区的行高一样
				$("#left_data_td_"+ (i1+1)).css("line-height",$(this).find("td").eq(0).css("height"));
			});
			
			var vpHeight = $(window).height()-142;
			var dataHeight = parseInt($("#editTable").css("height"));
			if(dataHeight < vpHeight){
				$("#t_r_content").height(dataHeight+18);
				$("#cl_freeze").height(dataHeight+1);
			}else{
				$("#t_r_content").height(vpHeight+17);
				$("#cl_freeze").height(vpHeight);
			}
			
			$(".trLeftColor,.trRightColor").click(function(){
				var className = $(this).attr("class");
				var abbr = $(this).attr("abbr");
				$(".trLeftColor,.trRightColor").css("background-color","");
				$("tr[abbr='"+abbr+"']").css("background-color","#9DD2F9");
				$("#paraMap_curRow").val(abbr);
			});
			
			var curRow ="<c:out value='${paraMap.curRow}' />";
			$("tr[abbr='"+curRow+"']").css("background-color","#9DD2F9");
		});
		
		function scrollLeftInit(){
			$("#t_r_content").scrollLeft($("#paraMap_scrollLeft").val());
			$("#t_r_content").scrollTop($("#paraMap_scrollTop").val());
		}
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
