<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="持久化模型" /><dict:lang value="查看" /></title>
		
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
		</jsp:include>
		
	</head>
<body>
	<div class="all">
	<table class="add_table">
      <tr>
				<td  class="tr1 title"><dict:lang value="持久模型名称" /></td>
				<td class="widget" style="width:270px;height:38px;"><s:property value="dataMap.ORM_NAME"/></td>
				
				<td>&nbsp;</td>
				
				<td  class="tr1 title"><dict:lang value="持久模型表名" /></td>
				<td class="widget"" style="width:270px;height:38px;"><s:property value="dataMap.TABLE_NAME"/></td>
      </tr>
     </table>
     <div style="height: 15px;"></div>
     		<div style="margin-left:15px;margin-right:15px;">
			<table id="editTable" class="table_list" <%if(request.getHeader("User-agent").indexOf("Firefox")>-1){%>style="table-layout:fixed;" <%} %> >
				<thead>
					<tr>
						<th style="width:40px;"><dict:lang value="序号" /></th>
						<th ><dict:lang value="字段名称" /></th>
						<th ><dict:lang value="字段说明" /></th>
						<th ><dict:lang value="字段类型" /></th>
						<th ><dict:lang value="字段长度" /></th>
						<th ><dict:lang value="字段用途" /></th>
						<th ><dict:lang value="允许空" /></th>
						<th ><dict:lang value="默认值" /></th>
					</tr>
				</thead>
				<tbody>
				<s:iterator value="listData" status="index">
					<s:if test="%{@com.more.fw.core.common.method.ConstantsMc@MS_ORM_MODEL_COL_TYPE_0 == TYPE}">
						<s:set name="isSys" value="11" />
						<s:set name="disabledStr" value="disabled='disabled'" />
					</s:if>
					<s:else>
						<s:set name="isSys" value="" />
						<s:set name="disabledStr" value="" />
					</s:else>
					<tr>
						<td><s:property value="#index.count"/></td>
						<td><s:property value="COL_NO"/></td>
						<td><s:property value="COL_NAME"/></td>
						<td><dict:viewDict dictCode="COL_TYPE" dictValue="%{COL_TYPE}"/></td>
						<td><s:property value="LEN"/></td>
						<td><dict:viewDict dictCode="COL_SCENE" dictValue="%{COL_SCENE}"/></td>
						<td><dict:viewDict dictCode="YESNO" dictValue="%{IS_NULL}"/></td>
						<td><s:property value="DEF_VAL"/></td>
					</tr>
				</s:iterator>
				</tbody>
			</table>
			</div>
   </div>
   <div class="ptop_10 txac" >
   		<s:if test="${viewtype}">
   			
		</s:if>
		<s:else>
			<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn">
			<input type="button" value="<dict:lang value="索引" />" onclick="addIndex();" class="layui-btn">
						
		</s:else>

	</div>

<script type="text/javascript">
	
	var editTable = $('#editTable');

	function init(){
		var tableTrJs = editTable.find("tbody tr");
		row_count = tableTrJs.length;
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}

</script>

<script type="text/javascript">	
//持久模型中增加建索引功能 begin
	function addIndex() {
		var orm_id='<s:property value="paraMap.ORMID"/>';
	    //alert(orm_id);
	    var mcIframeName = window.frameElement.name; //外层iframe的name
		var url = "${path}sys/BussModelAction_toAddIndex.ms?orm_id="+orm_id+"&paraMap.mcIframeName="+mcIframeName;
		showPopWin(url, "950", "600",null,"<dict:lang value="索引"/> <dict:lang value="查看"/>");
	      
	}
	
  
//持久模型中增加建索引功能 end

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
	<jsp:param name="needValidate" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>