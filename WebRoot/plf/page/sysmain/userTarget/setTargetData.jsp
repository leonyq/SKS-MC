<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
		<title><dict:lang value="个人工作平台" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	</jsp:include>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	<style type="text/css">
	body{
		background-color:#fff;
		padding-top:8px;
		overflow:hidden;
	}
	
	.mod .mod-in {
	    height: 162px;
	    border:1px solid;
	    border-color: #f1f1f1;
	    cursor: pointer;
	    background-color:#f9f9f9;
	}
	table {
		border-collapse: collapse;
		border:0px solid #cbe9ff;
	}
	table td{
		border-top:0;
		border-right: 1px solid #eaeaea;
		border-bottom: 1px solid #eaeaea;
    	width: 50%;
    	height: 32px;
    	text-align: center;
	}
	table tr.lastrow td{
		border-bottom:0;
	}
	table tr td.lastcol{
		border-right:0;
	}
	</style>
	</head>
  
 <body>
  <div class="content-in">
   <div class=" pn1-small">
   	<ul class="banner">
 	<s:iterator value="fiveShowDataList" status="st" id="index">
	 	 			<li class="item item${st.index+1}">
	                  	<div onclick="gotoSetTargetData('${st.index+1}','<c:out value="${index.id}"/>')" style="cursor: pointer;" title="单击配置用户指标">
	            			<s:hidden name="%{#st.index+1}" id="SHOWORDER_${st.index+1}"></s:hidden>
	                  		<img src="${path}plf/userPhoto/<c:out value='${index.picName}'/>?_mc_res_version=<%=PlfStaticRes.INDEX_PICNAME%>" width="40" height="40" alt="" />
		                  	<p><c:out value='${index.targetName}'/>(<c:out value='${index.unit}'/>)</p>
	                  	</div>
	                  </li>
 	</s:iterator>
    </ul>
    </div>
      <div class="pn2-small" >
    <s:iterator value="fourShowKeyDataList" status="st" id="index">     		
          	
             <s:if test="#st.count==1">
              <div class="mod mod1" onclick="gotoSetKeyData('${st.index+1}','<c:out value="${index.id}"/>')">
               </s:if>
                <s:if test="#st.count==2">
              <div class="mod mod2" onclick="gotoSetKeyData('${st.index+1}','<c:out value="${index.id}"/>')">
               </s:if>
                <s:if test="#st.count==3">
              <div class="mod mod3" onclick="gotoSetKeyData('${st.index+1}','<c:out value="${index.id}"/>')">
               </s:if>
                <s:if test="#st.count==4">
              <div class="mod mod4" onclick="gotoSetKeyData('${st.index+1}','<c:out value="${index.id}"/>')">
               </s:if>
                <div class="mod-in">
                	<table class="keyList">
                	<tbody>
                	<tr>
                		<td style="text-align: right"><span style="margin-right: 10px;"><dict:lang value="关键数据名称"/></span></td>
                		<td style="text-align: left" class="lastcol"><span style="margin-left: 10px;color:#75c4ff;display:inline-block;width:100px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;vertical-align: bottom;"><c:out value='${index.keyName}' /><br></span></td>
                	</tr>
                	<tr>
                		<td style="text-align: right"><span style="margin-right: 10px;"><dict:lang value="关联菜单名称"/></span></td>
                		<td style="text-align: left" class="lastcol"><span style="margin-left: 10px;color:#75c4ff;display:inline-block;width:100px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;vertical-align: bottom;"><c:out value='${index.menuName}'/><br></span></td>
                	</tr>
                	<tr>
	                	<td style="text-align: right"><span style="margin-right: 10px;"><dict:lang value="显示行数"/></span></td>
	                	<td style="text-align: left" class="lastcol"><span style="margin-left: 10px;color:#75c4ff;display:inline-block;width:100px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;vertical-align: bottom;"><c:out value='${index.showNumber}'/><br></span></td>
                	</tr>
                	<tr>
                		<td style="text-align: right"><span style="margin-right: 10px;"><dict:lang value="展示类型"/></span></td>
                		<td style="text-align: left" class="lastcol"><span style="margin-left: 10px;color:#75c4ff;display:inline-block;width:100px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;vertical-align: bottom;"><dict:viewDict  dictCode="AD_SHOW_TYPE" dictValue="%{showType}" /><br></span></td>
                	</tr>
                	<tr class="lastrow">
	                	<td style="text-align: right"><span style="margin-right: 10px;"><dict:lang value="类别"/></span></td>
	                	<td style="text-align: left" class="lastcol"><span style="margin-left: 10px;color:#75c4ff;display:inline-block;width:100px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;vertical-align: bottom;"><dict:viewDict dictCode="TARGET_TYPE" dictValue="%{type}"/><br></span></div></td>
                	</tr>
                	</tbody>
                	</table>
                </div>
                </div>
            </s:iterator>
            </div>
             </div>
    
	<script type="text/javascript">
		function gotoSetTargetData(obj,id){
			showPopWinFp("${path}sys/UserTargetDataAction_goToSetUserData.ms?showOrder="+obj+"&paraMap.targetId="+id, 800, 600,null,''+"<dict:lang value="KPI指标" />","adminTargetDataIframe");
		}
		function gotoSetKeyData(obj,id){
			showPopWinFp("${path}sys/UsKeyDataAction_goToSetUserKeyData.ms?showOrder="+obj+"&paraMap.keyId="+id, 800, 600,null,''+"<dict:lang value="关键数据" />","adminTargetDataIframe");
		}
	</script>
    <!-- <div id="cls"></div>-->
	</body>
	
</html>
