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
	<script type = "text/javascript" src = "${path}buss/pcbviewer/js/pcbviewer.js?v=0.7"></script>
	<script type = "text/javascript" src = "${path}buss/pcbviewer/js/pcbviewer.common.js"></script> 
	<link rel="stylesheet" href="${path}buss/pcbviewer/css/pcbviewer.common.css" type="text/css">
    <link rel="stylesheet" href="${path}buss/pcbviewer/css/jquery.modal.css" type="text/css">
  
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->
    <style>
    .optn{
        position:inherit;
    }
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
    .zoomrightclass {
        width: 97%;
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
	    top.editItemNumCallback=editItemNumCallback;
	    top.editItemPointCallback=editItemPointCallback;
	    top.editItemPointNew=editItemPointNew;
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
                	    if(itemDataTable.setItemSNNum(input_text)){
                    	    _STEP=0;
                    	    showStepTips();
                	    }
                	}
                }else{
                    checkItemSN();
                }
            }
        }); 
        $('.tips_box').attr('readonly','readonly'); 
        itemDataTable.Tag=$('.datagrid-div1');
        
        itemDataTable.init();
		
        //pcbViewer = PcbViewer('divPcb');
        pcbViewer=new PcbViewerMulti();
        pcbViewer.Tag=$('.div_draw')
        pcbViewer.topDivId='divPcbTop';
        pcbViewer.botDivId='divPcbBot';
        pcbViewer.btnClickEvent=function(){
            itemDataTable.loadPcbViewer($('.div_draw .btn.checked').attr('_face'));
        }
        pcbViewer.show();
        $('#paraMap1_WHL_WORKCENTER').val(localStorage.handWorkCenterVal);
        $('#paraMap1_WHL_WORKCENTER_SHOW').val(localStorage.handWorkCenterName);
        $('#_PRODUCT_STEP').val(localStorage.handProductStep); 
        $('#_GROUP_CODE').val(localStorage.handGroupCode);
        changeBtnStatus();
        $('.div_esop .zoom').on('click',function(){
            $(this).parents('.zoom_area').toggleClass('zoomclass');
            $('.right_div').toggleClass('zoomclass').toggleClass('zoomrightclass');
            $('.div_draw .draw').toggleClass('pcb_viewer_div');
            var is_max = $(this).parents('.zoom_area').hasClass('zoomclass');
            if($(this).parents('.div_esop').length>0){
                if(is_max) $('.div_draw').hide();
                else $('.div_draw').show();  
            }
            
            if(is_max){ 
                $(this).text('-'); 
                $('.draw,.esop').height($(window).height()-95);
            }
            else {
                $(this).text('+');
                $('.draw,.esop').height(($(window).height()-130)/2);	 
            }
            if($(this).parents('.div_draw').length>0){
                if(is_max) {
                    $('.div_esop').hide();	
                }
                else {
                    $('.div_esop').show(); 	
                } 
                pcbViewer.stretch('h');
            }
            
            
        });
        /*
        $('.div_draw .btn').on('click',function(){ 
            if($(this).hasClass('checked')) return;
            $('.div_draw .btn').removeClass('checked');
            $(this).addClass('checked'); 
            util.showLoading();
            itemDataTable.loadPcbViewer($('.div_draw .btn.checked').attr('_face'));
            util.closeLoading();
        });
        */
        $('.panel-ajax').height($(window).height()-180);
        $('.draw,.esop').height(($(window).height()-130)/2);
    }); 
	function saveStorage(val,MKEY){
        localStorage.handWorkCenterName=val;
        localStorage.handWorkCenterVal=MKEY; 
        localStorage.handProductStep=$('#_PRODUCT_STEP').val();
        localStorage.handGroupCode=$('#_GROUP_CODE').val();  
        changeBtnStatus();
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
	        showMessage('请输入包装编号或产品SN');
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
	    pcbViewer.clear();
		$('.esop iframe').attr('src','');
		_STEP=0;
		showStepTips();
		_error_sn='';
	} 
	
	function ItemDataTable(){
	    this.Tag=$('body');
	    this.PcbViewer;
	    var _CoorContent;
	    var _This=this;
	    var _Data;
	    var _Tag;
	    var _ItemSN;
	    var _topPath;
	    var _botPath;
	    var _face;
	    var _coor;
	    function bindHtml(){
	        var html='';
	        html+='<table class="item_table" style="width:720px;">';
	        html+='<thead>';//width:16%
	        html+='	<td style="display:none">序号</td><td style="display:none">批次号</td><td style="display:none;">物料编码</td><td style="width:13%" title="实物标识">实物标识</td><td style="width:20%">规格型号</td><td style="width:18%">点位</td><td style="width:8%">点数</td><td style="width:8%">数量</td><td style="width:12%" title="剩余数量">剩余数量</td><td style="width:35%">包装编号</td>';
	        html+='     </thead>';
	        html+='     <tbody>';
	        html+='    	';
	        html+='     </tbody>';
	        html+='</table>';
	        _Tag.html(html);
	    }
	    function bindEvent(){
	         _Tag.find('tbody tr').off('dblclick').on('dblclick', function() {
	           _Tag.find('tbody tr').not(this).removeClass('selected2');
               $(this).toggleClass('selected2');
	           if(_CoorContent==undefined||_CoorContent.length==0){
	               showMessage("无点位位置信息",2);
	               return;
	           }
	           var item_code=$(this).find('.item_code_td').text();
	           $(_Data).each(function(i,item){
	               if(item.CBD_ITEM_CODE==item_code){			 
                        //_This.pcbViewer.draw(_url + item.VB_AIS,item.FACE=="2"?"BOTTOM":"TOP",item.CBD_POINT); 
                        _coor=_CoorContent.filter(n=>(','+item.CBD_POINT+',').indexOf(','+n.code+',')>-1); 
                        var _top_coor=_coor.filter(n=>n.face=='TOP');
                        var _bot_coor=_coor.filter(n=>n.face=='BOTTOM');
                        var _top=false;
                        var _bot=false;
                        if(_top_coor!=undefined&&_top_coor.length>0){ 
                            _top=true;
                        }
                        if(_bot_coor!=undefined&&_bot_coor.length>0){
                            _bot=true;
                        }
                        
                        if(_top&&_bot){
                            _This.pcbViewer.drawLocations(getCoorByFace(),_face); 
                        }else if(_top&&_face!='top'){	 
		                    $('.div_draw .btn_top').click();
                        }else if(_bot&&_face!='bot'){	  
		                    $('.div_draw .btn_bot').click(); 
                        }else{ 
                            _This.pcbViewer.drawLocations(getCoorByFace(),_face);
                        } 
                        $('.div_draw b').click();
                        return false;
	               }
	               
	           });
            });
            //_Tag.find('tbody tr').off('dblclick').on('dblclick', function() {
            //    $('.div_draw b').click();
            //});
            _Tag.find('tbody tr').off('click').on('click', function() {
                _Tag.find('tbody tr').not(this).removeClass('selected2');
                $(this).toggleClass('selected2');
            });
            _Tag.find(".remain_num").off('dblclick').on("dblclick",function(event){  
               event.stopPropagation();
            }); 
            _Tag.find(".remain_num").off('blur').on("blur",function(event){  
               var _m_item_sn=$(this).parent().parent().find('.item_sn').text();
               //console.log(_m_item_sn);
               var _item_num=$(this).val();
               $(_Data).each(function(i,item){ 
	            if(item.ITEM_SN==_m_item_sn){ 
	                item.REMAIN_NUM = _item_num; 
	                return false;
	            } 
	        });
            }); 
            
	    }
	    function getCoorByFace(){
	        if(_coor==undefined) return [];
	        if(_face=='top'){
	            return _coor.filter(n=>n.face=='TOP');
	        }
	        if(_face=='bot')
	        {
                return _coor.filter(n=>n.face=='BOTTOM');
            }
	    }
	    this.init=function(){
	        _Tag= _This.Tag;
	        bindHtml();
	        bindEvent();
	    }
	    this.loadData=function(listData){
	        var html='';
	        if(listData!=undefined&&listData.length>0){ console.log(listData);
    	        $(listData).each(function(i,item){ 
    	            if(item.CI_MATERIAL_FLAG==null) item.CI_MATERIAL_FLAG="";
    	            if(item.CI_ITEM_SPEC==null) item.CI_ITEM_SPEC="";
    	            if(item.WSI_LOT_NO==null) item.WSI_LOT_NO="";
    	            if(item.CBD_POINT==null) item.CBD_POINT="";
    	            if(item.CBD_POINT_OLD==null) item.CBD_POINT_OLD="";
    	            if(parseInt(item.ISSAVE)>0){
    	                html+="<tr bgcolor='#00a0e9' class='"+(item.IS_CHECK?"selected":"")+"'>";
    	            }else{
    	                html+="<tr class='"+(item.IS_CHECK?"selected":"")+"'>";
    	            }
    	            html+="<td style='display:none'>"+(i+1)+"</td>";
    	            html+="<td style='display:none'>"+item.WSI_LOT_NO+"</td>";
    	            html+="<td title='"+item.CBD_ITEM_CODE+"' style='display:none' class='item_code_td'>"+item.CBD_ITEM_CODE+"</td>";
    	            html+="<td title='"+nvlto(item.CI_MATERIAL_FLAG)+"'>"+nvlto(item.CI_MATERIAL_FLAG)+"</td>";
    	            
    	            html+="<td title='"+item.CI_ITEM_SPEC+"'>"+item.CI_ITEM_SPEC+"</td>";
    	            html+="<td title='"+item.CBD_POINT+"'>"+item.CBD_POINT+"</td>";
    	            html+="<td>"+item.CBD_ITEM_NUM+"</td>";
    	            
    	            html+="<td>"+nvlto(item.ITEM_NUM)+"</td>";
    	            //html+="<td><input type='text' autocomplete='off' oninput='this.value=this.value.replace(/[^\\d.]/g,\"\")'   class='remain_num' value='"+nvlto(item.REMAIN_NUM)+"'/></td>";
    	            html+="<td>"+nvlto(item.REMAIN_NUM)+"</td>";
    	            html+="<td class='item_sn' title='"+nvlto(item.ITEM_SN)+"'>"+nvlto(item.ITEM_SN)+"</td>";
    	            html+="</tr>";
    	        

    	        });
	        } 
	        _Tag.find('tbody').html(html);
	        bindEvent();
	        _Data=listData;
	    } 
	    this.reloadRemainNum=function(list){
	        if(list!=undefined&&_Data!=undefined){
	             
	             var is_exists=false;
	             $(_Data).each(function(i,oItem){
    	             $(list).each(function(	j,nItem){
    	             //console.log(nItem);
    	                if(oItem.ITEM_SN==nItem.WSI_ITEM_SN&&oItem.REMAIN_NUM!=nItem.WSI_ITEM_NUM){
    	                    if(nItem.WSI_ITEM_NUM<=0){	
                                oItem.REMAIN_NUM='';
                                oItem.ITEM_SN ='';
            	                oItem.ITEM_NUM =''; 
            	                oItem.IS_CHECK=false;
    	                    }else{ 
    	                        oItem.REMAIN_NUM=nItem.WSI_ITEM_NUM;
    	                    }
    	                    is_exists=true;
    	                }
    	             });
	             });
	             if(is_exists){
	                _This.loadData(_Data);
	       		 }
	        }
	    }
	    this.setItemSN=function(item_sn,item_code,item_num,itemMain){
	        var is_exists=false;
	        $(_Data).each(function(i,item){
	            if(item.ITEM_SN==undefined) item.ITEM_SN='';
	            if(item.ITEM_NUM==undefined) item.ITEM_NUM='';
	            if(item.REMAIN_NUM==undefined) item.REMAIN_NUM='';
	           
	            if(item.IS_CHECK==undefined) item.IS_CHECK=false;
	            if((item.CBD_ITEM_CODE==item_code||itemMain==item.CBD_ITEM_CODE)&&(nvlto(item.ITEM_SN)==''||nvlto(item.ITEM_SN)==item_sn)){
	                item.ITEM_SN = item_sn; 
	                _ItemSN = item_sn;
	                item.REMAIN_NUM=item_num;
	                is_exists=true
	                return false;
	            }
	            if(item.CBD_ITEM_CODE==item_code||itemMain==item.CBD_ITEM_CODE){
	                //var jsonStr = JSON.stringify(item);
	                //var json 	= JSON.parse(jsonStr);
	                item.ITEM_SN = item_sn;
	                _ItemSN = item_sn;
	                item.ITEM_NUM = '';
	                item.REMAIN_NUM=item_num;
	                is_exists=true
	                //_Data.push(json);
	                return false;
	            }
	            /*if(item.CBD_ITEM_CODE==item_code){
	                var jsonStr = JSON.stringify(item);
	                var json 	= JSON.parse(jsonStr);
	                json.ITEM_SN = item_sn;
	                json.ITEM_NUM ='';
	                item.REMAIN_NUM = item_num;
	                json.IS_CHECK=false;
	                _ItemSN = item_sn;
	                is_exists=true
	                _Data.push(json);
	                return false;
	            }*/
	            
	        });
	        if(is_exists){
	            _This.loadData(_Data);
	        }
	        return is_exists;
	    }
	    
	    this.setItemSNNum=function(item_num){
	        let retult=false; 
	        $(_Data).each(function(i,item){
	            
	            if(item.ITEM_SN==_ItemSN){
	                if(item.CBD_ITEM_NUM<item_num){
	                    showMessage('物料数量不能超过点数',2);
	                    return false;
	                }
	                if(item.REMAIN_NUM<item_num){
	                    showMessage('物料数量不能超过剩余数量',2);
	                    return false;
	                }
	                item.ITEM_NUM = item_num;
	                //item.REMAIN_NUM = item_num;
	                item.IS_CHECK=true;
	                if(item.CBD_ITEM_NUM>item_num){
	                    pointSelect(item);
	                }
	                retult=true;
	                return false;
	            } 
	        });
	        if(retult==false) return false;
	        _ItemSN='';
	        _This.loadData(_Data);
	        return true;
	    }
	    this.setItemPoints=function(points,item_num,item_code){
	        let retult=false; 
	        $(_Data).each(function(i,item){ 
	            if(item.CBD_ITEM_CODE==item_code){ 
	                /*if(item.ITEM_NUM>item_num){&& item.CBD_POINT != points
	                    showMessage('点位数量不能小于当前设置用量',2);
	                    return false;
	                }*/
	                item.CBD_POINT = points; 
	                item.CBD_ITEM_NUM = item_num;
	                item.ITEM_NUM=item_num;
	                retult=true;
	                return false;
	            } 
	        });
	        if(retult==false) return false; 
	        _This.loadData(_Data);
	        return true;
	    }
	    this.setItemPointsNew=function(item_code){
	        let retult=false; 
	        $(_Data).each(function(i,item){ 
	            if(item.CBD_ITEM_CODE==item_code){ 
	                /*if(item.ITEM_NUM>item_num){&& item.CBD_POINT != points
	                    showMessage('点位数量不能小于当前设置用量',2);
	                    return false;
	                }*/
	               //$(this).parent("tr").toggleClass("class","");
	                //console.log($(this));
	                item.CBD_POINT = item.CBD_POINT; 
	                item.CBD_ITEM_NUM = item.CBD_ITEM_NUM;
	                item.ITEM_NUM='';
	                item.REMAIN_NUM='';
	                item.ITEM_SN='';
	                item.IS_CHECK=false;
	                retult=true;
	                return false;
	            } 
	        });
	        if(retult==false) return false; 
	        _This.loadData(_Data);
	        
	        return true;
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
	    this.getSeletedItem=function(type){
	      var return_sn = undefined; 
	      if(_Data==undefined) return return_sn;
	      if(type==1){
	          var item_code=_Tag.find('tr.selected2 .item_code_td').text();
    	      if(item_code!=''){
        	      $(_Data).each(function(i,item){
        	          if(item.CBD_ITEM_CODE==item_code){
        	              return_sn = item;
        	              return false;
        	          } 
        	      });
    	      }
	      }else{
    	      var item_sn=_Tag.find('tr.selected2 .item_sn').text();
    	      if(item_sn!=''){
        	      $(_Data).each(function(i,item){
        	          if(item.ITEM_SN==item_sn){
        	              return_sn = item;
        	              return false;
        	          } 
        	      });
    	      }
	      }
	      return return_sn;
	    }
	    this.getDataStr=function(){
	      return JSON.stringify(_Data);
	    }
	    this.clear=function(){
	        _Data=undefined;
	        _CoorContent=[];
	        _topPath='';
	        _botPath='';
	        _Tag.find('tbody').html('');
	        _ItemSN='';
	        _face='';
	        _coor=undefined;
	    }
	    this.setCoorContent=function(coor_content){
	        if(coor_content!=undefined&&coor_content.length>0){
	            _CoorContent=lowerJSONKey(coor_content);
	        }else{
	            _CoorConten=[];
	        }
	    }
	    this.setTopPath=function (url){
            _topPath=url;
        }
        this.setBotPath=function (url){
            _botPath=url;
        }
        this.loadPcbViewer=function (face){  
            /*
            if(face=='bot'&&(_botPath==''||_botPath==undefined)){
                return;
            }else if(face=='top'&&(_topPath==''||_topPath==undefined)){
                return;
            }
            util.showLoading();		
            try{
            _This.pcbViewer.fetch(face=='bot'?_botPath:_topPath,function(){	 	 
          
                util.closeLoading();
                if(_coor!=undefined){
                    _This.pcbViewer.drawLocations(getCoorByFace());
                }
                _This.pcbViewer.stretch('h'); 
            });
            }catch(e){
                util.closeLoading();
                console.log(e);
            }
            util.closeLoading();*/ 
            _face=face; 
            if(_This.pcbViewer!=undefined){
                
                _This.pcbViewer.drawLocations(getCoorByFace(),face);
                
            }
        }
	}
	function nvlto(val){
	    if(val==undefined) return '';
	    else return val;
	}
	
	function lowerJSONKey(jsonArr){
	    $.each(jsonArr,function(n,jsonObj){	 
            for (var key in jsonObj){
                jsonObj[key.toLowerCase()] = jsonObj[key];
                delete(jsonObj[key]);
            } 
	    });
        return jsonArr;
    } 
    /*
    function PcbViewerMulti(){
        this.topDivId;
        this.botDivId;
	    this.topPath;
	    this.botPath;
	    this.Tag;
	    var _This=this;
	    var _Tag;
	    var pcbViewerTop;
	    var pcbViewerBot;
	    var topDiv;
	    var botDiv;
	    function bindHtml(){
	        var html='';
	        html+='<div class="div_title">';
        	html+='    	图纸<b class="zoom zoomMax">+</b><small class="btn btn_bot" _face="bot">BOT</small><small class="btn btn_top" _face="top">TOP</small>';
            html+='    	</div>';
            html+='    	<div id="divPcbTop" class="draw top">';
            html+='    	</div>';
            html+='    	<div id="divPcbBot" class="draw bot none">';
            html+='    	</div>';
            _Tag.html(html);
	    }
	    function init(){
	        _Tag=_This.Tag;
	        bindHtml();
	        pcbViewerTop = PcbViewer(_This.topDivId);
	        pcbViewerBot = PcbViewer(_This.botDivId);
	        if(_This.topPath!=undefined){
	            pcbViewerTop.fetch(_This.topPath);
	        }	
            if(_This.botPath!=undefined){
	            pcbViewerBot.fetch(_This.botPath);				
            }
	        topDiv=$('#'+_This.topDivId);
	        botDiv=$('#'+_This.botDivId);
	        bindEvent(); 
	    }
	    function bindEvent(){
	        _Tag.find('.zoom').off('click').on('click',function(){
                $(this).parents('.zoom_area').toggleClass('zoomclass');
                var _parentDiv=_Tag.parent();
                _parentDiv.toggleClass('zoomclass').toggleClass('zoomrightclass');
                _Tag.find('.draw').toggleClass('pcb_viewer_div');
                var is_max = $(this).parents('.zoom_area').hasClass('zoomclass');
              
                if(is_max){ 
                    $(this).text('-'); 
                    _Tag.find('.draw').height($(window).height()-95);
                }
                else {
                    $(this).text('+');
                    _Tag.find('.draw').height(($(window).height()-130)/2);	 
                }
                 
                if($(this).parents('.div_draw').length>0){
                    if(is_max) {
                        $('.div_esop').hide();	
                    }
                    else {
                        $('.div_esop').show(); 	
                    } 
                    _This.stretch('h');
                } 
            
            }); 
        _Tag.find('.btn').off('click').on('click',function(){ 
            if($(this).hasClass('checked')) return;
            $('.div_draw .btn').removeClass('checked');
            $(this).addClass('checked'); 
            util.showLoading();
            if(typeof(_This.btnClickEvent)=='function'){
                _This.btnClickEvent();   
            }//itemDataTable.loadPcbViewer($('.div_draw .btn.checked').attr('_face'));
            _This.stretch('h');
            util.closeLoading();
        });
	    }
	    this.btnClickEvent=function(){
	        
	    }
	    this.loadPcbViewer=function(callback){
	        if(_This.topPath!=undefined&&_This.botPath!=undefined){
	            pcbViewerTop.fetch(_This.topPath);
	            pcbViewerBot.fetch(_This.botPath,callback);	
	        }else if(_This.topPath!=undefined){
	            pcbViewerTop.fetch(_This.topPath,callback);
	        }else{
	            util.closeLoading();
	        }
	    }
	    this.stretch=function(type){ 
	    console.log(_Tag.find('#divPcbTop').width()/_Tag.find('#divPcbTop').height());
	        if(_Tag.find('#divPcbTop').width()/_Tag.find('#divPcbTop').height()<3.0/2){
	            type='';
	        }else{
	            type='h';
	        }
	        pcbViewerTop.stretch(type);
	        pcbViewerBot.stretch(type);
	    }
	    this.showTop=function(){
	            topDiv.show();
	            botDiv.hide();
	    }
	    this.showBot=function(){
	            topDiv.hide();
	            botDiv.show();
	    }
	    this.drawLocations=function(jsonArr,face){
	         
	        if(face=='top'&&_This.topPath!=undefined){
	            topDiv.show();
	            botDiv.hide(); 
	            pcbViewerTop.drawLocations(jsonArr==undefined?[]:jsonArr);
	        }
	        if(face=='bot'&&_This.botPath!=undefined){ 
	            topDiv.hide();
	            botDiv.show();
	            pcbViewerBot.drawLocations(jsonArr==undefined?[]:jsonArr);
	        } 
	    }
	    this.clear=function(){
	       topDiv.show();
	       botDiv.hide();
	       pcbViewerTop.fetch('');
	       pcbViewerBot.fetch('');
	    }
	    this.show=function(){
	        init();
	    }
    }
    
    */
    function pointSelect(item){ 
        if(item==undefined){
            item=itemDataTable.getSeletedItem(1);
        }
        if(item==undefined){
            showMessage('请选择一行数据',2);
            return;
        }
        var url = "${path}buss/bussModel.ms?exeid=c1154c5e9f574628ae2397308402075e&dataId=&formId=0056deb42efa4d169a94dbc46f5a433a";
        var param="&itemPoints="+item.CBD_POINT_OLD+"&itemNum="+item.ITEM_NUM+"&itemCode="+item.CBD_ITEM_CODE+"&itemPointsSelected="+item.CBD_POINT;
      
        showPopWinFp(url + param, 850, 450,"","<dict:lang value="选择点位"/>","testfs");
        
    }
    function testff(){	alert(234);
        closePopWinFp('testfspop');
    }
    //直接关闭
    function editItemPointNew(itemCode){
        itemDataTable.setItemPointsNew(itemCode);
    }
    function editItemPointCallback(points,itemNum,itemCode){
        itemDataTable.setItemPoints(points,itemNum,itemCode);
    }
    function editItemNumConfirm(){
        var item=itemDataTable.getSeletedItem();
        if(item==undefined){
            showMessage('请选择有包装编号的数据行',2);
            return;
        }
        //console.log(item);
         
        var url = "${path}buss/bussModel.ms?exeid=19ba911f322c4bcdb1f96d92a6c934e6&dataId=&formId=db084c9c700b4c9597366a4c5593f8f3";
        var param="&itemSn="+item.ITEM_SN+"&itemNum="+item.REMAIN_NUM+"&moNumber="+$("#paraMap1_WHL_MO_NUMBER").val();
        showPopWinFp(url + param, 500, 150,"","<dict:lang value="修改物料数量"/>","");
       
    }
    function editItemNumCallback(){
       getItemSNList(function(item_list){
           itemDataTable.reloadRemainNum(item_list);
       });
    }
    //解除关联
    function removePoint(){
        var url = "${path}buss/bussModel.ms?exeid=430327d201c34fd3889ec3b14616b4a1&dataId=&formId=db084c9c700b4c9597366a4c5593f8f3";
        //var param="&itemSn="+item.ITEM_SN+"&itemNum="+item.REMAIN_NUM+"&moNumber="+$("#paraMap1_WHL_MO_NUMBER").val();
        showPopWinFp(url, 500, 350,"","<dict:lang value="解除关联"/>","");
    }
    //挂起
    function pauseInfo(){
        var url = "${path}buss/bussModel.ms?exeid=a3751de3bc7b44ea810064b4f2f10254&dataId=&formId=db084c9c700b4c9597366a4c5593f8f3";
        if($('#paraMap1_WHL_WORKCENTER').val()==""||$('#paraMap1_WHL_MO_NUMBER').val()==""){
            showMessage('请选择工作中心和制令单号',2);
            return;
        }
        var param="&workSn="+$('#paraMap1_WHL_WORKCENTER').val()+"&moNumber="+$('#paraMap1_WHL_MO_NUMBER').val()+"&groupCode="+$("#_GROUP_CODE").val();
        showPopWinFp(url+param, 500, 400,"","<dict:lang value="挂起"/>","");
    }
    //维修
    function repairProduct(){
        //if($('#paraMap1_WHL_WORKCENTER').val()==""||$('#paraMap1_WHL_MO_NUMBER').val()==""){
        //    showMessage('请选择工作中心和制令单号',2);
        //    return;
        //}
        var piframeId = window.frameElement.id;
        var url = "${path}buss/bussModel.ms?exeid=44cb2a5a151e48b89e62a29c1a5d3b2a&dataId=&formId=0056deb42efa4d169a94dbc46f5a433a&iframeId="+piframeId;
        var param="&sn="+_error_sn;
        showPopWinFp(url + param, $(window).width(), $(window).height(),"","<dict:lang value="产品维修"/>","");
        
    }
    function changeBtnStatus(){
        if($('#_GROUP_CODE').val()=='SGBH001'){
            $('.btn_repair').remove();
            $('.optn').prepend('<button type="button" onclick="repairProduct();" class="btn_repair"><dict:lang value="维修" /></button>');
        }else{ 
            $('.btn_repair').remove();
        }
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
			        <!--<button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>-->
			        <button type="button" class="btnPointSelect" onclick="pointSelect();"><dict:lang value="选择点位" /></button>
			        <button type="button" onclick="editItemNumConfirm();"><dict:lang value="修改数量" /></button>
			        <button type="button" onclick="removePoint();"><dict:lang value="解除关联" /></button> 
			        <button type="button" onclick="clearWindow();"><dict:lang value="清空" /></button>
			         <button type="button" onclick="pauseInfo();"><dict:lang value="工序提交" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="8c048b8e35874c168fbff6ab0fee4d69" type="add" />
    <div class="left_div">
	<table class="basic-table" style="width:600px">
	<input type="hidden" name="formIds" value="8c048b8e35874c168fbff6ab0fee4d69" />
	<input type="hidden" id="_PRODUCT_STEP" value="" />
	<input type="hidden" id="_GROUP_CODE" value="" />
	<input type="hidden" id="prefixInd" name="8c048b8e35874c168fbff6ab0fee4d69" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'3ce65f51b4b24f1aaf0a4cedfdc311a7'" />
		<s:set name="_$formId_1" value="'8c048b8e35874c168fbff6ab0fee4d69'" />
		<s:set name="_$type" value="'add'" /> 
			<td class="name-four" /><bu:uitn colNo="WHL_WORKCENTER" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<bu:td cssClass="dec-self" colNo="WHL_WORKCENTER" formId="8c048b8e35874c168fbff6ab0fee4d69" ><bu:ui colNo="WHL_WORKCENTER" cssClass="workcenter" formId="8c048b8e35874c168fbff6ab0fee4d69" formIndex="1" /></bu:td>
	 		<td class="name-four" /><bu:uitn colNo="WHL_MO_NUMBER" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<bu:td cssClass="dec-self" colNo="WHL_MO_NUMBER" formId="8c048b8e35874c168fbff6ab0fee4d69" ><bu:ui colNo="WHL_MO_NUMBER" cssClass="mo_number" formId="8c048b8e35874c168fbff6ab0fee4d69"  formIndex="1" /></bu:td>
	
		<tr>
			<td class="name-four" /><bu:uitn colNo="WHL_INPUT" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<bu:td colspan="3" cssClass="dec-self" colNo="WHL_INPUT" formId="8c048b8e35874c168fbff6ab0fee4d69" ><bu:ui colNo="WHL_INPUT" cssClass="input_box" formId="8c048b8e35874c168fbff6ab0fee4d69"  formIndex="1" /></bu:td>
	
			</tr>
			<tr> 
		<td colspan="4" class="name-four" /><bu:ui colNo="WHL_TIPS_BOX" cssClass="tips_box" formId="8c048b8e35874c168fbff6ab0fee4d69"  formIndex="1" /></td> 
			</tr>
	</table>
        <div class="panel-ajax datagrid datagrid-div1"  style="overflow:auto;">
	        
		</div>
	</div>

	<div class="right_div">
	    <div class="div_draw zoom_area">
    	<!--<div class="div_title">
    	    	图纸<b class="zoom zoomMax">+</b><small class="btn btn_bot" _face="bot">BOT</small><small class="btn btn_top" _face="top">TOP</small>
    	</div>
    	<div id="divPcbTop" class="draw top">
    	    
    	</div>
    	
    	<div id="divPcbBot" class="draw bot none">
    	    
    	</div>-->
    	</div>
    	<div class="div_esop zoom_area">
    	<div class="div_title">
    	    	作业指导书<b class="zoom zoomMax">+</b>
    	</div>
    	<div class="esop">
    	<iframe src="" width="100%" height="100%"  style="border: none;"></iframe>
    	</div>
    	</div>
	</div>
	<div class="clear"></div>
			<bu:jsVal formId="8c048b8e35874c168fbff6ab0fee4d69" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<script>
 var _error_sn;
 //ajax函数
 function getMoItem(){
        var url = "buss/bussModel_exeFunc.ms?funcMId=371cbc005cec419cbe5bac50ff01b2a3";
        
        util.showLoading("获取数据中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:{mo_number:$('#paraMap1_WHL_MO_NUMBER').val(),work_station:$('#paraMap1_WHL_WORKCENTER').val(),step:$('#_PRODUCT_STEP').val()},
            success: function(data){
               //util.closeLoading();
               if(data.ajaxList!=undefined&&data.ajaxList.length>0){
                   itemDataTable.clear();		 
	               $('.div_draw .btn_top').removeClass('checked');
                   itemDataTable.loadData(data.ajaxList); 
                   itemDataTable.pcbViewer=pcbViewer;
                   var item=data.ajaxList[0];
                   //var path=_url+(item.FACE=="2"?item.GDO_BOTTOM:item.GDO_TOP);
                   //itemDataTable.setTopPath(_url+ item.GDO_TOP);
                   //itemDataTable.setBotPath(_url+ item.GDO_BOTTOM);
                   //默认先读取top面图纸  
		           pcbViewer.topPath=_url+item.GDO_TOP;
		           pcbViewer.botPath=_url+item.GDO_BOTTOM;
		           util.showLoading("获取数据中...");
		           pcbViewer.loadPcbViewer(function(){
		                
		               $('.div_draw .btn_top').click();
		               util.closeLoading();
		           });
		           util.closeLoading();
		           //console.log(item);
		           //-$('.div_draw .btn_top').removeClass('checked');
		           $('.esop iframe').attr('src',item.ESOP_FILE);
               }else{
                   util.closeLoading();
                   //clearWindow();
                   itemDataTable.clear();
                   pcbViewer.clear();
		           $('.esop iframe').attr('src','');
            	   $('#paraMap1_WHL_MO_NUMBER_SHOW').val('');
            	   $('#paraMap1_WHL_MO_NUMBER').val('');
		           showMessage('无用料信息',2);
		           return;
               }
               if(data.ajaxMap!=undefined&&data.ajaxMap!=null&&data.ajaxMap.coor_content!=undefined&&data.ajaxMap.coor_content!=null){
                   itemDataTable.setCoorContent(data.ajaxMap.coor_content);
               }
               showStepTips();
            },
            error: function(msg){
               util.closeLoading();
               showMessage(JSON.stringify(msg),2);
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
                   var itemMain = data.ajaxMap.itemMain;
                   if(itemDataTable.setItemSN(item.WSI_ITEM_SN,item.WSI_ITEM_CODE,item.WSI_ITEM_NUM,itemMain)){
                        _STEP=1;
                        showStepTips();
                   }else{
                       showMessage("非当前制令单所需物料",2);
                   }
               }else{ 
                if(data.ajaxString=="1"){
                    if(itemDataTable.getDataLength()==0){
                        showMessage("请先输入包装编号",2);
                    }else{
                        saveItemSN();
                    }
                }else{
                    showMessage("包装编号不存在",2);
                }
               }
            },
            error: function(msg){ 
               util.closeLoading();
                showMessage(JSON.stringify(msg),2);
            }
        });
 }
 
 function saveItemSN(){
    	var sn=$('.input_box').val();
    	var mo_number=$('#paraMap1_WHL_MO_NUMBER').val();
    	var workcenter=$('#paraMap1_WHL_WORKCENTER').val();
    	var item_list=itemDataTable.getDataStr();
    	var url = "buss/bussModel_exeFunc.ms?funcMId=637cfe78bd254a8e8ae711dac66e0dfc";
    	var is_check=true;
    	var _i=0;
    	var msg='';
        $(JSON.parse(item_list)).each(function(i,item){ 
            if(item.REMAIN_NUM=='') return true;
            if(item.REMAIN_NUM<=0){
                is_check=false;
                _i=i;
                msg='剩余数量不能为0或小于0';
                return false;
            }
            var _num=item.REMAIN_NUM-item.ITEM_NUM;
            if(_num<0){
                is_check=false;
                _i=i;
                msg='剩余数量不能小于需求数量';
                return false;
            }
        });	
        if(is_check==false){
            showMessage('第'+(_i+1)+'行'+msg,2);
            return;
        }
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
                    if(data.ajaxString.indexOf('不良')>-1){
                        _error_sn=sn;
                    }
               }else{ 
                    showMessage(sn+"保存成功",1);
                    editItemNumCallback();
               }
            },
            error: function(msg){ 
               util.closeLoading();
               showMessage(JSON.stringify(msg),2);
            }
        });
 }
 
 function getItemSNList(successFun){ 
    	var mo_number=$('#paraMap1_WHL_MO_NUMBER').val();
    	var workcenter=$('#paraMap1_WHL_WORKCENTER').val();
    	var item_list=itemDataTable.getDataStr();
    	var url = "buss/bussModel_exeFunc.ms?funcMId=84fd25d49b6d4a9abc69653931bcdac5";
        
        util.showLoading("保存数据中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:{mo_number:mo_number,workcenter:workcenter,item_list:item_list},
            success: function(data){
               util.closeLoading(); 
               if(data.ajaxString.indexOf("OK")!=0){						 
                    showMessage(data.ajaxString,2);
               }else{ 
                    if(typeof(successFun)=="function"){
                        successFun(data.ajaxList);
                    }
               }
            },
            error: function(msg){ 
               util.closeLoading();
               showMessage(JSON.stringify(msg),2);
            }
        });
  }
</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid');
  })
})(jQuery)</script>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
