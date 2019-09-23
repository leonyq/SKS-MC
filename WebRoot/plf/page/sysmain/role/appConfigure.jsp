<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="KPI配置" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    
	</head>
    <style>

        ul,
        li {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        li {
            float: left;
        }

        .contain {
            padding: 10px;
            height: 400px;
        }

        /* 标签页样式 */

        .tag {
            height: 30px;
            border-bottom: 1px solid #ccc;
            box-sizing: border-box;
            margin-bottom: 15px;
        }

        .tag ul {
            height: 100%;
        }

        .tag ul li {
            height: 30px;
            width: 116px;
            line-height: 30px;
            background-image: url(${path}/plf/page/fp/img/tab-0.png?_mc_res_version=<%=PlfStaticRes.TAB_0_PNG%>); 

            margin-left: -7px;
            padding-left: 7px;
            padding-right: 16px;
            box-sizing: border-box;
            text-align: center;
            color: #333;
        }

        .tag ul li.selected {
            background-image:url(${path}/plf/page/fp/img/tab-1.png?_mc_res_version=<%=PlfStaticRes.TAB_1_PNG%>);
            position: relative;
            color: #333;
        }

        .content>div {
            display: none;
            height: 300px;
        }

        .content>div>div {
            float: left;
            height: 100%;
        }

        .content>div>.left {
            width: 401px;
        }

        .content>div>.operation {
            width: 100px;
            padding: 10px;
            box-sizing: border-box;
            padding-top: 90px;
        }

        .content>div>.right {
            width: 200px;
        }

        .content .title {
            height: 30px;
            line-height: 30px;
        }

        .content table {
            border-collapse: collapse;
            border-spacing: 0;
            table-layout: fixed;
            width: 100%;
        }

        .tableAera {
            height: calc(100% - 30px);
        }

        .tableAera td {
            text-align: center;
            border: 1px solid #dbe1ef;
            height: 30px;
            box-sizing: border-box;
            color: #333;
        }

        .tableAera .tableHead td{
            background-color:#e6eaf4; 
        }
        
        .tableAera .tableBody {
            height: calc(100% - 31px);
            overflow: auto;
            border: 1px solid #dbe1ef;
    			border-top: 0;
        }

        .tableAera .tableBody tr:nth-of-type(2n){
            background-color: #f0f4fd;
        }

        .tableBody input[type='text'] {
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            border: none;
            outline: none;
            padding-left: 5px;
            text-align: center;
            background-color: transparent;
        }

        .tableBody select {
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            background-color: transparent;
            border: none;
            outline: none;
        }

        .content .left table tr td:nth-of-type(1) {
            width: 200px;
        }

        .content .left table tr td:nth-of-type(2) {
            width: 100px;
        }

        .content .left table tr td:nth-of-type(3) {
            width: 100px;
        }

        .content .operation span {
            display: block;
            float: left;
            width: 100%;
            height: 30px;
            text-align: center;
            line-height: 30px;
            color: #fff;
            background-color: #aace36;
            margin: 5px 0;
            cursor: pointer;   
        }
		
		.content .operation span:hover{
			background-color: #99b932;
		}
		
        .tableAera .tableBody tr.selected{
            background-color: #d3eafc ;
        }
        .content span {
        	white-space: nowrap;
        	width: 100%;
        	overflow: hidden;
        	display: inline-block;
        	text-overflow:ellipsis;
        }
        .content .mCSB_container{height: auto;}
    </style>
<body>
	<div class="hd">
		<div class="optn">
			 <button type="button" onclick="add();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			 <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
		</div>
	</div>
	<div class="contain" style="background-color:#fff;">
        <div class="tag">
            <ul>
                <li class="selected" style="margin-left:0;"><dict:lang value="首页" /></li>
                <li><dict:lang value="产量" /></li>
                <li><dict:lang value="品质" /></li>
                <li><dict:lang value="仓储" /></li>
                <li><dict:lang value="预警" /></li>
            </ul>
        </div>

        <div class="content">
            <div class="content1 block" style="display:block;">
                <div class="left">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="已配置功能" />:</div>
                    <input class="input" id="searchHomeL" type="text" onkeyup="searchValue(this,'1L');"/>
                    <div class="tableAera" style="margin-top: 9px;">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td style="width: 150px;"><dict:lang value="功能名称" /></td>
                                    <td style="width: 150px;"><dict:lang value="功能细项" /></td>
                                    <td><dict:lang value="显示顺序" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="home_left" class="_checkVal">
                                
                            </table>
                        </div>
                    </div>
                </div>
                <div class="operation">
                    <span onclick="AllRight('1');">>></span>
                    <span onclick="Right('1');">></span>
                    <span onclick="Left('1');">
                        <</span>
                            <span onclick="AllLeft('1');">
                                <<</span>
                </div>
                <div class="right">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="未配置功能" />:</div>
                    <input class="input" id="searchHomeR" type="text" style="width:200px;" onkeyup="searchValue(this,'1R');"/>
                    <div class="tableAera" style="margin-top: 9px;">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td><dict:lang value="功能名称" /></td>
                                    <td><dict:lang value="功能细项" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="home_right">
                                
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content2 block">
                <div class="left">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="已配置功能" />:</div>
                    <input class="input" type="text" onkeyup="searchValue(this,'2L');"/>
                    <div class="tableAera" style="margin-top: 9px;">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td><dict:lang value="功能名称" /></td>
                                    <td><dict:lang value="显示顺序" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="outPut_left" class="_checkVal">
                                
                            </table>
                        </div>
                    </div>
                </div>
                <div class="operation">
                    <span onclick="AllRight('2');">>></span>
                    <span onclick="Right('2');">></span>
                    <span onclick="Left('2');">
                        <</span>
                            <span onclick="AllLeft('2');">
                                <<</span>
                </div>
                <div class="right">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="未配置功能" />:</div>
                    <input class="input" type="text" style="width:200px;" onkeyup="searchValue(this,'2R');"/>
                    <div class="tableAera" style="margin-top: 9px;">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td><dict:lang value="功能名称" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="outPut_right">
                            
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content3 block">
                <div class="left">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="已配置功能" />:</div>
                    <input class="input" type="text" onkeyup="searchValue(this,'3L');"/>
                    <div class="tableAera" style="margin-top: 9px;">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td><dict:lang value="功能名称" /></td>
                                    <td><dict:lang value="显示顺序" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="quality_left" class="_checkVal">
                                
                            </table>
                        </div>
                    </div>
                </div>
                <div class="operation">
                    <span onclick="AllRight('3');">>></span>
                    <span onclick="Right('3');">></span>
                    <span onclick="Left('3');">
                        <</span>
                            <span onclick="AllLeft('3');">
                                <<</span>
                </div>
                <div class="right">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="未配置功能" />:</div>
                    <input class="input" type="text" style="width:200px;" onkeyup="searchValue(this,'3R');"/>
                    <div class="tableAera" style="margin-top: 9px;">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td><dict:lang value="功能名称" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="quality_right">
                            
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content4 block">
                <div class="left">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="已配置功能" />:</div>
                    <input class="input" type="text" onkeyup="searchValue(this,'4L');"/>
                    <div class="tableAera" style="margin-top: 9px;">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td style="width: 150px;"><dict:lang value="功能名称" /></td>
                                    <td style="width: 150px;"><dict:lang value="功能细项" /></td>
                                    <td><dict:lang value="显示顺序" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="stock_left" class="_checkVal">
                                
                            </table>
                        </div>
                    </div>
                </div>
                <div class="operation">
                    <span onclick="AllRight('4');">>></span>
                    <span onclick="Right('4');">></span>
                    <span onclick="Left('4');">
                        <</span>
                            <span onclick="AllLeft('4');">
                                <<</span>
                </div>
                <div class="right">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="未配置功能" />:</div>
                    <input class="input" type="text" style="width:200px;" onkeyup="searchValue(this,'4R');"/>
                    <div class="tableAera" style="margin-top: 9px;">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td><dict:lang value="功能名称" /></td>
                                    <td><dict:lang value="功能细项" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="stock_right">
                                
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content5 block">
                <div class="left">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="已配置功能" />:</div>
                    <input class="input" type="text" onkeyup="searchValue(this,'5L');"/>
                    <div class="tableAera" style="margin-top: 9px;">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td><dict:lang value="功能名称" /></td>
                                    <td><dict:lang value="显示顺序" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="warn_left" class="_checkVal">
                                
                            </table>
                        </div>
                    </div>
                </div>
                <div class="operation">
                    <span onclick="AllRight('5');">>></span>
                    <span onclick="Right('5');">></span>
                    <span onclick="Left('5');">
                        <</span>
                            <span onclick="AllLeft('5');">
                                <<</span>
                </div>
                <div class="right">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="未配置功能" />:</div>
                    <input class="input" type="text" style="width:200px;" onkeyup="searchValue(this,'5R');"/>
                    <div class="tableAera" style="margin-top: 9px;">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td><dict:lang value="功能名称" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="warn_right">
                            
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="display: none;">
    	<form id="add_form" name="addForm" action="${path}sys/RoleAction_addAppConfigure.ms" method="post" enctype="multipart/form-data" target="submitFrame">
			<input type="hidden" id="dataId" name="paraMap.dataId" value="<c:out value='${param.dataId}' />"/>
			<input type="hidden" id="appData" name="paraMap.appData"/>
			<input type="hidden" id="iframeId" name="paraMap.iframeId"/>
		</form>	
		
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
    <script>
function searchValue(input,type) {
	var tableId;
 	if(type=="1L"){
 		tableId = "home_left";
 	}else if(type=="1R"){
 		tableId = "home_right";
 	}else if(type=="2L"){
 		tableId = "outPut_left";
 	}else if(type=="2R"){
 		tableId = "outPut_right";
 	}else if(type=="3L"){
 		tableId = "quality_left";
 	}else if(type=="3R"){
 		tableId = "quality_right";
 	}else if(type=="4L"){
 		tableId = "stock_left";
 	}else if(type=="4R"){
 		tableId = "stock_right";
 	}else if(type=="5L"){
 		tableId = "warn_left";
 	}else if(type=="5R"){
 		tableId = "warn_right";
 	}
    var searchValue = input.value.toLowerCase();
    var table = $("#"+tableId).find("tr");
    table.each(
        function () {
            // if(!searchValue)return false;
            var e = jQuery(this);
            var eValue = e.text().toLowerCase();
            if (!eValue.match(searchValue)) {
                e.hide();
            }
            else {
                e.show()
            }
        }
    );
 }
 
        $('.tag li').click(function () {
            var index = $(this).index() + 1;
            $(this).addClass('selected').siblings().removeClass('selected');
            $(this).parents('.contain').find('.content' + index)
                .css('display', 'block')
                .siblings()
                .css('display', '');
        });

        $('.block').on('click','tr',function(){
            if($(this).hasClass('selected')){
                $(this).removeClass('selected');
            }else{
                $(this).addClass('selected');
            }
        });
             (function ($) {
                $(window).on('load', function () {
                    $(".scroll").mCustomScrollbar({
                        axis: "yx",
                        snapAmount: 40,
                        theme: "minimal-dark",
                        keyboard: { scrollAmount: 40 },
                        scrollInertia: 80
                    });
                });
            })(jQuery);
            
            
		//验证显示顺序不能重复，且大于0的整数
		$("._checkVal").on("change","._order",function(){
			var count = $(this).val();
			var num = 0;
			if (!(/^\d+$/.test(count) && count > 0)) {
				$(this).val("");
				_alertValMsg($(this),"<dict:lang value='显示顺序必须为大于0的正整数' />");
				$(this).focus();
			}
			$(this).parents("table").find("input").each(function(i,item){
				if (count == $(item).val()) {
					num ++;
				}
			});
			if (num > 1) {
				$(this).val("");
				_alertValMsg($(this),"<dict:lang value='显示顺序不能重复' />");
				$(this).focus();
			}
		});
		
		function dataNum(table){
			var len = $("#"+table).find("tr[class='selected']").length;
			if (len == 0) {
				utilsFp.confirmIcon(1,"","","", "<dict:lang value='请选择数据' />",0,"300","");
				return false;
			}else{
				return true;
			}
		}
		
		function dataAllNum(table){
			var len = $("#"+table).find("tr").length;
			if (len == 0) {
				utilsFp.confirmIcon(1,"","","", "<dict:lang value='请选择数据' />",0,"300","");
				return false;
			}else{
				return true;
			}
		}
		
		//全部右移
		function AllRight(type){
			var table_left;
			var table_right;
			var trId;
			if(type=="1"){ //首页
				table_left = "home_left";
				table_right = "home_right";
				trId = "home_";
			}else if(type=="2"){ //产量
				table_left = "outPut_left";
				table_right = "outPut_right";
				trId = "outPut_";
			}else if(type=="3"){ //品质 
				table_left = "quality_left";
				table_right = "quality_right";
				trId = "quality_";
			}else if(type=="4"){ //仓储
				table_left = "stock_left";
				table_right = "stock_right";
				trId = "stock_";
			}else{ //预警
				table_left = "warn_left";
				table_right = "warn_right";
				trId = "warn_";
			}
			if (!dataAllNum(table_left)) {
				return ;
			}
			$("#"+table_left).find("tr").each(function(i,item){
				$(item).attr("class","selected");
			});
			$("#"+table_left).find("tr[class='selected']").each(function(i,item){
				var dataId = $(item).attr("dataId");
				var moudleName = $(item).attr("moudleName");
				var funName = $(item).attr("funName");
				var tSeq = $(item).attr("tSeq");
				$("#"+trId+dataId).remove();
				if (!$("#"+trId+dataId).length) {
					if(type=="1"||type=="4"){			
						$("#"+table_right).append("<tr id='"+trId+dataId+"' dataId='"+dataId+"' moudleName='"+moudleName+"' funName='"+funName+"' tSeq='"+tSeq+"'></tr>");
						$("#"+table_right+" tr:last").append("<td ><span title='"+moudleName+"'>"+moudleName+"</span></td>");
						$("#"+table_right+" tr:last").append("<td ><span title='"+funName+"'>"+funName+"</span></td>");
					}else{
						$("#"+table_right).append("<tr id='"+trId+dataId+"' dataId='"+dataId+"' moudleName='"+moudleName+"' funName='' tSeq='"+tSeq+"'></tr>");
						$("#"+table_right+" tr:last").append("<td ><span title='"+moudleName+"'>"+moudleName+"</span></td>");
					}
				}
			});
		}
		//右移
		function Right(type){
			var table_left;
			var table_right;
			var trId;
			if(type=="1"){ //首页
				table_left = "home_left";
				table_right = "home_right";
				trId = "home_";
			}else if(type=="2"){ //产量
				table_left = "outPut_left";
				table_right = "outPut_right";
				trId = "outPut_";
			}else if(type=="3"){ //品质 
				table_left = "quality_left";
				table_right = "quality_right";
				trId = "quality_";
			}else if(type=="4"){ //仓储
				table_left = "stock_left";
				table_right = "stock_right";
				trId = "stock_";
			}else{ //预警
				table_left = "warn_left";
				table_right = "warn_right";
				trId = "warn_";
			}
			if (!dataNum(table_left)) {
				return ;
			}
			$("#"+table_left).find("tr[class='selected']").each(function(i,item){
				var dataId = $(item).attr("dataId");
				var moudleName = $(item).attr("moudleName");
				var funName = $(item).attr("funName");
				var tSeq = $(item).attr("tSeq");
				$("#"+trId+dataId).remove();
				if (!$("#"+trId+dataId).length) {
					if(type=="1"||type=="4"){			
						$("#"+table_right).append("<tr id='"+trId+dataId+"' dataId='"+dataId+"' moudleName='"+moudleName+"' funName='"+funName+"' tSeq='"+tSeq+"'></tr>");
						$("#"+table_right+" tr:last").append("<td ><span title='"+moudleName+"'>"+moudleName+"</span></td>");
						$("#"+table_right+" tr:last").append("<td ><span title='"+funName+"'>"+funName+"</span></td>");
					}else{
						$("#"+table_right).append("<tr id='"+trId+dataId+"' dataId='"+dataId+"' moudleName='"+moudleName+"' funName='' tSeq='"+tSeq+"'></tr>");
						$("#"+table_right+" tr:last").append("<td ><span title='"+moudleName+"'>"+moudleName+"</span></td>");
					}
				}
			});
		}
		//全部左移
		function AllLeft(type){
			var table_left;
			var table_right;
			var trId;
			if(type=="1"){ //首页
				table_left = "home_left";
				table_right = "home_right";
				trId = "home_";
			}else if(type=="2"){ //产量
				table_left = "outPut_left";
				table_right = "outPut_right";
				trId = "outPut_";
			}else if(type=="3"){ //品质 
				table_left = "quality_left";
				table_right = "quality_right";
				trId = "quality_";
			}else if(type=="4"){ //仓储
				table_left = "stock_left";
				table_right = "stock_right";
				trId = "stock_";
			}else{ //预警
				table_left = "warn_left";
				table_right = "warn_right";
				trId = "warn_";
			}
			if (!dataAllNum(table_right)) {
				return ;
			}
			$("#"+table_right).find("tr").each(function(i,item){
				$(item).attr("class","selected");
			});
			$("#"+table_right).find("tr[class='selected']").each(function(i,item){
				var dataId = $(item).attr("dataId");
				var moudleName = $(item).attr("moudleName");
				var funName = $(item).attr("funName");
				var tSeq = $(item).attr("tSeq");
				$("#"+trId+dataId).remove();
				if (!$("#"+trId+dataId).length) {
					if(type=="1"||type=="4"){
						$("#"+table_left).append("<tr id='"+trId+dataId+"' dataId='"+dataId+"' moudleName='"+moudleName+"' funName='"+funName+"' tSeq='"+tSeq+"'></tr>");
						$("#"+table_left+" tr:last").append("<td style='width: 150px;'><span title=\""+moudleName+"\">"+moudleName+"</span></td>");
						$("#"+table_left+" tr:last").append("<td style='width: 150px;'><span title=\""+funName+"\">"+funName+"</span></td>");
						$("#"+table_left+" tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+dataId+"' value='"+tSeq+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
					}else{
						$("#"+table_left).append("<tr id='"+trId+dataId+"' dataId='"+dataId+"' moudleName='"+moudleName+"' funName='' tSeq='"+tSeq+"'></tr>");
						$("#"+table_left+" tr:last").append("<td ><span title=\""+moudleName+"\">"+moudleName+"</span></td>");
						$("#"+table_left+" tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+dataId+"' value='"+tSeq+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
					}
				}
			});
		}
		//左移
		function Left(type){
			var table_left;
			var table_right;
			var trId;
			if(type=="1"){ //首页
				table_left = "home_left";
				table_right = "home_right";
				trId = "home_";
			}else if(type=="2"){ //产量
				table_left = "outPut_left";
				table_right = "outPut_right";
				trId = "outPut_";
			}else if(type=="3"){ //品质 
				table_left = "quality_left";
				table_right = "quality_right";
				trId = "quality_";
			}else if(type=="4"){ //仓储
				table_left = "stock_left";
				table_right = "stock_right";
				trId = "stock_";
			}else{ //预警
				table_left = "warn_left";
				table_right = "warn_right";
				trId = "warn_";
			}
			if (!dataNum(table_right)) {
				return ;
			}
			$("#"+table_right).find("tr[class='selected']").each(function(i,item){
				var dataId = $(item).attr("dataId");
				var moudleName = $(item).attr("moudleName");
				var funName = $(item).attr("funName");
				var tSeq = $(item).attr("tSeq");
				$("#"+trId+dataId).remove();
				if (!$("#"+trId+dataId).length) {
					if(type=="1"||type=="4"){
						$("#"+table_left).append("<tr id='"+trId+dataId+"' dataId='"+dataId+"' moudleName='"+moudleName+"' funName='"+funName+"' tSeq='"+tSeq+"'></tr>");
						$("#"+table_left+" tr:last").append("<td style='width: 150px;'><span title=\""+moudleName+"\">"+moudleName+"</span></td>");
						$("#"+table_left+" tr:last").append("<td style='width: 150px;'><span title=\""+funName+"\">"+funName+"</span></td>");
						$("#"+table_left+" tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+dataId+"' value='"+tSeq+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
					}else{
						$("#"+table_left).append("<tr id='"+trId+dataId+"' dataId='"+dataId+"' moudleName='"+moudleName+"' funName='' tSeq='"+tSeq+"'></tr>");
						$("#"+table_left+" tr:last").append("<td ><span title=\""+moudleName+"\">"+moudleName+"</span></td>");
						$("#"+table_left+" tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+dataId+"' value='"+tSeq+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
					}
				}
			});
		}
    </script>
<script type="text/javascript">

	$(function(){
    	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
    	getData("1");
    	getData("2");
    	getData("3");
    	getData("4");
    	getData("5");
    });

	function getData(type){
		var table_left;
		var table_right;
		var trId;
		if(type=="1"){ //首页
			table_left = "home_left";
			table_right = "home_right";
			trId = "home_";
		}else if(type=="2"){ //产量
			table_left = "outPut_left";
			table_right = "outPut_right";
			trId = "outPut_";
		}else if(type=="3"){ //品质 
			table_left = "quality_left";
			table_right = "quality_right";
			trId = "quality_";
		}else if(type=="4"){ //仓储
			table_left = "stock_left";
			table_right = "stock_right";
			trId = "stock_";
		}else{ //预警
			table_left = "warn_left";
			table_right = "warn_right";
			trId = "warn_";
		}
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/RoleAction_getRoleAppAjax.ms",
			    data: {
			    	"paraMap.dataId" : $("#dataId").val(),
			    	"paraMap.type" : type
			    },
				success: function(data){
					$("#"+table_left).empty();
					$("#"+table_right).empty();
						if(null == data){return ;}
						if(null != data.ajaxMap){
							var conList = data.ajaxMap.conList;
							var noConList = data.ajaxMap.noConList;
							for(var i = 0;i < conList.length; i++){    
								if (!$("#"+trId+conList[i].ID).length && null != conList[i].ID) {
									if(type=="1"||type=="4"){
										$("#"+table_left).append("<tr id='"+trId+conList[i].ID+"' dataId='"+conList[i].ID+"' moudleName='"+conList[i].TAM_MOUDLE_NAME+"' funName='"+conList[i].TAS_FUN_NAME+"' tSeq='"+conList[i].TAR_SEQ+"'></tr>");
										$("#"+table_left+" tr:last").append("<td style='width: 150px;'><span title=\""+conList[i].TAM_MOUDLE_NAME+"\">"+conList[i].TAM_MOUDLE_NAME+"</span></td>");
										$("#"+table_left+" tr:last").append("<td style='width: 150px;'><span title=\""+conList[i].TAS_FUN_NAME+"\">"+conList[i].TAS_FUN_NAME+"</span></td>");
										$("#"+table_left+" tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+conList[i].ID+"' value='"+conList[i].TAR_SEQ+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
									}else{
										$("#"+table_left).append("<tr id='"+trId+conList[i].ID+"' dataId='"+conList[i].ID+"' moudleName='"+conList[i].TAM_MOUDLE_NAME+"' funName='' tSeq='"+conList[i].TAR_SEQ+"'></tr>");
										$("#"+table_left+" tr:last").append("<td ><span title=\""+conList[i].TAM_MOUDLE_NAME+"\">"+conList[i].TAM_MOUDLE_NAME+"</span></td>");
										$("#"+table_left+" tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+conList[i].ID+"' value='"+conList[i].TAR_SEQ+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
									}
								}
							}
							for(var i = 0;i < noConList.length; i++){
								if (!$("#"+trId+noConList[i].ID).length && null != noConList[i].ID) {
									if(type=="1"||type=="4"){
										$("#"+table_right).append("<tr id='"+trId+noConList[i].ID+"' dataId='"+noConList[i].ID+"' moudleName='"+noConList[i].TAM_MOUDLE_NAME+"' funName='"+noConList[i].TAS_FUN_NAME+"' tSeq='"+noConList[i].TAS_SEQ+"'></tr>");
										$("#"+table_right+" tr:last").append("<td ><span title=\""+noConList[i].TAM_MOUDLE_NAME+"\">"+noConList[i].TAM_MOUDLE_NAME+"</span></td>");
										$("#"+table_right+" tr:last").append("<td ><span title=\""+noConList[i].TAS_FUN_NAME+"\">"+noConList[i].TAS_FUN_NAME+"</span></td>");
									}else{
										$("#"+table_right).append("<tr id='"+trId+noConList[i].ID+"' dataId='"+noConList[i].ID+"' moudleName='"+noConList[i].TAM_MOUDLE_NAME+"' funName='' tSeq='"+noConList[i].TAS_SEQ+"'></tr>");
										$("#"+table_right+" tr:last").append("<td ><span title=\""+noConList[i].TAM_MOUDLE_NAME+"\">"+noConList[i].TAM_MOUDLE_NAME+"</span></td>");
									}
								}
							}
						}
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
	}
	
	//显示顺序空值验证,非空时获取数据
	var appData = null;
	var appDataArr = [];
	function checkVal(type){
		var table_left;
		var table_right;
		var trId;
		if(type=="1"){ //首页
			table_left = "home_left";
			table_right = "home_right";
			trId = "home_";
		}else if(type=="2"){ //产量
			table_left = "outPut_left";
			table_right = "outPut_right";
			trId = "outPut_";
		}else if(type=="3"){ //品质 
			table_left = "quality_left";
			table_right = "quality_right";
			trId = "quality_";
		}else if(type=="4"){ //仓储
			table_left = "stock_left";
			table_right = "stock_right";
			trId = "stock_";
		}else{ //预警
			table_left = "warn_left";
			table_right = "warn_right";
			trId = "warn_";
		}
		var flag = true;
		$("#"+table_left).find("input").each(function(i,item){
				if ("" == $(item).val()) {
					if(type=="1"){
						utilsFp.confirmIcon(1,"","","", "<dict:lang value="首页存在空的显示顺序" />",0,"300","");
					}else if(type=="2"){
						utilsFp.confirmIcon(1,"","","", "<dict:lang value="产量存在空的显示顺序" />",0,"300","");
					}else if(type=="3"){
						utilsFp.confirmIcon(1,"","","", "<dict:lang value="品质存在空的显示顺序" />",0,"300","");
					}else if(type=="4"){
						utilsFp.confirmIcon(1,"","","", "<dict:lang value="仓储存在空的显示顺序" />",0,"300","");
					}else{
						utilsFp.confirmIcon(1,"","","", "<dict:lang value="预警存在空的显示顺序" />",0,"300","");
					}
					flag = false;
					return false; 
				}else{
					appDataArr.push({
						MOUDLEID: $(item).parents("tr").attr("dataId"),
						SHOW_ORDER: $("#showOrder_"+$(item).parents("tr").attr("dataId")).val()
					});
				}
			});		
		return flag;
	}
	
	//保存
	function add(){
		if (checkVal("1")&&checkVal("2")&&checkVal("3")&&checkVal("4")&&checkVal("5")) {
			appData = JSON.stringify(appDataArr);
			$("#appData").val(appData);
			document.forms.add_form.submit();
		}
	}
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>