<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="查看企业用户" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="layui" value="1" />
</jsp:include>
	<meta charset="UTF-8">
    <title>listUsers</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        ul{
            list-style: none;
        }
        .search-box{
            padding: 6px;
            margin: 5px;
            background-color: #e4eff9;
            border: 1px solid #A8C7CE;
            color:#116dae;
            font-size: 12px;
        }
        .b{
            cursor: pointer;
            width: 66px;
            height: 24px;
            color: #333333;
            font-size: 12px;
            line-height: 24px;
            background-color: #efefef;
            border-radius: 3px;
            border: 1px solid #dddddd;
            outline: none;
        }
        .btn{
            cursor: pointer;
            width: 66px;
            height: 24px;
            color: #da4901;
            font-size: 12px;
            line-height: 24px;
            background-color: #ffd989;
            border-radius: 3px;
            border: 1px solid #dfa158;
            outline: none;
        }
        .user-table{
            margin: 0 5px;
            width:calc(100% - 10px);
            border-right: 1px solid #A8C7CE;
            border-bottom: 1px solid #A8C7CE;
        }
        .user-table td{
            text-align: center;
            border-left: 1px solid #A8C7CE;
            border-top: 1px solid #A8C7CE;
            padding: 5px;
            font-size: 12px;
            color:#333333;
        }
        .user-table tr>td:first-child{
            width: 50px;
            vertical-align: middle;
        }
        .user-table tr>td:first-child>input{
            margin-top: 3px;
        }
        .first-line{
            background-color: #e4eff9;
        }
        .user-table img{
            width: 50px;
            height: 50px;
        }
        .pager{
            text-align: right;
            margin-top: 10px;
            margin-right: 5px;
        }
        .pager li{
            vertical-align: middle;
            height: 30px;
            line-height: 30px;
            margin-left: 5px;
        }
        .pager li,.pager span{
            font-size: 12px;
            color:#333333;
        }
        .pager input[type=text]{
            color:#316AC5;
            font-size: 12px;
        }
        .page-box{
            display: inline-block;
            overflow: hidden;
        }
        .page-box>li{
            float: left;
        }
        .curPage,.pageSize{
            width: 20px;
            text-align: center;
        }
        .pager span.light{
            color:#316AC5;
        }
        .page-box>li.jump{
            height: 25px;
        }
        .jump>span{
            display: inline-block;
            height: 100%;
            line-height: 18px;
            border: 1px solid #cccccc;
            color:#444444;
            padding: 2px 5px;
            box-sizing: border-box;
            cursor:pointer;
            margin-left: 3px;
        }
        .jump>span.disable{
            cursor: not-allowed;
            color:#888888;
        }
    </style>
	
</head>
<body>
	<div class="all">
		
		<div class="search-box">
    微信昵称：<input type="text" class="nickname" name="nickname">
    <input type="button" value="查询" class="search btn">
    <!--  
    <input type="button" value="全选" class="b">
    -->

    <input type="hidden" id="jobType" name="wxUserPageVO.jobType" value="${param['wxUserPageVO.jobType']}" >
    <input type="hidden" id="jobId" name="wxUserPageVO.jobId" value="${param['wxUserPageVO.jobId']}" >
    <input type="hidden" id="appid" name="wxPageVO.wxPlatform.appid" value="${wxPageVO.wxPlatform.appid}" >
    <input type="hidden" id="appsecret" name="wxPageVO.wxPlatform.appsecret" value="${wxPageVO.wxPlatform.appsecret}" >
    <input type="hidden" id="templateid" name="wxPageVO.wxPlatform.templateId" value="${wxPageVO.wxPlatform.templateId}" >
    <input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
	<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
</div>
<div class="table-box">
    <table class="user-table" cellspacing="0" cellpadding="0">
        <thead>
        <tr class="first-line">
            <td ><input class="allCheckbox" type="checkbox"></td>
            <td>OPENID</td>
            <td>昵称</td>
            <td>性别</td>
            <td>头像</td>
            <td>国家</td>
            <td>省份</td>
            <td>城市</td>
        </tr>
        </thead>
        
    </table>
</div>
<div class="pager">
    <ul class="page-box">
        <li>共<span class="light">10</span>条记录<span class="light">4</span>页,</li>
        <li> 当前第 <input type="text" class="curPage"> 页, </li>
        <li>每页 <input type="text" class="pageSize"> 条</li>
        <li class="jump">
            <span class="disable">首页</span>
            <span>上一页</span>
            <span>下一页</span>
            <span>尾页</span>
        </li>
    </ul>
</div>
<!--  
<div style="text-align: center;">
    <input type="button" class="btn" value="确定" onclick="closeWindow()">
</div>
-->

<script>
    var table={
        data:[],
        page:1,
        pageSize:10,
        query:function () {
            var nickname=$('.nickname').val();
            var r=!nickname?this.data:[];
            if(nickname){
                for (var i = 0; i < this.data.length; i++) {
                    var obj = this.data[i];
                    if(obj.nickname.indexOf(nickname)!=-1){
                        r.push(obj);
                    }
                }
            }
            this.buildTable(r);
        },
        init:function () {
        	var task_id="${param['wxUserPageVO.jobId']}";
            $.ajax({
                url:'${path }wx/wxAction_getUserList2.ms?paramMap.task_id='+task_id,
                type:'GET',
                dataType:'json',
                data: {
                	"wxPageVO.wxPlatform.appid":$("#appid").val(),
                	"wxPageVO.wxPlatform.appsecret":$("#appsecret").val()
                },
                success:function (res) {
                    //table.data=res.ajaxMap.users;
                    table.data=table.data.concat(res.ajaxMap.users);
                    table.buildTable(res.ajaxMap.users);
                }
            });
            $(document).on('click','.allCheckbox',function () {
                var me=this;
                var checked=$(this).is(':checked');
                $('.user-table>tbody>tr').each(function () {
                    $(this).children(':eq(0)').children().prop('checked',checked);
                    table.checkUser($(this).attr('openid'),checked);
                })
            })/* .on('click','.user-table input[type=checkbox]',function(e){
              $(this).prop(!$(this).is(':checked'));
            }) */.on('click','.user-table>tbody>tr',function (e) {
                var allChecked=true;
                var checkbox=$(this).children(':eq(0)').children();
                var isInput=$(e.target).attr('type')=='checkbox';
          
                isInput||checkbox.prop('checked',!checkbox.is(':checked'));
                $('.user-table>tbody>tr').each(function () {
                    var c=$(this).children(':eq(0)').children().is(':checked');
                    if(!c){
                        allChecked=false;
                        return false;
                    }
                });
                table.checkUser($(this).attr('openid'),checkbox.is(':checked'));
                $('.allCheckbox').prop('checked',allChecked);
            }).on('click','.search',function () {
                var val=$(this).prev().val();
                table.page=1;
                table.query();
            }).on('click','.b',function () {
                $(this).toggleClass('btn');
                table.checkAll($(this).hasClass('btn'));
                table.query();

            })
        },
        buildTable:function (arr) {
            var rownum=(table.page-1)*table.pageSize;
            var newArr=arr.splice(rownum,rownum+table.pageSize);
            var allCheck=true;
            for (var i = 0; i < newArr.length; i++) {
                var obj = newArr[i];
                if(!obj.checked){
                    allCheck=false;
                    break;
                }
            }
            var html='<table class="user-table" cellspacing="0" cellpadding="0">\n' +
                '    <thead>\n' +
                '        <tr class="first-line">\n' +
                '            <td ><input class="allCheckbox" type="checkbox" '+(allCheck?'checked':'')+'></td>\n' +
                
                '            <td>OPENID</td>\n' +
                
                '            <td>昵称</td>\n' +
                '            <td>性别</td>\n' +
                '            <td>头像</td>\n' +
                '            <td>国家</td>\n' +
                '            <td>省份</td>\n' +
                '            <td>城市</td>\n' +
                '        </tr>\n' +
                '    </thead>\n' +
                '    <tbody>';
            for (var j = 0; j < newArr.length; j++) {
                obj = newArr[j];
                html+='<tr openid="'+obj.openid+'">\n' +
                    '          <td><input class="checkbox" type="checkbox" '+(obj.checked?'checked':'')+'></td>\n' +
                    
                    '            <td>'+obj.openid+'</td>\n' +
                    
                    '            <td>'+obj.nickname+'</td>\n' +
                    '            <td>'+(obj.sex==1?'男':'女')+'</td>\n' +
                    '            <td><img src="'+obj.headimgurl+'" alt=""></td>\n' +
                    '            <td>'+obj.country+'</td>\n' +
                    '            <td>'+obj.province+'</td>\n' +
                    '            <td>'+obj.city+'</td>\n' +
                    '        </tr>'
            }
            html+='</tbody>\n' +
                '</table>';
            $('.table-box').empty().append(html);
            pager.build(arr);
        },
        checkUser:function (openid,cOrNot) {
            for (var i = 0; i < this.data.length; i++) {
                var obj = this.data[i];
                if(obj.openid==openid){
                    obj.checked=cOrNot;
                    break;
                }
            }
        },
        checkAll:function (cOrNot) {
            for (var i = 0; i < this.data.length; i++) {
                var obj = this.data[i];
                obj.checked=cOrNot;
            }
        },
        getCheckedUsers:function () {
            var r=[];
            for (var i = 0; i < this.data.length; i++) {
                var obj = this.data[i];
                if(obj.checked){
                    r.push(obj);
                }
            }
            return r;
        }
    };
    var pager={
        build:function (arr) {
            var totalPage=Math.ceil(arr.length/table.pageSize);
            var html='<li>共<span class="light">'+arr.length+'</span>条记录<span class="light">'+totalPage+'</span>页,</li>\n' +
                '        <li> 当前第 <input type="text" page="'+table.page+'" value="'+table.page+'" class="curPage"> 页, </li>\n' +
                '        <li>每页 <input type="text" pageSize="'+table.pageSize+'" value="'+table.pageSize+'" class="pageSize"> 条</li>\n' +
                '        <li class="jump">\n' +
                '            <span class="'+(table.page==1?'disable':'')+'">首页</span>\n' +
                '            <span class="'+(table.page==1?'disable':'')+'">上一页</span>\n' +
                '            <span totalPage="'+totalPage+'" class="'+(table.page==totalPage?'disable':'')+'">下一页</span>\n' +
                '            <span totalPage="'+totalPage+'" class="'+(table.page==totalPage?'disable':'')+'">尾页</span>\n' +
                '        </li>';
            $('.page-box').empty().append(html);
        },
        init:function () {
            $(document).on('blur','.curPage',function () {
                var val=parseInt($(this).val(),10);
                if(!val){
                    $(this).val($(this).attr('page'));
                    return;
                }
                table.page=val;
                table.query();
            }).on('blur','.pageSize',function () {
                var val=parseInt($(this).val(),10);

                if(!val){
                    $(this).val($(this).attr('pageSize'));
                    return;
                }
                table.page=1;
                table.pageSize=val;
                table.query();
            }).on('click','.jump>span:eq(0):not(.disable)',function () {
                table.page=1;
                table.query();
            }).on('click','.jump>span:eq(1):not(.disable)',function () {
                table.page=Math.max(table.page-1,1);
                table.query();
            }).on('click','.jump>span:eq(2):not(.disable)',function () {
                table.page=Math.min(table.page+1,$(this).attr('totalPage'));
                table.query();
            }).on('click','.jump>span:eq(3):not(.disable)',function () {
                table.page=parseInt($(this).attr('totalPage'),10);
                table.query();
            })
        }
    }
    table.init();
    pager.init();

    function closeWindow() {
      var has_checked=false;
      $('.checkbox').each(function(){
        if($(this).is(':checked')){
          has_checked=true;
          return false;
        }
      })
      
      if(!has_checked) {
        util.alert("请选择要配置的微信对象");
        return;
      } 
    	
    	var jobType="${param['wxUserPageVO.jobType']}";
    	var jobId="${param['wxUserPageVO.jobId']}";
    	
        var p={
        	"wxUserPageVO.wxusers":JSON.stringify(table.getCheckedUsers()), //users = []
        	"wxUserPageVO.jobType":jobType ,
        	"wxUserPageVO.jobId":jobId
        }

		console.log(JSON.stringify(table.getCheckedUsers()));
 		$.post("${path }wx/wxAction_insertWxUser.ms",p,function(res){
        	if(res.ajaxMap.res) {
        		util.alert(res.ajaxMap.msg);
        		//parent.closePopWin();
        	}else {
        		util.alert(res.ajaxMap.msg);
        	}
        });
        
        
        
    }
</script>
		
		
		<%--<div class="center">
			<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
		</div>
	--%></div>

	<script type="text/javascript">
		function query() {
			document.forms.searchForm.submit();
		}
		
		
	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>