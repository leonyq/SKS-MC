<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	<script type="text/javascript">
	//加载父ifream中的js\css文件
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
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
		var addTableTrMap;


	</script>
	<!-- 产品静态资源 -->
	#{view.dist.static.resources}#
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
			    <div class="optn">
			        <button type="button" onclick="addParentData('<c:out value="${param.piframeId}" />','<c:out value="${param.viewid}" />','<c:out value="${exeid}" />');"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeCurrentWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bd">
				<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
			<input type="hidden" name="exeid" value="<c:out value='${exeid}' />">
			<input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}' />">
			<input type="hidden" name="trId" value="<c:out value='${param.trId}' />">
			<input type="hidden" name="data" value="<c:out value='${param.data}' />">
			<s:token />
			<!-- <table class="basic-table">
							<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
										</tr>
									</table>-->
			#{view.dist.addPopWinChildren}#
				<table class="func_table">
				<tr>
					<td width="100%" align="right">
						
					</td>
				</tr>
				</table>
			</form>
		</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
		$(function(){
		var parentWindow = $(window.parent.document).contents().find("#"+'<c:out value="${param.piframeId}" />')[0].contentWindow;
		if('<c:out value="${param.relcol}" />' != '')
		{
			$("table").find("tr").each(function(i,item){
				if($(item).attr('colName') == '<c:out value="${paraMap.relcolName}" />')
				{
					$(item).remove();
				}
			});
		}
		if("<c:out value='${param.col}' />" != "")
		{
			//console.log(cells.length);
			$("table tr").find("td").each(function(i,item)
			{
				if($(item).hasClass("dec-self"))
				{	
					var temp = parentWindow.findTr('td_' + '<c:out value="${param.col}" />' + '#' + $(item).attr("colno"));
					if(temp == null || typeof(temp) == 'undefind')
					{
						return;
					}
					else
					{
						var itemCopy = new Array();
						$(item).children().each(function(i,element){
							//console.log(item);
							//console.log(item.nodeName);
							if(element.nodeName == 'SCRIPT')
							{
								itemCopy.push($(element).clone());	
							}
						});
							$(item).empty();
						if(temp.children().length > 0 && temp.children().hasClass("dept_select")){
							$(item).append($(temp.children()[0]).css("display","block"));
						}else{
							//alert(i + ":"+ temp.html());
							$(item).append(temp.children());
							
						}
						for(var j = 0; j < itemCopy.length ;j++)
						{
							$(item).append(itemCopy[j]);
						}
					}
				}
			});
		}
		if(document.all)
		{
			var list = $("table tr .dec-self").each(function(i,item)
			{
				var evn = new Array();
				var temp = new Array();
				var l = 0;
				for(var k = 0; k < item.children.length; k++)
				{
					if(typeof($(item.children[k]).attr("ondblclick")) != "undefined" && $(item.children[k]).attr("ondblclick") != null && $(item.children[k]).attr("ondblclick") != "" )
					{
						evn[l] = $(item.children[k]).attr("ondblclick") + " ";
						$(item.children[k]).attr("ondblclick","");
						$(item.children[k]).attr("ondblclick",evn[l]);
						//$(item.children[k]).bind("dblclick",function(){eval(evn[l]);});
						l++;
					}
					if(typeof($(item.children[k]).attr("onclick")) != "undefined" && $(item.children[k]).attr("onclick") != null && $(item.children[k]).attr("onclick") != "" )
					{
						
						evn[l] = $(item.children[k]).attr("onclick") + " ";
						$(item.children[k]).attr("onclick","");
						$(item.children[k]).attr("onclick",evn[l]);
						//$(item.children[k]).bind("click",function(){eval(evn[l]);});
						l++;
					}
					if(typeof($(item.children[k]).attr("onfocus")) != "undefined" && $(item.children[k]).attr("onfocus") != null && $(item.children[k]).attr("onlclick") != "" )
					{
						
						evn[l] = $(item.children[k]).attr("onfocus") + " ";
						$(item.children[k]).attr("onfocus","");
						$(item.children[k]).attr("onfocus",evn[l]);
						//$(item.children[k]).bind("focus",function(){eval(evn[l]);});
						l++;
					}
				}
			});
		}
	});
	
	
	
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		
	}//初始化方法
		
	$.fn.serializeObject = function()
	{
		var o = {};
		var a = this.serializeArray();
		$.each(a, function()
		{
			if (o[this.name]){
				if( !o[this.name].push){
					o[this.name] = [o[this.name]];
				}
				o[this.name].push(this.value || '');
			}
			else{
				o[this.name] = this.value || '';	
			}
		});
		return o;
	}

	function addParentData(e,exeid,viewid)
	{
		var parentWindows = $(window.parent.document).contents().find("#"+e)[0].contentWindow;
		var cp = $("table tr .dec-self").clone(1);
		
		var col = "<c:out value='${param.col}' />";
		if(col == '')
		{
			col = parentWindows.addData(e,exeid,viewid);
		}

		$("table tr").find("td").each(function(i,item){
				parentWindows.editData($(item).clone(),col ,$(item).attr("colno"));
		});

		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	
	
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>