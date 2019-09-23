<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表图标显示控件" />UI <dict:lang value="配置" />
	</title>
	
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
		
	</jsp:include>
	
</head>
		
<body>
		<div class="all">
			<div  class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				
				<input type="hidden" name="mcIframeName" id="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				<!--  
				<table class = "func_table">
					<tbody>
						<tr>
							<td width="100%" align="right">
								<input id="addCol" class="layui-btn layui-btn-xs" type="button" class="botton_img_add" value = "<dict:lang value="新增键值" />"></input>
								<input id="delCol" class="layui-btn layui-btn-danger layui-btn-xs" type="button" class="botton_img_del" value= "<dict:lang value="删除键值" />" onclick="delRow()"></input>
							</td>
						</tr>
					</tbody>
				</table>
				-->
				
				<table class="add_table element_table" id="tab">
					<tr>
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="数据来源" />
							
						</td>
						<td  colspan="3">
							<dict:lang value="常量" />
							<input type="hidden" name="paraMap.UI_DATA_TYPE" value="<s:property value="%{@com.more.fw.core.common.method.ConstantsMc@UI_DATA_TYPE_1}" />" />
						</td>
		 
					</tr>
					
					<tr>
						<td  class="tr1 title" >
							<dict:lang value="图标宽度(px)" />
						</td>
						<td  colspan="3">
							<input type = "text" id="icon_width" name="paraMap.icon_width" value="<c:out value='${dataMap.icon_width}'/>" />
						</td>
		 
					</tr>
					
					<tr>
						<td  class="tr1 title" >
							<dict:lang value="图标高度(px)" />
						</td>
						<td  colspan="3">
							<input type = "text" id="icon_height" name="paraMap.icon_height" value="<c:out value='${dataMap.icon_height}'/>" />
						</td>
		 
					</tr>
					
					<tr>
						<td  class="tr1 title" >
							<dict:lang value="上传图片" />
						</td>
						<td  colspan="3">
							<textarea id="morepic" name="paraMap.morepic" value="<c:out value='${dataMap.morepic}'/>" maxlength="500" class="multiFileUploadText" style="width:calc(100% - 50px);overflow:hidden; white-space:normal;" readonly="readonly" rows="4">
							<c:out value='${dataMap.morepic}'/>
							</textarea>
							
							<button style="margin-bottom:16px;" type="button" class="layui-btn layui-btn-xs" onclick="_showMultiFileUpload(this,'morepic','morepic','paraMap_FORM_COL_ID',1,'${dataMap.morepic}');">上传</button>
							
							<input type="hidden" value="/res/updoc/img/listicon_upload" name="morepic_savePath" id="morepic_savePath">
							<input type="hidden" name="morepic_fileSize" id="morefile_fileSize">
							<input type="hidden" name="morepic_fileId" id="morefile_fileId">

						</td>
		 
					</tr>
					
					<!--
					<tr>
						<td  class="tr1" >
							<dict:lang value="业务图片加载函数名称" />
							<span class="Eng">*</span>
						</td>
						<td  colspan="2">
							<input readonly="readonly" type = "text" id="img_onload_func_name" name="paraMap.img_onload_func_name" value="img_onload(tr_obj,col_value,img_obj,img_path)" style="width:85%"/>
						</td>
		 
					</tr>
					<tr>
						<td  class="tr1" >
							<dict:lang value="业务图片加载函数体" />
							<span class="Eng">*</span>
						</td>
						<td  colspan="2">
							<textarea placeholder="//图片加载事件绑定&#13;&#10//根据tr_obj获取其他业务数据 判断显示哪个图片&#13;&#10//根据col_value业务数据 判断显示哪个图片&#13;&#10//img_obj 图片对象&#13;&#10//img_path 图片的保存路径&#13;&#10&#13;&#10if(tr_obj.type='1'){&#13;&#10img_obj.src=img_path+'上传图片名称1';&#13;&#10}else{&#13;&#10img_obj.src=img_path+'上传图片名称2';&#13;&#10}&#13;&#10" id="img_onload_func_body" name="paraMap.img_onload_func_body" rows="12" 
                			style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.img_onload_func_body"/></textarea>
						</td>
		 
					</tr>
					-->
					
					<tr>
						<td  class="tr1 title" >
							<dict:lang value="点击事件函数名称" />
						</td>
						<td  colspan="3">
							<input readonly="readonly" type = "text" id="img_onclick_func_name" name="paraMap.img_onclick_func_name" value="img_onclick(tr_obj,col_value)" />
						</td>
		 
					</tr>
					<tr>
						<td  class="tr1 title" >
							<dict:lang value="点击事件函数体" />
							<br>
			<i class="editCode" style="float: right;margin-right:42px;" id="editCode" onclick="editJsValFun('img_onclick_func_body');"></i>
						</td>
						<td  colspan="3">
							<textarea placeholder="//图片的点击事件绑定&#13;&#10//tr_obj 列表tr对象&#13;&#10//col_value 当前字段值" id="img_onclick_func_body" name="paraMap.img_onclick_func_body" rows="4" 
                			style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.img_onclick_func_body"/></textarea>
                			</br>
						</td>
		 
					</tr>
					
					<!-- 键值配置  开始 -->
					<tr >
						<td class="tr1" align="center">
							<dict:lang value="操作" />
						</td>
						<td class="tr1" align="center">
							<dict:lang value="数据内容" />
						</td>
						<td class="tr1" align="center">
							<dict:lang value="预览" />
						</td>
						<td class="tr1" align="center">
							<dict:lang value="图片名称" />
						</td>
	
					</tr>
					<c:forEach items="${dataMap.UI_DATA}" var="ls" varStatus="index">
					<tr>
						<td align="right"><input type = "checkbox" lay-skin="primary" name="checkbox" style="width:30px" /></td>
						<td ><input title="default 设置默认图片" type = "text" id="keyInput_<c:out value='${ls.num}'/>" name="paramList[<c:out value='${ls.num}'/>].key" value="<c:out value='${ls.key}'/>" style="width:95%"/></td>
						<td ><img src="<c:out value='${dataMap.IMG_PATH}'/><c:out value='${ls.val}'/>" id="img_<c:out value='${ls.num}'/>" width="30" height="30" /></td>
						<td ><input title="上传图片上传的图片名称" onchange="img_change(this,'<c:out value='${ls.num}'/>')" type = "text" id="valInput_<c:out value='${ls.num}'/>" name="paramList[<c:out value='${ls.num}'/>].val" value="<c:out value='${ls.val}'/>" style="width:95%"/></td>
					</tr>
					</c:forEach>
					<!-- 键值配置  结束 -->
				  					
				</table>
				
				<div class="ptop_10 txac">
					<!--  
					<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
					-->
					<input id="addCol" class="layui-btn" type="button" class="botton_img_add" value = "<dict:lang value="新增键值" />"></input>
					<input id="delCol" class="layui-btn layui-btn-danger" type="button" class="botton_img_del" value= "<dict:lang value="删除键值" />" onclick="delRow()"></input>
							
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin_ui();" class="layui-btn layui-btn-danger">
				</div>
				
			</form>
			</div>
		</div>



	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	var curJsFunObj;
	
	function editJsValFun(thisObj){
		curJsFunObj = $("#"+thisObj);
		var url = "${path}sys/BussModelAction_forEditJsValFun.ms?funcFlag=control&mcIframeName="+parent.frameElement.name;
		showPopWin(url, '99%', '99%',null,"修改 "); 
	}
	function getJsFunCode(){
		return curJsFunObj.val();//curJsFunObj.value;
	}
	
	function setJsFunCode(code){
		curJsFunObj.val(code) ;
	}
	
	function setJsFunObjFoucue(){
		//curJsFunObj.focus();
	}
	
	
	var isSubmit = false;
	var total = "<c:out value='${dataMap.UI_DATA_TOTAL}' />";
	var count = 0;
	if(total != null && total != "")
	{
		count = total;
	}
	
	function reloadPg(msg){
		isSubmit = false;
		//window.parent.parent.reloadPg(msg);
		window.parent.parent.add();
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function add(thisObj){
		//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return false;
		}
		//document.forms.add_form.submit();
		//isSubmit = true;
		return true;
	}
        
	function valData(){
		var icon_width = document.getElementById("icon_width");
   		if(!val.isBlank(icon_width)){
   			 var reg = /^(0|[1-9][0-9]*)$/;
			 if (!reg.test(icon_width.value))
			 {
				  _alertValMsg(icon_width,"<dict:lang value="图标宽度" /> -- <dict:lang value="只能输入数字" />");
				  return false;
			 }
			 
	  	}
	  	
	  	var icon_height = document.getElementById("icon_height");
   		if(!val.isBlank(icon_height)){
   			 var reg = /^(0|[1-9][0-9]*)$/;
			 if (!reg.test(icon_height.value))
			 {
				  _alertValMsg(icon_height,"<dict:lang value="图标高度" /> -- <dict:lang value="只能输入数字" />");
				  return false;
			 }
			 
	  	}
	  	
	  	/*
	  	var img_onload_func_body = document.getElementById("img_onload_func_body");
   		if(val.isBlank(img_onload_func_body)){
   			 _alertValMsg(img_onload_func_body,"<dict:lang value="业务图片加载函数体" /> -- <dict:lang value="不能为空" />");
			 return false;
			 
	  	}
	  	*/
	  	//alert(count);
	  	var keyElement = null;
		var valElement = null;
		for(var i = 0; i <= count - 1; i++ )
		{
			keyElement = document.getElementById("keyInput_" + i);
			valElement = document.getElementById("valInput_" + i)
			if(keyElement != null)
			{
				console.log("key:" + keyElement.value);
				if(keyElement.value == null || keyElement.value == "")
				{
					
					util.alert("<dict:lang value="数据内容不能为空" />");
					return;
				}
			}
			if(valElement != null)
			{
				console.log("val:" + valElement.value);
				if(valElement.value == null || valElement.value == "")
				{
					util.alert("<dict:lang value="展示内容不能为空" />");
					return;
				}
			}

		}	
		
		if(count==0){
			util.alert("<dict:lang value="键值配置不能为空" />");
			return;
		}
    
		return true;
	}
	
	function setUiData(thisObj){
		$('#UI_DATA_2').hide();
		$('#UI_DATA_3').hide();
		$('#UI_DATA_4').hide();
		$('#UI_DATA_'+$(thisObj).val()).show();
	}
	
	function init(){
	}
	
	setUiData($("#paraMap_UI_DATA_TYPE"));
	
	//多文件上传
	function _showMultiFileUpload(thisObj,id,colNo,prefixInd,type,morepic){
	  morepic=document.getElementById("morepic").value;
	  
      var  popId = window.frameElement.id;
      var iframeId = window.parent.name;
      //var  fileNames = $("#"+id).val();
      var  savePath = $("#"+id+"_savePath").val();
      var fileName = $("#"+id).val();
      var prefix = "";
      var isSearchDb = "1";
      if(fileName!=""){
        isSearchDb ="2";
      }
      if(type=="1"){
        prefix = $("#"+prefixInd).val();
      }else{
        prefix = $("#"+colNo+"_FILE").val();
      }
      //var  fileSize = $("#"+id+"_fileSize").val();
      //var url = "/mc/buss/bussModel_showMultiFileUploadPage.ms?paraMap.componentId="+id+"&paraMap.popId="+popId+"&paraMap.savePath="+savePath+"&paraMap.primaryVal="+(prefix+"_"+colNo)+"&paraMap.isSearchDb="+isSearchDb;
      var url = "${path}/buss/bussModel_showMultiFileUploadPageByui.ms?paraMap.componentId="+id+"&paraMap.popId="+popId+"&paraMap.savePath="+savePath+"&paraMap.primaryVal="+prefix+"&paraMap.isSearchDb="+isSearchDb   +"&paraMap.morepic="+morepic+"&paraMap.iframeId="+iframeId;
      //showPopWinFp(url, 800, 500,null,"?文件上传",id+"_file");
      showPopWin(url, 560, 400,null,"?图片上传",id+"_file");
      thisObj.blur();
    
  }
  
  //新增键值
  $('#addCol').click(function()
  {
		
		var trHTML = "<tr>";
		var checkBox = "<td align=\"right\" line-height=\"28px\"><input type=\"checkbox\" lay-skin=\"primary\" style=\"width:30px\" /></td>"
		var keyInput = "<td line-height=\"28px\"><input title=\"default 设置默认图片\" type=\"text\" style=\"width:95%\" id=\"keyInput_" + count + "\" name=\"paramList[" + count + "].key\"/></td>";
		
		var imgInput = "<td ><img src=\"${path}plf//js//ueditor//dialogs//scrawl//images//addimg.png\" id=\"img_" + count + "\" width=\"30\" height=\"30\" /></td>";
		
		var valInput = "<td line-height=\"28px\"><input  title=\"上传图片上传的图片名称\" onchange=\"img_change(this,'"+count+"')\" type=\"text\" style=\"width:95%\" id=\"valInput_" + count + "\" name=\"paramList[" + count + "].val\"/></td>";
		
		trHTML += checkBox;
		trHTML += keyInput;	
		trHTML += imgInput;	
		trHTML += valInput;
		trHTML += "</tr>";
		$("#tab").append(trHTML);
	
		count++;
		form.render();
	});
	
	//删除键值
	function delRow(){
		var delIds="";
		var removeAdd = false;
		console.log("delRow");
		$("#tab").find("tbody tr").each(function(seq) {
			var ckBoxObj = $(this).find("td").eq(0).find("input[type='checkbox']");
			if(ckBoxObj.prop("checked")){
					count--;
					$(this).remove();
					removeAdd = true;
				}else{
					var ck_value=ckBoxObj.val();
					if(ck_value!=null && ck_value!=''){
						delIds+=ck_value;
						delIds+=",";
					
					}
					
				}
		});
		//alert(delIds);
		if(""==delIds){
			if(!removeAdd){
				util.alert("<dict:lang value="请至少勾选一条记录" />");
			}else{
				util.alert("<dict:lang value="删除成功" />");
			}
			return false;
		}
		delId = delIds;
		return true;
	}
	
	function img_change(obj,id){
		var img_path = "<c:out value='${dataMap.IMG_PATH}' />";
		var img_name=$.trim(obj.value);
		document.getElementById("img_" + id).src=img_path+img_name;
	}
	
	
	var form;
$(function(){
	layui.use('form', function(){
	    	 form = layui.form;
	          
			 form.on('submit(filterSubmit)', function (data) {
			 document.getElementById("mcIframeName").value=window.parent.location.href;
			 document.getElementById("curIframeName").value=window.parent.name;
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
				       
			}) 
	
	    });
	    
})

</script>
<script src="${path}plf/page/js_files/comm/chk.form.ui.control.vals.js?_mc_res_version=<%=PlfStaticRes.ChkFormUiControlVals %>"></script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>