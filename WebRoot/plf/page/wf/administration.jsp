<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
  <title>layuiAdmin 控制台主页一</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <jsp:include page="/plf/common/pub_head.jsp">
	  <jsp:param name="layui" value="1" />
  </jsp:include>
  <style>
  	html {
  		background-color: #f2f2f2;
  	}
  </style>
</head>
<body>
  
<div class="layui-fluid process" style="min-width:1000px;">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-xs12">
		  <div class="layui-card process-management">
		    <div class="layui-card-header">人事管理流程
		    	<button class="layui-btn layui-btn-sm">
		    		<i class="layui-icon layui-icon-edit"></i>
		    	</button>
		    	<button class="layui-btn layui-bg-red layui-btn-sm">
		    		<i class="layui-icon">&#xe640</i>
		    	</button>
		    	<button class="layui-btn layui-bg-blue layui-btn-sm">
		    		<i class="layui-icon">&#xe654</i>
		    	</button>
		    </div>
		    <div class="layui-card-body">
		      
		      <div class="layui-carousel layadmin-carousel layadmin-shortcut">
		        <div carousel-item>
		          <ul class="layui-row layui-col-space10">
		            <li class="layui-col-xs2">
		              <a lay-href="${path}plf/page/wf/administration.jsp">
		                <i class="iconfont" style="background-image: url(${path}plf/style/css2/images/arrow_down.png);">
		                	<section class="process-state">
		                		<u class="layui-btn layui-btn-xs layui-bg-blue">启用</u>
		                		<u class="layui-btn layui-btn-xs layui-btn-disabled">未发布</u>
		                	</section>
		                </i>
		                <cite>业务模型</cite>
		              </a>
		              <div class="menu-todo">
		              	<ul>
		              		<li>
		              			<a href="#" title="编辑">
		              				<i class="layui-icon layui-bg-green">&#xe642</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="删除">
		              				<i class="layui-icon layui-bg-red">&#xe640</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="权限">
		              				<i class="layui-icon layui-bg-orange">&#xe673</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="发布">
		              				<i class="layui-icon layui-bg-blue">&#xe609</i>
		              			</a>
		              		</li>
		              	</ul>
		              </div>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="${path}plf/page/wf/administration.jsp">
		                <i class="iconfont">&#xe631;
		                	<section class="process-state">
		                		<u class="layui-btn layui-btn-xs layui-btn-disabled">停用</u>
		                		<u class="layui-btn layui-btn-xs">发布</u>
		                	</section>
		                </i>
		                <cite>业务模型</cite>
		              </a>
		              <div class="menu-todo">
		              	<ul>
		              		<li>
		              			<a href="#" title="编辑">
		              				<i class="layui-icon layui-bg-green">&#xe642</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="删除">
		              				<i class="layui-icon layui-bg-red">&#xe640</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="权限">
		              				<i class="layui-icon layui-bg-orange">&#xe673</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="发布">
		              				<i class="layui-icon layui-bg-blue">&#xe609</i>
		              			</a>
		              		</li>
		              	</ul>
		              </div>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="component/layer/list.html">
		                <i class="iconfont">&#xe634;</i>
		                <cite>公用页面</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a layadmin-event="im">
		                <i class="iconfont">&#xe632;</i>
		                <cite>缓存管理</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="component/progress/index.html">
		                <i class="iconfont">&#xe62a;</i>
		                <cite>触发器</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="app/workorder/list.html">
		                <i class="iconfont">&#xe62c;</i>
		                <cite>任务管理</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="user/user/list.html">
		                <i class="iconfont">&#xe62f;</i>
		                <cite>参数设置</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="set/system/website.html">
		                <i class="iconfont">&#xe62b;</i>
		                <cite>监控系统</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="set/system/website.html">
		                <i class="iconfont">&#xe62b;</i>
		                <cite>监控系统</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="${path}plf/page/wf/administration.jsp">
		                <i class="iconfont" style="background-image: url(${path}plf/style/css2/images/arrow_down.png);">
		                	<section class="process-state">
		                		<u class="layui-btn layui-btn-xs layui-bg-blue">启用</u>
		                		<u class="layui-btn layui-btn-xs layui-btn-disabled">未发布</u>
		                	</section>
		                </i>
		                <cite>业务模型</cite>
		              </a>
		              <div class="menu-todo">
		              	<ul>
		              		<li>
		              			<a href="#" title="编辑">
		              				<i class="layui-icon layui-bg-green">&#xe642</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="删除">
		              				<i class="layui-icon layui-bg-red">&#xe640</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="权限">
		              				<i class="layui-icon layui-bg-orange">&#xe673</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="发布">
		              				<i class="layui-icon layui-bg-blue">&#xe609</i>
		              			</a>
		              		</li>
		              	</ul>
		              </div>
		            </li>
		          </ul>
		          <ul class="layui-row layui-col-space10">
		            <li class="layui-col-xs2">
		              <a lay-href="${path}plf/page/wf/administration.jsp">
		                <i class="iconfont" style="background-image: url(${path}plf/style/css2/images/arrow_down.png);">
		                	<section class="process-state">
		                		<u class="layui-btn layui-btn-xs layui-bg-blue">启用</u>
		                		<u class="layui-btn layui-btn-xs layui-btn-disabled">未发布</u>
		                	</section>
		                </i>
		                <cite>业务模型</cite>
		              </a>
		              <div class="menu-todo">
		              	<ul>
		              		<li>
		              			<a href="#" title="编辑">
		              				<i class="layui-icon layui-bg-green">&#xe642</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="删除">
		              				<i class="layui-icon layui-bg-red">&#xe640</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="权限">
		              				<i class="layui-icon layui-bg-orange">&#xe673</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="发布">
		              				<i class="layui-icon layui-bg-blue">&#xe609</i>
		              			</a>
		              		</li>
		              	</ul>
		              </div>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="${path}plf/page/wf/administration.jsp">
		                <i class="iconfont">&#xe631;
		                	<section class="process-state">
		                		<u class="layui-btn layui-btn-xs layui-btn-disabled">停用</u>
		                		<u class="layui-btn layui-btn-xs">发布</u>
		                	</section>
		                </i>
		                <cite>业务模型</cite>
		              </a>
		              <div class="menu-todo">
		              	<ul>
		              		<li>
		              			<a href="#" title="编辑">
		              				<i class="layui-icon layui-bg-green">&#xe642</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="删除">
		              				<i class="layui-icon layui-bg-red">&#xe640</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="权限">
		              				<i class="layui-icon layui-bg-orange">&#xe673</i>
		              			</a>
		              		</li>
		              		<li>
		              			<a href="#" title="发布">
		              				<i class="layui-icon layui-bg-blue">&#xe609</i>
		              			</a>
		              		</li>
		              	</ul>
		              </div>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="component/layer/list.html">
		                <i class="iconfont">&#xe634;</i>
		                <cite>公用页面</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a layadmin-event="im">
		                <i class="iconfont">&#xe632;</i>
		                <cite>缓存管理</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="component/progress/index.html">
		                <i class="iconfont">&#xe62a;</i>
		                <cite>触发器</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="app/workorder/list.html">
		                <i class="iconfont">&#xe62c;</i>
		                <cite>任务管理</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="user/user/list.html">
		                <i class="iconfont">&#xe62f;</i>
		                <cite>参数设置</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="set/system/website.html">
		                <i class="iconfont">&#xe62b;</i>
		                <cite>监控系统</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="set/system/website.html">
		                <i class="iconfont">&#xe62b;</i>
		                <cite>监控系统</cite>
		              </a>
		            </li>
		            <li class="layui-col-xs2">
		              <a lay-href="set/system/website.html">
		                <i class="iconfont">&#xe62b;</i>
		                <cite>监控系统</cite>
		              </a>
		            </li>
		          </ul>
		          
		        </div>
		      </div>
		      
		    </div>
		  </div>
		</div>
	    <div class="layui-col-xs12 process-add">
	    	<a lay-href="">
               <i class="layui-icon layui-icon-add-1">
                   
               </i>
             </a>
	    </div>
	</div>
</div>

  <script>
  layui.config({
    base: '${path}plf/style/layui/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index','carousel'],function(){
	  	var $ = layui.$
	    ,admin = layui.admin
	    ,carousel = layui.carousel
	    ,element = layui.element
	    ,device = layui.device();
	  	
		//轮播切换
	    $('.layadmin-carousel').each(function(){
	      var othis = $(this);
	      carousel.render({
	        elem: this
	        ,width: '100%'
	        ,arrow: 'none'
	        ,interval: othis.data('interval')
	        ,autoplay: othis.data('autoplay') === true
	        ,trigger: (device.ios || device.android) ? 'click' : 'hover'
	        ,anim: othis.data('anim')
	      });
	    });
  });
  
  
  </script>
</body>
</html>

