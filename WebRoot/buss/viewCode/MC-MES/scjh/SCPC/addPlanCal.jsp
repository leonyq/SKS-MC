<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10" />
    <jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<head>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <title><dict:lang value="新增" />
    </title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    
    <!-- head里面 -->

    <!-- 产品静态资源 -->
    <script src="${path}buss/aps/week/gantt_libs/date.js"></script>
    <script src="${path}buss/aps/week/gantt_libs/i18nJs.js"></script>
    <script src="${path}buss/aps/week/gantt_js/ganttCommon.js"></script>
</head>
<body>
<div class="edit">
    <form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
    target="submitFrame">
    <div class="hd">

        <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
        <div style="margin-left:10px;">
            <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
        <s:if test="${isDataAuth == '1'}">
            <span class="dot">*</span><dict:lang value="组织机构" />
            <s:if test="${fn:length(deptLs)==1}">
                <s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
                          id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
            </s:if>
            <s:else>
                <s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
                          listKey="id" listValue="name"  name="_DATA_AUTH"
                          id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
            </s:else>
        </s:if>
    </div>
    <div class="optn">
        <!-- <button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button> -->
        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
    </div>

</div>
<div class="bd" style="height:534px;">

    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_10" />
        <jsp:param name="location" value="addForm" />
    </jsp:include>
    <bu:set name="paraMapObj" value="${dataId}" formId="cc3ac92f89ad485caee993047912a29a" type="add" />
    <table class="basic-table" >
        <input type="hidden" id="iframeId" name="iframeId" value=""/>
        <input type="hidden" name="formIds" value="cc3ac92f89ad485caee993047912a29a" />
        <input type="hidden" name="cc3ac92f89ad485caee993047912a29a" value="paraMap1@" />
        <input type="hidden" name="paraMap1@__LEVEL__" value="1" />
        <input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
        <s:set name="_$viewId" value="'eaec3949efbb48e7a1ee77cd6926f494'" />
        <s:set name="_$formId_1" value="'cc3ac92f89ad485caee993047912a29a'" />
        <s:set name="_$type" value="'add'" />
        <tr>
            <td class="name" /><span class="dot">*</span><bu:uitn colNo="PPC_AREA_SN" formId="cc3ac92f89ad485caee993047912a29a" /></td>
            <bu:td cssClass="dec" colNo="PPC_AREA_SN" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_AREA_SN" colNo="PPC_AREA_SN" formId="cc3ac92f89ad485caee993047912a29a" value="%{PPC_AREA_SN}" formIndex="1" /></bu:td>

            <td class="name" /><span class="dot">*</span><bu:uitn colNo="PPC_PRODUCT_STEP" formId="cc3ac92f89ad485caee993047912a29a" /></td>
            <bu:td cssClass="dec" colNo="PPC_PRODUCT_STEP" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_PRODUCT_STEP" colNo="PPC_PRODUCT_STEP" formId="cc3ac92f89ad485caee993047912a29a" value="%{PPC_PRODUCT_STEP}" formIndex="1" /></bu:td>
        </tr>
        <tr>
            <td class="name" /><bu:uitn colNo="PPC_SAT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" /></td>
            <bu:td cssClass="dec" colNo="PPC_SAT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_SAT_FLAG" colNo="PPC_SAT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" value="%{PPC_SAT_FLAG}" formIndex="1" onchange="changeWeekDayFlag();"/></bu:td>

            <td class="name" /><bu:uitn colNo="PPC_SUN_FLAG" formId="cc3ac92f89ad485caee993047912a29a" /></td>
            <bu:td cssClass="dec" colNo="PPC_SUN_FLAG" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_SUN_FLAG" colNo="PPC_SUN_FLAG" formId="cc3ac92f89ad485caee993047912a29a" value="%{PPC_SUN_FLAG}" formIndex="1" onchange="changeWeekDayFlag();"/></bu:td>
        </tr>
        <tr>
            <td class="name" /><bu:uitn colNo="PPC_DEFAULT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" /></td>
            <bu:td cssClass="dec" colNo="PPC_DEFAULT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_DEFAULT_FLAG" colNo="PPC_DEFAULT_FLAG" formId="cc3ac92f89ad485caee993047912a29a" value="%{PPC_DEFAULT_FLAG}" formIndex="1" /></bu:td>

            <td class="name" /><bu:uitn colNo="PPC_MEMO" formId="cc3ac92f89ad485caee993047912a29a" /></td>
            <bu:td cssClass="dec" colNo="PPC_MEMO" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui id="col_PPC_MEMO" colNo="PPC_MEMO" formId="cc3ac92f89ad485caee993047912a29a" value="%{PPC_MEMO}" formIndex="1" /></bu:td>
        </tr>
    </table>
    <bu:jsVal formId="cc3ac92f89ad485caee993047912a29a" formIndex="1" />		<div style="padding:1px;"></div>

    <div class="mod" >
        <div class="mod-hd" style="margin-bottom:5px;">
            <h3 class="tit"><dict:lang value="产能日历例外信息" /></h3>
            <div class="extend-btn" style="float: right;margin-top:5px;">
                <button type="button"    onclick="addExceptionTime();"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
                </button>
                <button type="button" onclick="_delRowExtendEx('8e3691f22e2f4d818b3b29cd5972c6e6','');"  style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i>
                </button>
            </div>
        </div>
        <div class="mod-bd" >
            <div class="panel datagrid datagrid-div1">
                <div class="datagrid-div2 datagrid-div6 datagrid-view">
                    <div class="datagrid-header" >
                        <div class="datagrid-header-inner" id="datagrid-header-inner8e3691f22e2f4d818b3b29cd5972c6e6">
                            <bu:addSub formid="cc3ac92f89ad485caee993047912a29a" formIndex="2"  selfformid="8e3691f22e2f4d818b3b29cd5972c6e6" hidecol=""  viewid="" />
                        </div>
                    </div>
                    <div class="datagrid-body datagrid-div3 scroll"  style="height:350px" onscroll="ajaxTableScroll(this,'8e3691f22e2f4d818b3b29cd5972c6e6')" >
                        <table class="glxb-table fixedTable" style="width:100%" id="addTable_8e3691f22e2f4d818b3b29cd5972c6e6" >
                            <tbody id="tbody_8e3691f22e2f4d818b3b29cd5972c6e6" >
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
</form>
</div>

<div style="display: none;">
    <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10" />
    <jsp:param name="location" value="jsLoading" />
</jsp:include>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
    <jsp:param name="needValidate" value="1" />
</jsp:include>

<script>
    //变量
    var dataUrl;
    var workTime=[];//存储工作时间
    var restTime=[];//存储工作时间内的休息时间
    var workLineSn=null;//存储线体Sn
    var workStarMonth=null;//存储工作时间开始月
    var workEndMonth=null;//存储工作时间结束月
    var messageLang=[];//提示框多语言
    //初始化函数
    function initial(){
        //初始化多语言
        initLang();
        dataUrl=getDataUrl();
        //初始化线别数据
        getAreaLine();
        //初始化界面元素事件
        initEvent();
        //处理界面元素状态
        initUiStatus();
    }
    //页面加载结束后执行
    $(function(){
        $("#iframeId").val(window.name);//iframeId
        initial();
    });
    //初始化多语言
    function initLang(){
        try{
            messageLang[0]="<dict:lang value='请先选择线别！'/>";
            messageLang[1]="<dict:lang value='请选择一条记录！'/>";
            messageLang[2]="<dict:lang value='请先选择类型！'/>";
            messageLang[3]="<dict:lang value='开始时间必须小于结束时间！'/>";
            messageLang[4]="<dict:lang value='存在重复时间段！'/>";
            messageLang[5]="<dict:lang value='请选择组织机构'/>";
            messageLang[6]="<dict:lang value='请选择线别'/>";
            messageLang[7]="<dict:lang value='请选择生产阶别'/>";
        }
        catch(error){
            console.error(error);
        }
    }
    //新增
    function addCal(){
        //界面控件非空校验（主表）
        if(!validate()){
            return;
        }
        //解除下拉框disable状态
        dropDownEnable($("#col_PPC_AREA_SN"),true);
        dropDownEnable($("#col_PPC_PRODUCT_STEP"),true);
        //转到执行类
        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=bf2866496e2f4a74b27cab55103e72ea&iframeId="+$("#iframeId").val();
        document.forms.addForm.submit();
        dropDownEnable($("#col_PPC_PRODUCT_STEP"),false);
    }
    //校验界面控件
    function validate(){
        var validResult=true;
        var validMsg="";
        //校验机构
        if($("#deptLs_data_auth").val()==""){
            validResult=false;
            validMsg=messageLang[5];
        }
        //校验线别
        else if($("#col_PPC_AREA_SN").val()==""){
            validResult=false;
            validMsg=messageLang[6];
        }
        else if($("#col_PPC_PRODUCT_STEP").val()==""){
            validResult=false;
            validMsg=messageLang[7];
        }

        if(validResult==false){
            utilsFp.confirmIcon(1,"","","", validMsg,0,"300","");
        }

        return validResult;
    }
    //获取线别信息
    function getAreaLine(){
        $.ajax({
            type:"POST",
            dataType:"json",
            url:dataUrl,
            async:false,
            data:{
                operation:"getNoWriteLine",
                currentArea:""
            },
            success:function(data){
                $("#col_PPC_AREA_SN").empty();
                $("#col_PPC_AREA_SN").append("<option value='' class='select_name'>--<dict:lang value='请选择'/>--</option>");
                if(data!=null && typeof (data)!="undefined"){
                    var len=data.ajaxList.length;
                    for(var i=0;i<len;i++){
                        $("#col_PPC_AREA_SN").append("<option value='"+data.ajaxList[i].CA_ID+"' class='select_name'>"+data.ajaxList[i].CA_NAME+"</option>");
                    }
                    $("#col_PPC_AREA_SN").trigger("chosen:updated");
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
                dropDownEnable($("#col_PPC_PRODUCT_STEP"),true);
                //$("#col_PPC_PRODUCT_STEP").append("<option value='' class='select_name'>--<dict:lang value='请选择'/>--</option>");
                if(data!=null && typeof(data)!="undefined"){
                    var len=data.ajaxList.length;
                    for(var i=0;i<len;i++){
                        $("#col_PPC_PRODUCT_STEP").append("<option value='"+data.ajaxList[i].CODE+"' class='select_name'>"+data.ajaxList[i].VALUE+"</option>");
                    }
                    dropDownEnable($("#col_PPC_PRODUCT_STEP"),false);
                }
            },
            error:function(msg){}
        });
    }
    //初始化界面元素事件
    function initEvent(){
        //线别选择事件
        $("#col_PPC_AREA_SN").change(function(){
            getStep();
        });
    }
    //添加例外时间
    function addExceptionTime(){
        if($("#col_PPC_AREA_SN").val()==""){
            showMessage(1,messageLang[0],false);
            return;
        }
        _addRowExtend('8e3691f22e2f4d818b3b29cd5972c6e6','2','','','');
        //设置例外时长不可输入
        var durationInput=$("#tbody_8e3691f22e2f4d818b3b29cd5972c6e6").find("input[id$='PPE_DURATION']");
        $(durationInput[durationInput.length-1]).attr("readonly","readonly");
        //禁用线体下拉框
        dropDownEnable($("#col_PPC_AREA_SN"),false);
    }
    //删除例外时间
    function _delRowExtendEx(tableId,subformids){
        if($("input[name='checkbox"+tableId+"']:checked").length==0){
            showMessage(1,messageLang[1],false);
            return;
        }
        var obj = new Object();
        obj.tableId = tableId;
        obj.subformids = subformids;
        utilsFp.confirmIcon(1,"","before_delRowExtendConfirm",obj, "<dict:lang value='确认删除?'/>","1","","");
    }
    function before_delRowExtendConfirm(obj){
        _delRowExtendConfirm(obj);
        var tr=$("#tbody_8e3691f22e2f4d818b3b29cd5972c6e6").find("tr");
        if(typeof(tr)!="undefined" && tr.length<=0){
            dropDownEnable($("#col_PPC_AREA_SN"),true);
        }
    }
    //禁用/开启下拉框
    function dropDownEnable(drop,isOpen){
        if(isOpen){
            $(drop).removeAttr("disabled");
        }
        else {
            $(drop).attr("disabled","disabled");
        }
        $(drop).trigger("chosen:updated");
    }
    //处理界面元素状态
    function initUiStatus(){
        dropDownEnable($("#col_PPC_PRODUCT_STEP"),false);
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
    //校验例外明细中的开始时间/结束时间
    function validateDate(ui){
        //筛选列外时长UI
        var duration=$(ui).closest("tr").find("input[id$='PPE_DURATION']");
        //校验是否已选择线别
        if(!validateLineSelected()){
            showMessage(1,messageLang[0],false);
            $(ui).val("");
            duration.val("");
            return;
        }
        //校验是否已选择类型
        var type=validateExceptionType(ui);
        if(type==null || type==""){
            showMessage(1,messageLang[2],false);
            $(ui).val("");
            duration.val("");
            return;
        }
        //获取时间控件
        var dateUI=$(ui).closest("tr").find(".WdateNomorl");
        if(dateUI.length<=0){
            return;
        }
        //获取开始时间和结束时间
        var begin=$(ui).closest("tr").find(".WdateNomorl[id$='PPE_BEGIN_TIME']").val();
        var end=$(ui).closest("tr").find(".WdateNomorl[id$='PPE_END_TIME']").val();
        //校验
        if(begin!="" && end!=""){
            var beginDate=new Date(begin);
            var endDate=new Date(end);
            //忽略秒
            beginDate.setMinutes(beginDate.getMinutes(),0,0);
            endDate.setMinutes(endDate.getMinutes(),0,0);
            //开始时间必须小于结束时间
            if(beginDate>=endDate){
                showMessage(1,messageLang[3],false);
                $(ui).val("");
                duration.val("");
                return;
            }
            //校验例外时间是否存在重复段
            if(existsSameTime(ui,beginDate,endDate)){
                showMessage(1,messageLang[4],false);
                $(ui).val("");
                duration.val("");
                return;
            }
            //自动算出例外时长
            var areaSn=$("#col_PPC_AREA_SN").val();
            activeWorkTimeInfo(areaSn,begin,end);//自动校验并获取工厂日历工作信息
            duration.val(getExceptionAvaliableTime(areaSn,begin,end,type).toFixed(2));
        }
    }
    //例外明细校验是否已经选择类型
    function validateExceptionType(ui){
        var type= $(ui).closest("tr").find(".dept_select");
        if(null!=type && typeof(type)!="undefined"){
            return type.val();
        }
        else {
            return null;
        }
    }
    //校验是否已选择线别
    function validateLineSelected(){
        return ($("#col_PPC_AREA_SN").val()!="");
    }
    //计算开始时间到结束时间的有效例外时长（根据类型进行计算）
    function getExceptionAvaliableTime(areaSn,begin,end,exptType){
        var time=0;//有效时长（精度m）
        var vDate=new Date(begin);
        var endDate=new Date(end);
        var unavaDuration=0;//特殊时间无效跨度
        //忽略秒
        vDate.setMinutes(vDate.getMinutes(),0,0);
        endDate.setMinutes(endDate.getMinutes(),0,0);
        var specialCheck={date:new Date(vDate.getTime()),endDate:new Date(vDate.getTime())};
        while(specialCheck.endDate<endDate){
            specialCheck=checkSpecialDate(specialCheck.endDate,areaSn,false);
            if(exptType!="1"){
                //统计时间段内的可用工作时间
                if([2,3,4,6].indexOf(specialCheck.type)<0){
                    //判定特殊时间点类型的结束时间是否大于目标结束时间，若大于则特殊时间跨度要扣除无效部分
                    if(specialCheck.endDate>endDate){
                        unavaDuration=(specialCheck.endDate.getTime()-endDate.getTime())/(1000*60)+1;
                        specialCheck.duration=parseInt(specialCheck.duration)-unavaDuration;
                    }
                    time=time+parseInt(specialCheck.duration)-1;
                }
            }
            else {
                //统计时间段捏的可用休息时间
                if([2,3,4,6].indexOf(specialCheck.type)>=0){
                    //判定特殊时间点类型的结束时间是否大于目标结束时间，若大于则特殊时间跨度要扣除无效部分
                    if(specialCheck.endDate>endDate){
                        unavaDuration=(specialCheck.endDate.getTime()-endDate.getTime())/(1000*60)+1;
                        specialCheck.duration=parseInt(specialCheck.duration)-unavaDuration;
                    }
                    time=time+parseInt(specialCheck.duration)-1;
                }
            }
            specialCheck.endDate.setMinutes(specialCheck.endDate.getMinutes()+1);
        }
        return time/60;
    }
    //是否需要重新获取工厂日历工作时间信息
    function activeWorkTimeInfo(lineSn,begin,end){
        var startDate=new Date(begin);
        var endDate=new Date(end);
        if(workTime==null || workTime.length<=0){
            getWorkTimeInfo(lineSn,begin,end);
            this.workLineSn=lineSn;
            this.workStarMonth=startDate.getMonth();
            this.workEndMonth=endDate.getMonth();
        }
        else {
            if(lineSn!=this.workLineSn || startDate.getMonth()!=this.workStarMonth || endDate.getMonth()!=this.workEndMonth){
                getWorkTimeInfo(lineSn,begin,end);
                this.workLineSn=lineSn;
                this.workStarMonth=startDate.getMonth();
                this.workEndMonth=endDate.getMonth();
            }
        }
    }
    //获取工作时间/工作时间内的休息时间
    function getWorkTimeInfo(lineSn,begin,end){
        //初始化时间点变量
        var lineSpecial={
            areaSn:$("#col_PPC_AREA_SN").val(),
            workTime:[],
            restTime:[],
            isSat:$("#col_PPC_SAT_FLAG_1").is(":checked"),
            isSun:$("#col_PPC_SUN_FLAG_1").is(":checked")
        };
        //获取工作时间/工作时间内的休息时间
        $.ajax({
                type:"post",
                dataType:"json",
                async:false,
                url:dataUrl,
                data:{
                    operation:"getLineCalWorkTimeInfo",
                    lineSn:lineSn,
                    startTime:begin,
                    endTime:end
                },
                success:function(data){
                    if(null!=data && null!=data.ajaxMap){
                        //保存工作时间
                        if(data.ajaxMap.workTime!=null){
                            $(data.ajaxMap.workTime).each(function(index,time){
                                workTime.push({
                                    start:time.STARTTIME,
                                    end:time.ENDTIME,
                                    isInerDay:time.CALW_INTER_DAY
                                });
                            });
                        }
                        //保存工作时间内的休息时间
                        if(data.ajaxMap.restTime!=null){
                            $(data.ajaxMap.restTime).each(function(index,time){
                                restTime.push({
                                    start:time.STARTTIME,
                                    end:time.ENDTIME,
                                    isInerDay:time.CALW_INTER_DAY
                                });
                            });
                        }
                    }
                    else {
                        workTime=[];
                        restTime=[];
                    }
                    lineSpecial.workTime=workTime;
                    lineSpecial.restTime=restTime;
                    setInnerSpecial(lineSpecial);
                },
                error:function(error){
                    setInnerSpecial(lineSpecial);
                }
            });
    }
    //判定时间段是否存在重合
    function existsSameTime(ui,beginDate,endDate){
        //获取当前行
        var currentTr=$(ui).closest("tr");
        var currentType=$(currentTr[0]).find(".dept_select").val();//当前例外类型
        var currentIndex=currentTr[0].rowIndex;//获取选择行的索引
        var trList=$(ui).closest("tbody").find("tr");
        var trStart;
        var trEnd;
        var tr;
        var trStatrDate;
        var trEndDate;
        var extType;
        for(var i=0,len=trList.length;i<len;i++){
            if(trList[i].rowIndex==currentIndex){
                continue;
            }
            extType=$(trList[i]).find(".dept_select").val();//列外类型
            //加班类型可以和其他机种类型存在重复时间段（加班&加班不能存在相同；其他&其他不能存在相同）
            if(currentType!=extType && (currentType=="1" || extType=="1")){
                continue;
            }

            trStart=$(trList[i]).find(".WdateNomorl[id$='PPE_BEGIN_TIME']").val();//开始时间
            trEnd=$(trList[i]).find(".WdateNomorl[id$='PPE_END_TIME']").val();//结束时间
            if(typeof(trStart)!="undefined" && typeof(trEnd)!="undefined" && trStart!="" && trEnd!=""){
                trStatrDate=new Date(trStart);
                trEndDate=new Date(trEnd);
                if(beginDate>=trStatrDate && beginDate<=trEndDate){
                    return true;
                }
                if(endDate>=trStatrDate && endDate<=trEndDate){
                    return true;
                }
                if(beginDate<=trStatrDate && endDate>=trEndDate){
                    return true;
                }
            }
        }
        return false;
    }
    //周六/周天值改变时，重新赋值标识值
    function changeWeekDayFlag(){
        try{
            var areaSn=$("#col_PPC_AREA_SN").val();
            var isSat=$("#col_PPC_SAT_FLAG_1").is(":checked");
            var isSun=$("#col_PPC_SUN_FLAG_1").is(":checked");
            if(""!=areaSn){
                setWeekDayFlag(areaSn,isSat,isSun);
                //周末标识改变时，重新计算有效例外时间
                reCalExceptionDuration();
            }
        }
        catch(error){
            console.error(error);
        }
    }
    //周末标识改变时，重新计算有效例外时间
    function reCalExceptionDuration(){
        try{
            showLoading(true);
            var timeui=$("#tbody_8e3691f22e2f4d818b3b29cd5972c6e6").find("input[id$='PPE_BEGIN_TIME']");
            if(typeof(timeui)!="undefined"){
                for(var i=0,len=timeui.length;i<len;i++){
                    validateDate(timeui[i]);
                }
            }
            showLoading(false);
        }
        catch(error){
            console.error(error);
            showLoading(false);
        }
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
    //例外类型改变时，清空开始时间、结束时间和例外时长
    function excptionTypeChanged(ui){
        try{
            //获取开始时间、结束时间和例外时长
            var begin=$(ui).closest("tr").find(".WdateNomorl[id$='PPE_BEGIN_TIME']").val("");
            var end=$(ui).closest("tr").find(".WdateNomorl[id$='PPE_END_TIME']").val("");
            var duration=$(ui).closest("tr").find("input[id$='PPE_DURATION']").val("");
        }
        catch(error){
            console.error(error);
        }
    }
</script>
<script>(function($){
  $(window).on('load',function(){
    //setPopScroll('.scroll');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_10" />
    <jsp:param name="location" value="pageOver" />
</jsp:include>
