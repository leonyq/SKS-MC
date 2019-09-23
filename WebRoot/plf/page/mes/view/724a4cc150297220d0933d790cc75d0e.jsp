<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script>
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
	</script>
	<script type="text/javascript">
		var addTableTrMap;
		var currentTag;
		function switchTag(tag,content,url){
			if(currentTag==tag){
				return false;
			}
		}
		function changeToRest(){
			
			var workTime=document.getElementById("content1");
			workTime.style.display="none";
			var restTime=document.getElementById("content2");
			restTime.style.display="";
		}
		function changeToWork(){
			
			var workTime=document.getElementById("content1");
			workTime.style.display="";
			var restTime=document.getElementById("content2");
			restTime.style.display="none";
		}
	</script>
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="bf65cc04d3be41bbb0db5a9700e8f6f1" />
	<input type="hidden" name="bf65cc04d3be41bbb0db5a9700e8f6f1" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f8a93107f7b347188f7cc2d7567ad33d'" />
		<s:set name="_$formId_1" value="'bf65cc04d3be41bbb0db5a9700e8f6f1'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><span class="dot">*</span><bu:uitn colNo="LIST_NAME" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" /></td>
			<bu:td cssClass="dec-self" colNo="LIST_NAME" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" ><bu:ui colNo="LIST_NAME" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" value="%{LIST_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="LIST_TIME" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" /></td>
			<bu:td cssClass="dec-self" colNo="LIST_TIME" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" ><bu:ui colNo="LIST_TIME" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" value="%{LIST_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="TIME_END" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" /></td>
			<bu:td cssClass="dec-self" colNo="TIME_END" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" ><bu:ui colNo="TIME_END" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" value="%{TIME_END}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="TIME_START" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" /></td>
			<bu:td cssClass="dec-self" colNo="TIME_START" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" ><bu:ui colNo="TIME_START" formId="bf65cc04d3be41bbb0db5a9700e8f6f1" value="%{TIME_START}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="bf65cc04d3be41bbb0db5a9700e8f6f1" formIndex="1" />
									</form>
			<div>
    	       <ul class="tab-list tab">
    	       	<li id="tag1">
    	       		<a class="selectli1" onclick="changeToRest()" href="javascript:void(0)">
    	       			<span class="selectspan1"><dict:lang value="工作时间"/></span></a>
    	       	</li>
    	       	<li id="tag2">
    	       		<a class="selectli1" onclick="changeToWork()" href="javascript:void(0)">
    	       			<span class="selectspan1"><dict:lang value="休息时间"/></span></a>
    	       		</li>
    	       </ul>
    	       <div class="content1" id="content" style="float: left;"> 
    	       	<div class="mod-hd" style="border: none;height: auto;margin: 5px 0;">		
    	       <h3 class="tit" style="border-bottom: none;line-height:21px;"><dict:lang value="工作时间" /></h3>
    	       <div class="extend-btn" style="float: right;">
		   	   <button type="button" onclick="" style="padding: 0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
		   	   <button type="button" onclick="" style="padding: 0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>
		   	   </div>
		   	   </div>
		   	   <div id="content1" >
		   	<table style="height: 150px;" class="dlist-table table-line">
		   		<thead>
		   	  	 <tr class="thcolor">
		   	  	 	<th align="center" width="150px;"><dict:lang value="上班人员"/></th>
		   	  	 	<th align="center" width="150px;"><dict:lang value="开始时间"/></th>
		   	  	 	<th align="center" width="150px;"><dict:lang value="结束时间"/></th>
		   	  	 </tr>
		   	  	 </thead>
		   	  	 <tbody id="">
		   	  	 	
		   	  	 </tbody>
		   	</table>
		   	  </div>
		      </div>
		      <div id="content2" style="display: none;float:left">
		      	  	<table style="height: 150px;" class="dlist-table table-line">
		   		<thead>
		   	  	 <tr class="thcolor">
		   	  	 	<th align="center" width="150px;"><dict:lang value="班别"/></th>
		   	  	 	<th align="center" width="150px;"><dict:lang value="开始时间"/></th>
		   	  	 	<th align="center" width="150px;"><dict:lang value="结束时间"/></th>
		   	  	 </tr>
		   	  	 </thead>
		   	  	 <tbody id="">
		   	  	 	
		   	  	 </tbody>
		   	</table>
		      </div>
           </div>
		   
			
			
			</div>
	</div>
    
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
