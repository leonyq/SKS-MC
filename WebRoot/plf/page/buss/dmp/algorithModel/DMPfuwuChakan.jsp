<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title>DMP服务新增</title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head_layui.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="dmp" value="1" />
	</jsp:include>
 <style type="text/css">
 	.headline{
 		margin-bottom: 0;
 	}
 </style>
</head>

<body>
    <div class="layui-fluid" style="padding-bottom:78px;overflow: auto;">
        <div class="headline">查看</div>
       	<div class="Subtitle">
            <h3>服务</h3>
        </div>
        <form class="layui-form searchDiv searchDivBig" action="">
	        <div class="layui-row">
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="组织机构"/></div>
	                <div class="search_r">
	                    <select disabled="">
					        <option value=""></option>
					        <option value="0" selected="">胡建摩尔</option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="服务ID"/></div>
	                <div class="search_r">
	                    <input type="text"  maxlength="30" class="layui-input" value="123" disabled="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="服务说明"/></div>
	                <div class="search_r">
	                   	<input type="text" maxlength="30" class="layui-input" disabled="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="MC地址"/></div>
	                <div class="search_r">
	                   	<input type="text" maxlength="30" class="layui-input" disabled="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="语种"/></div>
	                <div class="search_r">
	                   	<select disabled="">
					        <option value=""></option>
					        <option value="0">汪</option>
					        <option value="1" selected="">喵</option>
					        <option value="2">鱼人语</option>
					        <option value="3">人类通用语</option>
					    </select>
	                </div>
	            </div>
	        </div>
	    </form>
        <div class="Subtitle">
            <h3>性能&属性</h3>
        </div>
        <form class="layui-form searchDiv searchDivSmall" action="">
	        <div class="layui-row">
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="内部处理器数量"/></div>
	                <div class="search_r">
	                    <input type="text" maxlength="30" class="layui-input" disabled="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="接口请求超时时间(ms)"/></div>
	                <div class="search_r">
	                    <input type="text"  maxlength="30"  class="layui-input" disabled="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="线程池最小容量"/></div>
	                <div class="search_r">
	                   	<input type="text" maxlength="30" class="layui-input" disabled="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="线程池最大容量"/></div>
	                <div class="search_r">
	                   	<input type="text" maxlength="30" class="layui-input" disabled="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="组件通道最大值"/></div>
	                <div class="search_r">
	                   	<input type="text" maxlength="30" class="layui-input" disabled="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="指令是否走缓存数据"/></div>
	                <div class="search_r">
	                    <select disabled="">
					        <option value=""></option>
					        <option value="0">胡建摩尔</option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="指令模式"/></div>
	                <div class="search_r">
	                   	<input type="text" maxlength="30" class="layui-input" disabled="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="监控器池执行频率(ms)"/></div>
	                <div class="search_r">
	                   	<input type="text" maxlength="30" class="layui-input" disabled="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="是否记录日志"/></div>
	                <div class="search_r">
	                   	<select disabled="">
					        <option value=""></option>
					        <option value="0">胡建摩尔</option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="掉线最大检测次数"/></div>
	                <div class="search_r">
	                    <input type="text"  maxlength="30"  class="layui-input" disabled="">
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="Http接口最大请求数"/></div>
	                <div class="search_r">
	                   	<select disabled="">
					        <option value=""></option>
					        <option value="0">胡建摩尔</option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="PDA接口连入方式"/></div>
	                <div class="search_r">
	                   	<select disabled="">
					        <option value=""></option>
					        <option value="0">胡建摩尔</option>
					    </select>
	                </div>
	            </div>
	            <div class="searchItem">
	                <div class="search_l"><dict:lang value="运行日志保留天数"/></div>
	                  <div class="search_r">
	                     	<input type="text" maxlength="30" class="layui-input" disabled="">
	                  </div>
	              </div>
	          </div>
	      </form>
          <div class="Subtitle">
              <h3>设置IP池</h3>
          </div>
          <div class="layui-form" lay-filter="ipTable">
			  <table class="layui-table ipTable">
			    <colgroup>
			      <col width="40">
			      <col>
			    </colgroup>
			    <thead>
			      <tr>
			        <th><input type="checkbox" lay-skin="primary" lay-filter="selectAll" disabled=""></th>
			        <th>起始IP</th>
			        <th>结束IP</th>
			      </tr> 
			    </thead>
			    <tbody>
			      <tr>
			        <td><input type="checkbox" lay-skin="primary" disabled=""></td>
			        <td><span>190.160.9.1</span></td>
			        <td><span>190.160.9.221</span></td>
			      </tr>
			    </tbody>
			  </table>
		  </div>
          <div class="ptop_10">
          	  <button class="layui-btn">新增</button>
	          <button class="layui-btn">编辑</button>   
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