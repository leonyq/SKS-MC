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
		<dict:lang value="生产排程" />
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
	<link rel="stylesheet" href="${path}buss/aps/month/gantt_css/platform.css" type="text/css">
	<link rel="stylesheet" href="${path}buss/aps/month/gantt_libs/dateField/jquery.dateField.css" type="text/css">
	<link rel="stylesheet" href="${path}buss/aps/month/gantt_css/gantt.css" type="text/css">
    <link rel="stylesheet" href="${path}buss/aps/month/gantt_css/print.css" type="text/css" media="print">
    <link rel="stylesheet" type="text/css" href="${path}buss/aps/month/gantt_libs/jquery.svg.css">

    <!-- script -->
    <script src="http://www.jq22.com/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://libs.baidu.com/jqueryui/1.8.22/jquery-ui.min.js "></script>
    <script src="${path}buss/aps/month/gantt_libs/jquery.livequery.min.js"></script>
    <script src="${path}buss/aps/month/gantt_libs/jquery.timers.js"></script>
    <script src="${path}buss/aps/month/gantt_libs/platform.js"></script>
    <script src="${path}buss/aps/month/gantt_libs/date.js"></script>
    <script src="${path}buss/aps/month/gantt_libs/i18nJs.js"></script>
    <script src="${path}buss/aps/month/gantt_libs/dateField/jquery.dateField.js"></script>
    <script src="${path}buss/aps/month/gantt_libs/JST/jquery.JST.js"></script>
    <script type="text/javascript" src="${path}buss/aps/month/gantt_libs/jquery.svg.min.js"></script>
    <script type="text/javascript" src="${path}buss/aps/month/gantt_libs/jquery.svgdom.1.8.js"></script>
    <script src="${path}buss/aps/month/gantt_js/ganttUtilities.js"></script>
    <script src="${path}buss/aps/month/gantt_js/ganttTask.js"></script>
    <script src="${path}buss/aps/month/gantt_js/ganttDrawerSVG.js"></script>
    <script src="${path}buss/aps/month/gantt_js/ganttGridEditor.js"></script>
    <script src="${path}buss/aps/month/gantt_js/ganttMaster.js"></script>  
    <script src="${path}buss/aps/month/gantt_js/ganttCommon.js"></script>  
</head>

 <body style="background-color: #fff;">
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
	        <div style="background-color: #fff;border: 1px solid #eaeaea;height: calc(100% - 40px - 10px);box-sizing: border-box;">
	                
			    <% /*该 div为甘特图*/ %>
			    <div>
				    <script>
				       $(document).ready(function(){
							ToInitGanttPage();
						}
						);
				    </script>
			    	<div id="workSpace" style="padding:0px; overflow-y:auto; overflow-x:hidden;border:1px solid #e5e5e5;position:relative;margin:0 5px"></div>
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
					</style>
			
					<script type="text/javascript">
					
						var ge;  //this is the hugly but very friendly global var for the gantt editor
						
						$(function() {
						  //load templates
						  $("#ganttemplates").loadTemplates();
						  // here starts gantt initialization
						  ge = new GanttMaster();
						  var workSpace = $("#workSpace");
						  workSpace.css({width:$(window).width() - 20,height:$(window).height() - 100});
						  ge.init(workSpace);
						  //inject some buttons (for this demo only)
						  $(".ganttButtonBar div").addClass('buttons');
						  //overwrite with localized ones
						  loadI18n();
						  //simulate a data load from a server.
						  //loadGanttFromServer();
						  
						  var _vardata={"tasks":[],"selectedRow":0,"canWrite":true,"canWriteOnParent":true} ;
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
			
				<% /*内容展示区域*/ %>
					<div id="gantEditorTemplates" style="display:none;">
				  
				  		<% /*任务栏菜单列*/ %>
				  		<div class="__template__" type="TASKSEDITHEAD">  
				  			<table class="gdfTable" cellspacing="0" cellpadding="0">
				    			<thead>
				    				<tr style="height:40px">
										<th class="gdfColHeader" style="width:35px;"></th>
										<th class="gdfColHeader" style="width:20px;" ></th>
										<th class="gdfColHeader gdfResizable" style="width:180px;" ><dict:lang value="生产阶别"/></th>
										<th class="gdfColHeader gdfResizable" style="width:180px;" ><dict:lang value="排程单号"/></th>
										<th class="gdfColHeader gdfResizable" style="width:180px;"><dict:lang value="工单号"/></th>
										<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="状态"/></th>
										<th class="gdfColHeader gdfResizable" style="width:180px;"><dict:lang value="机种"/></th>
										<th class="gdfColHeader gdfResizable" style="width:180px;"><dict:lang value="机种名称"/></th>
										<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="计划数量"/></th>
										<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="标准工时"/>(S)</th>
										<th class="gdfColHeader gdfResizable" style="width:100px;"><dict:lang value="生产工时"/>(H)</th>
										<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="当前排产数量"/></th>
										<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="当前排产工时"/>(H)</th>
										<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="预计开工时间"/></th>
										<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="预计完工时间"/></th>
										<th class="gdfColHeader gdfResizable" style="width:120px;"><dict:lang value="预计交货时间"/></th>
										<th class="gdfColHeader gdfResizable" style="width:70px;"><dict:lang value="计划组"/></th>
										<th class="gdfColHeader gdfResizable" style="width:70px;"><dict:lang value="前置任务"/></th>
				    				</tr>
				    			</thead>
				  			</table>
				 		</div>
				 
				  		<% /*任务列表*/  /*修改为不可输入 */%>
				  		<div class="__template__" type="TASKROW"><!--
				  			<tr taskId="(#=obj.id#)" class="taskEditRow" level="(#=level#)">
				    			<th class="gdfCell edit" align="center" style="cursor:pointer;">
				      				<span class="taskRowIndex">(#=obj.getRow()+1#)</span> 
				    			</th>
				    			<td class="gdfCell noClip" align="center">
				      				<input type="checkbox" class="delProject" name="delProject" projectId="(#=obj.id#)" isStep="(#=obj.isStep#)" canDelete="(#=(obj.isStep || obj.isAddByHand)#)" canSplit="(#=parseInt(obj.PROJECT_STATUS) == 0#)" style="(#=obj.isStep  ? "display:none" : ""#)"></input>
				    			</td>
				    			<td class="gdfCell indentCell" style="padding-left:(#=obj.level*10#)px;">
				      				<div class="(#=obj.isParent()?'exp-controller expcoll exp':'exp-controller'#)" align="center"></div>
				      				<input type="text" name="name" value="(#=obj.name#)" disabled="false">
				    			</td>
				    			<td class="gdfCell" align="center" style="text-align:center;vertical-align:middle;">
				     				<input type="text" name="PPW_DOC_NO"  value="(#=obj.PPW_DOC_NO#)"  disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="PROJECT_ID"  value="(#=obj.PROJECT_ID#)" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="PROJECT_STATUS_STR"  value="(#=obj.PROJECT_STATUS_STR#)" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="PRODUCT_MATERIAL"  value="(#=obj.PRODUCT_MATERIAL#)" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="PRODUCT_MATERIAL_NAME"  value="(#=obj.PRODUCT_MATERIAL_NAME#)" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="PRODUCT_COUNT"  value="(#=obj.PRODUCT_COUNT#)" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="CST_STANDARD_TIME"  value="(#=obj.CST_STANDARD_TIME ? obj.CST_STANDARD_TIME : "&nbsp;"#)" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="CAPATCITY"  value="(#= (!obj.CAPATCITY || obj.CAPATCITY == Infinity) ? "&nbsp;"  : (obj.CAPATCITY /60).toFixed(2)#)" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="PPW_NOW_NUM"  value="(#=obj.PPW_NOW_NUM#)" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="PPW_NOW_CAPATCITY"  value="(#= (!obj.PPW_NOW_CAPATCITY || obj.PPW_NOW_CAPATCITY == Infinity) ? "&nbsp;"  : (obj.PPW_NOW_CAPATCITY /60).toFixed(2)#)" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="start"  value="" class="date" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="end" value="" class="date" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="TPPB_PLAN_DELIVERY_DATE" value="(#=obj.TPPB_PLAN_DELIVERY_DATE ? dateFormat(new Date(obj.TPPB_PLAN_DELIVERY_DATE),"yyyy-MM-dd hh:mm:ss") : "&nbsp;"#)" class="date" disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="depends" value="(#=obj.depends#)" (#=obj.hasExternalDep?"readonly":""#) disabled="false">
				    			</td>
				    			<td class="gdfCell">
				     				<input type="text" name="PPW_PRE_TASK" value="(#=obj.PPW_PRE_TASK#)"  disabled="false">
				    			</td>
				  			</tr>-->
				 		</div>
				 
				 		<% /*空任务列表
				 
				 		<div class="__template__" type="TASKEMPTYROW">
							<tr class="taskEditRow emptyRow" >
					  			<th class="gdfCell" align="right"></th>
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
				      				<div class="taskProgress" style="width:(#=obj.progress>100?100:obj.progress#)%; background-color:(#=obj.progress>100?'red':'rgb(153,255,51);'#);"></div>
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
				           						</tr>
				          						<tr>
				           							<td colspan="2">
				           								<label for="progress">progress</label><br>
				           								<input type="text" name="progress" id="progress" value="" size="3" class="formElements">
				           							</td>
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
				          						</tr>
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
				 		</div> </div>*/ %>
					 
			
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

<%-- 工单筛选 开始 --%>
<div class="dialog-mask" id="showProjectQueryMask" style="z-index:10000"></div>
<div class="dialog dialog-s1" id="showProjectQuery" style="display:none;z-index:10001;margin-left:0px;left:calc(50% - 400px);top:calc(50% - 280px);width:800px;height:680px;">
	<div class="dialog-hd">
	    <h3 class="tit"><dict:lang value="工单筛选"/></h3>
	</div>
	<a class="dialog-close" href="javascript:void(0);" onclick="divHide('showProjectQuery', 'showProjectQueryMask');"></a>
	<div class="dialog-bd-div" style="width:100%;height:520px;">
		<div class="optn optn_div">
    		<button type="button" value="" sytle="" class="botton_img_add" id="commit" name="commit"><i class="ico ico-save"></i><dict:lang value='提交'/></button>
			<button type="button" value="" sytle="" class="botton_img_add" onclick="divHide('showProjectQuery', 'showProjectQueryMask');"><i class="ico ico-cancel "></i><dict:lang value='关闭'/></button>
			<button type="button" value="" sytle="" class="botton_img_add" id="query"><i class="ico ico-search-new"></i><dict:lang value='查询'/></button>
		</div>
		<div class="edit">
    		<div class="bd">
	    		<div class="search-box">
	            	<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
	     				<table class="search_table">
	     					<tbody>
	     						<tr>
	     							<td>
	     					    		<div class="group">
											<div class="name" title="等于"><dict:lang value="生产阶别"/></div>
											<div class="dec" id="ppwStepContainer" name="ppwStepContainer">				
											</div>			
										</div>
	     							</td>
	     							<td>
	     								<div class="group">
	     									<div class="name" title="等于"><dict:lang value="工单号"/></div>
	     									<div class="dec">	
	      										<input type="text" id="ppwProjectId" name="ppwProjectId" value="" class="input " onkeypress="_checkEnterSeach(event);">
												<img onclick="_showCommonTablePage(this,'0d5f2635c2024a4a8d955686c7d88f61','859f3763234c43daa6c0bd0627d012bb','工单号','','%7B%22WP_WIDTH%22%3A%22%22%2C%22WP_HEIGHT%22%3A%22%22%2C%22WP_FULL_SCREEN%22%3A%22%22%7D','a0496873-6639-4d69-8bdd-89107609e790');" src="${path}plf/page/fp/img/ico-search-h-c.png" style="position:absolute;top: 6px;left: 228px;cursor:pointer;">
												<script type="text/javascript">
												function clearProductVal(thisId){
												
													$("#"+thisId).val("");
													$("#"+thisId+"_SHOW").val("");
												}
												</script>
	
												<script type="text/javascript">
												function backFillProductVal(obj,thisId){
												
													$("#"+thisId).val(obj.KEY);
													$("#"+thisId+"_SHOW").val(obj.KEY);
												
												}
												</script>
											</div>			
										</div>
	      							</td>
	      						</tr>
	      						<tr>
	      							<td>
	      								<div class="group">
	      									<div class="name" title="等于"><dict:lang value="机种"/></div>
	      									<div class="dec">	
	      										<input type="text" id="ppwProductMaterial" name="ppwProductMaterial" value="" class="input " onkeypress="_checkEnterSeach(event);">
												<img onclick="_showCommonTablePage(this,'0085dedfcd0d435eb5f35048fa87ec9c','ba37323a287f439d98639a59ff9a9b8c','机种','','%7B%22WP_WIDTH%22%3A%22%22%2C%22WP_HEIGHT%22%3A%22%22%2C%22WP_FULL_SCREEN%22%3A%22%22%7D','01f2a184-e706-4811-8dad-d1693625a667');" src="${path}plf/page/fp/img/ico-search-h-c.png" style="position:absolute;top: 6px;left: 228px;cursor:pointer;">
												<script type="text/javascript">
												function clearBomVal(thisId){
												$("#"+thisId).val("");
												$("#"+thisId+"_SHOW").val("");
												}
												</script>
												
												<script type="text/javascript">
												function backFillBomVal(obj,thisId){
												$("#"+thisId).val(obj.KEY);
															$("#"+thisId+"_SHOW").val(obj.VAL);
												
												} 
												</script>
											</div>			
										</div>
	      							</td>
	      							<td>
	      								<div class="group">
											<div class="name" title="等于"><dict:lang value="状态"/></div>
											<div class="dec" id="ppwStatusContainer" name="ppwStatusContainer">				
											</div>			
										</div>
	      							</td>
	      						</tr>
	      					</tbody>
	      				</table>
	        		</form>
	        		<a href="javascript:void(0);" class="more"></a>
	    		</div>
				<div class="head1" style="height:350px;overflow:auto;">
		            <table class="dlist-table table-line"  style="width: 100%;table-layout:fixed;">
		                <thead id="exp_table_head">
			                <tr>
			                	<td style='width:30px; text-align:center;' >&nbsp;</td>
	                    		<td style='width:30px; text-align:center;' >&nbsp;</td>
			                    <td style='width:150px; text-align:center;' ><dict:lang value='工单号'/></td>
			                    <td style='width:100px; text-align:center;' ><dict:lang value='生产阶别'/></td>
			                    <td style='width:100px; text-align:center;' ><dict:lang value='标准工时'/></td>
			                    <td style='width:150px; text-align:center;' ><dict:lang value='机种'/></td>
			                    <td style='width:150px; text-align:center;' ><dict:lang value='机种名称'/></td>
			                    <td style='width:150px; text-align:center;' ><dict:lang value='预计开工时间'/></td>
			                    <td style='width:150px; text-align:center;' ><dict:lang value='预计完工时间'/></td>
			                    <td style='width:150px; text-align:center;' ><dict:lang value='计划交货日期'/></td>
			                </tr>
		                </thead>
		                <tbody id="projectTable" name="projectTable">
		                </tbody>
		            </table>

        		</div>
       			<div id="pager">
					<input type="hidden" id="ppwStepHidden" name="ppwStepHidden"></input> 
					<input type="hidden" id="ppwProjectIdHidden" name="ppwProjectIdHidden"></input> 
					<input type="hidden" id="ppwProductMaterialHidden" name="ppwProductMaterialHidden"></input> 
					<input type="hidden" id="ppwStatusHidden" name="ppwStatusHidden"></input> 
	            	<ul class="pagingPop">
	            		<li class="home-page"><a class="it jump home"></a></li>
	            		<li class="pre"><a class="it jump pre"></a></li>
	            		<li class="center">
	            			<input type="text" value="1" id="curPage" name="curPage" class="text" onfocus="this.select()"></input> / <span class="pageCount">12</span> <dict:lang value='页'/>
	            		</li>
	            		<li class="next"><a class="it jump next"></a></li>
	            		<li class="last-page"><a class="it jump last"></a></li>
	            		<li class="select" >
	            			<div id="pagerContainer" name="pagerContainer">
	            			</div>
							<span><dict:lang value='共计'/><span class="count"></span> <dict:lang value='条'/></span>
						</li>
					</ul>
				</div>
            </div>
        </div>
    </div>
</div>
<%-- 工单筛选 结束 --%>


<%--下达编辑弹窗--%>
<div class="dialog-mask" id="splitProjectMask" style="z-index:10000"></div>
<div class="dialog dialog-s1" id="splitProject" style="display:none;z-index:10001;margin-left:0px;left:calc(50% - 400px);top:calc(50% - 280px);width:700px;height:750px;">
    <div class="dialog-hd">
        <h3 class="tit"><dict:lang value="拆分"/></h3>
    </div>
    <a class="dialog-close" href="javascript:void(0);" onclick="divHide('splitProject', 'splitProjectMask');"></a>
    <div class="dialog-bd-div" style="width:100%;height:520px;">
        <div class="optn optn_div">
            <button type="button" id="save" name="save"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
            <button type="button" onclick="divHide('splitProject', 'splitProjectMask');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
        </div>
        <div class="edit">
            <div class="bd">
                <div class="mod">
                    <div class="mod-hd">
                        <h3 class="tit"><dict:lang value="基本信息" /></h3>
                    </div>
                    <div class="mod-hd" style="height:330px;border-bottom:0;">
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
                            </tr>
                            <tr>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="状态"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input type="text" id="colStatus" class="input" readonly="readonly">
                                </td>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="生产阶别"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input type="text" id="colStepCode" class="input" readonly="readonly" hidden="hidden">
                                    <input type="text" id="colStep" class="input" readonly="readonly">
                                </td>
                            </tr>
                            <tr>
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
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="待排产数量"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input type="text" id="colPlanedNum" class="input" readonly="readonly">
                                </td>
                            </tr>
                            <tr> 
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
                            </tr>
                            <tr>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="排产工时"/>(H)</td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input type="text" id="usedCapatcity" class="input" readonly="readonly">
                                </td>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="待排产工时"/>(H)</td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input type="text" id="unUsedCapatcity" class="input" readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="预计开工时间"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input id="colExpStart" name="colExpStart" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'2018-04-06 23:59:59'})" readonly="readonly" disabled="false">
                                </td>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="预计完工时间"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input id="colExpEnd" name="colExpEnd" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'2018-04-06 23:59:59'})" readonly="readonly" disabled="false">
                                </td>
                            </tr>
                            <tr>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="实际开工时间"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input id="colActStart" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'2018-04-06 23:59:59'})" readonly="readonly" disabled="false">
                                </td>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="实际完工时间"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input id="colActEnd" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'2018-04-06 23:59:59'})" readonly="readonly" disabled="false">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="content1">
                        <div class="mod-hd">
                            <h3 class="tit"><dict:lang value="拆分信息" /></h3>
                        </div>
                        <div class="mod-hd" style="height:150px;border-bottom:0;">
                            <table class="basic-table" >
                                <tbody>
   
                                <tr>
                                    <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="排产数量"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <input type="text" id="colPlanCount" name="colPlanCount" value="" maxlength="9" class="_VAL_NULL input isSubmit _VAL_OjbsData _VAL_DATABASE" style="width:200px;"  onkeyup="value=value.replace(/[^\d]/g,'')">

                                    </td>
                                    <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="排产工时"/>(H)</td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <input type="text" id="colPlanCapatcity" name="colPlanCapatcity" value="" maxlength="9" onchange="splitTimeChange()" class="_VAL_NULL input isSubmit _VAL_OjbsData _VAL_DATABASE" style="width:200px;" readonly="readonly" disabled="false">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="预计开工时间"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <input id="colPlanStart" name="colPlanStart" class="input WdateNomorl" onchange="splitTimeChange()" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'2018-04-06 23:59:59'})" data="">
                                    </td>
                                    <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="预计完工时间"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <input id="colPlanEnd" name="colPlanEnd" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'2018-04-06 23:59:59'})" readonly="readonly" disabled="false">
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

<%-- 未配置标准工时 开始 --%>
<div class="dialog-mask" id="noConfigStandartTimeMask" style="z-index:10002"></div>
<div class="dialog dialog-s1" id="noConfigStandartTime" style="display:none;z-index:10003;margin-left:0px;left:calc(50% - 400px);top:calc(50% - 280px);width:800px;height:550px;">
	<div class="dialog-hd">
	    <h3 class="tit"><dict:lang value="确认"/></h3>
	</div>
	<a class="dialog-close" href="javascript:void(0);" onclick="divHide('noConfigStandartTime', 'noConfigStandartTimeMask');"></a>
	<div class="dialog-bd-div" style="width:100%;height:500px;">
		<div class="optn optn_div" style="width:100%;height:40px;">
			<button type="button" value="" sytle="" class="botton_img_add" onclick="divHide('noConfigStandartTime', 'noConfigStandartTimeMask');"><i class="ico ico-cancel "></i><dict:lang value='关闭'/></button>
		</div>
		<div class="edit">
    		<div class="bd">
    			<div class="head1"  style="height:450px">
    				<div id="noStandartArea" name="noStandartTime" style="display:none;height:224px;overflow:auto;">
	    				<span><font color="red"><dict:lang value="请配置以下线别工厂日历，否则会影响产能计算"/></font></span>
			            <table class="dlist-table table-line"  style="width: 100%;table-layout:fixed;">
			                <thead id="exp_table_head">
				                <tr>
				                	<td style='width:30px; text-align:center;' >&nbsp;</td>
				                    <td style='width:150px; text-align:center;' ><dict:lang value='线别代码'/></td>
				                    <td style='width:100px; text-align:center;' ><dict:lang value='线别名称'/></td>
				                    <td style='width:150px; text-align:center;' ><dict:lang value='月份'/></td>
				                </tr>
			                </thead>
			                <tbody id="projectTable" name="projectTable">
			                </tbody>
			            </table>
		            </div>
    				<div id="noStandartTime" name="noStandartTime" style="display:none;height:225px;overflow:auto;">
	    				<span><font color="red"><dict:lang value="请配置以下标准工时，并打开该标准工时的排程计算标志，否则会影响产能计算"/></font></span>
			            <table class="dlist-table table-line"  style="width: 100%;table-layout:fixed;">
			                <thead id="exp_table_head">
				                <tr>
				                	<td style='width:30px; text-align:center;' >&nbsp;</td>
				                    <td style='width:150px; text-align:center;' ><dict:lang value='工单号'/></td>
				                    <td style='width:100px; text-align:center;' ><dict:lang value='生产阶别'/></td>
				                    <td style='width:150px; text-align:center;' ><dict:lang value='机种'/></td>
				                    <td style='width:150px; text-align:center;' ><dict:lang value='机种名称'/></td>
				                </tr>
			                </thead>
			                <tbody id="projectTable" name="projectTable">
			                </tbody>
			            </table>
		            </div>
        		</div>
    		</div>
    	</div>
	</div>
</div>
<%-- 未配置标准工时 结束 --%>
<script type="text/javascript">
	var selUnMonthProject = {};
	var stepCache = null;
	var taskList=[];

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
	
	function isNull(arg1){
		return !arg1 && arg1!==0 && typeof arg1!=="boolean"?true:false;
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
    
    //初始化
    function initial(){
        //初始化年份条件
        getSeachYear();
        //初始化月份条件
        getSeachMonth();
    }
   
    //加载数据
    function toLoadGanttData(data)
    {
        //var ret=JSON.parse(data);
        ge.loadProject(data);
        ge.checkpoint();
    }
    
    //消息提示
    //** type 1：警告；2：成功；3：失败；4：疑问；5：锁定
    //** msg 消息
    //** islan 是否默认使用多语言
    function showMessage(type,msg,islan){
utilsFp.confirmIcon(type,"","","", msg,1,"300","");
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

        try{
            initDateLang(GanttMaster.messages);
        }
        catch(error){}

    }
    
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
        }
        catch(error){}
    }
    
  	function setConditionForm(){
		$("#conditionForm td:eq(1)").children().remove();
		$("#conditionForm td:eq(1)").remove();
		
		var dataAuth  = $("#conditionForm #DATA_AUTH");
		var authList = [];
		$(dataAuth).find("option").each(function(i,e){
			if(!$(e).attr("value")) return true;
			authList.push({"VALUE":$(e).text(),"CODE":$(e).attr("value")})
		})
		addSelect($("#conditionForm td:eq(0) .dec"),'DATA_AUTH',authList,240);
		initSelect($("#conditionForm td:eq(0) .dec #DATA_AUTH"));
	}
    
    //显示div弹窗
    function divShow(front,back){
        $("#"+front+",#"+back).show();
    }
    
    //隐藏div弹窗
    function divHide(front,back){
        $("#"+front+",#"+back).hide();
    }
    
    function initSelect(o){
		var ctx = $(o);
		ctx.off("click");
		ctx.click(function(e){
				var isOpen = $(this).data("open");
				if(!isOpen){
					$(this).data("open",true);
					$(this).removeClass();
					$(this).addClass("chosen-container chosen-container-single chosen-container-single-nosearch chosen-container-active chosen-with-drop");
					
					$(document).one("click", function(){
	        			ctx.data("open",false);
						ctx.removeClass();
						ctx.addClass("chosen-container chosen-container-single");
	    			});
				}else{
					$(this).data("open",false);
					$(this).removeClass();
					$(this).addClass("chosen-container chosen-container-single");
				}
				e.stopPropagation();
		});
		
		ctx.find("#items li").off("mouseover");
		ctx.find("#items li").mouseover(function(e){
			ctx.find("#items li").removeClass("highlighted");
			$(this).addClass("highlighted");
			e.stopPropagation();
		});
		
		ctx.find("#items li").off("mouseout");
		ctx.find("#items li").mouseout(function(e){
			ctx.find("#items li").removeClass("highlighted");
			e.stopPropagation();
		});
		
		ctx.find("#items li").off("click");
		ctx.find("#items li").click(function(e){
			ctx.find("#items li").removeClass("result-selected");
			$(this).addClass("result-selected");
			ctx.find("#value").text($(this).text())
			
      		ctx.data("open",false);
			ctx.removeClass();
			ctx.addClass("chosen-container chosen-container-single");
			ctx.data("value",$(this).data("value"));
			ctx.trigger("change");	
			e.stopPropagation();
		});
	
	}
	
	function showSelectValue(o,v){
		var ctx = $(o);
		
		var txt = null;
		ctx.find("#items li").each(function(i,e){
			if($(e).data("value")!=v) return true;
			txt = $(e).text();
			return false;
		})
		
		ctx.find("#value").text(txt)
	}
	
	function addSelect(parent,id,data,width,defIndex){
		var p = $(parent);
		var html = "";
		html = "<div class='chosen-container chosen-container-single' style='width: "+width+"px;' title='' id='"+id+"' name='"+id+"'>";
		html += "	<a class='chosen-single' style='font-weight:normal'><span id='value' name='value'></span>";
		html += "		<div><b></b></div>";
		html += "	</a>";
		html += "	<div class='chosen-drop'>";
		html += "		<div class='chosen-search'><input type='text' autocomplete='off'></div>";
		html += "			<ul class='chosen-results' id='items' name='items'>";
		
		var def = null;
		defIndex = defIndex ? defIndex : 0;
		$(data).each(function(i,e){
			var txt = e.VALUE;
			var val = e.CODE;
			var s = "";
			if(i == defIndex){
				s = "<li class='active-result result-selected' data-value='"+val+"' style=''>"+txt+"</li>";
				def = e;
			}else
				s = "<li class='active-result ' data-value='"+val+"' style=''>"+txt+"</li>";
			html += s;
		})
		html +=	"			</ul>";
		html += "		</div>";
		html += "	</div>";
		html += "</div>";
		
		html = $(html);
		html.data("value",def.CODE);
		html.find("#value").text(def.VALUE);
		p.children().remove();
		p.append(html);
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
	
	function findItem (id){
		var rtn = null;
		$(taskList).each(function(i,e){
			if(e.id != id) return true;
			rtn = {};
			rtn["index"] = i;
			rtn["element"] = e;
			return false;
		});
		return rtn;
	}
	
	//查找任务依赖
	function getTaskDependIds(taskList,depends){
		var ids = "";
		var depIds = depends.split(",");
		$(depIds).each(function(id,ed){
			$(taskList).each(function(i,t){
				if(t.PROJECT_ID != ed) return true;
				ids +=(i + 1)+",";
				return false;
			})			
		})
		return ids;
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
		 $(ge.tasks).each(function(i,e){
		 	e.afterResize = ganttDragAndResize;
    		e.beforeResize = ganttDragAndResize;
    		e.resizing = ganttDragAndResize;
    		e.beforeDrag = ganttDragAndResize;
    		e.draging = ganttDragAndResize;
    		e.afterDrag = ganttDragAndResize;
    		e.beforeLine = beforeLine;
    		e.afterLine = afterLine
		 })
	}
	
	//恢复
	function ganttRestore(){
		$('#workSpace').trigger('redo.gantt');
		$(ge.tasks).each(function(i,e){
		 	e.afterResize = ganttDragAndResize;
    		e.beforeResize = ganttDragAndResize;
    		e.resizing = ganttDragAndResize;
    		e.beforeDrag = ganttDragAndResize;
    		e.draging = ganttDragAndResize;
    		e.afterDrag = ganttDragAndResize;
    		e.beforeLine = beforeLine;
    		e.afterLine = afterLine
		 })
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
		var size = $(".taskEditRow .delProject:checked").size();
		if(size == 0){
        	showMessage(1,"<dict:lang value="请选择要拆分的任务"/>",true);
        	return;
        }
        
        if(size > 1){
        	showMessage(1,"<dict:lang value="不能同时拆分多个"/>",true);
        	return;
        }
        
		if($(".taskEditRow .delProject[isStep=true]:checked").size() > 0){
			showMessage(1,"<dict:lang value="不能拆分阶别"/>",true);
        	return;
		}
		if($(".taskEditRow .delProject[isStep=false][canSplit=false]:checked").size() > 0){
			showMessage(1,"<dict:lang value="状态为关结或投产的工单不允许拆分"/>",true);
        	return;
		}
		
		var hasError = false;
		$(".taskEditRow .delProject[isStep=false][canSplit=true]:checked").each(function(ctlIndex,ctl){
			var projectId = $(ctl).attr("projectId");
			var item = findItem(projectId);
			if(!item) return false;
			
			var dataList = item.element;
			if( !(dataList.CAPATCITY && dataList.CAPATCITY !=Infinity)) {
				showMessage(1,"<dict:lang value="请配置标准工时，并打开该标准工时的排程计算标志，否则会影响产能计算及拆分"/>",true);
				hasError = true;
	            return false;
			}
			if( !dataList.PPW_DOC_NO) {
				showMessage(1,"<dict:lang value="请先保存排期"/>",true);
				hasError = true;
	            return false;
			}
		});
		
		if(hasError) return;
		
		$(".taskEditRow .delProject[isStep=false][canSplit=true]:checked").each(function(ctlIndex,ctl){
			var projectId = $(ctl).attr("projectId");
			var item = findItem(projectId);
			if(!item) return false;
			
			var dataList = item.element;
			
			if(!dataList.HAS_DB){
				showLoading(true);
				var param = {
					"operator" : "get",
					"id" : dataList.PPW_DOC_NO ?  dataList.PPW_DOC_NO : dataList.PROJECT_ID,
					"type" : dataList.PPW_DOC_NO ?  1 : 2
				}
				
				$.ajax({
		            type:"POST",
		            dataType:"json",
		            url:"${path}buss/bussModel_exeFunc.ms?funcMId=f44ae4c30fa64f92ad57d0f0594dfcfd",
		            data:param,
		            success:function(data){
		            	if(!data.ajaxMap){
		            		showMessage(1,"<dict:lang value="获取信息出错"/>",true);
		            		return ;
		            	}
		            	
		            	var obj = data.ajaxMap; //这里的obj与 dataList不是同一个对象，虽然他们ID相同
	
		            	$("#splitProject #colPpwId").val(obj.PPW_DOC_NO)
					 	$("#splitProject #colProjectId").val(obj.PROJECT_ID);
			            $("#splitProject #colStatus").val(obj.PROJECT_STATUS_STR);
			            $("#splitProject #colStep").val(obj.PROECT_STEP_NAME);
			            $("#splitProject #colModelCode").val(obj.PRODUCT_MATERIAL);
			            $("#splitProject #colModelName").val(obj.PRODUCT_MATERIAL_NAME);
			            $("#splitProject #colModelSpec").val(obj.PRODUCT_MATERIAL_SPEC);
			            $("#splitProject #colPlanNum").val(obj.PRODUCT_COUNT);
			            $("#splitProject #colPlanedNum").val(obj.PPW_NOW_NUM); //待排产数量 
			            $("#splitProject #colInputNum").val(obj.FQC_COUNT);
			            $("#splitProject #colOutputNum").val(obj.FINISH_COUNT);
			            $("#splitProject #colCapatcity").val((obj.CAPATCITY /60).toFixed(2));
			            $("#splitProject #colStandard").val(obj.CST_STANDARD_TIME);
			            $("#splitProject #usedCapatcity").val((obj.PPW_PLAN_CAPATCITY /60).toFixed(2));
			            $("#splitProject #unUsedCapatcity").val((obj.PPW_NOW_CAPATCITY /60).toFixed(2));
			            $("#colExpStart").val(dateFormat(new Date(dataList.start),"yyyy-MM-dd hh:mm:ss"));
			            $("#colExpEnd").val(dateFormat(new Date(dataList.end),"yyyy-MM-dd hh:mm:ss"));
			            $("#colActStart").val(obj.ACTUAL_START_DATE ? dateFormat(new Date(obj.ACTUAL_START_DATE),"yyyy-MM-dd hh:mm:ss") : "");
			            $("#colActEnd").val(obj.ACTUAL_END_DATE ? dateFormat(new Date(obj.ACTUAL_END_DATE),"yyyy-MM-dd hh:mm:ss") : "");
	
						$("#splitProject #colPlanCount").off("blur");
						$("#splitProject #colPlanCount").blur(function(){
							var count = $("#splitProject #colPlanCount").val();
							var capatcity = (obj.CST_STANDARD_TIME * count ) / 3600;
							$("#splitProject #colPlanCapatcity").val(capatcity.toFixed(2));
							$("#splitProject #colPlanCapatcity").trigger("change")
						});
			            
			            $("#splitProject #save").off("click");
			            $("#splitProject #save").data("prj",obj);
			            $("#splitProject #save").data("src",dataList);
			            $("#splitProject #save").click(function(){
			            	utilsFp.confirmIcon(1,"","splitSave","", "<dict:lang value="是否要保存？"/>",0,"300","");
			            });
						dataList.HAS_DB = true;
		            	showLoading(false);
		            },
		            error:function(msg){
		                showLoading(false);
		            }
		        });
			}else{
				var obj = dataList;
				
				$("#splitProject #colPpwId").val(obj.PPW_DOC_NO)
			 	$("#splitProject #colProjectId").val(obj.PROJECT_ID);
	            $("#splitProject #colStatus").val(obj.PROJECT_STATUS_STR);
	            $("#splitProject #colStep").val(obj.PROECT_STEP_NAME);
	            $("#splitProject #colModelCode").val(obj.PRODUCT_MATERIAL);
	            $("#splitProject #colModelName").val(obj.PRODUCT_MATERIAL_NAME);
	            $("#splitProject #colModelSpec").val(obj.PRODUCT_MATERIAL_SPEC);
	            $("#splitProject #colPlanNum").val(obj.PRODUCT_COUNT);
	            $("#splitProject #colPlanedNum").val(obj.PPW_NOW_NUM);
	            $("#splitProject #colInputNum").val(obj.FQC_COUNT);
	            $("#splitProject #colOutputNum").val(obj.FINISH_COUNT);
	            $("#splitProject #colCapatcity").val((obj.CAPATCITY /60).toFixed(2));
	            $("#splitProject #colStandard").val(obj.CST_STANDARD_TIME);
	            $("#splitProject #usedCapatcity").val((obj.PPW_PLAN_CAPATCITY /60).toFixed(2));
	            $("#splitProject #unUsedCapatcity").val((obj.PPW_NOW_CAPATCITY /60).toFixed(2));
	            $("#colExpStart").val(dateFormat(new Date(dataList.start),"yyyy-MM-dd hh:mm:ss"));
	            $("#colExpEnd").val(dateFormat(new Date(dataList.end),"yyyy-MM-dd hh:mm:ss"));
	            $("#colActStart").val(obj.ACTUAL_START_DATE ? dateFormat(new Date(obj.ACTUAL_START_DATE),"yyyy-MM-dd hh:mm:ss") : "");
	            $("#colActEnd").val(obj.ACTUAL_END_DATE ? dateFormat(new Date(obj.ACTUAL_END_DATE),"yyyy-MM-dd hh:mm:ss") : "");

				$("#splitProject #colPlanCount").off("blur");
				$("#splitProject #colPlanCount").blur(function(){
					var count = $("#splitProject #colPlanCount").val();
					var capatcity = (obj.CST_STANDARD_TIME * count ) / 3600;
					$("#splitProject #colPlanCapatcity").val(capatcity.toFixed(2));
					$("#splitProject #colPlanCapatcity").trigger("change")
				});
			
			}
			return false;
		});
		
		$("#splitProject #colPlanCount").val("");
		$("#splitProject #colPlanCapatcity").val("");
       	$("#splitProject #colPlanStart").val("");
       	$("#splitProject #colPlanEnd").val("");
		divShow('splitProject', 'splitProjectMask');
	}
	
	function splitTimeChange(e){
		
		var capatcity = $.trim($("#splitProject #colPlanCapatcity").val());
       	var start = $.trim($("#splitProject #colPlanStart").val());
       	var end = null;
       	if( capatcity.length == 0 || start.length ==0){
       		$("#splitProject #colPlanEnd").val('');
       		return false;
       	}
       	
       	
       	capatcity = parseFloat(capatcity);
       	start = new Date(start).getTime();
       	//end = dateFormat(new Date(computeEndByDurationSimple(start,capatcity,obj.PROJECT_STEP)),"yyyy-MM-dd hh:mm:ss")
       	end  = start + capatcity * 3600 * 1000;
       	end  =  dateFormat(new Date(end),"yyyy-MM-dd hh:mm:ss");
       	$("#splitProject #colPlanEnd").val(end);
	}
	
	function splitSave(){
		var src = $("#splitProject #save").data("src");
		var newPrj = $("#splitProject #save").data("prj");
		
		var count = parseInt($("#splitProject #colPlanCount").val());
		var capatcity = parseFloat($("#splitProject #colPlanCapatcity").val());
		var start = new Date($("#splitProject #colPlanStart").val());
		var end = new Date($("#splitProject #colPlanEnd").val());
		
		if(count > src.PPW_NOW_NUM){
			showMessage(1,"<dict:lang value="不能超过待排产数量"/>",true);
			return;
		}
		
		if(capatcity > src.PPW_NOW_CAPATCITY){
			showMessage(1,"<dict:lang value="不能超过待排产工时"/>",true);
			return;
		}
		
        selUnMonthProject = {};
    	newPrj.PPW_DOC_NO = null;
    	newPrj.PPW_NOW_NUM = count;
    	newPrj.PPW_PLAN_NUM = 0;
    	newPrj.CAPATCITY = capatcity*60;
    	newPrj.PPW_PLAN_CAPATCITY = 0;
    	newPrj.PPW_NOW_CAPATCITY = newPrj.CAPATCITY;
    	newPrj.PROLEPSIS_START_DATE = dateFormat(start,"yyyy-MM-dd hh:mm:ss");
    	newPrj.PROLEPSIS_END_DATE = dateFormat(end,"yyyy-MM-dd hh:mm:ss")
    	selUnMonthProject["Project_"+newPrj.PROJECT_ID]=newPrj;
    	
    	src = findItem(src.id);
    	if(src && src.element){
    		src.element.PPW_PLAN_NUM += count;
    		src.element.PPW_NOW_NUM -= count;
    		src.element.PPW_PLAN_CAPATCITY += capatcity*60;
    		src.element.PPW_NOW_CAPATCITY -= capatcity*60;
    	}
    	unMonthProjectAdd();
		divHide('splitProject', 'splitProjectMask');
	}
	
	//保存
	function ganttSave(){
		if(ge.tasks.length == 0){
        	showMessage(1,"<dict:lang value="目前没有任务要保存"/>",true);
        	return;
        }
        
        if(!$("#conditionForm td:eq(0) .dec #DATA_AUTH").data("value")){
        	showMessage(1,"<dict:lang value="请选择组织机构 "/>",true);
        	return;
        }
        utilsFp.confirmIcon(1,"","save","", "<dict:lang value="是否要保存？"/>",1,"300","");
	}
	
	//保存确认
	function save(){
		var url = "${path}buss/bussModel_exeFunc.ms?funcMId=f44ae4c30fa64f92ad57d0f0594dfcfd"	;
		var data={};
        
        data.operator='save';
        if(ge.tasks.length == 0){
        	showMessage(1,"<dict:lang value="没有任务要保存"/>",true);
        	return;
        }else{
        	var isFail  = false;
        	
        	$(ge.tasks).each(function(it,tt){
        	
        		if(tt.isStep) return true;
        		if(parseInt(tt.PROJECT_STATUS) != 0) return true;
        		
       			var now = getNow().getTime();
       			
       			if(tt.start < now || tt.end<now ){
					showMessage(1,tt.name + "<dict:lang value="的排期不能小于今天"/>",true);
					isFail=true;
					return false;
				}
        	});
        	
        	if(isFail) 
        		return;
        	
        	$(ge.tasks).each(function(it,tt){
        		if(tt.isStep) return true;
        		
        		var row ={
        			"id":tt.id,
			    	"name" : tt.name,
			    	"start" : tt.start,
			    	"end" : tt.end,
			    	"duration" : tt.duration,
			    	"PRODUCT_COUNT":tt.PRODUCT_COUNT,
			    	"PPW_NOW_NUM":tt.PPW_NOW_NUM,
			    	"PPW_PLAN_NUM":tt.PPW_PLAN_NUM,
			    	"TPPB_PLAN_DELIVERY_DATE":tt.TPPB_PLAN_DELIVERY_DATE,
			    	"DATA_AUTH":$("#conditionForm td:eq(0) .dec #DATA_AUTH").data("value"),
			    	"depends":[]
        		}
        		if($.trim(tt.depends).length > 0){
	        		$(tt.depends.split(",")).each(function(i,d){
	        			row.depends.push(ge.tasks[parseInt(d) - 1].PROJECT_ID);
	        		})
	        	}
        		data["data_"+tt.id]=JSON.stringify(row);
        	});
        	showLoading(true);
	        $.ajax({
	            type:"POST",
	            dataType:"json",
	            url:url,
	            data:data,
	            success:function(data){
	            	showLoading(false);
	            	taskList = [];
	            	query();
	            },
	            error:function(msg){
	                showLoading(false);
	            }
	        });
        }
	}
	
	//添加工单
	function queryUnMonthProject(hideShow){
		$("#showProjectQuery #query").off("click")
		$("#showProjectQuery #query").on("click",function(){
			queryUnMonthProject(true);
		})
		$("#showProjectQuery #commit").off("click");
		$("#showProjectQuery #commit").on("click",unMonthProjectAdd);

        var ppwStartDateBegin = $.trim($("#PPW_START_DATE_BEGIN").val());
        var ppwStartDateEnd =  $.trim($("#PPW_START_DATE_END").val());

		addSelect($("#showProjectQuery #pager #pagerContainer"),'goPager',[{"VALUE":"<dict:lang value='每页'/>20<dict:lang value='条'/>","CODE":20},
		{"VALUE":"<dict:lang value='每页'/>50<dict:lang value='条'/>","CODE":50},
		{"VALUE":"<dict:lang value='每页'/>80<dict:lang value='条'/>","CODE":80},
		{"VALUE":"<dict:lang value='每页'/>100<dict:lang value='条'/>","CODE":100}],90);
		
		initSelect($("#showProjectQuery #pager #goPager"));
		
		if (ppwStartDateBegin.length == 0 || ppwStartDateEnd.length == 0){
			showMessage(1,"<dict:lang value="请选择预计开工时间"/>",true);
			return;
		}else {
			var from = new Date(ppwStartDateBegin ).getTime();
			var to= new Date(ppwStartDateEnd).getTime();
			var now = getNow();
			
			if(to - from < 0){
				showMessage(1,"<dict:lang value="预计开工时间 起始必须大于终止"/>",true);
				return;
			}
			if ( ((to - from + 1000 ) /(24 * 3600 *1000)) > 366 ){
				showMessage(1,"<dict:lang value="预计开工时间不能超过一年"/>",true);
				return;
			}
		}
		
		showLoading(true);
		selUnMonthProject={};
		$.ajax({
            type:"POST",
            dataType:"json",
            url:"${path}buss/bussModel_exeFunc.ms?funcMId=f44ae4c30fa64f92ad57d0f0594dfcfd",
            data:getUnMonthPrjectParam("queryUnMonthProject.init",$("#showProjectQuery #pager #curPage").val(),$("#showProjectQuery #pager #goPager").data("value"),true),
            success:function(data){
            	if(data.ajaxMap.step){
            		data.ajaxMap.step.splice(0,0,{"VALUE":"<dict:lang value="--请选择--"/>","CODE":""})
            		addSelect($("#showProjectQuery #searchForm #ppwStepContainer"),'ppwStep',data.ajaxMap.step,240);
					initSelect($("#showProjectQuery  #searchForm #ppwStep"));
					$("#showProjectQuery  #searchForm #ppwStep").off("change");
					$("#showProjectQuery  #searchForm #ppwStep").change(function(){
						$("#showProjectQuery #ppwStepHidden").val($(this).data("value"))
					});
            	}
            	if(data.ajaxMap.status){
            		data.ajaxMap.status.splice(0,0,{"VALUE":"<dict:lang value="--请选择--"/>","CODE":""})
            		addSelect($("#showProjectQuery #searchForm #ppwStatusContainer"),'ppwStatus',data.ajaxMap.status,240);
					initSelect($("#showProjectQuery  #searchForm #ppwStatus"));
					$("#showProjectQuery  #searchForm #ppwStatus").off("change");
					$("#showProjectQuery  #searchForm #ppwStatus").change(function(){
						$("#showProjectQuery #ppwStatusHidden").val($(this).data("value"))
					});
            	}
            	if(data.ajaxMap.project){
            		var tableList = $("#showProjectQuery #projectTable");
            		var index = 1,cur = parseInt(data.ajaxMap.curPage),max = parseInt(data.ajaxMap.pageCount); 
            		tableList.children().remove();
            		
            		$("#showProjectQuery #pager .count").text(data.ajaxMap.projectCount)
            		$("#showProjectQuery #pager .pageCount").text(max)
            		$("#showProjectQuery #pager #curPage").val(cur)
            		$("#showProjectQuery #pager .home").attr("go",1);
            		$("#showProjectQuery #pager .last").attr("go",max);
            		$("#showProjectQuery #pager .pre").attr("go",cur <=1 ? 1 : (cur - 1));
            		$("#showProjectQuery #pager .next").attr("go",cur >= max ? max : (cur + 1));
            		
            		$("#showProjectQuery #pager .jump").off("click");
            		$("#showProjectQuery #pager .jump").click(function(){
            			var val = $(this).attr("go");
            			var pageSize = $("#showProjectQuery #pager #goPager").data("value")
            			gotoUnMonthProjectPage(val,pageSize);
            		});
            		$("#showProjectQuery #pager #curPage").off("keypress")
            		$("#showProjectQuery #pager #curPage").keypress(function(){
            			if(event.keyCode == "13"){  
	            			var val = parseInt($(this).val());
	            			var max = parseInt($("#showProjectQuery #pager .pageCount").text());
	            			var pageSize = $("#showProjectQuery #pager #goPager").data("value");
	            			if(val <=1) 
	            				val = 1;
	            			else if(val >=max)
	            				val = max;
	            			gotoUnMonthProjectPage(val,pageSize);
            			}
            		});
            		$("#showProjectQuery #pager #goPager").off("change");
            		$("#showProjectQuery #pager #goPager").change(function(i,e){
            			var pageSize = $("#showProjectQuery #pager #goPager").data("value")
            			gotoUnMonthProjectPage(1,pageSize);
            		})
            		showSelectValue($("#showProjectQuery #pager #goPager"),data.ajaxMap.pageSize)
            		
            		$(data.ajaxMap.project).each(function(i,e){

						var row = $("<tr class='datagrid-row'></tr>");
						var chkBox = $("<input type='checkbox' name='projectInfo' tt='Project_"+e.PROJECT_ID+"' class='single'>");
						var chkTd = $("<td class='datagrid-cell' style='text-align: center;'></td>");
						var chkFun = function(){
							var prj = $(this).data("project");
							var chk = $(this).is(':checked');
							var key = "Project_" + e.PROJECT_ID;
							if(chk){
								delete selUnMonthProject[key];
								selUnMonthProject[key] = prj;
							}else{
								delete selUnMonthProject[key];
							}
						}
						
						if(index % 2 ==0){
							row.css("background-color","#f0f4fd");
						}
						if(selUnMonthProject["Project_" + e.PROJECT_ID]){
							chkBox.attr("checked","checked");
						}
						
						row.data("project",e);
						chkBox.data("project",e);
						chkBox.change(chkFun);
						chkTd.append(chkBox);
						
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+(index ++ )+"</td>"));
						row.append(chkTd);
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.PROJECT_ID+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.PROECT_STEP_NAME+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+(e.CST_STANDARD_TIME ? e.CST_STANDARD_TIME : "未设置")+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.PRODUCT_MATERIAL+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+(e.PRODUCT_MATERIAL_NAME ? e.PRODUCT_MATERIAL_NAME :"&nbsp;")+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+dateFormat( new Date(e.PROLEPSIS_START_DATE),"yyyy-MM-dd hh:mm")+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+dateFormat( new Date(e.PROLEPSIS_END_DATE),"yyyy-MM-dd hh:mm")+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+dateFormat( new Date(e.TPPB_PLAN_DELIVERY_DATE),"yyyy-MM-dd hh:mm")+"</td>"));
						tableList.append(row);
					}) 
            	}
            	if(!hideShow)
					divShow("showProjectQuery","showProjectQueryMask");
            	showLoading(false);
            },
            error:function(msg){
                showLoading(false);
            }
        });
	}
	
	//添加工单参数
	function getUnMonthPrjectParam(oper,cur,pageSize,isFirst){
		var param = {
			"operator":oper,
            "curPage" : isFirst ? 1  : cur,
            "pageSize" : pageSize,
            "step":			isFirst ? $("#showProjectQuery  #searchForm #ppwStep").data("value") : 				$("#showProjectQuery #ppwStepHidden").val(),
            "projectId" :	isFirst ? $("#showProjectQuery #ppwProjectId").val() : 			$("#showProjectQuery #ppwProjectIdHidden").val(),
            "material":		isFirst ? $("#showProjectQuery #ppwProductMaterial").val() : 	$("#showProjectQuery #ppwProductMaterialHidden").val(),
            "status":		isFirst ? $("#showProjectQuery  #searchForm #ppwStatus").data("value"):				$("#showProjectQuery #ppwStatusHidden").val(),
            "ppwStartDateBegin": $.trim($("#PPW_START_DATE_BEGIN").val()),
        	"ppwStartDateEnd": $.trim($("#PPW_START_DATE_END").val())
            
		}
		var ids = "";
		$(ge.tasks).each(function(i,e){
			if(e.isStep) return true;
			ids+=e.PROJECT_ID+",";
		});
		param["removeIds"] = ids;
		
		if(isFirst){
			$("#showProjectQuery #ppwStepHidden").val($("#showProjectQuery #ppwStep").val());
			$("#showProjectQuery #ppwProjectIdHidden").val($("#showProjectQuery #ppwProjectId").val());
			$("#showProjectQuery #ppwProductMaterialHidden").val($("#showProjectQuery #ppwProductMaterial").val());
			$("#showProjectQuery #ppwStatusHidden").val($("#showProjectQuery #ppwStatus").val())
		}
		return param;
	}
	
	//添加工单翻页
	function gotoUnMonthProjectPage(cur,pageSize){
		showLoading(true);
		$.ajax({
            type:"POST",
            dataType:"json",
            url:"${path}buss/bussModel_exeFunc.ms?funcMId=f44ae4c30fa64f92ad57d0f0594dfcfd",
            data:getUnMonthPrjectParam("queryUnMonthProject.query",cur,pageSize,false),
            success:function(data){
            	if(data.ajaxMap.project){
            		var tableList = $("#showProjectQuery #projectTable");
            		var index = 1,cur = parseInt(data.ajaxMap.curPage),max = parseInt(data.ajaxMap.pageCount); 
            		tableList.children().remove();
            		
            		$("#showProjectQuery #pager .count").text(data.ajaxMap.projectCount)
            		$("#showProjectQuery #pager .pageCount").text(max)
            		$("#showProjectQuery #pager #curPage").val(cur)
            		$("#showProjectQuery #pager .home").attr("go",1);
            		$("#showProjectQuery #pager .last").attr("go",max);
            		$("#showProjectQuery #pager .pre").attr("go",cur <=1 ? 1 : (cur - 1));
            		$("#showProjectQuery #pager .next").attr("go",cur >= max ? max : (cur + 1));
            		
            		$(data.ajaxMap.project).each(function(i,e){
						var row = $("<tr class='datagrid-row'></tr>");
						var chkBox = $("<input id='"+e.PROJECT_ID+"' type='checkbox' name='projectInfo'>");
						var chkTd = $("<td class='datagrid-cell' style='text-align: center;'></td>");
						var chkFun = function(){
							var prj = $(this).data("project");
							var chk = $(this).is(':checked');
							var key = "Project_" + e.PROJECT_ID;
							if(chk){
								delete selUnMonthProject[key];
								selUnMonthProject[key] = prj;
							}else{
								delete selUnMonthProject[key];
							}
						}
						
						if(index % 2 ==0){
							row.css("background-color","#f0f4fd");
						}
						if(selUnMonthProject["Project_" + e.PROJECT_ID]){
							chkBox.attr("checked","checked");
						}
						
						row.data("project",e);
						chkBox.data("project",e);
						chkBox.change(chkFun);
						chkTd.append(chkBox);
						
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+(index ++ )+"</td>"));
						row.append(chkTd);
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.PROJECT_ID+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.PROECT_STEP_NAME+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+(e.CST_STANDARD_TIME ? e.CST_STANDARD_TIME : "未设置")+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+e.PRODUCT_MATERIAL+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+(e.PRODUCT_MATERIAL_NAME ? e.PRODUCT_MATERIAL_NAME :"&nbsp;")+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+dateFormat( new Date(e.PROLEPSIS_START_DATE),"yyyy-MM-dd hh:mm")+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+dateFormat( new Date(e.PROLEPSIS_END_DATE),"yyyy-MM-dd hh:mm")+"</td>"));
						row.append($("<td class='datagrid-cell' style='text-align: center;'>"+dateFormat( new Date(e.TPPB_PLAN_DELIVERY_DATE),"yyyy-MM-dd hh:mm")+"</td>"));
						tableList.append(row);
					}) 
            	}
            	showLoading(false);
            },
            error:function(msg){
                showLoading(false);
            }
        });
		
	}
	
	//工单的最后添加
	function unMonthProjectAdd(){
		var afterGetCache = function(){
			var stepTemp = {};
			var now = new Date();
			
			$(ge.tasks).each(function(i,oldEle){
				var newEle = findItem(oldEle.id);
				if(!newEle) return true;
				
				newEle = newEle.element;
				newEle.start = oldEle.start;
				newEle.end = oldEle.end;
				newEle.duration = oldEle.duration;
				newEle.progress = oldEle.progress;
				newEle.depends = oldEle.depends;
				newEle.beDependeds = oldEle.beDependeds;
				newEle.status = oldEle.status;
			});
			
			for (prop in stepCache){
	    		if(prop.indexOf("Step_")!=0) continue;
	    		
	    		if(stepTemp[stepCache[prop].id]) continue;

				stepTemp[stepCache[prop].id]={
					minStart:new Date("2999-12-31 23:59:59").getTime(),
					maxEnd:0,
					sumCapacity:0,
					lastProjectIndex:0,
					children:[]
				};

	    	}
			for(prop in selUnMonthProject){
				if(prop.indexOf("Project_")!=0) continue;
				var pro = selUnMonthProject[prop];
				var proRow = {};
				if(!pro.CAPATCITY){
					pro.CAPATCITY=Infinity;
				}
	    		
	    		proRow = jQuery.extend(true, {}, pro);
	    		proRow.id = proRow.PPW_DOC_NO ? proRow.PPW_DOC_NO : ("NoNum" + new Date().getTime() +"-" + proRow.PROJECT_ID);
	    		proRow.name = proRow.PROJECT_ID;
	    		proRow.code = proRow.PROJECT_ID;
	    		proRow.level = 1;
	    		proRow.canWrite = true;
	    		proRow.start = new Date(proRow.PROLEPSIS_START_DATE).getTime();
	    		proRow.end = pro.CAPATCITY != Infinity? (proRow.start + proRow.CAPATCITY*60*1000) : new Date(proRow.PROLEPSIS_END_DATE).getTime();
	    		proRow.duration =  (proRow.end - proRow.start +1) / (60*1000);
	    		proRow.startIsMilestone = false;
	    		proRow.endIsMilestone=false;
	    		proRow.collapsed=false;
	    		proRow.status= "STATUS_ACTIVE";
	    		proRow.assigs = [];
	    		proRow.hasChild=false;
	    		
	    		proRow.hasChange=false;
				proRow.isStep = false;
				proRow.isAddByHand = (proRow.PPW_DOC_NO ? false : true ) || (eval(proRow.PROJECT_STATUS ) == 0); 
				proRow.beDependeds = [];
	    		proRow.afterResize = ganttDragAndResize;
	    		proRow.beforeResize = ganttDragAndResize;
	    		proRow.resizing = ganttDragAndResize;
	    		proRow.beforeDrag = ganttDragAndResize;
	    		proRow.draging = ganttDragAndResize;
	    		proRow.afterDrag = ganttDragAndResize;
	    		proRow.beforeLine = beforeLine;
	    		proRow.afterLine = afterLine
	    		proRow.hasDepends = proRow.PPW_PRE_TASK != null && $.trim(proRow.PPW_PRE_TASK) .length >0;
	    		proRow.MIN_START_DATE = proRow.MIN_START_DATE ? new Date(proRow.MIN_START_DATE).getTime() : - (new Date("2999-12-31 23:59:59").getTime()) ;
	    		proRow.MAX_START_DATE = proRow.MAX_START_DATE ? new Date(proRow.MAX_START_DATE).getTime() : new Date("2999-12-31 23:59:59").getTime() ;

	    		stepTemp[pro.PROJECT_STEP].sumCapacity += pro.CAPATCITY ? pro.CAPATCITY : Infinity;
	    		if(proRow.start < stepTemp[pro.PROJECT_STEP].minStart)
	    			stepTemp[pro.PROJECT_STEP].minStart = proRow.start;
	    		if(proRow.end > stepTemp[pro.PROJECT_STEP].maxEnd)
	    			stepTemp[pro.PROJECT_STEP].maxEnd = proRow.end;
	    		delete proRow.ID;
	    		
	    		stepTemp[pro.PROJECT_STEP].children.push(proRow);
			}
			$(taskList).each(function(i,e){
				if(e.isStep) return true;
				stepTemp[e.PROJECT_STEP].sumCapacity += e.CAPATCITY;
				if(e.start < stepTemp[e.PROJECT_STEP].minStart)
	    			stepTemp[e.PROJECT_STEP].minStart = e.start;
	    		if(e.end > stepTemp[e.PROJECT_STEP].maxEnd)
	    			stepTemp[e.PROJECT_STEP].maxEnd = e.end;
	    		stepTemp[e.PROJECT_STEP].lastProjectIndex = i;
			});
		
			
			for(prop in stepTemp){
				var step = findItem(prop);
				var cache = stepTemp[prop];
				if(!step){	
					step = stepCache["Step_"+prop];
					step.start = cache.minStart;
					step.end = cache.maxEnd;
					step.duration = (cache.maxEnd - cache.minStart ) / (1000 * 60);

					step.progress =cache.sumCapacity == Infinity ? Infinity : (((cache.sumCapacity+0.0) / step.total) * 100).toFixed(2);
					if(cache.children.length > 0){
						taskList.push(step);
						$(cache.children).each(function(i,e){
							taskList.push(e);
						});
					}
				}else{
					step = step.element;
					step.start = cache.minStart;
					step.end = cache.maxEnd;
					step.duration = (cache.maxEnd - cache.minStart ) / (1000 * 60);
					step.progress = cache.sumCapacity == Infinity ? Infinity : (((cache.sumCapacity+0.0) / step.total) * 100).toFixed(2);
					$(cache.children).each(function(i,e){
						taskList.splice(++cache.lastProjectIndex, 0, e);
					});
				}
			}
			
			$(taskList).each(function(i,e){
	    		if(e.isStep) {
	    			return true;
	    		}
	    		if(e.hasDepends == false){
	    			return true;
	    		}
	    	
	    		
	    		e.depends = getTaskDependIds(taskList,e.PPW_PRE_TASK);
	    		if(e.depends !=null && e.depends.length > 0){
	    			e.status = "STATUS_SUSPENDED"
	    			$(e.depends.split(",")).each(function(depIndex,depId){
	    				var dep = taskList[parseInt(depId) - 1];
	    				if(!dep) return true;
	    				
	    				var obj={id:e.id};
						obj.start = e.start ;
						obj.end = e.end;
						obj.duration = e.duration;
						dep.beDependeds.push(obj);
	    			});
	    		}

	    	})
			
			var ganttTasks={
                   	tasks:taskList,
                   	selectedRow:0,
                   	canWrite:true,
                   	canWriteOnParent:true
               	};
            divHide("showProjectQuery", "showProjectQueryMask");
            toLoadGanttData(ganttTasks);
			
		};
		
		if(!stepCache){
			initStepCache(afterGetCache);
		}else{
			afterGetCache();
		}
	}
	
	function initStepCache(after){
		var url = "${path}buss/bussModel_exeFunc.ms?funcMId=f44ae4c30fa64f92ad57d0f0594dfcfd"	;
        var param={};
        
        param.operator='stepCache';
        param.ppwStartDateBegin = $.trim($("#PPW_START_DATE_BEGIN").val());
        param.ppwStartDateEnd =  $.trim($("#PPW_START_DATE_END").val());
        	  
	    showLoading(true);
	    $.ajax({
            type:"POST",
            dataType:"json",
            url:url,
            data:param,
            success:function(data){	    
			    stepCache = {};
			    
			    var stepList = {};
			    if(data.ajaxMap.stepPPCExceptionTime){
			    	for(x in  data.ajaxMap.stepPPCExceptionTime){
			    		if(/^\d{1,2}$/.test(x) == false) continue;
			    		if(!stepList[x]) stepList[x] = {
			    			"areaSn":x,
			    			"workTime":[],
			    			"restTime":[],
			    			"exceptionTime":[],
			    			"isSat":false,
			    			"isSun":false
			    		};
			    		$(data.ajaxMap.stepPPCExceptionTime[x]).each(function(i,e){
			    			stepList[x].exceptionTime.push(e);
			    		});
			    	}
			    }
			    
			    if(data.ajaxMap.stepWorkTime){
			    	for(x in  data.ajaxMap.stepWorkTime){
			    		if(/^\d{1,2}$/.test(x) == false) continue;
			    		if(!stepList[x]) stepList[x] = {
			    			"areaSn":x,
			    			"workTime":[],
			    			"restTime":[],
			    			"exceptionTime":[],
			    			"isSat":false,
			    			"isSun":false
			    		};
			    		$(data.ajaxMap.stepWorkTime[x]).each(function(i,e){
			    			stepList[x].workTime.push(e);
			    		});
			    	}
			    }
	
				if(data.ajaxMap.stepRestTime){
			    	for(x in  data.ajaxMap.stepRestTime){
			    		if(/^\d{1,2}$/.test(x) == false) continue;
			    		if(!stepList[x]) stepList[x] = {
			    			"areaSn":x,
			    			"workTime":[],
			    			"restTime":[],
			    			"exceptionTime":[],
			    			"isSat":false,
			    			"isSun":false
			    		};
			    		$(data.ajaxMap.stepRestTime[x]).each(function(i,e){
			    			stepList[x].restTime.push(e);
			    		});
			    	}
			    }
			    
			    if(data.ajaxMap.stepWeekendTime){
			    	for(x in  data.ajaxMap.stepWeekendTime){
			    		if(/^\d{1,2}$/.test(x) == false) continue;
			    		if(!stepList[x]) stepList[x] = {
			    			"areaSn":x,
			    			"workTime":[],
			    			"restTime":[],
			    			"exceptionTime":[],
			    			"isSat":false,
			    			"isSun":false
			    		};
			    		var isStat = false;
			    		var isSun = true;
			    		$(data.ajaxMap.stepWeekendTime[x]).each(function(i,e){
							isStat = isStat || new Date(e.start).getDay()==6;
							isSun = isSun || new Date(e.start).getDay()==0;
			    		});
			    		stepList[x].isSat = isStat;
			    		stepList[x].isSun = isSun;
			    	}
			    }
			    
			    for(x in  stepList){
			    	if(/^\d{1,2}$/.test(x) == false) continue;
			    	 setInnerSpecial(stepList[x]);
			    }
			    
			    $(data.ajaxMap.step).each(function(stepIndex,step){
			    	var stepRow = {
			    		"id":step.STEP_CODE,
			    		"name":step.STEP_NAME,
			    		"code":step.STEP_CODE,
			    		"level":0,
			    		"status":"STATUS_ACTIVE",
			    		"canWrite":true,
			    		"start":0,
			    		"duration": 0,
			    		"end":0,
			    		"startIsMilestone":false,
			    		"endIsMilestone":false,
			    		"collapsed":false,
			    		"assigs":[],
			    		"hasChild":false,
			    		
			    		"hasChange":false,
			    		"total":step.TOTAL_WORK,
			    		"isStep":true,
			    		"afterResize":ganttDragAndResize,
			    		"beforeResize":ganttDragAndResize,
			    		"resizing":ganttDragAndResize,
			    		"beforeDrag":ganttDragAndResize,
			    		"draging":ganttDragAndResize,
			    		"afterDrag":ganttDragAndResize,
			    		"beforeLine":beforeLine,
			    		"afterLine":afterLine
			    	}
			    	stepRow = jQuery.extend(true, stepRow, step);
			    	if(!stepCache["Step_"+stepRow.id]){
			    		stepCache["Step_"+stepRow.id] = stepRow; 
			    	}else{
			    		stepCache["Step_"+stepRow.id].total += stepRow.total;
			    	}
			    });
			    
			    showLoading(false);
			    
			    if($.isFunction(after))
			    	after();
		    },
            error:function(msg){
                showLoading(false);
            }
	   });
	}
	
	function deleteUnMonthProject(){
		var size = $(".taskEditRow .delProject:checked").size();
		if(size == 0){
        	showMessage(1,"<dict:lang value="请选择要删除的任务"/>",true);
        	return;
        }
        
		if($(".taskEditRow .delProject[isStep=true]:checked").size() > 0){
			showMessage(1,"<dict:lang value="不能删除阶别"/>",true);
        	return;
		}
		if($(".taskEditRow .delProject[isStep=false][canDelete=false]:checked").size() > 0){
			showMessage(1,"<dict:lang value="非开立状态的工单不能删除"/>",true);
        	return;
		}
		
		utilsFp.confirmIcon(1,"","deleteUnMonthProject_confirm","", "<dict:lang value="是否要删除？"/>",1,"300","");
		
		
        
	}
	
	function deleteUnMonthProject_confirm(){
		var goDel = "";
		$(ge.tasks).each(function(i,oldEle){
			var newEle = findItem(oldEle.id);
			if(!newEle) return true;
			
			newEle = newEle.element;
			newEle.start = oldEle.start;
			newEle.end = oldEle.end;
			newEle.duration = oldEle.duration;
			newEle.progress = oldEle.progress;
			newEle.depends = oldEle.depends;
			newEle.beDependeds = oldEle.beDependeds;
			newEle.status = oldEle.status;
		});
        $(".taskEditRow .delProject[isStep=false][canDelete=true]:checked").each(function(i,e){
        	var id = $(e).attr("projectId");
        	for(var i=0;i<taskList.length;i++){
        		var step = taskList[i];
        		if(step.isStep) continue;
        		if(step.id != id) continue;
        		
        		if(step.PPW_DOC_NO){
        			goDel += step.id+",";
        		}
        		//查被依赖
        		$(step.beDependeds).each(function(depIndex,dep){
        			var ele = findItem(dep.id);
        			if(!ele) return true;
        			
        			var newDep = "";
        			ele = ele.element;
        			$(ele.depends.split(",")).each(function(numIndex,num){
        				var x = parseInt(num) - 1;
        				if(x == i) return true;
        				newDep += newDep + x + ",";
        			})
        			if(newDep == "")
        				ele.status = "STATUS_ACTIVE";
        			ele.depends = newDep;
        			
        		});
        		
        		//查依赖
        		$(step.depends.split(",")).each(function(numIndex,num){
        			var d = taskList[parseInt(num) - 1];
        			var idx = [];
        			if(!d) return true;
        			$(d.beDependeds).each(function(depIndex,dep){
        				if(dep.id != step.id) return true;
        				idx.push(depIndex);
        			})
        			$(idx).each(function(a,b){
        				d.beDependeds.splice(b,1);
        			})
        		})
        		taskList.splice(i, 1);
        		break;
        	}
        })
        
        var stepTemp = {};
		$(taskList).each(function(i,e){
			var id = e.isStep ? e.id : e.PROJECT_STEP;
			if(!stepTemp[id]){
				stepTemp[id]={
					minStart:new Date("2999-12-31 23:59:59").getTime(),
					maxEnd:0,
					sumCapacity:0,
					children:[],
					index:i
				};
			}else{
				stepTemp[id].sumCapacity += e.CAPATCITY;
	    		if(e.start < stepTemp[id].minStart)
	    			stepTemp[id].minStart = e.start;
	    		if(e.end > stepTemp[id].maxEnd)
	    			stepTemp[id].maxEnd = e.end;
	    		if(!e.isStep){
	    			stepTemp[id].children.push(e);
	    		}else{
	    			stepTemp[id].index = i;
	    		}
			}
			
		});
		
		for(prop in stepTemp){
			var cache = stepTemp[prop];
			var step = findItem(prop);
			
			step = step.element;
			step.start = cache.minStart;
			step.end = cache.maxEnd;
			step.duration = (cache.maxEnd - cache.minStart ) / (1000 * 60);
			step.progress = (((cache.sumCapacity+0.0) / step.total) * 100).toFixed(2);
			if(cache.children.length == 0){
				taskList.splice(cache.index,1);
			}
		}
		
		goDel = $.trim(goDel);
		
		var ganttTasks={
	                   	tasks:taskList,
	                   	selectedRow:0,
	                   	canWrite:true,
	                   	canWriteOnParent:true
	            };
		if(goDel.length == 0){
	        divHide("showProjectQuery", "showProjectQueryMask");
	        divHide("showProjectSelect", "showProjectSelectMask");
	        toLoadGanttData(ganttTasks);
        }else{
        	showLoading(true);
        	
        	var arg = {
        		"operator":"delete",
        		"ids":goDel
        	};
        	var url = "${path}buss/bussModel_exeFunc.ms?funcMId=f44ae4c30fa64f92ad57d0f0594dfcfd"	;
        	$.ajax({
            type:"POST",
            dataType:"json",
            url:url,
            data:arg,
            success:function(data){
				divHide("showProjectQuery", "showProjectQueryMask");
	        	divHide("showProjectSelect", "showProjectSelectMask");
	        	toLoadGanttData(ganttTasks);
	        	showLoading(false);
            },
            error:function(msg){
                showLoading(false);
            }
        });
        }
	}
	
	//判断任务是否有交叉
	function hasCross(taskId,stepId,isTip,isFull){
		var temp = [];
		var task = taskId.id ? taskId : getTask(taskId);
		
  		$(ge.tasks).each(function(idx,e){
  			if(!isFull && e.id == task.id) return true;
  			if(e.isStep) return true;
  			if(!isFull && e.PROJECT_STEP != stepId) return true;
  			temp.push(e);
  		});
  		
		if(!isFull){
	       	for(var i=0;i<temp.length;i++){
	   			var t = temp[i];
	   			var cross = false;
	   			cross |= task.start <= t.start && task.end >=t.end; // task.start t.start  t.end task.end
	   			cross |= task.start >= t.start && task.end <=t.end; // t.start task.start task.end t.end 
	   			cross |= task.start <= t.start && task.end <=t.end && task.end >=t.start;  // task.start t.start task.end t.end 
	   			cross |= task.start >= t.start && task.end >=t.end && task.start <= t.end; // t.start task.start t.end task.end 
	   			if( cross){
	   				if(isTip){
		   				var from = dateFormat(new Date(task.start),"yyyy-MM-dd hh:mm:ss")
		   				var to = dateFormat(new Date(task.end),"yyyy-MM-dd hh:mm:ss")
		   				var start = dateFormat(new Date(t.start),"yyyy-MM-dd hh:mm:ss");
		   				var end = dateFormat(new Date(t.end),"yyyy-MM-dd hh:mm:ss");
		   				var msg = "任务<span style='font-weight:bold'>"+task.name+"</span><br/>调整后的预计开工时间：<br/>"+ from +" ~ "+ to +"<br/>";
		   				msg+="与任务<span style='font-weight:bold'>"+t.name+"</span><br/>预计开工时间：<br/>"+start+"  ~  "+end+"<br/>有重叠";
		   				utilsFp.confirmIcon(1,"","","", "<dict:lang value='"+ msg +"' />",1,"400","300");
	   				}
	   				return true;
	   			}
	   		}
   		}else{
   			var from,to,start,end,cross;
   			for(var i=0;i<temp.length - 1;i++){
   				from = temp[i].start,to = temp[i].end;
   				for(var j=i+1;j< temp.length;j++){
   					start = temp[j].start,end = temp[j].end;
   					cross = false;
	   				cross |= start <= from && end >= to; // start from to end
	   				cross |= start >= from && end <= to; // from start end to 
	   				cross |= start <= from && end <= to && end >= from; // start from end to
	   				cross |= start >= from && end >= to && start <= to; // from start to end 
	   				
   					if (cross){
   						if(isTip){
   							from = dateFormat(new Date(temp[i].start),"yyyy-MM-dd hh:mm:ss")
		   					to = dateFormat(new Date(temp[i].end),"yyyy-MM-dd hh:mm:ss")
		   					start = dateFormat(new Date(temp[j].start),"yyyy-MM-dd hh:mm:ss");
		   					end = dateFormat(new Date(temp[j].end),"yyyy-MM-dd hh:mm:ss");
		   					var msg = "<dict:lang value="任务" /><span style='font-weight:bold'>"+temp[i].name+"</span><br/><dict:lang value="预计开工时间" />：<br/>"+ from +" ~ "+ to +"<br/>";
		   					msg+="<dict:lang value="与任务" /><span style='font-weight:bold'>"+temp[j].name+"</span><br/><dict:lang value="预计开工时间" />：<br/>"+start+"  ~  "+end+"<br/><dict:lang value="有重叠" />";
		   					utilsFp.confirmIcon(1,"","","", "<dict:lang value='"+ msg +"' />",1,"400","300");
   						}
   						return true;
   					}
   				}
   			}
   		}
   		
   		return false;
	}
	
	function hasSmallDepends(taskId,isTip){
		var temp = [];
		var task = taskId.id ? taskId : getTask(taskId);
		
		var isFail = false;
		$(task.beDependeds).each(function(i,e){
			var ele = getTask(e.id);
			if(task.start > ele.start){
				if(isTip){
					var tt=getTask(task.id);
					var msg = "<dict:lang value="前置任务" /><span style='font-weight:bold'>"+tt.name+"</span><br/><dict:lang value="预计开工时间" />：<br/>"+ from +" ~ "+ to +"<br/>";
		   			msg+="<dict:lang value="与任务" /><span style='font-weight:bold'>"+ele.name+"</span><br/><dict:lang value="预计开工时间" />：<br/>"+start+"  ~  "+end+"<br/><dict:lang value="要晚" />";
		   			utilsFp.confirmIcon(1,"","","", "<dict:lang value='"+ msg +"' />",1,"400","300");
				}
				isFail = true;
				return false;
			}
			return true;
		})
		return isFail;
	}
	
	//更新阶别
	function updateStep(t){
		var step = null;
		var minStart = new Date("2999-12-31 23:59:59").getTime(), maxEnd = 0 , sumCapacity = 0;
		
		$(ge.tasks).each(function(i,e){
			if(!e.isStep) return true;
			if(e.code != t.PROJECT_STEP ) return true;
			step = e;
			return false;
		})
		
		$(ge.tasks).each(function(i,e){
			if(e.PROJECT_STEP != step.code) return true;
			if(e.start < minStart)
    			minStart = e.start;
    		if(e.end > maxEnd)
    			maxEnd = e.end;
		});
		
		step.start = minStart;
   		step.end = maxEnd;
   		step.duration = (maxEnd - minStart ) / (1000 * 60);
   		step.hasChange = true;
	}
	
	//甘特图的移动和拉伸
	//在这里别去改task的时间（start,end,duration）,否则return false会失效
	function ganttDragAndResize(action,task_id,new_from_date,new_to_date){
		var task = getTask(task_id);
		if(task && task.isStep){
			return false;
		}else if("drop" == action || "stopResize" == action){
			
			if(parseInt(task.PROJECT_STATUS) != 0 ){
				showMessage(1,"<dict:lang value="只有开立的工单可以改变时间" />",true);
				return false;
			}
			
			if(!(task.MIN_START_DATE <=task.start && task.MAX_START_DATE>=task.end)){
				showMessage(1,"<dict:lang value="不能超过制令单时间" />",true);
				return false;
			}
			
			if(new_from_date.getTime() < getNow().getTime()){
					showMessage(1,"<dict:lang value="预计开工时间不能小于今天" />",true);
					return false;
			}
			
			if( "drop" == action){
				var temp = {
					id:task.id,
					isStep:false,
					start:new_from_date.getTime(),
					end:task.duration * 1000 *60 + new_from_date.getTime(),
					duration:task.duration,
					beDependeds:task.beDependeds
				}
				task.start = new_from_date.getTime();
				task.end = task.duration * 1000 *60 + task.start;
				task.hasChange = true;
				updateStep(task);
				return true;
			}
			
			if( "stopResize" == action){
				return false;
			}
		}
		return true;
	}
	
	//甘特图的画线
	function beforeLine(action,from_id,to_id){
		var from = getTask(from_id),to = getTask(to_id);
	
		if(from.isStep || to.isStep){
			return false;
		}
		
		to.hasChange = true;
		return true;
	}
	
	//甘特图的画线
	function afterLine(action,from_id,to_id){
		var from = getTask(from_id),to = getTask(to_id);
		
		var isFind = false;
		$(from.beDependeds).each(function(i,e){
			if(e.id != to.id) return true;
			isFind  = true;
			return false;
		});
		if(!isFind){
			var obj={id:to.id};
			obj.start = to.start ;
			obj.end = to.end;
			obj.duration = to.duration;
			from.beDependeds.push(obj);
		}
		to.hasChange = true;
	}
    
    function query(obj){
   		var url = "${path}buss/bussModel_exeFunc.ms?funcMId=f44ae4c30fa64f92ad57d0f0594dfcfd"	;
        var param={};
        var ids = "";
        
        param.operator='query';
        param.ppwStartDateBegin = $.trim($("#PPW_START_DATE_BEGIN").val());
        param.ppwStartDateEnd =  $.trim($("#PPW_START_DATE_END").val());
		param.orgId = $("#conditionForm td:eq(0) .dec #DATA_AUTH").data("value");

		if (param.ppwStartDateBegin.length == 0 || param.ppwStartDateEnd.length == 0){
			showMessage(1,"<dict:lang value="请选择预计开工时间" />",true);
			return;
		}else {
			var from = new Date(param.ppwStartDateBegin ).getTime();
			var to= new Date(param.ppwStartDateEnd).getTime();
			var now = getNow();
			
			if(to - from < 0){
				showMessage(1,"<dict:lang value="预计开工时间起始必须大于终止" />",true);
				return;
			}
			if ( ((to - from + 1000 ) /(24 * 3600 *1000)) > 366 ){
				showMessage(1,"<dict:lang value="预计开工时间不能超过一年" />",true);
				return;
			}
		}
			  
	    showLoading(true);
        $.ajax({
            type:"POST",
            dataType:"json",
            url:url,
            data:param,
            success:function(data){
            	var afterGetCache = function(){
            		selUnMonthProject = {};
            		data.ajaxMap.step = [];
			    	for (prop in stepCache){
			    		if(prop.indexOf("Step_")!=0) continue;
			    		data.ajaxMap.step.push(stepCache[prop]);
			    	}
			    	
			    	if(data.ajaxMap.project.length > 0){
				    	showNoStandartProject(data.ajaxMap);
				    	$(data.ajaxMap.project).each(function(proIndex,pro){
				    		selUnMonthProject["Project_"+pro.PPW_DOC_NO]=pro;
				    	});
				    	unMonthProjectAdd();
			    	}
			    	showLoading(false);
            	}
			 	if(!stepCache){
					initStepCache(afterGetCache);
				}else{
					afterGetCache();
				}
            },
            error:function(msg){
                showLoading(false);
            }
        });
    }
    
    
	$(function(){
		$("#PPW_START_DATE_BEGIN,#PPW_START_DATE_END").attr("disabled","disabled");
		$("#PPW_START_DATE_BEGIN,#PPW_START_DATE_END").attr("readonly","readonly");
		var from = getNow();
		var to = getNow();
		to.setMonth(to.getMonth()+1);
		to.setHours(23);
		to.setMinutes(59);
		to.setSeconds(59);
		to.setMilliseconds(999)
		$("#PPW_START_DATE_BEGIN").val(dateFormat(from,"yyyy-MM-dd hh:mm:ss"))
		$("#PPW_START_DATE_END").val(dateFormat(to,"yyyy-MM-dd hh:mm:ss"))
		setGanttLang();
		setCommonLang();
		setConditionForm();
		query();
		
	});
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
