function initValidate(targetObject)
{
	if(typeof targetObject.validateJson != "undefined")
	{
		var rule = null;
		var left = null;
		var right = null;
		var regex = null;
		var tip = null;
		for(var key in targetObject.validateJson)
		{
			if(key == "UI_RULE")
			{
				rule = targetObject.validateJson[key];
			}
			else if(key == "UI_RULE_LEFT")
			{
				left = targetObject.validateJson[key];
			}
			else if(key == "UI_RULE_RIGHT")
			{
				right = targetObject.validateJson[key];
			}
			else if(key == "UI_RULE_REGEX")
			{
				regex = targetObject.validateJson[key];
			}
			else if(key == "UI_RULE_TIP")
			{
				tip = targetObject.validateJson[key];
			}
				
		}	
		if(rule == 'letters')
		{
			if(!isIE())
			{
				targetObject.addEventListener("input",function()
				{
					targetObject.value = targetObject.value.replace(/[^\a-zA-Z]+/g,"");
				},true);
			}
			else
			{
				targetObject.attachEvent("onkeyup", function(o)
				{
						targetObject.value = targetObject.value.replace(/[^\a-zA-Z]+/g,"");
				});
			}
			return true;
		}
		else if(rule == 'capital')
		{
			if(!isIE())
			{
				targetObject.addEventListener("input",function()
				{
					targetObject.value = targetObject.value.replace(/[^\A-Z]+/g,"");
				},true);
			}
			else
			{
				targetObject.attachEvent("onkeyup", function(o)
				{
					targetObject.value = targetObject.value.replace(/[^\A-Z]+/g,"");
				});
			}
			return true;
		}
		else if(rule == 'lower_case')
		{
			if(!isIE())
			{
				targetObject.addEventListener("input",function()
				{
					targetObject.value = targetObject.value.replace(/[^\a-z]+/g,"");
				},true);
			}
			else
			{
				targetObject.attachEvent("onkeyup", function(o)
				{
					targetObject.value = targetObject.value.replace(/[^\a-z]+/g,"");
				});
			}
			return true;
		}
		else if(rule == 'number')
		{
			if(!isIE())
			{
				targetObject.addEventListener("input",function()
				{
					targetObject.value = targetObject.value.replace(/\D+/g,"");
					if(right != null)
					{
						if(parseFloat(right) < parseFloat(targetObject.value))
						{
							targetObject.value = targetObject.value.substring(0,targetObject.value.length-1);
						}
					}
				},true);
			}
			else
			{
				targetObject.attachEvent("onkeyup", function(o)
				{
					targetObject.value = targetObject.value.replace(/\D+/g,"");
					if(right != null)
					{
						while(parseFloat(right) < parseFloat(targetObject.value))
						{
							targetObject.value = targetObject.value.substring(0,targetObject.value.length-1);
						}
					}
				});
			}

			return true;
		}
		else if(rule == 'regex')
		{
			if(!targetObject.value.match(regex))
			{
				return false;
			}
			else
			{
				return true;
			}
		}
		else 
		{
			return true;
		}
	}
}
	
	function isIE()
	{
		var br = navigator.userAgent.toLowerCase();
		if(br.indexOf("msie") > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}