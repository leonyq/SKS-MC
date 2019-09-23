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
                <li class="selected" style="margin-left:0;">KPI</li>
                <li><dict:lang value="关键数据" /></li>
            </ul>
        </div>

        <div class="content">
            <div class="content1 block" style="display:block;">
                <div class="left">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="已配置KPI" />:</div>
                    <div class="tableAera">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td style="width: 120px;"><dict:lang value="指标名称" /></td>
                                    <td style="width: 100px;"><dict:lang value="类型" /></td>
                                    <td style="width: 80px;"><dict:lang value="默认显示" /></td>
                                    <td><dict:lang value="显示顺序" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="kpi_left" class="_checkVal">
                                
                            </table>
                        </div>
                    </div>
                </div>
                <div class="operation">
                    <span onclick="kpiAllRight();">>></span>
                    <span onclick="kpiRight();">></span>
                    <span onclick="kpiLeft();">
                        <</span>
                            <span onclick="kpiAllLeft();">
                                <<</span>
                </div>
                <div class="right">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="未配置KPI" />:</div>
                    <div class="tableAera">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td><dict:lang value="指标名称" /></td>
                                    <td><dict:lang value="类型" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="kpi_right">
                                
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content2 block">
                <div class="left">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="已配置关键数据" />:</div>
                    <div class="tableAera">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td style="width: 120px;"><dict:lang value="关键数据" /></td>
                                    <td style="width: 100px;"><dict:lang value="类型" /></td>
                                    <td style="width: 80px;"><dict:lang value="默认显示" /></td>
                                    <td><dict:lang value="显示顺序" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="crux_left" class="_checkVal">
                                
                            </table>
                        </div>
                    </div>
                </div>
                <div class="operation">
                    <span onclick="cruxAllRight();">>></span>
                    <span onclick="cruxRight();">></span>
                    <span onclick="cruxLeft();">
                        <</span>
                            <span onclick="cruxAllLeft();">
                                <<</span>
                </div>
                <div class="right">
                    <div class="title"><i class="ico ico-cus"></i><dict:lang value="未配置关键数据" />:</div>
                    <div class="tableAera">
                        <div class="tableHead">
                            <table>
                                <tr>
                                    <td><dict:lang value="关键数据" /></td>
                                    <td><dict:lang value="类型" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll">
                            <table id="crux_right">
                            
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="display: none;">
    	<form id="add_form" name="addForm" action="${path}sys/RoleAction_addKpiColloctionAjax.ms" method="post" enctype="multipart/form-data" target="submitFrame">
			<input type="hidden" id="dataId" name="paraMap.dataId" value="<c:out value='${param.dataId}' />"/>
			<input type="hidden" id="kpiData" name="paraMap.kpiData"/>
			<input type="hidden" id="iframeId" name="paraMap.iframeId"/>
			<input type="hidden" id="cruxData" name="paraMap.cruxData"/>
		</form>	
		
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
    <script>
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
		
		//kpi全部右移
		function kpiAllRight(){
			if (!dataAllNum("kpi_left")) {
				return ;
			}
			$("#kpi_left").find("tr").each(function(i,item){
				$(item).attr("class","selected");
			});
			$("#kpi_left").find("tr[class='selected']").each(function(i,item){
				var id = $(item).attr("dataId");
				var name = $(item).attr("dataName");
				var dataDefault = $(item).attr("dataDefault");
				var order = $(item).attr("dataOrder");
				var type = $(item).attr("types");
				$("#kpi_"+id).remove();
				if (!$("#kpi_"+id).length) {
					$("#kpi_right").append("<tr id='kpi_"+id+"' dataId='"+id+"' dataName=\""+name+"\" dataDefault='"+dataDefault+"' dataOrder=\""+order+"\" types=\""+type+"\"></tr>");
					$("#kpi_right tr:last").append("<td ><span title=\""+name+"\">"+name+"</span></td>");
					$("#kpi_right tr:last").append("<td ><span title=\""+type+"\">"+type+"</span></td>");
				}
			});
		}
		//kpi右移
		function kpiRight(){
			if (!dataNum("kpi_left")) {
				return ;
			}
			$("#kpi_left").find("tr[class='selected']").each(function(i,item){
				var id = $(item).attr("dataId");
				var name = $(item).attr("dataName");
				var dataDefault = $(item).attr("dataDefault");
				var order = $(item).attr("dataOrder");
				var type = $(item).attr("types");
				$("#kpi_"+id).remove();
				if (!$("#kpi_"+id).length) {
					$("#kpi_right").append("<tr id='kpi_"+id+"' dataId='"+id+"' dataName=\""+name+"\" dataDefault='"+dataDefault+"' dataOrder=\""+order+"\" types=\""+type+"\"></tr>");
					$("#kpi_right tr:last").append("<td ><span title=\""+name+"\">"+name+"</span></td>");
					$("#kpi_right tr:last").append("<td ><span title=\""+type+"\">"+type+"</span></td>");
				}
			});
		}
		//kpi全部左移
		function kpiAllLeft(){
			if (!dataAllNum("kpi_right")) {
				return ;
			}
			$("#kpi_right").find("tr").each(function(i,item){
				$(item).attr("class","selected");
			});
			$("#kpi_right").find("tr[class='selected']").each(function(i,item){
				var id = $(item).attr("dataId");
				var name = $(item).attr("dataName");
				var dataDefault = $(item).attr("dataDefault");
				var order = $(item).attr("dataOrder");
				var type = $(item).attr("types");
				$("#kpi_"+id).remove();
				if (!$("#kpi_"+id).length) {
					$("#kpi_left").append("<tr id='kpi_"+id+"' dataId='"+id+"' dataName=\""+name+"\" dataDefault='"+dataDefault+"' dataOrder=\""+order+"\" types=\""+type+"\"></tr>");
					$("#kpi_left tr:last").append("<td style='width: 120px;'><span title=\""+name+"\">"+name+"</span></td>");
					$("#kpi_left tr:last").append("<td style='width: 100px;'><span title=\""+type+"\">"+type+"</span></td>");
					$("#kpi_left tr:last").append("<td style='width: 80px;'><select class='dept_select' id='showDefault_"+id+"' value='0'><option value='0'><dict:lang value='否' /></option><option value='1'><dict:lang value='是' /></option></td>");
					$("#kpi_left tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+id+"' value='"+order+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
					$("#showDefault_"+id).find("option[value='"+dataDefault+"']").attr("selected",true);
					$("#showDefault_"+id).trigger("chosen:updated");
				}
			});
		}
		//kpi左移
		function kpiLeft(){
			if (!dataNum("kpi_right")) {
				return ;
			}
			$("#kpi_right").find("tr[class='selected']").each(function(i,item){
				var id = $(item).attr("dataId");
				var name = $(item).attr("dataName");
				var dataDefault = $(item).attr("dataDefault");
				var order = $(item).attr("dataOrder");
				var type = $(item).attr("types");
				$("#kpi_"+id).remove();
				if (!$("#kpi_"+id).length) {
					$("#kpi_left").append("<tr id='kpi_"+id+"' dataId='"+id+"' dataName=\""+name+"\" dataDefault='"+dataDefault+"' dataOrder=\""+order+"\" types=\""+type+"\"></tr>");
					$("#kpi_left tr:last").append("<td style='width: 120px;'><span title=\""+name+"\">"+name+"</span></td>");
					$("#kpi_left tr:last").append("<td style='width: 100px;'><span title=\""+type+"\">"+type+"</span></td>");
					$("#kpi_left tr:last").append("<td style='width: 80px;'><select class='dept_select' id='showDefault_"+id+"' value='0'><option value='0'><dict:lang value='否' /></option><option value='1'><dict:lang value='是' /></option></td>");
					$("#kpi_left tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+id+"' value='"+order+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
					$("#showDefault_"+id).find("option[value='"+dataDefault+"']").attr("selected",true);
					$("#showDefault_"+id).trigger("chosen:updated");
				}
			});
		}
		
		//关键数据全部右移
		function cruxAllRight(){
			if (!dataAllNum("crux_left")) {
				return ;
			}
			$("#crux_left").find("tr").each(function(i,item){
				$(item).attr("class","selected");
			});
			$("#crux_left").find("tr[class='selected']").each(function(i,item){
				var id = $(item).attr("dataId");
				var name = $(item).attr("dataName");
				var dataDefault = $(item).attr("dataDefault");
				var order = $(item).attr("dataOrder");
				var type = $(item).attr("types");
				$("#crux_"+id).remove();
				if (!$("#crux_"+id).length) {
					$("#crux_right").append("<tr id='crux_"+id+"' dataId='"+id+"' dataName=\""+name+"\" dataDefault='"+dataDefault+"' dataOrder=\""+order+"\" types=\""+type+"\"></tr>");
					$("#crux_right tr:last").append("<td ><span title=\""+name+"\">"+name+"</span></td>");
					$("#crux_right tr:last").append("<td ><span title=\""+type+"\">"+type+"</span></td>");
				}
			});
		}
		//关键数据右移
		function cruxRight(){
			if (!dataNum("crux_left")) {
				return ;
			}
			$("#crux_left").find("tr[class='selected']").each(function(i,item){
				var id = $(item).attr("dataId");
				var name = $(item).attr("dataName");
				var dataDefault = $(item).attr("dataDefault");
				var order = $(item).attr("dataOrder");
				var type = $(item).attr("types");
				$("#crux_"+id).remove();
				if (!$("#crux_"+id).length) {
					$("#crux_right").append("<tr id='crux_"+id+"' dataId='"+id+"' dataName=\""+name+"\" dataDefault='"+dataDefault+"' dataOrder=\""+order+"\" types=\""+type+"\"></tr>");
					$("#crux_right tr:last").append("<td ><span title=\""+name+"\">"+name+"</span></td>");
					$("#crux_right tr:last").append("<td ><span title=\""+type+"\">"+type+"</span></td>");
				}
			});
		}
		//关键全部左移
		function cruxAllLeft(){
			if (!dataAllNum("crux_right")) {
				return ;
			}
			$("#crux_right").find("tr").each(function(i,item){
				$(item).attr("class","selected");
			});
			$("#crux_right").find("tr[class='selected']").each(function(i,item){
				var id = $(item).attr("dataId");
				var name = $(item).attr("dataName");
				var dataDefault = $(item).attr("dataDefault");
				var order = $(item).attr("dataOrder");
				var type = $(item).attr("types");
				$("#crux_"+id).remove();
				if (!$("#crux_"+id).length) {
					$("#crux_left").append("<tr id='crux_"+id+"' dataId='"+id+"' dataName=\""+name+"\" dataDefault='"+dataDefault+"' dataOrder=\""+order+"\" types=\""+type+"\"></tr>");
					$("#crux_left tr:last").append("<td style='width: 120px;'><span title=\""+name+"\">"+name+"</span></td>");
					$("#crux_left tr:last").append("<td style='width: 100px;'><span title=\""+type+"\">"+type+"</span></td>");
					$("#crux_left tr:last").append("<td style='width: 80px;'><select class='dept_select' id='showDefault_"+id+"' value='0'><option value='0'><dict:lang value='否' /></option><option value='1'><dict:lang value='是' /></option></td>");
					$("#crux_left tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+id+"' value='"+order+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
					$("#showDefault_"+id).find("option[value='"+dataDefault+"']").attr("selected",true);
					$("#showDefault_"+id).trigger("chosen:updated");
				}
			});
		}
		//关键数据左移
		function cruxLeft(){
			if (!dataNum("crux_right")) {
				return ;
			}
			$("#crux_right").find("tr[class='selected']").each(function(i,item){
				var id = $(item).attr("dataId");
				var name = $(item).attr("dataName");
				var dataDefault = $(item).attr("dataDefault");
				var order = $(item).attr("dataOrder");
				var type = $(item).attr("types");
				$("#crux_"+id).remove();
				if (!$("#crux_"+id).length) {
					$("#crux_left").append("<tr id='crux_"+id+"' dataId='"+id+"' dataName=\""+name+"\" dataDefault='"+dataDefault+"' dataOrder=\""+order+"\" types=\""+type+"\"></tr>");
					$("#crux_left tr:last").append("<td style='width: 120px;'><span title=\""+name+"\">"+name+"</span></td>");
					$("#crux_left tr:last").append("<td style='width: 100px;'><span title=\""+type+"\">"+type+"</span></td>");
					$("#crux_left tr:last").append("<td style='width: 80px;'><select class='dept_select' id='showDefault_"+id+"' value='0'><option value='0'><dict:lang value='否' /></option><option value='1'><dict:lang value='是' /></option></td>");
					$("#crux_left tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+id+"' value='"+order+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
					$("#showDefault_"+id).find("option[value='"+dataDefault+"']").attr("selected",true);
					$("#showDefault_"+id).trigger("chosen:updated");
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
    	getData();
    });

	function getData(){
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/RoleAction_getRoleKpiAjax.ms",
			    data: "paraMap.dataId="+$("#dataId").val(),
				success: function(data){
					$("#kpi_left").empty();
					$("#kpi_right").empty();
					$("#crux_left").empty();
					$("#crux_right").empty();
						if(null == data){return ;}
						if(null != data.ajaxMap){
							var cruxLs = data.ajaxMap.cruxLs;
							var allCruxLs = data.ajaxMap.allCruxLs;
							var kpiLs = data.ajaxMap.kpiLs;
							var allKpiLs = data.ajaxMap.allKpiLs;
							for(var i = 0;i < kpiLs.length; i++){    
								if (!$("#kpi_"+kpiLs[i].ID).length && null != kpiLs[i].ID) {
									$("#kpi_left").append("<tr id='kpi_"+kpiLs[i].ID+"' dataId='"+kpiLs[i].ID+"' dataName=\""+kpiLs[i].TARGET_NAME+"\" dataDefault='"+kpiLs[i].SHOW_DEFAULT+"' dataOrder=\""+kpiLs[i].SHOW_ORDER+"\" types=\""+kpiLs[i].VALUE+"\"></tr>");
									$("#kpi_left tr:last").append("<td style='width: 120px;'><span title=\""+kpiLs[i].TARGET_NAME+"\">"+kpiLs[i].TARGET_NAME+"</span></td>");
									$("#kpi_left tr:last").append("<td style='width: 100px;'><span title=\""+kpiLs[i].VALUE+"\">"+kpiLs[i].VALUE+"</span></td>");
									$("#kpi_left tr:last").append("<td style='width: 80px;'><select class='dept_select' id='showDefault_"+kpiLs[i].ID+"'><option value='0'><dict:lang value='否' /></option><option value='1'><dict:lang value='是' /></option></td>");
									$("#kpi_left tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+kpiLs[i].ID+"' value='"+kpiLs[i].SHOW_ORDER+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
									$("#showDefault_"+kpiLs[i].ID).find("option[value='"+kpiLs[i].SHOW_DEFAULT+"']").attr("selected",true);
									$("#showDefault_"+kpiLs[i].ID).trigger("chosen:updated");
								}
							}
							for(var i = 0;i < allKpiLs.length; i++){
								if (!$("#kpi_"+allKpiLs[i].ID).length && null != allKpiLs[i].ID) {
									if (null == allKpiLs[i].TARGET_NAME) {
										allKpiLs[i].TARGET_NAME = "";
									}
									$("#kpi_right").append("<tr id='kpi_"+allKpiLs[i].ID+"' dataId='"+allKpiLs[i].ID+"' dataName=\""+allKpiLs[i].TARGET_NAME+"\" dataDefault='' dataOrder='' types=\""+allKpiLs[i].VALUE+"\"></tr>");
									$("#kpi_right tr:last").append("<td ><span title=\""+allKpiLs[i].TARGET_NAME+"\">"+allKpiLs[i].TARGET_NAME+"</span></td>");
									$("#kpi_right tr:last").append("<td ><span title=\""+allKpiLs[i].VALUE+"\">"+allKpiLs[i].VALUE+"</span></td>");
								}
							}
							for(var i = 0;i < cruxLs.length; i++){
								if (!$("#crux_"+cruxLs[i].ID).length && null != cruxLs[i].ID) {
									if (null == cruxLs[i].KEY_NAME) {
										cruxLs[i].KEY_NAME = "";
									}
									$("#crux_left").append("<tr id='crux_"+cruxLs[i].ID+"' dataId='"+cruxLs[i].ID+"' dataName=\""+cruxLs[i].KEY_NAME+"\" dataDefault='"+cruxLs[i].SHOW_DEFAULT+"' dataOrder=\""+cruxLs[i].SHOW_ORDER+"\" types=\""+cruxLs[i].VALUE+"\"></tr>");
									$("#crux_left tr:last").append("<td style='width: 120px;'><span title=\""+cruxLs[i].KEY_NAME+"\">"+cruxLs[i].KEY_NAME+"</span></td>");
									$("#crux_left tr:last").append("<td style='width: 100px;'><span title=\""+cruxLs[i].VALUE+"\">"+cruxLs[i].VALUE+"</span></td>");
									$("#crux_left tr:last").append("<td style='width: 80px;'><select class='dept_select' id='showDefault_"+cruxLs[i].ID+"'><option value='0'><dict:lang value='否' /></option><option value='1'><dict:lang value='是' /></option></td>");
									$("#crux_left tr:last").append("<td ><input type='text' class='_order' id='showOrder_"+cruxLs[i].ID+"' value='"+cruxLs[i].SHOW_ORDER+"' onkeypress=\"return event.keyCode >= 48 &amp;&amp; event.keyCode <= 57\"></td>");
									$("#showDefault_"+cruxLs[i].ID).find("option[value='"+cruxLs[i].SHOW_DEFAULT+"']").attr("selected",true);
									$("#showDefault_"+cruxLs[i].ID).trigger("chosen:updated");
								}
							}
							for(var i = 0;i < allCruxLs.length; i++){
								if (!$("#crux_"+allCruxLs[i].ID).length && null != allCruxLs[i].ID) {
									if (null == allCruxLs[i].KEY_NAME) {
										allCruxLs[i].KEY_NAME = "";
									}
									$("#crux_right").append("<tr id='crux_"+allCruxLs[i].ID+"' dataId='"+allCruxLs[i].ID+"' dataName=\""+allCruxLs[i].KEY_NAME+"\" dataDefault='' dataOrder='' types=\""+allCruxLs[i].VALUE+"\"></tr>");
									$("#crux_right tr:last").append("<td ><span title=\""+allCruxLs[i].KEY_NAME+"\">"+allCruxLs[i].KEY_NAME+"</span></td>");
									$("#crux_right tr:last").append("<td ><span title=\""+allCruxLs[i].VALUE+"\">"+allCruxLs[i].VALUE+"</span></td>");
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
	var kpiData = null;
	var cruxData = null;
	function checkVal(){
		var flag = true;
		var kpiDataArr = [];
		var cruxDataArr = [];
		$("#kpi_left").find("input").each(function(i,item){
				if ("" == $(item).val()) {
					utilsFp.confirmIcon(1,"","","", "<dict:lang value="KPI存在空的显示顺序" />",0,"300","");
					flag = false;
					return false; 
				}else{
					kpiDataArr.push({
						KPIID: $(item).parents("tr").attr("dataId"),
						SHOW_DEFAULT: $("#showDefault_"+$(item).parents("tr").attr("dataId")).val(),
						SHOW_ORDER: $("#showOrder_"+$(item).parents("tr").attr("dataId")).val()
					});
				}
			});
		if (flag) {
			$("#crux_left").find("input").each(function(i,item){
				if ("" == $(item).val()) {
					utilsFp.confirmIcon(1,"","","", "<dict:lang value="关键数据存在空的显示顺序" />",0,"300","");
					flag = false;
					return false; 
				}else{
					cruxDataArr.push({
						CRUXID: $(item).parents("tr").attr("dataId"),
						SHOW_DEFAULT: $("#showDefault_"+$(item).parents("tr").attr("dataId")).val(),
						SHOW_ORDER: $("#showOrder_"+$(item).parents("tr").attr("dataId")).val()
					});
				}
			});
		}
		
		kpiData = JSON.stringify(kpiDataArr);
		cruxData = JSON.stringify(cruxDataArr);
		return flag;
	}
	
	//保存
	function add(){
		if (checkVal()) {
			$("#kpiData").val(kpiData);
			$("#cruxData").val(cruxData);
			document.forms.add_form.submit();
		}
	}
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>