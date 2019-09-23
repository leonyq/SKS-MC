/**
 * 封装缓存对象
 * by:zm;
 * date:2017-05-17
 * ***/
function msChartsData(formId){
	if(formId){
		 var chartsConfigCache = {};
		 var formData = form.serialize($("#"+formId));
		 for(var key in formData){
			 chartsConfigCache["chartsConfigCache."+key] = formData[key];
		 }
		 return chartsConfigCache;
	}
}

