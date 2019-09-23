<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <base href="${path}" />
    <title><dict:lang value="消息通用模板管理" /></title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <title><dict:lang value="列表显示查询条件" /></title>
    <jsp:include page="/plf/common/pub_head.jsp">
        <jsp:param name="popDivWin" value="1" />
        <jsp:param name="serializeForm" value="1" />
        <jsp:param name="dmp" value="1" />
    </jsp:include>
    <script src="${path}/plf/page/bussmodel/dmp/js/jquery.min.js"></script>
    <style type="text/css">
        .layui-form-select{
            width: 220px;
        }
    </style>
</head>

<body>
    <div class="layui-fluid">
        <div class="listOperate">
            <div class="searchSwitch"></div>
            <div class="operates">
                <ul class="layui-nav">
                    <li class="layui-nav-item">
                        <%--<a href="infComm/infCommAction_testInf.ms">test</a>--%>
                        <a href="javascript:"><dict:lang value="操作" /></a>
                        <dl class="layui-nav-child">
                            <dd class="tableAddData cardAddData"><dict:lang value="新增" /></dd>
                            <dd class="tableUpData cardUpData" ><dict:lang value="修改" /></dd>
                            <dd class="tableDetailData cardDetailData" ><dict:lang value="查看" /></dd>
                            <dd class="tableDelData cardDelData" id="tableDelData"><dict:lang value="删除" /></dd>
                        </dl>
                    </li>
                </ul>
                <span class="ico search"></span>
                <%--<span class="ico list icolist"></span>
                <a><span class="ico card icocard"></span></a>--%>
            </div>
        </div>
        <form class="layui-form searchDiv" id="searchForm" name="searchForm" action="">
            <s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
            <div class="layui-row">

                <div class="searchItem">
                    <div class="search_l"><dict:lang value="标题" /></div>
                    <div class="search_r">
                        <input type="text"  id="paraMap_code" name="paraMap.TITLE" maxlength="30"  placeholder="<dict:lang value="标题" />" class="layui-input">
                    </div>
                </div>

                <div class="searchItem">
                    <div class="search_l"><dict:lang value="模板编码" /></div>
                    <div class="search_r">
                        <input type="text"  id="paraMap_name" name="paraMap.CODE" maxlength="30"  placeholder="<dict:lang value="模板编码" />" class="layui-input">
                    </div>
                </div>

                <div class="searchItem">
                    <div class="search_l"><dict:lang value="是否默认" /></div>
                    <div class="search_r">
                        <dict:selectDict dictCode="YOrN" dictValue="%{TYPE}" name="paraMap.IS_DEFAULT" id="paraMap_is_default" custom_option="<option value=''>%{getText('--请选择--')}</option>" />
                    </div>
                </div>

            </div>
        </form>
        <div class="list" id="commTemplateList_div">
            <table id="commTemplateList" lay-filter="dmpListDemo"></table>
        </div>

       <div id="cardlist" style="display:none;">

       </div>

    </div>
<script type="text/javascript">
util.initDictMap('["YESNO","FUNC_TYPE"]');
var tableIns;
var currPage = 1;
layui.use([ 'table', 'element', 'laypage'], function(){
  var table = layui.table;
  var element = layui.element;
  var laypage = layui.laypage;

    //第一个实例
    tableIns =  table.render({
        id:'commTemplateList',
        elem: '#commTemplateList',
        url: '${path}infComm/infCommAction_fetchCommTemplatelList.ms', //数据接口
        page: true, //开启分页
        method: 'post',
        limits:[10,20,50,100],
        height: 'auto',
        // where:{"FUNC_CODE":"F_39839f3739ef41649e95b89ef6290b26"},
        parseData: function(res){ //res 即为原始返回的数据
            return {
                "code": res.ajaxMap.state, //解析接口状态
                "msg": '', //解析提示文本
                "count": res.ajaxMap.count, //解析数据长度
                "data": res.ajaxMap.item //解析数据列表
            };
        },
        request: {
            pageName: 'page.currentPage', //页码的参数名称，默认：page
            limitName: 'page.pageRecord' //每页数据量的参数名，默认：limit
        },
        cols: [[ //表头
            {checkbox: true,fixed:'left'},
            {field: 'TITLE', title: '<dict:lang value="标题" />'},
            {field: 'CODE', title: '<dict:lang value="模板编码" />', sort: true},
            {field: 'TEMPLATE', title: '<dict:lang value="模板内容" />'},
            {field: 'EXAMPLE', title: '<dict:lang value="模板例子" />'},
            {field: 'IS_DEFAULT', title: '<dict:lang value="是否默认" />'},
            {field: 'IS_SYSTEM', title: '<dict:lang value="是否系统模板" />'}
        ]],
        done: function(res, curr, count){
            currPage = curr;
        }
    });

        // 新增
        $(".tableAddData").click(function(){
            // do something
            add();
        });




        // 修改
        $(".tableUpData").click(function(){
            var checkStatus = table.checkStatus('commTemplateList');
            var data = checkStatus.data;
            if(data.length==0){
                layer.msg('<dict:lang value="请选择一条数据！" />');
                return;
            }
            if(data.length>1){
                layer.msg('<dict:lang value="只能选择一条数据！" />');
                return;
            }
            var rowId = data[0].ID;
            edit(rowId);
            //console.log(data);

        });
        // 查看
        // 查看
        $(".tableDetailData").click(function(){
            if(search_type=='tableSearch'){
                var checkStatus = table.checkStatus('commTemplateList');
                var data = checkStatus.data;
                if(data.length==0){
                    layer.msg('<dict:lang value="请选择一条数据！" />');
                    return;
                }
                if(data.length>1){
                    layer.msg('<dict:lang value="只能选择一条数据！" />');
                    return;
                }
                var rowId = data[0].ID;

            }else{
                var card = $(".cards .active");
                if(card.length==0){
                    layer.msg('<dict:lang value="请选中一张卡片！" />');
                    return;
                }
                var rowId = card.attr("rowId");
            }
            view(rowId);

        });
        // 删除
        $(".tableDelData").click(function(){
            if(search_type=='tableSearch'){
                var checkStatus = table.checkStatus('commTemplateList');
                var data = checkStatus.data;
                var isSystem = false;
                if(data.length==0){
                    layer.msg('<dict:lang value="请选择数据！" />');
                    return;
                }
                var rowIds = "";
                $.each(data,function(i,v){
                    if(v.IS_SYSTEM == "Y") {
                        isSystem = true;
                    }
                    rowIds+=v.ID+",";
                });
                if(isSystem) {
                    layer.msg('<dict:lang value="系统模板不能删除！" />');
                    return;
                }
                $.post("${path}infComm/infCommAction_delCommTemplate.ms",{rowIds:rowIds},function(res){
                    reloadTable();
                });
            }else{
                var card = $(".cards .active");
                if(card.length==0){
                    layer.msg('<dict:lang value="请选中一张卡片！" />');
                    return;
                }
                var rowIds = card.attr("rowId");
                $.post("${path}infComm/infCommAction_delCommTemplate.ms",{rowIds:rowIds},function(res){
                    listCardAx();
                });
            }
        });

        table.on('row(dmpListDemo)', function(obj){
            //console.log(obj.tr) //得到当前行元素对象
            //console.log(obj.data) //得到当前行数据
            //obj.del(); //删除当前行
            //obj.update(fields) //修改当前行数据
        });

        // 刷新列表
    });
    var reloadTable = function(){
        var formData = form.serialize($("#searchForm"));
        // formData["FUNC_CODE"] = "F_39839f3739ef41649e95b89ef6290b26";
        tableIns.reload({
            where: formData,
            page: {
                curr: currPage
            }
        });
    }

    $('.searchSwitch').click(function(){
        $('.layui-fluid').toggleClass('switch');
    });

    function add(){
        var url = "${path}infComm/infCommAction_toCommTemplateAdd.ms?mcIframeName="+window.name;
        //url="${path}wx/wxAction_toseetemplate.ms?paramMap.DEPT_ID="+dept_id+"&mcIframeName="+window.name;
        showPopWin(url, 800, 600, null, "<dict:lang value="新增模板" />");
        // window.location.href= url;
    }

    function edit(id){
        var url = "${path}infComm/infCommAction_toCommTemplateEdit.ms?paraMap.id="+id+"&mcIframeName="+window.name;//?paraMap.UP_ID="+$("#up_id").val()+"&paraMap.typeFlag="+$("#typeFlag").val()+"&paraMap.mcIframeName="+window.parent.name;
        showPopWin(url, 800, 600, null, "<dict:lang value="修改模板" />");
    }

    function view(id){
        var url = "${path}infComm/infCommAction_toCommTemplateView.ms?paraMap.id="+id;//?paraMap.UP_ID="+$("#up_id").val()+"&paraMap.typeFlag="+$("#typeFlag").val()+"&paraMap.mcIframeName="+window.parent.name;
        showPopWin(url, 800, 600, null, "<dict:lang value="查看模板" />");
    }
</script>

<script>
    //DMP卡片列表页面封装
    var search_type='tableSearch';//类型切换  tableSearch cardSearch
    $(function(){
        //listCardAx();
    });

    // 点击列表按钮
    $(".icolist").click(function(){
        search_type='tableSearch';
        $("#cardlist").css('display','none');
        $("#commTemplateList_div").css('display','');
        reloadTable();

    });

    // 点击卡片按钮
    $(".icocard").click(function(){
        search_type='cardSearch';
        $("#commTemplateList_div").css('display','none');
        $("#cardlist").css('display','');
        listCardAx();

    });

    // 点击搜索按钮
    $('.search').click(function(){
        if(search_type=='tableSearch'){
            reloadTable();
        }else{
            listCardAx();
        }

    });

    <%-- 异步刷新卡片列表数据 --%>
    function listCardAx(){
        var url = "${path}dmp/DmpAction_fetchAlgorithModelListCard.ms";
        var formData = form.serialize($("#searchForm"));
        jQuery.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data: formData,
            success: function(data){
                var operHtml = "";
                try{
                    if(null !=data.ajaxMap){
                        //console.log(data.ajaxMap);
                        $.each(data.ajaxMap,function(key,values){



                            operHtml =operHtml +"<div class='cardPane open'>";

                            operHtml =operHtml +"<fieldset class='layui-elem-field layui-field-title'>";
                            operHtml =operHtml +"<legend>"+key+"("+values.length+")</legend>";
                            operHtml =operHtml +"<div class='more'>";
                            operHtml =operHtml +"<div class='moreBtn showBtn'>";
                            operHtml =operHtml +"<span class='moreIco'></span>";
                            operHtml =operHtml +"</div>";

                            if(values.length>20){
                                operHtml =operHtml +"<div class='moreBtn moreloadlist' moreload_dataauth_id='"+dataauth_arr[0]+"'><span class='text'>更多</span></div>";
                            }

                            operHtml =operHtml +"</div>";
                            operHtml =operHtml +"</fieldset>";
                            operHtml =operHtml +"<div class='layui-row cards'>";
                            //console.log(values);

                            $.each(values, function(i, paraDto) {
                                //console.log(paraDto.PNAME);
                                if(i>19){
                                    return false;
                                }

                                operHtml =operHtml +"<div class='item active'>";
                                operHtml =operHtml +"<div class='p1'><span class='ico'></span>"+paraDto.WPL_CODE+"</div>";
                                operHtml =operHtml +"<div class='p2'>"+paraDto.WPL_NAME+"</div>";
                                operHtml =operHtml +"<div class='set'></div>";
                                operHtml =operHtml +"</div>";

                            });

                            operHtml =operHtml +"</div>";
                            operHtml =operHtml +"</div>";

                        });

                    }

                    //console.log(operHtml);
                    //$("#commTemplateList_div").html('');//列表
                    //$("#commTemplateList_div").css('display','none');

                    $("#cardlist").html(operHtml);

                    //注册展开收起
                    $('.showBtn').click(function(){
                        if($(this).parents('.cardPane').hasClass('open')){
                            $(this).parents('.cardPane').removeClass('open')
                            $(this).find('.text').html('展开')
                        }else{
                            $(this).parents('.cardPane').addClass('open')
                            $(this).find('.text').html('收起')
                        }

                    })

                    //更多
                    $('.moreloadlist').click(function(){
                        var moreload_dataauth_id=$(this).attr('moreload_dataauth_id');
                        $("#paraMap_DATA_AUTHE").val(moreload_dataauth_id);
                        layui.form.render("select");
                        $("#cardlist").css('display','none');
                        $("#commTemplateList_div").css('display','');
                        search_type='tableSearch';
                        reloadTable();

                    });

                }catch(e){

                }
            },
            error: function(msg){

            }
        });
    }

    $(document).on("click", ".layui-table-body table.layui-table tbody tr", function (e) {
        if ($(e.target).hasClass("layui-table-col-special") || $(e.target).parent().hasClass("layui-table-col-special")) {
            return false;
        }
        var index = $(this).attr('data-index'), tableBox = $(this).closest('.layui-table-box'),
            tableFixed = tableBox.find(".layui-table-fixed.layui-table-fixed-l"),
            tableBody = tableBox.find(".layui-table-body.layui-table-main"),
            tableDiv = tableFixed.length ? tableFixed : tableBody,
            checkCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.laytable-cell-checkbox div.layui-form-checkbox i"),
            radioCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.laytable-cell-radio div.layui-form-radio i");
        if (checkCell.length) {
            checkCell.click();
        }
        if (radioCell.length) {
            radioCell.click();
        }
    });
    $(document).on("click", "td div.laytable-cell-checkbox div.layui-form-checkbox,td div.laytable-cell-radio div.layui-form-radio", function (e) {
        e.stopPropagation();
    });
</script>

</body>
</html>