var Public = {
		bootstrapTable: bootstrapTable,
		/*columns: function () {
			var colums = new Array([{field: 'userId', title: 'ID'}, {field: 'userName', title: '账号'},{field: 'nickName', title: '用户名',},]);
			console.log(colums)
			return colums;
		}*/
};
var callBackN;
function bootstrapTable(id, url, columns, queryParams, responseHandler, onLoadSuccess, height) {
	$('#' + id).bootstrapTable({
		method: 'post',
		url: url,
		height: height == null ? 700 : height ,
		toolbar: '#td2',					//按钮组id
		contentType : 'application/x-www-form-urlencoded',//
		pageNumber: 1,                      //初始化加载第一页，默认第一页
	    pageSize: 14,                       //每页的记录行数（*）
		showPaginationSwitch: true,		    //显示数据条数选择框
	    showRefresh: true,                  //是否显示刷新按钮
	    search: false,						//显示搜索按钮
	    pagination: true, 					//设置表格底部显示分页条
		showColumns: true,
		striped: true,						//隔行颜色变动
		showToggle: true,
		showPaginationSwitch: true,			//显示 数据条数选择框
		//showColumns: true,
		minimumCountColumns: 6,				//当列数小于此值时，将隐藏内容列下拉框
	    sidePagination: 'server',			//分页在服务端处理
	    pageList: [5, 10, 15, 25, 50, 100],      //可供选择的每页的行数（*）
		columns: columns,
		queryParams: queryParams,			//处理请求参数
		responseHandler: responseHandler,	//处理返回参数
		onLoadSuccess: onLoadSuccess,		//处理返回的json数据
	});
}

//传给后台参数
function queryParams(params) {
	var temp = {
		//type: 1,
		pageSize: params.limit,   //页面大小
		pageNum: params.offset/params.limit + 1,  //页码  后台有插件计算
	};
	return temp;
}

//请求返回参数处理
function responseHandler(data) {
	if(data.totalRow > 0) {
		return {
			'rows': data.list,
			'total': data.totalRow
		};
	} else {
		return {
			'rows': [],
			'total': 0
		};
	}
}

// 强制不换行显示
function formatter(value) {
	if (value == null) value = '';
	return '<span style="white-space: nowrap ">' + value + '</span>';
}

// 查询新刷新表格
function find() {
	$("#table").bootstrapTable('refresh');
}

function getCheckData() {
	var data = $('#table').bootstrapTable('getSelections');
	return data;
}

function id_ajax(path,id,callback,async){
	$.ajax({
		type : "POST",
		dataType : "json",
		async: async==null?true:false,
		url : path,
		data : $('#' + id + ' form').serialize(),
		success :callback,
		error: null
	});
}

function json_ajax(path, data, callback){
	this.callBackN=callback;
	$.ajax({
		type : "GET",
		dataType : "json",
		async: true,
		url : path,
		data : data,
		success :callback,
		error: null
	});
}

function defaultCallback(data) {
	if (data.result == 200) {
		alert('操作成功');
		$("#table").bootstrapTable('refresh'); // 操作成功后刷新表格
		return''
	}
	alert('操作失败,' + data.object);
}

/**
 * 根据id清除from表单的值
 * @param id
 */
function clearFrom(id){
	$(':input','#' + id)
		.not(':button, :submit, :reset, :hidden')
		.val('')
		.removeAttr('checked')
		.removeAttr('selected');
}

function ajaxCallBack(data){
	alert();
	callback(data);
}
/**
 * serialize转成JSONObject
 * @returns {{}}
 */
$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name] !== undefined) {
			if (!o[this.name].push) {
				o[this.name] = [o[this.name]];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
}

/**
 * 重写alert();
 */
window.alert = function(name){
    var iframe = document.createElement("IFRAME");
    iframe.style.display="none";
    iframe.setAttribute("src", 'data:text/plain,');
    document.documentElement.appendChild(iframe);
    window.frames[0].window.alert(name);
    iframe.parentNode.removeChild(iframe);
};