// var url=util.getContextPath()+"/sys/LoginAction_ChkLogOutFlag.ms?loadMark=10"; 
var reportMcUtils = (function reportMcUtils() { 
	 function getInitDataFormRepType(){	
		 $("#tag2").hide();
		 $("#trWisBIType").show();
		if("2"==util.trim($("#selectRepType").val())){
		  $("#tag2").show();
		  $("#trWisBIType").hide();
		} 
	 }//function getInitDataFormRepType(){
	 function getEleDoInit(){
		 $("#selectRepType").change(function(){
			  getInitDataFormRepType();
		  });
	 }//function getEleDoInit(){
	 var loadInitData = function() {
		  getEleDoInit();
		  getInitDataFormRepType();
		 
	 };// var loadInitData = function() {
	 return {
		     loadInitData: loadInitData
	      };// return {
})(); // var reportMcUtils=( 

$(function(){
	reportMcUtils.loadInitData();
	
});

 