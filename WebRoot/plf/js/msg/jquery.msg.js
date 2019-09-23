
( function() {
	var ua = navigator.userAgent.toLowerCase();
	var is = (ua.match(/\b(chrome|opera|safari|msie|firefox)\b/) || [ '',
			'mozilla' ])[1];
	var r = '(?:' + is + '|version)[\\/: ]([\\d.]+)';
	var v = (ua.match(new RegExp(r)) || [])[1];
	jQuery.browser.is = is;
	jQuery.browser.ver = v;
	jQuery.browser[is] = true;

})();

( function(jQuery) {
	/*
	 * 
	 * jQuery Plugin - msgPop
	 * 
	 */
   
	this.version = '@1.5';
	this.layerPop = {
		'width' :200,
		'height' :150
	};
	this.titlePop = '' ;
	this.timePop = 3000;
	this.animsPop = {
		'type' :'slide',
		'speed' :600
	};
	var topDocument=top.document;
	this.timer1 = null;
	this.initsPop = function(title, text) {
		if (top.$("#msgPopDiv").is("div")) {
			top.$("#msgPopDiv").remove();
			//return;
		}
		$(top.document.body)
		.prepend(
				'<div id="msgPopDiv" style="width:'
				+ this.layerPop.width +'px;height:'
				+ this.layerPop.height +'px;position: absolute;right: 0;bottom: 0;overflow:hidden;background-color: #fff;box-shadow: 0 0 5px rgba(102,102,102,0.6);z-index:999999999;display:none">'
				+ '<div style="height:36px;background-color:#004098;">'
				+ '<h3 style="height:36px;line-height:36px;padding-left:10px;font-size: 14px;color: #fff;">'
				+ title+'</h3>'
				+ '<span class="ico" onclick="$.msgPop.closeMsg()" style="display:inline-block;width:13px;height:13px;background-image:url('  + util.getContextPath() +  '/plf/page/fp/img/ico-close.png);position: absolute;right: 10px;top: 12px;cursor: pointer;"></span>'
				+ '</div>'
				+ '<div style="border-top:1px solid #cbe9ff;height:120px;">'
				+ '<div>'
				+ '<div class="ico-success" style="width:40px;height:40px;display: inline-block;"></div>'
				+ '</div>'
				+ '<p style="margin-top:40px;margin-left:60px;margin-right: 10px;text-align:center;font-weight:normal;">'
				+ text + '</p>'
				+ '</div>'
				+ '</div>');
		
		/*top.$("#msgPopDiv_close").click( function() {
			//setTimeout($.msgPop.closeMsg(), 1);
			$.msgPop.closeMsg();
		});*/
		/*top.$("#msgPopDiv").hover( function() {
			clearTimeout(timer1);
			timer1 = null;
		}, function() {
			if (time > 0)
				timer1 = setTimeout('$.msgPop.closeMsg()', time);
			});*/

		
		
		$(window).scroll(
				function() {
					var bottomHeight =  "-"+document.documentElement.scrollTop;
					top.$("#msgPopDiv").css("bottom", bottomHeight + "px");
				});
		
		//增加鼠标悬停的时候，提示不消失，鼠标移开的时候重先执行定时器
		top.$("#msgPopDiv").bind({
			mouseenter:function(){
			top.window.clearTimeout($.msgPop.timer1);
		},
			mouseleave:function(){
			$.msgPop.rmmessagePop($.msgPop.timePop);
		}
		});
		

	};

	this.showPop = function(title, text, time) {
		if (top.$("#msgPopDiv").is("div")) {
			top.$("#msgPopDiv").remove();
			//return;
		}
		
		if (title == 0 || !title)
			title = this.titlePop;
		this.initsPop(title, text);
		if (time >= 0 || time==-1)
			this.timePop = time;
		switch (this.animsPop.type) {
		case 'slide':
			top.$("#msgPopDiv").slideDown(this.animsPop.speed);
			break;
		case 'fade':
			top.$("#msgPopDiv").fadeIn(this.animsPop.speed);
			break;
		case 'show':
			top.$("#msgPopDiv").show(this.animsPop.speed);
			break;
		default:
			top.$("#msgPopDiv").slideDown(this.animsPop.speed);
			break;
		}
		var bottomHeight =  "-"+document.documentElement.scrollTop;
		top.$("#msgPopDiv").css("bottom", bottomHeight + "px");
		
		if ($.browser.is == 'chrome') {
			setTimeout( function() {
				top.$("#msgPopDiv").remove();
				this.initsPop(title, text);
				top.$("#msgPopDiv").css("display", "block");
			}, this.animsPop.speed - (this.animsPop.speed / 5));
		}
		this.rmmessagePop(this.timePop);
		
	};

	this.laysPop = function(width, height) {

		if (top.$("#msgPopDiv").is("div")) {
			return;
		}
		if (width != 0 && width)
			this.layerPop.width = width;
		if (height != 0 && height)
			this.layerPop.height = height;
	}

	this.animPop = function(type, speed) {
		if (top.$("#msgPopDiv").is("div")) {
			return;
		}
		if (type != 0 && type)
			this.animsPop.type = type;
		if (speed != 0 && speed) {
			switch (speed) {
			case 'slow':
				;
				break;
			case 'fast':
				this.animsPop.speed = 200;
				break;
			case 'normal':
				this.animsPop.speed = 400;
				break;
			default:
				this.animsPop.speed = speed;
			}
		}
	}

	this.rmmessagePop = function(time) {
		if (time > 0) {
			timer1 = top.window.setTimeout('$.msgPop.closeMsg()', time);
		}
	};
	this.closeMsg = function() {
		switch (this.animsPop.type) {
		case 'slide':
			top.$("#msgPopDiv").slideUp(this.animsPop.speed);
			break;
		case 'fade':
			top.$("#msgPopDiv").fadeOut(this.animsPop.speed);
			break;
		case 'show':
			top.$("#msgPopDiv").hide(this.animsPop.speed);
			break;
		default:
			top.$("#msgPopDiv").slideUp(this.animsPop.speed);
			break;
		}
		
		setTimeout('top.$("#msgPopDiv").remove()', this.animsPop.speed);
		this.originalPop();
	}

	this.originalPop = function() {
		this.layerPop = {
			'width' :200,
			'height' :200
		};
		this.titlePop = '';
		this.timePop = 3000;
		this.animsPop = {
			'type' :'slide',
			'speed' :600
		};
	};
	
	
	jQuery.msgPop = this;
	return jQuery;
})(jQuery);