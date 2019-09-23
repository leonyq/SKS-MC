var winOptMethod = {
		addTabAndReload : function(title,url){
		    var flag = true;
		    var timestamp = Date.parse(new Date());
		     $(window.parent.document).find("#tag1").siblings().each(function(seq,item){
								//打开过的标签不再重复打开
				if(title == $(item).attr("title")){
					var count = item.id.substring(3);
					 $(window.parent.document).find("#iframe"+count).attr("src",url);
					 top.switchTag(item.id,"content"+count,url);
					 flag = false;
					 return;
				}
			});
			if(flag){
				showPopWinFp(url, 800, 400,null,title,timestamp,1);
			}
		},
		getTitleName : function(funcCode){
			var url = "buss/bussModel_exeFunc.ms?funcMId=b2152434ed3a49e89c8fec160d4eda0c";
			var title = null;
			$.ajax({
                type: "POST",
                dataType: "json",
                async:false, 
                url: url,
                data:{
                	"funcCode" : funcCode
                },
                success: function(data){
                	title =  data.ajaxList[0].NAME;
                }
            });
			return title;
		},
		jump : function(exeid,funcCode,objName,obj){
			var title = this.getTitleName(funcCode);
			console.log(title);
		      var url = "buss/bussModel.ms?exeid="+exeid+"&FUNC_CODE="+funcCode+"&frameId="+_currentFrame+"&"+objName+"="+obj; 
		      this.addTabAndReload(title,url);
		      
		}
		
}