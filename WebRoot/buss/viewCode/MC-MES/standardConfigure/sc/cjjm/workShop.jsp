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
		<dict:lang value="VM-车间建模" />
    </title>
    
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="dhtmlxtree" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="a6f1789e15de48a4831030ad33f6134f"/>
    
    <link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
    
    <style>
        .datagrid-header .datagrid-htable,.datagrid-header{
            width:100% !important;
        }
        
        .datagrid-body .datagrid-btable,.datagrid-body{
            width:100% !important;
        }
            .group{
        margin-top:-52px!important;
        margin-left:-35px!important;
    }
      .group #DATA_AUTH{
           width:200px!important;
       }
       #serachArea {
           width:150px!important;
       }
                .hd{
        margin-left:300px!important;
    }
  
    </style>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="f32ef503b16a4cb78f9a526b367b9249" />
		<select class="dept_select IS_SELECT_FILTER" id="typeArea" style="width:110px;">
		<option value="">--请选择--</option>
		<option value="0">车间</option>
		<option value="1">线别</option>
		<option value="2">工作中心</option>
		</select>
		<input  class="input" id="serachArea" placeholder="请输入区域名称" style="vertical-align:middle"  />
            </div>
            <div class="bd">
                <div class="search-box" >
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="f32ef503b16a4cb78f9a526b367b9249" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <div style="width: 17%;float: left;">
		<div class="block1" id="block1" style="width:92%;float: left;border-style:solid;border-width:1px; border-color:#eaeaea;background:#ffffff;padding:5px;margin-top: 40px;overflow:auto;">
       		<div id="index_tree" class="ztree">
      		</div>
      		</div>
      		</div>
      		<div style="width: 83%;float: right;" >
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagea6f1789e15de48a4831030ad33f6134f" id="formPagea6f1789e15de48a4831030ad33f6134f" value="${formPagea6f1789e15de48a4831030ad33f6134f}"/>
		<input type="hidden" name="formId" id="formId1" value='a6f1789e15de48a4831030ad33f6134f'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='98aa23eb68de4e55b500c54cba1c9fee,5543b1655ecd49e2ae5131f161500af2'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='55523b5c987a4d3db9d13b3fdbe627c1,1c490ae0bb0d4cb3aee84a19c5d97ab2'/>
		<input type="hidden" id="CA_ID" name="CA_ID" value=''/>
		<input type="hidden" id="dataAuth1" name="dataAuth1" value=''/>
		<input type="hidden" id="dataAuth" name="dataAuth" value='${sessionScope.mcDataAuth}'/>
		<input type="hidden" name="para_id" id="para_id" value='' />
		<input type="hidden" id="iframeid" name="iframeid" value=''/>
		<div class="panel-ajax datagrid datagrid-div1"  id="a6f1789e15de48a4831030ad33f6134f">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxa6f1789e15de48a4831030ad33f6134f" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head" id="datagrid-header-innera6f1789e15de48a4831030ad33f6134f">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablea6f1789e15de48a4831030ad33f6134f">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="a6f1789e15de48a4831030ad33f6134f" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_a6f1789e15de48a4831030ad33f6134f" onclick="_selectAjaxTableAllData(this,'a6f1789e15de48a4831030ad33f6134f')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:150px;">工作中心</td>
			<td class="datagrid-cell" style="width:150px;">工作中心名称</td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CA_GROUP" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<td class="datagrid-cell" style="width:150px;">所属轨道</td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CA_EMP_ROLE" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<td class="datagrid-cell" style="width:150px;">所属区域</td>
			
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll" id="tableDiva6f1789e15de48a4831030ad33f6134f" onscroll="ajaxTableScroll(this,'a6f1789e15de48a4831030ad33f6134f')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxa6f1789e15de48a4831030ad33f6134f">
		<tbody id="tbody_a6f1789e15de48a4831030ad33f6134f" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagea6f1789e15de48a4831030ad33f6134f==1}">			<div class="center" >
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=getInfoPage&formId=formId2&showLoading=0" />
			</div>
		</c:if>
			
    </div>

	<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form></div>
            </div>
        </div>
    
		<bu:submit viewId="f32ef503b16a4cb78f9a526b367b9249" />
  
		<bu:script viewId="f32ef503b16a4cb78f9a526b367b9249" />
    <!--
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
      -->
      
 <script type="text/javascript">
               
                function listAjaxTable(formId){
                 /*
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
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
                     */
                }
               
                
                function isPage(formId){
                    var isPageVal =  $("#formPage"+formId).val();
                    if(isPageVal =="1"){    
                       return true;
                    }
                    return false;
                }
                
                /*
                function query(){
                    var formId = $("#formId1").val();
                    //getInfoPage("formId2");
                    //getPage();
                    //getInfoPage();
                    //listAjaxTable(formId);
                }
                */
                
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
                
                function reloadPg(msg,title,width,height,time,isCloseWin){
                setInfoByLocal();
    			msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
    		}
    		function reloadPgExeAx(isCloseWin){
    		setInfoByLocal();
              	getPage();//alert(_currentFrame);
              	//document.getElementById(_currentFrame).contentWindow.clearInfo();
              	//window.frames[_currentFrame].document.getElementByIdx_x("addItemInfo").empty();
              	//window.top.$("#addItemInfo").empty();console.log(window.top);
              	
              	//$("#popupFrameFpId")[0].contentWindow().clearInfo();
              	if ("0" == isCloseWin || undefined == isCloseWin  ) {
                		top.$(".dialog-close").click();
              	}else{
              	    top.document.getElementById("popupFrameFpId").contentWindow.clearInfo();
              	}
               	//checkboxAll("joblist");
            }
    		
    		
    		function reloadPgExe(isCloseWin){
    			/* document.forms.search_form.submit();
    			util.showTopLoading(); */
    			setInfoByLocal();
    			getPage();
    			
    			if ("0" == isCloseWin || undefined == isCloseWin) {
      				top.$(".dialog-close").click();
    			}
    			//checkboxAll("joblist");
    			checkboxAll("joblist");
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
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=f32ef503b16a4cb78f9a526b367b9249";
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
                
                
                
                function init(){
                     $(document.getElementById('CA_TYPE')).closest('.group').attr("style","display:none;");
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    //getInfo();
                     //$("#CA_ID").val(idd);
                    //listAjaxTable($("#formId1").val());
                    
                 }
            
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
            </script>
<script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>
<script>
    
	function getPage(){
	
	    window.location.reload();
	}
//	 var dataAuth=$("#DATA_AUTH").val();
/*	var setting = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        }			
                },
                callback: {
                        onClick: zTreeOnclick,
                        onAsyncSuccess: zTreeOnAsyncSuccess,
                        onAsyncError: zTreeOnAsyncError
                },
                async: {
                    enable: true,
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=e16a2fa3d6cc49c586699d7c51dc943a",
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
 */
    function zTreeOnclick(event,treeId,treeNode){
            $("#CA_ID").val(treeNode.id);
            //console.log(treeNode.dataAuth);
            $("#dataAuth1").val(treeNode.dataAuth);
		    getInfo();
    }
    function ajaxDataFilter(treeId,parentNode,responseDate){
                var data = responseDate.ajaxList;
                return data;
    }
	$(function(){
	   //$.fn.zTree.init($("#index_tree"),setting);
	    initHeight();
    		newScroll("block1")
    });
    var firstAsyncSuccessFlag = 0; 
    function zTreeOnAsyncSuccess(event, treeId, msg){
    curAsyncCount--;
        if (firstAsyncSuccessFlag == 0) { 
    		var zTree = $.fn.zTree.getZTreeObj("index_tree");
    	        var nodes = zTree.getNodes();





    	        zTree.selectNode(nodes[0]);
    	        zTree.setting.callback.onClick(null, zTree.setting.treeId, nodes[0]);//点击第一个节点
 

    	        
    	    firstAsyncSuccessFlag = 1;
        }

    }
 
    
    function zTreeOnAsyncError(event, treeId, treeNode){
        utilsFp.confirmIcon(3,"","","", "数据加载失败",0,"200","");
    }
       
       $(window).resize(function(){
           initHeight();
       })
function initHeight(){
    	$('.block1').height($(parent.window).height() - 95 - 36 - 6);//65-36-10
    	document.getElementById("block1").style.marginTop="0px";
        	$('.panel-ajax1').height($(window).height() - 97)
 }

function newScroll(id){
	  $("#"+ id).mCustomScrollbar({
		axis:"yx",
		snapAmount:40,
		theme:"minimal-dark",
		keyboard:{scrollAmount:40},
		mouseWheel:{deltaFactor:40,preventDefault:true},
		scrollInertia:80,
			
	  });
	   $('.scroll').mCustomScrollbar("destroy");
	  setPopScroll('.scroll','.head');
    $('.head')[0].scrollLeft = 0;
	  
	}
	
	
	function getInfo(){
	    var caId=$("#CA_ID").val();
	    var dataAuth=$("#dataAuth1").val();
	    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=7420a39bd0ae4f37b2c92542bf7d479e"; 
	    $.ajax({
	        type:"post",
	        dataType:"json",
	        data:{
	            "caId":caId,
	            "dataAuth":dataAuth
	        },
	        url:loadItemUrl,
	        success:function(data){
	            $("#tbody_a6f1789e15de48a4831030ad33f6134f").empty();
	            if(null==data){
	                retrn;
	            }
	            
	            if(null!=data.ajaxPage.dataList){
	                var list = eval(data.ajaxPage.dataList);
	                var tempFreeze;
	                for(var i=0;i<list.length;i++){
	                     if(list[i].GROUP_NAME==null)list[i].GROUP_NAME="";
                           if(list[i].JOB_NAME==null)list[i].JOB_NAME="";
                           if(list[i].PNAME==null)list[i].PNAME="";
                           if(list[i].CA_ID==null)list[i].CA_ID="";
                           if(list[i].CA_NAME==null)list[i].CA_NAME="";
                           if(list[i].TRACK==null)list[i].TRACK="";
                           if(list[i].CA_STATUS==null)list[i].CA_STATUS="";
                            if(list[i].CA_PARENTAREAID==null)list[i].CA_PARENTAREAID="";
                            if(list[i].CA_STATUS==null) tempFreeze="";
							if(list[i].CA_STATUS=='Y') tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
							if(list[i].CA_STATUS=='N') tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
	                        $("#tbody_a6f1789e15de48a4831030ad33f6134f ").append("<tr id='"+list[i].ID+"' ></tr>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+i+"' type='checkbox' name='isSelect3' class='_selectdata' value='"+list[i].ID+"'  /></td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+list[i].CA_ID+"'>"+list[i].CA_ID+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+list[i].CA_NAME+"'>"+list[i].CA_NAME+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+list[i].GROUP_NAME+"'>"+list[i].GROUP_NAME+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+list[i].TRACK+"'>"+list[i].TRACK+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' >"+list[i].JOB_NAME+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: center;' title='"+list[i].PNAME+"'>"+list[i].PNAME+"</td>");
	                        $("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: center;' >"+tempFreeze+"</td>");
	                }
	               
	              
	            }			
                
	                    if(null!=data.ajaxMap){
	                   var map = eval(data.ajaxMap);
	                   $("#para_id").val(map.ID);
	                   
	                   $("#iframeid").val(map.IFRAMEID);
			            }
	                    pageFun(data.ajaxPage,"formId2");
                       var tableTrJs = $("#datagrid-btable-ajaxa6f1789e15de48a4831030ad33f6134f tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('datagrid-btable-ajaxa6f1789e15de48a4831030ad33f6134f');
						defTableWidthRewrite("a6f1789e15de48a4831030ad33f6134f");
	        },
	        error: function(msg){
                        	if(msg.readyState!=0){
				              util.closeLoading();
				              utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                            }
                        }
	    })
	    
	}
	 var paginationImpl={};
	function getInfoPage(paginationImpl){
	    //alert(paginationImpl);
	    var isFirstLoad = firstLoadThisPage(paginationImpl);
        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
	    var caId=$("#CA_ID").val();
	    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=937cb873604d45b296a5d7525d1ee902"; 
	    $.ajax({
	        type:"post",
	        dataType:"json",
	        data: {
	            "caId" : caId,
	            "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
	            "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
	        },
	        //data:"caId="+caId+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord="+_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
	        url:loadItemUrl,
	        success:function(data){	
                 $("#tbody_a6f1789e15de48a4831030ad33f6134f").empty();
                 var tempFreeze;
	            if(null==data){
	                retrn;
	            }
	            
	            if(null!=data.ajaxPage.dataList){
	                var list = eval(data.ajaxPage.dataList);
	                for(var i=0;i<list.length;i++){
	                    if(list[i].GROUP_NAME==null)list[i].GROUP_NAME="";
                           if(list[i].JOB_NAME==null)list[i].JOB_NAME="";
                           if(list[i].PNAME==null)list[i].PNAME="";
                           if(list[i].CA_ID==null)list[i].CA_ID="";
                           if(list[i].TRACK==null)list[i].TRACK="";
                           if(list[i].CA_NAME==null)list[i].CA_NAME="";
                           if(list[i].CA_STATUS==null)list[i].CA_STATUS="";
                            if(list[i].CA_PARENTAREAID==null)list[i].CA_PARENTAREAID="";
                            if(list[i].CA_STATUS==null) tempFreeze="";
							if(list[i].CA_STATUS=='Y') tempFreeze="<img src='${path}plf/page/fp/img/ico-state-h.png' width='35' height='15' class='mCS_img_loaded'>";
							if(list[i].CA_STATUS=='N') tempFreeze="<img src='${path}plf/page/fp/img/ico-state.png' width='35' height='15' class='mCS_img_loaded'>";
	                        $("#tbody_a6f1789e15de48a4831030ad33f6134f ").append("<tr id='"+list[i].ID+"' ></tr>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+((currentPage-1)*pageRecord+(i+1))+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+i+"' type='checkbox' name='isSelect3' class='_selectdata' value='"+list[i].ID+"'  /></td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: center;' title='"+list[i].CA_ID+"'>"+list[i].CA_ID+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+list[i].CA_NAME+"'>"+list[i].CA_NAME+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+list[i].GROUP_NAME+"'>"+list[i].GROUP_NAME+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: center;' title='"+list[i].TRACK+"'>"+list[i].TRACK+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: center;' >"+list[i].JOB_NAME+"</td>");
							$("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: center;' title='"+list[i].PNAME+"'>"+list[i].PNAME+"</td>");
	                        $("#tbody_a6f1789e15de48a4831030ad33f6134f tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: center;' >"+tempFreeze+"</td>");
	                }
	              
	                    
	            }
	                 
	               if(null!=data.ajaxMap){
	                   var map = eval(data.ajaxMap);
	                   $("#para_id").val(map.id);
	                   $("#iframeid").val(map.IFRAMEID);
	               }
	            pageFun(data.ajaxPage,"formId2");
                       var tableTrJs = $("#datagrid-btable-ajaxa6f1789e15de48a4831030ad33f6134f tbody tr");
						_tongLineColor(tableTrJs);
						clickTr('datagrid-btable-ajaxa6f1789e15de48a4831030ad33f6134f');
						defTableWidthRewrite("a6f1789e15de48a4831030ad33f6134f");
	        },
	        error: function(msg){
                        	if(msg.readyState!=0){
				              util.closeLoading();
				              utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                            }
                        }
	    })
	    
	}
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

<%--生成异步表格--%>
function createTableModel(ms,formId){
/*
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='a6f1789e15de48a4831030ad33f6134f'){<%--车间信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CA_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CA_TYPE')+"' style='"+ms.tdStyle(formId, 'CA_TYPE')+"' "+ms.tdEvent(formId, 'CA_TYPE')+">")
            arrHtml.push("<span colno='CA_TYPE' class='"+ms.uiClass(formId, 'CA_TYPE')+"' style='"+ms.uiStyle(formId, 'CA_TYPE')+"' "+ms.uiEvent(formId, 'CA_TYPE')+" title='"+ms.titleAttr(formId,'CA_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CA_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CA_PARENTAREAID' class='datagrid-cell "+ms.tdClass(formId, 'CA_PARENTAREAID')+"' style='"+ms.tdStyle(formId, 'CA_PARENTAREAID')+"' "+ms.tdEvent(formId, 'CA_PARENTAREAID')+">")
            arrHtml.push("<span colno='CA_PARENTAREAID' class='"+ms.uiClass(formId, 'CA_PARENTAREAID')+"' style='"+ms.uiStyle(formId, 'CA_PARENTAREAID')+"' "+ms.uiEvent(formId, 'CA_PARENTAREAID')+" title='"+ms.titleAttr(formId,'CA_PARENTAREAID','IS_TITLE_ATTR',v)+"' >"+v['CA_PARENTAREAID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CA_ID' class='datagrid-cell "+ms.tdClass(formId, 'CA_ID')+"' style='"+ms.tdStyle(formId, 'CA_ID')+"' "+ms.tdEvent(formId, 'CA_ID')+">")
            arrHtml.push("<span colno='CA_ID' class='"+ms.uiClass(formId, 'CA_ID')+"' style='"+ms.uiStyle(formId, 'CA_ID')+"' "+ms.uiEvent(formId, 'CA_ID')+" title='"+ms.titleAttr(formId,'CA_ID','IS_TITLE_ATTR',v)+"' >"+v['CA_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CA_NAME')+"' style='"+ms.tdStyle(formId, 'CA_NAME')+"' "+ms.tdEvent(formId, 'CA_NAME')+">")
            arrHtml.push("<span colno='CA_NAME' class='"+ms.uiClass(formId, 'CA_NAME')+"' style='"+ms.uiStyle(formId, 'CA_NAME')+"' "+ms.uiEvent(formId, 'CA_NAME')+" title='"+ms.titleAttr(formId,'CA_NAME','IS_TITLE_ATTR',v)+"' >"+v['CA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CA_EMP_ROLE' class='datagrid-cell "+ms.tdClass(formId, 'CA_EMP_ROLE')+"' style='"+ms.tdStyle(formId, 'CA_EMP_ROLE')+"' "+ms.tdEvent(formId, 'CA_EMP_ROLE')+">")
            arrHtml.push("<span colno='CA_EMP_ROLE' class='"+ms.uiClass(formId, 'CA_EMP_ROLE')+"' style='"+ms.uiStyle(formId, 'CA_EMP_ROLE')+"' "+ms.uiEvent(formId, 'CA_EMP_ROLE')+" title='"+ms.titleAttr(formId,'CA_EMP_ROLE','IS_TITLE_ATTR',v)+"' >"+v['CA_EMP_ROLE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CA_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'CA_GROUP')+"' style='"+ms.tdStyle(formId, 'CA_GROUP')+"' "+ms.tdEvent(formId, 'CA_GROUP')+">")
            arrHtml.push("<span colno='CA_GROUP' class='"+ms.uiClass(formId, 'CA_GROUP')+"' style='"+ms.uiStyle(formId, 'CA_GROUP')+"' "+ms.uiEvent(formId, 'CA_GROUP')+" title='"+ms.titleAttr(formId,'CA_GROUP','IS_TITLE_ATTR',v)+"' >"+v['CA_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CA_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CA_STATUS')+"' style='"+ms.tdStyle(formId, 'CA_STATUS')+"' "+ms.tdEvent(formId, 'CA_STATUS')+">")
            arrHtml.push("<span colno='CA_STATUS' class='"+ms.uiClass(formId, 'CA_STATUS')+"' style='"+ms.uiStyle(formId, 'CA_STATUS')+"' "+ms.uiEvent(formId, 'CA_STATUS')+" title='"+ms.titleAttr(formId,'CA_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CA_STATUS']+"</span>")
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
    setScroll();
    */
}
function querytest(){
   alert("施工中。。hys"); 
   var zTree = $.fn.zTree.getZTreeObj("index_tree");
   var nodes = zTree.getNodes();
   zTree.selectNode(nodes[1]);
   alert(nodes[1].id);
   zTree.setting.callback.onClick(null, zTree.setting.treeId, nodes[1]);//   
}

function query(){
   firstAsyncSuccessFlag = 0;
   curAsyncCount = 0;
   var typeArea = $("#typeArea").val();
    var areaName = $("#serachArea").val();
    var dataAuth=$("#DATA_AUTH").val();
    setInfoByLocal();
    if(dataAuth==""){
    utilsFp.confirmIcon(1,"","","","请选择组织机构","","260","145");
     return ;   
    }
    if(typeArea==""){
    utilsFp.confirmIcon(3,"","","","请选择类型","","260","145");
     return ;   
    }
    /*
    if(areaName==""){
    utilsFp.confirmIcon(3,"","","","请输入要查询的区域名称","","260","145");
     return ;   
    }  */
   $("#tbody_a6f1789e15de48a4831030ad33f6134f").empty();
	var settingquery = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        }			
                },
                callback: {
                        onClick: zTreeOnclick,
                        onAsyncSuccess: zTreeOnAsyncSuccess,
                        onAsyncError: zTreeOnAsyncError
                },
                async: {
                    enable: true,
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=8ed8dc3ae45f49aaa3552dec5f059795&typeArea="+typeArea+"&dataAuth="+dataAuth+"&areaName="+areaName,
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }                
    	   $.fn.zTree.init($("#index_tree"),settingquery);
	    initHeight();
    		newScroll("block1");
    	 setTimeout(function(){  
                expandAll("index_tree");
                
               
            },1000);//延迟加载 
            
            
            
}
               var curAsyncCount = 0;
               function expandAll() {  //递归展开树
            if (!check()) {  
                return;  
            }  
            var zTree = $.fn.zTree.getZTreeObj("index_tree");  
            expandNodes(zTree.getNodes());  
            if (!goAsync) {  
                curStatus = "";  
            } 
             
        } 
           function expandNodes(nodes) {  
            if (!nodes) return;  
            curStatus = "expand";  
            var zTree = $.fn.zTree.getZTreeObj("index_tree");  
            for (var i=0, l=nodes.length; i<l; i++) {  
                zTree.expandNode(nodes[i], true, false, false);//展开节点就会调用后台查询子节点  
                if (nodes[i].isParent && nodes[i].zAsync) {  
                    expandNodes(nodes[i].children);//递归  
                } else {  
                    goAsync = true;  
                }  
            }  
        }
                function check() {  
            if (curAsyncCount > 0) {  
                return false;  
            }  
            return true;  
        }  
         function beforeAsync() {  
            curAsyncCount++;  
           }
           
         function clickQuery(){
  		 var zTree = $.fn.zTree.getZTreeObj("index_tree");
    	 var nodes = zTree.getNodes();
    	 var serachArea = $("#serachArea").val();
    	 for (var i=0;i<nodes.length; i++) {
    	           var nodename =  nodes[i].name;
    	           
    	           if(serachArea==nodename){
    	               
   	                   zTree.selectNode(nodes[i]);
    	               zTree.setting.callback.onClick(null,nodes[i].id, nodes[i]);//点击查询的节点    	               
    	           }
    	 }
         }
         
    //从本地存储localStorage（长期存储）获取数据
	function getInfoByLoacl(){
	   
	     var tempExeId = $("input[name='exeid']").val();
	    var data2 = JSON.parse(localStorage.getItem('feederInfo'));
	    
	    if(data2!=null&&data2.feederExeId==tempExeId){
	        $("#DATA_AUTH").val(data2.DATA_AUTH);
	        $("#typeArea").val(data2.typeArea);
	        $("#serachArea").val(data2.serachArea);
	        query();
	    }
	     
	}
	//保存数据到本地localStorage（长期存储）
	function setInfoByLocal(){
	    const info = {
             feederExeId: $("input[name='exeid']").val(),
            DATA_AUTH: $("#DATA_AUTH").val(),
            typeArea: $("#typeArea").val(),
            serachArea: $("#serachArea").val()
           
        };
        localStorage.setItem('feederInfo', JSON.stringify(info));
        
	}
	
	$(function(){
	    getInfoByLoacl();
	    
	})    
</script>

<script>(function($){
  $(window).on('load',function(){
   setPopScroll('.scroll','.head');
   // setScroll('.scroll','.head');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

