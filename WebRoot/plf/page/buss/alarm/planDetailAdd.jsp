<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title>计划明细新增</title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head_layui.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="alarm" value="1" />
	</jsp:include>
 <style type="text/css">
 	.headline{
 		margin-bottom: 0;
 	}
 	
 	.layui-form-select{
		width: 240px;
	}
	
	.searchItem{
		width:365px;
	}
	
	.search_l{
		width:125px;
	}
	
	.searchItem .search_r{
		width: calc(100% - 125px);
	}
	
 </style>
</head>

<body>
    <div class="layui-fluid" style="padding-bottom:140px;overflow: auto;">
        <div class="headline">计划明细-新增</div>
       	<div class="Subtitle">
            <h3>基础信息</h3>
        </div>
        <form class="layui-form searchDiv" action="">
	        <div class="layui-row">
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="计划编码"/></div>
	                <div class="search_r">
	                    <input type="text"  maxlength="30" class="layui-input" value="123">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="计划名称"/></div>
	                <div class="search_r">
	                    <input type="text"  maxlength="30" class="layui-input" value="一二三">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="计划类型"/></div>
	                <div class="search_r">
	                   	<select>
					        <option value=""></option>
					        <option value="0">A计划</option>
					        <option value="1" selected="">B计划</option>
					        <option value="2">C计划</option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem" style="width:100%;">
	                <div class="search_l"><dict:lang value="备注"/></div>
	                <div class="search_r">
	                   	<textarea placeholder="请输入内容" class="layui-textarea" style="height:70px;"></textarea>
	                </div>
	            </div>
	        </div>
	    </form>
        <div class="Subtitle">
            <h3>明细信息</h3>
        </div>
        <form class="layui-form searchDiv" action="">
	        <div class="layui-row">
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="年份"/></div>
	                <div class="search_r">
	                    <select>
					        <option value=""></option>
					        <option value="0">9120</option>
					        <option value="1" selected="">8120</option>
					        <option value="2">2017</option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="月份"/></div>
	                <div class="search_r">
	                    <select>
					        <option value=""></option>
					        <option value="0">腊月</option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="时间点"/></div>
	                <div class="search_r">
	                   	<select>
					        <option value=""></option>
					        <option value="0">起点</option>
					        <option value="0">终点</option>
					    </select>
	                </div>
	            </div>
	        </div>
	        <div class="planPane layui-row">
	        	<div class="planPane_l">周</div>
	        	<div class="planPane_r">
	        		<input type="checkbox" lay-skin="primary" title="星期一">
	        		<input type="checkbox" lay-skin="primary" title="星期二">
	        		<input type="checkbox" lay-skin="primary" title="星期三">
	        		<input type="checkbox" lay-skin="primary" title="星期四">
	        		<input type="checkbox" lay-skin="primary" title="星期五">
	        		<input type="checkbox" lay-skin="primary" title="星期六">
	        		<input type="checkbox" lay-skin="primary" title="星期日">
	        	</div>
	        </div>  
	        <div class="planPane layui-row">
	        	<div class="planPane_l">天</div>
	        	<div class="planPane_r">
	        		<input type="checkbox" lay-skin="primary" title="1">
	        		<input type="checkbox" lay-skin="primary" title="2">
	        		<input type="checkbox" lay-skin="primary" title="3">
	        		<input type="checkbox" lay-skin="primary" title="4">
	        		<input type="checkbox" lay-skin="primary" title="5">
	        		<input type="checkbox" lay-skin="primary" title="6">
	        		<input type="checkbox" lay-skin="primary" title="7">
	        		<input type="checkbox" lay-skin="primary" title="8">
	        		<input type="checkbox" lay-skin="primary" title="9">
	        		<input type="checkbox" lay-skin="primary" title="10">
	        		<input type="checkbox" lay-skin="primary" title="11">
	        		<input type="checkbox" lay-skin="primary" title="12">
	        		<input type="checkbox" lay-skin="primary" title="13">
	        		<input type="checkbox" lay-skin="primary" title="14">
	        		<input type="checkbox" lay-skin="primary" title="15">
	        		<input type="checkbox" lay-skin="primary" title="16">
	        		<input type="checkbox" lay-skin="primary" title="17">
	        		<input type="checkbox" lay-skin="primary" title="18">
	        		<input type="checkbox" lay-skin="primary" title="19">
	        		<input type="checkbox" lay-skin="primary" title="20">
	        		<input type="checkbox" lay-skin="primary" title="21">
	        		<input type="checkbox" lay-skin="primary" title="22">
	        		<input type="checkbox" lay-skin="primary" title="23">
	        		<input type="checkbox" lay-skin="primary" title="24">
	        		<input type="checkbox" lay-skin="primary" title="25">
	        		<input type="checkbox" lay-skin="primary" title="26">
	        		<input type="checkbox" lay-skin="primary" title="27">
	        		<input type="checkbox" lay-skin="primary" title="28">
	        		<input type="checkbox" lay-skin="primary" title="29">
	        		<input type="checkbox" lay-skin="primary" title="30">
	        		<input type="checkbox" lay-skin="primary" title="31">
	        		<input type="checkbox" lay-skin="primary" title="最后一天">
	        	</div>
	        </div>  
	      </form>
          <div class="ptop_10">
	          <button class="layui-btn">保存</button>   
	          <button class="layui-btn layui-btn-danger">取消</button>   
	      </div> 
    </div>
    
<script type="text/javascript" src="${path}plf/page/bussmodel/dmp/js/echarts.js"></script>
<script>
	layui.use(['element','form'], function(){
        var element = layui.element
        var form = layui.form	
    });
    
    
</script>	


</body>
</html>