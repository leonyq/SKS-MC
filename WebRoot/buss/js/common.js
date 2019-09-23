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
			//功能在参数配置视图模型里
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
			var canJump = this.jumpFilter();
			console.log(canJump);
			if(canJump == 'true'){
				var title = this.getTitleName(funcCode);
				console.log(title);
			    var url = "buss/bussModel.ms?exeid="+exeid+"&FUNC_CODE="+funcCode+"&frameId="+_currentFrame+"&"+objName+"="+obj; 
			    this.addTabAndReload(title,url);
			}else{
				utilsFp.confirmIcon(1,"","","", "请设置数据穿透! 在参数配置设置MES0010",0,"300","");
			}
		},
		jumpFilter : function(){
			//功能在参数配置视图模型里
			var url = "buss/bussModel_exeFunc.ms?funcMId=1d239b0b276340809eeb81190c4438e9";
			var flag;
			$.ajax({
                type: "POST",
                dataType: "json",
                async:false, 
                url: url,
                data:{},
                success: function(data){
                	flag = data.ajaxString;
                }
            });
			return flag ;
		}
		
}