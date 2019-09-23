<%@page import="com.more.fw.core.common.method.StringUtils"%>
<%@page import="com.more.fw.core.common.method.Constants"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>

<html>
	<head>
	<script type="text/javascript">
	var zcount=1000;
	</script>
	 
		<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
		<%@ include file="/plf/common/pub_meta.jsp"%>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="datePicker" value="1" />
			<jsp:param name="dhtmlxtree" value="1" />
			<jsp:param name="chosen" value="1" />
		</jsp:include>
		<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
		<script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>
    <link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
	    <title><dict:lang value="VM-仓库建模树形" /> </title>
	<style type="text/css">
		body{overflow-y:hidden;}
        
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
	       <script type="text/javascript"> 

         

        </script>
	</head>
	<body>
	 <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="4ea66f95eb4340f0a18662260737e3c2" />
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
      		<div  style="width: 83%;float: left;" >
        	<div>
						<iframe id="areaiframe" name="areaiframe" frameBorder="0"
							
								src="" name="mainFrame" id="mainFrame"  scrolling="auto" style="border-right: 1px;width: 100%;min-height: 550px;" >
						</iframe>
					</div>
        </div>

	<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form></div>
            </div>
        </div>
	<bu:submit viewId="4ea66f95eb4340f0a18662260737e3c2" />
  
		<bu:script viewId="4ea66f95eb4340f0a18662260737e3c2" />
		<script>
		
    		var setting = {
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
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=848f9f24f8544ea8a4a1be288cfa9274",
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
            
            function zTreeOnclick(event,treeId,treeNode){
                var url = "${path}buss/bussModel.ms?FUNC_CODE=F12730&exeid=a7fdc4cd506a496b802df01b54758186&id="+treeNode.id+"&iframeid="+window.name;
				
			 	parentWindow = $("#areaiframe")[0].contentWindow;
				parentWindow.frameElement.src= url;
            }
            function ajaxDataFilter(treeId,parentNode,responseDate){
                var data = responseDate.ajaxList;
                /*$.each(data,function(i,v){
                    v["isParent"] = true;
                });*/
                return data;
            }
			
	$(function(){
	        $.fn.zTree.init($("#index_tree"),setting);
	        
    		initHeight();
    		newScroll("block1")
    	});
    var firstAsyncSuccessFlag = 0; 
    function zTreeOnAsyncSuccess(event, treeId, msg){
        if (firstAsyncSuccessFlag == 0) { 
    		var zTree = $.fn.zTree.getZTreeObj("index_tree");
    	        var nodes = zTree.getNodes();
    	        if(nodes!=""){
    	            zTree.selectNode(nodes[0]);
    	            zTree.setting.callback.onClick(null, zTree.setting.treeId, nodes[0]);//点击第一个节点
    	        }else{ //没有数据
    	            var url = "${path}buss/bussModel.ms?FUNC_CODE=F12730&exeid=a7fdc4cd506a496b802df01b54758186&id=&iframeid="+window.name;
				
    			 	parentWindow = $("#areaiframe")[0].contentWindow;
    				parentWindow.frameElement.src= url;
    	        }
    	        
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
    		$('.block1').height($(parent.window).height() - 65 - 36 - 10);
    		$('#areaiframe').height($(parent.window).height());
    	}
    
	function reloadPg(msg,title,width,height,time,isCloseWin){
		msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
	}
	function query(){
	    location.reload();
	}
	function reloadPgExe(isCloseWin){
		location.reload();
		util.showTopLoading();	
		
		if ("0" == isCloseWin || undefined == isCloseWin) {
      		top.$(".dialog-close").click();
    	}
		
	}
	function reloadPgAx(msg,title,width,height,time,isCloseWin){
        console.log("555");
		msgPop(msg,reloadPgExeAx,title,width,height,time,isCloseWin);
	}
					
	function reloadPgExeAx(isCloseWin){
	 console.log("666");
	    query("formId1");
		util.showTopLoading();
		if(isCloseWin == "0"){
			top.$(".dialog-close").click();
		}
	} 
	function reloadIframe(){
	        
	       
		window.location.reload();
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
	}
		</script>
<bu:script viewId="4ea66f95eb4340f0a18662260737e3c2" />
	</body>	
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
	
</html>
