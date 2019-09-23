<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title>预警列表</title>
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
		 
		 #alarmViem .layui-tab-item{
		 	padding-top:20px;
		 }
		 
		 #alarmViem .searchItem{
		 	width: 50%;
		 }
		 
		 #alarmViem .search_l{
		 	width:120px;
		 }
		 
		 #alarmViem .search_r{
	 	    width: calc(100% - 150px);
		 }
		 
		 #alarmViem .layui-form-select{
		 	width: 100%;
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
                    <div class="search_l"><dict:lang value="组织机构"/></div>
                    <div class="search_r">
                        <select>
                        	<option>中国摩尔</option>
                        	<option>美国摩尔</option>
                        </select>
                    </div>
                </div>
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="预警项目"/></div>
                    <div class="search_r">
                        <input type="text" maxlength="30"  class="layui-input">
                    </div>
                </div>
            </div>
        </form>
        <div class="cardPane open">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>品质预警（4）</legend>
                <div class="more">
                    <div class="moreBtn showBtn"><span class="moreIco"></span></div>
                </div>
            </fieldset>
            <div class="layui-row cards3">
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/pzAlarmIco.png">
                    <p class="p1">预警1</p>
                    <p class="p2">ALM0312001</p>
                    <div class="hoverBtn">
                    	<span class="icon edit"></span>
                    	<span class="icon play"></span>
                    	<span class="icon view"></span>
                    </div>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/pzAlarmIco.png">
                    <p class="p1">预警1</p>
                    <p class="p2">ALM0312001</p>
                    <div class="hoverBtn">
                    	<span class="icon edit"></span>
                    	<span class="icon pause"></span>
                    	<span class="icon view"></span>
                    </div>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/pzAlarmIco.png">
                    <p class="p1">预警1</p>
                    <p class="p2">ALM0312001</p>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/pzAlarmIco.png">
                    <p class="p1">预警1</p>
                    <p class="p2">ALM0312001</p>
                </div>
            </div>
        </div>
        <div class="cardPane open">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>生产预警（4）</legend>
                <div class="more">
                    <div class="moreBtn showBtn"><span class="moreIco"></span></div>
                </div>
            </fieldset>
            <div class="layui-row cards3">
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/scAlarmIco.png">
                    <p class="p1">预警1</p>
                    <p class="p2">ALM0312001</p>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/scAlarmIco.png">
                    <p class="p1">预警1</p>
                    <p class="p2">ALM0312001</p>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/scAlarmIco.png">
                    <p class="p1">预警1</p>
                    <p class="p2">ALM0312001</p>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/scAlarmIco.png">
                    <p class="p1">预警1</p>
                    <p class="p2">ALM0312001</p>
                </div>
            </div>
        </div>
        <div class="cardPane open">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>工艺预警（1）</legend>
                <div class="more">
                    <div class="moreBtn showBtn"><span class="moreIco"></span></div>
                </div>
            </fieldset>
            <div class="layui-row cards3">
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/gyAlarmIco.png">
                    <p class="p1">预警1</p>
                    <p class="p2">ALM0312001</p>
                </div>
            </div>
        </div>
        <div class="cardPane open">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>仓库预警（2）</legend>
                <div class="more">
                    <div class="moreBtn showBtn"><span class="moreIco"></span></div>
                </div>
            </fieldset>
            <div class="layui-row cards3">
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/ckAlarmIco.png">
                    <p class="p1">预警1</p>
                    <p class="p2">ALM0312001</p>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/ckAlarmIco.png">
                    <p class="p1">预警1</p>
                    <p class="p2">ALM0312001</p>
                </div>
            </div>
        </div>
    </div>
    
    <div class="layui-form" id="alarmViem" style="height:100%;display:none;">
 		<div class="layui-tab layui-tab-brief" lay-filter="tab">
            <ul class="layui-tab-title">
                <li class="layui-this">基本信息</li>
                <li>数据源</li>
                <li>交互模板</li>
                <li>配置信息</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item baseMsg layui-show">
                	<div class="layui-row">
		                <div class="searchItem">
		                    <div class="search_l"><dict:lang value="预警名称"/></div>
		                    <div class="search_r">
		                        <input type="text" maxlength="30" disabled="" class="layui-input">
		                    </div>
		                </div>
		                <div class="searchItem">
		                    <div class="search_l"><dict:lang value="预警类型"/></div>
		                    <div class="search_r">
		                        <select disabled="">
							        <option value=""></option>
							        <option value="0">胡建摩尔</option>
							    </select>
		                    </div>
		                </div>
		                <div class="searchItem">
		                    <div class="search_l"><dict:lang value="处理方式"/></div>
		                    <div class="search_r">
		                       	<select disabled="">
							        <option value=""></option>
							        <option value="0">胡建摩尔</option>
							    </select>
		                    </div>
		                </div>
		                <div class="searchItem">
		                    <div class="search_l"><dict:lang value="执行计划"/></div>
		                    <div class="search_r">
		                       	<select disabled="">
							        <option value=""></option>
							        <option value="0">胡建摩尔</option>
							    </select>
		                    </div>
		                </div>
		                <div class="searchItem">
		                    <div class="search_l"><dict:lang value="触发模式"/></div>
		                    <div class="search_r">
		                        <select disabled="">
							        <option value=""></option>
							        <option value="0">胡建摩尔</option>
							    </select>
		                    </div>
		                </div>
		                <div class="searchItem">
		                    <div class="search_l"><dict:lang value="事件触发"/></div>
		                    <div class="search_r">
							    <input type="text" maxlength="30" disabled="" class="layui-input">
		                    </div>
		                </div>
		                <div class="searchItem" style="width:100%">
		                    <div class="search_l"><dict:lang value="服务地址"/></div>
		                    <div class="search_r">
							    <select disabled="">
							        <option value=""></option>
							        <option value="0">胡建摩尔</option>
							    </select>
		                    </div>
		                </div>
		                <div class="searchItem" style="width:100%">
		                    <div class="search_l"><dict:lang value="备注"/></div>
		                    <div class="search_r">
		                        <textarea placeholder="请输入内容" disabled="" class="layui-textarea"></textarea>
		                    </div>
		                </div>
		            </div>
                </div>
                <div class="layui-tab-item">
                	<div class="layui-row">
		                <div class="searchItem">
		                    <div class="search_l"><dict:lang value="数据源类型"/></div>
		                    <div class="search_r">
		                        <select disabled="">
							        <option value=""></option>
							        <option value="0">胡建摩尔</option>
							    </select>
		                    </div>
		                </div>
		                <div class="searchItem" style="width:100%">
		                    <div class="search_l"><dict:lang value="数据源内容"/></div>
		                    <div class="search_r">
		                        <textarea placeholder="请输入内容" class="layui-textarea" disabled="" style="height:200px;"></textarea>
		                    </div>
		                </div>
		            </div>
                </div>
                <div class="layui-tab-item" style="padding-top:0px;">
                	<div class="interaction" style="min-width:0;min-height:0;">
                		<div class="interactionWay">
                			<div class="Subtitle">
		                        <h3>交互方式</h3>
		                    </div>
		                    <div class="interactionWayList">
		                    	<ul>
		                    		<li class="current">微信</li>
		                    		<li>钉钉</li>
		                    		<li>邮件</li>
		                    		<li>短信</li>
		                    		<li>系统消息</li>
		                    		<li>APP消息</li>
		                    	</ul>
		                    </div>
                		</div>
                		<div class="interactionTemplate">
                			<form class="layui-form searchDiv" id="searchForm" action="">
					            <div class="layui-row">
					           
					                <div class="searchItem" style="width:100%;">
					                    <div class="search_l"><dict:lang value="模板内容"/></div>
					                    <div class="search_r">
					                        <textarea placeholder="请输入内容" class="layui-textarea" disabled="" style="height:180px;"></textarea>
					                    </div>
					                </div>
					                
					                <div class="searchItem" style="width:100%;">
					                    <div class="search_l"><dict:lang value="模板说明"/></div>
					                    <div class="search_r">
					                       	<div class="templateExplain" style="height:210px;">          		
                            					<p>1)要求'$参数名#' 必须在项目模板的查询结果列中。</p>
                            					<p>如：'$参数1#'产生预警，请及时处理。</p>
												<br>
												<p>2)区别于短信、微信，邮件需要使用循环体格式。</p>
												<p>循环体格式为：&lt;loop&gt;您要的预警内容&lt;/loop&gt;</p>
												<p>如：摩尔软件提示：&lt;loop&gt;'$参数1#'产生预警，请及时处理&lt;/loop&gt;</p>
												<br>
												<p>3)纯文字描述。</p>
												<p>如： “预警项目A到达一级预警，请处理”</p>
					                       	</div>
					                    </div>
					                </div>
					                
					            </div>
					        </form>
                		</div>
                	</div>
                </div>
                <div class="layui-tab-item" style="padding-top:0px;">
                	<div class="hierarchyPane open">
                		<fieldset class="layui-elem-field layui-field-title">
			                <legend>第一层级</legend>
			                <div class="more">
			                    <div class="moreBtn showBtn"><span class="moreIco"></span></div>
			                </div>
			            </fieldset>
			            <div class="detail">
                        	<div class="Subtitle">
		                        <h3>基本设置</h3>
		                    </div>
                            <form class="layui-form searchDiv">
					            <div class="layui-row">
					                <div class="searchItem">
					                    <div class="search_l"><dict:lang value="超时推送模式"/></div>
					                    <div class="search_r">
					                        <select disabled="">
					                        	<option value=""></option>
					                        	<option value="">震动模式</option>
					                        	<option value="">飞机模式</option>
					                        </select>
					                    </div>
					                </div>
					                <div class="searchItem">
					                    <div class="search_l"><dict:lang value="超时次数"/></div>
					                    <div class="search_r">
					                        <input type="text"  maxlength="30" class="layui-input"  disabled="">
					                    </div>
					                </div>
					            </div>
					        </form>
                            <div class="Subtitle">
		                        <h3>预警条件</h3>
		                    </div>
		                    <div class="layui-form">
                                <table class="layui-table">
                                    <colgroup>
                                    	<col>
                                        <col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>参数</th>
                                            <th>值</th>
                                        </tr> 
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><span>你好世界</span></td>
                                            <td><span>123456</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
		                    <div class="Subtitle">
		                        <h3>预警对象</h3>
		                    </div>
                            <div class="layui-form">
                                <table class="layui-table alarmObj">
                                    <colgroup>
                                        <col width="100">
                                        <col width="100">
                                        <col width="80">
                                        <col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>对象类型</th>
                                            <th>编码</th>
                                            <th>值</th>
                                            <th>交互方式</th>
                                        </tr> 
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>员工</td>
                                            <td>007</td>
                                            <td>张三</td>
                                            <td>微信 | 钉钉</td>
                                        </tr>
                                        <tr>
                                            <td>员工</td>
                                            <td>007</td>
                                            <td>张三</td>
                                            <td>微信</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div id="alarmObjPage2"></div>
                            </div>
		                    <div class="Subtitle" style="margin-bottom:0;">
		                        <h3>超时设置</h3>
		                    </div>
		                    <div class="layui-form">
		                    	<div class="layui-row">
	                                <div class="overTimeLeft">
	                                	<div class="Subtitle">
					                        <h3>超时设置</h3>
					                    </div>
					                    <div class="layui-form">
			                                <table class="layui-table">
			                                    <colgroup>
			                                    	<col width="60">
			                                    	<col>
			                                    </colgroup>
			                                    <thead>
			                                        <tr>
			                                            <th>序号</th>
			                                            <th>时间（秒）</th>
			                                        </tr> 
			                                    </thead>
			                                    <tbody>
			                                        <tr>
			                                            <td>1</td>
			                                            <td>60</td>
			                                        </tr>
			                                        <tr>
			                                            <td>2</td>
			                                            <td>120</td>
			                                        </tr>
			                                    </tbody>
			                                </table>
			                            </div>
	                                </div>
	                                <div class="overTimeRight">
	                                	<div class="Subtitle">
					                        <h3>超时对象</h3>
					                    </div>
					                    <div class="layui-form" lay-filter="overTimeObj">
			                                <table class="layui-table">
			                                    <colgroup>
			                                        <col width="100">
			                                        <col width="100">
			                                        <col width="80">
			                                        <col>
			                                    </colgroup>
			                                    <thead>
			                                        <tr>
			                                            <th>对象类型</th>
			                                            <th>编码</th>
			                                            <th>值</th>
			                                            <th></th>
			                                        </tr> 
			                                    </thead>
			                                    <tbody>
			                                        <tr>
			                                            <td>员工</td>
			                                            <td>007</td>
			                                            <td>张三</td>
			                                            <td>微信 | 钉钉 | 邮件 | 短信 | 系统消息</td>
			                                        </tr>
			                                    </tbody>
			                                </table>
			                                <div id="overTimeObjPage2"></div>
			                            </div>
	                                </div>
                            	</div>
                            </div>
                        </div>
                	</div>
                	<div class="hierarchyPane open">
                		<fieldset class="layui-elem-field layui-field-title">
			                <legend>第二层级</legend>
			                <div class="more">
			                    <div class="moreBtn showBtn"><span class="moreIco"></span></div>
			                </div>
			            </fieldset>
			            <div class="detail">
                        	<div class="Subtitle">
		                        <h3>基本设置</h3>
		                    </div>
                            <form class="layui-form searchDiv">
					            <div class="layui-row">
					                <div class="searchItem">
					                    <div class="search_l"><dict:lang value="超时推送模式"/></div>
					                    <div class="search_r">
					                        <select disabled="">
					                        	<option value=""></option>
					                        	<option value="">震动模式</option>
					                        	<option value="">飞机模式</option>
					                        </select>
					                    </div>
					                </div>
					                <div class="searchItem">
					                    <div class="search_l"><dict:lang value="超时次数"/></div>
					                    <div class="search_r">
					                        <input type="text"  maxlength="30" class="layui-input"  disabled="">
					                    </div>
					                </div>
					            </div>
					        </form>
                            <div class="Subtitle">
		                        <h3>预警条件</h3>
		                    </div>
		                    <div class="layui-form">
                                <table class="layui-table">
                                    <colgroup>
                                    	<col>
                                        <col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>参数</th>
                                            <th>值</th>
                                        </tr> 
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><span>你好世界</span></td>
                                            <td><span>123456</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
		                    <div class="Subtitle">
		                        <h3>预警对象</h3>
		                    </div>
                            <div class="layui-form">
                                <table class="layui-table alarmObj">
                                    <colgroup>
                                        <col width="100">
                                        <col width="100">
                                        <col width="80">
                                        <col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>对象类型</th>
                                            <th>编码</th>
                                            <th>值</th>
                                            <th>交互方式</th>
                                        </tr> 
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>员工</td>
                                            <td>007</td>
                                            <td>张三</td>
                                            <td>微信 | 钉钉</td>
                                        </tr>
                                        <tr>
                                            <td>员工</td>
                                            <td>007</td>
                                            <td>张三</td>
                                            <td>微信</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div id="alarmObjPage2"></div>
                            </div>
		                    <div class="Subtitle" style="margin-bottom:0;">
		                        <h3>超时设置</h3>
		                    </div>
		                    <div class="layui-form">
		                    	<div class="layui-row">
	                                <div class="overTimeLeft">
	                                	<div class="Subtitle">
					                        <h3>超时设置</h3>
					                    </div>
					                    <div class="layui-form">
			                                <table class="layui-table">
			                                    <colgroup>
			                                    	<col width="60">
			                                    	<col>
			                                    </colgroup>
			                                    <thead>
			                                        <tr>
			                                            <th>序号</th>
			                                            <th>时间（秒）</th>
			                                        </tr> 
			                                    </thead>
			                                    <tbody>
			                                        <tr>
			                                            <td>1</td>
			                                            <td>60</td>
			                                        </tr>
			                                        <tr>
			                                            <td>2</td>
			                                            <td>120</td>
			                                        </tr>
			                                    </tbody>
			                                </table>
			                            </div>
	                                </div>
	                                <div class="overTimeRight">
	                                	<div class="Subtitle">
					                        <h3>超时对象</h3>
					                    </div>
					                    <div class="layui-form" lay-filter="overTimeObj">
			                                <table class="layui-table">
			                                    <colgroup>
			                                        <col width="100">
			                                        <col width="100">
			                                        <col width="80">
			                                        <col>
			                                    </colgroup>
			                                    <thead>
			                                        <tr>
			                                            <th>对象类型</th>
			                                            <th>编码</th>
			                                            <th>值</th>
			                                            <th></th>
			                                        </tr> 
			                                    </thead>
			                                    <tbody>
			                                        <tr>
			                                            <td>员工</td>
			                                            <td>007</td>
			                                            <td>张三</td>
			                                            <td>微信 | 钉钉 | 邮件 | 短信 | 系统消息</td>
			                                        </tr>
			                                    </tbody>
			                                </table>
			                                <div id="overTimeObjPage2"></div>
			                            </div>
	                                </div>
                            	</div>
                            </div>
                        </div>
                	</div>
                	
                </div>
            </div>
        </div>
        
    </div>
<script>
	layui.use(['element','form','layer'], function(){
        var element = layui.element;
        var form = layui.form;
        var layer = layui.layer;
        
        $('.cards3 .item').on('click','.view',function(){
        	layer.open({
                title: '预警项目详情',
                skin: 'layui-layer-molv',
                area: ['820px','600px'],
                type: 1, 
                id: 'layerDemo', //防止重复弹出
                content: $('#alarmViem'),
                shade: 0.3 
            });
        })
	
	});
	
	$('.searchSwitch').click(function(){
        $('.layui-fluid').toggleClass('switch');
    });
	
	$('.showBtn').click(function(){
        if($(this).parents('.cardPane').hasClass('open')){
            $(this).parents('.cardPane').removeClass('open')
        }else{
            $(this).parents('.cardPane').addClass('open')
        }
    })
    
    $('.cards3 .item').click(function(){
    	$('.cards3 .item').removeClass('active')
        $(this).addClass('active')
    })
    
    //交互模板选择
    $(document).on('click','.interactionWayList li',function(){
    	$(this).addClass('current').siblings().removeClass('current')
    	
    	//右边对应改变操作
    })
    
    //配置信息展开收起
   	$(document).on('click','.showBtn',function(){
        if($(this).parents('.hierarchyPane').hasClass('open')){
            $(this).parents('.hierarchyPane').removeClass('open')
        }else{
            $(this).parents('.hierarchyPane').addClass('open')
        }
    })
</script>
</body>
</html>