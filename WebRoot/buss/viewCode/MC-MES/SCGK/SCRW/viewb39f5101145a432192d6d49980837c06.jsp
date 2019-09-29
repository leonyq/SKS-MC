<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<head>
    <%@ include file="/plf/common/pub_meta.jsp" %>
    <title>${title}</title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1"/>
        <jsp:param name="datePicker" value="1"/>
        <jsp:param name="chosen" value="1"/>
    </jsp:include>
    <link href="${path}plf/page/common/msui/css/css_tab.css" rel="stylesheet" type="text/css"/>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp" %>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
    <script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
    <script>
        //加载父ifream中的js\css文件

        var linkList = window.parent.document.getElementsByTagName("link");
        var scriptList = window.parent.document.getElementsByTagName("script");
        var head = document.getElementsByTagName("head").item(0);
        //外联样式
        for (var i = 0; i < linkList.length; i++) {
            var l = document.createElement("link");
            l.rel = 'stylesheet';
            l.type = 'text/css';
            l.href = linkList[i].href;
            head.appendChild(l);
        }

        //去除重复的js引用
        var json = {};
        var scripts = new Array();
        var j = 0;
        for (var i = 0; i < scriptList.length; i++) {
            if (scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src]) {
                json[scriptList[i].src] = 1;
                //include(scriptList[i].src);
                //alert("include "+scriptList[i].src);
                var script = document.createElement("script");
                script.type = 'text/javascript';
                script.src = scriptList[i].src;
                //	head.appendChild(script);
                scripts[j] = script;
                j++;
            }
        }

        window.scripts = scripts;
    </script>
    <script type="text/javascript">
        var loaded = 1;
        var tab_len = 3;

        var currentTag;
        var tabs = "";

        function switchTag(tag, content, url) {
            if (currentTag == tag) {
                return false;
            }
            document.getElementById("content2").style.display = "";
            for (i = 1; i < (tab_len + 1); i++) {
                if ("tag" + i == tag) {
                    document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
                    document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
                } else {
                    document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
                    document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
                }
                $("#" + tag).addClass("current").siblings().removeClass("current");
                if ("content" + i == content) {
                    currentTag = tag;
                    document.getElementById(content).className = "";
                } else {
                    document.getElementById("content" + i).className = "hidecontent";
                }
                document.getElementById("content").className = content;
            }
        }

        var iframehide = "yes";

        function dynIframesize(frameId) {
            if (document.getElementById) {
                dyniframe = document.getElementById(frameId);
                if (dyniframe && !window.opera) {
                    dyniframe.style.display = "block";
                    if (dyniframe.contentDocument
                        && dyniframe.contentDocument.body.offsetHeight) {
                        //dyniframe.height = dyniframe.contentDocument.body.offsetHeight+10;//全显示
                        dyniframe.height = getViewportHeight() - 38;
                    } else {
                        if (dyniframe.Document
                            && dyniframe.Document.body.scrollHeight) {
                            //dyniframe.height = dyniframe.Document.body.scrollHeight;//全显示
                            dyniframe.height = getViewportHeight() - 38;
                        }
                    }
                }
            }
            if ((document.all || document.getElementById) && iframehide == "no") {
                var tempobj = document.all ? document.all[iframeids[i]] : document
                    .getElementById(iframeids[i]);
                tempobj.style.display = "block";
            }

        }

        function _dynIframesize() {
            var tabIndex = 1;
            if (null != currentTag && "" != currentTag) {
                tabIndex = currentTag.substr(3, currentTag.length);
            }
            dynIframesize("iframe" + tabIndex);
        }

        if (window.addEventListener) {
            window.addEventListener("resize", _dynIframesize, false);
        } else {
            if (window.attachEvent) {
                window.attachEvent("onresize", _dynIframesize);
            } else {
                window.onresize = _dynIframesize;
            }
        }

        function query() {
            if (iframe1.window.query != undefined) {
                iframe1.window.query(this);
            }
            if (iframe2.window.query != undefined) {
                iframe2.window.query(this);
            }

        }

        //初始化iframe
        function intIframe() {
            //switchTag('tag2', 'content2', '');
            switchTag('tag1', 'content1', '');

        }

        $(function () {
            intIframe();
            $('.dialog-bd', parent.document).css('background-color', '#fff')
        });
    </script>
    <style>
        input {
            width: 200px !important;
        }
    </style>
</head>
<body style="background-color:#fff;overflow:hidden;">
<DIV class="multilist content-in">
    <div class="edit">

        <div class="js-tab">
            <DIV id="container" style="padding:0 20px;box-sizing: border-box;">
                <DIV class="hd">
                    <UL class="tab-list tab">
                        <LI id="tag1">
                            <A class="selectli1" onclick="switchTag('tag1','content1','');this.blur();" href="javascript:void(0);">
                                <SPAN class="selectspan1">工单信息</SPAN>
                            </A>
                        </LI>
                        <LI id="tag2">
                            <A class="" onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=b3d19dd778dc4bf6ae463d3c3a396e30');this.blur();" href="javascript:void(0);">
                                <SPAN>工单BOM</SPAN>
                            </A>
                        </LI>
                        <LI id="tag3">
                            <A class="" onclick="switchTag('tag3','content3','','');this.blur();" href="javascript:void(0);">
                                <SPAN>替代料</SPAN>
                            </A>
                        </LI>

                    </UL>
                </DIV>
                <form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post"
                        <bu:formet exeid="%{exeid}"/> target="submitFrame" style="margin-top: 20px;">

                    <DIV class="content1" id="content">
                        <DIV id="content1">

                            <input type="hidden" name="exeid" value="${exeid}">
                            <input type="hidden" name="definedMsg" value="${definedMsg}">
                            <input type="hidden" name="formId" value="${formId}">
                            <input type="hidden" name="dataId" value="${dataId}">

                            <table class="func_table">
                                <tr>
                                    <td width="100%" align="right"></td>
                                </tr>
                            </table>
                            <bu:set name="paraMapObj" value="${dataId}" formId="d34c8f48bead40d88c24a153c731de82" type="edit"/>
                            <table class="basic-table">
                                <input type="hidden" name="formIds" value="d34c8f48bead40d88c24a153c731de82"/>
                                <input type="hidden" name="d34c8f48bead40d88c24a153c731de82" value="paraMap0@"/>
                                <input type="hidden" name="paraMap0@__LEVEL__" value="0"/>
                                <input type="hidden" name="paraMap0@__DATA_COUNT__" value="1"/>
                                <s:set name="_$viewId" value="'4561c3e0dd7e44dc862b869f75d331ca'"/>
                                <s:set name="_$formId_1" value="'d34c8f48bead40d88c24a153c731de82'"/>
                                <s:set name="_$type" value="'detail'"/>
                                <tr>
                                    <td class="name" style="width:100px"/>
                                    <span class="dot">*</span>
                                    <bu:uitn colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PROJECT_ID" style="width:200px;" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px;"/>
                                    </bu:td>
                                    <td class="name" style="width:100px"/>
                                    <bu:uitn colNo="PRODUCT_LINE" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_LINE" style="width:200px" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_LINE" cssClass="isSubmit input" disabled="disabled" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                    <td class="name" style="width:100px"/>
                                    <bu:uitn colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="CUST_CODE" style="width:200px" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82" cssClass="isSubmit input" disabled="disabled" dataId="${dataId}" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                </tr>
                                <tr>

                                    <td class="name"/>
                                    <span class="dot">*</span>
                                    <bu:uitn colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                    <td class="name"/>
                                    <bu:uitn colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" readonly="readonly" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                    <td class="name"/>
                                    <bu:uitn colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" readonly="readonly" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                </tr>

                                <tr>
                                    <td class="name"/>
                                    <bu:uitn colNo="LOT_NUMBER" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="LOT_NUMBER" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="LOT_NUMBER" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px"/>
                                    </bu:td>


                                    <td class="name"/>
                                    <bu:uitn colNo="PROJECT_STATUS" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PROJECT_STATUS" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PROJECT_STATUS" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                    <td class="name"/>
                                    <bu:uitn colNo="PROJECT_TYPE" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PROJECT_TYPE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PROJECT_TYPE" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                </tr>
                                <tr>
                                    <td class="name"/>
                                    <bu:uitn colNo="WORKING_SC" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="WORKING_SC" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="WORKING_SC" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                    <td class="name"/>
                                    <bu:uitn colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" readonly="readonly" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                    <td class="name"/>
                                    <bu:uitn colNo="FAI_NUM" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="FAI_NUM" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="FAI_NUM" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" readonly="readonly" formIndex="0" style="width:200px"/>
                                    </bu:td>


                                </tr>

                                <tr>

                                    <td class="name"/>
                                    <bu:uitn colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                    <td class="name"/>
                                    <bu:uitn colNo="ACTUAL_START_DATE" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="ACTUAL_START_DATE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="ACTUAL_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px"/>
                                    </bu:td>


                                    <td class="name"/>
                                    <bu:uitn colNo="TPPB_PLAN_DELIVERY_DATE" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="TPPB_PLAN_DELIVERY_DATE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="TPPB_PLAN_DELIVERY_DATE" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                </tr>

                                <tr>

                                    <td class="name"/>
                                    <bu:uitn colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                    <td class="name"/>
                                    <bu:uitn colNo="ACTUAL_END_DATE" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="ACTUAL_END_DATE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="ACTUAL_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                    <td class="name"/>
                                    <bu:uitn colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" readonly="readonly" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                </tr>

                                <tr>
                                    <td class="name"/>
                                    <bu:uitn colNo="PRODUCT_PACK_SEQ" formId="d34c8f48bead40d88c24a153c731de82"
                                             style="width:200px;"/></td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_PACK_SEQ" formId="d34c8f48bead40d88c24a153c731de82"><bu:ui colNo="PRODUCT_PACK_SEQ" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1"/> &nbsp;&nbsp;
                                        <bu:uitn colNo="PROJECT_FLAG" formId="d34c8f48bead40d88c24a153c731de82"/>
                                        <bu:ui colNo="PROJECT_FLAG" onchange="getProduct()" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1"/>
                                    </bu:td>
                                    <td class="name"/>
                                    <span class="dot">*</span>
                                    <bu:uitn colNo="PRODUCT_CONFIGURE" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_CONFIGURE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_CONFIGURE" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="0" style="width:200px;"/>
                                    </bu:td>

                                    <td class="name"/>
                                    <bu:uitn colNo="PRODUCT_SN_PREFIX" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_SN_PREFIX" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_SN_PREFIX" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" cssClass="isSubmit input" disabled="disabled" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                </tr>


                                <tr>
                                    <td class="name"/>
                                    <bu:uitn colNo="PM_MEMO" formId="d34c8f48bead40d88c24a153c731de82"/>                                            </td>
                                    <bu:td cssClass="dec" colNo="PM_MEMO" formId="d34c8f48bead40d88c24a153c731de82" colspan="5">
                                        <bu:ui colNo="PM_MEMO" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="0" rows="4" style="width:100%;height:80px;"/>
                                    </bu:td>

                                </tr>
                            </table>
                            <bu:jsVal formId="d34c8f48bead40d88c24a153c731de82" formIndex="0"/>


                        </DIV>
                        <input type="hidden" name="formId" id="formId2" value='123456'/>
                        <input type="hidden" name="formId" id="formId3" value='456789'/>
                        <DIV id="content2" style="margin-top:4px;margin-left:4px;margin-right:4px;">
                            <div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
                                <div class="datagrid-div2 datagrid-div6 datagrid-view" style="overflow-x:hidden;border-bottom:0;">
                                    <div class="datagrid-header">
                                        <div class="datagrid-header-inner head1" id="">
                                            <table class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable123456">
                                                <tbody>
                                                <tr class="datagrid-header-row thcolor">
                                                    <td class="datagrid-cell " style="width:30px;text-align:center"></td>
                                                    <td class="datagrid-cell " style="width:60px;text-align:center">
                                                        <dict:lang value="阶别"/></td>
                                                    <td class="datagrid-cell " style="width:170px;text-align:center">
                                                        <dict:lang value="料号"/></td>
                                                    <td class="datagrid-cell " style="width:225px;text-align:center">
                                                        <dict:lang value="料号名称"/></td>
                                                    <td class="datagrid-cell " style="width:195px;text-align:center">
                                                        <dict:lang value="料号规格"/></td>
                                                    <td class="datagrid-cell " style="width:115px;text-align:center">
                                                        <dict:lang value="单位"/></td>
                                                    <td class="datagrid-cell " style="width:115px;text-align:center">
                                                        <dict:lang value="点位"/></td>
                                                    <td class="datagrid-cell " style="width:115px;text-align:center">
                                                        <dict:lang value="子件物料用量"/></td>
                                                    <td class="datagrid-cell " style="width:115px;text-align:center">
                                                        <dict:lang value="物料类型"/></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="datagrid-body datagrid-div3 scroll1" style="height:300px;"><!--130-->
                                        <table class="datagrid-btable fixedTable dblClick " id="datagrid-btable-ajax123456">
                                            <tbody id="itemTbody">
                                            <c:forEach var="item" items="${dataList}" varStatus="status">
                                                <tr>
                                                    <td class='datagrid-cell datagrid-cell-1' style='width:30px;'>${status.count}</td>
                                                    <td class='datagrid-cell datagrid-cell-1' style='width:60px;'>${item.CBD_SEQUENCE}</td>
                                                    <td class='datagrid-cell datagrid-cell-2' style="width:170px;">${item.CBD_ITEM_CODE}</td>
                                                    <td class='datagrid-cell datagrid-cell-3' style="width:225px;">${item.CBD_ITEM_NAME}</td>
                                                    <td class='datagrid-cell datagrid-cell-4' style="width:195px;">${item.CBD_ITEM_SPEC}</td>
                                                    <td class='datagrid-cell datagrid-cell-5' style="width:115px;">${item.CBD_UNITS}</td>
                                                    <td class='datagrid-cell datagrid-cell-6' style="width:115px;">${item.CBD_POINT}</td>
                                                    <td class='datagrid-cell datagrid-cell-7' style="width:115px;">${item.CBD_ITEM_NUM}</td>
                                                    <td class='datagrid-cell datagrid-cell-8' style="width:115px;">
                                                        <c:choose> <c:when test="${item.CBD_ITEM_TYPE==1}">PCB</c:when>
                                                            <c:otherwise><dict:lang value="物料"/></c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>

                        </DIV>

                        <DIV id="content3" style="margin-top:4px;margin-left:4px;margin-right:4px;">
                            <!--<div style="padding:1px;" ></div>-->
                            <div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
                                <div class="datagrid-div2 datagrid-div6 datagrid-view" style="overflow-x:hidden;border-bottom:0;">
                                    <div class="datagrid-header">
                                        <div class="datagrid-header-inner head2" id="">
                                            <table class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable456789">
                                                <tbody>
                                                <tr class="datagrid-header-row thcolor">
                                                    <td class="datagrid-cell " style="width:30px;text-align:center"></td>
                                                    <td class="datagrid-cell" style="width:140px;text-align:center">
                                                        <dict:lang value="主料料号"/></td>
                                                    <td class="datagrid-cell" style="width:140px;text-align:center">
                                                        <dict:lang value="主料名称"/></td>
                                                    <td class="datagrid-cell" style="width:233px;text-align:center">
                                                        <dict:lang value="替代料号"/></td>
                                                    <td class="datagrid-cell" style="width:218px;text-align:center">
                                                        <dict:lang value="替代料名称"/></td>
                                                    <td class="datagrid-cell" style="width:213px;text-align:center">
                                                        <dict:lang value="规格"/></td>
                                                    <td class="datagrid-cell" style="width:213px;text-align:center">
                                                        <dict:lang value="状态"/></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="datagrid-body datagrid-div3 scroll2" style="height:300px;"><!--130-->
                                        <table class="datagrid-btable fixedTable dblClick " id="datagrid-btable-ajax456789">
                                            <tbody id="itemTbody">
                                            <c:forEach var="item" items="${dataList1}" varStatus="status">
                                                <tr>
                                                    <td class='datagrid-cell datagrid-cell-1' style='width:30px;'>${status.count}</td>
                                                    <td class='datagrid-cell datagrid-cell-1' style="width:140px;">${item.CR_ITEM_MIAN}</td>
                                                    <td class='datagrid-cell datagrid-cell-2' style="width:140px;">${item.CI_ITEM_NAME}</td>
                                                    <td class='datagrid-cell datagrid-cell-3' style="width:233px;">${item.CR_ITEM_REPLACE}</td>
                                                    <td class='datagrid-cell datagrid-cell-4' style="width:218px;">${item.CR_ITEM_REPLACE_NAME}</td>
                                                    <td class='datagrid-cell datagrid-cell-5' style="width:213px;">${item.CR_ITEM_REPLACE_SPEC}</td>
                                                    <td class='datagrid-cell datagrid-cell-6' style="width:213px;">
                                                        <c:choose>
                                                            <c:when test="${item.CR_STATUS=='Y'}"><dict:lang value="有效"/></c:when>
                                                            <c:otherwise><dict:lang value="无效"/></c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>

                        </DIV>
                </form>
            </DIV>

        </div>
    </div>
</DIV>

<script type="text/javascript">
    function init() {
        $("#paraMapObj_CUST_CODE_SHOW_BUTTON").hide();
        $("#paraMapObj_PRODUCT_MATERIAL_SHOW_BUTTON").hide();
        $("input").removeClass("readonly");
    }//初始化方法
    $(function () {
        $("#paraMapObj_PROJECT_ID_SHOW").attr("disabled", true);
    })


</script>
<script>(function ($) {
    $(window).on('load', function () {
        setPopScroll('.scroll2', '.head2');
        setPopScroll('.scroll1', '.head1');
        var tableTrJs = $("#itemTbody tr");
        _tongLineColor(tableTrJs);
        defTableWidthRewrite("123456");
        defTableWidthRewrite("456789");
    })
})(jQuery)</script>
<bu:script viewId="4561c3e0dd7e44dc862b869f75d331ca"/>
</body>


<%@ include file="/plf/common/pub_end.jsp" %>
