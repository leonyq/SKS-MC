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

<style type="text/css">
		table .chosen-container {
			width: 200px !important;
		}
		
    	.basic-table  input{
		    
		    width:200px !important;
		    
		}
		.black_overlay {
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: #000;
			z-index: 1001;
			opacity: 0.3;
			filter: alpha(opacity=30);
		}
	</style>
	
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
			<div class="bd" style="border: none;height:480px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="8908aae883f6400f82375bedb9a6ac3f" type="edit" />
		<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd1">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="基本信息" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="员工信息" /></SPAN> </A>
								</LI>
							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="8908aae883f6400f82375bedb9a6ac3f" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="8908aae883f6400f82375bedb9a6ac3f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'4ee93e6751ea4abb86ab258b228670f4'" />
		<s:set name="_$formId_1" value="'8908aae883f6400f82375bedb9a6ac3f'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
		 <bu:td cssClass="dec" colNo="ASSESS" formId="8908aae883f6400f82375bedb9a6ac3f" style="display:none;"><bu:ui colNo="ID" formId="8908aae883f6400f82375bedb9a6ac3f" dataId="${dataId}" formIndex="1"  id="paraMap1_assessId"/></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="ASSESS_CODE" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec"  colNo="ASSESS_CODE" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_CODE" formId="8908aae883f6400f82375bedb9a6ac3f" dataId="${dataId}"  formIndex="1" style="width:250px;" /></bu:td>
        	<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="ASSESS_DATE" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="ASSESS_DATE" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_DATE" formId="8908aae883f6400f82375bedb9a6ac3f" dataId="${dataId}"  formIndex="1" style="width:250px;" /></bu:td>
        </tr>

	    <tr>					
             <td class="name" /><bu:uitn colNo="ASSESS_LEVEL_B" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_LEVEL_B" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_LEVEL_B" formId="8908aae883f6400f82375bedb9a6ac3f" dataId="${dataId}"  formIndex="1"  /></bu:td>
            	<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="ASSESS_LEVEL_A" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_LEVEL_A" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_LEVEL_A" formId="8908aae883f6400f82375bedb9a6ac3f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		
		<!--		<td>&nbsp;</td>   -->
		<tr>
			<td class="name" /><bu:uitn colNo="ASSESS_FILE" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_FILE" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_FILE" formId="8908aae883f6400f82375bedb9a6ac3f" dataId="${dataId}"  formIndex="1"  style="width:250px;"/></bu:td>
	    </tr>
		
			</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="ASSESS_USER_ID" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_USER_ID" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_USER_ID" formId="8908aae883f6400f82375bedb9a6ac3f" dataId="${dataId}"  formIndex="1"  style="width:250px;"/></bu:td>
		<td>&nbsp;</td>
		<td class="name" /><bu:uitn colNo="ASSESS_RESULT" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="ASSESS_RESULT" formId="8908aae883f6400f82375bedb9a6ac3f" ><bu:ui colNo="ASSESS_RESULT" formId="8908aae883f6400f82375bedb9a6ac3f" dataId="${dataId}"  formIndex="1" /></bu:td>
		
		
			</tr>
	    <tr >
			<td class="name" /><bu:uitn colNo="ASSESS_CONTENT" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td  cssClass="dec" colNo="ASSESS_CONTENT" formId="8908aae883f6400f82375bedb9a6ac3f" colspan="4" ><bu:ui  colNo="ASSESS_CONTENT" formId="8908aae883f6400f82375bedb9a6ac3f" dataId="${dataId}"  formIndex="1"  style="width:100%;height:75px;" /></bu:td>
		</tr>	
		<tr>
		<td class="name" /><bu:uitn colNo="REMARK" formId="8908aae883f6400f82375bedb9a6ac3f" /></td>
			<bu:td cssClass="dec" colNo="REMARK" formId="8908aae883f6400f82375bedb9a6ac3f" colspan="4" ><bu:ui colNo="REMARK" formId="8908aae883f6400f82375bedb9a6ac3f" dataId="${dataId}"  formIndex="1"  style="width:100%;height:75px;" /></bu:td>
        </tr>
	</table>
			<bu:jsVal formId="8908aae883f6400f82375bedb9a6ac3f" formIndex="1" />
			
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
        								<td class="datagrid-cell" style="width:369px;text-align:center"> 
        									<dict:lang value="员工姓名" />
        								</td>
        								<td class="datagrid-cell" style="width:369px;text-align:center">
        									<dict:lang value="部门" />
        								</td>
        										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:400px;">
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
						
			</div>
				</form>	
			</div>
		
	</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_18" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<script>

	$(document).ready(function () {

        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=b77b3ec613bd4581ac52bc488e1ee046"; 
        var assessId = $("#paraMap1_assessId").val();
        var dataAuth="${param.dataAuthVal}";

    	$.ajax({
		type: "post",
		dataType: "json",
		url: url,
		data: {
		    "assessId":assessId,
		    "dataAuth":dataAuth
		},
		success: function(data) {
		    				console.log(data)
	        data = data.ajaxMap.zjList;
	        for (var i = 0; i < data.length; i ++) {
		        if(data[i].DEPT_NAME==null){
		             data[i].DEPT_NAME="";
		        }		
    		    var trId = data[i].ID;
    			if(i % 2 == 1) {
    
    				$("#showZJFront").append("<tr onclick='check_box()' class='showZJFront' style='cursor:pointer;background:#dcecfa;' id=f" + trId + " name=f" + trId + "></tr>");
    			} else {
    				$("#showZJFront").append("<tr onclick='check_box()' style='cursor:pointer;' class='showZJFront' id=f" + trId + " name=f" + trId + "></tr>");
    			}
    			$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'>" + (i+1) + "</td>");
    		//	$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:30px; text-align:center;'><span><input type='checkbox' style='cursor: pointer;'></span></td>");
    			$("#showZJFront tr:last").append("<td class='datagrid-cell' style=' width:250px;text-align:center;'>" + data[i].LOGIN_NAME + " </td>");
    			$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:369px;text-align:center;'>" + data[i].NAME + " </td>");
    			$("#showZJFront tr:last").append("<td class='datagrid-cell' style='width:369px;text-align:center;'>" + data[i].DEPT_NAME + " </td>");
			}	   
	    }
	    })
	})

</script>


<script>(function($){
  $(window).on('load',function(){
  //  setPopScroll('.scroll','.head');
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->


