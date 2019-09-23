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
        <dict:lang value="产能日历" />
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
    <bu:header formId ="cc3ac92f89ad485caee993047912a29a"/>


    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

    <!-- page css -->
    <style>
        .hd img{
            vertical-align: middle;
        }

        table{
            border-collapse: collapse;

        }
        .tdSeqCell{
            height:56px;
            width:30px;
            text-align:center;
        }
        .tdRadioCell{
            width:30px;
            text-align:center;
        }
        .tdContentCell{
            width:150px;
            text-align:center;
        }
        .rightTable table td,.leftTable table td{
            border: 1px solid #dbe1ef;
            box-sizing: border-box;
            height: 28px;
            padding:0 5px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .leftTable{
            width: 511px;
            height:100%;
            float: left;
        }
        .rightTable{
            width: calc(100% - 511px);
            height:100%;
            float: left;
        }
        .leftTable>.bodyTable{
            width: 100%;
            height: calc(100% - 57px);
            overflow: hidden;
        }
        .rightTable>.headTable{
            overflow: hidden;
        }
        .rightTable>.bodyTable{
            width: 100%;
            height: calc(100% - 57px);
            overflow: auto;
        }
        .rightTable table{
            width:100%;
        }

        .headTable table tr{
            background-color:#e6eaf4;
            color:#666;
            font-size:15px;
        }


        .bodyTable table td{
            font-size:12px;
        }
        /* 左边表格每列宽度 */
        .leftTable table tr td:nth-of-type(1){
            width:30px;
            border-left: none;
            text-align:center;

        }
        .leftTable table tr td:nth-of-type(2){
            width: 30px;
            text-align:center;
        }
        .leftTable table tr td:nth-of-type(3){
            width: 100px;
        }
        .leftTable table tr td:nth-of-type(4){
            width: 100px;
        }
        .leftTable table tr td:nth-of-type(5){
            width: 100px;
        }
        .leftTable table tr td:nth-of-type(6){
            width: 100px;
        }
        /* 右边表格每列宽度 */
        .rightTable table tr td{
            text-align:center;
        }

        .rightTable table tr td:nth-of-type(1){
            border-left: none;
        }


        .bodyTable table tr:nth-of-type(2n){
            background-color:#f0f4fd;
        }
        
        .bodyTable table tr.selected{
            background-color:#d3eafc;
        }

        #calPlanContent{
            height:calc(100% - 30px);
        }

        .panel-ajax1{
            height:100%;
        }

        #calPlanContent table{
            table-layout: fixed;
            width:100%;
        }
        
        ._hover{
            background-color:#c3e2fb !important;
        }
    </style>
</head>

<body>
<div class="content-in">
    <div class="dlist">
        <div class="hd" id ="hdr">
            
            <bu:func viewId="a22fca0b7a634c5f8822c813cd57bc9f" />	
        <!--    <div class="">
                <dict:lang value="工作日"/>：<img src='${path}buss/facility/image/ico-workday.png'/>&nbsp;&nbsp;
                <dict:lang value="加班"/>：<img src='${path}buss/facility/image/ico-overtime.png'/>&nbsp;&nbsp;
                <dict:lang value="放假"/>：<img src='${path}buss/facility/image/ico-holiday.png'/>&nbsp;&nbsp;
                <dict:lang value="调休"/>：<img src='${path}buss/facility/image/ico-rest.png'/>&nbsp;&nbsp;
                <dict:lang value="设备维修"/>：<img src='${path}buss/facility/image/ico-dev.png'/>&nbsp;&nbsp;
                <dict:lang value="其他"/>：<img src='${path}buss/facility/image/ico-other.png'/>&nbsp;&nbsp;
                <dict:lang value="混合"/>：<img src='${path}buss/facility/image/ico-blend.png'/>&nbsp;&nbsp;
            </div>
            <div class="optn">
                <table class="func_table">
                    <tbody>
                    <tr>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick="addAjax()"><i class="ico ico-kl"></i><dict:lang value="新增"/></button>
                        </td>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick="multiAdd()"><i class="ico ico-kl"></i><dict:lang value="批量生成"/></button>
                        </td>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick="updateCal()"><i class="ico ico-xg"></i><dict:lang value="修改"/></button>
                        </td>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick="beforeDel()"><i class="ico ico-sc"></i><dict:lang value="删除"/></button>
                        </td>
                        <td align="right">
                            <button type="button" class="botton_img_add" onclick="query('formId1')"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            -->
        </div>
        <div class="bd">
            <div class="search-box">
                <table classs="search_table">
                    <tbody>
                    <tr>
                        <td> <!-- 机构查询条件 -->
                            <div class="group">
                                <div class="name" title="<dict:lang value='等于'/>"><dict:lang value="组织机构"/></div>
                                <div class="dec">
                                    <select id="dataAuth" name="dataAuth" class="dept_select"></select>
                                </div>
                            </div>
                        </td>
                        <td> <!-- 年份查询条件 -->
                            <div class="group">
                                <div class="name" title="<dict:lang value='等于'/>"><dict:lang value="年份"/></div>
                                <div class="dec">
                                    <select id="year" name="year" class="dept_select"></select>
                                </div>
                            </div>
                        </td>
                        <td> <!-- 月份查询条件 -->
                            <div class="group">
                                <div class="name" title="<dict:lang value='等于'/>"><dict:lang value="月份"/></div>
                                <div class="dec">
                                    <select id="month" name="month" class="dept_select"></select>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td> <!-- 线别 -->
                            <div class="group">
                                <div class="name" title="<dict:lang value='等于'/>"><dict:lang value="线别"/></div>
                                <div class="dec">
                                    <select id="areasn" name="areasn" class="dept_select"></select>
                                </div>
                            </div>
                        </td>
                        <td> <!-- 生产阶别 -->
                            <div class="group">
                                <div class="name" title="<dict:lang value='等于'/>"><dict:lang value="生产阶别"/></div>
                                <div class="dec">
                                    <select id="pstep" name="pstep" class="dept_select"></select>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" style="height:calc(100% - 78px);">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17" />
                    <jsp:param name="location" value="listForm" />
                </jsp:include>
                <input type="hidden" name="formPagecc3ac92f89ad485caee993047912a29a" id="formPagecc3ac92f89ad485caee993047912a29a" value="${formPagecc3ac92f89ad485caee993047912a29a}"/>
                <input type="hidden" name="formId" id="formId1" value='cc3ac92f89ad485caee993047912a29a'/>
                <input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='77e9058068fa456ab468268da97deaf4'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='8e3691f22e2f4d818b3b29cd5972c6e6'/>
                <input type="hidden" id="DATA_AUTH1" value=""/>
                <div id="calPlanContent">
                    <div class="panel-ajax1 datagrid datagrid-div1" style="height:100%">
                        <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" >
                            <!-- 产能日历主表信息 -->
                            <div class="leftTable">
                                <div class="headTable">
                                    <table>
                                        <tr>
                                            <td style="height:56px;width:30px; text-align:center;"></td>
                                            <td style="width:30px; text-align:center;"><input id="allchecked" type="checkbox"></td>
                                            <td style="width:150px; text-align:center;"><dict:lang value="组织机构"/></td>
                                            <td style="width:100px; text-align:center;"><dict:lang value="线别代码"/></td>
                                            <td style="width:100px; text-align:center;"><dict:lang value="线别名称"/></td>
                                            <td style="width:100px; text-align:center;"><dict:lang value="生产阶别"/></td>
                                            <td style="width:100px; text-align:center;"><dict:lang value="默认标志"/></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="bodyTable">
                                    <table id="calLeftTable"></table> <!-- 产能日历信息 -->
                                </div>
                            </div>
                            <!-- 日历时间 -->
                            <div class="rightTable">
                                <div class="headTable">
                                    <table id="rightHead">
                                        <tr id="rigthHeadTop">
                                            <td></td>
                                        </tr> <!-- 周序号 -->
                                        <tr id="rigthHeadMiddle">
                                            <td></td>
                                        </tr> <!-- 周明细 -->
                                    </table>
                                </div>
                                <div class="bodyTable">
                                    <table id="calRigthTable"></table> <!-- 产能日历时间信息 -->
                                </div>
                            </div>
                        </div>
            </form>
            <div class="center">
                <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=query&formId=formId1&showLoading=0" />
            </div>
        </div>
    </div>
</div>
<bu:submit viewId="a22fca0b7a634c5f8822c813cd57bc9f" />
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="beforeJsLoad" />
</jsp:include>
<bu:script viewId="a22fca0b7a634c5f8822c813cd57bc9f" />

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="jsLoading" />
</jsp:include>

<script>
    //点击行选中begin
    $(function(){
         var temps="<div class=''>"
               + 	"<dict:lang value='工作日'/>：<img src='${path}buss/facility/image/ico-workday.png'/>&nbsp;&nbsp; "
               +" <dict:lang value='加班'/>：<img src='${path}buss/facility/image/ico-overtime.png'/>&nbsp;&nbsp;"
                +" <dict:lang value='放假'/>：<img src='${path}buss/facility/image/ico-holiday.png'/>&nbsp;&nbsp; "
               +"  <dict:lang value='调休'/>：<img src='${path}buss/facility/image/ico-rest.png'/>&nbsp;&nbsp; "
               +"  <dict:lang value='设备维修'/>：<img src='${path}buss/facility/image/ico-dev.png'/>&nbsp;&nbsp; "
              +"   <dict:lang value='其他'/>：<img src='${path}buss/facility/image/ico-other.png'/>&nbsp;&nbsp; "
               +"  <dict:lang value='混合'/>：<img src='${path}buss/facility/image/ico-blend.png'/>&nbsp;&nbsp; "
           +"  </div> ";
        	$("#hdr").append(temps);
        
    });
    //行点击事件
    $('#calLeftTable,#calRigthTable').on('click','tr',function(){
        var index = $(this).index()   //获取当前点击的是第几行
        $('#calLeftTable tr').eq(index).addClass('selected').siblings().removeClass('selected') //左边行变色
        $('#calRigthTable tr').eq(index).addClass('selected').siblings().removeClass('selected') //右边行变色	
        Selected()
    })
    
    //复选框点击事件
    $('#calLeftTable').on('click','tr :checkbox',function(e){
        var index = $(this).parents('tr').index()      //获取当前点击的是第几行
        if($(this).parents('tr').hasClass('selected')){  //如果已钩则取消  反之打钩
            $(this).parents('tr').removeClass('selected')
            $('#calRigthTable tr').eq(index).removeClass('selected')
        }else{
            $(this).parents('tr').addClass('selected')    
            $('#calRigthTable tr').eq(index).addClass('selected')
        }
        e.stopPropagation(); //阻止事件冒泡（兼容性待验证）
    })
    	
    //全选按钮
    $('#allchecked').click(function(){
        if($(this).is(':checked')){
            $('#calLeftTable tr').addClass('selected')
            $('#calRigthTable tr').addClass('selected')
        }else{
            $('#calLeftTable tr').removeClass('selected')
            $('#calRigthTable tr').removeClass('selected')
        }
        Selected()
    })
    
    //为带有.seclcted的行的复选框打钩
    function Selected(){
        $('#calLeftTable').find(':checkbox').removeAttr('checked') 	           //取消所有的复选框
        $('#calLeftTable .selected').find(':checkbox').prop('checked','true')  //为带有.seclcted的行的复选框打钩
    }
    
    //鼠标经过行变色
    $('#calLeftTable').on('mouseover','tr',function(){
        var index = $(this).index()
        $('#calLeftTable tr').eq(index).addClass('_hover')
        $('#calRigthTable tr').eq(index).addClass('_hover')
    })
    
    $('#calLeftTable').on('mouseout','tr',function(){
        var index = $(this).index()
        $('#calLeftTable tr').eq(index).removeClass('_hover')
        $('#calRigthTable tr').eq(index).removeClass('_hover')
    })
    
    $('#calRigthTable').on('mouseover','tr',function(){
        var index = $(this).index()
        $('#calLeftTable tr').eq(index).addClass('_hover')
        $('#calRigthTable tr').eq(index).addClass('_hover')
    })
    
    $('#calRigthTable').on('mouseout','tr',function(){
        var index = $(this).index()
        $('#calLeftTable tr').eq(index).removeClass('_hover')
        $('#calRigthTable tr').eq(index).removeClass('_hover')
    })
    
    //点击行选中end
    
    //变量
    var dataUrl=null;
    var week=[];
    var weekdays=7;//每周7天
    var defaultwidth=50;
    var defaultheight=20;
    var paginationImpl = {};
    var messageLang=[];//提示框多语言
    var png_1="<div><img src='${path}buss/facility/image/ico-overtime.png'/></div>";//加班
    var png_2="<div><img src='${path}buss/facility/image/ico-holiday.png'/></div>";//放假
    var png_3="<div><img src='${path}buss/facility/image/ico-rest.png'/></div>";//调休
    var png_4="<div><img src='${path}buss/facility/image/ico-dev.png'/></div>";//设备维修
    var png_5="<div><img src='${path}buss/facility/image/ico-other.png'/></div>";//其他
    var png_6="<div><img src='${path}buss/facility/image/ico-workday.png'/></div>";//上班
    var png_7="<div><img src='${path}buss/facility/image/ico-blend.png'/></div>";//混合
    var no_default_flag="<div style='vertical-align: middle;text-align: center;'><img src='${path}plf/page/fp/img/ico-state.png'/></div>";
    var default_flag="<div style='vertical-align: middle;text-align: center;'><img src='${path}plf/page/fp/img/ico-state-h.png'/></div>";
    //界面加载完成后执行
    $(function(){
        //获取数据URL
        dataUrl=getDataUrl();
        //初始化多语言
        initLang();
        //绑定查询条件
        getDataAuth("operation=getUserDataAuth",false);
        getSeachYear();
        getSeachMonth();
        //最后绑定控件事件
        bindEvent();
        //初始化函数
        initial();
        //初始化数据
        getCalendarInfo("");
    });
    //自定义函数
    //获取组织机构
    function getDataAuth(data,async){
        $.ajax({
            type:"POST",
            dataType:"json",
            url:dataUrl,
            data:data,
            async:async,
            success:function(data){
                if(null==data){
                    getEmptyOption($("#dataAuth"));
                    return;
                }
                else{
                    var dataList=data.ajaxList;
                    var len=dataList.length;
                    getEmptyOption($("#dataAuth"));
                    for(var i=0;i<len;i++){
                        $("#dataAuth").append("<option value='"+dataList[i].ID+"' class='select_name'>"+dataList[i].NAME+"</option>");
                    }
                    $("#dataAuth").find("option[value='']").attr("selected",true);
                    $("#dataAuth").trigger("chosen:updated");

                    //绑定线体
                    getLineArea("operation=getLineArea&dataAuth="+$("#dataAuth").children("option:selected").val(),false);
                }
            },
            error:function(){}
        });
    }
    //获取查询条件：年份
    function getSeachYear(){
        var currentYear=parseInt((new Date()).getFullYear());
        var startYear=currentYear-10;
        var endYear=startYear+20;
        $("#year").empty();
        for(var i=startYear;i<endYear;i++){
            $("#year").append("<option value='"+i+"' class='select_name'>"+i+"</option>");
        }
        $("#year").find("option[value="+currentYear+"]").attr("selected",true);
        $("#year").trigger("chosen:updated");
    }
    //获取查询条件：月份 值需-1
    function getSeachMonth(){
        $("#month").empty();
        for(var i=1;i<=12;i++){
            $("#month").append("<option value='"+(i-1)+"' class='select_name'>"+i+"</option>");
        }
        $("#month").trigger("chosen:updated");
    }
    //绑定线体
    function getLineArea(data,async){
        $.ajax({
            type:"POST",
            dataType:"json",
            url:dataUrl,
            data:data,
            async:async,
            success:function(data){
                if(data==null){
                    getEmptyOption(optElem);
                    return;
                }
                else {
                    var dataList=data.ajaxList;
                    var len=dataList.length;
                    getEmptyOption($("#areasn"));
                    for(var i=0;i<len;i++){
                        $("#areasn").append("<option value='"+dataList[i].CA_ID+"' class='select_name'>"+dataList[i].CA_NAME+"</option>");
                    }
                    $("#areasn").find("option[value='']").attr("selected",true);
                    $("#areasn").trigger("chosen:updated");
                    resetDropSearch("areasn");
                    $("#areasn_chosen").css("width","240px");

                    //绑定生产阶别
                    getStep("operation=getProductStep&areaSn="+$("#areasn").children("option:selected").val(),false);
                }
            },
            error:function(){}
        });
    }
    //绑定生产阶别
    function getStep(data,async){
        $.ajax({
            type:"POST",
            dataType:"json",
            url:dataUrl,
            data:data,
            async:async,
            success:function(data){
                if(data==null){
                    getEmptyOption($("#pstep"));
                    return;
                }
                else {

                    var dataList=data.ajaxList;
                    var len=dataList.length;
                    getEmptyOption($("#pstep"));
                    for(var i=0;i<len;i++){
                        $("#pstep").append("<option value='"+dataList[i].CODE+"' class='select_name'>"+dataList[i].VALUE+"</option>");
                    }
                    $("#pstep").find("option[value='']").attr("selected",true);
                    $("#pstep").trigger("chosen:updated");
                }
            },
            error:function(){}
        });
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
    //初始化函数
    function initial(){
        var currentDate=new Date();
        //默认月选中当前月
        $("#month").find("option[value="+currentDate.getMonth()+"]").attr("selected",true);
    }
    //绑定控件事件
    function bindEvent(){
        //组织机构
        $("#dataAuth").change(function(){
            var selectedVal=$(this).children("option:selected").val();
            getLineArea("operation=getLineArea&dataAuth="+selectedVal,true);
        });
        //线别
        $("#areasn").change(function(){
            var selectedVal=$(this).children("option:selected").val();
            getStep("operation=getProductStep&areaSn="+selectedVal,true);
        });
    }
    //获取数据url
    function getDataUrl(){
        return "${path}buss/bussModel_exeFunc.ms?funcMId=f28b85cd9ae645f48dfcb902dad10c50";
    }
    //初始化下拉框
    function getEmptyOption(elem){
        elem.empty();
        elem.append("<option value='' class='select_name'>--<dict:lang value='请选择'/>--</option>");
    }
    //获取产能日历数据
    function getCalendarInfo(page){
        //组织机构、年份、月份、线别、生产阶别
        var dataAuth=$("#dataAuth option:selected").val();
        var year=$("#year option:selected").val();
        var month=$("#month option:selected").val();
        var areaSn=$("#areasn option:selected").val();
        var step=$("#pstep option:selected").val();
        //查询数据
        //var data="operation=getCalendarInfo&dataAuth="+dataAuth+"&year="+year+"&month="+(parseInt(month)+1)+"&areaSn="+areaSn+"&step="+step+page;
        var data={
            operation:"getCalendarInfo",
            dataAuth:dataAuth,
            year:year,
            month:parseInt(month)+1,
            areaSn:areaSn,
            step:step,
            currentPage:page.currentPage,
            pageRecord:page.pageRecord
        };
        showLoading(true);
        $.ajax({
            type:"POST",
            dataType:"json",
            url:dataUrl,
            data:data,
            success:function(data){
                $("#calLeftTable").empty();//产能日历主表对象容器
                $("#calRigthTable").empty();//清空时段对象容器
                if(data==null||data.ajaxList==null){
                    //绘制时段
                    loadExceptionHead(year,month,[]);
                    showLoading(false);
                    pageFun(data.ajaxPage,"formId1");
                    return;
                }
                else{
                    //生成产能日历信息
                    var dataList=data.ajaxList;
                    console.log(dataList);
                    var len=dataList.length-1;
                    $("#DATA_AUTH1").val(dataList[len].userDataAuth);
                    for(var i=0;i<len;i++){
                        //主表信息
                        var calId=dataList[i].ID;
                        $("#calLeftTable").append("<tr id='calLeft_"+calId+"'></tr>");
                        $("#calLeftTable tr:last").append("<td style='width:30px; text-align:center;'>"+(i+1)+"</td>")
                        $("#calLeftTable tr:last").append("<td style='width:30px; text-align:center;'><input id='"+calId+"' type='checkbox'></td>")
                        if(dataList[i].DATA_AUTH==null){
                            dataList[i].DATA_AUTH="";
                        }
                        $("#calLeftTable tr:last").append("<td style='width:150px;text-align:center; '>"+dataList[i].DATA_AUTH+"<input type='hidden' id='DATA_AUTH_ID_"+calId+"' value='"+dataList[i].DATA_AUTH_ID+"'></td>");
                        if(dataList[i].PPC_AREA_SN==null){
                            dataList[i].PPC_AREA_SN="";
                        }
                        $("#calLeftTable tr:last").append("<td>"+dataList[i].PPC_AREA_SN+"</td>");
                        if(dataList[i].CA_NAME==null){
                            dataList[i].CA_NAME="";
                        }
                        $("#calLeftTable tr:last").append("<td>"+dataList[i].CA_NAME+"</td>");
                        if(dataList[i].STEP_NAME==null){
                            dataList[i].STEP_NAME="";
                        }
                        $("#calLeftTable tr:last").append("<td>"+dataList[i].STEP_NAME+"</td>");
                        if(dataList[i].PPC_DEFAULT_FLAG==null){
                            dataList[i].PPC_DEFAULT_FLAG="N";
                        }
                        //默认标识改为图片
                        var img;
                        if(dataList[i].PPC_DEFAULT_FLAG=="N"){
                            img=no_default_flag;
                        }
                        else {
                            img=default_flag;
                        }
                        $("#calLeftTable tr:last").append("<td>"+img+"</td>");
                        //$("#calLeftTable tr:last").append("<td>"+dataList[i].PPC_DEFAULT_FLAG+"</td>");
                        //时段信息
                        $("#calRigthTable").append("<tr id='calRight_"+calId+"'></tr>")
                    }
                    //生成日历时段信息
                    loadExceptionHead(year,month,dataList);
                    loadExceptionContent(dataList);
                    pageFun(data.ajaxPage,"formId1");
                    showLoading(false);
                }
            },
            error:function(msg){
                showMessage(3,messageLang[0],false);
                showLoading(false);
            }
        });
    }
    //查询
    function query(paginationImpl){
    
       var formId = $("#formId1").val();
    console.log("formId::"+formId);
        	console.log(paginationImpl);
      //  firstLoadThisPage(formId);
      //   firstLoadThisPage(paginationImpl);
     //   var pagevar="&currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
        var pagevar={
            currentPage:_GLO_FORM_PAGE_MAP["formId1"].currentPage,
            pageRecord:_GLO_FORM_PAGE_MAP["formId1"].pageRecord
            
        };
        console.log(pagevar);
        getCalendarInfo(pagevar);
    }
    //修改
   /* function updateCal(){
        var len=$("#calLeftTable :checkbox[checked='checked']").length;
        if (len != 1) {
            showMessage(1,messageLang[1],false);
            return false;
        }
        else {
            var checkedId = $("#calLeftTable :checkbox[checked='checked']").attr("id");
            ajaxEdit(checkedId);
        }
    }*/
    //删除前询问
    function beforeDel1(){
        var len=$("#calLeftTable :checkbox[checked='checked']").length;
        if (len <=0) {
            showMessage(1,messageLang[1],false);
            return false;
        }
        utilsFp.confirmIcon(1,"","deleteCal","", "<dict:lang value='是否确认删除？' />",1,"260","");
    }
    //删除
    function deleteCal(){
        var idList=new Array();
        $("#calLeftTable :checkbox[checked='checked']").each(function(){
            idList.push("'"+$(this).attr("id")+"'");
        });

        var data="operation=delete&dataId="+idList;
        $.ajax({
            type:"POST",
            dataType:"json",
            url:dataUrl,
            data:data,
            success:function(data){
                showPopMessage(messageLang[2],false);
                //刷新界面数据
                query("formId1");
            },
            error:function(msg){
                showMessage(3,messageLang[3],false);
            }
        });
    }
    //绘制时段头
    function loadExceptionHead(year,month,data){
        $("#rigthHeadTop").empty();
        $("#rigthHeadMiddle").empty();
        var weekindex=1;//当前绘制的周索引，若重新绘制，需初始化为1
        var drawdays=0;//总绘制天数，若重新绘制，需出生为0
        var days=0;//需要绘制的总天数
        if(month==null || month=="" || typeof(month)=="undefined"){
            for(var m=1;m<=12;m++){
                date=new Date(year,m,0);
                days=days+date.getDate();
            }
            date=new Date(year,1,1);//设置开始时间
        }
        else {
            date=new Date(year,month,0);
            days=date.getDate();
            date=new Date(year,month,1);//设置开始时间
            //若起始时间不为周一，则倒推到周一
            var vDay=date.getDay()==0?7:date.getDay();
            if(date.getDay()!=1){
                date.setDate(date.getDate()-(vDay-1));
                days+=vDay-1;
            }
        }
        var num=0;
        var dayinweek;//一周中的第几天
        var colspan;
        var dayindex;
        var from;
        var to;
        var vardate;
        var tick;
        while(num<=days){
            //绘制周
            dayinweek=date.getDay();
            colspan=weekdays-(dayinweek==0?weekdays:dayinweek)+1;//计算周跨度
            //获取周开始日期&结束日期
            tick=date.getTime();
            vardate=new Date(tick);
            from=vardate.getFullYear()+"/"+(vardate.getMonth()+1)+"/"+vardate.getDate();
            vardate.setDate(vardate.getDate()+colspan-1);
            to=vardate.getFullYear()+"/"+(vardate.getMonth()+1)+"/"+vardate.getDate();
            $("#rigthHeadTop").append("<td colspan='"+colspan+" style='text-align:center;width:"+(colspan*defaultwidth)+"px;'><dict:lang value='第'/>"+weekindex+"<dict:lang value='周'/>("+from+"-"+to+")</td>");
            //绘制天
            for(var i=0;i<colspan;i++){
                dayinweek=date.getDay();
                dayindex=dayinweek%weekdays;
                $("#rigthHeadMiddle").append("<td style='width:"+defaultwidth+"px;'>"+week[dayindex]+"</td>");
                //绘制数据内容
                for(var k=0;k<data.length;k++){
                    var id=data[k].ID+"_"+year+"_"+(date.getMonth()+1)+"_"+date.getDate();
                    //判定周六or周日是否上班
                    var png=png_6;//上班标识
                    if(date.getDay()==6 && data[k].PPC_SAT_FLAG=="N"){
                        png="";
                    }
                    else if(date.getDay()==0 && data[k].PPC_SUN_FLAG=="N"){
                        png="";
                    }
                    //绘制
                    $("#calRight_"+data[k].ID).append("<td id="+id+" style='width:"+defaultwidth+"px;' set='N'>"+png+"</td>");
                }
                num++;
                drawdays++;
                date.setDate(date.getDate()+1);//累加天数
            }
            weekindex++;//累计周索引
        }
        //计算时间容器总宽度
        var totalwidth=drawdays*defaultwidth;
        $("#rightHead").width(totalwidth);
        $("#calRigthTable").width(totalwidth);
    }
    //绘制时段内容
    function loadExceptionContent(data,month){
        if(data==null || data==undefined){
            return;
        }
        var len=data.length;
        for(var i=0;i<len;i++){
            var exp=data[i].dataDetList;
            if(exp==null || exp==undefined){
                continue;
            }
            var lenExp=exp.length;
            for(var j=0;j<lenExp;j++){
                //获取开始时间
                var startDate=new Date(exp[j].PPE_BEGIN_TIME);
                var endDate=new Date(exp[j].PPE_END_TIME);
                //若month不为空，则要进行开始时间和结束时间的跨月处理
                if(month!=null)
                {
                    //开始时间
                    if(startDate.getMonth()<month)
                    {
                        start.setMonth(month);
                        start.setDate(1);
                    }
                    if(endDate.getMonth()>month)
                    {
                        endDate.setMonth(month);
                        endDate.setDate(daysInMonth(endDate.getFullYear(),month));
                    }
                }
                startDate.setHours(0,0,0);
                endDate.setHours(0,0,0);
                while(startDate<=endDate){
                    var id=exp[j].PPC_ID+"_"+startDate.getFullYear()+"_"+(startDate.getMonth()+1)+"_"+startDate.getDate();
                    var png;
                    if($("#"+id+"").attr("set")=="Y")
                    {
                        png=png_7;
                    }
                    else
                    {
                        var expType=exp[j].PPE_EXECPTION_TYPE;//例外类型
                        if(expType==1){
                            png=png_1;
                        }
                        else if(expType==2){
                            png=png_2;
                        }
                        else if(expType==3){
                            png=png_3;
                        }
                        else if(expType==4){
                            png=png_4;
                        }
                        else if(expType==5){
                            png=png_5;
                        }
                    }
                    $("#"+id+"").empty().append(png).attr("set","Y");
                    startDate.setDate(startDate.getDate()+1);
                }
            }
        }
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
    //显示进度条
    function showLoading(isShow){
        if(isShow){
            util.showLoading();
        }
        else {
            util.closeLoading();
        }
    }
    //添加滚动条
    (function($){
        $(window).on('load',function(){
            setPopScroll('#calPlanContent .rightTable .bodyTable','#calPlanContent .rightTable .headTable','#calPlanContent .leftTable>.bodyTable');
        })
    })(jQuery);
    //获取对应月份中有多少天
    function daysInMonth(year,month){
        var date=new Date(year,month,0);
        return date.getDate();
    }
    //全选
    //function selectAll(){
    //    var isChecked=$("#allchecked").attr("checked");
    //    if(typeof (isChecked)=="undefined"){
    //        isChecked=false;
    //    }
    //    else {
    //        isChecked=true;
    //    }
    //    $("#calLeftTable :checkbox").each(function(){
    //        $(this).attr("checked",isChecked);
    //    });
    //}
    //初始化多语言信息
    function initLang(){
        try{
            week.push("<dict:lang value='日'/>");
            week.push("<dict:lang value='一'/>");
            week.push("<dict:lang value='二'/>");
            week.push("<dict:lang value='三'/>");
            week.push("<dict:lang value='四'/>");
            week.push("<dict:lang value='五'/>");
            week.push("<dict:lang value='六'/>");
            //提示框多语言
            messageLang[0]="<dict:lang value='查询失败！'/>";
            messageLang[1]="<dict:lang value='请选择一条记录！'/>";
            messageLang[2]="<dict:lang value='删除成功！'/>";
            messageLang[3]="<dict:lang value='删除失败！'/>";
        }
        catch(error){
            console.error(error);
        }
    }
    //批量生成
    function multiAdd(){
        try{
            var urlDetail = "${path}buss/bussModel.ms?exeid=b8311995e18c412db3a15dbe2837b42b&formId=cc3ac92f89ad485caee993047912a29a&iframeId="+_currentFrame;
            showPopWinFp(urlDetail , 700, 600,null,"<dict:lang value='批量生成'/>","1");
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
