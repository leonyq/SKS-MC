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
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->

	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                </div>
			    <div class="optn">
                    <button type="button" onclick="submitReport();"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="9b18994844b049f2ad90204b77793334" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9b18994844b049f2ad90204b77793334" />
	<input type="hidden" id="prefixInd" name="9b18994844b049f2ad90204b77793334" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'137c003477bb4cfa9e179a7e6d631d10'" />
		<s:set name="_$formId_1" value="'9b18994844b049f2ad90204b77793334'" />
		<s:set name="_$type" value="'add'" />
        <tr>
            <td class="name" style="width: 100px;text-align: right;"><dict:lang value="制令单号"/></td>
            <td class="dec" style="width: 120px;text-align: left;">
                <input type="text" id="col_PM_MO_NUMBER" class="input" readonly="readonly">
            </td>
            <td class="name" style="width: 100px;text-align: right;"><dict:lang value="机种"/></td>
            <td class="dec" style="width: 120px;text-align: left;">
                <input type="text" id="col_PM_MODEL_CODE" class="input" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td class="name" style="width: 100px;text-align: right;"><dict:lang value="机种名称"/></td>
            <td class="dec" style="width: 120px;text-align: left;">
                <input type="text" id="col_CI_ITEM_NAME" class="input" readonly="readonly">
            </td>
            <td class="name" style="width: 100px;text-align: right;"><dict:lang value="机种规格"/></td>
            <td class="dec" style="width: 120px;text-align: left;">
                <input type="text" id="col_CI_ITEM_SPEC" class="input" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td class="name" style="width: 100px;text-align: right;"><dict:lang value="计划数量"/></td>
            <td class="dec" style="width: 120px;text-align: left;">
                <input type="text" id="col_PM_TARGET_QTY" class="input" readonly="readonly">
            </td>
            <td class="name" style="width: 100px;text-align: right;"><dict:lang value="投入数量"/></td>
            <td class="dec" style="width: 120px;text-align: left;">
                <input type="text" id="col_PM_INPUT_COUNT" class="input" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td class="name" style="width: 100px;text-align: right;"><dict:lang value="完工数量"/></td>
            <td class="dec" style="width: 120px;text-align: left;">
                <input type="text" id="col_PM_FINISH_COUNT" class="input" readonly="readonly">
            </td>
            <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="报工线体"/></td>
            <td class="dec" style="width: 120px;text-align: left;">
                <select id="col_FINISH_LINE" class="dept_select" style="width: 230px;"></select>
            </td>
        </tr>
        <tr>
            <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="报工工序"/></td>
            <td class="dec" style="width: 120px;text-align: left;">
                <select id="col_FINISH_GROUP" class="dept_select" style="width: 230px;"></select>
            </td>
            <td class="name" style="width: 100px;text-align: right;"><span class="dot">*</span><dict:lang value="报工数量"/></td>
            <td class="dec" style="width: 120px;text-align: left;">
                <input type="text" id="col_FINISH_NUM" class="input">
            </td>
        </tr>
	</table>
			<bu:jsVal formId="9b18994844b049f2ad90204b77793334" formIndex="1" />
				
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

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<script>
    //变量
    var dataUrl;
    var currentMonunber="${param.monumber}";//获取当前制令单号
    var moStartGroup;//制令单起始工序
    var moEndGroup;//制令单结束工序
    var poStartGroup;//工单起始工序
    var poEndGroup;//工单结束工序
    var routeId;//流程ID
    $(function(){
        //初始化函数
        initial();
        //加载制令单信息
        loadMoInfo(currentMonunber);
    });
    //初始化函数
    function initial(){
        try{
            //初始化数据URL
            dataUrl=getDataUrl();  
        }
        catch(error){
            console.error(error);
        }
    }
    //数据交互类URL
    function getDataUrl(){
        return "${path}buss/bussModel_exeFunc.ms?funcMId=0a55ece729dd4e39b29eee961b8ad495";
    }
    //加载制令单信息
    function loadMoInfo(monumber){
        try{
            //加载制令单基本信息
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                data:{
                    opt:"getAddMoNumberInfo",
                    moNumber:monumber
                },
                success:function(data){
                    if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                        var moNumberInfo=data.ajaxList[0];
                        $("#col_PM_MO_NUMBER").val(moNumberInfo.PM_MO_NUMBER);
                        $("#col_PM_MODEL_CODE").val(moNumberInfo.PM_MODEL_CODE);
                        $("#col_CI_ITEM_NAME").val(moNumberInfo.CI_ITEM_NAME);
                        $("#col_CI_ITEM_SPEC").val(moNumberInfo.CI_ITEM_SPEC);
                        $("#col_PM_TARGET_QTY").val(moNumberInfo.PM_TARGET_QTY);
                        $("#col_PM_INPUT_COUNT").val(moNumberInfo.PM_INPUT_COUNT);
                        $("#col_PM_FINISH_COUNT").val(moNumberInfo.PM_FINISH_COUNT);
                    }
                },
                error:function(error){
                    console.error(error);
                }
            });
            //加载线体
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                data:{
                    opt:"getLineInfo",
                    moNumber:monumber
                },
                success:function(data){
                    $("#col_FINISH_LINE").empty();
                    $("#col_FINISH_LINE").append("<option value='' class='select_name'>--<dict:lang value='请选择'/>--</option>");
                    if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                        data.ajaxList.forEach((line,index,array)=>{
                            $("#col_FINISH_LINE").append("<option value='"+line.CA_ID+"' class='select_name'>"+line.CA_NAME+"</option>");
                        });
                    } 
                    $("#col_FINISH_LINE").find("option[value='']").attr("selected",true);
                    //resetDropSearch("col_FINISH_LINE");
                    $("#col_FINISH_LINE").trigger("chosen:updated");
                },
                error:function(error){
                    console.error(error);
                }
            });
            //加载制令单流程工序
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                data:{
                    opt:"getMoRouteGroup",
                    moNumber:monumber
                },
                success:function(data){
                    $("#col_FINISH_GROUP").empty();
                    $("#col_FINISH_GROUP").append("<option value='' class='select_name'>--<dict:lang value='请选择'/>--</option>");
                    if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                        data.ajaxList.forEach((route,index,array)=>{
                            $("#col_FINISH_GROUP").append("<option value='"+route.CRC_STEP_SEQU+"&"+route.CRC_GROUP_CODE+"' class='select_name'>"+route.GROUP_NAME+"</option>");
                            if(route.IS_MO_START_GROUP=="Y"){
                                moStartGroup=route.CRC_GROUP_CODE;
                            }
                            if(route.IS_MO_END_GROUP=="Y"){
                                moEndGroup=route.CRC_GROUP_CODE;
                            }
                            if(route.IS_PO_START_GROUP=="Y"){
                                poStartGroup=route.CRC_GROUP_CODE;
                            }
                            if(route.IS_PO_END_GROUP=="Y"){
                                poEndGroup=route.CRC_GROUP_CODE;
                            }
                            if(null==routeId || typeof(routeId)=="undefined"){
                                routeId=route.CR_ROUTE_ID;
                            }
                        });
                    } 
                    $("#col_FINISH_GROUP").find("option[value='']").attr("selected",true);
                    //resetDropSearch("col_FINISH_GROUP");
                    $("#col_FINISH_GROUP").trigger("chosen:updated");
                },
                error:function(error){
                    console.error(error);
                }
            });
        }
        catch(error){
            console.error(error);
        }
    }
    //重置下达中线体下拉框搜索功能
    function resetDropSearch(id){
        //下达中的下拉框搜索
        $("#"+id).chosen("destroy");
        if($("#"+id+" option").size()>3){
            $("#"+id).chosen({search_contains: true});
                $("#"+id+"_chosen .chosen-search").css("display","block");
        }else{
            $("#"+id).chosen();
        }
    }
    //提交前校验界面数据
    function beforeSubmit(){
        try{
            if($("#col_FINISH_LINE").val()==""){
                showMessage(1,"<dict:lang value='请选择报工线体'/>")
                return false;
            }
            if($("#col_FINISH_GROUP").val()==""){
                showMessage(1,"<dict:lang value='请选择报工工序'/>")
                return false;
            }
            if($("#col_FINISH_NUM").val()==""){
                showMessage(1,"<dict:lang value='请输入报工数量'/>")
                return false;
            }
            return true;
        }
        catch(error){
            console.error(error);
        }
    }
    //提交报工数据
    function submitReport(){
        try{
            if(!beforeSubmit()){
                return;
            }
            //参数
            var param={};
            param.opt="moReport";
            param.moNumber=currentMonunber;
            param.line=$("#col_FINISH_LINE").val();
            
            var groupInfo=$("#col_FINISH_GROUP").val().split("&");
            param.groupSeq=groupInfo[0];
            param.groupCode=groupInfo[1];

            param.reportNum=$("#col_FINISH_NUM").val();
            param.isMoStartGroup=param.groupCode==moStartGroup?"Y":"N";
            param.isMoEndGroup=param.groupCode==moEndGroup?"Y":"N";
            param.isPoStartGroup=param.groupCode==poStartGroup?"Y":"N";
            param.isPoEndGroup=param.groupCode==poEndGroup?"Y":"N";
            param.isOutputFace="Y";
            param.face="A";
            param.track="S";
            param.routeId=routeId;
            showLoading(true);
            //执行
            var result="-1";//接收结果
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                async:false,
                data:param,
                success:function(data){
                    if(null!=data && null!=data.ajaxList && data.ajaxList.length>0){
                        result=data.ajaxList[0].result;
                    }
                    showLoading(false);
                },
                error:function(error){
                    showLoading(false);
                    console.error(error);
                }
            });
            if("-1"==result){
                showMessage(1,"<dict:lang value='处理报工数据异常'/>");
                return ;
            }
            else if("1"==result){
                showMessage(1,"<dict:lang value='制令单报工数量与完工数量之和大于计划数量'/>");
                return ;
            }
            else if("2"==result){
                showMessage(1,"<dict:lang value='工单报工数量与完工数量之和大于计划数量'/>");
                return ;
            }
            else if("3"==result){
                showMessage(1,"<dict:lang value='工厂日历信息校验失败'/>");
                return ;
            }
            else if("4"==result){
                showMessage(1,"<dict:lang value='产品生产统计计算失败'/>");
                return ;
            }
            else if("5"==result){
                showMessage(1,"<dict:lang value='工序统计计算失败'/>");
                return ;
            }
            else if("6"==result){
                showMessage(1,"<dict:lang value='阶别统计计算失败'/>");
                return ;
            }
            //成功提示
            showPopMessage("<dict:lang value='报工成功'/>")
            //刷新主界面数据
            top.$("#"+window.frameElement.name)[0].contentWindow.refershList();
            //判定是否要关闭窗体
            if($("#isCloseWin").attr("checked")=="checked"){
                //关闭窗体
                closeTopPopWinFp(window.frameElement.id + "pop");
            }
        }
        catch(error){
            showLoading(false);
            console.error(error);
        }
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
    //消息提示
    //** type 1：警告；2：成功；3：失败；4：疑问；5：锁定
    //** msg 消息
    function showMessage(type,msg){
        utilsFp.confirmIcon(type,"","","", msg,0,"260","");
    }
    //右侧底角弹出消息
    function showPopMessage(msg){
        try{
             msgPop(msg,"","<dict:lang value='提示' />",200,150,3000);
        }
        catch(error){
            console.error(error);
        }
    }
</script>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
