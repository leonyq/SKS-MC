var chkMsSaveMarkUtils = (function chkMsSaveMarkUtils() {
	//视图唯一性+网页标题为  keyId
	var configName = $("input[name='exeid']").val()+document.title; 
	
	//在调用loadConfig的时候  新增页面传参add列表页面传参list 
	//然后因为在pub_end.jsp的公共页面有调这个所以编辑页面也有掉这个(正常编辑页面不应该调用这个因为编辑不做记忆) 在get数据的时候有判断当前数据是否为空如果为空的情况下才去设置记忆值
	//但是多组织机构改造要求在切换组织机构时候当前值不为空也要设置值  所以加传参数add和list的时候...
	var loadconfig_type=''; 
	
    var Config = {};   
    if(!window.localStorage){
        alert("浏览器支持localstorage");
        return false;
    }//if(!window.localStorage){
    
    var saveConfig = function() { 
    	// localStorage.removeItem(configName);  
    	 var saveMarks = $("[SAVE_MARK]");   
         saveMarks.each(function(ind, saveMark) {   
         	saveMarkIdStr=$(saveMark).attr("id");   
         	if ($(saveMark).attr("SAVE_MARK") == "1"  ){ 
         		//java中不能加 chkMsSaveMarkUtils.getMcWebSaveMark
         		execStr= $(saveMark).attr("setMcWebSaveMark"); 
         		try{
         			 eval(execStr);   
         		  } 
          		 catch (err) {
          			 alert("setMcWebSaveMark调用用:"+execStr+"出错:"+err+"请核对...."); 
          		 } 
         	}//if ($(saveMark).attr("SAVE_MARK") == "1"  ){  
         });//saveMarks.each(function(ind, saveMark) { 
         localStorage.setItem(configName, JSON.stringify(Config)); 
    }; //var saveConfig= function () { 
    
    var getSaveMarkSelectsVal = function(obj,idstr) {
    	var savemark_val='';
    	if(obj!=null){
      	  if($(obj).val()==null||util.trim($(obj).val())==''){
      		 if(Config!=null)  { 
      			  savemark_val=Config[getDataauth()+idstr];
      		 }
      	  } 
      	  
    	}
    	
    	return savemark_val;
    	
    }
    
    function getSaveMarkStatusAtt(obj,idstr,pageDoMark,firstVal,twoVal){ 
    	var imgObjStr='#imgSw_'+idstr; 
    	if(pageDoMark=="10"&&Config[getDataauth()+idstr]!=""){//新增页面处理 
    		$(obj).val(Config[getDataauth()+idstr]); 
    	    swSaveMarkControl($(imgObjStr),obj,firstVal,twoVal); 
    	}
    }//function getSaveMarkStatusAtt(obj,idstr,firstVal,twoVal){ 
    function setSaveMarkStatusAtt(obj,idstr){ 
    	Config[getDataauth()+idstr]=$(obj).val(); 
    }//function setSaveMarkStatusAtt(obj,idstr){ 
    
   
    
    function getSaveMarkSelectsAtt(obj,idstr){ 
    	  if(loadconfig_type=='add' || loadconfig_type=='list'){
    		  if(Config!=null)  { 
    			  $(obj).val(Config[getDataauth()+idstr]);
    			  $(obj).attr('selected', true);
    			  $('.dept_select').trigger('chosen:updated');  
    		 }
    	  }else{
    		  if($(obj).val()==null||util.trim($(obj).val())==''){ 
    	    		 if(Config!=null)  { 
    	    			  $(obj).val(Config[getDataauth()+idstr]);
    	    			  $(obj).attr('selected', true);
    	    			  $('.dept_select').trigger('chosen:updated');  
    	    		 }
    	      }
    		  
    	  }
    	  
    }// function getSaveMarkSelectsAtt(obj,idstr){ 
    function setSaveMarkSelectsAtt(obj,idstr){ 
    	 Config[getDataauth()+idstr]=$(obj).val();
    }//    function setSaveMarkSelectsAtt(obj,idstr){  
    
    function getSaveMarkCheckBoxAtt(obj,idstr){ 
    	if($(obj).val()==Config[getDataauth()+idstr]){
    		$(obj).attr('checked', true); 
    	}else{
    		$(obj).attr('checked', false); 
    	}
    }// function getSaveMarkCheckBoxAtt(obj,idstr){
    function setSaveMarkCheckBoxAtt(obj,idstr){ 
    	 if($(obj).attr('checked'))
    		 Config[getDataauth()+idstr]=$(obj).val();
    	 else
    		 Config[getDataauth()+idstr]='';
    }// function setSaveMarkCheckBoxAtt(obj,idstr){
    function getSaveMarkRadioAtt(obj){  
	   	 var pName=$(obj).attr('name')  ;  
		 if($(obj).val()==Config[getDataauth()+pName ]){//多组织机构记忆控件改造?
			 $(obj).attr('checked', true); 
		 }else{
			 $(obj).attr('checked', false); 
		 }
    }//function getSaveMarkRadioAtt(obj,idstr){ 
    function setSaveMarkRadioAtt(obj){ 
    	 var pName=$(obj).attr('name')  ;   
    	 if($(obj).attr('checked'))
    	    Config[getDataauth()+pName]=$(obj).val();  //多组织机构记忆控件改造?
    }//function setSaveMarkRadioAtt(obj,idstr){   
    function setSaveMarkIdValsAtt(obj,idstr){  
        Config[getDataauth()+idstr]=$(obj).val();   
    }// function setSaveMarkIdValsAtt(objUi){ 
    function getSaveMarkIdValsAtt(obj,idstr){  
    	if(loadconfig_type=='add' || loadconfig_type=='list'){
    		if(Config!=null)  {
       		 	$(obj).val(Config[getDataauth()+idstr]);  
    		}
    		
    	}else{
    		if($(obj).val()==null||util.trim($(obj).val())=='')  {
            	if(Config!=null)  {
            		 $(obj).val(Config[getDataauth()+idstr]);  
            	}
            }  
    	}   
                  
    }// function getSaveMarkIdValsAtt(objUi){
    
    function waitDealUnionSelectMain(idstr,subStr){
    	 var arrSubObj =  subStr.split(';');   
         var arrIdStr =  idstr.split('_'); 
         var subSelectObj;
         var subId='';  
         
         subId=arrIdStr[0]+'_'+arrSubObj[arrSubObj.length-1];
         subSelectObj=  $('#'+subId);  
            
         subSelectObj.val(Config[getDataauth()+subId]);//多组织机构记忆控件改造?  
         subSelectObj.attr('selected', true);          	   
         subSelectObj.change(); 
         $('.dept_select').trigger('chosen:updated'); 
         
         subStr="";
         for (var i=0;i<arrSubObj.length-1;i++)
        	 subStr+= arrSubObj[i]+";";
       subStr=subStr.substring(0,subStr.length-1);
       
       if(idstr!='' && subStr!=''){
    	   setTimeout(function () { waitDealUnionSelectMain(idstr,subStr); }, 1500)
       }
       
       //setTimeout(function () { waitDealUnionSelectMain(idstr,subStr); }, 1500)
    }//function waitDealUnionSelectMain(idstr,subStr){
    function getUnionSelectFormUiAtt(obj,idstr,subStr  ){ 
     if($(obj).val()==null||util.trim($(obj).val())=='')         
         if(Config!=null){ 
        	 $(obj).val(Config[getDataauth()+idstr]); 
        	 $(obj).attr('selected', true); 
             $(obj).change(); 
             setTimeout(function () { waitDealUnionSelectMain(idstr,subStr); }, 500)  
          } 
    }//function getUnionSelectFormUiAtt(obj,idstr ){
    function setUnionSelectFormUiAtt(obj,idstr,subStr ){
    	  Config[getDataauth()+idstr]=$(obj).val();   
     	  var arrSubObj =  subStr.split(';');   
           var arrIdStr =  idstr.split('_'); 
           for(var i = arrSubObj.length-1; i >= 0 ; i--) {
          	   var subId=arrIdStr[0]+"_"+arrSubObj[i];
          	   var subSelectObj=$("#"+subId);
          	 // alert(subId+"===>"+$(subSelectObj).val());
          	  Config[getDataauth()+subId]= $(subSelectObj).val();  //多组织机构记忆控件改造?
           }
     }//function setUnionSelectFormUiAtt(obj,idstr ){    
    
    //获取当前 查询列表页面/新增页面 组织机构值
    function getDataauth(){  
    	var dataauth="dtnull_";
    	var dataauth_list = $("#DATA_AUTH").val();//查询列表
    	var dataauth_add = $("#deptLs_data_auth").val();//新增页面
    	
    	if (typeof(dataauth_list) != "undefined" && dataauth_list!=""){
    		dataauth="dt"+dataauth_list+"_";
    	}
    	if (typeof(dataauth_add) != "undefined" && dataauth_add!=""){
    		dataauth="dt"+dataauth_add+"_";
    	}
    	
    	return dataauth;
    	
    }
    
    var loadConfig = function(type) {
    	loadconfig_type=type;
        try { 
        	    Config = JSON.parse(localStorage.getItem(configName));
                if(Config==null) Config = {};   
        	    var execStr=""; 
                var saveMarks = $("[SAVE_MARK]");   
                saveMarks.each(function(ind, saveMark) {   
                	//saveMarkIdStr=$(saveMark).attr("id");   
                	if ($(saveMark).attr("SAVE_MARK") == "1"  ){  
                		//java中不能加 chkMsSaveMarkUtils.getMcWebSaveMark
                		execStr= $(saveMark).attr("getMcWebSaveMark");  
                		  try{
                			 eval(execStr);   
                		  } 
                 		 catch (err) {
                 			 alert("调用用:"+execStr+"出错:"+err+"请核对...."); 
                 		 } 
                	}//if ($(saveMark).attr("SAVE_MARK") == "1"  ){  
                });//saveMarks.each(function(ind, saveMark) {   
        } catch(error) {}
    }; //function loadConfig() { 
    return { 
        loadConfig: loadConfig,
        saveConfig: saveConfig,
        getSaveMarkSelectsVal:getSaveMarkSelectsVal
    };
})(); // var chkMsSaveMarkUtils=( 
