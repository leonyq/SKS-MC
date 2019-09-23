<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="角色用户配置" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		</jsp:include>
   
    <link rel="stylesheet" href="${path}/plf/page/fp/css/chosen.css?_mc_res_version=<%=PlfStaticRes.CHOSEN_CSS %>" type="text/css" />
    <link rel="stylesheet" href="${path}/plf/page/fp/css/sub-style.css?_mc_res_version=<%=PlfStaticRes.SUB_STYLE_CSS %>" type="text/css" />

    <script src="${path}/plf/page/fp/js/slick.js?_mc_res_version=<%=PlfStaticRes.SLICK_JS %>"></script>
    <script src="${path}/plf/page/fp/js/chosen.jquery.js?_mc_res_version=<%=PlfStaticRes.CHOSEN_JQUERY_JS %>"></script>
	</head>
<body>

<div class="customer comwrap">
  
  <div >
    <div class="container" style="max-height: 450px;">
        <div class="side" style="height:450px;overflow: auto;">
            <ul class="neir-list" id="rolr_list">
                <s:iterator value="roleLs" >
								<li id="<c:out value='${id}' />">
									<a href="javascript:void(0);" onclick="deptToRole('<c:out value="${id}" />');" class="item-con"><c:out value="${name}" /></a>
								</li>
				</s:iterator>
            </ul>
        </div>
        <div class="main" st>
            <div class="customer-box">
              <div class="tit">
                <i class="ico ico-cus"></i><dict:lang value="已配置员工：" />
              </div>
              <div class="group" style="margin-left: -2px;">
                  <div class="name"><dict:lang value="部门" /></div>
                  <div class="dec">
                  		<s:select list="deptLs" headerKey="-1" headerValue="--%{getText('请选择')}--"
					listKey="id" listValue="levleName"  id="userDeptY" name="userDto.deptId" 
					cssStyle="width: 100%" cssClass="dept_select"/>
                  </div>
              </div>
              <div class="customer-con" style="height:310px;min-height: 250px;overflow: auto;">
                <ul class="customer-list" id="k1">
					<s:iterator value="userLsY" >
							<li id="<c:out value='${id}' />" title="<c:out value='${name}' />" onclick="getYIdName('<c:out value='${id}' />','<c:out value='${name}' />');"><i class="ico ico-user"></i><a href="javascript:void(0);" ><c:out value='${name}' /></a></li>
					</s:iterator>
                </ul>
            	<input type="hidden" id="Yuser">
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
                <i class="ico ico-cus"></i><dict:lang value="未配置员工：" />
              </div>
              <div class="group">
                  <div class="name"><dict:lang value="部门" /></div>
                  <div class="dec">
                      <s:select list="deptLs" headerKey="-1" headerValue="--%{getText('请选择')}--"
					listKey="id" listValue="levleName"  id="userDeptN" name="userDto.deptId" 
					cssStyle="width: 100%" cssClass="dept_select"/>
                  </div>
              </div>
              <div class="customer-con" style="height:310px;min-height: 250px;overflow: auto;">
                <ul class="customer-list" id="k2">
                  <s:iterator value="userLsN" >
							<li id="<c:out value='${id}' />" title="<c:out value='${name}' />" onclick="getNIdName('<c:out value='${id}' />','<c:out value='${name}' />');"><i class="ico ico-user"></i><a href="javascript:void(0);" ><c:out value='${name}' /></a></li>
					</s:iterator>
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
    $('.dialog-bd',parent.document).css('padding','0');
	var roleId=-1;
	var userYid=-1;
	var userNid=-1;
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
			$("#k2").append("<li id='"+userY_id+"' title='"+userY_name+"' onclick=\"getNIdName('"+userY_id+"','"+userY_name+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' >"+userY_name+"</a></li>");
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
		}else{
			utilsFp.alert("<dict:lang value="请选择员工" />");
		}
	} */
	
	function b1(){
		var falg = false;
		$("#k1 li.customer-list-choose").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k2").append("<li id='"+ids+"' title='"+names+"' onclick=\"getNIdName('"+ids+"','"+names+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' >"+names+"</a></li>");
			falg = true;
		});
		if(falg){
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
			}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择员工" />",0,"300","");
		}
	}
	
	function b2(){
		var falg = false;
		$("#k1 li").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k2").append("<li id='"+ids+"' title='"+names+"' onclick=\"getNIdName('"+ids+"','"+names+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' >"+names+"</a></li>");
			falg = true;
		});
		if(falg){
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
			}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择员工" />",0,"300","");
		}
	}
	
/* 	function b3(){
		if(userN_id!=undefined&&userN_id!=null&&userN_name!=undefined&&userN_name!=null){
			$("#"+userN_id).remove();
			$("#k1").append("<li id='"+userN_id+"' title='"+userN_name+"' onclick=\"getYIdName('"+userN_id+"','"+userN_name+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' >"+userN_name+"</a></li>");
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
			}else{
			utilsFp.alert("<dict:lang value="请选择员工" />");
		}
		
	} */
	
	function b3(){
		var falg = false;
		$("#k2 li.customer-list-choose").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k1").append("<li id='"+ids+"' title='"+names+"' onclick=\"getYIdName('"+ids+"','"+names+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' >"+names+"</a></li>");
			falg = true;
		});
		if(falg){
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
			}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择员工" />",0,"300","");
		}
	}
	function b4(){
		var falg = false;
		$("#k2 li").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k1").append("<li id='"+ids+"' title='"+names+"' onclick=\"getYIdName('"+ids+"','"+names+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' >"+names+"</a></li>");
			falg = true;
		});
		if(falg){
			strY = "";strN = "";
			getUserYid();
			getUserNid();
			add();
			}else{
			utilsFp.confirmIcon(1,"","","", "<dict:lang value="请选择员工" />",0,"300","");
		}
	}

	function acq(){
		roleId = $("#rolr_list li:first").attr("id");
		$("#"+roleId).addClass("item current");
	}
	
	$("#userDeptY").change(function(){
			var obj = document.getElementById("userDeptY");
			var index = obj.selectedIndex;
			userYid = obj.options[index].value;
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_showAddRoleUserAjax.ms",
			    data: "paraMap.id="+roleId+", "+userYid+", "+userNid,
				success: function(data){
						if(null == data){return ;}
						if(null != data.ajaxList){
							var userY = eval(data.ajaxList[0]);
							$("#k1").empty();
							for(var i = 0;i < userY.length; i++){
								$("#k1").append("<li id='"+userY[i].id+"' title='"+userY[i].name+"' onclick=\"getYIdName('"+userY[i].id+"','"+userY[i].name+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' >"+userY[i].name+"</a></li>");
							}
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		});
				
		$("#userDeptN").change(function(){
			var obj = document.getElementById("userDeptN");
			var index = obj.selectedIndex;
			userNid = obj.options[index].value;
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_showAddRoleUserAjax.ms",
			    data: "paraMap.id="+roleId+", "+userYid+", "+userNid,
				success: function(data){
						if(null == data){return ;}
						if(null != data.ajaxList){
							var userN = eval(data.ajaxList[1]);
							$("#k2").empty();
							for(var i = 0;i < userN.length; i++){
								$("#k2").append("<li id='"+userN[i].id+"' title='"+userN[i].name+"' onclick=\"getYIdName('"+userN[i].id+"','"+userN[i].name+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);'>"+userN[i].name+"</a></li>");
							}
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		});
	
	function add(){
		util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_addRoleUserAjax.ms",
			    data: "paraMap.strYN="+strY+"; "+strN+"; "+roleId,
				success: function(data){
						util.closeLoading();
						//utilsFp.confirmIcon(2,"","","", "<dict:lang value="配置成功" />",0,"300","");
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
		
    });
		
		function deptToRole(objroleId){
			util.showTopLoading();
			roleId = objroleId;
			$("#rolr_list li").removeClass();
			$("#"+objroleId).addClass("item current");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_showAddRoleUserAjax.ms",
			    data: "paraMap.id="+objroleId+", "+userYid+", "+userNid,
				success: function(data){
						util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var userY = eval(data.ajaxList[0]);
							$("#k1").empty();
							for(var i = 0;i < userY.length; i++){
								$("#k1").append("<li id='"+userY[i].id+"' title='"+userY[i].name+"' onclick=\"getYIdName('"+userY[i].id+"','"+userY[i].name+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' >"+userY[i].name+"</a></li>");
							}
							var userN = eval(data.ajaxList[1]);
							$("#k2").empty();
							for(var i = 0;i < userN.length; i++){
								$("#k2").append("<li id='"+userN[i].id+"' title='"+userN[i].name+"' onclick=\"getNIdName('"+userN[i].id+"','"+userN[i].name+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' >"+userN[i].name+"</a></li>");
							}
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
		}

</script>
<script>(function($){
  $(window).on('load',function(){
    	setPopScroll('.side');
        setPopScroll('.customer-box .customer-con');
  })
})(jQuery)</script>

</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>