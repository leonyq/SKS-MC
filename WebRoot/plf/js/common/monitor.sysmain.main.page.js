$package('monitor.sysmain.main.page'); 
/*********************************************************************************
 * 编号：monitor.sysmain.main.page
 * 名称:监控用户页面操作
 * 作用：监控\plf\page\sysmain\main\mainFrame.jsp
 * 新建者：cjdjk@139.com
 * 新建时间表: 2018-01-25 10:30
 * 修改者：cjdjk@139.com
 * 修改时间表: 2018-01-25 10:30
 * 修改内容:
 *******************************************************************************/

monitor.sysmain.main.page = function(){ 
	var startDate= new Date(); var endDate= new Date();
	var nowTimes = 0;
	var taskSetTimeout=null;
	var _this= {  
		 clickInitStartDate:function(){//文档监听器在\WebRoot\plf\common\pub_head.jsp--> window.top.monitor.sysmain.main.page.clickInitStartDate();
			 this.startDate= new Date(); 
		 }, 
		listenPage:function(){
		  this.endDate= new Date();
		  this.nowTimes =  this.endDate.getTime() -  this.startDate.getTime(); 
		  this.nowTimes = Math.ceil(this.nowTimes / 1000); //取的是秒并且化整 
		  if(_isMothMakrControl){
		    try{
		         this.taskSetTimeout=setTimeout(function(){ _this.listenPage(); },2000);  
		         if(this.nowTimes>monitorControlSecond){//monitorControlSecond 不要定义到 
			        _isMothMakrControl=false; 
			        window.clearTimeout( this.taskSetTimeout);  
		         }//if(this.nowTimes>monitorControlSecond){ 
		 	  } catch(e){   }  
		  }// if(_isMothMakrControl){
		},//listenPage:function(){
		init:function(){//console.log("cjd init...."+_isMothMakrControl); 		 	
		   this.startDate=new Date();  
		   this.listenPage(); //启动监听器
		   $(window).on("click",function(){ _this.clickInitStartDate();}); 
		}//init:function(){
	}//var _this { 
	return _this;	
} ();   
$(function(){  
	 if(_isMothMakrControl) 
	    monitor.sysmain.main.page.init();    
});


