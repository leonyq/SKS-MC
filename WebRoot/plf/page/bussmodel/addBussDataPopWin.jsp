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
	<script type = "text/javascript" 
	src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
 
	
	
	    <script>
	     
	    var addTableTrMap; 
           if( window.top != window.self ){
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
            	  	    	
            	  	    	
            	  	    }//if( window.top != window.self ){
            	  
          
                
            </script>
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
			    <div class="optn">
			        <button type="button" onclick="addParentData('<c:out value="${paraMap.piframeId}" />','<c:out value="${exeid}" />');"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeCurrentWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bd">
				<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
			<input type="hidden" name="exeid" value="<c:out value='${exeid}'/>">
			<input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}'/>">
			<input type="hidden" name="trId" value="<c:out value='${param.trId}'/>">
			<input type="hidden" name="data" value="<c:out value='${param.data}'/>">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" value="%{FUNC_CODE_2}" />
			<s:token />
			<!-- <table class="basic-table">
							<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
										</tr>
									</table>-->
			<bu:addcpwin formid="${fn:escapeXml(exeid)}" data="${fn:escapeXml(param.data)}" hide="false" relcol="${fn:escapeXml(param.relcol)}"/>
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
		if("<c:out value='${param.trId}' />" != "")
		{
			var data = parentWindow.findData('<c:out value="${param.trId}" />');	
		
			var json = eval('('+ data +')');
			var mapName = '<c:out value="${param.trId}" />'+'_key';
			var mapHeader = null;
			var index = 0;
			var flag = true;
			var name = new Array();
			for(var item in json[mapName])
			{
				item = json[mapName][item];
				if(typeof item == 'string' && item.indexOf("_") != -1)
				{
					index = item.indexOf('_')+1;
					name.push(item.substring(index));
					if(flag)
					{
						flag = false;
						mapHeader = item.substring(0,index - 1) + '_'; 
					}	
				}
			}
			
			for(var item in name)
			{
				if(typeof item == 'string')
				{
					var itemId = null;
					
					itemId = document.getElementById("paraMap0_" + name[item]);
					if(itemId != null)
					{
						itemId.value = json[mapHeader + name[item]];
					}
				}	
			}
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

	function addParentData(e,exeid)
	{
		var parentWindows = $(window.parent.document).contents().find("#"+e)[0].contentWindow;
		var data = $("#addForm").serializeObject();
		
		if("<c:out value='${param.trId}' />" == null || "<c:out value='${param.trId}' />" == "")
		{
			parentWindows.addData(JSON.stringify(data),exeid);
		}
		else
		{
			parentWindows.editData(JSON.stringify(data),exeid,'<c:out value="${param.trId}" />');	
		}
		
		//top.$("#"+window.frameElement.id + "pop").parent().remove();
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	function closeCurrentWindow()
	{
	 //top.$("#"+window.frameElement.id + "pop").parent().remove();
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	
	
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>