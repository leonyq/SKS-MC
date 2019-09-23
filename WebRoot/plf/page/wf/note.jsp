<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
  <title>流程图</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <jsp:include page="/plf/common/pub_head.jsp">
	  <jsp:param name="layui" value="1" />
	  <jsp:param name="popDivWinFp" value="1" />
  </jsp:include>
  <style>
      html {
          background-color: #f2f2f2;
      }
  </style>
</head>
<body>
  
<div class="layui-fluid process">
	<!-- start -->
	<div class="layui-row">
		<!-- layui-card start -->
		<div class="layui-card">
			<!-- 分页 start -->
			<div class="layui-tab mc-tab layui-tab-brief process-note">
				<!-- 操作部分 start -->
				<div class="process-setting">
					<a href="javascript:void(0)" class="layui-btn layui-btn-xs">按钮1</a>
					<a href="javascript:void(0)" class="layui-btn layui-btn-xs layui-bg-blue">测试</a>
					<a href="javascript:void(0)" class="layui-btn layui-btn-xs layui-bg-red">测试</a>
					
				</div>
				<!-- 操作部分 end -->
				<ul class="layui-tab-title">
					<li class="layui-this"><a><span>网站设置</span></a></li>
					<li class=""><a><span>网站设置</span></a></li>
					<li><a><span>网站设置</span></a></li>
					<li><a><span>网站设置</span></a></li>
					<li><a><span>网站设置</span></a></li>
				</ul>
				
				<div class="layui-tab-content" style="padding-bottom: 10px;">
					<div class="layui-tab-item layui-show mc-table-content">
					<div>
						<blockquote class="layui-elem-quote">外出/出差申请单</blockquote>
					</div>
					<!-- item start -->
						<form class="layui-form">
							<div class="layui-card">
								<div class="layui-card-body layui-row layui-col-space10">
									<div class="layui-col-xs8">
										<label class="layui-form-label">员工姓名：</label>
										<div class="layui-input-block">
											<input type="text" name="fullname" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-col-xs4">
										<label class="layui-form-label">员工姓名：</label>
										<div class="layui-input-block">
											<input type="text" name="fullname" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-col-xs4">
										<label class="layui-form-label">员工姓名：</label>
										<div class="layui-input-block">
											<input type="text" name="fullname" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-col-xs4">
										<label class="layui-form-label">员工姓名：</label>
										<div class="layui-input-block">
											<input type="text" name="fullname" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-col-xs4">
										<label class="layui-form-label">员工姓名：</label>
										<div class="layui-input-block">
											<input type="text" name="fullname" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
								
							</div>
							<div class="layui-card">
					            <div class="layui-card-header">外出信息</div>
					            <div class="layui-card-body layui-row layui-col-space10">
					                <div class="layui-col-md12">
						                <label class="layui-form-label">外出类型：</label>
										<div class="layui-input-block">
											<select name="city" lay-verify="" class="layui-input">
								                <option value="">请选择一个城市</option>
								                <option value="010">北京</option>
								                <option value="021">上海</option>
								                <option value="0571">杭州</option>
								            </select>
										</div>
						            </div>
						            <div class="layui-col-xs4">
						             	<label class="layui-form-label">起始时间：</label>
										<div class="layui-input-block">
											<input type="text" lay-verify="required|number" class="layui-input" id="laydate-date-start" placeholder="yyyy-MM-dd HH:mm:ss">
										</div>
						            </div>
						            <div class="layui-col-xs4">
						             	<label class="layui-form-label">结束时间：</label>
										<div class="layui-input-block">
											<input type="text" name="number" lay-verify="required|number" class="layui-input" id="laydate-date-end" placeholder="yyyy-MM-dd HH:mm:ss">
										</div>
						            </div>
						            <div class="layui-col-xs4">
						             	<label class="layui-form-label">外出天数：</label>
										<div class="layui-input-block">
											<input type="text" name="number" lay-verify="required|number" class="layui-input">
										</div>
						            </div>
						            <div class="layui-col-xs12">
						            	<label class="layui-form-label">出差原因：</label>
										<div class="layui-input-block">
											<textarea name="other" placeholder="" class="layui-textarea"></textarea>
										</div>
						            </div>
						            <div class="layui-col-xs4">
						             	<label class="layui-form-label">是否借款：</label>
										<div class="layui-input-block">
											<select name="city" lay-verify="" class="layui-input">
								                <option value="">请选择一个城市</option>
								                <option value="010">需要</option>
								                <option value="021">不需要</option>
								            </select>
										</div>
						            </div>
						            <div class="layui-col-xs4">
						             	<label class="layui-form-label">借款金额：</label>
										<div class="layui-input-block">
											<input type="text" name="number" lay-verify="required|number" class="layui-input">
										</div>
						            </div>
						            <div class="layui-col-xs4">
						             	<label class="layui-form-label">还款日期：</label>
										<div class="layui-input-block">
											<input type="text" name="number" lay-verify="required|number" class="layui-input" id="laydate-date-end" placeholder="yyyy-MM-dd HH:mm:ss">
										</div>
						            </div>
					            </div>
					        </div>
						</form>
		            <!-- item end -->
		         	</div>
		         	<div class="layui-tab-item">
		         	
		         		内容2
		         	</div>
		         	<div class="layui-tab-item">内容3</div>
		         	<div class="layui-tab-item">内容4</div>
		         	<div class="layui-tab-item">内容5</div>
		       </div>
			</div>
			<!-- 分页 end -->
			
			
		</div>
		<!-- layui-card end -->
		
		<div class="layui-card">
			<!-- 分页 start -->
			<div class="layui-tab mc-tab layui-tab-brief process-note">
				<ul class="layui-tab-title">
					<li class="layui-this"><a><span>流转意见</span></a></li>
					<li class=""><a><span>与我相关</span></a></li>
				</ul>
				
				<div class="layui-tab-content" style="padding-bottom: 10px;">
					<div class="layui-tab-item layui-show mc-table-content layui-row layui-col-space10">
						<div class="clearfix">
							<div class="layui-col-xs3 process-center ">
								<h2>马云</h2>
	                			<mdall>集团总裁</mdall>
							</div>
							<div class="layui-col-xs3 process-center ">
								<h2>马云</h2>
	                			<mdall>集团总裁</mdall>
							</div>
							<div class="layui-col-xs3 process-center ">
								<h2>马云</h2>
	                			<mdall>集团总裁</mdall>
							</div>
						</div>
						<div class="clearfix">
							<div class="layui-col-xs3 process-center ">
								<h2>马云</h2>
	                			<mdall>集团总裁</mdall>
							</div>
							<div class="layui-col-xs3 process-center ">
								<h2>马云</h2>
	                			<mdall>集团总裁</mdall>
							</div>
							<div class="layui-col-xs3 process-center ">
								<h2>马云</h2>
	                			<mdall>集团总裁</mdall>
							</div>
						</div>
						<div id="test-laypage-demo0"></div>
					</div>
					<div class="layui-tab-item">内容3</div>
				</div>
			</div>
			
			
			<!-- 分页 end -->
		</div>
	</div>
	
	
	
	
	<!-- end -->
	
</div>

  <script>
  layui.config({
    base: '${path}plf/style/layui/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index','carousel','laydate', 'form', 'laypage'],function(){
	  	var $ = layui.$
	    ,admin = layui.admin
	    ,carousel = layui.carousel
	    ,element = layui.element
	    ,laydate = layui.laydate
	    ,laypage = layui.laypage
	    ,device = layui.device();
	  	
	    //总页数低于页码总数
	    laypage.render({
	      elem: 'test-laypage-demo0'
	      ,count: 50 //数据总数
	    });
	  
		//起始时间
		laydate.render({
			elem:'#laydate-date-start'
			,type: 'datetime'
		});
		
		//结束时间
		laydate.render({
			elem:'#laydate-date-end'
			,type: 'datetime'
		});
		
  });
  
  
  </script>
</body>
</html>

