/**
 * 前台JS工具类
 * by:hxh 2017-01-20
 * **/
function closePopIcoFp(tempPopupDivId,thisObj,isFocus){
	$("#"+tempPopupDivId).parent().remove();
	top.$("#"+tempPopupDivId).parent().remove();
	if(isFocus=="1"){
		$("#"+thisObj).focus().select();
	}
		//$("#"+shadowPopupDivId).remove();
	}
	
var topDocument=top.document;
var UtilsDivFor=0;
function UtilsFp() {
	
	/* 弹出确认窗口，入参：(回调函数，要显示的字符串，回调参数) */
	this.confirm = function(callBackFun, msg,paramObj){
		UtilsDivFor++;//cjd 2017-12-11 16:14 
		if (null == msg || "" == msg) {
			msg = "\u786E\u8BA4\u6267\u884C\u64CD\u4F5C";//确认执行操作
		}
		var divStr = "<div class=\"dialog dialog-s2\" id=\"confirmId0\" style=\"z-index:"+(top.zcount+1)+";display:block;top:33%;left:50%\">\n"
						+"<b class=\"top\"></b>\n"
						+"<b class=\"bottom\"></b>\n"
						+"<div class=\"dialog-in\">\n"
						+"<div class=\"text\">"+msg+"?</div>\n"
						+"<div class=\"btn-box\">"
						+"<button class=\"btn-add\" id=\"confirmOkBtn0\">"+_GLO_VALIDATE_OK+"</button>"//确定
                		+"<button class=\"btn-cancel\" id=\"confirmCancelBtn0\">"+_GLO_VALIDATE_CANCEL+"</button>"//取消
                		+"</div>"
						+"</div>"
						+"</div>";
						//+"<div class=\"dialog-mask\" id=\"maskId0\" style=\"display:block;\"></div>";
		if($("#shadowConfirmId0").length == 0){
			divStr += "<div class=\"dialog-mask\" id=\"shadowConfirmId0\" style=\"z-index:"+top.zcount+";\"></div>";
			top.zcount++;
		}
		
		var tmpDiv = topDocument.createElement("div");
			tmpDiv.innerHTML = divStr;
		var body = topDocument.getElementsByTagName("body")[0];
			body.appendChild(tmpDiv);
			top.$(".dialog-mask#shadowConfirmId0").show();
			top.$("#confirmId0").draggable();
			
			var confirmId0 = topDocument.getElementById("confirmId0");
			var confirmOkBtn0 = topDocument.getElementById("confirmOkBtn0");
			//var maskId0 = topDocument.getElementById(".dialog-mask"); 
			
			confirmOkBtn0.focus();//默认选中确定按钮
			
			confirmOkBtn0.onclick = function () {
				//confirmId0.style.display = "none";
				//maskId0.style.display = "none";
				callBackFun(paramObj);
				$(confirmId0).remove();
				//$(maskId0).remove();
				top.$(".dialog-mask#shadowConfirmId0").hide();
				top.$(".dialog-mask#shadowConfirmId0").remove();
			};
			topDocument.getElementById("confirmCancelBtn0").onclick = function () {
				//confirmId0.style.display = "none";
				//maskId0.style.display = "none";
				$(confirmId0).remove();
				top.$(".dialog-mask#shadowConfirmId0").hide();
				top.$(".dialog-mask#shadowConfirmId0").remove();
				//$(maskId0).remove();
			};
			
			$("#confirmId0").keyup(function (event) {
	            // 获取键值
				var keyEvent = event || window.event;
				var key = keyEvent.keyCode;
	            //获得当前对象
				var input_blur = $(this);
				switch (key) {
				  case 27://按下esc键，取消
						$(confirmId0).remove();
						top.$(".dialog-mask#shadowConfirmId0").hide();
						top.$(".dialog-mask#shadowConfirmId0").remove();
					break;
				}
			});
	}
	
	/* 根据提示信息的长度动态设置弹出框宽高  */
	function setWidthAndHeight(msgLength,param){
		if(msgLength>20 &&msgLength<=56 ){
			param+=50;
		}else if(msgLength>56 && msgLength<=86){
			param+=100;
		}else if(msgLength>86 && msgLength<=116){
			param+=150;
		}else if(msgLength>116 && msgLength<=146){
			param+=200;
		}else if(msgLength>146 && msgLength<=176){
			param+=250;
		}
		return param;
	}
	/*跨站点特殊字符替换*/
	this.replaceLikeVal=function(comp){  
        if (comp.value.indexOf("'") != -1 ||comp.value.indexOf("\"") != -1||comp.value.indexOf("<") != -1||comp.value.indexOf(">") != -1
        		||comp.value.indexOf("{") != -1||comp.value.indexOf("}") != -1||comp.value.indexOf("[") != -1||comp.value.indexOf("]") != -1
        		||comp.value.indexOf("(") != -1||comp.value.indexOf(")") != -1||comp.value.indexOf("/") != -1) {  
            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"")
            .replace(/{/g,"").replace(/\(/g,"").replace(/\)/g,"").replace(/\[/g,"").replace(/\]/g,"").replace(/\}/g,"").replace(/\//g,"");
            _alertValMsg(comp,"不能输入单引号双引号<>{}()[]/");
        }  
    }  
	
	/*单双 引号 转义*/
	this.escapeHTML=function (str) {
		if(str!=null&&str.length>0) 
		{
			 return str.replace(/"/g, "&quot;").replace(/'/g, "&apos;");  
		}else
		{
			return str;
		}
   
	}  	
	/* 带图标的弹出确认窗口，入参：(弹窗类型（1：警告；2：成功；3：失败；4：疑问；5：锁定）,提示窗标题，回调函数，回调函数参数，要显示的字符串，是否显示取消按钮，为1时显示) ，宽度，高度，页面组件对象，是否回设焦点并选中内容传1为是*/
	this.confirmIcon = function(type,title,callBackFun,callBackFunPara, msg,showCancel,widthPara,heightPara,thisObj,isFocus){
		this.mcConfirmIcon({type:type,title:title, msg:msg, showCancel:showCancel,thisObj:thisObj, isFocus:0, callBackFun:callBackFun, callBackFunPara:callBackFunPara  });
		return; //所有进入的方法都调用新方法  tangws 20181130
		
		//var title = "<dict:lang value="摩尔提示"/>";//"%{getText('摩尔提示')}";
		if (null == title || "" == title) {
			title = _GLO_CONFIRM_ICON_TITLE;
		}
		UtilsDivFor++;//cjd 2017-12-11 16:14 
		var divId = "confirmIconId0"+UtilsDivFor;
		    var msgLength = msg.length;
			var tempPopupDivId = divId+"pop";
			var shadowPopupDivId = divId+"shadow";
			var temp = top.document;
			var height = 155;
			var width = 360;
			if(widthPara != null &&　widthPara != "" && widthPara != undefined){
				width = setWidthAndHeight(msgLength,parseInt(widthPara));
			}
			
			if(heightPara != null &&　heightPara != "" && heightPara != undefined){
				height = setWidthAndHeight(msgLength,parseInt(heightPara));
			}
			
			if(height>$(temp).height()){
				height=$(temp).height();
			}
			if(width>$(temp).width()){
				width=$(temp).width();
			}
			var iTop=($(temp).height()-height)/2-20;
			var iLeft=($(temp).width()-width)/2;
			
			var marginLeft = 5;
			
			//两个按钮
			if(showCancel == 1 || showCancel == "1"){
				if(width > 210){
					marginLeft = (width - 210)/2;
				}
				
			}else{
				if(width > 93){
					marginLeft = (width - 93)/2;
				}
			}
			
			var iconType = " ico-warning";
			
			if(type == "2" || type == 2){
				iconType = " ico-success";
			}else if(type == "3" || type == 3){
				iconType = " ico-error";
			}else if(type == "4" || type == 4){
				iconType = " ico-question";
			}else if(type == "5" || type == 5){
				iconType = " ico-lock";
			}
			
			
			
			//alert("screenWidth"+window.screen.availWidth+"screenHeight"+window.screen.availHeight+"docWidth:"+$(temp).width()+"docHeight:"+$(temp).height()+"iTop"+iTop
			//		+"iLeft:"+iLeft+"height:"+height+"width:"+width);
			var divStr = "<div class=\"dialog dialog-s1\" id=\""+tempPopupDivId+"\" style=\"z-index:"+(top.zcount+UtilsDivFor)+";display:block;margin-left:0px;left:"+iLeft+"px;top:"+iTop+"px;width:"+width+"px;height:"+height+"px;\" >"
						+"   <div class=\"dialog-hd\">"
						+"		            <h3 class=\"tit\">"+title+"</h3>"
						+"		        </div>"
						+"		        <a class=\"dialog-close\" href=\"javascript:void(0);\" id=\"closeTop\" ></a>"
						+"		        <div class=\"dialog-bd\" style=\"width:100%;height:"+(height-30)+"px;\">"
						+"				   <i class=\"ico-confirm "+iconType+"\" style='top:60px;'></i>"
						+"					<div style=\"position: absolute;left: 70px; top: 67px;margin-right:23px;\">"+_GLO_CONFIRM_ICON_NOTICE+"："
						+	msg 	
						+"		       		 </div>"
						+"					<div class=\"btn-box btn-box-alert\" style=\"left:"+marginLeft+"px;\">"
		                +"						<button class=\"btn-add confirmIcoOkBtn\" id=\"confirmIcoOkBtn0\" >"+_GLO_VALIDATE_OK+"</button>";
		                if(showCancel == 1 || showCancel == "1"){
		                	                            //cjd 2017-12-11 16:26
		                	divStr +="					<button class=\"btn-cancel\"  id=\"confirmIcoCancelBtn0\">"+_GLO_VALIDATE_CANCEL+"</button>";		                	
		                }
		                divStr +="					</div>"
						+"		        </div>"
						+"		    </div>";
						//+"<div class=\"dialog-mask\" id=\"maskId0\" style=\"display:block;\"></div>";
			//if($(".dialog-mask").length == 0){
				divStr += "<div class=\"dialog-mask\" id=\""+shadowPopupDivId+"\" style=\"z-index:"+top.zcount+"\"></div>";
				top.zcount++;
			//}
			var tmpDiv = temp.createElement("div");
				tmpDiv.innerHTML = divStr;

			var body = temp.getElementsByTagName("body")[0];
				body.appendChild(tmpDiv);
				top.$("#"+shadowPopupDivId).show();
				top.$("#"+tempPopupDivId).draggable();
				
				
				
				var confirmId0 = topDocument.getElementById(tempPopupDivId);
				/*var confirmOkBtn0 = topDocument.getElementById("confirmIcoOkBtn0");
				//var maskId0 = topDocument.getElementById(".dialog-mask"); 
				confirmOkBtn0.focus();
				confirmOkBtn0.onclick = function () {
					closePopIcoFp(""+tempPopupDivId+"");
					if(callBackFun != null &&　callBackFun != "" && callBackFun != undefined){
						window[callBackFun](callBackFunPara);
					}
					
				};*/
				top.$(".confirmIcoOkBtn").each(function(i,e){
					this.focus();
					this.onclick = function() {
						closePopIcoFp(tempPopupDivId,thisObj,isFocus);
						if(callBackFun != null &&　callBackFun != "" && callBackFun != undefined){
							window[callBackFun](callBackFunPara);
						}
						
					}
				});
				
				top.$("#confirmIcoCancelBtn0").click(function(){
					closePopIcoFp(tempPopupDivId,thisObj,isFocus);
				})
				
				top.$("#closeTop").click(function(){
					closePopIcoFp(tempPopupDivId,thisObj,isFocus);
				})
				  //cjd 2017-12-11 16:26  begin
//				top.$("#confirmIcoCancelBtn0").click(function () {
//					closePopIcoFp(""+tempPopupDivId+"");
//				});
				  //cjd 2017-12-11 16:26  end
				$("#"+tempPopupDivId+"").keyup(function (event) {
		            // 获取键值
					var keyEvent = event || window.event;
					var key = keyEvent.keyCode;
		            //获得当前对象
					var input_blur = $(this);
					switch (key) {
					  case 27://按下esc键，取消
						  closePopIcoFp(""+tempPopupDivId+"");
						break;
					}
				});	
				
				
}
	/* 带图标的弹出确认窗口改造
	 * by tangws 20181120
	 * @argument type  - 1：警告；2：成功；3：失败；4：疑问；5：锁定
	 * @argument title - 提示窗标题
	 * @argument msg   - 显示的提示内容
	 * @argument showCancel - 是否显示取消按钮 1： 表显示/ 0或者任意值不显示(默认值) 
	 * @argument isFocus    - 是否显示回显焦点 1： 表要回显/ 0或者任意值不显示(默认值)
	 * @argument thisObj    - 回显示聚焦的目标对象 null(默认值) 注意和isFocus参数配合使用。
	 * @argument callBackFun        - 点击确定执行的回调函数名称
	 * @argument callBackFunPara    - 回调函数参数 
	 * {type:1/2/3/4/5,title:"", msg:"",showCancel:1/...,thisObj:null, isFocus:0/1, callBackFun:null, callBackFunPara:null  }
	 */
	 this.mcConfirmIcon = function(obj){
		var originStr = ""; //用于保存弹窗obj.msg去左右两边空格后的字符串。
		if (null == obj.title || "" == obj.title) {
			//平台客户定制化功能
			//obj.title = _GLO_CONFIRM_ICON_TITLE;
			if(obj.showCancel == 1 || obj.showCancel == "1"){
				obj.title = _GLO_CONFIRM_ICON_TITLE_CONFIRM;
			}else{
				obj.title = _GLO_CONFIRM_ICON_TITLE_TIP;
			}
			if(obj.title ==null || obj.title ==''){
				obj.title =_GLO_CONFIRM_ICON_TITLE;
			}
			
		}
		//UtilsDivFor++;//cjd 2017-12-11 16:14 
		UtilsDivFor+=top.zcount;
		var divId = "confirmIconId0"+UtilsDivFor;
		    //var msgLength = obj.msg.length;
			var tempPopupDivId = divId+"pop";
			var shadowPopupDivId = divId+"shadow";
			var temp = top.document;
			
			/**
			 * 暂不支持宽高自定义，默认宽度是300px,高度是200px,用户点击详情以后，宽度变为600px,高度变为400px;
			 * 
			 */
			obj.height = 200;
			obj.width = 300;
			/* 
			if(widthPara != null &&　widthPara != "" && widthPara != undefined){
				width = 300;
			}
			if(heightPara != null &&　heightPara != "" && heightPara != undefined){
				height = setWidthAndHeight(msgLength,parseInt(heightPara));
				if(parseInt(height) < 200) {
					height = 200;
				}
			}
			*/
			if(obj.height>$(temp).height()){
				obj.height=$(temp).height();
			}
			if(obj.width>$(temp).width()){
				obj.width=$(temp).width();
			}
			
			var iTop=($(temp).height()-obj.height)/2-20;
			var iLeft=($(temp).width()-obj.width)/2;
			
			var marginLeft = 5;
			
			//两个按钮
			/*
			if(obj.showCancel == 1 || obj.showCancel == "1"){
				if(obj.width > 210){
					marginLeft = (obj.width - 210)/2;
				}
				
			}else{
				if(obj.width > 93){
					marginLeft = (obj.width - 93)/2;
				}
			}
			*/
			
			var iconType = " ico-warning";
			
			if(obj.type == "2" || obj.type == 2){
				iconType = " ico-success";
			}else if(obj.type == "3" || obj.type == 3){
				iconType = " ico-error";
			}else if(obj.type == "4" || obj.type == 4){
				iconType = " ico-question";
			}else if(obj.type == "5" || obj.type == 5){
				iconType = " ico-lock";
			}
			
			var divStr = "<div class=\"dialog dialog-s1 mc-dialog\" id=\""+tempPopupDivId+"\" style=\"z-index:"+(top.zcount+UtilsDivFor+1)+";display:block;border-radius:8px;background-color:#fff;margin-left:0px;left:"+iLeft+"px;top:"+iTop+"px;width:"+obj.width+"px;height:"+obj.height+"px;\" >"
						+"    <div class=\"dialog-hd\">"
						+"        <h3 class=\"tit\">"+obj.title+"</h3>"
						+"    </div>"
						+"	  <a class=\"dialog-close\" href=\"javascript:void(0);\" id=\"closeTop\" ></a>"
						+"    <div class=\"dialog-bd\">"
						+"	      <i class=\"ico-confirm "+iconType+"\"></i>"
						+"		  <div class=\"dialog-content\"><span class=\"dialog-txt\">"+_GLO_CONFIRM_ICON_NOTICE+"："
						+	          obj.msg 	
						+"		  </span></div>"
						+"    </div>"
						+"    <a class=\"dialog-more\">详情</a>"
						+"	  <div class=\"btn-box btn-box-alert\">"
		                +"	      <button class=\"btn-add confirmIcoOkBtn\" id=\"confirmIcoOkBtn0\" >"+_GLO_VALIDATE_OK+"</button>";
		                if(obj.showCancel == 1 || obj.showCancel == "1"){
		                	                            //cjd 2017-12-11 16:26
		                	divStr +="<button class=\"btn-cancel\"  id=\"confirmIcoCancelBtn0\">"+_GLO_VALIDATE_CANCEL+"</button>";		                	
		                }
		                divStr +="</div>"
						//+"		        </div>"
						+"</div>";
						//+"<div class=\"dialog-mask\" id=\"maskId0\" style=\"display:block;\"></div>";
			//if($(".dialog-mask").length == 0){
				divStr += "<div class=\"dialog-mask\" id=\""+shadowPopupDivId+"\" style=\"z-index:"+(top.zcount+UtilsDivFor)+"\"></div>";
				top.zcount++;
				//top.zcount+=1000; //by tangws
			//}
			var tmpDiv = temp.createElement("div");
			tmpDiv.innerHTML = divStr;

			var body = temp.getElementsByTagName("body")[0];
			body.appendChild(tmpDiv);
			
			//插入以后判断
			var spanHeight = top.$(".mc-dialog .dialog-txt").height();
			if(spanHeight > 40) {
				originStr =top.$(".mc-dialog .dialog-txt").text();
				var result = this.returnStr(originStr,22);
				top.$(".mc-dialog .dialog-txt").html(result+"...");
				top.$(".dialog-more").show();
			}
			
			//显示提示窗
			top.$("#"+shadowPopupDivId).show();
			top.$("#"+tempPopupDivId).draggable({ cancel: "div.dialog-content" });
			
			
			var confirmId0 = topDocument.getElementById(tempPopupDivId);
			top.$(".confirmIcoOkBtn").each(function(i,e){
				this.focus();
				this.onclick = function() {
					closePopIcoFp(tempPopupDivId,obj.thisObj,obj.isFocus);
					if(obj.callBackFun != null &&　obj.callBackFun != "" && obj.callBackFun != undefined){
						window[obj.callBackFun](obj.callBackFunPara);
					}
					
				}
			});
			
			top.$("#confirmIcoCancelBtn0").click(function(){
				closePopIcoFp(tempPopupDivId,obj.thisObj,obj.isFocus);
			})
			
			/*top.$("#closeTop").click(function(){
				closePopIcoFp(tempPopupDivId,obj.thisObj,obj.isFocus);
			})*/
			
			top.$("#"+tempPopupDivId).find(".dialog-close").each(function(){
					$(this).on("click",function(){
						closePopIcoFp(tempPopupDivId,obj.thisObj,obj.isFocus);
					})
			})
			top.$("#"+tempPopupDivId).keyup(function (event) {
	            // 获取键值
				var keyEvent = event || window.event;
				var key = keyEvent.keyCode;
	            //获得当前对象
				var input_blur = $(this);
				switch (key) {
				  case 27://按下esc键，取消
					  closePopIcoFp(""+tempPopupDivId+"");
					break;
				}
			});	
			
			//详情绑定click
			top.$(".dialog-more").one("click",function(){
	        	top.$(".mc-dialog").css({"width":"600px","height":"400px"});
	        	top.$(".dialog-content").css("max-width","380px");
	        	top.$(".ico-confirm").css("vertical-align","top");
	        	top.$(".dialog .dialog-txt").html(originStr);
	        	//mc-dialog
	        	var _top = parseInt(top.$(".mc-dialog").css("top"));
	        	var _left = parseInt(top.$(".mc-dialog").css("left"));
	        	top.$(".mc-dialog").css("top",_top-100+"px" );
	        	top.$(".mc-dialog").css("left",_left-150+"px" );
	        	//隐藏详情
	        	$(this).hide();
	        })
	        
	        //滚动条
	        top.$(".mc-dialog .dialog-content").mCustomScrollbar({
				    axis:"y",
					snapAmount:80,
					theme:"minimal-dark"
				}
			);
			
			//
			top.$(".dialog-txt").on("click",function(){
				top.$("#"+tempPopupDivId)
			})
				
}

	/* 弹出提示信息，入参：要显示的字符串 */
	this.alert = function (msg,backFun,paramObj) {
		if (null == msg || "" == msg) {
			msg = "\u63D0\u793A\u4FE1\u606F info ";//提示信息
		}
		
		var divStr = "<div class=\"dialog dialog-s2\" id=\"alertId0\" style=\"z-index:1101;display:block;top:33%;left:50%\">\n"
						+"<b class=\"top\"></b>\n"
						+"<b class=\"bottom\"></b>\n"
						+"<div class=\"dialog-in\">\n"
						+"<div class=\"text\">"+msg+"</div>\n"
						+"<div class=\"btn-box\">"
						+"<button class=\"btn-add\" style=\"margin-right: 1px;\" id=\"alertOkBtn0\">"+_GLO_VALIDATE_OK+"</button>"//确定
                		+"</div>"
						+"</div>"
						+"</div>";
						//+"<div class=\"dialog-mask\" id=\"alertMaskId0\" style=\"display:block;\"></div>";
		
		if($(".dialog-mask").length == 0){
			divStr += "<div class=\"dialog-mask\" id=\"shadow0\" style=\"z-index:1100;\"></div>";
		}		
		
		var tmpDiv = topDocument.createElement("div");
			tmpDiv.innerHTML = divStr;
		var body = topDocument.getElementsByTagName("body")[0];
			body.appendChild(tmpDiv);
			top.$(".dialog-mask#shadow0").show();
			top.$("#alertId0").draggable();
			
			var alertId0 = topDocument.getElementById("alertId0");
			var alertOkBtn0 = topDocument.getElementById("alertOkBtn0");
			//var alertMaskId0 = topDocument.getElementById("alertMaskId0"); 
			alertOkBtn0.focus();//默认选中确定按钮
			alertOkBtn0.onclick = function () {
				//confirmId0.style.display = "none";
				//maskId0.style.display = "none";
				if(null!=backFun && backFun != ""){
					backFun(paramObj);
				}
				$(alertId0).remove();
				top.$(".dialog-mask#shadow0").hide();
				top.$(".dialog-mask#shadow0").remove();
				//top.$(".dialog-close").click();
				//$(alertMaskId0).remove();
			};
			
			$("#alertOkBtn0").keyup(function (event) {
	            // 获取键值
				var keyEvent = event || window.event;
				var key = keyEvent.keyCode;
	            //获得当前对象
				var input_blur = $(this);
				switch (key) {
				  case 27://按下esc键，取消
						$(alertId0).remove();
						top.$(".dialog-mask#shadow0").hide();
						top.$(".dialog-mask#shadow0").remove();
						//top.$(".dialog-close").click();
					if(null!=backFun){
						backFun(paramObj);
					}
					break;
				}
			});			
	};	
	// 列表过长字段弹窗显示更多
	this.popRemark = function(callBackFun, msg,paramObj,title){
		var temp = top.document;
		var width = 400;
		var height = 200;
		var iTop=($(temp).height()-height)/6;
		var iLeft=($(temp).width()-width)/2;
		
		var divStr = "<div class=\"dialog dialog-s1\" id=\"confirmId0\" style=\"z-index:"+(top.zcount+1)+";display:block;margin-left:0px;left:"+iLeft+"px;top:"+iTop+"px;\" >"
					+"   <div class=\"dialog-hd\">";
					if(title != null && title != "" && title != undefined){
						divStr += "		            <h3 class=\"tit\">"+title+"</h3>";
					}
					divStr +="		        </div>"
					+"		        <a class=\"dialog-close\" href=\"javascript:void(0);\" onclick=\"closePopIcoFp('confirmId0');\"></a>"
					+"		        <div class=\"dialog-bd\" style=\"width:"+width+"px;height:"+height+"px;\">"
					//+	msg
					+"<div style=\"padding:15px 10px 15px 10px;height:100%;\">"
					+"<textarea style=\"height:80%;\" readonly class=\"readonly\">"+msg+"</textarea>\n"
					+"</div>"
					+"		        </div>"
					+"		    </div>";
		

			divStr += "<div class=\"dialog-mask\" id=\"shadowConfirmId0\" style=\"z-index:"+top.zcount+";\"></div>";

		
		var tmpDiv = topDocument.createElement("div");
			tmpDiv.innerHTML = divStr;
		var body = topDocument.getElementsByTagName("body")[0];
			body.appendChild(tmpDiv);
			top.$(".dialog-mask#shadowConfirmId0").show();
			top.$("#confirmId0").draggable();
						
	};
	
	//替换所有的回车换行    
	this.transferString = function (content)    
	{
	    var string = content;    
	    try{
	    	if(string != "" && string != null){
		        string = string.replace(/\r\n/g,"<br>")    
		        string = string.replace(/\n/g,"<br>");   	    		
	    	}
	    }catch(e){
	        //alert(e.message);
	    }
	    return string;    
	}
	

	//获取当前组织权限
	this.getCurrentAuth = function(){
		var _getAuth = _currentAuth;//此变量定义在两个pub_head页面中
		return _getAuth;
	}
	
	//字符串过滤掉前后空格 by tangws
	this.trimSpace = function (str){
        return (str||"").replace(/^(\s|\u00A0)+|(\s|\u00A0)+$/g,"");
    }
	
	//字符串截取  by tangws
    this.returnStr = function (str,len){
    	var num = 0;
    	var patt = /[\u4e00-\u9fa5]/i;
    	var s = this.trimSpace(str);
    	originStr = s; //去空格后的原始值并且保存一份到全局
    	for(var i=0; i<s.length; i++){
    		var signStr = s.charAt(i);
    		if( patt.test(signStr) ){
    			num+=2;
    		}else {
    			num+=1;
    		}
    		if(Math.floor(num/2) > len){
    			return str.substr(0,i);
    		}
    	}
    }
    /**
     * 调试按钮处理
     * create by hzp 2019.4.9
     * param:className(类全名称)
     * param:codeId(类Id)
     * param:tableName(关联表id)
     * param:tableName(关联表id)
     */
    this.debugPageDetail=function(classNameValue,codeId,codeType){
    	localStorage.codeType=codeType;
    	var classNameclassLength=classNameValue.lastIndexOf(".");//获取类全名长度
    	var packageName=classNameValue.substring(0,classNameclassLength);//包名称
    	var className=classNameValue.substring(classNameclassLength+1,classNameValue.length);//类名
    	localStorage.packageName=packageName;//包名存储本地
    	localStorage.className=className;//类名存储本地
    	localStorage.currentClassName=classNameValue;//类全面存储
    	localStorage.codeId=codeId;//获取codeId
    	$.ajax({
    	    		type : "POST",
    	    		dataType : "text",
    	    		async:false, 
    	    		url : "sys/pageDebugAction_checkOpen.ms",
    	    		data:{},
    	    		success : function(data) {
    	    			data=JSON.parse(data);
    	    			if(data.ajaxMap!=null&&data.ajaxMap.result=="true"){
    	    				window.open("sys/pageDebugAction_pageDebug.ms");
    	    			}else{
    	    				if(data.ajaxMap.message=="otherOpen"){
    	    					utilsFp.alert("其他用户调试中");	
    	    				}else{
    	    					utilsFp.alert("断点界面已打开，请切换断点界面");	
    	    				}
    	    			}
    	    				
    	    				
    	    		},
    	    		error : function(msg) {
    	    			alert();
    	    		}
    	    	});
    }
    
    /*
     * iframe控制弹窗的帮助信息是否显示
     * params: {ifShow: true/false, url:"xxx"}
     */
    this.setHelp = function(obj){
    	//获取弹窗的id
    	var iframeId = window.frameElement.id;
    	var popId = iframeId+'pop';
    	var helpDom;
    	
    	if(obj.ifShow && popId){
    		helpDom = top.$("#"+popId).find(".dialog-help")[0];
    		$(helpDom).css("display","block");
    	}
    	
    	//给帮助设置方法
    	if(obj.url){
    		$(helpDom).on('click',function(){
        		window.open(obj.url);
        	})
    	}
    }

}

var utilsFp = new UtilsFp();



/**
* ***********************END************************
* **************************************************
*/