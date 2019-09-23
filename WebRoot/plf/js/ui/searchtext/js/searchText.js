	function divFocus(x)
	{	
		document.getElementById(x).style.backgroundColor ='#A8D5FC';
	}
		
	function divBlur(x)
	{	
		document.getElementById(x).style.backgroundColor ='#FFFFFF';
	}
	
	
	function getRootPath() {  
	    var pathName = window.location.pathname.substring(1);  
	    var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));  
	    return window.location.protocol + '//' + window.location.host + '/' + webName + '/';  
	}  
	
	function initSearchText(objname,tbodyObjname,buttonObjname,previousObjname,nextObjname,top,sql,type)
		{
			var obj = document.getElementById(objname);
			var tbodyObj = document.getElementById(tbodyObjname);
			var buttonObj = document.getElementById(buttonObjname);
			var previousObj = document.getElementById(previousObjname);
			var nextObj = document.getElementById(nextObjname);
			
			var currentPage = 0;
			var currentlength;
			var currentvar = null;
			if(document.attachEvent)
			{
				document.attachEvent("onclick",
				function(e)
				{
					var event = e || window.event;
					var target = event.target || event.srcElement;
					if (target != tbodyObj 
					&& target != obj
					&& target != buttonObj 
					&& target != previousObj
					&& target != nextObj)
					{
						currentPage = 0;
						$(tbodyObj).empty();
						buttonObj.style.display = "none";
					}
				});
			}
			else if(document.addEventListener)
			{
				document.addEventListener("click",
				function(e)
				{
					var event = e || window.event;
					var target = event.target || event.srcElement;
					if (target != tbodyObj
					&& target != obj
					&& target != buttonObj 
					&& target != previousObj
					&& target != nextObj)
					{
						currentPage = 0;
						$(tbodyObj).empty();
						buttonObj.style.display = "none";
					}
				},true);	
			}
			$(obj).bind('keydown',function(e)
			{
				var event = e||window.event;
				var code = event.keyCode;
				if(code == 9)//tab��
				{
					currentPage = 0;
					$(tbodyObj).empty();
					buttonObj.style.display = "none";
				}
			});
			
			String.prototype.startWith=function(s)
			{
				if(s==null || s=="" || this.length==0||s.length>this.length)
				{
					return false;
				}
				if(this.substr(0,s.length)==s)
				{
					return true;
				}
				else
				{
					return false;
				}
				return true;
			}
			
			$(obj).bind('keydown',function(e)
			{
				keydown(e);
			});
			$(tbodyObj).bind('keydown',function(e)
			{
				keydown(e);
			});
			
			$(obj).bind('keyup',function()
			{
				if(currentvar === obj.value)
				{
					return;
				}
				currentvar = obj.value;
				currentPage = 0;
				if(obj.value == "")
				{
					$(tbodyObj).empty();
					buttonObj.style.display = "none";
					return;
				}
				var params = 
				{
					top:top,
					modelpage:currentPage,
					sql:sql,
					type:type,
					value:obj.value
				}
				$.ajax({
				type:"post",
				async:true,
				url:getRootPath()+"ui/show_showList.ms?dataAuth="+get_data_auth(),
				data:params,
				dataType:"json"
				})
				.done(function(data)
				{
					$(tbodyObj).empty();
					buttonObj.style.display = "none";
					show(data);
				})
				.fail(function()
				{
				});
			});
			$(obj).bind('click',function()
			{
				if(obj.value == "")
				{
					$(tbodyObj).empty();
					buttonObj.style.display = "none";
					return;
				}
				var params = 
				{
					top:top,
					modelpage:currentPage,
					sql:sql,
					type:type,
					value:obj.value
				}
				$.ajax({
				type:"post",
				async:true,
				url:getRootPath()+"ui/show_showList.ms?dataAuth="+get_data_auth(),
				data:params,
				dataType:"json"
				})
				.done(function(data)
				{
					$(tbodyObj).empty();
					buttonObj.style.display = "none";
					show(data);
				})
				.fail(function()
				{
				});
			});
	
			$(previousObj).bind("click",function()
			{
				previous();
			});
			
			$(nextObj).bind("click",function()
			{
				next();
			});
			
			tbodyObj.onclick = function(e)
			{
				var event = e||window.event;
				var target = event.target || event.srcElement;
				var wd = target.innerHTML;
	
					obj.value = wd;
					currentvar = wd;
					$(tbodyObj).empty();
					obj.focus();
					currentPage = 0;
					buttonObj.style.display = "none";
			}
			
			function keydown(e)
		{
			var event = e||window.event;
			var code = event.keyCode;
			var id = document.activeElement.id;
			var last = currentlength;
			if(currentlength > top)
			{
				last = top;
			}
			if(code == 38)//�Ϸ����
			{
				if(id == objname)
				{
					if(document.getElementById(objname + "_div_"+ (last-1)) != null)
					{
						document.getElementById(objname + "_div_"+ (last-1)).focus();
					}
				}
				else if (id == objname + "_div_0")
				{
					obj.focus();
				}
				else if(id.startWith(objname + "_div_"))
				{
					var number = id.substr((objname + "_div_".length),id.length);
					if(document.getElementById(objname + "_div_"+ (number-1)) != null)
					{
						document.getElementById(objname + "_div_"+ (number-1)).focus();
					}
				}
			}
			else if(code == 40)//�·����
			{
				if(id == objname)
				{
					if(document.getElementById(objname + "_div_0") != null)
					{
						document.getElementById(objname + "_div_0").focus();
					}
				}
				else if(last != 1 && id == (objname + "_div_"+ (last-1)))
				{
					obj.focus();
				}
				else if(id.startWith(objname + "_div_"))
				{
					var number = id.substr((objname + "_div_".length),id.length);
					number = parseInt(number)+1;
					if(document.getElementById(objname + "_div_"+ number) != null)
					{
						document.getElementById(objname + "_div_"+ number).focus();
					}
				}
			}
			else if(code == 37)//�����
			{
				if( currentPage == 0)
				{	
					return;
				}
				if(id.startWith(objname + "_div_"))
				{
					previous();
					document.getElementById(objname + "_div_0").focus();
				}
			}
			else if(code == 39)//�ҷ����
			{
				if(id.startWith(objname + "_div_"))
					{
					if(currentlength <= top)
					{
						return;
					}
					next();
					document.getElementById(objname + "_div_0").focus();
				}
			}
			else if(code == 13)//Enter��
			{
				if(id.startWith(objname + "_div_"))
				{
					var wd = document.activeElement.innerHTML;
					obj.value = wd;
					currentvar = wd;
					obj.focus();
					$(tbodyObj).empty();
						currentPage = 0;
					buttonObj.style.display = "none";
				}
			}
		};
		
		function next()
			{
				if(currentlength <= top)
				{
					return;
				}
				currentPage++;
				var params = 
				{
					top:top,
					modelpage:currentPage,
					sql:sql,
					type:type,
					value:obj.value
				}
				$.ajax({
				type:"post",
				async:false,
				url:getRootPath()+"ui/show_showList.ms?dataAuth="+get_data_auth(),
				data:params,
				dataType:"json"
				})
				.done(function(data)
				{
					$(tbodyObj).empty();
					show(data);
				})
				.fail(function()
				{
				});
			}
			
			function show(data)
			{
				var length = data.list.length;
				currentlength = length;
				var lengthTop = top*23;
				var width = obj.offsetWidth - 2;
				
				buttonObj.style.width = width +"px";
				if(length <= top)
				{	
					lengthTop = length*23;
					for(var i=0;i<length;i++)
					{
						$(tbodyObj).append("<div tabindex=\"" + (i+1) + 
						"\" id=\""+objname+"_div_" + i + 
						"\" onmouseover=\"this.focus();\" onfocus=\"divFocus(this.id)\"; onmouseout=\"this.blur();\" onblur=\"divBlur(this.id)\"; style=\"cursor:default; z-index:10;position:absolute;border: 1px solid #a8c7ce;top:"
						+ i*23 + 
						"px;border-width: 0px 1px 1px 1px;line-height: 22px;width: "+	width	+"px;background-color:#FFFFFF\">"+data.list[i]+"</div>");
					}		
					if(currentPage != 0)
					{
						buttonObj.style.display = "block";
						buttonObj.style.top = lengthTop+"px";
					}
					else
					{
						buttonObj.style.display = "none";
					}
					nextObj.style.display = "none";
	
				}
				else
				{
					for(var i=0;i< top;i++)
					{
						$(tbodyObj).append("<div tabindex=\"" + (i+1)
						+ "\" id=\"" + objname + "_div_" 
						+ i + "\" onmouseover=\"this.focus();\" onfocus=\"divFocus(this.id)\";  onmouseout=\"this.blur();\" onblur=\"divBlur(this.id)\"; style=\"cursor:default; z-index:10;position:absolute;border: 1px solid #a8c7ce;top:"
						+ i*23 + "px;border-width: 0px 1px 1px 1px;line-height: 22px;width: "+	width	+"px;background-color:#FFFFFF\">"+data.list[i]+"</div>");
					}
					nextObj.style.display = "block";
					buttonObj.style.display = "block";
					buttonObj.style.top = lengthTop+"px";
				}
				if(currentPage != 0)
				{
					previousObj.style.display = "block";
				}
				if(currentPage == 0)
				{
					previousObj.style.display = "none";
				}
			};
		
		function previous()
		{
			if(currentPage == 0)
			{
					return;
			}
			currentPage--;
			var params = 
			{
				top:top,
				modelpage:currentPage,
				sql:sql,
				type:type,
				value:obj.value
			}
			$.ajax({
			type:"post",
			async:false,
			url:getRootPath()+"ui/show_showList.ms?dataAuth="+get_data_auth(),
			data:params,
			dataType:"json"
			})
			.done(function(data)
			{
				$(tbodyObj).empty();
				show(data);
			})
			.fail(function()
			{
			});
		}
	}
	
	function get_data_auth(){
		//多组织机构数据权限改造lth
		var dataAuth = "";
	    var domDataAuthId = "";
	    if($("#deptLs_data_auth").length==0){
	      dataAuth = $("#DATA_AUTH").val();
	      domDataAuthId = "#DATA_AUTH";
	    }else{
	      dataAuth = $("#deptLs_data_auth").val();
	      domDataAuthId = "#deptLs_data_auth";
	    }
	    if(dataAuth==""){
	      var option = "";
	      $(domDataAuthId+" option").each(function(){
	        option = $(this).val();
	        if(option==""){
	          return true;
	        }
	        dataAuth+=option+",";
	      });
	      dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
	    }
	    //alert(dataAuth);
	    return dataAuth;
	    
	}