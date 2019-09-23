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
		<dict:lang value="VM-检验单信息" />
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
		<bu:header formId ="ff22f995cd064055b2658fb26776340b"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
       <script type = "text/javascript" src = "${path}plf/page/timer/perforMonit/js/echarts.min.js"></script>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
    <style>
        .block1>.chosen-container{
            height: 28px;
            margin-top: 10px;
            margin-left: 70px;
        }
        
        .block1>.chosen-container .chosen-single{
            height:28px;
        }
        
        .block1>.chosen-container .chosen-single>span{
            line-height:28px;
        }

    </style>
</head>

<body>
    <div style="height:calc(100%  - 10px);background-color:#fff;border:1px solid #eaeaea;box-sizing:border-box;">
        <div class="block1 optn" style="float:left;width:30%;height:100%;position: relative;">
            <input style="margin-left:70px;margin-top:10px;height:28px;line-height:28px;width:235px;" placeholder="请输入检验单号,按Enter键或点击查询" class="input" id="DocSn" ></input>
            <input type="hidden" id="oneLot">
            
    		<input type="hidden" name="formId" id="formId2" value='123456'/>
    	    <input type="hidden" name="formId" id="formId3" value='1234'/>
    	    <input type="hidden" name="formId" id="formId4" value='12345'/>
    	    <input type="hidden" name="formId" id="formId5" value='1234567'/>
    	    <input type="hidden" name="formId" id="formId5" value='12345678'/>
            <input type="hidden" id="jumpId" value="${param.jumpId}">
            <button type="button" onclick="querySn();" style="position: absolute;top: 10px;left: 310px;"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
            <div class="mod" style="height:calc(100% - 38px);">
                <div class="mod-hd">
                    <h3 class="tit"><dict:lang value="同物料检验单" /></h3>	
                </div>
                <div class="panel datagrid datagrid-div1" style="height:calc(100% - 70px);">
					<div class="datagrid-div2 datagrid-div6 datagrid-view" style="height:100%;">
						<div class="datagrid-header" style="width:100%">
							<div class="datagrid-header-inner head" id="" >
								<table  class="datagrid-htable fixedTable " id="datagrid-htable123456" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										
										<td class="datagrid-cell" style="width:160px;"><dict:lang value="检验单号" /></td >
										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="供应商" /></td >
										<td class="datagrid-cell" style="width:70px;" ><dict:lang value="检验结果" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll"   style="height:calc(100% - 32px);">
							<table class="datagrid-btable fixedTable" style="table-layout:fixed;"  id="datagrid-btable-ajax123456" >
								<tbody id="addlotItem" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div style="background-color: white;" >
                    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=oneItemDoc2&formId=formId2&showLoading=0" />
                </div>
                
            </div>
        </div>
		<div class="block2" style="width:68%;float:right;height:100%;">
		    <div class="mod" style="height:100%;">
                <div class="mod-hd">
                    <h3 class="tit"><dict:lang value="基本信息" /></h3>	
                </div>
                <table style="width: 100%;line-height:35px;">
                	<tr >
                	<td ><div class="name" ><dict:lang value="物料料号" /></div></td><td><div class="dec"><input readonly  id="itemCode" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="物料名称" /></div></td><td><div class="dec"><input readonly id="itemName" class="input coc" style="width:200px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"></div></td>
                	<td ><div class="name" ><dict:lang value="物料规格" /></div></td><td><div class="dec"><input readonly id="itemSpec" class="input coc" style="width:200px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"></div></td>
                	
                	</tr>
                	<tr>
                	<td ><div class="name" ><dict:lang value="供应商" /></div></td><td><div class="dec"><input readonly id="supCode" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="关联单号" /></div></td><td><div class="dec"><input readonly id="reDoc" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="状态" /></div></td><td><div class="dec"><input readonly id="docStatus" class="input coc" style="width:200px;"></div></td>
                	
                	</tr>
                	<tr>
                	<td ><div class="name" ><dict:lang value="送检数量" /></div></td><td><div class="dec"><input readonly id="checkNum" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="不良数量" /></div></td><td><div class="dec"><input readonly id="errorNum" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="实抽数量" /></div></td><td><div class="dec"><input readonly id="extNum" class="input coc" style="width:200px;"></div></td>
                	
                	</tr>
                	<tr>
                	<td ><div class="name" ><dict:lang value="检验人" /></div></td><td><div class="dec"><input readonly id="valPer" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="检验时间" /></div></td><td><div class="dec"><input readonly id="valTime" class="input coc" style="width:200px;"></div></td>
                	<td ><div class="name" ><dict:lang value="检验结果" /></div></td><td><div class="dec"><input readonly id="valresult" class="input coc" style="width:200px;"></div></td>
                	
                	</tr> 	
                </table>    
                
            <div class="js-tab" style="height:calc(100% - 180px)">
            <DIV id="container" style="padding:0 2px;box-sizing: border-box;height:100%;">
						<DIV class="hd">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="样本信息" /></SPAN> </A>
								</LI>
								<LI id="tag3"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="样本检测信息" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="母本信息" /></SPAN> </A>
								</LI>
								<LI id="tag4"><A class=""
									onclick="switchTag('tag4','content4','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="供货合格率" /></SPAN> </A>
								</LI>
								<LI id="tag5"><A class=""
									onclick="switchTag('tag5','content5','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="检验不良排行" /></SPAN> </A>
								</LI>								
							</UL>
						</DIV>
						<DIV class="content1" id="content" style="margin-top: 15px;height:calc(100% - 45px)">
			<DIV id="content1" style="height:100%;" data-tab="tag1">
				<div class="panel datagrid datagrid-div1" style="height:100%;">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view1" style="height:100%;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1" style="width:100%;" id="datagrid-header-inner2">
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable123456" width="">
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
										<td class="datagrid-cell" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:160px;" ><dict:lang value="样本SN" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="样本数量" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="抽样数量" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="损耗数量" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="不良数量" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="检验结果" /></td >
										<td class="datagrid-cell" style="width:100px;"><dict:lang value="检验人" /></td >
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="检验时间" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1"   style="height:calc(100% - 35px);">
							<table class="datagrid-btable fixedTable" style="table-layout:fixed;"   id="datagrid-btable-ajax123456" >
								<tbody id="addItemLog" >
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
			</DIV>
		 
        	<DIV id="content3" style="display:none;height:100%;" data-tab="tag3">
				<div class="panel datagrid datagrid-div1"  style="height:100%;">
					<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view1" style="height:100%;" >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner head2"  style="width:100%;">
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable1234"  style="">
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
										<td class="datagrid-cell td001" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:160px;" ><dict:lang value="样本SN" /></td >
										<td class="datagrid-cell" style="width:160px;" ><dict:lang value="样本子集SN" /></td >
										<td class="datagrid-cell" style="width:100px;" ><dict:lang value="检验项目类型" /></td >
										<td class="datagrid-cell" style="width:160px;"><dict:lang value="检验项目" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="值域" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="单位" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="上限值" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="下限值" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="实际值" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="检测结果" /></td >
										<td class="datagrid-cell" style="width:160px;"><dict:lang value="不良代码" /></td >
										<td class="datagrid-cell" style="width:160px;"><dict:lang value="不良名称" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="不良数量" /></td >
										<td class="datagrid-cell" style="width:80px;"><dict:lang value="缺陷等级" /></td >
										<td class="datagrid-cell" style="width:160px;"><dict:lang value="检测方法" /></td >
										<td class="datagrid-cell" style="width:160px;"><dict:lang value="检测内容" /></td >
										<td class="datagrid-cell" style="width:200px;"><dict:lang value="备注" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll2" style="height:calc(100% - 35px);">
							<table class="datagrid-btable fixedTable" style="table-layout:fixed;" id="datagrid-btable-ajax1234" >
								<tbody id="addQualityInfo" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
		</DIV>
		<DIV id="content2" style="display:none;height:100%;" data-tab="tag2">
				<div class="panel datagrid datagrid-div1" style="height:100%;">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="height:100%;" >
						<div class="datagrid-header" style="width:100%;">
							<div class="datagrid-header-inner head3" style="width:100%;">
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable1234567" style="">
									<tbody>
									<tr class="datagrid-header-row datagrid-title-ajax">
										<td class="datagrid-cell td001" style="width:30px;"></td>
										<td class="datagrid-cell" style="width:160px;" ><dict:lang value="物料/产品SN" /></td >
										<td class="datagrid-cell" style="width:80px;" ><dict:lang value="检验结果" /></td >
										<td class="datagrid-cell" style="width:80px;" ><dict:lang value="数量" /></td >
										<td class="datagrid-cell" style="width:160px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:80px;" ><dict:lang value="抽验标志" /></td >
										<td class="datagrid-cell" style="width:100px;"><dict:lang value="检验人" /></td >
										<td class="datagrid-cell" style="width:200px;" ><dict:lang value="检验时间" /></td >
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
					<div class="datagrid-body datagrid-div3 scroll3" style="height:calc(100% - 35px);">
							<table class="datagrid-btable fixedTable" style="table-layout:fixed;"  id="datagrid-btable-ajax1234567" >
								<tbody id="addProductInfo" >
								</tbody>
							</table>
					</div>
				</div>
			</div>
				
		</DIV>
		<DIV id="content4" style="display:none;height:100%;position:relative;" data-tab="tag4">
					<div id="divpro1"  style="width:700px;height:350px;" ></div>
				
		</DIV>		 				
		<DIV id="content5" style="display:none;height:100%;" data-tab="tag5">
					<div id="divpro2"  style="width:600px;height:200px;" >
                     
				  </div>
		<div style="height:93px;margin-top:10px;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head5" style="width:100%;" id="datagrid-header-inner2">
								<table  class="datagrid-htable  fixedTable  " id="datagrid-htable12345678" width="">
									<tbody id="errorcode1">
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body1 datagrid-div3 scroll5"   style="height:calc(100% - 32px);">
							<table class="datagrid-btable fixedTable" id="datagrid-btable-ajax12345678" style="table-layout:fixed;"  >
								<tbody id="errorcode2" >
								</tbody>
							</table>
						</div>		
		</div>		
		</DIV>
	</DIV>
	</div>

             </div>
		</div>
    </div>
    <bu:script viewId="905fce48212c4ce9beecd8bdf72e2a72" />   
<script type="text/javascript">
var loaded = 1;
	var tab_len = 5;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		document.getElementById("content3").style.display="";
		document.getElementById("content4").style.display="";
		document.getElementById("content5").style.display="";		
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
		var DocSn = $.trim($("#DocSn").val());
	//	if(DocSn!=""){
    //		if(tag=="tag1"){
    //			getSampleInfo(DocSn);
    //		}
    //		if(tag=="tag2"){
    //			getProductInfo(DocSn);
    //		}
    //		if(tag=="tag3"){
    //			getSampelDetInfo(DocSn);
    //}
    	//	if(tag=="tag4"){
    //			getQualityInfo(DocSn);
    //		}
    //		if(tag=="tag5"){
    //			getQualityInfo(DocSn);
    //		}    		
	//	}
	}
$(function(){
  //  initSelect();
    $("#tag1").addClass("current");

     
})
//页面跳转
function jumpfunc(){
        var DocSn = $("#jumpId").val();
    
    var flag = false;
      if(DocSn!=""){
          $("#DocSn option").each(function(){
              if($(this).val()==DocSn){
                  flag = true;
                  $(this).attr("selected","selected");
                  
              }
              
          });
          if(DocSn!="" && flag == false){
              utilsFp.confirmIcon(3,"","","", "error:没有该检验单",0,"300","");
          }
          if(DocSn!="" && flag == true){
               $("#DocSn").trigger("chosen:updated");
              querySn();
          }          
          
      }
}
//初始化下拉框
function initSelect(){
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=404e283cff724387a0bbc0135e0a6da8",//VM-检验单信息 操作功能 检验单下拉框初始化
			    data: "",
				success: function(data){
				var resList = data.ajaxList;
				    for(var i=0;i<resList.length;i++){
				        $("#DocSn").append("<option  value='"+resList[i].QII_INSPECT_SN+"'>"+resList[i].QII_INSPECT_SN+"</option>");
				    }
				     $("#DocSn").trigger("chosen:updated");
				     jumpfunc();
				},
				error: function(msg){
						util.closeLoading();

						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//查询方法
function querySn(){
    var DocSn = $.trim($("#DocSn").val());
    
    if(DocSn==""){
        utilsFp.confirmIcon(3,"","","", "请输入检验单号",0,"300","");  
        return;
    }else{
        resetTab();
        getDocSnInfo(DocSn);
        //if($("#tag1").attr("class")=="current"){
            getSampleInfo(DocSn);
        //}
       // if($("#tag2").attr("class")=="current"){
            getProductInfo(DocSn);
       // }
       // if($("#tag3").attr("class")=="current"){
            getSampelDetInfo(DocSn);
      //  }
    }
}
function resetTab(){
    $(".coc").val("");
    //$("#divpro2").empty();
	$("#addlotItem").empty();
	$("#errorcode1").empty();
	$("#errorcode2").empty();
	$("#addItemLog").empty();
    $("#addProductInfo").empty();
    $("#addQualityInfo").empty();
}
//输入物料SN 按回车键
	$("#DocSn").keydown(function(event){
	    if(event.keyCode == 13){
	        querySn();
	    }
	});
//双击事件
function clickTr(DocSn){
    $("#DocSn").val(DocSn);
    getDocSnInfo(DocSn);
        if($("#tag1").attr("class")=="current"){
            getSampleInfo(DocSn);
        }
        if($("#tag2").attr("class")=="current"){
            getProductInfo(DocSn);
        }
        if($("#tag3").attr("class")=="current"){
            getSampelDetInfo(DocSn);
        }
}
//跳转到产品信息页面
function proJump(obj){
  var formId = $("#formId1").val();
  
  var url = "${path}buss/bussModel.ms?exeid=aec0089e4d69487cbe28b4b70b1ffa21&FUNC_CODE=F10630&formId="+formId+"&iframeId="+_currentFrame+"&proSn="+obj;
  showPopWinFp(url, 800, 400,null,"<dict:lang value="产品追溯报表" />",obj,1);
}

//查询检验单基本信息
function getDocSnInfo(DocSn){
    util.showLoading("处理中...");
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=9671ad2051a84b62acd4c6f076de1122",//VM-检验单信息 操作功能 获取检验单基本信息
			    data: {
			        "DocSn" : DocSn
			    },
				success: function(data){
				        
						util.closeLoading();
						if(null != data.ajaxList){
							var rccList = data.ajaxList;
							for(var i=0;i<rccList.length;i++){
                            $("#itemCode").val(rccList[i].QII_ITEM_CODE);
                            $("#itemName").val(rccList[i].CI_ITEM_NAME);
                            $("#itemName").attr("title",rccList[i].CI_ITEM_NAME);
                            $("#itemSpec").val(rccList[i].CI_ITEM_SPEC);
                            $("#itemSpec").attr("title",rccList[i].CI_ITEM_SPEC);
                            if(rccList[i].SUPPLIER_NAME!=null && rccList[i].SUPPLIER_NAME!="null" && rccList[i].SUPPLIER_NAME!=""){
                              $("#supCode").val(rccList[i].SUPPLIER_NAME);  
                            }else{
                              $("#supCode").val(rccList[i].CUSTOMER);  
                            }
                            
                            
                            $("#reDoc").val(rccList[i].QII_CONNECT_DOC);$("#docStatus").val(rccList[i].QII_LIST_FLAG);
                            $("#checkNum").val(rccList[i].QII_SEND_NUM);$("#errorNum").val(rccList[i].QII_ERROR_NUM);
                            $("#extNum").val(rccList[i].QII_ACTUAL_NUM);$("#valPer").val(rccList[i].QII_INSEPCT_EMP);
                            $("#valTime").val(rccList[i].QII_SEND_TIME);$("#valresult").val(rccList[i].QII_INSEPCT_RESULT);
							}
						//	if(rccList.length==0){
						//	    $("#oneLot").val("");
						//	}
							oneItemDoc($("#itemCode").val());
							loadErrorEchart2($("#itemCode").val());
							
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//查询同物料检验单
function oneItemDoc(itemCode){
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=9e8db6f581af4ab7b8626202168e6fdf",//VM-检验单信息 操作功能 获取图表
			    data: {
			        "itemCode" : itemCode
			    },
				success: function(data){

						if(null != data.ajaxPage.dataList){
							var rccList = data.ajaxPage.dataList;
							for(var i=0;i<rccList.length;i++){
								$("#addlotItem").append("<tr ondblclick=\"clickTr('"+rccList[i].QII_INSPECT_SN+"')\"></tr>");
								$("#addlotItem tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");//rccList[i].ROWNUM_
								$("#addlotItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:160px;'>"+(rccList[i].QII_INSPECT_SN==null?"":rccList[i].QII_INSPECT_SN)+"</td>");
								if(rccList[i].SUPPLIER_NAME!=null && rccList[i].SUPPLIER_NAME!="null" && rccList[i].SUPPLIER_NAME!=""){
								    $("#addlotItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								}else{
								    $("#addlotItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;' title='"+(rccList[i].CUSTOMER==null?"":rccList[i].CUSTOMER)+"'>"+(rccList[i].CUSTOMER==null?"":rccList[i].CUSTOMER)+"</td>");
								}
								$("#addlotItem tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;'>"+(rccList[i].QII_INSEPCT_RESULT==null?"":rccList[i].QII_INSEPCT_RESULT)+"</td>");
							}
						
						}
						loadErrorEchart3(itemCode);	
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("123456");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//同物料检验单分页
var paginationImpl = {};
function oneItemDoc2(paginationImpl){
    var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    util.showLoading("处理中...");
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=9e8db6f581af4ab7b8626202168e6fdf",//VM-检验单信息 操作功能 获取图表
			    data: {
			        "itemCode" : $("#itemCode").val(),
			        "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
				success: function(data){
				                 $("#addlotItem").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = data.ajaxPage.dataList;
							for(var i=0;i<rccList.length;i++){
								$("#addlotItem").append("<tr ondblclick=\"clickTr('"+rccList[i].QII_INSPECT_SN+"')\"></tr>");
								$("#addlotItem tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");//rccList[i].ROWNUM_
								$("#addlotItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:160px;'>"+(rccList[i].QII_INSPECT_SN==null?"":rccList[i].QII_INSPECT_SN)+"</td>");
								if(rccList[i].SUPPLIER_NAME!=null && rccList[i].SUPPLIER_NAME!="null" && rccList[i].SUPPLIER_NAME!=""){
								    $("#addlotItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;'  title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");
								}else{
								    $("#addlotItem tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;'   title='"+(rccList[i].CUSTOMER==null?"":rccList[i].CUSTOMER)+"'>"+(rccList[i].CUSTOMER==null?"":rccList[i].CUSTOMER)+"</td>");
								}
								$("#addlotItem tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;text-align: center;'>"+(rccList[i].QII_INSEPCT_RESULT==null?"":rccList[i].QII_INSEPCT_RESULT)+"</td>");
							}
							
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax123456 tbody tr");
							_tongLineColor(tableTrJs);
							defTableWidthRewrite("123456");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//获取样本信息
function getSampleInfo(DocSn){ 
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=6ca785b696e94f849e9701d3b21ddb44",//VM-检验单信息 操作功能 获取样本
			    data: {
			        "DocSn" : DocSn,
			        "sflag" : "Y"
			    },
				success: function(data){
				
				var resList = data.ajaxList;
				if(resList!=null){
				    console.log("resList==>",resList);
				    for(var i=0;i<resList.length;i++){
				        $("#addItemLog").append("<tr></tr>");
				        $("#addItemLog tr:last").append("<td  class='datagrid-cell datagrid-cell-3' style='width:30px;text-align:center;'>"+(i+1)+"</td>");	
				        $("#addItemLog tr:last").append("<td  class='datagrid-cell datagrid-cell-3' style='width:160px;text-align:left;'><span onclick='itemJump1(\""+resList[i].QIP_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+(resList[i].QIP_SN==null?"":resList[i].QIP_SN)+"</span></td>");
				        $("#addItemLog tr:last").append("<td  class='datagrid-cell datagrid-cell-3' style='width:80px;text-align:right;'>"+(resList[i].QIP_ITEM_NUM==null?"":resList[i].QIP_ITEM_NUM)+"</td>");//
				        $("#addItemLog tr:last").append("<td  class='datagrid-cell datagrid-cell-3' style='width:80px;text-align:right;'>"+(resList[i].QIP_SAMPLE_NUM==null?"":resList[i].QIP_SAMPLE_NUM)+"</td>");
				        $("#addItemLog tr:last").append("<td  class='datagrid-cell datagrid-cell-3' style='width:80px;text-align:right;'>"+(resList[i].QIP_SCARP_NUM==null?"":resList[i].QIP_SCARP_NUM)+"</td>");
				        $("#addItemLog tr:last").append("<td  class='datagrid-cell datagrid-cell-3' style='width:80px;text-align:right;'>"+(resList[i].QIP_ERROR_NUM==null?"":resList[i].QIP_ERROR_NUM)+"</td>");
				        $("#addItemLog tr:last").append("<td  class='datagrid-cell datagrid-cell-3' style='width:80px;text-align:center;'>"+(resList[i].QIP_TEST_RESULT==null?"":resList[i].QIP_TEST_RESULT)+"</td>");
				        $("#addItemLog tr:last").append("<td  class='datagrid-cell datagrid-cell-3' style='width:100px;text-align:center;'>"+(resList[i].QIP_TEST_EMP==null?"":resList[i].QIP_TEST_EMP)+"</td>");
				        $("#addItemLog tr:last").append("<td  class='datagrid-cell datagrid-cell-3' style='width:200px;text-align:center;'>"+(resList[i].QIP_TEST_TIME==null?"":resList[i].QIP_TEST_TIME)+"</td>");
				        			        
				    }
				}
							var tableTrJs = $("#addItemLog tr");
							_tongLineColor(tableTrJs);
								defTableWidthRewrite('123456');
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//获取母本信息
function getProductInfo(DocSn){
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=6ca785b696e94f849e9701d3b21ddb44",//VM-检验单信息 操作功能 获取样本
			    data: {
			        "DocSn" : DocSn,
			        "sflag" : "N"
			    },
				success: function(data){
				                 
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							for(var i=0;i<rccList.length;i++){
								$("#addProductInfo").append("<tr></tr>");
								$("#addProductInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#addProductInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:160px;text-align: left;'><span onclick='itemJump2(\""+rccList[i].QIP_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+(rccList[i].QIP_SN==null?"":rccList[i].QIP_SN)+"</span></td>");
								$("#addProductInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: center;'>"+(rccList[i].QIP_TEST_RESULT==null?"":rccList[i].QIP_TEST_RESULT)+"</td>");
								$("#addProductInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: right;' >"+(rccList[i].QIP_ITEM_NUM==null?"":rccList[i].QIP_ITEM_NUM)+"</td>");
								$("#addProductInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:160px;text-align: left;' >"+(rccList[i].QIP_ITEM_CODE==null?"":rccList[i].QIP_ITEM_CODE)+"</td>");
								if(rccList[i].QIP_SAMPLE_FLAG=="Y"){
								$("#addProductInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: center;' ><span><img src='/N2/plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'></span></td>");    
								}else if(rccList[i].QIP_SAMPLE_FLAG=="N"){
								$("#addProductInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: center;' ><span><img src='/N2/plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'></span></td>");    
								}else{
								$("#addProductInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: center;' >"+(rccList[i].QIP_SAMPLE_FLAG==null?"":rccList[i].QIP_SAMPLE_FLAG)+"</td>");    
								}
								
								$("#addProductInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:100px;text-align: center;' >"+(rccList[i].QIP_TEST_EMP==null?"":rccList[i].QIP_TEST_EMP)+"</td>");
								$("#addProductInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: center;' >"+(rccList[i].QIP_TEST_TIME==null?"":rccList[i].QIP_TEST_TIME)+"</td>");
							}
							
						}
							var tableTrJs = $("#addProductInfo tr");
							_tongLineColor(tableTrJs);
								defTableWidthRewrite('1234567');
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//获取样本检测信息
function getSampelDetInfo(DocSn){
    $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=14bf10b24d104c4a8b7370b31d832571",//VM-检验单信息 操作功能 获取样本检测信息
			    data: {
			        "DocSn" : DocSn
			    },
				success: function(data){
				                 
						if(null != data.ajaxList){
							var rccList = data.ajaxList;
							for(var i=0;i<rccList.length;i++){
								$("#addQualityInfo").append("<tr></tr>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:160px;text-align: left;'><span onclick='itemJump1(\""+rccList[i].QII_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+(rccList[i].QII_SN==null?"":rccList[i].QII_SN)+"</span></td>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:160px;text-align: left;'>"+(rccList[i].QII_SUBSET_SN==null?"":rccList[i].QII_SUBSET_SN)+"</td>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:100px;text-align: center;' >"+(rccList[i].QII_ITEM_TYPE==null?"":rccList[i].QII_ITEM_TYPE)+"</td>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:160px;text-align: left;' >"+(rccList[i].QII_ITEM_NAME==null?"":rccList[i].QII_ITEM_NAME)+"</td>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: center;' >"+(rccList[i].QII_ITEM_CLASS==null?"":rccList[i].QII_ITEM_CLASS)+"</td>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: center;' >"+(rccList[i].QII_ITEM_UNIT==null?"":rccList[i].QII_ITEM_UNIT)+"</td>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: right;' >"+(rccList[i].QII_ITEM_MAXVALUE==null?"":rccList[i].QII_ITEM_MAXVALUE)+"</td>");
							    $("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: right;' >"+(rccList[i].QII_ITEM_MINVALUE==null?"":rccList[i].QII_ITEM_MINVALUE)+"</td>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: right;' >"+(rccList[i].QII_ACTUAL_VALUE==null?"":rccList[i].QII_ACTUAL_VALUE)+"</td>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: center;' >"+(rccList[i].QII_TEST_RESULT==null?"":rccList[i].QII_TEST_RESULT)+"</td>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:160px;text-align: left;' >"+(rccList[i].QII_ERROR_CODE==null?"":rccList[i].QII_ERROR_CODE)+"</td>");
								$("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:160px;text-align: left;' >"+(rccList[i].CEC_NAME==null?"":rccList[i].CEC_NAME)+"</td>");
							    $("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: right;' >"+(rccList[i].QII_ERROR_NUM==null?"":rccList[i].QII_ERROR_NUM)+"</td>");
							    $("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:80px;text-align: center;' >"+(rccList[i].QII_ERROR_GRADE==null?"":rccList[i].QII_ERROR_GRADE)+"</td>");
							    $("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:160px;text-align: left;' >"+(rccList[i].QII_TEST_METHOD==null?"":rccList[i].QII_TEST_METHOD)+"</td>");
							    $("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:160px;text-align: left;' >"+(rccList[i].QII_TEST_CONTENT==null?"":rccList[i].QII_TEST_CONTENT)+"</td>");
							    $("#addQualityInfo tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: left;' >"+(rccList[i].QII_MEMO==null?"":rccList[i].QII_MEMO)+"</td>");
							}
							
						}
							var tableTrJs = $("#addQualityInfo tr");
							_tongLineColor(tableTrJs);
								defTableWidthRewrite('1234');
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
	function loadErrorEchart2(itemCode){
	    // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('divpro1'));

        // 指定图表的配置项和数据
        myChart.setOption({
            title: {
                text: ''
            },
            tooltip: {
                trigger: 'axis',
                formatter: '{a} <br/>{b}: {c}%'
            },
            legend: {
               data:['产品']
            },
            xAxis: {
                data: [],
                axisLabel:{  
                         interval:0,//横轴信息全部显示  
                         rotate:-10,//-20度角倾斜显示  
                    }  
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: [],
                itemStyle: {
                        //柱形图圆角，鼠标移上去效果，如果只是一个数字则说明四个参数全部设置为那么多
                        emphasis: {
                            barBorderRadius: 30
                        },

                        normal: {
                            //柱形图圆角，初始化效果
                            barBorderRadius:[0, 0, 0, 0],
                            label: {
                                show: true,//是否展示
                                textStyle: {
                                    fontWeight:'bolder',
                                    fontSize : '12',
                                    fontFamily : '微软雅黑',
                                }
                            },
                        color: function (params){
                                var colorList = ['#00a0e9','#00a0e9'];
                                return colorList[params.dataIndex];
                            }
                        }
                }
            }]
            
        });
        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
        var names=[];    //类别数组（实际用来盛放X轴坐标值）
        var nums=[];    //销量数组（实际用来盛放Y坐标值）
        var showUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=9ea80157442341598bcf5a1155a54bf4";//VM-检验单信息 操作功能 获取图表
        $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: showUrl,
			    data: {
			        "type" : "modelEchart",
			        "itemCode" : itemCode
			    },
				success: function(data){	
                        
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = data.ajaxList;
							
							for(var i = 0;i < rccList.length; i++){
							  if(i==10){
							     break; 
							  }
								  names.push(rccList[i].SUP);
								  nums.push(rccList[i].OKPER);  
							}
							myChart.hideLoading();    //隐藏加载动画
                            myChart.setOption({        //加载数据图表
                                xAxis: {
                                    data: names
                                },
                                yAxis: {
                                               type : 'value',
                                                axisLabel:{formatter:'{value} %'}                                    
                                },
                                series: [{
                                    // 根据名字对应到相应的系列
                                    name: '合格率',
                                    type: 'bar',
                                    barMaxWidth:60,
                                    data: nums,
                                    itemStyle:{ 
                                    normal:{
                                    label : {show: true,position:'top',color: '#00a0e9',formatter:'{c}%'}
                                    }}
                                }]
                            });
						}
					myChart.hideLoading();	
					},
				error: function(msg){
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
						myChart.hideLoading();
				  }
				});
        }
        	function loadErrorEchart3(itemCode){
	    // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('divpro2'));

        // 指定图表的配置项和数据
        myChart.setOption({
            title: {
                text: ''
            },
            tooltip: {
                trigger: 'axis',
                formatter: '{b} <br/>{a}: {c}'
            },
            legend: {
               data:['产品']
            },
            xAxis: {
                data: [],
                axisLabel:{  
                         interval:0,//横轴信息全部显示  
                         rotate:-10//-20度角倾斜显示  
                    }  
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: [],
                itemStyle: {
                        //柱形图圆角，鼠标移上去效果，如果只是一个数字则说明四个参数全部设置为那么多
                        emphasis: {
                            barBorderRadius: 30
                        },

                        normal: {
                            //柱形图圆角，初始化效果
                            barBorderRadius:[0, 0, 0, 0],
                            label: {
                                show: true,//是否展示
                                textStyle: {
                                    fontWeight:'bolder',
                                    fontSize : '12',
                                    fontFamily : '微软雅黑',
                                }
                            },
                        color: function (params){
                                var colorList = ['#00a0e9','#00a0e9'];
                                return colorList[params.dataIndex];
                            }
                        }
                }
            },{
                name: '百分比',
                type: 'line',
                data: [],
                itemStyle: {
                        normal: {
                         lineStyle :{
                                       color: '#000080'
                                    },
                            label: {
                                show: true,//是否展示
                                textStyle: {
                                    fontWeight:'bolder',
                                    fontSize : '12',
                                    fontFamily : '微软雅黑',
                                }
                            }
                        }
                }
            }]
            
        });
        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
        var names=[];    //不良名称数组（实际用来盛放X轴坐标值）
        var nums=[];    //不良数组（实际用来盛放Y坐标值）
        var percent =[];//不良百分比数组
        var showUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=4cc14192b63844bab27dd0c38510bece";//VM-检验单信息 操作功能 获取不良排行
    	
        $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: showUrl,
			    data: {
			        "type" : "modelEchart",
			        "itemCode" : itemCode
			    },
				success: function(data){	
						if(null == data){return ;}
						if(null != data.ajaxList){
						    console.log(data.ajaxList)
							var rccList = data.ajaxList;
							$("#errorcode1").empty();
							$("#errorcode2").empty();
							if(rccList!=null){
							$("#errorcode1").append("<tr class='datagrid-header-row datagrid-title-ajax'></tr>");
							$("#errorcode1 tr:last").append("<td class='datagrid-cell' style='width:80px;'></td>");
							$("#errorcode2").append("<tr id='tr1'></tr>");
							$("#tr1").append("<td class='datagrid-cell' style='width:80px;'><dict:lang value='不良数量'/></td>");
							$("#errorcode2").append("<tr id='tr2'></tr>");
							$("#tr2").append("<td class='datagrid-cell' style='width:80px;'><dict:lang value='不良占比'/></td>");							
							for(var i = 0;i < rccList.length; i++){
							var percentWithZero = 0;
						    if(rccList[i].EPER.indexOf('.')==0){
						        percentWithZero = '0'+rccList[i].EPER;
						    }
						    else if(rccList[i].EPER.indexOf('.')>0){
						        percentWithZero = rccList[i].EPER;
						    }
								  names.push(rccList[i].ENAME);
								  nums.push(rccList[i].ENUM);  
								  percent.push(percentWithZero);
								  $("#errorcode1 tr:last").append("<td class='datagrid-cell' style='width:160px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;' title='"+(rccList[i].ENAME==null?"":rccList[i].ENAME)+"' >"+(rccList[i].ENAME==null?"":rccList[i].ENAME)+"</td>");
								  $("#tr1").append("<td class='datagrid-cell' style='width:160px;'>"+(rccList[i].ENUM==null?"":rccList[i].ENUM)+"</td>");
								  $("#tr2").append("<td class='datagrid-cell' style='width:160px;'>"+(rccList[i].EPER==null?"":percentWithZero)+"%</td>");
							}
							}
							var tableTrJs = $("#errorcode2 tr");
							_tongLineColor(tableTrJs);
								defTableWidthRewrite('12345678');
							myChart.hideLoading();    //隐藏加载动画
                            myChart.setOption({        //加载数据图表
                                xAxis: {
                                    data: names
                                },
                                yAxis: [
                                      {
type: 'value',
scale: true,
name: '不良数量',
data: nums,
min: 0,
minInterval : 1,
boundaryGap : [ 0, 0.1 ]
}, {
type: 'value',
scale: true,
name: '不良百分比',
max: 100,
min: 0,
axisLabel:{formatter:'{value} %'}
}                                  
                                ],
                                series: [{
                                    // 根据名字对应到相应的系列
                                    name: '数量',
                                    type: 'bar',
                                    barMaxWidth:60,
                                    data: nums,
                                    itemStyle:{ 
                                    normal:{
                                    label : {show: true,position:'top',color: '#00a0e9'}
                                    }}
                                }, {
                                    // 根据名字对应到相应的系列
                                    name: '百分比',
                                    type: 'line',
                                    smooth: true,
                                    yAxisIndex: 1,
                                    data: percent,
                                    itemStyle:{ 
                                    normal:{
                                    lineStyle :{
                                       color: '#000080'
                                    },
                                    label : {show: true,position:'top',color: '#000080',formatter:'{c}%'}
                                    }}
                                }      ]
                            });
						}
					myChart.hideLoading();	
					},
				error: function(msg){
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
						myChart.hideLoading();
				  }
				});
        }
        
        $('#divpro2').width($('#content5').width())
        $('#divpro1').width($('#content5').width())
        function judgIsOpen(title,url){
    var flag = true;
    var timestamp = Date.parse(new Date());
     $(window.parent.document).find("#tag1").siblings().each(function(seq,item){
						//打开过的标签不再重复打开
						console.log(top);
						if(title == $(item).attr("title")){
							var count = item.id.substring(3);
						 $(window.parent.document).find("#iframe"+count).attr("src",url);
						 top.switchTag(item.id,"content"+count,url);
							flag = false;
							return;
						}
					});
					if(flag){
					showPopWinFp(url, 800, 400,null,title,timestamp,1);
					}
}

function itemJump1(obj){
      var title = "<dict:lang value="样本信息" />";
      var formId = $("#formId1").val();
      var url = "${path}buss/bussModel.ms?&formId="+formId+"&exeid=c64bc075a4e74353b4fe96c06060a8b7&FUNC_CODE=F6486&frameId="+_currentFrame+"&jumpId="+obj;
      judgIsOpen(title,url);
    
}  



function itemJump2(obj){
    var title = "<dict:lang value="制令单信息" />";
  var formId = $("#formId1").val();
  var url = "${path}buss/bussModel.ms?&formId="+formId+"&exeid=7d0349f7a60b405299af347205b1d92f&FUNC_CODE=F3454&frameId="+_currentFrame+"&jumpId="+obj;
  //  judgIsOpen(title,url);
} 
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll2','.head2');
    setPopScroll('.scroll3','.head3');
    setPopScroll('.scroll5','.head5');
    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#DocSn").val(jumpId);
                  querySn();
                  }   
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
