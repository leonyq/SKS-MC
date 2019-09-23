<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title>服务配置</title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head_layui.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="alarm" value="1" />
	</jsp:include>
	<style type="text/css">
		 .layui-form-select{
		 	width:100%;
		 }
	
		 .alarmObj .search_l{
		 	width:120px;
		 }
		 
		 .alarmObj .search_r{
		 	width:calc(100% - 150px);
		 }
		 
		 .cards3 .item .hoverBtn .icon{
		 	margin:0 9px;
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
    
    <div class="layui-fluid switch">
        
         <div class="serveConfig">
             <div class="alarmServe">
             	<div class="Subtitle" style="margin-bottom:10px;">
	               <h3>预警服务</h3>
	               <div class="operates">
		                <span class="ico add" id="addSeverBtn"></span>
		                <span class="ico del"></span>
		            </div>
           		</div>
	           	<div class="alarmServeList">
		           	<ul>
		           		<li class="current">预警服务1<span class="pause"></span></li>
		           		<li>预警服务2<span class="pause"></span></li>
		           		<li>预警服务2<span class="play"></span></li>
		           		<li>预警服务2<span class="play"></span></li>
		           		<li>预警服务2<span class="play"></span></li>
		           	</ul>
	            </div>	
             </div>
             <div class="alarmObj">
             	<div class="Subtitle">
	               <h3>预警项目</h3>
	               <div class="operates">
		                <span class="ico add" id="addObjBtn"></span>
		                <span class="ico del"></span>
		            </div>
	            </div>
	            <div class="layui-row">
	            	<div class="searchItem" style="width:100%;">
	                    <div class="search_l"><dict:lang value="服务地址"/></div>
	                    <div class="search_r">
	                        <input type="text"  maxlength="30"  class="layui-input">
	                    </div>
	                </div>
	            </div>
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
		                    	<span class="icon unbind"></span>
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
		                    	<span class="icon unbind"></span>
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
        </div>
       
    </div>
    
    <div id="addSever" style="display:none;">
    	<div class="layui-form-item" style="margin-top:40px;">
           <div class="list-left">服务名称</div>
           <div class="list-right">
               <div class="pane">
                   <input type="text" class="layui-input">
               </div>
           </div>
       </div>
       <div class="layui-form-item">
           <div class="list-left">服务地址</div>
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
    
    <div class="layui-form" id="addAlarmObj" style="padding:0 20px;display:none;">
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
	layui.use(['element','form','layer','table'], function(){
        var element = layui.element;
        var form = layui.form;
        var layer = layui.layer;
        var table = layui.table;
        
        //解除绑定  弹窗提示
        $('.cards3 .item').on('click','.unbind',function(){
        	layer.open({
                title: '预警项目详情',
                skin: 'layui-layer-molv',
                btn: ['确定', '取消'],
                yes: function(index, layero){
                  //按钮【确定】的回调
                	return false //开启该代码可禁止点击该按钮关闭
                }
                ,btn2: function(index, layero){
                  //按钮【取消】的回调
                  
                },
                area: ['260px','150px'],
                type: 1, 
                id: 'hintDiv', //防止重复弹出
                content: '<p style="margin-top:25px;text-align:center;">确定将要解除当前项目同服务的关联</p>',
                shade: 0.3 
            });
        })
        
        //添加预警服务
        $('#addSeverBtn').click(function(){
        	layer.open({
                title: '预警服务新增',
                skin: 'layui-layer-molv',
                area: ['500px','300px'],
                type: 1, 
                id: 'addSeverDiv', //防止重复弹出
                content: $('#addSever'),
                shade: 0.3 
            });
        })
        
        //添加项目对象
        $('#addObjBtn').click(function(){
	    	layer.open({
                title: '预警项目添加',
                skin: 'layui-layer-molv',
                area: ['820px','600px'],
                type: 1, 
                id: 'addAlarmObjDiv', 
                content: $('#addAlarmObj'),
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
</script>
</body>
</html>