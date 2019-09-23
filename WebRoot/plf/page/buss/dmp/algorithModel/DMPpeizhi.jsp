<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title>算法模型信息列表</title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head_layui.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="dmp" value="1" />
	</jsp:include>
 <style type="text/css">
 	.headline{
        margin-bottom: 10px;
        line-height:50px
    }

    .layui-tab{
        padding-top: 0;
        height: calc(100% - 46px);
    }
  
    .layui-tab-title{
        margin: 0;
    }

    .layui-tab-item{
        padding: 0;
    }
    
  	.cards2{
    	margin: 0;
    }
    
    .cards2 .item{
    	width: 240px;
    }
    
    .layui-layer-content .layui-form{
    	margin-top: 20px;
    	margin-left:20px;
    	margin-right:20px;
    }
</style>
</head>

<body>
    <div class="layui-fluid">
        <div class="headline"><span class="link">DPM服务</span> / DMP001-DMP程序性能测试服务</div>
        <div class="layui-tab layui-tab-brief" lay-filter="tab">
            <ul class="layui-tab-title">
                <li class="layui-this"><span class="icon performance"></span>运行性能</li>
                <li><span class="icon equipment"></span>设备信息</li>
                <li><span class="icon set"></span>查看配置</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <div class="charts">
                    	<div class="chartsBox">
	                        <div class="chart chart1">
	                        	<div class="chartBox">
	                        		<div class="chartLeft">
	                        			<div class="chartMain" id="chart1"></div>
	                        			<div class="legend"><span class="color"></span>系统</div>
	                        		</div>
	                        		<div class="chartRight">
	                        			<div class="chartMain" id="chart2"></div>
	                        			<div class="legend"><span class="color"></span>JVM</div>
	                        		</div>
	                        	</div>
	                        	<div class="tit">系统/JVM CPU使用情况</div>
	                        </div>
	                        <div class="chart chart2">
	                        	<div class="chartBox">
	                        		<div class="chartLeft">
	                        			<div class="chartMain" id="chart3"></div>
	                        			<div class="legend"><span class="color"></span>系统</div>
	                        		</div>
	                        		<div class="chartRight">
	                        			<div class="chartMain" id="chart4"></div>
	                        			<div class="legend"><span class="color"></span>JVM</div>
	                        		</div>
	                        	</div>
	                        	<div class="tit">系统/JVM 内存使用情况</div>
	                        </div>
	                        <div class="data">
	                        	<div class="tit">线程使用情况</div>
	                        	<div class="item"><span class="name">session(个)</span><span class="num">5</span></div>
	                        	<div class="item"><span class="name">线程(个)</span><span class="num">556</span></div>
	                        	<div class="item"><span class="name">GC时间(ms)</span><span class="num">0</span></div>
	                        </div>
                        </div>
                    </div>

                    <div class="Subtitle">
                        <h3>任务性能记录</h3>
                    </div>
                    <form class="layui-form">
                    	<div class="searchBox">
                    		<div class="item">
                    			<span class="tit">进入时间</span>
                    			<input type="text" id="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">&nbsp;&nbsp;—&nbsp;&nbsp;
                    			<input type="text" id="date1" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                    		</div>
                    		<div class="item">
                    			<span class="tit">任务名称</span>
                    			<input type="text" class="layui-input">
                    		</div>
	                    	<div class="operates">
				                <span class="ico search"></span>
				                <span class="ico export"></span>
				            </div>
			            </div>
                    </form>
                    <div class="tableDiv">
                    	<table id="dmpList"></table>
                    </div>
                    <div class="leftTable">
                    	<div class="Subtitle">
	                       	<h3>算法模型执行记录</h3>
	                    </div>
	                    <div class="tableDiv">
	                    	<table id="dmpList1"></table>
	                    </div>
                    </div>	
                    <div class="rightTable">
                    	<div class="Subtitle">
	                        <h3>算法模型参数记录</h3>
	                    </div>
	                    <div class="tableDiv">
	                    	<table id="dmpList2"></table>
	                    </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                	<div class="equipmentList">
                		<div class="cardPane open">
				            <fieldset class="layui-elem-field layui-field-title">
				                <legend>车间(33)</legend>
				                <div class="more">
				                    <div class="moreBtn showBtn">
				                        <span class="moreIco"></span>
				                    </div>
				                </div>
				            </fieldset>
				            <div class="layui-row cards2">
				                <div class="item active">
				                    <div class="p1">DMP程序性能测试服务</div>
				                    <div class="p2">DMP001</div>
				                    <div class="operates">
				                        <span class="ico timeLog" onclick="showLog()"></span>
				                        <span class="ico searchLog"></span>
				                    </div>
				                </div>
				                <div class="item">
				                    <div class="p1">P_SMT_CHECK_TIN_STATUS</div>
				                    <div class="p2">SMT校验辅料品质状态SMT校验辅料品校SMT校验</div>
				                    <div class="operates">
				                        <span class="ico timeLog"></span>
				                        <span class="ico searchLog"></span>
				                    </div>
				                </div>
				                <div class="item">
				                    <div class="p1">P_SMT_CHECK_TIN_STATUS</div>
				                    <div class="p2">SMT校验辅料品质状态SMT校验辅料品校SMT校验</div>
				                    <div class="operates">
				                        <span class="ico timeLog"></span>
				                        <span class="ico searchLog"></span>
				                    </div>
				                </div>
				                <div class="childCards">
				                	<div class="cardPane open">
							            <fieldset class="layui-elem-field layui-field-title">
							                <legend>线体(33)</legend>
							                <div class="more">
							                    <div class="moreBtn showBtn">
							                        <span class="moreIco"></span>
							                    </div>
							                </div>
							            </fieldset>
							            <div class="layui-row cards2">
							                <div class="item">
							                    <div class="p1">DMP程序性能测试服务</div>
							                    <div class="p2">DMP001</div>
							                    <div class="operates">
							                        <span class="ico timeLog"></span>
							                        <span class="ico searchLog"></span>
							                    </div>
							                </div>
							                <div class="item">
							                    <div class="p1">P_SMT_CHECK_TIN_STATUS</div>
							                    <div class="p2">SMT校验辅料品质状态SMT校验辅料品校SMT校验</div>
							                    <div class="operates">
							                        <span class="ico timeLog"></span>
							                        <span class="ico searchLog"></span>
							                    </div>
							                </div>
						                </div>
					                </div>
				                </div>
				            </div>
				        </div>
                	</div>
                	<div class="equipmentLog">
                		<div class="logHead"><span class="play"></span><span>A车间1线鹿后站</span><span class="sub">190.160.9.112</span><span class="toClose" onclick="hideLog()"></span></div>
                		<div class="logBody">
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                			<p>[2019-03-11 18:10:00.556]R:INIT</p>
                			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>
                		</div>
                	</div>
                </div>
                <div class="layui-tab-item" style="padding-bottom:78px;">
                	<div class="Subtitle">
                        <h3>服务</h3>
                    </div>
                    <form class="layui-form searchDiv searchDivBig" action="">
			            <div class="layui-row">
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="组织机构"/></div>
			                    <div class="search_r">
			                        <select>
								        <option value=""></option>
								        <option value="0">胡建摩尔</option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="服务ID"/></div>
			                    <div class="search_r">
			                        <input type="text"  maxlength="30"  class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="服务说明"/></div>
			                    <div class="search_r">
			                       	<input type="text" maxlength="30" class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="MC地址"/></div>
			                    <div class="search_r">
			                       	<input type="text" maxlength="30" class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="语种"/></div>
			                    <div class="search_r">
			                       	<select>
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
			                        <input type="text" maxlength="30" class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="接口请求超时时间(ms)"/></div>
			                    <div class="search_r">
			                        <input type="text"  maxlength="30"  class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="线程池最小容量"/></div>
			                    <div class="search_r">
			                       	<input type="text" maxlength="30" class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="线程池最大容量"/></div>
			                    <div class="search_r">
			                       	<input type="text" maxlength="30" class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="组件通道最大值"/></div>
			                    <div class="search_r">
			                       	<input type="text" maxlength="30" class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="指令是否走缓存数据"/></div>
			                    <div class="search_r">
			                        <select>
								        <option value=""></option>
								        <option value="0">胡建摩尔</option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="指令模式"/></div>
			                    <div class="search_r">
			                       	<input type="text" maxlength="30" class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="监控器池执行频率(ms)"/></div>
			                    <div class="search_r">
			                       	<input type="text" maxlength="30" class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="是否记录日志"/></div>
			                    <div class="search_r">
			                       	<select>
								        <option value=""></option>
								        <option value="0">胡建摩尔</option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="掉线最大检测次数"/></div>
			                    <div class="search_r">
			                        <input type="text"  maxlength="30"  class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="Http接口最大请求数"/></div>
			                    <div class="search_r">
			                       	<select>
								        <option value=""></option>
								        <option value="0">胡建摩尔</option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="PDA接口连入方式"/></div>
			                    <div class="search_r">
			                       	<select>
								        <option value=""></option>
								        <option value="0">胡建摩尔</option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="运行日志保留天数"/></div>
			                    <div class="search_r">
			                       	<input type="text" maxlength="30" class="layui-input">
			                    </div>
			                </div>
			            </div>
			        </form>
                    <div class="Subtitle">
                        <h3>设置IP池</h3>
                        <div class="operates">
	                        <span class="ico add" id="addRow"></span>
	                        <span class="ico del" id="delRow"></span>
	                    </div>
                    </div>
                    <div class="layui-form" lay-filter="ipTable">
					  <table class="layui-table ipTable">
					    <colgroup>
					      <col width="40">
					      <col>
					    </colgroup>
					    <thead>
					      <tr>
					        <th><input type="checkbox" lay-skin="primary" lay-filter="selectAll"></th>
					        <th>起始IP</th>
					        <th>结束IP</th>
					      </tr> 
					    </thead>
					    <tbody>
					      <tr>
					        <td><input type="checkbox" lay-skin="primary"></td>
					        <td><input type="text" class="layui-input" value="190.160.9.1"></td>
					        <td><input type="text" class="layui-input" value="190.160.9.255"></td>
					      </tr>
					    </tbody>
					  </table>
					</div>
                    <div class="ptop_10">
			            <button class="layui-btn">保存并下发</button>   
			            <button class="layui-btn layui-btn-danger">停止服务</button>   
			        </div> 
                </div>
            </div>
        </div>    
    </div>
    
<script type="text/javascript" src="${path}plf/page/bussmodel/dmp/js/echarts.js"></script>
<script>
	layui.use(['element','form','laydate','table','layer'], function(){
        var element = layui.element;
        var laydate = layui.laydate;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        
        laydate.render({
		    elem: '#date'
	  	});
	  	
	  	laydate.render({
	    	elem: '#date1'
	  	});
		  
		var table1 = table.render({
		    id:'dmpList',
		    elem: '#dmpList',
		    url: '${path}dmp/DmpAction_fetchAlgorithModelList.ms', //数据接口
		    page: true, //开启分页
		    method: 'post',
		    height: 316,
		    limits:[10,20,50,100],
		    where:{"FUNC_CODE":"F_b12dbdfb400742e18c2bc59671ce99e0"},
		    parseData: function(res){ //res 即为原始返回的数据
		        return {
		          "code": res.ajaxMap.state, //解析接口状态
		          "msg": '', //解析提示文本
		          "count": res.ajaxMap.count, //解析数据长度
		          "data": res.ajaxMap.item //解析数据列表
		        };
		      },
		    request: {
		        pageName: 'page.currentPage', //页码的参数名称，默认：page
		        limitName: 'page.pageRecord' //每页数据量的参数名，默认：limit
		      },
		    cols: [[ //表头
		       {checkbox: true,fixed:'left'},
		       {field: 'WPL_CODE', title: '算法模型代码', sort: true, width: 200},
		       {field: 'WPL_NAME', title: '算法模型说明', sort: true, width: 200},
		       {field: 'WPL_TYPE', title: '算法模型类型', sort: true}
		    ]],
		    done: function(res, curr, count){
		    	currPage = curr;
		    }
		});
		
		var table2 = table.render({
		    id:'dmpList1',
		    elem: '#dmpList1',
		    url: '${path}dmp/DmpAction_fetchAlgorithModelList.ms', //数据接口
		    page: true, //开启分页
		    method: 'post',
		    height: 277,
		    limits:[10,20,50,100],
		    where:{"FUNC_CODE":"F_b12dbdfb400742e18c2bc59671ce99e0"},
		    parseData: function(res){ //res 即为原始返回的数据
		        return {
		          "code": res.ajaxMap.state, //解析接口状态
		          "msg": '', //解析提示文本
		          "count": res.ajaxMap.count, //解析数据长度
		          "data": res.ajaxMap.item //解析数据列表
		        };
		      },
		    request: {
		        pageName: 'page.currentPage', //页码的参数名称，默认：page
		        limitName: 'page.pageRecord' //每页数据量的参数名，默认：limit
		      },
		    cols: [[ //表头
		       {checkbox: true,fixed:'left'},
		       {field: 'WPL_CODE', title: '算法模型代码', sort: true},
		       {field: 'WPL_NAME', title: '算法模型说明', sort: true},
		       {field: 'WPL_TYPE', title: '算法模型类型', sort: true}
		    ]],
		    done: function(res, curr, count){
		    	currPage = curr;
		    }
		});
		
		var table3 = table.render({
		    id:'dmpList2',
		    elem: '#dmpList2',
		    url: '${path}dmp/DmpAction_fetchAlgorithModelList.ms', //数据接口
		    page: true, //开启分页
		    method: 'post',
		    height: 277,
		    limits:[10,20,50,100],
		    where:{"FUNC_CODE":"F_b12dbdfb400742e18c2bc59671ce99e0"},
		    parseData: function(res){ //res 即为原始返回的数据
		        return {
		          "code": res.ajaxMap.state, //解析接口状态
		          "msg": '', //解析提示文本
		          "count": res.ajaxMap.count, //解析数据长度
		          "data": res.ajaxMap.item //解析数据列表
		        };
		      },
		    request: {
		        pageName: 'page.currentPage', //页码的参数名称，默认：page
		        limitName: 'page.pageRecord' //每页数据量的参数名，默认：limit
		      },
		    cols: [[ //表头
		       {checkbox: true,fixed:'left'},
		       {field: 'WPL_CODE', title: '算法模型代码', sort: true},
		       {field: 'WPL_NAME', title: '算法模型说明', sort: true},
		       {field: 'WPL_TYPE', title: '算法模型类型', sort: true}
		    ]],
		    done: function(res, curr, count){
		    	currPage = curr;
		    }
		});
		
		//当标签切换到第一页时重新渲染table
		element.on('tab(tab)', function(data){
		    if(data.index == 0){
		    	table1.reload()
		    	table2.reload()
		    	table3.reload()
		    }
		});
		
		var str = '<form class="layui-form">\
                        <div class="searchBox">\
                    		<div class="item">\
                    			<span class="tit">进入时间</span>\
                    			<input type="text" id="date2" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">&nbsp;&nbsp;—&nbsp;&nbsp;\
                    			<input type="text" id="date3" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">\
                    		</div>\
	                    	<div class="operates">\
				                <span class="ico search"></span>\
				                <span class="ico export"></span>\
				            </div>\
			            </div>\
                    </form>\
                    <div class="searchLogBody">\
                    	<p>[2019-03-11 18:10:00.556]R:INIT</p>\
               			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>\
               			<p>[2019-03-11 18:10:00.556]R:INIT</p>\
               			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>\
               			<p>[2019-03-11 18:10:00.556]R:INIT</p>\
               			<p>[2019-03-11 18:10:00.556]W:INIT 提示:工作中心初始化指令 OK 输入:输入工作中心?</p>\
               			<p>[2019-03-11 18:10:00.556]R:INIT</p>\
                    </div>'
        $('.cards2').on('click','.searchLog', function(){
            layer.open({
                title: '查询日志',
                skin: 'layui-layer-molv',
                area: ['650px','600px'],
                type: 1, 
                id: 'layerDemo', //防止重复弹出
                content: str,
                shade: 0.3 
            });
            laydate.render({
			    elem: '#date2'
		  	});
		  	
		  	laydate.render({
		    	elem: '#date3'
		  	});
        })
        
        //点击行选中
        /* $('.ipTable').on('click','tbody tr',function(){
        	if($(this).find('input[type="checkbox"]').is(":checked")){
        		$(this).find('input[type="checkbox"]').prop('checked',false)
        	}else{
        		$(this).find('input[type="checkbox"]').prop('checked',true)
        	}
        	form.render('checkbox', 'ipTable') 
        })
        
        //点击复选框本身，阻止冒泡
        $('.ipTable').on("click", ".layui-form-checkbox", function (e) {
	        return false
    	}); */
    	
	    //删除行
	    $('#delRow').click(function(){
	    	$('.ipTable tbody input[type="checkbox"]:checked').parents('tr').remove()
	    })
	    
	    //添加行
	    $('#addRow').click(function(){
	    	$('.ipTable tbody').append('<tr><td><input type="checkbox" lay-skin="primary"></td><td><input type="text" class="layui-input"></td><td><input type="text" class="layui-input"></td></tr>')
	    	form.render('checkbox', 'ipTable') 
	    	$(".layui-tab-item.layui-show").scrollTop($(".layui-tab-item.layui-show")[0].scrollHeight); //滚动到最底
	    })
	    
	    //是否取消全选
	    form.on('checkbox(selectAll)', function(data){
            if(data.elem.checked){
                $('.ipTable').find('input[type="checkbox"]').prop("checked",true)
            }else{
                $('.ipTable').find('input[type="checkbox"]').prop("checked",false)
            }
            form.render('checkbox', 'ipTable') 
        }); 
	});
	    
	      
    $(document).on("click", ".layui-table-body table.layui-table tbody tr", function (e) {
        if ($(e.target).hasClass("layui-table-col-special") || $(e.target).parent().hasClass("layui-table-col-special")) {
            return false;
        }
        var index = $(this).attr('data-index'), tableBox = $(this).closest('.layui-table-box'),
            tableFixed = tableBox.find(".layui-table-fixed.layui-table-fixed-l"),
            tableBody = tableBox.find(".layui-table-body.layui-table-main"),
            tableDiv = tableFixed.length ? tableFixed : tableBody,
            checkCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.laytable-cell-checkbox div.layui-form-checkbox i"),
            radioCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.laytable-cell-radio div.layui-form-radio i");
        if (checkCell.length) {
            checkCell.click();
        }
        if (radioCell.length) {
            radioCell.click();
        }
    });
    
    $(document).on("click", "td div.laytable-cell-checkbox div.layui-form-checkbox,td div.laytable-cell-radio div.layui-form-radio", function (e) {
        return false
    });
    
    
	$('.showBtn').click(function(){
        if($(this).closest('.cardPane').hasClass('open')){
            $(this).closest('.cardPane').removeClass('open')
        }else{
            $(this).closest('.cardPane').addClass('open')
        }
    })
    
    $('.cards2 .item').click(function(){
    	$('.cards2 .item').removeClass('active')
        $(this).addClass('active')
    });
    
    //展示右侧日志
    function showLog(){
    	$('.equipmentList').parents('.layui-tab-item').addClass('showLog')
    	$(".logBody").scrollTop($(".logBody")[0].scrollHeight); //滚到最底
    }
    
    //展示右侧日志
    function hideLog(){
    	$('.equipmentList').parents('.layui-tab-item').removeClass('showLog')
    }
</script>	
<script>//echart相关
        var option = {
			series : [ {
				radius : '100%',
				splitNumber : 10, //每段的多少个
				type : 'gauge',
				detail : {
					show:false
				},
				axisLine : { //刻度区域样式
					lineStyle : {
						color: [[0.2, '#32c4c1'],[0.8, '#52b3fc'],[1, '#da7f80']],
						width : 10
					}
				},
				splitLine : { //大刻度线样式
					length : 10,
					lineStyle: {
						width: 1,
						color: '#fff'
					}
				},
				axisTick : { //小刻度线样式
					splitNumber : 1, 
					lineStyle : {
						color : '#fff',
					}
				},
				axisLabel : {//刻度值
					show : true,
					distance : 2,
					textStyle: {
	  	            	fontSize: 10
	  	            }
				},
				pointer : {
					width : 3,
				},
				itemStyle : {
					color:['#198F77']
				},
				data : [ {
					value : 45,
				}]
			} ]
        }
        
        var option1 = {
			series : [ {
				radius : '100%',
				splitNumber : 10, //每段的多少个
				type : 'gauge',
				detail : {
					show:false
				},
				axisLine : { //刻度区域样式
					lineStyle : {
						color: [[0.2, '#32c4c1'],[0.8, '#52b3fc'],[1, '#da7f80']],
						width : 10
					}
				},
				splitLine : { //大刻度线样式
					length : 10,
					lineStyle: {
						width: 1,
						color: '#fff'
					}
				},
				axisTick : { //小刻度线样式
					splitNumber : 1, 
					lineStyle : {
						color : '#fff',
					}
				},
				axisLabel : {//刻度值
					show : true,
					distance : 2,
					textStyle: {
	  	            	fontSize: 10
	  	            }
				},
				pointer : {
					width : 3,
				},
				itemStyle : {
					color:['#3B9CE5']
				},
				data : [ {
					value : 30,
				}]
			} ]
        };
    	
    	var option2 = {
    		tooltip:{
    			show:false
    		},
	        color: ["#1c9179", "#e6e6e6"],
	        graphic:[{
	            type:'text',
	            left:'center',
	            top:'33%',
	            style:{
	                text:'5607.4G',
	                textAlign:'center',
	                fill:'#1C9179',
	                fontSize: 18,
	            }
	        },{
			    type: 'rect',
			    shape: {
			        x: 20,
			        y: 70,
			        width: 100,
			        height: 1
			    },
			    style:{
	                fill:'#c8c8c8',
	            }
			},{
	            type:'text',
	            left:'center',
	            top:'55%',
	            style:{
	                text:'5607.4G',
	                textAlign:'center',
	                fill:'#e6e6e6',
	                fontSize: 18,
	            }
	        }],
		    series: [
		        {
		            type:'pie',
		            radius: ['90%', '100%'],
		            hoverAnimation: false,
		            avoidLabelOverlap: false,
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:[
		                {value:335},
		                {value:310}
		            ]
		        }
		    ]
	    };
	    
	    var option3 = {
	    	tooltip:{
    			show:false
    		},
	        color: ["#3B9CE5", "#e6e6e6"],
	        graphic:[{
	            type:'text',
	            left:'center',
	            top:'33%',
	            style:{
	                text:'5607.4G',
	                textAlign:'center',
	                fill:'#3B9CE5',
	                fontSize: 18,
	            }
	        },{
			    type: 'rect',
			    shape: {
			        x: 20,
			        y: 70,
			        width: 100,
			        height: 1
			    },
			    style:{
	                fill:'#c8c8c8',
	            }
			},{
	            type:'text',
	            left:'center',
	            top:'55%',
	            style:{
	                text:'5607.4G',
	                textAlign:'center',
	                fill:'#e6e6e6',
	                fontSize: 18,
	            }
	        }],
		    series: [
		        {
		            type:'pie',
		            radius: ['90%', '100%'],
		            hoverAnimation: false,
		            avoidLabelOverlap: false,
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:[
		                {value:335},//当前
		                {value:500}//剩余
		            ]
		        }
		    ]
	    };
    	
        echarts.init(document.getElementById('chart1')).setOption(option)
        echarts.init(document.getElementById('chart2')).setOption(option1)
        echarts.init(document.getElementById('chart3')).setOption(option2)
        echarts.init(document.getElementById('chart4')).setOption(option3)
</script>	

</body>
</html>