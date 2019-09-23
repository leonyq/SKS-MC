/**
 * 取样式表、属性、事件对象
 * by:hxh;
 * date:2017-05-17
 * ***/
function MSdata(paraJson){
	var pJson = paraJson;
	//如果是json字符串，则转成json对象
	if(paraJson != null && paraJson != "" && typeof paraJson == "string"){
		pJson = $.parseJSON(paraJson);
	}
	/**
	 * 获取分页信息
	 * 参数：表单ID
	 * 返回分页对象
	 ***/
	this.page = function(formId){
		return returnEmpty(pJson[formId].page);
	}
/*********************tr begin**********************************************/	
	/**
	 * 获取Tr样式
	 * 参数：表单ID
	 * 返回样式字符串
	 ***/
	this.trClass = function(formId){
		return returnEmpty(pJson[formId].tr.cssClass);
	}
	
	/**
	 * 获取Tr属性
	 * 参数：表单ID
	 * 返回属性字符串
	 ***/
	this.trStyle = function(formId){
		return returnEmpty(pJson[formId].tr.style);
	}	
	
	/**
	 * 获取Tr事件
	 * 参数：表单ID
	 * 返回事件字符串
	 ***/
	this.trEvent = function(formId){
		return returnEmpty(pJson[formId].tr.event);
	}
/*****************tr end***********************ui begin**************************************/	
	/**
	 * 获取ui事件
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.uiEvent = function(formId,fieldNo){
		var formJson = pJson[formId];
		return returnEmpty(pJson[formId].ui[fieldNo].event);
	}
	
	/**
	 * 获取ui样式表
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.uiClass = function(formId,fieldNo){
		var formJson = pJson[formId];
		return returnEmpty(pJson[formId].ui[fieldNo].cssClass);
	}
	
	/**
	 * 获取ui属性
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.uiStyle = function(formId,fieldNo){
		var formJson = pJson[formId];
		return returnEmpty(pJson[formId].ui[fieldNo].style);
	}
	
	/*****************ui end***********************td begin**************************************/		
	/**
	 * 获取td事件
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.tdEvent = function(formId,fieldNo){
		var formJson = pJson[formId];
		return returnEmpty(pJson[formId].td[fieldNo].event);
	}
	
	/**
	 * 获取td样式表
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.tdClass = function(formId,fieldNo){
		var formJson = pJson[formId];
		return returnEmpty(pJson[formId].td[fieldNo].cssClass);
	}
	
	/**
	 * 获取td属性
	 * 参数：表单ID，字段
	 * 返回事件字符串
	 ***/
	this.tdStyle = function(formId,fieldNo){
		var formJson = pJson[formId];
		return returnEmpty(pJson[formId].td[fieldNo].style);
	}
	
	/*****************td end***********************title begin**************************************/
	/**
	 * 获取title属性(当有传字段时，返回该字段名称，当传入的字段为空时，返回所有字段名称集)
	 * 参数：表单ID，字段(可传空)
	 * 返回单个title中文名或所有title json串
	 ***/
	this.title = function(formId,fieldNo){
		var formJson = pJson[formId];
		//return pJson[formId].td[fieldNo].style;
		if(fieldNo == null || fieldNo == ""){
			return returnEmpty(pJson[formId].title);
		}else{
			return returnEmpty(pJson[formId].title[fieldNo]);
		}
	}
	/*****************title end*********************** formAttr begin**************************************/
	/**
	 * 获取表单属性（当属性名称不为空时，字段必填）
	 * 参数：表单ID，字段(可传空)，属性名称(可传空)
	 * 返回某个特定字段的属性值，或某个特定字段的所有属性，或所有字段的所有属性
	 ***/
	this.formAttr = function(formId,fieldNo,attrName){
		var formJson = pJson[formId];
		//return pJson[formId].td[fieldNo].style;
		//当字段和属性名为空时，返回所有字段的所有属性
		if((fieldNo == null || fieldNo == "") && (attrName == null || attrName == "")){
			return returnEmpty(pJson[formId].formAttr);
		}else if((fieldNo != null && fieldNo != "") && (attrName == null || attrName == "")){
			//当字段名不为空，属性名为空时，获取该字段所有属性
			return returnEmpty(pJson[formId].formAttr[fieldNo]);
		}else if((fieldNo == null || fieldNo == "") && (attrName != null && attrName != "")){
			//当字段为空且属性不为空，返回空
			return "";
		}else{
			//返回某个字段的某个属性
			return returnEmpty(pJson[formId].formAttr[fieldNo][attrName]);
		}
	}
	
	/*****************title end*********************** formAttr begin**************************************/
	/**
	 * 获取表单title配置值
	 * 参数：表单ID，字段(可传空)，属性名称(可传空)，行对象(可传空)
	 * 返回空串或者列文本
	 ***/
	this.titleAttr = function(formId,fieldNo,attrName,v){
		var formJson = pJson[formId];
		if(fieldNo != null || fieldNo != ""){
			var titleAttr = returnEmpty(formJson.formAttr[fieldNo][attrName]);
			if(titleAttr == "1"){
				return v[fieldNo];
			}else{
				return "";
			}
		}else{
			return "";
		}
	}
	
	/*****************formAttr end*************************uiTxt begin************************************/
	/**
	 * 获取列表内容
	 * 参数：表单ID
	 * 返回列表对象
	 ***/
	this.uiTxt = function(formId){
		var formJson = pJson[formId];
		//返回某个字段的某个属性
		return returnEmpty(pJson[formId].data.uiTxt);
	 }
	
	/*****************uiTxt end***********************userDefined begin**************************************/
	/**
	 * 获取用户自定义属性内容
	 * 参数：表单ID，自定义名称
	 * 返回
	 ***/
	this.userDefined = function(formId,definedName){
		var formJson = pJson[formId];
		//返回用户自定义的属性
		return returnEmpty(pJson[formId][definedName]);
	 }	
	/*****************userDefined end******************rawData begin*******************************************/	
	/**
	 * 获取原始数据内容
	 * 参数：表单ID
	 * 返回
	 ***/
	this.uiRaw = function(formId){
		var formJson = pJson[formId];
		//返回用户自定义的属性
		return returnEmpty(pJson[formId].data.uiRaw);
	 }
	/*****************rawData end*************************************************************/		
}

//返回空串
function returnEmpty(obj){
	if(obj == null || typeof(obj)=="undefined"){
		return "";
	}else{
		return obj;
	}
}
/*var dj = "{\"e7f5bbc2329c46be837ce886e0536227\":{\"ui\":\"aaaa\",\"haha\":\"heihei\"}}";//"{\"e7f5bbc2329c46be837ce886e0536227\":\"aaa\"}";
console.log(MSdata.userDefined("e7f5bbc2329c46be837ce886e0536227","haha", dj));*/
/*$.ajax({
	type: "POST",
    dataType: "json",
    url: "/mes/buss/bussModel.ms?exeid=1fab3da4ee42455697f9d96ac3823c54",
    //data: "paraMap.sql="+val2,//+upColId,
	success: function(data){
			//console.log(data);
			console.log(MSdata.uiTxt("e7f5bbc2329c46be837ce886e0536227", data));
		},
	error: function(msg){
			util.closeLoading();
			util.alert("error:"+msg);
	  }
	});	*/