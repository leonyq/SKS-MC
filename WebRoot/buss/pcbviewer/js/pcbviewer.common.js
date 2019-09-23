    function PcbViewerMulti(){
        this.topDivId;
        this.botDivId;
	    this.topPath;
	    this.botPath;
	    this.Tag;
	    var _This=this;
	    var _Tag;
	    var pcbViewerTop;
	    var pcbViewerBot;
	    var topDiv;
	    var botDiv;
	    function bindHtml(){
	        var html='';
	        html+='<div class="div_title">';
        	html+='图纸<b class="zoom zoomMax">+</b><small class="btn btn_bot" _face="bot">BOT</small><small class="btn btn_top" _face="top">TOP</small>';
            html+='    	</div>';
            html+='    	<div id="divPcbTop" class="draw top">';
            html+='    	</div>';
            html+='    	<div id="divPcbBot" class="draw bot none">';
            html+='    	</div>';
            _Tag.html(html);
	    }
	    function init(){
	        _Tag=_This.Tag;
	        bindHtml();
	        pcbViewerTop = PcbViewer(_This.topDivId);
	        pcbViewerBot = PcbViewer(_This.botDivId);
	        if(_This.topPath!=undefined){
	            pcbViewerTop.fetch(_This.topPath);
	        }	
            if(_This.botPath!=undefined){
	            pcbViewerBot.fetch(_This.botPath);				
            }
	        topDiv=$('#'+_This.topDivId);
	        botDiv=$('#'+_This.botDivId);
	        bindEvent(); 
	    }
	    function bindEvent(){
	        _Tag.find('.zoom').off('click').on('click',function(){
                $(this).parents('.zoom_area').toggleClass('zoomclass');
                var _parentDiv=_Tag.parent();
                _parentDiv.toggleClass('zoomclass').toggleClass('zoomrightclass');
                _Tag.find('.draw').toggleClass('pcb_viewer_div');
                var is_max = $(this).parents('.zoom_area').hasClass('zoomclass');
              
                if(is_max){ 
                    $(this).text('-'); 
                    _Tag.find('.draw').height($(window).height()-95);
                }
                else {
                    $(this).text('+');
                    _Tag.find('.draw').height(($(window).height()-130)/2);	 
                }
                 
                if($(this).parents('.div_draw').length>0){
                    if(is_max) {
                        $('.div_esop').hide();	
                    }
                    else {
                        $('.div_esop').show(); 	
                    } 
                    _This.stretch('h');
                } 
            
            }); 
        _Tag.find('.btn').off('click').on('click',function(){ 
            if($(this).hasClass('checked')) return;
            $('.div_draw .btn').removeClass('checked');
            $(this).addClass('checked'); 
            util.showLoading();
            if(typeof(_This.btnClickEvent)=='function'){
                _This.btnClickEvent();   
            }//itemDataTable.loadPcbViewer($('.div_draw .btn.checked').attr('_face'));
            _This.stretch('h');
            util.closeLoading();
        });
	    }
	    this.btnClickEvent=function(){
	        
	    }
	    this.loadPcbViewer=function(callback){
	        if(_This.topPath!=undefined&&_This.botPath!=undefined){
	            pcbViewerBot.fetch(_This.botPath);
	            pcbViewerTop.fetch(_This.topPath,callback);	
	        }else if(_This.topPath!=undefined){
	            pcbViewerTop.fetch(_This.topPath,callback);
	        }else{
	            util.closeLoading();
	        }
	    }
	    this.stretch=function(type){ 
	    console.log(_Tag.find('#divPcbTop').width()/_Tag.find('#divPcbTop').height());
	        if(_Tag.find('#divPcbTop').width()/_Tag.find('#divPcbTop').height()<3.0/2){
	            type='';
	        }else{
	            type='h';
	        }
	        pcbViewerTop.stretch(type);
	        pcbViewerBot.stretch(type);
	    }
	    this.showTop=function(){
	            topDiv.show();
	            botDiv.hide();
	    }
	    this.showBot=function(){
	            topDiv.hide();
	            botDiv.show();
	    }
	    this.drawLocations=function(jsonArr,face){
	         
	        if(face=='top'&&_This.topPath!=undefined){
	            topDiv.show();
	            botDiv.hide(); 
	            pcbViewerTop.drawLocations(jsonArr==undefined?[]:jsonArr);
	        }
	        if(face=='bot'&&_This.botPath!=undefined){ 
	            topDiv.hide();
	            botDiv.show();
	            pcbViewerBot.drawLocations(jsonArr==undefined?[]:jsonArr);
	        } 
	    }
	    this.clear=function(){
	       topDiv.show();
	       botDiv.hide();
	       pcbViewerTop.fetch('');
	       pcbViewerBot.fetch('');
	    }
	    this.show=function(){
	        init();
	    }
    }