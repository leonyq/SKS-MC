<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="物料组关联" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	</head>
<body>

<div class="customer comwrap">
  <div class="hd">
    <h2 class="tit"><i class="ico-hd"></i><dict:lang value="物料组关联配置" /></h2>
  </div>
  <div class="bd">
    <div class="container">
        <div class="side">
            <ul class="neir-list" id="itemGroup_list">
                <s:iterator value="dataList" >
								<li id="${ID}">
									<a href="javascript:void(0);" onclick="itemGroupToItem('${ID}');" target="_blank" class="item-con">${CIG_NAME}</a>
								</li>
				</s:iterator>
            </ul>
        </div>
        <div class="main">
            <div class="customer-box">
              <div class="tit">
                <i class="ico ico-cus"></i><dict:lang value="已归属料号" />
              </div>
              <div class="group">
                  <div class="name"><dict:lang value="料号"/></div>
                  <div class="dec">
                  		<input type="text" id="CI_ITEM_CODE" style="width: 99px" onkeyup="search_cu1()" />
                  </div>
              </div>
              <div class="group">
                  <div class="name"><dict:lang value="规格"/></div>
                  <div class="dec">
                  		<input type="text" id="CI_ITEM_SPEC" style="width: 99px" onkeyup="search_cu1()" />
                  </div>
              </div>
              <div class="customer-con" style="height: 310px;">
                <ul class="customer-list" id="k1"><!-- 已归属料号数据 -->
		                <table class="dlist-table table-line " id="loadItem">
							<thead>
							<tr class="thcolor">
								<th align="center" width="90px;" style="text-align: center"><input type="checkbox" id="allSelect" name="allSelect"/></th >
								<th align="center" width="200px;" ><dict:lang value="物料类型" /></th>
								<th align="center" width="200px;" ><dict:lang value="物料料号" /></th>
								<th align="center" width="200px;" ><dict:lang value="物料名称" /></th>
								<th align="center" width="200px;" ><dict:lang value="物料规格" /></th>
							</tr>
							</thead>
							<tbody id="addItem">
							</tbody>
						</table>
					<s:iterator value="userLsY" >
							<li id="${id}" title="${name }" onclick="getYIdName('${id}','${name }');"><i class="ico ico-user"></i><a href="javascript:void(0);" target="_blank">${name}</a></li>
					</s:iterator>
                </ul>
            	<input type="hidden" id="Yuser">
              </div>
            </div>
            <div class="customer-btn">
              <button type="button" onclick="b1();">&gt;&gt;</button>
              <button type="button" onclick="b2();">&gt;&gt;&gt;&gt;</button>
              <button type="button" onclick="b3();">&lt;&lt;</button>
              <button type="button" onclick="b4();">&lt;&lt;&lt;&lt;</button>
            </div>
            <div class="customer-box">
              <div class="tit">
                <i class="ico ico-cus"></i><dict:lang value="未归属料号" />
              </div>
              <div class="group">
                  <div class="name" style="width:25%"><dict:lang value="物料类型" /></div>
                  <div class="dec" style="width:75%">
                      <s:select list="#{1:'原料',2:'半成品',3:'成品'}"
					listKey="key" listValue="value"  id="key" name="key" 
					cssStyle="width: 90%"/>
                  </div>
              </div>
              <div class="group">
                  <div class="name"><dict:lang value="料号"/></div>
                  <div class="dec">
                  		<input type="text" id="CI_ITEM_CODE" style="width: 99px" onkeyup="search_cu1()" />
                  </div>
              </div>
              <div class="group">
                  <div class="name"><dict:lang value="规格"/></div>
                  <div class="dec">
                  		<input type="text" id="CI_ITEM_SPEC" style="width: 99px" onkeyup="search_cu1()" />
                  </div>
              </div>
              <div class="customer-con" style="height: 310px;">
                <ul class="customer-list" id="k2">
                			<table class="dlist-table table-line " id="loadItem1">
							<thead>
							<tr class="thcolor">
								<th align="center" width="90px;" style="text-align: center"><input type="checkbox" id="allSelect" name="allSelect"/></th >
								<th align="center" width="200px;" ><dict:lang value="物料类型" /></th>
								<th align="center" width="200px;" ><dict:lang value="物料料号" /></th>
								<th align="center" width="200px;" ><dict:lang value="物料名称" /></th>
								<th align="center" width="200px;" ><dict:lang value="物料规格" /></th>
							</tr>
							</thead>
							<tbody id="addItem1">
							</tbody>
					</table>
                  <s:iterator value="userLsN" >
							<li id="${id}" title="${name }" onclick="getNIdName('${id}','${name }');"><i class="ico ico-user"></i><a href="javascript:void(0);"  target="_blank">${name}</a></li>
					</s:iterator>
                </ul>
            	<input type="hidden" id="Nuser">
              </div>
            </div>
        </div>
    </div>
  </div>
</div>
<script src="${path}/plf/page/fp/js/iframe-design.js"></script>




<script type="text/javascript">
	window.onload = acq;
	
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
	
	function b1(){
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
	}
	
	function b2(){
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
			}else{
			utilsFp.alert("<dict:lang value="请选择员工" />");
		}
	}
	
	function b3(){
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
		
	}
	
	function b4(){
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
			utilsFp.alert("<dict:lang value="请选择员工" />");
		}
	}

	function acq(){
		roleId = $("#itemGroup_list li:first").attr("id");
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
							var itemY = eval(data.ajaxList[0]);
							$("#k1").empty();
							for(var i = 0;i < itemY.length; i++){
								$("#k1").append("<li id='"+itemY[i].id+"' title='"+itemY[i].name+"' onclick=\"getYIdName('"+itemY[i].id+"','"+itemY[i].name+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+itemY[i].name+"</a></li>");
							}
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.alert("error:"+msg);
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
							var itemN = eval(data.ajaxList[1]);
							$("#k2").empty();
							for(var i = 0;i < itemN.length; i++){
								$("#k2").append("<li id='"+itemN[i].id+"' title='"+itemN[i].name+"' onclick=\"getYIdName('"+itemN[i].id+"','"+itemN[i].name+"');\"><i class='ico ico-user'></i><a href='javascript:void(0);' target='_blank'>"+itemN[i].name+"</a></li>");
							}
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.alert("error:"+msg);
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
						utilsFp.alert("<dict:lang value="配置成功！" />");
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.alert("error:"+msg);
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
		
		function itemGroupToItem(objItemGroupId){
			itemGroupId = objItemGroupId;
			$("#itemGroup_list li").removeClass();
			$("#"+objItemGroupId).addClass("item current");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: getItemUrl+"&groupId="+objItemGroupId,
				success: function(data){
						if(null == data){return ;}
						if(null != data.ajaxMap){
							var itemY = eval(data.ajaxMap.yList);//alert(itemY=="");
							$("#addItem").empty();
							for(var i = 0;i < itemY.length; i++){
							$("#loadItem tbody:last").append("<tr id='"+itemY[i].CI_ITEM_NAME+"'</tr>");
							$("#loadItem tr:last").append("<td align='center' style='width:90px;'><input type='checkbox' value='"+itemY[i].CI_ITEM_NAME+"' name='isSelect1'/></td>");
							$("#loadItem tr:last").append("<td><li id='"+itemY[i].id+"' title='"+itemY[i].name+"' onclick=\"getYIdName('"+itemY[i].id+"','"+itemY[i].name+"');\"><a href='javascript:void(0);' target='_blank'>"+itemY[i].CI_ITEM_TYPE+"</a></li></td>");
							$("#loadItem tr:last").append("<td><li id='"+itemY[i].id+"' title='"+itemY[i].name+"' onclick=\"getYIdName('"+itemY[i].id+"','"+itemY[i].name+"');\"><a href='javascript:void(0);' target='_blank'>"+itemY[i].CI_ITEM_CODE+"</a></li></td>");
							$("#loadItem tr:last").append("<td><li id='"+itemY[i].id+"' title='"+itemY[i].name+"' onclick=\"getYIdName('"+itemY[i].id+"','"+itemY[i].name+"');\"><a href='javascript:void(0);' target='_blank'>"+itemY[i].CI_ITEM_NAME+"</a></li></td>");
							$("#loadItem tr:last").append("<td><li id='"+itemY[i].id+"' title='"+itemY[i].name+"' onclick=\"getYIdName('"+itemY[i].id+"','"+itemY[i].name+"');\"><a href='javascript:void(0);' target='_blank'>"+itemY[i].CI_ITEM_SPEC+"</a></li></td>");
							}
							var itemN = eval(data.ajaxMap.nList);//alert(itemN);
							$("#addItem1").empty();
							for(var i = 0;i < itemN.length; i++){
							$("#loadItem1 tbody:last").append("<tr id='"+itemN[i].CI_ITEM_NAME+"'</tr>");
							$("#loadItem1 tr:last").append("<td align='center' style='width:90px;'><input type='checkbox' value='"+itemN[i].CI_ITEM_NAME+"' name='isSelect1'/></td>");
							$("#loadItem1 tr:last").append("<td><li id='"+itemN[i]+"' title='"+itemN[i]+"' onclick=\"getYIdName('"+itemY[i]+"','"+itemN[i]+"');\"><a href='javascript:void(0);' target='_blank'>"+itemN[i].CI_ITEM_TYPE+"</a></li></td>");
							$("#loadItem1 tr:last").append("<td><li id='"+itemN[i]+"' title='"+itemN[i]+"' onclick=\"getYIdName('"+itemY[i]+"','"+itemN[i]+"');\"><a href='javascript:void(0);' target='_blank'>"+itemN[i].CI_ITEM_CODE+"</a></li></td>");
							$("#loadItem1 tr:last").append("<td><li id='"+itemN[i]+"' title='"+itemN[i]+"' onclick=\"getYIdName('"+itemY[i]+"','"+itemN[i]+"');\"><a href='javascript:void(0);' target='_blank'>"+itemN[i].CI_ITEM_NAME+"</a></li></td>");
							$("#loadItem1 tr:last").append("<td><li id='"+itemN[i]+"' title='"+itemN[i]+"' onclick=\"getYIdName('"+itemY[i]+"','"+itemN[i]+"');\"><a href='javascript:void(0);' target='_blank'>"+itemN[i].CI_ITEM_SPEC+"</a></li></td>");
							}
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.alert("error:"+msg);
				  }
				});
		}

</script>
<bu:script viewId="2246fcf10737400e88abcad263b00b13" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>
