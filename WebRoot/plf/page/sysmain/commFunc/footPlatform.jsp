<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
		<title><dict:lang value="个人工作平台" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="zTree" value="1" />
		</jsp:include>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.user-drop{
		padding-left: 115px;top:30px;position:absolute;top:90px;width:auto;
		}
		.user-drop .item
		{float:left;width:108px;padding:9px;text-align:center;}
		.user-drop .item .con{display:block;width:100px;height:80px;background-color:#004098;color:#fff;padding-top:20px;}
		.user-drop .item .con .tt{display:block;margin-top:10px;}
		.user-drop .item .con:hover{
			color:#fff;background-color:#aace36;
		}
		.dialog-bd{
			overflow: auto;
		}
	</style>
	</head>
  	<body style="background-color: #fff;">
  	<form id="submitForm"action="${path}sys/FootPlatformAction_footPlatform.ms"></form>
  	<div class="user-drop">
	    	<s:iterator value="nineCommList" id="index"  status="st" >
	                 <s:if test="#index.showOrder==#st.count">
	                 <div class="item"  title="<c:out value='${index.menuName}'/>">
	                  		<a href="" class="con" onclick="showDiv('addFCWTpop','addFCWTshadow','<c:out value='${index.menuName}'/>','<c:out value='${index.showOrder}'/>','<c:out value='${index.menuId}'/>','<c:out value='${index.id}'/>','<c:out value='${index.menuType}'/>');return false">
	                 			<s:if test="#index.img!=null">
	                 				<img src="${path}<c:out value='${index.img}'/>?_mc_res_version=<%=PlfStaticRes.INDEX_IMG %>" width="36" height="36" alt="" />	                 			  	
		                    	</s:if>
		                    	<s:else>
		                    		<img src="${path}plf/page/fp/img/ico-menu-default.png?_mc_res_version=<%=PlfStaticRes.ICO_MENU_DEFAULT_PNG %>" width="36" height="36" alt="" />
		                    	</s:else>
		                    		<span style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="tt" ><c:out value='${index.menuName}'/></span>
		                  </a>		     			 
	             		</div>
	             	</s:if>
	             	<s:else>
	             		<div class="item" >
	                  		<a href="" class="con" onclick="showDiv('addFCWTpop','addFCWTshadow','','<c:out value='${st.count}'/>','','');return false">
		                    		<img src="${path}plf/page/fp/img/sudoku.png?_mc_res_version=<%=PlfStaticRes.SUDOKU_PNG %>" width="36" height="36" alt="" style="padding-top:12px;"/>
		                  </a>		     			 
	             		</div>
	             	</s:else>
                </s:iterator>
     </div>
	<!-- 隐藏弹出框 -->	
	<div class="dialog dialog-s1" id="addFCWTpop" style="display:none;z-index:1030;margin-left:30px;left:100px;top:89px;width:340px;height:auto;" >
	 <div class="dialog-hd">
		 <h3 class="tit"><dict:lang value="菜单权限选择"/></h3>
	 </div>	
	 <a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addFCWTpop', ‘addFCWTshadow’);"></a>
	  <div class="dialog-bd" style="width:100%;height:322px;">
				<div style="margin-left: 20px;" >
			  		<form id="editForm" name="editFootPlatform" action="${path}sys/FootPlatformAction_editFootPlatform.ms"" method="post">
						<br />
						<div class="optn" style="margin-top: 5px;margin-right: 8px;">
							<button type="button" onclick="hideDiv('addFCWTpop','addFCWTshadow')"><i class="ico ico-save"></i><dict:lang value="提交"/></button>
							<button type="button" id="cleanData"onclick="hideDivEsc('addFCWTpop','addFCWTshadow')"><i class="ico ico-cancel"></i><dict:lang value="清空"/></button>
							<button type="button" onclick="hideEsc('addFCWTpop','addFCWTshadow')"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
						</div>
						<div style="margin-top: -20px;">
						    <table style="width: 100%;">
						    	<tr>
						    		<td style="width:70%">
						    		<dict:lang value="菜单别名"/>
						    		<input class="input" style="width: 130px;" type="text" id="menuName" name="dto.menuName"/>
						    		</td>
						    		<td style="width:30%;margin-top:-10px">
						    		<span class="Eng" ><span id="error_msg"></span></span>
						    		</td>
						    	</tr>
						    </table>
						</div>
						<div id="index_tree" class="ztree">
						</div>  	
						 <s:hidden id="showOrder" name="dto.showOrder"/>
						<s:hidden id="menuId" name="dto.menuId"/>
						<s:hidden  id="type" name="dto.menuType"/>
						<s:hidden id="id" name="dto.id"/>
						</form>
	</div>
	</div>
	</div>
	<div class="dialog-mask" id="addFCWTshadow" style="z-index:1029"></div>
	<script type="text/javascript">
		var flag=false;
		//var tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");//创建全局树对象
		//tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");//设置树图片
		
		var setting = {
			data: {
				simpleData: {
					enable: true,
					pIdKey: "upId"
				},
			key: {
				url: "xUrl"
				}
			},
			callback: {
				onClick: tonclick
			}
		};
		
		//显示部分菜单名称
		//显示菜单树
		function showDiv(showId,backId,menuName,showOrder,menuId,id,menuType){
			$("#menuName").val("");
			if(val.isBlank(menuName)){
				$("#cleanData").hide();
			}else{
				$("#cleanData").show();
			}
			$("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			$('.chosen-container').css("height","300px");
			$("#index_tree").empty();
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/FootPlatformAction_treeLoad.ms",
			    success: function(data){
			    			//tree=new dhtmlXTreeObject("index_tree","100%","100%","-1");
							//tree.setOnClickHandler(tonclick);//绑定点击树事件
			    			//tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
							//tree.loadXMLString(data.ajaxData);//加载树数据
							
							if(data){
								zTreeObj = $.fn.zTree.init($("#index_tree"), setting, data.ajaxList); 
								
							}
							
							$("#showOrder").val(showOrder);
							$("#menuName").val(menuName);
							$("#type").val(menuType);
							$("#id").val(id);//用于后台判断是否是新增还是修改
							
							//tree.selectItem(menuId);
							var treeObj = $.fn.zTree.getZTreeObj("index_tree");
							var node = treeObj.getNodeByParam("id", menuId, null);
							if(node!=null){
								treeObj.selectNode(node);
							}
							
							document.getElementById(showId).style.display = 'block';
							document.getElementById(backId).style.display = 'block';
						},error: function(msg){
							util.closeLoading();
							util.alert("error:"+msg);
					  }
				});
			
		}
		//隐藏div并且提交表单
	 	function hideDiv(showId,backId){
			return add(this);
		}
	 	//隐藏div
		function hideDivEsc(showId,backId){
			cleanData()
			if(!flag){
				return
			};
			document.forms.submitForm.submit();
			$("#"+showId+",#"+backId).hide();
		} 
		function hideEsc(showId,backId){
			$("#"+showId+",#"+backId).hide();
		} 
		/*
		function tonclick(id,cid){
				var id = tree.getSelectedItemId();
				var name = tree.getSelectedItemText();
				var type=tree.getUserData(id,"type");
				if(type==1){
					$("#menuName").val(name);
				}else{
					$("#menuName").val("");
				}
				$("#type").val(type);
		}
		*/
		
		function tonclick(event, treeId, treeNode){
			 var id = treeNode.id;
			 var name = treeNode.name;
			 var type=treeNode.type;
			 if(type==1){
				 $("#menuName").val(name);
			 }else{
				 $("#menuName").val("");
			 }
			 $("#type").val(type);

		}
		
	   	//菜单别名校验
		function valData(){
			   var menuName = document.getElementById("menuName");
			   var type=$("#type").val();
			   if(type==0&&type!=""){
			   		document.getElementById("error_msg").innerHTML = "<dict:lang value="只能是功能级别菜单" />";
			   		menuName.focus();
			    	window.setTimeout("closeValMsg('error_msg')", 2000);
			    	return false;
			   }
			   if(type==""){
				   document.getElementById("error_msg").innerHTML = "<dict:lang value="只能是功能级别菜单" />";
			   		menuName.focus();
			    	window.setTimeout("closeValMsg('error_msg')", 2000);
			    	return false;
			   }
			   if(val.isBlank(menuName)){
			    	document.getElementById("error_msg").innerHTML = "<dict:lang value="别名不能为空" />";
			    	menuName.focus();
			    	window.setTimeout("closeValMsg('error_msg')", 2000);
			    	return false;
			   }else{
			    	document.getElementById("error_msg").innerHTML = "";
			   }
			   
			  //var id = tree.getSelectedItemId();
			  var id ='';
			  var treeObj = $.fn.zTree.getZTreeObj("index_tree");
			  var nodes = treeObj.getSelectedNodes();
			  for(var i=0;i<nodes.length;i++){  
				  id=nodes[i].id;
					
		      }  
			  
			  if(val.isBlank(id)){
				  	document.getElementById("error_msg").innerHTML = "<dict:lang value="请选择一个菜单！" />";
			    	menuName.focus();
			    	window.setTimeout("closeValMsg('error_msg')", 2000);
			    	return false; 
			  }else{
				  	document.getElementById("error_msg").innerHTML = "";
			  }
			   $("#menuId").val(id);
	    		return true;
	    }
	  //显示错误信息
     function closeValMsg(objthis){
    	document.getElementById(objthis).innerText = "";
    }
	  //提交表单
    function add(thisObj){
		if(!valData()){
			return ;
		}
		document.forms.editForm.submit();
	}
	function cleanData(){
		if(!valData()){
			return;
		}
		var id=$("#id").val();
		$.ajax({
			type: "POST",
		    dataType: "json",
		    async:false,
			data : "paraMap.id=" + id,
		    url: "${path}sys/FootPlatformAction_cleanData.ms",
		    success: function(data){
		    			flag=true;
					},error: function(msg){
						flag=false;
						util.closeLoading();
						util.alert("error:"+msg);
				  }
			});
	}
	</script>  
  
  
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>