<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title>计划列表</title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head_layui.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="alarm" value="1" />
	</jsp:include>
	<style type="text/css">
		 .layui-form-select{
		 		width: 220px;
		 }
		 
		 .cards3{
		 		margin:0 -8px;
		 }
	</style>
</head>

<body>
    
    <div class="layui-fluid switch" style="overflow:auto;">
        <div class="listOperate">
            <div class="searchSwitch"></div>
            <div class="operates">
                <ul class="layui-nav">
                    <li class="layui-nav-item">
                        <a href="javascript:;"><dict:lang value="操作"/></a>
                        <dl class="layui-nav-child">
                            <dd><dict:lang value="新增"/></dd>
                            <dd><dict:lang value="修改"/></dd>
                            <dd><dict:lang value="查看"/></dd>
                            <dd><dict:lang value="删除"/></dd>
                        </dl>
                    </li>
                </ul>
                <span class="ico search"></span>
                <span class="ico list icolist"></span>
                <span class="ico card icocard"></span>
            </div>
        </div>
        <form class="layui-form searchDiv" id="searchForm" action="">
            <div class="layui-row">
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="计划代码"/></div>
                    <div class="search_r">
                        <input type="text" maxlength="30"  class="layui-input">
                    </div>
                </div>
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="计划名称"/></div>
                    <div class="search_r">
                        <input type="text" maxlength="30"  class="layui-input">
                    </div>
                </div>
            </div>
        </form>
        <div class="cardPane open">
            <div class="layui-row cards3">
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/gyAlarmIco.png">
                    <p class="p3">执行计划一</p>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/gyAlarmIco.png">
                    <p class="p3">执行计划二</p>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/gyAlarmIco.png">
                    <p class="p3">执行计划三</p>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/gyAlarmIco.png">
                    <p class="p3">执行计划二</p>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/gyAlarmIco.png">
                    <p class="p3">执行计划三</p>
                </div>
            </div>
        </div>
    </div>
<script>
	layui.use(['element','form','laypage'], function(){
        var element = layui.element;
        var form = layui.form;
        
	
	});
	
	$('.searchSwitch').click(function(){
        $('.layui-fluid').toggleClass('switch');
    });
    
    $('.cards3 .item').click(function(){
    	$('.cards3 .item').removeClass('active')
        $(this).addClass('active')
    })
</script>
</body>
</html>