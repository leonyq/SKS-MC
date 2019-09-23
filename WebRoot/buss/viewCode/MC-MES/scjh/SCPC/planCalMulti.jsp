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
	<title><dict:lang value="批量生成" />
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
    <script src="${path}buss/aps/week/gantt_libs/date.js"></script>
	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <!-- <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>-->
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
			        <button type="button" onclick="save();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="cc3ac92f89ad485caee993047912a29a" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="cc3ac92f89ad485caee993047912a29a" />
	<input type="hidden" id="prefixInd" name="cc3ac92f89ad485caee993047912a29a" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b8311995e18c412db3a15dbe2837b42b'" />
		<s:set name="_$formId_1" value="'cc3ac92f89ad485caee993047912a29a'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><span class="dot">*</span><dict:lang value='来源线别'/></td>
			<bu:td cssClass="dec-self" colNo="PPC_AREA_SN" formId="cc3ac92f89ad485caee993047912a29a" ><bu:ui colNo="PPC_AREA_SN" formId="cc3ac92f89ad485caee993047912a29a" value="%{PPC_AREA_SN}" formIndex="1" /></bu:td>
        </tr>
        <tr>
            <input type="hidden" id="linelist" name="linelist" value=''></input>  
        </tr>
	</table>
			<bu:jsVal formId="cc3ac92f89ad485caee993047912a29a" formIndex="1" />		<div style="padding:1px;"></div>
            <div>
                <div class="mod">
                    <div class="mod-hd"> 
                        <h3 class="tit"><dict:lang value="产能日历例外信息" /></h3>
                    </div>
                    <div class="mod-bd" >
                        <div class="panel datagrid datagrid-div1">
                            <div class="datagrid-div2 datagrid-div6 datagrid-view"   >
                                <div class="datagrid-header" >
                                    <div class="datagrid-header-inner" id="datagrid-header-inner8e3691f22e2f4d818b3b29cd5972c6e6">
                                        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable454cc1d04a9240f4868ccffb52793896">
                                        <s:set name="_$type" value="'view'" />
                                        <tbody class="isParentsTitle">
                                        <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax"> 
                                            <td style="width:30px;text-align: center;"></td>
                                            <td style="width:30px;text-align: center;"><input id="allcheck_exceptiontime" type="checkbox" style='height:14px;width:14px;' onchange="selectall('allcheck_exceptiontime','tbody_exception_time_source');"></td>
                                            <td style="width:100px;text-align: center;"><dict:lang value="类型"/></td>
                                            <td style="width:130px;text-align: center;"><dict:lang value="开始时间"/></td>
                                            <td style="width:130px;text-align: center;"><dict:lang value="结束时间"/></td>
                                            <td style="width:150px;text-align: center;"><dict:lang value="列外时长"/></td>
                                        </bu:tr>
                                        </tbody>
                                        </bu:table>
                                    </div>
                                </div>
                                <div class="datagrid-body datagrid-div3"  style="height:200px" onscroll="ajaxTableScroll(this,'8e3691f22e2f4d818b3b29cd5972c6e6')" >
                                    <table class="glxb-table fixedTable" style="width:100%" id="addTable_8e3691f22e2f4d818b3b29cd5972c6e6" >
                                        <tbody id="tbody_exception_time_source" >
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
                <div class="mod">
                    <div class="mod-hd"> 
                        <h3 class="tit"><dict:lang value="线别信息" /></h3>
                        <div class="extend-btn" style="float: right;margin-top:5px;">
                            <button type="button" onclick="selectLineInfo();" style="padding:0;" title="<dict:lang value="添加线别" />">   <i class="ico ico-kl-new-add ico-small"></i>
                            </button>
                            <button type="button" onclick="delLineInfo();" style="padding:0"   title="<dict:lang value="移除线别" /> " >   <i class="ico ico-sc-new-add ico-small"></i>
                            </button>
                        </div>
                    </div>
                    <div class="mod-bd" >
                        <div class="panel datagrid datagrid-div1">
                            <div class="datagrid-div2 datagrid-div6 datagrid-view" >
                                <div class="datagrid-header" >
                                    <div class="datagrid-header-inner" id="datagrid-header-inner8e3691f22e2f4d818b3b29cd5972c6e6">
                                        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable454cc1d04a9240f4868ccffb52793896">
                                        <s:set name="_$type" value="'view'" />
                                        <tbody class="isParentsTitle">
                                        <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax"> 
                                            <td style="width:30px;text-align: center;"><input id="allcheck_line" type="checkbox" style='height:14px;width:14px;' onchange="selectall('allcheck_line','tbody_line_info');"></td>
                                            <td style="width:100px;text-align: center;"><dict:lang value="线别代码"/></td>
                                            <td style="width:130px;text-align: center;"><dict:lang value="线别名称"/></td>
                                        </bu:tr>
                                        </tbody>
                                        </bu:table>
                                    </div>
                                </div>
                                <div class="datagrid-body datagrid-div3"  style="height:140px" onscroll="ajaxTableScroll(this,'8e3691f22e2f4d818b3b29cd5972c6e6')" >
                                    <table class="glxb-table fixedTable" style="width:100%" id="addTable_8e3691f22e2f4d818b3b29cd5972c6e6" >
                                        <tbody id="tbody_line_info" >
                                        </tbody>
                                    </table>
                                </div>
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

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<script>
 //edit by cc 2018-09-05
 //变量
 var dataUrl;//数据交互类URL
 var iframeId='${param.iframeId}';
 var lineExceptionTime=[];//存储回填过来的线别的列外信息
 var exsitLine=[];//回填的线体信息
 //初始化函数
 function initial(){
     try{
         //获取数据交互类URL
         dataUrl=getUrl();
         //绑定来源线体
         bindSourceLine();
         //绑定事件
         bindEvent();
     }
     catch(error){
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
 //获取数据源交互类URL
 function getUrl(){
    return "${path}buss/bussModel_exeFunc.ms?funcMId=cc02c8fe4f544d7c894eb50b7f5d6744";  
 }
 //绑定来源线体
 function bindSourceLine(){
     try{
        $.ajax({
            type:"post",
            dataType:"json",
            url:dataUrl,
            data:{
                opt:"getSourceLine"
            },
            success:function(data){
                $("#paraMap1_PPC_AREA_SN").empty();//清空下拉框
                $("#paraMap1_PPC_AREA_SN").append("<option value='' class='select_name'>--请选择--</option>");
                if(data!=null && data.ajaxList!=null && data.ajaxList.length>0){
                    data.ajaxList.forEach(function(item,index,array){
                        $("#paraMap1_PPC_AREA_SN").append("<option value='"+item.CAL_ID+"' class='select_name'>"+item.CA_NAME+"</option>");
                    });
                }
                $("#paraMap1_PPC_AREA_SN").find("option[value='']").attr("selected",true);
                $("#paraMap1_PPC_AREA_SN").trigger("chosen:updated");
                resetDropSearch("paraMap1_PPC_AREA_SN");
            },
            error:function(error){},
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
        if($("#"+id+" option").size()>15){
            $("#"+id).chosen({search_contains: true});
                $("#"+id+"_chosen .chosen-search").css("display","block");
        }else{
            $("#"+id).chosen();
        }
  }
 //绑定事件
 function bindEvent(){
     try{
         $("#paraMap1_PPC_AREA_SN").change(function(){
             var calId=$(this).val();
             getExceptionTime(calId);
         });
     }
     catch(error){
         console.error(error);
     }
 }
 //根据产能日历ID获取相应的例外时间
 function getExceptionTime(calid){
     try{
         showLoading(true);
         $.ajax({
             type:"post",
             dataType:"json",
             url:dataUrl,
             data:{
                 opt:"getExceptionTime",
                 calId:calid
             },
             success:function(data){
                 $("#tbody_exception_time_source").empty();
                 if(data!=null && data.ajaxList!=null && data.ajaxList.length>0){
                    var dataHtml=[];
                     data.ajaxList.forEach(function(item,index,array){
                        dataHtml.push("<tr id='"+item.ID+"' class='datagrid-row'>");
                        dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center; text-overflow: ellipsis;' name='index'>"+(index+1)+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;text-overflow: ellipsis;' name='id'><input id='"+item.ID+"' type='checkbox' exptype='"+item.PPE_EXECPTION_TYPE+"'  begin='"+item.PPE_BEGIN_TIME+"' end='"+item.PPE_END_TIME+"' name='exceptionInfo' style='height:14px;width:14px;'></td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;text-overflow: ellipsis;' name='EXCEPTION_NAME'>"+item.EXCEPTION_NAME+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:130px;text-align: left;text-overflow: ellipsis;' name='PPE_BEGIN_TIME'>"+item.PPE_BEGIN_TIME+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:130px;text-align: left;text-overflow: ellipsis;' name='PPE_END_TIME'>"+item.PPE_END_TIME+"</td>");
                        dataHtml.push("<td class='datagrid-cell' style='width:150px;text-align: center;text-overflow: ellipsis;' name='PPE_DURATION'>"+item.PPE_DURATION+"</td>");
                        dataHtml.push("</tr>");
                     });
                     $("#tbody_exception_time_source").html(dataHtml.join(""));
                 }
                 selectRow("addTable_8e3691f22e2f4d818b3b29cd5972c6e6");
                 showLoading(false);
             },
             error:function(error){
                 showLoading(false);
             }
         });
     }
     catch(error){
         console.error(error);
     }
 }
 //选择线体
 function selectLineInfo(){
     try{
        var line = $("#paraMap1_PPC_AREA_SN").val();
        if(typeof(line)=="undefined" || line==null || line=="" ){
            showMessage(1,"<dict:lang value='请先选择来源线别'/>");
            return;
        }
        var urlDetail = "${path}buss/bussModel.ms?exeid=1d63aee639fc44bfbc61f62026031b7c&formId=334ae8dac2684a3289964a13b26049cd&except="+line;
        showPopWinFp(urlDetail , 500, 400,null,"<dict:lang value='选择线体'/>","2");
     }
     catch(error){
         console.error(error);
     }
 }
 //处理回填线体数据
 function returnLineDeal(){
     showLoading(true);
     setTimeout(() => {
        try{
            var list=jQuery.parseJSON($("#linelist").val());
            var dataHtml=[];
            var lines=null;
            list.forEach((item,index,array)=>{
                if(exsitLine.indexOf(item.lineSn)>=0){
                    return;
                }
                dataHtml.push("<tr id='"+item.lineSn+"' class='datagrid-row'>");
                dataHtml.push("<td class='datagrid-cell' style='width:30px; text-align:center;text-overflow: ellipsis;' name='id'><input id='"+item.lineSn+"' type='checkbox' style='height:14px;width:14px;'></td>");
                dataHtml.push("<td class='datagrid-cell' style='width:100px;text-align: center;text-overflow: ellipsis;' name='EXCEPTION_NAME'>"+item.lineSn+"</td>");
                dataHtml.push("<td class='datagrid-cell' style='width:130px;text-align: center;text-overflow: ellipsis;' name='PPE_BEGIN_TIME'>"+item.lineName+"</td>");
                dataHtml.push("</tr>");
                //记录回填的线体
                lineExceptionTime[item.lineSn]=[];
                exsitLine.push(item.lineSn);
                if(lines==null){
                    lines=item.lineSn;
                }
                else {
                    lines+=","+item.lineSn;
                }
            });
            //获取线体例外时间信息
            $.ajax({
                type:"post",
                dataType:"json",
                url:dataUrl,
                async:false,
                data:{
                    opt:"getMultiLineExceptionTime",
                    line:lines
                },
                success:function(data){
                    if(data!=null && data.ajaxList!=null && data.ajaxList.length>0){
                        data.ajaxList.forEach((item,index,array)=>{
                            lineExceptionTime[item.PPC_AREA_SN].push({
                                lineSn:item.PPC_AREA_SN,
                                lineName:item.CA_NAME,
                                type:item.PPE_EXECPTION_TYPE,
                                begin:item.PPE_BEGIN_TIME,
                                end:item.PPE_END_TIME
                            });
                        });
                    }
                },
                error:function(error){}
            });
            $("#tbody_line_info").append(dataHtml.join(""));
            selectRow("addTable_8e3691f22e2f4d818b3b29cd5972c6e6");
            showLoading(false);
        }
        catch(error){
            console.error(error);
            showLoading(false);
        }
     }, 0);
 }
 //点击行的时候，选中整行
function selectRow(tableId){
    $("#"+tableId+" tr").unbind("click");
    $("#"+tableId+" tr input[type=checkbox]").unbind("click");
    $("#"+tableId+" tr").on("click",function(e){
        var trId = $(this).attr("id");
        if ($("#"+trId+" :checkbox").attr("checked")) {
            $("#"+trId+" :checkbox").prop("checked",false);
            $("#"+trId).css("background-color","");
        }else{
            $("#"+tableId+" input[type='checkbox']").each(function(){
                if ($(this).attr("checked")) {
                    $(this).prop("checked",false);
                    $(this).parents("tr").css("background-color","");
                }
            });
            $("#"+trId+" :checkbox").prop("checked",true);
            $("#"+trId).css("background-color","#d3eafc");
        }
    });

    $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
        e.stopPropagation();
        var style = $(this).parents("tr").attr("style");
        if(style && style.indexOf("background-color") > -1){
            $(this).parents("tr").css("background-color","");
        }else{
            $(this).parents("tr").css("background-color","#d3eafc");
        }
    });
}
//消息提示
//** type 1：警告；2：成功；3：失败；4：疑问；5：锁定
//** msg 消息
function showMessage(type,msg){
    utilsFp.confirmIcon(type,"","","", msg,0,"260","");
}
//删除选择的线别信息
function delLineInfo(){
    try{
        if($("#tbody_line_info :checkbox[checked='checked']").length>0){
            utilsFp.confirmIcon(1,"","delLineInfoCallback","", "<dict:lang value='是否删除选择记录？' />",1,"260","");
        }
    }
    catch(error){
        console.error(error);
    }
}
function delLineInfoCallback(){
    try{
        var checkBox=$("#tbody_line_info :checkbox[checked='checked']");
        for(var i=0,len=checkBox.length;i<len;i++){
            var index=exsitLine.indexOf($(checkBox[i]).attr("id"));
            lineExceptionTime[$(checkBox[i]).attr("id")]=[];
            exsitLine.splice(index,1);
            $(checkBox[i]).parents("tr").remove();
        }
    }
    catch(error){
        console.error(error);
    }
}
//选中所有记录
function selectall(checkboxid,tbodyid){
	 try{
		 var isChecked=$("#"+checkboxid).attr("checked")=="checked"?true:false;
		 $("#"+tbodyid+" :checkbox").each(function(){
			$(this).attr("checked",isChecked);
		});
	 }
	 catch(error){
       console.error(error);
	 }
 }
//保存信息
function save(){
    try{
        if(!beforeSave()){
            return;
        }
        //获取选中的例外信息
        var exceptionId=null;
        var exceptionTime=$("#tbody_exception_time_source :checkbox[checked='checked']");
        for(var i=0,len=exceptionTime.length;i<len;i++){
            if(exceptionId==null){
                exceptionId=$(exceptionTime[i]).attr("id");
            }
            else {
                exceptionId+=","+$(exceptionTime[i]).attr("id");
            }
        }
        //获取选择的线别信息
        var lineSn=null;
        var lineInfo=$("#tbody_line_info").find("input[type='checkbox']");
        for(var i=0,len=lineInfo.length;i<len;i++){
            if(lineSn==null){
                lineSn=$(lineInfo[i]).attr("id");
            }
            else {
                lineSn+=","+$(lineInfo[i]).attr("id");
            }
        }
        showLoading(true);
        $.ajax({
            type:"post",
            dataType:"json",
            url:dataUrl,
            data:{
                opt:"saveMulti",
                calId:$("#paraMap1_PPC_AREA_SN").val(),
                excid:exceptionId,
                line:lineSn,
                iframeId:iframeId,
                isCloseWin:$("#isCloseWin").val()
            },
            success:function(data){
                if(!data){
                    showMessage(3,"<dict:lang value='保存失败'/>");
                }
                else {
                    showPopMessage("<dict:lang value='保存成功'/>");
                    //关闭窗体
                    closeTopPopWinFp(window.frameElement.id + "pop");
                }
                showLoading(false);
            },
            error:function(error){
                showLoading(false);
            }
        });
    }
    catch(error){
        console.error(error);
    }
}
//右侧底角弹出消息
function showPopMessage(msg){
    try{
        msgPop(msg,"","<dict:lang value='摩尔提示' />",200,150,3000);
    }
    catch(error){
        console.error(error);
    }
}
//保存前校验数据
function beforeSave(){
    try{
        //校验是否有选择的例外信息
        if($("#tbody_exception_time_source :checkbox[checked='checked']").length<=0){
            showMessage(1,"<dict:lang value='请至少选择一条例外信息'/>");
            return false;
        }
        //校验是否有勾选线别信息
        if($("#tbody_line_info").find("input[type='checkbox']").length<=0){
            showMessage(1,"<dict:lang value='请至少选择一条线别'/>");
            return false;
        }
        //校验添加的例外时间是否合法
        if(!checkExceptionTime()){
            return false;
        }

        return true;
    }
    catch(error){
        console.error(error);
    }
}
//校验添加的例外时间是否合法
function checkExceptionTime(){
    try{
        //获取选中的例外时间
        var exceptionTime=$("#tbody_exception_time_source :checkbox[checked='checked']");
        var selectExptInfo=[];
        for(var i=0,len=exceptionTime.length;i<len;i++){
            selectExptInfo.push({
                type:$(exceptionTime[i]).attr("exptype"),
                begin:$(exceptionTime[i]).attr("begin"),
                end:$(exceptionTime[i]).attr("begin"),
            });
        }
        //校验
        var lineInfo=$("#tbody_line_info").find("input[type='checkbox']");
        for(var i=0,len=lineInfo.length;i<len;i++){
            var exptInfo=lineExceptionTime[$(lineInfo[i]).attr("id")];
            for(var j=0,jlen=exptInfo.length;j<jlen;j++){
                if(existsSameTime(selectExptInfo,exptInfo[j].type,new Date(exptInfo[j].begin),new Date(exptInfo[j].end))){
                    showMessage(1,"<dict:lang value='线别'/>"+"("+exptInfo[j].lineName+")"+"<dict:lang value='存在重复例外时间段'/>");
                    return false;
                }
            }
        }

        return true;
    }
    catch(error){
        console.error(error);
    }
}
//判定时间段是否存在重合
function existsSameTime(selectExptInfo,currentType,beginDate,endDate){
    //获取当前行
    var trStart;
    var trEnd;
    var tr;
    var trStatrDate;
    var trEndDate;
    var extType;
    for(var i=0,len=selectExptInfo.length;i<len;i++){
        extType=selectExptInfo[i].type;//列外类型
        //加班类型可以和其他机种类型存在重复时间段（加班&加班不能存在相同；其他&其他不能存在相同）
        if(currentType!=extType && (currentType=="1" || extType=="1")){
            continue;
        }

        trStart=selectExptInfo[i].begin;//开始时间
        trEnd=selectExptInfo[i].end;//结束时间
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
 //页面加载函数
 $(function(){
    //初始化
    initial();
 });
</script>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
