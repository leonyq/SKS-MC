<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10"/>
    <jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
    <%@ include file="/plf/common/pub_meta.jsp" %>
    <title>${title}</title>

    <style>

    </style>

    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1"/>
        <jsp:param name="datePicker" value="1"/>
        <jsp:param name="chosen" value="1"/>
    </jsp:include>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_10"/>
        <jsp:param name="location" value="addForm"/>
    </jsp:include>
    <link href="${path}plf/page/common/msui/css/css_tab.css" rel="stylesheet" type="text/css"/>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp" %>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
    <script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
    <script type="text/javascript">


        var loaded = 1;
        var tab_len = 2;

        var currentTag;
        var tabs = "";

        function switchTag(tag, content, url) {
            if (currentTag == tag) {
                return false;
            }
            for (i = 1; i < (tab_len + 1); i++) {
                if ("tag" + i == tag) {
                    document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
                    document.getElementById(tag).getElementsByTagName("a")[0]
                        .getElementsByTagName("span")[0].className = "selectspan1";
                } else {
                    document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
                    document.getElementById("tag" + i).getElementsByTagName("a")[0]
                        .getElementsByTagName("span")[0].className = "";
                }
                $("#" + tag).addClass("current").siblings().removeClass("current");
                if ("content" + i == content) {
                    currentTag = tag;
                    document.getElementById(content).className = "";
                    /* if ("" != url) {
                            currentIframe = document.getElementById("iframe" + i).contentWindow;
                            if (typeof (currentIframe.loadedState) == "undefined"
                                    && currentIframe.loadedState != false
                                    && tabs.indexOf(tag) == -1) {//第一次点击才加载
                                //document.getElementById("iframe" + i).src = url;
                                tabs += tag + ";";
                                if (document.getElementById("iframe" + i).contentWindow.query) {
                                    document.getElementById("iframe" + i).contentWindow
                                            .query(this);
                                } else {
                                    document.getElementById("iframe" + i).src = url;
                                }
                            }
                        }  */
                    dynIframesize("iframe" + i);
                } else {
                    document.getElementById("content" + i).className = "hidecontent";
                }
                document.getElementById("content").className = content;
            }
            /*if(tag=="tag2"&&loaded==1){
                    setChosen();//设置下拉框样式
                    loaded++;
            }*/
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
            switchTag('tag2', 'content2', '');
            switchTag('tag1', 'content1', '');

        }

        $(function () {
            $("#paraMap0_PRODUCT_SN_START").attr("disabled", "disabled");
            $("#paraMap1_PROJECT_FLAG_1").val("N");
            $("#paraMap1_PRODUCT_PACK_SEQ_1").val("N");
            intIframe();

        });


        function checkboxS() {
            var checkbox = document.getElementById("PROJECT_OFONESELF");
            if (checkbox.checked == true) {
                checkbox.value = "Y";
                $("#paraMap0_PRODUCT_LINE").addClass("_VAL_NULL");
            } else {
                checkbox.value = "N";
                $("#paraMap0_PRODUCT_LINE").removeClass("_VAL_NULL");
            }
        }

        function checks() {
            var checkboxq = document.getElementById("paraMap1_PRODUCT_PACK_SEQ_1");
            if (checkboxq.checked == true) {
                checkboxq.value = "Y";

            } else {
                checkboxq.value = "N";
            }
        }

        function getProduct() {
            var checkbox = document.getElementById("paraMap1_PROJECT_FLAG_1");
            if (checkbox.checked == true) {
                checkbox.value = "Y";

                //$("#paraMap0_PRODUCT_SN_PREFIX").addClass("_VAL_NULL");
                $("#paraMap0_PRODUCT_CONFIGURE").removeAttr("disabled");

                $("#paraMap0_PRODUCT_CONFIGURE").attr("class", " input isSubmit _VAL_NULL  _VAL_OjbsData dept_select");
                $("#paraMap0_PRODUCT_CONFIGURE").trigger("chosen:updated");


                $("#paraMap0_PRODUCT_SN_PREFIX").removeAttr("disabled");
                $("#paraMap0_PRODUCT_SN_PREFIX").attr("class", "  input isSubmit _VAL_NULL  _VAL_OjbsData  isaddSubmit ");

            } else {
                checkbox.value = "N";

                //$("#paraMap0_PRODUCT_SN_PREFIX").removeClass("_VAL_NULL");
                $("#paraMap0_PRODUCT_CONFIGURE").attr("disabled", "disabled");
                $("#paraMap0_PRODUCT_CONFIGURE").attr("class", " input isSubmit  _VAL_OjbsData dept_select readonly ");

                $("#paraMap0_PRODUCT_SN_PREFIX").val("");
                $("#paraMap0_PRODUCT_SN_PREFIX").attr("disabled", "disabled");
                $("#paraMap0_PRODUCT_SN_PREFIX").attr("class", "  input isSubmit  _VAL_OjbsData readonly isaddSubmit ");

                $("#paraMap0_PRODUCT_CONFIGURE").trigger("chosen:updated");
            }


        }


        function getEndInfo() {
            // console.log("start:"+start);
            //console.log("num:"+num);

            // var endMsg= Number(start.replace(/[^0-9]/ig,""))+Number(num) ;
            var num = $("#paraMap0_PRODUCT_COUNT").val();
            var start = $("#paraMap0_PRODUCT_SN_START").val();

            var endMsg = Number(start) + Number(num);

            if (!isNaN(endMsg)) {
                $("#paraMap0_PRODUCT_SN_END").val((endMsg - 1));
            }

        }


    </script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_11"/>
        <jsp:param name="location" value="inHead"/>
    </jsp:include>
</head>
<body style="background-color:#fff;overflow:hidden;">
<DIV class="multilist content-in">
    <div class="edit">
        <form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post"
                <bu:formet exeid="%{exeid}"/> target="submitFrame">
            <div class="hd" style="padding-top: 5px;margin-top:0;background-color: #f6f5f7;padding-bottom: 10px;">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                    <div class="save-close" <dict:lang value="保存并关闭窗口"/> onclick="saveClose(this)"></div>
                    <input type="checkbox" checked id="isCloseWin" name="isCloseWin" value="0" style="display:none;"/>
                    <s:if test="${isDataAuth == '1'}">
                        <span class="dot">*</span>
                        <dict:lang value="组织机构"/> <s:if test="${fn:length(deptLs)==1}">
                        <s:select list="deptLs" listKey="id" listValue="name" name="_DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                    </s:if> <s:else>
                        <s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" name="_DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                    </s:else> </s:if>
                </div>


                <div class="optn">
                    <button type="button" onclick="saveObj();"><i class="ico ico-save"></i><dict:lang value="保存"/>
                    </button>
                    <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消"/>
                    </button>
                </div>

            </div>

            <div class="js-tab">
                <DIV id="container" style="padding:0 20px;box-sizing: border-box;">
                    <DIV>
                        <UL class="tab-list tab">
                            <LI id="tag1">
                                <A class="selectli1" onclick="switchTag('tag1','content1','');this.blur();" href="javascript:void(0);">
                                    <SPAN class="selectspan1"><dict:lang value="工单信息"/></SPAN>
                                </A>
                            </LI>
                            <LI id="tag2">
                                <A class="" onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=b3d19dd778dc4bf6ae463d3c3a396e30');this.blur();" href="javascript:void(0);">
                                    <SPAN><dict:lang value="工单BOM"/></SPAN>
                                </A>
                            </LI>

                        </UL>
                    </DIV>


                    <DIV class="content1" id="content">
                        <DIV id="content1" data-tab="tag1">

                            <input type="hidden" name="exeid" value="${exeid}">
                            <input type="hidden" name="formId" id="formId1" value="${formId}">
                            <input type="hidden" name="iframeId" value="${iframeId}">
                            <input type="hidden" name="definedMsg" value="${definedMsg}">
                            <input type="hidden" name="dataId" value="${dataId}">
                            <input type="hidden" name="para_pm" id="para_pm" value="${dataMap1.VR_VALUE}">
                            <!--<s:hidden
										name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}"
										value="%{FUNC_CODE_2}" />-->
                            <s:token/>
                            <table class="func_table">
                                <tr>
                                    <td width="100%" align="right"></td>
                                </tr>
                            </table>
                            <bu:set name="paraMapObj" value="${dataId}" formId="d34c8f48bead40d88c24a153c731de82" type="add"/>
                            <table class="basic-table">
                                <input type="hidden" name="formIds" value="d34c8f48bead40d88c24a153c731de82"/>
                                <input type="hidden" name="d34c8f48bead40d88c24a153c731de82" value="paraMap0@"/>
                                <input type="hidden" name="paraMap0@__LEVEL__" value="0"/>
                                <input type="hidden" name="paraMap0@__DATA_COUNT__" value="1"/>
                                <s:set name="_$viewId" value="'a3f3c9d67b644b8d82e09b543ed22218'"/>
                                <s:set name="_$formId_1" value="'d34c8f48bead40d88c24a153c731de82'"/>
                                <s:set name="_$type" value="'add'"/>
                                <tr>
                                    <td class="name" style="width:89px;"/>
                                    <span class="dot">*</span>
                                    <bu:uitn colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" style="width:225px;" colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROJECT_ID}" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                    <td class="name" style="width:78px;"/>
                                    <span class="dot">*</span>
                                    <bu:uitn colNo="PRODUCT_LINE" formId="d34c8f48bead40d88c24a153c731de82"
                                             onchange="showProjectStep()"/></td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_LINE" style="width:225px;" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_LINE" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_LINE}" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                    <td class="name" style="width:78px;"/>
                                    <bu:uitn colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" style="width:205px;" colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="CUST_CODE" formId="d34c8f48bead40d88c24a153c731de82" value="%{CUST_CODE}" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                </tr>
                                <tr>

                                    <td class="name" style="width:89px;"/>
                                    <span class="dot">*</span>
                                    <bu:uitn colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_MATERIAL}" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                    <td class="name" style="width:89px;"/>
                                    <bu:uitn colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_NAME}" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                    <td class="name" style="width:89px;"/>
                                    <bu:uitn colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_STANDARD}" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                </tr>

                                <tr>


                                    <select id="paraMap0_PROJECT_STATUS" name="paraMap0@0#PROJECT_STATUS" class="" style="width: 200px; display: none;" value="0">
                                        <option value="0">开立</option>
                                        <option value="1">投产</option>
                                        <option value="2">关结</option>
                                    </select>

                                    <td class="name" style="width:89px;"/>
                                    <bu:uitn colNo="PRODUCT_MATERIAL_VER"
                                             formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_MATERIAL_VER" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_MATERIAL_VER" formId="d34c8f48bead40d88c24a153c731de82" readonly="readonly" cssClass="readonly" value="%{PRODUCT_MATERIAL_VER}" formIndex="0" style="width:200px"/>
                                    </bu:td>


                                    <td class="name" style="width:89px;"/>
                                    <bu:uitn colNo="PROJECT_TYPE" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PROJECT_TYPE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PROJECT_TYPE" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROJECT_TYPE}" formIndex="0" style="width:200px"/>
                                    </bu:td>


                                    <td class="name" style="width:89px;"/>
                                    <bu:uitn colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROJECT_STEP}" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                </tr>
                                <tr>
                                    <td class="name" style="width:89px;"/>
                                    <span class="dot">*</span>
                                    <bu:uitn colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_COUNT}" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                    <!-- 注：该字段为扩展字段，数据库没字段，不能改成上面的直接引用表单模型字段的形式，否则自定义保存里的方法要重写很麻烦 -->
                                    <td class="name" style="width:100px;">
                                                                                        <span>自动下达制令单<span>
                                                                                        </span></span>
                                    </td>
                                    <td colno="PROJECT_OFONESELF" class="dec">
                                        <input type="checkbox" id="PROJECT_OFONESELF" name="paraMap0@0#PROJECT_OFONESELF" value="Y" onclick="checkboxS();" class="  isSubmit  _VAL_OjbsData" style="width:200pxborder: 0px;"><label for="paraMap0_PROJECT_OFONESELF_1"></label>
                                    </td>


                                    <td class="name" style="width:89px;"/>
                                    <bu:uitn colNo="FAI_NUM" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="FAI_NUM" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="FAI_NUM" formId="d34c8f48bead40d88c24a153c731de82" value="%{FAI_NUM}" formIndex="0" style="width:200px"/>
                                    </bu:td>


                                </tr>

                                <tr>

                                    <td class="name" style="width:89px;"/>
                                    <span class="dot">*</span>
                                    <bu:uitn colNo="PROLEPSIS_START_DATE"
                                             formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PROLEPSIS_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROLEPSIS_START_DATE}" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                    <td class="name" style="width:89px;"/>
                                    <bu:uitn colNo="ACTUAL_START_DATE" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="ACTUAL_START_DATE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="ACTUAL_START_DATE" formId="d34c8f48bead40d88c24a153c731de82" value="%{ACTUAL_START_DATE}" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                    <td class="name" style="width:89px;"/>
                                    <bu:uitn colNo="TPPB_PLAN_DELIVERY_DATE"
                                             formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="TPPB_PLAN_DELIVERY_DATE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="TPPB_PLAN_DELIVERY_DATE" formId="d34c8f48bead40d88c24a153c731de82" value="%{TPPB_PLAN_DELIVERY_DATE}" formIndex="0" style="width:200px"/>
                                    </bu:td>


                                </tr>

                                <tr>

                                    <td class="name" style="width:89px;"/>
                                    <span class="dot">*</span>
                                    <bu:uitn colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PROLEPSIS_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROLEPSIS_END_DATE}" formIndex="0" style="width:200px"/>
                                    </bu:td>
                                    <td class="name" style="width:89px;"/>
                                    <bu:uitn colNo="ACTUAL_END_DATE" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="ACTUAL_END_DATE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="ACTUAL_END_DATE" formId="d34c8f48bead40d88c24a153c731de82" value="%{ACTUAL_END_DATE}" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                    <td class="name" style="width:89px;"/>
                                    <bu:uitn colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="DESTROY_NO" formId="d34c8f48bead40d88c24a153c731de82" value="%{DESTROY_NO}" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                </tr>

                                <tr>
                                    <td class="name">
                                        <bu:uitn colNo="PRODUCT_PACK_SEQ" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_PACK_SEQ" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_PACK_SEQ" formId="d34c8f48bead40d88c24a153c731de82" onclick="checks();" value="%{PRODUCT_PACK_SEQ}" formIndex="1"/> &nbsp;&nbsp;&nbsp;
                                        <bu:uitn colNo="PROJECT_FLAG" formId="d34c8f48bead40d88c24a153c731de82"/>
                                        <bu:ui colNo="PROJECT_FLAG" formId="d34c8f48bead40d88c24a153c731de82" value="%{PROJECT_FLAG}" onchange="getProduct()" formIndex="1"/>
                                    </bu:td>

                                    <td class="name" style="width:89px;"/>
                                    <span class="dot">*</span>
                                    <bu:uitn colNo="PRODUCT_CONFIGURE" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_CONFIGURE" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_CONFIGURE" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_CONFIGURE}" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                    <td class="name" style="width:89px;"/>
                                    <span class="dot">*</span>
                                    <bu:uitn colNo="PRODUCT_SN_PREFIX" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" colNo="PRODUCT_SN_PREFIX" formId="d34c8f48bead40d88c24a153c731de82">
                                        <bu:ui colNo="PRODUCT_SN_PREFIX" formId="d34c8f48bead40d88c24a153c731de82" value="%{PRODUCT_SN_PREFIX}" formIndex="0" style="width:200px"/>
                                    </bu:td>

                                </tr>
                                <tr>
                                    <td class="name" style="width:89px;"/>
                                    <bu:uitn colNo="PM_MEMO" formId="d34c8f48bead40d88c24a153c731de82"/></td>
                                    <bu:td cssClass="dec" style="height:80px;" colNo="PM_MEMO" formId="d34c8f48bead40d88c24a153c731de82" colspan="5">
                                        <bu:ui colNo="PM_MEMO" formId="d34c8f48bead40d88c24a153c731de82" value="%{PM_MEMO}" formIndex="0" style="width:100%;height:100%"/>
                                    </bu:td>
                                </tr>
                            </table>
                            <bu:jsVal formId="d34c8f48bead40d88c24a153c731de82" formIndex="0"/>


                        </DIV>
                        <DIV id="content2" data-tab="tag2">  <%-- <bu:addcp exeid="%{exeid}" />  _addRowExtend('fbe85506ea9d4a32b0cf78996898c620','1') --%>
                            <div class="mod">
                                <div class="extend-btn" style="float: right;margin-top:-30px;">
                                    <button type="button" onclick="newaddRow();" style="padding:0;" title="<dict:lang value="添加" />">
                                        <i class="ico ico-kl-new-add ico-small"></i>
                                    </button>
                                    <button type="button" onclick="_delRowExtend('fbe85506ea9d4a32b0cf78996898c620');" style="padding:0" title="<dict:lang value="移除" /> ">
                                        <i class="ico ico-sc-new-add ico-small"></i>
                                    </button>
                                </div>
                                <div class="mod-bd">
                                    <div class="panel datagrid datagrid-div1">
                                        <div class="datagrid-div2 datagrid-div6 datagrid-view">
                                            <div class="datagrid-header">
                                                <div class="datagrid-header-inner" id="datagrid-header-innerfbe85506ea9d4a32b0cf78996898c620">
                                                    <bu:addSub formid="d34c8f48bead40d88c24a153c731de82" formIndex="1" selfformid="fbe85506ea9d4a32b0cf78996898c620" hidecol="" viewid=""/>
                                                </div>
                                            </div>
                                            <div class="datagrid-body datagrid-div3" style="height:235px" onscroll="ajaxTableScroll(this,'fbe85506ea9d4a32b0cf78996898c620')">
                                                <table class="glxb-table " style="width:100%" id="addTable_fbe85506ea9d4a32b0cf78996898c620"><!--fixedTable-->
                                                    <tbody id="tbody_fbe85506ea9d4a32b0cf78996898c620"></tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </DIV>

                    </DIV>
        </form>
    </DIV>
    <%-- <bu:submit viewId="81c065ad475149b7b0c654189d089b71" />
    <bu:script viewId="81c065ad475149b7b0c654189d089b71" /> --%>
</div>
</div></DIV>
<div style="display: none;">
    <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10"/>
    <jsp:param name="location" value="jsLoading"/>
</jsp:include>
<script type="text/javascript">
    function init() {
        $("#paraMap0_FAI_NUM").val('${dataMap.VR_DEF_VALUE}');
        //	$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
        oneself();
    }//初始化方法
    /* function addRowBom(tableId,formIndex){
        //util.showLoading();
        var url ="${path}buss/bussModel_ajaxAddRowExtend.ms?FUNC_CODE=F285";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				//curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    async:false,
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq},
				success: function(data){
					util.closeLoading();
					var row = $(data.ajaxString);
					if(row_count % 2 != 0){
						row.addClass("tr1");//隔行着色
					}
					_toClickColor(row);//行点击着色
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq++;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						utilsFp.alert("error:"+errorThrown);
					}
			   }
			});
		} */
    function newaddRow() {
        var len = $("#tbody_fbe85506ea9d4a32b0cf78996898c620 tr").length;
        var j = len + 1;
        var pre = "paraMap" + j + "_";
        var preName = "paraMap1@" + j + "#";
        var tempHtml = "<tr id='addTableTr" + j + "_fbe85506ea9d4a32b0cf78996898c620' onclick=\"_selectExtend(event,this,'')\">"
            + "<td style='width:30px;text-align:center' class=''><input type='checkbox' style='width:15px;' name='checkboxfbe85506ea9d4a32b0cf78996898c620' id='checkboxfbe85506ea9d4a32b0cf78996898c620'></td>"
            + "<td style='position:relative;' class='dec' width='60px'><input type='text' id='" + pre + "CBD_SEQUENCE' name='paraMap1@CBD_SEQUENCE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"
            + "<td style='position:relative;' class='dec' width='180px'><input type='hidden' id='" + pre + "CBD_ITEM_CODE' name='paraMap1@CBD_ITEM_CODE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'>"
            + "<input editname='" + preName + "CBD_ITEM_CODE' textval='" + preName + "CBD_ITEM_CODESHOW' type='text' id='" + pre + "CBD_ITEM_CODE_SHOW' value='' class='input _VAL_NULL input isSubmit _VAL_OjbsData ico-search-input' onclick=\"_showCommonTablePage(this,'d54039a23620414c9f79ae8b602d7382','980633287ff9426892f103d4f2fb2c90','料号','','%7B%22WP_WIDTH%22%3A400%2C%22WP_HEIGHT%22%3A450%2C%22WP_FULL_SCREEN%22%3A0%7D','237e8378-48a2-4d20-b7dc-888c85eca99e');\" onfocus='this.blur()' readonly='readonly'>"
            + "</td>"
            + "<td style='position:relative;' class='dec' width='150px'><input type='text' id='" + pre + "CBD_ITEM_NAME' name='paraMap1@CBD_ITEM_NAME' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
            + "<td style='position:relative;' class='dec' width='150px'><input type='text' id='" + pre + "CBD_ITEM_SPEC' name='paraMap1@CBD_ITEM_SPEC' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
            + "<td style='position:relative;' class='dec' width='60px'><input type='text' id='" + pre + "CBD_UNITS' name='paraMap1@CBD_UNITS' value='' class='_VAL_NULL input isSubmit'></td>"
            + "<td style='position:relative;' class='dec' width='130px'><input type='text' id='" + pre + "CBD_POINT' name='paraMap1@CBD_POINT' value='' class='_VAL_NULL input isSubmit'></td>"
            + "<td style='position:relative;' class='dec' width='60px'><input type='text' id='" + pre + "CBD_ITEM_NUM' name='paraMap1@CBD_ITEM_NUM' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"
            + "<td style='position:relative;' class='dec'><select id='" + pre + "CBD_ITEM_TYPE' name='paraMap1@CBD_ITEM_TYPE' class='_VAL_NULL input isSubmit _VAL_OjbsData   ' style='width:100%' ><option value=''>--请选择--</option><option value='0'>物料</option>"
            + "<option value='1'>PCB</option></select>"
            + "</tr>";
        $("#tbody_fbe85506ea9d4a32b0cf78996898c620").append(tempHtml);
    }

    function getOrderBom(key) {
        util.showLoading("处理中...");
        var getBomUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=6dcc992c1e3042458ae6009375595310&formId=%{formId}";
        jQuery.ajax({
            type: "POST",
            dataType: "json",
            url: getBomUrl + "&dataId=" + key,
            success: function (data) {
                util.closeLoading();
                var pList = data.ajaxList;
                for (var i = 0; i < pList.length; i++) {
                    if (i == 0) {
                        $("#addTable_fbe85506ea9d4a32b0cf78996898c620 tbody tr").html('');
                        curRowSeq = 1;
                    }
                    //_addRowExtend('fbe85506ea9d4a32b0cf78996898c620','1');//数据量大加载太慢
                    var j = i + 1;
                    var pre = "paraMap" + j + "_";
                    var preName = "paraMap1@" + j + "#";
                    /*$(pre+"CBD_SEQUENCE").val(pList[i].CBD_ITEM_SECTION);
                    $(pre+"CBD_ITEM_CODE").val(pList[i].CBD_ITEM_CODE);
                    $(pre+"CBD_ITEM_CODE_SHOW").val(pList[i].CBD_ITEM_CODE);
                    $(pre+"CBD_ITEM_NAME").val(pList[i].CI_ITEM_NAME);
                    $(pre+"CBD_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC);
                    $(pre+"CBD_UNITS").val(pList[i].CBD_UNITS);
                    $(pre+"CBD_POINT").val(pList[i].CBD_POINT);
                    $(pre+"CBD_ITEM_NUM").val(pList[i].CBD_ITEM_NUM);
                    $(pre+"CBD_ITEM_TYPE").val(pList[i].CBD_ITEM_TYPE);
                    $(pre+"CBD_ITEM_TYPE").trigger("chosen:updated");*/
                    //2018/06/07
                    console.log(pList);
                    var tempHtml = "<tr id='addTableTr" + j + "_fbe85506ea9d4a32b0cf78996898c620' onclick=\"_selectExtend(event,this,'')\">"
                        + "<td style='width:30px;text-align:center' class=''><input type='checkbox' style='width:15px;' name='checkboxfbe85506ea9d4a32b0cf78996898c620' id='checkboxfbe85506ea9d4a32b0cf78996898c620'></td>"
                        + "<td style='position:relative;' class='dec' width='60px'><input type='text' id='" + pre + "CBD_SEQUENCE' name='paraMap1@CBD_SEQUENCE' value='" + pList[i].CBD_ITEM_SECTION + "' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                        + "<td style='position:relative;' class='dec' width='180px'><input type='hidden' id='" + pre + "CBD_ITEM_CODE' name='paraMap1@CBD_ITEM_CODE' value='" + pList[i].CBD_ITEM_CODE + "' class='_VAL_NULL input isSubmit _VAL_OjbsData'>"
                        + "<input editname='" + preName + "CBD_ITEM_CODE' textval='" + preName + "CBD_ITEM_CODESHOW' type='text' id='" + pre + "CBD_ITEM_CODE_SHOW' value='" + pList[i].CBD_ITEM_CODE + "' class='input _VAL_NULL input isSubmit _VAL_OjbsData ico-search-input' onclick=\"_showCommonTablePage(this,'d54039a23620414c9f79ae8b602d7382','980633287ff9426892f103d4f2fb2c90','料号','','%7B%22WP_WIDTH%22%3A400%2C%22WP_HEIGHT%22%3A450%2C%22WP_FULL_SCREEN%22%3A0%7D','237e8378-48a2-4d20-b7dc-888c85eca99e');\" onfocus='this.blur()' readonly='readonly'>"
                        + "</td>"
                        + "<td style='position:relative;' class='dec' width='150px'><input type='text' id='" + pre + "CBD_ITEM_NAME' name='paraMap1@CBD_ITEM_NAME' value='" + pList[i].CI_ITEM_NAME + "' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                        + "<td style='position:relative;' class='dec' width='150px'><input type='text' id='" + pre + "CBD_ITEM_SPEC' name='paraMap1@CBD_ITEM_SPEC' value='" + pList[i].CI_ITEM_SPEC + "' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                        + "<td style='position:relative;' class='dec' width='60px'><input type='text' id='" + pre + "CBD_UNITS' name='paraMap1@CBD_UNITS' value='" + pList[i].CBD_UNITS + "' class='_VAL_NULL input isSubmit'></td>"
                        + "<td style='position:relative;' class='dec' width='130px'><input type='text' id='" + pre + "CBD_POINT' name='paraMap1@CBD_POINT' value='" + pList[i].CBD_POINT + "' class='_VAL_NULL input isSubmit'></td>"
                        + "<td style='position:relative;' class='dec' width='60px'><input type='text' id='" + pre + "CBD_ITEM_NUM' name='paraMap1@CBD_ITEM_NUM' value='" + (pList[i].CBD_ITEM_NUM == null ? '' : pList[i].CBD_ITEM_NUM) + "' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                        + "<td style='position:relative;' class='dec'><select id='" + pre + "CBD_ITEM_TYPE' name='paraMap1@CBD_ITEM_TYPE' class='_VAL_NULL input isSubmit _VAL_OjbsData   ' style='width:100%' ><option value=''>--请选择--</option><option value='0'>物料</option>"
                        + "<option value='1'>PCB</option></select>"
                        + "</tr>";
                    $("#tbody_fbe85506ea9d4a32b0cf78996898c620").append(tempHtml);
                    setChosen();//设置下拉框样式
                    $("#" + pre + "CBD_ITEM_TYPE_chosen").attr("style", "width:100%;");
                    /*
                    $("#"+pre+"CBD_SEQUENCE").val(pList[i].CBD_ITEM_SECTION);
                     $("#"+pre+"CBD_ITEM_CODE").val(pList[i].CBD_ITEM_CODE);
                     $("#"+pre+"CBD_ITEM_CODE_SHOW").val(pList[i].CBD_ITEM_CODE);
                     $("#"+pre+"CBD_ITEM_NAME").val(pList[i].CI_ITEM_NAME);
                     $("#"+pre+"CBD_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC);
                     $("#"+pre+"CBD_UNITS").val(pList[i].CBD_UNITS);
                     $("#"+pre+"CBD_POINT").val(pList[i].CBD_POINT);
                     $("#"+pre+"CBD_ITEM_NUM").val(pList[i].CBD_ITEM_NUM);
                     */
                    $("#" + pre + "CBD_ITEM_TYPE").val(pList[i].CBD_ITEM_TYPE);
                    $("#" + pre + "CBD_ITEM_TYPE").trigger("chosen:updated");
                }
                curRowSeq = pList.length + 1;


            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                util.closeLoading();
                var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
                if (null != sessionstatus && sessionstatus == "noAuthority") {
                } else {
                    utilsFp.alert("error:" + errorThrown);
                }
            }
        });
    }

    /*$("#tbody_fbe85506ea9d4a32b0cf78996898c620").on('focus','td *',function(e){
         e.stopPropagation(); 
    })*/
    function oneself() {
        var value = $("#para_pm").val();
        if (value == "1") {
            //alert(value);
            $("#PROJECT_OFONESELF").attr("checked", "checked");
            $("#PROJECT_OFONESELF").val("Y");
            //$("#paraMap0_PRODUCT_LINE_chosen").remove();
            //document.getElementById("paraMap0_PRODUCT_LINE").style.display = "block";
            //$("#paraMap0_PRODUCT_LINE").attr("disabled","disabled");
        }
    }

    /*
    $('#paraMap1_CA_ID').bind('keyup', function () {
                var calwStart=$("#paraMap1_CA_ID");

             if(  /[\u4E00-\u9FA5]/i.test(this.value)){
                 this.value='';

                 _alertValMsg($('#paraMap1_CA_ID'),"<dict:lang value="不能输入中文" />");
             }
             if(/['"“’]/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CA_ID'),"<dict:lang value="不能输入双引号,单引号" />");
             } 
         });
         */
    $('#paraMap0_PRODUCT_SN_PREFIX').bind('keyup', function () {
        var calwStart = $("#paraMap0_PRODUCT_SN_PREFIX");

        if (/[\u4E00-\u9FA5]/i.test(this.value)) {
            this.value = '';

            _alertValMsg($('#paraMap0_PRODUCT_SN_PREFIX'), "<dict:lang value="不能输入中文" />");
        }
        if (/['"“’]/.test(this.value)) {
            this.value = '';

            _alertValMsg($('#paraMap0_PRODUCT_SN_PREFIX'), "<dict:lang value="不能输入双引号,单引号" />");
        }
    });

    function saveObj() {
        isQuery = false;
        var seq = "";
        var itemCode = "";
        var units = "";
        var points = "";
        var number = "";
        var flag = true;
        var i = 1;
        var len = $("#tbody_fbe85506ea9d4a32b0cf78996898c620 tr").length;
        $("#tbody_fbe85506ea9d4a32b0cf78996898c620 tr").each(function () {
            seq = $("#paraMap" + i + "_CBD_SEQUENCE").val();
            itemCode = $("#paraMap" + i + "_CBD_ITEM_CODE").val();
            units = $("#paraMap" + i + "_CBD_UNITS").val();
            points = $("#paraMap" + i + "_CBD_POINT").val();
            number = $("#paraMap" + i + "_CBD_ITEM_NUM").val();

            console.log("seq: >>> ");
            console.log(seq);
            console.log("itemCode: >>> ");
            console.log(itemCode);
            console.log("units: >>> ");
            console.log(units);
            console.log("points: >>> ");
            console.log(points);
            console.log("number: >>> ");
            console.log(number);
            console.log(seq == "" || itemCode == "" || units == "" || points == "" || number == "" || number == null);

            if (seq == "" || itemCode == "" || units == "" || points == "" || number == "" || number == null) {
                switchTag('tag2', 'content2', '${path}buss/bussModel.ms?exeid=b3d19dd778dc4bf6ae463d3c3a396e30');
            }
            if (!/^[0-9]+$/.test(seq)) {
                flag = false;
                _alertValMsg($("#paraMap" + i + "_CBD_SEQUENCE"), "<dict:lang value="该项只能为正整数" />");
            }
            i++;
        });

        if (!val.valNullData()) {
            return;
        }
        if (!valData()) {
            return;
        }
        if (!val.valOjbsData()) {
            return;
        }
        if (!val.valDataBaseSetData()) {
            return;
        }

        if ($("#PROJECT_OFONESELF").is(":checked")) {
            if ($("#paraMap0_PRODUCT_LINE").val() == "") {
                _alertValMsg($("#paraMap0_PRODUCT_LINE_chosen"), "<dict:lang value="该项不能为空" />");
                return;
            }
        }
        if ($("#paraMap1_PROJECT_FLAG_1").val() == "Y") {
            var stratNum = Number($("#paraMap0_PRODUCT_SN_START").val());
            var endNum = Number($("#paraMap0_PRODUCT_SN_END").val());

            if (!isNaN(stratNum) && !isNaN(endNum)) {
                if (stratNum >= endNum) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_START"), "<dict:lang value="号段起始不能大于或等于号段终止" />");
                    return;
                }
                if (endNum - stratNum >= Number($("#paraMap0_PRODUCT_COUNT").val())) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_END"), "<dict:lang value="号段终止不能大于计划数量" />");
                    return;
                }
            } else {
                if ($("#paraMap0_PRODUCT_SN_START").val() >= $("#paraMap0_PRODUCT_SN_END").val()) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_START"), "<dict:lang value="号段起始不能大于或等于号段终止" />");
                    return;
                }
            }

        }

        $("#paraMap1_PROJECT_FLAG_1").attr("disabled", "disabled");
        if (flag == true) {
            $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
            $DisInput.attr("disabled", false);
            if ($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0) {
                $("#addForm").append($("#isCloseWin").clone());
                $("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
            }
            $("#saveBtn").prop("disabled", "disabled");
            var ckval = $("#PROJECT_OFONESELF").val();
            var flag = $("#paraMap1_PROJECT_FLAG_1").val();
            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=66cafac022d442578085a485186dab74&ckval=" + ckval + "&flag=" + flag;

            var seval = $("#paraMap0_PRODUCT_LINE").val();
            if (ckval == "Y") {
                if (seval == "") {


                    utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择线别" />", 0, "260", "");
                } else {
                    //20180531 工单自动下达校验指示单
                    //checkIndicator();
                    document.forms.addForm.submit();

                }
            } else {
                document.forms.addForm.submit();
            }

            isQuery = true;
            $DisInput.attr("disabled", true);
            parentWindow.query("");
            $("#paraMap1_PROJECT_FLAG_1").removeAttr("disabled");
        }
    }

    function sss(mkey) {
        alert(mkey);
    }


    $("#paraMap0_PRODUCT_LINE").on("change", function () {
        var getProductStepUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=e7eb324ad99445d1b5f4e38e85f6cfee";
        var productLine = $("#paraMap0_PRODUCT_LINE").val();
        console.log("productLine" + productLine);
        $.ajax({
            type: "POST",
            dataType: "json",
            url: getProductStepUrl + "&productLine=" + productLine,
            success: function (data) {
                var psList = data.ajaxList;
                console.log(psList[0].CA_PROJECT_STEP);
                $("#paraMap0_PROJECT_STEP").val(psList[0].CA_PROJECT_STEP);
                $("#paraMap0_PROJECT_STEP_chosen a.chosen-single span").text($("#paraMap0_PROJECT_STEP option:selected").text());
            },
            error: function () {
                utilsFp.alert("error");
            }
        });

    });


    function backFillItemVal(obj, thisId) {
//$("#paraMap1_CBD_ITEM_CODE").val(obj.KEY);
//$("#paraMap1_CBD_ITEM_CODE_SHOW").val(obj.KEY);
        $("#" + thisId).val(obj.MKEY);
        $("#" + thisId + "_SHOW").val(obj.MKEY);
        var iName = thisId.replace("CODE", "NAME");
        var iSpec = thisId.replace("CODE", "SPEC");
        $("#" + iName).val(obj.VAL);
        $("#" + iSpec).val(obj.ITEMSPEC);
    }

    function clearItemVal(thisId) {
        $("#" + thisId).val("");
        $("#" + thisId + "_SHOW").val("");
        var iName = thisId.replace("CODE", "NAME");
        var iSpec = thisId.replace("CODE", "SPEC");
        $("#" + iName).val("");
        $("#" + iSpec).val("");
    }
</script>
<bu:script viewId="a3f3c9d67b644b8d82e09b543ed22218"/>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
    <jsp:param name="needValidate" value="1"/>
</jsp:include>

<script>(function ($) {
    $(window).on('load', function () {
        setPopScroll('.datagrid-body', '.datagrid-header-inner');
    })
})(jQuery)

</script>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>

