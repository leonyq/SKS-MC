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
		<dict:lang value="周排程生产情况" />
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

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
    <link rel=stylesheet href="${path}buss/aps/newWeek/platform.css" type="text/css">
    <link rel=stylesheet href="${path}buss/aps/newWeek/libs/jquery/dateField/jquery.dateField.css" type="text/css">
    <link rel=stylesheet href="${path}buss/aps/newWeek/gantt.css" type="text/css">
    <link rel=stylesheet href="${path}buss/aps/newWeek/ganttPrint.css" type="text/css" media="print">
	
	<style>
      .explain{
            height:38px;
            line-height:38px;
            color:#666;
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
        
        .explain .item span{
            display:inline-block;
            width:13px;
            height:13px;
            margin-right:8px;
            vertical-align: middle;
        }
        
        .group{
            box-sizing: content-box;	
        }
	  .ganttState{
			text-overflow: ellipsis;
			display: inline-block;
			width: 45px;
			height: 20px;
			line-height: 20px;
			text-align: center;
			font-size: 12px;
			border-radius: 2px;
		}
	</style>

   <script src="${path}buss/aps/week/gantt_js/ganttCommon.js"></script>  
	<script src="${path}buss/aps/common/js/uuid.js"></script>
	
	
    <script src="${path}buss/aps/newWeek/libs/jquery/jquery.livequery.1.1.1.min.js"></script>
    <script src="${path}buss/aps/newWeek/libs/jquery/jquery.timers.js"></script>

    <script src="${path}buss/aps/newWeek/libs/utilities.js"></script>
    <script src="${path}buss/aps/newWeek/libs/forms.js"></script>
    <script src="${path}buss/aps/newWeek/libs/date.js"></script>
    <script src="${path}buss/aps/newWeek/libs/dialogs.js"></script>
    <script src="${path}buss/aps/newWeek/libs/layout.js"></script>
    <script src="${path}buss/aps/newWeek/libs/i18nJs.js"></script>
    <script src="${path}buss/aps/newWeek/libs/jquery/dateField/jquery.dateField.js"></script>
    <script src="${path}buss/aps/newWeek/libs/jquery/JST/jquery.JST.js"></script>

    <script type="text/javascript" src="${path}buss/aps/newWeek/libs/jquery/svg/jquery.svg.min.js"></script>
    <script type="text/javascript" src="${path}buss/aps/newWeek/libs/jquery/svg/jquery.svgdom.1.8.js"></script>


    <script src="${path}buss/aps/newWeek/ganttUtilities.js"></script>
    <script src="${path}buss/aps/newWeek/ganttTask.js"></script>
    <script src="${path}buss/aps/newWeek/ganttDrawerSVG.js"></script>
    <script src="${path}buss/aps/newWeek/ganttZoom.js"></script>
    <script src="${path}buss/aps/newWeek/ganttGridEditor.js"></script>
    <script src="${path}buss/aps/newWeek/ganttMaster.js"></script>  

</head>

<body>
    <div class="content-in">
        <div class="dlist">
				<div class="hd">
						<bu:func viewId="1b13f8a6afff4f97b4d52db1819638ee" />
						<div class="optn">
							<table class="func_table">
								<tbody>
								<tr>
									<td align="right">
										<button type="button" class="botton_img_add" onclick="ganttZoomMin()"><i class="ico ico-dataToSmall"></i><dict:lang value="日期缩小"/></button>
									</td>
									<td align="right">
										<button type="button" class="botton_img_add" onclick="ganttZoomplus()"><i class="ico ico-dataToBig"></i><dict:lang value="日期放大"/></button>
									</td>
									<td align="right">
										<button type="button" class="botton_img_add" onclick="setGanttInfo()"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
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
	  	               <bu:search viewId="1b13f8a6afff4f97b4d52db1819638ee" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <div style="height:calc(100% - 44px);background-color:#fff;margin-top:10px;">
                    <div id="workSpace" style="padding:0px; overflow-y:auto; overflow-x:hidden;position:relative;height:400px;"></div>
                    <div id="explain" class="explain">
                        *<dict:lang value="状态说明"/>：
                        <span class="item"><img src="${path}buss/aps/week/gantt_img/start.png"><dict:lang value="开始"/></span>
                        <span class="item"><img src="${path}buss/aps/week/gantt_img/end.png"><dict:lang value="结束"/></span>
                        <span class="item"><span style="background-color:#3CB371"></span><dict:lang value="开工时间无偏差"/></span>
                        <span class="item"><span style="background-color:#FF4500"></span><dict:lang value="开工时间存在偏差"/></span>
                        <span class="item"><span style="background-color:#DC143C"></span><dict:lang value="换线时间段"/></span>
                        <span class="item"><span style="background-color:#f8b72d"></span><label id="sTrack"></label></span>
                        <span class="item"><span style="background-color:#4169E1"></span><label id="aTrack"></label></span>
                        <span class="item"><span style="background-color:#00BFFF"></span><label id="bTrack"></label></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
		<bu:submit viewId="1b13f8a6afff4f97b4d52db1819638ee" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="1b13f8a6afff4f97b4d52db1819638ee" />
<script>
	//变量(周排程)
    var dataUrl;
    var parentLevel=0;//父级等级标识（暂时只有2个层级）
    var childLevel=1;//子级等级标识
    var insertFlag="insert";
    var updateFlag="update";
    var oneMinute=60000;//ms，一分钟毫秒数
    var dependsType=["id2Name","name2Id"];//depends转换类型
    var calAvaliableStart=null;//产能作用域起始时间
    var calAvaliableEnd=null;//产能作用域结束时间
    //甘特图数据缓存
    var ganttTasks={
        tasks:[],
        selectedRow:0,
        canWrite:true,
        canWriteOnParent:true
    };//甘特图任务数据
    var taskId2NameInfo;//key - taskId;  value - taskName
    var taskName2IdInfo;//key - taskName;  value - taskId
    var ganttStatus=["STATUS_ACTIVE","STATUS_DONE","STATUS_FAILED","STATUS_SUSPENDED","STATUS_UNDEFINED"];//甘特图任务状态
    //轨道标识
    var trackFlag=[];//A-单轨；B-双轨；S-单轨/AB轨
    //面别标识
    var faceFlag=[];//0-单面 1-正面 2-反面 3-阴阳面
    var changeTimePositionParam=["before","inside"];//换线时间位置
    //甘特图高度
    var ganttAreaHeight = 400;
	$(function(){
		dataUrl=getDataUrl();
		//初始化
        initial();
        //加载甘特图UI
		loadGanttUI();
		//初始化甘特图控件多语言
		setGanttLang();
        //设置通用多语言
        setCommonLang();
		//加载甘特图UI
		adjustUI();
		//加载排程信息
		setGanttInfo();
	});
    //设置通用多语言
    function setCommonLang(){
        try{
            comLang["LINE_NAME"]="<dict:lang value='线体'/>";
            comLang["TOTAL_WORKTIME"]="<dict:lang value='总产能'/>";
            comLang["USED_WORKTIME"]="<dict:lang value='已使用产能'/>";
            comLang["LEFT_WORKTIME"]="<dict:lang value='剩余产能'/>";
            comLang["USED_PERCENT"]="<dict:lang value='产能使用率'/>";
            comLang["MONUMBER"]="<dict:lang value='制令单号'/>";
            comLang["START_PLAN_DATE"]="<dict:lang value='计划开始时间'/>";
            comLang["END_PLAN_DATE"]="<dict:lang value='计划结束时间'/>";
            comLang["START_ACTUAL_DATE"]="<dict:lang value='实际开始时间'/>";
            comLang["END_ACTUAL_DATE"]="<dict:lang value='实际完工时间'/>";
            comLang["MO_USED_WORKTIME"]="<dict:lang value='使用产能'/>";
            comLang["CHANGE_TIME"]="<dict:lang value='换线时间'/>";
            comLang["LINE_TRACK"]="<dict:lang value='线体轨道'/>";
            comLang["TRACK"]="<dict:lang value='轨道'/>";
            comLang["MULIT_TRACK"]="<dict:lang value='多轨'/>";
            comLang["SINGLE_TRACK"]="<dict:lang value='单轨'/>";
            comLang["FACE"]="<dict:lang value='面别'/>";
            comLang["TASKEXCEPTION_STATUS"]="<dict:lang value='任务状态'/>";
            comLang["TASKEXCEPTION_STATUS_TRUE"]="<dict:lang value='异常'/>";
            comLang["TASKEXCEPTION_STATUS_FALSE"]="<dict:lang value='正常'/>";
        }
        catch(error){}
    }
    //获取换线时间位置
    function changeTimePosition(task){
        try{
           if(task.pmStatus=="0"){
            task.changeTimePosition=changeTimePositionParam[1];
           }
           else if(task.pmStatus=="1") {
            if(task.scheduleDate==task.startDate){
            task.changeTimePosition=changeTimePositionParam[0];
            }
            else {
            task.changeTimePosition=changeTimePositionParam[1];
            }
           }
           else {
            task.changeTimePosition=changeTimePositionParam[1];
           }
        }
        catch(error){
            console.error(error);
        }
    }
	//记录线体特殊时间点
    function setLineSpecialTime(special){
        setInnerSpecial(special);
    }
	//时间字符串状态time
    function DateStr2Time(datestr){
        var date=new Date(datestr);
        return date.getTime();
    }
    //转换depends
    function changeDepends(depends,type){
        if(depends==null || depends==""){
            return depends;
        }
        var vDep=depends.split(',');
        var vItem;
        if(dependsType[0]==type){
            depends=""
            vDep.forEach(function(item,index,array){
                vItem=taskId2NameInfo[item];
                if(vItem==null){
                    return;
                }
                depends+=depends==""?vItem:","+vItem;
            });
        }
        else if(dependsType[1]==type){
            depends=""
            vDep.forEach(function(item,index,array){
                vItem=taskName2IdInfo[item];
                if(vItem==null){
                    return;
                }
                depends+=depends==""?vItem:","+vItem;
            });
        }

        return depends;
    }
	//加载甘特图UI
	function loadGanttUI(){
		try{
			//load templates
			$("#ganttemplates").loadTemplates();
			// here starts gantt initialization
			ge = new GanttMaster();
			var workSpace = $("#workSpace");
			//workSpace.css({width:$(window).width(),height:$(window).height() - 150});
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
			$(window).resize(function(){
				//workSpace.css({width:$(window).width() - 20,height:$(window).height() - 100});
				workSpace.trigger("resize.gantt");
			});
		}
		catch(error){
			console.error(error);
		}
	}
	//初始化甘特图控件多语言
	function setGanttLang(){
		//甘特图控件时间多语言
		GanttMaster.messages["Sun"]="<dict:lang value='日'/>";
		GanttMaster.messages["Mon"]="<dict:lang value='一'/>";
		GanttMaster.messages["Tue"]="<dict:lang value='二'/>";
		GanttMaster.messages["Wed"]="<dict:lang value='三'/>";
		GanttMaster.messages["Thu"]="<dict:lang value='四'/>";
		GanttMaster.messages["Fri"]="<dict:lang value='五'/>";
		GanttMaster.messages["Sat"]="<dict:lang value='六'/>";

		GanttMaster.messages["Jan"]="<dict:lang value='一月'/>";
		GanttMaster.messages["Feb"]="<dict:lang value='二月'/>";
		GanttMaster.messages["Mar"]="<dict:lang value='三月'/>";
		GanttMaster.messages["Apr"]="<dict:lang value='四月'/>";
		GanttMaster.messages["May"]="<dict:lang value='五月'/>";
		GanttMaster.messages["Jun"]="<dict:lang value='六月'/>";
		GanttMaster.messages["Jul"]="<dict:lang value='七月'/>";
		GanttMaster.messages["Aug"]="<dict:lang value='八月'/>";
		GanttMaster.messages["Sep"]="<dict:lang value='九月'/>";
		GanttMaster.messages["Oct"]="<dict:lang value='十月'/>";
		GanttMaster.messages["Nov"]="<dict:lang value='十一月'/>";
		GanttMaster.messages["Dec"]="<dict:lang value='十二月'/>";

		GanttMaster.messages["January"]="<dict:lang value='一月'/>";
		GanttMaster.messages["February"]="<dict:lang value='二月'/>";
		GanttMaster.messages["March"]="<dict:lang value='三月'/>";
		GanttMaster.messages["April"]="<dict:lang value='四月'/>";
		GanttMaster.messages["May"]="<dict:lang value='五月'/>";
		GanttMaster.messages["June"]="<dict:lang value='六月'/>";
		GanttMaster.messages["July"]="<dict:lang value='七月'/>";
		GanttMaster.messages["August"]="<dict:lang value='八月'/>";
		GanttMaster.messages["September"]="<dict:lang value='九月'/>";
		GanttMaster.messages["October"]="<dict:lang value='十月'/>";
		GanttMaster.messages["November"]="<dict:lang value='十一月'/>";
		GanttMaster.messages["December"]="<dict:lang value='十二月'/>";

		GanttMaster.messages["PER_SEMESTER"]="<dict:lang value='上半年'/>";
		GanttMaster.messages["PST_SEMESTER"]="<dict:lang value='下半年'/>";

		GanttMaster.messages["ONE_QUARTER"]="<dict:lang value='第一季度'/>";
		GanttMaster.messages["TWO_QUARTER"]="<dict:lang value='第二季度'/>";
		GanttMaster.messages["THREE_QUARTER"]="<dict:lang value='第三季度'/>";
		GanttMaster.messages["FOUR_QUARTER"]="<dict:lang value='第四季度'/>";
		//甘特图控件内部校验多语言
		GanttMaster.messages["VALIDATE_CANNOT_ILEGSTATUS"]="<dict:lang value='制令单状态不为开立，无法操作！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_OUTOF_PLAN_START"]="<dict:lang value='不能小于月排程单开始时间！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_OUTOF_PLAN_END"]="<dict:lang value='不能大于月排程单结束时间！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_TIMEIN_START"]="<dict:lang value='开始时间处于其他任务内！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_TIMEIN_END"]="<dict:lang value='结束时间处于其他任务内！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_TASKIN"]="<dict:lang value='存在重叠时间段！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_DEPENDS_ON_ANCESTORS"]="<dict:lang value='无法关联线体！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_TASK_END_CHANGE_TIME"]="<dict:lang value='结束时间处于后段任务换线时间内！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_PER_TASK_END_CHANGE_TIME"]="<dict:lang value='前段任务结束时间处于当前任务换线时间内！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_CIRCULAR_REFERENCE"]="<dict:lang value='重复关联！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_OUTOF_AVA_CALTIME"]="<dict:lang value='制令单必须处于线体测算时间内！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_OUTOF_PARENT_END"]="<dict:lang value='不能超出父级！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_MOVE_PER_FACE_COUNT"]="<dict:lang value='计划开始时间前，当前面别下达数量大于前置面别下达数量！'/>";

		try{
			initDateLang(GanttMaster.messages);
		}
		catch(error){}
	}
	//校准界面控件属性
	function adjustUI(){
		//设置计划开始时间未不可修改
		//$("#PPW_START_DATE_BEGIN").attr("disabled","false");
        //$("#PPW_START_DATE_END").attr("disabled","false");
        $("#PPW_START_DATE_BEGIN").attr("readonly",false);
		$("#PPW_START_DATE_END").attr("readonly",false);
        //设置轨道名称标识
        $("#sTrack").text(getTrackName(comSingleTrack));
        $("#aTrack").text(getTrackName(comATrackFlag));
        $("#bTrack").text(getTrackName(comBTrackFlag));
	}
	//初始化
	function initial(){
		//初始化预计开始时间
        getSerachStart();
        //初始化轨道信息
        getTrackInfo();
	}
	//日期放大
    function ganttZoomMin(){
        $('#workSpace').trigger('zoomMinus.gantt');
    }
    //日期缩小
    function ganttZoomplus(){
        $('#workSpace').trigger('zoomPlus.gantt');
    }
    //初始化轨道信息
    function getTrackInfo(){
        try{
            trackFlag=[];
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                async:false,
                data:{
                    opt:"getTrackInfo"
                },
                success:function(data){
                    if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                        data.ajaxList.forEach(function(track,index,array){
                            trackFlag.push({flag:track.CODE,name:track.VALUE});
                        });
                    }
                },
                error:function(error){
                    trackFlag=[];
                }
            });
        }
        catch(error){
            console.error(error);
        }
    }
    //初始化预计开工时间
    function getSerachStart(){
        var d=new Date();
		d.setDate(d.getDate()-7)
        $("#PPW_START_DATE_BEGIN").val(d.format("yyyy-MM-dd 00:00:00"));
        calAvaliableStart=new Date(d.format("yyyy-MM-dd 00:00:00"));
        d.setDate(d.getDate()+19);
        $("#PPW_START_DATE_END").val(d.format("yyyy-MM-dd 23:59:59"));
        calAvaliableEnd=new Date(d.format("yyyy-MM-dd 23:59:59"));
    }
    //获取轨道名称
    function getTrackName(track){
        try{
            var trackName="";
            for(var i=0,len=trackFlag.length;i<len;i++){
              if(track==trackFlag[i].flag){
                trackName=trackFlag[i].name;
                break;
              }
            }
            return trackName;
        }
        catch(error){
            console.error(error);
        }
    }
	//加载排程信息
    function setGanttInfo(){
        //获取查询条件
        var dataAuth=$("#DATA_AUTH option:selected").val();
        var step=$("#PPW_STEP option:selected").val()
        //var projectId=$("#PPW_PROJECT_ID_SHOW").val();
        //var material=$("#PRODUCT_MATERIAL_SHOW").val();
		var projectId="";
		var material="";
        var startPlanTime=$("#PPW_START_DATE_BEGIN").val();
        var endPlanTime=$("#PPW_START_DATE_END").val();
        //获取参数
        var data={};
        data.opt="getWeekGantt";
        data.dataAuth=dataAuth;
        data.step=step;
        data.projectId=projectId;
        data.material=material;
        data.startTime=startPlanTime;
        data.endTime=endPlanTime;
        //获取数据
        showLoading(true);
        $.ajax({
            type:"POST",
            dataType:"json",
            url:dataUrl,
            async:false,
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
                //(id:seq$name:线体or制令单$level:层级$start:起始时间$duration:跨度$end:结束时间$startIsMilestone:起始任务标识(true/false)$endIsMilestone:结束任务标识$depends:父级seq$hasChild:是否有子级)
                var taskSeq=0;//task Seq索引
                var taskList=[];//task对象集合
                var moDuration=0;//每个任务使用的产能（非线体类型任务）
                var usedWorkTime=0;//线体总已用产能
                var lineSeq=-1;
                var lineProgress=0;//线体已用产能百分百
                var isCalculated=false;
                var taskException=false;
                taskId2NameInfo=[];//清除关联关系
                taskName2IdInfo=[];//清除关联关系
                lines.forEach(function(lineInfo,lineIndex,lineArray){
                    //若线体有效跨度时间无效,则不进行记录
                    if(lineInfo.lineParams.LINE_START_TIME==null || lineInfo.lineParams.LINE_END_TIME==null ){
                        return;
                    }
                    taskSeq++;
                    //获取线体ID
                    lineSeq=taskSeq;
                    usedWorkTime=0;
                    //添加线体下的制令单
                    moDuration=0;
                    data.task[lineInfo.lineSn].forEach(function(moNumber,moIndex,moArray){
                        taskSeq++;
                        taskException=false;
                        moDuration=calDurationByNum(moNumber.STANDAR_TIME,moNumber.PM_TARGET_QTY);
                        usedWorkTime+=moDuration+parseInt(moNumber.CST_CHANGE_TIME);//占用产能=排程产能+换线时间
                        //判定是否已重新计算过
                        if(null!=moNumber.PM_START_DATE){
                            if(time2DateStr(moNumber.PM_SCHEDULE_DATE.time)==time2DateStr(moNumber.PM_START_DATE.time)){
                                isCalculated=true;
                            }
                        }
                        //校验任务是否存在异常
                        if(null==moNumber.STANDAR_TIME || ""==moNumber.STANDAR_TIME || parseInt(moNumber.STANDAR_TIME)==0){
                            taskException=true;
                        }
                        taskList.push(createGanttTask({
                            //插件必要属性
                            id:taskSeq,
                            name:moNumber.PM_MO_NUMBER,
                            level:childLevel,
                            status:ganttStatus[0],
                            start:moNumber.PM_SCHEDULE_DATE.time,
                            duration:moDuration,
                            end:moNumber.PM_DUE_DATE.time,
                            depends:moNumber.PM_PER_TASK,
                            startIsMilestone:false,
                            endIsMilestone:false,
                            hasChild:false,
                            collapsed:false,
                            lineMaxSeq:-1,
                            //制令单必要属性
                            //制令单表属性
                            taskGuid:moNumber.ID,
                            moNumber:moNumber.PM_MO_NUMBER,
                            projectId:moNumber.PM_PROJECT_ID,
                            step:moNumber.PM_PRODUCT_STEP,
                            areaSn:moNumber.PM_AREA_SN,
                            multiTrack:lineInfo.lineParams.CA_TRACK_FLAG,
                            track:moNumber.PM_TRACK,
                            trackName:getTrackName(moNumber.PM_TRACK),
                            face:moNumber.PM_PROCESS_FACE,
                            faceName:moNumber.PROCESS_FACE_NAME,
                            modelCode:moNumber.PM_MODEL_CODE,
                            pcbCode:moNumber.PM_PCB_CODE,
                            techSn:moNumber.PM_TECH_SN,
                            startGroup:moNumber.PM_START_GROUP,
                            endGroup:moNumber.PM_END_GROUP,
                            targetQty:moNumber.PM_TARGET_QTY,
                            intputCount:moNumber.PM_INPUT_COUNT,
                            finshCount:moNumber.PM_FINISH_COUNT,
                            scarpQty:moNumber.PM_SCRAP_QTY,
                            issuedDate:change2Date(moNumber.PM_ISSUED_DATE),
                            issuedEmp:moNumber.PM_ISSUED_EMP,
                            alterDate:change2Date(moNumber.PM_ALTER_DATE),
                            scheduleDate:change2Date(moNumber.PM_SCHEDULE_DATE),
                            dueDate:change2Date(moNumber.PM_DUE_DATE),
                            startDate:change2Date(moNumber.PM_START_DATE),
                            closeDate:change2Date(moNumber.PM_CLOSE_DATE),
                            pmStatus:moNumber.PM_STATUS,
                            unitNum:moNumber.PM_UNIT_NUM,
                            jigsawNum:moNumber.PM_JIGSAW_NUM,
                            controlType:moNumber.PM_CONTROL_TYPE,
                            snRule:moNumber.PM_SN_RULE,
                            subRule:moNumber.PM_SUB_RULE,
                            repairMax:moNumber.PM_REPAIR_MAX,
                            errorScarp:moNumber.PM_ERROR_SCRAP,
                            autoFqc:moNumber.PM_AUTO_FQC,
                            fqcNum:moNumber.PM_FQC_NUM,
                            memo:moNumber.PM_MEMO,
                            deptId:moNumber.DEPT_ID,
                            createUser:moNumber.CREATE_USER,
                            createTime:change2Date(moNumber.CREATE_TIME),
                            editUser:moNumber.EDIT_USER,
                            editTime:change2Date(moNumber.EDIT_TIME),
                            closeReason:moNumber.PM_CLOSE_REASON,
                            dataAuth:moNumber.DATA_AUTH,
                            transferRule:moNumber.PM_TRANSFER_RULE,
                            custCode:moNumber.PM_CUST_CODE,
                            planId:moNumber.PM_PLAN_ID,
                            planDocNum:moNumber.PPW_DOC_NO,
                            isCalculated:isCalculated,
                            //非制令单表属性
                            isLine:false,
                            isChanged:false,//任务是否发生改变(暂时为true,后期进行管控)
                            taskOpt:updateFlag,
                            stepName:moNumber.STEP,
                            areaName:moNumber.CA_NAME,
                            statusName:moNumber.STATUS,
                            modelName:moNumber.CI_ITEM_NAME,
                            productCount:moNumber.PRODUCT_COUNT,
                            standarTime:moNumber.STANDAR_TIME,
                            changeTime:moNumber.CST_CHANGE_TIME,
                            planedNum:moNumber.PLANED_NUM,
                            planTime:moNumber.PLAN_TIME,
                            projectStartDate:change2Date(moNumber.PROLEPSIS_START_DATE),
                            projectEndDate:change2Date(moNumber.PROLEPSIS_END_DATE),
                            projectDelvDate:change2Date(moNumber.TPPB_PLAN_DELIVERY_DATE),
                            planGroup:moNumber.PLAN_GROUP,
                            perFace:moNumber.PER_FACE,
							isForSituation:true,
                            taskException:taskException
                        }));
                        referenceId2Name(taskSeq,moNumber.PM_MO_NUMBER);//记录name和id的关联关系
                    });
                    //添加线体类型任务
                    taskList.splice(lineSeq-1,0,createGanttTask({
                        //插件必要属性
                        id:lineSeq,
                        name:lineInfo.lineParams.CA_NAME,
                        level:parentLevel,
                        status:"",//ganttStatus[2],
                        start:lineInfo.lineParams.LINE_START_TIME.time,
                        //duration:calDuration(lineInfo.lineParams.LINE_START_TIME.time,lineInfo.lineParams.LINE_END_TIME.time),
                        duration:data.availableTime[lineInfo.lineSn],
                        end:lineInfo.lineParams.LINE_END_TIME.time,
                        hasChild:false,
                        collapsed:false,
                        progress:calProgress(usedWorkTime,data.availableTime[lineInfo.lineSn]),
                        lineMaxSeq:lineSeq+data.task[lineInfo.lineSn].length,//当前线别，子任务最大索引
                        //制令单必要属性
                        //制令单表属性
                        areaSn:lineInfo.lineSn,
                        multiTrack:lineInfo.lineParams.CA_TRACK_FLAG,
                        //非制令单表属性
                        isLine:true,
                        isChanged:false,//任务是否发生改变
						isForSituation:true,
                        //产能(针对线体)
                        availableWorkTime:data.availableTime[lineInfo.lineSn],
                        usedWorkTime:usedWorkTime,
                        isSat:data.areaSn[lineInfo.lineSn].PPC_SAT_FLAG,
                        isSun:data.areaSn[lineInfo.lineSn].PPC_SUN_FLAG,
                        lostTimebyCoe:data.areaSn[lineInfo.lineSn].LINE_TIME_LOST_BY_COE,
                        //工厂日历时间段
                        workTimeInfo:getCalWorkTimeInfo(data.dayWorkTimeInfo[lineInfo.lineSn]),
                        restTimeInfo:getCalRestTimeInfo(data.dayRestTimeInfo[lineInfo.lineSn]),
                        //例外时间
                        exceptionTimeInfo:getExceptionTimInfo(data.exceptionInfo[lineInfo.lineSn])
                    }));
                    referenceId2Name(lineSeq,lineInfo.lineParams.CA_NAME);//记录name和id的关联关系
                });
                //循环记录线体特殊时间点
                setEachLineSpecialTime(taskList);
                //校准制令单换线时间位置
                taskList.forEach(function(task,index,array){
                    if(task.isLine){
                        return;
                    }
                    changeTimePosition(task);
                    if(task.changeTimePosition==changeTimePositionParam[1]){
                        task.realDuration=task.duration;
                        task.duration=task.duration+task.changeTime;
                    }
                });
                //校准前置任务
                taskList=ajdustDepends(taskList);
                ganttTasks.tasks=taskList;
                toLoadGanttData(ganttTasks);
                showLoading(false);
            },
            error:function(msg){
                showLoading(false);
            }
        });
    }
	//获取数据接口URL
    function getDataUrl(){
        //VM-周排程---周排程获取数据
        return "${path}buss/bussModel_exeFunc.ms?funcMId=1d6d0035309f4db2ba86243e762b2ef0";
    }
	//显示进度条
    function showLoading(isShow){
        if(isShow){
            util.showLoading("处理中...");
        }
        else {
            util.closeLoading();
        }
    }
	//加载数据
    function toLoadGanttData(data){
        //var ret=JSON.parse(data);
        ge.loadProject(data);
        ge.checkpoint();
    }
	//校准depends
    function ajdustDepends(taskList){
        //校准前置任务
        taskList.forEach(function(task,index,array){
            if(task.isLine || task.depends==null || task.depends==""){
                return;
            }
            task.depends=changeDepends(task.depends,dependsType[1]);
            task.status=ganttStatus[3];
        });
        return taskList;
    }
	//循环记录线体特殊时间点
    function setEachLineSpecialTime(taskList){
        taskList.forEach(function(task,index,array){
            if(task.isLine){
                setLineSpecialTime({
                    areaSn:task.areaSn,
                    workTime:task.workTimeInfo,
                    restTime:task.restTimeInfo,
                    exceptionTime:task.exceptionTimeInfo,
                    isSat:task.isSat,
                    isSun:task.isSun
                });
            }
        });
    }
	//生成工厂日历工作时间段
    function getCalWorkTimeInfo(workTimeInfo){
        var info=[];
        if(workTimeInfo!=null && typeof(workTimeInfo)!="undefined"){
            workTimeInfo.forEach(function(item,index,array){
            info.push({
                start:item.STARTTIME,
                end:item.ENDTIME,
                isInerDay:item.CALW_INTER_DAY
            });
        });
        }
        return info;
    }
    //生成工厂日历休息时间段
    function getCalRestTimeInfo(restTimeInfo){
        var info=[];
        if(restTimeInfo!=null && typeof(restTimeInfo)!="undefined"){
            restTimeInfo.forEach(function(item,index,array){
            info.push({
                start:item.STARTTIME,
                end:item.ENDTIME
            });
        });
        }
        return info;
    }
    //生成例外时间信息
    function getExceptionTimInfo(exceptionTimeInfo){
        var info=[];
        if(exceptionTimeInfo!=null && typeof(exceptionTimeInfo)!="undefined"){
            exceptionTimeInfo.forEach(function(item,index,array){
            info.push({
                start:change2Date(item.PPE_BEGIN_TIME),
                end:change2Date(item.PPE_END_TIME),
                type:item.PPE_EXECPTION_TYPE
            });
        });
        }
        return info;
    }
	//计算百分百
    function calProgress(value,total){
        var progress="Infinity";
        try
        {
            if(parseInt(total)==0){
                return progress;
            }
            progress=(parseInt(value)/parseInt(total)*100).toFixed(2);
            if(progress<0){
                progress="Infinity";
            }
            return progress;
        }
        catch(error){
            return progress;
        }
    }
	//记录id和Name关联关系
    function referenceId2Name(id,name){
        taskId2NameInfo[id]=name;
        taskName2IdInfo[name]=id;
    }
	//转换时间
    function change2Date(obj){
        try
        {
            var d=new Date();
            d.setFullYear(obj.year);
            d.setMonth(obj.month);
            d.setDate(obj.date);
            d.setHours(obj.hours);
            d.setMinutes(obj.minutes,0,0);
            return d.format("yyyy-MM-dd HH:mm:00");
        }
        catch(error){
            return "";
        }
    }
	//时间time转换为Date String
    function time2DateStr(time){
        try{
            var d=new Date(time);
            return d.format("yyyy-MM-dd HH:mm:00");
        }
        catch(error){
            return "";
        }
    }
	//计算持续时间,根据标准工时(s)和计划数量计算(进度分钟m)
    function calDurationByNum(standarTime,num){
        var workTime=(standarTime*num/60).toFixed(0);
        return parseInt(workTime);
    }
	//生成task
    function createGanttTask(param){
        return createWeekGanttTask(param);
    }
</script>
<script type="text/javascript">

    var ge;  //this is the hugly but very friendly global var for the gantt editor

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
            "CIRCULAR_REFERENCE":"重复关联！",
            "CANNOT_DEPENDS_ON_DESCENDANTS":"CANNOT_DEPENDS_ON_DESCENDANTS",
            "INVALID_DATE_FORMAT":"INVALID_DATE_FORMAT",
            "TASK_MOVE_INCONSISTENT_LEVEL":"TASK_MOVE_INCONSISTENT_LEVEL",
            "GANTT_QUARTER_SHORT":"trim.",
            "GANTT_SEMESTER_SHORT":"sem.",
            //自定义多语言标识
            "GANTT_CANNOT_OUTOF_PARENT_END":"不能超出父级！",
            "GANTT_CANNOT_OUTOF_PLAN_START":"不能小于工单开始时间！",
            "GANTT_CANNOT_OUTOF_PLAN_END":"不能大于工单结束时间！",
            "GANTT_CANNOT_TIMEIN_START":"开始时间处于其他任务内！",
            "GANTT_CANNOT_TIMEIN_END":"结束时间处于其他任务内！",
            "GANTT_CANNOT_TASKIN":"存在重叠时间段！",
            "GANTT_CANNOT_ILEGSTATUS":"制令单状态不为开立，无法操作！",
            "CANNOT_DEPENDS_ON_ANCESTORS":"无法关联线体",
            "GANTT_CANNOT_TASK_END_CHANGE_TIME":"结束时间处于后段任务换线时间内！",
            "GANTT_CANNOT_PER_TASK_END_CHANGE_TIME":"前段任务结束时间处于当前任务换线时间内！"
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
    function toLoadGanttData(data){
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
				<tr style="height:40px">
					<th class="gdfColHeader gdfResizable" style="width:200px;"><dict:lang value="制令单号"/></th>
					<th class="gdfColHeader gdfResizable" style="width:70px;text-align: center;"><dict:lang value="状态"/></th>
					<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="预计开工时间"/></th>
					<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="预计完工时间"/></th>
					<th class="gdfColHeader gdfResizable" style="width:150px;"><dict:lang value="工单号"/></th>
					<th class="gdfColHeader gdfResizable" style="width:150px;"><dict:lang value="月排程单号"/></th>
					<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="开始时间"/></th>
					<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="结束时间"/></th>
					<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="机种"/></th>
					<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="机种名称"/></th>
                    <th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="工单数量"/></th>
                    <th class="gdfColHeader gdfResizable" style="width:60px;"><dict:lang value="面别"/></th>
					<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="标准工时(S)"/></th>
					<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="已排产数量"/></th>
					<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="排产数量"/></th>
					<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="排产工时(H)"/></th>
					<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="计划交货时间"/></th>
					<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="计划组"/></th>
					<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="前置任务"/></th>
				</tr>
				</thead>
			</table>
		</div>
	
		<% /*任务列表*/  /*修改为不可输入 */%>
		<div class="__template__" type="TASKROW"><!--
			<tr taskId="(#=obj.id#)" class="taskEditRow" level="(#=level#)">
			<td class="gdfCell indentCell" style="padding-left:(#=obj.level*10#)px;">
			<div class="(#=obj.isParent()?'exp-controller expcoll exp':'exp-controller'#)" align="center"></div>
			<input type="text" name="name" value="(#=obj.name#)" style="(#=obj.isLine?'font-weight:bold;font-size: 14px;':''#)" disabled="false">
			</td>
			<td class="gdfCell" align="center">
			<span class="ganttState" style="(#=(obj.isLine?'':(obj.pmStatus==0?'background-color:rgb(78, 157, 15);':(obj.pmStatus==1?'background-color:rgb(0, 160, 233);':'background-color:rgb(174, 174, 174);')))#)"><input type="text" name="statusName" value="(#=obj.statusName#)" disabled="false" style='text-align: center;color:#FFFFFF;'></span>
			</td>
			<td class="gdfCell">
			<input type="text" name="start"  value="" class="date" disabled="false">
			</td>
			<td class="gdfCell">
			<input type="text" name="end" value="" class="date" disabled="false">
			</td>
			<td class="gdfCell">
			<input type="text" name="projectId" value="(#=obj.projectId#)" disabled="false">
			</td>
			<td class="gdfCell">
			<input type="text" name="projectId" value="(#=obj.planDocNum#)" disabled="false">
			</td>
			<td class="gdfCell">
			<input type="text" name="projectStartDate" value="(#=obj.projectStartDate#)" disabled="false">
			</td>
			<td class="gdfCell">
			<input type="text" name="projectEndDate" value="(#=obj.projectEndDate#)" disabled="false">
			</td>
			<td class="gdfCell">
			<input type="text" name="modelCode" value="(#=obj.modelCode#)" disabled="false">
			</td>
			<td class="gdfCell">
			<input type="text" name="modelName" value="(#=obj.modelName#)" disabled="false">
			</td>
			<td class="gdfCell">
			<input type="text" name="productCount" value="(#=obj.productCount#)" disabled="false" style="text-align:right;">
            </td>
            <td class="gdfCell">
            <input type="text" name="faceName" value="(#=obj.faceName#)" disabled="false" style="text-align:center;">
            </td>
			<td class="gdfCell">
			<input type="text" name="standarTime" value="(#=obj.standarTime#)" disabled="false" style="text-align:right;">
			</td>
			<td class="gdfCell">
			<input type="text" name="planedNum" value="(#=obj.planedNum#)" disabled="false" style="text-align:right;">
			</td>
			<td class="gdfCell">
			<input type="text" name="targetQty" value="(#=obj.targetQty#)" disabled="false" style="text-align:right;">
			</td>
			<td class="gdfCell">
			<input type="text" name="planTime" value="(#=obj.planTime#)" disabled="false" style="text-align:right;">
			</td>
			<td class="gdfCell">
			<input type="text" name="projectDelvDate" value="(#=obj.projectDelvDate#)" disabled="false">
			</td>
			<td class="gdfCell">
			<input type="text" name="" value="" disabled="false">
			</td>
			<td class="gdfCell">
			<input type="text" name="depends" value="(#=obj.depends#)" disabled="false" style="text-align:right;">
			</td>
			</tr>-->
		</div>
	
		<% /*空任务列表 */%>
	
	 <div class="__template__" type="TASKEMPTYROW"><!--
        <tr class="taskEditRow emptyRow" >
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
            <td class="gdfCell"></td>
        </tr>-->
     </div> 
	
		<% /*任务进度*/ %>
		<div class="__template__" type="TASKBAR"><!--
	<div class="taskBox taskBoxDiv" taskId="(#=obj.id#)" >
	<div class="layout (#=obj.hasExternalDep?'extDep':''#)">
	<div class="taskStatus" status="(#=obj.status#)"></div>
	<div class="taskProgress" style="width:(#=obj.progress>100?100:obj.progress#)%; background-color:(#=obj.progress>100?'red':'rgb(153,255,51);'#);"></div>
	<div class="milestone (#=obj.startIsMilestone?'active':''#)" ></div>
	<div class="taskLabel"></div>
	<div class="milestone end (#=obj.endIsMilestone?'active':''#)" ></div>
	</div>
	</div>-->
		</div>
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
