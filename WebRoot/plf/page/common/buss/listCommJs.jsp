<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<script type="text/javascript"><%-- 公用列表JS页面 --%>
<!--
	var _currentFrame;//当前标签页name
	var _currentFrameId;//当前标签页ID
	var _select_info1="<dict:lang value="请选择一条记录" />";
	var _select_info2="<dict:lang value="只能选择一条记录" />";
	var _select_info3="<dict:lang value="您没有操作该组织机构的权限" />";
	window.onresize = function(){
    	initBtnList();
    };
    
    function initState(){
    	$('#funFormClone').hide();
    }
    
    <%-- 设置按钮栏位置，若宽度太宽则隐藏 --%>
    function initBtnList(){
    	initState();
        var optn = $('.hd .optn');
        var searchForm = $('#searchFormTop');
        var group = $('#searchFormTop').find('.group');
        var showBtn = $('#showOptnFucnFormBtn');
    	var totalWidth =  searchForm.width();
    	var formWidth = group.width()||0;
    	var operWidth = optn.width();
    	var showBtnWidth = showBtn.width();
    	/* console.log('initBtnList测试...');
    	console.log('总宽度' + totalWidth );
    	console.log('搜索栏宽度' + formWidth );
    	console.log('按钮占用宽度' + operWidth );   */
    	
    	if(totalWidth <= (formWidth+operWidth)){
    		//创建隐藏按钮打开图标
	    	if(!(document.getElementById('showOptnFucnFormBtn'))){
	    		optn.find('#funForm .func_table tr td').append('<div id="showOptnFucnFormBtn" class="drop" onclick="showOptnFucnForm()"></div>');
	   		}
    		var optnWidth = totalWidth - formWidth;//按钮部分允许最大显示宽度
    	    //console.log('搜索栏位置不够，需要隐藏按钮');
    		//防止重复克隆按钮列表
    		if(checkEmpty($('#funFormClone'))){
	    		var cloneForm = optn.find('#funForm').clone();
	    		cloneForm.attr('id','funFormClone').hide().find('.func_table td').html('');
	    		optn.append(cloneForm);
    		}
    		//根据宽度判断是否隐藏
    		hidCheck(optn,optnWidth,'#funForm .func_table td button:first','#funFormClone .func_table td');
    		$('#funFormClone').css({'width':'120px','float':'right','position':'absolute','right':'0px'}).find('button').css({'width':'105px','text-align': 'left','overflow':'hidden'});
    		$('#showOptnFucnFormBtn').show();
    	}else {
	    	if(totalWidth >= (formWidth+operWidth+parseInt($('#funFormClone .func_table td button:last').attr('wid'))+5 )){
	    		//还原
	    		//console.log('totalWidth:'+totalWidth+';formWidth:'+formWidth+';operWidth:'+operWidth);
	    		//console.log('totalWidth-formWidth-50:'+(totalWidth-formWidth-50)+';operWidth:'+operWidth);
	    		//console.log('reshow...');
	   			reShowCheck( optn, totalWidth-formWidth-50,'#funFormClone .func_table td button:last','#funForm .func_table td' );
	    		$('#funForm .func_table td button').css({'width':'','text-align': 'center','overflow':''});
	    	}
    	}
    	
    	//点击其他地方下拉按钮列表
    	//console.log('parent.frames');
    	//console.log('parent.frames.length:'+parent.frames.length);
    	for(var i=0;i < parent.frames.length;i++){
    	//console.log(parent.frames[i]);
    		$(parent.frames[i].document).click(function(e){
	    		if($(e.target).attr('id') !='showOptnFucnFormBtn')
	    			$('.hd .optn #funFormClone').hide();
	    	});
    	}
    	$(parent.document).click(function(e){
    		if($(e.target).attr('id') !='showOptnFucnFormBtn')
    			$('.hd .optn #funFormClone').hide();
    	}); 
    	/* $(window).click(function(e){
    		if($(e.target).attr('id') !='showOptnFucnFormBtn')
    			$('.hd .optn #funFormClone').hide();
    	}); */
    	
    }
    
    //当宽度大于大于最大宽度时隐藏第一个元素
    function hidCheck(obj,objMaxWidth,hidChildSelecter,cloneArea){
    	//console.log('hidCheck obj width:'+$(obj).width()+';objMaxWidth:'+objMaxWidth);
    	if(!checkEmpty($(obj).find(hidChildSelecter)) && $(obj).width() >= objMaxWidth){
	    	var child = $(obj).find(hidChildSelecter);
	    	child.attr('wid',child[0].offsetWidth);
	    	$(cloneArea).append(child);
	    	//console.log('remove after width:'+$(obj).width());
	    	if($(obj).width() >= objMaxWidth){
	    		hidCheck(obj,objMaxWidth,hidChildSelecter,cloneArea);
	    	}
    	}
    }
    
    //还原隐藏按钮
    function reShowCheck(obj,objMaxWidth,reShowObjSelecter,reShowAreaSelecter){
    
    	if($('#funFormClone .func_table td button').length==1){
   			$('#showOptnFucnFormBtn').hide();
   		}
    	if(!checkEmpty($(reShowObjSelecter)) && (objMaxWidth > $(obj).width()) ){
    		$(reShowAreaSelecter).prepend($(reShowObjSelecter));
    		if(objMaxWidth > $(obj).width()){
    			reShowCheck(obj,objMaxWidth,reShowObjSelecter,reShowAreaSelecter)
    		}
    	}else if(!checkEmpty($(reShowObjSelecter))){
    		$('#showOptnFucnFormBtn').show();
    	}
    }
    
    function checkEmpty(obj){
    	var html = $(obj).html();
    	return html=='' || html==null || !html;
    }
    
    function showOptnFucnForm(){
    	$('.hd .optn').css('z-index','10001');
    	$('.hd .optn #funFormClone').toggle();
    }
    
	function searchList(thisObj){
		if(isQuery){utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		isQuery = true;
		document.forms.searchForm.submit();
	}
	
	function _selectAllData(thisObj,formId){
		var curCheck = $(thisObj).prop("checked");
		$("#table_"+formId).find("tbody tr").each(function(seq) {
			var listTableCheck = $(this).find(":checkbox._selectdata");
			listTableCheck.prop("checked",curCheck);
		    if(curCheck){
		    	listTableCheck.parents('tr').addClass('selected');
		    }else{
		    	listTableCheck.parents('tr').removeClass('selected');
		    }
		});
	}
	function _selectNewTableAllData(thisObj,formId){
		var flag = $("#datagrid-view-kz").length > 0 ?"-kz":"";
		var gridView;
		var dataGrid;
		if($("#tableContainer"+flag).length > 0){
			 gridView = "#left-datagrid-view"+flag;
			 dataGrid = "#left-datagrid-btable"+flag;
		}else{
			 gridView = "#datagrid-view"+flag;
			 dataGrid = "#datagrid-btable"+flag;
		}
		var curCheck = $(thisObj).prop("checked");
		$(thisObj).parents(gridView).find(dataGrid).find("tbody tr").each(function(seq) {
			var listTableCheck = $(this).find(":checkbox._selectdata");
			listTableCheck.prop("checked",curCheck);
			var abbr = listTableCheck.parents('tr').attr("abbr");
		    if(curCheck){
		    	$("tr[abbr='"+abbr+"']").removeClass('tr-hover');
		    	$("tr[abbr='"+abbr+"']").addClass('datagrid-selected');
		    }else{
		        $("tr[abbr='"+abbr+"']").removeClass('datagrid-selected');
		        selectedAllCheckBoxSetColor();
		    };
		});
	}
	
	// 异步表格全选 
	function _selectAjaxTableAllData(thisObj,formId){
		var curCheck = $(thisObj).prop("checked");
		var $tbody = $("#tbody_"+formId);
		var thisFormTbody= $tbody;
		if($("#left-tbody_"+formId).length > 0){
			$tbody = $("#left-tbody_"+formId);
			thisFormTbody = $("#tbody_"+formId+",#left-tbody_"+formId);
		}
		$tbody.find("input[type='checkbox']").prop("checked",curCheck);
		if(curCheck){
			thisFormTbody.find("tr").removeClass('tr-hover');
			thisFormTbody.find("tr").addClass('datagrid-selected');
		}else{
			thisFormTbody.find("tr").removeClass('datagrid-selected');
		    selectedAllCheckBoxSetColor();
		};
	};
	
	// 取消全选时各行添加样式
	function selectedAllCheckBoxSetColor(){
		$(".datagrid-btable").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			tableTrJs.each(function(i) {
				if (i % 2 == 0) {
				} else {
					$(this).addClass("tr-hover");
				}
			});
		});
	}
	
	var _selectedEditTr;
	function getSelectedCount(){
		if($("#datagrid-header-inner").length > 0){
			return getNewSelectedCount();
		}
		var selCount = 0;
		$("input[type='hidden'][name='formId']").each(function (i){
			$("#table_"+this.value).find("tbody tr").each(function(seq) {
				if($(this).find(":checkbox._selectdata").prop("checked")){
					selCount++;
					_selectedEditTr = $(this);
					if(selCount>1){
						return false;
					}
				}
			});
			if(selCount>1){
				return false;
			}
		});
		if(selCount == 0){
			utilsFp.confirmIcon(3,"","","", _select_info1,"","260","145");
			//utilsFp.alert(_select_info1);
		}else if(selCount>1){
			utilsFp.confirmIcon(3,"","","", _select_info2,"","260","145");
			//utilsFp.alert(_select_info2);
		}
		return selCount;
	}
	
	function dataAuthentication(){
		/*
		var selCount = 0;
		if("1"=="<c:out value='${mcIsOpenAuth}' />"){
		$(".datagrid-btable tbody tr").each(function(seq) {
			if($(this).find(":checkbox._selectdata").prop("checked")){
				var trId = $(this).find(":checkbox._selectdata").val();
				var trDataAuth = $("#DATA_AUTH_ID_"+trId).val();
				if(trDataAuth!="${sessionScope.mcDataAuth}"){
				    selCount = 1;
					return false; 
				}
			}
		});
		
		if(selCount==1){
			utilsFp.confirmIcon(1,"","","", _select_info3,"","260","145");
			return false;
		}else{
			return true;
		}
	  }else{
		  return true;
	  }
		*/
		
		var dataAuthObj = _getExtendObj();
	    if(!dataAuthObj.dataAuth.hasDataAuth){
	    	 utilsFp.confirmIcon(1,"","","", _select_info3,"","260","145");
			 return false;
	    }else{
	    	 return true;
	    }
		
	}

	
	/***
	 *
	 *获取各种扩展对象
	 *1.判断当前记录是否有权限
	 *2.待扩展。。。 
	 **/	
	function _getExtendObj(){
	
		var returnObj = {//返回对象
				//数据权限相关
				"dataAuth":{
						"hasDataAuth" : true,//默认都有数据权限
						"dataAuthMsg" : ""//数据权限相关的信息，如果有权限则为空
					}
			};
		var flag = "<%=CommMethodMc.is13VersionDataAuth()%>";
		var isOpenAuth = "<%=CommMethodMc.getIsOpenAuth()%>";
		//13版本的或者权限没开的不加此判断
		if(flag == "false" || isOpenAuth == "1"){
			
			var dataArray = [];//选中的无权限数据
			
			$(".datagrid-btable tbody tr").each(function(seq) {
				if($(this).find(":checkbox._selectdata").prop("checked")){
					var trId = $(this).find(":checkbox._selectdata").val();
					var trDataAuth = $("#DATA_AUTH_ID_"+trId).val();
					var _dataAu = top.$("#_mcDataAuth").val();//放在mainFrame.jsp中的值
					if(_dataAu == null || _dataAu == "" || _dataAu == undefined){
						_dataAu = "${sessionScope.mcDataAuth}";
					}
					if(trDataAuth!= _dataAu){
					    dataArray.push($(this).find("td").get(0).innerText);
					}
				}
			});
			
			if(dataArray != null && dataArray.length > 0){
				returnObj.dataAuth.hasDataAuth = false;
				var tempStr = "";
				var size = dataArray.length;
				for(var i = 0;i < size;i++){
					tempStr += dataArray[i];
					if(i < (size-1)){
						tempStr+="、";
					}
				}
				if(size > 1){
					returnObj.dataAuth.dataAuthMsg = "<dict:lang value="您没有第"/>"+tempStr+"<dict:lang value="条数据的操作权限"/>";
				}else{
					returnObj.dataAuth.dataAuthMsg = _select_info3;
				}			
			}
		}
		return returnObj;
	}

	function getNewSelectedCount(){
		var selCount = 0;
		$(".datagrid-btable tbody tr").each(function(seq) {
			if($(this).find(":checkbox._selectdata").prop("checked")){
				selCount++;
				if($(this).parent().hasClass("isChilds")){
					var parentTrId =  $(this).parents("table").attr("parantId");
					_selectedEditTr = $("#"+parentTrId);
				}else{
					_selectedEditTr = $(this);
				}
				if(selCount>1){
					return false;
				}
			}
		});
		if(selCount == 0){
			utilsFp.confirmIcon(1,"","","", _select_info1,"","260","145");
		}else if(selCount>1){
			utilsFp.confirmIcon(1,"","","", _select_info2,"","260","145");
		}
		return selCount;
	}
	<%-- 取得选中的记录集 --%>
	function getSelectedTrs(){
		var _selectedEditTrs=[];
		var index=0;
		$("input[type='hidden'][name='formId']").each(function (i){<%-- 注意，这里多个表单时需要改造 --%>
			$("#table_"+this.value).find("tbody tr").each(function(seq) {
				if($(this).find(":checkbox._selectdata").prop("checked")){
					_selectedEditTrs[index++] = $(this);
				}
			});
		});
		return _selectedEditTrs;
	}
	
	<%-- 取得选中的记录集，新列表用 --%>
	function getSelectedTrsNew(){
		var _selectedEditTrs=[];
		var index=0;
		$("input[type='hidden'][name='formId']").each(function (i){<%-- 注意，这里多个表单时需要改造 --%>
			$("#tbody_"+this.value).find("tr").each(function(seq) {
				if($(this).find(":checkbox._selectdata").prop("checked")){
					_selectedEditTrs[index++] = $(this);
				}
			});
		});
		return _selectedEditTrs;
	}

	function checkIsSelected(){
		if($("#datagrid-header-inner").length > 0){
			return checkNewIsSelected();
		}
		
		var finded = false;
		$("input[type='hidden'][name='formId']").each(function (i){
			$("#table_"+this.value).find("tbody tr").each(function(seq) {
				if($(this).find(":checkbox._selectdata").prop("checked")){
					finded = true;
					return false;
				}
			});
			if(finded){return false;}
		});
		if(!finded){
			//utilsFp.alert(_select_info1);
			utilsFp.confirmIcon(3,"","","", _select_info1,"","260","145");
		}
		return finded;
	}
	
	function checkNewIsSelected(){
		var finded = false;
		$(".datagrid-btable tbody tr").each(function(seq) {
			if($(this).find(":checkbox._selectdata").prop("checked")){
				finded = true;
				return false;
			}
		});
		if(!finded){
			utilsFp.confirmIcon(1,"","","", _select_info1,"","260","145");
		}
		return finded;
	}
	
	<%-- 组合字表单相关参数 备注： --%>
	function setSubData(formidFirstId,subFormIds,subRelColIds,relColVals,subColNo,subSortColOrder,isFreshAjax){
		if(null != subFormIds && ""!=subFormIds){
			_GLO_formidFirstId = formidFirstId;
			var subFormIdstr = subFormIds.split(",");
			var subRelColIdstr = subRelColIds.split(",");
			var relColValstr = relColVals.split(",");
			var tempMap = new Map();
			var paramList = "";
			for(var i=0;i<subFormIdstr.length;i++){

				for(var j = 0 ; j < subFormIdstr.length;j++ ){
					if(i != j && subFormIdstr[i] == subFormIdstr[j]){
						  paramList += "{\"subRelColId\":\""+subRelColIdstr[i]
						  + "\",\"relColVal\":\""+relColValstr[i]+"\"},";
						if(tempMap.get(subFormIdstr[i]) == null){
							tempMap.put(subFormIdstr[i],subFormIdstr[i]);
						}
					}
				}
			}
			paramList = paramList.substring(0,(paramList.length-1));
			var tempSubForm = "";
			for(var i=0,j=subFormIdstr.length;i<j;i++){
				_GLO_subFormId = subFormIdstr[i];
					if(null == _GLO_FORM_PAGE_MAP[_GLO_subFormId]){
						var pagAx = new Object();
						pagAx.isPage = false;
						_GLO_FORM_PAGE_MAP[_GLO_subFormId] = pagAx;
					}
					<%-- 还原排序图标 --%>
					$("#table_"+_GLO_subFormId).find("._sortImg").attr("src","${path}plf/page/fp/img/arrow03.png");
					_GLO_FORM_PAGE_MAP[_GLO_subFormId].formidFirstId=formidFirstId;
					_GLO_FORM_PAGE_MAP[_GLO_subFormId].subFormId=_GLO_subFormId;
					_GLO_FORM_PAGE_MAP[_GLO_subFormId].subRelColId=subRelColIdstr[i];
					_GLO_FORM_PAGE_MAP[_GLO_subFormId].relColVal=relColValstr[i];
					
					var _subSortColList = new Array();<%-- 要排序的字段 --%>
					var _subSortColOrderList = new Array();<%-- 要排序的字段升降序 --%>
					_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColList=_subSortColList;
					_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderList=_subSortColOrderList;
					_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr="";
					_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr="";
					
					if(tempMap.get(_GLO_subFormId) != null && tempMap.get(_GLO_subFormId) == _GLO_subFormId){
						if(tempSubForm.indexOf(_GLO_subFormId) == -1){
							isFreshAjax==false ? _listSubDataAx(_GLO_subFormId,paramList) : listChildAjaxTable(_GLO_subFormId,paramList);
							tempSubForm += subFormIdstr[i]+";";
						}else{
							continue;
						}

					}else{
						isFreshAjax==false ? _listSubDataAx(_GLO_subFormId,"") : listChildAjaxTable(_GLO_subFormId,"");
					}
				}
		}
		
	}
	
	<%-- 显示子表单关联的数据记录 --%>
	function showSubFormLs(formidFirstId,subFormIds,subRelColIds,relColVals,subColNo,subSortColOrder){
		setSubData(formidFirstId,subFormIds,subRelColIds,relColVals,subColNo,subSortColOrder,false);
	}
	
	
	function _initSubSortData(formId,subColNo,thisObj,source){
	    if("undefined" == typeof _GLO_subFormId){return;}
			var _subSortColList = _GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColList;
			var oldOrder=0;
			if(null !=_subSortColList && _subSortColList.length>0){
				for(var i=0,j=_subSortColList.length;i<j;i++){
					if(_subSortColList[i] == subColNo){
						oldOrder = _GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderList[i];
						_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColList.splice(i,1);
						_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderList.splice(i,1);
						break;
					}
				}
			}
			if(0 == oldOrder){
				oldOrder++;
				_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColList.unshift(subColNo);
				_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderList.unshift(oldOrder);
				$(thisObj).attr("src","${path}plf/page/fp/img/arrow01.png");
			}else if(1 == oldOrder){
				oldOrder++;
				_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColList.unshift(subColNo);
				_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderList.unshift(oldOrder);
				$(thisObj).attr("src","${path}plf/page/fp/img/arrow02.png");
			}else{
				$(thisObj).attr("src","${path}plf/page/fp/img/arrow03.png");
			}
			var cols="";
			var colOrders="";
			for(var i=0,j=_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColList.length;i<j;i++){
	    	cols = cols + _GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColList[i];
	    	colOrders = colOrders + _GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderList[i];
	    	if(i<(j-1)){
	    		cols = cols + ",";  
	    		colOrders = colOrders + ",";  
	    	}
			}
			_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr=cols;
			_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr=colOrders;
			source == true ? listChildAjaxTable(formId,"") : _listSubDataAx(formId,"");
	}
	
	
	<%-- 子表单排序 --%>
	function _subSortData(formId,subColNo,thisObj){
		_initSubSortData(formId,subColNo,thisObj,isAjaxTable(thisObj));
		
	}
	<%-- 列表子表单数据 --%>
	function _listSubDataAx(formId,paramList){
		util.showLoading();
		isQuery= true;
		var data = "";
		if(paramList != null && paramList != ""){
			data = {"page.currentPage":_GLO_FORM_PAGE_MAP[formId].currentPage,"page.pageRecord":_GLO_FORM_PAGE_MAP[formId].pageRecord,"paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,"paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,"paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,"paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,"paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,"paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr,"paramList":paramList};
		}else {
			data = {"page.currentPage":_GLO_FORM_PAGE_MAP[formId].currentPage,"page.pageRecord":_GLO_FORM_PAGE_MAP[formId].pageRecord,"paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,"paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,"paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,"paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,"paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,"paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr};
		}
		var url = "${path}buss/bussModel_listSubDataAx.ms?exeid=<c:out value='${exeid}' />";
	    jQuery.ajax({
			type: "POST",
		    dataType: "json",
		    url: url,
		    data:data,
				success: function(data){
				$("#selectAll_"+_GLO_FORM_PAGE_MAP[formId].subFormId).prop("checked",false);
				if(null == data){return;}
				var subTbodyJq = $("#tbody_"+_GLO_FORM_PAGE_MAP[formId].subFormId);
				subTbodyJq.html(data.ajaxPage.tableData);<%-- 后端组合好tr数据集 --%>				
				var axTableTrJs =$(subTbodyJq).find("tr");
				_toClickColorMap(axTableTrJs,"table_"+_GLO_FORM_PAGE_MAP[formId].subFormId);<%-- 重新设置设置table点击行颜色 --%>
				_tongLineColor(axTableTrJs);<%-- 设置table隔行换颜色 --%>
				isQuery= false;
				if(data.ajaxPage.page){
					showPageBar(data.ajaxPage,_GLO_FORM_PAGE_MAP[formId].subFormId);
				}else{
					hidePageBar(_GLO_FORM_PAGE_MAP[formId].subFormId);
				}
				util.closeLoading();
			},
			error: function(XMLHttpRequest,textStatus){
				if(XMLHttpRequest.status != 401){<%-- 如果是无权限，则这里不再弹出提示窗口 --%>
					utilsFp.alert("error:"+XMLHttpRequest);
				}
				isQuery= false;
				util.closeLoading();
			}
		});
	}

	<%--  *删除数组指定下标或指定对象  --%>
	Array.prototype.remove=function(obj){
		for(var i =0;i <this.length;i++){
		var temp = this[i]; 
		if(!isNaN(obj)){ 
		temp=i; 
		} 
		if(temp == obj){
		for(var j = i;j <this.length;j++){ 
		this[j]=this[j+1]; 
		} 
		this.length = this.length-1; 
		} 
		} 
	} 


	var _sortColList = new Array();<%-- 要排序的字段 --%>
	var _sortColOrderList = new Array();<%-- 要排序的字段升降序 --%>
	function initSort(){
		var oldSortCol = "<c:out value='${sortColMap.sortCol}' />";
		var oldSortColOrder = "<c:out value='${sortColMap.sortColOrder}' />";
		if("" != oldSortCol){
			var oldSortCols = oldSortCol.split(",");
			var oldSortColOrders = oldSortColOrder.split(",");
			for(var i=0,j=oldSortCols.length;i<j;i++){
				if("" != oldSortCols[i]){
					_sortColList.push(oldSortCols[i]);
					_sortColOrderList.push(oldSortColOrders[i]);
				}
			}
		}
	}
	initSort();
	function _initSortData(thisObj,COL_NO){
		var oldOrder=0;
		if(null !=_sortColList && _sortColList.length>0){
			for(var i=0,j=_sortColList.length;i<j;i++){
				if(_sortColList[i] == COL_NO){
					oldOrder = _sortColOrderList[i];
					//_sortColList.remove(i);
					//_sortColOrderList.remove(i);
					_sortColList.splice(i,1);
					_sortColOrderList.splice(i,1);
					break;
				}
			}
		}
		if(0 == oldOrder){
			oldOrder++;
			_sortColOrderList.unshift(oldOrder);	
			_sortColList.unshift(COL_NO);
		}else if(1 == oldOrder){
			oldOrder++;
			_sortColOrderList.unshift(oldOrder);
			_sortColList.unshift(COL_NO);
		}else{
		}
		var cols="";
		var colOrders="";
		for(var i=0,j=_sortColList.length;i<j;i++){
    	cols = cols + _sortColList[i];
    	colOrders = colOrders + _sortColOrderList[i];
    	if(i<(j-1)){
    		cols = cols + ",";  
    		colOrders = colOrders + ",";  
    	}
		}
		$("#_sortCol").val(cols);
		$("#_sortColOrder").val(colOrders);
		<%-- //alert(cols+" -------  "+$("#_sortColOrder").val()); --%>
	    searchList("");
	}
	
	function isAjaxTable(thisObj){
		var source = false;
		if($(thisObj).parents(".datagrid-title-ajax").length>0){
			source = true;
		}
		return source;
	}
	
	function _sortData(thisObj,COL_NO){
		if($(thisObj).parents(".isChildsTitle").length > 0){
			var formId = $(thisObj).parents(".panel-ajax").prev().val();
			_subSortData(formId,COL_NO,thisObj);
		}else{
			 var tableType = isAjaxTable(thisObj);
			 if(tableType){
				 _initAjaxSortData(thisObj,COL_NO);
			 }else{
				 _initSortData(thisObj,COL_NO);
			 }
		}
	}
	
	var arrCol = [];
	function _initAjaxSortData(thisObj,COL_NO){
		var nextSortVal;
		var sortVal = $(".SORT_"+COL_NO).val();
		if(sortVal=="3"){
			nextSortVal = "1";
		}else if(sortVal=="1"){
			nextSortVal = "2";
		}else{
			nextSortVal="3";
		}
		$(".SORT_"+COL_NO).val(nextSortVal);
		$(thisObj).attr("src","${path}plf/page/fp/img/arrow0"+nextSortVal+".png");
		if(nextSortVal=="3"){
			arrCol.splice($.inArray(COL_NO,arrCol),1);
		}else{
			if($.inArray(COL_NO,arrCol)>-1){
				arrCol.splice($.inArray(COL_NO,arrCol),1);
			}
			arrCol.unshift(COL_NO);
		}
		var colOrders="";
		$.each(arrCol,function(i,v){
			colOrders += $(".SORT_"+v).val()+",";
		});
		var cols = arrCol.toString();
		$("#_sortCol").val(cols);
		$("#_sortColOrder").val(colOrders);
		var formId = $("#formId1").val();
		listAjaxTable(formId);
	}
	
	<%-- 取得列表单元格对象 --%>
	function getListColObj(thisObj){
		return $(thisObj);
	}
	
	<%-- 根据行号列号取得单元格对象 --%>
	<%-- tableId:表ID，seqRow：行序号，seqCol:列号 --%>
	function getListColObjBySeq(tableId,seqRow,seqCol){
		var res = $($("#tbody_"+tableId+" tr").get(seqRow-1)).find("td").get(seqCol-1);
		return $(res);
	}
	
	<%-- 获取当前行的tr对象列表 --%>
	<%-- tableId:表ID，seqRow：行序号，seqCol:列号 --%>
	function getListTrObj(thisObj){
		var tdArr = new Array();
		$(thisObj).find("td").each(function(seq){
			tdArr[seq]=$(this);
		});
		return tdArr;
	}
	
	//显示更多搜索条件
	function showMoreSearch(){
    	$(".hideTrCls").show();
    	$(".chosen-container").css("width","100%");
        $('.search-box').removeClass('show');		
	}
	
	function clearSelectOrder(){
    	$("#_sortCol").val('');
		$("#_sortColOrder").val('');	
	}
	
	//隐藏/显示多搜索条件
	function toggleMoreSearch(){
			if( $("#searchParaShowState").val() != "1"){
				$('.search-box').addClass('show');
				$(".hideTrCls").hide();				
			}

	        $('.search-box .more').click(function(){
	            if(!$('.search-box').hasClass('show')){
	                //$('.search-box .group').show();
	                if($("#datagrid-view-kz").length > 0){
	                	$(".dlist").css("height","");
	                }
	                $(".hideTrCls").hide();
	                $('.search-box').addClass('show');
	            }else{
	            	if($("#datagrid-view-kz").length > 0){
	            		$(".dlist").css("height", window.screen.height+100);
	                }
	            	showMoreSearch();
	            }
	        });
	}
	
	//查询列表打印设置
	function printset_1(print_type){
		var print_div='';
		var print_htm='';
		var print_htm_old='';
		
		var print_div_='';
		
		//var print_type=document.getElementById('print_type').value;
		if(print_type=='1'){
			//打印
			print_div_='datagrid-view';
			print_div=$('#datagrid-view');
			
		}
		if(print_type=='2'){
			//打印全部
			print_div_='datagrid-view-print';
			print_div=$('#datagrid-view-print');
			
		}
		
		if(print_div==null){
			utilsFp.alert('获取打印内容失败');
			return false;
		}
		
		print_htm_old=print_div.html();//备份
	
	    //设置列是否打印
		$("#printset_tab_new input[type='checkbox']").each(function(){
			var col_name=$(this).attr("name");
				
			if ($(this).attr("checked")) {
	        	$("#"+print_div_+" td[name='noprintset_"+col_name+"']").each(function(){
					$(this).removeClass("no-print");
					
				});
			
	        }else{
	        	//设置不打印列
	        	$("#"+print_div_+" td[name='noprintset_"+col_name+"']").each(function(){
					$(this).addClass(" no-print");
					
				});
	        	
	        }
					
		});
		
		//设置打印列宽
		var flag=false;
		$("#printset_tab_new input[type='text']").each(function(){
			var col_name=$(this).attr("name");
			var title_name=$(this).attr("title_name");
			
			var col_value=$(this).val();
			
			var is_print=false;
			$("#printset_tab_new input[type='checkbox']").each(function(){
				$("#printset_tab_new input[name='"+col_name+"']").each(function(){
					if ($(this).attr("checked")) {
						is_print=true;
					}
						
				});
					
			});
			
			//勾选了打印
			if(is_print){
				if (col_value==null || col_value=='') {
					utilsFp.alert(title_name+'打印列宽不能为空');
					flag=true;
					return false;
				}
				
				if (isNaN(col_value)) {
					utilsFp.alert(title_name+'打印列宽只能是数字');
					flag=true;
					return false;
				}
				
				$("#"+print_div_+" td[name='noprintset_"+col_name+"']").each(function(){
					$(this).width(col_value);
						
				});
				
			}
				
		});
		
		if(flag){
			return false;
		}
		
		print_htm=print_div.html();
			
		if(print_htm==''){
			utilsFp.alert('获取打印内容失败');
			return false;
		}
		
		print_div.html(print_htm);
		
        //$("#printset_div").parent().hide();//隐藏打印设置div
					
		print_div.print({
			noPrintSelector:'.no-print',//不打印class
			deferred: $.Deferred(function() {
			    setTimeout(function() {
			       //alert('打印完成');
			       print_div.html(print_htm_old);//打印完成 回滚打印设置div内容
			       
			    }, 3000);
			})//监听打印完成
		
		});//打印div
		
	}	
	
	//扩展列表打印设置
	function printset_3(print_type){
		var print_div='';
		var print_htm='';
		var print_htm_old='';
		
		var print_div_='';
		
		//var print_type=document.getElementById('print_type').value;
		if(print_type=='1'){
			//打印
			print_div_='datagrid-view-kz';
			print_div=$('#datagrid-view-kz');
			
		}
		if(print_type=='2'){
			//打印全部
			print_div_='datagrid-view-kz-print';
			print_div=$('#datagrid-view-kz-print');
			
		}
		
		if(print_div==null){
			utilsFp.alert('获取打印内容失败');
			return false;
		}
		
		print_htm_old=print_div.html();//备份
	
	    //设置列是否打印
		$("#printset_tab_new input[type='checkbox']").each(function(){
			var col_name=$(this).attr("name");
				
			if ($(this).attr("checked")) {
	        	$("#"+print_div_+" td[name='noprintset_"+col_name+"']").each(function(){
					$(this).removeClass("no-print");
					
				});
			
	        }else{
	        	//设置不打印列
	        	$("#"+print_div_+" td[name='noprintset_"+col_name+"']").each(function(){
					$(this).addClass(" no-print");
					
				});
	        	
	        }
					
		});
		
		//设置打印列宽
		var flag=false;
		$("#printset_tab_new input[type='text']").each(function(){
			var col_name=$(this).attr("name");
			var title_name=$(this).attr("title_name");
			
			var col_value=$(this).val();
			
			var is_print=false;
			$("#printset_tab_new input[type='checkbox']").each(function(){
				$("#printset_tab_new input[name='"+col_name+"']").each(function(){
					if ($(this).attr("checked")) {
						is_print=true;
					}
						
				});
					
			});
			
			//勾选了打印
			if(is_print){
				if (col_value==null || col_value=='') {
					utilsFp.alert(title_name+'打印列宽不能为空');
					flag=true;
					return false;
				}
				
				if (isNaN(col_value)) {
					utilsFp.alert(title_name+'打印列宽只能是数字');
					flag=true;
					return false;
				}
				
				$("#"+print_div_+" td[name='noprintset_"+col_name+"']").each(function(){
					$(this).width(col_value);
						
				});
				
			}
	
		});
		
		if(flag){
			return false;
		}
		
		print_htm=print_div.html();
			
		if(print_htm==''){
			utilsFp.alert('获取打印内容失败');
			return false;
		}
		
		print_div.html(print_htm);
		
        //$("#printset_div").parent().hide();//隐藏打印设置div
					
		print_div.print({
			noPrintSelector:'.no-print',//不打印class
			deferred: $.Deferred(function() {
			    setTimeout(function() {
			       //alert('打印完成');
			       print_div.html(print_htm_old);//打印完成 回滚打印设置div内容
			       
			    }, 3000);
			})//监听打印完成
		
		});//打印div
		
	}
	
	//异步查询列表 打印设置
	function printset_17(print_div_,print_type){
		var print_div='';
		var print_htm='';
		var print_htm_old='';
				
		//var print_type=document.getElementById('print_type').value;
		if(print_type=='1'){
			//打印
			$("div[id^='datagrid-view-ajax']").each(function(){  
    			print_div=$(this);
    		});
			
		}
		if(print_type=='2'){
			//打印全部
			print_div_=print_div_+"-print";
			$("div[id^='tt-datagrid-view-ajax-print']").each(function(){  
    			print_div=$(this);
    		});
			
		}
		
		if(print_div==null){
			utilsFp.alert('获取打印内容失败');
			return false;
		}
		
		print_htm_old=print_div.html();//备份
	
	    //设置列是否打印
		$("#printset_tab_new input[type='checkbox']").each(function(){
			var col_name=$(this).attr("name");
				
			if ($(this).attr("checked")) {
	        	$("#"+print_div_+" td[name='noprintset_"+col_name+"']").each(function(){
					$(this).removeClass("no-print");
					
				});
			
	        }else{
	        	//设置不打印列
	        	$("#"+print_div_+" td[name='noprintset_"+col_name+"']").each(function(){
					$(this).addClass(" no-print");
					
				});
	        	
	        }
					
		});
		
		//设置打印列宽
		var flag=false;
		$("#printset_tab_new input[type='text']").each(function(){
			var col_name=$(this).attr("name");
			var title_name=$(this).attr("title_name");
			
			var col_value=$(this).val();
			
			var is_print=false;
			$("#printset_tab_new input[type='checkbox']").each(function(){
				$("#printset_tab_new input[name='"+col_name+"']").each(function(){
					if ($(this).attr("checked")) {
						is_print=true;
					}
						
				});
					
			});
			
			//勾选了打印
			if(is_print){
				if (col_value==null || col_value=='') {
					utilsFp.alert(title_name+'打印列宽不能为空');
					flag=true;
					return false;
				}
				
				if (isNaN(col_value)) {
					utilsFp.alert(title_name+'打印列宽只能是数字');
					flag=true;
					return false;
				}
				
				$("#"+print_div_+" td[name='noprintset_"+col_name+"']").each(function(){
					$(this).width(col_value);
						
				});
			
			}
					
		});
		
		if(flag){
			return false;
		}
		
		print_htm=print_div.html();
			
		if(print_htm==''){
			utilsFp.alert('获取打印内容失败');
			return false;
		}
		
		print_div.html(print_htm);
		
        //$("#printset_div").parent().hide();//隐藏打印设置div
					
		print_div.print({
			noPrintSelector:'.no-print',//不打印class
			deferred: $.Deferred(function() {
			    setTimeout(function() {
			       //alert('打印完成');
			       print_div.html(print_htm_old);//打印完成 回滚打印设置div内容
			       
			    }, 3000);
			})//监听打印完成
		
		});//打印div
		
	}
	
	//打印设置 宽度默认值初始化
	function printset_defwidth(div_title){
		$("#printset_tab_new input[type='text']").each(function(){
			var col_name=$(this).attr("name");
			
			var col_width='';
			$("#"+div_title+" td[name='noprintset_"+col_name+"']").each(function(){
				col_width=$(this).width();
					
			});
			
			if(col_width!=null && col_width!=''){
				$(this).val(col_width);
			}
		
		});
		
	}
	
	$(function(){
		//_currentFrame = top.$("#"+window.frameElement.name)[0].contentWindow.name;
		if(window.frameElement!=null && top.$("#"+window.frameElement.name) != null && top.$("#"+window.frameElement.name).length > 0 && 
					top.$("#"+window.frameElement.name)[0].contentWindow != undefined){
				 _currentFrame = top.$("#"+window.frameElement.name)[0].contentWindow.name;
				 _currentFrameId = window.frameElement.id;
			}else{
				_currentFrameId="";
			}
		
		if(document.forms.searchForm != null && null == document.getElementById("_sortCol")){
			var inputEleSorCol = $('<input type="hidden" id="_sortCol" name="sortColMap.sortCol" value="<c:out value='${sortColMap.sortCol}' />"  />');
			$(document.forms.searchForm).append(inputEleSorCol);
			var inputEleSorColOrder = $('<input type="hidden" id="_sortColOrder" name="sortColMap.sortColOrder" value="<c:out value='${sortColMap.sortColOrder}' />"  />');
			$(document.forms.searchForm).append(inputEleSorColOrder);
		}
		$(".search-box .more").hide();
		/*toggleMoreSearch();			
	
        $(".search-box .more").click(function(){
            if($("#searchParaShowState").val() == "" || $("#searchParaShowState").val() == "0"){
            	$("#searchParaShowState").val("1");
            }else{
            	$("#searchParaShowState").val("0");
            }
          });
    		//判断是否隐藏搜索框
    		if($("#searchParaNull").val()=="0"){
    			$(".search-box").hide();
    		}else if($("#searchParaNull").val() <= "3"){
    			$(".search-box .more").hide();
    		}else{
    			if($("#searchParaShowState").val() == "1"){
					showMoreSearch();
    			}
    		}*/
    		
    		initBtnList();
	});

//-->
</script>