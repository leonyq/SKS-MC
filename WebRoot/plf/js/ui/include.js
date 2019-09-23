//动态加载js文件方法
function addLoadEvent(callback)
{
	var oldCallback = window.onload;
	window.onload = new function()
	{
		if(typeof(oldCallback)=="function")
		{		
			oldCallback();
		}
		callback();
	}
	/*var scripts = window.scripts;
	var oldcallback = window.callback;
	if(typeof(oldcallback)=="function")
	{		
		window.callback = function()
		{
			oldcallback();
			callback();
		};
	}
	else
	{
		window.callback = function()
		{
			callback();
		};
	}
	var count = 0;
	if(typeof(scripts[0].onload) == "object")
	{
		for(var i = 0;i < scripts.length; i++)
		{
			scripts[i].onload = function()
			{
				count++;
				alert(count + ":" + scripts.length);
				if(count == scripts.length)
				{
					window.callback();
				}
			};
		}
	}
	else if(typeof(scripts[0].onreadystatechange) == "object")
	{
		for(var i = 0;i < scripts.length; i++)
		{
			scripts[i].onreadystatechange = function()
			{
				count++;
				alert(count + ":" + scripts.length);
				if(count == scripts.length)
				{
					window.callback();
				}
			};
		}
	}*/
}

function include(file)
{
	var tXMLHttp = createXMLHttp();
	tXMLHttp.open("GET",file,false);
	var tJsCode = tXMLHttp.responseText;
	window.eval(tJsCode,"javascript");
	alert(tJsCode);
	if(window.exeScript)
	{
		window.exeScript(tJsCode);//ie
	}
	else
	{
		window.eval(tJsCode);
	}
}

function createXMLHttp()
{
	try
	{
		return (new ActiveXObject("MSXML2.XMLHTTP"));
	}
	catch(e)
	{
		return (new XMLHttpRequest());
	}
}