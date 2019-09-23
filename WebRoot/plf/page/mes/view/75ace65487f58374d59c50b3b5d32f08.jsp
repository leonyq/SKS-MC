<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<style>
		.dlist-table td{
			padding:0 !important;
		}
		._edit input{
			width: 100%;
			height: 28px;
			border: none;
			padding: 0 5px;
			box-sizing: border-box;
		}
		._edit textarea{
			border: none !important;
			padding: 5px !important;
			height:28px;
		}
		._edit select{
			border: none;
			height:100%;
		}
	</style>
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
		
		
	var div1Temp='';
	var div2Temp='';
	function saveTemp(){
	 div1Temp=$("#editTable1");
	 div2Temp=$("#editTable2");
	}
	
	function showTable(thisObj){
		var type=$("#paraMap1_TBR_ANALYTIC_TYPE").val();
		if(type==2){
		   document.getElementById("div1").style.display="none";
		if(div2Temp!=''){
		   $("#div2").html(div2Temp);
		    div2Temp="";
		}
		  document.getElementById("div2").style.display="block";
		}
		else if(type==1){
		   document.getElementById("div2").style.display="none";
		   if(div1Temp!=''){
		     $("#div1").html(div1Temp);
		     div1Temp="";
		}
		document.getElementById("div1").style.display="block";
		}
	}
	</script>
</head>
<body>
	<div class="edit">
            <div class="hd">
                            <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="saveTemp();saveNew(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="formId" value="05b39a22c63b4544be3294a59d5dd767" />
										 <input type="hidden" name="iframeId" value="${iframeId}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="05b39a22c63b4544be3294a59d5dd767" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="05b39a22c63b4544be3294a59d5dd767" />
	<input type="hidden" name="05b39a22c63b4544be3294a59d5dd767" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'7dc2d53a210846ce9cbfaaee92535104'" />
		<s:set name="_$formId_1" value="'05b39a22c63b4544be3294a59d5dd767'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:63px;"><span class="dot">*</span><bu:uitn colNo="TBR_NAME" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td  class="dec" style="width:250px;"><bu:ui colNo="TBR_NAME" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_NAME}" formIndex="1" /></td>
			<td class="name" style="width:63px;"><span class="dot">*</span><bu:uitn colNo="TBR_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td  class="dec" style="width:250px;"><bu:ui colNo="TBR_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_TYPE}" formIndex="1" /></td>
			<td class="name" style="width:63px;"><span class="dot">*</span><bu:uitn colNo="TBR_ANALYTIC_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td  class="dec"  style="width:230px;"><bu:ui colNo="TBR_ANALYTIC_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_ANALYTIC_TYPE}" formIndex="1" onchange="showTable(this);" /></td>
	
	    </tr>
		<tr>
		    <td class="name" ><bu:uitn colNo="TBR_MATCH_CHAR" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td  class="dec" ><bu:ui colNo="TBR_MATCH_CHAR" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_MATCH_CHAR}" formIndex="1" /></td>
		     <td class="name" ><bu:uitn colNo="TBR_STATUS" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td  class="dec" ><bu:ui colNo="TBR_STATUS" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_STATUS}" formIndex="1" />
			</td>
		    <td class="name" ><bu:uitn colNo="TBR_DEFAULT" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
		
		    <td class="dec" >
				<bu:ui colNo="TBR_DEFAULT" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_DEFAULT}" formIndex="1" />
			</td>
		
		</tr>
		
		<tr>
				
			<td class="name" ><bu:uitn colNo="TBR_MEMO" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="dec" colspan="5"><bu:ui colNo="TBR_MEMO" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_MEMO}"   style="height:80px;width:100%;" formIndex="1" /></td>
		</tr>
		
	</table>
			<bu:jsVal formId="05b39a22c63b4544be3294a59d5dd767" formIndex="1" />

    <div id="div1">
				<table id="editTable1" class="dlist-table table-line">
					<thead>
					<tr>
					    						
						<th style="width:100px;table-layout: fixed;">
							<dict:lang value="内容" />
						</th>
						<th style="width:150px" >
							<dict:lang value="数据源对象" />
						</th>
						<th style="width:100px" >
							<dict:lang value="对应列名" />
						</th>
						<th style="width:100px" >
							<dict:lang value="过滤字段" />
						</th>
						
						<th style="width:150px" >
							<dict:lang value="解析方法名" />
						</th>
						<th>
							<dict:lang value="备注" />
						</th>
					</tr>
					</thead>
					<tbody>
					
						<tr>							
							<td class="name" style="width:14%" align="center" >
								<span class="_show">料号&nbsp;<input type="hidden" name="paramList[0].BE_CONTENT"
										value="A"  /> </span>								
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[0].BE_SOURCE"
										value=""   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[0].BE_VALUE"
										value="<s:property value="BE_VALUE"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[0].BE_SELECT"
										value="<s:property value="BE_SELECT"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[0].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[0].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>						
							
						</tr>
						
						<tr>							
							<td class="name" align="center">
								<span class="_show">数量&nbsp; <input type="hidden" name="paramList[1].BE_CONTENT"
										value="B"  /></span>								
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[1].BE_SOURCE"
										value="<s:property value="BE_SOURCE"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[1].BE_VALUE"
										value="<s:property value="BE_VALUE"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[1].BE_SELECT"
										value="<s:property value="BE_SELECT"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[1].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[1].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>					
							
						</tr>
						<tr>							
							<td class="name"  align="center">
								<span class="_show">批号&nbsp;<input type="hidden" name="paramList[2].BE_CONTENT"
										value="C"  /> </span>								
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[2].BE_SOURCE"
										value="<s:property value="BE_SOURCE"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[2].BE_VALUE"
										value="<s:property value="BE_VALUE"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[2].BE_SELECT"
										value="<s:property value="BE_SELECT"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[2].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[2].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>						
							
						</tr>
						<tr>							
							<td class="name" align="center">
								<span class="_show">供应商代码&nbsp;<input type="hidden" name="paramList[3].BE_CONTENT"
										value="D"  />  </span>								
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[3].BE_SOURCE"
										value="<s:property value="BE_SOURCE"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[3].BE_VALUE"
										value="<s:property value="BE_VALUE"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[3].BE_SELECT"
										value="<s:property value="BE_SELECT"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[3].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[3].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>						
							
						</tr>
						<tr>							
							<td class="name" align="center">
								<span class="_show">追溯码 &nbsp;<input type="hidden" name="paramList[4].BE_CONTENT"
										value="E"  /> </span>								
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[4].BE_SOURCE"
										value="<s:property value="BE_SOURCE"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[4].BE_VALUE"
										value="<s:property value="BE_VALUE"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[4].BE_SELECT"
										value="<s:property value="BE_SELECT"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[4].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[4].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>						
							
						</tr>
						<tr>							
							<td class="name" align="center">
								<span class="_show">生产日期&nbsp;<input type="hidden" name="paramList[5].BE_CONTENT"
										value="G"  />  </span>								
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[5].BE_SOURCE"
										value="<s:property value="BE_SOURCE"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[5].BE_VALUE"
										value="<s:property value="BE_VALUE"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[5].BE_SELECT"
										value="<s:property value="BE_SELECT"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[5].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[5].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>						
							
						</tr>
						
					</tbody>
				</table>
			</div>
			
			
			
			 <div id="div2" style="display:none">
				<table id="editTable2" class="dlist-table table-line">
					<thead>
					<tr>
						<th style="width:100px;table-layout: fixed;">
							<dict:lang value="内容" />
						</th>
						<th style="width:80px">
							<dict:lang value="字符类型" />
						</th>
						<th style="width:60px">
							<dict:lang value="前分隔符" />
						</th>
						<th style="width:80px" >
							<dict:lang value="位置" />
						</th>
						
						<th style="width:60px">
							<dict:lang value="后分隔符" />
						</th>
						<th style="width:80px" >
							<dict:lang value="长度" />
						</th>
						<%-- <th width="10%">
							<dict:lang value="是否包含前分隔符" />
						</th> --%>
						<th style="width:150px">
							<dict:lang value="解析方法名" />
						</th>
						<th>
							<dict:lang value="备注" />
						</th>
					</tr>
					</thead>
					<tbody>
					
						<tr>	
							<td class="name"  align="center">
								<span class="_show">料号<input type="hidden" name="paramList[0].BE_CONTENT"
										value="A"  /> </span>
							</td>								
							<td>
								<span class="_show"> </span>
								<span class="_edit"><select name="paramList[0].BE_SOURCE" style="width:100%" >
                                      <option value=""></option>
                                      <option value="1">分隔符</option>
                                      <option value="2">定长</option>
                                 </select></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[0].BE_REFERENCE_BEG"
										value="<s:property value="BE_REFERENCE_BEG"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[0].BE_BEG"
										 onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')"  /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[0].BE_REFERENCE_END"
										value="<s:property value="BE_REFERENCE_END"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[0].BE_LEN"
										value="<s:property value="BE_LEN"/>"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')" /></span>
							</td>
							
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[0].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[0].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>						
							
						</tr>
						
						<tr>						
							<td class="name" align="center">
								<span class="_show">数量 <input type="hidden" name="paramList[1].BE_CONTENT"
										value="B"  /></span>
							</td>								
							<td>
								<span class="_show"> </span>
								<span class="_edit"><select name="paramList[1].BE_SOURCE" style="width:100%" >
                                      <option value=""></option>
                                      <option value="1">分隔符</option>
                                      <option value="2">定长</option>
                                 </select></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[1].BE_REFERENCE_BEG"
										value="<s:property value="BE_REFERENCE_BEG"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[1].BE_BEG"
										onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')"  /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[1].BE_REFERENCE_END"
										value="<s:property value="BE_REFERENCE_END"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[1].BE_LEN"
										onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')"   /></span>
							</td>
							
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[1].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[1].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>				
							
						</tr>
						<tr>
							<td class="name" align="center">
								<span class="_show">批号<input type="hidden" name="paramList[2].BE_CONTENT"
										value="C"  /> </span>	
						</td>							
						<td>
								<span class="_show"> </span>
								<span class="_edit"><select name="paramList[2].BE_SOURCE"  style="width:100%" >
                                      <option value=""></option>
                                      <option value="1">分隔符</option>
                                      <option value="2">定长</option>
                                 </select></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[2].BE_REFERENCE_BEG"
										value="<s:property value="BE_REFERENCE_BEG"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[2].BE_BEG" onblur="this.value=this.value.replace(/\D/g,'')"
										onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[2].BE_REFERENCE_END"
										value="<s:property value="BE_REFERENCE_END"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[2].BE_LEN"
										value="<s:property value="BE_LEN"/>"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')" /></span>
							</td>
							
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[2].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[2].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>					
							
						</tr>
						<tr>
							<td class="name" nowrap="nowrap" align="center">
								<span class="_show">供应商代码<input type="hidden" name="paramList[3].BE_CONTENT"
										value="D"  />  </span>	
							</td>							
							<td>
								<span class="_show"> </span>
								<span class="_edit"><select name="paramList[3].BE_SOURCE" style="width:100%" >
                                      <option value=""></option>
                                      <option value="1">分隔符</option>
                                      <option value="2">定长</option>
                                 </select></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[3].BE_REFERENCE_BEG"
										value="<s:property value="BE_REFERENCE_BEG"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[3].BE_BEG"
										onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[3].BE_REFERENCE_END"
										value="<s:property value="BE_REFERENCE_END"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[3].BE_LEN"
										onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')"  /></span>
							</td>
							
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[3].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[3].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>	
						</tr>
						<tr>
							<td class="name" align="center">
								<span class="_show">追溯码 <input type="hidden" name="paramList[4].BE_CONTENT"
										value="E"  /> </span>	
							</td>							
							<td>
								<span class="_show"> </span>
								<span class="_edit"><select name="paramList[4].BE_SOURCE" style="width:100%" >
                                      <option value=""></option>
                                      <option value="1">分隔符</option>
                                      <option value="2">定长</option>
                                 </select></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[4].BE_REFERENCE_BEG"
										value="<s:property value="BE_REFERENCE_BEG"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[4].BE_BEG"
										onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[4].BE_REFERENCE_END"
										value="<s:property value="BE_REFERENCE_END"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[4].BE_LEN"
										onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')"  /></span>
							</td>
							
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[4].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[4].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>						
							
						</tr>
						<tr>	
							<td class="name" align="center">
								<span class="_show">生产日期<input type="hidden" name="paramList[5].BE_CONTENT"
										value="G"  />  </span>		
							</td>						
							<td>
								<span class="_show"> </span>
								<span class="_edit"><select name="paramList[5].BE_SOURCE" style="width:100%" >
                                      <option value=""></option>
                                      <option value="1">分隔符</option>
                                      <option value="2">定长</option>
                                 </select></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[5].BE_REFERENCE_BEG"
										value="<s:property value="BE_REFERENCE_BEG"/>"   /></span>
							</td>	
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[5].BE_BEG"
										onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[5].BE_REFERENCE_END"
										value="<s:property value="BE_REFERENCE_END"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[5].BE_LEN"
										onkeyup="this.value=this.value.replace(/\D/g,'')"  onblur="this.value=this.value.replace(/\D/g,'')"   /></span>
							</td>
							
							<td>
								<span class="_show"> </span>
								<span class="_edit"><input type="text" name="paramList[5].BE_PRO"
										value="<s:property value="BE_PRO"/>"   /></span>
							</td>
							<td>
								<span class="_show"> </span>
								<span class="_edit"><textarea name="paramList[5].BE_MEMO" rows="1" 
										  ></textarea></span>
							</td>						
							
						</tr>
						
					</tbody>
				</table>
			</div>
	
			</form>
		
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		 document.getElementById("paraMap1_TBR_STATUS_1").checked=true;
		
	}//初始化方法
	function setModify(thisObj){
		$(thisObj).parent().parent().parent().find("td").eq(0).find("input[type='checkbox']").prop("checked",true);
	}

</script>
<bu:script viewId="7dc2d53a210846ce9cbfaaee92535104" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
