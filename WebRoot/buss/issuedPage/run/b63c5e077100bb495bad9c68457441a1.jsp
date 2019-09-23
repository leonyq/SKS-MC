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
	    <title><dict:lang value="VM-仓库建模树形" /> </title>
	<style type="text/css">
		body{overflow-y:hidden;}
		
	</style>
	       <script type="text/javascript"> 

         

        </script>
	</head>
	<body>
    <div  style="width: 100%;">
    	<div style="width: 17%;float: left;">
		<div class="block1" id="block1" style="width:92%;float: left;border-style:solid;border-width:1px; border-color:#eaeaea;background:#ffffff;padding:5px;margin-top: 40px;overflow:auto;">
       	<div id="index_tree" class="tree">
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
        <!-- content end -->        
    </div>
	
		<script>
		/*function init(){
    		var idd = '<%=session.getAttribute("firstId")%>';
                  //alert(idd);
		  tonclick(idd,idd);
    		}*/
			function tonclick(id,cid){
			       //alert(window.name);
				var url = "${path}buss/bussModel.ms?exeid=a7fdc4cd506a496b802df01b54758186&id="+id+"&iframeid="+window.name;
				
			 	parentWindow = $("#areaiframe")[0].contentWindow;
				parentWindow.frameElement.src= url;
			}
			
			
			
	$(function(){//alert(window.name);
	var areaUrl="${path}buss/bussModel_exeFunc.ms?funcMId=8fc6b97db3d440f8bca059c79aa65900";
			//alert(55);
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			tree.setImagePath("${rootPath}plf/js/dhtmlxtree/imgs/new_ui_tree/");
			tree.setOnClickHandler(tonclick);
			tree.loadXML(areaUrl);
			tree.setXMLAutoLoading(areaUrl);
	
	//alert(idd);
    	//获取当前iframe名称
		/*var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				//$("#iframeid").val(window.name);
			}
		}*/
		//console.log(window.name);
		//$("#areaiframe").attr("src","buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=F6512&exeid=a7fdc4cd506a496b802df01b54758186&iframeid="+window.name);
    		initHeight();
    		newScroll("block1")
    	});
    	
    	document.onreadystatechange = function () {      
               if(document.readyState=="complete") {            
                  var idd = '<%=session.getAttribute("firstId")%>';
                  
		  tonclick(idd,idd);
               }     
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
        console.log("777");
		msgPop(msg,reloadPgExeAx,title,width,height,time,isCloseWin);
	}
					
	function reloadPgExeAx(isCloseWin){
	 console.log("888");
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
<bu:script viewId="3544ab8c24734accbe8f93fb811dd2a5" />
	</body>	
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
	
</html>
