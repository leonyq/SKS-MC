<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
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
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	<style>
    .input_box{
        width:100%;
    }
    .tips_box{
        color:#fff;
        font-size:25px;
        height:40px;
    }
    .tips_box_default{
        	background-color:#fff; 
        	color:#000;
    } 
    .tips_box_sucess{
        	background-color:green; 
    } 
    .tips_box_error{
        	background-color:red; 
    }  
    .img_div{
        width:100%; 
        /*height:400px;*/
    }
    .img_content a{
        float:right;
        margin-right:15px;
    }
    .img_content a:hover{
        text-decoration:underline;
        color:blue;
    }
    .img_panel{
        width:100%;
        /*height:100%;*/
        overflow:auto;
    }
    .img_panel img{
        /*width:100%;*/
        height:100%;
    }
    </style>
	<!-- 产品静态资源 -->
    <script>
    var photo;
    var _STEP=1;//操作步骤
	$(function(){
	    $('.input_box').removeAttr('disabled').focus();
	    $('.input_box').attr("placeholder","输入产品合格证号回车");
	    $('.input_box').keyup(function(event){
            if(event.keyCode ==13){
                var mo_number=$('#paraMap1_WHL_MO_NUMBER').val();
                var workcenter=$('#paraMap1_WHL_WORKCENTER').val();
                var input_text=$.trim($('.input_box').val());
                if(input_text==''){ 
                    showMessage('输入值不能为空',2);
                    return;
                }
                if(_STEP==1){ //第一步，输入合格证号
                    $("#proQuality").val(input_text);
                    showMessage('OK',1);
                    $('.input_box').attr("placeholder","输入数量回车");
                    _STEP=2;
                    return;
                }else if(_STEP==2){ //第二步，输入数量
                    if(isNaN(input_text)){
                	    showMessage('请输入数量',2);
                	    return;
                	}else{ 
                	    $("#proNum").val(input_text);
                        showMessage('OK',1);
                        $('.input_box').attr("placeholder","输入产品SN回车");
                        _STEP=3;	
                        return;
                	}
                }else if(_STEP==3){
                    saveSnInfo(); 
                }
            }
        }); 
        $(".img_div").height($(window).height()-199);//270
        $('.tips_box').attr('readonly','readonly');  
        $("#paraMap1_WHL_AREASN").val(localStorage.scgzAreaVal);
	    $("#paraMap1_WHL_AREASN").trigger("chosen:updated");
        $('#paraMap1_WHL_WORKCENTER').val(localStorage.scgzWorkCenterVal);
        $('#paraMap1_WHL_WORKCENTER_SHOW').val(localStorage.scgzWorkCenterName);
        $("#_PRODUCT_STEP").val(localStorage.scgzProductStep);
        photo = new PhotoModel();
        photo.Tag=$(".img_div");
        photo.init();  
        
    }); 
    function saveStorage(val,MKEY){
        localStorage.scgzWorkCenterName=val;
        localStorage.scgzWorkCenterVal=MKEY;
        localStorage.scgzAreaVal=$("#paraMap1_WHL_AREASN").val();
        localStorage.scgzProductStep=$("#_PRODUCT_STEP").val();
        photo.clear();
    }
    function showMessage(msg,type){
	    $('.tips_box').val(msg);
	    $('.tips_box').removeClass('tips_box_sucess').removeClass('tips_box_error').removeClass('tips_box_default');
	    if(type==1){
	        $('.tips_box').addClass('tips_box_sucess');
	    }else if(type==2){
	        $('.tips_box').addClass('tips_box_error');
	    }else{
	        $('.tips_box').addClass('tips_box_default');
	    }
	    $('.input_box').val('').focus();
	}
	function getMoItem (){
	    
	}
	
	function clearWin(){ 
	    $('#paraMap1_WHL_MO_NUMBER_SHOW').val('');
	    $('#paraMap1_WHL_MO_NUMBER').val('');
	    photo.clear();
	    showMessage(); 
	} 
	
	function photoFun(){
	    savePhotoInfo();
	}
	
	function PhotoModel(){ 
	    this.Tag=$("#body"); 
	    this.type;
	    var _This=this;
	    var _Data;
	    var _index=0;
	    var _Tag;
	    function bindHtml(){
	        var html='<div class="img_content">';
	        if(_Data!=undefined&&_Data.length>0){
    	        html+='<div class="img_tools">';	
                if(_Data!=undefined&& _Data.length>0&&_This.type!=-1){
    	            html+='<a href="javascript:void(0)" class="del">删除</a>';
    	        }
    	        if(_Data!=undefined&&_Data.length>1){
        	        html+='<a href="javascript:void(0)" class="next">下一张</a>';
        	        html+='<a class="pre" href="javascript:void(0)">上一张</a>';
    	        }
    	        if(_Data!=undefined&& _Data.length>0){
    	            html+='<span>'+(_index+1)+'/'+_Data.length+'</span>';
    	        }
    	        html+='</div>';
    	        html+='<div class="img_panel">'
    	        html+='<img src="'+_Data[_index]+'"  alt="" />';
    	        html+='</div>'
	        }
	        html+='</div>'
	       	_Tag.html(html);
	       	if($('.img_div').length>0){
                _Tag.find('.img_panel').height($('.img_div').height()-15);
            }
	       	//console.log(_index);
	    }
	    function bindEvent(){
	        _Tag.find('.pre').unbind('click').bind('click',function(){
	            _index=_index-1;
	            if(_index<0){
	                _index=_Data.length-1;
	            }
    	        bindHtml();
    	        bindEvent();
	        });
	        _Tag.find('.next').unbind('click').bind('click',function(){ 
	            _index=_index+1;
	            if(_index>_Data.length-1){
	                _index=0;
	            }
    	        bindHtml();
    	        bindEvent();
	        });
	        _Tag.find('.del').unbind('click').bind('click',function(){ 
	            _Data.splice(_index,1); 
	            _index=0;
    	        bindHtml();
    	        bindEvent();
	        });
	    }
	    this.bindData = function(data){
	        _Data=data;
	        bindHtml();
	        bindEvent();
	    }
	    this.pushData =function(data){
	        if(_Data==undefined) _Data=new Array();
	        _Data.push(data); 
	        _index=_Data.length-1;
	        bindHtml();
	        bindEvent();
	    }
	    this.init = function(){
	        _Tag=_This.Tag;
	        bindHtml();
	        bindEvent();
	    }
	    this.getData=function(){
	        if(_Data==undefined) return "";
	        return _Data.join();
	    }
	    this.clear=function(){
	        _Data=new Array();
	        _index=0;
	        bindHtml();
	    }
	}
	
	
	window.addEventListener('load', function () {
      Notification.requestPermission(function (status) { 
        // 这将使我们能在 Chrome/Safari 中使用 Notification.permission
        if (Notification.permission !== status) {
          Notification.permission = status;
        }
      });
    });
    
    function notify(){
        // 如果用户同意就创建一个通知
    if (window.Notification && Notification.permission === "granted") {
      var n = new Notification("Hi!");
    }

    // 如果用户没有选择是否显示通知
    // 注：因为在 Chrome 中我们无法确定 permission 属性是否有值，因此
    // 检查该属性的值是否是 "default" 是不安全的。
    else if (window.Notification && Notification.permission !== "denied") {
      Notification.requestPermission(function (status) {
        if (Notification.permission !== status) {
          Notification.permission = status;
        }

        // 如果用户同意了
        if (status === "granted") {
          var n = new Notification("Hi!");
        }

        // 否则，我们可以让步的使用常规模态的 alert
        else {
          alert("Hi!");
        }
      });
    }

    // 如果用户拒绝接受通知
    else {
      // 我们可以让步的使用常规模态的 alert
      alert("Hi!");
    }
    }
    
    //撤销
    function revokeFun(){
        var url = "${path}buss/bussModel.ms?exeid=8caf15b429a14f5c91a8ff8848195bb2&dataId=&formId=db084c9c700b4c9597366a4c5593f8f3";
        showPopWinFp(url, 500, 350,"","<dict:lang value="撤销"/>","");
    }
    </script>
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd"> 
			    <div class="optn"> 
			        <button type="button" onclick="revokeFun();"><i class="ico ico ico-sc"></i><dict:lang value="撤销" /></button>
			        <button type="button" onclick="photoFun();"><i class="ico ico-search-new"></i><dict:lang value="拍照" /></button>
			        <button type="button" onclick="clearWin();"><i class="ico ico-cancel"></i><dict:lang value="清空" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="8c048b8e35874c168fbff6ab0fee4d69" type="add" />
	<table class="basic-table" style="width:700px" >
	<input type="hidden" name="formIds" value="8c048b8e35874c168fbff6ab0fee4d69" />
	<input type="hidden" id="_PRODUCT_STEP" value="" />
	<input type="hidden" id="prefixInd" name="8c048b8e35874c168fbff6ab0fee4d69" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'d7cb08a68af24e2e9abc423617589234'" />
		<s:set name="_$formId_1" value="'8c048b8e35874c168fbff6ab0fee4d69'" />
		<s:set name="_$type" value="'add'" />
		<tr style="display:none;">
		<td class="name-four" /><bu:uitn colNo="WHL_AREASN" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<bu:td cssClass="dec-self" colNo="WHL_AREASN" formId="8c048b8e35874c168fbff6ab0fee4d69" ><bu:ui colNo="WHL_AREASN" formId="8c048b8e35874c168fbff6ab0fee4d69" value="%{WHL_AREASN}" formIndex="1" /></bu:td>

		</tr>
			<tr style="display:none;">
			<td class="name-four" /><bu:uitn colNo="WHL_WORKCENTER" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<bu:td cssClass="dec-self" colNo="WHL_WORKCENTER" formId="8c048b8e35874c168fbff6ab0fee4d69" ><bu:ui colNo="WHL_WORKCENTER" formId="8c048b8e35874c168fbff6ab0fee4d69" value="%{WHL_WORKCENTER}" formIndex="1" /></bu:td>

			<td class="name-four" /><bu:uitn colNo="WHL_MO_NUMBER" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<bu:td cssClass="dec-self" colNo="WHL_MO_NUMBER" formId="8c048b8e35874c168fbff6ab0fee4d69" ><bu:ui colNo="WHL_MO_NUMBER" formId="8c048b8e35874c168fbff6ab0fee4d69" value="%{WHL_MO_NUMBER}" formIndex="1" /></bu:td>
 	</tr>
 	<tr>
 	        <td class="name-four" style="width:75px;"><dict:lang value="产品合格证号" /></td>
 	        <td class="dec-self"><input type="text" id="proQuality" class="input isSubmit" readonly="readonly"/></td>
 	        <td class="name-four"><dict:lang value="数量" /></td>
 	        <td class="dec-self" ><input type="text" id="proNum" class="input isSubmit" readonly="readonly"/></td>
 	        
 	</tr>
 	<tr>
			<td class="name-four"><dict:lang value="产品SN" /></td>
 	        <td class="dec-self" colspan="3"><input type="text" id="proSn" style="width:100%" class="input isSubmit" readonly="readonly"/></td></tr>
 	<tr>
			<td class="name-four" /><bu:uitn colNo="WHL_INPUT" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<bu:td cssClass="dec-self" colspan="3" colNo="WHL_INPUT" formId="8c048b8e35874c168fbff6ab0fee4d69" ><bu:ui colNo="WHL_INPUT" cssClass="input_box" formId="8c048b8e35874c168fbff6ab0fee4d69" value="%{WHL_INPUT}" formIndex="1" /></bu:td>
	</tr>
	<tr>
			<td class="name-four" /><bu:uitn colNo="WHL_TIPS_BOX" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<bu:td cssClass="dec-self" colspan="3" colNo="WHL_TIPS_BOX" formId="8c048b8e35874c168fbff6ab0fee4d69" ><bu:ui colNo="WHL_TIPS_BOX" cssClass="tips_box" formId="8c048b8e35874c168fbff6ab0fee4d69" value="%{WHL_TIPS_BOX}" formIndex="1" /></bu:td>
	</tr>
	</table>
	
	<div class="mod">
	<div class="mod-hd">
           <h3 class="tit">拍照信息</h3>	
     </div>
	  <div class="img_div">
	  </div>
	</div>
			<bu:jsVal formId="8c048b8e35874c168fbff6ab0fee4d69" formIndex="1" />
				
			</div>
		 </form>
		 
		 
	</div>
     
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<script>
 //ajax函数 
 function saveSnInfo(){
    	var sn=$('.input_box').val();
    	var mo_number=$('#paraMap1_WHL_MO_NUMBER').val();
    	var workcenter=$('#paraMap1_WHL_WORKCENTER').val(); 
    	var url = "buss/bussModel_exeFunc.ms?funcMId=114e710ce69c4fc098d58736a72f78bb";
    	var qualityNo = $("#proQuality").val();
    	var proSns = $("#proSn").val();
        var proNu = $("#proNum").val();
        if(proSns!=""&&proSns.split(",").length==parseInt(proNu)){
            showMessage("产品个数已足够",2);
            $('.input_box').attr("placeholder","输入产品合格证号回车");
            $("#proQuality").val("");
            $("#proNum").val("");
            $("#proSn").val("");
            _STEP=1;
            return;
        }
        util.showLoading("保存数据中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:{sn:sn,mo_number:mo_number,workcenter:workcenter,qualityNo:qualityNo,img_list:photo.getData()},
            success: function(data){
               util.closeLoading(); 
               if(data.ajaxString.indexOf("OK")!=0){						 
                    showMessage(data.ajaxString,2);
               }else{ 
                    showMessage(sn+data.ajaxString,1);
                    photo.clear();
                    
                    if(proSns==""){
                        $("#proSn").val(sn);
                    }else{
                        proSns = proSns + "," + sn;
                        $("#proSn").val(proSns);
                    }
               }
            },
            error: function(msg){ 
               util.closeLoading();
                showMessage(msg,2);
            }
        });
 }
 
 function savePhotoInfo(){ 
    	var url = "buss/bussModel_exeFunc.ms?funcMId=fd0f1afcbd3841e38093b7972bf84764"; 
        util.showLoading("拍照中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:{workcenter:"JZ003"},
            success: function(data){
               util.closeLoading(); 
               if(data.ajaxString.indexOf('NG:')>-1){
                   showMessage(data.ajaxString,2);
               }else{
                   showMessage("拍照完成",1);
                   var rccList = data.ajaxList;
                   for(var i=0;i<rccList.length;i++){
                       photo.pushData(rccList[i]); 
                   }
                   //photo.pushData(data.ajaxString); 
               }
            },
            error: function(msg){ 
               util.closeLoading();
               //console.log(msg);
                showMessage(msg,2);
            }
        });
 }
</script>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
