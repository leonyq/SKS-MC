$package('monitor.fp.main.page'); 
/*********************************************************************************
 * 编号：monitor.fp.main.page
 * 名称:监控用户页面操作
 * 作用：监控\WebRoot\plf\page\fp\mainFrame.jsp
 * 新建者：cjdjk@139.com
 * 新建时间表: 2018-01-25 10:30
 * 修改者：cjdjk@139.com
 * 修改时间表: 2018-01-25 10:30
 * 修改内容:
 *******************************************************************************/

monitor.fp.main.page = function(){ 
	var startDate= new Date(); var endDate= new Date();
	var nowTimes = 0;
	var taskSetTimeout=null;
	var _this= { //clickInitStartDate-->\WebRoot\plf\page\fp\mainFrame.jsp-->新增TAB页function addTab(url,name,id) 
		 clickInitStartDate:function(){ 
			// alert("get value prev");
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
		   $(document).click(function(){_this.clickInitStartDate();});  
		}//init:function(){
	}//var _this { 
	return _this;	
} ();   
$(function(){  
 
	 if(_isMothMakrControl){
		 _isMotParkBackMark=false;//设置“前端” 
	      monitor.fp.main.page.init();   
	 }
});


