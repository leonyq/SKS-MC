 
var searchTimeSlotUtils = (function searchTimeSlotUtils() { 

	   function initSearchTimeSlot(){	  
		   var objIdStr="";
		   
		    if($("#selectTimeSlot").length>0){ 
		    	  objIdStr="#divTimeSlot"+$("#selectTimeSlot").val(); 
		    	  $(objIdStr).show();
		    }
		    $("#selectTimeSlot").change(function(){  
		    	 $('div[id^=divTimeSlot]').hide();
		    	 objIdStr="#divTimeSlot"+$(this).val();
		    	  $(objIdStr).show();
		     });  
		   
		}//function initSearchTimeSlot(){
	
	   return {
		   initSearchTimeSlot: initSearchTimeSlot 
	        
	    };
})(); // var searchTimeSlotUtils=( 

 


$(function(){
	searchTimeSlotUtils.initSearchTimeSlot();
});
