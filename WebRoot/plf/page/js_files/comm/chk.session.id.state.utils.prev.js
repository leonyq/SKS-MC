//chkSId  

var chkSessionIdStateUtils = (function chkSessionIdStateUtils() { 
	 var configName ="nowSessionId"; 
    if(!window.sessionStorage){
        alert("浏览器支持sessionStorage");
        return false;
    } 
    function firstOpenBrowser(){//第一次浏览器
    	sessionStorage.setItem(configName, $("#chkSId").val()); 
    }//function firstOpenBrowser(){//第一次浏览器
    
    function PreviousValueDifferentNowValue(){//之前的值不等于现在值  
    	//发送之前的ID到服务层 得登出标记 
    	 
    	var url=util.getContextPath()+"/sys/LoginAction_ChkLogOutFlag.ms?loadMark=10";  
    	$.post(url, { "nowSessionId": sessionStorage.getItem(configName) },
    			   function(logoutFlag){      		
    			      switch(logoutFlag){
						case 4://您的账号已被强制下线
							 utilsFp.confirmIcon(1,"","","", "您的账号已被强制下线","","330","145"); 
						  break;
						case 2: //您的账号已在其它地方登录
							 utilsFp.confirmIcon(1,"","","", "您的账号已在其它地方登录","","330","145"); 
						  break;	 
					 }// switch(logoutFlag)
    			      firstOpenBrowser();
    			      
    			   }, "json");
    }// function PreviousValueDifferentNowValue(){//之前的值不等于现在值
    var loadConfig = function() {
        try {
            if (sessionStorage && sessionStorage.getItem(configName)) {
                 //记住的值与实时sessionId值是否一样
            	//alert($("#chkSId").val()+"___"+configName+"...."+sessionStorage.getItem(configName))
            	 if($("#chkSId").val()!=sessionStorage.getItem(configName))
            		 PreviousValueDifferentNowValue();
            } // if (sessionStorage && sessionStorage.getItem(configName)) {            
            else  
            	firstOpenBrowser();
            
        } catch(error) {}
    }; //function loadConfig() { 
    return {
        loadConfig: loadConfig 
        
    };
})(); // var chkSessionIdStateUtils=( 


 

$(function() {
    chkSessionIdStateUtils.loadConfig(); 
     
}); 
 