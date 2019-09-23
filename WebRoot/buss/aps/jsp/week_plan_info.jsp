<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<head>
    <title>
        <dict:lang value="周排程" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
    <bu:header formId ="454cc1d04a9240f4868ccffb52793896"/>

    <!-- head里面 -->
    <!-- 产品静态资源 -->
	<link rel="stylesheet" href="${path}buss/aps/gantt_css/platform.css" type="text/css">
	<link rel="stylesheet" href="${path}buss/aps/gantt_libs/dateField/jquery.dateField.css" type="text/css">
	<link rel="stylesheet" href="${path}buss/aps/gantt_css/gantt.css" type="text/css">
    <link rel="stylesheet" href="${path}buss/aps/gantt_css/print.css" type="text/css" media="print">
    <link rel="stylesheet" type="text/css" href="${path}buss/aps/gantt_libs/jquery.svg.css">
	<style>
	  .explain{
	  	height:38px;
	  	line-height:38px;
	  	color:#999;
	  	font-size:12px;
	  	margin-left:20px;
	  }
	  
	  .explain .item{
	  	margin-right:20px;
	  }
	  
	  .explain .item img{
	  	margin-right:8px;
	  	vertical-align: middle;
	  }
	</style>
	<script src="${path}buss/aps/gantt_libs/jquery.livequery.min.js"></script>
    <script src="${path}buss/aps/gantt_libs/jquery.timers.js"></script>
    <script src="${path}buss/aps/gantt_libs/platform.js"></script>
    <script src="${path}buss/aps/gantt_libs/date.js"></script>
    <script src="${path}buss/aps/gantt_libs/i18nJs.js"></script>
    <script src="${path}buss/aps/gantt_libs/dateField/jquery.dateField.js"></script>
    <script src="${path}buss/aps/gantt_libs/JST/jquery.JST.js"></script>
    <script type="text/javascript" src="${path}buss/aps/gantt_libs/jquery.svg.min.js"></script>
    <script type="text/javascript" src="${path}buss/aps/gantt_libs/jquery.svgdom.1.8.js"></script>
    <script src="${path}buss/aps/gantt_js/ganttUtilities.js"></script>
    <script src="${path}buss/aps/gantt_js/ganttTask.js"></script>
    <script src="${path}buss/aps/gantt_js/ganttDrawerSVG.js"></script>
    <script src="${path}buss/aps/gantt_js/ganttGridEditor.js"></script>
    <script src="${path}buss/aps/gantt_js/ganttMaster.js"></script>  
    <script src="${path}buss/aps/gantt_js/ganttCommon.js"></script> 
</head>

<body>
<div class="content-in">
    <div class="dlist">
        <div class="hd">
            <div class="optn">
                <table class="func_table">
                    <tbody>
                    <tr>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick="setGanttInfo()"><i class="ico ico-cx"></i><dict:lang value="撤销"/></button>
                        </td>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick=""><i class="ico ico-hf"></i><dict:lang value="恢复"/></button>
                        </td>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick=""><i class="ico ico-dataToBig"></i><dict:lang value="日期放大"/></button>
                        </td>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick=""><i class="ico ico-dataToSmall"></i><dict:lang value="日期缩小"/></button>
                        </td>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick=""><i class="ico ico-search-new"></i><dict:lang value="下达"/></button>
                        </td>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick=""><i class="ico ico-search-new"></i><dict:lang value="拆分"/></button>
                        </td>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick=""><i class="ico ico-save"></i><dict:lang value="保存"/></button>
                        </td>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick="query('formId1')"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17" />
                        <jsp:param name="location" value="searchForm" />
                    </jsp:include>

                    <bu:search viewId="8b760bed42b444f987af296e9aca1177" />
                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" style="height: calc(100% - 78px);">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17" />
                    <jsp:param name="location" value="listForm" />
                </jsp:include>
                <input type="hidden" name="formPage454cc1d04a9240f4868ccffb52793896" id="formPage454cc1d04a9240f4868ccffb52793896" value="${formPage454cc1d04a9240f4868ccffb52793896}"/>
                <input type="hidden" name="formId" id="formId1" value='454cc1d04a9240f4868ccffb52793896'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
                <div class="panel-ajax datagrid datagrid-div1"  id="454cc1d04a9240f4868ccffb52793896" style="height:150px;">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax454cc1d04a9240f4868ccffb52793896" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner454cc1d04a9240f4868ccffb52793896">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable454cc1d04a9240f4868ccffb52793896">
                                    <s:set name="_$type" value="'view'" />
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td style="width:30px;text-align: center;"></td>
                                        <td style="width:30px;text-align: center;"></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="生产阶别"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="月排程单号"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="工单号"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="状态"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="机种"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="机种名称"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="计划数量"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="标准工时(S)"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="生产工时(H)"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="当前排产数量"/></td>
                                        <td style="width:120px;text-align: center;"><dict:lang value="当前排产工时(H)"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="预计开工时间"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="预计完工时间"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="计划交货时间"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="计划组"/></td>
                                        <td style="text-align: center;"><dict:lang value="前置任务"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv454cc1d04a9240f4868ccffb52793896" onscroll="ajaxTableScroll(this,'454cc1d04a9240f4868ccffb52793896')">
                            <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax454cc1d04a9240f4868ccffb52793896">
                                <tbody id="tbody_month_data" class="isParents">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPage454cc1d04a9240f4868ccffb52793896==1}">			<div class="center" style="height:30px;">
                    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
                </div>
                </c:if>
				<div style="height:calc(50% - 5px);background-color:#fff;margin-top:10px;">
			    	<div id="workSpace" style="padding:0px; overflow-y:auto; overflow-x:hidden;border:1px solid #e5e5e5;position:relative;height:calc(100% - 38px);"></div>
			    	<div class="explain">
						*状态说明：
						<span class="item"><img src="${path}buss/aps/gantt_img/start.png">开始</span>
						<span class="item"><img src="${path}buss/aps/gantt_img/end.png">结束</span>
					</div>
			    </div>
			    
                <input type="hidden" name="tableCount" id="tableCount" value='2' />
            </form>
        </div>
    </div>
</div>
<bu:submit viewId="8b760bed42b444f987af296e9aca1177" />
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="beforeJsLoad" />
</jsp:include>
<bu:script viewId="8b760bed42b444f987af296e9aca1177" />

<script>
    //变量(周排程)
    var dataUrl;
    var paginationImpl = {};
    var parentLevel=0;//父级等级标识（暂时只有2个层级）
    var childLevel=1;//子级等级标识
    //变量(排程插件)
    var _vardata={"tasks":[
            {"id":-1,"name":"SMT","code":"","level":0,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":true,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
            ,{"id":-2,"name":"MO20180305003","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
            ,{"id":-3,"name":"MO180302002","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
            ,{"id":-4,"name":"DIP","code":"","level":0,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
            ,{"id":-5,"name":"MO1802285","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
            ,{"id":-6,"name":"MO1802275","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
            ,{"id":-7,"name":"MO1802274","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
            ,{"id":-8,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
        ],"selectedRow":0,"canWrite":true,"canWriteOnParent":true} ;
    var ge;  //this is the hugly but very friendly global var for the gantt editor
    //界面加载函数
    $(function(){
        dataUrl=getDataUrl();
        //初始化
        initial();
        //加载甘特图UI
        //loadGanttUI();
        //获取月排程信息
        getPlanInfo(null,null);
        setGanttInfo();
    });
    //初始化
    function initial(){
        //初始化年份条件
        getSeachYear();
        //初始化月份条件
        getSeachMonth();
    }
    //获取查询条件：年份
    function getSeachYear(){
        var currentYear=parseInt((new Date()).getFullYear());
        var startYear=currentYear-10;
        var endYear=startYear+20;
        $("#PPW_YEAR").empty();
        for(var i=startYear;i<endYear;i++){
            $("#PPW_YEAR").append("<option value='"+i+"' class='select_name'>"+i+"</option>");
        }
        $("#PPW_YEAR").find("option[value="+currentYear+"]").attr("selected",true);
        $("#PPW_YEAR").trigger("chosen:updated");
    }
    //获取查询条件：月份 值需-1
    function getSeachMonth(){
        var currentMonth=parseInt((new Date()).getMonth()+1);
        $("#PPW_MONTH").empty();
        for(var i=1;i<=12;i++){
            $("#PPW_MONTH").append("<option value='"+i+"' class='select_name'>"+i+"</option>");
        }
        $("#PPW_MONTH").find("option[value="+currentMonth+"]").attr("selected",true);
        $("#PPW_MONTH").trigger("chosen:updated");
    }
    //获取排程数据
    function getPlanInfo(page,record){
        //获取查询条件
        var dataAuth=$("#DATA_AUTH option:selected").val();
        var year=$("#PPW_YEAR option:selected").val();
        var month=$("#PPW_MONTH option:selected").val();
        var step=$("#PPW_STEP option:selected").val()
        var projectId=$("#PPW_PROJECT_ID_SHOW").val();
        var material=$("#PRODUCT_MATERIAL_SHOW").val();

        var data={};
        data.opt="getPlanInfo";
        data.dataAuth=dataAuth;
        data.step=step;
        data.projectId=projectId;
        data.material=material;
        if(page!=null && typeof(page)!="undefined"){
            data.currentPage=page;
        }
        if(record!=null && typeof(record)!="undefined"){
            data.pageRecord=record;
        }

        showLoading(true);
        $.ajax({
            type:"POST",
            dataType:"json",
            url:dataUrl,
            data:data,
            success:function(data){
                $("#tbody_month_data").empty();//清空列表
                if(data!=null && typeof(data)!="undefined"){
                    var dataHtml=[];//保存数据文本
                    if(data.ajaxList!=null && data.ajaxList.length>0){
                        data.ajaxList.forEach(function(item,index,array){
                            dataHtml.push("<tr id='"+item.ID+"' class='datagrid-row'>");
                            dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+(index+1)+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;'><input id='"+item.ID+"' type='checkbox'></td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+item.PROJECT_STEP_TEXT+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+item.PPW_DOC_NO+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+item.PPW_PROJECT_ID+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+item.PROJECT_STATUS_TEXT+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+item.PRODUCT_MATERIAL+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+item.CI_ITEM_NAME+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+item.PPW_TARGET_NUM+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>标准工时</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>生产工时</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>当前排产数量</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:120px;text-align: center;'>当前排产工时</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+item.PPW_START_DATE+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+item.PPW_END_DATE+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+item.PPW_DELIVERY_DATE+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+item.PPW_GROUP+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='text-align: center;'>"+item.PPW_PRE_TASK+"</td>");
                            dataHtml.push("</tr>");
                        });
                        $("#tbody_month_data").html(dataHtml.join(""));
                    }
                }
                pageFun(data.ajaxPage,"formId1");
                showLoading(false);
            },
            error:function(msg){
                showLoading(false);
            }
        });

    }
    //显示进度条
    function showLoading(isShow){
        if(isShow){
            util.showLoading();
        }
        else {
            util.closeLoading();
        }
    }
    //获取数据接口URL
    function getDataUrl(){
        return "${path}buss/bussModel_exeFunc.ms?funcMId=1d6d0035309f4db2ba86243e762b2ef0";
    }
    //查询
    function query(paginationImpl){
        var currentPage=_GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
        var pageRecord=_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
        getPlanInfo(currentPage,pageRecord);
    }
    //加载排程信息
    function setGanttInfo(){
        //ge.loadProject(_vardata);
        //ge.checkpoint();

        //获取查询条件
        var dataAuth=$("#DATA_AUTH option:selected").val();
        var year=$("#PPW_YEAR option:selected").val();
        var month=$("#PPW_MONTH option:selected").val();
        var step=$("#PPW_STEP option:selected").val()
        var projectId=$("#PPW_PROJECT_ID_SHOW").val();
        var material=$("#PRODUCT_MATERIAL_SHOW").val();
        //获取参数
        var data={};
        data.opt="getWeekGantt";
        data.dataAuth=dataAuth;
        data.year=year;
        data.month=month;
        data.step=step;
        data.projectId=projectId;
        data.material=material;
        //获取数据
        $.ajax({
            type:"POST",
            dataType:"json",
            url:dataUrl,
            data:data,
            success:function(data){
                //收集线体信息
                var lines=[];
                $.each(data.areaSn,function(key,value){
                    lines.push({
                        lineSn:key,
                        lineParams:value
                    });
                });
                //构建甘特图task对象集合
                //(id:seq$name:线体or制令单$level:层级$start:起始时间$durantion:跨度$end:结束时间$startIsMilestone:起始任务标识(true/false)$endIsMilestone:结束任务标识$depends:父级seq$hasChild:是否有子级)
                var taskSeq=0;//task Seq索引
                var taskList=[];//task对象集合
                lines.forEach(function(lineInfo,lineIndex,lineArray){
                    taskSeq++;
                    //添加线体
                    var lineSeq=taskSeq;
                    taskList.push({
                        //插件必要属性
                        id:lineSeq,
                        code:"",
                        name:lineInfo.lineSn,
                        level:parentLevel,
                        status:"STATUS_ACTIVE",
                        start:lineInfo.lineParams.LINE_START_TIME.time,
                        duration:calDurantion(lineInfo.lineParams.LINE_START_TIME.time,lineInfo.lineParams.LINE_END_TIME.time),
                        end:lineInfo.lineParams.LINE_END_TIME.time,
                        startIsMilestone:null,
                        endIsMilestone:null,
                        depends:"",
                        hasChild:false,
                        collapsed:true
                    });
                    //添加线体下的制令单
                    data.task[lineInfo.lineSn].forEach(function(moNumber,moIndex,moArray){
                        taskSeq++;
                        taskList.push({
                            //插件必要属性
                            id:taskSeq,
                            code:"",
                            name:moNumber.MONUMBER,
                            level:childLevel,
                            status:"STATUS_ACTIVE",
                            start:moNumber.PROJECT_START.time,
                            duration:calDurantion(moNumber.PLAN_START_TIME.time,moNumber.PLAN_END_TIME.time),
                            end:moNumber.PROJECT_END.time,
                            startIsMilestone:false,
                            endIsMilestone:false,
                            depends:"",
                            hasChild:false,
                            collapsed:false
                        });
                    });

                });
                var task={
                    tasks:taskList,
                    selectedRow:0,
                    canWrite:true,
                    canWriteOnParent:true
                };
                var a="b";

                toLoadGanttData(task);
            },
            error:function(msg){

            }
        });
    }
    //加载甘特图UI
    function loadGanttUI(){
        //load templates
        $("#ganttemplates").loadTemplates();
        // here starts gantt initialization
        ge = new GanttMaster();
        var workSpace = $("#workSpace");
        workSpace.css({width:$(window).width() - 20,height:300});
        ge.init(workSpace);
        //inject some buttons (for this demo only)
        $(".ganttButtonBar div").addClass('buttons');
        //overwrite with localized ones
        loadI18n();
        //fill default Teamwork roles if any
        if (!ge.roles || ge.roles.length == 0) {
            setRoles();
        }
        //fill default Resources roles if any
        if (!ge.resources || ge.resources.length == 0) {
            setResource();
        }
    }
    //计算持续时间(进度分钟m)
    function calDurantion(start,end){
        var calDiff=end-start;
        return calDiff/(1000*60);
    }
</script>

<script type="text/javascript">

var ge;  //this is the hugly but very friendly global var for the gantt editor

$(function() {
  //load templates
  $("#ganttemplates").loadTemplates();
  // here starts gantt initialization
  ge = new GanttMaster();
  var workSpace = $("#workSpace");
  ge.init(workSpace);
  //inject some buttons (for this demo only)
  $(".ganttButtonBar div").addClass('buttons');
  //overwrite with localized ones
  loadI18n();
  //simulate a data load from a server.
  //loadGanttFromServer();
  
  var _vardata={"tasks":[
     {"id":-1,"name":"SMT","code":"","level":0,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":true,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-2,"name":"MO20180305003","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-3,"name":"MO180302002","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-4,"name":"DIP","code":"","level":0,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-5,"name":"MO1802285","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-6,"name":"MO1802275","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-7,"name":"MO1802274","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-8,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-9,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-10,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-11,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-12,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-13,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-14,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-15,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-16,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-17,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-18,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     ,{"id":-19,"name":"MO1802273","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1519351200000,"duration":1440,"end":1519437600000,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true}
     
     
     ],"selectedRow":0,"canWrite":true,"canWriteOnParent":true} ;
  toLoadGanttData(_vardata);
  //fill default Teamwork roles if any
  if (!ge.roles || ge.roles.length == 0) {
    setRoles();
  }
  //fill default Resources roles if any
  if (!ge.resources || ge.resources.length == 0) {
    setResource();
  }
  /*/debug time scale
  $(".splitBox2").mousemove(function(e){

    var x=e.clientX-$(this).offset().left;

    var mill=Math.round(x/(ge.gantt.fx) + ge.gantt.startMillis)

    $("#ndo").html(x+" "+new Date(mill))

  });*/
  $(window).resize(function(){
    workSpace.css({width:$(window).width() - 20,height:$(window).height() - 100});
    workSpace.trigger("resize.gantt");
  });
  
  

  
});
function loadGanttFromServer(taskId, callback) {
  //this is a simulation: load data from the local storage if you have already played with the demo or a textarea with starting demo data
  loadFromLocalStorage();
  //this is the real implementation
}
function saveGanttOnServer() {
  if(!ge.canWrite)
    return;
  //this is a simulation: save data to the local storage or to the textarea
  saveInLocalStorage();
}
//-------------------------------------------  Create some demo data ------------------------------------------------------
function setRoles() {
  ge.roles = [
    {
      id:"tmp_1",
      name:"Project Manager"
    },
    {
      id:"tmp_2",
      name:"Worker"
    },
    {
      id:"tmp_3",
      name:"Stakeholder/Customer"
    }
  ];
}
function setResource() {
  var res = [];
  for (var i = 1; i <= 10; i++) {
    res.push({id:"tmp_" + i,name:"Resource " + i});
  }
  ge.resources = res;
}
function editResources(){
}
function clearGantt() {
  ge.reset();
}
function loadI18n() {
  GanttMaster.messages = {
    "CANNOT_WRITE":"CANNOT_WRITE",
    "CHANGE_OUT_OF_SCOPE":"NO_RIGHTS_FOR_UPDATE_PARENTS_OUT_OF_EDITOR_SCOPE",
    "START_IS_MILESTONE":"START_IS_MILESTONE",
    "END_IS_MILESTONE":"END_IS_MILESTONE",
    "TASK_HAS_CONSTRAINTS":"TASK_HAS_CONSTRAINTS",
    "GANTT_ERROR_DEPENDS_ON_OPEN_TASK":"GANTT_ERROR_DEPENDS_ON_OPEN_TASK",
    "GANTT_ERROR_DESCENDANT_OF_CLOSED_TASK":"GANTT_ERROR_DESCENDANT_OF_CLOSED_TASK",
    "TASK_HAS_EXTERNAL_DEPS":"TASK_HAS_EXTERNAL_DEPS",
    "GANTT_ERROR_LOADING_DATA_TASK_REMOVED":"GANTT_ERROR_LOADING_DATA_TASK_REMOVED",
    "ERROR_SETTING_DATES":"ERROR_SETTING_DATES",
    "CIRCULAR_REFERENCE":"CIRCULAR_REFERENCE",
    "CANNOT_DEPENDS_ON_ANCESTORS":"CANNOT_DEPENDS_ON_ANCESTORS",
    "CANNOT_DEPENDS_ON_DESCENDANTS":"CANNOT_DEPENDS_ON_DESCENDANTS",
    "INVALID_DATE_FORMAT":"INVALID_DATE_FORMAT",
    "TASK_MOVE_INCONSISTENT_LEVEL":"TASK_MOVE_INCONSISTENT_LEVEL",
    "GANTT_QUARTER_SHORT":"trim.",
    "GANTT_SEMESTER_SHORT":"sem."
  };
}
//-------------------------------------------  Get project file as JSON (used for migrate project from gantt to Teamwork) ------------------------------------------------------
function getFile() {
  $("#gimBaPrj").val(JSON.stringify(ge.saveProject()));
  $("#gimmeBack").submit();
  $("#gimBaPrj").val("");
}
//-------------------------------------------  LOCAL STORAGE MANAGEMENT (for this demo only) ------------------------------------------------------
Storage.prototype.setObject = function(key, value) {
  this.setItem(key, JSON.stringify(value));
};
Storage.prototype.getObject = function(key) {
  return this.getItem(key) && JSON.parse(this.getItem(key));
};
//加载数据
function toLoadGanttData(data)
{
    //var ret=JSON.parse(data);
    ge.loadProject(data);
    ge.checkpoint();
}
function loadFromLocalStorage() {
  var ret;
  if (localStorage) {
    if (localStorage.getObject("teamworkGantDemo")) {
      ret = localStorage.getObject("teamworkGantDemo");
    }
  } 
  else {
    $("#taZone").show();
  }
  if (!ret || !ret.tasks || ret.tasks.length == 0){
    ret = JSON.parse($("#ta").val());
    //actualiza data
    var offset=new Date().getTime()-ret.tasks[0].start;
    for (var i=0;i<ret.tasks.length;i++)
      ret.tasks[i].start=ret.tasks[i].start+offset;
  }
  ge.loadProject(ret);
  ge.checkpoint(); //empty the undo stack
}
function saveInLocalStorage() {
  var prj = ge.saveProject();
  if (localStorage) {
    localStorage.setObject("teamworkGantDemo", prj);
  } 
  else {
    $("#ta").val(JSON.stringify(prj));
  }
}
//-------------------------------------------  Open a black popup for managing resources. This is only an axample of implementation (usually resources come from server) ------------------------------------------------------
function editResources(){
  //make resource editor
  var resourceEditor = $.JST.createFromTemplate({}, "RESOURCE_EDITOR");
  var resTbl=resourceEditor.find("#resourcesTable");
  for (var i=0;i<ge.resources.length;i++){
    var res=ge.resources[i];
    resTbl.append($.JST.createFromTemplate(res, "RESOURCE_ROW"))
  }
  //bind add resource
  resourceEditor.find("#addResource").click(function(){
    resTbl.append($.JST.createFromTemplate({id:"new",name:"resource"}, "RESOURCE_ROW"))
  });
  //bind save event
  resourceEditor.find("#resSaveButton").click(function(){
    var newRes=[];
    //find for deleted res
    for (var i=0;i<ge.resources.length;i++){
      var res=ge.resources[i];
      var row = resourceEditor.find("[resId="+res.id+"]");
      if (row.size()>0){
        //if still there save it
        var name = row.find("input[name]").val();
        if (name && name!="")
          res.name=name;
        newRes.push(res);
      } 
      else {
        //remove assignments
        for (var j=0;j<ge.tasks.length;j++){
          var task=ge.tasks[j];
          var newAss=[];
          for (var k=0;k<task.assigs.length;k++){
            var ass=task.assigs[k];
            if (ass.resourceId!=res.id)
              newAss.push(ass);
          }
          task.assigs=newAss;
        }
      }
    }
    //loop on new rows
    resourceEditor.find("[resId=new]").each(function(){
      var row = $(this);
      var name = row.find("input[name]").val();
      if (name && name!="")
        newRes.push (new Resource("tmp_"+new Date().getTime(),name));
    });
    ge.resources=newRes;
    closeBlackPopup();
    ge.redraw();
  });
  var ndo = createBlackPage(400, 500).append(resourceEditor);
}
</script>

<div id="gantEditorTemplates" style="display:none;">
  
  <% /*任务栏菜单列*/ %>
  <div class="__template__" type="TASKSEDITHEAD">  
  <table class="gdfTable" cellspacing="0" cellpadding="0">
    <thead>
    <tr style="height:50px">
      <th class="gdfColHeader" style="width:35px;"></th>
      <th class="gdfColHeader" style="width:50px;" >状态</th>
      <th class="gdfColHeader gdfResizable" style="width:300px;" >任务</th>
      <th class="gdfColHeader gdfResizable" style="width:120px;">开始时间</th>
      <th class="gdfColHeader gdfResizable" style="width:120px;">结束时间</th>
      <th class="gdfColHeader gdfResizable" style="width:100px;">持续时间(m)</th>
      <th class="gdfColHeader gdfResizable" style="width:70px;">前置任务</th>
    </tr>
    </thead>
  </table>
 </div>
 
  <% /*任务列表*/  /*修改为不可输入 */%>
  <div class="__template__" type="TASKROW"><!--
  <tr taskId="(#=obj.id#)" class="taskEditRow" level="(#=level#)">
    <td class="gdfCell edit" align="center" style="cursor:pointer;">
      <span class="taskRowIndex">(#=obj.getRow()+1#)</span> 
    </td>
    <td class="gdfCell noClip" align="center">
      <div class="taskStatus cvcColorSquare" status="(#=obj.status#)"></div>
    </td>
    <td class="gdfCell indentCell" style="padding-left:(#=obj.level*10#)px;">
      <div class="(#=obj.isParent()?'exp-controller expcoll exp':'exp-controller'#)" align="center"></div>
      <input type="text" name="name" value="(#=obj.name#)" disabled="false">
    </td>
    <td class="gdfCell">
     <input type="text" name="start"  value="" class="date" disabled="false">
    </td>
    <td class="gdfCell">
     <input type="text" name="end" value="" class="date" disabled="false">
    </td>
    <td class="gdfCell">
     <input type="text" name="duration" value="(#=obj.duration#)" disabled="false">
    </td>
    <td class="gdfCell">
     <input type="text" name="depends" value="(#=obj.depends#)" (#=obj.hasExternalDep?"readonly":""#) disabled="false">
    </td>
  </tr>-->
 </div>
 
 <% /*空任务列表
 
 <div class="__template__" type="TASKEMPTYROW">
	<tr class="taskEditRow emptyRow" >
	  <td class="gdfCell" align="right"></td>
	  <td class="gdfCell noClip" align="center"></td>
	  <td class="gdfCell"></td>
	  <td class="gdfCell"></td>
	  <td class="gdfCell"></td>
	  <td class="gdfCell"></td>
	  <td class="gdfCell"></td>
	  <td class="gdfCell"></td>
	  <td class="gdfCell"></td>
    </tr>
  </div> */%>
  
 <% /*任务进度*/ %> 
 <div class="__template__" type="TASKBAR"><!--
  <div class="taskBox taskBoxDiv" taskId="(#=obj.id#)" >
    <div class="layout (#=obj.hasExternalDep?'extDep':''#)">
      <div class="taskStatus" status="(#=obj.status#)"></div>
      <div class="taskProgress" style="width:(#=obj.progress>100?100:obj.progress#)%; background-color:(#=obj.progress>100?'#b32210':'#aace36'#);"></div>
      <div class="milestone (#=obj.startIsMilestone?'active':''#)" ></div>
      <div class="taskLabel"></div>
      <div class="milestone end (#=obj.endIsMilestone?'active':''#)" ></div>
    </div>
  </div>-->
 </div>

  <% /*任务状态标示容器*/ %>
  <div class="__template__" type="CHANGE_STATUS"><!--
    <div class="taskStatusBox">
      <div class="taskStatus cvcColorSquare" status="STATUS_ACTIVE" title="active"></div>
      <div class="taskStatus cvcColorSquare" status="STATUS_DONE" title="completed"></div>
      <div class="taskStatus cvcColorSquare" status="STATUS_FAILED" title="failed"></div>
      <div class="taskStatus cvcColorSquare" status="STATUS_SUSPENDED" title="suspended"></div>
      <div class="taskStatus cvcColorSquare" status="STATUS_UNDEFINED" title="undefined"></div>
    </div>-->
  </div>

  <% /*任务编辑界面元素容器*/ %>
  <div class="__template__" type="TASK_EDITOR"><!--
  <div class="ganttTaskEditor">
  <table width="100%">
    <tr>
      <td>
        <table cellpadding="5">
          <tr>
            <td>
             <label for="code">code/short name</label><br>
             <input type="text" name="code" id="code" value="" class="formElements">
            </td>
          </tr>
          <tr>
            <td>
             <label for="name">name</label><br>
             <input type="text" name="name" id="name" value=""  size="35" class="formElements">
            </td>
          </tr>
          <tr>
            <td>
              <label for="description">description</label><br>
              <textarea rows="5" cols="30" id="description" name="description" class="formElements"></textarea>
            </td>
          </tr>
        </table>
      </td>
      <td valign="top">
        <table cellpadding="5">
          <tr>
           <td colspan="2">
            <label for="status">status</label><br>
            <div id="status" class="taskStatus" status=""></div>
           </td>
          <tr>
           <td colspan="2"><label for="progress">progress</label><br><input type="text" name="progress" id="progress" value="" size="3" class="formElements"></td>
          </tr>
          <tr>
           <td>
            <label for="start">start</label><br>
             <input type="text" name="start" id="start"  value="" class="date" size="10" class="formElements">
             <input type="checkbox" id="startIsMilestone"> 
           </td>
           <td rowspan="2" class="graph" style="padding-left:50px">
            <label for="duration">dur.</label><br>
            <input type="text" name="duration" id="duration" value=""  size="5" class="formElements">
           </td>
        </tr>
        <tr>
          <td>
           <label for="end">end</label><br>
           <input type="text" name="end" id="end" value="" class="date"  size="10" class="formElements">
           <input type="checkbox" id="endIsMilestone">
          </td>
        </table>
      </td>
    </tr>
    </table>
    
  <% /* 编辑 明细列表 列名  
  <h2>assignments</h2>
  <table  cellspacing="1" cellpadding="0" width="100%" id="assigsTable">
    <tr>
      <th style="width:100px;">name</th>
      <th style="width:70px;">role</th>
      <th style="width:30px;">est.wklg.</th>
      <th style="width:30px;" id="addAssig">
      <span class="teamworkIcon" style="cursor: pointer">+</span>
      </th>
    </tr>
  </table> */ %>
  
  <% /* 保存按钮 */ %>
  <div style="text-align: right; padding-top: 20px">
   <button id="saveButton" class="button big">保存</button>
  </div> 
  
 </div>-->
 </div>
 
 <% /*编辑界面 明细编辑 列表
 <div class="__template__" type="ASSIGNMENT_ROW"><!--
  <tr taskId="(#=obj.task.id#)" assigId="(#=obj.assig.id#)" class="assigEditRow" >
    <td >
     <select name="resourceId"  class="formElements" (#=obj.assig.id.indexOf("tmp_")==0?"":"disabled"#) ></select>
    </td>
    <td >
     <select type="select" name="roleId"  class="formElements"></select>
    </td>
    <td >
     <input type="text" name="effort" value="(#=getMillisInHoursMinutes(obj.assig.effort)#)" size="5" class="formElements">
    </td>
    <td align="center">
     <span class="teamworkIcon delAssig" style="cursor: pointer">d</span>
    </td>
  </tr>-->
 </div> */ %> 

 <% /*是什么？
 <div class="__template__" type="RESOURCE_EDITOR"><!--
  <div class="resourceEditor" style="padding: 5px;">
    <h2>Project team</h2>
    <table  cellspacing="1" cellpadding="0" width="100%" id="resourcesTable">
      <tr>
        <th style="width:100px;">name</th>
        <th style="width:30px;" id="addResource">
         <span class="teamworkIcon" style="cursor: pointer">+</span>
        </th>
      </tr>
    </table>
    <div style="text-align: right; padding-top: 20px">
     <button id="resSaveButton" class="button big">save</button>
    </div>
  </div>-->
 </div> */ %>

 <% /*是什么？
 <div class="__template__" type="RESOURCE_ROW"><!--
  <tr resId="(#=obj.id#)" class="resRow" >
    <td >
     <input type="text" name="name" value="(#=obj.name#)" style="width:100%;" class="formElements">
    </td>
    <td align="center">
     <span class="teamworkIcon delRes" style="cursor: pointer">d</span>
    </td>
  </tr>
  -->
 </div>
</div> */ %>

<script type="text/javascript">

  $.JST.loadDecorator("ASSIGNMENT_ROW", function(assigTr, taskAssig) {
    var resEl = assigTr.find("[name=resourceId]");
    for (var i in taskAssig.task.master.resources) {
      var res = taskAssig.task.master.resources[i];
      var opt = $("<option>");
      opt.val(res.id).html(res.name);
      if (taskAssig.assig.resourceId == res.id)
        opt.attr("selected", "true");
      resEl.append(opt);
    }
    var roleEl = assigTr.find("[name=roleId]");
    for (var i in taskAssig.task.master.roles) {
      var role = taskAssig.task.master.roles[i];
      var optr = $("<option>");
      optr.val(role.id).html(role.name);
      if (taskAssig.assig.roleId == role.id)
        optr.attr("selected", "true");
      roleEl.append(optr);
    }
    if(taskAssig.task.master.canWrite && taskAssig.task.canWrite){
      assigTr.find(".delAssig").click(function() {
        var tr = $(this).closest("[assigId]").fadeOut(200, function() {
          $(this).remove();
        });
      });
    }
  });
</script>
</div>

<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="pageOver" />
</jsp:include>
