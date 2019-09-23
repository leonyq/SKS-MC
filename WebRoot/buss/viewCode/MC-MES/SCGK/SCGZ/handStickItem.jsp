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
	<script type = "text/javascript" src = "${path}buss/pcbviewer/js/lib/jquery.svg.pan.zoom.js"></script>
	<script type = "text/javascript" src = "${path}buss/pcbviewer/js/lib/jquery.modal.js"></script>
	<script type = "text/javascript" src = "${path}buss/pcbviewer/js/pcbviewer.js"></script>
    <link rel="stylesheet" href="${path}buss/pcbviewer/css/jquery.modal.css" type="text/css">
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->
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
    .left_div{
        float:left;
        width:600px;
    }
    .right_div{
     float:left;
     width:530px;
    }
    .clear{
        clear:both;
    }
    .draw{
        width:300px;
        height:240px;
        margin-left:auto;
        margin-right:auto;
    }
    .esop{
        height:400px;
    }
    .div_title{
        text-align: center;
        background-color: #f6f5f7;
        padding: 5px;
    }
    .datagrid table{
        table-layout:fixed;
        width:100%;
    } 
    .datagrid td{
        border: 1px solid #dbe1ef;
        box-sizing: border-box;
        height: 28px;
        padding: 0 5px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .datagrid thead td{
        background-color: #e6eaf4;
        color: #666;
        font-size: 15px;
    }
    .datagrid tr.selected{
        background-color:#a6efa1
    }
    
    .zoomclass{
        position: absolute;
        background-color: #fff;
        width: 100%;
        height: 720px;
    }
    .zoomrightclass{ 
        width: 97%; 
    }
    .zoom{ 
        float: right;
        cursor: pointer;
    }	
    .pcb_viewer_div{
        width:900px;
        height:820px;
    }
    .zoomrightclass iframe{
        width:1200px;
        height:620px;
    }
    .div_draw{
        background-color:rgba(0,0,0,0.82);
    }
    </style>
	<script>
	top.$('script').each(function(i,item){ 
	    if(item.src.indexOf('jquery-1.7.2.js')>-1){ 
	        $(item).remove();
	        location.reload();
	    }
	    
	});
    var _url = location.protocol+"//"+location.host+"${path}";
	var _STEP=0;
	var itemDataTable=new ItemDataTable();
	var pcbViewer;
	$(function(){
	    $('.input_box').removeAttr('disabled').focus();
	    $('.input_box').keyup(function(event){
            if(event.keyCode ==13){
                var mo_number=$('#paraMap1_WHL_MO_NUMBER').val();
                var workcenter=$('#paraMap1_WHL_WORKCENTER').val();
                var input_text=$('.input_box').val();
                if(mo_number==''||workcenter==''){ 
                    showMessage('工作中心和制令单不能为空',2);
                    return;
                }
                if(_STEP==1){
                	if(isNaN(input_text)){
                	    showMessage('请输入物料数量',2);
                	}else{ 
                	    itemDataTable.setItemSNNum(input_text);
                	    _STEP=0;
                	    showStepTips();
                	}
                }else{
                    checkItemSN();
                }
            }
        }); 
        $('.tips_box').attr('readonly','readonly'); 
        itemDataTable.Tag=$('.datagrid-div1');
        itemDataTable.init();
		
        pcbViewer = PcbViewer('divPcb');
        
        $('#paraMap1_WHL_WORKCENTER').val(localStorage.handWorkCenterVal);
        $('#paraMap1_WHL_WORKCENTER_SHOW').val(localStorage.handWorkCenterName);
        
        $('.zoom').on('click',function(){
            $(this).parents('.zoom_area').toggleClass('zoomclass');
            $('.right_div').toggleClass('zoomclass').toggleClass('zoomrightclass');
            $('#divPcb').toggleClass('pcb_viewer_div');
            var is_max = $(this).parents('.zoom_area').hasClass('zoomclass');
            if($(this).parents('.div_esop').length>0){
                if(is_max) $('.div_draw').hide();
                else $('.div_draw').show(); 
                 
            }
            
            if($(this).parents('.div_draw').length>0){
                if(is_max) $('.div_esop').hide();
                else $('.div_esop').show(); 
                pcbViewer.stretch();
            }
            
            if(is_max) $(this).text('-');
            else $(this).text('+');
            
        });
    }); 
	function saveStorage(val,MKEY){
        localStorage.handWorkCenterName=val;
        localStorage.handWorkCenterVal=MKEY;
        showStepTips();
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
	function showStepTips(step){
	    if(step==undefined) step=_STEP;
	    if(step==0){
	        showMessage('请输入物料SN或产品SN');
	    }
	    if(step==1){
	        showMessage('请输入物料数量');
	    }
	}
	function clearWindow(){
	    $('#paraMap1_WHL_WORKCENTER_SHOW').val('');
	    $('#paraMap1_WHL_WORKCENTER').val('');
	    $('#paraMap1_WHL_MO_NUMBER_SHOW').val('');
	    $('#paraMap1_WHL_MO_NUMBER').val('');
	    showMessage();
	    itemDataTable.clear();
	    pcbViewer.fetch('');
		$('.esop iframe').attr('src','');
		showStepTips();
	} 
	
	function ItemDataTable(){
	    this.Tag=$('body');
	    this.PcbViewer;
	    var _This=this;
	    var _Data;
	    var _Tag;
	    var _ItemSN;
	    function bindHtml(){
	        var html='';
	        html+='<table>';
	        html+='<thead>';
	        html+='	<td style="width:8%">序号</td><td style="width:16%">物料编码</td><td style="width:20%">点位</td><td style="width:8%">点数</td><td style="width:40%">物料SN</td><td style="width:8%">数量</td>';
	        html+='     </thead>';
	        html+='     <tbody>';
	        html+='    	';
	        html+='     </tbody>';
	        html+='</table>';
	        _Tag.html(html);
	    }
	    function bindEvent(){
	         _Tag.find('tbody tr').off('dblclick').on('dblclick', function() {
	           var item_code=$(this).find('.item_code_td').text();
	           $(_Data).each(function(i,item){
	               if(item.CBD_ITEM_CODE==item_code){			 
                        _This.pcbViewer.draw(_url + item.VB_AIS,item.FACE=="2"?"BOTTOM":"TOP",item.CBD_POINT); 
                         $('.div_draw b').click();
                        return false;
	               }
	               
	           });
            });
	    }
	    this.init=function(){
	        _Tag= _This.Tag;
	        bindHtml();
	        bindEvent();
	    }
	    this.loadData=function(listData){
	        var html='';
	        if(listData!=undefined&&listData.length>0){ 
    	        $(listData).each(function(i,item){ 
    	            html+="<tr class='"+(item.IS_CHECK?"selected":"")+"'>";
    	            html+="<td>"+(i+1)+"</td>";
    	            html+="<td title='"+item.CBD_ITEM_CODE+"' class='item_code_td'>"+item.CBD_ITEM_CODE+"</td>";
    	            html+="<td title='"+item.CBD_POINT+"'>"+item.CBD_POINT+"</td>";
    	            html+="<td>"+item.CBD_ITEM_NUM+"</td>";
    	            html+="<td title='"+nvlto(item.ITEM_SN)+"'>"+nvlto(item.ITEM_SN)+"</td>";
    	            html+="<td>"+nvlto(item.ITEM_NUM)+"</td>";
    	            html+="</tr>";
    	            
    	        });
	        } 
	        _Tag.find('tbody').html(html);
	        bindEvent();
	        _Data=listData;
	    } 
	    this.setItemSN=function(item_sn,item_code){
	        var is_exists=false;
	        $(_Data).each(function(i,item){
	            if(item.ITEM_SN==undefined) item.ITEM_SN='';
	            if(item.ITEM_NUM==undefined) item.ITEM_NUM='';
	            if(item.IS_CHECK==undefined) item.IS_CHECK=false;
	            if(item.CBD_ITEM_CODE==item_code&&(nvlto(item.ITEM_SN)==''||nvlto(item.ITEM_SN)==item_sn)){
	                item.ITEM_SN = item_sn; 
	                _ItemSN = item_sn;
	                is_exists=true
	                return false;
	            }
	            if(item.CBD_ITEM_CODE==item_code){
	                var jsonStr = JSON.stringify(item);
	                var json 	= JSON.parse(jsonStr);
	                json.ITEM_SN = item_sn;
	                json.ITEM_NUM ='';
	                json.IS_CHECK=false;
	                _ItemSN = item_sn;
	                is_exists=true
	                _Data.push(json);
	                return false;
	            }
	            
	        });
	        if(is_exists){
	            _This.loadData(_Data);
	        }
	        return is_exists;
	    }
	    
	    this.setItemSNNum=function(item_num){
	        $(_Data).each(function(i,item){
	            
	            if(item.ITEM_SN==_ItemSN){
	                item.ITEM_NUM = item_num;
	                item.IS_CHECK=true;
	                return false;
	            } 
	        });
	        _ItemSN='';
	        _This.loadData(_Data);
	    }
	    this.getDataLength=function(){
	      if(_Data==undefined) return 0;
	      var length=0;
	      $(_Data).each(function(i,item){
	          if(item.ITEM_NUM>0){
	              length++;
	          }
	          
	      });
	      return length;
	    }
	    this.getDataStr=function(){
	      return JSON.stringify(_Data);
	    }
	    this.clear=function(){
	        _Data=undefined;
	        _Tag.find('tbody').html('');
	        _ItemSN='';
	    }
	}
	function nvlto(val){
	    if(val==undefined) return '';
	    else return val;
	}
	</script>
	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
			    <div class="optn">
			        <button type="button" onclick="clearWindow();"><i class="ico ico-cancel"></i><dict:lang value="清空" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="15b50a2d3240494284888dbc481b2674" type="add" />
	<div class="left_div">
	<table class="basic-table" style="width:600px">
	<input type="hidden" name="formIds" value="15b50a2d3240494284888dbc481b2674" />
	<input type="hidden" id="prefixInd" name="15b50a2d3240494284888dbc481b2674" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'5865a7e240d74a2386617a5700231399'" />
		<s:set name="_$formId_1" value="'15b50a2d3240494284888dbc481b2674'" />
		<s:set name="_$type" value="'add'" />	
        
			<td class="name-four" /><bu:uitn colNo="WHL_WORKCENTER" formId="15b50a2d3240494284888dbc481b2674" /></td>
			<bu:td cssClass="dec-self" colNo="WHL_WORKCENTER" formId="15b50a2d3240494284888dbc481b2674" ><bu:ui colNo="WHL_WORKCENTER" cssClass="workcenter" formId="15b50a2d3240494284888dbc481b2674" formIndex="1" /></bu:td>
	 		<td class="name-four" /><bu:uitn colNo="WHL_MO_NUMBER" formId="15b50a2d3240494284888dbc481b2674" /></td>
			<bu:td cssClass="dec-self" colNo="WHL_MO_NUMBER" formId="15b50a2d3240494284888dbc481b2674" ><bu:ui colNo="WHL_MO_NUMBER" cssClass="mo_number" formId="15b50a2d3240494284888dbc481b2674"  formIndex="1" /></bu:td>
	
		<tr>
			<td class="name-four" /><bu:uitn colNo="WHL_INPUT" formId="15b50a2d3240494284888dbc481b2674" /></td>
			<bu:td colspan="3" cssClass="dec-self" colNo="WHL_INPUT" formId="15b50a2d3240494284888dbc481b2674" ><bu:ui colNo="WHL_INPUT" cssClass="input_box" formId="15b50a2d3240494284888dbc481b2674"  formIndex="1" /></bu:td>
	
		</tr>
		<tr> 
		    <td colspan="4" class="name-four" /><bu:ui colNo="WHL_TIPS_BOX" cssClass="tips_box" formId="15b50a2d3240494284888dbc481b2674"  formIndex="1" /></td> 
		</tr>
	</table>
	<div class="panel-ajax datagrid datagrid-div1"  style="height: 605px; overflow:auto">
	        
		</div>
	</div>
	<div class="right_div">
	   <div class="div_draw zoom_area">
    	<div class="div_title">
    	    	图纸<b class="zoom zoomMax">+</b>
    	</div>
    	<div id="divPcb" class="draw">
    	    
    	</div>
    	</div>
    	<div class="div_esop zoom_area">
    	<div class="div_title">
    	    	作业指导书<b class="zoom zoomMax">+</b>
    	</div>
    	<div class="esop">
    	<iframe src="" width="595" height="400"  style="border: none;"></iframe>
    	</div>
    	</div>
	</div>
	<div class="clear"></div>
			<bu:jsVal formId="15b50a2d3240494284888dbc481b2674" formIndex="1" />
				
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
<script>
 //ajax函数
 function getMoItem(){
        var url = "buss/bussModel_exeFunc.ms?funcMId=284ca998d2c04d9388bdf61d45e4e345";
        
        util.showLoading("获取数据中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:{mo_number:$('#paraMap1_WHL_MO_NUMBER').val(),work_station:$('#paraMap1_WHL_WORKCENTER').val()},
            success: function(data){
               util.closeLoading();
               if(data.ajaxList!=undefined&&data.ajaxList.length>0){
                   itemDataTable.loadData(data.ajaxList); 
                   itemDataTable.pcbViewer=pcbViewer;
                   var item=data.ajaxList[0];
                   var path=_url+(item.FACE=="2"?item.GDO_BOTTOM:item.GDO_TOP);
		           pcbViewer.fetch(path);
		           $('.esop iframe').attr('src',item.ESOP_FILE);
               }else{
                   itemDataTable.clear();
                   pcbViewer.fetch('');
		           $('.esop iframe').attr('src','');
               }
               showStepTips();
            },
            error: function(msg){
               util.closeLoading();
               showMessage(msg,2);
            }
        });
 }
 
 function checkItemSN(){
        var url = "buss/bussModel_exeFunc.ms?funcMId=1914fe859f294270a16c43e4fb3f6f16";
        
        util.showLoading("获取数据中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:{item_sn:$('.input_box').val(),mo_number:$('#paraMap1_WHL_MO_NUMBER').val()},
            success: function(data){
               util.closeLoading();
               if(data.ajaxList!=undefined&&data.ajaxList.length>0){
                   var item=data.ajaxList[0]; 
                   if(itemDataTable.setItemSN(item.WSI_ITEM_SN,item.WSI_ITEM_CODE)){
                        _STEP=1;
                        showStepTips();
                   }else{
                       showMessage("非当前制令单所需物料",2);
                   }
               }else{ 
                if(data.ajaxString=="1"){
                    if(itemDataTable.getDataLength()==0){
                        showMessage("请先输入物料SN",2);
                    }else{
                        saveItemSN();
                    }
                }else{
                    showMessage("物料SN未备料",2);
                }
               }
            },
            error: function(msg){ 
               util.closeLoading();
                showMessage(msg,2);
            }
        });
 }
 
 function saveItemSN(){
    	var sn=$('.input_box').val();
    	var mo_number=$('#paraMap1_WHL_MO_NUMBER').val();
    	var workcenter=$('#paraMap1_WHL_WORKCENTER').val();
    	var item_list=itemDataTable.getDataStr();
    	var url = "buss/bussModel_exeFunc.ms?funcMId=97b95e047cef4f3e9cb15d7bf60e1cda";
        
        util.showLoading("保存数据中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:{sn:sn,mo_number:mo_number,workcenter:workcenter,item_list:item_list},
            success: function(data){
               util.closeLoading(); 
               if(data.ajaxString.indexOf("OK")!=0){						 
                    showMessage(data.ajaxString,2);
               }else{ 
                    showMessage(sn+"保存成功",1);
               }
            },
            error: function(msg){ 
               util.closeLoading();
                showMessage(msg,2);
            }
        });
 }
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
