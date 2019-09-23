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
		<dict:lang value="月排程" />
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
	
	<!-- styles -->
	<link rel=stylesheet href="${path}buss/aps/newMonth/platform.css" type="text/css">
    <link rel=stylesheet href="${path}buss/aps/newMonth/libs/jquery/dateField/jquery.dateField.css" type="text/css">
    <link rel=stylesheet href="${path}buss/aps/newMonth/gantt.css" type="text/css">
    <link rel=stylesheet href="${path}buss/aps/newMonth/ganttPrint.css" type="text/css" media="print">
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
	</style> 
	
	<!-- script -->
	<script src="${path}buss/aps/month/gantt_js/ganttCommon.js"></script>  
	<script src="${path}buss/aps/common/js/uuid.js"></script>
	
	
    <script src="${path}buss/aps/newMonth/libs/jquery/jquery.livequery.1.1.1.min.js"></script>
    <script src="${path}buss/aps/newMonth/libs/jquery/jquery.timers.js"></script>

    <script src="${path}buss/aps/newMonth/libs/utilities.js"></script>
    <script src="${path}buss/aps/newMonth/libs/forms.js"></script>
    <script src="${path}buss/aps/newMonth/libs/date.js"></script>
    <script src="${path}buss/aps/newMonth/libs/dialogs.js"></script>
    <script src="${path}buss/aps/newMonth/libs/layout.js"></script>
    <script src="${path}buss/aps/newMonth/libs/i18nJs.js"></script>
    <script src="${path}buss/aps/newMonth/libs/jquery/dateField/jquery.dateField.js"></script>
    <script src="${path}buss/aps/newMonth/libs/jquery/JST/jquery.JST.js"></script>

    <script type="text/javascript" src="${path}buss/aps/newMonth/libs/jquery/svg/jquery.svg.min.js"></script>
    <script type="text/javascript" src="${path}buss/aps/newMonth/libs/jquery/svg/jquery.svgdom.1.8.js"></script>


    <script src="${path}buss/aps/newMonth/ganttUtilities.js"></script>
    <script src="${path}buss/aps/newMonth/ganttTask.js"></script>
    <script src="${path}buss/aps/newMonth/ganttDrawerSVG.js"></script>
    <script src="${path}buss/aps/newMonth/ganttZoom.js"></script>
    <script src="${path}buss/aps/newMonth/ganttGridEditor.js"></script>
    <script src="${path}buss/aps/newMonth/ganttMaster.js"></script>  
</head>

<body>
<div class="content-in">
	<div class="dlist">
		<div class="hd">
			<bu:func viewId="b9f633032fd34daf870243ed44ea6b96" />
		</div>
		<div class="bd">
			<div class="search-box">
				<form id="conditionForm" name="conditionForm" action="${path}buss/bussModel.ms" method="post">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
						<jsp:param name="modelName" value="VIEW_TYPE_17" />
						<jsp:param name="location" value="searchForm" />
					</jsp:include>

					<bu:search viewId="b9f633032fd34daf870243ed44ea6b96" />
				</form>
			</div>
			<div style="background-color: #fff;border: 1px solid #eaeaea;height: calc(100% - 30px);box-sizing: border-box;">
					
				<% /*该 div为甘特图*/ %>
				<div>
					<input type="hidden" id="projectList" name="projectList" value=''></input>  
					<div id="workSpace" style="padding:0px; overflow-x:auto; overflow-x:hidden;position:relative;"></div>
					<div id="explain" class="explain">
						*<dict:lang value="状态说明"/>：
						<span class="item"><img src="${path}buss/aps/month/gantt_img/start.png"><dict:lang value="开始"/></span>
						<span class="item"><img src="${path}buss/aps/month/gantt_img/end.png"><dict:lang value="结束"/></span>
					</div>
					<style>
					.resEdit {
						padding: 15px;
					}
					.resLine {
						width: 95%;
						padding: 3px;
						margin: 5px;
						border: 1px solid #d0d0d0;
					}
					body {
						overflow: hidden;
					}
					.ganttButtonBar h1{
						color: #000000;
						font-weight: bold;
						font-size: 28px;
						margin-left: 10px;
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
			
					<script type="text/javascript">
					
						var ge;  //this is the hugly but very friendly global var for the gantt editor
						
						$(function() {
						  var canWrite=true; //this is the default for test purposes

                          // here starts gantt initialization
                          ge = new GanttMaster();
                          ge.set100OnClose=true;
                        
                          ge.shrinkParent=true;
                          var workSpace = $("#workSpace");
                          ge.init(workSpace);
                          loadI18n(); //overwrite with localized ones
                          //执行初始化
                		  initial();
                		 //首次查询
                		  query();
						 });
						 

						//-------------------------------------------  Create some demo data ------------------------------------------------------
					
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
                            
                              //if not found create a new example task
                              if (!ret || !ret.tasks || ret.tasks.length == 0){
                                ret=getDemoProject();
                              }
                              return ret;
						}
				
					</script>
			
				<% /*内容展示区域*/ %>
					<div id="gantEditorTemplates" style="display:none;">
				
						<% /*任务栏菜单列*/ %>
						<div class="__template__" type="TASKSEDITHEAD">  
							<table class="gdfTable" cellspacing="0" cellpadding="0">
								<thead>
									<tr style="height:40px">
										<th class="gdfColHeader" style="width:50px;"><dict:lang value="编号"/></th>
										<th class="gdfColHeader" style="width:35px;" ></th>

										<th class="gdfColHeader gdfResizable" style="width:180px;align:center" ><dict:lang value="工单号"/></th>
										<th class="gdfColHeader gdfResizable" style="width:180px;" ><dict:lang value="排程单号"/></th>
										<th class="gdfColHeader gdfResizable" style="width:70px;"><dict:lang value="状态"/></th>
										<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="预计开工时间"/></th>
										<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="预计完工时间"/></th>
										<th class="gdfColHeader gdfResizable" style="width:180px;"><dict:lang value="机种"/></th>
										<th class="gdfColHeader gdfResizable" style="width:180px;"><dict:lang value="机种名称"/></th>
										<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="计划数量"/></th>
										<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="标准工时"/>(S)</th>
										<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="生产工时"/>(H)</th>
										<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="当前排产数量"/></th>
										<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="当前排产工时"/>(H)</th>
										<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="预计交货时间"/></th>
										<th class="gdfColHeader gdfResizable" style="width:70px;"><dict:lang value="前置任务"/></th>
									</tr>
								</thead>
							</table>
						</div>
				
						<% /*任务列表*/  /*修改为不可输入 */%>
						<div class="__template__" type="TASKROW"><!--
						<tr taskId="(#=obj.id#)" class="taskEditRow"  style="height:30px!important" level="(#=level#)">
								<td class="gdfCell" align="center" style="cursor:pointer;">
								<span>(#=obj.getRow()+1#)</span>
								</td>
								<td class="gdfCell" align="center">
									<input type="checkbox" class="delPlan" plandoc="(#=obj.monthPlanDoc#)" taskaddtype="(#=obj.addType#)" taskid="(#=obj.getRow()+1#)" stepsn="(#=obj.stepSn#)" tobeinsert="(#=obj.monthPlanDoc==''?true:false#)" projectstatus="(#=obj.projectStatus#)" style="(#=obj.isStep  ? "display:none" : "width:15px;"#)"></input>
								</td>
							
								<td class="gdfCell indentCell" style="padding-left:(#=obj.level*10#)px;">
										<div class="(#=obj.isParent()?'exp-controller expcoll exp':'exp-controller'#)" align="center"></div>
									<input type="text" name="name" value="(#=obj.name#)" style="(#=obj.isStep?'font-weight:bold;font-size: 14px;':''#)" disabled="false">
								</td>
								<td class="gdfCell" align="center" style="text-align:center;vertical-align:middle;">
									<input type="text" name="monthPlanDoc"  value="(#=obj.monthPlanDoc#)"  disabled="false">
								</td>
								<td class="gdfCell" align="center">
									<span class="ganttState" style="(#=(obj.isStep?'':(obj.projectStatus==0?'background-color:rgb(78, 157, 15);':(obj.projectStatus==1?'background-color:rgb(0, 160, 233);':'background-color:rgb(174, 174, 174);')))#)"><input type="text" name="projectStatusName" style="text-align:center;color:#FFFFFF;"  value="(#=obj.projectStatusName#)" disabled="false"></span>
								</td>
								<td class="gdfCell">
									<input type="text" name="start"  value="" class="date" disabled="false">
								</td>
								<td class="gdfCell">
									<input type="text" name="end" value="" class="date" disabled="false">
								</td>
								<td class="gdfCell">
									<input type="text" name="itemCode"  value="(#=obj.itemCode#)" disabled="false">
								</td>
								<td class="gdfCell">
									<input type="text" name="itemName"  value="(#=obj.itemName#)" disabled="false">
								</td>
								<td class="gdfCell">
									<input type="text" name="projectPlanNum"  value="(#=obj.projectPlanNum#)" disabled="false" style="text-align:right;">
								</td>
								<td class="gdfCell">
									<input type="text" name="standarTime"  value="(#=obj.standarTime#)" disabled="false" style="text-align:right;">
								</td>
								<td class="gdfCell">
									<input type="text" name="projectPlanTime"  value="(#=obj.projectPlanTime#)" disabled="false" style="text-align:right;">
								</td>
								<td class="gdfCell">
									<input type="text" name="monthNowNum"  value="(#=obj.monthNowNum#)" disabled="false" style="text-align:right;">
								</td>
								<td class="gdfCell">
									<input type="text" name="monthPlanTime"  value="(#=obj.monthPlanTime#)" disabled="false" style="text-align:right;">
								</td>
								<td class="gdfCell">
									<input type="text" name="deliveryDate" value="(#=obj.deliveryDate#)" class="date" disabled="false">
								</td>
								<td class="gdfCell">
									<input type="text" name="depends" value="(#=obj.depends#)" disabled="false" style="text-align:right;">
								</td>
							</tr>-->
						</div>
				
						<% /*空任务列表 */%>
				
					<div class="__template__" type="TASKEMPTYROW">
					
						  	<!--  	<tr class="taskEditRow emptyRow" >
							    <td class="gdfCell" align="center">
							    <td class="gdfCell" align="center">
							      <td class="gdfCell" align="center">
							    <td class="gdfCell" align="center">
							      <td class="gdfCell" align="center">
							    <td class="gdfCell" align="center">
							      <td class="gdfCell" align="center">
							    <td class="gdfCell" align="center">
							      <td class="gdfCell" align="center">
							    <td class="gdfCell" align="center">
							      <td class="gdfCell" align="center">
							    <td class="gdfCell" align="center">
							      <td class="gdfCell" align="center">
							    <td class="gdfCell" align="center">
							      <td class="gdfCell" align="center">
							    <td class="gdfCell" align="center">
							      <td class="gdfCell" align="center">
							    <td class="gdfCell" align="center">
							      <td class="gdfCell" align="center">
							    <td class="gdfCell" align="center">
							      <td class="gdfCell" align="center">
							    <td class="gdfCell" align="center">
							</tr>    -->
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
				</div>
				<% /*该 div为甘特图 结束 */ %>
			</div>
		</div>
	</div>
</div>	

<%--拆分编辑弹窗--%>
<div class="dialog-mask" id="splitProjectMask" style="z-index:10000"></div>
<div class="dialog dialog-s1" id="splitProject" style="display:none;z-index:10001;margin-left:0px;left:calc(50% - 550px);top:50px;width:1100px;height:510px;">
	<div class="dialog-hd">
		<h3 class="tit"><dict:lang value="拆分"/></h3>
	</div>
	<a class="dialog-close" href="javascript:void(0);" onclick="divHide('splitProject', 'splitProjectMask');"></a>
	<div class="dialog-bd-div" style="width:100%;height:470px;">
		<div class="optn optn_div">
			<button type="button" id="save" name="save" onclick="splitSave();"><i class="ico ico-save"></i><dict:lang value="提交"/></button>
			<button type="button" onclick="divHide('splitProject', 'splitProjectMask');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
		</div>
		<div class="edit">
			<div class="bd">
				<div class="mod">
					<div class="mod-hd">
						<h3 class="tit"><dict:lang value="基本信息" /></h3>
					</div>
					<div class="mod-hd" style="height:220px;border-bottom:0;">
						<table class="basic-table" >
							<tbody>
							<tr>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="排程单号"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colPpwId" class="input" readonly="readonly">
								</td>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="工单号"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colProjectId" class="input" readonly="readonly">
								</td>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="状态"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colStatus" class="input" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="生产阶别"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colStepCode" class="input" readonly="readonly" hidden="hidden">
									<input type="text" id="colStep" class="input" readonly="readonly">
								</td>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="机种"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colModelCode" class="input" readonly="readonly">
								</td>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="机种名称"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colModelName" class="input" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="计划数量"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colPlanNum" class="input" readonly="readonly">
								</td>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="投入数量"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colInputNum" class="input" readonly="readonly">
								</td>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="产出数量"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colOutputNum" class="input" readonly="readonly">
								</td>
							</tr>
							<tr> 
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="生产工时"/>(H)</td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colCapatcity" class="input" readonly="readonly">
								</td>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="标准工时"/>(S)</td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colStandard" class="input" readonly="readonly">
								</td>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="排产数量"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="colPlanedNum" class="input" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="排产工时"/>(H)</td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="unUsedCapatcity" class="input" readonly="readonly">
								</td>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="阶别总产能"/>(H)</td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="stepTotalCapatcity" class="input" readonly="readonly">
								</td>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="阶别剩余产能"/>(H)</td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input type="text" id="stepUnUsedCapatcity" class="input" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="预计开工时间"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input id="colExpStart" name="colExpStart" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" disabled="false">
								</td>
								<td class="name" style="width: 100px;text-align: right;"><dict:lang value="预计完工时间"/></td>
								<td class="dec" style="width: 120px;text-align: left;">
									<input id="colExpEnd" name="colExpEnd" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" disabled="false">
								</td>
							</tr>
							</tbody>
						</table>
					</div>
					<div id="content1">
						<div class="mod-hd">
							<h3 class="tit"><dict:lang value="拆分信息" /></h3>
						</div>
						<div class="mod-hd" style="height:80px;border-bottom:0;">
							<table class="basic-table" >
								<tbody>
								<tr>
									<td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="拆分数量"/></td>
									<td class="dec" style="width: 120px;text-align: left;">
										<input type="text" id="colPlanCount" name="colPlanCount" value="" maxlength="9" onchange="splitTimeChange()" class="_VAL_NULL input isSubmit _VAL_OjbsData _VAL_DATABASE"  onkeyup="value=value.replace(/[^\d]/g,'')">
									</td>
									<td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="拆分工时(H)"/></td>
									<td class="dec" style="width: 120px;text-align: left;">
										<input type="text" id="colPlanCapatcity" name="colPlanCapatcity" value="" maxlength="9"  class="_VAL_NULL input isSubmit _VAL_OjbsData _VAL_DATABASE" readonly="readonly" disabled="false">
									</td>
									<td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="预计开工时间"/></td>
									<td class="dec" style="width: 120px;text-align: left;">
										<input id="colPlanStart" name="colPlanStart" class="input WdateNomorl" onchange="splitTimeChange()" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss'})" data="">
									</td>
								</tr>
								<tr>
									<td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="预计完工时间"/></td>
									<td class="dec" style="width: 120px;text-align: left;">
										<input id="colPlanEnd" name="colPlanEnd" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" disabled="false">
									</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//月排程变量
	var parentLevel=0;//父级等级标识（暂时只有2个层级）
	var childLevel=1;//子级等级标识
	var insertFlag="insert";
	var updateFlag="update";
	var ganttStatus=["STATUS_ACTIVE","STATUS_DONE","STATUS_FAILED","STATUS_SUSPENDED","STATUS_UNDEFINED"];//甘特图任务状态
	var dataUrl="";//数据URL
	var messageLang=[];//提示框多语言
	var calAvaliableStart=null;//阶别测算开始时间
	var calAvaliableEnd=null;//阶别测算结束时间
	var dependsType=["id2Name","name2Id"];//depends转换类型
	//拆分用到的全局变量
	var vSplitTask=null;//进行拆分的任务
	var vSplitStepTask=null;//进行拆分任务的阶别
	var canSplitNum=0;//可拆分数量
	//甘特图数据缓存
	var ganttTasks={
		tasks:[],
		selectedRow:0,
		canWrite:true,
		canWriteOnParent:true
	};//甘特图任务数据
	var vTask=null; //临时月排程任务
	var taskAddType=["query","split","select"];//添加任务到甘特图中的方式：query-查询；split-拆分；select-选择工单
    var taskId2NameInfo;//key - taskId;  value - taskName
	var taskName2IdInfo;//key - taskName;  value - taskId
	var exceptionMsg=[];//异常类型计划=> 1-标准工时未维护

    //--------------------------计划组用到的变量----------------
	var planGroupActive=true;//是否启用计划组
	//---------------------------------------------------------

	function dateFormat(date,f) { 
		var numberFormat = function(n){
			return n < 10 ? ("0" + n )  : n;
		}
		
		var fmt  = date.getFullYear() + "-" + numberFormat(date.getMonth() + 1) + "-" + numberFormat(date.getDate()) + " ";
		fmt += numberFormat(date.getHours()) + ":" + numberFormat(date.getMinutes()) + ":" + numberFormat(date.getSeconds())
		return fmt; 
	}
	
	function getNow(){
		var now=new Date();
		now.setHours(0);
		now.setMinutes(0);
		now.setSeconds(0);
		now.setMilliseconds(0);
		return now;
	}
	//获取数据接口URL
	function getUrl(){
		return "${path}buss/bussModel_exeFunc.ms?funcMId=f44ae4c30fa64f92ad57d0f0594dfcfd";
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
	function toLoadGanttData(data)
	{
		//计划组信息
		if(planGroupActive) {
			//收集计划组信息
			collectTimePoint(data);
		}
		//var ret=JSON.parse(data);
		ge.loadProject(data);
		ge.checkpoint();
	}
	//消息提示
	//** type 1：警告；2：成功；3：失败；4：疑问；5：锁定
	//** msg 消息
	//** islan 是否默认使用多语言
	function showMessage(type,msg,islan){
	utilsFp.confirmIcon(type,"","","", msg,0,"260","");
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
	//初始化甘特图控件多语言
	function setGanttLang(){
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
		GanttMaster.messages["VALIDATE_CANNOT_ILEGSTATUS"]="<dict:lang value='工单状态不为开立，无法操作！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_DEPENDS_ON_ANCESTORS"]="<dict:lang value='无法关联线体！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_CIRCULAR_REFERENCE"]="<dict:lang value='重复关联！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_OUTOF_AVA_CALTIME"]="<dict:lang value='工单必须处于阶别测算时间内！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_OUTOF_PARENT_END"]="<dict:lang value='不能超出父级！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_OUTOF_MO_TIME"]="<dict:lang value='开始时间或结束时间不满足已下达制令单的时间！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_BEH_MAX_COUNT"]="<dict:lang value='计划数量不能大于可排产数量！'/>";
		GanttMaster.messages["VALIDATE_CANNOT_BEL_MIN_COUNT"]="<dict:lang value='计划数量不能小于等于0！'/>";

		try{
			initDateLang(GanttMaster.messages);
		}
		catch(error){}

	}
	//设置通用多语言
	function setCommonLang(){
		try{
			comLang["LINE_NAME"]="<dict:lang value='阶别'/>";
			comLang["TOTAL_WORKTIME"]="<dict:lang value='总产能'/>";
			comLang["USED_WORKTIME"]="<dict:lang value='已使用产能'/>";
			comLang["LEFT_WORKTIME"]="<dict:lang value='剩余产能'/>";
			comLang["USED_PERCENT"]="<dict:lang value='产能使用率'/>";
			comLang["PPW_DOC_NO"]="<dict:lang value='排程单号'/>";
			comLang["PROJECT_ID"]="<dict:lang value='工单号'/>";
			comLang["START_PLAN_DATE"]="<dict:lang value='开始时间'/>";
			comLang["END_PLAN_DATE"]="<dict:lang value='结束时间'/>";
			comLang["CAPATCITY"]="<dict:lang value='使用产能'/>";
			comLang["LINE_COUNT"]="<dict:lang value='线体数量'/>";
			comLang["TASKEXCEPTION_STATUS"]="<dict:lang value='任务状态'/>";
            comLang["TASKEXCEPTION_STATUS_TRUE"]="<dict:lang value='异常'/>";
			comLang["TASKEXCEPTION_STATUS_FALSE"]="<dict:lang value='正常'/>";
			comLang["TASKEXCEPTION_MSG"]="<dict:lang value='异常原因'/>";
		}
		catch(error){}
	}
	//显示div弹窗
	function divShow(front,back){
		$("#"+front+",#"+back).show();
	}
	//隐藏div弹窗
	function divHide(front,back){
		$("#"+front+",#"+back).hide();
	}
	//获取任务
	function getTask(id){
		var rtn = null;
		$(ge.tasks).each(function(i,e){
			if(e.id != id) return true;
			rtn = e;
			return false;
		});
		return rtn;
	}
	//显示未配置标准工时的工单
	function showNoStandartProject(m){
		var index = 1,cnt = 0;
		var noStandartTimeProject = {};
		if(m.project && m.project.length > 0){	
			noStandartTimeProject = {};		
			$(m.project).each(function(i,e){
				if(e["CST_STANDARD_TIME"]) return true;
				noStandartTimeProject["Project_"+e.PROJECT_ID] = e;
			})
			
			var tableList = $("#noConfigStandartTime #noStandartTime #projectTable");
			tableList.children().remove();
			for(prop in noStandartTimeProject){
				if(prop.indexOf("Project_")!=0) continue;
					
				var e = noStandartTimeProject[prop];
				var row = $("<tr class='datagrid-row'></tr>");
				
				if(index % 2 ==0){
					row.css("background-color","#f0f4fd");
				}
	
				row.append($("<td class='datagrid-cell' style='text-align: center;'>"+(index ++ )+"</td>"));
				row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.PROJECT_ID+"</td>"));
				row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.PROECT_STEP_NAME+"</td>"));
				row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.PRODUCT_MATERIAL+"</td>"));
				row.append($("<td class='datagrid-cell' style='text-align: center;'>"+(e.PRODUCT_MATERIAL_NAME ? e.PRODUCT_MATERIAL_NAME :"&nbsp;")+"</td>"));
				tableList.append(row);
				cnt++;
			}
			if(index > 1){
				$("#noConfigStandartTime #noStandartTime").show();
			}else{
				$("#noConfigStandartTime #noStandartTime").hide();
			}
		}
		if(m.areaUnMonth && m.areaUnMonth.length > 0){	
			index = 1 ;
			noStandartTimeProject = {};		
			$(m.areaUnMonth).each(function(i,e){
				noStandartTimeProject["Project_"+e.CA_ID] = e;
			})
			
			var tableList = $("#noConfigStandartTime #noStandartArea #projectTable");
			tableList.children().remove();
			for(prop in noStandartTimeProject){
				if(prop.indexOf("Project_")!=0) continue;
					
				var e = noStandartTimeProject[prop];
				var row = $("<tr class='datagrid-row'></tr>");
				
				if(index % 2 ==0){
					row.css("background-color","#f0f4fd");
				}
	
				row.append($("<td class='datagrid-cell' style='text-align: center;'>"+(index ++ )+"</td>"));
				row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.CA_ID+"</td>"));
				row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.CA_NAME+"</td>"));
				row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.C_MONTH+"</td>"));
				tableList.append(row);
				cnt++;
			}
			if(index > 1){
				$("#noConfigStandartTime #noStandartArea").show();
			}else{
				$("#noConfigStandartTime #noStandartArea").hide();
			}
		}
		if(cnt > 0)
			divShow("noConfigStandartTime","noConfigStandartTimeMask");
	}
	//撤消
	function ganttCancle(){
		$('#workSpace').trigger('undo.gantt');
	}
	//恢复
	function ganttRestore(){
		$('#workSpace').trigger('redo.gantt');
	}	
	//日期放大
	function ganttZoomIn(){
		$('#workSpace').trigger('zoomPlus.gantt');
	}
	//日期缩小
	function ganttZoomOut(){
		$('#workSpace').trigger('zoomMinus.gantt');
	}
	//拆分
	function ganttSplit(){
		//判定是否有选中月排程单
		var splitTask=$(".taskEditRow :checkbox[checked='checked']");
		if(splitTask==null || splitTask.length<=0 || splitTask.length>1){
			showMessage(1,messageLang[3],false);
			return;
		}

		//获取月排程单信息
		vSplitTask=null;
		vSplitStepTask=null;
		var taskId=splitTask[0].getAttribute("taskid");
		for(var i=0,len=ge.tasks.length;i<len;i++){
			if(ge.tasks[i].isStep){
			continue;
			}
			if(ge.tasks[i].id==taskId){
				vSplitTask=ge.tasks[i];
				break;
			}
		}	
		//若工单已下达制令单，则不允许进行拆分
		if(vSplitTask.taskOpt==updateFlag){
			var canSplit=isMoExist([{planDoc:vSplitTask.monthPlanDoc}]);
			if(canSplit==false){
				return;
			}
		}
		//获取对应阶别任务
		for(var i=0,len=ge.tasks.length;i<len;i++){
			if(!ge.tasks[i].isStep){
			continue;
			}
			if(ge.tasks[i].stepSn==vSplitTask.stepSn){
				vSplitStepTask=ge.tasks[i];
				break;
			}
		}
		//拆分前校验
		if(!checkBeforeSplit(vSplitTask,vSplitStepTask)){
		return;
		}
		//获取拆分数据
		setSplitData(vSplitTask,vSplitStepTask);
		// showLoading(true);
		// $.ajax({
		// 	type:"post",
		// 	dataType:"json",
		// 	url:dataUrl,
		// 	async:false,
		// 	data:{
		// 		operator:"getSplitInfo",
		// 		planDoc:vTask.monthPlanDoc
		// 	},
		// 	success:function(data){
		// 		if(data!=null && data.ajaxList!=null && data.ajaxList.length>0){
		// 		  var splitData=data.ajaxList[0];
		// 		  //赋值基本信息
		// 		  $("#colPpwId").val(splitData.PPW_DOC_NO);
		// 		  $("#colProjectId").val(splitData.PPW_PROJECT_ID);
		// 		  $("#colStatus").val(splitData.STATUS_NAME);
		// 		  $("#colStepCode").val(splitData.PROJECT_STEP);
		// 		  $("#colStep").val(splitData.STEP_NAME);
		// 		  $("#colModelCode").val(splitData.CI_ITEM_CODE);
		// 		  $("#colModelName").val(splitData.CI_ITEM_NAME);
		// 		  $("#colPlanNum").val(splitData.PRODUCT_COUNT);
		// 		  $("#colInputNum").val(splitData.FQC_COUNT);
		// 		  $("#colOutputNum").val(splitData.FINISH_COUNT);
		// 		  $("#colCapatcity").val((parseInt(splitData.PRODUCT_COUNT)*parseInt(vStepTask.standarTime)/3600).toFixed(2));
		// 		  $("#colStandard").val(vStepTask.standarTime);
		// 		  $("#colPlanedNum").val(splitData.PPW_NOW_NUM);
		// 		  $("#unUsedCapatcity").val((parseInt(splitData.PPW_NOW_NUM)*parseInt(vStepTask.standarTime)/3600).toFixed(2));
		// 		  $("#stepTotalCapatcity").val((parseInt(vStepTask.availableWorkTime)/60).toFixed(2));
		// 		  $("#stepUnUsedCapatcity").val(((parseInt(vStepTask.availableWorkTime)-parseInt(vStepTask.usedWorkTime))/60).toFixed(2));
		// 		  $("#colExpStart").val(splitData.PPW_START_DATE);
		// 		  $("#colExpEnd").val(splitData.PPW_END_DATE);
		// 		  //赋值拆分信息
		// 		  //自动带出可拆分数量
		//           $("#colPlanCount").val(parseInt(splitData.PPW_NOW_NUM)-1);
		// 		  $("#colPlanCapatcity").val(((parseInt(splitData.PPW_NOW_NUM)-1)*parseInt(vStepTask.standarTime)/3600).toFixed(2));
				
		// 		  showLoading(false);
		// 		}
		// 	},
		// 	error:function(error){
		// 		showMessage(1,error,true);
		// 		showLoading(false);
		// 	}
		//});

		divShow('splitProject', 'splitProjectMask');
	}
	//拆分UI元素赋值
	function setSplitData(task,setpTask){
		try{
			//初始化可以拆分数量
			canSplitNum=0;
			//清空拆分信息
			$("#colPlanCount").val("");
			$("#colPlanCapatcity").val("");
			$("#colPlanStart").val("");
			$("#colPlanEnd").val("");
			//赋值基本信息
			$("#colPpwId").val(task.monthPlanDoc);
			$("#colProjectId").val(task.projectId);
			$("#colStatus").val(task.projectStatusName);
			$("#colStepCode").val(task.stepSn);
			$("#colStep").val(task.stepName);
			$("#colModelCode").val(task.itemCode);
			$("#colModelName").val(task.itemName);
			$("#colPlanNum").val(task.projectPlanNum);
			$("#colInputNum").val(task.projectInputNum);
			$("#colOutputNum").val(task.projectFinishedNum);
			$("#colCapatcity").val((parseInt(task.projectPlanNum)*parseInt(task.standarTime)/3600).toFixed(2));
			$("#colStandard").val(task.standarTime);
			$("#colPlanedNum").val(task.monthNowNum);
			$("#unUsedCapatcity").val((parseInt(task.monthNowNum)*parseInt(task.standarTime)/3600).toFixed(2));
			$("#stepTotalCapatcity").val((parseInt(setpTask.availableWorkTime)/60).toFixed(2));
			$("#stepUnUsedCapatcity").val(((parseInt(setpTask.availableWorkTime)-parseInt(setpTask.usedWorkTime))/60).toFixed(2));
			$("#colExpStart").val(time2DateStr(task.start));
			$("#colExpEnd").val(time2DateStr(task.end));
			//赋值拆分信息
			//自动带出可拆分数量
			canSplitNum=parseInt(task.monthNowNum)-1;
			$("#colPlanCount").val(canSplitNum);
			$("#colPlanCapatcity").val((canSplitNum*parseInt(task.standarTime)/3600).toFixed(2));
		}
		catch(error){
			console.error(error);
		}
	}
	//拆分校验
	function checkBeforeSplit(task,stepTask){
		try{
			//判定阶别是否有维护标准工时
			if(typeof(stepTask.standarTime)=="undefined" || stepTask.standarTime==null || parseInt(stepTask.standarTime)==0){
			showMessage(1,messageLang[2],true);
			return false;
			}
			return true;
		}
		catch(error){
			console.error(error);
			return false;
		}
	}
	//改变拆分数量和拆分计划开始时间时，重新计算拆分工时和计划结束时间
	function splitTimeChange(){
		try{
			//获取界面元素
			var splitNum=$("#colPlanCount").val().trim();//获取界面拆分数量
			var splitStartDate=$("#colPlanStart").val();//获取界面拆分计划开始时间
			//计算拆分工时
			var splitTime=0;
			if(splitNum!=null && splitNum!=""){
				splitTime=parseInt(splitNum)*parseInt(vSplitTask.standarTime)/60;//min
				$("#colPlanCapatcity").val((splitTime/60).toFixed(2));
			}
			else {
				$("#colPlanCapatcity").val(0);
				$("#colPlanEnd").val("");
				return;
			}
			//计算计划结束时间
			if(splitNum!=null && splitNum!="" && splitStartDate!=null && splitStartDate!=""){
				var startplanDate=new Date(splitStartDate);
				startplanDate.setMinutes(startplanDate.getMinutes()+splitTime);
				$("#colPlanEnd").val(time2DateStr(startplanDate.getTime()));
			}
			else {
				$("#colPlanEnd").val("");
				return;
			}
		}
		catch(error){
			console.error(error);
		}
	}
	//拆分保存-校验界面元素
	function splitSaveCheckUI(){
		try{
			var splitNum=$("#colPlanCount").val();
			var splitTime=$("#colPlanCapatcity").val();
			var splitStart=$("#colPlanStart").val();
			var splitEnd=$("#colPlanEnd").val();
			//校验拆分数量
			if(isEmpty(splitNum,true)){
				showMessage(1,messageLang[0],true);
				return false;
			}
			//校验拆分数量是否合法
			if(parseInt(splitNum)>canSplitNum){
				showMessage(1,messageLang[13]+canSplitNum,true);
				return false;
			}
			//校验拆分工时
			if(isEmpty(splitTime,true)){
				showMessage(1,messageLang[1],true);
				return false;
			}
			//校验预计开工时间
			if(isEmpty(splitStart)){
				showMessage(1,messageLang[4],true);
				return false;
			}
			//校验预计结束时间
			if(isEmpty(splitEnd)){
				showMessage(1,messageLang[5],true);
				return false;
			}
			
			return true;
		}
		catch(error){
			console.error(error);
		}
	}
	//拆分保存-校验数据是否合法
	function splitSaveDataLegal(){
		try{
			//时间校验
			var planStartDate=new Date($("#colPlanStart").val());
			var planEndDate=new Date($("#colPlanEnd").val());
			var nowDate=new Date();
			//校验预计开工时间是否满足阶别测算开始时间
			if(planStartDate<calAvaliableStart){
				showMessage(1,messageLang[6],true);
				return false;
			}
			//校验预计完工时间是否满足阶别测算结束时间
			if(planEndDate>calAvaliableEnd){
				showMessage(1,messageLang[7],true);
				return false;
			}
			//校验预计开工时间是否小于当前时间点
			if(planStartDate<nowDate){
				showMessage(1,messageLang[8],true);
				return false;
			}
			return true;
		}
		catch(error){
			console.error(error);
			return false;
		}
	}
	//值是否为空
	function isEmpty(obj,checkZero){
		try{
			if(typeof(obj)=="undefined" || obj==null || obj==""){
				return true;
			}
			if(typeof(checkZero)!="undefined" && checkZero && parseFloat(obj)==0){
				return true;
			}
			return false;
		}
		catch(error){
			console.error(error);
			return true;
		}
	}
	//保存拆分信息
	function splitSave(){
	try{
		//校验界面元素
		if(!splitSaveCheckUI()){
			return false;
		}
		//校验数据是否合法
		if(!splitSaveDataLegal()){
			return false;
		}
		//执行保存(复制被拆分的任务，要修改：月排程单号、已拆分数量、当前排产数量、预计开始时间、预计结束时间)
		vTask=createGanttTask(vSplitTask);
		vTask.taskGuid=Math.uuid();
		//vTask.monthPlanDoc=getMonthPlanDoc();//由于拆分不做保存，则在统一保存的时候获取月排产单号
		vTask.monthPlanDoc="";
		vTask.isChanged=true;
		vTask.taskOpt=insertFlag;//修改标识为插入
		vTask.addType=taskAddType[1],
		vTask.monthPlanNum=0;
		vTask.monthNowNum=parseInt($("#colPlanCount").val());
		vTask.countEditMax=vTask.monthNowNum;
		vTask.countEditMin=0;
		vTask.startDate=$("#colPlanStart").val();
		vTask.endDate=$("#colPlanEnd").val();
		vTask.start=(new Date(vTask.startDate)).getTime();
		vTask.end=(new Date(vTask.endDate)).getTime();
		vTask.duration=(parseInt(vTask.monthNowNum)*parseInt(vSplitTask.standarTime)/60).toFixed(2);
		//修改被拆分任务
		vSplitTask.isChanged=true;
		vSplitTask.monthPlanNum=parseInt(vSplitTask.monthPlanNum)+parseInt(vTask.monthNowNum);//被拆分工单的已拆分数量=原已拆分数量+拆分数量
		vSplitTask.monthNowNum=parseInt(vSplitTask.monthNowNum)-parseInt(vTask.monthNowNum);//被拆分的工单的当前排产数量=原排产数量-拆分数量
		vSplitTask.end=vSplitTask.start+(parseInt(vSplitTask.monthNowNum)*parseInt(vSplitTask.standarTime)*1000);
		vSplitTask.endDate=new Date(vSplitTask.end);
		//保存数据到数据库(拆分暂时不做保存，则注释)
		/*var ganttTasksList=[];
		ganttTasksList.push(createPlanInfo(vTask));
		ganttTasksList.push(createPlanInfo(vSplitTask));
		var isSuc=false;
		showLoading(true);
		$.ajax({
			type:"post",
			dataType:"json",
			url:dataUrl,
			async:false,
			data:{
				operator:"saveSplit",
				tasks:JSON.stringify(ganttTasksList)
			},
			success:function(data){
				if(data){
					isSuc=data;
					showMessage(1,messageLang[15],true);
				}
				else {
					showMessage(1,messageLang[16],true);
				}
				showLoading(false);
			},
			error:function(error){
				showLoading(false);
				showMessage(1,messageLang[16],true);
			}
		});
		if(!isSuc){
			return;
		}*/
		//展示拆分数据到甘特图上
		//甘特图缓存数据中修改被拆分任务
		for(var i=0,len=ganttTasks.tasks.length;i<len;i++){
			if(ganttTasks.tasks[i].id==vSplitTask.id){
				ganttTasks.tasks[i]=vSplitTask;
				break;
			}
		}
		//在甘特图缓存中插入拆分出来的任务
		var maxIndex=vSplitStepTask.stepMaxSeq;
		vTask.id=maxIndex+1;
		ganttTasks.tasks.splice(maxIndex,0,vTask);
		//校准甘特图信息
		updateGantt();
		//重新加载甘特图
		toLoadGanttData(ganttTasks);
		showPopMessage(messageLang[15],false);
		//关闭拆分界面
		divHide('splitProject', 'splitProjectMask');
	}
	catch(error){
		console.error(error);
	}
	}
	//拆分的时候获取新增的月排产单号
	function getMonthPlanDoc(){
		try{
			var doc="";
			$.ajax({
				type:"post",
				dataType:"json",
				url:dataUrl,
				async:false,
				data:{
					operator:"getMonthPlanDoc",
					prefix:"DJ26"
				},
				success:function(data){
					if(data!=null && data.ajaxList!=null && data.ajaxList.length>0){
						doc=data.ajaxList[0];
					}
				},
				error:function(error){
				}
			});
			return doc;
		}
		catch(error){
			console.error(error);
		}
	}
	//保存前校验
	function beforeSave(){
		try{
			//保存前检验insert状态的任务时间是否合法
			if(!validateDateBeforeSave()){
				return false;
			}
			//校验状态为 insert 的任务总产能是否满足阶别可用产能
			if(!validateTaskWorkTimeBeforeSave()){
				return false;
			}
			return true;
		}
		catch(error){
			console.error(error);
		}
	}
	//校验状态为 insert 的任务总产能是否满足阶别可用产能
	function validateTaskWorkTimeBeforeSave(){
		try{
			var taskUseTime=0;
			var stepTimeInfo=[];//存储阶别要新增的总产能
			var stepTask=[];//存储阶别任务
			//1、收集数据
			ge.tasks.forEach(function(task,index,array){
				if(task.isStep){
					stepTask.push(task);
					stepTimeInfo[task.stepSn]=0;
				}
				else {
					if(task.taskOpt==insertFlag){
						if(typeof(stepTimeInfo[task.stepSn])=="undefined"){
							stepTimeInfo[task.stepSn]=0;
						}
						stepTimeInfo[task.stepSn]+=task.duration;
					}
				}
			});
			//2、判定
			var adTask;
			for(var i=0,len=stepTask.length;i<len;i++){
				adTask=stepTask[i];
				if(typeof(stepTimeInfo[adTask.stepSn])!="undefined"){
					if((parseInt(adTask.availableWorkTime)-parseInt(adTask.usedWorkTime))<stepTimeInfo[adTask.stepSn]){
						showMessage(1,"<dict:lang value='阶别'/>("+adTask.name+")<dict:lang value='可用产能不满足！'/>",true);
						return false;
					}
				}
			}
			return true;
		}
		catch(errror){
			console.error(error);
		}
	}
	//保存前检验insert状态的任务时间是否合法
	function validateDateBeforeSave(){
		try{
			var taskUseTime=0;
			var tasks=[];//存储阶别下的任务
			var stepTask=[];//存储阶别任务
			//1、收集数据
			ge.tasks.forEach(function(task,index,array){
				if(task.isStep){
					stepTask.push(task);
					tasks[task.stepSn]=[];
				}
				else {
					if(task.taskOpt==insertFlag){
						if(typeof(tasks[task.stepSn])=="undefined"){
							tasks[task.stepSn]=[];
						}
						tasks[task.stepSn].push(task);
					}
				}
			});
			//2、判定
			var adTask;
			var adCtask;
			for(var i=0,len=stepTask.length;i<len;i++){
				adTask=stepTask[i];
				if(typeof(tasks[adTask.stepSn])!="undefined"){
					for(var j=0,jlen=tasks[adTask.stepSn].length;j<jlen;j++){
						adCtask=tasks[adTask.stepSn][j];
						if(adCtask.start<adTask.start || adCtask.end>adTask.end){
							showMessage(1,"<dict:lang value='阶别'/>("+adTask.name+")<dict:lang value='任务编号'/>("+adCtask.id+")<dict:lang value='开始时间或结束时间不满足条件！'/>",true);
							return false;
						}
						//校验是否存在标准工时
						if(adCtask.monthNowNum=="" || parseInt(adCtask.monthNowNum)==0 || adCtask.standarTime=="" || parseInt(adCtask.standarTime)==0){
							showMessage(1,"<dict:lang value='阶别'/>("+adTask.name+")<dict:lang value='任务编号'/>("+adCtask.id+")<dict:lang value='产能异常！'/>",true);
							return false;
						}
					}
				}
			}
			return true;
		}
		catch(errror){
			console.error(error);
		}
	}
	//保存月排程改变的数据
	function ganttSave(){
		try{
			if(ge!=null && typeof(ge)!="undefined" && ge.tasks.length>0){
				//保存前校验产能是否满足
				if(!beforeSave()){
					return;
				}
				showLoading(true);
				//收集参数数据
				var saveGanttTasks=[];
				var pStart=0;
				var pEnd=0;
				//保存前为状态为insert的任务的月排产单号赋值/并同时填入ID和单号的关联关系
				ge.tasks.forEach(function(task,index,array){
					if(task.monthPlanDoc==""){
						task.monthPlanDoc=getMonthPlanDoc();
						referenceId2Name(task.id,task.monthPlanDoc);
					}
				});
			    //添加需要新增/更新的任务
				ge.tasks.forEach(function(task,index,array){
					if(!task.isStep && task.isChanged){
						pStart=task.start;
						pEnd=task.end;
						//收集相同工单的起始时间和结束时间（最早的起始时间、最晚的结束时间）
						ge.tasks.forEach(function(jdTask,jdIndex,jdArrary){
							if(jdTask.projectId!=task.projectId){
								return;
							}
							if(jdTask.start<pStart){
								pStart=jdTask.start;
							}
							if(jdTask.end>pEnd){
								pEnd=jdTask.end;
							}
						});
						task.pStart=time2DateStr(pStart);
						task.pEnd=time2DateStr(pEnd);
						saveGanttTasks.push(createPlanInfo(task));
					}
				});
				$.ajax({
					type:"post",
					dataType:"json",
					url:dataUrl,
					data:{
						operator:"saveMonthGantt",
						tasks:JSON.stringify(saveGanttTasks),
					},
					success:function(data){
						if(data){
							//保存完成后恢复任务的状态为未修改(暂时不启用 isChanged)
							// ge.tasks.forEach(function(task,index,array){
							//     task.isChenaged=false;
							// });
							
							showLoading(false);
							/*
							//修改任务标识为更新
							ge.tasks.forEach(function(task,index,array){
								task.taskOpt=updateFlag;
							});*/
							//重新加载ge中的任务到ganttTasks中
                            getLastGanttTaskStaus();
							toLoadGanttData(ganttTasks);
							showPopMessage(messageLang[17],false);
						}
						else {
							showLoading(false);
							showMessage(3,messageLang[18],false);
						}
					},
					error:function(error){
						showLoading(false);
						showMessage(3,messageLang[18],false);
					}
				});
			}
		}
		catch(error){
			console.error(error);
		}
	}
	//同步甘特图中任务的最新状态到ganttTasks中
    function getLastGanttTaskStaus(){
        try{
            ganttTasks.tasks=[];
            ge.tasks.forEach(function(task,index,array){
                task.taskOpt=updateFlag;
                task.moInserting=false;
                ganttTasks.tasks.push(createGanttTask(task));
            });
        }
        catch(error){
            console.error(error);
        }
    }
	//添加工单前收集不可选择的工单
	function beforeAddProject(){
		try{
			/*var expProject=[];
				ganttTasks.tasks.forEach(function(task,index,array){
					if(!task.isStep && task.taskOpt==insertFlag){
						expProject.push({
							projectid:task.projectId
						});
					}
				});
				return JSON.stringify(expProject);*/
				var expProject='';
				ganttTasks.tasks.forEach(function(task,index,array){
					if(!task.isStep && task.taskOpt==insertFlag){
						if(expProject==null || expProject==''){
							expProject=task.projectId;
						}
						else {
							expProject+=","+task.projectId;
						}
					}
				});
				return expProject;
		}
		catch(error){
			console.error(error);
		}
	}
	//添加工单
	function addProject(){
		try{
			var expProjects=beforeAddProject();
			var urlDetail = "${path}buss/bussModel.ms?exeid=e6834f0d4331476ea8faa3883f906d4d&formId=454cc1d04a9240f4868ccffb52793896&dataAuth="+$("#DATA_AUTH").val()+"&planStartDate="+$("#PPW_START_DATE_BEGIN").val()+"&planEndDate="+$("#PPW_START_DATE_END").val()+"&exsitPorjectIds="+expProjects;
			showPopWinFp(urlDetail , 880, 400,null,"<dict:lang value='添加工单'/>","");
		}
		catch(error){
			console.error(error);
		}
	}
	//回填工单后执行的方法
	function addProjectCallBack(){
		showLoading(true);
		setTimeout(() => {
			try{
				var projectList=jQuery.parseJSON($("#projectList").val());
				if(typeof(projectList)!="undefined" && projectList.length>0){
				    
					//执行添加操作
					//1、根据阶别收集工单信息
					var stepProjectList=[];//工单信息
					var stepTaskInfo={};//阶别信息
					//1.1、获取工单信息
					$.ajax({
						type:"post",
						dataType:"json",
						url:dataUrl,
						async:false,
						data:{
							operator:"getProjectByContian",
							projects:function(){
								var projects="";
								projectList.forEach(function(item,index,array){
									if(projects==""){
										projects+="'"+item.PROJECT_ID+"'";
									}
									else {
										projects+=",'"+item.PROJECT_ID+"'";
									}
								});
								return projects;
							}
						},
						success:function(data){
						                			
							if(data!=null && data.ajaxList!=null && data.ajaxList.length>0){
								var projectDuration=0;
								var taskException=false;
								data.ajaxList.forEach(function(project,index,array){
									//收集阶别信息
									if(typeof(stepProjectList[project.PROJECT_STEP])=="undefined"){
										stepProjectList[project.PROJECT_STEP]=[];
										stepTaskInfo[project.PROJECT_STEP]={step:null,isExist:false};
									}
									taskException=false;
									//放入工单
									projectDuration=calDurationByNum(project.CST_STANDARD_TIME,project.CANPLAN);
									//判定任务是否存在异常
									if(null==project.CST_STANDARD_TIME || ""==project.CST_STANDARD_TIME || parseInt(project.CST_STANDARD_TIME)==0){
										taskException=true;
									}
									stepProjectList[project.PROJECT_STEP].push({
										//插件必要属性
										id:-1,
										name:project.PROJECT_ID,
										level:childLevel,
										status:ganttStatus[0],
										start:(new Date(project.PROLEPSIS_START_DATE)).getTime(),
										duration:projectDuration,
										end:(new Date(project.PROLEPSIS_END_DATE)).getTime(),
										startIsMilestone:false,
										endIsMilestone:false,
										hasChild:false,
										collapsed:false,
										//月排程必须属性
										//月排程表必要属性
										taskGuid:Math.uuid(),
										dataAuth:project.DATA_AUTH,
										deptId:project.DEPT_ID,
										createUser:project.CREATE_USER,
										createTime:project.CREATE_TIME,
										editUser:project.EDIT_USER,
										eidtTime:project.EDIT_TIME,
										projectId:project.PROJECT_ID,
										projectPlanNum:project.PRODUCT_COUNT,
										monthPlanNum:0,
										monthNowNum:project.CANPLAN,
										countEditMax:project.CANPLAN,
										countEditMin:0,
										startDate:project.PROLEPSIS_START_DATE,
										endDate:project.PROLEPSIS_END_DATE,
										deliveryDate:project.TPPB_PLAN_DELIVERY_DATE,
										projectInputNum:project.FQC_COUNT,
										projectFinishedNum:project.FINISH_COUNT,
										taskException:taskException,
										//非月排程表必要属性
										isStep:false,
										taskOpt:insertFlag,
										isChanged:true,
										stepSn:project.PROJECT_STEP,
										stepName:project.STEP_NAME,
										projectStatus:project.PROJECT_STATUS,
										projectStatusName:project.STATUS_VALUE,
										itemCode:project.CI_ITEM_CODE,
										itemName:project.CI_ITEM_NAME,
										standarTime:project.CST_STANDARD_TIME,
										projectPlanTime:project.TOTAL_NEED_TIME,
										monthPlanTime:0
									});
								});
							}
						},
						error:function(error){}
					});
					//2、匹配现有阶别，若不存在现有阶别，则重新获取阶别信息
					ge.tasks.forEach(function(task,index,array){
						if(task.isStep && typeof(stepProjectList[task.stepSn])!="undefined"){
							stepTaskInfo[task.stepSn]={step:task,isExist:true};
						}
					});
					$.each(stepTaskInfo,function(key,value){
						if(typeof(value)!="undefined" && value.step==null){
							$.ajax({
								type:"post",
								dataType:"json",
								async:false,
								url:dataUrl,
								data:{
									operator:"getSingleStepWorkTime",
									stepSn:key,
									startTime:time2DateStr(calAvaliableStart.getTime()),
									endTime:time2DateStr(calAvaliableEnd.getTime())
								},
								success:function(data){
										//收集阶别信息
										var step=[];
										$.each(data.stepSn,function(key,value){
											step.push({
													stepSn:key,
													stepParams:value
												});
											});
										//阶别所有线体信息
										var areaInfo=data.areaSn;
										//放入阶别任务
										stepTaskInfo[key]={step:createGanttTask({
											//插件必要属性
											id:-1,
											name:step[0].stepParams.STEP_NAME,
											level:parentLevel,
											status:"",//ganttStatus[2],
											start:step[0].stepParams.STEP_START_TIME.time,
											duration:step[0].stepParams.STEP_AVA_WORK_TIME,
											end:step[0].stepParams.STEP_END_TIME.time,
											hasChild:false,
											collapsed:false,
											progress:0,
											stepMaxSeq:0,//当前线别，子任务最大索引
											//月排程单必要属性
											stepSn:step[0].stepSn,
											//非月排程单必要属性
											isStep:true,
											isChanged:false,//任务是否发生改变
											addType:taskAddType[0],
											//阶别必要属性
											availableWorkTime:step[0].stepParams.STEP_AVA_WORK_TIME,
											usedWorkTime:0,
											lostTimebyCoe:step[0].stepParams.STEP_TIME_LOST_BY_COE,
											dayWorkTimeInfo:data.dayWorkTimeInfo,
											dayRestTimeInfo:data.dayRestTimeInfo,
											exceptionTimeInfo:data.exceptionInfo,
											stepLineInfo:getStepLineInfo(step[0].stepSn,areaInfo),
											lineCount:data.stepLineInfo[step[0].stepSn].length
										}),isExist:false};
										//放入特殊时间点
										stepTaskInfo[key].step.stepLineInfo.forEach(function(item,index,array){
											setLineSpecialTime({
												areaSn:item.line,
												workTime:stepTaskInfo[key].step.dayWorkTimeInfo[item.line],
												restTime:stepTaskInfo[key].step.dayRestTimeInfo[item.line],
												exceptionTime:stepTaskInfo[key].step.exceptionTimeInfo[item.line],
												isSat:item.isSat,
												isSun:item.isSun
											});
										});
								},
								error:function(error){
								}
							});
						}
					});
					//添加工单到阶别
					var projects=[];
					var vTask=null;
					var maxIndex=-1;
					var stepSeq=-1;
					var useTime=0;
					var varTask;
					$.each(stepTaskInfo,function(key,value){
						if(typeof(value)=="undefined"){
							return;
						}
						//获取阶别下的工单
						projects=stepProjectList[key];
						//判定阶别是否存在与缓存
						if(value.isExist){
							stepSeq=value.step.id;
							maxIndex=value.step.stepMaxSeq;
						}
						else {
							stepSeq=ganttTasks.tasks.length+1;
							maxIndex=stepSeq;
							//插入阶别
							ganttTasks.tasks.push(value.step);
						}
						//循环添加工单任务
						projects.forEach(function(item,index,array){
							maxIndex++;
							//创建工单任务
							item.id=maxIndex;
							item.addType=taskAddType[2],
							vTask=createGanttTask(item);
							//插入
							if(value.isExist){
								ganttTasks.tasks.splice(maxIndex-1,0,vTask);
								//处理最大索引之后的所有任务的ID
								var varId=[]; // key-old id ; value-new id
								for(var i=maxIndex,iLen=ganttTasks.tasks.length;i<iLen;i++){
									varTask=ganttTasks.tasks[i];
									varTask.id++;
									varId[varTask.id-1]=varTask.id;
									//更新ID和Name关系
									if(varTask.monthPlanDoc!=""){
										referenceId2Name(varTask.id,varTask.monthPlanDoc);
									}
								}
								//处理所有前置任务
								var ganttDepands;
								var varTaskDepends;
								for(var j=maxIndex,jLen=ganttTasks.tasks.length;j<jLen;j++){
									varTaskDepends=ganttTasks.tasks[j];
									if(varTaskDepends.depends!=null && varTaskDepends.depends!=""){
										ganttDepands="";
										varTaskDepends.depends.split(",").forEach(function(dep,index,array){
											if(dep==null || dep==""){
												return;
											}
											ganttDepands+=ganttDepands==""?varId[dep]:","+varId[dep];
										});
										ganttTasks.tasks[j].depends=ganttDepands;
									}
								}
							}
							else {
								ganttTasks.tasks.push(vTask);
							}
							//校准阶别任务
							for(var i=0,iLen=ganttTasks.tasks.length;i<iLen;i++){
								varTask=ganttTasks.tasks[i];
								if(varTask.isStep){
								    if(varTask.stepSn==key) {//校准当前阶别信息
										varTask.id=stepSeq;//校准ID
										varTask.stepMaxSeq=maxIndex;//校准最大子任务ID
										//添加使用产能
										varTask.usedWorkTime+=vTask.duration;
										varTask.progress=calProgress(varTask.usedWorkTime,varTask.availableWorkTime);
									}
									else {//校准其他阶别信息
                                        if(varTask.id>stepSeq){
											varTask.stepMaxSeq=varTask.stepMaxSeq+1;//其他阶别最大子任务ID+1
										}
									}
								}
							}
							//修改缓存stepTaskInfo中的阶别最大子任务ID信息
							$.each(stepTaskInfo,(key,value)=>{
								if(value.step.id>stepSeq){
									value.step.id=value.step.id+1;
									value.step.stepMaxSeq=value.step.stepMaxSeq+1;
								}
							});
							/*stepTaskInfo.forEach((item,index,array)=>{
								if(item.step.id>stepSeq){
									item.step.id=item.step.id+1;
									item.step.stepMaxSeq=item.step.stepMaxSeq+1;
								}
							});*/
						});
					});
					//加载甘特图信息
					toLoadGanttData(ganttTasks);
					showLoading(false);
				}
			}
			catch(error){
				console.error(error);
				showLoading(false);
			}
		}, 0);
	}
	//查询前校验
	function beforeQuery(){
		try{
			for(var i=0,len=ganttTasks.tasks.length;i<len;i++){
				if(ganttTasks.tasks[i].isChanged){
					utilsFp.confirmIcon(1,"","query","", "<dict:lang value='有未保存的任务，是否执行查询？' />",1,"260","");
				}
			}
		}
		catch(error){
			console.error(error);
		}
	}
	//查询月排程信息
	function query(async){
		//初始化data变量
		var param={};
		param.operator="getMonthGantt";
		param.startTime = $.trim($("#PPW_START_DATE_BEGIN").val());
		param.endTime =  $.trim($("#PPW_START_DATE_END").val());
		param.dataAuth = $.trim($("#DATA_AUTH").val());
		param.step = $.trim($("#PPW_STEP").val());
		

		//获取月排程信息
		showLoading(true);
		$.ajax({
			type:"POST",
			dataType:"json",
			url:dataUrl,
			async:typeof(async)=="undefined"?true:async,
			data:param,
			success:function(data){
			console.log(data.ajaxList);
			//收集阶别信息
			var step=[];
			$.each(data.stepSn,function(key,value){
				step.push({
						stepSn:key,
						stepParams:value
					});
				});
			//阶别所有线体信息
			var areaInfo=data.areaSn;
			taskId2NameInfo=[];//清除关联关系
            taskName2IdInfo=[];//清除关联关系
			//添加甘特图task对象
			var taskSeq=0;//task Seq索引
			var stepSeq=-1;
			var usedWorkTime=0;//阶别总已用产能
			var projectDuration=0;//每个任务使用的产能（非阶别类型任务）
			var taskArray=[];//task对象集合
			var projectStandarTime=0;//工单标准工时
			var taskException=false;
			
			step.forEach(function(stepInfo,index,array){
				//若阶别有效跨度时间无效,则不进行记录
				if(stepInfo.stepParams.STEP_START_TIME==null || stepInfo.stepParams.STEP_END_TIME==null ){
				   return;
				}
				taskSeq++;
				//获取阶别ID
				stepSeq=taskSeq;
				usedWorkTime=0;
				//添加阶别下的工单
				projectDuration=0;
				data.project[stepInfo.stepSn].forEach(function(project,index,array){
					taskSeq++;
					taskException=false;
					projectStandarTime=project.CST_STANDARD_TIME;//记录工单标准工时给阶别用，阶别的标准工时=工单的标准工时
					projectDuration=calDurationByNum(project.CST_STANDARD_TIME,project.PPW_NOW_NUM);
					usedWorkTime+=projectDuration;
					//判定任务是否存在异常
					if(null==project.CST_STANDARD_TIME || ""==project.CST_STANDARD_TIME || parseInt(project.CST_STANDARD_TIME)==0){
						taskException=true;
					}
					taskArray.push(createGanttTask({
						//插件必要属性
						id:taskSeq,
						name:project.PPW_PROJECT_ID,
						level:childLevel,
						status:ganttStatus[0],
						start:project.PPW_START_DATE.time,
						duration:projectDuration,
						end:project.PPW_END_DATE.time,
						depends:project.PPW_PRE_TASK,
						startIsMilestone:false,
						endIsMilestone:false,
						hasChild:false,
						collapsed:false,
						lineMaxSeq:-1,
						//月排程必须属性
						//月排程表必要属性
						taskGuid:project.ID,
						monthPlanDoc:project.PPW_DOC_NO,
						dataAuth:project.DATA_AUTH,
						dataAuthName:project.DATA_AUTH_NAME,
						deptId:project.DEPT_ID,
						createUser:project.CREATE_USER,
						createTime:change2Date(project.CREATE_TIME),
						editUser:project.EDIT_USER,
						eidtTime:change2Date(project.EDIT_TIME),
						projectId:project.PPW_PROJECT_ID,
						projectPlanNum:project.PRODUCT_COUNT,
						monthPlanNum:project.PPW_PLAN_NUM,
						monthNowNum:project.PPW_NOW_NUM,
						startDate:change2Date(project.PPW_START_DATE),
						endDate:change2Date(project.PPW_END_DATE),
						deliveryDate:change2Date(project.PPW_DELIVERY_DATE),
						perTask:project.PPW_PRE_TASK,
						planGroup:project.PPW_GROUP,
						projectInputNum:project.FQC_COUNT,
						projectFinishedNum:project.FINISH_COUNT,
						//非月排程表必要属性
						isStep:false,
						taskOpt:updateFlag,
						isChanged:false,
						addType:taskAddType[0],
						stepSn:stepInfo.stepSn,
						stepName:stepInfo.stepParams.STEP_NAME,
						projectStatus:project.PROJECT_STATUS,
						projectStatusName:project.STATUS_VALUE,
						itemCode:project.CI_ITEM_CODE,
						itemName:project.CI_ITEM_NAME,
						standarTime:project.CST_STANDARD_TIME,
						projectPlanTime:project.TOTAL_NEED_TIME,
						monthPlanTime:project.NEED_TIME,
						taskException:taskException
					}));
					referenceId2Name(taskSeq,project.PPW_DOC_NO);//记录name和id的关联关系
				});
				//添加阶别类型任务
				taskArray.splice(stepSeq-1,0,createGanttTask({
					//插件必要属性
					id:stepSeq,
					name:stepInfo.stepParams.STEP_NAME,
					level:parentLevel,
					status:"",//ganttStatus[2],
					start:stepInfo.stepParams.STEP_START_TIME.time,
					duration:stepInfo.stepParams.STEP_AVA_WORK_TIME,
					end:stepInfo.stepParams.STEP_END_TIME.time,
					hasChild:false,
					collapsed:false,
					progress:calProgress(usedWorkTime,stepInfo.stepParams.STEP_AVA_WORK_TIME),
					stepMaxSeq:stepSeq+data.project[stepInfo.stepSn].length,//当前线别，子任务最大索引
					//月排程单必要属性
					stepSn:stepInfo.stepSn,
					//非月排程单必要属性
					isStep:true,
					isChanged:false,//任务是否发生改变
					addType:taskAddType[0],
					//阶别必要属性
					availableWorkTime:stepInfo.stepParams.STEP_AVA_WORK_TIME,
					usedWorkTime:usedWorkTime,
					lostTimebyCoe:stepInfo.stepParams.STEP_TIME_LOST_BY_COE,
					dayWorkTimeInfo:data.dayWorkTimeInfo,
					dayRestTimeInfo:data.dayRestTimeInfo,
					exceptionTimeInfo:data.exceptionInfo,
					stepLineInfo:getStepLineInfo(stepInfo.stepSn,areaInfo),
					lineCount:data.stepLineInfo[stepInfo.stepSn].length
				}));
				referenceId2Name(stepSeq,stepInfo.stepParams.STEP_NAME);//记录name和id的关联关系
			});
			//循环记录阶别特殊时间点
			setEachLineSpecialTime(taskArray);
			//校准前置任务
			taskArray=ajdustDepends(taskArray);
			//甘特图数据
			ganttTasks.tasks=taskArray;
			toLoadGanttData(ganttTasks);
			showLoading(false);
			},
			error:function(msg){
				showLoading(false);
			}
		});
	}
	//校准depends
    function ajdustDepends(taskList){
        //校准前置任务
        taskList.forEach(function(task,index,array){
            if(task.isStep || task.depends==null || task.depends==""){
                return;
            }
            task.depends=changeDepends(task.depends,dependsType[1]);
            task.status=ganttStatus[3];
        });
        return taskList;
    }
	//记录id和Name关联关系
    function referenceId2Name(id,name){
        taskId2NameInfo[id]=name;
        taskName2IdInfo[name]=id;
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
	//循环记录线体特殊时间点
	function setEachLineSpecialTime(taskList){
		try{
			taskList.forEach(function(task,index,array){
				if(task.isStep){
					task.stepLineInfo.forEach(function(item,index,array){
						setLineSpecialTime({
							areaSn:item.line,
							workTime:task.dayWorkTimeInfo[item.line],
							restTime:task.dayRestTimeInfo[item.line],
							exceptionTime:task.exceptionTimeInfo[item.line],
							isSat:item.isSat,
							isSun:item.isSun
						});
					});
				}
			});
		}
		catch(error){
			console.error(error);
		}
	}
	//记录线体特殊时间点
	function setLineSpecialTime(special){
		setInnerSpecial(special);
	}
	//获取阶别线体信息
	function getStepLineInfo(stepSn,areaInfo){
		try{
		var stepLineInfo=[];
		$.each(areaInfo,function(key,value){
			if(value.LINE_STEP==stepSn){
				stepLineInfo.push({
				line:key,
				isSat:value.PPC_SAT_FLAG,
				isSun:value.PPC_SUN_FLAG
				});
			}
		});
		return stepLineInfo;
		}
		catch(error){
		console.error(error);
		}
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
        var workTime=(standarTime*num/60).toFixed(2);
        //return parseFloat(workTime);
		return parseInt(workTime);
    }
	//右侧底角弹出消息
	function showPopMessage(msg,isLan){
		try{
			if(isLan){
				msgPop("<dict:lang value='"+msg+"' />","","<dict:lang value='摩尔提示' />",200,150,3000);
			}
			else {
				msgPop(msg,"","<dict:lang value='摩尔提示' />",200,150,3000);
			}
		}
		catch(error){
			console.error(error);
		}
	}
	//生成task
	function createGanttTask(param){
		try{
			return createMonthGanttTask(param);
		}
		catch(error){
			console.error(error);
		}
	}
	//生成月排程单对象
	function createPlanInfo(task){
		try{
			return {
				taskOpt:task.taskOpt,
				pStart:task.pStart,
				pEnd:task.pEnd,
				ID:task.taskGuid,
				DEPT_ID:task.depId,
				CREATE_USER:task.createUser,
				CREATE_TIME:task.createTime,
				EDIT_USER:task.editUser,
				EDIT_TIME:task.eidtTime,
				DATA_AUTH:task.dataAuth,
				PPW_DOC_NO:task.monthPlanDoc,
				PPW_PROJECT_ID:task.projectId,
				PPW_TARGET_NUM:task.projectPlanNum,
				PPW_PLAN_NUM:task.monthPlanNum,
				PPW_NOW_NUM:task.monthNowNum,
				PPW_START_DATE:time2DateStr(task.start),//取任务的开始时间
				PPW_END_DATE:time2DateStr(task.end),//取任务的结束时间
				PPW_DELIVERY_DATE:task.deliveryDate,
				PPW_PRE_TASK:changeDepends(task.depends,dependsType[0]),
				PPW_GROUP:task.planGroup
			};
		}
		catch(error){
			console.error(error);
		}
	}
	//设置弹出框多语言
	function setPopLang(){
		//弹出框多语言
		messageLang[0]="<dict:lang value='拆分数量必须大于0！'/>";
		messageLang[1]="<dict:lang value='拆分工时必须大于0！'/>";
		messageLang[2]="<dict:lang value='未维护标准工时！'/>";
		messageLang[3]="<dict:lang value='请选择一条记录！'/>";
		messageLang[4]="<dict:lang value='预计开工时间为空！'/>";
		messageLang[5]="<dict:lang value='预计完工时间为空！'/>";
		messageLang[6]="<dict:lang value='预计开工时间不能超出阶别测算时间范围！'/>";
		messageLang[7]="<dict:lang value='预计完工时间不能超出阶别测算时间范围！'/>";
		messageLang[8]="<dict:lang value='预计开工时间小于当前时间！'/>";
		messageLang[9]="<dict:lang value='校验数据失败！'/>";
		messageLang[10]="<dict:lang value='执行失败！'/>";
		messageLang[11]="<dict:lang value='存在已下达的制令单！'/>";
		messageLang[12]="<dict:lang value='排产数量不能大于可排产数量！'/>";
		messageLang[13]="<dict:lang value='拆分数量不能大于'/>";
		messageLang[14]="<dict:lang value=''/>";
		messageLang[15]="<dict:lang value='拆分成功！'/>";
		messageLang[16]="<dict:lang value='拆分失败！'/>";
		messageLang[17]="<dict:lang value='保存排程信息成功！'/>";
		messageLang[18]="<dict:lang value='保存甘特图信息失败！'/>";
		messageLang[19]="<dict:lang value='工单不为开立状态，无法删除！'/>";
		messageLang[20]="<dict:lang value='删除成功！'/>";
		messageLang[21]="<dict:lang value='删除失败！'/>";
		messageLang[22]="<dict:lang value='工单产能计算失败！'/>";
		messageLang[23]="<dict:lang value='工单预计完工时间小于当前时间，无法排产！'/>";
		messageLang[24]="<dict:lang value='存在后置任务，无法删除！'/>";
	}
	//删除制令单信息
	function deleteTask(){
		var delTask=$(".taskEditRow :checkbox[checked='checked']");
		if(delTask==null || delTask.length<=0){
			showMessage(1,messageLang[3],false);
			return;
		}
		var delTask=$(".taskEditRow :checkbox[checked='checked']");
		var delTaskPlan=[];//要删除的月排程单(数据库中的工单)
		var delTaskBuffer=[];//要删除的月排程单(未保存到数据库中，通过添加和拆分出来的工单)
		var taskId;//任务在甘特图上的ID
		var vTask;
		var vGeTask;
		var isSuc=false;
		for(var i=0,len=delTask.length;i<len;i++){
			taskId=delTask[i].getAttribute("taskid");
			vTask=findListTask(taskId);
			vGeTask=findTask(taskId);
			//非开立状态的工单无法删除
			if(vTask.projectStatus!="0" && vTask.monthPlanDoc!=""){
				showMessage(1,"<dict:lang value='任务编号'/>("+vTask.id+")"+messageLang[19],false);
				return;
			}
			//若存在后置任务，无法删除
			var taskLinks=vGeTask.getInferiors();
			for(var j=0,jlen=taskLinks.length;j<jlen;j++){
				if(typeof(taskLinks[j].to)!="undefined" && null!=taskLinks[j].to){
					showMessage(1,"<dict:lang value='任务编号'/>("+vGeTask.id+")"+messageLang[24],false);
					return;
				}
			}
			//识别任务类型，若为数据库中的月排程单，则调用方法删除；若为缓存中的数据，则直接删除缓存
			if(vTask.taskOpt!=insertFlag){
				delTaskPlan.push(vTask);
			}
			else {
				delTaskBuffer.push(vTask);
			}
		}
		utilsFp.confirmIcon(1,"","deleteTaskCallBack",[delTaskPlan,delTaskBuffer], "<dict:lang value='是否确认删除？' />",1,"260","");
	}
	function deleteTaskCallBack(delTask){
		var delTaskPlan=delTask[0];//要删除的月排程单(数据库中的工单)
		var delTaskBuffer=delTask[1];//要删除的月排程单(未保存到数据库中，通过添加和拆分出来的工单)
		var isSuc=false;
		//执行删除(在缓存中删除，不重新查询。重新查询会冲掉缓存中的工单)
		var delTaskList=[];
		var stepDelUseWorkTime=[];//记录阶别要扣减的产能
		showLoading(true);
		//0、校验是否可以删除
		delTaskPlan.forEach(function(task,index,array){
			if(typeof(stepDelUseWorkTime[task.stepSn])=="undefined"){
				stepDelUseWorkTime[task.stepSn]=0;
			}
			//添加扣减产能
			stepDelUseWorkTime[task.stepSn]+=parseInt(task.duration);
			//放入队列
			delTaskList.push({
				planDoc:task.monthPlanDoc
			});
		});
		if(delTaskList.length>0){
			//0.1 判定月排程单下是否存在制令单，若存在，则无法删除
			isSuc=isMoExist(delTaskList);
			if(!isSuc){
				showLoading(false);
				return;
			}
		}
		//1、删除数据库中的
		delTaskPlan.forEach(function(task,index,array){
			//缓存中删除任务
			delBufferTask(task);
		});
		//2、删除缓存中的
		delTaskBuffer.forEach(function(task,index,array){
			if(typeof(stepDelUseWorkTime[task.stepSn])=="undefined"){
				stepDelUseWorkTime[task.stepSn]=0;
			}
			/*//添加扣减产能。若工单通过选择方式添加的，则无需扣减阶别总产能；若工单通过拆分添加的，则删除后阶别需扣减对应产能
			if(task.addType==taskAddType[1]){
				stepDelUseWorkTime[task.stepSn]+=parseInt(task.duration);
			}*/
			//添加扣减产能
			stepDelUseWorkTime[task.stepSn]+=parseInt(task.duration);
			//缓存中删除任务
			delBufferTask(task);
		});
		//3、执行数据库删除
		if(delTaskList.length>0){
			//3.1 执行删除
			$.ajax({
				type:"post",
				dataType:"json",
				url:dataUrl,
				async:false,
				data:{
					operator:"deleteMonthPlanTask",
					planDocList:JSON.stringify(delTaskList)
				},
				success:function(data){
					if(data){
						//showPopMessage(messageLang[20],false);
					}
					else {
						showMessage(3,messageLang[21],false);
					}
					showLoading(false);
				},
				error:function(error){
					showLoading(false);
					showMessage(3,messageLang[21],false);
				}
			});
		}
		showLoading(false);
		//校准甘特图信息
		updateGantt(stepDelUseWorkTime);
		//加载甘特图信息
		toLoadGanttData(ganttTasks);
		showPopMessage(messageLang[20],false);
	}
	//判定月排程单是否存在已下达的制令单
	function isMoExist(delTaskList){
		try{
			var result=false;
			$.ajax({
				type:"post",
				dataType:"json",
				url:dataUrl,
				async:false,
				data:{
					operator:"validateMonthCanToDelete",
					planDocList:JSON.stringify(delTaskList)
				},
				success:function(data){
					if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                        var ajList=data.ajaxList[0];
						if(ajList.msg!=0){
                            result=false;
                            if(ajList.msg==1){
								showMessage(3,messageLang[10],true);
							}
							else if(ajList.msg==2){
								showMessage(1,ajList.docNum+messageLang[11],true);
							}
							else {
								showMessage(3,messageLang[10],true);
							}
						}
						else {
							result=true;
						}
					}
					else {
						showMessage(3,messageLang[9],false);
						result=false;
					}
				},
				error:function(error){
					showMessage(3,messageLang[9],false);
					result=false;
				}
			});
			return result;
		}
		catch(error){
			console.error(error);
		}
	}
	//移动排产单时校验开始时间和结束时间是否满足制令单要求
	function dragCheckMo(task){
        try{
			var isSuc=true;
			//获取月排产单下的所有制令单
			$.ajax({
				type:"post",
				dataType:"json",
				url:dataUrl,
				async:false,
				data:{
					operator:"getPlanMonumberInfo",
					planDoc:task.monthPlanDoc
				},
				success:function(data){
					if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
						var ajData;
						var start;
						var end;
                        for(var i=0,len=data.ajaxList.length;i<len;i++){
							ajData=data.ajaxList[i];
							start=(new Date(ajData.PM_SCHEDULE_DATE)).getTime();
							end=(new Date(ajData.PM_DUE_DATE)).getTime();
							// if(start<task.start || end>task.end){
							// 	isSuc=false;
							// 	return false;
							// }
							//改为允许制令单开始时间小于工单开始时间，但制令单结束时间必须小于工单结束时间 2018-05-28 by cc
							if(end>task.end){ 
								isSuc=false;
								return false;
							}
						}
					}
				},
				error:function(error){
					isSuc=false;
				}
			});
			return isSuc;
		}
		catch(error){
			console.error(error);
		}
	}
	//校准甘特图信息
	function updateGantt(stepDelUseWorkTime){
		try{
			//校准甘特图信息
			var adTask;
			var delTaskBuffer=[];
			//1.1、移除无任务的阶别
			for(var i=0,len=ganttTasks.tasks.length;i<len;i++){
				adTask=ganttTasks.tasks[i];
				if(adTask.isStep && !isExsitTaskInStep(adTask.stepSn)){
					delTaskBuffer.push(adTask);
				}
			}
			delTaskBuffer.forEach(function(task,index,array){
				delBufferTask(task);
			});
			//1.2、校准任务ID
			var varId=[]; // key-old id ; value-new id
			for(var i=0,len=ganttTasks.tasks.length;i<len;i++){
				adTask=ganttTasks.tasks[i];
				if(adTask.id!=i+1){
					varId[adTask.id]=i+1;
				}
				else {
					varId[adTask.id]=adTask.id;
				}
				adTask.id=i+1;
				//扣减阶别产能
				if(typeof(stepDelUseWorkTime)!="undefined" && adTask.isStep && typeof(stepDelUseWorkTime[adTask.stepSn])!="undefined"){
					adTask.usedWorkTime-=stepDelUseWorkTime[adTask.stepSn];
					adTask.progress=calProgress(adTask.usedWorkTime,adTask.availableWorkTime);
				}
				//更新ID和Name的关系
				if(adTask.monthPlanDoc!=""){
					referenceId2Name(adTask.id,adTask.monthPlanDoc);
				}
			}
			//处理所有前置任务
			var ganttDepands;
			var varTaskDepends;
			for(var j=0,jLen=ganttTasks.tasks.length;j<jLen;j++){
				varTaskDepends=ganttTasks.tasks[j];
				if(varTaskDepends.depends!=null && varTaskDepends.depends!=""){
					ganttDepands="";
					varTaskDepends.depends.split(",").forEach(function(dep,index,array){
						if(dep==null || dep==""){
							return;
						}
						ganttDepands+=ganttDepands==""?varId[dep]:","+varId[dep];
					});
					ganttTasks.tasks[j].depends=ganttDepands;
				}
			}
			//1.2、校准阶别最大索引
			for(var i=0,len=ganttTasks.tasks.length;i<len;i++){
				adTask=ganttTasks.tasks[i];
				if(adTask.isStep){
					adTask.stepMaxSeq=stepTaskMaxSeq(adTask.stepSn);
				}
			}
		}
		catch(error){
			console.error(error);
		}
	}
	//缓存中删除任务
	function delBufferTask(task){
		try{
			ganttTasks.tasks.splice($.inArray(task,ganttTasks.tasks),1);
		}
		catch(error){
			console.error(error);
		}
	}
	//判定阶别下是否还有任务
	function isExsitTaskInStep(step){
		try{
			var adTask;
			for(var i=0,len=ganttTasks.tasks.length;i<len;i++){
				adTask=ganttTasks.tasks[i];
				if(!adTask.isStep && adTask.stepSn==step){
					return true;
				}
			}
			return false;
		}
		catch(error){
			console.error(error);
		}
	}
	//获取阶别任务最大索引
	function stepTaskMaxSeq(step){
		try{
			var adTask;
			var seq=-1;
			for(var i=0,len=ganttTasks.tasks.length;i<len;i++){
				adTask=ganttTasks.tasks[i];
				if(!adTask.isStep && adTask.stepSn==step){
					if(seq<adTask.id){
						seq=adTask.id;
					}
				}
			}
			return seq;
		}
		catch(error){
			console.error(error);
		}
	}
	//查找任务
	function findListTask(id){
		try{
			for(var i=0,len=ganttTasks.tasks.length;i<len;i++){
				if(ganttTasks.tasks[i].id==id){
					return ganttTasks.tasks[i];
				}
			}
			return null;
		}
		catch(error){
			console.error(error);
		}
	}
	//查找任务
	function findTask(id){
		try{
			for(var i=0,len=ge.tasks.length;i<len;i++){
				if(ge.tasks[i].id==id){
					return ge.tasks[i];
				}
			}
			return null;
		}
		catch(error){
			console.error(error);
		}
	}
	//初始化函数
	function initial(){
		try{
			//初始化产能作用域
			initCalTime();
			//初始化甘特图多语言
			setGanttLang();
			//初始化通用多语言
			setCommonLang();
			//设置弹出框多语言
			setPopLang();
			//初始化异常信息集合
			initExceptionMsg();
			//校准界面控件属性
		    adjustUI();
			//获取数据访问URL
			dataUrl=getUrl();
		}
		catch(error){
			console.error(error);
		}
	}
	//校准界面控件属性
    function adjustUI(){
        //设置计划开始时间未不可修改
        $("#PPW_START_DATE_BEGIN").attr("disabled","false");
        $("#PPW_START_DATE_END").attr("disabled","false");
    }
	//初始化产能作用域
	function initCalTime(){
		try{
			var d=new Date();
			$("#PPW_START_DATE_BEGIN").val(d.format("yyyy-MM-dd 00:00:00"));
			calAvaliableStart=new Date(d.format("yyyy-MM-dd 00:00:00"));
			d.setMonth(d.getMonth()+1);
			$("#PPW_START_DATE_END").val(d.format("yyyy-MM-dd 23:59:59"));
			calAvaliableEnd=new Date(d.format("yyyy-MM-dd 23:59:59"));
		}
		catch(error){
			console.error(error);
		}
	}
	//初始化异常信息集合
	function initExceptionMsg(){
		try{
			exceptionMsg[0]="<dict:lang value='标准工时未维护'/>";
			exceptionMsg[1]="<dict:lang value='超出原定完工时间'/>";
		}
		catch(error){
			console.error(error);
		}
	}
	//收集当前最新任务集合下的任务时间点
	function collectTimePoint(data){
		try{
			var planGroupStepById=[];//清空所有计划组任务id
			var planGroupInfo=[];//清空计划组信息
			var inPlanPfix=[];//处于计划组内的任务前置
			var getOrderIndex=function(list,task){
                if(list.length>0){
					for(var i=0,len=list.length;i<len;i++){
						if(task.start<list[i].start){
							return i;
						}
					}
					return list.length;
				}
				else {
					return 0;
				}
			};
			
            data.tasks.forEach((item,index,array)=>{
				if(!item.isStep){
					//记录计划组并进行排序：ERP工单的编码规则为 18-0001F-01(年份-四位流水字母代表车间工序代码-两位流水），其中18-0001是计划组（批次）
					var pgroup=item.name.substring(0,7);
					if(typeof(planGroupInfo[pgroup])=="undefined"){
						planGroupInfo[pgroup]=[];
					}
					if(typeof(planGroupStepById[pgroup])=="undefined"){
						planGroupStepById[pgroup]=[];
						if(typeof(planGroupStepById[pgroup][item.stepSn])=="undefined"){
							planGroupStepById[pgroup][item.stepSn]="";
						}
					}
					//对任务进行排序插入
					planGroupInfo[pgroup].splice(getOrderIndex(planGroupInfo[pgroup],item),0,item);
					if(typeof(planGroupStepById[pgroup][item.stepSn])=="undefined" || planGroupStepById[pgroup][item.stepSn]==""){
						planGroupStepById[pgroup][item.stepSn]=item.id.toString();
					}
				    else{
						planGroupStepById[pgroup][item.stepSn]+=","+item.id.toString();
					}
					//获取有效计划组
					if(planGroupInfo[pgroup].length>1){
						if(inPlanPfix.indexOf(pgroup)<0){
							inPlanPfix.push(pgroup);
						}
					}
				}
			});
			//连接计划组任务
            inPlanPfix.forEach((item,index,array)=>{
				//获取计划组任务集合
                var groupTask=planGroupInfo[item];
				//获取下阶别同计划组的任务ID
				groupTask.forEach((task,taskIndex,taskArray)=>{
					var ids=planGroupStepById[item][parseInt(task.stepSn)-1];
					if(typeof(ids)!="undefined" && ids!=null){
						task.depends=ids;
					}
				});
			});
		}
		catch(error){
			console.error(error);
		}
	}
</script>

<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_17" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>
