<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	
			<!-- head里面 -->

  <!-- 产品静态资源 -->
       	<script type="text/javascript">
	var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		//document.getElementById("content3").style.display="";
		//document.getElementById("content4").style.display="";
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
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}
$(function(){
	$("#tag1").addClass("current");

	
})

</script>
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none;height:440px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="1355857367cc4b2bb5a807aae7d37a48" type="edit" />
	<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd1">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="奖惩信息" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="员工信息" /></SPAN> </A>
								</LI>
								<LI id="tag3" style="display:none;margin-left:590px;">
    								<div class="extend-btn" style="float:right;margin: 5px 0;">
                            			<button type="button" id="front_add" onclick="popWorkDiv('backShadow','BlankSpacs')" style="padding:0;" title="添加员工"><i class="ico ico-kl-new-add ico-small"></i></button>
                            			<button type="button" id="front_delete" onclick="delFrontList();" style="padding:0;" title="删除员工"><i class="ico ico-sc-new-add ico-small"></i></button>
                            		</div>					
                                </LI>
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="1355857367cc4b2bb5a807aae7d37a48" />	
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="1355857367cc4b2bb5a807aae7d37a48" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'49e245e0fdaf488fa1c2c13b29623c55'" />
		<s:set name="_$formId_1" value="'1355857367cc4b2bb5a807aae7d37a48'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
		     <bu:td cssClass="dec-self" colNo="REWARD_CODE" formId="1355857367cc4b2bb5a807aae7d37a48" style="display:none;"><bu:ui colNo="ID" formId="1355857367cc4b2bb5a807aae7d37a48" dataId="${dataId}" formIndex="1"  id="paraMap1_rewardId"/></bu:td>
			<td class="name-four" style="width:90px;"/><bu:uitn colNo="REWARD_CODE" formId="1355857367cc4b2bb5a807aae7d37a48" style="width:90px;"/></td>
			<bu:td cssClass="dec-self" colNo="REWARD_CODE" formId="1355857367cc4b2bb5a807aae7d37a48" ><bu:ui colNo="REWARD_CODE" formId="1355857367cc4b2bb5a807aae7d37a48" dataId="${dataId}" formIndex="1" style="width: 200px;"/></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" style="width:90px;"/><bu:uitn colNo="REWARD_DATE" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
			<bu:td cssClass="dec-self" colNo="REWARD_DATE" formId="1355857367cc4b2bb5a807aae7d37a48" ><bu:ui colNo="REWARD_DATE" formId="1355857367cc4b2bb5a807aae7d37a48" dataId="${dataId}" formIndex="1" style="width: 200px;"/></bu:td>
	    <td>&nbsp;</td>    		
            <td class="name-four" /><bu:uitn colNo="REWARD_USER_ID" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
			<bu:td cssClass="dec-self" colNo="REWARD_USER_ID" formId="1355857367cc4b2bb5a807aae7d37a48" ><bu:ui colNo="REWARD_USER_ID" formId="1355857367cc4b2bb5a807aae7d37a48" dataId="${dataId}" formIndex="1" style="width: 200px;"/></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="REWARD_NAME" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
			<bu:td cssClass="dec-self" colNo="REWARD_NAME" formId="1355857367cc4b2bb5a807aae7d37a48" ><bu:ui colNo="REWARD_NAME" formId="1355857367cc4b2bb5a807aae7d37a48" dataId="${dataId}" formIndex="1" style="width: 200px;"/></bu:td>
	    <td>&nbsp;</td>	
            <td class="name-four" /><bu:uitn colNo="REWARD_TYPE" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
			<bu:td cssClass="dec-self" colNo="REWARD_TYPE" formId="1355857367cc4b2bb5a807aae7d37a48" ><bu:ui colNo="REWARD_TYPE" formId="1355857367cc4b2bb5a807aae7d37a48" dataId="${dataId}" formIndex="1" style="width: 200px;"/></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="REWARD_CONTENT" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
			<bu:td cssClass="dec-self" colNo="REWARD_CONTENT" formId="1355857367cc4b2bb5a807aae7d37a48" colspan="8"><bu:ui colNo="REWARD_CONTENT" formId="1355857367cc4b2bb5a807aae7d37a48" dataId="${dataId}" formIndex="1" style="height:60px;width:100%;"/></bu:td>
		</tr>
		
		<tr>
			<td class="name-four" /><bu:uitn colNo="REMARK" formId="1355857367cc4b2bb5a807aae7d37a48" /></td>
			<bu:td cssClass="dec-self" colNo="REMARK" formId="1355857367cc4b2bb5a807aae7d37a48" colspan="8" ><bu:ui colNo="REMARK" formId="1355857367cc4b2bb5a807aae7d37a48" dataId="${dataId}" formIndex="1" style="height:60px;width:100%;"/></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="1355857367cc4b2bb5a807aae7d37a48" formIndex="1" />
		</DIV>
	   <DIV id="content2" style="display:none" data-tab="tag2">
    			<div class="mod" >
			<div class="mod-bd" style="margin-top:5px;border-bottom: none;height:500px;">
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
						<div class="datagrid-header" style="width:100%;">
							<div class="datagrid-header-inner head1" style="width:100%;" >
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234" >
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
									<td class="datagrid-cell" style="width:30px; text-align:center;"></td>
        							
        								<td class="datagrid-cell" style="width:250px;text-align:center">
        									<dict:lang value="员工号" /> 
        								</td>
        								<td class="datagrid-cell" style="width:428px;text-align:center"> 
        									<dict:lang value="员工姓名" />
        								</td>
        								<td class="datagrid-cell" style="width:428px;text-align:center">
        									<dict:lang value="部门" />
        								</td>
        										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:360px;">
							<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="showZJFront" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>	
		</DIV>
					<div id="BlankSpacs" class="black_overlay"> </div>
					<div class="dialog" id="backShadow" style=" top: 0px; left: 250px; width: 700px; height: 400px; z-index: 3099;display: none;background-color: white;">
						<div style="display: block;">
							<div class="dialog-s1" id="addRole" style="width:700px;display:block;left:253px;">
								<div class="dialog-hd">
									<h3 class="tit"><dict:lang value="选择员工" /></h3>
								</div>
							</div>
						</div>
						<a class="dialog-close" href="javascript:void(0);" onclick="closeAlert('backShadow','BlankSpacs');"></a>
						<div class="optn optn_div">
							<button type="button" onclick="choseZjList('backShadow','BlankSpacs')"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
							<button type="button" onclick="closeAlert('backShadow','BlankSpacs');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
						<button type="button" onclick="getZjList('formId1')"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
						</div>

						<div id="zjalert" style="z-index:9999;margin-top: 0px;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<dict:lang value="员工姓名:" />  <input type="text" class="dec-self input" id="zj_sn" name="zj_sn" /> 
							<div class="head">
								<table class="dlist-table table-line " target="secondTable" style="width:100%;">
								<table class="dlist-table table-line htable2" target="secondTable" style="table-layout: fixed;width:100%;">
									<thead>
										<tr class="thcolor">
											<th class="datagrid-cell" style="width:30px; text-align:center;"><span></span></th>
											<th class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll1" onclick="selectAll()" style="cursor: pointer;" title="全选"></span></th>
											<th class="datagrid-cell" style="width:110px">
												<dict:lang value="员工号" /> </th>
											<th class="datagrid-cell" style="width:115px">
												<dict:lang value="员工姓名" />
											</th>
											<th class="datagrid-cell" style="width:115px">
												<dict:lang value="部门" />
											</th>
										</tr>
									</thead>
								</table>
							
								<div class="main scroll" style="overflow-y: auto;overflow-x: hidden;height: 222px;">
									<table class="dlist-table table-line" style="table-layout: fixed;width:100%;" target="secondTable">
										<tbody id="zjTbody" style="background-color:white; height: 220px; overflow-y: auto; ">
										</tbody>
									</table>
								</div>

							</div>
						

							<div style="background-color: white;">
								<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchZjList&formId=formId1&showLoading=0" />
								</div>
			     
			     
								</div>
							</div>
						
				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>


  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>

<script type="text/javascript">

//$("#paraMap1_rewardId").hide();
	//获取查询奖惩员工URL
	function getEmployeeUrl(){
        var url="${path}buss/bussModel_exeFunc.ms?funcMId=2e51d8ff53244a5bb282883a8fa26d76"; 
        return url;
    }
    
	//获取当前奖惩下已绑定的员工
	$(document).ready(function () {

        var url = getEmployeeUrl();
        var rewardId = $("#paraMap1_rewardId").val();
        var dataAuth="${param.dataAuthVal}";

    	$.ajax({
		type: "post",
		dataType: "json",
		url: url,
		data: {
		    "rewardId":rewardId,
		    "dataAuth":dataAuth
		},
		success: function(data) {
		    				//console.log(data)
	        data = data.ajaxMap.zjList;
	        for (var i = 0; i < data.length; i ++) {
		        		//console.log("id>>" + data[i].ID)
    		    var trId = data[i].ID;
    			if(i % 2 == 1) {
    
    				$("#showZJFront").append("<tr onclick='check_box()' class='showZJFront' style='cursor:pointer;background:#dcecfa;' id=f" + trId + " name=f" + trId + "></tr>");
    			} else {
    				$("#showZJFront").append("<tr onclick='check_box()' style='cursor:pointer;' class='showZJFront' id=f" + trId + " name=f" + trId + "></tr>");
    			}
    			$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'>" + (i+1) + "</td>");
    		//	$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
    			$("#showZJFront tr:last").append("<td class='datagrid-cell' style=' width:250px;text-align:center;'>" + data[i].LOGIN_NAME + " </td>");
    			$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:428px;text-align:center;'>" + data[i].NAME + " </td>");
    			$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:428px;text-align:center;'>" + data[i].DEPT_NAME + " </td>");
			}	   
	    }
	    })
	})



</script>

<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

