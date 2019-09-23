<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="com.more.fw.core.common.method.CommMethod"%>
<%
String userId=CommMethod.getSessionUser().getId();
String userName=CommMethod.getSessionUser().getName();
%>
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
        
        .scroll2 table tr:nth-of-type(2n){
            background-color:#f0f4fd;
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
            <bu:func viewId="8b760bed42b444f987af296e9aca1177" />
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
                            <div class="datagrid-header-inner head2" id="datagrid-header-inner454cc1d04a9240f4868ccffb52793896">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable454cc1d04a9240f4868ccffb52793896" style="min-width:2000px">
                                    <s:set name="_$type" value="'view'" />
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td style="width:30px;text-align: center;"></td>
                                        <td style="width:30px;text-align: center;"></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="生产阶别"/></td>
                                        <td style="width:150px;text-align: center;"><dict:lang value="月排程单号"/></td>
                                        <td style="width:150px;text-align: center;"><dict:lang value="工单号"/></td>
                                        <td style="width:70px;text-align: center;"><dict:lang value="状态"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="机种"/></td>
                                        <td style="width:150px;text-align: center;"><dict:lang value="机种名称"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="计划数量"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="标准工时(S)"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="生产工时(H)"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="当前排产数量"/></td>
                                        <td style="width:120px;text-align: center;"><dict:lang value="当前排产工时(H)"/></td>
                                        <td style="width:120px;text-align: center;"><dict:lang value="已下达数量"/></td>
                                        <td style="width:130px;text-align: center;"><dict:lang value="预计开工时间"/></td>
                                        <td style="width:130px;text-align: center;"><dict:lang value="预计完工时间"/></td>
                                        <td style="width:130px;text-align: center;"><dict:lang value="计划交货时间"/></td>
                                        <td style="width:100px;text-align: center;"><dict:lang value="计划组"/></td>
                                        <td style="width:150px;text-align: center;"><dict:lang value="前置任务"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv454cc1d04a9240f4868ccffb52793896" onscroll="ajaxTableScroll(this,'454cc1d04a9240f4868ccffb52793896')">
                            <table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax454cc1d04a9240f4868ccffb52793896" style="min-width:2000px">
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
                <div style="height:calc(50% - 44px);background-color:#fff;margin-top:10px;">
                    <div id="workSpace" style="padding:0px;position:relative;height:100%;"></div>
                    <div id="explain" class="explain">
                        *<dict:lang value="状态说明"/>：
                        <span class="item"><img src="${path}buss/aps/week/gantt_img/start.png"><dict:lang value="开始"/></span>
                        <span class="item"><img src="${path}buss/aps/week/gantt_img/end.png"><dict:lang value="结束"/></span>
                        <span class="item"><span style="background-color:#aace36"></span><dict:lang value="产能使用率"/></span>
                        <span class="item"><span style="background-color:#999"></span><dict:lang value="非工作时间段"/></span>
                        <span class="item"><span style="background-color:#FF7F66"></span><dict:lang value="系数损耗产能"/></span>
                        <span class="item"><span style="background-color:#DC143C"></span><dict:lang value="换线时间段"/></span>
                        <span class="item"><span style="background-color:#f8b72d"></span><label id="sTrack"></label></span>
                        <span class="item"><span style="background-color:#4169E1"></span><label id="aTrack"></label></span>
                        <span class="item"><span style="background-color:#00BFFF"></span><label id="bTrack"></label></span>
                    </div>
                </div>
                <input type="hidden" name="tableCount" id="tableCount" value='2' />
            </form>
        </div>
    </div>
</div>
<%--下达编辑弹窗--%>
<div class="dialog-mask" id="backShadowTransmit" style="z-index:30000"></div>
<div class="dialog dialog-s1 ui-draggable ui-draggable-handle" id="frontTransmit" style="display:none;z-index:30001;margin-left:0px;left:calc(50% - 540px);top:calc(50% - 265px);width:1100px;height:480px;">
    <div class="dialog-hd">
        <h3 class="tit"><dict:lang value="下达"/></h3>
    </div>
    <a class="dialog-close" href="javascript:void(0);" onclick="divHide('frontTransmit', 'backShadowTransmit');"></a>
    <div class="dialog-bd-div" style="width:100%;height:500px;">
        <div class="optn optn_div">
            <!-- <button type="button" onclick="getAvaliablePlan()"><i class="ico ico-xdky"></i><dict:lang value="下达方案"/></button> -->
            <button type="button" onclick="saveTransmit();"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
            <button type="button" onclick="divHide('frontTransmit', 'backShadowTransmit');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
        </div>
        <div class="edit">
            <div class="bd">
                <div class="mod">
                    <div class="mod-hd">
                        <h3 class="tit" style="font-size:14px;"><dict:lang value="基本信息" /></h3>
                    </div>
                    <div class="mod-hd" style="height:150px;border-bottom:0;">
                        <table class="basic-table" >
                            <tbody>
                            <tr>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="工单号"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input type="text" id="colProjectId" class="input" readonly="readonly">
                                </td>
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
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="机种规格"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input type="text" id="colModelSpec" class="input" readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="计划数量"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input type="text" id="colPlanNum" class="input" readonly="readonly">
                                </td>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="已排产数量"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input type="text" id="colPlanedNum" class="input" readonly="readonly">
                                </td>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="预计开工时间"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input id="colExpStart" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" disabled="false">
                                </td>
                            </tr>
                            <tr>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="预计完工时间"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input id="colExpEnd" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" disabled="false">
                                </td>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="实际开工时间"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input id="colActStart" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" disabled="false">
                                </td>
                                <td class="name" style="width: 100px;text-align: right;"><dict:lang value="实际完工时间"/></td>
                                <td class="dec" style="width: 120px;text-align: left;">
                                    <input id="colActEnd" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" disabled="false">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="content1">
                        <div class="mod-hd">
                            <h3 class="tit" style="font-size:14px;"><dict:lang value="制令单信息" /></h3>
                        </div>
                        <div class="mod-hd" style="height:160px;border-bottom:0;">
                            <table class="basic-table" >
                                <tbody>
                                <tr>
                                    <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="线别"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <select id="colLine" name="colLine" class="dept_select"></select>
                                    </td>
                                    <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="生产面别"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <select id="colFace" name="colFace" class="dept_select"></select>
                                    </td>
                                    <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="轨道"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <select id="colTrack" name="colTrack" class="dept_select"></select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="预计开工时间"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <input id="colMoExpStart" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange="moExpStartChange()" data="">
                                    </td>
                                    <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="预计完工时间"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <input id="colMoExpEnd" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" disabled="false">
                                    </td>
                                    <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="排产数量"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <input type="text" id="colMoPlanNum" class="input">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="name" style="width: 100px;text-align: right;"><dict:lang value="下达人"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <input type="text" id="colOptEmp" empCode="" class="input" readonly="readonly">
                                    </td>
                                    <td class="name" style="width: 100px;text-align: right;"><dict:lang value="下达时间"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;">
                                        <input id="colOptTime" class="input WdateNomorl" onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" disabled="false">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="name" style="width: 100px;text-align: right;"><dict:lang value="备注"/></td>
                                    <td class="dec" style="width: 120px;text-align: left;padding-right:15px;" colspan="5">
                                        <textarea id="colRemark" class="isSubmit " style="width:100%;height:100%;"></textarea>
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
<%-- 可用方案弹出页面 --%>
<div class="dialog-mask" id="backShadowTransmitAva" style="z-index:30000"></div>
<div class="dialog dialog-s1" id="frontTransmitAva" style="display:none;z-index:30001;margin-left:0px;left:calc(50% - 300px);top:calc(50% - 200px);width:550px;height:400px;">
    <div class="dialog-hd">
        <h3 class="tit"><dict:lang value="下达方案"/></h3>
    </div>
    <a class="dialog-close" href="javascript:void(0);" onclick="closeTransmitAva();"></a>
    <div class="dialog-bd-div" style="width:100%;height:300px;">
        <div class="optn optn_div">
            <button type="button" onclick="setAvaliablePlan();"><i class="ico ico-save"></i><dict:lang value="确定"/></button>
            <button type="button" onclick="closeTransmitAva();"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
        </div>
        <div class="head1" style="height:31px;overflow:hidden;">
            <table class="dlist-table table-line" style="width: 100%;table-layout:fixed;">
                <thead id="exp_table_head">
                <tr>
                    <td style='width:30px; text-align:center;' ></td>
                    <td style='width:30px; text-align:center;' ></td>
                    <td style='width:150px; text-align:center;' ><dict:lang value='预计开始时间'/></td>
                    <td style='width:150px; text-align:center;' ><dict:lang value='预计结束时间'/></td>
                    <td style='width:150px; text-align:center;' ><dict:lang value='预计排产数量'/></td>
                </tr>
                </thead>
            </table>
        </div>
        <div style="overflow: auto;background-color: white;height: 100%;">
            <table class="dlist-table" style="width: 100%;table-layout:fixed;">
                <tbody id="exp_table_tbody" >

                </tbody>
            </table>
        </div>
    </div>
</div>
<%-- 甘特图放大弹出窗 --%>
<div class="dialog dialog-s1" id="frontGantt" style="display:none;z-index:30000;margin-left:0px;left:0px;top:0px;width:100%;height:100%;" >
    <div class="dialog-hd">
        <h3 class="tit"><dict:lang value="周排程"/></h3>
    </div>
    <a class="dialog-close" href="javascript:void(0);" onclick="ganttNarrow();"></a>
    <div class="dialog-bd-div" style="width:100%;height:calc(100% - 80px);">
        <div class="optn optn_div">
            <button type="button" onclick="deleteTask()"><i class="ico ico-sc"></i><dict:lang value="删除制令单"/></button>
            <button type="button" onclick="ganttZoomMin()"><i class="ico ico-dataToSmall"></i><dict:lang value="日期缩小"/></button>
            <button type="button" onclick="ganttZoomplus()"><i class="ico ico-dataToBig"></i><dict:lang value="日期放大"/></button>
            <button type="button" onclick="ganttNarrow()"><i class="ico ico-toSmall"></i><dict:lang value="缩小"/></button>
            <button type="button" onclick="reCalculate()"><i class="ico ico-jx"></i><dict:lang value="重新计算"/></button>
            <button type="button" onclick="ganttSave()"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
            <button type="button" onclick="query(this)"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
        </div>
        <div class="scroll1" style="height:100%;overflow:auto;">
            <div id="ganttEnlarge"></div>
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
    //备注：参与例外等时间计算的函数有--当前页面：calAvaliablePlanNum/ --i18nJs.js中：isSpecialDate/isSpecialTime ;作为记录避免添加特殊时间点的时候漏改
    //变量(周排程)

    var dataUrl;
    var paginationImpl = {};
    var parentLevel=0;//父级等级标识（暂时只有2个层级）
    var childLevel=1;//子级等级标识
    var insertFlag="insert";
    var updateFlag="update";
    var oneMinute=60000;//ms，一分钟毫秒数
    var ganttAdjustLang=[];//任务下达校验语言
    var messageLang=[];//提示框多语言
    var dependsType=["id2Name","name2Id"];//depends转换类型
    var transmitCheckId;//下达选择行ID
    var isActiveTransmitAutoCalEnd=true;//下达中是否启用自动计算结束时间
    var calAvaliableStart=null;//产能作用域起始时间
    var calAvaliableEnd=null;//产能作用域结束时间
    var changeTimePositionParam=["before","inside"];//换线时间位置
    //甘特图数据缓存
    var ganttTasks={
        tasks:[],
        selectedRow:0,
        canWrite:true,
        canWriteOnParent:true
    };//甘特图任务数据
    var taskId2NameInfo;//key - taskId;  value - taskName
    var taskName2IdInfo;//key - taskName;  value - taskId
    var transmitTask;//下达操作中的任务变量
    var transmitLineTask;//下达时,线体类型的任务变量
    var canPlanNum=0;//可排产数量
    var ganttStatus=["STATUS_ACTIVE","STATUS_DONE","STATUS_FAILED","STATUS_SUSPENDED","STATUS_UNDEFINED"];//甘特图任务状态
    //轨道标识
    var trackFlag=[];//A-单轨；B-双轨；S-单轨/AB轨
    //面别标识
    var faceFlag=[];//0-单面 1-正面 2-反面 3-阴阳面
    //甘特图高度
    var ganttAreaHeight = $(window).height() - 390;
    //界面加载函数
    $(function(){
        dataUrl=getDataUrl();

        //初始化
        initial();

        //加载甘特图UI
        loadGanttUI();

        //获取月排程信息
        getPlanInfo(null,null,true);
  
        //初始化甘特图控件多语言
        setGanttLang();

        //设置通用多语言
        setCommonLang();

        //校准界面控件属性
        adjustUI();

    });
    //初始化
    function initial(){
        //初始化语言变量
        setGanttAdjustLang();
        //初始化预计开始时间
        getSerachStart();
        //初始化轨道信息
        getTrackInfo();
        //初始化面别信息
        getFaceInfo();
        //绑定事件
        bindEvent();
    }
    //绑定事件
    function bindEvent(){
        //排产数量改变事件，置空预计开工时间和预计结束时间
        $("#colMoPlanNum").change(function(){
            try{
                var num=parseInt($(this).val().trim());
                //若输入的计划数量不为数值，则默认为0
                if(isNaN(num)){
                    $(this).val("0");
                    num=0;
                }
                //若输入的计划数量超出最大可排产数量，则自动修改为最大可排产数量
                if(num>parseInt(canPlanNum)){
                    $(this).val(canPlanNum);
                    num=parseInt(canPlanNum);
                }
                transmitTask.targetQty=num;
            }
            catch(error){
                $(this).val("0");
                transmitTask.targetQty=0;
            }
            isToCalEndTime();
        });
        //线别改变事件，置空预计开工时间和预计结束时间
        $("#colLine").change(function(){
            transmitTask.areaSn=$(this).val().trim();
            matchLineTask();
            lineChanging();
            isToCalEndTime();
        });
        //面别改变事件，置空预计开工时间和预计结束时间
        $("#colFace").change(function(){
            transmitTask.face=$(this).val().trim();
            transmitTask.faceName=getFaceName(transmitTask.face);
            //改变面别的时候重新计算可下达数量
            canPlanNum=getCanTransmitNum(transmitTask.planDocNum,transmitTask.face);
            $("#colMoPlanNum").val(canPlanNum);
            transmitTask.targetQty=canPlanNum;
            isToCalEndTime();
        });
        //轨道改变事件，置空预计开工时间和预计结束时间
        $("#colTrack").change(function(){
            transmitTask.track=$(this).val().trim();
            isToCalEndTime();
        });
    }
    //线别改变时改变对应的轨道
    function lineChanging(){
        try{
            //重新绑定轨道信息
            getEmptyOption($("#colTrack"));
            if(transmitLineTask==null) return;
            trackFlag.forEach(function(track,index,array){
                if(transmitLineTask.multiTrack=="Y" && track.flag=="S") return;
                if(transmitLineTask.multiTrack=="N" && (track.flag=="A" || track.flag=="B")) return;
                $("#colTrack").append("<option value='"+track.flag+"' class='select_name'>"+track.name+"</option>");
            });
            $("#colTrack").find("option[value='']").attr("selected",true);
            $("#colTrack_chosen").css("width","230px");
            $("#colTrack").trigger("chosen:updated");
        }
        catch(error){
            console.error(error);
        }
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
    //下达是根据月排程单号和面别计算可排产数量
    function getCanTransmitNum(monthDoc,face){
        try{
            var planNum=0;
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                async:false,
                data:{
                    opt:"getFaceCanPlanNum",
                    monthDoc:monthDoc,
                    face:face
                },
                success:function(data){
                    if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                        planNum=parseInt(data.ajaxList[0].CANPLAN) - monthDocTransimtBuffer(monthDoc,face);
                    }
                },
                error:function(error){
                    planNum=0;
                }
            });
            return planNum;
        }
        catch(error){
            console.error(error);
            return 0;
        }
    }
    //重置下达中线体下拉框搜索功能
    function resetDropSearch(id){
        //下达中的下拉框搜索
        $("#"+id).chosen("destroy");
        if($("#"+id+" option").size()>15){
            $("#"+id).chosen({search_contains: true});
                $("#"+id+"_chosen .chosen-search").css("display","block");
        }else{
            $("#"+id).chosen();
        }
    }
    //获取当前时间
    function getNowTimeStr(){
        var date=new Date();
        return date.format("yyyy-MM-dd HH:mm:ss");
    }
    //初始化语言变量
    function setGanttAdjustLang(){
        //提示语言
        ganttAdjustLang[0]="<dict:lang value='保存失败！'/>";
        ganttAdjustLang[1]="<dict:lang value='开始时间处于其他任务内！'/>";
        ganttAdjustLang[2]="<dict:lang value='结束时间处于其他任务内！'/>";
        ganttAdjustLang[3]="<dict:lang value='有任务处于当前排产期内！'/>";
        ganttAdjustLang[4]="<dict:lang value='线体剩余产能无法满足！'/>";
        ganttAdjustLang[5]="<dict:lang value='制令单预计开工时间不满足月排程单预计开工时间！'/>";
        ganttAdjustLang[6]="<dict:lang value='制令单预计完工时间不满足月排程单预计完工时间！'/>";
        ganttAdjustLang[7]="<dict:lang value='结束时间处于后段任务换线时间内！'/>";
        ganttAdjustLang[8]="<dict:lang value='前段任务结束时间处于当前任务换线时间内！'/>";
        ganttAdjustLang[9]="<dict:lang value='开始时间处于非工作时间内！'/>";
        ganttAdjustLang[10]="<dict:lang value='结束时间处于非工作时间内！'/>";
        ganttAdjustLang[11]="<dict:lang value='制令单预计开始时间大于线体测算开始时间！'/>";
        ganttAdjustLang[12]="<dict:lang value='制令单预计完工时间大于线体测算结束时间！'/>";
        ganttAdjustLang[13]="<dict:lang value='开始时间和结束时间不处于有效产能时间内！'/>";
        ganttAdjustLang[14]="<dict:lang value='开始时间不能小于当前时间！'/>";
        //弹出框多语言
        messageLang[0]="<dict:lang value='请先选择线别！'/>";
        messageLang[1]="<dict:lang value='请先选择面别！'/>";
        messageLang[2]="<dict:lang value='未维护标准工时！'/>";
        messageLang[3]="<dict:lang value='请选择一条记录！'/>";
        messageLang[4]="<dict:lang value='绑定线别信息异常！'/>";
        messageLang[5]="<dict:lang value='绑定生产面别异常！'/>";
        messageLang[6]="<dict:lang value='获取线体产能失败！'/>";
        messageLang[7]="<dict:lang value='未匹配到相应线体！'/>";
        messageLang[8]="<dict:lang value='获取标准工时异常！'/>";
        messageLang[9]="<dict:lang value='线别为空！'/>";
        messageLang[10]="<dict:lang value='生产面别为空！'/>";
        messageLang[11]="<dict:lang value='排产数量必须大于0！'/>";
        messageLang[12]="<dict:lang value='排产数量不能大于可排产数量！'/>";
        messageLang[13]="<dict:lang value='预计开工时间为空！'/>";
        messageLang[14]="<dict:lang value='预计完工时间为空！'/>";
        messageLang[15]="<dict:lang value='下达成功！'/>";
        messageLang[16]="<dict:lang value='下达失败！'/>";
        messageLang[17]="<dict:lang value='保存排程信息成功！'/>";
        messageLang[18]="<dict:lang value='保存甘特图信息失败！'/>";
        messageLang[19]="<dict:lang value='制令单不为开立状态，无法删除！'/>";
        messageLang[20]="<dict:lang value='删除成功！'/>";
        messageLang[21]="<dict:lang value='删除失败！'/>";
        messageLang[22]="<dict:lang value='制令单产能计算失败！'/>";
        messageLang[23]="<dict:lang value='工单预计完工时间小于当前时间，无法排产！'/>";
        messageLang[24]="<dict:lang value='存在后置任务，无法删除！'/>";
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
    //校准界面控件属性
    function adjustUI(){
        //设置计划开始时间未不可修改
        $("#PPW_START_DATE_BEGIN").attr("disabled","false");
        $("#PPW_START_DATE_END").attr("disabled","false");
        //设置轨道名称标识
        $("#sTrack").text(getTrackName(comSingleTrack));
        $("#aTrack").text(getTrackName(comATrackFlag));
        $("#bTrack").text(getTrackName(comBTrackFlag));
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
    //预计开工时间改变
    function moExpStartChange(){
        transmitTask.scheduleDate=$("#colMoExpStart").val();
        try{
            transmitTask.start=DateStr2Time(transmitTask.scheduleDate);
            isToCalEndTime();
        }
        catch(error){
            resetExpEnd();
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
    //是否进行结束时间计算
    function isToCalEndTime(){
        if(!isActiveTransmitAutoCalEnd){
            return;
        }
        if(transmitTask.areaSn!="" && transmitTask.face!="" && transmitTask.targetQty!="" && transmitTask.scheduleDate!="" && transmitTask.track!=""){
            calWorkTimeTransmit();
        }
        else {
            resetExpEnd();
        }
    }
    //下达中计算任务产能
    function calWorkTimeTransmit(){
        try {
            //计算标准工时
            getStandarTime();
            if(transmitTask.standarTime==-1){
                resetExpEnd();
                return false;
            }
            //计算产能(s)
            var workTime=parseInt((transmitTask.standarTime*transmitTask.targetQty/60).toFixed(0));
            //计算预计结束时间
            var dateSpan=computeEndByDurationSimple(transmitTask.start,workTime,transmitTask.areaSn);//调用i18nJs.js中的方法进行结束时间校准
            transmitTask.end=dateSpan+transmitTask.changeTimeSpan;//换线时间处于任务内部，产能跨度要加上换线时间
            transmitTask.dueDate=time2DateStr(transmitTask.end);
            transmitTask.duration=workTime+transmitTask.changeTime;
            transmitTask.realDuration=workTime;
            $("#colMoExpEnd").val(transmitTask.dueDate);
        }
        catch (error){
            // transmitTask.end=transmitTask.start;
            // transmitTask.dueDate=transmitTask.scheduleDate;
            // transmitTask.duration=0;
            // $("#colMoExpEnd").val(transmitTask.dueDate);
            showMessage(3,messageLang[22],false);
            return false;
        }
        return true;
    }
    //重置预计结束时间
    function resetExpEnd(){
        transmitTask.end=0;
        transmitTask.dueDate="";
        transmitTask.duration=0;
        $("#colMoExpEnd").val("");
    }
    //查询可用排产方案
    function getAvaliablePlan(){
        //校验是否已选择线体/面别
        if(transmitTask.areaSn==""){
            showMessage(1,messageLang[0],false);
            return;
        }
        if(transmitTask.face==""){
            showMessage(1,messageLang[1],false);
            return;
        }
        //若标准工时为空，则计算
        getStandarTime();
        if(transmitTask.standarTime==-1){
            showMessage(1,messageLang[2],false);
            return;
        }
        //获取方案
        //收集任务开始时间-结束时间
        var taskStartToEnd=[];
        var lineTask=null;
        ge.tasks.forEach(function(task,index,array){
            if(task.areaSn!=transmitTask.areaSn){
                return;
            }
            if(task.isLine){ //获取线体任务
                lineTask=task;
                return;
            }
            if(taskStartToEnd.length>0){
                for(var i=0,len=taskStartToEnd.length;i<len;i++){
                    if(task.start<taskStartToEnd[i].start){
                        taskStartToEnd.splice(i,0,{
                            start:task.start-task.changeTimeSpan, //+换线时间
                            end:task.end
                        });
                        break;
                    }
                    else {
                        if((len-1)==i){
                            taskStartToEnd.push({
                                start:task.start-task.changeTimeSpan, //+换线时间
                                end:task.end
                            });
                        }
                        else {
                            continue;
                        }
                    }
                }
            }
            else {
                taskStartToEnd.push({
                    start:task.start-task.changeTimeSpan,//+换线时间
                    end:task.end 
                });
            }
        });
        //若当前排产信息中不存在该线体,则取任务本身工单开始时间和结束时间进行比较
        if(lineTask==null){
            if(transmitLineTask!=null){
                lineTask=transmitLineTask;
            }
            else {
                if(matchLineTask()){
                    lineTask=transmitLineTask;
                    lineTask.start=transmitTask.projectStartTime;
                    lineTask.end=transmitTask.projectEndTime;
                }
                else{
                    lineTask=createGanttTask({start:transmitTask.projectStartTime,end:transmitTask.projectEndTime});
                }
            }
        }
        //计算有效时间段(需要考虑工单预计开工时间和预计结束时间)(要与当前时间节点校准，开始时间不能小于当前时间)
        var nowDate=new Date();
        var nowTime=nowDate.getTime();
        var availableStartDate=transmitTask.projectStartTime;
        var availableEndDate=transmitTask.projectEndTime;
        var dataHtml=[];
        var calStart;
        var calEnd;
        var rowIndex=0;
        var num=0;
        $("#exp_table_tbody").empty();
        //获取工单任务有效的开始时间和结束时间（线体有效时间范围和工单有效时间范围进行比较）
        availableStartDate=availableStartDate>lineTask.start?availableStartDate:lineTask.start;
        availableEndDate=availableEndDate>lineTask.end?lineTask.end:availableEndDate;
        //进行筛选
        if(taskStartToEnd.length>0)
        {
            taskStartToEnd.forEach(function(item,index,array){
                rowIndex=index+1;
                calStart=parseInt(availableStartDate);
                calEnd=parseInt(item.start)-oneMinute;
                //结束时间与有效结束时间校准
                calEnd=availableEndDate<calEnd?availableEndDate:calEnd;
                //开始时间和当前时间进行校准（不能小于当前时间）
                calStart=nowTime<calStart?calStart:nowTime;
                //计算可排产数量
                var num=calAvaliablePlanNum(lineTask,calStart,calEnd);
                if(calEnd>nowTime && calStart<calEnd && num>0){ //当有效时间段的结束时间小于当前时间时，不可排产
                    
                    //放入数据
                    dataHtml.push("<tr class='datagrid-row'>");
                    dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+rowIndex+"</td>");
                    dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='radio' name='avaliablePlanRadio'></td>");
                    dataHtml.push("<td class='datagrid-cell' style='width:150px; text-align:center;' colName='start'>"+time2DateStr(calStart)+"</td>");
                    dataHtml.push("<td class='datagrid-cell' style='width:150px; text-align:center;' colName='end'>"+time2DateStr(calEnd)+"</td>");
                    dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: center;' colName='num'>"+num+"</td>");
                    dataHtml.push("</tr>");
                }
                availableStartDate=parseInt(item.end)+oneMinute;//设置开始时间为任务结束时间+1m，为下次计算做准备
                //若当前为最后一个任务，则判定是否要计算剩余量
                if(index==array.length-1 && calEnd<availableEndDate){
                    calStart=availableStartDate;
                    calEnd=availableEndDate;
                    num=calAvaliablePlanNum(lineTask,calStart,calEnd);//计算可排产数量
                    if(calEnd>nowTime && num>0) //当有效时间段的结束时间小于当前时间时，不可排产
                    {
                        //满足条件后，开始时间和当前时间进行校准（不能小于当前时间）
                        calStart=nowTime<calStart?calStart:nowTime;
                        //放入数据
                        dataHtml.push("<tr class='datagrid-row'>");
                        dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+(rowIndex+1)+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='radio' name='avaliablePlanRadio'></td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px; text-align:center;' colName='start'>"+time2DateStr(calStart)+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px; text-align:center;' colName='end'>"+time2DateStr(calEnd)+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: center;' colName='num'>"+parseInt(((calEnd-calStart)/1000/transmitTask.standarTime).toString())+"</td>");
                        dataHtml.push("</tr>");
                    }
                }
            });
        }
        else {
            rowIndex=1;
            calStart=parseInt(availableStartDate);
            calEnd=parseInt(availableEndDate);
            //满足条件后，开始时间和当前时间进行校准（不能小于当前时间）
            calStart=nowTime<calStart?calStart:nowTime;
            //计算可排产数量
            var num=calAvaliablePlanNum(lineTask,calStart,calEnd);
            if(calEnd>nowTime && calStart<calEnd && num>0){ //当有效时间段的结束时间小于当前时间时，不可排产
                //放入数据
                dataHtml.push("<tr class='datagrid-row'>");
                dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;'>"+rowIndex+"</td>");
                dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;'><input type='radio' name='avaliablePlanRadio'></td>");
                dataHtml.push("<td class='datagrid-cell' style='width:150px; text-align:center;' colName='start'>"+time2DateStr(calStart)+"</td>");
                dataHtml.push("<td class='datagrid-cell' style='width:150px; text-align:center;' colName='end'>"+time2DateStr(calEnd)+"</td>");
                dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: center;' colName='num'>"+num+"</td>");
                dataHtml.push("</tr>");
            }
        }
        $("#exp_table_tbody").html(dataHtml.join(""));
        //展示列表
        openTransmitAva();
    }
    //回填可用排产方案
    function setAvaliablePlan(){
        var len=$("#exp_table_tbody :radio[name='avaliablePlanRadio']:checked").length;
        if(len==0 || len>1){
            showMessage(1,messageLang[3],false);
            return;
        }
        else {
            $("#exp_table_tbody :radio[name='avaliablePlanRadio']:checked").each(function(){
                var start= $(this).parents("tr").find("td[colName='start']").text();
                var end= $(this).parents("tr").find("td[colName='end']").text();
                var num= $(this).parents("tr").find("td[colName='num']").text();
                //排产数量校验
                var numChanged=false;//记录数量是否有改变，若建议数量改变，则要重新计算结束时间
                var canPlan=parseInt($("#colPlanNum").val())-parseInt($("#colPlanedNum").val());
                if(canPlan<parseInt(num)){
                    num=canPlan;
                    numChanged=true;
                }
                //赋值
                $("#colMoExpStart").val(start);
                $("#colMoExpEnd").val(end);
                $("#colMoPlanNum").val(num);
                //触发排产数量change事件
                $("#colMoPlanNum").trigger("change");
                $("#colMoExpStart").trigger("change");
                //给完工时间变量赋值
                var endDate=new Date(end);
                var dateSpan=endDate.getTime();
                transmitTask.end=dateSpan;
                transmitTask.dueDate=time2DateStr(transmitTask.end);
                transmitTask.duration=calDurationByNum(transmitTask.standarTime,num);
                $("#colMoExpEnd").val(transmitTask.dueDate);

                closeTransmitAva();
                //若排产数量与计划数量不符，则要重新计算结束时间
                if(numChanged){
                    $("#colMoPlanNum").trigger("change");
                }
            });
        }
    }
    //查询可排产方案时，计算可排产数量(扣除时间段内例外等时间的产能)
    //调用统一的特定时间算法进行计算
    function calAvaliablePlanNum(line,start,end){
        try{
            var num=0;
            var numSpcial=0;//特殊时间总跨度
            var unavaDuration=0;//特殊时间无效跨度
            var specialDuration=[];//存储特殊时间点：类型&跨度
            //初始化校验变量
            var specialCheck={
                date:new Date(start),
                endDate:new Date(start)
            };
            //校验(获取start-end时间段内的所有特定时间点)
            while(specialCheck.endDate.getTime()<=end){
                specialCheck=checkSpecialDate(specialCheck.date,line.areaSn);
                if([2,3,4,6].indexOf(specialCheck.type)>=0){
                    //判定特殊时间点类型的结束时间是否大于目标结束时间，若大于则特殊时间跨度要扣除无效部分
                    if(specialCheck.endDate.getTime()>end){
                        unavaDuration=(specialCheck.endDate.getTime()-end)/(1000*60);
                        specialCheck.duration=parseInt(specialCheck.duration)-unavaDuration;
                    }
                    specialDuration.push({
                        type:specialCheck.type,
                        duration:parseInt(specialCheck.duration)
                    });
                }
                specialCheck.endDate.setMinutes(specialCheck.endDate.getMinutes()+1);//结束时间向后推移1个时间精度
                specialCheck.date=specialCheck.endDate;
            }
            //算所有特殊时间跨度
            specialDuration.forEach(function(item,index,array){
                numSpcial+=parseInt(item.duration);
            });
            //计算可用排产数量
            num=((end-start)/(1000*60)-numSpcial)/parseInt((parseInt(transmitTask.standarTime)/60).toFixed(2));
            return parseInt(num.toFixed(0));
        }
        catch(error){
            console.error(error);
            return 0;
        }
    }
    //打开下达界面可用方案
    function openTransmitAva(){
        isActiveTransmitAutoCalEnd=false;
        divShow("frontTransmitAva","backShadowTransmitAva");
    }
    //关闭下达界面可用方案
    function closeTransmitAva(){
        isActiveTransmitAutoCalEnd=true;
        divHide("frontTransmitAva","backShadowTransmitAva");
    }
    //获取排程数据
    function getPlanInfo(page,record,isLoadgantt){
        //获取查询条件
        var dataAuth=$("#DATA_AUTH option:selected").val();
        var step=$("#PPW_STEP option:selected").val()
        var projectId=$("#PPW_PROJECT_ID_SHOW").val();
        var material=$("#PRODUCT_MATERIAL_SHOW").val();
        var startPlanTime=$("#PPW_START_DATE_BEGIN").val();
        var endPlanTime=$("#PPW_START_DATE_END").val();
        var data={};
        data.opt="getPlanInfo";
        data.dataAuth=dataAuth;
        data.step=step;
        data.projectId=projectId;
        data.material=material;
        data.startTime=startPlanTime;
        data.endTime=endPlanTime;
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
                //获取月排程信息
                $("#tbody_month_data").empty();//清空列表
                if(data!=null && typeof(data)!="undefined"){
                    var dataHtml=[];//保存数据文本
                    if(data.ajaxList!=null && data.ajaxList.length>0){
                        data.ajaxList.forEach(function(item,index,array){
                            dataHtml.push("<tr id='"+item.ID+"' class='datagrid-row'>");
                            dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center; text-overflow: ellipsis;' name='index'>"+(index+1)+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;text-overflow: ellipsis;' name='id'><input id='"+item.ID+"' type='radio' name='monthinfo'></td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: left;text-overflow: ellipsis;' name='PROJECT_STEP_TEXT'>"+item.PROJECT_STEP_TEXT+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: left;text-overflow: ellipsis;' name='PPW_DOC_NO'>"+item.PPW_DOC_NO+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: left;text-overflow: ellipsis;' name='PPW_PROJECT_ID'>"+item.PPW_PROJECT_ID+"</td>");
                            
                            var status=item.PROJECT_STATUS;
                            var colorSpan="";
                            if(status==0){
                                colorSpan="<span class='state' style='background-color:rgb(78, 157, 15);color:#FFFFFF;width:50px;text-overflow: ellipsis;'>"+item.PROJECT_STATUS_TEXT+"</span>";
                            }
                            else if(status==1){
                                colorSpan="<span class='state' style='background-color:rgb(0, 160, 233);color:#FFFFFF;width:50px;text-overflow: ellipsis;'>"+item.PROJECT_STATUS_TEXT+"</span>";
                            }
                            else if(status==2){
                                colorSpan="<span class='state' style='background-color:rgb(174, 174, 174);color:#FFFFFF;width:50px;text-overflow: ellipsis;'>"+item.PROJECT_STATUS_TEXT+"</span>";
                            }

                            dataHtml.push("<td class='datagrid-cell' style='width:70px;text-align: center;text-overflow: ellipsis;' name='PROJECT_STATUS_TEXT'>"+colorSpan+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: left;text-overflow: ellipsis;' name='PRODUCT_MATERIAL'>"+item.PRODUCT_MATERIAL+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: left;text-overflow: ellipsis;' name='CI_ITEM_NAME' title='"+item.CI_ITEM_NAME+"'>"+item.CI_ITEM_NAME+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: right;text-overflow: ellipsis;' name='PPW_TARGET_NUM'>"+item.PPW_TARGET_NUM+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: right;text-overflow: ellipsis;' name='CST_STANDARD_TIME'>"+item.CST_STANDARD_TIME+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: right;text-overflow: ellipsis;' name='PRODUCT_TIME'>"+item.PRODUCT_TIME+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: right;text-overflow: ellipsis;' name='PPW_NOW_NUM'>"+item.PPW_NOW_NUM+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:120px;text-align: right;text-overflow: ellipsis;' name='PPW_NOW_PRODUCT_TIME'>"+item.PPW_NOW_PRODUCT_TIME+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:120px;text-align: right;text-overflow: ellipsis;' name='TRANSMIT_NUM'>"+item.TRANSMIT_NUM+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:130px;text-align: left;text-overflow: ellipsis;' name='PPW_START_DATE'>"+item.PPW_START_DATE+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:130px;text-align: left;text-overflow: ellipsis;' name='PPW_END_DATE'>"+item.PPW_END_DATE+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:130px;text-align: left;text-overflow: ellipsis;' name='PPW_DELIVERY_DATE'>"+(item.PPW_DELIVERY_DATE==null?"":item.PPW_DELIVERY_DATE)+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: right;text-overflow: ellipsis;' name='PPW_GROUP'>"+item.PPW_GROUP+"</td>");
                            dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: center;text-overflow: ellipsis;' name='PPW_PRE_TASK'>"+item.PPW_PRE_TASK+"</td>");
                            dataHtml.push("</tr>");
                        });
                        $("#tbody_month_data").html(dataHtml.join(""));
                    }
                }
                pageFun(data.ajaxPage,"formId1");
                defTableWidthRewrite("454cc1d04a9240f4868ccffb52793896");
                if(isLoadgantt){
                    //获取甘特图信息
                    setGanttInfo();
                }
                else {
                    showLoading(false);
                }
            },
            error:function(msg){
                showLoading(false);
            }
        });

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
    //获取数据接口URL
    function getDataUrl(){
        return "${path}buss/bussModel_exeFunc.ms?funcMId=1d6d0035309f4db2ba86243e762b2ef0";
    }
    //查询
    function query(paginationImpl,flag){
        var currentPage;
        var pageRecord;
        try{
            currentPage=_GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
            pageRecord=_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
        }
        catch(error){
            currentPage=_GLO_FORM_PAGE_MAP["formId1"].currentPage;
            pageRecord=_GLO_FORM_PAGE_MAP["formId1"].pageRecord;
        }
        var isFirstLoad=false;
        try{
            isFirstLoad = firstLoadThisPage(paginationImpl);
        }
        catch(error){
            isFirstLoad = firstLoadThisPage("formId1");
        }
        var isLoadGantt=typeof(flag)!="undefined"?flag:(isFirstLoad?true:false);
        try{
            if($(paginationImpl).length>0){
                isLoadGantt=true;
            }
        }
        catch(error){}
        getPlanInfo(currentPage,pageRecord,isLoadGantt);
    }
    //加载排程信息
    function setGanttInfo(){
        //ge.loadProject(_vardata);
        //ge.checkpoint();

        //获取查询条件
        var dataAuth=$("#DATA_AUTH option:selected").val();
        var step=$("#PPW_STEP option:selected").val()
        var projectId=$("#PPW_PROJECT_ID_SHOW").val();
        var material=$("#PRODUCT_MATERIAL_SHOW").val();
        var startPlanTime=$("#PPW_START_DATE_BEGIN").val();
        var endPlanTime=$("#PPW_START_DATE_END").val();
        //获取轨道信息
        getTrackInfo();
        //获取参数
        var data={};
        data.opt="getWeekGantt";
        data.dataAuth=dataAuth;
        //data.step=step;
        //data.projectId=projectId;
        //data.material=material;
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
                var moDuration=0;//每个任务使用的产能（非线体类型任务）（可能包括换线时间）
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
                            face:moNumber.PM_PROCESS_FACE,
                            faceName:getFaceName(moNumber.PM_PROCESS_FACE),
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
                            multiTrack:lineInfo.lineParams.CA_TRACK_FLAG,
                            track:moNumber.PM_TRACK,
                            trackName:getTrackName(moNumber.PM_TRACK),
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
    //获取面别名称
    function getFaceName(face){
        try{
            var faceName="";
            for(var i=0,len=faceFlag.length;i<len;i++){
              if(face==faceFlag[i].flag){
                faceName=faceFlag[i].name;
                break;
              }
            }
            return faceName;
        }
        catch(error){
            console.error(error);
        }
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
    //加载甘特图UI
    function loadGanttUI(){
        //load templates
        $("#ganttemplates").loadTemplates();
        // here starts gantt initialization
        ge = new GanttMaster();
        var workSpace = $("#workSpace");
        ge.init(workSpace);
        //overwrite with localized ones
        loadI18n();
    }
    //计算持续时间,根据开始时间和结束时间计算(进度分钟m)
    function calDuration(start,end){
        var calDiff=end-start;
        return calDiff/(1000*60);
    }
    //计算持续时间,根据标准工时(s)和计划数量计算(进度分钟m)
    function calDurationByNum(standarTime,num){
        var workTime=(standarTime*num/60).toFixed(0);
        return parseInt(workTime);
    }
    //时间字符串状态time
    function DateStr2Time(datestr){
        var date=new Date(datestr);
        return date.getTime();
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
    //撤销
    function ganttUndo(){
        $('#workSpace').trigger('undo.gantt');
    }
    //恢复
    function ganttRedo(){
        $('#workSpace').trigger('redo.gantt');
    }
    //日期放大
    function ganttZoomMin(){
        $('#workSpace').trigger('zoomMinus.gantt');
    }
    //日期缩小
    function ganttZoomplus(){
        $('#workSpace').trigger('zoomPlus.gantt');
    }
    //下达
    function ganttTransmit(){
        //判定是否有选中的工单
        var checkBox=$("#tbody_month_data :radio[name='monthinfo']:checked");
        var len=checkBox.length;
        if(len<=0 || len>1){
            showMessage(1,messageLang[3],false);
            return false;
        }
        //判定月排程工单结束时间是否合法（大于当前时间点）
        var end=$(checkBox[0]).closest("tr").find("[name='PPW_END_DATE']")[0];
        var nowTime=(new Date()).getTime();
        var endTime=DateStr2Time(end.innerText);
        if(nowTime>=endTime){
            showMessage(1,messageLang[23],false);
            return false;
        }
        //显示下达界面
        divShow("frontTransmit","backShadowTransmit");
        isActiveTransmitAutoCalEnd=true;
        //获取月排程信息ID
        transmitCheckId=checkBox[0].getAttribute("id");
        //获取工单信息
        $.ajax({
            type:"post",
            dataType:"json",
            url:dataUrl,
            data:{
                opt:"getExpectInfo",
                dataid:transmitCheckId
            },
            success:function(data){
                if(data==null || data.ajaxList==null || data.ajaxList.length<=0){
                    return;
                }
                //设置基本信息
                var dataList=data.ajaxList[0];
                $("#colProjectId").val(dataList.PROJECT_ID);
                $("#colStatus").val(dataList.STATUS);
                $("#colStepCode").val(dataList.PROJECT_STEP);
                $("#colStep").val(dataList.STEP);
                $("#colModelCode").val(dataList.PRODUCT_MATERIAL);
                $("#colModelName").val(dataList.PRODUCT_NAME);
                $("#colModelSpec").val(dataList.PRODUCT_STANDARD);
                $("#colPlanNum").val(dataList.PLAN_NUM);
                $("#colPlanedNum").val(dataList.PLANED_NUM);
                $("#colExpStart").val(dataList.PROLEPSIS_START_DATE);
                $("#colExpEnd").val(dataList.PROLEPSIS_END_DATE);
                $("#colActStart").val(dataList.ACTUAL_START_DATE);
                $("#colActEnd").val(dataList.TPPB_PLAN_DELIVERY_DATE);
                //绑定制令单信息
                //记录可排产数量
                //canPlanNum=parseInt(dataList.CANPLAN)-monthDocTransimtBuffer(dataList.PPW_DOC_NO);
                canPlanNum=0;
                //绑定线别信息
                $.ajax({
                    type:"post",
                    dataType:"json",
                    url:dataUrl,
                    data:{
                        opt:"getLineInfo",
                        step:dataList.PROJECT_STEP
                    },
                    success:function(data){
                        getEmptyOption($("#colLine"));
                        if(data!=null && data.ajaxList.length>0){
                            data.ajaxList.forEach(function(item,index,array){
                                $("#colLine").append("<option value='"+item.CA_ID+"' class='select_name'>"+item.CA_NAME+"</option>");
                            });
                        }
                        $("#colLine").find("option[value='']").attr("selected",true);
                        $("#colLine").trigger("chosen:updated");
                        resetDropSearch("colLine");
                        $("#colLine_chosen").css("width","230px");
                        
                    },
                    error:function(error){
                        showMessage(3,messageLang[4],false);
                    }
                });
                //绑定生产面别
                getEmptyOption($("#colFace"));
                faceFlag.forEach(function(face,index,array){
                    $("#colFace").append("<option value='"+face.flag+"' class='select_name'>"+face.name+"</option>");
                });
                $("#colFace").find("option[value='']").attr("selected",true);
                $("#colFace_chosen").css("width","230px");
                $("#colFace").trigger("chosen:updated");
                //绑定轨道
                getEmptyOption($("#colTrack"));
                trackFlag.forEach(function(track,index,array){
                    $("#colTrack").append("<option value='"+track.flag+"' class='select_name'>"+track.name+"</option>");
                });
                $("#colTrack").find("option[value='']").attr("selected",true);
                $("#colTrack_chosen").css("width","230px");
                $("#colTrack").trigger("chosen:updated");
                //自动计算可排产数量
                $("#colMoPlanNum").val(canPlanNum);
                //清空开始时间和结束时间
                $("#colMoExpStart").val("");
                $("#colMoExpEnd").val("");
                //填入下达时间和下达人
                var empCode="<%=userId%>";
                var optTime=getNowTimeStr();
                $("#colOptEmp").val("<%=userName%>");
                $("#colOptEmp").attr("empCode",empCode);
                $("#colOptTime").val(optTime);
                //初始化备注
                $("#colRemark").val("");
                //初始化下达任务
                transmitLineTask=null;
                transmitTask=createGanttTask({
                    //插件必要属性
                    id:-1,
                    level:childLevel,
                    status:ganttStatus[0],
                    start:0,
                    duration:0,
                    end:0,
                    startIsMilestone:false,
                    endIsMilestone:false,
                    hasChild:false,
                    collapsed:false,
                    //制令单必要属性
                    //制令单表属性
                    taskGuid:Math.uuid(),
                    projectId:dataList.PROJECT_ID,
                    step:dataList.PROJECT_STEP,
                    modelCode:dataList.PRODUCT_MATERIAL,
                    modelName:dataList.PRODUCT_NAME,
                    targetQty:dataList.CANPLAN,
                    dataAuth:dataList.DATA_AUTH,
                    issuedEmp:empCode,
                    issuedDate:optTime,
                    pmStatus:"0",
                    planId:transmitCheckId,
                    productCount:dataList.PRODUCT_COUNT,
                    planedNum:0,
                    memo:"",
                    planDocNum:dataList.PPW_DOC_NO,
                    //非制令单表属性
                    statusName:"开立",
                    isLine:false,
                    isChanged:true,//任务是否发生改变(暂时为true,后期进行管控)
                    taskOpt:insertFlag,
                    projectStartDate:dataList.PROLEPSIS_START_DATE,
                    projectEndDate:dataList.PROLEPSIS_END_DATE,
                    projectDelvDate:dataList.TPPB_PLAN_DELIVERY_DATE,
                    changeTimePosition:changeTimePositionParam[1]
                });
            },
            error:function(error){}
        });
    }
    //下达保存是匹配线体类型任务信息/筛选可用方案
    function matchLineTask(){
        //初始化线体变量
        transmitLineTask=null;
        //匹配现有线体
        for(var i=0,len=ge.tasks.length;i<len;i++){
            if(ge.tasks[i].areaSn==transmitTask.areaSn && ge.tasks[i].isLine){
                transmitLineTask=ge.tasks[i];
                break;
            }
        }
        if(transmitLineTask==null){
            //未匹配到,则重新获取线体产能
            var dataAuth=$("#DATA_AUTH option:selected").val();
            var startPlanTime=$("#PPW_START_DATE_BEGIN").val();
            var endPlanTime=$("#PPW_START_DATE_END").val();
            $.ajax({
                type:"post",
                dataType:"json",
                async:false,
                url:dataUrl,
                data:{
                    opt:"getSingleLineWorkTime",
                    dataAuth:dataAuth,
                    startPlanTime:startPlanTime,
                    endPlanTime:endPlanTime,
                    line:transmitTask.areaSn
                },
                success:function(data){
                    //收集线体信息
                    var lines=[];
                    $.each(data.areaSn,function(key,value){
                        lines.push({
                            lineSn:key,
                            lineParams:value
                        });
                    });
                    if(lines.length<=0){
                        return;
                    }
                    transmitLineTask=createGanttTask({
                        //插件必要属性
                        name:lines[0].lineParams.CA_NAME,
                        level:parentLevel,
                        status:ganttStatus[2],
                        hasChild:false,
                        collapsed:false,
                        start:lines[0].lineParams.LINE_START_TIME.time,
                        end:lines[0].lineParams.LINE_END_TIME.time,
                        duration:data.availableTime[lines[0].lineSn],
                        //制令单必要属性
                        //制令单表属性
                        areaSn:lines[0].lineSn,
                        multiTrack:lines[0].lineParams.CA_TRACK_FLAG,
                        //非制令单表属性
                        isLine:true,
                        isChanged:false,//任务是否发生改变
                        //产能(针对线体)
                        availableWorkTime:data.availableTime[lines[0].lineSn],
                        usedWorkTime:0,
                        isSat:data.areaSn[lines[0].lineSn].PPC_SAT_FLAG,
                        isSun:data.areaSn[lines[0].lineSn].PPC_SUN_FLAG,
                        lostTimebyCoe:data.areaSn[lines[0].lineSn].LINE_TIME_LOST_BY_COE,
                        //工厂日历时间段
                        workTimeInfo:getCalWorkTimeInfo(data.dayWorkTimeInfo[lines[0].lineSn]),
                        restTimeInfo:getCalRestTimeInfo(data.dayRestTimeInfo[lines[0].lineSn]),
                        //例外时间
                        exceptionTimeInfo:getExceptionTimInfo(data.exceptionInfo[lines[0].lineSn])
                    });
                    //记录线体特殊时间点
                    setLineSpecialTime({
                        areaSn:transmitLineTask.areaSn,
                        workTime:transmitLineTask.workTimeInfo,
                        restTime:transmitLineTask.restTimeInfo,
                        exceptionTime:transmitLineTask.exceptionTimeInfo,
                        isSat:transmitLineTask.isSat,
                        isSun:transmitLineTask.isSun
                    });
                },
                error:function(error){
                    showMessage(3,messageLang[6],false);
                }
            });
            if(transmitLineTask==null){
                return false;
            }
        }
        if(transmitLineTask==null){
            showMessage(1,messageLang[7],false);
            return false;
        }
        else {
            return true;
        }
    }
    //保存下达信息2
    //返回标识：1-下达成功 2-下达失败 3-下达校验失败
    function ganttSaveTransmit(){
        try{
            //获取制令单号
            transmitTask.moNumber=getMonumber();
            if(transmitTask.moNumber==null){
                return;
            }        

            transmitTask.name=transmitTask.moNumber;
            transmitTask.planTime=((transmitTask.targetQty*transmitTask.standarTime)/3600).toFixed(2);
            transmitTask.multiTrack=transmitLineTask.multiTrack;
            //获取线体信息
            var lineSn=$("#colLine").val().trim();//获取线别
            var lineName=$("#colLine").find("option:selected").text();
            //获取线别当前任务最大索引
            var maxIndex=-1;
            ge.tasks.forEach(function(task,index,arrray){
                if(task.areaSn==lineSn && task.isLine){
                    maxIndex=task.lineMaxSeq;
                    return;
                }
            });
            //备注信息赋值
            transmitTask.memo=$("#colRemark").val();
            //保存制令单信息
            /*showLoading(true);
            var isSaveMoSuc=false;
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                async:false,
                data:{
                    opt:"saveTransmit",
                    tasks:JSON.stringify([createMonumber(transmitTask)]),
                    planId:transmitCheckId
                },
                success:function(data){
                    if(data){
                        isSaveMoSuc=data;
                    }
                    else {
                        showLoading(false);
                    }
                },
                error:function(error){
                    alert(error);
                }
            });
            if(!isSaveMoSuc){
                showLoading(false);
                return;
            }*/
            //transmitTask.taskOpt=updateFlag;//修改任务状态为更新
            //修改线体已用产能
            transmitLineTask.usedWorkTime=transmitLineTask.usedWorkTime+transmitTask.duration+transmitTask.changeTime;//已使用产能+新制令单产能+换线时间
            transmitLineTask.progress=calProgress(transmitLineTask.usedWorkTime,transmitLineTask.availableWorkTime);
            //重新加载ge中的任务到ganttTasks中
            getLastGanttTaskStaus();
            //生成task数据
            if(maxIndex==-1){ //若没找到对应的线体，则在任务队列末尾添加新线体数据
                maxIndex=ganttTasks.tasks.length+1;
                transmitLineTask.id=maxIndex;
                transmitLineTask.lineMaxSeq=maxIndex+1;
                ganttTasks.tasks.push(transmitLineTask);
                referenceId2Name(maxIndex,lineName);//记录name和id的关联关系
                //添加子任务
                transmitTask.id=maxIndex+1;
                ganttTasks.tasks.push(transmitTask);
                referenceId2Name(transmitTask.id,transmitTask.name);//记录name和id的关联关系
            }
            else
            {
                //插入任务到当前线体子任务最大索引处
                transmitTask.id=maxIndex+1;
                ganttTasks.tasks.splice(maxIndex,0,transmitTask);
                transmitLineTask.lineMaxSeq=transmitTask.id;
                referenceId2Name(transmitTask.id,transmitTask.name);//记录name和id的关联关系
                //处理最大索引之后的所有任务的ID
                var varId=[]; // key-old id ; value-new id
                var varTask;
                for(var i=0,iLen=ganttTasks.tasks.length;i<iLen;i++){
                    varTask=ganttTasks.tasks[i];
                    if(i<maxIndex+1){
                        varId[varTask.id]=varTask.id;
                    }
                    else {
                        varId[varTask.id]=varTask.id+1;
                        ganttTasks.tasks[i].id=varTask.id+1;
                        referenceId2Name(varTask.id,varTask.name);//记录name和id的关联关系
                    }
                    if(varTask.id==transmitLineTask.id){
                        ganttTasks.tasks[i]=transmitLineTask;
                    }
                }
                //处理所有前置任务
                var ganttDepands;
                for(var j=0,jLen=ganttTasks.tasks.length;j<jLen;j++){
                    varTask=ganttTasks.tasks[j];
                    if(varTask.depends!=null && varTask.depends!=""){
                        ganttDepands="";
                        varTask.depends.split(",").forEach(function(dep,index,array){
                            if(dep==null || dep==""){
                                return;
                            }
                            ganttDepands+=ganttDepands==""?varId[dep]:","+varId[dep];
                        });
                        ganttTasks.tasks[j].depends=ganttDepands;
                    }
                }
            }
            toLoadGanttData(ganttTasks);
            if(ganttTasks.tasks.length!=ge.tasks.length){
                //重新加载ge中的任务到ganttTasks中
                getLastGanttTaskStaus();
                return 3;
            }
            //query('formId1',false);
            return 1;
        }
        catch(error){
            showLoading(false);
            return 2;
        }
    }
    //同步甘特图中任务的最新状态到ganttTasks中
    function getLastGanttTaskStaus(status){
        try{
            ganttTasks.tasks=[];
            ge.tasks.forEach(function(task,index,array){
                if(typeof(status)!="undefined"){
                    task.taskOpt=status;
                }
                task.moInserting=false;
                ganttTasks.tasks.push(createGanttTask(task));
            });
        }
        catch(error){
            console.error(error);
        }
    }
    //获取制令单号
    function getMonumber(){
        var monumber=null;
        $.ajax({
            type:"post",
            dataType:"json",
            async:false,
            url:dataUrl,
            data:{
                opt:"getMonumber",
                projectId:transmitTask.projectId,
                step:transmitTask.step,
                face:transmitTask.face,
                existBufferDoc:existMonumberInBuffer(transmitTask.projectId,transmitTask.step,transmitTask.face)
            },
            success:function(data){
                if(data!=null && data.ajaxList!=null && data.ajaxList.length>0){
                    monumber=data.ajaxList[0].moNumber;
                }
            },
            error:function(error){}
        });
        return monumber;
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
    //记录线体特殊时间点
    function setLineSpecialTime(special){
        setInnerSpecial(special);
    }
    //获取标准工时
    function getStandarTime(){
        var itemCode=$("#colModelCode").val().trim();
        var face=$("#colFace").val().trim();
        var line=$("#colLine").val().trim();
        var step=$("#colStepCode").val().trim();
        var track=$("#colTrack").val().trim();

        if(itemCode==null || typeof(itemCode)=="undefined" || itemCode==""){
            return;
        }
        else if(face==null || typeof(face)=="undefined" || face==""){
            return;
        }
        else if(line==null || typeof(line)=="undefined" || line==""){
            return;
        }
        else if(step==null || typeof(step)=="undefined" || step==""){
            return;
        }
        else if(track==null || typeof(track)=="undefined" || track==""){
            return;
        }
        $.ajax({
            type:"post",
            dataType:"json",
            url:dataUrl,
            async:false,
            data:{
                opt:"getStandarTime",
                itemCode:itemCode,
                face:face,
                line:line,
                step:step,
                track:track
            },
            success:function(data){
                if(data!=null && data.ajaxList.length>0){
                    transmitTask.standarTime=data.ajaxList[0].CST_STANDARD_TIME;
                    transmitTask.changeTime=data.ajaxList[0].CST_CHANGE_TIME;
                    transmitTask.changeTimeSpan=transmitTask.changeTime*60*1000;
                }
                else {
                    transmitTask.standarTime=-1;
                    transmitTask.changeTime=0;
                }
            },
            error:function(error){
                showMessage(3,messageLang[8],false);
                transmitTask.standarTime=-1;
                transmitTask.changeTime=0;
            }
        });
    }
    //校验下达信息
    function validateTransmit(){
        if(transmitTask.areaSn==""){
            showMessage(1,messageLang[9],false);
            return false;
        }
        else if(transmitTask.face==""){
            showMessage(1,messageLang[10],false);
            return false;
        }
        else if(transmitTask.targetQty=="" || isNaN(parseInt(transmitTask.targetQty)) || transmitTask.targetQty=="0"){
            showMessage(1,messageLang[11],false);
            return false;
        }
        else if(parseInt(transmitTask.targetQty)>canPlanNum){
            showMessage(1,messageLang[12]+"("+canPlanNum+")",false);
            return false;
        }
        else if(transmitTask.scheduleDate==""){
            showMessage(1,messageLang[13],false);
            return false;
        }
        else if(transmitTask.standarTime=="" || transmitTask.standarTime==-1){
            showMessage(1,messageLang[2],false);
            return false;
        }
        else if(transmitTask.dueDate==""){
            showMessage(1,messageLang[14],false);
            return false;
        }

        return true;
    }
    //初始化预计开工时间
    function getSerachStart(){
        var d=new Date();
        $("#PPW_START_DATE_BEGIN").val(d.format("yyyy-MM-dd 00:00:00"));
        calAvaliableStart=new Date(d.format("yyyy-MM-dd 00:00:00"));
        d.setDate(d.getDate()+6);
        $("#PPW_START_DATE_END").val(d.format("yyyy-MM-dd 23:59:59"));
        calAvaliableEnd=new Date(d.format("yyyy-MM-dd 23:59:59"));
    }
    //下达保存时，校验排产方案是否合法
    function isTransmitPlanIegal(){
        // 1-开始时间处于其他任务内;
        // 2-结束时间处于其他任务内;
        // 3-有任务处于当前排产期内;
        // 4-线体剩余产能无法满足;
        // 5-起始时间不满足月排程单开始时间
        // 6-结束时间不满足月排程单结束时间
        // 7-判定结束时间是否处于后段任务换线时间内
        // 8-前段任务结束时间处于当前任务换线时间内
        // 9-开始时间处于非工作时间内
        // 10-结束时间处于非工作时间内
        // 11-开始时间小于线体测算开始时间
        // 12-结束时间大于线体测算结束时间
        // 13-开始时间和结束时间不处于有效产能时间内
        // 14-开始时间不能小于当前时间
        var adjustFlag=[];
        //校验时间是否处于线体测算作用域
        if(transmitTask.start<transmitLineTask.start){
            if(adjustFlag.indexOf(11)==-1){
                adjustFlag.push(11);
            }
            showMessage(1,ganttAdjustLang[11],false);
            return false;
        }
        if(transmitTask.end>transmitLineTask.end){
            if(adjustFlag.indexOf(12)==-1){
                adjustFlag.push(12);
            }
            showMessage(1,ganttAdjustLang[12],false);
            return false;
        }
        if(transmitTask.start<transmitLineTask.start && transmitTask.end>transmitLineTask.end){
            if(adjustFlag.indexOf(13)==-1){
                adjustFlag.push(13);
            }
            showMessage(1,ganttAdjustLang[13],false);
            return false;
        }
        //产能校验
        if((transmitTask.duration+transmitTask.changeTime)>(transmitLineTask.availableWorkTime-transmitLineTask.usedWorkTime))
        {
            if(adjustFlag.indexOf(4)==-1){
                adjustFlag.push(4);
            }
            showMessage(1,ganttAdjustLang[4],false);
            return false;
        }
        //开始时间和结束时间是否处于非工作时间内
        if(isSpecialTime(transmitTask.start,transmitTask.areaSn)){
            if(adjustFlag.indexOf(9)==-1){
                adjustFlag.push(9);
            }
            showMessage(1,ganttAdjustLang[9],false);
            return false;
        }
        //开始时间和结束时间域校准(与月排产单开始时间和结束时间校准)
        // if(transmitTask.start<DateStr2Time(transmitTask.projectStartDate)){ //制令单的开始时间允许小于月排产单的开始时间 2018-05-28 by cc
        //     if(adjustFlag.indexOf(5)==-1){
        //         adjustFlag.push(5);
        //     }
        //     showMessage(1,ganttAdjustLang[5],false);
        //     return false;
        // }
        if(transmitTask.end>DateStr2Time(transmitTask.projectEndDate)){
            if(adjustFlag.indexOf(6)==-1){
                adjustFlag.push(6);
            }
            showMessage(1,ganttAdjustLang[6],false);
            return false;
        }
        //开始时间不能小于当前时间
        if(transmitTask.start<(new Date()).getTime()){
            if(adjustFlag.indexOf(14)==-1){
                adjustFlag.push(14);
            }
            showMessage(1,ganttAdjustLang[14],false);
            return false;
        }
        //重叠时间域校验
        /*for(var i=0,len=ge.tasks.length;i<len;i++){
            if(ge.tasks[i].areaSn!=transmitTask.areaSn || ge.tasks[i].isLine){
                continue;
            }
            //校验起始时间&结束时间
            if(transmitTask.start>=ge.tasks[i].start && transmitTask.start<=ge.tasks[i].end){
                if(adjustFlag.indexOf(1)==-1){
                    adjustFlag.push(1);
                }
                showMessage(1,ganttAdjustLang[1],false);
                return false;
            }
            if(transmitTask.end>=ge.tasks[i].start && transmitTask.end<=ge.tasks[i].end){
                if(adjustFlag.indexOf(2)==-1){
                    adjustFlag.push(2);
                }
                showMessage(1,ganttAdjustLang[2],false);
                return false;
            }
            if(transmitTask.start<ge.tasks[i].start && transmitTask.end>ge.tasks[i].end){
                if(adjustFlag.indexOf(3)==-1){
                    adjustFlag.push(3);
                }
                showMessage(1,ganttAdjustLang[3],false);
                return false;
            }
            //判定结束时间是否处于后段任务换线时间内
            if(transmitTask.end>=(ge.tasks[i].start-ge.tasks[i].changeTimeSpan) && transmitTask.end<ge.tasks[i].start){
                if(adjustFlag.indexOf(7)==-1){
                    adjustFlag.push(7);
                }
                showMessage(1,ganttAdjustLang[7],false);
                return false;
            }
            //前段任务结束时间处于当前任务换线时间内
            if(ge.tasks[i].end>=(transmitTask.start-transmitTask.changeTimeSpan) && ge.tasks[i].end<transmitTask.start){
                if(adjustFlag.indexOf(8)==-1){
                    adjustFlag.push(8);
                }
                showMessage(1,ganttAdjustLang[8],false);
                return false;
            }
        }*/
        return true;
    }
    //保存下达信息1
    function saveTransmit(){
        //校验下达数据
        if(!validateTransmit()){
            return;
        }
        //匹配当前线体任务，若当前甘特图中没有存在，则重新获取对应线体的产能信息
        if(!matchLineTask()){
            return false;
        }
        //校验排产方案是否合法
        if(!isTransmitPlanIegal()){
            return false;
        }
        //前置面别校验
        if(!isPerFaceIegal()){
            return false;
        }
        //校验是否存在制具
        if(isManufacture()){
            transmitManufactureCallBack()
        }
        else {
            utilsFp.confirmIcon(1,"","transmitManufactureCallBack","", "<dict:lang value='无可用制具，是否继续？' />",1,"260","");
        }
    }
    //判定是否存在机子制具信息（校验SMT阶别）
    function isManufacture(){
        try{
            var isExist=false;
            if(transmitTask.step=="1"){ 
                $.ajax({
                    type:"post",
                    dataType:"json",
                    url:dataUrl,
                    async:false,
                    data:{
                        opt:"getManufacture",
                        itemCode:transmitTask.modelCode
                    },
                    success:function(data){
                        if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                            isExist=true;
                        }
                        else {
                            isExist=false;
                        }
                    },
                    error:function(error){
                        isExist=false;
                    }
                });
            }
            else {
                isExist=true;
            }
            
            return isExist;
        }
        catch(error){
            console.error(error);
        }
    }
    //判定是否存在前置面别/合法性
    function isPerFaceIegal(){
        try{
            var isSuc=true;
            //获取工艺信息
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                async:false,
                data:{
                    opt:"getPerFace",
                    itemCode:transmitTask.modelCode,
                    face:transmitTask.face              
                },
                success:function(data){
                    if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                      var techInfo=data.ajaxList[0];
                      transmitTask.perFace=techInfo.PER_FACE;
                      if(null!=transmitTask.perFace && ""!=transmitTask.perFace){
                          //校验数据库中是否存在前置面别的制令单，若存在，则校验当前制令单计划数量是否满足前置面别制令单数量
                          var perFacePlanCount=0;//前置面别制令单计划数量
                          var curFacePlanCount=0;//当前面别制令单计划数量
                          var beforePerFacePlanCount=0;//前置面别制令单计划数量(指定时间点之前)
                          var beforeCurFacePlanCount=0;//当前面别制令单计划数量(指定时间点之前)
                          //1、校验数据库中数据
                          $.ajax({
                            type:"post",
                            dataType:"json",
                            url:dataUrl,
                            async:false,
                            data:{
                                opt:"getCurOrPerFaceMoCount",
                                projectId:transmitTask.projectId,
                                currentFace:transmitTask.face,
                                perFace:transmitTask.perFace,
                                dataAuth:$("#DATA_AUTH option:selected").val(),
                                startTime:$("#PPW_START_DATE_BEGIN").val(),
                                endTime:$("#PPW_START_DATE_END").val()
                            },
                            success:function(dataMocount){
                              if(null!=dataMocount && null!=dataMocount.ajaxList && dataMocount.ajaxList.length>0){
                                perFacePlanCount+=parseInt(dataMocount.ajaxList[0].PER_FACE_COUNT);
                                curFacePlanCount+=parseInt(dataMocount.ajaxList[0].CUR_FACE_COUNT);
                                beforePerFacePlanCount+=parseInt(dataMocount.ajaxList[0].BF_PER_FACE_COUNT);
                                beforeCurFacePlanCount+=parseInt(dataMocount.ajaxList[0].BF_CUR_FACE_COUNT);
                              }
                            },
                            error:function(error){}
                          });
                          //2、校验缓存中数据
                          ge.tasks.forEach(function(task,index,array){
                              if(task.isLine && task.step!=transmitTask.step){
                                  return;
                              }
                              //缓存中前置面别总数量
                              if(task.projectId==transmitTask.projectId && task.face==transmitTask.perFace){
                                perFacePlanCount+=parseInt(task.targetQty);
                              }
                              //缓存中当前面别总数量
                              if(task.projectId==transmitTask.projectId && task.face==transmitTask.face){
                                curFacePlanCount+=parseInt(task.targetQty);
                              }
                              //缓存中指定时间点前 前置面别总数量
                              if(task.projectId==transmitTask.projectId && task.face==transmitTask.perFace && task.start<transmitTask.start){
                                //插单的时候会将交叉的任务后移，所以若task与transmitTask存在相交，则不算
                                if((transmitTask.start>=task.start && transmitTask.start<=task.end) 
                                || (transmitTask.end>=task.start && transmitTask.end<=task.end)
                                || (transmitTask.start>=task.start && transmitTask.end<=task.end)
                                || (transmitTask.start<=task.start && transmitTask.end>=task.end)){
                                }
                                else {
                                    beforePerFacePlanCount+=parseInt(task.targetQty);
                                }
                              }
                              //缓存中指定时间点前 当前面别总数量
                              if(task.projectId==transmitTask.projectId && task.face==transmitTask.face && task.start<transmitTask.start){
                                //插单的时候会将交叉的任务后移，所以若task与transmitTask存在相交，则不算
                                if((transmitTask.start>=task.start && transmitTask.start<=task.end) 
                                || (transmitTask.end>=task.start && transmitTask.end<=task.end)
                                || (transmitTask.start>=task.start && transmitTask.end<=task.end)
                                || (transmitTask.start<=task.start && transmitTask.end>=task.end)){
                                }
                                else {
                                    beforeCurFacePlanCount+=parseInt(task.targetQty);
                                }
                              }
                          });
                          //判定前置面别和数量
                          if(perFacePlanCount==0){
                            returnResult=false;
                            showMessage(1,"<dict:lang value='前置面别未下达！'/>",false);
                            isSuc=false;
                            return;
                          }
                          else {
                              //前置面别和当前面别总数量校验
                              if((curFacePlanCount+parseInt(transmitTask.targetQty))>perFacePlanCount){
                                showMessage(1,"<dict:lang value='当前面别下达数量大于前置面别下达数量！'/>",false);
                                isSuc=false;
                                return;
                              }
                              //指定时间点前，前置面别和当前面别数量校验
                              if((beforeCurFacePlanCount+parseInt(transmitTask.targetQty))>beforePerFacePlanCount){
                                showMessage(1,"<dict:lang value='计划开始时间前，当前面别下达数量大于前置面别下达数量！'/>",false);
                                isSuc=false;
                                return;
                              }
                          }
                      }
                    }
                    else {
                        transmitTask.perFace="";
                    }
                },
                error:function(error){}
            });
            return isSuc;
        }
        catch(error){
            console.error(error);
            return false;
        }
    }
    //获取指定时间点前，当前面别和前置面别的数量
    function getFaceCountByTaskMoved(currentTask){
        try{
            //校验数据库中是否存在前置面别的制令单，若存在，则校验当前制令单计划数量是否满足前置面别制令单数量
            var beforePerFacePlanCount=0;//前置面别制令单计划数量(指定时间点之前)
            var beforeCurFacePlanCount=0;//当前面别制令单计划数量(指定时间点之前)
            //1、校验数据库中数据
            $.ajax({
            type:"post",
            dataType:"json",
            url:dataUrl,
            async:false,
            data:{
                opt:"getCurOrPerFaceMoCount",
                projectId:currentTask.projectId,
                currentFace:currentTask.face,
                perFace:currentTask.perFace,
                dataAuth:$("#DATA_AUTH option:selected").val(),
                startTime:$("#PPW_START_DATE_BEGIN").val(),
                endTime:$("#PPW_START_DATE_END").val()
            },
            success:function(dataMocount){
                if(null!=dataMocount && null!=dataMocount.ajaxList && dataMocount.ajaxList.length>0){
                    beforePerFacePlanCount+=parseInt(dataMocount.ajaxList[0].BF_PER_FACE_COUNT);
                    beforeCurFacePlanCount+=parseInt(dataMocount.ajaxList[0].BF_CUR_FACE_COUNT);
                }
            },
            error:function(error){}
            });
            //2、校验缓存中数据（新增状态）
            currentTask.master.tasks.forEach(function(task,index,array){
                if(task.isLine && task.step!=currentTask.step){
                    return;
                }
                //缓存中指定时间点前 前置面别总数量
                if(task.projectId==currentTask.projectId && task.face==currentTask.perFace && task.start<currentTask.start){
                    beforePerFacePlanCount+=parseInt(task.targetQty);
                }
                //缓存中指定时间点前 当前面别总数量
                if(task.projectId==currentTask.projectId && task.face==currentTask.face && task.start<currentTask.start){
                    beforeCurFacePlanCount+=parseInt(task.targetQty);
                }
            });
            //指定时间点前，前置面别和当前面别数量校验
            if((beforeCurFacePlanCount+parseInt(currentTask.targetQty))>beforePerFacePlanCount){
              return false;
            }
            return true;
        }
        catch(error){
            console.error(error);
        }
    }
    //保存下达信息时校验治具信息
    function transmitManufactureCallBack(){
        try{
            //校验生产指示单
            var msg=checkInstruction();
            if(msg=="OK"){
                checkInstructionCallBack();
            }
            else {
                utilsFp.confirmIcon(1,"","checkInstructionCallBack","", msg,1,"260","");
            }
        }
        catch(error){
            console.error(error);
        }
    }
    //校验生产指示单
    function checkInstruction(){
        try{
            var msg="NG";
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                async:false,
                data:{
                    opt:"checkInstruction",
                    project:transmitTask.projectId,
                    step:transmitTask.step
                },
                success:function(data){
                    if(data!=null && data.ajaxList!=null && data.ajaxList.length>0){
                        msg=data.ajaxList[0].msg;
                    }
                },
                error:function(error){}
            });

            return msg;
        }
        catch(error){
            console.error(error);
        }
    }
    //校验生产指示单回调函数
    function checkInstructionCallBack(){
        try{
            //判定当前下达时间段内是否存在其他任务，若存在则手动选择是否执行插单
            if(!isExistAcross()){
                transmitTask.moInserting=false;
                ganttSaveTransmitCallBack();
            }
            else {
                transmitTask.moInserting=true;
                utilsFp.confirmIcon(1,"","ganttSaveTransmitCallBack","", "<dict:lang value='当前时间段内存在其他任务，是否继续？' />",1,"260","");
            }
        }
        catch(error){
            console.error(error);
        }
    } 
    //保存下达信息callBack
    function ganttSaveTransmitCallBack(){
        try{
            //保存
            var result=ganttSaveTransmit();
            if(result==1){
                showPopMessage(messageLang[15],false);
                divHide('frontTransmit', 'backShadowTransmit');
            }
            else if(result==2) {
                showMessage(3,messageLang[16],false);
                return;
            }
            else if(result==3){}
        }
        catch(error){
            console.error(error);
        }
    }
    //是否存在交叉任务
    function isExistAcross(){
      try{
        var adjustFlag=[];
        //重叠时间域校验(同轨道)
        for(var i=0,len=ge.tasks.length;i<len;i++){
            if(ge.tasks[i].areaSn!=transmitTask.areaSn || ge.tasks[i].isLine){
                continue;
            }
            if((transmitTask.track==comSingleTrack || ge.tasks[i].track==comSingleTrack || transmitTask.track==ge.tasks[i].track) && ((transmitTask.start>=ge.tasks[i].start && transmitTask.start<=ge.tasks[i].end)
            || (transmitTask.end>=ge.tasks[i].start && transmitTask.end<=ge.tasks[i].end)
            || (transmitTask.start<=ge.tasks[i].start && transmitTask.end>=ge.tasks[i].end)
            || (transmitTask.start>=ge.tasks[i].start && transmitTask.end<=ge.tasks[i].end))){
                return true;
            }
        }
        return false;
      }
      catch(error){
          console.error(error);
      }
    }
    //初始化下拉框
    function getEmptyOption(elem){
        elem.empty();
        elem.append("<option value='' class='select_name'>--<dict:lang value='请选择'/>--</option>");
    }
    //显示div弹窗
    function divShow(front,back){
        $("#"+front+",#"+back).show();
    }
    //隐藏div弹窗
    function divHide(front,back){
        $("#"+front+",#"+back).hide();
    }
    //放大甘特图
    function ganttEnlarge(){
        divShow("frontGantt");
        $("#workSpace").insertBefore($("#ganttEnlarge"));
          //resize
          $(window).resize(function () {
        	var place = $("#TWGanttArea");
        	place.css({width: "100%", height: $(window).height() - 100});
     
          }).oneTime(2, "resize", function () {$(window).trigger("resize")});
    }
    //缩小甘特图
    function ganttNarrow(){
        divHide("frontGantt");
        $("#workSpace").insertBefore($(".explain"));
         //resize
          $(window).resize(function () {
        	var place = $("#TWGanttArea");
        	place.css({width: "100%", height: ganttAreaHeight});
          }).oneTime(2, "resize", function () {$(window).trigger("resize")});
    }
    //重载甘特图
    function ganttRedraw(){
        ge.editor.redraw();
        ge.gantt.refreshGantt();
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
    //生成task
    function createGanttTask(param){
        return createWeekGanttTask(param);
    }
    //生成制令单对象
    function createMonumber(task){
        return {
            taskOpt:task.taskOpt,
            ID:task.taskGuid,
            PM_MO_NUMBER:task.moNumber,
            PM_PROJECT_ID:task.projectId,
            PM_PRODUCT_STEP:task.step,
            PM_AREA_SN:task.areaSn,
            PM_PROCESS_FACE:task.face,
            PM_MODEL_CODE:task.modelCode,
            PM_PCB_CODE:task.pcbCode,
            PM_TECH_SN:task.techSn,
            PM_START_GROUP:task.startGroup,
            PM_END_GROUP:task.endGroup,
            PM_TARGET_QTY:task.targetQty,
            PM_INPUT_COUNT:task.intputCount,
            PM_FINISH_COUNT:task.finshCount,
            PM_SCRAP_QTY:task.scarpQty,
            PM_ISSUED_DATE:task.issuedDate,
            PM_ISSUED_EMP:task.issuedEmp,
            PM_ALTER_DATE:task.alterDate,
            PM_SCHEDULE_DATE:time2DateStr(task.start),//取任务的开始时间
            PM_DUE_DATE:time2DateStr(task.end),//取任务的结束时间
            PM_START_DATE:task.startDate,
            PM_CLOSE_DATE:task.closeDate,
            PM_STATUS:task.pmStatus,
            PM_UNIT_NUM:task.unitNum,
            PM_JIGSAW_NUM:task.jigsawNum,
            PM_CONTROL_TYPE:task.controlType,
            PM_SN_RULE:task.snRule,
            PM_SUB_RULE:task.subRule,
            PM_REPAIR_MAX:task.repairMax,
            PM_ERROR_SCRAP:task.errorScarp,
            PM_AUTO_FQC:task.autoFqc,
            PM_FQC_NUM:task.fqcNum,
            PM_MEMO:task.memo,
            DEPT_ID:task.deptId,
            CREATE_USER:task.createUser,
            CREATE_TIME:task.createTime,
            EDIT_USER:task.editUser,
            EDIT_TIME:task.editTime,
            PM_CLOSE_REASON:task.closeReason,
            DATA_AUTH:task.dataAuth,
            PM_TRANSFER_RULE:task.transferRule,
            PM_CUST_CODE:task.custCode,
            PM_PER_TASK:changeDepends(task.depends,dependsType[0]),
            PM_PLAN_ID:task.planId,
            PM_TRACK:task.track
        };
    }
    //消息提示
    //** type 1：警告；2：成功；3：失败；4：疑问；5：锁定
    //** msg 消息
    //** islan 是否默认使用多语言
    function showMessage(type,msg,islan){
        if(islan){
            utilsFp.confirmIcon(type,"","","", "<dict:lang value='"+msg+"' />",0,"260","");
        }
        else {
            utilsFp.confirmIcon(type,"","","", msg,0,"260","");
        }
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
    //保存甘特图信息
    function ganttSave(){
        if(ge!=null && typeof(ge)!="undefined" && ge.tasks.length>0){
            showLoading(true);
            //收集参数数据
            var ganttSaveTasks=[];
            ge.tasks.forEach(function(task,index,array){
                if(!task.isLine && task.isChanged){
                    ganttSaveTasks.push(createMonumber(task));
                }
            });
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                data:{
                    opt:"saveWeekGantt",
                    tasks:JSON.stringify(ganttSaveTasks),
                },
                success:function(data){
                    if(data){
                        //保存完成后恢复任务的状态为未修改(暂时不启用 isChanged)
                        // ge.tasks.forEach(function(task,index,array){
                        //     task.isChenaged=false;
                        // });

                        showLoading(false);
                        showPopMessage(messageLang[17],false);
                        //修改任务标识为更新
                        getLastGanttTaskStaus(updateFlag);
                        toLoadGanttData(ganttTasks);
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
    //删除制令单信息
    function deleteTask(){
        var delTask=$(".taskEditRow :checkbox[checked='checked']");
        if(delTask==null || delTask.length<=0){
            showMessage(1,messageLang[3],false);
            return;
        }
        var delTask=$(".taskEditRow :checkbox[checked='checked']");
        var delTaskMo=[];//要删除的制令单(数据库中的)
		var delTaskBuffer=[];//要删除的制令单(未保存到数据库中的)
        var taskId;//任务在甘特图上的ID
		var vTask;
		var vGeTask;
        for(var i=0,len=delTask.length;i<len;i++){
            taskId=delTask[i].getAttribute("taskid");
            
			vTask=findListTask(taskId);
			vGeTask=findTask(taskId);
			//非开立状态的制令单无法删除
			if(vTask.pmStatus!="0"){
				showMessage(1,vTask.moNumber+messageLang[19],false);
				return;
			}
			//若存在后置任务，无法删除
			var taskLinks=vGeTask.getInferiors();
			for(var j=0,jlen=taskLinks.length;j<jlen;j++){
				if(typeof(taskLinks[j].to)!="undefined" && null!=taskLinks[j].to){
					showMessage(1,vGeTask.moNumber+messageLang[24],false);
					return;
				}
			}
            //识别任务类型，若为数据库中的月排程单，则调用方法删除；若为缓存中的数据，则直接删除缓存
			if(vTask.taskOpt!=insertFlag){
				delTaskMo.push(vTask);
			}
			else {
				delTaskBuffer.push(vTask);
			}
        }
        utilsFp.confirmIcon(1,"","deleteTaskCallBack",[delTaskMo,delTaskBuffer], "<dict:lang value='是否确认删除？' />",1,"260","");
    }
    function deleteTaskCallBack(delTaskMoList){
        var delTaskMo=delTaskMoList[0];//要删除的制令单(数据库中的)
        var delTaskBuffer=delTaskMoList[1];//要删除的制令单(未保存到数据库中的)
        var delTaskList=[];
        var stepDelUseWorkTime=[];//记录线体要扣减的产能
        showLoading(true);
        //获取数据中要删除的制令单
        delTaskMo.forEach(function(task,index,array){
            if(typeof(stepDelUseWorkTime[task.areaSn])=="undefined"){
				stepDelUseWorkTime[task.areaSn]=0;
            }
            //添加扣减产能
			stepDelUseWorkTime[task.areaSn]+=parseInt(task.duration)+parseInt(task.changeTime);
			//放入队列
			delTaskList.push({
				moNumber:task.moNumber
			});
        });
        //删除缓存
        //1、删除数据库中的
		delTaskMo.forEach(function(task,index,array){
			//缓存中删除任务
			delBufferTask(task);
		});
		//2、删除缓存中的
		delTaskBuffer.forEach(function(task,index,array){
			if(typeof(stepDelUseWorkTime[task.areaSn])=="undefined"){
				stepDelUseWorkTime[task.areaSn]=0;
			}
			//添加扣减产能
			stepDelUseWorkTime[task.areaSn]+=parseInt(task.duration)+parseInt(task.changeTime);
			//缓存中删除任务
			delBufferTask(task);
		});
        //执行数据删除
        $.ajax({
            type:"post",
            dataType:"json",
            url:dataUrl,
            async:false,
            data:{
                opt:"deleteTask",
                moNumberList:JSON.stringify(delTaskList)
            },
            success:function(data){
                if(data){
                    //showPopMessage(messageLang[20],false);
                    //query('formId1',true)
                }
                else {
                    showMessage(3,messageLang[21],false);
                }
            },
            error:function(error){
                showLoading(false);
                showMessage(3,messageLang[21],false);
            }
        });
        showLoading(false);
        //校准甘特图信息
		updateGantt(stepDelUseWorkTime);
		//加载甘特图信息
        toLoadGanttData(ganttTasks);
        showPopMessage(messageLang[20],false);
    }
    //校准甘特图信息
	function updateGantt(lineDelUseWorkTime){
		try{
			//校准甘特图信息
			var adTask;
			var delTaskBuffer=[];
			//1.1、移除无任务的阶别
			for(var i=0,len=ganttTasks.tasks.length;i<len;i++){
				adTask=ganttTasks.tasks[i];
				if(adTask.isLine && !isExsitTaskInLine(adTask.areaSn)){
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
				if(typeof(lineDelUseWorkTime)!="undefined" && adTask.isLine && typeof(lineDelUseWorkTime[adTask.areaSn])!="undefined"){
					adTask.usedWorkTime-=lineDelUseWorkTime[adTask.areaSn];
					adTask.progress=calProgress(adTask.usedWorkTime,adTask.availableWorkTime);
				}
				//更新ID和Name的关系
			    referenceId2Name(adTask.id,adTask.moNumber);
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
				if(adTask.isLine){
					adTask.lineMaxSeq=lineTaskMaxSeq(adTask.areaSn);
				}
			}
		}
		catch(error){
			console.error(error);
		}
    }
    //获取线体任务最大索引
	function lineTaskMaxSeq(line){
		try{
			var adTask;
			var seq=-1;
			for(var i=0,len=ganttTasks.tasks.length;i<len;i++){
				adTask=ganttTasks.tasks[i];
				if(!adTask.isLine && adTask.areaSn==line){
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
    //判定线体下是否还有任务
	function isExsitTaskInLine(line){
		try{
			var adTask;
			for(var i=0,len=ganttTasks.tasks.length;i<len;i++){
				adTask=ganttTasks.tasks[i];
				if(!adTask.isLine && adTask.areaSn==line){
					return true;
				}
			}
			return false;
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
    //月排程单在缓存中已下达的数量
    function monthDocTransimtBuffer(planDocNum,face){
        try{
          var used=0;
          ganttTasks.tasks.forEach(function(task,index,array){
              if(task.taskOpt==insertFlag && task.planDocNum==planDocNum && task.face==face){
                used+=parseInt(task.targetQty);
              }
          });
          return used;
        }
        catch(error){
            console.error(error);
        }
    }
    //月排程单在缓存中已下达的制令单号
    function existMonumberInBuffer(projectId,step,face){
        try{
          var used="";
          ganttTasks.tasks.forEach(function(task,index,array){
              if(task.taskOpt==insertFlag && task.projectId==projectId && task.step==step && (task.face != "2" ? "1" : "2")==(face != "2" ? "1" : "2")){
                if(used==""){
                    used+=task.moNumber;
                }
                else {
                    used+=","+task.moNumber;
                }
              }
          });
          return used;
        }
        catch(error){
            console.error(error);
        }
    }
    //重新计算（对缓存数据继续重新计算）
    function reCalculate(){
        try{
            var errorIndex=-1;
            ge.tasks.forEach(function(task,index,array){
                if(errorIndex!=-1){
                    return;
                }
                if(task.isLine || task.isCalculated || null==task.startDate || task.pmStatus!="1"){
                    return;
                }
                task.reCalculate=true;//允许执行重新计算
                task.master.beginTransaction();
                if(!task.master.moveTask(task, new Date(task.startDate))){
                    errorIndex=index;
                }
                task.master.endTransaction();
                task.reCalculate=false;//恢复默认
            });
            if(errorIndex==-1){
              showPopMessage("<dict:lang value='重新计算完成！'/>",false);
            }
        }
        catch(error){
            console.error(error);
        }
    }
    //齐套
	function homogeneity(){
		try{
			var urlDetail = "${path}buss/bussModel.ms?exeid=13eee668bb7345d1aa6b966ea73db9c4&formId=29d173bbeb2e407e98fbdeee2354c721";
			showPopWinFp(urlDetail , 1100, 600,null,"<dict:lang value='齐套检查'/>","");
		}
		catch(error){
			console.error(error);
		}
	}
    //生产情况
	function productSituation(){
		try{
			var urlDetail = "${path}buss/bussModel.ms?exeid=1b13f8a6afff4f97b4d52db1819638ee&formId=454cc1d04a9240f4868ccffb52793896";
			showPopWinFp(urlDetail , 1300, 600,null,"<dict:lang value='生产情况'/>","");
		}
		catch(error){
			console.error(error);
		}
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
    //初始化轨道信息
    function getFaceInfo(){
        try{
            faceFlag=[];
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                async:false,
                data:{
                    opt:"getFaceInfo"
                },
                success:function(data){
                    if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                        data.ajaxList.forEach(function(face,index,array){
                            faceFlag.push({flag:face.CODE,name:face.VALUE});
                        });
                    }
                },
                error:function(error){
                    faceFlag=[];
                }
            });
        }
        catch(error){
            console.error(error);
        }
    }
</script>

<script type="text/javascript">

    var ge;  //this is the hugly but very friendly global var for the gantt editor

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
    //-------------------------------------------  LOCAL STORAGE MANAGEMENT (for this demo only) ------------------------------------------------------
    //加载数据
    function toLoadGanttData(data){
        //var ret=JSON.parse(data);
        ge.loadProject(data);
        ge.checkpoint();
    }
</script>
<div id="gantEditorTemplates" style="display:none;">

    <% /*任务栏菜单列*/ %>
    <div class="__template__" type="TASKSEDITHEAD">
        <table class="gdfTable" cellspacing="0" cellpadding="0">
            <thead>
            <tr style="height:40px">
                <th class="gdfColHeader" style="width:50px;"><dict:lang value="编号"/></th>
                <th class="gdfColHeader gdfResizable" style="width:30px;"></th>
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
        <td class="gdfCell" align="center" style="cursor:pointer;">
        <span>(#=obj.getRow()+1#)</span>
        </td>
        <td class="gdfCell" align="center" style="cursor:pointer;">
        <input type="checkbox" class="delMonumber" monumber="(#=obj.moNumber#)" taskid="(#=obj.id#)" pmstatus="(#=obj.pmStatus#)" style="(#=obj.isLine  ? "display:none" : "width:13px;"#)"></input>
        </td>
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

<script>

(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll2','.head2');
  })
})(jQuery)

$('.scroll2').on('click','tr',function(){
    $(this).find('input[type="radio"]').attr('checked','checked')
    //$(this).siblings().find('input[type="radio"]').removeAttr('checked')
    
})


</script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="pageOver" />
</jsp:include>
