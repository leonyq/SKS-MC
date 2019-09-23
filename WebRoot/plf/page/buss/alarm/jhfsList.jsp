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
		 
		 .list-left{
		 	float: left;
		    width: 110px;
		    text-align: right;
		    line-height: 38px;
		 }
		 
		 .list-right {
		    float: left;
		    box-sizing: border-box;
		    width: calc(100% - 110px);
		    padding-left: 15px;
		    line-height: 38px;
		}
		
		.list-right .layui-input{
			width:300px;
		}
	</style>
</head>

<body>
    
    <div class="layui-fluid" style="overflow:auto;">
        <form class="layui-form searchDiv" id="searchForm" action="">
            <div class="layui-row">
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="组织机构"/></div>
                    <div class="search_r">
                        <input type="text" maxlength="30"  class="layui-input">
                    </div>
                </div>
            </div>
        </form>
        <div class="cardPane open">
            <div class="layui-row cards3">
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/wechat.png">
                    <p class="p3">微信</p>
                    <div class="operates">
		                <span class="ico set"></span>
		            </div>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/dingding.png">
                    <p class="p3">钉钉</p>
                    <div class="operates">
		                <span class="ico set"></span>
		            </div>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/email.png">
                    <p class="p3">邮件</p>
                    <div class="operates">
		                <span class="ico set"></span>
		            </div>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/duanxin.png">
                    <p class="p3">短信</p>
                    <div class="operates">
		                <span class="ico set"></span>
		            </div>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/xitongxiaoxi.png">
                    <p class="p3">系统信息</p>
                    <div class="operates">
		                <span class="ico set"></span>
		            </div>
                </div>
                <div class="item">
                    <img src="${path}plf/page/bussmodel/dmp/images/img/app.png">
                    <p class="p3">app信息</p>
                    <div class="operates">
		                <span class="ico set"></span>
		            </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="layui-form" id="setDiv" style="padding-top:40px;display:none;">
       <div class="layui-form-item">
           <div class="list-left">服务地址</div>
           <div class="list-right">
               <div class="pane">
                   <input type="text" class="layui-input">
               </div>
           </div>
       </div>
       <div class="layui-form-item">
           <div class="list-left">公司ID</div>
           <div class="list-right">
               <div class="pane">
                   <input type="text" class="layui-input">
               </div>
           </div>
       </div>
       <div class="layui-form-item">
           <div class="list-left">密码</div>
           <div class="list-right">
               <div class="pane">
                   <input type="text" class="layui-input">
               </div>
           </div>
       </div>
       <div class="ptop_10">
	       <button class="layui-btn">保存</button>
	       <button class="layui-btn layui-btn-danger layui-layer-close">取消</button>
	   </div>
   </div>
   
<script>
	layui.use(['element','form','layer'], function(){
        var element = layui.element;
        var form = layui.form;
        var layer = layui.layer;
        
        
        
        $('.operates .set').on('click', function(){
            layer.open({
                title: '摩尔提示',
                skin: 'layui-layer-molv',
                area: ['500px','340px'],
                type: 1, 
                id: 'layerDemo', //防止重复弹出
                content: $('#setDiv'),
                shade: 0.3 
            });
        })
        
	});
	
	$('.cards3 .item').click(function(){
    	$('.cards3 .item').removeClass('active')
        $(this).addClass('active')
    })
</script>
</body>
</html>