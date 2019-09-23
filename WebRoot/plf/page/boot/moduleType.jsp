<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="模块名称" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="dhtmlxtree" value="1" />
			<jsp:param name="layui" value="1" />
			
	</jsp:include>
</head>
<script type="text/javascript">
util.showTopLoading("数据加载中 请稍后。。。。")
</script>
<body onload="init()">
<div class="crumbs" id="crumbs" style="margin:5px 0px 0px 37px;">
    </div>
	<div class="all moduleType">
		<div>
			<div  class="add_table_div">
			<form id="addForm" name="addForm" class="layui-form" action="${path}sys/moduleMagAction_bussExport.ms" method="post" >
				<table class="add_table">
				
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">

					<tr>
						<td width="40%" class="tr1" style="padding:20px;">
							<span class="Eng">*</span><dict:lang value="模块类型" />
						</td>
						<td width="60%">
								<input type="radio" id="COMM_MODEL" name="MODEL_TYPE"  value="1"  lay-filter="changeValue"  title="公用模块"/>
										
								<input type="radio" id="BUSS_MODEL" name="MODEL_TYPE" value="2"   lay-filter="changeValue" title="业务模块"/>
										
						
						</td>
					</tr>
						<tr>
						<td  width="40%" class="tr1" style="padding:20px;">
							<span class="Eng">*</span><dict:lang value="模块启动优先级" />
						</td>
						<td width="60%">
							<s:textfield  id="MODEL_START_ORDER" maxlength="100" name="paraMap.MODEL_START_ORDER" cssClass="_VAL_NULL _VAL_DATABASE"  onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"   />
						</td>
					</tr>
						<tr>
						<td  width="40%" class="tr1" style="padding:20px;">
							<dict:lang value="模块远程依赖" />
						</td>
						<td  width="60%">
							
							<div id="remote_tree" class="tree" style="overflow: auto;height: 148px;border:1px solid #E6E6E6;width:60%;margin-bottom:15px;"></div>
						</td>
					</tr>
						<tr>
						<td  width="40%" class="tr1" style="padding:20px;">
							<dict:lang value="模块本地依赖" />
						</td>
						<td width="60%">
							<div id="locale_tree" class="tree" style="overflow: auto;height: 148px;border:1px solid #E6E6E6;width:60%;" ></div>
						</td>
					</tr>
				</table>
				<s:hidden id="exportModule" name="paraMap.exportModule"></s:hidden>
				<s:hidden id="MODEL_NAME" name="paraMap.MODEL_NAME"></s:hidden>
				<s:hidden id="MODEL_SHOW_NAME" name="paraMap.MODEL_SHOW_NAME"></s:hidden>
				<s:hidden id="MODEL_VERSION" name="paraMap.MODEL_VERSION"></s:hidden>
				<s:hidden id="MODELS_NAME" name="paraMap.MODELS_NAME"></s:hidden>
				<s:hidden id="MODEL_TYPE" name="paraMap.MODEL_TYPE"></s:hidden>
				<s:hidden id="MODEL_ID" name="paraMap.ID"></s:hidden>
				<s:textarea id="MODEL_MEMO" name="paraMap.MODEL_MEMO"  cssStyle="display:none;word-wrap: normal;" wrap="off"></s:textarea>
				<s:hidden id="MODEL_DATABASE" name="paraMap.MODEL_DATABASE"></s:hidden>
				<s:hidden id="codeType" name="paraMap.paraCodeType"/>
				<s:hidden id="paraCodeId" name="paraMap.paraCodeId"/>
				<s:textarea id="classCode" name="paraMap.paraClsCode" value="%{paraMap.paraClsCode}" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
				<s:hidden id="className" name="paraMap.paraCodeName"/>
				<s:hidden id="MC_ID_MYSQL" name="paraMap.MC_ID_MYSQL" />
				<s:hidden id="MC_ID_SQLSERVER" name="paraMap.MC_ID_SQLSERVER" />
				<s:hidden id="MC_ID_ORACLE" name="paraMap.MC_ID_ORACLE" />
				<s:hidden id="MC_ID_BASE" name="paraMap.MC_ID_BASE" />
				<s:hidden id="MC_ID_PG" name="paraMap.MC_ID_PG"  />
				<s:hidden id="PAGE_ORDER" name="paraMap.PAGE_ORDER"/>
				
				<div class="ptop_10 txac">
					<!--  
					<input id="saveButton" type="button" value="<dict:lang value="上一步" />" onclick="up(this);" class="botton_img_add">
					<input id="nextButton" type="button" value="<dict:lang value="下一步" />"  onclick="next(this);" class="botton_img_add">
					-->
					
					<button id="nextButton" class="layui-btn layui-btn-warm" lay-filter="filterSubmit_up" lay-submit="formSubmit"><dict:lang value="上一步" /></button>
					<button id="nextButton" class="layui-btn layui-btn-warm" lay-filter="filterSubmit_next" lay-submit="formSubmit"><dict:lang value="下一步" /></button>
					
				</div>
				
			</form>
			</div>
		</div>

	</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	var currentOrder=2;
	var MODEL_NAME=null;
	var MODEL_VERSION=null;
	var MODELS_NAME=null;
	var retree=null;
	var lotree=null;
	function initReTree(){
		if(retree!=null){
    		return ;
  		}
		retree=new dhtmlXTreeObject("remote_tree","100%","100%","/");
		retree.enableTreeLines(false);
		retree.setImagePath("${rootPath}plf/js/dhtmlxtree/imgs/csh_books/");
		retree.loadXML("${path}sys/moduleMagAction_listCommPackegeTree.ms?paraMap.type=1&paraMap.modulename="+MODELS_NAME+"."+MODEL_NAME+"."+MODEL_VERSION,function(){
			var idarr=exportModule.reId
			if(exportModule.reId){
				for(var i=0;i<idarr.length;i++){
					var id=idarr[i].id
					retree.selectItem(idarr[i].className);
					retree.setCheck(idarr[i].className,1)//勾选节点
				}
			}
		});
		retree.enableCheckBoxes(1);
		retree.enableThreeStateCheckboxes(true);
		retree.setOnCheckHandler(function() {
			var retrees = retree.getAllChecked();
<%--			alert(retrees)--%>
			if(retrees.length>0){
				exportModule.reId=[]
				var retreeArr=retrees.split(",");
				for (var i = 0; i < retreeArr.length; i++) { 
					var haschild=retree.hasChildren(retreeArr[i])
					if(haschild==0){//判断不包含子结点
						exportModule.reId.push({
								"className": retreeArr[i],
						});
					}
			    }
			}else{
				delete exportModule.reId
			}
		});
	}
	function initLoTree(){
		if(lotree!=null){
			return ;
		}
	
		var flag = false;
		lotree=new dhtmlXTreeObject("locale_tree","100%","100%","/");
		lotree.enableTreeLines(false); 
		lotree.setImagePath("${rootPath}plf/js/dhtmlxtree/imgs/csh_books/");
		lotree.loadXML("${path}sys/moduleMagAction_listCommPackegeTree.ms?paraMap.type=2&paraMap.modulename="+MODELS_NAME+"."+MODEL_NAME+"."+MODEL_VERSION,function(){
			var idarr=exportModule.loId
			if(exportModule.loId){
				for(var i=0;i<idarr.length;i++){
<%--					alert(lotree.getIndexById(idarr[i].className))--%>
					lotree.selectItem(idarr[i].className);
					lotree.setCheck(idarr[i].className,1)//勾选节点
				}
			}
		});
		lotree.enableCheckBoxes(1);
		lotree.enableThreeStateCheckboxes(true);
		lotree.setOnCheckHandler(function() {
			var lotrees = lotree.getAllChecked();
<%--			alert(lotrees)--%>
			if(lotrees.length>0){
				exportModule.loId=[]
				var lotreeArr=lotrees.split(",");
				for (var i = 0; i < lotreeArr.length; i++) { 
					var haschild=lotree.hasChildren(lotreeArr[i])
					if(haschild==0){//判断不包含子结点
						exportModule.loId.push({
								"className": lotreeArr[i],
							});
					}
			    }
			}else{
				delete exportModule.loId
			}
		});
		
	}
	var isSubmit=false;
	var exportModule = {};	
	function init(){
		var em=$("#exportModule").val()
		if(em!=""&&em.length>2){
			exportModule=JSON.parse(em);
<%--			alert(exportModule);--%>
		}
		util.closeTopLoading();
	}
	$(function(){
		var type=$("#MODEL_TYPE").val();
		MODEL_NAME=$("#MODEL_NAME").val();
		MODEL_VERSION=$("#MODEL_VERSION").val();
		MODELS_NAME=$("#MODELS_NAME").val();
		if(type!=undefined){
			if(type=="1"||type==""){
				$("#COMM_MODEL").prop("checked",true)
				$("#MODEL_TYPE").val("1");
				 initReTree()
			}else{
				$("#BUSS_MODEL").prop("checked",true)
				initReTree()
				initLoTree()
			}
		}else{
			$("#COMM_MODEL").prop("checked",true)
			$("#MODEL_TYPE").val("1");
			initReTree()
		}
		var PAGE_ORDER=$("#PAGE_ORDER").val();
		var html="<ul>";
		var count=0;
		if(PAGE_ORDER!=""){
			var pageorders=PAGE_ORDER.split(",");
				if(pageorders.length!=11){
					if(pageorders.length==currentOrder-1){//从前一个页面进入 
						for(var i=0;i<pageorders.length;i++){
							pagename=null;
							pageName(pageorders[i])
							if(pageorders[i]==1){//当前为1时
								html+="<li class=\"done\"><div class=\"line transparent\"></div>"+
					            "<div class=\"num\">"+pageorders[i]+"</div>"+
					            "<div class=\"line\"></div>"+
					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
					            continue;
					         }
							if(pageorders[i]==currentOrder){//当前为1时
								html+="<li class=\"doing\"> <div class=\"line transparent\"></div>"+
					            "<div class=\"num\">"+pageorders[i]+"</div>"+
					            "<div class=\"line\"></div>"+
					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
								continue;
							}else{
									html+="<li class=\"done\"> <div class=\"line\"></div>"+
						            "<div class=\"num\">"+pageorders[i]+"</div>"+
						            "<div class=\"line line_right\"></div>"+
						            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
						            continue;
							}
				       	}
						pageName(currentOrder)
						html+="<li class=\"doing\"> <div class=\"line\"></div>"+
			            "<div class=\"num\">"+currentOrder+"</div>"+
			            "<div class=\"line\"></div>"+
			            "<div class=\"text\"><a>"+pagename+"</a></div></li>";
						$("#PAGE_ORDER").val("1,2");
						count=2
					}else if(pageorders.length==currentOrder){
						for(var i=0;i<pageorders.length;i++){
							pagename=null;
							pageName(pageorders[i])
							if(pageorders[i]==1){//当前为1时
								html+="<li class=\"done\"><div class=\"line transparent\"></div>"+
					            "<div class=\"num\">"+pageorders[i]+"</div>"+
					            "<div class=\"line\"></div>"+
					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
					            continue;
					         }
							if(pageorders[i]==currentOrder){//当前为1时
								html+="<li class=\"doing\"> <div class=\"line\"></div>"+
					            "<div class=\"num\">"+pageorders[i]+"</div>"+
					            "<div class=\"line\"></div>"+
					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
								continue;
							}else{
									html+="<li class=\"done\"> <div class=\"line\"></div>"+
						            "<div class=\"num\">"+pageorders[i]+"</div>"+
						            "<div class=\"line line_right\"></div>"+
						            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
						            continue;
							}
				       	}
						count=1
					}else{
						for(var i=0;i<pageorders.length;i++){
							pagename=null;
							pageName(pageorders[i])
							if(pageorders[i]==1){//当前为1时
								html+="<li class=\"done\"><div class=\"line transparent\"></div>"+
					            "<div class=\"num\">"+pageorders[i]+"</div>"+
					            "<div class=\"line\"></div>"+
					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
					            continue;
					         }
							if(pageorders[i]==currentOrder){//当前为1时
								html+="<li class=\"doing\"> <div class=\"line\"></div>"+
					            "<div class=\"num\">"+pageorders[i]+"</div>"+
					            "<div class=\"line\"></div>"+
					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
								continue;
							}else{
									html+="<li class=\"done\"> <div class=\"line\"></div>"+
						            "<div class=\"num\">"+pageorders[i]+"</div>"+
						            "<div class=\"line line_right\"></div>"+
						            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
						            continue;
							}
				       	}
						count=1
					}
					for(var j=pageorders.length+count;j<12;j++){
							pagename=null;
							pageName(j)
							if(j==11){
								html+="<li class=\"undone\"> <div class=\"line\"></div>"+
					            "<div class=\"num\">"+j+"</div>"+
					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
					            continue;
							}else{
								html+="<li class=\"undone\"> <div class=\"line\"></div>"+
					            "<div class=\"num\">"+j+"</div>"+
					            "<div class=\"line\"></div>"+
					            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
					            continue;
							}
					}
			}else{
				for(var i=0;i<pageorders.length;i++){
						pagename=null;
						pageName(pageorders[i])
						if(pageorders[i]==1){//当前为1时
							html+="<li class=\"done\"> <div class=\"line transparent\"></div>"+
				            "<div class=\"num\">"+pageorders[i]+"</div>"+
				            "<div class=\"line\"></div>"+
				            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
							continue;
						}
						if(pageorders[i]==currentOrder){//当前为1时
							html+="<li class=\"doing\"> <div class=\"line\"></div>"+
				            "<div class=\"num\">"+pageorders[i]+"</div>"+
				            "<div class=\"line\"></div>"+
				            "<div class=\"text\"><a>"+pagename+"</a></div></li>"
							continue;
						}else if(i==pageorders.length-1){
								html+="<li class=\"done\"> <div class=\"line\"></div>"+
					            "<div class=\"num\">"+pageorders[i]+"</div>"+
					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
					            continue;
						}else{
								html+="<li class=\"done\"> <div class=\"line\"></div>"+
					            "<div class=\"num\">"+pageorders[i]+"</div>"+
					            "<div class=\"line\"></div>"+
					            "<div class=\"text\"><a onclick=\"pageGo("+pageorders[i]+");return false\" style=\"cursor:pointer\">"+pagename+"</a></div></li>"
					            continue;
						}
	            }
			}
			html+="</ul>";
		}
        
		$("#crumbs").html(html);
	})
	function pageName(order){
				if(order==1){
					pagename="模块基本信息"	 
				}else if(order==2){
					pagename="模块依赖关系" 
				}else if(order==3){
					pagename="模块菜单" 
				}else if(order==4){
					pagename="业务模型" 
				}else if(order==5){
					pagename="公用页面"; 
				}else if(order==6){
					pagename="公用类" 
				}else if(order==7){
					pagename="静态资源" 
				}else if(order==8){
					pagename="触发器" 
				}else if(order==9){
					pagename="对外接口" 
				}else if(order==10){
					pagename="多语言" 
				}else if(order==11){
					pagename="数据字典" 
				}
	}
	function pageGo(order,pagename){
		var url=null;
		if(order==1){
			url="${path}sys/moduleMagAction_moduleName.ms";
		}else if(order==2){
			url="${path}sys/moduleMagAction_moduleType.ms";
		}else if(order==3){
			url="${path}sys/moduleMagAction_moduleFunc.ms";
		}else if(order==4){
			url="${path}sys/moduleMagAction_bussExport.ms";
		}else if(order==5){
			url="${path}sys/moduleMagAction_pageExport.ms";
		}else if(order==6){
			url="${path}sys/moduleMagAction_classExport.ms";
		}else if(order==7){
			url="${path}sys/moduleMagAction_moduleSourceExport.ms";
		}else if(order==8){
			url="${path}sys/moduleMagAction_trigTree.ms";
		}else if(order==9){
			url="${path}sys/moduleMagAction_interIframe.ms";
		}else if(order==10){
			url="${path}sys/moduleMagAction_languageExport.ms";
			pagename="多语言";
		}else if(order==11){
			url="${path}sys/moduleMagAction_dictExport.ms";
		}
		$("#exportModule").val(JSON.stringify(exportModule));
		document.getElementById("addForm").action=url;
		document.forms.addForm.submit();
	}
	function changeValue(val){
			if(val=="1"){
				$("#COMM_MODEL").prop("checked",true)
				exportModule.reId="";
				exportModule.loId="";
				initReTree()
				$("#locale_tree").html("");
				$("#MODELS_TYPE").val("1")
			}else{
				$("#BUSS_MODEL").prop("checked",true)
				exportModule.reId="";
				exportModule.loId="";
				initLoTree()
				$("#MODEL_TYPE").val("2")
			}
			
			form.render();
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function up(){
		$("#exportModule").val(JSON.stringify(exportModule));
		document.getElementById("addForm").action="${path}sys/moduleMagAction_moduleName.ms"
		//document.forms.addForm.submit();
		return true;
	}
	function next(thisObj){
		vali();
		if(isSubmit){
			return false
		}
		$("#exportModule").val(JSON.stringify(exportModule));
<%--		alert($("#exportModule").val())--%>
		document.getElementById("addForm").action="${path}sys/moduleMagAction_moduleFunc.ms"
		//document.forms.addForm.submit();
		//util.showTopLoading("请稍后!");
		
		return true;
		
	}
	function vali(){
		var MODEL_START_ORDER=$("#MODEL_START_ORDER").val();
		if(val.isBlank(MODEL_START_ORDER)){
			util.alert("模块启动优先级不能为空");
			isSubmit=true
			return;
		}
		isSubmit=false
	}
	
	var form;
	$(function(){
		layui.use('form', function(){
	    	form = layui.form;
	    	form.render();
	    	  
           	form.on('submit(filterSubmit_up)', function (data) {
           	   document.getElementById("curIframeName").value=window.frameElement.name;
		       var flag=up(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
				       
			}) 
			
			form.on('submit(filterSubmit_next)', function (data) {
           	   document.getElementById("curIframeName").value=window.frameElement.name;
		       var flag=next(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
				       
			}) 
			
			form.on('radio(changeValue)', function(data){
				//console.log(data.elem); //得到select原始DOM对象
				//console.log(data.value); //得到被选中的值
				//console.log(data.othis); //得到美化后的DOM对象
				
				//alert(data.value);
				changeValue(data.value);
			
		 	});
			
			
	    });
	    
	})
	
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>