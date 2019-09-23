function progressBar(options, obj) 
{
    initOptions(options);
        obj.each(function () {
            var this_ = $(this);
            var $percent = obj.find("div.percent-show>span");
            var progress_in = obj.find("div.progress-in");
            initCss(options, obj);
			var showpercent = null;
			if(isNaN(options.percent))
			{
				showpercent = parseInt(options.number)/parseInt(options.total) * 100;
			}
			else
			{
				showpercent = options.percent;
			}
			var showstyle = options.showstyle;
			
            var t = setInterval(function () 
			{
				if(isNaN(options.percent) && (showstyle == "number"))
				{
				    $percent.html(parseInt(progress_in.width() / this_.width() * options.total) + "/" + options.total);	
				}
				else if(isNaN(options.percent) && (showstyle == "all"))
				{
					$percent.html(Math.floor(parseInt(progress_in.width() / this_.width() * 100 ))+ "%("+ parseInt(progress_in.width() / this_.width() * options.total) + "/" + options.total + ")");	
				}
				else
				{
	                $percent.html(Math.floor(parseInt(progress_in.width() / this_.width() * 100 ))+ "%");
				}
				
            }, options.speed / 100);
            progress_in.animate(
			{
                width: showpercent + "%"
            }, options.speed, function () 
			{
                clearInterval(t);
                t = null;
				if(isNaN(options.percent) && (showstyle == "number"))
				{
				    $percent.html(options.number + "/" + options.total);	
				}
				else if(isNaN(options.percent) && (showstyle == "all"))
				{
					$percent.html(Math.floor(showpercent) + "%("+ options.number + "/" + options.total + ")");	
				}
				else
				{
	                $percent.html(Math.floor(showpercent) + "%");
				}

                showpercent == 100 && progress_in.css("border-radius", 0);
            });
        });
        return obj;
    }

    function initOptions(options) {
        (!options.hasOwnProperty("speed") || isNaN(options.speed)) && (options.speed = 1000);
        //(!options.hasOwnProperty("percent") || isNaN(options.percent)) && (options.percent = 100);
        !options.hasOwnProperty("width") && (options.width = '180px');
        !options.hasOwnProperty("height") && (options.height = '20px');
        !options.hasOwnProperty("direction") && (options.direction = 'left');
        options.fontSize = Math.floor(parseInt(options.height) * 12 / 10) + "px";
        options.lineHeight = options.height;
    }

    function initCss(options, obj) {
        obj.css({
            "width": options.width,
            "height": options.height
        }).find("div.percent-show").css({
            "lineHeight": options.lineHeight,
            "fontSize": options.fontSize
        });
        if(options.direction =="right"){
            obj.find("div.progress-in").addClass("direction-right");
        }else{
            obj.find("div.progress-in").addClass("direction-left");
        }
    }