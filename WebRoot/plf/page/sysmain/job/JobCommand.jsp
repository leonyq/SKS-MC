<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="工种权限配置" /></title>
		<style>
			
		</style>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		<jsp:param name="dhtmlxtree" value="1" />
		</jsp:include>
    <link rel="stylesheet" href="${path}/plf/page/fp/css/jquery.mCustomScrollbar.css?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CSS %>" type="text/css" />
    <link rel="stylesheet" href="${path}/plf/page/fp/css/chosen.css?_mc_res_version=<%=PlfStaticRes.CHOSEN_CSS %>" type="text/css" />
    <link rel="stylesheet" href="${path}/plf/page/fp/css/sub-style.css?_mc_res_version=<%=PlfStaticRes.SUB_STYLE_CSS %>" type="text/css" />
    <script src="${path}/plf/page/fp/js/jquery.mCustomScrollbar.concat.min.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>
    <script src="${path}/plf/page/fp/js/slick.js?_mc_res_version=<%=PlfStaticRes.SLICK_JS %>"></script>
    <script src="${path}/plf/page/fp/js/chosen.jquery.js?_mc_res_version=<%=PlfStaticRes.CHOSEN_JQUERY_JS %>"></script>
	</head>
<body>
<div class="customer comwrap">
  <div>
    <div class="container" style="height: 460px;">
        <div class="side" id="side" style="height:450px;overflow: auto;">
            <ul class="neir-list" id="job_list">
                <s:iterator value="jobLs" >
								<li id="<c:out value='${id}' />">
									<a href="javascript:void(0);" onclick="commandToJob('<c:out value='${id}' />','');" class="item-con"><c:out value='${jobName}' /></a>
								</li>
				</s:iterator>
            </ul>
        </div>
        <div class="main">
            <div class="customer-box">
              <div class="tit">
                <i class="ico ico-cus"></i><dict:lang value="已配置指令：" />
              </div>
              <div class="group" style="margin-left: -2px;">
                  <div class="name"><dict:lang value="指令集"/></div>
                  <div class="dec">
                  		<select id="yesCommand" name="yesCommand" style="width: 100%" class="dept_select" ></select>
                  </div>
              </div>
              <div class="customer-con" style="height:310px;min-height: 250px;overflow: auto;">
                <div id="index_tree" class="tree" ></div>
					<script>
						/*function tonclick(id,cid){
							var url = "${path}sys/JobAction_showJobCommands.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F2564&jobId=83d6fbdf0da40dbb81f55cd2e4a4ba9";
							alert(url);
							parent.mainFrame.location.href= url;
						}
						var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
						tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/new_ui_tree/");
						tree.setOnClickHandler(tonclick);
						//tree.loadXML("${path}sys/DeptAction_listDeptTree.ms");
						//tree.setXMLAutoLoading("${path}sys/DeptAction_listDeptTree.ms");
						//tree.loadXML("${path}sys/JobAction_showJobCommands.ms?");
						//tree.setXMLAutoLoading("${path}sys/JobAction_showJobCommands.ms?"); 
						//tree.loadXMLString("${path}sys/JobAction_showJobCommands.ms");*/
					</script>

              </div>
            </div>
            <div class="customer-btn">
              <button type="button" onclick="b2();">&gt;&gt;</button>
              <button type="button" onclick="b1();">&gt;</button>
              <button type="button" onclick="b3();">&lt;</button>
              <button type="button" onclick="b4();">&lt;&lt;</button>
            </div>
            <div class="customer-box">
              <div class="tit">
                <i class="ico ico-cus"></i><dict:lang value="未配置指令：" />
              </div>
              <div class="group">
                  <div class="name"><dict:lang value="指令集" /></div>
                  <div class="dec">
                      <select id="noCommand" name="noCommand" style="width: 100%" class="dept_select"></select>
                  </div>
              </div>
              <div class="customer-con" style="height:310px;min-height: 250px;overflow: auto;">
                <div id="index_tree_s" class="tree" ></div>
					<script>
						/* function tonclick(id,cid){
							var url = "${path}sys/JobAction_showJobCommands.ms?<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F2564&jobId=83d6fbdf0da40dbb81f55cd2e4a4ba9";
							alert(url);
							parent.mainFrame.location.href= url;
						}
						var tree=new dhtmlXTreeObject("index_tree_s","100%","100%","-1");
						tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/new_ui_tree/");
						tree.setOnClickHandler(tonclick);
						tree.loadXML("${path}sys/DeptAction_listDeptTree.ms");
						tree.setXMLAutoLoading("${path}sys/DeptAction_listDeptTree.ms");
						//tree.loadXML("${path}sys/JobAction_showJobCommands.ms?");
						//tree.setXMLAutoLoading("${path}sys/JobAction_showJobCommands.ms?");  */
					</script>

              </div>
            	<input type="hidden" id="Nuser">
              </div>
            </div>
        </div>
    </div>
  </div>
</div>
<script src="${path}/plf/page/fp/js/iframe-design.js?_mc_res_version=<%=PlfStaticRes.IFRAME_DESIGN_JS %>"></script>




<script type="text/javascript">
	window.onload = acq;

	var jobId=-1;
	var commandId,commandId_n;
	function b1(){
		var parentIds = tree.getAllPartiallyChecked();
		var ids=tree.getAllChecked();
		//alert(parentIds+"----"+ids);
		var rightId = "";
		if (parentIds==null||parentIds=="") {
			rightId = ids;
		}else{
			rightId = parentIds+","+ids;
		}
		if("" == rightId){
		  utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少选择一条记录" />",0,"300","");
		  return ;
		}
		util.showLoading("<dict:lang value="处理中..." />");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/JobAction_deployJobCommand.ms",
			 //   data: "<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F3995&jobId="+jobId+"&falg=addRight&rightId="+rightId,
				data : {
					"<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />" : "F3995",
					"jobId" : jobId,
					"falg" : "addRight",
					"rightId" : rightId
				},
				success: function(data){
						util.closeLoading();
						commandToJob(jobId,"");
						//utilsFp.alert("<dict:lang value="配置成功！" />");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
	
	function b2(){
		util.showLoading("<dict:lang value="处理中..." />");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/JobAction_deployJobCommand.ms",
			  //  data: "<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F3995&jobId="+jobId+"&falg=allRight",
				data : {
					"<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />" : "F3995",
					"jobId" : jobId,
					"falg" : "allRight"
				},
				success: function(data){
						util.closeLoading();
						commandToJob(jobId,"");
						//utilsFp.alert("<dict:lang value="配置成功！" />");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}

	function b3(){
		var parentIds = tree_s.getAllPartiallyChecked();
		var ids=tree_s.getAllChecked();
		var leftId = "";
		if (parentIds==null||parentIds=="") {
			leftId = ids;
		}else{
			leftId = parentIds+","+ids;
		}
        if("" == leftId){
          utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少选择一条记录" />",0,"300","");
          return ;
        }
		util.showLoading("<dict:lang value="处理中..." />");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/JobAction_deployJobCommand.ms",
			    data: "<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F3995&jobId="+jobId+"&falg=addLeft&leftId="+leftId,
				success: function(data){
						util.closeLoading();
						commandToJob(jobId,"");
						//utilsFp.alert("<dict:lang value="配置成功！" />");
					},
				error: function(msg){
						util.closeLoading();
						//utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
	
		function b4(){
		util.showLoading("<dict:lang value="处理中..." />");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/JobAction_deployJobCommand.ms",
			    data: "<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F3995&jobId="+jobId+"&falg=allLeft",
				success: function(data){
						util.closeLoading();
						commandToJob(jobId,"");
						//utilsFp.alert("<dict:lang value="配置成功！" />");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}

		$("#yesCommand").change(function(){
			commandId = $("#yesCommand").val();
			//$("#noCommand").find("option[value='"+$("#yesCommand").val()+"']").attr("selected",true);
			//$("#noCommand").trigger("chosen:updated");
			if (commandId=="-1") {
				commandToJobY(jobId,"");
			}else{
				commandToJobY(jobId,commandId);
			}
		});
				
		$("#noCommand").change(function(){
			commandId_n = $("#noCommand").val();
			if (commandId_n=="-1") {
				commandToJobN(jobId,"");
			}else{
				commandToJobN(jobId,commandId_n);
			}
		});


	function acq(){
		jobId = $("#job_list li:first").attr("id");
		$("#"+jobId).addClass("item current");
		commandToJob(jobId,"");
		
	}
	
	$(function(){
    	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
    	
    	 $('.dialog-bd',parent.document).css('padding','0');
    });
	
		var tree= null;
		var tree_s= null;
		function commandToJob(objjobId,commandId){
			$("#yesCommand").find("option[value='-1']").attr("selected",true);
			$("#noCommand").find("option[value='-1']").attr("selected",true);
			$("#yesCommand").trigger("chosen:updated");
			$("#noCommand").trigger("chosen:updated");
			util.showLoading("<dict:lang value="处理中..." />");
			jobId = objjobId;
			$("#job_list li").removeClass();
			$("#"+objjobId).addClass("item current");
			$("#index_tree").empty();
			$("#index_tree_s").empty();
			
			tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/new_ui_tree/");
			tree.enableCheckBoxes(1);//1启用checkbox
			tree.enableThreeStateCheckboxes(true);//是否级联选中
			//tree.setOnClickHandler(tonclick);
			tree_s=new dhtmlXTreeObject("index_tree_s","100%","100%","-1");
			tree_s.setImagePath("${path}plf/js/dhtmlxtree/imgs/new_ui_tree/");
			tree_s.enableCheckBoxes(1);//1启用checkbox
			tree_s.enableThreeStateCheckboxes(true);//是否级联选中
			//tree.setOnClickHandler(tonclick);
			//<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F2564&
			var url = "${path}sys/JobAction_showJobCommands.ms?FUNC_CODE=F2564";
			$.ajax({
	     			type: "POST",
	     		    dataType: "json",
	     		    url:url,
	     		    data: "jobId="+objjobId+"&commandId="+commandId,
	     			success: function(data){
						util.closeLoading();
	     				if(data!=null&&data!=""){
	     					if (data.ajaxList[0]!=null&&data.ajaxList[0]!="") {
								tree.loadXMLString(data.ajaxList[0]);
							}
	     					if (data.ajaxList[1]!=null&&data.ajaxList[1]!="") {
								tree_s.loadXMLString(data.ajaxList[1]);
							}
							if (data!=null&&data!="") {
								$("#yesCommand").empty();
								$("#yesCommand").append("<option value='-1'>--<dict:lang value="请选择" />--</option>");
								$("#noCommand").empty();
								$("#noCommand").append("<option value='-1'>--<dict:lang value="请选择" />--</option>");
								for ( var i=0;i<data.yeslist.length; i++) {
									if (data.yeslist[i].tcs_code!=null&&data.yeslist[i].tcs_code!="") {
										$("#yesCommand").append("<option value='"+data.yeslist[i].tcs_code+"'>"+data.yeslist[i].tcs_name+"</option>");
										$("#noCommand").append("<option value='"+data.yeslist[i].tcs_code+"'>"+data.yeslist[i].tcs_name+"</option>");
										}
									}
								for ( var j=0;j<data.nolist.length; j++) {
									if (data.nolist[j].tcs_code!=null&&data.nolist[j].tcs_code!="") {
										$("#yesCommand").append("<option value='"+data.nolist[j].tcs_code+"'>"+data.nolist[j].tcs_name+"</option>");
										$("#noCommand").append("<option value='"+data.nolist[j].tcs_code+"'>"+data.nolist[j].tcs_name+"</option>");
									}
								}
								$("#yesCommand").find("option[value='"+commandId+"']").attr("selected",true);
								$("#noCommand").find("option[value='"+commandId_n+"']").attr("selected",true);
			     				$("#yesCommand").trigger("chosen:updated");
			     				$("#noCommand").trigger("chosen:updated");
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
		
		
	function commandToJobY(objjobId,commandId){
			util.showLoading("<dict:lang value="处理中..." />");
			jobId = objjobId;
			$("#job_list li").removeClass();
			$("#"+objjobId).addClass("item current");
			$("#index_tree").empty();
			tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
			tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/new_ui_tree/");
			tree.enableCheckBoxes(1);//1启用checkbox
			tree.enableThreeStateCheckboxes(true);//是否级联选中
			var url = "${path}sys/JobAction_showJobCommands.ms?FUNC_CODE=F2564";
			$.ajax({
	     			type: "POST",
	     		    dataType: "json",
	     		    url:url,
	     		    data: "<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F2564&jobId="+objjobId+"&commandId="+commandId,
	     			success: function(data){
						util.closeLoading();
	     				if(data!=null&&data!=""){
	     					if (data.ajaxList[0]!=null&&data.ajaxList[0]!="") {
								tree.loadXMLString(data.ajaxList[0]);
							}
							if (data.ajaxMap!=null&&data.ajaxMap!="") {
								$("#yesCommand").empty();
								$("#yesCommand").append("<option value='-1'>--<dict:lang value="请选择" />--</option>");
								for ( var i=0;i<data.ajaxMap.yeslist.length; i++) {
									if (data.ajaxMap.yeslist[i].tcs_code!=null&&data.ajaxMap.yeslist[i].tcs_code!="") {
										$("#yesCommand").append("<option value='"+data.ajaxMap.yeslist[i].tcs_code+"'>"+data.ajaxMap.yeslist[i].tcs_name+"</option>");
										}
									}
								for ( var j=0;j<data.ajaxMap.nolist.length; j++) {
									if (data.ajaxMap.nolist[j].tcs_code!=null&&data.ajaxMap.nolist[j].tcs_code!="") {
										$("#yesCommand").append("<option value='"+data.ajaxMap.nolist[j].tcs_code+"'>"+data.ajaxMap.nolist[j].tcs_name+"</option>");
									}
								}
								$("#yesCommand").find("option[value='"+commandId+"']").attr("selected",true);
								$("#yesCommand").trigger("chosen:updated");
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
		
		function commandToJobN(objjobId,commandId){
			util.showLoading("<dict:lang value="处理中..." />");
			jobId = objjobId;
			$("#job_list li").removeClass();
			$("#"+objjobId).addClass("item current");
			$("#index_tree_s").empty();
			tree_s=new dhtmlXTreeObject("index_tree_s","100%","100%","-1");
			tree_s.setImagePath("${path}plf/js/dhtmlxtree/imgs/new_ui_tree/");
			tree_s.enableCheckBoxes(1);//1启用checkbox
			tree_s.enableThreeStateCheckboxes(true);//是否级联选中
			var url = "${path}sys/JobAction_showJobCommands.ms?FUNC_CODE=F2564";
			$.ajax({
	     			type: "POST",
	     		    dataType: "json",
	     		    url:url,
	     		    data: "<s:property value="@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE"/>=F2564&jobId="+objjobId+"&commandId="+commandId,
	     			success: function(data){
						util.closeLoading();
	     				if(data!=null&&data!=""){
	     					if (data.ajaxList[1]!=null&&data.ajaxList[1]!="") {
								tree_s.loadXMLString(data.ajaxList[1]);
							}
							if (data.ajaxMap!=null&&data.ajaxMap!="") {
								$("#noCommand").empty();
								$("#noCommand").append("<option value='-1'>--<dict:lang value="请选择" />--</option>");
								for ( var i=0;i<data.ajaxMap.yeslist.length; i++) {
									if (data.ajaxMap.yeslist[i].tcs_code!=null&&data.ajaxMap.yeslist[i].tcs_code!="") {
										$("#noCommand").append("<option value='"+data.ajaxMap.yeslist[i].tcs_code+"'>"+data.ajaxMap.yeslist[i].tcs_name+"</option>");
										}
									}
								for ( var j=0;j<data.ajaxMap.nolist.length; j++) {
									if (data.ajaxMap.nolist[j].tcs_code!=null&&data.ajaxMap.nolist[j].tcs_code!="") {
										$("#noCommand").append("<option value='"+data.ajaxMap.nolist[j].tcs_code+"'>"+data.ajaxMap.nolist[j].tcs_name+"</option>");
									}
								}
								$("#noCommand").find("option[value='"+commandId_n+"']").attr("selected",true);
			     				$("#noCommand").trigger("chosen:updated");
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

(function($){
	$(window).on('load',function(){
		setPopScroll('.side');
		setPopScroll('.scroll1');
		setPopScroll('.scroll2');
	})
})(jQuery)	
</script>
</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>