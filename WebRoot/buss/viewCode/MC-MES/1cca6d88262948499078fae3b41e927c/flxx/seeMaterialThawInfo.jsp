<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<!-- head里面 -->
	  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	     <jsp:param name="modelName" value="VIEW_TYPE_18" />
	     <jsp:param name="location" value="inHead" />
	  </jsp:include>
</head>
<body style="background-color:#fff;">
	<div class="edit">
			<div class="bd" style="border: none">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="776a9d93290b4cef813dc66f100cbe1e" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="776a9d93290b4cef813dc66f100cbe1e" />
	<input type="hidden" name="776a9d93290b4cef813dc66f100cbe1e" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'720f97d65c7c4eeab2d0a43e71a4c85f'" />
		<s:set name="_$formId_1" value="'776a9d93290b4cef813dc66f100cbe1e'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width:87px;"/><bu:uitn colNo="CTT_TIN_SN" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="CTT_TIN_SN" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="CTT_TIN_SN" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" style="width:78px;"/><bu:uitn colNo="THA_TIN_STATUS" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" style="width:235px;" colNo="THA_TIN_STATUS" formId="776a9d93290b4cef813dc66f100cbe1e" id="tinStatus"><!--<bu:ui colNo="THA_TIN_STATUS"  formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" />--></bu:td>
		
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTT_ITEM_TYPE" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="CTT_ITEM_TYPE" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="CTT_ITEM_TYPE" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTT_ITEM_CODE" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="CTT_ITEM_CODE" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="CTT_ITEM_CODE" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		
		<tr>
			<td class="name" /><bu:uitn colNo="THA_TOOL_NAME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="THA_TOOL_NAME" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="THA_TOOL_NAME" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="THA_TOOLSPEC" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="THA_TOOLSPEC" formId="776a9d93290b4cef813dc66f100cbe1e"  colspan="3"><bu:ui colNo="THA_TOOLSPEC" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" style="height:80px;"/></bu:td>
			
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="THA_TIME_TOTAL" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="THA_TIME_TOTAL" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="THA_TIME_TOTAL" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="THA_TIME_MAX" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="THA_TIME_MAX" formId="776a9d93290b4cef813dc66f100cbe1e" id="thaTimeMax" ><bu:ui colNo="THA_TIME_MAX" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		
			
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="THA_CYCLE" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="THA_CYCLE" formId="776a9d93290b4cef813dc66f100cbe1e"  id="thaCycle" ><bu:ui colNo="THA_CYCLE" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTT_BEGIN_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="CTT_BEGIN_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" id="beginTime" ><bu:ui colNo="CTT_BEGIN_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		
			
		</tr>
		<tr>
			
			<td class="name" /><bu:uitn colNo="CTT_EXPECT_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="CTT_EXPECT_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" id="expectTime"><bu:ui colNo="CTT_EXPECT_TIME"   formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTT_END_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="CTT_END_TIME" formId="776a9d93290b4cef813dc66f100cbe1e"  id="endTime"><bu:ui colNo="CTT_END_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		
			
		</tr>
		<tr>
		
			<td class="name" /><bu:uitn colNo="CTT_PASS_FLAG" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="CTT_PASS_FLAG" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="CTT_PASS_FLAG" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTT_OPERATOR" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
			<bu:td cssClass="dec" colNo="CTT_OPERATOR" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="CTT_OPERATOR" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="CTT_MAX_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
		<bu:td cssClass="dec" colNo="CTT_MAX_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" ><bu:ui colNo="CTT_MAX_TIME" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
			
		
		</tr>
		<tr>
		
		<td class="name" /><bu:uitn colNo="CTT_PASS_MEMO" formId="776a9d93290b4cef813dc66f100cbe1e" /></td>
		<bu:td cssClass="dec" colNo="CTT_PASS_MEMO" formId="776a9d93290b4cef813dc66f100cbe1e" colspan="3" ><bu:ui style="height:70px;" colNo="CTT_PASS_MEMO" formId="776a9d93290b4cef813dc66f100cbe1e" dataId="${dataId}" formIndex="1" /></bu:td>
			
		
		</tr>
	</table>
			<bu:jsVal formId="776a9d93290b4cef813dc66f100cbe1e" formIndex="1" />
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 $('.dialog-bd',parent.document).css('background-color','#fff')
			});
		
		
       		
		function init(){
		
		var expect_time = $("#expectTime input").val();
		//var tinSN=['paraMapObj_CTT_TIN_SN'].val();
		var tinSN = $("#paraMapObj_CTT_TIN_SN").val();
		var itemCode = $("#paraMapObj_CTT_ITEM_CODE").val();
		var name=$("#paraMapObj_THA_TOOL_NAME").val();
		var spec = $("#paraMapObj_THA_TOOLSPEC").val();
		var begin_Time = $("#beginTime input").val();
		var cttBeginTime=new Date(begin_Time);
		
		var end_Time = $("#endTime input").val();
		var tha_Time_Max = $("#thaTimeMax input").val();
		var cttMaxCycle=tha_Time_Max*60*1000;
		var thawingCycle = $("#thaCycle input").val();
		var cttThawingCycle = thawingCycle*60*1000;
		
		
		//var endTime=new Date(end_Time);
		
	//	
	//	var thaTimeMax=new Date(tha_Time_Max);
		
		
		
	//	var maxCycle = $("#CTT_THAWING_MAX_CYCLE").val();
		
		//var beginTime = $("#CTT_BEGIN_TIME").val();
	
	//	var endTime = $("#paraMapObj_CTT_END_TIME").val();
		
	
		//var cttMaxCycle=maxCycle*60*1000;
        //var cttBeginTime=new Date(beginTime);
        //var thawingCycle = $("#CTT_THAWING_CYCLE").val();
        //var cttThawingCycle = thawingCycle*60*1000;
		console.log(tinSN);
		console.log(itemCode);
		console.log(name);
		console.log(spec);
		console.log(expect_time);
		console.log(tha_Time_Max);
		console.log(thawingCycle);
		console.log(begin_Time);
		console.log(end_Time);
		
	
	
                var nowDate=new Date();
                var ctt_expect_time_todate=new Date(expect_time);
                var tempStr="";
                
              
                //var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
              //  
                /*
                var itemCode=['CTT_ITEM_CODE'].val();
                var name=['THA_TOOL_NAME'].val();
                var spec=['THA_TOOLSPEC'].val();
                var endTime=['CTT_END_TIME'].val();
                var maxCycle=['CTT_THAWING_MAX_CYCLE'].val;
                var beginTime=['CTT_BEGIN_TIME '].val;
                var cttMaxCycle=maxCycle*60*1000;
                var cttBeginTime=new Date(beginTime);
                var thawingCycle =['CTT_THAWING_CYCLE'].val();
                var cttThawingCycle = thawingCycle*60*1000;
                console.log("1":+tinSN+);
                console.log("2":+itemCode+);
                console.log("3":+name+);
                console.log("4":+spec+);
                console.log("5":+endTime+);
                console.log("6":+maxCycle+);
                console.log("7":+beginTime+);
                console.log("8":+cttMaxCycle+);
                console.log("9":+cttBeginTime+);
                console.log("10":+thawingCycle+);
                console.log("11":+cttThawingCycle+);
                */
                
                
                
                 
                  if(null==end_Time||end_Time==""　){
                    if((cttBeginTime.getTime()+ cttThawingCycle)<=nowDate.getTime() && (cttBeginTime.getTime()+ cttThawingCycle)<=(cttBeginTime.getTime()+ cttMaxCycle) && nowDate.getTime()<=(cttBeginTime.getTime()+ cttMaxCycle)){
                    	                        tempStr="<span style='color:#FFFFFF;width:70px;height:21px;text-align:center;display: inline-block;line-hight:22px;padding-top:3px;background-color:#aeaeae;border-radius:4px;' class='state fixedTable dlist-table'>回温结束</span>";
                       //arrHtml.push("<span style='color:#FFFFFF;width:60px;display: inline-block;background-color:#aeaeae;border-radius:2px;' class='state fixedTable dlist-table'>回温结束</span>") 
                    }else if(nowDate.getTime()<=ctt_expect_time_todate.getTime()){
                        tempStr="<span style='color:#FFFFFF;width:70px;height:21px;text-align:center;display: inline-block;line-hight:22px;padding-top:3px;background-color:#00a0e9;border-radius:4px;' class='state fixedTable dlist-table'>回温中</span>";
                        // arrHtml.push("<span style='color:#FFFFFF;width:60px;display: inline-block;background-color:#00a0e9;border-radius:2px;' class='state fixedTable dlist-table'>回温中</span>")
                    }else if((cttBeginTime.getTime()+ cttMaxCycle)>nowDate.getTime() &&　nowDate>(cttBeginTime.getTime()+ cttThawingCycle)　){
                        tempStr="<span style='color:#FFFFFF;width:70px;height:21px;text-align:center;display: inline-block;line-hight:22px;padding-top:3px;background-color:#ff0000;border-radius:4px;' class='state fixedTable dlist-table'>回温完成</span>";
                      //  arrHtml.push("<span style='color:#FFFFFF;width:60px;display: inline-block;background-color:#ff0000;border-radius:2px;' class='state fixedTable dlist-table'>回温完成</span>")
                    }else if((cttBeginTime.getTime()+ cttMaxCycle)<nowDate.getTime()){
                        tempStr="<span style='color:#FFFFFF;width:70px;height:21px;text-align:center;display: inline-block;line-hight:22px;padding-top:3px;background-color:#dd4b39;border-radius:4px;' class='state fixedTable dlist-table'>回温超时</span>";
                       // arrHtml.push("<span style='color:#FFFFFF;width:60px;display: inline-block;background-color:#dd4b39;border-radius:2px;' class='state fixedTable dlist-table'>回温超时</span>")
                    }    	
                     
                }else{
                    
                    tempStr="<span style='color:#FFFFFF;width:70px;height:21px;text-align:center;display: inline-block;line-hight:22px;padding-top:3px;background-color:#aeaeae;border-radius:4px;' class='state fixedTable dlist-table'>回温结束</span>";
                   // arrHtml.push("<span style='color:#FFFFFF;width:60px;display: inline-block;background-color:#aeaeae;border-radius:2px;' class='state fixedTable dlist-table'>回温结束</span>")
                }
                
                
         /*       
		if(nowDate.getTime()<=ctt_expect_time_todate.getTime()){
		     tempStr="<span style='color:#FFFFFF;width:70px;height:21px;text-align:center;display: inline-block;line-hight:22px;padding-top:3px;background-color:#00a0e9;border-radius:4px;' class='state fixedTable dlist-table'>回温中</span>";
       		     //$("#tinStatus input").val("回温中");
       		}else{
       		     tempStr="<span style='color:#FFFFFF;width:70px;height:21px;text-align:center;display: inline-block;line-hight:22px;padding-top:3px;background-color:#aeaeae;border-radius:4px;' class='state fixedTable dlist-table'>回温结束</span>";
       		     //$("#tinStatus input").val("回温结束");
       		}
       		*/
       		$("#tinStatus").html(tempStr);
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		

	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
