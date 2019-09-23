<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>

<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title>${title}</title>
<style>
	.input{
		width:200px !important;
	}
</style>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
	<jsp:param name="html5" value="1" />
		<jsp:param name="workFlow" value="1" />
		<jsp:param name="spectrum" value="1" />
</jsp:include>
<link href="${path}plf/page/common/msui/css/css_tab.css"
	rel="stylesheet" type="text/css" />
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 

<script src="${path}plf/js/jsPlumb/newWorkflowchart.js"></script>   
<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
<script src="${path}plf/js/jsPlumb/flow/topo.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/businessTopo.js"></script>
	<script type="text/javascript" src="${path}plf/js/jsPlumb/flow/jtopo-min.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/jscolor.js"></script>
	<script src="${path}plf/js/jsPlumb/flow/toHex.js"></script>
	
	<style type="text/css">
	.x-fieldset{border:1px solid #00bfff;padding:10px;margin-botton:10px;display:block;height: 100%}
	.devicetable { table-layout: fixed;}
	.devicetd {
    overflow:hidden;
    white-space:nowrap;
    text-overflow:ellipsis;
    -o-text-overflow:ellipsis;
    -moz-text-overflow: ellipsis;
    -webkit-text-overflow: ellipsis;
}
#block2 td,#block3 td,#block4 td,#block5 td{
border:1px solid #ccc;
}
	</style>
<script type="text/javascript">

	$(function(){
		initContext();//初始化内容
		scene.mousedrag(function(event) {
			scene.translateX=0;
			scene.translateY=0;
			
		})
		billingButton();//绑定按钮事件
	});

	var loaded = 1;
	var tab_len = 5;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
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
				/* if ("" != url) {
						currentIframe = document.getElementById("iframe" + i).contentWindow;
						if (typeof (currentIframe.loadedState) == "undefined"
								&& currentIframe.loadedState != false
								&& tabs.indexOf(tag) == -1) {//第一次点击才加载
							//document.getElementById("iframe" + i).src = url;
							tabs += tag + ";";
							if (document.getElementById("iframe" + i).contentWindow.query) {
								document.getElementById("iframe" + i).contentWindow
										.query(this);
							} else {
								document.getElementById("iframe" + i).src = url;
							}
						}
					}  */
				dynIframesize("iframe" + i);
			} else {
			    
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
		if(tag=="tag2"){
		    	var caId = $("#paraMapObj_PM_TECH_SN").val();
		    
		    	if(null!=caId ||　caId!=""){
		    	    queryRoute(caId);
		    	}
			
		}
	}

	var iframehide = "yes";
	function dynIframesize(frameId) {
		if (document.getElementById) {
			dyniframe = document.getElementById(frameId);
			if (dyniframe && !window.opera) {
				dyniframe.style.display = "block";
				if (dyniframe.contentDocument
						&& dyniframe.contentDocument.body.offsetHeight) {
					//dyniframe.height = dyniframe.contentDocument.body.offsetHeight+10;//全显示
					dyniframe.height = getViewportHeight() - 38;
				} else {
					if (dyniframe.Document
							&& dyniframe.Document.body.scrollHeight) {
						//dyniframe.height = dyniframe.Document.body.scrollHeight;//全显示
						dyniframe.height = getViewportHeight() - 38;
					}
				}
			}
		}
		if ((document.all || document.getElementById) && iframehide == "no") {
			var tempobj = document.all ? document.all[iframeids[i]] : document
					.getElementById(iframeids[i]);
			tempobj.style.display = "block";
		}

	}

	function _dynIframesize() {
		var tabIndex = 1;
		if (null != currentTag && "" != currentTag) {
			tabIndex = currentTag.substr(3, currentTag.length);
		}
		dynIframesize("iframe" + tabIndex);
	}

	if (window.addEventListener) {
		window.addEventListener("resize", _dynIframesize, false);
	} else {
		if (window.attachEvent) {
			window.attachEvent("onresize", _dynIframesize);
		} else {
			window.onresize = _dynIframesize;
		}
	}

	function query() {
		if (iframe1.window.query != undefined) {
			iframe1.window.query(this);
		}
		if (iframe2.window.query != undefined) {
			iframe2.window.query(this);
		}

	}

	//初始化iframe
	function intIframe() {
		//switchTag('tag2', 'content2', '');
		switchTag('tag1', 'content1', '');

	}

	$(function() {
		intIframe();

	});
	function checkbox_disabled(){
	$("#device tr").each(function(){
	var checkid = "";
	var trid = $(this).attr("id");
	var trval = $(this).attr("value");
	
	if(trval =="1" || trval =="2" || trval =="3"){
	checkid = trid.replace("TR","CK");
	$("#"+checkid).attr("disabled",true);
	}else{
	checkid = trid.replace("TR","CK");
	$("#"+checkid).attr("disabled",false);
	}
	});
	
	}
	var eqObj="";
	function add_device(){
	var area = $("#paraMapObj_PM_AREA_SN_chosen").find("span").text();
	var areaval = "";
	$("#paraMapObj_PM_AREA_SN option").each(function(){
	if($(this).text() == area){
	areaval = $(this).val();
	}
	});
	var getdevurl ="${path}buss/bussModel_exeFunc.ms?funcMId=620e59bd47b34621966c8518b0cdabc2&type=2";
	  var dataAuthId ='${param.dataAuthId}';
	util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:getdevurl,
			    data:{
			     "areaval":areaval  ,
			      "dataAuthId":dataAuthId
			    },
				success: function(data){
						util.closeLoading();
						if(null != data.ajaxMap){
						    $("#areaStep").val(data.ajaxMap.CA_PROJECT_STEP);
						    $("#trackFlag").val(data.ajaxMap.CA_TRACK_FLAG);
						    /*****2018/06/12轨道判断*****/
						    if(data.ajaxMap.CA_TRACK_FLAG=="Y"){
						        $("#paraMapObj_PMO_TRACK option[value='S']").remove();
						        $("#paraMapObj_PMO_TRACK").removeAttr("disabled");
						        $("#paraMapObj_PMO_TRACK").attr("class","_VAL_NULL  input isSubmit  _VAL_OjbsData  isaddSubmit dept_select");
						        $("#paraMapObj_PMO_TRACK").trigger("chosen:updated");
						    }else if(data.ajaxMap.CA_TRACK_FLAG=="N"){
						        $("#paraMapObj_PMO_TRACK").append("<option value='S'><dict:lang value='单轨' /></option>");
						        $("#paraMapObj_PMO_TRACK").val("S");
						        $("#paraMapObj_PMO_TRACK").attr("disabled","disabled");
						        $("#paraMapObj_PMO_TRACK").trigger("chosen:updated");
						    }else{
						        $("#paraMapObj_PMO_TRACK").attr("disabled","disabled");
						        $("#paraMapObj_PMO_TRACK").trigger("chosen:updated");
						    }
						    /*********/
						}else{
						    $("#areaStep").val("");
						    $("#trackFlag").val("");
						}
						if(null == data.ajaxList){ 
				                $("#device").empty();
				                return ;}
						if(null != data.ajaxList){
							$("#device").empty();
							for(var i = 0;i < data.ajaxList.length; i++){
							     eqObj= data.ajaxList[i];
							    $("#device").append("<tr style='cursor: pointer;'  id='TR"+(i+1)+"' value='"+data.ajaxList[i].PDO_TYPE+"'></tr>");
						            $("#device tr:last").append("<td class='devicetd' style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
						            $("#device tr:last").append("<td class='devicetd' style='width: 30px;text-align: center;'><input type='checkbox' id='CK"+(i+1)+"' name='"+data.ajaxList[i].ID+"' onclick='cc(this);' value='"+data.ajaxList[i].ID+"'  /><input type='hidden' name='checked' id='checked"+data.ajaxList[i].ID+"' value='N'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 101px;text-align: center;'>"+data.ajaxList[i].CD_DEVICE_SN+"<input type='hidden' name='devsn' id='CD_DEVICE_SN"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CD_DEVICE_SN+"'/><input type='hidden' name='devseq' id='CD_DEVICE_SEQ"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CAD_DEVICE_SEQUENCE+"'/></td>"); 
							    $("#device tr:last").append("<td class='devicetd' style='width: 122px;text-align: center;'>"+data.ajaxList[i].CD_DEVICE_NAME+"<input type='hidden' name='devname' id='CD_DEVICE_NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CD_DEVICE_NAME+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 113px;text-align: center;'>"+data.ajaxList[i].VALUE+"<input type='hidden' name='devclass' id='CD_DEVICE_CLASS"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].VALUE+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 100px;text-align: center;'>"+data.ajaxList[i].CAD_DEVICE_SEQUENCE+"<input type='hidden' id='DEV"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].DEVID+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 68px;text-align: center;'>"+data.ajaxList[i].STATUS+"<input type='hidden' name='pdotype' id='PDO_TYPE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].PDO_TYPE+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 105px;text-align: center;'>"+data.ajaxList[i].CA_ID+"<input type='hidden' name='ca_id' id='CA_ID"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CA_ID+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 60px;text-align: center;'>"+data.ajaxList[i].CA_TRACK+"<input type='hidden' name='ca_track' id='CA_TRACK"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CA_TRACK+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 103px;text-align: center;'>"+(data.ajaxList[i].PDO_NUMBER==null?"":data.ajaxList[i].PDO_NUMBER)+"<input type='hidden' name='pdonumber' id='PDO_NUMBER"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].PDO_NUMBER+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 101px;text-align: center;'>"+(data.ajaxList[i].PDO_MODEL_CODE==null?"":data.ajaxList[i].PDO_MODEL_CODE)+"<input type='hidden' name='pdomodelcode' id='PDO_MODEL_CODE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].PDO_MODEL_CODE+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 150px;text-align: center;'>"+(data.ajaxList[i].FACE=="空"?"":data.ajaxList[i].FACE)+"<input type='hidden' name='pdoface' id='PDO_PROCESS_FACE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].PDO_PROCESS_FACE+"'/></td>");   
	
							}
							
							checkbox_disabled();
							var tableTrJs = $("#device tr");_tongLineColor(tableTrJs);
							clickTr('device');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1231");
							var tableLength =  $("#device").find("tr").length;	
                           
							if(tableLength>=1){
							   $("#allSelects").attr("checked","checked");
							    getAllItems(); 
							}else{
							     $("#allSelects").attr("checked",false);
							}
							
						}
					},
				error: function(XMLHttpRequest, textStatus, errorThrown){
                  util.closeLoading();
                  var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
                  if (null != sessionstatus && sessionstatus == "noAuthority") {
                  }else{
                    utilsFp.confirmIcon(3, "", "", "", "error:" + errorThrown, 0, "300", "");
                  }
         }
				});
				

	}
	/*****2018/06/12双轨道获取设备******/
	function getTrackDevice(){
	    var areaSn = $("#paraMapObj_PM_AREA_SN").val();
	    var track = $("#paraMapObj_PMO_TRACK").val();
	    var getdevurl ="${path}buss/bussModel_exeFunc.ms?funcMId=620e59bd47b34621966c8518b0cdabc2&type=1&areaval="+areaSn+"&track="+track;
	util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:getdevurl,
			    data: "",
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxList){ 
				                $("#device").empty();
				                return ;}
						if(null != data.ajaxList){
							$("#device").empty();
							for(var i = 0;i < data.ajaxList.length; i++){
							     eqObj= data.ajaxList[i];
							    $("#device").append("<tr style='cursor: pointer;'  id='TR"+(i+1)+"' value='"+data.ajaxList[i].PDO_TYPE+"'></tr>");
						            $("#device tr:last").append("<td class='devicetd' style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
						            $("#device tr:last").append("<td class='devicetd' style='width: 30px;text-align: center;'><input type='checkbox' id='CK"+(i+1)+"' name='"+data.ajaxList[i].ID+"' onclick='cc(this);' value='"+data.ajaxList[i].ID+"'  /><input type='hidden' name='checked' id='checked"+data.ajaxList[i].ID+"' value='N'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 101px;text-align: center;'>"+data.ajaxList[i].CD_DEVICE_SN+"<input type='hidden' name='devsn' id='CD_DEVICE_SN"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CD_DEVICE_SN+"'/><input type='hidden' name='devseq' id='CD_DEVICE_SEQ"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CAD_DEVICE_SEQUENCE+"'/></td>"); 
							    $("#device tr:last").append("<td class='devicetd' style='width: 122px;text-align: center;'>"+data.ajaxList[i].CD_DEVICE_NAME+"<input type='hidden' name='devname' id='CD_DEVICE_NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CD_DEVICE_NAME+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 113px;text-align: center;'>"+data.ajaxList[i].VALUE+"<input type='hidden' name='devclass' id='CD_DEVICE_CLASS"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].VALUE+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 113px;text-align: center;'>"+data.ajaxList[i].CAD_DEVICE_SEQUENCE+"</td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 68px;text-align: center;'>"+data.ajaxList[i].STATUS+"<input type='hidden' name='pdotype' id='PDO_TYPE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].PDO_TYPE+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 105px;text-align: center;'>"+data.ajaxList[i].CA_ID+"<input type='hidden' name='ca_id' id='CA_ID"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CA_ID+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 103px;text-align: center;'>"+(data.ajaxList[i].PDO_NUMBER==null?"":data.ajaxList[i].PDO_NUMBER)+"<input type='hidden' name='pdonumber' id='PDO_NUMBER"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].PDO_NUMBER+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 101px;text-align: center;'>"+(data.ajaxList[i].PDO_MODEL_CODE==null?"":data.ajaxList[i].PDO_MODEL_CODE)+"<input type='hidden' name='pdomodelcode' id='PDO_MODEL_CODE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].PDO_MODEL_CODE+"'/></td>");
							    $("#device tr:last").append("<td class='devicetd' style='width: 150px;text-align: center;'>"+(data.ajaxList[i].FACE=="空"?"":data.ajaxList[i].FACE)+"<input type='hidden' name='pdoface' id='PDO_PROCESS_FACE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].PDO_PROCESS_FACE+"'/></td>");   
	
							}
							checkbox_disabled();
							var tableTrJs = $("#device tr");_tongLineColor(tableTrJs);
							clickTr('device');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1231");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});
	}
	/************/
	 var bomObj="";
	function showBow(){
		util.showLoading("处理中...");
		var getbomurl="${path}buss/bussModel_exeFunc.ms?funcMId=e43d388e9d214f1ab7fe8a7641167831&formId=%{formId}";
	var projectId = $("#projectId").val();
	var dataAuthId ='${param.dataAuthId}';
	if(projectId == null || projectId == ""){
		utilsFp.confirmIcon(1,"","","", "请先填写制令单号",0,"","");
						
				           
	}
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:getbomurl,
			    data: {
			       "projectId":projectId ,
			        "dataAuthId":dataAuthId
			    },
				success: function(data){
						util.closeLoading();

						if(null == data.ajaxList || data.ajaxList == ""){ 
				                $("#bombody").empty();
				               
				                return ;}
						if(null != data.ajaxList){
							$("#bombody").empty();
							for(var i = 0;i < data.ajaxList.length; i++){
							     bomObj= data.ajaxList[i];
							     $("#bombody").append("<tr></tr>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CBD_SEQUENCE+"<input type='hidden' id='CBD_SEQUENCE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_SEQUENCE+"'/></td>"); 
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CBD_ITEM_CODE+"<input type='hidden' id='CBD_ITEM_CODE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_ITEM_CODE+"'/></td>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+(data.ajaxList[i].CBD_ITEM_NAME==null?"":data.ajaxList[i].CBD_ITEM_NAME)+"<input type='hidden' id='CBD_ITEM_NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_ITEM_NAME+"'/></td>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+(data.ajaxList[i].CBD_ITEM_SPEC==null?"":data.ajaxList[i].CBD_ITEM_SPEC)+"<input type='hidden' id='CBD_ITEM_SPEC"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_ITEM_SPEC+"'/></td>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CBD_UNITS+"<input type='hidden' id='CBD_UNITS"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_UNITS+"'/></td>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CBD_POINT+"<input type='hidden' id='CBD_POINT"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_POINT+"'/></td>");
							    $("#bombody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+(data.ajaxList[i].CBD_ITEM_NUM==null?0:data.ajaxList[i].CBD_ITEM_NUM)+"<input type='hidden' id='CBD_ITEM_NUM"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CBD_ITEM_NUM+"'/></td>");
							      
							           
						
								
							}
							var tableTrJs = $("#bombody tr");_tongLineColor(tableTrJs);
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1232");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});

	}
	var materialObj="";
	function showMaterial(){
	    console.log("S");
		util.showLoading("处理中...");
		var area = $("#paraMapObj_PM_AREA_SN").val();
		var face = $("#paraMapObj_PM_PROCESS_FACE").val();
		var track = $("#paraMapObj_PMO_TRACK").val();//2018/06/12  增加轨道条件
		var pmId = $("#pmId").val();
	        var wkid = "";
		var devid = "";
		var seq = "";
		var flag = true;
		if(pmId == null || pmId == ""){
		flag = false;
		}
		//var projectId = $("#projectId").val();
		//取设备SN,工作中心,设备序号
		$("#device :checkbox").each(function(){
		if($(this).is(':checked')){
		var fid = $(this).attr("value");
		
		if(wkid==""){
		wkid = wkid + $("#CA_ID"+fid).val();
		
		}else{
		wkid = wkid +";"+$("#CA_ID"+fid).val();
		
		}
		if(seq ==""){
		seq = seq + $("#CD_DEVICE_SEQ"+fid).val();
		}else{
		seq = seq +";"+$("#CD_DEVICE_SEQ"+fid).val();
		}
		if(devid==""){
		devid = devid + $("#DEV"+fid).val();
		}else{
		devid = devid + ";" + $("#DEV"+fid).val();
		}
		//devid =$(this).attr("id");
		}
		});
						if(pmId == null || pmId == ""){
						utilsFp.confirmIcon(1,"","","", "请先填写制令单号",0,"","");
						
				               
						}	
		var getmaterialurl="${path}buss/bussModel_exeFunc.ms?funcMId=2eb082721934414cba6f70183a836e65&formId=%{formId}";
		var dataAuthId ='${param.dataAuthId}';
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:getmaterialurl,
			    data:{
			      "pmId":pmId,
			      "devid":devid,
			      "area":area,
			      "face":face,
			      "wkid":wkid,
			      "seq":seq,
			      "track":track,
			       "dataAuthId":dataAuthId
			    },
				success: function(data){
						util.closeLoading();
                        if(data.ajaxString != null){
                            utilsFp.confirmIcon(3,"","","", "error:"+data.ajaxString,0,"","");
                        }
						if(null == data.ajaxList  || data.ajaxList == ""){ 
				                $("#materialbody").empty();//alert("未查询到料站数据");
				                //utilsFp.alert("未查询到料站数据");
				                return ;}
				                console.log("list:"+data.ajaxList);
						if(null != data.ajaxList){
							$("#materialbody").empty();
							for(var i = 0;i < data.ajaxList.length; i++){
							     materialObj= data.ajaxList[i];
							     $("#materialbody").append("<tr></tr>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>"); 
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_DEVICE_TYPE+"<input type='hidden' name='CMD_DEVICE_TYPE' id='CMD_DEVICE_TYPE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_DEVICE_TYPE+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width: 80px;text-align: center;'>"+(data.ajaxList[i].CMD_PROGRAM_NAME==null?"":data.ajaxList[i].CMD_PROGRAM_NAME)+"<input type='hidden' name='CMD_PROGRAM_NAME' id='CMD_PROGRAM_NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_PROGRAM_NAME+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_DEVICE_SEQ+"<input type='hidden' name='CMD_DEVICE_SEQ' id='CMD_DEVICE_SEQ"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_DEVICE_SEQ+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_TABLE_NO+"<input type='hidden' name='CMD_TABLE_NO' id='CMD_TABLE_NO"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_TABLE_NO+"'/><input type='hidden' name='CM_SN' id='CM_SN"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CM_SN+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_LOADPOINT+"<input type='hidden' name='CMD_LOADPOINT' id='CMD_LOADPOINT"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_LOADPOINT+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_CHANEL_SN+"<input type='hidden' name='CMD_CHANEL_SN' id='CMD_CHANEL_SN"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_CHANEL_SN+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_ITEM_CODE+"<input type='hidden' name='CMD_ITEM_CODE' id='CMD_ITEM_CODE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_ITEM_CODE+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width: 80px;text-align: center;'>"+(data.ajaxList[i].CI_ITEM_NAME==null?"":data.ajaxList[i].CI_ITEM_NAME)+"<input type='hidden' name='CI_ITEM_NAME' id='CI_ITEM_NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CI_ITEM_NAME+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width: 80px;text-align: center;'>"+(data.ajaxList[i].CI_ITEM_SPEC==null?"":data.ajaxList[i].CI_ITEM_SPEC)+"<input type='hidden' name='CI_ITEM_SPEC' id='CBD_ITEM_SPEC"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CI_ITEM_SPEC+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CMD_TRY_FLAG+"<input type='hidden' name='CMD_TRY_FLAG' id='CMD_TRY_FLAG"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_TRY_FLAG+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_SHKIP_FLAG+"<input type='hidden' name='CMD_SHKIP_FLAG' id='CMD_SHKIP_FLAG"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_SHKIP_FLAG+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-13' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_POINT_NUM+"<input type='hidden' name='CMD_POINT_NUM' id='CMD_POINT_NUM"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_POINT_NUM+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-14' style='width: 80px;text-align: center;'>"+data.ajaxList[i].CMD_POINT_LOCATION+"<input type='hidden' name='CMD_POINT_LOCATION' id='CMD_POINT_LOCATION"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_POINT_LOCATION+"'/></td>");
							     $("#materialbody tr:last").append("<td class='datagrid-cell datagrid-cell-15' style='width: 80px;text-align: center;'>"+(data.ajaxList[i].CMD_BOM_FLAG==null?"":data.ajaxList[i].CMD_BOM_FLAG)+"<input type='hidden' name='CMD_BOM_FLAG' id='CMD_BOM_FLAG"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CMD_BOM_FLAG+"'/></td>");							     
	
							}
							var tableTrJs = $("#materialbody tr");_tongLineColor(tableTrJs);
								defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1233");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});
				return flag;

	}
	function showItem(){
		util.showLoading("处理中...");
	        var modelcode = $("#paraMapObj_PM_MODEL_CODE").val();
	        var maFace = $("#paraMapObj_PM_PROCESS_FACE").val();
      		var areaStep = $("#areaStep").val();
	        var getitemurl="${path}buss/bussModel_exeFunc.ms?funcMId=74e7ac365b004863a6a36992c153978f&formId=%{formId}";
	         var dataAuthId ='${param.dataAuthId}';
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:getitemurl,
			    data:{
			       "modelcode":modelcode,
			       "maFace":maFace,
                   "areaStep":areaStep,
			       "dataAuthId":dataAuthId
			    },
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxList  || data.ajaxList == ""){ 
				                $("#itembody").empty();
				               
				                return ;}
						if(null != data.ajaxList){
							$("#itembody").empty();
							for(var i = 0;i < data.ajaxList.length; i++){
							     
							     $("#itembody").append("<tr></tr>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 30px;text-align: center;'>"+(i+1)+"</td>"); 
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_ITEM_TYPE+"<input type='hidden' id='CTI_ITEM_TYPE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_ITEM_TYPE+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_ITEM_CODE+"<input type='hidden' id='CTI_ITEM_CODE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_ITEM_CODE+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+(data.ajaxList[i].CI_ITEM_NAME==null?"":data.ajaxList[i].CI_ITEM_NAME)+"<input type='hidden' id='CI_ITEM_NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CI_ITEM_NAME+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+(data.ajaxList[i].CI_ITEM_SPEC==null?"":data.ajaxList[i].CI_ITEM_SPEC)+"<input type='hidden' id='CI_ITEM_SPEC"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CI_ITEM_SPEC+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_GROUP+"<input type='hidden' id='CTI_GROUP"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_GROUP+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_ASSB_QTY+"<input type='hidden' id='CTI_ASSB_QTY"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_ASSB_QTY+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_CONTROL_MODE+"<input type='hidden' id='CTI_CONTROL_MODE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_CONTROL_MODE+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].CTI_ITEM_SOURCE+"<input type='hidden' id='CTI_ITEM_SOURCE"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CTI_ITEM_SOURCE+"'/></td>");
							    $("#itembody tr:last").append("<td class='devicetd' style='width: 91px;text-align: center;'>"+data.ajaxList[i].NAME+"<input type='hidden' id='NAME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].NAME+"'/></td>");
                                                            $("#itembody tr:last").append("<td class='devicetd' style='width: 120px;text-align: center;'>"+data.ajaxList[i].CREATE_TIME+"<input type='hidden' id='CREATE_TIME"+data.ajaxList[i].ID+"' value='"+data.ajaxList[i].CREATE_TIME+"'/></td>");							    
							    
							      
							           
						
								
							}
						var tableTrJs = $("#itembody tr");_tongLineColor(tableTrJs);
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});

	}
	 
	 function cc(obj){
	 var value = obj.value;
	 
	 if(obj.checked == true){
	  $("#checked"+value).val("Y");
	  var flag = showMaterial();
	  if(flag==false){
	  obj.checked = false;
	  $("#checked"+value).val("N");
	  }
	 }else{
	  $("#checked"+value).val("N");
	  showMaterial();
	 }
	 
	 }
	 function clearTech(){
	 $("#paraMapObj_PM_TECH_SN").val("");
	 $("#paraMapObj_PM_TECH_SN_SHOW").val("");
	 $("#paraMapObj_PM_START_GROUP").val("");
	 $("#paraMapObj_PM_END_GROUP").val("");
	
	
	 }
</script>
  <%--  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>--%>
</head>
<body scroll="no" style="background-color: #fff;">
	<DIV class="multilist comwrap content-in">
		<div class="edit">
		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
<jsp:param name="modelName" value="VIEW_TYPE_11" />
   <jsp:param name="location" value="editForm" />
		</jsp:include>

	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" target="submitFrame"
			<bu:formet exeid="%{exeid}" />>
       <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                            <div style="margin-left:40px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
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
			        <button type="button" onclick="editSave2(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>

				<div class="js-tab">
					<DIV id="container" style="padding:0 20px;box-sizing: border-box;height:550px;">
						<DIV >
							<UL class="tab-list tab">
								<LI id="tag1"><A class="selectli1"
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="基本信息" /></SPAN>
								</A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="流程" /></SPAN> </A>
								</LI>
								<LI id="tag3"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();showBow();"
									href="javascript:void(0);"> <SPAN><dict:lang value="BOM" /></SPAN> </A>
								</LI>
								<LI id="tag4"><A class=""
									onclick="switchTag('tag4','content4','');this.blur();showMaterial();"
									href="javascript:void(0);"> <SPAN><dict:lang value="料站表" /></SPAN> </A>
								</LI>
								<LI id="tag5"><A class=""
									onclick="switchTag('tag5','content5','');this.blur();showItem();"
									href="javascript:void(0);"> <SPAN><dict:lang value="管控物料" /></SPAN> </A>
								</LI>

							</UL>
						</DIV>
					
					
					

					<DIV class="content1" id="content" style="margin-top:10px;">
					
							<DIV id="content1" >
							  <div class="mod">
							  <div class="mod-hd">		
                                                          <h3 class="tit"><dict:lang value="制令单上线" /></h3>	
                                                          </div>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="iframeId" value="${iframeId}">
								<input type="hidden" name="dataId" value="${dataId}">
										
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="509546604440458faf9f54d4b907ad31" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="509546604440458faf9f54d4b907ad31" />
	<input type="hidden" name="509546604440458faf9f54d4b907ad31" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="projectId" id="projectId" />
	<input type="hidden" name="pmId" id="pmId" />
	<input type="hidden" name="areaStep" id="areaStep" />
	<input type="hidden" name="trackFlag" id="trackFlag" />
	<input type="hidden" name="step" id="step" value=''/>
	<input type="hidden" name="TARGET_QTY" id="TARGET_QTY" value=''/>
	<input type="hidden" name="INPUT_CODE" id="INPUT_CODE" value=''/>
	<input type="hidden" name="OUTPUT_CODE" id="OUTPUT_CODE" value=''/>	
		<s:set name="_$viewId" value="'634bc79f36c848c398e4eb588f5f629b'" />
		<s:set name="_$formId_1" value="'509546604440458faf9f54d4b907ad31'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
		        <td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_AREA_SN" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_AREA_SN" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_AREA_SN" cssClass="input isSubmit  readonly isaddSubmit" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" onchange="add_device();" formIndex="1" /></bu:td>
		  <td class="name"><bu:uitn colNo="PMO_TRACK" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
		<bu:td cssClass="dec" colNo="PMO_TRACK" formId="b8f52c26583e4ffd938fba4f2dad7a34" ><bu:ui colNo="PMO_TRACK" formId="b8f52c26583e4ffd938fba4f2dad7a34" dataId="${dataId}"  formIndex="1" /></bu:td>
			<td class="name" style="width:96px;"/><span class="dot">*</span><bu:uitn colNo="PM_MO_NUMBER" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec"  style="width:220px;" colNo="PM_MO_NUMBER" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_MO_NUMBER" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		
		        
		</tr>
		
		<tr>
		    <td class="name" /><bu:uitn colNo="PM_MODEL_CODE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_MODEL_CODE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_MODEL_CODE" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" />
			<bu:ui colNo="PM_MODEL_CODE" type="hidden" cssClass="input isSubmit  readonly isaddSubmit" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" />
			</bu:td>
			<td class="name" /><bu:uitn colNo="PRODUCT_NAME" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PRODUCT_NAME" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="2" /></bu:td>
			<td class="name" /><bu:uitn colNo="PRODUCT_STANDARD" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PRODUCT_STANDARD" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="2" /></bu:td>
		
		</tr>
		<tr>
		   	 <td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_PROCESS_FACE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_PROCESS_FACE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_PROCESS_FACE"  cssClass="input isSubmit  readonly isaddSubmit" onchange="clearTech();" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		   
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_TECH_SN" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_TECH_SN" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_TECH_SN"  formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		    
			<td class="name" /><bu:uitn colNo="PM_START_GROUP" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_START_GROUP" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_START_GROUP" formId="509546604440458faf9f54d4b907ad31" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" formIndex="1" /></bu:td>

		
		
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="PM_END_GROUP" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_END_GROUP" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_END_GROUP" formId="509546604440458faf9f54d4b907ad31" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" formIndex="1" /></bu:td>		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_SCHEDULE_DATE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_SCHEDULE_DATE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_SCHEDULE_DATE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_DUE_DATE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_DUE_DATE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_DUE_DATE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>

		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="PM_REPAIR_MAX" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_REPAIR_MAX" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_REPAIR_MAX" formId="509546604440458faf9f54d4b907ad31" cssClass="input isSubmit  readonly isaddSubmit" disabled="disabled" dataId="${dataId}" formIndex="1" /></bu:td>		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_TARGET_QTY" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_TARGET_QTY" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_TARGET_QTY" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PM_UNIT_NUM" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_UNIT_NUM" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_UNIT_NUM" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>

	
		
		</tr>
		
		<tr>
	        <td class="name" /><bu:uitn colNo="PM_JIGSAW_NUM" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_JIGSAW_NUM" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_JIGSAW_NUM" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>		
			<td class="name" /><bu:uitn colNo="PM_SN_RULE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_SN_RULE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_SN_RULE" formId="509546604440458faf9f54d4b907ad31"  formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PM_SUB_RULE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_SUB_RULE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_SUB_RULE" formId="509546604440458faf9f54d4b907ad31"  formIndex="1" /></bu:td>

		
		</tr>
		
		<tr> 
		    <td class="name" /><bu:uitn colNo="PM_TRANSFER_RULE" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_TRANSFER_RULE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_TRANSFER_RULE" formId="509546604440458faf9f54d4b907ad31"  formIndex="1" /></bu:td>
		
		<td class="name"><bu:uitn colNo="PM_ERROR_SCRAP" formId="509546604440458faf9f54d4b907ad31" /></td>
		<td Class="dec" colNo="PM_ERROR_SCRAP" formId="509546604440458faf9f54d4b907ad31"><bu:ui colNo="PM_ERROR_SCRAP" formId="509546604440458faf9f54d4b907ad31" onclick="errorchange(this)"  formIndex="1"/></td>	
		
		<td class="name"><bu:uitn colNo="PM_CONTROL_TYPE" formId="509546604440458faf9f54d4b907ad31" /></td>
		<bu:td cssClass="dec" colNo="PM_CONTROL_TYPE" formId="509546604440458faf9f54d4b907ad31" ><bu:ui colNo="PM_CONTROL_TYPE" formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>
        		
  

		</tr>
		
<tr>
      <td class="name" /><bu:uitn colNo="PM_MODEL_CODE_VER" formId="509546604440458faf9f54d4b907ad31" /></td>
			<bu:td cssClass="dec" colNo="PM_MODEL_CODE_VER" formId="509546604440458faf9f54d4b907ad31" ><bu:ui cssClass="readonly" readonly="readonly" colNo="PM_MODEL_CODE_VER"  formId="509546604440458faf9f54d4b907ad31" dataId="${dataId}" formIndex="1" /></bu:td>		   
		   
</tr>		
		
		
	</table>
			<bu:jsVal formId="509546604440458faf9f54d4b907ad31" formIndex="1" />
			</div>
			<input type="hidden" name="formId" id="formId1" value='831b2dbf0dfb494695b7ce66538a1231'/>
			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1231">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td style="width: 30px;text-align: center;">&nbsp;</td>
										<td style="width: 30px;text-align: center;">
										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
										</td >
										<td style="width: 101px;text-align: center;"><dict:lang value="设备SN" /></td >
										<td style="width: 122px;text-align: center;"><dict:lang value="设备名称" /></td >
										<td style="width: 113px;text-align: center;"><dict:lang value="设备型号" /></td >
										<td style="width: 80px;text-align: center;"><dict:lang value="设备序号" /></td >
										<td style="width: 68px;text-align: center;"><dict:lang value="状态" /></td >
										<td style="width: 105px;text-align: center;"><dict:lang value="工作中心" /></td >
										<td style="width: 60px;text-align: center;"><dict:lang value="轨道" /></td >
										<td style="width: 103px;text-align: center;"><dict:lang value="制令单" /></td >
										<td style="width: 101px;text-align: center;"><dict:lang value="机种" /></td >
										<td style="width: 150px;text-align: center;"><dict:lang value="生产面别" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:121px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1231" >
								<tbody id="device" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
	</DIV>
	
<DIV id="content2" style="margin-top:4px;" >  
<div class="mod">

<div class="mod-bd">

<div id="right" style="height: 300px;width: 100%;left: 0;">
		<canvas style="border: 1px solid #E4E4E4;margin-left:10px;box-sizing:border-box;" id="canvas" ondrop="drop(event)" ondragover="allowDrop(event)" width='940px' height='436'></canvas>	
</div>
</div>
</div>	
									
</DIV>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1232'/>
<DIV id="content3" style="margin-top:4px;" >  
			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head2"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1232">
									<tbody>
									<tr class="datagrid-header-row thcolor">
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="阶别" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="料号" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="料号名称" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="料号规格" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="单位" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="点位" /></td>
										<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="用量" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll2" style="height:450px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1232" >
								<tbody id="bombody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>									
</DIV>
<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a1233'/>
<DIV id="content4" style="margin-top:4px;" >  
			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head3"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1233">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="贴片机型" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="程式名称" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="设备序号" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="TABLE" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="料站" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="通道" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="物料料号" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="物料名称" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="规格" /></td>
									<td style="width: 120px;" class="datagrid-cell "><dict:lang value="TRY盘物料" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="跳过标志" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="点数" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="点位" /></td>
									<td style="width: 80px;" class="datagrid-cell "><dict:lang value="BOM范围" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll3" style="height:420px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1233" >
								<tbody id="materialbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>	
									
</DIV>
<input type="hidden" name="formId" id="formId4" value='831b2dbf0dfb494695b7ce66538a1234'/>
<DIV id="content5" style="margin-top:4px;" >  
			<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head4"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;text-align: center;" class=""></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="管控类型" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="管控料号" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="物料名称" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="物料规格" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="管控工序" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="管控数量" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="管控方式" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="来源" /></td>
									<td style="width: 91px;text-align: center;" class="tr1 "><dict:lang value="创建人" /></td>
									<td style="width: 120px;text-align: center;" class="tr1 "><dict:lang value="创建时间" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll4" style="height:450px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="itembody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>									
</DIV>
			
			
	</DIV>
</form>
					
					</DIV>
					
				</div>
		</div>
	</DIV>
<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
        function addOption(){
       
        $("#paraMapObj_PM_AREA_SN").trigger("chosen:updated");
        $("#paraMapObj_PM_AREA_SN option:first").attr("selected",true);
        }
        addOption();
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	var a='${dataMap.base.CIG_LINK_NUM}';
	if(a==null||a==''){
	  $("#paraMapObj_PM_UNIT_NUM").val(1);//联板数
	}
	else{
	  $("#paraMapObj_PM_UNIT_NUM").val(a);//联板数
	}
	a='${dataMap.base.CIG_SN_NUM}';
	if(a==null||a==''){
	  $("#paraMapObj_PM_JIGSAW_NUM").val(1);//联板数
	}
	else{
	  $("#paraMapObj_PM_JIGSAW_NUM").val(a);//条码拼板数
	}
	/*
	var num='${dataMap.base.CIG_FQC_NUM}';
	if(num>0){
	  $("#paraMapObj_PM_AUTO_FQC_1").attr('checked','checked');
	  $("#paraMapObj_PM_FQC_NUM").val('${dataMap.base.CIG_FQC_NUM}');//送检批量	
	}
	else{
	  $("#paraMapObj_PM_FQC_NUM").val(0);
	}
	*/
	$("#paraMapObj_PM_SN_RULE").val('${dataMap.base.CIG_SN_RULE_B}');//产品条码规则
	$("#paraMapObj_PM_SUB_RULE").val('${dataMap.base.CIG_SN_RULE_S}');//小板条码规则
	a='${dataMap.base.CIG_REPAIR_MAX}';//维修上线次数
	if(a==null||a==''){
	  $("#paraMapObj_PM_REPAIR_MAX").val(0);
	}
	else{
	  $("#paraMapObj_PM_REPAIR_MAX").val(a);
	}
	function errorchange(obj){
	  if(obj.checked==false){
	  $("#paraMapObj_PM_ERROR_SCRAP_1").val("N");
	  }else{
	  $("#paraMapObj_PM_ERROR_SCRAP_1").val("Y");
	  }
	}
	/*
	function fqcChange(obj){
	  //alert(obj.checked);
	  if(obj.checked==false){
	     $("#paraMapObj_PM_AUTO_FQC_1").val("N");
	     $("#paraMapObj_PM_FQC_NUM").attr("class","isSubmit input input isSubmit  readonly isaddSubmit");
	     $("#paraMapObj_PM_FQC_NUM").attr("disabled","disabled");
	     $("#paraMapObj_PM_FQC_NUM").val(0);
	  }
	  else{
	     $("#paraMapObj_PM_AUTO_FQC_1").val("Y");
	     $("#paraMapObj_PM_FQC_NUM").attr("class","isSubmit input");
	     $("#paraMapObj_PM_FQC_NUM").removeAttr("disabled");
	  }
	}*/
	var blockIcon;
    var blackConn;
    var paraMapModel = "view";
	function queryRoute(key){
	    var routeUrl2="${path}buss/bussModel_exeFunc.ms?funcMId=88a6967c694e4efa874202a13a75c87b&formId=%{formId}";
	    
	    var dataAuthId ='${param.dataAuthId}';
	    console.log("dataAuthId:"+dataAuthId);
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: routeUrl2,
 	    	data:{
 	    	    "ctId":key,
 	    	    "dataAuthId":dataAuthId
 	    	},
 			success: function(data){
 				var pList=data.ajaxList;
 				$("#paraMapObj_PM_START_GROUP").val("");
 				$("#paraMapObj_PM_END_GROUP").val("");
 				cleanScene();
 				if(pList!=null&&pList.length>0){
 				  
 				  $("#paraMapObj_PM_START_GROUP").val(pList[0].CR_MO_INPUT);
 				  $("#paraMapObj_PM_END_GROUP").val(pList[0].CR_MO_OUTPUT);
		          $("#INPUT_CODE").val(pList[0].INPUT_CODE);
 				  $("#OUTPUT_CODE").val(pList[0].OUTPUT_CODE); 				  
 				  switchTag('tag2','content2','');
 				  var blockIcon = JSON.parse(pList[0].CR_BLOCKS_MSG);
 				  if(blockIcon!=""&&blockIcon!=undefined){
 				   stage.mode="drag";//场景模式
 				  blockIcon=JSON.stringify(blockIcon);
 				   showTopoData(blockIcon);
 				  }
 				 blackConn = JSON.parse(pList[0].CR_CONN_MSG);
        		  initJsPlumb();
        		  showCon();
 				}
 				//alert(utilsFp.jsonToString(pList));
 				
 				
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				
 		   }
 		});
	}
	function queryRouteS(key){
	    var routeUrl2="${path}buss/bussModel_exeFunc.ms?funcMId=88a6967c694e4efa874202a13a75c87b&formId=%{formId}";
	     var dataAuthId ='${param.dataAuthId}';
	   jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: routeUrl2,
 	    	data:{
 	    	    "ctId":key,
 	    	    "dataAuthId":dataAuthId
 	    	},
 			success: function(data){
 				var pList=data.ajaxList;
 				$("#paraMapObj_PM_START_GROUP").val('');
 				$("#paraMapObj_PM_END_GROUP").val('');
 				//cleanScene();
 				if(pList!=null&&pList.length>0){
 				  
 				  $("#paraMapObj_PM_START_GROUP").val(pList[0].CR_MO_INPUT);
 				  $("#paraMapObj_PM_END_GROUP").val(pList[0].CR_MO_OUTPUT);
 				  $("#INPUT_CODE").val(pList[0].INPUT_CODE);
 				  $("#OUTPUT_CODE").val(pList[0].OUTPUT_CODE);
 				}
 				//alert(utilsFp.jsonToString(pList));
 				
 				
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				
 		   }
 		});
	}
	
	        //点击行寄选中该行(设备)
		function clickTr(tableId){
		        		
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var pmId = $("#pmId").val();
			if(pmId == null || pmId == ""){
	                  utilsFp.confirmIcon(1,"","","", "请先填写制令单号",0,"","");						
                        }else{
			var trId = $(this).attr("id");
			var iptIdaft = $("#"+trId+" :checkbox").attr("value");
			var iptId = $("#checked"+iptIdaft).val();
			
			if(!$("#"+trId+" :checkbox").attr("disabled")){//空闲设备才能绑定行点击事件
			     if ($("#"+trId+" :checkbox").attr("checked")) {//原本勾选的
				$("#"+trId+" :checkbox").prop("checked",false);
				$("#"+trId).css("background-color","");
				//$("#"+iptId).val("N");
				$("#checked"+iptIdaft).val("N");
				showMaterial();
			}else{
				//$("#"+tableId+" input[type='checkbox']").each(function(){
				//	if ($(this).attr("checked")) {
				//		$(this).prop("checked",false);
				//		$(this).parents("tr").css("background-color","");
				//	}
				//});
				$("#"+trId+" :checkbox").prop("checked",true);
				$("#"+trId).css("background-color","#a0c8e5");
				//$("#"+iptId).val("Y");
				$("#checked"+iptIdaft).val("Y");
				showMaterial();
			}                       
                        }

			}
			
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
		  
		}		
		function editSave2(obj){
         isQuery = false;
         var devid = "";
         var flaga = 0;
         var flagb = 0;
         var area = $("#paraMapObj_PM_AREA_SN").val();
         var face = $("#paraMapObj_PM_PROCESS_FACE").val();
			if(!val.valNullData()){
                        if(area==""){
                        return ;
                        }
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
        		return ;
        	}
			
             $DisInput = $(":input[disabled='disabled'][class*='isSubmit']");
			$DisInput.attr("disabled", false); 
	        //console.log($("#step").val());
        	if($("#step").val()=="SMT"){
        	    
        	     $("#device tr").each(function(){
        	var checkid = "";
        	var trval = $(this).attr("value");
        	if(trval =="0" || trval =="null"){
        	flaga++;
        	}
        	});
                $("#device :checkbox").each(function(){
        	if($(this).is(':checked')){
        	flagb++;
        	}
        	});
        	if(flaga>0 && flagb==0){
        	  
        	  utilsFp.confirmIcon(3,"","","", "<dict:lang value="未勾选空闲设备" />",0,"260","");
        	  	return ;
        	}else if(flaga==0 && flagb==0){
                  
                   utilsFp.confirmIcon(3,"","","", "<dict:lang value="无空闲设备" />",0,"260","");
                   	return ;
                }
        	    
        	}						
            var t_track = $("#paraMapObj_PMO_TRACK").val();console.log(t_track);
            var tempF;
        	$("#device :checkbox").each(function(){
        		if($(this).is(':checked')){
        		    var fid = $(this).attr("value");console.log($("#CA_TRACK"+fid).val());
                    if($("#CA_TRACK"+fid).val()!=t_track){
                        tempF = "0";
                        return false;
                    }
        		}
    		});
    		if(tempF=="0"){
    		    utilsFp.confirmIcon(3,"","","", "<dict:lang value="勾闲设备与所选轨道需一致" />",0,"260","");
                return ;
    		}
        	
        	var TARGET_QTY = parseInt($("#TARGET_QTY").val());
        	var PM_TARGET_QTY = parseInt($("#paraMapObj_PM_TARGET_QTY").val());
        	if(TARGET_QTY < PM_TARGET_QTY){
        	    utilsFp.confirmIcon(3,"","","", "<dict:lang value="计划数量不能超过制令单计划数量" />",0,"260","");
                   	return ;
        	}
           console.log("step==>",$("#step").val());
          console.log("len==>",$("#materialbody tr").length);
          console.log("bombodyLen==>",$("#bombody tr").length);
          var step=$("#step").val();
          if(step!="SMT"){
             var bombodyLen = $("#bombody tr").length;
            if(bombodyLen=="0"){
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="BOM不能为空" />",0,"260","");
                   	return ;
            }
          }else{
            var len = $("#materialbody tr").length;
            if(len=="0"){
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="料站表不能为空" />",0,"260","");
                   	return ;
            }
            var bombodyLen = $("#bombody tr").length;
            if(bombodyLen=="0"){
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="BOM不能为空" />",0,"260","");
                   	return ;
            }
          }
          
        	var face=$("#paraMapObj_PM_PROCESS_FACE").val();
        	checkIndicator();		
            //document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=e5074f62cf9d44ed8b3e7a0989bd74b7&face="+face;
        	//document.forms.editForm.submit();
                        
			//isQuery = true;
			//$DisInput.attr("disabled", true);
}
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////0529 CSJ
        function checkIndicator(){
            var moNum=$("#paraMapObj_PM_MO_NUMBER").val();
            var track = $("#paraMapObj_PMO_TRACK").val();//2018/06/12  增加轨道条件
    		util.showLoading("处理中..");
    		var url = "${path}buss/bussModel_exeFunc.ms?funcMId=532d87fe85214e03bac25c1a1bf9c457&formId=%{formId}";
    		$.ajax({
    			type: "POST",
    			dataType: "json",
    			async:false,
    			url: url,
    			data: {
    			    "moNum":moNum
    			},
    			success: function(data) {
    				util.closeLoading();
                    var mes=data.ajaxString;
                    if(mes!="OK"){
                        utilsFp.confirmIcon(3,"","toOnline","", mes,1,"","","","1");
                    }else{
                        var face=$("#paraMapObj_PM_PROCESS_FACE").val();
                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=e5074f62cf9d44ed8b3e7a0989bd74b7&face="+face+"&track="+track;
                    	document.forms.editForm.submit();
                                    
            			isQuery = true;
            			$DisInput.attr("disabled", true);
                    }
    			},
    			error: function(msg) {
    				util.closeLoading();
    				utilsFp.confirmIcon(3, "", "", "", "error:" + msg, 0, "300", "");
    			}
    		});
        }
        function toOnline(){	
            var face=$("#paraMapObj_PM_PROCESS_FACE").val();
            var track = $("#paraMapObj_PMO_TRACK").val();//2018/06/12  增加轨道条件
        	document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=e5074f62cf9d44ed8b3e7a0989bd74b7&face="+face+"&indictorFlag=true"+"&track="+track;
        	document.forms.editForm.submit();
                        
			isQuery = true;
			$DisInput.attr("disabled", true);
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /*
        //设备全选 2018/06/19
        function getAllItems(){
        
            $("#device tr").each(function(){
        	var checkid = "";
        	var trid = $(this).attr("id");
        	var trval = $(this).attr("value");
        	
        	if(trval =="1" || trval =="2" || trval =="3"){
        	checkid = trid.replace("TR","CK");
            	$("#"+checkid).attr("disabled",true);						
            	$("#"+checkid).attr("checked",false);		
        	}else{
        	    checkid = trid.replace("TR","CK");
        	    $("#"+checkid).attr("disabled",false);			
               	$("#"+checkid).attr("checked",true);			 
        	}
        	});
        
	} */
	
	function getAllItems(){
		if($("#allSelects").attr("checked")=="checked"){
		//	$("#device :checkbox").attr("checked",true);
			
			$("#device tr").each(function(){
        	var checkid = "";
        	var trid = $(this).attr("id");
        	var trval = $(this).attr("value");
        	
        	if(trval =="1" || trval =="2" || trval =="3"){
        	}else{
        	    checkid = trid.replace("TR","CK");
               	$("#"+checkid).attr("checked",true);
               	trval = $("#"+checkid).attr("value");
               	$("#checked"+trval).val("Y");
        	}
        	});
            //showMaterial();
			
			
		}else{
			$("#device :checkbox").each(function(){
			    var trvalS = $(this).attr("value");
				$(this).attr("checked",false);	
                $("#checked"+trvalS).val("N");
				
			});
		//	showMaterial();
		}
	} 
	
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll2','.head2');
    setPopScroll('.scroll1','.head1');
    setPopScroll('.scroll3','.head3');
    setPopScroll('.scroll4','.head4');
  })
})(jQuery)</script>

<bu:script viewId="634bc79f36c848c398e4eb588f5f629b" />

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	

</body>


<%@ include file="/plf/common/pub_end.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>