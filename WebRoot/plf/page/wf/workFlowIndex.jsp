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
  <title><dict:lang value="工作流" /></title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <jsp:include page="/plf/common/pub_head.jsp">
      <jsp:param name="popDivWin" value="1" />
	  <jsp:param name="layui" value="1" />
  </jsp:include>
    <link href="${path}plf/style/fonts/iconfont.css" rel="stylesheet" type="text/css">
<style>
  	/*html {
  		background-color: #f2f2f2;
  	}*/
  	.workFlowIndex-header {
	  border-bottom: 1px solid #ededed;
	  padding: 5px 0px 15px 0px;
	}
	.clear-float:after{
	  content:"";
	  display:block;
	  clear:both;
	}
	.btn-group{
	  float:right;
	  padding:5px 0;
	 }
	 .layui-card-title{
	    padding:20px 15px;
	 }
	 .layui-card-title-font{
        display: inline-block;
	    vertical-align:  middle;
	 }
	 .card-title-btn-group{
	   height:30px;
	   border-radius: 2px;
	   display:inline-block;
	   border: 1px solid #c8c8ca;
	   box-sizing: border-box;
	   margin-left:12px;
	   font-size: 0px;
       vertical-align: top;
	      
	 }
	 .card-title-btn-group .card-title-btn{
	      display: inline-block;
		  padding: 6px 0;
		  text-align: center;
		  width: 40px;
		  box-sizing:  border-box;
		  vertical-align: top; 
		  cursor: pointer;
		  position: relative;
	  }
	  .btn-font{
	    position: absolute;
	    top:32px;
	    left:45px;
	    font-size:14px;
	    color: #333333;
	    display: inline-block;
	    background: rgb(239,241,240);
	    width: 53px;
	    height: 25px;
	    line-height: 25px;
	    text-align: center;
	    border-radius: 2px;
	    box-shadow: 1px 1px 6px #666;
	    display:none;
	  }
	  .card-title-btn-group .card-title-btn:hover{
	    color:#159588;
	  }
	  .card-title-btn-group .card-title-btn.inf{
	     border: 1px solid #c8c8ca;
	     border-bottom:none;
	     border-top:none;
	  }
	  .card-body-toggle{
	       cursor: pointer;
	       float:right;
	       color: #999;
	       font-size:14px;
	       user-select: none;
	  }
	  .work-card-body{
	    display:none;
	  }
	  .card-item{
		   width:260px;
		   height:90px;
		   box-sizing:  border-box;
		   float:left;
		   background: #fff;
          border-radius: 2px;
          border: 1px solid #e6e6e6;
          margin: 0px 15px 15px 0;
         line-height: 85px;
         
         position: relative;
	   
	  }
	  .card-item:hover{
	     border: 1px solid #159588;
	  }
	  .card-icon{
	     display: inline-block;
	    width: 50px;
	    height: 50px;
	    background:#999;
	    vertical-align: middle;
        margin: 0px 18px;
        line-height: 50px;
        text-align: center;
        border-radius: 4px;
        padding:10px 0;
        box-sizing: border-box;
	  }
	  .card-icon.card-published-bg{
	     background: #159688;
	  }
	  .card-icon img{
	    width:28px;	    
	  }
	 
	  .card-icon-font{
	    font-size:36px !important;
	    color:#fff;
	  }
	  .card-content{
	    height:auto !important;
	    position: relative;
	  }
	  .card-content li cite {
	    position: relative;
	    top: 2px;
	    display: block;
	    color: #666;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    white-space: nowrap;
	    font-size: 14px;
	  }
	  .card-menu-todo{
	     top:8px !important;
	     line-height: auto;
	     display:none;
	   
	  }
	  .card-menu-todo ul{
	     text-align: center;
	     height: 88px;
	     line-height: 88px;
	     width: 100%;
         box-sizing: border-box;
         background: #f5f5f5;
         position: absolute;
         top: -8px;
         z-index:999;
        
	  }
	  
	  .card-menu-todo li {
	    margin-right:15px;
	    margin-top:29px;
	  }
	  .card-menu-todo li a{
	      vertical-align: middle;
          padding:0 !important;
		  display: inline-block;
		  height: 30px;
		  width: 30px;
		  border-radius: 50%;
		  line-height: 30px;
         text-align: center;
	  
	  }
	  
	   .card-menu-todo li i{
	      font-size:20px !important;
	      color:#fff;
	   }
	
  </style>
 

</head>
<body>
  
<div class="layui-fluid process">
  <div class="workFlowIndex-header clear-float">
	<div class="search_table_wrap">
			<form id="searchform" name="searchform"  class="layui-form" action="" method="post">
	
		<div class="layui-input-inline">
			<input type="text" placeholder="<dict:lang value='输入流程名称' />"  onkeyup="javascript:util.replaceLikeVal(this)" value="<c:out value='${flowName}' />" name="flowName" id="flowName" class="input_sh" style="width:240px;text-indent: 10px;">
		</div>
		<input type="button"  id="" value="<dict:lang value='查询' />" onclick="query(this)" class="layui-btn">
			</form>
	
	</div>
	<div class="btn-group">
	   <input type="button" onclick="addProcessde('')" value="<dict:lang value='新增流程' />"  class="layui-btn">
	   <input type="button" onclick="addFlowType()" value="<dict:lang value='新增类别' />"  class="layui-btn">
	   <input type="button"  onclick="importProcessde('')" value="<dict:lang value='导入' />"  class="layui-btn">
	   <input type="button"  id="allClick" value="<dict:lang value='全部收起' />" stype="close" class="layui-btn">
	</div>
</div>


	<div class="">
	  <c:forEach items="${dataList }" var="ld">
		<div>
		  <div class="layui-card process-management clear-float" id="mainCard"  style="border-bottom: 1px solid #ededed;">
		    <div class="layui-card-title">
		        <span  class="layui-card-title-font">${ld.name}</span>
		        <c:if test="${ld.id !='100000'}">
		        <div class="card-title-btn-group">
		        <c:if test="${ld.id !='200000'}">
		        <span class="card-title-btn" onclick="editFlowType('${ld.id}','${ld.name }');">
		           <i class="layui-icon layui-icon-edit" ></i>
		           <span class="btn-font"><dict:lang value='编辑' /></span>
		        </span>
		         <span class="card-title-btn inf" onclick="delFlowType('${ld.id}',this);">
		           <i class="layui-icon">&#xe640</i>
		           <span class="btn-font"><dict:lang value='删除' /></span>
		         </span>
		         </c:if>
		         
		         <span  class="card-title-btn" onclick="addProcessde('${ld.id}');">
		            <i class="layui-icon">&#xe654</i>
		            <span class="btn-font"><dict:lang value='新增' /></span>
		         </span>
		         
		         </div> 
		         </c:if>
		      <div class="card-body-toggle">
		            <dict:lang value='展开' />
		      </div>     
		    </div>
		    <div class="layui-card-body work-card-body">
		      <!--  
		      <div class="layui-carousel layadmin-carousel layadmin-shortcut">
		        <div carousel-item>-->
		        <div class="card-content">
		        <c:forEach var="map" items="${processdeMap}" varStatus="status">
		        
		          <c:if test="${map.key==ld.id  }">
		            <ul class="clear-float" style="padding-bottom: 25px;">
		                <c:forEach var="mapli" items="${map.value}">
		                 <li class="card-item" >
		                  
		                 <a lay-href="javascript:void(0);">
		                  
		                 <!-- 
		                 <i class="iconfont" style="background-image: url(${path}${mapli.icon_path});">
		                	<section class="process-state">
		                		<u class="layui-btn layui-btn-xs layui-bg-blue">启用</u>
		                		<u class="layui-btn layui-btn-xs layui-btn-disabled">
		                		<c:if test="${mapli.bpublish==1}">已发布</c:if>
		                		<c:if test="${mapli.bpublish==0}">未发布</c:if>
		                		</u>
		                	</section>
		                </i>
		                 -->
		                <cite>
		                <c:if test="${mapli.bpublish==1}">
		                	<span class="card-icon card-published-bg">
		                    <img  src="${path}${mapli.icon_path}">
		                   </span>
		                </c:if>
		               <c:if test="${mapli.bpublish==0}">
		                 <span class="card-icon">
		                    <img  src="${path}${mapli.icon_path}">
		                </span>
		               </c:if>
		               <!-- 
		                <span class="card-icon">
		                   <i class="mc-font icon-mcwf-people-unpass card-icon-font"></i>
		                </span>
		                 -->
		                   ${mapli.proc_de_show_name }
		                 </cite>
		              </a>
		              <div class="menu-todo card-menu-todo">
		              	<ul>
		              		<li>
		              			<a style="background:#159588" href="javascript:void(0);" title="<dict:lang value='编辑' />" onclick="editProcessde('${mapli.proc_de_id}','${ld.id}');">
		              				<!--  <i class="layui-icon layui-bg-green">&#xe642</i>-->
		              				  <i class="mc-font icon-mcwf-edit card-icon-font"></i>
		              			</a>
		              		</li>
		              		<li>
		              			<a  style="background:#ee5432" href="javascript:void(0);" onclick="delProcessde('${mapli.proc_de_id }',this)" title="<dict:lang value='删除' />">
		              				<!--<i class="layui-icon layui-bg-red">&#xe640</i>-->
		              				  <i class="mc-font icon-mcwf-close card-icon-font"></i>
		              			</a>
		              		</li>
		              		<li>
		              			<a style="background:#fc9549" href="javascript:void(0);" title="<dict:lang value='编辑流程模板' moName='mc_plf' />" onclick="editModel('${mapli.proc_de_id}');">
		              				<!--<i class="layui-icon layui-bg-orange">&#xe673</i>-->
		              				  <i class="mc-font icon-mcwf-classification-one"></i>
		              			</a>
		              		</li>
		              		<li>
		              			<a style="background:#2aa1ff" href="javascript:void(0);" title="<dict:lang value='发布' />"  onclick="publish('${mapli.proc_de_id }')">
		              				<!--<i class="layui-icon layui-bg-blue">&#xe609</i>-->
		              				  <i class="mc-font icon-mcwf-publish"></i>
		              			</a>
		              		</li>
		              	</ul>
		              </div>
		            </li>
		                </c:forEach>
		           </ul>
		          </c:if>
		          
		        </c:forEach>
		         
		          
		       <!-- </div> --> 
		      </div>
		      
		    </div>
		  </div>
		</div>
	   </c:forEach>	
		
		<!-- 
	    <div class="layui-col-xs12 process-add">
	    	<a  onclick="addFlowType()" style="cursor: pointer">
               <i class="layui-icon layui-icon-add-1">
                   
               </i>
             </a>
	    </div>
	     -->
	</div>
	
</div>

  <script>
  
  $('.card-title-btn').hover(function(){
	 $(this).children(".btn-font").show();
	 
	
  },function(){
	 $(this).children(".btn-font").hide();
	  
	 
	
  })
  $('.card-body-toggle').click(function(){
	  $(this).parents("#mainCard").children(".work-card-body").toggle();
	  if($(this).parents("#mainCard").children(".work-card-body").css('display')==="none"){
		  $(this).text("<dict:lang value='展开' />");
	  }
	  if($(this).parents("#mainCard").children(".work-card-body").css('display')==="block"){
		  $(this).text("<dict:lang value='收起' />");
	  }
  });
  $('.card-item').hover(function(){
	  $(this).children(".card-menu-todo").show();
  },function(){
	  $(this).children(".card-menu-todo").hide();
	  
  });
  
  $('#allClick').click(function(){
  var type=$(this).attr('stype');
  if(type=='open'){
      $(".layui-card").each(function(i,ele){
          if($(ele).find('.card-item').length>0){
            $(ele).find(".work-card-body").css('display','block');
            $(ele).find(".card-body-toggle").text("<dict:lang value='收起' />");
          }
      });
      $(this).val("<dict:lang value='全部收起' />");
      $(this).attr('stype','close');
   }
  else if(type=='close'){
      $(".layui-card").each(function(i,ele){
          if($(ele).find('.card-item').length>0){
            $(ele).find(".work-card-body").css('display','none');
            $(ele).find(".card-body-toggle").text("<dict:lang value='展开' />");
          }
      });
      $(this).val("<dict:lang value='全部展开' />");
      $(this).attr('stype','open');
   }
  });
  
  $(function(){
	  $(".layui-card").each(function(i,ele){
          if($(ele).find('.card-item').length>0){
            $(ele).find(".work-card-body").css('display','block');
            $(ele).find(".card-body-toggle").text("<dict:lang value='收起' />");
          }
      });
      var error= "<c:out value='${error}' />";
      if(error!='')
      {
         top.util.alert(error);
      }
  });

  function query()
  {  
       //var flowName=$("#flowName").val();
       //if(flowName=='') return false;
       //document.forms.searchform.action=window.location.href;
    	document.forms.searchform.submit();
  
  }
	
	
  
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
  
   var mcIframeName=window.name;
   var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
  function alertInfo(msg){
	util.alert(msg);
  }

  function reloadPg(msg){
	util.alert(msg,reloadPgCf);
  }
  
  function addFlowType(){
    var url='${path}/comm/WorkFlowAction_addFlowType.ms'+'?mcIframeName='+window.name;
    showPopWin(url, 600, 230,null,"<dict:lang value='新增类别' />");
  }
  
  function editFlowType(id,name){
    var url='${path}/comm/WorkFlowAction_editFlowType.ms?paraMap.flowId='+id+'&paraMap.flowName='+name+'&mcIframeName='+window.name;
    showPopWin(url, 600, 230,null,"<dict:lang value='修改类别' />");
  }
  
  var delId = "";var delObj;
	function delFlowType(id,obj){
		util.confirm(delConfirm,"<dict:lang value='是否确认删除？' />");
		delId = id;
		delObj=obj;
		
	}
	
	function delConfirm(){
        	$.ajax({
						url : "${path}comm/WorkFlowAction_delFlowType.ms",
						data: {'paraMap.flowTypeId':delId},						
						type : "post",
						dataType : "json",
						success : function(data) {
						    //console.log(data)
						    if(data.ajaxMap!=null){
							  alertInfo(data.ajaxMap.message);
							  if(data.ajaxMap.flag=='success')
							    $(delObj).parents('.layui-card').remove();
							}
						},
						error : function(msg) {
							util.closeLoading();
							alertInfo(msg);
						}
					});
	}
	
	function addProcessde(id){
      var url='${path}/comm/WorkFlowAction_addProcessde.ms'+'?paraMap.flowTypeId='+id+'&mcIframeName='+window.name;
      showPopWin(url, 800, 550,null,"<dict:lang value='新增流程' />");
    }
    
    function importProcessde(id){
      var url='${path}/comm/WorkFlowAction_addProcessde.ms'+'?paraMap.import=1&mcIframeName='+window.name;
      showPopWin(url, 800, 580,null,"<dict:lang value='导入' />"+"-"+"<dict:lang value='新增' />");
    }
    
    function delProcessde(id,obj){
		util.confirm(delProcessdeConfirm,"<dict:lang value='是否确认删除？' />");
		delId = id;
		delObj=obj;
		
	}
	
	function delProcessdeConfirm(){
        	$.ajax({
						url : "${path}comm/WorkFlowAction_delProcessde.ms",
						data: {'paraMap.flowId':delId},						
						type : "post",
						dataType : "json",
						success : function(data) {
						    
						    if(data.ajaxMap!=null){
						       alertInfo(data.ajaxMap.message);
							   if(data.ajaxMap.flag=='success')
							     $(delObj).parents('.card-item').remove();
						    }
							
						},
						error : function(msg) {
							util.closeLoading();
							alertInfo(msg);
						}
					});
	}
	
	function editProcessde(id,flowTypeId){
      var url='${path}/comm/WorkFlowAction_editProcessde.ms?paraMap.flowId='+id+'&mcIframeName='+window.name+'&paraMap.flowTypeId='+flowTypeId;
      showPopWin(url, 800, 580,null,"<dict:lang value='修改流程' />");
    }
	
	function editModel(processdefId)
	{
	   window.open("${path}comm/WorkFlowAction_sendapptoken.ms?processdefId="+processdefId,'_blank');        
	}
	
	function publish(id){
	  
        	$.ajax({
						url : "${path}comm/WorkFlowAction_publish.ms",
						data: {'paraMap.flowId':id},						
						type : "post",
						dataType : "json",
						success : function(data) {
						    
						    if(data.ajaxMap!=null){
						        //alertInfo(data.ajaxMap.message);
							   	top.util.alert(data.ajaxMap.message);
						    }
						    mcWindow.location.reload();
							
						},
						error : function(msg) {
							util.closeLoading();
							alertInfo(msg);
						}
					});
	}
	
  
  
  </script>
  <jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>
</body>
</html>

