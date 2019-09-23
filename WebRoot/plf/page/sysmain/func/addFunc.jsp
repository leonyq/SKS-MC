<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="功能菜单新增" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
		
	</jsp:include>
</head>
<body>
	<div class="all">
		<div  class="add_table_div">
			<form id="add_form" class="layui-form" name="addForm" action="${path}sys/FuncAction_addFunc.ms" method="post">
				<s:token />
				<s:hidden name="funcDto.upId" />
				<s:hidden id="funcDtoUp_id" name="funcDtoUp.id" />
				<s:hidden id="funcDtoUp_name" name="funcDtoUp.name" />
				<s:hidden id="colPath" name="colPath" value="${colPath}"/>
				<table class="add_table">
					<tr>
						<td  class="tr1 mc_form_title title  mc_form_title title ">
							<span class="Eng">*</span>
							<dict:lang value="功能名称" />
						</td>
						
						<td class="widget">
							<input type="text" lay-verify="required" name="funcDto.name" id="funcDto_name"  onkeyup="javascript:util.replaceLikeVal(this)" />
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="菜单类型" />
						</td>
						<td class="widget" >
							<dict:lang value="BS"/>
							<s:hidden name="funcDto.clientType" value="1"></s:hidden>
						</td>
					</tr>
					<tr>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="功能URL" />
						</td>
						<td colspan="4">
							<input type="text" name="funcDto.url" id="funcDto_url" maxlength="4000" style="width: 100%" />
						</td>
					</tr>
<%--					<tr>--%>
<%--					 --%>
<%--						<td  class="tr1 mc_form_title title ">	--%>
<%--							<dict:lang value="编码" />--%>
<%--						</td>--%>
<%--						<td >--%>
<%--							<input type="text" name="funcDto.funcCode" id="funcDto_funcCode" maxlength="33" title="<dict:lang value="不填则系统默认" />" />--%>
<%--						</td>--%>
<%--						--%>
<%--						<td  class="tr1 mc_form_title title ">--%>
<%--							<dict:lang value="菜单类名称" />--%>
<%--						</td>--%>
<%--						<td  colspan="3">--%>
<%--							<input type="text" name="funcDto.className" id="funcDto_className" maxlength="130" style="width: 95%;" title="<dict:lang value="CS菜单类型需要填写" />"/>--%>
<%--						</td>--%>
<%--					</tr>--%>
					<tr>
					<tr>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="功能图标" />
						</td>
						<td class="widget" >
							<input type="text" name="funcDto.img" id="funcDto_img" maxlength="300" />
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="功能类型" />
						</td>
						<td class="widget"  >
							<dict:radioDict dictCode="FUNC_TYPE" verify="funcDtoType"   bindEvent="radioChange" dictValue="0" id="funcDto_type" name="funcDto.type"
								style="cursor: pointer;width:20px;" onclick="showOpenType(this.value)"/>
						</td>
					</tr>
					<!-- 20180131czh-功能标识begin -->
					<tr id="openTypeTr" style="display: none">
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="功能标识" />
						</td>
						<td class="widget" >
							<select name="funcDto.funcFlag" id="funcDto_funcFlag"   disabled="disabled">
								<option value="0"><dict:lang value="平台" /></option>
								<option value="1" selected><dict:lang value="业务" /></option>
							</select>
							<%-- <span class="Eng">* <span id="funcDto_needLogin_err">${errors['funcDto.needLogin'][0]}</span>
							</span> --%>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="菜单弹出方式" />
						</td>
						<td class="widget" >
							<select name="funcDto.openType" id="funcDto_openType"  disabled="disabled">
								<option value="0" selected><dict:lang value="系统标签" /></option>
								<option value="1" ><dict:lang value="浏览器标签" /></option>
							</select>
							<%-- <span class="Eng">* <span id="funcDto_isAuth_err">${errors['funcDto.isAuth'][0]}</span>
							</span> --%>
						</td>
					</tr>
					<!-- 20180131czh-功能标识end -->
					<tr>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="视图ID" />
						</td>
						<td class="widget" >
							<div id="paraMap_view_id_div" style="width: 100%;height: 43px;" class="layui-input-inline">
								<input type="text" name="funcDto.viewId" id="funcDto_viewId" class="p_r_50" maxlength="33" onkeyup="javascript:util.replaceLikeVal(this)" />
								<span>
									<i class="layui-icon layui-icon-search" onclick="getViewId('funcDto_viewId','paraMap_VIEW_NAME_0','paraMap_VIEW_CODE_0')" style="position: absolute;right: 30px;top: 9px;"></i>
									<i class="layui-icon layui-icon-close-fill" onclick="clearData('funcDto_viewId');" style="position: absolute;right: 8px;top: 9px;cursor: pointer;"></i>
                  		  		</span>
							</div>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="功能模型ID" />
						</td>
						<td class="widget" >
							<div id="paraMap_func_mid_div" style="width: 100%;height: 43px;" class="layui-input-inline">
								<input type="text" name="funcDto.funcMId" id="funcDto_funcMId" class="p_r_50" maxlength="33" />
								<span>
									<i class="layui-icon layui-icon-search" onclick="getFuncMId('funcDto_funcMId', 'funcDto_viewId')" style="position: absolute;right: 30px;top: 9px;"></i>
									<i class="layui-icon layui-icon-close-fill" onclick="clearData('funcDto_funcMId');" style="position: absolute;right: 8px;top: 9px;cursor: pointer;"></i>
                  		  		</span>
							</div>
						</td>
					</tr>
					<tr>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="登录控制" />
						</td>
						<td class="widget" >
							<dict:radioDict id="funcDto_needLogin" name="funcDto.needLogin" dictCode="YESNO" dictValue="1" style="width:20px;"/>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="权限控制" />
						</td>
						<td class="widget" >
							<dict:radioDict id="funcDto_isAuth" verify="funcDtoIsAuth" name="funcDto.isAuth"  dictValue="0"  dictCode="YESNO" style="width:20px;"/>
						</td>
					</tr>
					
					<tr>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="前台菜单" />
						</td>
						<td class="widget" >
							<select name="funcDto.isFront"  id="funcDto_isFront">
								<option value="0"><dict:lang value="否" /></option>
								<option value="1" selected><dict:lang value="是" /></option>
							</select>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="是否显示" />
						</td>
						<td class="widget" >
							<select name="funcDto.isShow"  id="funcDto_isShow">
								<option value="0"><dict:lang value="否" /></option>
								<option value="1" selected><dict:lang value="是" /></option>
							</select>
						</td>							
					</tr>
					<tr>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="上级功能名称" />
						</td>
						<td >
							<script>
							var mcIframeName= "<c:out value='${mcIframeName}' />";
							var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
							document.write(mcWindow.frames['mainFrame'].getUpName());
						  </script>
						</td>
						<td>&nbsp;</td>
						<td  class="tr1 mc_form_title title ">
							<dict:lang value="顺序" />
						</td>
						<td >
							<input type="text" name="funcDto.orderBy" id="funcDto_orderBy" maxlength="3"  onkeyup="olnyNumber(this)"/>
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
							<dict:lang value="备注说明" />
						</td>
						<td  colspan="4">
							<textarea rows="3" name="funcDto.remarkText" id="funcDto_remarkText" class="" maxlength="4000" style="width: 100%;resize:none;" ></textarea>
						</td>
					</tr>
				</table>
				<div class="ptop_10 txac">
			 <button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit"><dict:lang value="提交" /></button>
			<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
		</div>
			</form>
		</div>
		<br />
		<br />
		<br />
		
	</div>

	<script type="text/javascript">

	function add(thisObj){
		
		//document.forms.add_form.submit();
		thisObj.onclick = function(){util.alert("数据正在提交，请稍候...");}<%-- 防止重复提交 --%>
	}
        
    function valData(){
    	var funcDtoName = document.getElementById("funcDto_name");
    	if(val.isBlank(funcDtoName)){
    		document.getElementById("funcDto_name_err").innerHTML = "<br/>功能名称-不能为空";
    		funcDtoName.focus();
    		return false;
    	}else{
    		document.getElementById("funcDto_name_err").innerHTML = "";
    	}
    	if(undefined == $("input[name='funcDto.type']:checked").val()){
    		document.getElementById("funcDto_type_err").innerHTML = "<br/>功能类型-不能为空";
    		return false;
    	}else{
    		document.getElementById("funcDto_type_err").innerHTML = "";
    	}

    	if(undefined == $("input[name='funcDto.isAuth']:checked").val()){
    		document.getElementById("funcDto_isAuth_err").innerHTML = "<br/>是否权限控制-不能为空";
    		return false;
    	}else{
    		document.getElementById("funcDto_isAuth_err").innerHTML = "";
    	}

    	if(undefined == $("input[name='funcDto.needLogin']:checked").val()){
    		document.getElementById("funcDto_needLogin_err").innerHTML = "<br/>是否登录控制-不能为空";
    		return false;
    	}else{
    		document.getElementById("funcDto_needLogin_err").innerHTML = "";
    	}
    	
    	/* 不填则系统默认
    	var funcDtoFuncCode = document.getElementById("funcDto_funcCode");
    	if(val.isBlank(funcDtoFuncCode)){
    		document.getElementById("funcDto_funcCode_err").innerHTML = "<br/>编码-不能为空";
    		funcDtoFuncCode.focus();
    		return false;
    	}else{
    		document.getElementById("funcDto_funcCode_err").innerHTML = "";
    	}*/
    	
    	return true;
    }
	function replaceLikeVal(comp){  
        if (comp.value.indexOf("'") != -1 || comp.value.indexOf("\"") != -1|| comp.value.indexOf("<") != -1|| comp.value.indexOf(">") != -1) 
        {  
            //comp.value = comp.value.substring(0, comp.value.length-1);  
            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"");  
            _alertValMsg($(comp),"<dict:lang value="不能输入单引号双引号<>" />");
        }  
    } 
    function olnyNumber(comp) 
    {
	    var reg = /^(0|[1-9][0-9]*)$/;
		if (!reg.test($(comp).val()))
		 {
		 	comp.value = comp.value.replace(/[^0-9]/ig,"");
			  _alertValMsg($(comp),"<dict:lang value="只能输入数字" />");
				return false;
		 }
		
	}

	function getViewId(viewId,viewNameId,viewCode){
		// var funcid = $("#"+viewCode).val();
		// var trId = $("#"+viewId).parents("tr").find("input[type='checkbox']").val();
		var funcid = "";
		var trId = "";

		var url = "${path}sys/BussModelAction_viewModelFrameSet.ms?paraMap.viewId="+viewId+"&paraMap.viewNameId="+viewNameId+"&paraMap.trId="+trId+"&paraMap.viewCode="+viewCode+"&paraMap.funcId="+funcid+"&mcIframeName="+window.frameElement.name;
		showPopWin(url, 1000, 550,getViewIdClearData,"<dict:lang value="视图类型"/>");
	}

	function getViewIdClearData() {
		clearData('funcDto_funcMId');
	}

	function clearData(viewId){
		$("#"+viewId).val("");
	}

	function getFuncMId(funcMId, viewId){
		var view = document.getElementById(viewId);
		if(val.isBlank(view)){
			util.alert("<dict:lang value='请先选择视图ID' />");
			return false;
		}
		var url = "${path}sys/BussModelAction_funcModelRadioListView.ms?paraMap.viewId="+viewId+"&paraMap.ID="+view.value+"&paraMap.funcMId="+funcMId+"&mcIframeName="+window.frameElement.name;
		showPopWin(url, 1000, 550,null,"<dict:lang value="功能模型"/>");
	}
    
    layui.use('form', function(){
    	  var form = layui.form;
    	  //监听提交
    	  form.on('radio(radioChange)', function(data){
    		  var val = data.value;
    		  if(val=="1") {
          		$("#openTypeTr").show();
          		$("#funcDto_funcFlag").removeAttr("disabled");
          		$("#funcDto_openType").removeAttr("disabled");
          	  }else {
          		$("#openTypeTr").hide();
          		$("#funcDto_funcFlag").attr("disabled","disabled");
          		$("#funcDto_openType").attr("disabled","disabled");
          	  };
          	form.render("select");
    	  });
    	  form.verify({
    		  funcDtoType: function(value,item){
    			  var val=$('input:radio[name="funcDto.type"]:checked').val();
    		      if(!val){
    		        return '功能类型不能为空！';
    		      }
    		    },
    		  funcDtoIsAuth: function(value,item){
				  var val=$('input:radio[name="funcDto.isAuth"]:checked').val();
			      if(!val){
			        return '权限控制不能为空！';
			      }
			  }
           });
    	  
    });

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
