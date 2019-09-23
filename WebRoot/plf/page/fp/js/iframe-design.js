/*与流程父框架通信*/    
     /*事件*/
     function onEvent(e,type, func) {
         if(window.addEventListener){
             e.addEventListener(type,func,false);
         }else{
             e.attachEvent('on'+type,func);
         }
     }
     window.parent.postMessage(JSON.stringify({type:'isMCP'}),'*');
     console.log('进入iframe-design');
     onEvent(window,'message',function(event){
    	 var p=JSON.parse(event.data);
    	 console.log(p);
    	 if(p.type=='isMCPRes'){
    		 if(p.data){//得到响应，是流程父框架
    			 console.log('-----------------通知设置父框架高度---------------------');
    			 window.parent.postMessage(JSON.stringify({type:'setIframeHeight',height:$(document).outerHeight()+'px'}),'*');
    		 }
    	 }
     })  
//设置下拉框样式
function setChosen(){
	var curWinHeight = $(document).height();//当前窗口高度
	$(".dept_select").chosen({
		//inherit_select_classes:true,//继承select class
		//width:"100%",
		//disable_search:false,//是否隐藏搜索框
		//disable_search_threshold:15//少于15项，隐藏搜索框
	});
	//大于10个选项的，显示搜索框
	$(".dept_select").each(function(index,item){
		var domId =item.id; 
		domId = domId.replace(/#/g, '_');
		if((item != null && $(this).hasClass("IS_SELECT_FILTER"))){
			//.chosen-container-single .chosen-search
			$("#"+domId+"_chosen .chosen-search").css("display","block");
		}

		var offset = $("#"+domId+"_chosen").offset(); //计算当前下拉框的偏移量
		
		var maxHeight = $("#"+domId+"_chosen .chosen-drop .chosen-results").css("max-height").replace("px","");//下拉高度
		
		var searchHeight = 0;//下拉搜索框的高度，默认为0
		//如果有显示搜索框，则需多计算搜索框的高度
		if(!$("#"+domId+"_chosen .chosen-drop .chosen-search").is(":hidden")){
			searchHeight = 35;
		}
		//如果下拉框在窗口位置比窗口高度的一半还往下，则往上拉
		if(offset.top > (curWinHeight/2)){
			$("#"+domId+"_chosen .chosen-drop").css({"top":"auto","bottom": "100%","border-top":"1px solid #75c4ff","border-bottom": 0,"background-color":"#f8fcff"});
			//console.log($("#"+domId+"_chosen .chosen-drop .chosen-results").css("max-height"));
			//console.log(itemHeight);
			if(offset.top < (maxHeight+searchHeight) && offset.top < 200){
				$("#"+domId+"_chosen .chosen-drop .chosen-results").css({"max-height":offset.top-5-searchHeight});
			}
		}else{
			var itemHeight = curWinHeight - offset.top;
			if(itemHeight < (maxHeight+searchHeight) && itemHeight < 200){
				$("#"+domId+"_chosen .chosen-drop .chosen-results").css({"max-height":itemHeight-32-searchHeight});
			}
		}

	});
}

// 获取随机数
function guid(){
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,function(c){
        var r = Math.random()*16|0,v=c=='x'?r:(r&0x3|0x8);
        return v.toString(16);
    });
}

$(function(){
	try{

	setChosen();
	//搜索栏中的下拉框设置宽度
	//$('.search_table .chosen-container').css("width","100%");		
	
	}catch(e){}

	$(".table-line,.datagrid-btable").each(function(seq) {
		var tableTrJs =$(this).find("tbody tr");
		tableTrJs.each(function(i) {
			if (i % 2 == 0) {
			} else {
				$(this).addClass("tr-hover");
			}
		});
	});

  if($('.js-tab').length>0){
    $('.js-tab').each(function(){
      $('.tab:eq(0)',$(this)).tabs($('.tab-pn:eq(0) > div',$(this)),{tabs:'li',event:'click'});
    });
  }
  $('.table-line  tbody tr input[type=checkbox]').live("click",function() {
     var _this = $(this);
    if(_this.parents('tr').hasClass('selected')){
      _this.attr('checked',false).parents('tr').removeClass('selected');
    }else{
      _this.attr('checked',true).parents('tr').addClass('selected');
    }
  });
  	 // 选中复选框
     $('.datagrid-btable tbody tr input[type=checkbox]').live("click",function(e) {
    	 e.stopPropagation();
	     var _this = $(this);
	     if( _this.parents('.datagrid-btable').hasClass("isDefTable")){
	    	    if(_this.parents('tr').hasClass('def-table-datagrid-selected')){
	    	      _this.attr('checked',false).parents('tr').removeClass('def-table-datagrid-selected');
	    	    }else{
	    	      _this.attr('checked',true).parents('tr').addClass('def-table-datagrid-selected');
	    	    }
	    	 return;
	     }
	     var $tr = _this.parents('tr');
	     var abbr = $tr.attr("abbr");
	     if(abbr =="undefined"){//列表为虚拟表时
	    	 if($tr.hasClass('datagrid-selected')){
		         _this.prop('checked',false);
		         $tr.removeClass('datagrid-selected');
		     }else{
		         _this.prop('checked',true);
		         $tr.addClass('datagrid-selected');
		     }
	    	 $tr.removeClass('tr-hover');
	    	 return;
	     }
	     var trObj = $("tr[abbr='"+abbr+"']");
	     if(trObj.hasClass('tr-hover')||trObj.hasClass('tr-hover-flag')){
	    	 selectedCheckBoxSetColor(trObj);
	     }
	     if($tr.hasClass('datagrid-selected')){
	         _this.prop('checked',false);
	         trObj.removeClass('datagrid-selected');
	     }else{
	         _this.prop('checked',true);
	         trObj.addClass('datagrid-selected');
	     }
	     setTitleCheckbox(_this);
     });
     
      // 点击行选中复选框
      var abbr="";
     $('.datagrid-btable tbody tr').live("click",function() {
    	 var _this = $(this);
    	 var id = _this.attr("id");
    	 if( _this.parents('.datagrid-btable').hasClass("isDefTable")){
 	    	 return;
 	     }
    	 if(id=="undefined"){
    		 $(".datagrid-btable tbody tr").removeClass('datagrid-selected');
    		 $(".datagrid-btable tbody tr").find("input[type='checkbox']").prop('checked',false);
    		 if(_this.hasClass('datagrid-selected')){
    			 _this.find("input[type='checkbox']").prop('checked',false);
    	         _this.removeClass('datagrid-selected');
    	     }else{
    	    	 _this.find("input[type='checkbox']").prop('checked',true);
    	    	 
    	    	 _this.addClass('datagrid-selected');
    	     }
    		 _this.removeClass('tr-hover');
 			return;
 		}
    	 if(abbr!="" && abbr!= _this.attr("abbr")){
    		 cancelChecked();
    	 }
    	 
	     abbr = _this.attr("abbr");
	     //var id = _this.attr("id");
	     var checkbox =  $("input[value='"+id+"']");
	     var trObj = $("tr[abbr='"+abbr+"']");
	     if(trObj.hasClass('tr-hover')||trObj.hasClass('tr-hover-flag')){
	    	 selectedCheckBoxSetColor(trObj);
	     }
	     
	     if(_this.hasClass('datagrid-selected')){
	         checkbox.prop('checked',false);
	         trObj.removeClass('datagrid-selected');
	     }else{
	    	 checkbox.prop('checked',true);
	    	 trObj.addClass('datagrid-selected');
	     }
	     setTitleCheckbox(_this);
     });
     
     // 选中行时取消其他选中
     function cancelChecked(){
    	 var count = 0;
    	 $(".datagrid-btable tbody tr").each(function(seq) {
    		 var _this = $(this);
    		 if(_this.hasClass('datagrid-selected')){
    			 _this.removeClass('datagrid-selected');
    			 _this.find("input[type='checkbox']").prop('checked',false);
    			 count++;
    		 }
 		});
    	 if(count>0){
    		 $(".datagrid-btable tbody tr").removeClass('tr-hover tr-hover-flag');
    		 selectedAllCheckBoxSetColor();
    	 }
     }
     //点击复选框所在单元格也能多选
     $(document).on('click','.datagrid-btable tbody tr .datagrid-cell',function(e){
    	 var cell=$(this);
    	 var cbox=cell.find('input._selectdata');
    	 if(cbox.length==1){
    		 e.stopPropagation();
    		 cbox.prop('checked',!cbox.is(':checked'));
    		 cell.parent().toggleClass('datagrid-selected');
    		 setTitleCheckbox(cbox);
    	 }
     }).on('click','.datagrid-header-row>.datagrid-cell',function(e){//表头的全选复选框也加上事件吧
    	 var cell=$(this);
    	 var cbox=cell.find('input[id^=selectAll_]');
    	 if(!$(e.target).hasClass('datagrid-cell'))return;
    	 if(cbox.length==1){
    		 var et=cbox.attr('onclick');
    		 cbox.prop('checked',!cbox.is(':checked'));
    		 new Function('obj',et.replace(/this/g,'obj'))(cbox[0]);
    		 
    	 }
     })	
     
     
     // 选中全部行后设置全选按钮
     function setTitleCheckbox(_this){
    	 var trLength = _this.parents("tbody").find("tr").length;
    	 var checkedLength = _this.parents("tbody").find('.datagrid-selected').length;
    	 _this.parents('.datagrid-body').prev().find('input[id^=selectAll_]').prop('checked',trLength==checkedLength);
     }
     
     // 设置偶数行选中样式
     function selectedCheckBoxSetColor(trObj){
    	 if(trObj.hasClass('tr-hover')){
    		 trObj.removeClass('tr-hover');
    		 trObj.addClass("tr-hover-flag");
    	 }else{
    		 trObj.addClass('tr-hover');
    		 trObj.removeClass('tr-hover-flag');
    	 }
     }
  
 /* $('.customer-con').mCustomScrollbar({
        scrollInertia: 150
    });*/
     
     
     
     
     
     
     
     
     
});


