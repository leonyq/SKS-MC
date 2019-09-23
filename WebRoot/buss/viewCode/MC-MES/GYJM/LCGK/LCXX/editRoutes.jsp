<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
    </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="编辑" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />		
		<jsp:param name="html5" value="1" />
		<jsp:param name="workFlow" value="1" />
		<jsp:param name="spectrum" value="1" />
	</jsp:include>	
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
               <jsp:param name="modelName" value="VIEW_TYPE_11" />
                <jsp:param name="location" value="editForm" />
            </jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
        <script src="${path}plf/js/jsPlumb/newWorkflowchart.js"></script>   
	
    
	<style type="text/css">
	.x-fieldset{border:1px solid #00bfff;padding:10px;margin-bottom:10px;display:block;height: 100%}
	</style>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
	
	<script src="${path}plf/js/jsPlumb/flow/topo.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/businessTopo.js"></script>
	<script>
	$(function(){
		initContext();//初始化内容
		billingButton();//绑定按钮事件
		
	});
	</script>
	<script type="text/javascript" src="${path}plf/js/jsPlumb/flow/jtopo-min.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/jscolor.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/toHex.js"></script>
	<style type="text/css">
	 #editor {
				resize:vertical; 
				overflow:auto; 
				border:1px solid silver; 
				border-radius:5px; 
				min-height:200px;
				box-shadow: inset 0 0 10px silver;
				padding:1em;
	}
	#contextmenu {
		border-bottom: 0;
		position: absolute;
		list-style: none;
		margin: 0;
		padding: 0;
		display: none;
	}
																			   
	#contextmenu li a {
		display: block;
		padding: 10px;
		border-bottom: 1px solid #aaa;
		
	}
	#menu{
		height:50px;
	}
	#menu img{
		border: solid 2px white;
	}
	#menu img:hover{
		border: solid 2px blue;
		
	}
	#tipDiv{
		position: absolute;
		width: 200px;
		height: 100px;
		z-index: 1004;
		display:none;
		background-color: rgb(208,146,133);
		filter:Alpha(Opacity=90,Style= 0);
		opacity: 0.9;
	}
	label{
		display: inherit;
		margin-bottom:0px;
	}
	.jtopo_toolbar{
		height:auto;
	}
	#left {
		height: 100%;
		overflow: auto;
		margin-left:0;
		width: 170px;
		border: 1px solid #E4E4E4;
		box-sizing: border-box;
		position: unset;
		padding-top: 10px;
	}
	toolbar2 .pop-content{
		width: 350px;
		height: 60px;
	}
	toolbar2 .left-content{
		width: 60%;
		float: left;
	}
	.toolbar2 .right-context{
		margin-top: 11px;
        width: 280px;
        text-align: left;
        float: left;
        margin-left: 10px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
	}
	.toolbar2 img{
		padding:3px;
		border:1px solid #FFCC99;
		/*margin:3px;*/
		margin-left:6px;
		width: 30px;
		height: 30px;
		float: left;
	}
	.toolbar2 img:hover{
		background-color:#CCCCCC;
		cursor:pointer;
	}
	.node-class{
		background: antiquewhite;
		width: 64px
	}
	
	.tool-con-active{
		background: antiquewhite; 
	}
	
	#leftPanel .attribute{
	    height:100%;
	}
	
	#leftPanel .attribute>ul{
	    height:calc(100% - 30px);
	    overflow:auto;
	}
	
    #leftPanel .attribute>ul{
	    padding:10px;
	    box-sizing:border-box;
	}
	
	#hd .operation{
	    height:32px;
	    width: 650px;
        border: 1px solid #CCC;
        margin: -34px auto;
        border-bottom: 0;
	}
	
	#hd .operation>ul li{
	    float:left;
	    height:18px;
	    width:18px;
	    cursor: pointer;
	    margin-top: 5px;
        margin-left: 30px;
	}
    	
    #hd .operation>ul li:nth-of-type(1){		
	    background-image:url(${path}plf/page/fp/img/point-icon.png);
	}
	
	#hd .operation>ul li:nth-of-type(2){		
	    background-image:url(${path}plf/page/fp/img/straight-icon.png)
	}
	
	#hd .operation>ul li:nth-of-type(3){		
	    background-image:url(${path}plf/page/fp/img/broken-icon.png)
	}
	
	#hd .operation>ul li:nth-of-type(4){		
	    background-image:url(${path}plf/page/fp/img/u-icon.png)
	}
	
	#hd .operation>ul li:nth-of-type(5){		
	    background-image:url(${path}plf/page/fp/img/revers.png)
	}
	
	#hd .operation>ul li:nth-of-type(6){		
	    background-image:url(${path}plf/page/fp/img/empty.png)
	}  
	#hd .operation>ul li:nth-of-type(7){		
	    background-image:url(${path}plf/page/fp/img/ico-align-left.png)
	}
	
	#hd .operation>ul li:nth-of-type(8){		
	    background-image:url(${path}plf/page/fp/img/ico-align-right.png)
	}
	#hd .operation>ul li:nth-of-type(9){		
	    background-image:url(${path}plf/page/fp/img/ico-align-top.png);
	}
	
	#hd .operation>ul li:nth-of-type(10){		
	    background-image:url(${path}plf/page/fp/img/ico-align-bottom.png)
	}
	
	
	
	#hd .operation>ul li:nth-of-type(11){		
	    background-image:url(${path}plf/page/fp/img/icon-enlarge.png)
	}
	
	#hd .operation>ul li:nth-of-type(12){		
	    background-image:url(${path}plf/page/fp/img/ico-narrow.png)
	} 
	
	#hd .operation>ul li:nth-of-type(13){		
	    background-image:url(${path}plf/page/fp/img/empty.png)
	} 

	#hd .operation>ul li:nth-of-type(1):hover{		
	    background-image:url(${path}plf/page/fp/img/point-icon-h.png);
	}
	
	#hd .operation>ul li:nth-of-type(2):hover{		
	    background-image:url(${path}plf/page/fp/img/straight-icon-h.png)
	}
	
	#hd .operation>ul li:nth-of-type(3):hover{		
	    background-image:url(${path}plf/page/fp/img/broken-icon-h.png)
	}
	
	#hd .operation>ul li:nth-of-type(4):hover{		
	    background-image:url(${path}plf/page/fp/img/u-icon-h.png)
	}
	
	#hd .operation>ul li:nth-of-type(5):hover{		
	    background-image:url(${path}plf/page/fp/img/revers-h.png)
	}
	
	#hd .operation>ul li:nth-of-type(6):hover{		
	    background-image:url(${path}plf/page/fp/img/empty-h.png)
	}
	#hd .operation>ul li:nth-of-type(7):hover{		
	    background-image:url(${path}plf/page/fp/img/ico-align-hover-left.png)
	}
	
	#hd .operation>ul li:nth-of-type(8):hover{		
	    background-image:url(${path}plf/page/fp/img/ico-align-hover-right.png)
	}
	#hd .operation>ul li:nth-of-type(9):hover{		
	    background-image:url(${path}plf/page/fp/img/ico-align-hovor-top.png);
	}
	
	#hd .operation>ul li:nth-of-type(10):hover{		
	    background-image:url(${path}plf/page/fp/img/ico-align-hover-bottom.png)
	}
	
	
	
	#hd .operation>ul li:nth-of-type(11):hover{		
	    background-image:url(${path}plf/page/fp/img/icon-hover-enlarge.png)
	}
	
	#hd .operation>ul li:nth-of-type(12):hover{		
	    background-image:url(${path}plf/page/fp/img/ico-hovor-narrow.png)
	}
	
	#hd .operation>ul li:nth-of-type(13):hover{		
	    background-image:url(${path}plf/page/fp/img/empty-h.png)
	}
	
	#leftPanel .attribute>ul li{
	    float:left;
	    height:30px;
	    width:100%;
	    line-height:30px;
	    cursor: pointer;
	}
	
	#leftPanel .attribute>ul li>span{
	    display:block;
	    width:56px;
	    text-overflow:ellipsis;
	    overflow:hidden;
	    white-space:nowrap;
	    float: left;
        text-align: right;
        margin-right: 5px;
	}
	
	#leftPanel .attribute>ul li>input{
	    width:100px;
	    box-sizing:border-box;
	    outline:none;
	    border: 1px solid #b9b9b9;
	    padding-left:5px;
	}
	
	#leftPanel .attribute>ul li>input:focus{
	    background-color: transparent;
    	border: 1px solid #b9b9b9;
	}
	
	._head{
	    width:100%;
	    height:30px;
	    color:#000;
	    line-height: 30px;
        padding-left: 10px;
	    background-color:#f1f1f1;
	    box-sizing:border-box;
	}
	
	#addRoutelist input[type="text"]{
	    width:100%;
	    height:100%;
	    border:none;
	    outline:none;
	    background-color:transparent;
	}
	.show-text{
		width: 160px;
		height: 80px;
		position: absolute;
		top: 458px;
		left: 930px;
		border: 1px solid #d8d0d0;
		color: #e45353;
	}
</style>
<script>
	    
	//加载父ifream中的js\css文件
        
		var ajaxFlag = false;
		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
				var script = document.createElement("script");
				script.type = 'text/javascript';
				//script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
	</script>
	<script type="text/javascript">

	var tab_len = 2;
	var currentTag;
	function switchTag(tag, content,url) {
			if(currentTag == tag){
				return false;
			}
			getData();  //获取画布中是数据
			if("tag2" == tag){
			   
				if(!checkGroup()){
					return false;
				}
				
			}else{
				statisticsEcoh();
			}
			document.getElementById("content2").style.display="";
			for (i = 1; i < (tab_len+1); i++) {
				if ("tag" + i == tag) {
					document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
					document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
				} else {
					document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
					document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
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
		
		//验证工序是否合法
		function checkGroup(){
			var res = validateProcedure();
				if ( res == 100 ) {
	        		setCountData();
	        	}else if ( res == 101) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一个工序作为开始工序" />",0,"","");
					return false;
	        	}else if ( res == 102) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="仅允许一个工序作为开始工序" />",0,"","");
					return false;
	        	}else if ( res == 103) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一个工序作为结束工序" />",0,"","");
					return false;
	        	}else if ( res == 104) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="仅允许一个工序作为结束工序" />",0,"","");
					return false;
	        	}else if ( res == 105) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="存在不连接的流程" />",0,"","");
					return false;
	        	}else if ( res == 106) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="开始工序只能为正常工序" />",0,"","");
					return false;
	        	}else if ( res == 107) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="结束工序只能为正常工序" />",0,"","");
					return false;
	        	}
	        	return true;
		}
		
		var flag = null;	//新增（add）/(edit)修改 标识
		window.onload=function(){
			flag = $("#flag").val();
			$("#tag1").addClass("current");
			$("#paraMap1_CR_ROUTE_FLAG_1").attr('checked',true);
			getEditData();
            		
			$("#paraMap1_CR_ROUTE_STEP").find("option[value='']").remove();
        	$("#paraMap1_CR_ROUTE_STEP").trigger("chosen:updated");
			$("#paraMap1_CR_MO_OUTPUT_chosen").css("width","200px");
			$("#paraMap1_CR_MO_INPUT_chosen").css("width","200px");
			$("#paraMap1_CR_PO_INPUT_chosen").css("width","200px");
			$("#paraMap1_CR_PO_OUTPUT_chosen").css("width","200px");
			$("#paraMap1_CR_ITEM_GROUP_chosen").css("width","200px");
			$("#paraMap1_CR_AGING_BEGIN_GROUP_chosen").css("width","200px");
			$("#paraMap1_CR_AGING_END_GROUP_chosen").css("width","200px");
			
		}; 
	//获取数据回显
		function getEditData(){
		    var crStep = $("#paraMap1_CR_ROUTE_STEP").val();
		 	util.showTopLoading();
        	ajaxFlag = false;
        	$("#left").empty();
        	$("#data_auth").empty();
			$.ajax({
        			type: "POST",
        		    dataType: "json",
        		    url: "buss/bussModel_exeFunc.ms?funcMId=0618c381a3914dc29931f2fd3574eb6d",
        		    data: {
        		        flag:flag,
        		    	dataId: $("#dataId").val(),
        		    	routeCode: $("#routeCode").val(),
        		    	crStep:crStep
        		    },
        			success: function(data){
        				ajaxFlag = true;
     					util.closeLoading();
						if(null != data.res){
							if ("error" == data.res) {
								utilsFp.confirmIcon(3,"","","", data.msg,0,"300","");
								return ;
							}
						}
						//加载相关组织机构
				        if(data.authLs != null && data.authLs != ""){
     						var authLs = data.authLs;
				            	if(authLs.length > 1){
				            	    $("#data_auth").append("<option value=''>--<dict:lang value='请选择'/>--</option>");
				            	}
							if(null != authLs){
								for(var i = 0;i < authLs.length; i++){
									$("#data_auth").append("<option value='"+authLs[i].ID+"'>"+authLs[i].NAME+"</option>");
								}
								$("#data_auth").trigger("chosen:updated");
							}		
     					}else{
     						utilsFp.confirmIcon(3,"","","", "当前用户无相关组织机构",0,"300","");
     					}
 						$("#searchDiv").append("<div class='pop-content' style='height:20px;position:fixed;z-index:9999;left:28px;top:140px;'>"+
 						"<input id='searchInput' class='input' style='width:150px' onkeyup='searchGroup(this.value)' placeholder='请输入工序名称或编码'/></div>");
     					//加载工序信息
     					if(data.groupList != null && data.groupList != ""){
     						var photoPath = null;
     						var leftHtml = "";
     						var id;
     						var ids;
     						for ( var i = 0; i < data.groupList.length; i++) {
	     					//	if ("" == data.groupList[i].PHOTO_PATH || null == data.groupList[i].PHOTO_PATH) {
							//		photoPath = "${path}plf/js/jsPlumb/images/process.png";
						//		}else{
						//			photoPath = "${path}up_load/comm/"+data.groupList[i].PHOTO_PATH; 
		                           						
						//		}
						        	
						        id="groupID_"+data.groupList[i].GROUP_CODE;
						        ids=data.groupList[i].GROUP_CODE;
								photoPath = "${path}up_load/comm/"+data.groupList[i].PHOTO_PATH;
						
    					 		 leftHtml =leftHtml+"<div class='pop-content' style='height: 60px;width:350px;position: relative;top:20px'>"+
                                        	"<div class='left-content'>"+
                                        	"<img src='"+photoPath+"' id='"+data.groupList[i].GROUP_CODE+"'  onerror=\"javascript:this.src='${path}plf/js/jsPlumb/images/process.png'\" name='"+photoPath+"' draggable='true' ondragstart='drag(event)' myAttr='"+data.groupList[i].GROUP_NAME+"'  >"+ 
                                        	"<input type='hidden' id='"+id+"'   value='"+data.groupList[i].GROUP_CODE+"'/>"+
                                        	"</div>"+
                                        	"<div class='right-context'>"+data.groupList[i].GROUP_NAME+
                                        	"</div><div class='hide-context' style='display:none'>"+ data.groupList[i].GROUP_CODE+"</div></div>";
									//$("#left").append(leftHtml);
     						}	
							$("#left").append(leftHtml);	
							setPopScroll('#left');
     					}else{
     						utilsFp.confirmIcon(1,"","","", "未查询到相关工序",0,"300","");
     					}
			           if("add" == flag){
     					    $("#allRount").css('display','block');
     					    
     					    $("#paraMap1_CR_ROUTE_FLAG_1").val("Y");
     					    getAllRountSelect();
     					    
     					}     					
     					if ("edit" == flag) {
							//加载流程信息
							$("#vflag").css('display','block');
							var flowList = data.flowList;
						
							if(flowList != null && flowList != ""){
								$("#paraMap1_CR_ROUTE_ID").val(flowList[0].CR_ROUTE_ID);
								$("#paraMap1_CR_ROUTE_ID").attr("disabled","disabled");
								$("#paraMap1_CR_ROUTE_NAME").val(flowList[0].CR_ROUTE_NAME);
								$("#paraMap1_CR_ROUTE_STEP").val(flowList[0].CR_ROUTE_STEP);
								$("#paraMap1_CR_ROUTE_STEP").find("option[value=\""+flowList[0].CR_ROUTE_STEP+"\"]").attr("selected",true);
								$("#paraMap1_CR_ROUTE_STEP").trigger("chosen:updated");
								if ("Y" == flowList[0].CR_ROUTE_FLAG) {
									$("#paraMap1_CR_ROUTE_FLAG_1").attr("checked",true);
								}else{
									$("#paraMap1_CR_ROUTE_FLAG_1").attr("checked",false);
								}
								$("#data_auth").find("option[value=\""+flowList[0].DATA_AUTH+"\"]").attr("selected",true);
								$("#data_auth").trigger("chosen:updated");
								crMoInputEcoh = flowList[0].CR_MO_INPUT;
								crMoOutputEcoh = flowList[0].CR_MO_OUTPUT;
								crPoInputEcoh = flowList[0].CR_PO_INPUT;
								crPoOutputEcoh = flowList[0].CR_PO_OUTPUT;
								crItemGroupEcoh = flowList[0].CR_ITEM_GROUP;
								crFqcGroupEcoh = flowList[0].CR_FQC_GROUP;
								crIpqcGroupEcoh = flowList[0].CR_IPQC_GROUP;
								crIBeginGroupEcoh =flowList[0].CR_AGING_BEGIN_GROUP;
								crIEndGroupEcoh = flowList[0].CR_AGING_END_GROUP;
								//回显流程图
								showTopoData(flowList[0].CR_BLOCKS_MSG);
							}else{
	     						utilsFp.confirmIcon(1,"","","", "未查询到流程信息",0,"300","");
							}
							//加载流程统计设置信息
							var countList = data.countList;
							if(countList != null && countList != ""){
								for ( var i = 0; i < countList.length; i++) {
									var step = $("#crcoStec").find("option[value=\""+countList[i].CRCO_STEP+"\"]").text();
						        	$("#addRoutelist").append("<tr></tr>");
						        	$("#addRoutelist tr:last").append("<td style='text-align: center;width: 10%;'><input type='checkbox' onclick='' /></td>");
						        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'><input type='text' disabled='disabled' id=\""+countList[i].CRCO_STEP+"\" value='"+step+"' /></td>");
						        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'><input type='text' disabled='disabled' id=\""+countList[i].CRCO_START_GROUP+"\" uuid='' order='"+countList[i].CRCO_START_SEQ+"' value='"+countList[i].CRCO_START_NAME+"' /></td>");
						        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'><input type='text' disabled='disabled' id=\""+countList[i].CRCO_END_GROUP+"\" uuid='' order='"+countList[i].CRCO_END_SEQ+"' value='"+countList[i].CRCO_END_NAME+"' /></td>");
		        	
        						}
							}
						}
						
        			},
        			error: function(msg){
        					if(msg.readyState!=0){
             					util.closeLoading();
             					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
             				}
        			  }
        			});
		}
		
		function searchGroup(val){
	        var $groupName = $(".right-context");
			$.each($groupName,function(i,item){
    			if(item.innerHTML.indexOf(val)==-1 && $(item).next().text().indexOf(val)==-1){
    			    $(item).parent().hide();
    			}else{
    			    $(item).parent().show();
    			}
			});
		      
		}
		
		var nodeData = [];
		var lineData = [];	//用于存放画板上所有的工序和连接线
        var paraMapModel = "${paraMap.model}";
		function getData(){
			var data = saveTopoInfo();
			nodeData = [];
			lineData = [];
			nodeData = data.imgNode;
			lineData = data.line;
		}
			
		//加载统计设置页面数据
		function setCountData(){
			$("#paraMap1_CR_MO_INPUT").empty();
        	$("#paraMap1_CR_MO_OUTPUT").empty();
        	$("#paraMap1_CR_PO_OUTPUT").empty();
        	$("#paraMap1_CR_PO_INPUT").empty();
        	$("#paraMap1_CR_ITEM_GROUP").empty();
        	$("#paraMap1_CR_FQC_GROUP").empty();
        	$("#paraMap1_CR_IPQC_GROUP").empty();
        	$("#crcoStartGroup").empty();
        	$("#crcoEndGroup").empty();
        	$("#paraMap1_CR_AGING_BEGIN_GROUP").empty();
        	$("#paraMap1_CR_AGING_END_GROUP").empty();
        	
        	$("#paraMap1_CR_MO_OUTPUT").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#paraMap1_CR_MO_INPUT").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#paraMap1_CR_PO_OUTPUT").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#paraMap1_CR_PO_INPUT").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#paraMap1_CR_ITEM_GROUP").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#paraMap1_CR_FQC_GROUP").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#paraMap1_CR_IPQC_GROUP").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#crcoStartGroup").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#crcoEndGroup").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#paraMap1_CR_AGING_BEGIN_GROUP").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	$("#paraMap1_CR_AGING_END_GROUP").append("<option value='' class='select_name'>--<dict:lang value="请选择" />--</option>");
        	console.log("nodeData==>",nodeData);
			for(var i=0;i<nodeData.length;i++){
				$("#paraMap1_CR_MO_OUTPUT").append("<option value='"+nodeData[i].groupCode+"' uuid='"+nodeData[i].uuid+"' order='"+nodeData[i].sequence+"' class='select_name'>"+nodeData[i].text+"</option>");
				$("#paraMap1_CR_MO_INPUT").append("<option value='"+nodeData[i].groupCode+"' uuid='"+nodeData[i].uuid+"' order='"+nodeData[i].sequence+"' class='select_name'>"+nodeData[i].text+"</option>");
				$("#paraMap1_CR_PO_OUTPUT").append("<option value='"+nodeData[i].groupCode+"' uuid='"+nodeData[i].uuid+"' order='"+nodeData[i].sequence+"' class='select_name'>"+nodeData[i].text+"</option>");
				$("#paraMap1_CR_PO_INPUT").append("<option value='"+nodeData[i].groupCode+"' uuid='"+nodeData[i].uuid+"' order='"+nodeData[i].sequence+"' class='select_name'>"+nodeData[i].text+"</option>");
				$("#paraMap1_CR_ITEM_GROUP").append("<option value='"+nodeData[i].groupCode+"' uuid='"+nodeData[i].uuid+"' order='"+nodeData[i].sequence+"' class='select_name'>"+nodeData[i].text+"</option>");
				$("#paraMap1_CR_FQC_GROUP").append("<option value='"+nodeData[i].groupCode+"' uuid='"+nodeData[i].uuid+"' order='"+nodeData[i].sequence+"' class='select_name'>"+nodeData[i].text+"</option>");
				$("#paraMap1_CR_IPQC_GROUP").append("<option value='"+nodeData[i].groupCode+"' uuid='"+nodeData[i].uuid+"' order='"+nodeData[i].sequence+"' class='select_name'>"+nodeData[i].text+"</option>");
				$("#crcoStartGroup").append("<option value='"+nodeData[i].groupCode+"' uuid='"+nodeData[i].uuid+"' order='"+nodeData[i].sequence+"' class='select_name'>"+nodeData[i].text+"</option>");
				$("#crcoEndGroup").append("<option value='"+nodeData[i].groupCode+"' uuid='"+nodeData[i].uuid+"' order='"+nodeData[i].sequence+"' class='select_name'>"+nodeData[i].text+"</option>");
				$("#paraMap1_CR_AGING_BEGIN_GROUP").append("<option value='"+nodeData[i].groupCode+"' uuid='"+nodeData[i].uuid+"' order='"+nodeData[i].sequence+"' class='select_name'>"+nodeData[i].text+"</option>");
				$("#paraMap1_CR_AGING_END_GROUP").append("<option value='"+nodeData[i].groupCode+"' uuid='"+nodeData[i].uuid+"' order='"+nodeData[i].sequence+"' class='select_name'>"+nodeData[i].text+"</option>");
			}
			//tab切换后显示之前选项
			
				if ($("#paraMap1_CR_MO_INPUT").find("option[value="+crMoInputEcoh+"]").length) {
					$("#paraMap1_CR_MO_INPUT").find("option[value="+crMoInputEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_MO_INPUT").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_MO_OUTPUT").find("option[value="+crMoOutputEcoh+"]").length) {
					$("#paraMap1_CR_MO_OUTPUT").find("option[value="+crMoOutputEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_MO_OUTPUT").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_PO_INPUT").find("option[value="+crPoInputEcoh+"]").length) {
					$("#paraMap1_CR_PO_INPUT").find("option[value="+crPoInputEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_PO_INPUT").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_PO_OUTPUT").find("option[value="+crPoOutputEcoh+"]").length) {
					$("#paraMap1_CR_PO_OUTPUT").find("option[value="+crPoOutputEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_PO_OUTPUT").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_ITEM_GROUP").find("option[value="+crItemGroupEcoh+"]").length) {
					$("#paraMap1_CR_ITEM_GROUP").find("option[value="+crItemGroupEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_ITEM_GROUP").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_FQC_GROUP").find("option[value="+crFqcGroupEcoh+"]").length) {
					$("#paraMap1_CR_FQC_GROUP").find("option[value="+crFqcGroupEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_FQC_GROUP").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_IPQC_GROUP").find("option[value="+crIpqcGroupEcoh+"]").length) {
					$("#paraMap1_CR_IPQC_GROUP").find("option[value="+crIpqcGroupEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_IPQC_GROUP").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_AGING_BEGIN_GROUP").find("option[value="+crIBeginGroupEcoh+"]").length) {
					$("#paraMap1_CR_AGING_BEGIN_GROUP").find("option[value="+crIBeginGroupEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_AGING_BEGIN_GROUP").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_AGING_END_GROUP").find("option[value="+crIEndGroupEcoh+"]").length) {
					$("#paraMap1_CR_AGING_END_GROUP").find("option[value="+crIEndGroupEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_AGING_END_GROUP").find("option[value='']").attr("selected",true);
				}
				
        	$("#paraMap1_CR_MO_OUTPUT").trigger("chosen:updated");
        	$("#paraMap1_CR_MO_INPUT").trigger("chosen:updated");
        	$("#paraMap1_CR_PO_INPUT").trigger("chosen:updated");
        	$("#paraMap1_CR_PO_OUTPUT").trigger("chosen:updated");
        	$("#paraMap1_CR_ITEM_GROUP").trigger("chosen:updated");
        	$("#paraMap1_CR_FQC_GROUP").trigger("chosen:updated");
        	$("#paraMap1_CR_IPQC_GROUP").trigger("chosen:updated");
        	$("#crcoStartGroup").trigger("chosen:updated");
        	$("#crcoEndGroup").trigger("chosen:updated");
        	$("#paraMap1_CR_AGING_BEGIN_GROUP").trigger("chosen:updated");
        	$("#paraMap1_CR_AGING_END_GROUP").trigger("chosen:updated");
		}
        
	//制令单投入工序
         function compareMO(){
         	if ("" != $("#paraMap1_CR_MO_OUTPUT").val()) {
	         	var start = $("#paraMap1_CR_MO_INPUT").find("option:selected").attr("uuid");
	         	var end = $("#paraMap1_CR_MO_OUTPUT").find("option:selected").attr("uuid");
	        	var end_err = document.getElementById("paraMap1_CR_MO_INPUT");
	        	addNonErgodic();
	        	var temp = canvasObj.validateBeforeNode(start,end);
	        	if (!temp) {
	         		_alertValMsg(end_err,"<dict:lang value='制令单产出工序不能早于制令单投入工序'/>");
					$("#paraMap1_CR_MO_INPUT").find("option[value='']").attr("selected",true);
					$("#paraMap1_CR_MO_INPUT").trigger("chosen:updated");
				}
         	}
        } 
                
	//制令单产出工序
         function compareMO_s(){
         	if ("" != $("#paraMap1_CR_MO_INPUT").val()) {
	         	var start = $("#paraMap1_CR_MO_INPUT").find("option:selected").attr("uuid");
	         	var end = $("#paraMap1_CR_MO_OUTPUT").find("option:selected").attr("uuid");
	        	var end_err = document.getElementById("paraMap1_CR_MO_OUTPUT");
	        	addNonErgodic();
	        	var temp = canvasObj.validateBeforeNode(start,end);
	        	if (!temp) {
	         		_alertValMsg(end_err,"<dict:lang value='制令单产出工序不能早于制令单投入工序'/>");
					$("#paraMap1_CR_MO_OUTPUT").find("option[value='']").attr("selected",true);
					$("#paraMap1_CR_MO_OUTPUT").trigger("chosen:updated");
				}
         	}
        }
         
      //  工单投入工序
         function comparePO(){
         	if ("" != $("#paraMap1_CR_PO_OUTPUT").val()) {
				var start = $("#paraMap1_CR_PO_INPUT").find("option:selected").attr("uuid");
	         	var end = $("#paraMap1_CR_PO_OUTPUT").find("option:selected").attr("uuid");
	        	var end_err = document.getElementById("paraMap1_CR_PO_INPUT");
	        	addNonErgodic();
	        	var temp = canvasObj.validateBeforeNode(start,end);
	        	if (!temp) {
	        		_alertValMsg(end_err,"<dict:lang value='工单产出工序不能早于工单投入工序'/>");
					$("#paraMap1_CR_PO_INPUT").find("option[value='']").attr("selected",true);
					$("#paraMap1_CR_PO_INPUT").trigger("chosen:updated");
				}
			}
        } 
         
      //  工单产出工序
         function comparePO_s(){
         	if ("" != $("#paraMap1_CR_PO_INPUT").val()) {
				var start = $("#paraMap1_CR_PO_INPUT").find("option:selected").attr("uuid");
	         	var end = $("#paraMap1_CR_PO_OUTPUT").find("option:selected").attr("uuid");
	        	var end_err = document.getElementById("paraMap1_CR_PO_OUTPUT");
	        	addNonErgodic();
	        	var temp = canvasObj.validateBeforeNode(start,end);
	        	if (!temp) {
	        		_alertValMsg(end_err,"<dict:lang value='工单产出工序不能早于工单投入工序'/>");
					$("#paraMap1_CR_PO_OUTPUT").find("option[value='']").attr("selected",true);
					$("#paraMap1_CR_PO_OUTPUT").trigger("chosen:updated");
				}
			}
        }
        
       // 阶别统计开始工序
         function compareEG(){
         	if ("" != $("#crcoEndGroup").val()) {
         		var start = $("#crcoStartGroup").find("option:selected").attr("uuid");
	         	var end = $("#crcoEndGroup").find("option:selected").attr("uuid");
	        	var end_err = document.getElementById("crcoStartGroup");
	        	addNonErgodic();
	        	var temp = canvasObj.validateBeforeNode(start,end);
	        	if (!temp) {
	        		_alertValMsg(end_err,"<dict:lang value='结束工序不能早于等于开始工序'/>");
					$("#crcoStartGroup").find("option[value='']").attr("selected",true);
					$("#crcoStartGroup").trigger("chosen:updated");
				}
         	}
        } 
       // 阶别统计结束工序
         function compareEG_s(){
         	if ("" != $("#crcoStartGroup").val()) {
         		var start = $("#crcoStartGroup").find("option:selected").attr("uuid");
	         	var end = $("#crcoEndGroup").find("option:selected").attr("uuid");
	        	var end_err = document.getElementById("crcoEndGroup");
	        	addNonErgodic();
	        	var temp = canvasObj.validateBeforeNode(start,end);
	        	if (!temp) {
	        		_alertValMsg(end_err,"<dict:lang value='结束工序不能早于等于开始工序'/>");
					$("#crcoEndGroup").find("option[value='']").attr("selected",true);
					$("#crcoEndGroup").trigger("chosen:updated");
				}
         	}
        } 
        
        
   
        
        //老化开始工序
         function compareBEGIN(){
         	if ("" != $("#paraMap1_CR_AGING_END_GROUP").val()) {
	         	var start = $("#paraMap1_CR_AGING_BEGIN_GROUP").find("option:selected").attr("uuid");
	         	var end = $("#paraMap1_CR_AGING_END_GROUP").find("option:selected").attr("uuid");
	        	var end_err = document.getElementById("paraMap1_CR_AGING_BEGIN_GROUP");
         	    if($("#paraMap1_CR_AGING_END_GROUP").val() == $("#paraMap1_CR_AGING_BEGIN_GROUP").val()){
         	        _alertValMsg(end_err,"<dict:lang value='老化开始工序不能跟老化结束工序相同'/>");
					$("#paraMap1_CR_AGING_BEGIN_GROUP").find("option[value='']").attr("selected",true);
					$("#paraMap1_CR_AGING_BEGIN_GROUP").trigger("chosen:updated");
         	    }
	        	addNonErgodic();
	        	var temp = canvasObj.validateBeforeNode(start,end);
	        	if (!temp) {
	         		_alertValMsg(end_err,"<dict:lang value='老化结束工序不能早于老化开始工序'/>");
					$("#paraMap1_CR_AGING_BEGIN_GROUP").find("option[value='']").attr("selected",true);
					$("#paraMap1_CR_AGING_BEGIN_GROUP").trigger("chosen:updated");
				}
         	}
        } 
        
        //老化结束工序
         function compareEND(){
         	if ("" != $("#paraMap1_CR_AGING_BEGIN_GROUP").val()) {
	         	var start = $("#paraMap1_CR_AGING_BEGIN_GROUP").find("option:selected").attr("uuid");
	         	var end = $("#paraMap1_CR_AGING_END_GROUP").find("option:selected").attr("uuid");
	        	var end_err = document.getElementById("paraMap1_CR_AGING_END_GROUP");
         	    if($("#paraMap1_CR_AGING_END_GROUP").val() == $("#paraMap1_CR_AGING_BEGIN_GROUP").val()){
         	        _alertValMsg(end_err,"<dict:lang value='老化开始工序不能跟老化结束工序相同'/>");
					$("#paraMap1_CR_AGING_END_GROUP").find("option[value='']").attr("selected",true);
					$("#paraMap1_CR_AGING_END_GROUP").trigger("chosen:updated");
         	    }
	        	addNonErgodic();
	        	var temp = canvasObj.validateBeforeNode(start,end);
	        	if (!temp) {
	         		_alertValMsg(end_err,"<dict:lang value='老化结束工序不能早于老化开始工序'/>");
					$("#paraMap1_CR_AGING_END_GROUP").find("option[value='']").attr("selected",true);
					$("#paraMap1_CR_AGING_END_GROUP").trigger("chosen:updated");
				}
         	}
        } 
        
        

        var url = "";
        function saveFlow(){
            
        	var res = validateProcedure();
        	if ( res == 101) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一个工序作为开始工序" />",0,"","");
					return false;
	        	}else if ( res == 102) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="仅允许一个工序作为开始工序" />",0,"","");
					return false;
	        	}else if ( res == 103) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择一个工序作为结束工序" />",0,"","");
					return false;
	        	}else if ( res == 104) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="仅允许一个工序作为结束工序" />",0,"","");
					return false;
	        	}else if ( res == 105) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="存在不连接的流程" />",0,"","");
					return false;
	        	}else if ( res == 106) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="开始工序只能为正常工序" />",0,"","");
					return false;
	        	}else if ( res == 107) {
	        		utilsFp.confirmIcon(1,"","","", "<dict:lang value="结束工序只能为正常工序" />",0,"","");
					return false;
	        	}else{
	        	    switchTag("tag2","content2","");
	        	}
        	if(ajaxFlag){
        	//url = routeService();
        	if($("#paraMap1_CR_ROUTE_FLAG_1").attr("checked")=="checked"){
				$("#paraMap1_CR_ROUTE_FLAG_1").val("Y");
			}else{
				$("#paraMap1_CR_ROUTE_FLAG_1").val("N");
			}
		/*	var data_auth = $("#data_auth").val();
        	var data_auth_err = document.getElementById("data_auth");
			if ("" == data_auth || null == data_auth) {
			    
				_alertValMsg(data_auth_err,"<dict:lang value='组织机构不能为空'/>");
				switchTag("tag1","content1","");
        		return false;
			}*/
        	var routeName_err = document.getElementById("paraMap1_CR_ROUTE_NAME");
        	var routeId_err = document.getElementById("paraMap1_CR_ROUTE_ID");
        	if($.trim($("#paraMap1_CR_ROUTE_ID").val()) == null || $.trim($("#paraMap1_CR_ROUTE_ID").val()) == ""){
				_alertValMsg(routeId_err,"<dict:lang value='流程编码不能为空'/>");
        		return false;
        	}else if($("#paraMap1_CR_ROUTE_ID").val().length > 40){
				_alertValMsg(routeId_err,"<dict:lang value='流程编码不能大于40个字符'/>");
        		return false;        		
        	}
        	else if($.trim($("#paraMap1_CR_ROUTE_NAME").val()) == null || $.trim($("#paraMap1_CR_ROUTE_NAME").val()) == ""){
				_alertValMsg(routeName_err,"<dict:lang value='流程名称不能为空'/>");
        		return false;
        	}else if($("#paraMap1_CR_ROUTE_NAME").val().length > 100){
				_alertValMsg(routeName_err,"<dict:lang value='流程名称不能大于100个字符'/>");
        		return false;        		
        	} 
        	
        	var routeId = $("#paraMap1_CR_ROUTE_ID").val();
        	var routeName = $("#paraMap1_CR_ROUTE_NAME").val();
        	var routeId_Str= routeId.replace(/\&/g, "%26");
        	var routeName_Str= routeName.replace(/\&/g, "%26");
        	var dataInfo= JSON.stringify(saveTopoInfo());
        	
        	
          $.ajax({
     			type: "POST",
     		    dataType: "json",
     		    //url:url,
     		    url: "${path}buss/bussModel_exeFunc.ms?funcMId=28d42176756342eb871dd6f2d0af60da",
     		    data: {
     		    	DATA_INFO: dataInfo,
     		    	ROUTE_COUNT: getRouteCount(),
     		    	CR_ROUTE_STEP: $("#paraMap1_CR_ROUTE_STEP").val(),
     		    	CR_ROUTE_ID: routeId_Str,
     		    	CR_ROUTE_NAME: routeName_Str,
     		    	CR_MO_OUTPUT: $("#paraMap1_CR_MO_OUTPUT").find("option:selected").val(),
     		    	CR_MO_OUTPUT_ORDER: $("#paraMap1_CR_MO_OUTPUT").find("option:selected").attr("order"),
     		    	CR_MO_INPUT: $("#paraMap1_CR_MO_INPUT").find("option:selected").val(),
     		    	CR_MO_INPUT_ORDER: $("#paraMap1_CR_MO_INPUT").find("option:selected").attr("order"),
     		    	CR_ROUTE_FLAG: $("#paraMap1_CR_ROUTE_FLAG_1").val(),
     		    	CR_PO_INPUT: $("#paraMap1_CR_PO_INPUT").find("option:selected").val(),
     		    	CR_PO_INPUT_ORDER: $("#paraMap1_CR_PO_INPUT").find("option:selected").attr("order"),
     		    	CR_PO_OUTPUT: $("#paraMap1_CR_PO_OUTPUT").find("option:selected").val(),
     		    	CR_PO_OUTPUT_ORDER: $("#paraMap1_CR_PO_OUTPUT").find("option:selected").attr("order"),
     		    	CR_ITEM_GROUP: $("#paraMap1_CR_ITEM_GROUP").find("option:selected").val(),
     		    	CR_ITEM_GROUP_ORDER: $("#paraMap1_CR_ITEM_GROUP").find("option:selected").attr("order"),
     		    	CR_FQC_GROUP: $("#paraMap1_CR_FQC_GROUP").find("option:selected").val(),
     		    	CR_FQC_GROUP_ORDER: $("#paraMap1_CR_FQC_GROUP").find("option:selected").attr("order"),
     		    	CR_IPQC_GROUP: $("#paraMap1_CR_IPQC_GROUP").find("option:selected").val(),
     		    	CR_IPQC_GROUP_ORDER: $("#paraMap1_CR_IPQC_GROUP").find("option:selected").attr("order"),
     		    	CR_AGING_BEGIN_GROUP: $("#paraMap1_CR_AGING_BEGIN_GROUP").find("option:selected").val(),
     		    	CR_AGING_BEGIN_GROUP_ORDER: $("#paraMap1_CR_AGING_BEGIN_GROUP").find("option:selected").attr("order"),
                    CR_AGING_END_GROUP: $("#paraMap1_CR_AGING_END_GROUP").find("option:selected").val(),
     		    	CR_AGING_END_GROUP_ORDER: $("#paraMap1_CR_AGING_END_GROUP").find("option:selected").attr("order"),
     		    	/*data_auth: data_auth,*/
        		    dataId: $("#dataId").val(),
        		    routeCode: $("#routeCode").val(),
     		    	flag: flag,
     		    	CREATE_USER: $("#CREATE_USER_S").val(),
     		    	CREATE_TIME: $("#CREATE_TIME_S").val()
     		    },
     			success: function(data){
     			        
     					util.closeLoading();
     					if(data.res!= null){
							utilsFp.confirmIcon(3,"","","", data.msg,0,"","");
						}else{
					          var iframeId = "${iframeId}";
        					  top.$("#"+iframeId)[0].contentWindow.reloadPg("<dict:lang value="保存成功" />","<dict:lang value="摩尔提示" />","200","150","3000","0");
					          parent.switchTabWithoutReload(iframeId.replace("iframe",""));
							  parent.closeTab(window.frameElement.name.replace("iframe",""));
					        }
								
     				},
     			error: function(msg){
     				if(msg.readyState!=0){
     					util.closeLoading();
     					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
     					
     				}
     			  }
     			});		
			}else{
				utilsFp.confirmIcon(3,"","","", "<dict:lang value='页面未加载完成' />",0,"","");
			}
        }
        
		//获取所有工序的顺序
		function getAllOrder(){
			var orderflag = document.getElementsByName("orderflag");
			var arr = [];
			for(var i=0;i<orderflag.length;i++){
				arr.push({
					key:orderflag[i].id,
					val:orderflag[i].value,
					name:orderflag[i].title
				});
			}
			return JSON.stringify(arr);
		}
        
        //关闭当前页并刷新列表
        function closeAndRefreshTab(){
        	var iframeId = "${iframeId}";
        	top.$("#"+iframeId)[0].contentWindow.reloadPg("<dict:lang value="保存成功" />","<dict:lang value="提示信息" />",200,150,3000);
  			parent.switchTabWithoutReload(iframeId.replace("iframe",""));
			parent.closeTab(window.frameElement.name.replace("iframe",""));
        }
        
        function popRouteDiv(showId,backId){
			document.getElementById(showId).style.display = 'block';
			document.getElementById(backId).style.display = 'block';
			$('.chosen-container').css("width","200px");
		}
		function hideDiv(showId,backId){
			$("#crcoStec").find("option[value='SMT']").attr("selected",true);
			$("#crcoStartGroup").find("option[value='']").attr("selected",true);
			$("#crcoEndGroup").find("option[value='']").attr("selected",true);
			$("#crcoStec").trigger("chosen:updated");
			$("#crcoStartGroup").trigger("chosen:updated");
			$("#crcoEndGroup").trigger("chosen:updated");
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
        	$("#paraMap1_CR_MO_INPUT_chosen").css("width","200px");
        	$("#paraMap1_CR_MO_OUTPUT_chosen").css("width","200px");
        	$("#paraMap1_CR_PO_INPUT_chosen").css("width","200px");
        	$("#paraMap1_CR_PO_OUTPUT_chosen").css("width","200px");
        	$("#paraMap1_CR_ITEM_GROUP_chosen").css("width","200px");
        	
        	$("#paraMap1_CR_AGING_BEGIN_GROUP_chosen").css("width","200px");
        	$("#paraMap1_CR_AGING_END_GROUP_chosen").css("width","200px");
		} 
		var id = "";
        function addRoute(showId,backId){
        	if ($("#crcoStartGroup").val()==null||$("#crcoStartGroup").val()=="") {
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="开始工序不能为空" />",0,"","");
				return false;
			}
			if($("#crcoEndGroup").val()==null||$("#crcoEndGroup").val()==""){
				utilsFp.confirmIcon(1,"","","", "<dict:lang value="结束工序不能为空" />",0,"","");
				return false;
			}
			var startId = $("#crcoStartGroup").find("option:selected").attr("uuid");
			var endId = $("#crcoEndGroup").find("option:selected").attr("uuid");
			var falg = true;
			$("#routetb").find("tr").each(function(i,item){
				if ($(item).length) {
					var start = $(item).find("input").eq(2).attr("uuid");
					var end = $(item).find("input").eq(3).attr("uuid");
					addNonErgodic();
	        		var temp1 = canvasObj.validateBeforeNode(startId,start);
	        		var temp2 = canvasObj.validateBeforeNode(startId,end);
	        		var temp3 = canvasObj.validateBeforeNode(endId,start);
	        		var temp4 = canvasObj.validateBeforeNode(endId,end);
	        		if ((!temp1 && temp2) || (!temp3 && temp4)) {
						falg = false;
					}
				}
				
			});
				if (falg) {
				//123456
		        	$("#addRoutelist").append("<tr></tr>");
		        	$("#addRoutelist tr:last").append("<td style='text-align: center;width: 10%;'><input type='checkbox' onclick='' /></td>");
		        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'><input type='text' disabled='disabled' id=\""+$("#crcoStec").val()+"\" value='"+$("#crcoStec").find("option:selected").text()+"' /></td>");
		        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'><input type='text' disabled='disabled' id=\""+$("#crcoStartGroup").val()+"\" uuid='"+$("#crcoStartGroup").find("option:selected").attr("uuid")+"' order='"+$("#crcoStartGroup").find("option:selected").attr("order")+"' value='"+$("#crcoStartGroup").find("option:selected").text()+"' /></td>");
		        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'><input type='text' disabled='disabled' id=\""+$("#crcoEndGroup").val()+"\" uuid='"+$("#crcoEndGroup").find("option:selected").attr("uuid")+"' order='"+$("#crcoEndGroup").find("option:selected").attr("order")+"' value='"+$("#crcoEndGroup").find("option:selected").text()+"' /></td>");
		        	
		        	$("#paraMap1_CR_MO_INPUT_chosen").css("width","200px");
		        	$("#paraMap1_CR_MO_OUTPUT_chosen").css("width","200px");
		        	$("#paraMap1_CR_PO_INPUT_chosen").css("width","200px");
		        	$("#paraMap1_CR_PO_OUTPUT_chosen").css("width","200px");
		        	$("#paraMap1_CR_ITEM_GROUP_chosen").css("width","200px");
		        	$("#paraMap1_CR_AGING_BEGIN_GROUP_chosen").css("width","200px");
		        	$("#paraMap1_CR_AGING_END_GROUP_chosen").css("width","200px");
					document.getElementById(showId).style.display = 'none';
					document.getElementById(backId).style.display = 'none';
					
				}else{
					utilsFp.confirmIcon(1,"","","", "<dict:lang value="统计工序不能交叉" />",0,"","");
				}
				
			$("#crcoStec").find("option[value='SMT']").attr("selected",true);
			$("#crcoStartGroup").find("option[value='']").attr("selected",true);
			$("#crcoEndGroup").find("option[value='']").attr("selected",true);
			$("#crcoStec").trigger("chosen:updated");
			$("#crcoStartGroup").trigger("chosen:updated");
			$("#crcoEndGroup").trigger("chosen:updated");
        }
        
      	function getAllRoute(){
			if($("#route_list_cb").attr("checked")=="checked"){
				$("#addRoutelist :checkbox").attr("checked",true);
			}else{
				$("#addRoutelist :checkbox").each(function(){
					$(this).attr("checked",false);
				});
			}
		}
        
        function delRouteRow(){
        	$("#addRoutelist :checkbox").each(function(){
				if($(this).attr("checked")){
					$(this).parents("tr").remove();
				}
			});
			$("#route_list_cb").attr("checked",false);
        }
        
        function getRouteCount(){
        	var routeCountArray = [];
        	$("#addRoutelist").find("tr").each(function(i,item){
				if ($(item).length) {
					routeCountArray.push({
						CrcoStecCount: $(item).find("input").eq(1).attr("id"),
						CrcoStartGroupCount: $(item).find("input").eq(2).attr("id"),
						CrcoStartGroupOrder: $(item).find("input").eq(2).attr("order"),
						CrcoEndGroupCount: $(item).find("input").eq(3).attr("id"),
						CrcoEndGroupOrder: $(item).find("input").eq(3).attr("order")
					});
				}
				
			});
				return JSON.stringify(routeCountArray);
        }
        
        
        </script>
   		<style type="text/css">
		.black_overlay{
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: #f8fcff;
			z-index: 1001;
			opacity:0.5;
			filter:alpha(opacity=88);	
		}
		.white_content{
			display: none;
			position: absolute;
			top: 25%;
			left: 25%;
			width: 30%;
			height: 34%;
			padding: 10px;
			border: 1px solid #cbe9ff;
			background-color: #f8fcff;
			z-index: 1002;
			overflow: auto;
		}
				
		.section{
			width:280px;
		}
		
		.basic-table .chosen-container{
			width:200px !important;
		}
		
		#PS tr .group {
            width: 350px;
        }

        #PS .group {
            display: inline-block;
            margin-left: 5px;
            padding-bottom: 0;
        }
	
	    #PS .group .name {
            width: 100px;
            overflow: hidden;
            line-height: 2;
        }
        
        #PS .group .dec {
            width: 250px;
            padding-left: 5px;
        }
        
		.mCSB_outside + .mCS-minimal.mCSB_scrollTools_vertical, .mCSB_outside + .mCS-minimal-dark.mCSB_scrollTools_vertical {
            right: -6px;
        }
        
        .mCS-minimal-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar, .mCS-minimal-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar {
            background-color: #dddcde;
        }
	</style>
</head>
<body>
  <div class="mod" style="height:100%;background-color:#f6f5f7;">
	<div class="dlist" style="height:100%;">
            <div class="hd" >
             	<div style="margin-left:40px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">-->
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>
            
			    <div class="optn">
			        <button type="button" onclick="saveFlow();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="padding:10px 20px;">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="iframeId" value="${iframeId}">
										<input type="hidden" name="dataId" id="dataId" value="${dataId}">
										<input type="hidden" name="CREATE_USER" id="CREATE_USER_S" value="${param.creatUser}">
										<input type="hidden" name="CREATE_TIME" id="CREATE_TIME_S" value="${param.creatTime}">
										<input type="hidden" name="routeCode" id="routeCode" value="${param.routeCode}">
										<input type="hidden" name="flag" id="flag" value="${param.flag}">
										<input type="hidden" name="formId" value="4930de89023b451385f973aed9882309" />
										<input type="hidden" id="group_falg" value="">
										<input type="hidden" id="line_falg" value="">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table id="select_id" style="display: none;">
											
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="4930de89023b451385f973aed9882309" type="add" />
			<bu:jsVal formId="4930de89023b451385f973aed9882309" formIndex="1" />
		<table class="basic-table" >
	<input type="hidden" name="formIds" value="4930de89023b451385f973aed9882309" />
	<input type="hidden" name="4930de89023b451385f973aed9882309" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'131b57af1381413ab6455da10eb9775f'" />
		<s:set name="_$formId_1" value="'4930de89023b451385f973aed9882309'" />
		<s:set name="_$type" value="'add'" />
			<tr>
				<td style="text-align: right;line-height: 25px;"/>
					<div class="section">
						<span class="dot">*</span><bu:uitn colNo="CR_ROUTE_ID" formId="4930de89023b451385f973aed9882309" />
						<bu:ui colNo="CR_ROUTE_ID" formId="4930de89023b451385f973aed9882309" value="%{CR_ROUTE_ID}" formIndex="1" style="width: 200px;"/>
					</div>
				</td>
		
				<td style="text-align: right;line-height: 25px;"/>
					<div class="section"> 
						<span class="dot">*</span><bu:uitn colNo="CR_ROUTE_NAME" formId="4930de89023b451385f973aed9882309" />
						<bu:ui colNo="CR_ROUTE_NAME" formId="4930de89023b451385f973aed9882309" value="%{CR_ROUTE_NAME}" formIndex="1" style="width: 200px;"/>
					</div>
						
				</td>
		    		<td style="text-align: right;line-height: 25px;"/>
		    			<div class="section" style="text-align: left;">
						<bu:uitn colNo="CR_ROUTE_STEP" formId="4930de89023b451385f973aed9882309" />
						<%-- <bu:ui colNo="CR_ROUTE_STEP" formId="4930de89023b451385f973aed9882309" value="%{CR_ROUTE_STEP}" formIndex="1" onchange="();" style="width: 200px;"/> --%>
						<bu:ui colNo="CR_ROUTE_STEP" formId="4930de89023b451385f973aed9882309" value="%{CR_ROUTE_STEP}" formIndex="1" style="width: 200px;"/>
					</div>
		    			
		    		</td>
				
				<td style="text-align: right;line-height: 25px;"/>
                        <div style="text-align: left;display:none" id="vflag">
    						<bu:uitn colNo="CR_ROUTE_FLAG" formId="4930de89023b451385f973aed9882309" />
    						<bu:ui colNo="CR_ROUTE_FLAG" formId="4930de89023b451385f973aed9882309" formIndex="1" />
						</div>
					    <div class="section" style="text-align: left;">
						    <div id="allRount" style="display:none;width:300px;left:80px;top:0px;">
					        <dict:lang value="复制流程"/>
                                <select id="allRountS"  class="IS_SELECT_FILTER dept_select" style="width:150px;" onchange="selectOneRount()">
                                    <option>--请选择--</option>
                                </select>	
                            </div>
					    </div>
					
				</td>
			</tr>	
	</table>
	
	</table>	
	<div class="js-tab">
		<DIV id="container">
			<DIV id="hd" style="height:36px;">
				<UL class="tab-list tab">
					<LI id="tag1">
		 				<A class="selectli1" onclick="switchTag('tag1','content1','${path}buss/bussModel.ms?exeid=f72a754bd2af4246a79dd94a1b271a8a');this.blur();" href="javascript:void(0);"> <SPAN ><dict:lang value="流程编辑" /></SPAN> </A>
					</LI>
					<LI id="tag2">
		 				<A class="" onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=f72a754bd2af4246a79dd94a1b271a8a');this.blur();" href="javascript:void(0);"> <SPAN ><dict:lang value="统计设置" /></SPAN> </A>
					</LI>
				</UL>
					<div class="operation">
				       
				        <ul>
				            <li onclick="gainPointType(this)" class="tool-con" title="指针工具"></li>
				            <li onclick="changeLineType('straight',this)" class="tool-con"  title="直线"></li>
				            <li onclick="changeLineType('broken',this)"  class="tool-con" title="折线"></li>
				            <li onclick="changeLineType('Uline',this)"  class="tool-con"  title="U型线" ></li>
				            <li onclick="foldingLine();"  class="tool-con" title="线体翻折"></li>
				            <li onclick="upClear();"  class="tool-con"  title="清空" ></li>
				            <li onclick="alignSide(1)" class="tool-con"  title="向左对齐"></li>
				            <li onclick="alignSide(2)"  class="tool-con"  title="向右对齐"  ></li> 
				            <li onclick="alignSide(3)"  class="tool-con"  title="向上对齐"></li>
				            <li onclick="alignSide(4)" class="tool-con"  title="向下对齐"></li>
				            <li onclick="changeSceneSize(1)"  class="tool-con"  title="放大"></li>
				            <li onclick="changeSceneSize(2)" class="tool-con"  title="缩小"></li>
				           
				        </ul>
				    </div>
			</DIV>
<DIV class="content1" id="content">	
	
			<DIV id="content1">
					<div id="contextmenu" style="width: 64px;">
	   	<ul style="list-style:none;margin:0px">	
	   			<li style="background: antiquewhite;width: 64px"><a>删除</a></li>
	   </ul>
	   </div>
	
	<select id="jtopoTextfield" style="display:none;width: 60px;position: absolute;" >
		<option value="Y">Y</option>
		<option value="N">N</option>
	</select>
	<table style="width:100%;margin-top:10px;" id="main">
		<tr>
			<td align="center" style="width:170px;">
		    <div  id="searchDiv">
		    </div>
			<div class="toolbar2" id="left" style="">
				<div class="pop-content" style="height: 60px">
					
			    </div>
			</div>
			</td>
			<td>
				
				<div id="content" >
						<div class="show-text">
							<div style="font-size: 15px;text-align:center">操作说明</div>
							<div style="font-size: 5px;">1.鼠标滚动键放大缩小功能</div>
							<div style="font-size: 5px;">2.鼠标点击空白部分可拖拽</div>
						</div>
					
    	            <canvas style="border: 1px solid #E4E4E4;margin-left:10px;box-sizing:border-box;" id="canvas" ondrop="drop(event)" ondragover="allowDrop(event)"></canvas>
				
                </div>				
			</td>
			<td style="width:200px;" >
				<div id="leftPanel"  ondrop="dropNo(event)" ondragover="allowDropNo(event)" style="border: 1px solid #E4E4E4;height: 450px;">
				    
				    <div class="attribute" id="paramPanel">
				        <div class="_head">属性信息</div>
				        <ul>
				            <li class='node-class-next'><label class="checkbox inline"><input type="checkbox" id="startProcedure" onClick="updateObject()"><span style=" font-size:13px;"> 开始工序</span></label></li>
				            <li class='node-class-next'><label class="checkbox inline"><input type="checkbox" id="endProcedure" onClick="updateObject()"><span style=" font-size:13px;"> 结束工序</span></label></li>
				            <li class='node-class-next'><span>工序类型</span><select id="processType" onchange="updateObject()" >
							<option value='1'>正常工序</option>
							<option value='0'>非管控工序</option>
							<option value='2'>可选工序</option>
							</select></li>
				            <li><span>选中工序</span><input type="text" id="pLabel" disabled='disabled'></li>
				            <li class='node-class-next'><span>文字位置</span><select id="pLabelPosition" onchange="updateObject()" class="null dept_select" style="display: none;">
									<option value='Top_Left'>顶部居左</option>
									<option value='Top_Center'>顶部居中</option>
									<option value='Top_Right'>顶部居右</option>
									<option value='Middle_Left'>中间居左</option>
									<option value='Middle_Center'>中间居中</option>
									<option value='Middle_Right'>中间居右</option>
									<option value='Bottom_Left'>底部居左</option>
									<option value='Bottom_Center'>底部居中</option>
									<option value='Bottom_Right'>底部居右</option>
								</select></li>
				            <li><span>显示字体</span><select id="pFont"  onchange="updateObject()" class="null dept_select" style="display: none;">
						        <option value='微软雅黑' >微软雅黑</option>
							    <option value='宋体'>宋体</option>
							    <option value='仿宋'>仿宋</option>
							    <option value='楷体'>楷体</option>
						    </select></li>
				            
				            <li><span>字体大小</span><input type="text" id="pFontSize" onblur="updateObject()"></li>
				            <li><span>线条粗细</span><input type="text" id="pLineSize" onblur="updateObject()" class="num-class"></li>
				            <li><span>线条颜色</span><input type="text" id="lineColor" class="jscolor {onFineChange:'updateColor(this)'}" value="000000" title="#000000"></li>
				            <li><span>箭头大小</span><input type="text" id="pLineArrow" onblur="updateObject()" class="num-class"></li>
				        </ul>
				    </div>
				</div>
			</td>
		</tr>		
	</table>
						
			</DIV>
		</DIV>
	<!-- tab3 -->		
<DIV id="content2"  style="display:none">
		<div class="mod-hd" style="width: 100%;margin-top: 1px;">		
		   <h3 class="tit"><dict:lang value="工序统计" /></h3>	
		</div>
	<table class="basic-table" id="PS" style="margin-top:5px;width:auto;">
	    <tr>
	        	<td>
	        	    <div class="group">
	                    <div class="name" ><bu:uitn colNo="CR_MO_INPUT" formId="4930de89023b451385f973aed9882309" /></div>
 	                    <div class="dec"><select id="paraMap1_CR_MO_INPUT" name="paraMap1@0#CR_MO_INPUT" style="width: 234px;" class="dept_select" onchange="compareMO();">
								<option value=''>--请选择--</option></select></div>
                    </div>
	        	</td>															
                <td>
	        	    <div class="group">
	                    <div class="name" ><bu:uitn colNo="CR_MO_OUTPUT" formId="4930de89023b451385f973aed9882309" /></div>
 	                    <div class="dec"><select id="paraMap1_CR_MO_OUTPUT" name="paraMap1@0#CR_MO_OUTPUT" style="width: 234px;" class="dept_select" onchange="compareMO_s();">
								<option value=''>--请选择--</option></select></div>
                    </div>
	        	</td>													
                <td>
	        	    <div class="group">
	                    <div class="name" ><bu:uitn colNo="CR_ITEM_GROUP" formId="4930de89023b451385f973aed9882309" /></div>
 	                    <div class="dec"><select id="paraMap1_CR_ITEM_GROUP" name="paraMap1@0#CR_ITEM_GROUP" style="width: 234px;" class="dept_select">
								<option value=''>--请选择--</option></select></div>
                    </div>
	        	</td>
	    </tr>
	    <tr>
	        		
			    <td>
	        	    <div class="group">
	                    <div class="name" ><bu:uitn colNo="CR_PO_INPUT" formId="4930de89023b451385f973aed9882309" /></div>
 	                    <div class="dec"><select id="paraMap1_CR_PO_INPUT" name="paraMap1@0#CR_PO_INPUT" style="width: 234px;" class="dept_select" onchange="comparePO();">
								<option value=''>--请选择--</option></select></div>
                    </div>
	        	</td>
	        	<td>
	        	    <div class="group">
	                    <div class="name" ><bu:uitn colNo="CR_PO_OUTPUT" formId="4930de89023b451385f973aed9882309" /></div>
 	                    <div class="dec"><select id="paraMap1_CR_PO_OUTPUT" name="paraMap1@0#CR_PO_OUTPUT" style="width: 234px;" class="dept_select" onchange="comparePO_s();">
								<option value=''>--请选择--</option></select></div>
                    </div>
	        	</td>
			    <td>
	        	    <div class="group">
	                    <div class="name" ><bu:uitn colNo="CR_FQC_GROUP" formId="4930de89023b451385f973aed9882309" /></div>
 	                    <div class="dec"><select id="paraMap1_CR_FQC_GROUP" name="paraMap1@0#CR_FQC_GROUP" style="width: 234px;" class="dept_select">
								<option value=''>--请选择--</option></select></div>
                    </div>
	        	</td>
	    </tr>
		<tr>
		    <td>
	        	    <div class="group">
	                    <div class="name" ><bu:uitn colNo="CR_IPQC_GROUP" formId="4930de89023b451385f973aed9882309" /></div>
 	                    <div class="dec"><select id="paraMap1_CR_IPQC_GROUP" name="paraMap1@0#CR_IPQC_GROUP" style="width: 234px;" class="dept_select">
								<option value=''>--请选择--</option></select></div>
                    </div>
	        	</td>
	        	<td>
	        	    <div class="group">
	                    <div class="name" ><bu:uitn colNo="CR_AGING_BEGIN_GROUP" formId="4930de89023b451385f973aed9882309" /></div>
 	                    <div class="dec"><select id="paraMap1_CR_AGING_BEGIN_GROUP" name="paraMap1@0#CR_AGING_BEGIN_GROUP" style="width: 234px;" class="dept_select" onchange="compareBEGIN();">
								<option value=''>--请选择--</option></select></div>
                    </div>
	        	</td>
	        	<td>
	        	    <div class="group">
	                    <div class="name" ><bu:uitn colNo="CR_AGING_END_GROUP" formId="4930de89023b451385f973aed9882309" /></div>
 	                    <div class="dec"><select id="paraMap1_CR_AGING_END_GROUP" name="paraMap1@0#CR_AGING_END_GROUP" style="width: 234px;" class="dept_select" onchange="compareEND();">
								<option value=''>--请选择--</option></select></div>
                    </div>
	        	</td>
		</tr>
	</table>	
		
				 	<div>
						
	<div style="width: 100%;">
		<div class="mod-hd">		
		   <h3 class="tit"><dict:lang value="段别统计" /></h3>	
		   	<div class="extend-btn" style="float: right;margin-top: 10px;">
				<button type="button" onclick="popCrcoStecDiv('addCrcoStecpop','addCrcoStecshadow');" style="padding: 0;"><i class="ico ico-kl-new-add ico-small" title="新增"></i></button>
				<!-- <button type="button" onclick="popRouteDiv('addRoute','backi');"><i class="ico ico-kl-new-add ico-small" title="新增"></i></button> -->
				<button type="button" onclick="delRouteRow();"><i class="ico ico-sc-new-add ico-small" title="删除"></i></button>	        
			</div>
		</div>
		<table class="dlist-table table-line " id="routetb" width="100%;" style="margin-top:5px;">
							<thead>
								<tr class="thcolor">
									<th style="text-align: center;width: 10%;"><input type="checkbox" id="route_list_cb" onchange="getAllRoute();"  /></th >
									<th style="width: 30%;text-align: center;"><dict:lang value="统计段别" /></th >
									<th style="width: 30%;text-align: center;"><dict:lang value="开始工序" /></th >
									<th style="width: 30%;text-align: center;"><dict:lang value="结束工序" /></th >
								</tr>
							</thead>
							<tbody id="addRoutelist">
							</tbody>
						</table><br/>
	</div>
		</div>
		</DIV>
		
		
			
		</DIV>
	</div>
			
			
			
									</form>
			</div>
		
	</div>
</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<div class="dialog dialog-s1" id="addCrcoStecpop" style="display:none;z-index:1030;margin-left:0px;left:250px;top:190px;width:391px;height:240px;" >
		<div class="dialog-hd">
		<h3 class="tit"><dict:lang value="阶别统计"/></h3>
		</div>	
		<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addCrcoStecpop','addCrcoStecshadow');"></a>
		<div class="dialog-bd-div" style="width:100%;height:220px;">
		<div class="optn optn_div">
			<button type="button" onclick="addRoute('addCrcoStecpop','addCrcoStecshadow');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			<button type="button" onclick="hideDiv('addCrcoStecpop','addCrcoStecshadow');"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
		</div>
		<table class="basic-table" style="width: 100%;">
			<tbody id="routeTbody">
				<tr >
					<td style="width: 29%;text-align: right"><span class="dot">*</span><dict:lang value="统计段别"/></td>
					<td class="dec"><dict:selectDict id="crcoStec" name="crcoStec" dictCode="CRCO_STEC" style="width:230px;" cssClass="dept_select"/></td>
				</tr>
				<tr>
					<td style="width: 29%;text-align: right"><span class="dot">*</span><dict:lang value="开始工序"/></td>
					<td class="dec"><select id="crcoStartGroup" name="crcoStartGroup" style="width: 230px;" class="dept_select" onchange="compareEG();">
															<option value=''>--请选择--</option></select></td>
				</tr>
				<tr>
					<td style="width: 29%;text-align: right"><span class="dot">*</span><dict:lang value="结束工序"/></td>
					<td class="dec"><select id="crcoEndGroup" name="crcoEndGroup" style="width: 230px;" class="dept_select" onchange="compareEG_s();">
															<option value=''>--请选择--</option></select></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="dialog-mask" id="addCrcoStecshadow" style="z-index:1029"></div>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>	
	
	
<bu:submit viewId="131b57af1381413ab6455da10eb9775f" />
<bu:script viewId="131b57af1381413ab6455da10eb9775f" />

<script type="text/javascript">
	
	function popCrcoStecDiv(showId,backId){
		$("#"+showId+",#"+backId).show();
		$("#"+showId).draggable();
		$('.chosen-container').css("width","230px");
	}
	
	function hideDiv(showId,backId){
		$("#"+showId+",#"+backId).hide();
	}
		
	function initHeight(){
	    var height = $(window).height() - 50 - 37 - 46 - 30; 
	    console.log("height::"+height);
		$('#left').css('height',height + 'px');
		$('#canvas').attr('height',height);
		$('#canvas').attr('width',$(window).width() - 42 - 170 - 202 - 20);
		$('#leftPanel').css('height',height + 'px');
		var widthValue=$("#canvas").width()+40;
		var heightValue=$("#canvas").height()+50;
	    $(".show-text").css("left",widthValue);
	    $(".show-text").css("top",heightValue);
	}
	
	$(function(){		
       
		initHeight(); 
		$("#pFont_chosen").attr("style","width:100px;");
		$("#pLabelPosition_chosen").attr("style","width:100px");
		
	})
	
	 $(window).resize(function(){
		initHeight();
	});
	
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		
	}//初始化方法
	
	//保存统计设置所选择的工序，tab切换后回填
	var crMoInputEcoh,crMoOutputEcoh,crPoInputEcoh,crPoOutputEcoh,crItemGroupEcoh,crFqcGroupEcoh,crIpqcGroupEcoh,crIBeginGroupEcoh,crIEndGroupEcoh;
	function statisticsEcoh(){
		crMoInputEcoh = $("#paraMap1_CR_MO_INPUT").val();
		crMoOutputEcoh = $("#paraMap1_CR_MO_OUTPUT").val();
		crPoInputEcoh = $("#paraMap1_CR_PO_INPUT").val();
		crPoOutputEcoh = $("#paraMap1_CR_PO_OUTPUT").val();
		crItemGroupEcoh = $("#paraMap1_CR_ITEM_GROUP").val();
		crFqcGroupEcoh = $("#paraMap1_CR_FQC_GROUP").val();
		crIpqcGroupEcoh = $("#paraMap1_CR_IPQC_GROUP").val();
		crIBeginGroupEcoh = $("#paraMap1_CR_AGING_BEGIN_GROUP").val();
		crIEndGroupEcoh = $("#paraMap1_CR_AGING_END_GROUP").val();
	}
	
	function Map() {   
    //向MAP中增加元素（key, value)   
    this.put = function(_key, _value) {  
        this.elements.push( {  
            key : _key,  
            value : _value  
        });  
    };  
    //删除指定KEY的元素，成功返回True，失败返回False  
    this.remove = function(_key) {  
        var bln = false;  
        try {  
            for (i = 0; i < this.elements.length; i++) {  
                if (this.elements[i].key == _key) {  
                    this.elements.splice(i, 1);  
                    return true;  
                }  
            }  
        } catch (e) {  
            bln = false;  
        }  
        return bln;  
    };  
    //获取指定KEY的元素值VALUE，失败返回NULL  
    this.get = function(_key) {  
        try {  
            for (i = 0; i < this.elements.length; i++) {  
                if (this.elements[i].key == _key) {  
                    return this.elements[i].value;  
                }  
            }  
        } catch (e) {  
            return null;  
        }  
    };  
}

	
	//统计设置时的校验
	function statisticsCheckout(inGroupId, outGroupId){
		if(inGroupId!=""&&outGroupId!=""){
			var key = null;
			if (inGroupId != outGroupId) {
				key = groupThisMap.get(outGroupId);
					if (key != undefined && key != orderfalg) {
						groupThisMap.remove(outGroupId);
						statisticsCheckout(inGroupId, key);
					}else{
						thisGroupFlag = false;
					}
			}else{
						thisGroupFlag = true;
					}
		}
		return thisGroupFlag;
	}

$("#paraMap1_CR_ROUTE_STEP").change(function(){
    getAllRountSelect();
   // cleanScene();
});
function getAllRountSelect(){
            var crStep = $("#paraMap1_CR_ROUTE_STEP").val();
            var dataId='${dataId}';
			$.ajax({
        			type: "POST",
        		    dataType: "json",
        		    url: "buss/bussModel_exeFunc.ms?funcMId=5a1da8cbc20c49f1b9722aecb9ccce3d",
        		    data:{
        		    "crStep":crStep,
        		    "dataId":dataId      
        		    },
        			success: function(data){
        			    var resList = data.ajaxList;
        			    $("#allRountS").empty();
        			    $("#allRountS").append("<option>--请选择--</option>"); 
        			    for(var i=0;i<resList.length;i++){
        			      $("#allRountS").append("<option value='"+resList[i].CR_ROUTE_ID+"'>"+resList[i].CR_ROUTE_NAME+"</option>");  
        			    }
        			    $("#allRountS").trigger("chosen:updated");
        			},error:function(msg){
        			    
        			} 
        			})
}	
function selectOneRount(){
		 	util.showTopLoading();
        	ajaxFlag = false;
        	//$("#left").empty();
        	//$("#data_auth").empty();
        	//$("#canvas").remove();
        	cleanScene();
			$.ajax({
        			type: "POST",
        		    dataType: "json",
        		    url: "buss/bussModel_exeFunc.ms?funcMId=0618c381a3914dc29931f2fd3574eb6d&flag=edit",
        		    data: {
        		    	dataId: $("#dataId").val(),
        		    	routeCode: $("#allRountS").val()
        		    },
        			success: function(data){
        				if(null != data.res){
							if ("error" == data.res) {
							    util.closeLoading();
								utilsFp.confirmIcon(3,"","","", data.msg,0,"300","");
								return ;
							}
						}
    							//加载流程信息
							var flowList = data.flowList;
							console.log(flowList);
							if(flowList != null && flowList != ""){
								//$("#paraMap1_CR_ROUTE_ID").val(flowList[0].CR_ROUTE_ID);
								//$("#paraMap1_CR_ROUTE_ID").attr("disabled","disabled");
								//$("#paraMap1_CR_ROUTE_NAME").val(flowList[0].CR_ROUTE_NAME);
								$("#paraMap1_CR_ROUTE_STEP").val(flowList[0].CR_ROUTE_STEP);
								$("#paraMap1_CR_ROUTE_STEP").find("option[value=\""+flowList[0].CR_ROUTE_STEP+"\"]").attr("selected",true);
								$("#paraMap1_CR_ROUTE_STEP").trigger("chosen:updated");
								if ("Y" == flowList[0].CR_ROUTE_FLAG) {
									$("#paraMap1_CR_ROUTE_FLAG_1").attr("checked",true);
								}else{
									$("#paraMap1_CR_ROUTE_FLAG_1").attr("checked",false);
								}
								$("#data_auth").find("option[value=\""+flowList[0].DATA_AUTH+"\"]").attr("selected",true);
								$("#data_auth").trigger("chosen:updated");
								crMoInputEcoh = flowList[0].CR_MO_INPUT;
								crMoOutputEcoh = flowList[0].CR_MO_OUTPUT;
								crPoInputEcoh = flowList[0].CR_PO_INPUT;
								crPoOutputEcoh = flowList[0].CR_PO_OUTPUT;
								crItemGroupEcoh = flowList[0].CR_ITEM_GROUP;
								crFqcGroupEcoh = flowList[0].CR_FQC_GROUP;
								crIpqcGroupEcoh = flowList[0].CR_IPQC_GROUP;
								crIBeginGroupEcoh =flowList[0].CR_AGING_BEGIN_GROUP;
								crIEndGroupEcoh = flowList[0].CR_AGING_END_GROUP;
								
							    //dataInfo= JSON.stringify(saveTopoInfo());
								//nodeData=flowList.CR_BLOCKS_MSG;
								
								
								//回显流程图
								if(flowList[0].CR_BLOCKS_MSG!=null && flowList[0].CR_BLOCKS_MSG!=""){
								   //alert(flowList[0].CR_BLOCKS_MSG);
								   showTopoData(flowList[0].CR_BLOCKS_MSG); 
								   getData();
								   setCountData();
								    //getRoute();
								}
								
							}else{
	     						utilsFp.confirmIcon(1,"","","", "未查询到流程信息",0,"300","");
							}
							//加载流程统计设置信息
							var countList = data.countList;
							if(countList != null && countList != ""){
								for ( var i = 0; i < countList.length; i++) {
									var step = $("#crcoStec").find("option[value=\""+countList[i].CRCO_STEP+"\"]").text();
						        	$("#addRoutelist").append("<tr></tr>");
						        	$("#addRoutelist tr:last").append("<td style='text-align: center;width: 10%;'><input type='checkbox' onclick='' /></td>");
						        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'><input type='text' disabled='disabled' id=\""+countList[i].CRCO_STEP+"\" value='"+step+"' /></td>");
						        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'><input type='text' disabled='disabled' id=\""+countList[i].CRCO_START_GROUP+"\" uuid='' order='"+countList[i].CRCO_START_SEQ+"' value='"+countList[i].CRCO_START_NAME+"' /></td>");
						        	$("#addRoutelist tr:last").append("<td style='width: 30%;text-align: left;'><input type='text' disabled='disabled' id=\""+countList[i].CRCO_END_GROUP+"\" uuid='' order='"+countList[i].CRCO_END_SEQ+"' value='"+countList[i].CRCO_END_NAME+"' /></td>");
		        	
        						}
							}
                        util.closeLoading();
                        ajaxFlag = true;
        			    },error: function(msg){
        			        alert(msg);
        			        util.closeLoading();
        			    }
        			
			    })
			}	
			
			function getRoute(){
			    console.log("Sssssssssssswwwwwwwwwwwwwwwwww");
			    if ($("#paraMap1_CR_MO_INPUT").find("option[value="+crMoInputEcoh+"]").length) {
					$("#paraMap1_CR_MO_INPUT").find("option[value="+crMoInputEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_MO_INPUT").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_MO_OUTPUT").find("option[value="+crMoOutputEcoh+"]").length) {
					$("#paraMap1_CR_MO_OUTPUT").find("option[value="+crMoOutputEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_MO_OUTPUT").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_PO_INPUT").find("option[value="+crPoInputEcoh+"]").length) {
					$("#paraMap1_CR_PO_INPUT").find("option[value="+crPoInputEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_PO_INPUT").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_PO_OUTPUT").find("option[value="+crPoOutputEcoh+"]").length) {
					$("#paraMap1_CR_PO_OUTPUT").find("option[value="+crPoOutputEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_PO_OUTPUT").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_ITEM_GROUP").find("option[value="+crItemGroupEcoh+"]").length) {
					$("#paraMap1_CR_ITEM_GROUP").find("option[value="+crItemGroupEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_ITEM_GROUP").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_FQC_GROUP").find("option[value="+crFqcGroupEcoh+"]").length) {
					$("#paraMap1_CR_FQC_GROUP").find("option[value="+crFqcGroupEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_FQC_GROUP").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_IPQC_GROUP").find("option[value="+crIpqcGroupEcoh+"]").length) {
					$("#paraMap1_CR_IPQC_GROUP").find("option[value="+crIpqcGroupEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_IPQC_GROUP").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_AGING_BEGIN_GROUP").find("option[value="+crIBeginGroupEcoh+"]").length) {
					$("#paraMap1_CR_AGING_BEGIN_GROUP").find("option[value="+crIBeginGroupEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_AGING_BEGIN_GROUP").find("option[value='']").attr("selected",true);
				}
				if ($("#paraMap1_CR_AGING_END_GROUP").find("option[value="+crIEndGroupEcoh+"]").length) {
					$("#paraMap1_CR_AGING_END_GROUP").find("option[value="+crIEndGroupEcoh+"]").attr("selected",true);
				}else{
					$("#paraMap1_CR_AGING_END_GROUP").find("option[value='']").attr("selected",true);
				}
					$("#paraMap1_CR_MO_OUTPUT").trigger("chosen:updated");
        	$("#paraMap1_CR_MO_INPUT").trigger("chosen:updated");
        	$("#paraMap1_CR_PO_INPUT").trigger("chosen:updated");
        	$("#paraMap1_CR_PO_OUTPUT").trigger("chosen:updated");
        	$("#paraMap1_CR_ITEM_GROUP").trigger("chosen:updated");
        	$("#paraMap1_CR_FQC_GROUP").trigger("chosen:updated");
        	$("#paraMap1_CR_IPQC_GROUP").trigger("chosen:updated");
        	$("#crcoStartGroup").trigger("chosen:updated");
        	$("#crcoEndGroup").trigger("chosen:updated");
        	$("#paraMap1_CR_AGING_BEGIN_GROUP").trigger("chosen:updated");
        	$("#paraMap1_CR_AGING_END_GROUP").trigger("chosen:updated");
			} 
	
</script>

<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.attribute>ul');
  })
})(jQuery)</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

