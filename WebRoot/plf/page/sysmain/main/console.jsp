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
  <title>首页</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <jsp:include page="/plf/common/pub_head.jsp">
	  <jsp:param name="layui" value="1" />
	  <jsp:param name="pageWidth" value="1" />
  </jsp:include>
  <style>
  	html {
  		background-color: #f2f2f2;
  	}
  	
  	cite {
  		font-style: normal;
  	}
  	.layadmin-shortcut li a {
  		display: block;
  	}
  	.layadmin-shortcut li a:hover .iconfont {
  		background-color: #f2f2f2;
  		transition: all .3s;
        -webkit-transition: all .3s;
        color: #009688;
  	}
  	
  	.mc-about-info {
  		table-layout: fixed;
  	}
  	.mc-about-info tbody td {
  		white-space: nowrap;
  		overflow: hidden;
  		text-overflow: ellipsis;
  	}
  	
  </style>
</head>
<body>
  
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-xs8">
        <div class="layui-row layui-col-space15">
          <div class="layui-col-xs6">
            <div class="layui-card">
              <div class="layui-card-header"><%=CommMethodMc.getText("快捷方式") %></div>
              <div class="layui-card-body">
                
                <div class="layui-carousel layadmin-carousel layadmin-shortcut">
                  <div carousel-item id="shortcut">
                	
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="layui-col-xs6">
            <div class="layui-card">
              <div class="layui-card-header"><%=CommMethodMc.getText("业务资源") %></div>
              <div class="layui-card-body">
                <div class="layui-carousel layadmin-carousel layadmin-backlog">
                  <div carousel-item id="business">
                    <ul class="layui-row layui-col-space10">
                      <li class="layui-col-xs6">
                        <a class="layadmin-backlog-body">
                          <h3><%=CommMethodMc.getText("业务模型") %></h3>
                          <p><cite></cite></p>
                        </a>
                      </li>
                      <li class="layui-col-xs6">
                        <a class="layadmin-backlog-body">
                          <h3><%=CommMethodMc.getText("公共类") %></h3>
                          <p><cite></cite></p>
                        </a>
                      </li>
                      <li class="layui-col-xs6">
                        <a class="layadmin-backlog-body">
                          <h3><%=CommMethodMc.getText("触发器") %></h3>
                          <p><cite></cite></p>
                        </a>
                      </li>
                      <li class="layui-col-xs6">
                        <a class="layadmin-backlog-body">
                          <h3><%=CommMethodMc.getText("任务数") %></h3>
                          <p><cite></cite></p>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="layui-col-xs12 echartsSystemWrap">
            <div class="layui-card layui-layout-admin">
              <div class="layui-card-header layui-header systemHeader"><%=CommMethodMc.getText("监控系统") %>
              	
              	<div class="layui-nav">
             		<div class="layui-nav-item" lay-unselect>
	             		<a href="javascript:;">
							<cite id="currentIP"></cite>
						</a>
						<dl class="layui-nav-child">
							<dd style="text-align: center;" id="IPs">
								<a>127.0.0.1：8080</a>
								<a>127.0.0.1：8080</a>
							</dd>
						</dl>
					</div>
              	</div>
              	
              
              </div>
              <div class="layui-card-body layadmin-takerates">
                
                <div class="layui-carousel layadmin-carousel layadmin-dataview layui-row" data-anim="fade" lay-filter="LAY-index-dataview">
                  
                  <div class="layui-col-xs6">
                      <div class="LAY-index-dataview" style="padding-top: 30px; height: 203px">
                          <div class="layui-col-xs6" style="width:45%; height:180px; margin:0 2%;"></div>
                          <div class="layui-col-xs6" style="width:45%; height:180px; margin:0 2%;"></div>
                      </div>
                      <div class="layadmin-backlog">
                        <ul class="layui-row layui-col-space10 layui-this">
	                      <li class="layui-col-xs4">
	                        <a class="layadmin-backlog-body">
	                          <h3>session(<%=CommMethodMc.getText("个") %>)</h3>
	                          <p><cite id="session"></cite></p>
	                        </a>
	                      </li>
	                      <li class="layui-col-xs4">
	                        <a class="layadmin-backlog-body">
	                          <h3><%=CommMethodMc.getText("线程") %>(<%=CommMethodMc.getText("个") %>)</h3>
	                          <p><cite id="thread"></cite></p>
	                        </a>
	                      </li>
	                      <li class="layui-col-xs4">
	                        <a class="layadmin-backlog-body">
	                          <h3><%=CommMethodMc.getText("GC时间") %>(ms)</h3>
	                          <p><cite id="GC"></cite></p>
	                        </a>
	                      </li>
	                    </ul>
                      </div>
                  </div>
                  
                  <div class="layui-col-xs6">
                  	<div class="memoryWrap">
                  		<div class="layui-progress">
                  		  <h2 id="systemMemory"><span ></span></h2>
			              <h3><%=CommMethodMc.getText("系统内存") %></h3>
			              <div class="layui-progress-bar layui-bg-blue"></div>
			            </div>
			            <div class="layui-progress">
                  		  <h2 id="JVMMemory"><span ></span></h2>
			              <h3><%=CommMethodMc.getText("JVM内存") %></h3>
			              <div class="layui-progress-bar layui-red-blue"></div>
			            </div>
                  	</div>
                  	<div class="driverWrap" id="driverWrap" style="height:180px; overflow-y:auto">
                  	</div>
                  </div>
                
                  
                </div>
                
              </div>
            </div>
            
          </div>
        </div>
      </div>
      
      <div class="layui-col-xs4">
        <div class="layui-card">
          <div class="layui-card-header"><%=CommMethodMc.getText("摩尔云开发平台") %>（MC）</div>
          <div class="layui-card-body layui-text" style="height: 185px;">
            <table class="layui-table mc-about-info">
              <colgroup>
                <col width="140">
                <col>
              </colgroup>
              <tbody>
                <tr>
                  <td><%=CommMethodMc.getText("当前版本") %></td>
                  <td id="currentVersionNum">
                  	<%=com.more.fw.core.common.method.ConstantsMc.VERSION_NO%>
                  </td>
                </tr>
                <tr>
                  <td width="150"><%=CommMethodMc.getText("授权操作用户数") %></td>
                  <td>
                  	<span id="userCount"></span>
                  	<!--  
                    <script type="text/html" template>
                      layui-v{{ layui.v }}
                    </script>
                    -->
                 </td>
                </tr>
                <tr>
                  <td><%=CommMethodMc.getText("授权开发数") %></td>
                  <td><span id="developCount"></span></td>
                </tr>
                <tr>
                  <td><%=CommMethodMc.getText("授权到期日期") %></td>
                  <td>
                      <span id="etime"></span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        
        <div class="layui-card">
          <div class="layui-card-header"><%=CommMethodMc.getText("图表数据") %></div>
          <div class="layui-card-body LAY-index-dataview" style="height: 334px;">
              <div style="width:100%; height:100%;"></div>
          </div>
        </div>
        

      </div>
      
    </div>
  </div>


  
  <script>
  	//快捷方式
  	  $.ajax({
          type: "POST",
          url: "${path}buss/bussModel_findShortcutMenu.ms",
          dataType: "json",
          async:false, 
          success: function(data){
        	  var str = "";
    			str += "<ul class='layui-row layui-col-space10'>";
    			$.each(data.ajaxList, function(index, item){
    				str += "<li class='layui-col-xs3'><a　 lay-href='${path}"+ item.URL +"'><i class='iconfont' openType="+item.OPEN_TYPE+">" + item.IMG + "</i>	<cite>"+ item.NAME +"</cite></a></li>";
    	             if(index == 7){
    	    				if(data.ajaxList.length > 8){
    	    					str += "</ul><ul class='layui-row layui-col-space10'>";
    	    				}
    	             }
    		      	
    		    });	
    		    str += "</ul>";
    		    $('#shortcut').html(str);
          }
  	   });
  	    
  	    //业务资源
  	    $.getJSON("${path}buss/bussModel_findBusiness.ms",function(data){
  	    	$('#business li:eq(0) cite').html(data.ajaxMap.bussModelCount);
  	    	$('#business li:eq(1) cite').html(data.ajaxMap.classCodeCount);
  	    	$('#business li:eq(2) cite').html(data.ajaxMap.trigWorkCount);
  	    	$('#business li:eq(3) cite').html(data.ajaxMap.triggerModelCount);
  	    })
  	    
  	    //授权信息
  	    $.getJSON("${path}/sys/UserAction_listAllOnlineUserAx.ms",function(data){
  	    	$('#userCount').html((data.ajaxMap.opUser==null?0:data.ajaxMap.opUser.length) +' / ' + data.ajaxMap.opUserNo);
  	    	$('#developCount').html((data.ajaxMap.devUser==null?0:data.ajaxMap.devUser.length) +' / ' + data.ajaxMap.devUserNo);
  	    	$('#etime').html(data.ajaxMap.eDate);
  	    	$('#etime').attr('title',data.ajaxMap.eDate);
  	    });
  	    
  	    //监控系统
  	  
  	    $.getJSON("${path}performance/performanceMonitorAction_listPerformanceMonitor.ms",function(data){
  	    	var strIP = '';
  	    	$.each(data.ajaxMap.nodeDetailList,function(index,item){
  	    		strIP += "<a>" + item.NODEID + "</a>";
  	    	});
  	    	$('#IPs').html(strIP);
  	    	renderControl(data,0);	
  	    });
  	    
  	    function renderControl(data,index){
  	    	var nodeDetailList = data.ajaxMap.nodeDetailList[0];
  	    	var str = '';
  	    	$('#currentIP').html(nodeDetailList.NODEID);
  	    	
  	    	$('#session').html(nodeDetailList.SESSION_COUNT?nodeDetailList.SESSION_COUNT:0);
  	    	$('#thread').html(nodeDetailList.THREAD_COUNT?nodeDetailList.THREAD_COUNT :0);
  	    	$('#GC').html(nodeDetailList.DURING_TIME?nodeDetailList.DURING_TIME:0);
  	    	$('#systemMemory').html('<span>' + (nodeDetailList.INUSE_MEMORY?nodeDetailList.INUSE_MEMORY:0) + 'G</span>/' + (nodeDetailList.SYS_MEMORY_TOTAL?nodeDetailList.SYS_MEMORY_TOTAL:0) + 'G');
  	    	$('#systemMemory').nextAll('.layui-progress-bar').css('width',(nodeDetailList.INUSE_MEMORY?nodeDetailList.INUSE_MEMORY:0)/(nodeDetailList.SYS_MEMORY_TOTAL?nodeDetailList.SYS_MEMORY_TOTAL:0)*100 + '%');
  	    	$('#JVMMemory').html('<span>' + (nodeDetailList.JVM_MEMORY?nodeDetailList.JVM_MEMORY:0) + 'M</span>/' + (nodeDetailList.JVM_MEMORY_TOTAL?nodeDetailList.JVM_MEMORY_TOTAL:0) + 'M');
  	    	$('#JVMMemory').nextAll('.layui-progress-bar').css('width',(nodeDetailList.JVM_MEMORY?nodeDetailList.JVM_MEMORY:0)/(nodeDetailList.JVM_MEMORY_TOTAL?nodeDetailList.JVM_MEMORY_TOTAL:0)*100 + '%');
  	    	
  	    	
  			$.each(nodeDetailList.diskDetailList, function(index, item){
  					str += "<div class='layui-progress'>\
  	                  		  <h2>" + item.DRIVE + "</h2>\
  				              <h3><i>" + item.INUSE_DISK + "G</i>/" + item.DISK + "G</h3>\
  				              <div class='layui-progress-bar' style='width:" + ((item.INUSE_DISK/item.DISK)*100).toFixed(1) + "%'></div>\
  				            </div>";
  			})
  	    	$('#driverWrap').html(str);
  			
  			
  	    }
  	    
  	    $('#IPs').on('click','a',function(){
  	    	var index = $(this).index();
  	    	$.getJSON("${path}performance/performanceMonitorAction_listPerformanceMonitor.ms",function(data){	
  	    		renderControl(data,index);
  	    	});
  	    });
  	    
  </script>	
  
    <script>
  layui.config({
    base: '${path}plf/style/layui/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'console']);
  </script>
</body>
</html>

