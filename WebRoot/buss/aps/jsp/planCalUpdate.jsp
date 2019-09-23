<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_11" />
    <jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<head>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <title><dict:lang value="修改" /></title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_11" />
        <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- 产品静态资源 -->

</head>
<body>
<div class="edit">
    <form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
    <bu:formet exeid="%{exeid}" />>
    <div class="hd">
        <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
        <div style="margin-left:40px;">
            <s:if test="${isDataAuth == '1'}">
                <span class="dot">*</span><dict:lang value="组织机构" />
                <s:if test="${fn:length(deptLs)==1}">
                    <s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH"
                              id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:if>
                <s:else>
                    <s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
                              listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
                              id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
                </s:else>
            </s:if>
        </div>
        <div class="optn">
            <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
            <button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
            <button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
        </div>

    </div>
    <div class="bd">
        <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
            <jsp:param name="modelName" value="VIEW_TYPE_11" />
            <jsp:param name="location" value="editForm" />
        </jsp:include>
        <bu:set name="paraMapObj" value="${dataId}" formId="cc3ac92f89ad485caee993047912a29a" type="edit" />
        <table class="basic-table" >
            <input type="hidden" name="formIds" value="cc3ac92f89ad485caee993047912a29a" />
            <input type="hidden" name="cc3ac92f89ad485caee993047912a29a" value="paraMap1@" />
            <input type="hidden" name="paraMap1@__LEVEL__" value="1" />
            <input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
            <s:set name="_$viewId" value="'d1b102d618d942fa97af2ec0be778de8'" />
            <s:set name="_$formId_1" value="'cc3ac92f89ad485caee993047912a29a'" />
            <s:set name="_$type" value="'edit'"/>
            <tr>
                <td class="name-three" /><bu:uitn colNo="PPC_AREA_SN" formId="cc3ac92f89ad485caee993047912a29a" /></td>
                <bu:td cssClass="dec-self" colNo="PPC_AREA_SN" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_AREA_SN" colNo="PPC_AREA_SN" formId="cc3ac92f89ad485caee993047912a29a" dataId="${dataId}" formIndex="1" /></bu:td>

                <td class="name-three" /><bu:uitn colNo="PPC_PRODUCT_STEP" formId="cc3ac92f89ad485caee993047912a29a" /></td>
                <bu:td cssClass="dec-self" colNo="PPC_PRODUCT_STEP" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_PRODUCT_STEP" colNo="PPC_PRODUCT_STEP" formId="cc3ac92f89ad485caee993047912a29a" dataId="${dataId}" formIndex="1" /></bu:td>
            </tr>
            <tr>
                <td class="name-three" /><bu:uitn colNo="PPC_SAT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" /></td>
                <bu:td cssClass="dec-self" colNo="PPC_SAT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_SAT_FLAG" colNo="PPC_SAT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" dataId="${dataId}" formIndex="1" /></bu:td>

                <td class="name-three" /><bu:uitn colNo="PPC_SUN_FLAG" formId="cc3ac92f89ad485caee993047912a29a" /></td>
                <bu:td cssClass="dec-self" colNo="PPC_SUN_FLAG" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_SUN_FLAG" colNo="PPC_SUN_FLAG" formId="cc3ac92f89ad485caee993047912a29a" dataId="${dataId}" formIndex="1" /></bu:td>
            </tr>
            <tr>
                <td class="name-three" /><bu:uitn colNo="PPC_DEFAULT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" /></td>
                <bu:td cssClass="dec-self" colNo="PPC_DEFAULT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_DEFAULT_FLAG" colNo="PPC_DEFAULT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" dataId="${dataId}" formIndex="1" /></bu:td>

                <td class="name-three" /><bu:uitn colNo="PPC_MEMO" formId="cc3ac92f89ad485caee993047912a29a" /></td>
                <bu:td cssClass="dec-self" colNo="PPC_MEMO" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_MEMO" colNo="PPC_MEMO" formId="cc3ac92f89ad485caee993047912a29a" dataId="${dataId}" formIndex="1" /></bu:td>
            </tr>
        </table>
        <bu:jsVal formId="cc3ac92f89ad485caee993047912a29a" formIndex="1" />		<div style="padding:1px;"></div>

        <div class="mod" >
            <div class="mod-hd">
                <h3 class="tit"><dict:lang value="产能日历例外信息" /></h3>
                <div class="extend-btn" style="float: right;margin-top:15px;">
                    <button type="button"    onclick="_addRowExtend('8e3691f22e2f4d818b3b29cd5972c6e6','2','','','');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
                    </button>
                    <button type="button" onclick="_delRowExtend('8e3691f22e2f4d818b3b29cd5972c6e6','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i>
                    </button>
                </div>
            </div>
            <div class="mod-bd" >
                <div class="panel datagrid datagrid-div1">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view"   >
                        <div class="datagrid-header" >
                            <div class="datagrid-header-inner" id="datagrid-header-inner8e3691f22e2f4d818b3b29cd5972c6e6">
                                <bu:addSub formid="cc3ac92f89ad485caee993047912a29a" formIndex="2"  selfformid="8e3691f22e2f4d818b3b29cd5972c6e6" hidecol=""  viewid="" />
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3"  style="height:150px" onscroll="ajaxTableScroll(this,'8e3691f22e2f4d818b3b29cd5972c6e6')" >
                            <table class="glxb-table" style="width:100%" id="addTable_8e3691f22e2f4d818b3b29cd5972c6e6" >
                                <tbody id="tbody_8e3691f22e2f4d818b3b29cd5972c6e6" >
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function initEditDataLs(){
                getEditRows("8e3691f22e2f4d818b3b29cd5972c6e6","2","cc3ac92f89ad485caee993047912a29a","","77e9058068fa456ab468268da97deaf4","");
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
    <jsp:param name="modelName" value="VIEW_TYPE_11" />
    <jsp:param name="location" value="jsLoading" />
</jsp:include>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
    <jsp:param name="popConfirm" value="1" />
    <jsp:param name="needValidate" value="1" />
</jsp:include>
<script>
    //变量
    var dataUrl;
    //初始化函数
    function initial(){
        dataUrl=getDataUrl();
        //初始化线别数据
        getAreaLine();
        //初始化界面元素事件
        initEvent();
    }
    //页面加载结束后执行
    $(function(){
        $("#iframeId").val(window.name);//iframeId
        initial();
    });
    function editCal(){
        //界面控件非空校验（主表）
        if(!validate()){
            return;
        }
        //转到执行类
        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=58ec5b3c2650438fb2fcda7f0f92a045";
        document.forms.editForm.submit();
    }

    //校验界面控件
    function validate(){
        var validResult=true;
        var validMsg="";
        //校验线别
        if($("#col_PPC_AREA_SN").val()==""){
            validResult=false;
            validMsg="请选择线别";
        }
        else if($("#col_PPC_PRODUCT_STEP").val()==""){
            validResult=false;
            validMsg="请选择生产阶别";
        }
        else if($("#col_PPC_SAT_FLAG").val()==""){
            validResult=false;
            validMsg="请选择周六上班标识";
        }
        else if($("#col_PPC_SUN_FLAG").val()==""){
            validResult=false;
            validMsg="请选择周日上班标识";
        }
        else if($("#col_PPC_DEFAULT_FLAG").val()==""){
            validResult=false;
            validMsg="请选择默认标识";
        }

        if(validResult==false){
            utilsFp.confirmIcon(1,"","","", "<dict:lang value='"+validMsg+"' />",0,"300","");
        }

        return validResult;
    }
    //获取线别信息
    function getAreaLine(){
        var area=$("#col_PPC_AREA_SN option:selected").val();
        $.ajax({
            type:"POST",
            dataType:"json",
            url:dataUrl,
            async:false,
            data:{
                operation:"getNoWriteLine",
                currentArea:area
            },
            success:function(data){
                $("#col_PPC_AREA_SN").empty();
                $("#col_PPC_AREA_SN").append("<option value='' class='select_name'>--<dict:lang value='请选择'/>--</option>");
                if(data!=null && typeof (data)!="undefined"){
                    var len=data.ajaxList.length;
                    for(var i=0;i<len;i++){
                        $("#col_PPC_AREA_SN").append("<option value='"+data.ajaxList[i].CA_ID+"' class='select_name'>"+data.ajaxList[i].CA_NAME+"</option>");
                    }
                    $("#col_PPC_AREA_SN").find("option[value='"+area+"']").attr("selected",true);
                    $("#col_PPC_AREA_SN").trigger("chosen:updated");

                    getStep();
                }
            },
            error:function(msg){}
        });
    }
    //获取数据url
    function getDataUrl(){
        return "${path}buss/bussModel_exeFunc.ms?funcMId=f28b85cd9ae645f48dfcb902dad10c50";
    }
    //根据线别获取生产阶别
    function getStep(){
        var area=$("#col_PPC_AREA_SN option:selected").val();
        var step=$("#col_PPC_PRODUCT_STEP option:selected").val();
        $.ajax({
            type:"POST",
            dataType:"json",
            url:dataUrl,
            async:false,
            data:{
                operation:"getProductStep",
                areaSn:area
            },
            success:function(data){
                $("#col_PPC_PRODUCT_STEP").empty();
                $("#col_PPC_PRODUCT_STEP").append("<option value='' class='select_name'>--<dict:lang value='请选择'/>--</option>");
                if(data!=null && typeof(data)!="undefined"){
                    var len=data.ajaxList.length;
                    for(var i=0;i<len;i++){
                        $("#col_PPC_PRODUCT_STEP").append("<option value='"+data.ajaxList[i].CODE+"' class='select_name'>"+data.ajaxList[i].VALUE+"</option>");
                    }
                    $("#col_PPC_PRODUCT_STEP").find("option[value='"+step+"']").attr("selected",true);
                    $("#col_PPC_PRODUCT_STEP").trigger("chosen:updated");
                }
            },
            error:function(msg){}
        });
    }
    //初始化界面原始事件
    function initEvent(){
        //线别选择事件
        $("#col_PPC_AREA_SN").change(function(){
            getStep();
        });
    }
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_11" />
    <jsp:param name="location" value="pageOver" />
</jsp:include>
