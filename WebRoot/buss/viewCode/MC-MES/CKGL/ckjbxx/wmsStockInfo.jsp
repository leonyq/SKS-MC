<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="仓库库存信息" />
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
    		<bu:header formId ="0b6208aca3fe40d5bc66a4c230c32d31"/>
  
    

    <!-- head里面 -->
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
		if(tag=="tag1"){
			loadItem();
			//$("#allSelect").removeAttr("checked");
		}
		if(tag=="tag2"){
			$('.scroll1').mCustomScrollbar("destroy");
            loadStockDetail();
                    
            setPopScroll('.scroll1','.head1')
		}
	}
$(function(){
    
	$("#tag1").addClass("current");
	$("#57e952045cc44c269d036ef6f47085f6").attr("style","display:none;");
	$("#WSI_WH_CODE").attr("onchange","_selectCascadNew(this.value,'WSI_WH_CODE','a3d4f4c6e37047ba989a366f217aa83a','WSI_WH_CODE','WSI_DISTRICT_CODE');getStorageCode();");
    $("#WSI_DISTRICT_CODE").attr("onchange","getStorageCode();");
    
})
//全选
     	function getAllItem(){
		if($("#allSelect").attr("checked")=="checked"){
			$("#addItemDetail :checkbox").attr("checked",true);
		}else{
			$("#addItemDetail :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
//根据仓库或者库区获取库位
function getStorageCode(){
    util.showLoading("处理中...");
    $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "buss/bussModel_exeFunc.ms?funcMId=9b045aeef1684c1b8c968cc740b7c3cd",
			    data: {
			        "whCode" : $("#WSI_WH_CODE").val(),
			        "DISTRICT_CODE" : $("#WSI_DISTRICT_CODE").val()
			    },
				success: function(data){	
                        util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							var tempOption = "";
							for(var i = 0;i < rccList.length; i++){
								tempOption = tempOption + "<option value='"+rccList[i].WA_AREA_SN+"'>"+rccList[i].WA_AREA_NAME+"</option>";
							}
						    $("#WSI_STORAGE_CODE").chosen("destroy");
							$("#WSI_STORAGE_CODE").empty();
             				$("#WSI_STORAGE_CODE").append("<option value=''>--请选择--</option>");
             				$("#WSI_STORAGE_CODE").append(tempOption);
             				//setChosen();
             				//$("#WSI_STORAGE_CODE").chosen("destroy");
                        	//$("#WSI_STORAGE_CODE").trigger("chosen:updated");
                        	//Chosen.destroy().init();
                        	
                        	if(rccList.length>15){
                        	$("#WSI_STORAGE_CODE").chosen({search_contains: true});
                        	$("#WSI_STORAGE_CODE_chosen .chosen-search").css("display","block");
                        	}else{
                        	    $("#WSI_STORAGE_CODE").chosen();
                        	    $("#WSI_STORAGE_CODE_chosen .chosen-search").css("display","block");
                        	}
             				//mySetChosen();
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//设置下拉框样式
function mySetChosen(){
	
	var curWinHeight = $(document).height();//当前窗口高度
	$(".dept_select").chosen({
		//inherit_select_classes:true,//继承select class
		//width:"100%",
		//disable_search:true,//是否隐藏搜索框
		disable_search_threshold:15//少于15项，隐藏搜索框
	});

	//大于10个选项的，显示搜索框
	
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
</script>
<style>
#tbody_0b6208aca3fe40d5bc66a4c230c32d31 td {
    border-width: 0 1px 1px 0;
    border-style: solid;
    margin: 0;
    border-color: #dbe1ef;
}
</style>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="9b3fc18c9332439ab757650666f022af" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                     
                     
		<bu:search viewId="9b3fc18c9332439ab757650666f022af" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                    
		<input type="hidden" name="formPage0b6208aca3fe40d5bc66a4c230c32d31" id="formPage0b6208aca3fe40d5bc66a4c230c32d31" value="${formPage0b6208aca3fe40d5bc66a4c230c32d31}"/>
		<input type="hidden" name="formId" id="formId1" value='0b6208aca3fe40d5bc66a4c230c32d31'/>
		<input type="hidden" name="formId" id="formId2" value='0b6208aca3fe40d5bc66a4c230c31234'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" name="jumpId2" id="jumpId2" value='${param.jumpId2}'/>
		<div class="js-tab">
					<DIV id="container" style="box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab" style="padding-left:12px;">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="库存汇总" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="库存明细" /></SPAN> </A>
								</LI>
								

							</UL>
						</DIV>
			<DIV class="content1" id="content" style="margin-top: 15px;">
			<DIV id="content1" style="margin-top:4px;" data-tab="tag1" >
				<div style="float: left;margin-left: 10px;"><lable style="width:70px;display:inline-block"><dict:lang value="汇总方式：" /></lable></div>
				<div style="float: left;margin-left: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="mySelect1" name="mySelect" value="1"/>&nbsp;<dict:lang value="仓库" /></lable></div>
				<div style="float: left;margin-left: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="mySelect2" name="mySelect" value="2"/>&nbsp;<dict:lang value="批次" /></lable></div>
				<div style="float: left;margin-left: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="mySelect3" name="mySelect" value="3"/>&nbsp;<dict:lang value="客户" /></lable></div>
				<div style="float: left;margin-left: 10px;"><lable style="width:68px;display:inline-block"><input type="checkbox" id="mySelect4" name="mySelect" value="4"/>&nbsp;<dict:lang value="供应商" /></lable></div>
				<div class="panel1 datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border:0;">
						<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head"  id="" >
								<table  class="datagrid-htable fixedTable  " id="datagrid-htable0b6208aca3fe40d5bc66a4c230c31234" >
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
										<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllItem();" style="cursor: pointer;" title="全选"/></td >
						
										<td class="datagrid-cell" style="width:200px;" ><dict:lang value="组织机构" /></td >
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料料号" /></td >
										<td class="datagrid-cell" style="width:250px;"><dict:lang value="物料名称" /></td >
										<td class="datagrid-cell" style="width:250px;"><dict:lang value="物料规格" /></td >
										<td class="datagrid-cell" style="width:90px;display:none;" id="whCode"><dict:lang value="仓库" /></td >
										<td class="datagrid-cell" style="width:90px;display:none;" id="itemLot"><dict:lang value="批次" /></td >
										<td class="datagrid-cell" style="width:150px;display:none;" id="supCode"><dict:lang value="供应商" /></td >
										<td class="datagrid-cell" style="width:150px;display:none;" id="custCode"><dict:lang value="客户" /></td >
										<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料数量" /></td >
										
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll" >
							<table class="datagrid-btable fixedTable " style="table-layout: fixed;" id="datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234"   >
								<tbody id="addItemDetail" >
								</tbody>
							</table>
						</div>
							
					</div>
				</div>
				<div style="background-color: white;" id="pageDiv">
                                 			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemInfo&formId=formId2&showLoading=0" />
                                </div>
			</DIV>
			<DIV id="content2"  data-tab="tag2" style="display:none">
		<div class="panel-ajax datagrid datagrid-div1"  id="0b6208aca3fe40d5bc66a4c230c32d31">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax0b6208aca3fe40d5bc66a4c230c32d31" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head1" id="datagrid-header-inner0b6208aca3fe40d5bc66a4c230c32d31">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable0b6208aca3fe40d5bc66a4c230c32d31" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="0b6208aca3fe40d5bc66a4c230c32d31" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_0b6208aca3fe40d5bc66a4c230c32d31" onclick="_selectAjaxTableAllData(this,'0b6208aca3fe40d5bc66a4c230c32d31')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WSI_ITEM_SN" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WSI_STOCK_FLAG" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_ITEM_CODE" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_ITEM_NAME" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_ITEM_SPEC" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_LOT_NO" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_ITEM_NUM" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_WH_CODE" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_DISTRICT_CODE" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_STORAGE_CODE" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WSI_INSPECT_FLAG" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WSI_FREEZE_FLAG" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_DOC_NUM" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WSI_CONNECT_DOC" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WSI_SUP_CODE" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_CUST_CODE" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_FIRST_SN" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_SECOND_SN" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_THIRD_SN" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_FOURTH_SN" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
		    <td class="datagrid-cell" style="width:90px;" ><dict:lang value="复检周期" /></td >
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WSI_RECHECKOUT" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WSI_TEST_TIME" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_ITEM_FLAG" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_INVALID_DATE" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_EXTEND_TIME" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WSI_DULL_TIME" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="WSI_SUP_TRACE" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_PRODUCE_DATE" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WSI_RECEIVE_TIME" formId="0b6208aca3fe40d5bc66a4c230c32d31" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body1 datagrid-div3 datagrid-body-ajax scroll1" id="tableDiv0b6208aca3fe40d5bc66a4c230c32d31" onscroll="ajaxTableScroll(this,'0b6208aca3fe40d5bc66a4c230c32d31')" >
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31" >
		<tbody id="tbody_0b6208aca3fe40d5bc66a4c230c32d31" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
			<c:if test="${formPage0b6208aca3fe40d5bc66a4c230c32d31==1}">		<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listDetailInfo&formId=0b6208aca3fe40d5bc66a4c230c32d31&showLoading=0" />
			</div>
		
            </c:if>
		</div>
	    </DIV>
		 				

	</DIV>

</DIV>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="9b3fc18c9332439ab757650666f022af" />
     
		<bu:script viewId="9b3fc18c9332439ab757650666f022af" />
<script type="text/javascript">    
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
                    if(isPage(formId)){
                        var isFirstLoad = firstLoadThisPage(formId);
                        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
                        var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    util.showLoading("处理中...");
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                            clearChildTable();
                        	util.closeLoading();
                        },
                        error: function(msg){
                        	util.closeLoading();
                            utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                        }
                    });
                }
                
                
                function isPage(formId){
                    var isPageVal =  $("#formPage"+formId).val();
                    if(isPageVal =="1"){    
                       return true;
                    }
                    return false;
                }
                
                
                function query(thisObj){
                    var formId = $("#formId1").val();
                    if($("#tag1").attr("class")=="current"){
                        loadItem();
                    }
                    if($("#tag2").attr("class")=="current"){
                        $('.scroll1').mCustomScrollbar("destroy");
                        loadStockDetail();	
                        setPopScroll('.scroll1','.head1');
                        $('.head1')[0].scrollLeft = 0
                    }
                    /*$('.scroll1').mCustomScrollbar("destroy");
                    loadStockDetail();
                    
                    
                    //$('.scroll1').mCustomScrollbar("destroy");
                    //listDetailInfo("0b6208aca3fe40d5bc66a4c230c32d31");
                    
                    setPopScroll('.scroll1','.head1');*/
                    //listAjaxTable(formId);
                }
                
                
                function clearChildTable(){
                    $(".isChilds").empty();
                    getFormIdInitChildPage();
                }
                
               
               function setTableWidth(formId){
                    /**
                    *var scrollHeight = $("#tableDiv"+formId)[0].scrollHeight;
                    var height = $("#tableDiv"+formId).height();
                    var datagridHeaderWidth = $("#datagrid-view-ajax"+formId+" .datagrid-header").width();
                    if(scrollHeight-height>0){
                      $("#datagrid-htable"+formId).css("width",datagridHeaderWidth-20+'px');
                      $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth-20+'px');
                    }else{
                      $("#datagrid-htable"+formId).css("width",datagridHeaderWidth+'px');
                      $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth+'px');    
                    }
                    *
                    */
                }
            
                
                function alertInfo(msg){
                    //utilsFp.alert(msg);
                    utilsFp.confirmIcon(3,"","","", msg,"","350","");
                    
                }
                
                
                function clearAllSelect(){
                    $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
                }
                
                function reloadPg(msg,title,width,height,time){
                    msgPop(msg,"",title,width,height,time);
                }
                
                
                function listChildAjaxTable(formId,paramList){
                    var data = {
                        "paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,
                        "paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,
                        "paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,
                        "paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,
                        "paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
                        "paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
                    };
                    if(isPage(formId)){
                        data["page.currentPage"] = _GLO_FORM_PAGE_MAP[formId].currentPage;
                        data["page.pageRecord"] = _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    if(paramList != null && paramList != ""){
                        data["paramList"] = paramList;
                    }
                    if($("#DATA_AUTH").length>0){
                    	data["DATA_AUTH"] = $("#DATA_AUTH").val();
                    }
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=9b3fc18c9332439ab757650666f022af";
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:data,
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);    
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                        },
                        error: function(msg){
                            utilsFp.confirmIcon(3,"","","", "后台操作出错!","","260","145");
                        }
                    });
                }
                
                function setCrossWiseScroll(formId,arrHtml){
                    if(arrHtml.length==0){
                        var tableWidth = $("#datagrid-btable-ajax"+formId).width();  
                        arrHtml.push("<tr  style='width: ");
                        arrHtml.push(tableWidth+"px");
                        arrHtml.push(";");
                        arrHtml.push("height:1000px;'");
                        $("#tableDiv"+formId).css({"overflow-y":"hidden","overflow-x":"auto"});
                   }else{
                        $("#tableDiv"+formId).css({"overflow-y":"auto","overflow-x":"auto"});    
                   }
               }
                
                
                function initChildPage(formId){
                    var ajaxPage = new Object();
                    ajaxPage.currentPage = 1;
                    ajaxPage.pageRecord = 20;
                    ajaxPage.totalRecord = 0;
                    ajaxPage.totalPage = 1;
                    ajaxPage.first = true;
                    ajaxPage.last = true;
                    pageFun(ajaxPage,formId);
                }
                
                
                
                function initPage(page,formId){
                    var ajaxPage = new Object();
                    ajaxPage.currentPage = parseInt(page.currentPage);
                    ajaxPage.pageRecord = parseInt(page.pageRecord);
                    ajaxPage.totalPage = parseInt(page.totalPage);
                    ajaxPage.totalRecord = parseInt(page.totalRecord);
                    ajaxPage.first = page.first;
                    ajaxPage.last = page.last;
                    pageFun(ajaxPage,formId);
                };
                
                
                function firstLoadThisPage(formId){
                    if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
                        return true;
                    }
                    return false;
                }
                
                
                function getFormIdInitChildPage(){
                    var tableCount = $("#tableCount").val();
                    for ( var i = 2; i <= tableCount; i++) {
                        var formId = $("#formId"+i).val();
                        if(isPage(formId)){
                           initChildPage(formId);
                        }
                    }
                }
                
                
                function initTableWidth(){
                    var width = $(window).width() - 2;
                    $(".datagrid-htable,.datagrid-btable").width(width);
                }
                
                
                var der = '1';
                var jumpId = null;
                function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    
                     jumpId= $("#jumpId").val();  
              		if(jumpId!=""){
              		$("#WSI_WH_CODE option").each(function(){
              		    if(jumpId==$(this).text()){
              		        $(this).attr("selected",true);
              		        return;
              		    }
              		})
              		}
              		$("#WSI_WH_CODE").trigger("chosen:updated");
              		
              		 jumpId2= $("#jumpId2").val();  
              		if(jumpId2!=""){
              		$("#WSI_ITEM_SN").val(jumpId2);
              		}
                    getFormIdInitChildPage();
                    loadFirstItem();
                    
                 };
            
                $(function(){
                    var colNo = $("#relColVals").val();
                    var subRelColIds = $("#subRelColIds").val();
                    var subFormIds = $("#subFormIds").val();
                    if(subRelColIds!="null"){
                        var formId1 = $("#formId1").val();
                        $(".isParents tr").live("click",function(){
                            var _this = $(this);
                            var relColVals = "";
                            var abbr = _this.attr("abbr");
                            var arrColNo = colNo.split(",");
                            $(arrColNo).each(function(i,v){
                                relColVals += $("tr[abbr='"+abbr+"']").find("input[name='"+v+"']").val()+",";
                            });
                            setSubData(formId1,subFormIds,subRelColIds,relColVals,"","",true);
                        });
                    };
                });
                
                function getRelColVal(arr,obj,colNo){
                      if(colNo){
                       var arrColNo = colNo.split(",");
                          $(arrColNo).each(function(i,v){
                             if(v!="ID"){
                               arr.push("<input type='hidden' name='"+v+"' value='"+obj[v]+"' />");
                             }
                          });
                      }
                }
            var isFirstSetScroll = 0;

/*$(function(){

	loadFirstItem();
	//loadStockDetail();
})	*/
var loadCollectUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=0d4b7bd412f148ddaa3ecb71659570a1";
//页面刷新时加载库存汇总信息
function loadFirstItem(){
	var dataAuth = $("#DATA_AUTH").val();
	var itemCode = $("#WSI_ITEM_CODE_SHOW").val();
	var itemName = $.trim($("#WSI_ITEM_NAME").val());
	var supCode = $("#WSI_SUP_CODE").val();
	var itemSn = $.trim($("#WSI_ITEM_SN").val());
	var containerSn = $.trim($("#WSI_CONTAINER_SN").val());
	var custCode = $("#WSI_CUST_CODE").val();
	var docNum = $.trim($("#WSI_DOC_NUM").val());
	var connectDoc = $.trim($("#WSI_CONNECT_DOC").val());
	var whCode = $("#WSI_WH_CODE").val();
	var districtCode = $("#WSI_DISTRICT_CODE").val();
	var storageCode = $("#WSI_STORAGE_CODE").val();
	var itemState = $("#WSI_STOCK_FLAG").val();
	var inspectFlag = $("#WSI_INSPECT_FLAG").val();
	var freezeFlag = $("#WSI_FREEZE_FLAG").val();
	var receiveBegin = $("#WSI_RECEIVE_TIME_BEGIN").val();
	var receiveEnd = $("#WSI_RECEIVE_TIME_END").val();
	var invalidBegin = $("#WSI_INVALID_DATE_BEGIN").val();
	var invalidEnd = $("#WSI_INVALID_DATE_END").val();
	
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
		dataType: "json",
		url: loadCollectUrl,
		data: {
			 "dataAuth" : dataAuth,
			 "itemCode" : itemCode,
			 "itemName" : itemName,
			 "supCode" : supCode,
			 "itemSn" : itemSn,
			 "containerSn" : containerSn,
			 "custCode" : custCode,
			 "docNum" : docNum,
			 "connectDoc" : connectDoc,
			 "whCode" : whCode,
			 "districtCode" : districtCode,
			 "storageCode" : storageCode,
			 "itemState" : itemState,
			 "inspectFlag" : inspectFlag,
			 "freezeFlag" : freezeFlag,
			 "receiveBegin" : receiveBegin,
			 "receiveEnd" : receiveEnd,
			 "invalidBegin" : invalidBegin,
			 "invalidEnd" : invalidEnd,
			 "collectWay" : ""
	    },
		success: function(data){
						util.closeLoading();
						$("#addItemDetail").empty();
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
							    if(rccList[i].DATA_AUTH==null)  rccList[i].DATA_AUTH="";
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
								if(rccList[i].WSI_LOT_NO==null)  rccList[i].WSI_LOT_NO="";
								if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
								if(rccList[i].CUSTOMER==null)  rccList[i].CUSTOMER="";
									if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-1 cssy' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:250PX;text-align: center;' title='"+rccList[i].WSI_ITEM_CODE+"'><span onclick='itemJump1(\""+rccList[i].WSI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:250PX;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:250PX;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:90px;display:none;text-align: center;' ></td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;display:none;text-align: center;' ></td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;display:none;text-align: center;' ></td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;display:none;text-align: center;' ></td>");
								
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:250px;text-align: right;' title='"+rccList[i].ITEM_NUM+"'>"+rccList[i].ITEM_NUM+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234');
							defTableWidthRewrite('0b6208aca3fe40d5bc66a4c230c31234');
						if(der=='1'){
							    
							    jumpId= $("#jumpId").val();  
              		if(jumpId!=""){
              		$("#WSI_WH_CODE option").each(function(){
              		    if(jumpId==$(this).text()){
              		        $(this).attr("selected",true);
              		        return;
              		    }
              		})
              		$("#WSI_WH_CODE").trigger("chosen:updated");
              		
                  
                  } 
							}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}

//加载库存汇总信息
function loadItem(){
	var dataAuth = $("#DATA_AUTH").val();
	var itemCode = $("#WSI_ITEM_CODE_SHOW").val();
	var itemName = $.trim($("#WSI_ITEM_NAME").val());
	var supCode = $("#WSI_SUP_CODE").val();
	var itemSn = $.trim($("#WSI_ITEM_SN").val());
	var containerSn = $.trim($("#WSI_CONTAINER_SN").val());
	var custCode = $("#WSI_CUST_CODE").val();
	var docNum = $.trim($("#WSI_DOC_NUM").val());
	var connectDoc = $.trim($("#WSI_CONNECT_DOC").val());
	var whCode = $("#WSI_WH_CODE").val();
	var districtCode = $("#WSI_DISTRICT_CODE").val();
	var storageCode = $("#WSI_STORAGE_CODE").val();
	var itemState = $("#WSI_STOCK_FLAG").val();
	var inspectFlag = $("#WSI_INSPECT_FLAG").val();
	var freezeFlag = $("#WSI_FREEZE_FLAG").val();
	var receiveBegin = $("#WSI_RECEIVE_TIME_BEGIN").val();
	var receiveEnd = $("#WSI_RECEIVE_TIME_END").val();
	var invalidBegin = $("#WSI_INVALID_DATE_BEGIN").val();
	var invalidEnd = $("#WSI_INVALID_DATE_END").val();
	
	var tempWay="";
	//获取勾选的汇总方式
	$('input[name="mySelect"]:checked').each(function(i){
		if(i==0){
			tempWay=$(this).val();
		}else{
			tempWay = tempWay + "," +$(this).val();
		}
	});
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
		dataType: "json",
		url: loadCollectUrl,
		data: {
			 "dataAuth" : dataAuth,
			 "itemCode" : itemCode,
			 "itemName" : itemName,
			 "supCode" : supCode,
			 "itemSn" : itemSn,
			 "containerSn" : containerSn,
			 "custCode" : custCode,
			 "docNum" : docNum,
			 "connectDoc" : connectDoc,
			 "whCode" : whCode,
			 "districtCode" : districtCode,
			 "storageCode" : storageCode,
			 "itemState" : itemState,
			 "inspectFlag" : inspectFlag,
			 "freezeFlag" : freezeFlag,
			 "receiveBegin" : receiveBegin,
			 "receiveEnd" : receiveEnd,
			 "invalidBegin" : invalidBegin,
			 "invalidEnd" : invalidEnd,
			 "collectWay" : tempWay
	    },
		success: function(data){
						util.closeLoading();
						$("#addItemDetail").empty();
						//先隐藏
						$("#whCode").attr("style","width:90px;display:none;");
						$("#itemLot").attr("style","width:90px;display:none;");
						$("#supCode").attr("style","width:150px;display:none;");
						$("#custCode").attr("style","width:150px;display:none;");
						$('input[name="mySelect"]:checkbox').each(function () { 
							if ($(this).attr("checked")) { 
								if($(this).val()==1)  $("#whCode").attr("style","width:90px;");
								if($(this).val()==2)  $("#itemLot").attr("style","width:90px;");
								if($(this).val()==4)  $("#supCode").attr("style","width:150px;");
								if($(this).val()==3)  $("#custCode").attr("style","width:150px;");
							} 
						});
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
							    if(rccList[i].DATA_AUTH==null)  rccList[i].DATA_AUTH="";
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
								if(rccList[i].WSI_LOT_NO==null)  rccList[i].WSI_LOT_NO="";
								if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
								if(rccList[i].CUSTOMER==null)  rccList[i].CUSTOMER="";
								if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200PX;text-align: center;' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:250PX;text-align: center;' title='"+rccList[i].WSI_ITEM_CODE+"'><span onclick='itemJump1(\""+rccList[i].WSI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:250PX;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:250px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
								
								if($("#mySelect1").prop("checked")==true){
								    $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
										    
								}else{
								  $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;display:none;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>")   ;
								}
								
								if($("#mySelect2").prop("checked")==true){
								   $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</td>");
										    }else{
									$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;display:none;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</td>");
										    }
								if($("#mySelect3").prop("checked")==true){
								     $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
										}else{
										     $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;display:none;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
										}
								if($("#mySelect4").prop("checked")==true){
								   $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");	
                                            }else{
                                                $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;display:none;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");	
                                            }
								/*
								$('input[name="mySelect"]:checkbox').each(function () { 
									if ($(this).attr("checked")) { 
										if($(this).val()==1){  
										$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
										    
										}else{
										 $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;display:none;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>")   ;
										}
										if($(this).val()==2) {
										    $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</td>");
										    }else{
										         $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;display:none;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</td>");
										    }
										if($(this).val()==4) {
										    $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");	
                                            }else{
                                                $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;display:none;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");	
                                            }
										if($(this).val()==3) {
										     $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
										}else{
										     $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;display:none;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
										}
									} 
								});
								*/
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:250px;text-align: right;' title='"+rccList[i].ITEM_NUM+"'>"+rccList[i].ITEM_NUM+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234');
						defTableWidthRewrite('0b6208aca3fe40d5bc66a4c230c31234');
						$('.scroll').mCustomScrollbar("destroy");
						setPopScroll('.scroll','.head');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//库存汇总信息分页
var paginationImpl = {};
function SearchItemInfo(paginationImpl,url){
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
    	
	var dataAuth = $("#DATA_AUTH").val();
	var itemCode = $("#WSI_ITEM_CODE_SHOW").val();
	var itemName = $.trim($("#WSI_ITEM_NAME").val());
	var supCode = $("#WSI_SUP_CODE").val();
	var itemSn = $.trim($("#WSI_ITEM_SN").val());
	var containerSn = $.trim($("#WSI_CONTAINER_SN").val());
	var custCode = $("#WSI_CUST_CODE").val();
	var docNum = $.trim($("#WSI_DOC_NUM").val());
	var connectDoc = $.trim($("#WSI_CONNECT_DOC").val());
	var whCode = $("#WSI_WH_CODE").val();
	var districtCode = $("#WSI_DISTRICT_CODE").val();
	var storageCode = $("#WSI_STORAGE_CODE").val();
	var itemState = $("#WSI_STOCK_FLAG").val();
	var inspectFlag = $("#WSI_INSPECT_FLAG").val();
	var freezeFlag = $("#WSI_FREEZE_FLAG").val();
	var receiveBegin = $("#WSI_RECEIVE_TIME_BEGIN").val();
	var receiveEnd = $("#WSI_RECEIVE_TIME_END").val();
	var invalidBegin = $("#WSI_INVALID_DATE_BEGIN").val();
	var invalidEnd = $("#WSI_INVALID_DATE_END").val();
	
	var tempWay="";
	//获取勾选的汇总方式
	$('input[name="mySelect"]:checked').each(function(i){
		if(i==0){
			tempWay=$(this).val();
		}else{
			tempWay = tempWay + "," +$(this).val();
		}
	});
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
		dataType: "json",
		url: url,
		data: {
			 "paraMap.dataAuth" : dataAuth,
			 "paraMap.itemCode" : itemCode,
			 "paraMap.itemName" : itemName,
			 "paraMap.supCode" : supCode,
			 "paraMap.itemSn" : itemSn,
			 "paraMap.containerSn" : containerSn,
			 "paraMap.custCode" : custCode,
			 "paraMap.docNum" : docNum,
			 "paraMap.connectDoc" : connectDoc,
			 "paraMap.whCode" : whCode,
			 "paraMap.districtCode" : districtCode,
			 "paraMap.storageCode" : storageCode,
			 "paraMap.paraMap.paraMap.itemState" : itemState,
			 "paraMap.paraMap.inspectFlag" : inspectFlag,
			 "paraMap.freezeFlag" : freezeFlag,
			 "paraMap.receiveBegin" : receiveBegin,
			 "paraMap.receiveEnd" : receiveEnd,
			 "paraMap.invalidBegin" : invalidBegin,
			 "paraMap.invalidEnd" : invalidEnd,
			 "paraMap.collectWay" : tempWay,
			 "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			 "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
	    },
		success: function(data){
						util.closeLoading();
						$("#addItemDetail").empty();
						//先隐藏
						$("#whCode").attr("style","width:90px;display:none;");
						$("#itemLot").attr("style","width:90px;display:none;");
						$("#supCode").attr("style","width:150px;display:none;");
						$("#custCode").attr("style","width:150px;display:none;");
						$('input[name="mySelect"]:checkbox').each(function () { 
							if ($(this).attr("checked")) { 
								if($(this).val()==1)  $("#whCode").attr("style","width:90px;");
								if($(this).val()==2)  $("#itemLot").attr("style","width:90px;");
								if($(this).val()==4)  $("#supCode").attr("style","width:150px;");
								if($(this).val()==3)  $("#custCode").attr("style","width:150px;");
							} 
						});
						if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							for(var i = 0;i < rccList.length; i++){
							    if(rccList[i].DATA_AUTH==null)  rccList[i].DATA_AUTH="";
								if(rccList[i].CI_ITEM_SPEC==null)  rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].SUPPLIER_NAME==null)  rccList[i].SUPPLIER_NAME="";
								if(rccList[i].WSI_LOT_NO==null)  rccList[i].WSI_LOT_NO="";
								if(rccList[i].WH_NAME==null)  rccList[i].WH_NAME="";
								if(rccList[i].CUSTOMER==null)  rccList[i].CUSTOMER="";
								if(rccList[i].CI_ITEM_NAME==null)  rccList[i].CI_ITEM_NAME="";
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tbody:last").append("<tr id='tr1_"+i+"' ></tr>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:101px;text-align: center;' title='"+rccList[i].DATA_AUTH+"'>"+rccList[i].DATA_AUTH+"</td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+rccList[i].WSI_ITEM_CODE+"'><span onclick='itemJump1(\""+rccList[i].WSI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_CODE+"</span></td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</td>");
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:120px;text-align: center;' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</td>");
							if($("#mySelect1").prop("checked")==true){
								    $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
										    
								}else{
								  $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;display:none;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>")   ;
								}
								
								if($("#mySelect2").prop("checked")==true){
								   $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</td>");
										    }else{
										         $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;display:none;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</td>");
										    }
								if($("#mySelect3").prop("checked")==true){
								     $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
										}else{
										     $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;display:none;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
										}
								if($("#mySelect4").prop("checked")==true){
								   $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");	
                                            }else{
                                                $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;display:none;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");	
                                            }
							/*	$('input[name="mySelect"]:checkbox').each(function () { 
									if ($(this).attr("checked")) { 
										if($(this).val()==1){  
										$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>");
										    
										}else{
										 $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:90px;display:none;' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</td>")   ;
										}
										if($(this).val()==2) {
										    $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</td>");
										    }else{
										         $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:90px;display:none;' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</td>");
										    }
										if($(this).val()==4) {
										    $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");	
                                            }else{
                                                $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:150px;display:none;' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</td>");	
                                            }
										if($(this).val()==3) {
										     $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
										}else{
										     $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;display:none;' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</td>");
										}
									} 
								});*/
								
								$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:90px;text-align: right;' title='"+rccList[i].ITEM_NUM+"'>"+rccList[i].ITEM_NUM+"</td>");
							}
						}
						pageFun(data.ajaxPage,"formId2");
							var tableTrJs = $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c31234');
						defTableWidthRewrite('0b6208aca3fe40d5bc66a4c230c31234');
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//库存明细信息
function loadStockDetail(){
	var dataAuth = $("#DATA_AUTH").val();
	var itemCode = $("#WSI_ITEM_CODE_SHOW").val();
	var itemName = $.trim($("#WSI_ITEM_NAME").val());
	var supCode = $("#WSI_SUP_CODE").val();
	var itemSn = $.trim($("#WSI_ITEM_SN").val());
	var containerSn = $.trim($("#WSI_CONTAINER_SN").val());
	var custCode = $("#WSI_CUST_CODE").val();
	var docNum = $.trim($("#WSI_DOC_NUM").val());
	var connectDoc = $.trim($("#WSI_CONNECT_DOC").val());
	var whCode = $("#WSI_WH_CODE").val();
	var districtCode = $("#WSI_DISTRICT_CODE").val();
	var storageCode = $("#WSI_STORAGE_CODE").val();
	var itemState = $("#WSI_STOCK_FLAG").val();
	var inspectFlag = $("#WSI_INSPECT_FLAG").val();
	var freezeFlag = $("#WSI_FREEZE_FLAG").val();
	var receiveBegin = $("#WSI_RECEIVE_TIME_BEGIN").val();
	var receiveEnd = $("#WSI_RECEIVE_TIME_END").val();
	var invalidBegin = $("#WSI_INVALID_DATE_BEGIN").val();
	var invalidEnd = $("#WSI_INVALID_DATE_END").val();
	var formId = $("#formId1").val();
	util.showLoading("处理中...");
	var loadDetailUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=f6f9ef07ce224035b19b00fc3b1d7e06";
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: loadDetailUrl,
			    data: {
			        "dataAuth": dataAuth,
			        "itemCode": itemCode,
			        "itemName": itemName,
			        "supCode": supCode,
			        "itemSn": itemSn,
			        "containerSn": containerSn,
			        "custCode": custCode,
			        "docNum": docNum,
			        "connectDoc": connectDoc,
			        "whCode": whCode,
			        "districtCode": districtCode,
			        "storageCode": storageCode,
			        "itemState": itemState,
			        "inspectFlag": inspectFlag,
			        "freezeFlag": freezeFlag,
			        "receiveBegin": receiveBegin,
			        "receiveEnd": receiveEnd,
			        "invalidBegin": invalidBegin,
			        "invalidEnd": invalidEnd
			    },
				success: function(data){
						util.closeLoading();
						//if(null == data){return ;}
						$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31").empty();
						if(null != data.ajaxPage.dataList){
							var tempType;
							var tempCheck;
							var tempFreeze;	
							var rccList = eval(data.ajaxPage.dataList);
							console.log(rccList);
							for(var i = 0;i < rccList.length; i++){
							    if(rccList[i].DATA_AUTH==null) rccList[i].DATA_AUTH="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].WSI_DOC_NUM==null) rccList[i].WSI_DOC_NUM="";
								if(rccList[i].WSI_STOCK_FLAG==null) tempType="";
							  	if(rccList[i].WSI_STOCK_FLAG==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px'>未入库</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>在库</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px'>备料</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==4) {tempType="<span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px'>调拨</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==5) {tempType="<span class='state' style='background-color:#7a60fd;color:#FFFFFF;width:60px'>盘点</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==6) {tempType="<span class='state' style='background-color:#dd4b39;color:#FFFFFF;width:60px'>锁定</span>";}
								if(rccList[i].WSI_INSPECT_FLAG==null) tempCheck="";
								if(rccList[i].WSI_INSPECT_FLAG=='Y') tempCheck="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_INSPECT_FLAG=='N') tempCheck="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_FREEZE_FLAG==null) tempFreeze="";
								if(rccList[i].WSI_FREEZE_FLAG=='Y') tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_FREEZE_FLAG=='N') tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_LOT_NO==null) rccList[i].WSI_LOT_NO="";
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].WSI_CONNECT_DOC==null) rccList[i].WSI_CONNECT_DOC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].WSI_FIRST_SN==null) rccList[i].WSI_FIRST_SN="";
								if(rccList[i].WSI_SECOND_SN==null) rccList[i].WSI_SECOND_SN="";
								if(rccList[i].WSI_THIRD_SN==null) rccList[i].WSI_THIRD_SN="";
								if(rccList[i].WSI_FOURTH_SN==null) rccList[i].WSI_FOURTH_SN="";
								if(rccList[i].INVALID_DATE==null) rccList[i].INVALID_DATE="";
								if(rccList[i].EXTEND_TIME==null) rccList[i].EXTEND_TIME="";
								if(rccList[i].EXTEND_TIME<0) rccList[i].EXTEND_TIME="0";
								if(rccList[i].WSI_SUP_TRACE==null) rccList[i].WSI_SUP_TRACE="";
								if(rccList[i].PRODUCE_DATE==null) rccList[i].PRODUCE_DATE="";
								
								if(rccList[i].RECHECKOUT==null) rccList[i].RECHECKOUT="";
								if(rccList[i].TEST_TIME==null) rccList[i].TEST_TIME="";
								if(rccList[i].CI_RECHECK_DAYS==null) rccList[i].CI_RECHECK_DAYS="";
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
			 					var trHtml = "<tr class='datagrid-row "+backgroudColor+"' id='"+rccList[i].ID+"' abbr='"+rccList[i].ID+"' style='cursor: pointer;' >"
			 					+"<input type='hidden' name='ID' value='"+rccList[i].ID+"' />"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+(i+1)+"</span></td>"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
			 					+"<input type='checkbox' name='"+formId+"$ID' value='"+rccList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'></td>"
			 					+"<td colno='DATA_AUTH' class='datagrid-cell' style='width:200px;text-align:center;'>"
			 					+"<span colno='DATA_AUTH' title='"+rccList[i].DEPT_NAME+"'>"+rccList[i].DEPT_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_ITEM_SN' class='datagrid-cell' style='width:200px;'>"
			 					+"<span colno='WSI_ITEM_SN' title='"+rccList[i].WSI_ITEM_SN+"' onclick='itemJump2(\""+rccList[i].WSI_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_STOCK_FLAG' class='datagrid-cell' style='width:70px;text-align:center;'>"
			 					+"<span colno='WSI_STOCK_FLAG'>"+tempType+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_ITEM_CODE' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WSI_ITEM_CODE' title='"+rccList[i].WSI_ITEM_CODE+"' onclick='itemJump1(\""+rccList[i].WSI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_CODE+"</span>"
			 					+"</td>"
			 					+"<td colno='CI_ITEM_NAME' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='CI_ITEM_NAME' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='CI_ITEM_SPEC' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='CI_ITEM_SPEC' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_LOT_NO' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_LOT_NO' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_ITEM_NUM' class='datagrid-cell' style='width:90px;text-align:right;'>"
			 					+"<span colno='WSI_ITEM_NUM' title='"+rccList[i].WSI_ITEM_NUM+"'>"+rccList[i].WSI_ITEM_NUM+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_WH_CODE' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_WH_CODE' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_DISTRICT_CODE' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_DISTRICT_CODE' title='"+rccList[i].DISTRICT_NAME+"'>"+rccList[i].DISTRICT_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_STORAGE_CODE' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_STORAGE_CODE' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_INSPECT_FLAG' class='datagrid-cell' style='width:70px;text-align:center;'>"
			 					+"<span colno='WSI_INSPECT_FLAG'>"+tempCheck+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_FREEZE_FLAG' class='datagrid-cell' style='width:70px;text-align:center;'>"
			 					+"<span colno='WSI_FREEZE_FLAG'>"+tempFreeze+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_DOC_NUM' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WSI_DOC_NUM' title='"+rccList[i].WSI_DOC_NUM+"' onclick='itemJump3(\""+rccList[i].WSI_DOC_NUM+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_DOC_NUM+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_CONNECT_DOC' class='datagrid-cell' style='width:120px;'>"
			 					+"<span colno='WSI_CONNECT_DOC' title='"+rccList[i].WSI_CONNECT_DOC+"' onclick='itemJump3(\""+rccList[i].WSI_CONNECT_DOC+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_CONNECT_DOC+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_SUP_CODE' class='datagrid-cell' style='width:120px;'>"
			 					+"<span colno='WSI_SUP_CODE' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_CUST_CODE' class='datagrid-cell' style='width:80px;'>"
			 					+"<span colno='WSI_CUST_CODE' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_FIRST_SN' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_FIRST_SN' title='"+rccList[i].WSI_FIRST_SN+"'>"+rccList[i].WSI_FIRST_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_SECOND_SN' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_SECOND_SN' title='"+rccList[i].WSI_SECOND_SN+"'>"+rccList[i].WSI_SECOND_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_THIRD_SN' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_THIRD_SN' title='"+rccList[i].WSI_THIRD_SN+"'>"+rccList[i].WSI_THIRD_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_FOURTH_SN' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_FOURTH_SN' title='"+rccList[i].WSI_FOURTH_SN+"'>"+rccList[i].WSI_FOURTH_SN+"</span>"
			 					+"</td>"
			 					
			 					+"<td colno='复检周期' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='复检周期' title='"+rccList[i].CI_RECHECK_DAYS+"'>"+rccList[i].CI_RECHECK_DAYS+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_RECHECKOUT' class='datagrid-cell' style='width:140px;text-align:center;'>"
			 					+"<span colno='WSI_RECHECKOUT' title='"+rccList[i].RECHECKOUT+"'>"+rccList[i].RECHECKOUT+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_TEST_TIME' class='datagrid-cell' style='width:140px;text-align:center;'>"
			 					+"<span colno='WSI_TEST_TIME' title='"+rccList[i].TEST_TIME+"'>"+rccList[i].TEST_TIME+"</span>"
			 					+"</td>"
			 					+"<td colno='OUTTIME' class='datagrid-cell' style='width:90px;text-align:center;'>"
			 					+"<span colno='OUTTIME' title='"+rccList[i].OUTTIME+"'>"+rccList[i].OUTTIME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_INVALID_DATE' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_INVALID_DATE'>"+rccList[i].INVALID_DATE+"</span>"
			 					+"</td>"
			 					+"<td colno='EXTEND_TIME' class='datagrid-cell' style='width:90px;text-align:center;'>"
			 					+"<span colno='EXTEND_TIME'>"+rccList[i].EXTEND_TIME+"</span>"
			 					+"</td>"
			 					+"<td colno='DULL_TIME' class='datagrid-cell' style='width:90px;text-align:right;'>"
			 					+"<span colno='DULL_TIME'>"+rccList[i].DULL_TIME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_SUP_TRACE' class='datagrid-cell' style='width:130px;'>"
			 					+"<span colno='WSI_SUP_TRACE' title='"+rccList[i].WSI_SUP_TRACE+"'>"+rccList[i].WSI_SUP_TRACE+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_PRODUCE_DATE' class='datagrid-cell' style='width:80px;'>"
			 					+"<span colno='WSI_PRODUCE_DATE'>"+rccList[i].PRODUCE_DATE+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_RECEIVE_TIME' class='datagrid-cell' style='width:140px;'>"
			 					+"<span colno='WSI_RECEIVE_TIME'>"+rccList[i].RECEIVE_TIME+"</span>"
			 					+"</td></tr>";
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31").append(trHtml);
							}
							
						}
						//setNumColWidth(formId);
    						clearAllSelect();
    						setTableWidth(formId);
    						/*if(isFirstSetScroll == 0){setScroll();}
    						isFirstSetScroll++;*/
						pageFun(data.ajaxPage,"0b6208aca3fe40d5bc66a4c230c32d31");
						
							//getFirstDevice();
						var tableTrJs = $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31 tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31');
					defTableWidthRewrite('0b6208aca3fe40d5bc66a4c230c32d31');
					$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31").removeClass('isDefTable');
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//库存明细分页
function ListDetailInfo(paginationImpl,url){
	var dataAuth = $("#DATA_AUTH").val();
	var itemCode = $("#WSI_ITEM_CODE_SHOW").val();
	var itemName = $.trim($("#WSI_ITEM_NAME").val());
	var supCode = $("#WSI_SUP_CODE").val();
	var itemSn = $.trim($("#WSI_ITEM_SN").val());
	var containerSn = $.trim($("#WSI_CONTAINER_SN").val());
	var custCode = $("#WSI_CUST_CODE").val();
	var docNum = $.trim($("#WSI_DOC_NUM").val());
	var connectDoc = $.trim($("#WSI_CONNECT_DOC").val());
	var whCode = $("#WSI_WH_CODE").val();
	var districtCode = $("#WSI_DISTRICT_CODE").val();
	var storageCode = $("#WSI_STORAGE_CODE").val();
	var itemState = $("#WSI_STOCK_FLAG").val();
	var inspectFlag = $("#WSI_INSPECT_FLAG").val();
	var freezeFlag = $("#WSI_FREEZE_FLAG").val();
	var receiveBegin = $("#WSI_RECEIVE_TIME_BEGIN").val();
	var receiveEnd = $("#WSI_RECEIVE_TIME_END").val();
	var invalidBegin = $("#WSI_INVALID_DATE_BEGIN").val();
	var invalidEnd = $("#WSI_INVALID_DATE_END").val();
	var formId = $("#formId1").val();
	var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data: {
        			 "paraMap.dataAuth" : dataAuth,
        			 "paraMap.itemCode" : itemCode,
        			 "paraMap.itemName" : itemName,
        			 "paraMap.supCode" : supCode,
        			 "paraMap.itemSn" : itemSn,
        			 "paraMap.containerSn" : containerSn,
        			 "paraMap.custCode" : custCode,
        			 "paraMap.docNum" : docNum,
        			 "paraMap.connectDoc" : connectDoc,
        			 "paraMap.whCode" : whCode,
        			 "paraMap.districtCode" : districtCode,
        			 "paraMap.storageCode" : storageCode,
        			 "paraMap.itemState" : itemState,
        			 "paraMap.inspectFlag" : inspectFlag,
        			 "paraMap.freezeFlag" : freezeFlag,
        			 "paraMap.receiveBegin" : receiveBegin,
        			 "paraMap.receiveEnd" : receiveEnd,
        			 "paraMap.invalidBegin" : invalidBegin,
        			 "paraMap.invalidEnd" : invalidEnd,
        			 "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
        			 "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
        	    },
				success: function(data){
						util.closeLoading();
						//if(null == data){return ;}
						$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31").empty();
						if(null != data.ajaxPage.dataList){
							var tempType;
							var tempCheck;
							var tempFreeze;	
							var rccList = eval(data.ajaxPage.dataList);
							
							for(var i = 0;i < rccList.length; i++){
							    if(rccList[i].DATA_AUTH==null) rccList[i].DATA_AUTH="";
								if(rccList[i].CI_ITEM_SPEC==null) rccList[i].CI_ITEM_SPEC="";
								if(rccList[i].WSI_DOC_NUM==null) rccList[i].WSI_DOC_NUM="";
								if(rccList[i].WSI_STOCK_FLAG==null) tempType="";
								
							  	if(rccList[i].WSI_STOCK_FLAG==1) {tempType="<span class='state' style='background-color:#aeaeae;color:#FFFFFF;width:60px'>未入库</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==2) {tempType="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:60px'>在库</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==3) {tempType="<span class='state' style='background-color:#00a0e9;color:#FFFFFF;width:60px'>备料</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==4) {tempType="<span class='state' style='background-color:#f8b72d;color:#FFFFFF;width:60px'>调拨</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==5) {tempType="<span class='state' style='background-color:#7a60fd;color:#FFFFFF;width:60px'>盘点</span>";}
							  	if(rccList[i].WSI_STOCK_FLAG==6) {tempType="<span class='state' style='background-color:#dd4b39;color:#FFFFFF;width:60px'>锁定</span>";}
								if(rccList[i].WSI_INSPECT_FLAG==null) tempCheck="";
								if(rccList[i].WSI_INSPECT_FLAG=='Y') tempCheck="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_INSPECT_FLAG=='N') tempCheck="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_FREEZE_FLAG==null) tempFreeze="";
								if(rccList[i].WSI_FREEZE_FLAG=='Y') tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_FREEZE_FLAG=='N') tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
								if(rccList[i].WSI_LOT_NO==null) rccList[i].WSI_LOT_NO="";
								if(rccList[i].WH_NAME==null) rccList[i].WH_NAME="";
								if(rccList[i].DISTRICT_NAME==null) rccList[i].DISTRICT_NAME="";
								if(rccList[i].STORAGE_NAME==null) rccList[i].STORAGE_NAME="";
								if(rccList[i].WSI_CONNECT_DOC==null) rccList[i].WSI_CONNECT_DOC="";
								if(rccList[i].SUPPLIER_NAME==null) rccList[i].SUPPLIER_NAME="";
								if(rccList[i].CUSTOMER==null) rccList[i].CUSTOMER="";
								if(rccList[i].WSI_FIRST_SN==null) rccList[i].WSI_FIRST_SN="";
								if(rccList[i].WSI_SECOND_SN==null) rccList[i].WSI_SECOND_SN="";
								if(rccList[i].WSI_THIRD_SN==null) rccList[i].WSI_THIRD_SN="";
								if(rccList[i].WSI_FOURTH_SN==null) rccList[i].WSI_FOURTH_SN="";
								if(rccList[i].INVALID_DATE==null) rccList[i].INVALID_DATE="";
								if(rccList[i].EXTEND_TIME==null) rccList[i].EXTEND_TIME="";
								if(rccList[i].EXTEND_TIME<0) rccList[i].EXTEND_TIME="0";
								if(rccList[i].WSI_SUP_TRACE==null) rccList[i].WSI_SUP_TRACE="";
								if(rccList[i].PRODUCE_DATE==null) rccList[i].PRODUCE_DATE="";
								if(rccList[i].RECHECKOUT==null) rccList[i].RECHECKOUT="";
								if(rccList[i].TEST_TIME==null) rccList[i].TEST_TIME="";
								if(rccList[i].CI_RECHECK_DAYS==null) rccList[i].CI_RECHECK_DAYS="";
								if(rccList[i].CI_ITEM_NAME==null) rccList[i].CI_ITEM_NAME="";
								
								var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
			 					var trHtml = "<tr class='datagrid-row "+backgroudColor+"' id='"+rccList[i].ID+"' abbr='"+rccList[i].ID+"' style='cursor: pointer;' >"
			 					+"<input type='hidden' name='ID' value='"+rccList[i].ID+"' />"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+((currentPage-1)*pageRecord+(i+1))+"</span></td>"
			 					+"<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"
			 					+"<input type='checkbox' name='"+formId+"$ID' value='"+rccList[i].ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'></td>"
			 					+"<td colno='DATA_AUTH' class='datagrid-cell' style='width:200px;text-align:center;'>"
			 					+"<span colno='DATA_AUTH' title='"+rccList[i].DEPT_NAME+"'>"+rccList[i].DEPT_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_ITEM_SN' class='datagrid-cell' style='width:200px;'>"
			 					+"<span colno='WSI_ITEM_SN' title='"+rccList[i].WSI_ITEM_SN+"' onclick='itemJump2(\""+rccList[i].WSI_ITEM_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_STOCK_FLAG' class='datagrid-cell' style='width:70px;text-align:center;'>"
			 					+"<span colno='WSI_STOCK_FLAG'>"+tempType+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_ITEM_CODE' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WSI_ITEM_CODE' title='"+rccList[i].WSI_ITEM_CODE+"' onclick='itemJump1(\""+rccList[i].WSI_ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_ITEM_CODE+"</span>"
			 					+"</td>"
			 					+"<td colno='CI_ITEM_NAME' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='CI_ITEM_NAME' title='"+rccList[i].CI_ITEM_NAME+"'>"+rccList[i].CI_ITEM_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='CI_ITEM_SPEC' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='CI_ITEM_SPEC' title='"+rccList[i].CI_ITEM_SPEC+"'>"+rccList[i].CI_ITEM_SPEC+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_LOT_NO' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_LOT_NO' title='"+rccList[i].WSI_LOT_NO+"'>"+rccList[i].WSI_LOT_NO+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_ITEM_NUM' class='datagrid-cell' style='width:90px;text-align:right;'>"
			 					+"<span colno='WSI_ITEM_NUM' title='"+rccList[i].WSI_ITEM_NUM+"'>"+rccList[i].WSI_ITEM_NUM+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_WH_CODE' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_WH_CODE' title='"+rccList[i].WH_NAME+"'>"+rccList[i].WH_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_DISTRICT_CODE' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_DISTRICT_CODE' title='"+rccList[i].DISTRICT_NAME+"'>"+rccList[i].DISTRICT_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_STORAGE_CODE' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_STORAGE_CODE' title='"+rccList[i].STORAGE_NAME+"'>"+rccList[i].STORAGE_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_INSPECT_FLAG' class='datagrid-cell' style='width:70px;text-align:center;'>"
			 					+"<span colno='WSI_INSPECT_FLAG'>"+tempCheck+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_FREEZE_FLAG' class='datagrid-cell' style='width:70px;text-align:center;'>"
			 					+"<span colno='WSI_FREEZE_FLAG'>"+tempFreeze+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_DOC_NUM' class='datagrid-cell' style='width:150px;'>"
			 					+"<span colno='WSI_DOC_NUM' title='"+rccList[i].WSI_DOC_NUM+"' onclick='itemJump3(\""+rccList[i].WSI_DOC_NUM+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_DOC_NUM+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_CONNECT_DOC' class='datagrid-cell' style='width:120px;'>"
			 					+"<span colno='WSI_CONNECT_DOC' title='"+rccList[i].WSI_CONNECT_DOC+"' onclick='itemJump3(\""+rccList[i].WSI_CONNECT_DOC+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].WSI_CONNECT_DOC+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_SUP_CODE' class='datagrid-cell' style='width:120px;'>"
			 					+"<span colno='WSI_SUP_CODE' title='"+rccList[i].SUPPLIER_NAME+"'>"+rccList[i].SUPPLIER_NAME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_CUST_CODE' class='datagrid-cell' style='width:80px;'>"
			 					+"<span colno='WSI_CUST_CODE' title='"+rccList[i].CUSTOMER+"'>"+rccList[i].CUSTOMER+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_FIRST_SN' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_FIRST_SN' title='"+rccList[i].WSI_FIRST_SN+"'>"+rccList[i].WSI_FIRST_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_SECOND_SN' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_SECOND_SN' title='"+rccList[i].WSI_SECOND_SN+"'>"+rccList[i].WSI_SECOND_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_THIRD_SN' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_THIRD_SN' title='"+rccList[i].WSI_THIRD_SN+"'>"+rccList[i].WSI_THIRD_SN+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_FOURTH_SN' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_FOURTH_SN' title='"+rccList[i].WSI_FOURTH_SN+"'>"+rccList[i].WSI_FOURTH_SN+"</span>"
			 					+"</td>"
			 					
			 					+"<td colno='复检周期' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='复检周期' title='"+rccList[i].CI_RECHECK_DAYS+"'>"+rccList[i].CI_RECHECK_DAYS+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_RECHECKOUT' class='datagrid-cell' style='width:140px;text-align:center;'>"
			 					+"<span colno='WSI_RECHECKOUT' title='"+rccList[i].RECHECKOUT+"'>"+rccList[i].RECHECKOUT+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_TEST_TIME' class='datagrid-cell' style='width:140px;text-align:center;'>"
			 					+"<span colno='WSI_TEST_TIME' title='"+rccList[i].TEST_TIME+"'>"+rccList[i].TEST_TIME+"</span>"
			 					+"</td>"
			 					+"<td colno='OUTTIME' class='datagrid-cell' style='width:90px;text-align:center;'>"
			 					+"<span colno='OUTTIME' title='"+rccList[i].OUTTIME+"'>"+rccList[i].OUTTIME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_INVALID_DATE' class='datagrid-cell' style='width:90px;'>"
			 					+"<span colno='WSI_INVALID_DATE'>"+rccList[i].INVALID_DATE+"</span>"
			 					+"</td>"
			 					+"<td colno='EXTEND_TIME' class='datagrid-cell' style='width:90px;text-align:center;'>"
			 					+"<span colno='EXTEND_TIME'>"+rccList[i].EXTEND_TIME+"</span>"
			 					+"</td>"
			 					+"<td colno='DULL_TIME' class='datagrid-cell' style='width:90px;text-align:right;'>"
			 					+"<span colno='DULL_TIME'>"+rccList[i].DULL_TIME+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_SUP_TRACE' class='datagrid-cell' style='width:130px;'>"
			 					+"<span colno='WSI_SUP_TRACE' title='"+rccList[i].WSI_SUP_TRACE+"'>"+rccList[i].WSI_SUP_TRACE+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_PRODUCE_DATE' class='datagrid-cell' style='width:80px;'>"
			 					+"<span colno='WSI_PRODUCE_DATE'>"+rccList[i].PRODUCE_DATE+"</span>"
			 					+"</td>"
			 					+"<td colno='WSI_RECEIVE_TIME' class='datagrid-cell' style='width:140px;'>"
			 					+"<span colno='WSI_RECEIVE_TIME'>"+rccList[i].RECEIVE_TIME+"</span>"
			 					+"</td></tr>";
								$("#tbody_0b6208aca3fe40d5bc66a4c230c32d31").append(trHtml);
							}
							
						}
					//	setNumColWidth(formId);
    						clearAllSelect();
    						setTableWidth(formId);
    						/*if(isFirstSetScroll == 0){setScroll();}
    						isFirstSetScroll++;*/

						pageFun(data.ajaxPage,"0b6208aca3fe40d5bc66a4c230c32d31");
							//getFirstDevice();
							var tableTrJs = $("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31');
						defTableWidthRewrite('0b6208aca3fe40d5bc66a4c230c32d31');
						$("#datagrid-btable-ajax0b6208aca3fe40d5bc66a4c230c32d31").removeClass('isDefTable');
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
}
//亮灯
function stockLight(){
    var dataAuth = $("#DATA_AUTH").val();
    var itemCode = $("#WSI_ITEM_CODE_SHOW").val();
	var itemName = $.trim($("#WSI_ITEM_NAME").val());
	var supCode = $("#WSI_SUP_CODE").val();
	var itemSn = $.trim($("#WSI_ITEM_SN").val());
	var containerSn = $.trim($("#WSI_CONTAINER_SN").val());
	var custCode = $("#WSI_CUST_CODE").val();
	var docNum = $.trim($("#WSI_DOC_NUM").val());
	var connectDoc = $.trim($("#WSI_CONNECT_DOC").val());
	var whCode = $("#WSI_WH_CODE").val();
	var districtCode = $("#WSI_DISTRICT_CODE").val();
	var storageCode = $("#WSI_STORAGE_CODE").val();
	var itemState = $("#WSI_STOCK_FLAG").val();
	var inspectFlag = $("#WSI_INSPECT_FLAG").val();
	var freezeFlag = $("#WSI_FREEZE_FLAG").val();
	var receiveBegin = $("#WSI_RECEIVE_TIME_BEGIN").val();
	var receiveEnd = $("#WSI_RECEIVE_TIME_END").val();
	var invalidBegin = $("#WSI_INVALID_DATE_BEGIN").val();
	var invalidEnd = $("#WSI_INVALID_DATE_END").val();
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F10031&funcMId=6938097afa974e25a5d8cb0425bd8019",
			    data: {
			        "dataAuth": dataAuth,
			        "itemCode": itemCode,
			        "itemName": itemName,
			        "supCode": supCode,
			        "itemSn": itemSn,
			        "containerSn": containerSn,
			        "custCode": custCode,
			        "docNum": docNum,
			        "connectDoc": connectDoc,
			        "whCode": whCode,
			        "districtCode": districtCode,
			        "storageCode": storageCode,
			        "itemState": itemState,
			        "inspectFlag": inspectFlag,
			        "freezeFlag": freezeFlag,
			        "receiveBegin": receiveBegin,
			        "receiveEnd": receiveEnd,
			        "invalidBegin": invalidBegin,
			        "invalidEnd": invalidEnd
			    },
			    success: function(data){
						    if(null == data){return;}
						    if(null != data){
    							if(data.ajaxMap.returnMsg=="addSucc"){
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    								if($("#tag1").attr("class")=="current"){
                                        loadItem();
                                    }
                                    if($("#tag2").attr("class")=="current"){
                                        $('.scroll1').mCustomScrollbar("destroy");
                                        loadStockDetail();	
                                        setPopScroll('.scroll1','.head1');
                                    }
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
	                                utilsFp.confirmIcon(3,"","","", "<dict:lang value="亮灯失败"/>",0,"300","");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="addError2"){
    								utilsFp.confirmIcon(3,"","","", data.ajaxMap.res,0,"300","");
    								return;
    							}
						    }
					},
			    error: function(msg){
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
			    });
}
//灭灯
function stockLightOff(){	
    var dataAuth = $("#DATA_AUTH").val();
    var itemCode = $("#WSI_ITEM_CODE_SHOW").val();
	var itemName = $.trim($("#WSI_ITEM_NAME").val());
	var supCode = $("#WSI_SUP_CODE").val();
	var itemSn = $.trim($("#WSI_ITEM_SN").val());
	var containerSn = $.trim($("#WSI_CONTAINER_SN").val());
	var custCode = $("#WSI_CUST_CODE").val();
	var docNum = $.trim($("#WSI_DOC_NUM").val());
	var connectDoc = $.trim($("#WSI_CONNECT_DOC").val());
	var whCode = $("#WSI_WH_CODE").val();
	var districtCode = $("#WSI_DISTRICT_CODE").val();
	var storageCode = $("#WSI_STORAGE_CODE").val();
	var itemState = $("#WSI_STOCK_FLAG").val();
	var inspectFlag = $("#WSI_INSPECT_FLAG").val();
	var freezeFlag = $("#WSI_FREEZE_FLAG").val();
	var receiveBegin = $("#WSI_RECEIVE_TIME_BEGIN").val();
	var receiveEnd = $("#WSI_RECEIVE_TIME_END").val();
	var invalidBegin = $("#WSI_INVALID_DATE_BEGIN").val();
	var invalidEnd = $("#WSI_INVALID_DATE_END").val();
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F10032&funcMId=ddd11940c8e14ea1aa850cd84fda660e",
			    data: {
			        "dataAuth": dataAuth,
			        "itemCode": itemCode,
			        "itemName": itemName,
			        "supCode": supCode,
			        "itemSn": itemSn,
			        "containerSn": containerSn,
			        "custCode": custCode,
			        "docNum": docNum,
			        "connectDoc": connectDoc,
			        "whCode": whCode,
			        "districtCode": districtCode,
			        "storageCode": storageCode,
			        "itemState": itemState,
			        "inspectFlag": inspectFlag,
			        "freezeFlag": freezeFlag,
			        "receiveBegin": receiveBegin,
			        "receiveEnd": receiveEnd,
			        "invalidBegin": invalidBegin,
			        "invalidEnd": invalidEnd
			    },
			    success: function(data){
						    if(null == data){return;}
						    if(null != data){
    							if(data.ajaxMap.returnMsg=="addSucc"){
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    								if($("#tag1").attr("class")=="current"){
                                        loadItem();
                                    }
                                    if($("#tag2").attr("class")=="current"){
                                        $('.scroll1').mCustomScrollbar("destroy");
                                        loadStockDetail();	
                                        setPopScroll('.scroll1','.head1');
                                    }
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
	                                utilsFp.confirmIcon(3,"","","", "<dict:lang value="灭灯失败"/>",0,"300","");
    								return;
    							}
    							if(data.ajaxMap.returnMsg=="addError2"){
    								utilsFp.confirmIcon(3,"","","", data.ajaxMap.res,0,"300","");
    								return;
    							}
						    }
					},
			    error: function(msg){
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
			    });
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
</script>

<script>
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='0b6208aca3fe40d5bc66a4c230c32d31'){<%--仓库库存信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SN')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN' class='"+ms.uiClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_STOCK_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_STOCK_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_STOCK_FLAG')+"' "+ms.tdEvent(formId, 'WSI_STOCK_FLAG')+">")
            arrHtml.push("<span colno='WSI_STOCK_FLAG' class='"+ms.uiClass(formId, 'WSI_STOCK_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_STOCK_FLAG')+"' "+ms.uiEvent(formId, 'WSI_STOCK_FLAG')+" title='"+ms.titleAttr(formId,'WSI_STOCK_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_STOCK_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WSI_ITEM_NAME')+">")
            arrHtml.push("<span colno='WSI_ITEM_NAME' class='"+ms.uiClass(formId, 'WSI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WSI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WSI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WSI_ITEM_SPEC' class='"+ms.uiClass(formId, 'WSI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO')+"' style='"+ms.tdStyle(formId, 'WSI_LOT_NO')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO')+">")
            arrHtml.push("<span colno='WSI_LOT_NO' class='"+ms.uiClass(formId, 'WSI_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO')+" title='"+ms.titleAttr(formId,'WSI_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WSI_ITEM_NUM')+">")
            arrHtml.push("<span colno='WSI_ITEM_NUM' class='"+ms.uiClass(formId, 'WSI_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WSI_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WSI_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_WH_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_WH_CODE')+"' "+ms.tdEvent(formId, 'WSI_WH_CODE')+">")
            arrHtml.push("<span colno='WSI_WH_CODE' class='"+ms.uiClass(formId, 'WSI_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_WH_CODE')+"' "+ms.uiEvent(formId, 'WSI_WH_CODE')+" title='"+ms.titleAttr(formId,'WSI_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DISTRICT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DISTRICT_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_DISTRICT_CODE')+"' "+ms.tdEvent(formId, 'WSI_DISTRICT_CODE')+">")
            arrHtml.push("<span colno='WSI_DISTRICT_CODE' class='"+ms.uiClass(formId, 'WSI_DISTRICT_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_DISTRICT_CODE')+"' "+ms.uiEvent(formId, 'WSI_DISTRICT_CODE')+" title='"+ms.titleAttr(formId,'WSI_DISTRICT_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_DISTRICT_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_STORAGE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_STORAGE_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_STORAGE_CODE')+"' "+ms.tdEvent(formId, 'WSI_STORAGE_CODE')+">")
            arrHtml.push("<span colno='WSI_STORAGE_CODE' class='"+ms.uiClass(formId, 'WSI_STORAGE_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_STORAGE_CODE')+"' "+ms.uiEvent(formId, 'WSI_STORAGE_CODE')+" title='"+ms.titleAttr(formId,'WSI_STORAGE_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_STORAGE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_INSPECT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_INSPECT_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_INSPECT_FLAG')+"' "+ms.tdEvent(formId, 'WSI_INSPECT_FLAG')+">")
            arrHtml.push("<span colno='WSI_INSPECT_FLAG' class='"+ms.uiClass(formId, 'WSI_INSPECT_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_INSPECT_FLAG')+"' "+ms.uiEvent(formId, 'WSI_INSPECT_FLAG')+" title='"+ms.titleAttr(formId,'WSI_INSPECT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_INSPECT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FREEZE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FREEZE_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_FREEZE_FLAG')+"' "+ms.tdEvent(formId, 'WSI_FREEZE_FLAG')+">")
            arrHtml.push("<span colno='WSI_FREEZE_FLAG' class='"+ms.uiClass(formId, 'WSI_FREEZE_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_FREEZE_FLAG')+"' "+ms.uiEvent(formId, 'WSI_FREEZE_FLAG')+" title='"+ms.titleAttr(formId,'WSI_FREEZE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_FREEZE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WSI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WSI_DOC_NUM')+">")
            arrHtml.push("<span colno='WSI_DOC_NUM' class='"+ms.uiClass(formId, 'WSI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WSI_DOC_NUM')+" title='"+ms.titleAttr(formId,'WSI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CONNECT_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CONNECT_DOC')+"' style='"+ms.tdStyle(formId, 'WSI_CONNECT_DOC')+"' "+ms.tdEvent(formId, 'WSI_CONNECT_DOC')+">")
            arrHtml.push("<span colno='WSI_CONNECT_DOC' class='"+ms.uiClass(formId, 'WSI_CONNECT_DOC')+"' style='"+ms.uiStyle(formId, 'WSI_CONNECT_DOC')+"' "+ms.uiEvent(formId, 'WSI_CONNECT_DOC')+" title='"+ms.titleAttr(formId,'WSI_CONNECT_DOC','IS_TITLE_ATTR',v)+"' >"+v['WSI_CONNECT_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SUP_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_SUP_CODE')+"' "+ms.tdEvent(formId, 'WSI_SUP_CODE')+">")
            arrHtml.push("<span colno='WSI_SUP_CODE' class='"+ms.uiClass(formId, 'WSI_SUP_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_SUP_CODE')+"' "+ms.uiEvent(formId, 'WSI_SUP_CODE')+" title='"+ms.titleAttr(formId,'WSI_SUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_SUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CUST_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_CUST_CODE')+"' "+ms.tdEvent(formId, 'WSI_CUST_CODE')+">")
            arrHtml.push("<span colno='WSI_CUST_CODE' class='"+ms.uiClass(formId, 'WSI_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_CUST_CODE')+"' "+ms.uiEvent(formId, 'WSI_CUST_CODE')+" title='"+ms.titleAttr(formId,'WSI_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FIRST_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FIRST_SN')+"' style='"+ms.tdStyle(formId, 'WSI_FIRST_SN')+"' "+ms.tdEvent(formId, 'WSI_FIRST_SN')+">")
            arrHtml.push("<span colno='WSI_FIRST_SN' class='"+ms.uiClass(formId, 'WSI_FIRST_SN')+"' style='"+ms.uiStyle(formId, 'WSI_FIRST_SN')+"' "+ms.uiEvent(formId, 'WSI_FIRST_SN')+" title='"+ms.titleAttr(formId,'WSI_FIRST_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_FIRST_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SECOND_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SECOND_SN')+"' style='"+ms.tdStyle(formId, 'WSI_SECOND_SN')+"' "+ms.tdEvent(formId, 'WSI_SECOND_SN')+">")
            arrHtml.push("<span colno='WSI_SECOND_SN' class='"+ms.uiClass(formId, 'WSI_SECOND_SN')+"' style='"+ms.uiStyle(formId, 'WSI_SECOND_SN')+"' "+ms.uiEvent(formId, 'WSI_SECOND_SN')+" title='"+ms.titleAttr(formId,'WSI_SECOND_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_SECOND_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_THIRD_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_THIRD_SN')+"' style='"+ms.tdStyle(formId, 'WSI_THIRD_SN')+"' "+ms.tdEvent(formId, 'WSI_THIRD_SN')+">")
            arrHtml.push("<span colno='WSI_THIRD_SN' class='"+ms.uiClass(formId, 'WSI_THIRD_SN')+"' style='"+ms.uiStyle(formId, 'WSI_THIRD_SN')+"' "+ms.uiEvent(formId, 'WSI_THIRD_SN')+" title='"+ms.titleAttr(formId,'WSI_THIRD_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_THIRD_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FOURTH_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FOURTH_SN')+"' style='"+ms.tdStyle(formId, 'WSI_FOURTH_SN')+"' "+ms.tdEvent(formId, 'WSI_FOURTH_SN')+">")
            arrHtml.push("<span colno='WSI_FOURTH_SN' class='"+ms.uiClass(formId, 'WSI_FOURTH_SN')+"' style='"+ms.uiStyle(formId, 'WSI_FOURTH_SN')+"' "+ms.uiEvent(formId, 'WSI_FOURTH_SN')+" title='"+ms.titleAttr(formId,'WSI_FOURTH_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_FOURTH_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_INVALID_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_INVALID_DATE')+"' style='"+ms.tdStyle(formId, 'WSI_INVALID_DATE')+"' "+ms.tdEvent(formId, 'WSI_INVALID_DATE')+">")
            arrHtml.push("<span colno='WSI_INVALID_DATE' class='"+ms.uiClass(formId, 'WSI_INVALID_DATE')+"' style='"+ms.uiStyle(formId, 'WSI_INVALID_DATE')+"' "+ms.uiEvent(formId, 'WSI_INVALID_DATE')+" title='"+ms.titleAttr(formId,'WSI_INVALID_DATE','IS_TITLE_ATTR',v)+"' >"+v['WSI_INVALID_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_EXTEND_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_EXTEND_TIME')+"' style='"+ms.tdStyle(formId, 'WSI_EXTEND_TIME')+"' "+ms.tdEvent(formId, 'WSI_EXTEND_TIME')+">")
            arrHtml.push("<span colno='WSI_EXTEND_TIME' class='"+ms.uiClass(formId, 'WSI_EXTEND_TIME')+"' style='"+ms.uiStyle(formId, 'WSI_EXTEND_TIME')+"' "+ms.uiEvent(formId, 'WSI_EXTEND_TIME')+" title='"+ms.titleAttr(formId,'WSI_EXTEND_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_EXTEND_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DULL_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DULL_TIME')+"' style='"+ms.tdStyle(formId, 'WSI_DULL_TIME')+"' "+ms.tdEvent(formId, 'WSI_DULL_TIME')+">")
            arrHtml.push("<span colno='WSI_DULL_TIME' class='"+ms.uiClass(formId, 'WSI_DULL_TIME')+"' style='"+ms.uiStyle(formId, 'WSI_DULL_TIME')+"' "+ms.uiEvent(formId, 'WSI_DULL_TIME')+" title='"+ms.titleAttr(formId,'WSI_DULL_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_DULL_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SUP_TRACE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SUP_TRACE')+"' style='"+ms.tdStyle(formId, 'WSI_SUP_TRACE')+"' "+ms.tdEvent(formId, 'WSI_SUP_TRACE')+">")
            arrHtml.push("<span colno='WSI_SUP_TRACE' class='"+ms.uiClass(formId, 'WSI_SUP_TRACE')+"' style='"+ms.uiStyle(formId, 'WSI_SUP_TRACE')+"' "+ms.uiEvent(formId, 'WSI_SUP_TRACE')+" title='"+ms.titleAttr(formId,'WSI_SUP_TRACE','IS_TITLE_ATTR',v)+"' >"+v['WSI_SUP_TRACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_PRODUCE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_PRODUCE_DATE')+"' style='"+ms.tdStyle(formId, 'WSI_PRODUCE_DATE')+"' "+ms.tdEvent(formId, 'WSI_PRODUCE_DATE')+">")
            arrHtml.push("<span colno='WSI_PRODUCE_DATE' class='"+ms.uiClass(formId, 'WSI_PRODUCE_DATE')+"' style='"+ms.uiStyle(formId, 'WSI_PRODUCE_DATE')+"' "+ms.uiEvent(formId, 'WSI_PRODUCE_DATE')+" title='"+ms.titleAttr(formId,'WSI_PRODUCE_DATE','IS_TITLE_ATTR',v)+"' >"+v['WSI_PRODUCE_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_RECEIVE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_RECEIVE_TIME')+"' style='"+ms.tdStyle(formId, 'WSI_RECEIVE_TIME')+"' "+ms.tdEvent(formId, 'WSI_RECEIVE_TIME')+">")
            arrHtml.push("<span colno='WSI_RECEIVE_TIME' class='"+ms.uiClass(formId, 'WSI_RECEIVE_TIME')+"' style='"+ms.uiStyle(formId, 'WSI_RECEIVE_TIME')+"' "+ms.uiEvent(formId, 'WSI_RECEIVE_TIME')+" title='"+ms.titleAttr(formId,'WSI_RECEIVE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_RECEIVE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;
}

function initHeight(){
	$('.panel-ajax').height(($(window).height() - 56 - 195 - 15  - 10) - 60);
	//$('.panel-ajax').height(($(window).height() - 56 - 100 - 15  - 10) - 60);
	$('.scroll').css('height','calc(100%-60px)');//32
	$('.scroll1').css('height','calc(100%-60px)');//32
	$('.datagrid-body').css('height','calc(100% - 50px)');//32
	$('.datagrid-body1').css('height','calc(100% - 30px)');//32
	$('.panel1').height($(window).height() - 56 - 195 - 15 - 70);
}


function listDetailInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=83d738b0bd5749909c8a4daad9e4a87d";
	ListDetailInfo(paginationImpl,url);
}


function searchItemInfo(paginationImpl){
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=8944a70f548c452b90b05a7e86d34582";
	SearchItemInfo(paginationImpl,url);
}

$(function(){
	initHeight();
})

$(window).resize(function(){
	initHeight();
})

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料信息
function itemJump1(obj){
      winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
}  

//物料追溯
function itemJump2(obj){
    winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
} 

//仓库单据信息
function itemJump4(obj){
  winOptMethod.jump("f4c3cfb840234a24b5ac7135d783b7e3","F7011","jumpId",obj);
} 



</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.head');
    setPopScroll('.scroll1','.head1');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
