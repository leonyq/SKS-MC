<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title>预警编辑</title>
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
		 
		 .baseMsg .searchItem{
		 	width: 33.3%;
		 }
		 
		 .baseMsg .search_l{
		 	width:120px;
		 }
		 
		 .baseMsg .search_r{
	 	    width: calc(100% - 150px);
		 }
		 
		 .baseMsg .layui-form-select{
		 	width: 100%;
		 }
		 
		 .addDiv{
		 	padding:0 20px;
		 	padding-bottom:79px;
	 		height:100%;
	 		overflow:auto;
	 		box-sizing:border-box;
		 }
	</style>
</head>

<body>
    <div class="layui-fluid" style="padding:0;padding-bottom: 68px;">
        <div class="layui-tab layui-tab-brief" lay-filter="tab">
            <ul class="layui-tab-title">
                <li class="layui-this">基本信息</li>
                <li>数据源</li>
                <li>预警配置</li>
                <li>交互模板</li>
                <li>配置信息</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item baseMsg layui-show">
                	<form class="layui-form searchDiv">
			            <div class="layui-row">
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="预警名称"/></div>
			                    <div class="search_r">
			                        <input type="text" maxlength="30" class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="预警类型"/></div>
			                    <div class="search_r">
			                        <select>
								        <option value=""></option>
								        <option value="0">胡建摩尔</option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="处理方式"/></div>
			                    <div class="search_r">
			                       	<select>
								        <option value=""></option>
								        <option value="0">胡建摩尔</option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="执行计划"/></div>
			                    <div class="search_r">
			                       	<select>
								        <option value=""></option>
								        <option value="0">胡建摩尔</option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="触发模式"/></div>
			                    <div class="search_r">
			                        <select>
								        <option value=""></option>
								        <option value="0">胡建摩尔</option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="事件触发"/></div>
			                    <div class="search_r">
								    <input type="text" maxlength="30" class="layui-input">
			                    </div>
			                </div>
			                <div class="searchItem" style="width:100%">
			                    <div class="search_l"><dict:lang value="备注"/></div>
			                    <div class="search_r">
			                        <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
			                    </div>
			                </div>
			            </div>
			        </form>
                </div>
                <div class="layui-tab-item">
                	<form class="layui-form searchDiv">
			            <div class="layui-row">
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="数据源类型"/></div>
			                    <div class="search_r">
			                        <select>
								        <option value=""></option>
								        <option value="0">胡建摩尔</option>
								    </select>
			                    </div>
			                </div>
			                <button class="layui-btn" style="margin-left:20px;">解析</button>   
			                <div class="searchItem" style="width:100%">
			                    <div class="search_l"><dict:lang value="数据源内容"/></div>
			                    <div class="search_r">
			                        <textarea placeholder="请输入内容" class="layui-textarea" style="height:200px;"></textarea>
			                    </div>
			                </div>
			            </div>
			        </form>
                </div>
                <div class="layui-tab-item">
                    <div class="earlyWarningConfig">
                        <div class="hierarchy">
                        	<div class="Subtitle" style="margin-bottom:10px;">
		                        <h3>预警层级</h3>
		                        <div class="operates">
			                        <span class="ico add" id="hierarchyAddRow"></span>
			                        <span class="ico del" id="hierarchyDelRow"></span>
			                    </div>
		                    </div>
		                    <div class="hierarchyList">
		                    	<ul></ul>
		                    </div>	
                        </div>
                        <div class="detail">
                        	<div class="Subtitle">
		                        <h3>基本设置</h3>
		                    </div>
                            <form class="layui-form searchDiv">
					            <div class="layui-row">
					                <div class="searchItem">
					                    <div class="search_l"><dict:lang value="超时推送模式"/></div>
					                    <div class="search_r">
					                        <select>
					                        	<option value=""></option>
					                        	<option value="">震动模式</option>
					                        	<option value="">飞机模式</option>
					                        </select>
					                    </div>
					                </div>
					                <div class="searchItem">
					                    <div class="search_l"><dict:lang value="超时次数"/></div>
					                    <div class="search_r">
					                        <input type="text"  maxlength="30"  class="layui-input">
					                    </div>
					                </div>
					            </div>
					        </form>
                            <div class="Subtitle">
		                        <h3>预警条件</h3>
		                        <div class="operates">
			                        <span class="ico add" id="alarmConditionAddRow"></span>
			                        <span class="ico del" id="alarmConditionDelRow"></span>
			                    </div>
		                    </div>
		                    <div class="layui-form" lay-filter="alarmCondition">
                                <table class="layui-table" id="alarmCondition">
                                    <colgroup>
                                    	<col width="30">
                                        <col>
                                        <col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                        	<th class="tableCheck"><input type="checkbox" lay-skin="primary" lay-filter="selectAll"></th>
                                            <th>参数</th>
                                            <th>值</th>
                                        </tr> 
                                    </thead>
                                    <tbody>
                                        <tr>
                                        	<td class="tableCheck"><input type="checkbox" lay-skin="primary"></td>
                                            <td>
                                                <select>
                                                    <option value=""></option>
                                                    <option value="1">你好世界</option>
                                                </select>
                                            </td>
                                            <td><input type="text" class="layui-input"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
		                    <div class="Subtitle">
		                        <h3>预警对象</h3>
		                        <div class="operates">
			                        <span class="ico add" id="alarmObjAddRow"></span>
			                        <span class="ico del" id="alarmObjDelRow"></span>
			                    </div>
		                    </div>
                            <div class="layui-form" lay-filter="alarmObj">
                                <table class="layui-table alarmObj" id='alarmObj'>
                                    <colgroup>
                                        <col width="30">
                                        <col width="100">
                                        <col width="100">
                                        <col width="80">
                                        <col>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="tableCheck"><input type="checkbox" lay-skin="primary" lay-filter="selectAll"></th>
                                            <th>对象类型</th>
                                            <th>编码</th>
                                            <th>值</th>
                                            <th class="checkboxs" style="text-align:left;">
                                                <input type="checkbox" lay-skin="primary" title="微信" id="wx">
                                                <input type="checkbox" lay-skin="primary" title="钉钉" id="dd">
                                                <input type="checkbox" lay-skin="primary" title="邮件" id="yj">
                                                <input type="checkbox" lay-skin="primary" title="短信" id="dx">
                                                <input type="checkbox" lay-skin="primary" title="系统消息" id="n2xx">
                                                <input type="checkbox" lay-skin="primary" title="APP消息" id="appxx">
                                            </th>
                                        </tr> 
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="tableCheck"><input type="checkbox" lay-skin="primary"></td>
                                            <td>员工</td>
                                            <td>007</td>
                                            <td>张三</td>
                                            <td class="checkboxs">
                                                <input type="checkbox" lay-skin="primary" title="微信">
                                                <input type="checkbox" lay-skin="primary" title="钉钉">
                                                <input type="checkbox" lay-skin="primary" title="邮件">
                                                <input type="checkbox" lay-skin="primary" title="短信">
                                                <input type="checkbox" lay-skin="primary" title="系统消息">
                                                <input type="checkbox" lay-skin="primary" title="APP消息">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tableCheck"><input type="checkbox" lay-skin="primary"></td>
                                            <td>员工</td>
                                            <td>007</td>
                                            <td>张三</td>
                                            <td class="checkboxs">
                                                <input type="checkbox" lay-skin="primary" title="微信">
                                                <input type="checkbox" lay-skin="primary" title="钉钉">
                                                <input type="checkbox" lay-skin="primary" title="邮件">
                                                <input type="checkbox" lay-skin="primary" title="短信">
                                                <input type="checkbox" lay-skin="primary" title="系统消息">
                                                <input type="checkbox" lay-skin="primary" title="APP消息">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div id="alarmObjPage"></div>
                            </div>
		                    <div class="Subtitle" style="margin-bottom:0;">
		                        <h3>超时设置</h3>
		                    </div>
		                    <div class="layui-form">
		                    	<div class="layui-row">
	                                <div class="overTimeLeft">
	                                	<div class="Subtitle">
					                        <h3>超时设置</h3>
					                        <div class="operates">
						                        <span class="ico add" id="overTimeSetAddRow"></span>
						                        <span class="ico del" id="overTimeSetDelRow"></span>
						                    </div>
					                    </div>
					                    <div class="layui-form">
			                                <table class="layui-table" id="overTimeSet">
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
			                                            <td><input type="text" class="layui-input"></td>
			                                        </tr>
			                                    </tbody>
			                                </table>
			                            </div>
	                                </div>
	                                <div class="overTimeRight">
	                                	<div class="Subtitle">
					                        <h3>超时对象</h3>
					                        <div class="operates">
						                        <span class="ico add" id="overTimeObjAddRow"></span>
						                        <span class="ico del" id="overTimeObjDelRow"></span>
						                    </div>
					                    </div>
					                    <div class="layui-form" lay-filter="overTimeObj">
			                                <table class="layui-table" id='overTimeObj'>
			                                    <colgroup>
			                                        <col width="30">
			                                        <col width="100">
			                                        <col width="100">
			                                        <col width="80">
			                                        <col>
			                                    </colgroup>
			                                    <thead>
			                                        <tr>
			                                            <th class="tableCheck"><input type="checkbox" lay-skin="primary" lay-filter="selectAll"></th>
			                                            <th>对象类型</th>
			                                            <th>编码</th>
			                                            <th>值</th>
			                                            <th class="checkboxs samallCheckbox" style="text-align:left;">
			                                                <input type="checkbox" lay-skin="primary" title="微信" id="overTime_wx">
			                                                <input type="checkbox" lay-skin="primary" title="钉钉" id="overTime_dd">
			                                                <input type="checkbox" lay-skin="primary" title="邮件" id="overTime_yj">
			                                                <input type="checkbox" lay-skin="primary" title="短信" id="overTime_dx">
			                                                <input type="checkbox" lay-skin="primary" title="系统消息" id="overTime_n2xx">
			                                                <input type="checkbox" lay-skin="primary" title="APP消息" id="overTime_appxx">
			                                            </th>
			                                        </tr> 
			                                    </thead>
			                                    <tbody>
			                                        <tr>
			                                            <td class="tableCheck"><input type="checkbox" lay-skin="primary"></td>
			                                            <td>员工</td>
			                                            <td>007</td>
			                                            <td>张三</td>
			                                            <td class="checkboxs samallCheckbox">
			                                                <input type="checkbox" lay-skin="primary" title="微信">
			                                                <input type="checkbox" lay-skin="primary" title="钉钉">
			                                                <input type="checkbox" lay-skin="primary" title="邮件">
			                                                <input type="checkbox" lay-skin="primary" title="短信">
			                                                <input type="checkbox" lay-skin="primary" title="系统消息">
			                                                <input type="checkbox" lay-skin="primary" title="APP消息">
			                                            </td>
			                                        </tr>
			                                    </tbody>
			                                </table>
			                                <div id="overTimeObjPage"></div>
			                            </div>
	                                </div>
                            	</div>	
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                	<div class="interaction">
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
                			<form class="layui-form">
					            <div class="layui-row">
					           
					                <div class="searchItem" style="width:100%;">
					                    <div class="search_l"><dict:lang value="模板内容"/></div>
					                    <div class="search_r">
					                        <textarea placeholder="请输入内容" class="layui-textarea" style="height:200px;"></textarea>
					                    </div>
					                </div>
					                
					                <div class="searchItem" style="width:100%;">
					                    <div class="search_l"><dict:lang value="模板说明"/></div>
					                    <div class="search_r">
					                       	<div class="templateExplain">          		
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
                <div class="layui-tab-item">
                	<div class="hierarchyPane">
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
		                    <div class="layui-form" lay-filter="alarmCondition">
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
                            <div class="layui-form" lay-filter="alarmObj">
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
                                            <th class="checkboxs"></th>
                                        </tr> 
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>员工</td>
                                            <td>007</td>
                                            <td>张三</td>
                                            <td class="checkboxs">
                                                <input type="checkbox" lay-skin="primary" title="微信" checked="" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="钉钉" checked="" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="邮件" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="短信" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="系统消息" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="APP消息" disabled="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>员工</td>
                                            <td>007</td>
                                            <td>张三</td>
                                            <td class="checkboxs">
                                                <input type="checkbox" lay-skin="primary" title="微信" checked="" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="钉钉" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="邮件" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="短信" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="系统消息" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="APP消息" disabled="">
                                            </td>
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
			                                            <th class="checkboxs"></th>
			                                        </tr> 
			                                    </thead>
			                                    <tbody>
			                                        <tr>
			                                            <td>员工</td>
			                                            <td>007</td>
			                                            <td>张三</td>
			                                            <td class="checkboxs">
			                                                <input type="checkbox" lay-skin="primary" title="微信" checked="" disabled="">
			                                                <input type="checkbox" lay-skin="primary" title="钉钉" checked="" disabled="">
			                                                <input type="checkbox" lay-skin="primary" title="邮件" disabled="">
			                                                <input type="checkbox" lay-skin="primary" title="短信" disabled="">
			                                                <input type="checkbox" lay-skin="primary" title="系统消息" disabled="">
			                                                <input type="checkbox" lay-skin="primary" title="APP消息" disabled="">
			                                            </td>
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
                	<div class="hierarchyPane">
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
		                    <div class="layui-form" lay-filter="alarmCondition">
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
                            <div class="layui-form" lay-filter="alarmObj">
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
                                            <th class="checkboxs"></th>
                                        </tr> 
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>员工</td>
                                            <td>007</td>
                                            <td>张三</td>
                                            <td class="checkboxs">
                                                <input type="checkbox" lay-skin="primary" title="微信" checked="" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="钉钉" checked="" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="邮件" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="短信" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="系统消息" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="APP消息" disabled="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>员工</td>
                                            <td>007</td>
                                            <td>张三</td>
                                            <td class="checkboxs">
                                                <input type="checkbox" lay-skin="primary" title="微信" checked="" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="钉钉" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="邮件" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="短信" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="系统消息" disabled="">
                                                <input type="checkbox" lay-skin="primary" title="APP消息" disabled="">
                                            </td>
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
			                                            <th class="checkboxs"></th>
			                                        </tr> 
			                                    </thead>
			                                    <tbody>
			                                        <tr>
			                                            <td>员工</td>
			                                            <td>007</td>
			                                            <td>张三</td>
			                                            <td class="checkboxs">
			                                                <input type="checkbox" lay-skin="primary" title="微信" checked="" disabled="">
			                                                <input type="checkbox" lay-skin="primary" title="钉钉" checked="" disabled="">
			                                                <input type="checkbox" lay-skin="primary" title="邮件" disabled="">
			                                                <input type="checkbox" lay-skin="primary" title="短信" disabled="">
			                                                <input type="checkbox" lay-skin="primary" title="系统消息" disabled="">
			                                                <input type="checkbox" lay-skin="primary" title="APP消息" disabled="">
			                                            </td>
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
        <div class="ptop_10">
            <button class="layui-btn">保存</button>   
            <button class="layui-btn layui-btn-danger">取消</button>   
        </div>    
    </div>
    
    
    
    <div class="layui-form addDiv" id="addDiv" style="display:none;">
    	<div class="Subtitle">
            <h3>新增</h3>
            <div class="operates">
                <span class="ico search"></span>
            </div>
        </div>
        <div class="layui-row">
            <div class="searchItem">
                <div class="search_l"><dict:lang value="对象类型"/></div>
                <div class="search_r">
                    <select>
                    	<option value=""></option>
                    	<option value="">字符型</option>
                    	<option value="">浮点型</option>
                    </select>
                </div>
            </div>
            <div class="searchItem">
                <div class="search_l"><dict:lang value="对象编码"/></div>
                <div class="search_r">
                    <input type="text"  maxlength="30" class="layui-input">
                </div>
            </div>
            <div class="searchItem">
                <div class="search_l"><dict:lang value="对象值"/></div>
                <div class="search_r">
                    <input type="text"  maxlength="30" class="layui-input">
                </div>
            </div>
        </div>
        <table class="layui-table" id="addDivTable"></table>
      	
      	<div class="ptop_10">
           <button class="layui-btn save"><dict:lang value="保存"/></button>
           <button class="layui-btn layui-btn-danger layui-layer-close"><dict:lang value="取消"/></button>
       </div>
    </div>
    
<script>
	layui.use(['element','form','laypage','layer','table'], function(){
        var element = layui.element;
        var form = layui.form;
        var laypage = layui.laypage;
        var layer = layui.layer;
        var table = layui.table;
        var alarmObjDiv
        
        //是否取消全选
	    form.on('checkbox(selectAll)', function(data){
            if(data.elem.checked){
                $(data.elem).parents('.layui-form').find('.tableCheck input[type="checkbox"]').prop("checked",true)
            }else{
                $(data.elem).parents('.layui-form').find('.tableCheck input[type="checkbox"]').prop("checked",false)
            }
            form.render() 
        }); 
        
        //超时对象分页事件
        laypage.render({
            elem: 'alarmObjPage',
            limit:"10",//默认每页10条
            hash:'fenye',
            layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
            curr: "1",//默认第一页
            count: "20",//数据量
            jump: function(obj, first){//点击分页后执行的操作            
                if(!first){//（首次不执行）
                    console.log(obj.curr + ' ' + obj.limit)
                    //第几页  每页几条 
                }
            }
        });
        
        //预警对象分页事件
        laypage.render({
            elem: 'overTimeObjPage',
            limit:"10",//默认每页10条
            hash:'fenye',
            layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],//分页需要的功能
            curr: "2",//默认第一页
            count: "30",//数据量
            jump: function(obj, first){//点击分页后执行的操作            
                if(!first){//（首次不执行）
                    console.log(obj.curr + ' ' + obj.limit)
                    //第几页  每页几条 
                }
            }
        });
        
        //分页切换
		element.on('tab(tab)', function(data){
		    if(data.index == 4){
		    	
		    	laypage.render({
		            elem: 'alarmObjPage2',
		            limit:"10",//默认每页10条
		            hash:'fenye',
		            layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
		            curr: "1",//默认第一页
		            count: "20",//数据量
		            jump: function(obj, first){//点击分页后执行的操作            
		                if(!first){//（首次不执行）
		                    console.log(obj.curr + ' ' + obj.limit)
		                    //第几页  每页几条 
		                }
		            }
		        });
		        
		        laypage.render({
		            elem: 'overTimeObjPage2',
		            limit:"10",//默认每页10条
		            hash:'fenye',
		            layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],//分页需要的功能
		            curr: "2",//默认第一页
		            count: "30",//数据量
		            jump: function(obj, first){//点击分页后执行的操作            
		                if(!first){//（首次不执行）
		                    console.log(obj.curr + ' ' + obj.limit)
		                    //第几页  每页几条 
		                }
		            }
		        });
		    }
		});
        
        //预警层级添加
        $('#hierarchyAddRow').click(function(){
        	$('.hierarchyList ul').append('<li><input type="text" class="layui-input"></li>')
        	$('.hierarchyList ul').children("li:last-child").find('input').focus()
        })
        
        //预警层级点击选中行
	    $('.hierarchyList').on('click','li',function(){
	    	$(this).addClass('current').siblings('li').removeClass('current')
	    })
	    
	    //预警层级删除
        $('#hierarchyDelRow').click(function(){
	    	$('.hierarchyList').find('.current').remove()
	    })
        
        //预警条件添加
        $('#alarmConditionAddRow').click(function(){
        	var str = '<tr>\
                        	<td class="tableCheck"><input type="checkbox" lay-skin="primary"></td>\
                            <td>\
                                <select>\
                                    <option value=""></option>\
                                    <option value="1">你好世界</option>\
                                </select>\
                            </td>\
                            <td><input type="text" class="layui-input"></td>\
                        </tr>'
           	$('#alarmCondition tbody').append(str)
	        form.render(null,'alarmCondition')
        })
        
        //预警对象添加
	    $('#alarmObjAddRow').click(function(){
	    	alarmObjDiv = layer.open({
                title: '预警对象添加',
                skin: 'layui-layer-molv',
                area: ['820px','600px'],
                type: 1, 
                id: 'alarmObjDiv', 
                content: $('#addDiv'),
                shade: 0.3 
            });
	    	
	    	table.render({
			    elem: '#addDivTable',
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
	    	
	    })
	    
	    $('body').on('click','#alarmObjDiv .save',function(){
	    	var str = '<tr>\
			                <td class="tableCheck"><input type="checkbox" lay-skin="primary"></td>\
			                <td>部门</td>\
			                <td>ZZB-001</td>\
			                <td>值</td>\
			                <td class="checkboxs">\
			                    <input type="checkbox" lay-skin="primary" title="微信" ' + ($("#wx").prop("checked")?"checked":"") + ' >\
			                    <input type="checkbox" lay-skin="primary" title="钉钉" ' + ($("#dd").prop("checked")?"checked":"") + '>\
			                    <input type="checkbox" lay-skin="primary" title="邮件" ' + ($("#yj").prop("checked")?"checked":"") + '>\
			                    <input type="checkbox" lay-skin="primary" title="短信" ' + ($("#dx").prop("checked")?"checked":"") + '>\
			                    <input type="checkbox" lay-skin="primary" title="系统消息" ' + ($("#n2xx").prop("checked")?"checked":"") + '>\
			                    <input type="checkbox" lay-skin="primary" title="APP消息" ' + ($("#appxx").prop("checked")?"checked":"") + '>\
			                </td>\
			            </tr>'
			$('#alarmObj tbody').append(str)
			form.render(null,'alarmObj')
	    	layer.close(alarmObjDiv)
	    })
	    
	    //超时对象添加
	    $('#overTimeObjAddRow').click(function(){
	    	overTimeObjDiv = layer.open({
                title: '超时对象添加',
                skin: 'layui-layer-molv',
                area: ['820px','600px'],
                type: 1, 
                id: 'overTimeObjDiv', 
                content: $('#addDiv'),
                shade: 0.3 
            });
	    	
	    	table.render({
			    elem: '#addDivTable',
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
	    })
	    
	    $('body').on('click','#overTimeObjDiv .save',function(){
	    	var str = '<tr>\
			                <td class="tableCheck"><input type="checkbox" lay-skin="primary"></td>\
			                <td>部门</td>\
			                <td>ZZB-001</td>\
			                <td>值</td>\
			                <td class="checkboxs samallCheckbox">\
			                    <input type="checkbox" lay-skin="primary" title="微信" ' + ($("#overTime_wx").prop("checked")?"checked":"") + ' >\
			                    <input type="checkbox" lay-skin="primary" title="钉钉" ' + ($("#overTime_dd").prop("checked")?"checked":"") + '>\
			                    <input type="checkbox" lay-skin="primary" title="邮件" ' + ($("#overTime_yj").prop("checked")?"checked":"") + '>\
			                    <input type="checkbox" lay-skin="primary" title="短信" ' + ($("#overTime_dx").prop("checked")?"checked":"") + '>\
			                    <input type="checkbox" lay-skin="primary" title="系统消息" ' + ($("#overTime_n2xx").prop("checked")?"checked":"") + '>\
			                    <input type="checkbox" lay-skin="primary" title="APP消息" ' + ($("#overTime_appxx").prop("checked")?"checked":"") + '>\
			                </td>\
			            </tr>'
			$('#overTimeObj tbody').append(str)
			form.render(null,'overTimeObj')
	    	layer.close(overTimeObjDiv)
	    })
	
	});
    
	
    //预警条件删除
    $('#alarmConditionDelRow').click(function(){
    	$('#alarmCondition tbody .tableCheck input[type="checkbox"]:checked').parents('tr').remove()
    })
    
    //预警对象删除
    $('#alarmObjDelRow').click(function(){
    	$('#alarmObj tbody .tableCheck input[type="checkbox"]:checked').parents('tr').remove()
    })
    
    //超时设置添加
    $('#overTimeSetAddRow').click(function(){
    	$('#overTimeSet tbody').append('<tr><td></td><td><input type="text" class="layui-input"></td></tr>')
    	sort()
    })
    
    //超时设置删除
    $('#overTimeSetDelRow').click(function(){
    	$('#overTimeSet tbody').find('.selected').remove()
    	sort()
    })
    
    //点击添加选中行样式
    $('#overTimeSet').on('click','tr',function(){
    	$(this).addClass('selected').siblings('tr').removeClass('selected')
    })
    
    //超时对象删除
    $('#overTimeObjDelRow').click(function(){
    	$('#overTimeObj tbody .tableCheck input[type="checkbox"]:checked').parents('tr').remove()
    })
    
    //超时设置排序
    function sort(){
    	var count = $('#overTimeSet tbody').find('tr').length
    	for(var i = 0;i < count;i++){
    		$('#overTimeSet tbody').find('tr:eq(' + i + ')').find('td:eq(0)').html(i+1)
    	}
    }
    
   	//交互方式选中
   	$('.interactionWayList').on('click','li',function(){
   		$(this).addClass('current').siblings('li').removeClass('current')
   	})
    
    //配置信息展开收起
    $('.showBtn').click(function(){
        if($(this).parents('.hierarchyPane').hasClass('open')){
            $(this).parents('.hierarchyPane').removeClass('open')
        }else{
            $(this).parents('.hierarchyPane').addClass('open')
        }
    })
</script>
</body>
</html>