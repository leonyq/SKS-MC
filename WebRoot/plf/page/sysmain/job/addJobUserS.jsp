<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="工种用户配置" /></title>
		
		
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		</jsp:include>
    <link rel="stylesheet" href="${path}/plf/page/fp/css/jquery.mCustomScrollbar.css?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CSS %>" type="text/css" />
    <link rel="stylesheet" href="${path}/plf/page/fp/css/chosen.css?_mc_res_version=<%=PlfStaticRes.CHOSEN_CSS %>" type="text/css" />
    <link rel="stylesheet" href="${path}/plf/page/fp/css/sub-style.css?_mc_res_version=<%=PlfStaticRes.SUB_STYLE_CSS %>" type="text/css" />
   	<style>
		
	</style>
    <script src="${path}/plf/page/fp/js/jquery.mCustomScrollbar.concat.min.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>
    <script src="${path}/plf/page/fp/js/slick.js?_mc_res_version=<%=PlfStaticRes.SLICK_JS %>"></script>
    <script src="${path}/plf/page/fp/js/chosen.jquery.js?_mc_res_version=<%=PlfStaticRes.CHOSEN_JQUERY_JS %>"></script>
	</head>
<body>
<div class="customer comwrap">
  <div>
    <div class="container" style="height: 460px;">
        <div class="side" style="height:450px;overflow: auto;">
            <ul class="neir-list" id="job_list">
                <s:iterator value="jobLs" >
								<li id="<c:out value='${id}' />">
									<a href="javascript:void(0);" onclick="deptToJob('<c:out value='${id}' />');" class="item-con"><c:out value='${jobName}'/></a>
								</li>
				</s:iterator>
            </ul>
        </div>
        <div class="main">
            <div class="customer-box">
              <div class="tit">
                <i class="ico ico-cus"></i><dict:lang value="已有员工：" />
              </div>
              <div class="group" style="margin-left: -2px;">
                  <div class="name"><dict:lang value="部门" /></div>
                  <div class="dec">
                  		<s:select list="deptLs" headerKey="" headerValue="--%{getText('请选择')}--"
					listKey="id" listValue="levleName"  id="userDeptY" name="userDto.deptId" 
					cssStyle="width: 100%" cssClass="dept_select" />
                  </div>
              </div>
              <div class="customer-con scroll scroll1" style="height:310px;min-height: 250px;padding:0;padding-left:10px;overflow: auto;">
                <ul class="customer-list" id="k1">
					<%-- <s:iterator value="userLsY" >
							<li id="${id}" title="${name }" onclick="getYIdName('${id}','${name }');"><i class="ico ico-user"></i><a href="javascript:void(0);" >${name}</a></li>
					</s:iterator> --%>
                </ul>
            	<input type="hidden" id="Yuser">
              </div>
              <div style="display: none">
              	<table id="allUserY"></table>
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
                <i class="ico ico-cus"></i><dict:lang value="未选员工：" />
              </div>
              <div class="group">
                  <div class="name"><dict:lang value="部门" /></div>
                  <div class="dec">
                      <s:select list="deptLs" headerKey="" headerValue="--%{getText('请选择')}--"
					listKey="id" listValue="levleName"  id="userDeptN" name="userDto.deptId" 
					cssStyle="width: 100%" cssClass="dept_select"/>
                  </div>
              </div>
              <div class="customer-con scroll scroll2" style="height:310px;min-height: 250px;padding:0;padding-left:10px;overflow: auto;">
                <ul class="customer-list" id="k2">
                  <%-- <s:iterator value="userLsN" >
							<li id="${id}" title="${name}" onclick="getNIdName('${id}','${name }');"><i class="ico ico-user"></i><a href="javascript:void(0);" >${name}</a></li>
					</s:iterator> --%>
                </ul>
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
	var userYid="";
	var userNid="";
	var strY = "";
	var strN = "";
	var userY_id,userY_name,userN_id,userN_name;
	
	function getYIdName(objId,objName){
		userY_id = objId;
		userY_name = objName;
		if($("#"+userY_id).hasClass("customer-list-choose")){
			$("#"+userY_id).removeClass("customer-list-choose");
		}else{
			$("#"+userY_id).addClass("customer-list-choose");
		}
	}
		
	function getNIdName(objId,objName){
		userN_id = objId;
		userN_name = objName;
		if($("#"+userN_id).hasClass("customer-list-choose")){
			$("#"+userN_id).removeClass("customer-list-choose");
		}else{
			$("#"+userN_id).addClass("customer-list-choose");
		}
	}
	
	function getUserYid(){
		$("#k1").each(function (){
			$(this).find("li").each(function (){
				strY += $(this).attr("id")+", ";
			});
		});
	}
	
	function getUserNid(){
		$("#k2").each(function (){
			$(this).find("li").each(function (){
				strN += $(this).attr("id")+", ";
			});
		});
	}
	
/* 	function b1(){
		if(userY_id!=undefined&&userY_id!=null&&userY_name!=undefined&&userY_name!=null){
			$("#"+userY_id).remove();
			$("#k2").append("<li id='"+userY_id+"' title='"+userY_name+"' onclick=\"getNIdName('"+userY_id+"','"+userY_name+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+userY_name+"</a></li>");
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
		}else{
			utilsFp.alert("<dict:lang value="请选择员工" />");
		}
	} */
	
	function b1(){
		$('.scroll1').mCustomScrollbar("destroy")
		$('.scroll2').mCustomScrollbar("destroy")
		var falg = false;
		$("#k1 li.customer-list-choose").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k2").append("<li id='"+ids+"' title='"+names+"' onclick=\"getNIdName('"+ids+"','"+names+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});
		if(falg){
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
			}else{utilsFp.confirmIcon(1,"","","","<dict:lang value="请选择员工" />",0,"300","");
		}
		setPopScroll('.scroll1');
		setPopScroll('.scroll2');
	}
	
		function b2(){
		$('.scroll1').mCustomScrollbar("destroy")
		$('.scroll2').mCustomScrollbar("destroy")
		var falg = false;
		$("#k1 li").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k2").append("<li id='"+ids+"' title='"+names+"' onclick=\"getNIdName('"+ids+"','"+names+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});
		$("#k1 li").remove();
		if(falg){
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
			}else{
			utilsFp.confirmIcon(1,"","","","<dict:lang value="请选择员工" />",0,"300","");
		}
		setPopScroll('.scroll1');
		setPopScroll('.scroll2');
	}
	
/* 	function b3(){
		if(userN_id!=undefined&&userN_id!=null&&userN_name!=undefined&&userN_name!=null){
			$("#"+userN_id).remove();
			$("#k1").append("<li id='"+userN_id+"' title='"+userN_name+"' onclick=\"getYIdName('"+userN_id+"','"+userN_name+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+userN_name+"</a></li>");
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
			}else{
			utilsFp.alert("<dict:lang value="请选择员工" />");
		}
		
	} */
	
	function b3(){
		$('.scroll1').mCustomScrollbar("destroy")
		$('.scroll2').mCustomScrollbar("destroy")
		var falg = false;
		$("#k2 li.customer-list-choose").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k1").append("<li id='"+ids+"' title='"+names+"' onclick=\"getYIdName('"+ids+"','"+names+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});
		if(falg){
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
			}else{
			utilsFp.confirmIcon(1,"","","","<dict:lang value="请选择员工" />",0,"300","");
		}
		setPopScroll('.scroll1');
		setPopScroll('.scroll2');
	}
	
		function b4(){
		$('.scroll1').mCustomScrollbar("destroy")
		$('.scroll2').mCustomScrollbar("destroy")
		var falg = false;
		$("#k2 li").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k1").append("<li id='"+ids+"' title='"+names+"' onclick=\"getYIdName('"+ids+"','"+names+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});
		$("#k2 li").remove();
		if(falg){
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
			}else{
			utilsFp.confirmIcon(1,"","","","<dict:lang value="请选择员工" />",0,"300","");
		}
		setPopScroll('.scroll1');
		setPopScroll('.scroll2');
	}

$("#userDeptY").change(function(){
	
		util.showTopLoading();
			userYid = $("#userDeptY").val();
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_showAddJobUserAjax.ms",
			    data: "paraMap.jobId="+jobId+"&paraMap.deptId="+userYid,
				success: function(data){
						util.closeLoading();
						$("#k1").empty();
						if(null == data){return ;}
						if(null != data){
							var userY = data.userLsY;
							var htmlK1 = "";
							var html = "";
							$("#allUserY").empty();
							for(var i = 0;i < userY.length; i++){
								if (!$("#y_"+userY[i].ID).length) {
									htmlK1 = htmlK1 + "<li id='"+userY[i].ID+"' title='"+userY[i].NAME+"' onclick=\"getYIdName('"+userY[i].ID+"','"+userY[i].NAME+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+userY[i].NAME+"</a></li>";
									html = html + "<tr id='y_"+userY[i].ID+"'></tr>";
									//$("#k1").append("<li id='"+userY[i].ID+"' title='"+userY[i].NAME+"' onclick=\"getYIdName('"+userY[i].ID+"','"+userY[i].NAME+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+userY[i].NAME+"</a></li>");
								}
							}
							$("#k1").append(htmlK1);
							$("#allUserY").append(htmlK1);
						}
						
						//deptToJob(jobId);
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		});
				
		$("#userDeptN").change(function(){
			util.showTopLoading();
			userNid = $("#userDeptN").val();
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_showAddJobUserAjax.ms",
			    data: "paraMap.jobId="+jobId+"&paraMap.deptId="+userNid,
				success: function(data){
						util.closeLoading();
						$("#k2").empty();
						if(null == data){return ;}
						if(null != data){
							/* var alluserY = data.userLsY;
							$("#allUserY").empty();
							var html = "";
							for(var i = 0;i < alluserY.length; i++){
								html = html + "<tr id='y_"+alluserY[i].ID+"'></tr>";
								//$("#allUserY").append("<tr id='y_"+alluserY[i].ID+"'></tr>");
							}
							$("#allUserY").append(html); */
							var userN = data.userLsN;
							$("#k2").empty();
							var htmlK2 = "";
							for(var i = 0;i < userN.length; i++){
								//if (!$("#y_"+userN[i].ID).length) {
									htmlK2 = htmlK2 + "<li id='"+userN[i].ID+"' title='"+userN[i].NAME+"' onclick=\"getYIdName('"+userN[i].ID+"','"+userN[i].NAME+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+userN[i].NAME+"</a></li>";
									//$("#k2").append("<li id='"+userN[i].ID+"' title='"+userN[i].NAME+"' onclick=\"getYIdName('"+userN[i].ID+"','"+userN[i].NAME+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+userN[i].NAME+"</a></li>");
								//}
							}
							$("#k2").append(htmlK2);
						}
						
						//deptToJob(jobId);
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		});


	function acq(){
		jobId = $("#job_list li:first").attr("id");
		$("#"+jobId).addClass("item current");
		deptToJob(jobId);
	}
	
	function add(){
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_addJobUserAjax.ms",
			    data: "paraMap.strYN="+strY+"; "+strN+"; "+jobId,
				success: function(data){
						util.closeLoading();
						//utilsFp.confirmIcon(2,"","","","<dict:lang value="配置成功！" />",0,"300","");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
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
		
		function deptToJob(objjobId){
			$('.scroll1').mCustomScrollbar("destroy")
			$('.scroll2').mCustomScrollbar("destroy")
			util.showTopLoading();
			jobId = objjobId;
			$("#job_list li").removeClass();
			$("#"+objjobId).addClass("item current");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_showAddJobUserAjax.ms",
			    data: "paraMap.jobId="+objjobId+"&paraMap.deptYId=",
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						if(null != data){
							var userY = data.userLsY;
							$("#k1").empty();
							$("#allUserY").empty();
							var htmlK1 = "";
							var html = "";
							for(var i = 0;i < userY.length; i++){
								htmlK1 = htmlK1 + "<li id='"+userY[i].ID+"' title='"+userY[i].NAME+"' onclick=\"getYIdName('"+userY[i].ID+"','"+userY[i].NAME+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+userY[i].NAME+"</a></li>";
								//$("#k1").append("<li id='"+userY[i].ID+"' title='"+userY[i].NAME+"' onclick=\"getYIdName('"+userY[i].ID+"','"+userY[i].NAME+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+userY[i].NAME+"</a></li>");
								html = html + "<tr id='y_"+userY[i].ID+"'></tr>";
							}
							$("#k1").append(htmlK1);
							$("#allUserY").append(html);
							
							
							var userLsN = data.userLsN;
							$("#k2").empty();
							var htmlK2 = "";
							for(var i = 0;i < userLsN.length; i++){
								if (!$("#y_"+userLsN[i].ID).length) {
									htmlK2 = htmlK2 + "<li id='"+userLsN[i].ID+"' title='"+userLsN[i].NAME+"' onclick=\"getNIdName('"+userLsN[i].ID+"','"+userLsN[i].NAME+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+userLsN[i].NAME+"</a></li>";
									//$("#k2").append("<li id='"+userN[i].ID+"' title='"+userN[i].NAME+"' onclick=\"getNIdName('"+userN[i].ID+"','"+userN[i].NAME+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+userN[i].NAME+"</a></li>");
								}
							}
							$("#allUserY").append(html);
							$("#k2").append(htmlK2);
							
						}
						setPopScroll('.scroll1');
						setPopScroll('.scroll2');
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