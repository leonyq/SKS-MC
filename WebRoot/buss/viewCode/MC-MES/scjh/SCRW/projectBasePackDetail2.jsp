<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes" %>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_11"/>
    <jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
    <%@ include file="/plf/common/pub_meta.jsp" %>
    <title><dict:lang value="修改"/></title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1"/>
        <jsp:param name="datePicker" value="1"/>
        <jsp:param name="chosen" value="1"/>
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp" %>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
    <script type="text/javascript" src="${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_11"/>
        <jsp:param name="location" value="inHead"/>
    </jsp:include>
    <!-- 产品静态资源 -->

</head>
<body style="overflow:auto;">
<div class="edit">
    <form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
            <bu:formet exeid="%{exeid}"/>>
        <div class="hd">
            <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
            <div style="margin-left:40px;">
                <s:if test="${isDataAuth == '1'}">
                    <span class="dot">*</span>
                    <dict:lang value="组织机构"/> <s:if test="${fn:length(deptLs)==1}">
                    <s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:if> <s:else>
                    <s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:else> </s:if>
            </div>
            <div class="optn">
               <!-- <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存"/></button> -->
                <button type="button" onclick="packsave();"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
                <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消"/>
                </button>
                <button type="button" onclick="resetForm();"><i class="ico ico-gk"></i><dict:lang value="重置"/></button>
            </div>

        </div>
        <div class="bd">
            <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                <jsp:param name="modelName" value="VIEW_TYPE_11"/>
                <jsp:param name="location" value="editForm"/>
            </jsp:include>
            <bu:set name="paraMapObj" value="${dataId}" formId="3ed22e0bef7744dcb3ea955b7bb638fb" type="edit"/>
            <table class="basic-table">
                <input type="hidden" name="formIds" value="3ed22e0bef7744dcb3ea955b7bb638fb"/>
                <input type="hidden" id="prefixInd" name="3ed22e0bef7744dcb3ea955b7bb638fb" value="paraMap1@"/>
                <input type="hidden" name="paraMap1@__LEVEL__" value="1"/>
                <input type="hidden" name="paraMap1@__DATA_COUNT__" value="1"/>
                <s:set name="_$viewId" value="'d15f61123fcd4cbf81311d1eef27e0c8'"/>
                <s:set name="_$formId_1" value="'3ed22e0bef7744dcb3ea955b7bb638fb'"/>
                <s:set name="_$type" value="'edit'"/>

                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PROJECT_ID" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="PROJECT_ID" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="LOT_NUMBER" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="LOT_NUMBER" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="LOT_NUMBER" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/>
                    </bu:td>
                </tr>
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PRODUCT_MATERIAL" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="PRODUCT_MATERIAL" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="PRODUCT_MATERIAL" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/>
                    </bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="PRODUCT_NAME" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="PRODUCT_NAME" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="PRODUCT_NAME" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>

                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PRODUCT_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="PRODUCT_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="PRODUCT_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/></bu:td>

                    <td class="name-six"/>
                    <bu:uitn colNo="FINISH_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colNo="FINISH_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="FINISH_COUNT" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>
                <%--
                <tr>
                    <td class="name-six"/>
                    <bu:uitn colNo="PM_MEMO" formId="3ed22e0bef7744dcb3ea955b7bb638fb"/></td>
                    <bu:td cssClass="dec-self" colspan="3" colNo="PM_MEMO" formId="3ed22e0bef7744dcb3ea955b7bb638fb">
                        <bu:ui colNo="PM_MEMO" formId="3ed22e0bef7744dcb3ea955b7bb638fb" dataId="${dataId}" formIndex="1"/></bu:td>
                </tr>
                --%>
            </table>
            <bu:jsVal formId="3ed22e0bef7744dcb3ea955b7bb638fb" formIndex="1"/>
            <div style="padding:1px;"></div>

            <div class="mod">
                <div class="mod-hd">
                    <h3 class="tit"><dict:lang value="工单明细"/></h3>
                    <div class="extend-btn" style="float: right;margin-top:15px;display:none">
                        <button type="button" onclick="_addRowExtend('fbe85506ea9d4a32b0cf78996898c620','2','','','');" style="padding:0;" title="<dict:lang value="添加" />">
                            <i class="ico ico-kl-new-add ico-small"></i>
                        </button>
                        <button type="button" onclick="_delRowExtend('fbe85506ea9d4a32b0cf78996898c620','');" style="padding:0" title="<dict:lang value="移除" /> ">
                            <i class="ico ico-sc-new-add ico-small"></i>
                        </button>
                    </div>
                </div>
                <div class="mod-bd">
                    <div class="panel datagrid datagrid-div1">
                        <div class="datagrid-div2 datagrid-div6 datagrid-view">
                            <div class="datagrid-header">
                                <div class="datagrid-header-inner" id="datagrid-header-innerfbe85506ea9d4a32b0cf78996898c620">
                                    <bu:addSub formid="3ed22e0bef7744dcb3ea955b7bb638fb" formIndex="2" selfformid="fbe85506ea9d4a32b0cf78996898c620" hidecol="" viewid=""/>
                                </div>
                            </div>
                            <div class="datagrid-body datagrid-div3" style="height:150px" onscroll="ajaxTableScroll(this,'fbe85506ea9d4a32b0cf78996898c620')">
                                <table class="glxb-table" style="width:100%" id="addTable_fbe85506ea9d4a32b0cf78996898c620">
                                    <tbody id="tbody_fbe85506ea9d4a32b0cf78996898c620"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function initEditDataLs() {
                    getEditRows("fbe85506ea9d4a32b0cf78996898c620", "2", "3ed22e0bef7744dcb3ea955b7bb638fb", "", "97c27cbea7204ba08029f339a015bd8a", "");
                    $('table').find('tbody tr:eq(0)').click();
                }
            </script>


        </div>
    </form>
</div>

<div style="display: none;">
    <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
</div>

<!-- js初始化方法 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_11"/>
    <jsp:param name="location" value="jsLoading"/>
</jsp:include>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
    <jsp:param name="popConfirm" value="1"/>
    <jsp:param name="needValidate" value="1"/>
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_11"/>
    <jsp:param name="location" value="pageOver"/>
</jsp:include>

<script type="text/javascript">

    $(function(){
       // initBomInfo();
        initFeedInfo();
    });
  
    function initFeedInfo(){
      var projectId = $("#paraMapObj_PROJECT_ID_SHOW").val();
      var finishCount = $("#paraMapObj_FINISH_COUNT").val();
     $.ajax({
       type:"POST",
       dataType:"json",
       url:"${path}buss/bussModel_exeFunc.ms?funcMId=54a666a01fae475a9a5394f572e8f528",
       data:{"projectId":projectId},
       success:function(data){
       var pList = data.ajaxList;
       var l = pList.length;
       var pocunt = parseFloat(finishCount)/parseFloat(l);
       
                //console.log(pList);
               // $("#projectFlag").val(pList[0].PROJECT_FLAG);
                $("#tbody_fbe85506ea9d4a32b0cf78996898c620").empty();
                for (var i = 0; i < pList.length; i++) {
                    var j = i;
                    var pre = "paraMapObj_" + j + "_";
                    var preName = "paraMap1@" + j + "#";
                    var tempHtml = "<tr id='addTableTr_" + j + "_fbe85506ea9d4a32b0cf78996898c620' onclick=\"_selectExtend(event,this,'')\">"
                        + "<td style='width:30px;text-align:center' class=''><input type='checkbox' style='width:15px;' name='checkboxfbe85506ea9d4a32b0cf78996898c620' id='checkboxfbe85506ea9d4a32b0cf78996898c620'></td>"
                        + "<td style='position:relative;display:none' class='dec' width='60px'><input save_mark='0' type='text' id='" + pre + "CBD_SEQUENCE' name='" + preName + "CBD_SEQUENCE' value='' class=' _VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                        + "<td style='position:relative; ' class='dec' width='180px'><input save_mark='0' type='hidden' id='" + pre + "CBD_ITEM_CODE' name='" + preName + "CBD_ITEM_CODE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'>"
                        + "<input save_mark='0' editname='" + preName + "CBD_ITEM_CODE' textval='" + preName + "CBD_ITEM_CODESHOW' type='text' id='" + pre + "CBD_ITEM_CODE_SHOW' value='' class='input _VAL_NULL input isSubmit _VAL_OjbsData ' onfocus='this.blur()' readonly='readonly'>"
                        + "</td>"
                        + "<td style='position:relative;' class='dec' width='150px'><input save_mark='0' type='text' id='" + pre + "CBD_ITEM_NAME' name='" + preName + "CBD_ITEM_NAME' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                        + "<td style='position:relative;' class='dec' width='150px'><input save_mark='0' type='text' id='" + pre + "CBD_ITEM_SPEC' name='" + preName + "CBD_ITEM_SPEC' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                        + "<td style='position:relative;' class='dec' width='60px'><input save_mark='0' type='text' id='" + pre + "CBD_UNITS' name='" + preName + "CBD_UNITS' value='' class='_VAL_NULL input isSubmit'></td>"
                        + "<td style='position:relative;display:none' class='dec' width='130px'><input save_mark='0' type='text' id='" + pre + "CBD_POINT' name='" + preName + "CBD_POINT' value='' class='_VAL_NULL input isSubmit'></td>"
                        + "<td style='position:relative;' class='dec' width='60px'><input save_mark='0' type='text' id='" + pre + "CBD_ITEM_NUM' name='" + preName + "CBD_ITEM_NUM' value='' class=' _VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                        + "<td style='position:relative;display:none' class='dec'><select save_mark='0' id='" + pre + "CBD_ITEM_TYPE' name='" + preName + "CBD_ITEM_TYPE' class='_VAL_NULL input isSubmit _VAL_OjbsData   ' style='width:100%' ><option value=''>--请选择--</option><option value='0'>物料</option>"
                        + "<option value='1'>PCB</option></select>"
                        + "</tr>";
                    $("#tbody_fbe85506ea9d4a32b0cf78996898c620").append(tempHtml);
                    //$("#" + pre + "CBD_SEQUENCE").val(pList[i].CBD_SEQUENCE);
                    $("#" + pre + "CBD_ITEM_CODE").val(pList[i].CBD_ITEM_CODE);
                    $("#" + pre + "CBD_ITEM_CODE_SHOW").val(pList[i].CBD_ITEM_CODE);
                    $("#" + pre + "CBD_ITEM_NAME").val(pList[i].CI_ITEM_NAME);
                    $("#" + pre + "CBD_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC);
                    $("#" + pre + "CBD_UNITS").val(pList[i].CBD_UNITS);
                    $("#" + pre + "CBD_ITEM_NUM").val(pocunt);
                    //$("#" + pre + "CBD_POINT").val(pList[i].CBD_POINT);
                    //$("#" + pre + "CBD_ITEM_NUM").val(pList[i].CBD_ITEM_NUM);
                    //$("#" + pre + "CBD_ITEM_TYPE").val(pList[i].CBD_ITEM_TYPE);
                }
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

    function initBomInfo() {

        var dataId = "22d9b521a6f2449cb660cf960df6082c";
      
        jQuery.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=66c764f6c40d4f1aa1c40a5f15e4a96a",
            data: {
                "dataId": dataId
            },
            success: function (data) {
                var pList = data.ajaxList;
                //console.log(pList);
               // $("#projectFlag").val(pList[0].PROJECT_FLAG);
                $("#tbody_fbe85506ea9d4a32b0cf78996898c620").empty();
                for (var i = 0; i < pList.length; i++) {
                    var j = i;
                    var pre = "paraMapObj_" + j + "_";
                    var preName = "paraMap1@" + j + "#";
                    var tempHtml = "<tr id='addTableTr_" + j + "_fbe85506ea9d4a32b0cf78996898c620' onclick=\"_selectExtend(event,this,'')\">"
                        + "<td style='width:30px;text-align:center' class=''><input type='checkbox' style='width:15px;' name='checkboxfbe85506ea9d4a32b0cf78996898c620' id='checkboxfbe85506ea9d4a32b0cf78996898c620'></td>"
                        + "<td style='position:relative;' class='dec' width='60px'><input save_mark='0' type='text' id='" + pre + "CBD_SEQUENCE' name='" + preName + "CBD_SEQUENCE' value='' class=' _VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                        + "<td style='position:relative;' class='dec' width='180px'><input save_mark='0' type='hidden' id='" + pre + "CBD_ITEM_CODE' name='" + preName + "CBD_ITEM_CODE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'>"
                        + "<input save_mark='0' editname='" + preName + "CBD_ITEM_CODE' textval='" + preName + "CBD_ITEM_CODESHOW' type='text' id='" + pre + "CBD_ITEM_CODE_SHOW' value='' class='input _VAL_NULL input isSubmit _VAL_OjbsData ' onclick=\"_showCommonTablePage(this,'d54039a23620414c9f79ae8b602d7382','980633287ff9426892f103d4f2fb2c90','料号','','%7B%22WP_WIDTH%22%3A400%2C%22WP_HEIGHT%22%3A450%2C%22WP_FULL_SCREEN%22%3A0%7D','237e8378-48a2-4d20-b7dc-888c85eca99e');\" onfocus='this.blur()' readonly='readonly'>"
                        + "</td>"
                        + "<td style='position:relative;' class='dec' width='150px'><input save_mark='0' type='text' id='" + pre + "CBD_ITEM_NAME' name='" + preName + "CBD_ITEM_NAME' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                        + "<td style='position:relative;' class='dec' width='150px'><input save_mark='0' type='text' id='" + pre + "CBD_ITEM_SPEC' name='" + preName + "CBD_ITEM_SPEC' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"
                        + "<td style='position:relative;' class='dec' width='60px'><input save_mark='0' type='text' id='" + pre + "CBD_UNITS' name='" + preName + "CBD_UNITS' value='' class='_VAL_NULL input isSubmit'></td>"
                        + "<td style='position:relative;' class='dec' width='130px'><input save_mark='0' type='text' id='" + pre + "CBD_POINT' name='" + preName + "CBD_POINT' value='' class='_VAL_NULL input isSubmit'></td>"
                        + "<td style='position:relative;' class='dec' width='60px'><input save_mark='0' type='text' id='" + pre + "CBD_ITEM_NUM' name='" + preName + "CBD_ITEM_NUM' value='' class=' _VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                        + "<td style='position:relative;' class='dec'><select save_mark='0' id='" + pre + "CBD_ITEM_TYPE' name='" + preName + "CBD_ITEM_TYPE' class='_VAL_NULL input isSubmit _VAL_OjbsData   ' style='width:100%' ><option value=''>--请选择--</option><option value='0'>物料</option>"
                        + "<option value='1'>PCB</option></select>"
                        + "</tr>";
                    $("#tbody_fbe85506ea9d4a32b0cf78996898c620").append(tempHtml);
                    $("#" + pre + "CBD_SEQUENCE").val(pList[i].CBD_SEQUENCE);
                    $("#" + pre + "CBD_ITEM_CODE").val(pList[i].CBD_ITEM_CODE);
                    $("#" + pre + "CBD_ITEM_CODE_SHOW").val(pList[i].CBD_ITEM_CODE);
                    $("#" + pre + "CBD_ITEM_NAME").val(pList[i].CI_ITEM_NAME);
                    $("#" + pre + "CBD_ITEM_SPEC").val(pList[i].CI_ITEM_SPEC);
                    $("#" + pre + "CBD_UNITS").val(pList[i].CBD_UNITS);
                    $("#" + pre + "CBD_POINT").val(pList[i].CBD_POINT);
                    $("#" + pre + "CBD_ITEM_NUM").val(pList[i].CBD_ITEM_NUM);
                    $("#" + pre + "CBD_ITEM_TYPE").val(pList[i].CBD_ITEM_TYPE);
                }
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
  //数据键盘监听
   $("input").bind("input keypress", function (event) {
             calNumber();
           });
  function calNumber(){
    
    var finishCount = $("#paraMapObj_FINISH_COUNT").val();
    var l = $("#tbody_fbe85506ea9d4a32b0cf78996898c620 tr").length;
    var pocunt = parseFloat(finishCount)/parseFloat(l);
    for(var i=0;i<l;i++){
      var pre = "paraMapObj_" + i + "_";
      if(finishCount == null || finishCount == ""){
        $("#" + pre + "CBD_ITEM_NUM").val("0");
      }else{
        $("#" + pre + "CBD_ITEM_NUM").val(pocunt);

      }
    }
      
   
    
  }
  //包装保存
function  packsave(){
    var finishCount = $("#paraMapObj_FINISH_COUNT").val();
    $.ajax({
       type:"POST",
       dataType:"json",
       url:"${path}buss/bussModel_exeFunc.ms?funcMId=54a666a01fae475a9a5394f572e8f528",
       data:{"projectId":projectId},
       success:function(data){
         
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
</script>