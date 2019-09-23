<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>   
    <style type="text/css">	
    	
    	#addPackInfo .chosen-container {
    	    position: initial
    	}
	</style>
	<!-- head里面 -->
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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="heigth:534px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="080ce545617f4ff5949b1f52484c48ee" type="add" />
<div class="mod">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="基本信息" /></h3>	
        </div>
	<table class="basic-table" >
	<input type="hidden" id="packLevel" name="packLevel" value="1" />
	<input type="hidden" name="formIds" value="080ce545617f4ff5949b1f52484c48ee" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="080ce545617f4ff5949b1f52484c48ee" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'619aabde542341cfa1bb0f51a650767b'" />
		<s:set name="_$formId_1" value="'080ce545617f4ff5949b1f52484c48ee'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PTI_SN" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_SN" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_SN" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" value="%{PTI_SN}" formIndex="1" /></bu:td>

			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PTI_NAME" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_NAME" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_NAME" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" value="%{PTI_NAME}" formIndex="1" /></bu:td>

			<td class="name" /><bu:uitn colNo="PTI_WEIGH_WAY" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="PTI_WEIGH_WAY" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_WEIGH_WAY" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" value="%{PTI_WEIGH_WAY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		   	<td class="name" /><bu:uitn colNo="PTI_DEVIATE_RANGE" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_DEVIATE_RANGE" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_DEVIATE_RANGE" style="width:200px;" formId="080ce545617f4ff5949b1f52484c48ee" value="%{PTI_DEVIATE_RANGE}" formIndex="1" /></bu:td>     
		
			<td class="name"><bu:uitn colNo="PTI_MIX_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<td class="dec"><bu:ui colNo="PTI_MIX_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" value="%{PTI_MIX_FLAG}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<!--	<bu:uitn colNo="PTI_ROUTE_CHECK" formId="080ce545617f4ff5949b1f52484c48ee" />
			<bu:ui colNo="PTI_ROUTE_CHECK" formId="080ce545617f4ff5949b1f52484c48ee" value="%{PTI_ROUTE_CHECK}" formIndex="1" /></td>
			<td class="name" /><bu:uitn colNo="PTI_DEFAULT_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_DEFAULT_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" ><bu:ui colNo="PTI_DEFAULT_FLAG" formId="080ce545617f4ff5949b1f52484c48ee" value="%{PTI_DEFAULT_FLAG}" formIndex="1" /></bu:td>
		-->
		</tr>
		
		    
		<!--<tr>
			<td class="name" /><bu:uitn colNo="PTI_MEMO" formId="080ce545617f4ff5949b1f52484c48ee" /></td>
			<bu:td cssClass="dec" colNo="PTI_MEMO" formId="080ce545617f4ff5949b1f52484c48ee" colspan="5" style="height:80px;"><bu:ui colNo="PTI_MEMO" style="width:100%;height:100%" formId="080ce545617f4ff5949b1f52484c48ee" value="%{PTI_MEMO}" formIndex="1" /></bu:td>
        </tr>-->
		
	</table>
	<div class="mod-hd" style="margin-bottom:5px;">		
        <h3 class="tit"><dict:lang value="策略明细信息" /></h3>	
        <div class="extend-btn" id="addDel" style="float: right;margin-top:5px;margin-bottom:5px;">
        	<button type="button" onclick="addPack();" style="padding:0;" title="新增明细">
        		<i class="ico ico-kl-new-add ico-small"></i>
        	</button>
        	<button type="button" onclick="delRow();" style="padding:0" title="删除">
        		<i class="ico ico-sc-new-add ico-small"></i>
        	</button>
        </div>
        </div>
        
	<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" >
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:30px;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
										</td>
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="包装层级" /></td >
										<td class="datagrid-cell" style="width:130px;" ><dict:lang value="层级名称" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="容量" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="条码规则" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="标签打印" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="标签模板" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="标签打印地址" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="在线打印" /></td >
										<td class="datagrid-cell" style="width:90px;" ><dict:lang value="清单打印" /></td >
										<td class="datagrid-cell" style="width:150px;" ><dict:lang value="清单模板" /></td >
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="清单打印地址" /></td >
										<td class="datagrid-cell" style="width:100px;"><dict:lang value="分页带表头" /></td >
										<td class="datagrid-cell" style="width:150px;"><dict:lang value="生成规则" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3" style="height:245px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="addPackInfo" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				
</div>	
			<bu:jsVal formId="080ce545617f4ff5949b1f52484c48ee" formIndex="1" />

			</div>
		 </form>
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
$('#addPackInfo').on('click','select',function(){
    return false
})

function addPack(){
     	var urlDetail = "${path}buss/bussModel.ms?exeid=1bee326aff0d4190b15bc34d362964c7&formId=080ce545617f4ff5949b1f52484c48ee&packLevel="+$("#packLevel").val();
     	//console.log(urlDetail );
	showPopWinFp(urlDetail , 880, 400,null,"<dict:lang value="添加策略明细"/>","add_packDetail");
	//clickTr("packInfo");
    //setChosen();
    mySetChosen();
}
function addCal(){      

            if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
            if(!val.valDataBaseSetData()){
                return ;
            }
            var len = $("#addPackInfo tr").length;
                        if(len<=0){
                          // utilsFp.confirmIcon(1,"","","", "%{getText("请至少添加一条单据明细信息")}",0,"260","");
                            utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少添加一条策略明细信息" />",0,"260","");
                           return;
            }
              var labeTemp;
            var listTemo;
            var Temp;
            var Temo;
            $("#addPackInfo  tr").each(function(i){
        
       var lablePrint=$(this).parent().parent().find("td").eq(6).find("select").val();
       var LableTempla=$(this).parent().parent().find("td").eq(7).find("select").val();
        var ptdLableTemplate=$(this).parent().parent().find("td").eq(8).find("select").val();
         var titleFlagSel=$(this).parent().parent().find("td").eq(10).find("select").val();
         var ListTemplate=$(this).parent().parent().find("td").eq(11).find("select").val();
         var ptdListTemplate=$(this).parent().parent().find("td").eq(12).find("select").val();
        if(lablePrint=="Y"){
            if(null==ptdLableTemplate||ptdLableTemplate==""){
               labeTemp="1";
                           return;
            }
            if(null==LableTempla||LableTempla==""){
               labeTemp="1";
                           return;
            }
        }
        if(titleFlagSel=="Y"){
            if(null==ptdListTemplate||ptdListTemplate==""){
                listTemo="1";
                           return;
            }
            if(null==ListTemplate||ListTemplate==""){
                listTemo="1";
                           return;
            }
        }
        
        
      });	
        if(labeTemp=="1"){
            utilsFp.confirmIcon(3,"","","", "<dict:lang value="标签打印地址不能为空" />",0,"260","");
             return;
        }
        if(listTemo=="1"){
            utilsFp.confirmIcon(3,"","","", "<dict:lang value="清单打印地址不能为空" />",0,"260","");
             return;
        }
        if(Temp=="1"){
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="标签模板不能为空" />",0,"260","");
             return;
        }
        if(Temo=="1"){
           utilsFp.confirmIcon(3,"","","", "<dict:lang value="清单模板不能为空" />",0,"260","");
             return;
        }
	    	if(listTemo!="1" && labeTemp!="1" && Temp!="1" && Temo!="1"){
	    	    if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
    			}
    			$("#saveBtn").prop("disabled","disabled");
    
                document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=de0fb1f8e5f84805980f9ff2fadc4ae1";
                document.forms.addForm.submit();
	    	}
             
                        
    	}
function delRow(){
	
	
	 var falg = 0;
	var delId;
	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function () { 
		if ($(this).attr("checked")) { 
			falg =1; 
			return false;
		} 
	});
	if(falg==1){
		$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 :checkbox").each(function(){
		if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			
			$("#"+trid).remove();
		}
	});
	}else{
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条数据" />",0,"260","");
            	return;
	}
	
	
	reSort("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
	var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
	_tongLineColor(tableTrJs);
	clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
	defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
}
//重新排序
function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
}
   //全选
     	function getAllItems(){
		if($("#allSelects").attr("checked")=="checked"){
			$("#addPackInfo :checkbox").attr("checked",true);
		}else{
			$("#addPackInfo :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
//点击行寄选中该行
function clickTr(tableId){
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
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
}
function mySetChosen(){
	
	var curWinHeight = $(document).height();//当前窗口高度
	$(".dept_select").chosen({
		//inherit_select_classes:true,//继承select class
		//width:"100%",
		//disable_search:true,//是否隐藏搜索框
		disable_search_threshold:15//少于15项，隐藏搜索框
	});

	//大于10个选项的，显示搜索框
	var len1 = $(".dept_select").length;
	$(".dept_select").each(function(index,item){
		if(item.id!=""){
		if(item != null && item.length > 10){
			//.chosen-container-single .chosen-search
			$("#"+item.id+"_chosen .chosen-search").css("display","block");
		}

		var offset = $("#"+item.id+"_chosen").offset(); //计算当前下拉框的偏移量
		
		var maxHeight = $("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height").replace("px","");//下拉高度
		
		var searchHeight = 0;//下拉搜索框的高度，默认为0
		//如果有显示搜索框，则需多计算搜索框的高度
		if(!$("#"+item.id+"_chosen .chosen-drop .chosen-search").is(":hidden")){
			searchHeight = 35;
		}
		//如果下拉框在窗口位置比窗口高度的一半还往下，则往上拉
		if(offset.top > (curWinHeight/2)){
			$("#"+item.id+"_chosen .chosen-drop").css({"top":"auto","bottom": "100%","border-top":"1px solid #75c4ff","border-bottom": 0,"background-color":"#f8fcff"});
			//console.log($("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height"));
			//console.log(itemHeight);
			if(offset.top < (maxHeight+searchHeight) && offset.top < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":offset.top-5-searchHeight});
			}
		}else{
			var itemHeight = curWinHeight - offset.top;
			if(itemHeight < (maxHeight+searchHeight) && itemHeight < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":itemHeight-32-searchHeight});
			}
		}
		}

	});
}	
$('#paraMap1_PTI_DEVIATE_RANGE').bind('keyup', function () {
	            var calwStart=$("#paraMap1_PTI_DEVIATE_RANGE");
             if(!/^[0-9]+([.]{1}[0-9]{0,2})?$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_PTI_DEVIATE_RANGE'),"<dict:lang value="输入正数,小数不超过两位" />");
             }
         })
</script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
    //setPopScroll('.scorl1','.head1');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->

