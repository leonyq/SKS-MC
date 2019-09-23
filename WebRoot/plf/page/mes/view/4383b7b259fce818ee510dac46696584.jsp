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
	    <title><dict:lang value="车间建模" /> </title>
	<style type="text/css">
		body{overflow-y:hidden;}
		
	</style>
	       <script type="text/javascript"> 

         window.onload=function(){
             var idd = '<%=session.getAttribute("idd")%>';
             
             tonclick(idd,idd);
         }

        </script>
	</head>
	<body>
    <div  style="width: 100%;">
    	<div style="width: 17%;float: left;">
		<div class="block1" style="width:92%;float: left;border-style:solid;border-width:1px; border-color:#eaeaea;background:#ffffff;padding:5px;margin-top: 36px;overflow:auto;">
       	<div id="index_tree" class="tree">
      	</div>
      	</div>
      </div>
        <div  style="width: 83%;float: left;" >
        	<div>
						<iframe id="areaiframe" name="areaiframe" frameBorder="0"
							
								src="" name="mainFrame" id="mainFrame"  scrolling="auto" style="border-right: 1px;width: 99%;min-height: 550px;" >
						</iframe>
					</div>
        </div>
        <!-- content end -->        
    </div>
	
		<script>
		        ;
			function tonclick(id,cid){
			       //alert(id);
			       //alert(cid);
			       // console.log(tree);
			       // var parentIds = tree.getAllPartiallyChecked();
    				//alert(parentIds);
    				//var ids=tree.getAllChecked();
    				//alert(ids);
    				//idd=id;
    				
				var url = "buss/bussModel.ms?exeid=a27cca0337b6459686491d31bd42082a&id="+id+"&iframeid="+window.name;
				//alert(url);
			 	parentWindow = $("#areaiframe")[0].contentWindow;
				parentWindow.frameElement.src= url;
			}
			
			var areaUrl="buss/bussModel_exeFunc.ms?FUNC_CODE=F2607&funcMId=1622aa84610f4a609e379f52bca7263c";
			//alert(55);
			var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			tree.setImagePath("${rootPath}plf/js/dhtmlxtree/imgs/new_ui_tree/");
			tree.setOnClickHandler(tonclick);
			tree.loadXML(areaUrl);
			tree.setXMLAutoLoading(areaUrl);
			
	$(function(){
    	//获取当前iframe名称
		/*var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				//$("#iframeid").val(window.name);
			}
		}*/
		//console.log(window.name);
		$("#areaiframe").attr("src","buss/bussModel.ms?exeid=a27cca0337b6459686491d31bd42082a&iframeid="+window.name);
    		initHeight();
    	});
    	
    	$(window).resize(function(){
    		initHeight();
    	})
    	
    	function initHeight(){
    		$('.block1').height($(parent.window).height() - 65 - 36 - 10);
    		$('#areaiframe').height($(parent.window).height());
    	}
    
	function reloadPg(msg,title,width,height,time){
	         //alert(77);
		msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
	function reloadPgExe(){
	        //alert(66);
		location.reload();
		util.showTopLoading();		
		top.$(".dialog-close").click();
		
	}
	
	function reloadIframe(){
	        
	       
		window.location.reload();
	}
	
		</script>
		
	</body>	
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
	
</html>
