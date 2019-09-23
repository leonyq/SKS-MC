<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<script type="text/javascript"><%-- 业务模型公用JS页面 --%>
<!--	
	var _GLO_FORM_PAGE_MAP = {};<%-- 子分页map对象 --%>
	var _thisSelObj;
	"P:/Users/liuth/Desktop/上传图片控件优化方案"
	$(function(){
		$('.ico-date-h').css('left',$('.ico-date-h').prev().width() + 7 - 15 + 'px');
		$('.ico-date-readonly').css('left',$('.ico-date-readonly').prev().width() + 7 - 15 + 'px');
		$('.ico-search-input').css('left',$('.ico-search-input').prev().width() + 7 - 15 + 'px');	
	});
	
	
	function _showSelDict(thisObj,dictCode){
		_thisSelObj = thisObj;
		var url = "${path}sys/BussModelAction_showSelDict.ms?paraMap.UI_DATA="+dictCode;
		showPopWinFp(url, 500, 300,null,"<dict:lang value="数据字典选择"/>");
		thisObj.blur();
	}
	function _showSelFk(thisObj,fk,title){
		_thisSelObj = thisObj;
		//var url = "${path}sys/BussModelAction_showSelFk.ms?paraMap.title="+title+"&paraMap.UI_DATA="+encodeURI(fk);
		var url = "${path}buss/bussModel_showSelFk.ms?paraMap.title="+title+"&paraMap.UI_DATA="+fk;
		//alert(url);
		showPopWinFp(url, 600, 350,null,"<dict:lang value="选择"/>"+title);
		thisObj.blur();
	}
	<%-- jparam为json字符串格式的参数 --%>
	function _showSelFkSql(thisObj,fk,title,jparam,wp,id){
		//alert(window.frameElement.id);
		_thisSelObj = thisObj;
		var width=600;
		var height=350;
		if(undefined == jparam || null == jparam){
			jparam = "";
		}else if(jparam == "noShowPop"){
			return;
		}else{
			jparam = "&paraMap.param="+encodeURI(util.toString(jparam));
		}
		var domId = $(thisObj).prop("id");
		var isOpenDataAuth = $("#"+domId+"_isOpenDataAuth").val();
		var dataAuth = "";
		var domDataAuthId = "";
		if($("#deptLs_data_auth").length==0){
			dataAuth = $("#DATA_AUTH").val();
			domDataAuthId = "#DATA_AUTH";
		}else{
			dataAuth = $("#deptLs_data_auth").val();
			domDataAuthId = "#deptLs_data_auth";
		}
		var isOpenDataAuthPrompt = $("#"+domId+"_isOpenDataAuthPrompt").val();
		if(dataAuth=="" && isOpenDataAuthPrompt=="1"){
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先选择组织机构！" />","","260","145");
			return;
		}
		if(dataAuth==""){
			var option = "";
			$(domDataAuthId+" option").each(function(){
				option = $(this).val();
				if(option==""){
					return true;
				}
				dataAuth+=option+",";
			});
			dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
		}
		
		
		var wpObj=JSON.parse(decodeURIComponent(wp));
		if(wpObj.WP_FULL_SCREEN=='0'||wpObj.WP_FULL_SCREEN==''){
			if(wpObj.WP_WIDTH!=''){
				width=parseFloat(wpObj.WP_WIDTH);
			}
			if(wpObj.WP_HEIGHT!=''){
				height=parseFloat(wpObj.WP_HEIGHT);
			}
		}else{
			height=$(top).height();
			width=$(top).width();
		}
		var url = "${path}buss/bussModel_showSelFkSqlPage.ms?paraMap.dataAuth="+dataAuth+"&paraMap.isOpenDataAuth="+isOpenDataAuth+"&paraMap.title="+title+"&paraMap.popId="+id+"&paraMap.UI_DATA="+encodeURI(fk)+jparam;
		showPopWinFp(url, width, height,null,"<dict:lang value="选择"/>"+title,id);
		thisObj.blur();
	}
	function _selectAlimsg(thisObj,submitFormId){//短信模板选择页面
		_thisSelObj = thisObj;
		var width=600;
		var height=350;
		var ipt = document.createElement("input");
		ipt.setAttribute("type","hidden");
		ipt.setAttribute("id","_aliMsg_id");
		ipt.setAttribute("name","param._aliMsg_id");
		var div = document.getElementById(submitFormId);
		if($("#_aliMsg_id").length==0){
			div.appendChild(ipt);
		}
		var url = "${path}sys/ALIMsgAction_showSelPage.ms";
		showPopWin(url, width, height,null,"<dict:lang value="选择阿里短信模板"/>","_selectAliMsg_frame");
		thisObj.blur();
	}
	function _selectUserIphone(thisObj,submitFormId){//用户手机号选择页面
		_thisSelObj = thisObj;
		var width=600;
		var height=350;
		var url = "${path}sys/ALIMsgAction_showUserPhonePage.ms";
		showPopWin(url, width, height,null,"<dict:lang value="选择用户电话"/>","_selectUserPhone_frame");
		thisObj.blur();
	}
	function _showCommonTablePage(thisObj,classId,pageId,title,jparam,wp,id){
		var thisId = $(thisObj).prev().attr("id");
		var domId = $(thisObj).prop("id");
		if(domId==""){
			domId = thisId;
		}
		var isOpenDataAuth = $("#"+domId+"_isOpenDataAuth").val();
		var dataAuth = "";
		var domDataAuthId = "";
		if($("#deptLs_data_auth").length==0){
			dataAuth = $("#DATA_AUTH").val();
			domDataAuthId = "#DATA_AUTH";
		}else{
			dataAuth = $("#deptLs_data_auth").val();
			domDataAuthId = "#deptLs_data_auth";
		}
		var isOpenDataAuthPrompt = $("#"+domId+"_isOpenDataAuthPrompt").val();
		if(dataAuth=="" && isOpenDataAuthPrompt=="1"){
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先选择组织机构！" />","","260","145");
			return;
		}
		if(dataAuth==""){
			var option = "";
			$(domDataAuthId+" option").each(function(){
				option = $(this).val();
				if(option==""){
					return true;
				}
				dataAuth+=option+",";
			});
			dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
		}
		var url = "${path}buss/bussModel_commonTableListPage.ms?paraMap.dataAuth="+dataAuth+"&paraMap.isOpenDataAuth="+isOpenDataAuth+"&paraMap.title="+title+"&paraMap.popId="+id+"&paraMap.classId="+classId+"&paraMap.pageId="+pageId+"&paraMap.thisId="+thisId;
		showPopWinFp(url, 700, 450,null,"<dict:lang value="选择"/>"+title,id);
		thisObj.blur();
	}
	
	// 1 表单ID语句 2 控件类型 3 元素ID 4 选择组织机构的值 5 该字段ID 6 类型 7 自定义参数
	function _controlsDataAuth(formId,type,domId,dataAuth,formColId,uiType,jsonstr){
		var uiId = "",jsonstr="",selectedValue="";
		var saveMark = $("#"+domId+"_SaveMark").val();
		var selectExeFunction = $("#"+domId+"_SelectExeFunction").val();
		var isOpenDataAuth = $("#"+domId+"_isOpenDataAuth").val();//是否开启组织机构权限
		var option = "<option value=''><dict:lang value="--请选择--"/></option>";
		if(selectExeFunction){
			jsonstr = eval('('+selectExeFunction+')');
		};
		if(uiType=="edit"){ //修改界面
			selectedValue = $("#"+domId+"_SelectedValue").val();
		};
		if(uiType=="view"){ //列表界面
			uiId = $("#"+domId+"_UiId").val();
		}
		$.ajax({
			type : "POST",
			url : "${path}buss/bussModel_controlsDataAuth.ms",
			data : {formId:formId,dataAuth:dataAuth,formColId:formColId,uiType:uiType,jsonstr:jsonstr,uiId:uiId,isOpenDataAuth:isOpenDataAuth},
			success : function(response) {
			    var data = response.ajaxList;
			    if(data.length>0){
		    		$.each(data,function(i,v){
		    			if((v.VAL == selectedValue||v.MKEY== selectedValue) && uiType=="edit"){
		    				option+="<option selected ='selected' value='"+(v.MKEY==null?"":v.MKEY)+"'>"+(v.VAL==null?"":v.VAL)+"</option>";
		    			}else{
		    				option+="<option value='"+(v.MKEY==null?"":v.MKEY)+"'>"+(v.VAL==null?"":v.VAL)+"</option>";
		    			}
		    		});
			    }
			    $("#"+domId).html(option);
			    $("#"+domId).trigger("chosen:updated");
			    if(uiType=="add" && saveMark=="1"){//新增控件并且开启记忆
			    	var dataVal='';
		    		chkMsSaveMarkUtils.loadConfig();
			    	dataVal=chkMsSaveMarkUtils.getSaveMarkSelectsVal($("#"+domId),domId);
			    }
			},
			error : function(request) {
				utilsFp.confirmIcon(3,"","","", "Connection error","","260","145");
			}
		});
	}
	
	function _showCommonTablePage_buttom(thisObj,classId,pageId,title,jparam,wp,id){
		$(thisObj).parent().find("input").dblclick();
	}
	
	
	function _showMultiFileUpload(thisObj,id,colNo,prefixInd,type){
	    var  popId = window.frameElement.id;
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
	    var url = "${path}buss/bussModel_showMultiFileUploadPage.ms?paraMap.componentId="+id+"&paraMap.popId="+popId+"&paraMap.savePath="+savePath+"&paraMap.primaryVal="+(prefix+"_"+colNo)+"&paraMap.isSearchDb="+isSearchDb;
		showPopWinFp(url, 800, 500,null,"<dict:lang value="文件上传"/>",id+"_file");
		thisObj.blur();
	}
	
	function _showSelFkSql_img(thisObj,editName){
		<%-- $(thisObj).parent().find("input[editName='"+editName+"']").dblclick(); //因为editName在追加行时不好操作--%>
		$(thisObj).parent().find("input").dblclick();
	}
	<%-- 回填选择的值 --%>
	function _setSelValue(key,val,obj){
		_thisSelObj.value = val;
		var editName=$(_thisSelObj).attr("editName");
		$("input[name='"+editName+"']").val(key);
		<%-- //var editObj = "input[type='hidden'][name='"+$(_thisSelObj).attr("editName")+"']";
		//alert($(_thisSelObj).parent().parent().parent().find(editObj).eq(0).val());
		if(null!=obj){
			var indx = editName.indexOf("#");
			var CO_ITEM_NAME = editName.substring(0,indx)+"#"+"CO_ITEM_NAME";
			$("input[name='"+CO_ITEM_NAME+"']").val(obj.CO_ITEM_NAME);
			var CO_ITEM_SPEC = editName.substring(0,indx)+"#"+"CO_ITEM_SPEC";
			$("input[name='"+CO_ITEM_SPEC+"']").val(obj.CO_ITEM_SPEC);
		} --%>
		_thisSelObj.focus();
	}
	
	<%-- 回填选择的值(多选) --%>
	function _setSelMultValue(key,val,obj,kvs){
	/*	var hiddenId = _thisSelObj.id.replace("_SHOW","")
		if($("#"+hiddenId).val().indexOf(key) == -1){
			$("#"+hiddenId).val($("#"+hiddenId).val()+key);	
			_thisSelObj.value += val;
		}else if(key == "" || key == null){
			$("#"+hiddenId).val("");	
			_thisSelObj.value = "";
		}*/
		/*editName=$(_thisSelObj).attr("editName");
		//console.log(_thisSelObj);
		if($("input[name='"+editName+"']").val().indexOf(key) == -1){
			$("input[name='"+editName+"']").val($("input[name='"+editName+"']").val()+key);	
			_thisSelObj.value += val;
		}*/
		var editName=$(_thisSelObj).attr("editName");
		var hiddenname=$("[hiddenname]");
		hiddenname.each(function(){
			if(editName == $(this).attr("hiddenname")){
				$(this).val(kvs);
				return false;
			}
		});
		if(key != ""  && key != null){
			_thisSelObj.value += val;
			$("input[name='"+editName+"']").val($("input[name='"+editName+"']").val()+key);
		}else{
			_thisSelObj.value = "";
			$("input[name='"+editName+"']").val("");			
		}
		_thisSelObj.focus();
	}
	
	<%--多选 jparam为json字符串格式的参数 
	upFormColId 上级关联UI字段ID
	upFormHtmlId 上级关联UI字段在页面上的ID
	--%>
	function _showSelFkSqlMult(thisObj,fk,title,jparam,wp,id){
		_thisSelObj = thisObj;
		var width=600;
		var height=350;
		if(undefined == jparam || null == jparam){
			jparam = "";
		}else if(jparam == "noShowPop"){
			return;
		}else{
			jparam = "&paraMap.param="+encodeURI(util.toString(jparam));
		}
		
		var domId = $(thisObj).prop("id");
		var isOpenDataAuth = $("#"+domId+"_isOpenDataAuth").val();
		var dataAuth = "";
		var domDataAuthId = "";
		if($("#deptLs_data_auth").length==0){
			dataAuth = $("#DATA_AUTH").val();
			domDataAuthId = "#DATA_AUTH";
		}else{
			dataAuth = $("#deptLs_data_auth").val();
			domDataAuthId = "#deptLs_data_auth";
		}
		var isOpenDataAuthPrompt = $("#"+domId+"_isOpenDataAuthPrompt").val();
		if(dataAuth=="" && isOpenDataAuthPrompt=="1"){
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先选择组织机构！" />","","260","145");
			return;
		}
		if(dataAuth==""){
			var option = "";
			$(domDataAuthId+" option").each(function(){
				option = $(this).val();
				if(option==""){
					return true;
				}
				dataAuth+=option+",";
			});
			dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
		}
		
		
		var wpObj=JSON.parse(decodeURIComponent(wp));
		if(wpObj.WP_FULL_SCREEN=='0'||wpObj.WP_FULL_SCREEN==''){
			if(wpObj.WP_WIDTH!=''){
				width=wpObj.WP_WIDTH;
			}
			if(wpObj.WP_HEIGHT!=''){
				height=wpObj.WP_HEIGHT;
			}
		}else{
			height=$(top).height();
			width=$(top).width();
		}
		var url = "${path}buss/bussModel_showSelFkSqlMult.ms?paraMap.dataAuth="+dataAuth+"&paraMap.isOpenDataAuth="+isOpenDataAuth+"&paraMap.title="+title+"&paraMap.popId="+id+"&paraMap.UI_DATA="+encodeURI(fk)+jparam+"&paraMap.filedVal="+_thisSelObj.value;
		var editname = $(thisObj).attr("editname");
		var flag = editname.indexOf("searchParaList")>-1?true:false;
		showPopWinFp(url, width, height,null,"<dict:lang value="选择"/>"+title,id,null,flag);
		thisObj.blur();
	}
	
	<%-- 级联下拉事件，选中的值，字段ID，字段名称 --%>
	var colValmap = new Map();//所有上级级联下拉框的值
	function _selectCascad(value,domId,id,colNo){
	   //cjd   2017-12-14 11:59    
	    var selectText="<dict:lang value="--请选择--" />";   
	    //cjd   2017-12-14 11:59  
	
		colValmap.put(colNo, value);
	    var dataAuth = "";
		if($("#deptLs_data_auth").length==0){
			dataAuth = $("#DATA_AUTH").val();
		}else{
			dataAuth = $("#deptLs_data_auth").val();
		}
	    
		var keyVals= jsonData(id,value,domId.replace(colNo,""));
		var url = "${path}buss/bussModel_selectCascad.ms";
		util.showLoading("处理中..."); 
		
		colValmap.put(colNo, value);
		//if($("#"+id) != null && $("#"+id) != undefined && $("#"+id) != "undefined"){  
	  jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: keyVals,
		success: function(data){
				 alert(JSON.stringify(data));
				//util.alert(data.ajaxMap.nextselectId);
				util.closeLoading();
				if(null == data){return ;}
				if(null == data.ajaxMap){return ;}
				$("#"+data.ajaxMap.nextselectId).empty();
				if("1" == data.ajaxMap.VAL_NULL){
					$("<option value=''>"+selectText+"</option>").appendTo("#"+data.ajaxMap.nextselectId);
				}
				if(null != data.ajaxList){
					for(var i=0,j=data.ajaxList.length;i<j;i++){
						$("<option value='"+data.ajaxList[i].MKEY+"'>"+data.ajaxList[i].VAL+"</option>").appendTo("#"+data.ajaxMap.nextselectId);
					}
				}else{
				      //cjd 2017-12-14 解决联动英文问题  begin
				     $("#"+data.ajaxMap.nextselectId).empty(); 
			         $("<option value=''>"+selectText+"</option>").appendTo( $("#"+data.ajaxMap.nextselectId));
			        //cjd 2017-12-14 解决联动英文问题  end
				}
			},
		error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
		  }
		});
	}
	<%-- 显示关联的自定视图页面 --%>
	function _showPopWinRelView(thisObj,viewId,title){
		_thisSelObj = thisObj;
		var url = "${path}buss/bussModel.ms?exeid="+viewId;
		showPopWinFp(url, 600, 350,null,title+"<dict:lang value="自定义选择窗口"/>");
		thisObj.blur();
	}
	<%-- 执行关联的自定义类 --%>
	function _showPopWinCommClass(thisObj,cmId,title){
		_thisSelObj = thisObj;
		var url = "<bu:commet cmId="" />"+cmId;
		showPopWinFp(url, 600, 350,null,title+"<dict:lang value="自定义类选择窗口"/>");
		thisObj.blur();
	}
	<%-- 封装json数据，为了代码清晰 --%>
	function jsonData(curKey,value,domId){
		var jsonStr="({";
		jsonStr+="\"paraMap.curKey\":";
		jsonStr+="\""+curKey+"\"";
			jsonStr +=",";
		jsonStr+="\"paraMap.value\":";
		jsonStr+="\""+value+"\"";
			jsonStr +=",";
		jsonStr+="\"paraMap.domId\":";
		jsonStr+="\""+domId+"\"";
		colValmap.each(function (key, value, index) {
			jsonStr +=",";
			jsonStr+="\"paramList["+index+"].key\":";
			jsonStr+="\""+key+"\"";
			jsonStr+=",";
			jsonStr+="\"paramList["+index+"].value\":";
			jsonStr+="\""+value+"\"";
		});
		
		jsonStr+="})";
		return eval(jsonStr);//关键在于转换。
	}
	
	<%-- 级联下拉事件，选中的值，字段ID，字段名称 --%>
	function _selectCascadNew(value,domId,id,colNo,subStr){ 
	     //cjd   2017-12-14 11:59   
	    var selectText='<dict:lang value="--请选择--" />';   
	    //cjd   2017-12-14 11:59   
		colValmap.put(colNo, value);
		//if($("#"+id) != null && $("#"+id) != undefined && $("#"+id) != "undefined"){
		//	$("#"+id).val(value);
		//}
		var keyVals= jsonData(id,value,domId.replace(colNo,""));
		var dataAuth = "";
		if($("#deptLs_data_auth").length==0){
			dataAuth = $("#DATA_AUTH").val();
			if(dataAuth==""){
				var option = "";
				$("#DATA_AUTH option").each(function(){
    				option = $(this).val();
					if(option==""){
						return true;
					}
					dataAuth+=option+",";
				});
				dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
			}
		}else{
			dataAuth = $("#deptLs_data_auth").val();
		}
		keyVals["paraMap.dataAuth"]=dataAuth;
		
		
		var url = "${path}buss/bussModel_selectCascad.ms";
		util.showLoading("处理中...");
	  jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: keyVals,
		success: function(data){
				//alert(JSON.stringify(data));
				//util.alert(data.ajaxMap.nextselectId);
				util.closeLoading();
				if(null == data){return ;}
				if(null == data.ajaxMap){return ;}
				
				if(subStr != "" && subStr!= null){
					_clearSelectCascad(domId.replace(colNo,""),subStr);
				}				
				 
				$("#"+data.ajaxMap.nextselectId).empty();
				 
				if($("#"+domId+"_view").length>0){
					$("<option value=''>"+selectText+"</option>").appendTo("#"+data.ajaxMap.nextselectId);
				}else{
					if("1" == data.ajaxMap.VAL_NULL){
						$("<option value=''>"+selectText+"</option>").appendTo("#"+data.ajaxMap.nextselectId);
					};
				}
				if(null != data.ajaxList){
					for(var i=0,j=data.ajaxList.length;i<j;i++){
						$("<option value='"+data.ajaxList[i].MKEY+"'>"+data.ajaxList[i].VAL+"</option>").appendTo("#"+data.ajaxMap.nextselectId);
					}
				}else{
				      //cjd 2017-12-14 解决联动英文问题  begin
				     $("#"+data.ajaxMap.nextselectId).empty(); 
			         $("<option value=''>"+selectText+"</option>").appendTo( $("#"+data.ajaxMap.nextselectId));
			        //cjd 2017-12-14 解决联动英文问题  end
				}
				$("#"+data.ajaxMap.nextselectId).trigger("chosen:updated");
			},
		error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
		  }
		});
	}	
	
	<%-- 清空级联下拉子项的值  domId 下拉框ID--%>
	function _clearSelectCascad(domId,subStr){
		for(var i = 0;i < subStr.split(";").length;i++){
			$("#"+domId+subStr.split(";")[i]).empty();
			$("<option value=''><dict:lang value="--请选择--" /></option>").appendTo("#"+domId+subStr.split(";")[i]);
			$("#"+domId+subStr.split(";")[i]).val('');
			$("#"+domId+subStr.split(";")[i]).trigger("chosen:updated");
		}
	}
	
	//取页面字段名为 _field的值，参数_domId为this,_colNo为被点击的字段名
	function _getVal(_domId,_colNo,_field){
		
		var _upId = _domId.id.replace(_colNo+"_SHOW",_field);
		
		return $("#"+_upId).val();
		
	}
	
	<%--多选 jparam为json字符串格式的参数 
	--%>
	function _showTree(thisObj,fk,title,id){
		_thisSelObj = thisObj;
		//var url = "${path}buss/bussModel_showTree.ms?paraMap.title="+title+"&paraMap.popId="+id+"&paraMap.UI_DATA="+encodeURI(fk);
		
		//多组织机构数据权限改造lth
		var dataAuth = "";
		var domDataAuthId = "";
		if($("#deptLs_data_auth").length==0){
			dataAuth = $("#DATA_AUTH").val();
			domDataAuthId = "#DATA_AUTH";
		}else{
			dataAuth = $("#deptLs_data_auth").val();
			domDataAuthId = "#deptLs_data_auth";
		}
		if(dataAuth==""){
			var option = "";
			$(domDataAuthId+" option").each(function(){
				option = $(this).val();
				if(option==""){
					return true;
				}
				dataAuth+=option+",";
			});
			dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
		}
		//alert(dataAuth);
		
		var url = "${path}buss/bussModel_showTreebyztree.ms?paraMap.title="+title+"&paraMap.popId="+id+"&paraMap.UI_DATA="+encodeURI(fk)+"&paraMap.dataAuth="+dataAuth;
		var editname = $(thisObj).attr("editname");
		var flag = editname.indexOf("searchParaList")>-1?true:false;
		showPopWinFp(url, 450, 350,null,title+"<dict:lang value="树形选择框"/>",id,null,flag);
		thisObj.blur();
	}
	
	function msgPop(context,reloadPgExe,title,width,height,time,isCloseWin){
        $.msgPop.laysPop(width, height); //窗口大小
        $.msgPop.animPop('slide', 2000); 
        $.msgPop.showPop(title, context,time); //标题，内容，时间,如果配置为-1则不自动关闭
        if(typeof reloadPgExe=="function" ){
			reloadPgExe(isCloseWin);
		} 
     }
     //msgPopNoCloseWin 不关闭窗口提示  cjd 2017-12-14 
  	function msgPopNoCloseWin(context,title,width,height,time){
        $.msgPop.laysPop(width, height); //窗口大小
        $.msgPop.animPop('slide', 2000); 
        $.msgPop.showPop(title, context,time); //标题，内容，时间,如果配置为-1则不自动关闭
         
     }   
$(document).ready(function(){  
    //禁止退格键 作用于Firefox、Opera   
    document.onkeypress = banBackSpace;  
    //禁止退格键 作用于IE、Chrome  
    document.onkeydown = banBackSpace;  
});  
//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外   
function banBackSpace(e){  
    //alert(event.keyCode)  
    var ev = e || window.event;//获取event对象     
    var obj = ev.target || ev.srcElement;//获取事件源       
    var t = obj.type || obj.getAttribute('type');//获取事件源类型       
    //获取作为判断条件的事件类型   
    var vReadOnly = obj.readOnly;  
    var vDisabled = obj.disabled;  
    //处理undefined值情况   
    vReadOnly = (vReadOnly == undefined) ? false : vReadOnly;  
    vDisabled = (vDisabled == undefined) ? true : vDisabled;  
    //当敲Backspace键时，事件源类型为密码或单行、多行文本的，    
    //并且readOnly属性为true或disabled属性为true的，则退格键失效    
    var flag1 = ev.keyCode == 8 && (t == "password" || t == "text" || t == "textarea" || t == "search") && (vReadOnly == true || vDisabled == true);  
    //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效      
    var flag2 = ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea" && t != "search";  
    //判断      
    if (flag2 || flag1)   
        event.returnValue = false;//这里如果写 return false 无法实现效果   
}  

	<%-- jparam为json字符串格式的参数 --%>
	function _showPopWinSelFkSql(inputId,fk,title,jparam,wp,id,isFk){
		//alert(window.frameElement.id);
		var thisObj = document.getElementById(inputId);
		_thisSelObj = thisObj;
		var width=600;
		var height=350;
		if(undefined == jparam || null == jparam){
			jparam = "";
		}else if(jparam == "noShowPop"){
			return;
		}else{
			jparam = "&paraMap.param="+encodeURI(util.toString(jparam));
		}
		
		var domId = $(thisObj).prop("id");
		var isOpenDataAuth = $("#"+domId+"_isOpenDataAuth").val();
		var dataAuth = "";
		var domDataAuthId = "";
		if($("#deptLs_data_auth").length==0){
			dataAuth = $("#DATA_AUTH").val();
			domDataAuthId = "#DATA_AUTH";
		}else{
			dataAuth = $("#deptLs_data_auth").val();
			domDataAuthId = "#deptLs_data_auth";
		}
		var isOpenDataAuthPrompt = $("#"+domId+"_isOpenDataAuthPrompt").val();
		if(dataAuth=="" && isOpenDataAuthPrompt=="1"){
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="请先选择组织机构！" />","","260","145");
			return;
		}
		if(dataAuth==""){
			var option = "";
			$(domDataAuthId+" option").each(function(){
				option = $(this).val();
				if(option==""){
					return true;
				}
				dataAuth+=option+",";
			});
			dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
		}
		
		
		var wpObj=JSON.parse(decodeURIComponent(wp));
		if(wpObj.WP_FULL_SCREEN=='0'||wpObj.WP_FULL_SCREEN==''){
			if(wpObj.WP_WIDTH!=''){
				width=wpObj.WP_WIDTH;
			}
			if(wpObj.WP_HEIGHT!=''){
				height=wpObj.WP_HEIGHT;
			}
		}else{
			height=$(top).height();
			width=$(top).width();
		}
		var url = "${path}buss/bussModel_showPopWinSelFkSqlPage.ms?paraMap.dataAuth="+dataAuth+"&paraMap.isOpenDataAuth="+isOpenDataAuth+"&paraMap.title="+title+"&paraMap.popId="+id+"&paraMap.UI_DATA="+encodeURI(fk)+"&paraMap.UI_DATA_TYPE="+isFk+jparam;
		var editname = $(thisObj).attr("editname");
		var flag = editname.indexOf("searchParaList")>-1?true:false;
		showPopWinFp(url, width, height,null,"<dict:lang value="选择"/>"+title,id,null,flag);
		thisObj.blur();
	}
	
	function _changePopWinSelVal(obj,id){
		$("#"+id).val($(obj).val());
		$("#"+id+"_CN").val($(obj).val());
	}
	
	/** 回车查询  */
	function _checkEnterSeach(){
		if(event.keyCode == 13){
			query(this);
		}
	}
	
	/**列表分页序列号*/
	function firstLoadThisPage(paginationImpl){
		if(typeof(_GLO_FORM_PAGE_MAP[paginationImpl].currentPage) =="undefined"){
			return true;
		}
		return false;
	}
	
	/**自定义保存关闭窗口*/
    function reloadPgAx(msg,title,width,height,time,isCloseWin){
		msgPop(msg,reloadPgExeAx,title,width,height,time,isCloseWin);
	}
					
	function reloadPgExeAx(isCloseWin){
		query("formId1");
		util.showTopLoading();
		if(isCloseWin == "0"){
			top.$(".dialog-close").click();
		}
	} 
	
	function resetpopval(inputId){
		//alert(window.frameElement.id);
		var thisObj = document.getElementById(inputId);
		thisObj.value="";
		
		var hidden_id=thisObj.id.replace('_SHOW','');
		document.getElementById(hidden_id).value="";
		
	}
	
	function resetpopval2(inputId,clear_func_name){
		//alert(window.frameElement.id);
		var thisObj = document.getElementById(inputId);
		thisObj.value="";
		
		var hidden_id=thisObj.id.replace('_SHOW','');
		document.getElementById(hidden_id).value="";
		
		//执行 清空函数
		if(clear_func_name!=null && clear_func_name!=''){                    	
              //执行函数体
              if(typeof(eval(clear_func_name)) == "function"){     
                 	try{
	         			eval(clear_func_name+"();");
	          		}catch(err){
	         	 		//utilsFp.confirmIcon(3,"","","", "清空函数执行异常，请检查函数js语法!","","260","145");
	         	 
	          		}
	         
			  }else{
			         // 函数不存在
			         
			  }
                    
         }
		
	}
	
	function pop_onmouseover(pop_value,inputId){
		var clearpop=document.getElementById('clearpop_'+inputId);
		if(pop_value!=null && pop_value!='' && clearpop.style.display=='none'){
			clearpop.style.display='';
		}
	}
	
	function pop_onmouseout(inputId){
		document.getElementById('clearpop_'+inputId).style.display='none';
		
	}
	
	function popimg_onmouseover(inputId){
		document.getElementById('clearpop_'+inputId).style.display='';
	}
	
	/**列表查询条件  点击组合查询*/
	function _showGroupSelect(thisObj,fk,title,jparam,wp,id){
		//alert(window.frameElement.id);
		var _key = $(thisObj).attr("id").replace('_SHOW','');
		_key=document.getElementById(_key).value;
		
		//alert(encodeURI(_key));
		_thisSelObj = thisObj;
		var width=650;
		var height=350;
		if(undefined == jparam || null == jparam){
			jparam = "";
		}else if(jparam == "noShowPop"){
			return;
		}else{
			jparam = "&paraMap.param="+encodeURI(util.toString(jparam));
		}
		var wpObj=JSON.parse(decodeURIComponent(wp));
		if(wpObj.WP_FULL_SCREEN=='0'||wpObj.WP_FULL_SCREEN==''){
			if(wpObj.WP_WIDTH!=''){
				width=wpObj.WP_WIDTH;
			}
			if(wpObj.WP_HEIGHT!=''){
				height=wpObj.WP_HEIGHT;
			}
		}else{
			height=$(top).height();
			width=$(top).width();
		}
		var url = "${path}buss/bussModel_showGroupSelectPage.ms?paraMap.title="+title+"&paraMap.popId="+id+"&paraMap.UI_DATA="+encodeURI(fk)+"&paraMap._key="+encodeURI(_key) +jparam;
		showPopWinFp(url, width, height,null,"<dict:lang value="组合查询配置-"/>"+title,id);
		thisObj.blur();
	}
	
	//点击行选中该行
		function _clickTr(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").attr("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).attr("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").attr("checked",true);
				$("#"+trId).css("background-color","#d3eafc");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#d3eafc");
			  }
		  });
		}
	
	function _queryTrace(processId)
	{
	   $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/ProcessAction_queryTrace.ms",
			    data: {			    	
			    	'paraMap.processId' : processId
			    },
				success: function(data){

					if(data.ajaxMap != null)
				  {
				    $("#diagram").attr('src',data.ajaxMap.diagramUrl);
				    var activityList=data.ajaxMap.activityList;				    
				   
			if (activityList != null && activityList.length > 0) {
			    var htmlArr = [];
				$.each(activityList, function(i, v) {
					if(v.time=='null') v.time="";
					if(v.activiting_name=='null') v.activiting_name="";
					htmlArr.push("<div class='data'>");
					htmlArr.push("<span class='data-name' title='"+v.user_name+"''>"+v.user_name+"</span>");
					htmlArr.push("<div class='data-content'>");
					htmlArr.push("<span class='data-imp' title='"+v.full_message+"'>"+v.full_message+"");
					htmlArr.push("<span class='pointer-show'></span>");
					htmlArr.push("</span>");
					htmlArr.push("<span class='data-time'>"+v.time+"</span>");
					htmlArr.push("<span class='activiting-name' title='"+v.activiting_name+"'>"+v.activiting_name+"</span>");
					htmlArr.push("<div>");
					if(v.attachments){
						$.each(v.attachments, function(j, n) {
							htmlArr.push("<p class='downFlowFile' fileName='"+n.name+"' filePath="+n.path+" title='"+n.name+"'>"+n.name+"</p>");
						});
					}
					htmlArr.push("</div>");
					htmlArr.push("</div>");
					htmlArr.push("</div>");
				});
				$("#flowDetail").html(htmlArr.join(""));
			    }
			
			
				  }
				},
				error: function(msg){
						
					if(msg.readyState!=0){
     					util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
					}
				  }
				  });
	}
	
	
	
	//完成待办任务
	function _complete(type)
	{
	  var taskId=$("#_taskId").val();	 
	  var tmp_variables = [];                      	        
      var propertyMap= {};
      propertyMap.name = 'STATE';
      propertyMap.value=type;
      tmp_variables.push(propertyMap);      
      var comment=$("#flowComment").val();
      var next_users=$("#_nextUser").val();
      
      var fileIds=$("#fileIds").val();
      var fileNames=$("#fileNames").val();
      var downUrls=$("#downUrls").val();
	  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/ProcessAction_completeTask.ms",
			    data: {
			    	'paraMap.taskId' : taskId,
			    	'paraMap.comment' : comment,			    	
			    	'paraMap.tmp_variables' : JSON.stringify(tmp_variables),
			    	'paraMap.next_users' : next_users,
			    	'paraMap.fileIds' : fileIds,
			    	'paraMap.fileNames' : fileNames,
			    	'paraMap.downUrls' : downUrls
			    },
				success: function(data){
				
				   if(data.ajaxMap != null)
				   {
				  
				      if(data.ajaxMap.errmsg!=null)
				      {
				        //util.alert(data.ajaxMap.errmsg);
				        utilsFp.confirmIcon(1, "", "", "",data.ajaxMap.errmsg, 0, "300", "");
		                return false;
				      }
				      else{
				      
				       if(data.ajaxMap.nextUser!= null&&data.ajaxMap.nextUser!='' )
				      {				   
				    
				       $("#_nextUser").val(data.ajaxMap.nextUser);     
				       var piframeId = window.frameElement.id;
	                   var url="${path}comm/ProcessAction_chooseUser.ms?paraMap.piframeId="+piframeId+"&paraMap.type="+type+"&paraMap.flowType=4";
                       showPopWinFp(url, 550, 350,null,'<dict:lang value="人员选择" />','chooseUser');
                       return false;
				      }
				      
				      var piframeId='${param.iframeId}';
		              var parentWindows = $(window.parent.document).contents().find("#"+piframeId).contents().find("#ifr")[0].contentWindow;
				      parentWindows.reloadPg(data.ajaxMap.alertMsg,  data.ajaxMap.title, data.ajaxMap.width, data.ajaxMap.height, data.ajaxMap.time);
        	          //closeWindow();
        	          //mcWindow.frames['mainFrame'].location.reload();
				      }		     
				     
				   }
				},
				error: function(msg){
						
					if(msg.readyState!=0){
     					util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
					}
				  }
				  });
	
	
	}
	
	
	$(function(){
		var dataAuthViewType="<c:out value='${dataAuthViewType}' />";
		
		if("17"==dataAuthViewType || "3"==dataAuthViewType){
			var dataAuthSelect="";
	    	if("1"!="<c:out value='${mcIsOpenAuth}' />"){
	    		dataAuthSelect = "<input type='hidden' id='DATA_AUTH' value='${sessionScope.mcDataAuth}'  name='DATA_AUTH' />";
	    		//$(".TD_DATA_AUTH").hide();
	    		//$(".IS_DATA_AUTH_SPAN").parent("td").hide();
	    	} 
	    	$("#searchForm").append(dataAuthSelect);
			if("<c:out value='${authIsGanged}'/>"=="1"){//组织机构是否联动
				if($("#DATA_AUTH").length==0){
					$(".dept_select").not("#DATA_AUTH").each(function(){
		        		var thisId = $(this).prop("id");
		        		if($("#"+thisId+"_formId").length!=0){
		        			var formId = $("#"+thisId+"_formId").val();
		        			var formColId = $("#"+thisId+"_formColId").val();
		        			var unionselect = $("#"+thisId+"_unionselect");
		        			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
		        			var uiType = $("#"+thisId+"_uiType").val();
		        			var dataAuth = "mCAuthIsNull";
		        			if(unionselect.length==0){
		        				_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
		        			}else{
		        				$("#"+thisId).find("option").not(":first").remove();
		        				$("#"+thisId).trigger("chosen:updated");
		        			}
		        		};
		        	});
				}else{
					$("#DATA_AUTH").change(function(){
						//多组织机构记忆控件改造 查询列表页面的多组织机构切换的时候重新根据当前组织机构值获取记忆值
				        try{chkMsSaveMarkUtils.loadConfig("list");}catch(err){}
				        	
			      		var dataAuth = $("#DATA_AUTH").val();
			      		if(dataAuth!=""){
			         			$(".clearPopVal").val("");
			         		}
				    		$(".dept_select").not("#DATA_AUTH").each(function(){
				        		var thisId = $(this).prop("id");
				        		if($("#"+thisId+"_formId").length!=0){
				        			var formId = $("#"+thisId+"_formId").val();
				        			var formColId = $("#"+thisId+"_formColId").val();
				        			var unionselect = $("#"+thisId+"_unionselect");
				        			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
				        			var uiType = $("#"+thisId+"_uiType").val();
				        			
				        			if(dataAuth==""){
				        				var option = "";
				        				$("#DATA_AUTH option").each(function(){
				            				option = $(this).val();
				        					if(option==""){
				        						return true;
				        					}
				        					dataAuth+=option+",";
				        				});
				        				dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
				        			}
				        			if(unionselect.length==0){
				        			  _controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
				        			}else{
				        				$("#"+thisId).find("option").not(":first").remove();
				        				$("#"+thisId).trigger("chosen:updated");
				        			}
				        		};
				        	});
				        	
				    	});
			          $("#DATA_AUTH").trigger("change");
				}};
		  };
		});
		
     
    //图片加载完绑定查看原图事件
    var fid_val='';
    var fname_val='';
    var fpath_val='';
	function reviewpic_onload(fid,fname,fpath){
		//点击关闭
        $('body').on('click','.shadow_div_review',closereviewBig)
        $('body').on('click','.close_img_review',closereviewBig)
        
        $('body').on('click','.download_img_review',download_file)

        //移除默认的拖动事件
        $('body').on('dragstart','.master_map',function(){
            return false;
        })

        //点击拖动图片
        $('body').on('mousedown','.master_map',function(e){
            var event = $(this);     
            var oldx = e.offsetX;
            var oldy = e.offsetY;
            document.onmousemove = function(ev){        
                $(event).css('left',ev.clientX - oldx +'px');
                $(event).css('top',ev.clientY - oldy +'px');
            }    
        })
        
        //松开移除拖动事件
        window.onmouseup = function(){
            document.onmousemove = null;
        }

        //图片滚动事件(放大缩小)
        $('body').on('mousewheel','.master_map',function(e,d){
            var direction = d > 0 ? 'Up' : 'Down';
            if (direction == 'Up') {
                resizereviewImg($(this),false)
            } else {
                resizereviewImg($(this),true)
            }

            return false;
        })
           
	}
	
	//点击查看原图
	function imgreview_click(id,fid,fname){
		   fid_val=fid;
		   fname_val=fname;
		   		  
		   var url = document.getElementById(id).src;
		   if(url.indexOf('plf/page/fp/img/MoreWis_s.png')!=-1){
		   		return false;
		   }
		   
           $("<div class='shadow_div_review'>").appendTo('body');

           $("<img class ='master_map' src='" + url + "'>").appendTo('body');
           $('.master_map').css('left','calc((100% - ' + $('.master_map').width() + 'px)/2)'); 
           $('.master_map').css('top','calc((100% - ' + $('.master_map').height() + 'px)/2)'); 
           
           $("<div class='close_img_review'>").appendTo('body');  
           
           //if(id!=null && id!='' && id.indexOf('preview$')==-1){
           //		$("<div class='download_img_review'>").appendTo('body'); 
           //}
           
           if(fid_val!=null && fid_val!=''){
           		$("<div class='download_img_review'>").appendTo('body'); 
           }
           
	}
	//图片放大缩小  参数1:执行放大缩小的元素   参数2:是否放大(否的话则缩小)
    function resizereviewImg(item,isBig){
           var oldHeight = $(item).height();
           var oldWidth = $(item).width();
           var oldTop = $(item).css('top');
           var oldLeft = $(item).css('left');
           
           if(isBig){
               $(item).height($(item).height() + 50);
           }else{
               if(oldHeight <= 100 || oldHeight <= 100){
                   //太小就不允许缩
               }else{
                   $(item).height($(item).height() - 50);
               }
               
           }

           // 重新定位
           var top = parseFloat(oldTop) - ($(item).height() - oldHeight)/2;
           var left = parseFloat(oldLeft) - ($(item).width() - oldWidth)/2;

           $(item).css('top',top + 'px').css('left',left + 'px');
     }

     //关闭放大
     function closereviewBig(){
         $('.shadow_div_review').remove();
         $('.master_map').remove();
         $('.close_img_review').remove();
         $('.download_img_review').remove();
         
     }
     
     //下载文件
     function download_file(){
     	//alert(fid_val);
     	//alert(fname_val);
     	//alert(fpath_val);
     	if(fid_val!=null && fid_val!=''){
     		//window.location.href='${path}buss/bussModel_dlFileComm.ms?paraMap.fid=8b8d4dfe4120419db97a8964e369bdd3.jpg&amp;paraMap.fpath=&amp;paraMap.fname=8b8d4dfe4120419db97a8964e369bdd3.jpg';
     		window.location.href="${path}buss/bussModel_dlFileComm.ms?paraMap.fid="+fid_val+"&paraMap.fpath="+fpath_val+"&paraMap.fname="+fname_val;
     	
     	}
     	
     }
     
    //帮助
	function help_mc(exeid){
		//alert(exeid);
		top.window.open("${path}/sys/BussModelAction_showHelp.ms?paraMap.VIEW_ID="+exeid,"_blank");
		
	}
        
</script>