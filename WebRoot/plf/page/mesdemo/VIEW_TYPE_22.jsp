<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="工作流新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	<style type="text/css">
	.theme-explorer-fa{
		padding: 10px;
	}
    .hd-fixed{
        position: fixed;
        width: 100%;
        z-index: 999;
        background: #fff;
   }
   .working-time{
      padding-top: 30px;
   }
  /* .showImg:after {
       bottom: -2px !important;
	   min-width:108px !important;
	   width:100% !important;
   }*/

	</style>
	
	<!-- 产品静态资源 -->
	#{view.dist.static.resources}#
	
</head>
<body style="overflow:auto;">
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd hd-fixed" style="position: fixed;width: 100%;background: #fff;z-index: 999;">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
					<div class="save-close" <dict:lang value = "关闭保存并关闭窗口" />
						onclick="saveClose(this)"></div>
					<input type="checkbox" checked id="isCloseWin" name="isCloseWin" value="0" style="display:none;" /> 
					<dict:lang value="岗位选择" />
					<s:select list="deptPositionLs" headerKey=""
							listKey="user_dept_position_id"
							listValue="dept_position_show_title" name="dept_position"
							id="dept_position" cssStyle="width: 200px;"
							cssClass="dept_select" />
					
				</div>
			    <div class="optn">
			       <input type="hidden" id="_flowId" name="_flowId" value="<c:out value='${flowId}'/>" />	
			       <input type="hidden" id="_flowName" name="_flowName"  value="<c:out value='${flowName}'/>"/>		
			       <input type="hidden" id="fileIds" name="fileIds" value=""  /> 
			       <input type="hidden" id="suffixs" name="suffixs" value=""  />   
			       <input type="hidden" id="fileNames" name="fileNames" value=""  /> 
			       <input type="hidden" id="downUrls" name="downUrls" value=""  />   
			       <input type="hidden" id="_variables" name="_variables"  />
			       <input type="hidden" id="_processTitle" name="_processTitle" />
			       <input type="hidden" id="_nextUser" name="_nextUser" />
			       
			        <button type="button" id="addFlowFlag" onclick="addFlow(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			     </div>
			   
			</div>
		 <div class="working-time" style="position: fixed;z-index: 99;padding-top: 30px;height: 98px;">
		   <div class="time-header">
		        <span data-tosrc="todo" class="clickFont showImg">流程表单</span>
		        <span data-tosrc="mysend">下一节点办理人</span>
		   </div>
		</div>
			<div class="bd" style="border:none;padding-top: 108px;">
	    		<div id="todo">	
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
					#{view.dist.flow.add}#
					<div>
						<form enctype="multipart/form-data" style="background: #fff;">
						<div class="file-loading">
						<input id="kv-explorer" type="file" multiple>
						</div>
						</form>
					</div>
			  </div>
		 	<div id="mysend" style="display:none;">
			 <div style="height:100%;overflow-y:auto">
			  <div class="flow-data" id="flow-data">
			 <!--   <div class="data" style="padding-top: 7px;">
				 <span class="node-name">部门副主管审批节点</span>
				 <div class="node-content">
				     <p>
				        <span> 姓名</span>
				         <span>职位</span>
				       </p>
				      
				      <p>
				        <span> 姓名</span>
				         <span>职位</span>
				       </p>
				      
				      <p>
			     </div>
			   </div>
			    <div class="data">
				     <span class="node-name">部门副主管审批节点</span>
				     <div class="node-content">
				     <p>
				        <span> 姓名</span>
				         <span>职位</span>
				       </p>
				      
				      <p>
				        <span> 姓名</span>
				         <span>职位</span>
				       </p>
				       <p>
			     </div>
			   </div> -->
			  </div>
			</div>
			
		 </form>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoadingflow" />
  	</jsp:include>
	<script type="text/javascript">

		$('.time-header span').click(function(){
			var id=$(this).attr("data-tosrc");
			$("#mysend,#todo").hide();
			$("#"+id).show();
			switchTag(this,'clickFont','showImg','work-content');
			if(id=="mysend"){
				$("#addFlowFlag").attr('disabled',true);
			    getNextNodeInfo();
			}else{
				$("#addFlowFlag").attr('disabled',false);
			}
		});
		function switchTag(currentNode,ClassName,ClassName2,tagTo){
		    $(currentNode).addClass(ClassName+" "+ClassName2).siblings().removeClass(ClassName+" "+ClassName2);
		}
		$(".data:even").css("background", "rgb(237,237,237)");
		$(".data-imp").hover(function(){
		$(".pointer-show").text("");
		$(this).children(".pointer-show").show();
		$(".pointer-show").text($(this).text());
		},function(){
		$(this).children(".pointer-show").hide();
		});
		function setFileIds(previewId, type) {
			var fileIds = "";
			var suffixs = "";
			var fileNames = "";
			var downUrls = "";
			if (type == 1) {
				if ($(".file-preview-success").not("#" + previewId).length > 0) {
					$(".file-preview-success").not("#" + previewId).each(function() {
						fileIds += $(this).attr('fileId') + ",";
						suffixs += $(this).attr('suffix') + ",";
						fileNames += $(this).attr('fileName') + ",";
						downUrls += $(this).attr('downUrl') + ",";
					});
				}
				;
			} else {
				if ($(".file-preview-success").length > 0) {
					$(".file-preview-success").each(function() {
						fileIds += $(this).attr('fileId') + ",";
						suffixs += $(this).attr('suffix') + ",";
						fileNames += $(this).attr('fileName') + ",";
						downUrls += $(this).attr('downUrl') + ",";
					});
				}
			}
			fileIds = fileIds.substring(0, fileIds.length - 1);
			suffixs = suffixs.substring(0, suffixs.length - 1);
			fileNames = fileNames.substring(0, fileNames.length - 1);
			downUrls = downUrls.substring(0, downUrls.length - 1);
			$("#fileIds").val(fileIds);
			$("#suffixs").val(suffixs);
			$("#fileNames").val(fileNames);
			$("#downUrls").val(downUrls);
		}
		function deleteFileById(previewId, fileId, suffix) {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "${path}buss/bussModel_delFlowFile.ms",
				data : {
					fileId : fileId,
					suffix : suffix
				},
				success : function(data) {
					setFileIds(previewId, 1);
				},
				error : function(msg) {}
			});
		}
		$(document).ready(function() {
			$("#kv-explorer").fileinput({
				language : 'zh',
				'theme' : 'explorer-fa',
				allowedPreviewTypes : [ 'image' ],
				uploadAsync : true,
				showCaption : false,
				showPreview : true,
				showUpload : false,
				maxFileSize : 512000,
				otherActionButtons : '<button type="button" style="cursor: pointer;width: 30px;height: 30px;" class="kv-file-down btn btn-xs btn-default" {dataKey} title="下载附件"><i class="fa fa-cloud-download"></i></button>',
				'uploadUrl' : '${path}buss/bussModel_flowAttachmentUpload.ms',
				overwriteInitial : false,
				showRemove : false
			}).on('fileuploaded', function(e, data, previewId, index) {
				$('#' + previewId).attr('fileId', data.response.fileIds);
				$('#' + previewId).attr('suffix', data.response.suffix);
				$('#' + previewId).attr('fileName', data.response.fileNames);
				$('#' + previewId).attr('downUrl', data.response.downUrls);
				setFileIds(previewId, 2);
			}).on('filesuccessremove', function(event, previewId, extra) {
				var fileId = $('#' + previewId).attr('fileId');
				var suffix = $('#' + previewId).attr('suffix');
				deleteFileById(previewId, fileId, suffix);
			}).on('fileselect', function(event, numFiles, label) {
				$(".kv-file-down").each(function(index, item) {
					var $btn = $(this),
						key = $btn.data('key');
					if (!key) {
						$btn.hide();
					}
				});
			});
		});
		
		
		function getNextNodeInfo(){
			 var variables = [];      
			 var _flowId = $("#_flowId").val();
  	        $(".input.isSubmit").each(function () {
  	           if(this.name.indexOf('paraMap1@0#')==0){
  	             var propertyMap= {};
                 propertyMap.name = this.name.replace('paraMap1@0#','');
                 propertyMap.value=this.value;
                 variables.push(propertyMap);
              }
  	        });
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "${path}buss/bussModel_getNextNodeInfo.ms",
				data : {
					viewType:22,
					processdeId : _flowId,
					_variables:JSON.stringify(variables)
				},
				success : function(data) {
					var result = JSON.parse(data.ajaxMap.result);
				    var next_users = result.next_users;
					if(next_users){
						var html = [];
						$.each(next_users,function(i,v){
							html.push("<div class='data'> ");
							html.push("<span class='node-name' title="+v.usertask_name+">"+v.usertask_name+"</span> ");
							html.push("<div class='node-content'>");
							$.each(v.users,function(j,n){
								html.push("<p>");
								html.push("<span>"+n.name+"</span>");
								html.push("<span>"+n.group_name+"</span>");
								html.push("</p>");
							})
							html.push("</div>");
							html.push("</div>");
						});
						$("#flow-data").html(html.join(""));
					}
				},
				error : function(msg) {}
			});
		}
		
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
 <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<%@ include file="/plf/page/wf/process/resourceFile.jsp" %>
