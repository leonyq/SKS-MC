<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title><dict:lang value="设备监控"/></title>
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
    .displayFor1{
       display:none!important;
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
    .trcolor{
       background-color: rgb(224, 224, 224)!important;
    }
    .layui-layer-page .layui-layer-content {
      overflow:hidden!important;
    }
 .headline2 {
    margin-bottom: 0px;
    line-height: 50px;
}
.headline2 {
    line-height: 35px;
    height: 35px;
    font-size: 18px;
    
    
} 
.dmplink{
   font-size: 18px!important;
   vertical-align: middle;
   color: rgb(0, 150, 136);
}
.disableTab {
pointer-events: none;
padding:0 3px!important;
}  
 .removeBord {
    border:none;
 }
 .devicetitle{
 color: rgb(0, 150, 136);
 }
 #connum{
 font-weight: 700;
 color: #5ac048;
 }
 #disconnum{
 font-weight: 700;
 color: #e36352;
 }
  .layui-layer-content .layui-form {
    margin-top: 20px;
    margin-left: 8px!important;
    margin-right: 8px!important;
}
 
</style>

</head>

<body>
    <div class="layui-fluid">         
        <div class="layui-tab layui-tab-brief" lay-filter="tab">   
 
            <ul class="layui-tab-title">
                <span class="link dmplink" onclick="window.history.back();"  style="cursor:pointer;" ><dict:lang value="DMP服务"/></span> <li class="disableTab" ><div class="headline2 ">/<span id="dmpName"> ${dataMap.dmpServiceList[0].DMP_REMARK}</span></div></li>          
                <li style="float:right;"><span class="icon set"></span><dict:lang value="查看配置"/></li>
                <li style="float:right;"><span class="icon equipment"></span><dict:lang value="设备信息"/></li>
                <li style="float:right;" class="layui-this"><span class="icon performance"></span><dict:lang value="运行性能"/></li>
                
                
            </ul>
            
            <div class="layui-tab-content">
               <div class="layui-tab-item"></div>
                <div class="layui-tab-item" style="padding-bottom:78px;">
                	<div class="Subtitle">
                        <h3><dict:lang value="服务"/></h3>
                    </div>
                    <form class="layui-form searchDiv searchDivBig" id="serviceForm" action="">
			            <div class="layui-row">
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="组织机构"/></div>
			                    <div class="search_r" title="<dict:lang value='选择DMP所属的组织机构'/>">
			                        <select disabled class="condisabled" name="paraMap.dmpDataAuth" id="dmpDataAuth">

								    </select>
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="服务ID"/></div>
			                    <div class="search_r" title="<dict:lang value='DMP服务的唯一标识码，用户可自定义输入'/>">
			                        <input disabled  type="text" value="${dataMap.dmpServiceList[0].DMP_ID}" name="paraMap.serviceID" id="serviceID"  maxlength="30"  class="layui-input condisabled">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="服务说明"/></div>
			                    <div class="search_r" title="<dict:lang value='针对DMP服务的描述内容'/>">
			                       	<input disabled type="text" value="${dataMap.dmpServiceList[0].DMP_REMARK}" name="paraMap.serviceDetail" id="serviceDetail" maxlength="30" class="layui-input condisabled">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="MC地址"/></div>
			                    <div class="search_r" title="<dict:lang value='一般情况下为N2的访问地址'/>">
			                       	<input disabled   type="text" name="paraMap.MCaddr" id="MCaddr"  maxlength="30" class="layui-input condisabled">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="语种"/></div>
			                    <div class="search_r" title="<dict:lang value='DMP服务输出消息的语种'/>">
			                       	<select disabled class="condisabled" name="paraMap.languages" id="languages" >

								    </select>
			                    </div>
			                </div>
			            </div>
			        </form>
                    <div class="Subtitle">
                        <h3><dict:lang value="性能和属性"/></h3>
                    </div>
                    <form class="layui-form searchDiv searchDivSmall" id="paramForm" action="">
			            <div class="layui-row">
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="内部处理器数量"/></div>
			                    <div class="search_r" title="<dict:lang value='DMP服务内部执行任务调度的对象，增大或缩小会影响DMP处理效率，建议值为100，可根据设备数量增多进行增加'/>">
			                        <input disabled  type="text" placeholder="50" maxlength="30" class="layui-input condisabled valnum"  id="cpuNum" name="paraMap.cpuNum">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="接口请求超时时间(ms)"/></div>
			                    <div class="search_r" title="<dict:lang value='外部对象访问DMP服务的Http接口超时的时间，同样适用于PDA的Http驱动'/>">
			                        <input   type="text" placeholder="30000"  maxlength="30" disabled  class="layui-input condisabled valnum" id="overTime" name="paraMap.overTime">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="线程池最小容量"/></div>
			                    <div class="search_r" title="<dict:lang value='设置过小DMP服务会执行自动扩容，扩容会间断性的影响DMP服务内部任务的执行效率，建议值40，可随设备的增多进行增加'/>">
			                       	<input type="text" placeholder="10" maxlength="30" disabled  class="layui-input condisabled valnum" id="threadMinStorage" name="paraMap.threadMinStorage">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="线程池最大容量"/></div>
			                    <div class="search_r" title="<dict:lang value='设置过大会造成资源浪费，建议值150，可随设备的增多进行增加'/>">
			                       	<input type="text" placeholder="200" maxlength="30" disabled  class="layui-input condisabled valnum" id="threadMaxStorage" name="paraMap.threadMaxStorage">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="组件通道最大值"/></div>
			                    <div class="search_r" title="<dict:lang value='DMP服务内部任务缓存通道，当DMP执行效率降低时，设置过小会造成任务丢失，建议值500'/>">
			                       	<input type="text" placeholder="300" maxlength="30" disabled  class="layui-input condisabled valnum" id="passMax" name="paraMap.passMax">
			                    </div>
			                </div>
			                <div class="searchItem displayFor1">
			                    <div class="search_l"><dict:lang value="指令是否走缓存数据"/></div>
			                    <div class="search_r">
			                        <select id="isCache" name="paraMap.isCache" disabled  class="layui-input condisabled">
								        <option value=""></option>
								        <option value="Y"><dict:lang value="是"/></option>
								        <option value="N"><dict:lang value="否"/></option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem displayFor1">
			                    <div class="search_l"><dict:lang value="指令模式"/></div>
			                    <div class="search_r">
			                        <select id="orderType"  name="paraMap.orderType" disabled  class="layui-input condisabled">
								        <option value=""></option>
								        <option value="javaclass"><dict:lang value="Java类"/></option>
								        <option value="procedure"><dict:lang value="存储过程"/></option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem displayFor1">
			                    <div class="search_l"><dict:lang value="监控器池执行频率(ms)"/></div>
			                    <div class="search_r">
			                       	<input type="text"  id="monitorRate"  name="paraMap.monitorRate" maxlength="30" disabled  class="layui-input condisabled valnum">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="是否记录日志"/></div>
			                    <div class="search_r" title="<dict:lang value='是否记录DMP服务中指令运行的日志'/>">
			                        <select id="isLog" name="paraMap.isLog" disabled  class="layui-input condisabled">
								        <option value=""></option>
								        <option value="Y"><dict:lang value="是"/></option>
								        <option value="N"><dict:lang value="否"/></option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="掉线最大检测次数"/></div>
			                    <div class="search_r" title="<dict:lang value='设备异常掉线、人为关闭、网络异常时，DMP服务会对设备连接状态进行检测，当达到最大检测值时，DMP服务内部会触发设备掉线处理，建议值10'/>">
			                        <input type="text" placeholder="10" id="offLineMax" name="paraMap.offLineMax"  maxlength="30"  disabled  class="layui-input condisabled valnum">
			                    </div>
			                </div>
			                <div class="searchItem">
			                    <div class="search_l"><dict:lang value="Http接口最大请求数"/></div>
			                    <div class="search_r" title="<dict:lang value='外部对象访问DMP服务Http接口的最大数量，同样适用于PDA的Http驱动，建议值1000'/>">
                                     <input type="text" placeholder="1000" id="requestMax" name="paraMap.requestMax"   maxlength="30"  disabled  class="layui-input condisabled valnum">
			                    </div>
			                </div>
			                <div class="searchItem displayFor1">
			                    <div class="search_l"><dict:lang value="PDA接口连入方式"/></div>
			                    <div class="search_r">
			                        <select id="pdaType" name="paraMap.pdaType" disabled  class="layui-input condisabled">
								        <option value=""></option>
								        <option value="DMP"><dict:lang value="DMP"/></option>
								        <option value="N2"><dict:lang value="N2"/></option>
								    </select>
			                    </div>
			                </div>
			                <div class="searchItem displayFor1">
			                    <div class="search_l"><dict:lang value="运行日志保留天数"/></div>
			                    <div class="search_r">
			                       	<input type="text" id="logDay" name="paraMap.logDay" maxlength="30" disabled  class="layui-input condisabled valnum">
			                    </div>
			                </div>
			            </div>
			        </form>
                    <div class="Subtitle">
                        <h3><dict:lang value="设置IP池"/></h3>
                        <div class="operates">
	                        <span  class="ico add " id="addRow"></span>
	                        <span  class="ico del " id="delRow"></span>
	                    </div>
                    </div>
					<form class="layui-form searchDiv searchDivBig" id="ipForm" action="">
                    <div class="layui-form" lay-filter="ipTable">
					  <table class="layui-table ipTable">
					    <colgroup>
					      <col width="40">
					      <col>
					    </colgroup>
					    <thead>
					      <tr>
					        <th><input type="checkbox" lay-skin="primary" lay-filter="selectAll"></th>
					        <th><dict:lang value="起始IP"/></th>
					        <th><dict:lang value="结束IP"/></th>
					      </tr> 
					    </thead>
					    <tbody>

					    </tbody>
					  </table>
					  
					</div>
					</form>
                    <div class="ptop_10">
			            <button class="layui-btn" id="startService"><dict:lang value="保存并下发"/></button>   
			            <button class="layui-btn layui-btn-danger"  id="stopService"><dict:lang value="停止服务"/></button>   
			        </div> 
                </div> 
                                <div class="layui-tab-item" style="overflow:hidden">

				<span style="float:right;margin-right:14px;"><span class="devicetitle"><dict:lang value="已连接数"/>:</span>&nbsp;&nbsp;<span id="connum">0</span>&nbsp;&nbsp;<span class="devicetitle"><dict:lang value="未连接数"/>:</span>&nbsp;&nbsp;<span id="disconnum">0</span></span>

                	<div class="equipmentList">
           	
                	</div>
                	<div class="equipmentLog active">
                		<div class="logHead"><span class="pause" id="conInterval"></span><span id="logTitleWk"></span><span class="sub" id="logTitleIp"></span><span class="toClose" onclick="hideLog()"></span>
                		<input type="hidden" id="logTitleDeviceIp" value="">
                		<input type="hidden" id="logTitleDeviceType" value="">
                		</div>
                		<div class="logBody">
                			
                		</div>
                	</div>
                </div>              
                <div class="layui-tab-item layui-show">
                    <div class="charts">
                    	<div class="chartsBox">
	                        <div class="chart chart1">
	                        	<div class="chartBox">
	                        		<div class="chartLeft">
	                        			<div class="chartMain" id="chart1"></div>
	                        			<div class="legend"><span class="color"></span><dict:lang value="系统"/></div>
	                        		</div>
	                        		<div class="chartRight">
	                        			<div class="chartMain" id="chart2"></div>
	                        			<div class="legend"><span class="color"></span><dict:lang value="JVM"/></div>
	                        		</div>
	                        	</div>
	                        	<div class="tit"><dict:lang value="CPU"/></div>
	                        </div>
	                        <div class="chart chart2">
	                        	<div class="chartBox">
	                        		<div class="chartLeft">
	                        			<div class="chartMain" id="chart3"></div>
	                        			<div class="legend"><span class="color"></span><dict:lang value="系统"/></div>
	                        		</div>
	                        		<div class="chartRight">
	                        			<div class="chartMain" id="chart4"></div>
	                        			<div class="legend"><span class="color"></span><dict:lang value="JVM"/></div>
	                        		</div>
	                        	</div>
	                        	<div class="tit"><dict:lang value="内存"/></div>
	                        </div>
	                        <div class="data">
	                        	<div class="tit"><dict:lang value="线程"/></div>
	                        	<div class="item"><span class="name"><dict:lang value="总线程(个)"/></span><span id="thReadNum" class="num">0</span></div>
	                        	<div class="item"><span class="name"><dict:lang value="业务线程(个)"/></span><span id="poolThreadSize" class="num">0</span></div>
	                        	<div class="item"><span class="name"><dict:lang value="队列任务(个)"/></span><span id="poolQueueSize" class="num">0</span></div>
	                        </div>
                        </div>
                    </div>

                    <div class="Subtitle">
                        <h3><dict:lang value="任务性能记录"/></h3>
                    </div>
                    <form class="layui-form" id="searchForm" action="" method="post">
                    	<div class="searchBox">
                    		<div class="item">
                    			<span class="tit"><dict:lang value="任务进入时间"/></span>
                    			<input type="hidden" name="paraMap.DMP_ID" id="dmpId0" value="${dataMap.dmpServiceList[0].DMP_ID}">
                    			<input type="hidden" name="paraMap.DMP_FILEURL" id="fileUrl">
                    			<input type="text" name="paraMap.TFTL_IN_DATE_START" id="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">&nbsp;&nbsp;—&nbsp;&nbsp;
                    			<input type="text" name="paraMap.TFTL_IN_DATE_END" id="date1" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                    		</div>
                    		<div class="item">
                    			<span class="tit"><dict:lang value="任务名称"/></span>
                    			<input type="text" name="paraMap.TFTL_NAME" id="taskName" class="layui-input">
                    		</div>
	                    	<div class="operates">
				                <span class="ico search "></span>
				                <!-- <span class="ico export" ></span>  --> 
				            </div>
			            </div>
                    </form>
                    <div class="layui-form tableDiv" id="div1" lay-filter="task">
                    	<table id="taskList" lay-filter="task"></table>
                    </div>
                    <div class="leftTable">
                    	<div class="Subtitle">
	                       	<h3><dict:lang value="算法模型执行记录"/></h3>
	                    </div>
	                    <div class="tableDiv" id="div2" >
	                    	<table id="algList" lay-filter="alg"></table>
	                    </div>
                    </div>	
                    <div class="rightTable">
                    	<div class="Subtitle">
	                        <h3><dict:lang value="算法模型参数记录"/></h3>
	                    </div>
	                    <div class="tableDiv" id="div3" lay-filter="alg2">
	                    	<table id="algList2"></table>
	                    </div>
                    </div>
                </div>


            </div>
        </div>    
    </div>
    
<script type="text/javascript" src="${path}plf/page/bussmodel/dmp/js/echarts.js"></script>
<script>
    var totaldev = 0;
    var table;
    var logLength = 100;
    var myDate = new Date();
    var today = myDate.getFullYear() + "-" + (myDate.getMonth()+1) + "-" + myDate.getDate();
    var preday = myDate.getFullYear() + "-" + (myDate.getMonth()+1) + "-" + (myDate.getDate()-3); 
	layui.use(['element','form','laydate','table','layer'], function(){
        var element = layui.element;
        var laydate = layui.laydate;
        table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        $('.equipmentList').on('click','.cards2 .searchLog', function(){
        var iptitle = $(this).parents(".item").find(".p2").text();
        var devtype = $(this).parents(".item").find(".p3").val();
        $("#logTitleDeviceIp").val(iptitle);
        $("#logTitleDeviceType").val(devtype);
        	
	});
       /* $('.equipmentList').on('click','.cards2 .searchLog', function(){
        var iptitle = $(this).parents(".item").find(".p2").text();
        var devtype = $(this).parents(".item").find(".p3").val();
        $("#logTitleDeviceIp").val(iptitle);
        $("#logTitleDeviceType").val(devtype);
            layer.open({
                title: '查询日志',
                skin: 'layui-layer-molv',
                area: ['700px','480px'],
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


       $('.showBtn').click(function(){
              if($(this).closest('.cardPane').hasClass('open')){
                $(this).closest('.cardPane').removeClass('open')
                  }else{
                $(this).closest('.cardPane').addClass('open')
        }
     })
     */
//事件监听0000
   table.on('row(task)', function(obj){
    var data = obj.data; 
    loadAlgTable2(data.TFTL_ID);
    loadAlgTable3(data.TFTL_ID,"");
    if(obj.tr.hasClass("trcolor")){
    obj.tr.removeClass("trcolor");
    }else{
    $(".layui-table tr").each(function(){
      if($(this).hasClass("trcolor")){
      $(this).removeClass("trcolor");
      }
    });
    obj.tr.addClass("trcolor");
    }
  });
    table.on('row(alg)', function(obj){
    var data = obj.data;   
    loadAlgTable3(data.TFTL_ID,data.TFTRL_NAME);
    if(obj.tr.hasClass("trcolor")){
    obj.tr.removeClass("trcolor");
    }else{
    $(".layui-table tr").each(function(){
      if($(this).hasClass("trcolor")){
      $(this).removeClass("trcolor");
      }
    });
    obj.tr.addClass("trcolor");
    }
  });
//加载第二个TAB页的设备信息(初次加载)
var deviceInfo = null;
var deviceInfo0 = null;
var firstLoadFlag = true;//初始化标识
function getAllDevice(){
	    var url = "${path}dmp/DmpDeviceAction_initDevicePool.ms";
	    var dmpId0 =  $("#dmpId0").val();
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.DMP_ID":dmpId0},
	success: function(data){
	         $(".equipmentList").empty();
	         //var RESMSG  优化
             var wkList = data.ajaxMap.WKMSG;
             var lineList = data.ajaxMap.LINEMSG;
	         var deviceList = data.ajaxMap.DEVICEMSG;
	         deviceInfo = data.ajaxMap.DEVICEMSG;
		 deviceInfo0 = data.ajaxMap.DEVICEMSG;
		 totaldev = deviceList.length;
			 var html = "";
             for(var i=0;i<wkList.length;i++){
                 var wk0 = wkList[i].WKSN;//车间SN
				 var wkname = wkList[i].WKNAME;//车间名
                 html = html + "<div class='cardPane open' >"
				             + "<fieldset class='layui-elem-field layui-field-title'>" + "<legend>"+wkname+"</legend>"
							 + "<div class='more'><div onclick='moreClick($(this));' class='moreBtn showBtn'><span class='moreIco'></span></div></div></fieldset>"
							 + "<div class='layui-row cards2' id='WS_"+wk0+"'>";
				 for(var d=0;d<deviceList.length;d++){//匹配当前车间且不属于任何线别的设备
				    var wk2 = deviceList[d].WORKSHOP_SN;
					var wkName2 = deviceList[d].WORKSHOP_NAME;
					var line2 = deviceList[d].LINE_SN;
					var lineName2 = deviceList[d].LINE_NAME;
					var wsName = deviceList[d].WORKSTATION_NAME;
					var deviceId = deviceList[d].DEVICE_ID;
					var deviceIp = deviceList[d].DEVICE_IP;
					var deviceType =  deviceList[d].DEVICE_TYPE;
					if(wk0 == wk2 && line2 == ""){
					   html = html + "<div class='item' onclick='choicard($(this));' id='DEV_"+deviceId+"'>"
                                           + "<div class='p0' style='position:relative;width:50px;height:50px;'><span class='icon dmpdctred'></span></div>"
					   + "<div class='p1' style='position:absolute;right:10px;top:20px;'>" +wkName2+lineName2+wsName+ "</div>"
					   + "<div class='p2' style='position:absolute;right:10px;top:50px;'>" +deviceIp+ "</div><input type='hidden' class='p3' value='"+deviceType+"'>"
					   + "<div class='operates'>"
					   + "<span class='ico timeLog' title='<dict:lang value="实时日志"/>' onclick='showLog($(this))'></span>"
					   + "<span class='ico searchLog' title='<dict:lang value="日志文件"/>'></span>"
					   + "</div>"
					   + "</div>";
					}
				 }
				 html = html + "<div class='childCards'>";
				 for(var j=0;j<lineList.length;j++){//将子线别挂在车间底下
				 var wk1 = lineList[j].WKSN;
				 var line =  lineList[j].LINESN;
				 var lineName =  lineList[j].LINENAME;
				 if(wk1 == wk0 && line != "" ){
				    html = html + "<div class='cardPane open'>"
					+ "<fieldset class='layui-elem-field layui-field-title'>" + "<legend>"+lineName+"</legend>"
					+ "<div class='more'><div onclick='moreClick($(this));' class='moreBtn showBtn'><span class='moreIco'></span></div></div></fieldset>"
                    + "<div class='layui-row cards2' id='LINE_"+line+"'>";
				 for(var d2=0;d2<deviceList.length;d2++){//匹配该线别的设备
				    var wk22 = deviceList[d2].WORKSHOP_SN;
					var wkName22 = deviceList[d2].WORKSHOP_NAME;
					var line22 = deviceList[d2].LINE_SN;
					var lineName22 = deviceList[d2].LINE_NAME;
					var wsName22 = deviceList[d2].WORKSTATION_NAME;
					var deviceId2 = deviceList[d2].DEVICE_ID;
					var deviceIp2 = deviceList[d2].DEVICE_IP;
					var deviceType2 =  deviceList[d2].DEVICE_TYPE;
					if(wk0 == wk22 && line22 == line){
					   html = html + "<div class='item ' id='DEV_"+deviceId2+"'>"
					   + "<div class='p1'>" +wkName22+lineName22+wsName22+"</div>"
					   + "<div class='p2'>" +deviceIp2+ "</div><input type='hidden' class='p3' value='"+deviceType2+"'>"
					   + "<div class='operates'>"
					   + "<span class='ico timeLog' title='<dict:lang value="实时日志"/>' onclick='showLog($(this))'></span>"
					   + "<span class='ico searchLog' title='<dict:lang value="日志文件"/>'></span>"
					   + "</div>"
					   + "</div>";
					}

				 }
                 html = html + "</div></div>";

				 }
                 
				 }
				 html = html + "</div></div></div>";
			 }
			 $(".equipmentList").append(html);
			 //按钮事件
             btnEven();
			 form.render();
			 if(firstLoadFlag){
			 changeDevice();
			 firstLoadFlag = false;
		setInterval(function() {         
            changeDevice();               
          }, 2000);			 
			 }
			},
	error: function(msg){
	 //layer.msg(msg);			
			}
		}); 
}
////定时器加载
/* function changeDevice(){
	    var url = "${path}dmp/DmpDeviceAction_getAllDevice.ms";
	    var dmpId0 =  $("#dmpId0").val();
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.DMP_ID":dmpId0},
	success: function(data){	 
	         
	         //var RESMSG  优化
             var wkList = data.ajaxMap.WKMSG;
             var lineList = data.ajaxMap.LINEMSG;
	         var deviceList = data.ajaxMap.DEVICEMSG;
	         if(deviceList.sort().toString()==deviceInfo.sort().toString()){//相同不刷新
	           return ;
	         }else{
	         $(".equipmentList").empty();
	         deviceInfo = data.ajaxMap.DEVICEMSG;
			 var html = "";
             for(var i=0;i<wkList.length;i++){
                 var wk0 = wkList[i].WKSN;//车间SN
				 var wkname = wkList[i].WKNAME;//车间名
                 html = html + "<div class='cardPane open' >"
				             + "<fieldset class='layui-elem-field layui-field-title'>" + "<legend>"+wkname+"</legend>"
							 + "<div class='more'><div class='moreBtn showBtn'><span class='moreIco'></span></div></div></fieldset>"
							 + "<div class='layui-row cards2' id='WS_"+wk0+"'>";
				 for(var d=0;d<deviceList.length;d++){//匹配当前车间且不属于任何线别的设备
				    var wk2 = deviceList[d].WORKSHOP_SN;
					var wkName2 = deviceList[d].WORKSHOP_NAME;
					var line2 = deviceList[d].LINE_SN;
					var lineName2 = deviceList[d].LINE_NAME;
					var wsName = deviceList[d].WORKSTATION_NAME;
					var deviceId = deviceList[d].DEVICE_ID;
					var deviceIp = deviceList[d].DEVICE_IP;
					var deviceType =  deviceList[d].DEVICE_TYPE;
					if(wk0 == wk2 && line2 == ""){
					   html = html + "<div class='item ' id='DEV_"+deviceId+"'>"
					   + "<div class='p1'>" +wkName2+lineName2+wsName+ "</div>"
					   + "<div class='p2'>" +deviceIp+ "</div><input type='hidden' class='p3' value='"+deviceType+"'>"
					   + "<div class='operates'>"
					   + "<span class='ico timeLog' onclick='showLog($(this))'></span>"
					   + "<span class='ico searchLog'></span>"
					   + "</div>"
					   + "</div>";
					}
				 }
				 html = html + "<div class='childCards'>";
				 for(var j=0;j<lineList.length;j++){//将子线别挂在车间底下
				 var wk1 = lineList[j].WKSN;
				 var line =  lineList[j].LINESN;
				 var lineName =  lineList[j].LINENAME;
				 if(wk1 == wk0 && line != "" ){
				    html = html + "<div class='cardPane open'>"
					+ "<fieldset class='layui-elem-field layui-field-title'>" + "<legend>"+lineName+"</legend>"
					+ "<div class='more'><div class='moreBtn showBtn'><span class='moreIco'></span></div></div></fieldset>"
                    + "<div class='layui-row cards2' id='LINE_"+line+"'>";
				 for(var d2=0;d2<deviceList.length;d2++){//匹配该线别的设备
				    var wk22 = deviceList[d2].WORKSHOP_SN;
					var wkName22 = deviceList[d2].WORKSHOP_NAME;
					var line22 = deviceList[d2].LINE_SN;
					var lineName22 = deviceList[d2].LINE_NAME;
					var wsName22 = deviceList[d2].WORKSTATION_NAME;
					var deviceId2 = deviceList[d2].DEVICE_ID;
					var deviceIp2 = deviceList[d2].DEVICE_IP;
					var deviceType2 =  deviceList[d2].DEVICE_TYPE;
					if(wk0 == wk22 && line22 == line){
					   html = html + "<div class='item ' id='DEV_"+deviceId2+"'>"
					   + "<div class='p1'>" +wkName22+lineName22+wsName22+"</div>"
					   + "<div class='p2'>" +deviceIp2+ "</div><input type='hidden' class='p3' value='"+deviceType2+"'>"
					   + "<div class='operates'>"
					   + "<span class='ico timeLog' onclick='showLog($(this))'></span>"
					   + "<span class='ico searchLog'></span>"
					   + "</div>"
					   + "</div>";
					}

				 }
                 html = html + "</div></div>";

				 }
                 
				 }
				 html = html + "</div></div></div>";
			 }
			 $(".equipmentList").append(html);
			 //按钮事件
             btnEven();
			 form.render();	         
	         }
	         
			},
	error: function(msg){
	 layer.msg(msg);			
			}
		}); 
}*/
var reconnectFlag = false;//重连标识
function changeDevice(){
	    var url = "${path}dmp/DmpDeviceAction_getAllDevice.ms";
	    var dmpId0 =  $("#dmpId0").val();
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.DMP_ID":dmpId0},
	success: function(data){	 
	         
	         //var RESMSG  优化
             var wkList = data.ajaxMap.WKMSG;
             var lineList = data.ajaxMap.LINEMSG;
	         var deviceList = data.ajaxMap.DEVICEMSG;//定时器请求获得的设备数据；deviceInfo 为缓存的设备数据
	         var res =  data.ajaxMap.RESMSG;
	         var nowdev = 0;
		 if(res=="FAILCONNECT"){//dmp被关闭，断线
		      reconnectFlag = true;
		      $("#connum").text("0");
		      $("#disconnum").text("0");		      
		      $(".equipmentList").empty();//表格清空
		      deviceInfo = null;                         //缓存清空
		      return false;
		 }else{//正常状态
		      if(reconnectFlag==true){//断线后第一次重连,重置
		       reconnectFlag = false;
		       getAllDevice();
		       return false;
		}
		}
		 nowdev = deviceList.length;
		 $("#connum").text(nowdev);
		 $("#disconnum").text(totaldev - nowdev);
	         if(JSON.stringify(deviceList)==JSON.stringify(deviceInfo)){//相同不刷新
	
	           return false;
	         }else{
		 var deviceIdStorage = {};
	         //缓存的deviceID放进暂存数组
                 for(var i=0;i<deviceInfo.length;i++){
		     deviceIdStorage[deviceInfo[i].DEVICE_ID] = deviceInfo[i].DEVICE_ID;
		 }
		 //比较设备结构是否相同
		 for(var j=0;j<deviceList.length;j++){//请求获得的设备数据
		       var deviceId0 = deviceList[j].DEVICE_ID;//设备ID
		       var workShop0 = deviceList[j].WORKSHOP_SN;//车间
               var workShopName0 =  deviceList[j].WORKSHOP_NAME;//车间名称                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Name0 =  deviceList[j].WORKSHOP_NAME;//车间名称
		       var line0 = deviceList[j].LINE_SN;//线别
               var lineName0 = deviceList[j].LINE_NAME;//线别名称
               var workStationName0 = deviceList[j].WORKSTATION_NAME;//工作中心名称
		       var ip0 = deviceList[j].DEVICE_IP;//ip
			   var deviceType = deviceList[j].DEVICE_TYPE;//类别
			   var getFlag = false;
		    for(var k=0;k<deviceInfo.length;k++){//页面缓存的设备数据
		       var deviceId1 = deviceInfo[k].DEVICE_ID;//设备ID
		       var workShop1 = deviceInfo[k].WORKSHOP_SN;//车间
               var workShopName1 =  deviceInfo[k].WORKSHOP_NAME;//车间名称
		       var line1 = deviceInfo[k].LINE_SN;//线别
               var lineName1 = deviceInfo[k].LINE_NAME;//线别名称
               var workStationName1 = deviceInfo[k].WORKSTATION_NAME;//工作中心名称
		       var ip1 = deviceInfo[k].DEVICE_IP;//ip		       
		       if(deviceId0==deviceId1){//找到相同的设备22222 deviceInfo0
		       getFlag = true;
		       delete deviceIdStorage[deviceId1];
                       //开始判断是否更新该设备
		       if(workShop1==workShop0 && line1==line0){//判断结构是否变动
		          if(workShopName0==workShopName1 && lineName0==lineName1 && workStationName0==workStationName1 && ip0 == ip1){//判断信息是否变动	          
                           break;  
			  }else{
			   removeDeviceDiv(deviceId1);
               addDeviceDiv(deviceId0,workShop0,workShopName0,line0,lineName0,workStationName0,ip0,deviceType,"on");
               break;
			  }
		       }else{
			   removeDeviceDiv(deviceId1);
               addDeviceDiv(deviceId0,workShop0,workShopName0,line0,lineName0,workStationName0,ip0,deviceType,"on");	
               break;	       
		       }
		       break;
		       }
		       if(k==deviceInfo.length-1){//最后一次
		       if(getFlag==false){//未匹配到设备，请求中当前的设备为新启动的
		          removeDeviceDiv(ip0+"@NULL");
		          addDeviceDiv(deviceId0,workShop0,workShopName0,line0,lineName0,workStationName0,ip0,deviceType,"on");
		       }
		       }
		    }
		    if(JSON.stringify(deviceList)!="[]" && JSON.stringify(deviceInfo)=="[]"){//被置空后
		     removeDeviceDiv(ip0+"@NULL");
		     addDeviceDiv(deviceId0,workShop0,workShopName0,line0,lineName0,workStationName0,ip0,deviceType,"on");
		     //getAllDevice();
		    }
		 }
		      //缓存中存在请求中没有的设备，应修改为未连接
                 for(var key in deviceIdStorage){
		                 var str = "";
                                 str =  deviceIdStorage[key];
		                 if(str.indexOf("NULL")==-1){//原已连接设备掉线
				 var ip = deviceIdStorage[key].replace("DEV_","").replace("@DCT","").replace("@PDA","");
				 removeDeviceDiv(deviceIdStorage[key]);
				 addDeviceDiv(ip+"@NULL","","","","","",ip,"","off");				 
				 }
				 }
                  btnEven();
		 form.render();	
		 
	         }	
	         //判断车间，  线别底下是否 有设备，没有就删除
             $(" .cardPane  .cards2").each(function(){
             var length1 = $(this).children(".item").length;
             var length2 = $(this).find(".childCards").children(".cardPane").length;
             if(length1==0 && length2==0){
             $(this).parent(".cardPane").remove();
             }
             })
             deviceInfo = deviceList;
			},
	error: function(msg){			
			}
		}); 
}

function addDeviceDiv(deviceid,wsid,wsname,lineid,linename,wksname,ip,deviceType,constatus){//div添加
  var deviceobj = document.getElementById("DEV_"+deviceid);
    var headStr = "<div class='item' onclick='choicard($(this));' id='DEV_"+deviceid+"'>";
  var p0Str = "";
  var p1Str = "<div class='p1' style='position:absolute;right:10px;top:20px;'>"+wsname+linename+wksname+"</div>";
  var p2Str = "<div class='p2' style='position:absolute;right:10px;top:50px;'>"+ip+"</div>";
  var p3Str = "<input type='hidden' class='p3' value='"+deviceType+"'>";
  var operateStr = "<div class='operates'><span class='ico timeLog' title='<dict:lang value="实时日志"/>' onclick='showLog($(this))'></span><span class='ico searchLog' title='<dict:lang value="日志文件"/>'></span></div></div>";
  if(constatus=="on" && deviceType=="PDA"){
     p0Str = "<div class='p0' style='position:relative;width:50px;height:50px;'><span class='icon dmppdagreen'></span></div>";
  }else if(constatus=="on" && deviceType=="DCT"){
     p0Str = "<div class='p0' style='position:relative;width:50px;height:50px;'><span class='icon dmpdctgreen'></span></div>";
  }else if(constatus=="off" && deviceType=="PDA"){
     p0Str = "<div class='p0' style='position:relative;width:50px;height:50px;'><span class='icon dmppdared'></span></div>"; 
  }else if(constatus=="off" && deviceType=="DCT"){
     p0Str = "<div class='p0' style='position:relative;width:50px;height:50px;'><span class='icon dmpdctred'></span></div>";
  }else{
     p0Str = "<div class='p0' style='position:relative;width:50px;height:50px;'><span class='icon dmpdctred'></span></div>";
  }
  var divStr = headStr + p0Str + p1Str + p2Str + p3Str + operateStr ;
  if(wsid!=""){
  var wsobj = $("#WS_"+wsid);
  if(wsobj.length==0){//添加车间
    $(".equipmentList").prepend("<div class='cardPane open'><fieldset class='layui-elem-field layui-field-title'><legend>"+wsname+"</legend><div class='more'><div onclick='moreClick($(this));' class='moreBtn showBtn'><span class='moreIco'></span></div></div></fieldset><div class='layui-row cards2' id='WS_"+wsid+"'><div class='childCards'></div></div></div>");
  } 
  if(lineid!=""){
  var lineobj = $("#LINE_"+lineid);
  if(lineobj.length==0){//添加线别
    $("#WS_"+wsid).find(".childCards").prepend("<div class='cardPane open'><fieldset class='layui-elem-field layui-field-title'><legend>"+linename+"</legend><div class='more'><div onclick='moreClick($(this));' class='moreBtn showBtn'><span class='moreIco'></span></div></div></fieldset><div class='layui-row cards2' id='LINE_"+lineid+"'></div></div>");
  } 
  $("#LINE_"+lineid).prepend(divStr);

  }else{//设备直属车间
  $("#WS_"+wsid).prepend(divStr);
  }
  }else{//设备无车间
  if($("#WS_").length==0){
   $(".equipmentList").prepend("<div class='cardPane open'><fieldset class='layui-elem-field layui-field-title'><legend>"+wsname+"</legend><div class='more'><div onclick='moreClick($(this));' class='moreBtn showBtn'><span class='moreIco'></span></div></div></fieldset><div class='layui-row cards2' id='WS_"+wsid+"'><div class='childCards'></div></div></div>");
   $("#WS_").prepend(divStr);
  }else{
   $("#WS_").prepend(divStr);  
  }  
  }
  
}
function  removeDeviceDiv(deviceid){//div删除
  var deviceDom = document.getElementById("DEV_"+deviceid);
  var deviceDiv = $(deviceDom);
  deviceDiv.remove();
}
  		var str = '<form class="layui-form">\
                        <div class="searchBox">\
                    		<div class="item">\
                    			<span class="tit"><dict:lang value="进入时间"/></span>\
                    			<input type="text" id="date2" value="'+preday+'" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">&nbsp;&nbsp;—&nbsp;&nbsp;\
                    			<input type="text" id="date3" value="'+today+'" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">\
                    		</div>\
			            </div>\
                    </form>\
                    <div class="layui-form tableDiv"  >\
                    <table id="logList">\
                    </table>\
                    </div>\
                    <div class="ptop_10" style="z-index:1000" >\
              <button type="button" class="layui-btn searchTimeLog" onclick="searchLogFile($(this));" lay-filter="filterSubmit" ><dict:lang value="查询"/></button>\
             <button type="button" class="view layui-btn layui-btn-danger" onclick="op2();"><dict:lang value="预览"/></button>\
             <button type="button" class="layui-btn layui-btn-danger downLoad" onclick="download();"><dict:lang value="下载"/></button>\
                    </div>\
                    ';                    
   function btnEven(){
  		$('.equipmentList').on('click','.cards2 .searchLog', function(){
            layer.open({
                title: '<dict:lang value="查询日志"/>',
                skin: 'layui-layer-molv',
                area: ['730px','520px'],
                type: 1, 
                id: 'layerDemo', //防止重复弹出
                content: str,
		scrollbar: false,
                shade: 0.3 
            });
            laydate.render({
			    elem: '#date2'
		  	});
		  	
		  	laydate.render({
		    	elem: '#date3'
		  	});
		  	searchLogFile();
        })


       $('.showBtn').click(function(){
              if($(this).closest('.cardPane').hasClass('open')){
                $(this).closest('.cardPane').removeClass('open')
                  }else{
                $(this).closest('.cardPane').addClass('open')
        }
          })
  } 
  //服务启停控制
  $("#startService").on('click',function(){
    saveDeviceInfo();    
    form.render();
  }) 
  $("#stopService").on('click',function(){
    $(".condisabled").attr("disabled",false);
	var len = "";
		    //删除行
	    $('#delRow').click(function(){
	    	$('.ipTable tbody input[type="checkbox"]:checked').parents('tr').remove()
	    })
	    
	    //添加行
	    $('#addRow').click(function(){
		    len = $('.ipTable tbody tr').length;
	    	$('.ipTable tbody').append('<tr><td><input type="checkbox" lay-skin="primary"></td><td><input type="text"  name="paraMap.sip'+len+'"  id="sip'+len+'" class=" removeBord layui-input condisabled valip" onblur="validateIp($(this))"></td><td><input type="text" name="paraMap.eip'+len+'"  id="eip'+len+'" class="removeBord layui-input condisabled valip" onblur="validateIp($(this))"></td></tr>')
	    	form.render('checkbox', 'ipTable') 
	    	$(".layui-tab-item.layui-show").scrollTop($(".layui-tab-item.layui-show")[0].scrollHeight); //滚动到最底
	    })  
        

	stopService();      
    form.render();
  })

  //启动服务请求
  function startService(){
	    var url = "${path}dmp/DmpDeviceAction_startService.ms";
	    var dmpId0 =  $("#dmpId0").val();
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
		async:false,
	    url: url,
	    data: {"paraMap.DMP_ID":dmpId0},
	success: function(data){
            var res = data.ajaxString;
	    if(res=="SUCCESS"){
		    layer.msg("<dict:lang value='保存并下发成功'/>", {time: 1000, icon:6});
		    $(".condisabled").attr("disabled",true);
            $('#addRow').unbind(); 
            $('#delRow').unbind(); 
	    }else if(res=="RUNNING"){
	    layer.msg("<dict:lang value='已处于启动状态'/>", {time: 1000, icon:5});
	    }else{
	    layer.msg("<dict:lang value='启动失败'/>", {time: 1000, icon:5});
	    }  
			},
	error: function(msg){
	 layer.msg(msg);			
			}
		});      
  }
  //停止服务请求
  function stopService(){
	    var url = "${path}dmp/DmpDeviceAction_stopService.ms";
	    var dmpId0 =  $("#dmpId0").val();
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.DMP_ID":dmpId0},
	success: function(data){
            var res = data.ajaxString;
	    if(res=="SUCCESS"){
	    layer.msg("<dict:lang value='停止成功'/>", {time: 1000, icon:6});
	    }else if(res=="CLOSED"){
	    layer.msg("<dict:lang value='已处于停止状态'/>", {time: 1000, icon:5});
	    }else{
	    layer.msg("<dict:lang value='停止失败'/>", {time: 1000, icon:5});
	    }
			},
	error: function(msg){
	    //layer.msg(msg);		
			}
		});    
  }
  //保存参数，IP池到数据库  serviceForm   paramForm ipForm
  function saveDeviceInfo(){
    var ipPool = [];
	var ipCon = {};
	var len = $(".ipTable tbody tr").length;
    for(var i=0;i<len;i++){
	  ipCon = {};
      ipCon["SIP"] = $("#sip"+i).val();
	  ipCon["EIP"] = $("#eip"+i).val();
      ipPool.push(ipCon);
	}
    var url = "${path}dmp/DmpDeviceAction_saveDeviceInfo.ms";
    var dmpId0 =  $("#dmpId0").val();
	    jQuery.ajax({
		type: "POST",
		async:false,
	    dataType: "json",
	    url: url,
	    data: {"paraMap.DMP_ID":dmpId0,"paraMap.dmpDataAuth":$("#dmpDataAuth").val(),"paraMap.languages":$("#languages").val(),
	           "paraMap.cpuNum":$("#cpuNum").val(),"paraMap.overTime":$("#overTime").val(),"paraMap.threadMinStorage":$("#threadMinStorage").val(),
	           "paraMap.threadMaxStorage":$("#threadMaxStorage").val(),"paraMap.passMax":$("#passMax").val(),"paraMap.isCache":$("#isCache").val(),
	           "paraMap.orderType":$("#orderType").val(),"paraMap.monitorRate":$("#monitorRate").val(),"paraMap.isLog":$("#isLog").val(),
	           "paraMap.offLineMax":$("#offLineMax").val(),"paraMap.requestMax":$("#requestMax").val(),"paraMap.pdaType":$("#pdaType").val(),
	           "paraMap.logDay":$("#logDay").val(),"paraMap.ipPool":JSON.stringify(ipPool)},
	success: function(data){
			var res = data.ajaxString;
			if(res=="SUCCESS"){
                startService();					
			  }else if(res=="IPERR"){
			    layer.msg("<dict:lang value='IP不合法,请更换'/>", {time: 1000, icon:5});
			  }else if(res.indexOf("IPOVER")!=-1){
			    layer.msg(res.replace("IPOVER","")+"<dict:lang value='起始IP和结束IP不在同一个IP段,请更换'/>", {time: 1000, icon:5});
			  }else if(res=="FAIL" || res=="CODEERR"){
			    layer.msg("<dict:lang value='保存并下发失败'/>", {time: 1000, icon:5});
			  }else{
			    layer.msg(res+"<dict:lang value='IP区间存在交叉,请更换'/>", {time: 1000, icon:5});
			  }
			},
	error: function(msg){
	    //layer.msg(msg);		
			}
		});      
  }
//初始化加载第一条数据
   
        
        laydate.render({
		    elem: '#date'
	  	});
	  	
	  	laydate.render({
	    	elem: '#date1'
	  	});
		  
		var table1 = table.render({
		    id:'taskList',
		    elem: '#taskList',
		    url: '${path}dmp/DmpDeviceAction_getTaskLogModel.ms', //数据接口  DmpAction_fetchAlgorithModelList.ms
		    page: true, //开启分页
		    method: 'post',
		    height: 316,
		    limits:[10,20,50,100],
		    where:{"FUNC_CODE":"F_cbd32e831f17482ba175e47150ef4b8f","paraMap.DMP_ID":"${dataMap.dmpServiceList[0].DMP_ID}"},
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
		       //{checkbox: true,fixed:'left'},
		       {field: 'TFTL_NAME', title: '<dict:lang value="任务名称"/>', sort: true, width: 560},
		       {field: 'TFTL_IN_DATE', title: '<dict:lang value="任务进入时间"/>', sort: true, width: 210},		       
		       {field: 'TFTL_WAIT', title: '<dict:lang value="等待处理时间"/>', sort: true, width: 135},
		       {field: 'TFTL_PROCE', title: '<dict:lang value="处理时间"/>', sort: true, width: 105},
		       {field: 'TFTL_RES_WAIT', title: '<dict:lang value="发送等待时间"/>', sort: true, width: 135},
		       {field: 'TFTL_RES', title: '<dict:lang value="发送时间"/>', sort: true, width: 105},
		       {field: 'TFTL_PROCE_DATE', title: '<dict:lang value="任务开始处理时间"/>', sort: true, width: 210},
		       {field: 'TFTL_PROCE_EN_DATE', title: '<dict:lang value="任务处理结束时间"/>', sort: true, width: 210},
		       {field: 'TFTL_OUT_DATE', title: '<dict:lang value="结果发送开始时间"/>', sort: true, width: 210},
		       {field: 'TFTL_OUT_EN_DATE', title: '<dict:lang value="结果发送结束时间"/>', sort: true, width: 210},
		       {field: 'TFTL_ID', title: '<dict:lang value="任务ID"/>', sort: true, width: 320}		       		       		       
		    ]],
		    
		    done: function(res, curr, count){
		    	currPage = curr;
		    }
		});
		//第一个TABLE初始化
		 var reloadTable1 = function(){
	      var formData = {};
		  formData["FUNC_CODE"] = "F_cbd32e831f17482ba175e47150ef4b8f";
		  formData["paraMap.TFTL_IN_DATE_START"] = $("#date").val();
		  formData["paraMap.TFTL_IN_DATE_END"] = $("#date1").val();
		  formData["paraMap.TFTL_NAME"] = $("#taskName").val();
		  formData["paraMap.DMP_ID"] = $("#dmpId0").val();
		  table1.reload({
			  where: formData,
			  page: {
			    curr: currPage
			  }
		  });
	   }
	   	$('.search').click(function(){
			reloadTable1();		
       });
       
       function loadAlgTable2(taskId){
            var formData = {};
            formData["paraMap.TFTL_ID"] = taskId;
            formData["FUNC_CODE"] = "F_b12dbdfb400742e18c2bc59671ce99e0";
 			table.render({
		    id:'algList',
		    elem: '#algList',
		    url: '${path}dmp/DmpDeviceAction_getAlgModel.ms', //数据接口
		    page: false, //开启分页
		    method: 'post',
		    height: 277,
		    limits:[10,20,50,100],
		    where:formData,
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
		       //{checkbox: true,fixed:'left'},
		       {field: 'TFTRL_NAME', title: '<dict:lang value="算法模型"/>',width: 250},
		       {field: 'TFTRL_PROCE_MIL', title: '<dict:lang value="执行时间"/>',width: 150},
		       {field: 'TFTRL_ST_DATE', title: '<dict:lang value="开始时间"/>', width: 240},
		       {field: 'TFTRL_EN_DATE', title: '<dict:lang value="结束时间"/>', width: 240}
		    ]],
		    done: function(res, curr, count){
		    	currPage = curr;
		    }
		});        
       }
       function loadAlgTable3(taskId,algName){
            var formData = {};
            formData["paraMap.TFTL_ID"] = taskId;
            formData["paraMap.TFTRL_NAME"] = algName;
            formData["FUNC_CODE"] = "F_b12dbdfb400742e18c2bc59671ce99e0";
 		    table.render({
		    id:'algList2',
		    elem: '#algList2',
		    url: '${path}dmp/DmpDeviceAction_getAlgParamModel.ms', //数据接口
		    page: false, //开启分页
		    method: 'post',
		    height: 277,
		    limits:[10,20,50,100],
		    where:formData,
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
		       //{checkbox: true,fixed:'left'},
		       {field: 'TFTRL_NAME', title: '<dict:lang value="算法模型"/>',width: 250},
		       {field: 'TFTPL_NAME', title: '<dict:lang value="参数名"/>', width: 155},
		       {field: 'TFTPL_VALUE', title: '<dict:lang value="参数值"/>',width: 250},
		       {field: 'TFTPL_TYPE', title: '<dict:lang value="类型"/>', width: 70}
		    ]],
		    done: function(res, curr, count){
		    	currPage = curr;
		    }
		});      
       }
       function getTab3Msg(){
	    var url = "${path}dmp/DmpDeviceAction_getSettingInfo.ms";
	    var dmpId0 =  $("#dmpId0").val();
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.DMP_ID":dmpId0},
	success: function(data){
             var mcAddr = data.ajaxString;
             var deptList = data.ajaxMap.DEPT;
             var langList = data.ajaxMap.LANGUAGE;
	         var deviceList = data.ajaxMap.DEVICEINFO;
             var ipPoolList = data.ajaxMap.IPPOOL;
              $("#MCaddr").val(mcAddr);
               for(var i=0;i<deptList.length;i++){              
                 var key = deptList[i].ID;
                 var val = deptList[i].NAME;
                 $("#dmpDataAuth").append("<option value='"+key+"'>"+val+"</option>");
              }      
              for(var i=0;i<langList.length;i++){              
                 var key = langList[i].LANGUAGE_CODE;
                 var val = langList[i].LANGUAGE_NAME;
                 $("#languages").append("<option value='"+key+"'>"+val+"</option>");
              } 
              for(var i=0;i<deviceList.length;i++){              
                 var code = deviceList[i].PARAM_FLAG;
                 var value = deviceList[i].PARAM_VALUE;
                 if(code=="service.dataauth"){
		          $("#dmpDataAuth").val(value);
		          continue;
		         }
                 if(code=="host.lang"){
		          $("#languages").val(value);
		          continue;
		         }
                if(code=="service.maxprocessor"){
		          $("#cpuNum").val(value);
		          continue;
		         }
                if(code=="service.request.waitinterval"){
		          $("#overTime").val(value);
		          continue;
		         }
                if(code=="service.minpoolsize"){
		          $("#threadMinStorage").val(value);
		          continue;
		         }
               if(code=="service.maxpoolsize"){
		          $("#threadMaxStorage").val(value);
		          continue;
		         }
               if(code=="component.channelsize"){
		          $("#passMax").val(value);
		          continue;
		         }
               if(code=="instr.isbufferinfo"){
		          $("#isCache").val(value);
		          continue;
		         }
               if(code=="instr.mode"){
		          $("#orderType").val(value);
		          continue;
		         }
               if(code=="host.monitorexcute.interval"){
		          $("#monitorRate").val(value);
		          continue;
		         }
               if(code=="host.logiclogger"){
		          $("#isLog").val(value);
		          continue;
		         }
               if(code=="dev.auto.disconnectiontimes"){
		          $("#offLineMax").val(value);
		          continue;
		         }
             if(code=="http.maxrequester"){
		          $("#requestMax").val(value);
		          continue;
		         }
             if(code=="http.pda.interfacetype"){
		          $("#pdaType").val(value);
		          continue;
		         }
             if(code=="host.runlogger.saveday"){
		          $("#logDay").val(value);
		          continue;
		         }
              }	      
	          for(var i=0;i<ipPoolList.length;i++){             
                    var sip = ipPoolList[i].START_IP;
					var eip = ipPoolList[i].END_IP;
              $(".ipTable tbody").append("<tr></tr>");
			  $(".ipTable tbody tr:last").append("<td><input type='checkbox' lay-skin='primary'></td>");
			  $(".ipTable tbody tr:last").append("<td><input type='text' disabled name='paraMap.sip"+i+"' id='sip"+i+"' onblur='validateIp($(this))' class='removeBord layui-input condisabled valip'   value='"+sip+"'></td>");
			  $(".ipTable tbody tr:last").append("<td><input type='text' disabled name='paraMap.eip"+i+"' id='eip"+i+"' onblur='validateIp($(this))' class='removeBord layui-input condisabled valip' value='"+eip+"'></td>");
               	 $(".valnum").on('blur',function(){
                   validateNum($(this));
                 })     
			  }
             form.render();
			},
	error: function(msg){
				
			}
		});        
       }
		

		//当标签切换到第一页时重新渲染table
		element.on('tab(tab)', function(data){
		    if(data.index == 0){
		    	table1.reload()
		    	//table2.reload()
		    	//table3.reload()
		    }
		});
		

 
        
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
    	

	    
	    //是否取消全选
	    form.on('checkbox(selectAll)', function(data){
            if(data.elem.checked){
                $('.ipTable').find('input[type="checkbox"]').prop("checked",true)
            }else{
                $('.ipTable').find('input[type="checkbox"]').prop("checked",false)
            }
            form.render('checkbox', 'ipTable') 
        }); 
        $(function(){
        getTab3Msg();
        getAllDevice(); 
        
        })
	});
	  ////////////////////////layui  
	      
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
    
    

    
    $('.cards2 .item').click(function(){
    	$('.cards2 .item').removeClass('active')
        $(this).addClass('active')
    });
    
    //展示右侧日志
    var timeFlag = true;
    var intervalId1;
    function setTimeIntervalId(id,type,ip){
           timeFlag=true;
           intervalId1 =  setInterval(function() {
           var l =  $(".logBody").find("p").length;
           if(l>logLength){//超过100次请求，将之前的请求清除
           $(".logBody").find("p").eq(0).remove();
           }
                getDeviceLog(id,type,ip);
                $(".logBody").scrollTop($(".logBody")[0].scrollHeight); //滚到最底
          }, 1000);
    }
    function showLog(obj){
        var wktitle = obj.parents(".item").find(".p1").text();
        var iptitle = obj.parents(".item").find(".p2").text();
        var devtype = obj.parents(".item").find(".p3").val();    
        if(devtype==""){
        layer.msg("<dict:lang value='设备未连接'/>", {time: 1000, icon:5});
        return false;
        }
        if($('.equipmentList').parents('.layui-tab-item').hasClass('showLog')){
        hideLog();
        $('.equipmentList').parents('.layui-tab-item').removeClass('showLog');
        return false;
        }
        $("#conInterval").removeClass("play");
        $("#conInterval").addClass("pause");    
        $("#logTitleWk").text(wktitle);
        $("#logTitleIp").text(iptitle);
        $("#logTitleDeviceIp").val(iptitle);
        $("#logTitleDeviceType").val(devtype);
        //
        var dmpId0 =  $("#dmpId0").val();
        setTimeIntervalId(dmpId0,devtype,iptitle);
    	$('.equipmentList').parents('.layui-tab-item').addClass('showLog')
    	
    }
    $("#conInterval").click(function(){
        var dmpId0 =  $("#dmpId0").val();
       if(timeFlag==true){
       $("#conInterval").removeClass("pause");
       $("#conInterval").addClass("play");
       clearInterval(intervalId1);
       timeFlag=false;
       }else{
       $("#conInterval").removeClass("play");
       $("#conInterval").addClass("pause");       
                var iptitle = $("#logTitleDeviceIp").val();
                var devtype = $("#logTitleDeviceType").val();   
                setTimeIntervalId(dmpId0,devtype,iptitle);                  
       }
    });
    //隐藏右侧日志
    function hideLog(){
       $("#conInterval").removeClass("pause");
       $("#conInterval").addClass("play");    
        clearInterval(intervalId1);
        timeFlag=false;
        $(".logBody").empty();
    	$('.equipmentList').parents('.layui-tab-item').removeClass('showLog')
    }
    //接口获取日志
    function getDeviceLog(dmpid,devtype,devip){
        var url = "${path}dmp/DmpDeviceAction_getDeviceLog.ms";
	    jQuery.ajax({
		type: "POST",
		async: false,
	    dataType: "json",
	    url: url,
	    data: {"paraMap.DMP_ID":dmpid,"paraMap.DEVICE_TYPE":devtype,"paraMap.DEVICE_IP":devip},
	success: function(data){
	           var res = data.ajaxMap.RESMSG;
                var logMsg = data.ajaxMap.LOGMSG;
                
               if(res=="SUCCESS"){
				   if(logMsg!=null && logMsg!=""){
                  $(".logBody").append("<p>"+logMsg+"</p>");				   
				   }
               }
	       if(logMsg=="No Device Exist"){
	           hideLog();
	       }
			},
	error: function(msg){
				
			}
		});       
    }
</script>	
<script>//echart相关
        function getDmpMemory(){
        var url = "${path}dmp/DmpDeviceAction_getDeviceMemory.ms";
        var dmpId0 =  $("#dmpId0").val();
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.DMP_ID":dmpId0},
	success: function(data){
              var resStr =  data.ajaxString;
              var map = eval("("+resStr+")");
	      var resFlag = map[0].ResponseFlag;//ResponseFlag 18  ResponseInfo  程序未启动
	      if(resFlag=="18"){return false};
              var jvmMem = map[0].JvmMemoryRate.substr(0,5);
	      var jvmCpu = map[0].JvmCupRate.substr(0,5);
	      var sysMem = map[0].SystemMemoryRate.substr(0,5);
	      var sysCpu = map[0].SystemCpuRate.substr(0,5);	      
	      var jvmThread = map[0].JvmThreadCount;
	      var poolThreadSize = map[0].PoolThreadSize;
	      var poolQueueSize = map[0].PoolQueueSize;
		  $("#thReadNum").text(jvmThread);
		  $("#poolThreadSize").text(poolThreadSize);
		  $("#poolQueueSize").text(poolQueueSize);		  
	      echart1(sysCpu);
	      echart2(jvmCpu);
		  echart3(sysMem);
		  echart4(jvmMem);
			},
	error: function(msg){
				
			}
		});
        }
	function echart1(sysCpu){
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
					value : sysCpu,
				}]
			} ]
        }
        echarts.init(document.getElementById('chart1')).setOption(option);					
	}

        function echart2(jvmCpu){
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
					value : jvmCpu,
				}]
			} ]
        };
        echarts.init(document.getElementById('chart2')).setOption(option1);
    	}
		function echart3(sysMem){
    	var option2 = {
    		tooltip:{
    			show:false
    		},
	        color: ["#1c9179", "#e6e6e6"],
	        graphic:[{
	            type:'text',
	            left:'center',
	            top:'45%',
	            style:{
	                text:sysMem+'%',
	                textAlign:'center',
	                fill:'#1C9179',
	                fontSize: 18,
	            }
	        }
	        //,
	       // {
			//    type: 'rect',
			//    shape: {
			//        x: 20,
			//        y: 70,
			//        width: 100,
			//        height: 1
			//    },
			//    style:{
	        //        fill:'#c8c8c8',
	        //    }
			//},
			//{
	         //   type:'text',
	         //   left:'center',
	        //    top:'55%',
	         //   style:{
	         //       text:'',
	        //        textAlign:'center',
	        //        fill:'#e6e6e6',
	        //        fontSize: 18,
	        //    }
	        //}
	        ],
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
		                {value:sysMem},
		                {value:100-sysMem}
		            ]
		        }
		    ]
	    };
        echarts.init(document.getElementById('chart3')).setOption(option2);
	    }
		function echart4(jvmMem){
	    var option3 = {
	    	tooltip:{
    			show:false
    		},
	        color: ["#3B9CE5", "#e6e6e6"],
	        graphic:[{
	            type:'text',
	            left:'center',
	            top:'45%',
	            style:{
	                text:jvmMem+'%',
	                textAlign:'center',
	                fill:'#3B9CE5',
	                fontSize: 18,
	            }
	        }
	        //,
	       // {
			//    type: 'rect',
			//    shape: {
			//        x: 20,
			//        y: 70,
			//        width: 100,
			//        height: 1
			//    },
			//    style:{
	        //        fill:'#c8c8c8',
	        //    }
			//},
		//{
	         //   type:'text',
	         //   left:'center',
	        //    top:'55%',
	         //   style:{
	         //       text:'',
	        //        textAlign:'center',
	        //        fill:'#e6e6e6',
	        //        fontSize: 18,
	        //    }
	        //}
	        ],
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
		                {value:jvmMem},//当前
		                {value:100-jvmMem}//剩余
		            ]
		        }
		    ]
	    };
        echarts.init(document.getElementById('chart4')).setOption(option3);
		}
        
	    $(function(){
        getDmpMemory();
	    setInterval(function() {         
            getDmpMemory();              
          }, 5000);
	    })
        
          //校验
  function validateNum(obj){
  var re =  /^\d+$/
  var objval = obj.val();
  if(objval==""){
	  return ;
  }
  var reulst = re.test(objval);
  if(reulst==true){
   return ;
  }else{
  obj.val("");
  layer.msg("<dict:lang value='请输入整数'/>", {time: 1000, icon:5});
  }
  }
  var ipflag = true;
  function validateIp(obj){
  var re =  /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/
  var objval = obj.val();
  var reulst = re.test(objval);
  if(reulst==true){
   validateIp2(obj);
  }else{
  obj.css("color","red");
  layer.msg("<dict:lang value='请输入格式正确的IP'/>", {time: 1000, icon:5});
  }
  }
  function validateIp2(obj){
     var count = obj.attr("id").replace("ip","").replace("s","").replace("e","");
	 var startip = $("#sip"+count).val();
	 var endip = $("#eip"+count).val();
	 var result = compareIP(startip, endip);
	 if(result==1 || result==2 ){
     obj.css("color","red");
	 layer.msg("<dict:lang value='开始IP需小于结束IP'/>", {time: 1000, icon:5});
	 }else{
	 $("#sip"+count).css("color","");
	 $("#eip"+count).css("color","");
	 }
  }
   
   //比较两个ip的大小,如果大于，返回1，等于返回0，小于返回-1,格式错误返回2
   function compareIP(sip, eip)  
    {  
        var temp1;  
        var temp2;
        var a =0;
		var b =0; 
	    var re =  /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/
        if(re.test(sip)!=true || re.test(eip)!=true ){
			return 2;
		}
        temp1 = sip.split(".");  
        temp2 = eip.split(".");     
        for (var i = 0; i < 4; i++)  
        {   a= parseInt(temp1[i]);
	        b= parseInt(temp2[i]);
            if (a>b)  
            {   
                
                return 1;  
            }  
            else if (a<b)  
            {  
                return -1;  
            }  
        }  
        return 0;     
    }  
    function searchLogFile(obj){     
             var formData = {};
             var dmpId0 =  $("#dmpId0").val();             
            formData["paraMap.DMP_STIME"] = $("#date2").val();
            formData["paraMap.DMP_ETIME"] = $("#date3").val();
            formData["paraMap.DMP_ID"] = dmpId0;
            formData["paraMap.DMP_DEVICEIP"] =$("#logTitleDeviceIp").val();
            formData["paraMap.DMP_DEVICETYPE"] = $("#logTitleDeviceType").val();  
            table.render({
		    id:'logList',
		    elem: '#logList',
		    url: '${path}dmp/DmpDeviceAction_getDeviceLogFile.ms', 
		    page: true, //开启分页
		    method: 'post',
		    width:700,
		    height: 316,
		    limits:[10,20,50,100],
		    where:formData,
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
		       {field: 'FileName', title: '<dict:lang value="文件名"/>', sort: false, width: 300},
		       {field: 'FileSize', title: '<dict:lang value="文件大小"/>', sort: false, width: 100},
		       {field: 'FileLastModified', title: '<dict:lang value="修改时间"/>', sort: false, width: 247},		       		       		       
		    ]],
		    
		    done: function(res, curr, count){
		    	currPage = curr;
		}
});      
    } //  
      //预览  
      function op(){ 
      
      var url = "${path}dmp/DmpDeviceAction_getDmpViewUrl.ms";
      var dmpId0 =  $("#dmpId0").val();
      var checkStatus = table.checkStatus('logList');
	  var data = checkStatus.data;
			  if(data.length==0){
			      layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
				  return;
			  }
			  if(data.length>1){
				  layer.msg("<dict:lang value='只能选择一条数据'/>", {time: 1000, icon:5});
				  return; 
			  }	
	  var newWindow = window.open();		    
      var str ="/"+ data[0].FilePath;
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.DMP_ID":dmpId0,"paraMap.DMP_STR":str},
	success: function(data){
	         var openUrl = data.ajaxString;
	         newWindow.location.href = openUrl;
	        // window.open(openUrl);//"http://190.160.5.132:19991/source/190.160.5.132@DCT-20190426-15.log"
			},
	error: function(msg){
				
			}
		});
      
      }
      //预览2
      function op2(){
      var url = "${path}dmp/DmpDeviceAction_getDmpViewUrl.ms";
      var checkStatus = table.checkStatus('logList');
      var dmpId0 =  $("#dmpId0").val();
	  var data = checkStatus.data;
			  if(data.length==0){
				 layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
				  return;
			  }
			  if(data.length>1){
				  layer.msg("<dict:lang value='只能选择一条数据'/>", {time: 1000, icon:5});
				  return; 
			  }	  
      var str ="/"+ data[0].FilePath;
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.DMP_ID":dmpId0,"paraMap.DMP_STR":str},
	success: function(data){
	         var openUrl = data.ajaxString;         
	         viewFile(openUrl);
	        // window.open(openUrl);//"http://190.160.5.132:19991/source/190.160.5.132@DCT-20190426-15.log"
			},
	error: function(msg){
				
			}
		});
      }    
      //下载
      function download(){
      var url = "${path}dmp/DmpDeviceAction_getDmpViewUrl.ms";
      var checkStatus = table.checkStatus('logList');
      var dmpId0 =  $("#dmpId0").val();
	  var data = checkStatus.data;
			  if(data.length==0){
				 layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
				  return;
			  }
			  if(data.length>1){
				  layer.msg("<dict:lang value='只能选择一条数据'/>", {time: 1000, icon:5});
				  return; 
			  }	  
      var str ="/"+ data[0].FilePath;
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.DMP_ID":dmpId0,"paraMap.DMP_STR":str},
	success: function(data){
	         var openUrl = data.ajaxString;
	         downLoad2(openUrl);
	        // window.open(openUrl);//"http://190.160.5.132:19991/source/190.160.5.132@DCT-20190426-15.log"
			},
	error: function(msg){
				
			}
		});
      }
      function downLoad2(downLoadUrl){
        var url = "${path}dmp/DmpDeviceAction_downLoadFile.ms";
        $("#fileUrl").val(downLoadUrl);
        $("#searchForm").attr('action',url);  
         $("#searchForm").submit(); 
      }
     function viewFile(downLoadUrl){
        var url = "${path}dmp/DmpDeviceAction_getDmpViewCon.ms";
        $("#fileUrl").val(downLoadUrl);
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    ansyc:false,
	    data:$("#searchForm").serialize(),
	    url: url,
		success: function(data){	
              var res = data.ajaxString;
              var str = '<div style="height: calc(100% - 39px);overflow: auto;box-sizing: border-box;padding: 15px;"><p style="white-space:pre-wrap;">'+res+'</p></div>';
              
            layer.open({
                title: '<dict:lang value="日志预览"/>',
                skin: 'layui-layer-molv',
                area: ['100%','100%'],
                type: 1, 
                id: 'layerDemo2', //防止重复弹出
                content: str,
		scrollbar: true,
                shade: 0.3 
            });                  			
			},
			error: function(msg){
				util.alert("error:"+msg);
		   }
		}); 
      }
     // $(".export").click(function(){
      
     // }) 
      function choicard(obj){
       obj.addClass('active').siblings().removeClass('active');
      }  
      function moreClick(obj){
              if(obj.closest('.cardPane').hasClass('open')){
                obj.closest('.cardPane').removeClass('open')
                  }else{
                obj.closest('.cardPane').addClass('open')
        }
      }
</script>	

</body>
</html>