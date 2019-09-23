<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="标签变量" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/listTable.css">
</head>
    <style>
        .bd {
            padding-top: 30px;
            padding-bottom: 20px;
            height: 100%;
            box-sizing: border-box;
            overflow:auto;
        }

        .bd .left,
        .bd .right {
            height:100%;
            width: calc((100% - 1px)/2);
            float: left;
            overflow: auto;
        }

        .bd .line {
            height:100%;
            width: 1px;
            background-color: #ebebeb;
            float: left;
        }

        .bd .main {
            width: 400px;
            height: 100%;
            margin: 0 auto;
            padding: 0;
        }

        .bd .main .item {
            margin-bottom: 15px;
        }

        /* 头部 */
	
        .bd .left .main .item .head {
            height: 30px;
            line-height: 30px;
            padding: 0 10px;
            background-color: #e6eaf4;
            border: 1px solid #dbe1ef;
            border-bottom: none;
            color: #666;
            position: relative;
        }

        /* 头部按钮 */

        .bd .left .main .item .head .operation {
            float: right;
        }

        .bd .left .main .item .head .operation span {
            display: block;
            width: 21px;
            height: 21px;
            float: left;
            margin: 4px 5px;
            cursor: pointer;
        }

        .bd .left .main .item .head .operation span:nth-of-type(2) {
            background-image: url(${path}plf/page/mlabel/img/ico-add.png);
        }

        .bd .left .main .item .head .operation span:nth-of-type(1) {
            background-image: url(${path}plf/page/mlabel/img/ico-custom.png);
        }

        .bd .left .main .item .head .operation span:nth-of-type(3) {
            background-image: url(${path}plf/page/mlabel/img/ico-delete.png);
        }

        .bd .left .main .item .head .operation span:nth-of-type(2):hover {
            background-image: url(${path}plf/page/mlabel/img/ico-add-h.png) !important;
        }

        .bd .left .main .item .head .operation span:nth-of-type(1):hover {
            background-image: url(${path}plf/page/mlabel/img/ico-custom-h.png);
        }

        .bd .left .main .item .head .operation span:nth-of-type(3):hover {
            background-image: url(${path}plf/page/mlabel/img/ico-delete-h.png);
        }

        /* 隐藏的div */

        .bd .left .main .item .head .add_div {
            position: absolute;
            width: 134px;
            background-color: #f6f5f7;
            top: 30px;
            right: -69px;
            z-index: 10;
            border: 1px solid #ebebeb;
            box-shadow: 0 4px 4px rgba(204, 204, 204, 0.6);
            display: none;
        }

        .bd .left .main .item .head .add_div .title {
            height: 30px;
            border-bottom: 1px solid #ebebeb;
            color: #666;
            padding: 0 10px;
        }

        .bd .left .main .item .head .add_div li {
            padding: 0 10px;
            height: 30px;
            color: #333;
            cursor:pointer;
            width: 100%;
		    box-sizing: border-box;
		    overflow: hidden;
		    white-space: nowrap;
		    text-overflow: ellipsis;
        }
	
	.bd .left .main .item .head .add_div li:hover {
		background-color:#ebebeb;
	}
	
        .bd .left .main .item .head .add_div li .selectBox {
            width: 12px;
            height: 12px;
            display: inline-block;
            background-color: #fff;
            background-image: url(${path}plf/page/mlabel/img/unchecked.png);
            margin-right: 5px;
        }

        .bd .left .main .item .head .add_div li input[type="checkbox"] {
            display: none;
        }

        /* 左边内容部分 */

        .bd .left .main .item .body {
            height: 120px;
            border: 1px solid #ebebeb;
            overflow: auto;
        }

        .bd .left .main .item .body li {
            height: 30px;
            line-height: 30px;
            padding-left: 10px;
            cursor:pointer;
        }

        .bd .left .main .item .body li.selected {
            background-color: #f0f4fd;
        }

        /* 右边隐藏的部分 */

        #_radix,
        #_year,
        #_month,
        #_day {
            display: none;
        }

        .bd .right .row .text {
            width: 70px;
            text-align: right;
            display: inline-block;
        }

        .bd .right .container {
            height: 100%;
            background-color: #fff;
            overflow: auto;
            border:none;
            display: none;
        }

        .bd .right .container .bottom{
            height: calc(100% - 80px);
        }

        .bd .right #_radix .bottom{
            height: calc(100% - 120px);
        }

        .bd .right .container .tableBody{
            height: calc(100% - 30px);
            overflow: auto;
        }

        .bd .right .container .top .row .item{
            margin-right: 0;
        }

        .bd .right .bottom table input[type='text']{
            text-align: center;
            border-bottom: 1px solid #666;
    		height: calc(100% - 1px);
        }
        
        .main .top{
        	padding:0;
        }
        
        .main .top .row input{
        	width:320px;
        }
        
        .mCSB_inside > .mCSB_container{
        	margin-right:0;
        }
        
        .mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{
        	background-color:#dddcde;
        }
        
        .mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar, 
        .mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{
        	background-color:#dddcde;
        }
        
        .mCSB_scrollTools .mCSB_draggerRail{
        	 background-color: transparent;
        }
        
        .mCSB_scrollTools{
        	right:-5px !important;
        }
        
    </style>
<body style="background-color:#f6f5f7">
	<div class="content-in">
	<div class="dlist">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame" style="height:100%;">
            <div class="hd">
            	
                <div style="margin-left:10px;">
                <%-- <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	 --%>
                </div>
			    <div class="optn">
			        <button type="button" onclick="add();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			    </div>
			   
			</div>
			<div class="bd"><div style="height:100%;min-height:657px;">
        <div class="left">
            <div class="main">
                <div class="item" id="radix">
                    <div class="head"><dict:lang value="流水号进制" />
                        <div class="operation">
                            <span title="<dict:lang value='自定义添加' />"></span>
                        
                           <span style="display:none;"></span>
                           <span></span>
                           
                        </div>
                        <div class="add_div">
                            <div class="title"><dict:lang value="系统默认添加" /></div>
	                            <ul id="serial_ul">
			                        
	                            </ul>
                        	</div>
                    	</div>
                    <div class="body scroll">
                        <ul id="serialEn_ul">
	                        
						</ul>
                    </div>
                </div>
                <div class="item" id="year">
                    <div class="head"><dict:lang value="年" />
                        <div class="operation">
                            <span title="<dict:lang value='自定义添加'/>"></span>
                            <span style="display:none;"></span>
                            <span></span>
                        </div>
                        <div class="add_div">
                            <div class="title"><dict:lang value="系统默认添加" /></div>
                            <ul id="year_ul">
                                
                            </ul>
                        </div>
                    </div>
                    <div class="body scroll">
                        <ul id="yearEn_ul">
                        
                        </ul>
                    </div>
                </div>
                <div class="item" id="month">
                    <div class="head"><dict:lang value="月" />
                        <div class="operation">
                            <span title="<dict:lang value='自定义添加' />"></span>
                            <span style="display:none;"></span>
                            <span></span>
                        </div>
                        <div class="add_div">
                            <div class="title"><dict:lang value="系统默认添加" /></div>
                            <ul id="month_ul">
                                
                            </ul>
                        </div>
                    </div>
                    <div class="body scroll">
                        <ul id="monthEn_ul">
                        
                        </ul>
                    </div>
                </div>
                <div class="item" id="day" style="margin-bottom:0;">
                    <div class="head"><dict:lang value="日" />
                        <div class="operation">
                            <span title="<dict:lang value='自定义添加' />"></span>
                            <span style="display:none;"></span>
                            <span></span>
                        </div>
                        <div class="add_div">
                            <div class="title"><dict:lang value="系统默认添加" /></div>
                            <ul id="day_ul">
                                
                            </ul>
                        </div>
                    </div>
                    <div class="body scroll">
                        <ul id="dayEn_ul">
                        
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="line"></div>
        <div class="right">
            <div class="main" id="main">
                <div class="container" id="_radix" >
                    <div class="top">
                        <div class="row">
                            <div class="item">
                                <span class="text" style="margin-right:5px;"><dict:lang value="类型" />：</span>
                                <dict:lang value="流水号进制" />
                            </div>
                        </div>
                        <div class="row" style="margin-top:15px;">
                            <div class="item" id="_radix_name">
                                <span class="text">
                                    <span class="dot">*</span><dict:lang value="名称" />：</span>
                                <input type="text" id="radixName" class="_name _VAL_DATABASE" value="" maxlength="50" onkeyup="javascript:utilsFp.replaceLikeVal(this)" >
                            </div>
                        </div>
                        <div class="row" style="margin-top:15px;">
                            <div class="item" id="_radix_radix">
                                <span class="text">
                                    <span class="dot">*</span><dict:lang value="进制" />：</span>
                                <input type="text" id="radixVal" value="" class="_radixVal" onkeypress="return event.keyCode >= 48 && event.keyCode <= 57" maxlength="4" placeholder="<dict:lang value="输入进制数，失去焦点后加载" />">
                            </div>
                        </div>
                    </div>
                    <div class="bottom" style="margin-top:15px;">
                        <div class="tableHead head1">
                            <table>
                                <tr>
                                    <td><dict:lang value="原值" /></td>
                                    <td><dict:lang value="条码值" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll1">
                            <table id="_radix_table" class="_chackVal">

                            </table>
                        </div>
                    </div>
                </div>
                <div class="container" id="_year">
                    <div class="top">
                        <div class="row">
                            <div class="item">
                                <span class="text" style="margin-right:5px;"><dict:lang value="类型" />：</span>
                                <dict:lang value="年" />
                            </div>
                        </div>
                        <div class="row" style="margin-top:15px;">
                            <div class="item">  
                                <span class="text"><span class="dot">*</span><dict:lang value="名称" />：</span>
                                <input type="text" id="yearName" class="_name _VAL_DATABASE" value="" maxlength="50" onkeyup="javascript:utilsFp.replaceLikeVal(this)">
                            </div>
                        </div>
                    </div>
                    <div class="bottom" style="margin-top:15px;">
                        <div class="tableHead head2">
                            <table>
                                <tr>
                                    <td><dict:lang value="年份" /></td>
                                    <td><dict:lang value="条码值" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll2">
                            <table id="_year_table" class="_chackVal">
                                <tr>
                                    <td><input type="hidden" id="year_original_value_1" value="2015">
                                    	<input type="hidden" id="year_seq_1" value="1">
                                    	2015</td>
                                    <td><input type='text' id="year_display_val_1" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_2" value="2016">
                                    	<input type="hidden" id="year_seq_2" value="2">
                                    	2016</td>
                                    <td><input type='text' id="year_display_val_2" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_3" value="2017">
                                    	<input type="hidden" id="year_seq_3" value="3">
                                    	2017</td>
                                    <td><input type='text' id="year_display_val_3" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_4" value="2018">
                                    	<input type="hidden" id="year_seq_4" value="4" maxlength="33">
                                    	2018</td>
                                    <td><input type='text' id="year_display_val_4" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)"></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_5" value="2019">
                                    	<input type="hidden" id="year_seq_5" value="5">
                                    	2019</td>
                                    <td><input type='text' id="year_display_val_5" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_6" value="2020">
                                    	<input type="hidden" id="year_seq_6" value="6">
                                    	2020</td>
                                    <td><input type='text' id="year_display_val_6" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_7" value="2021">
                                    	<input type="hidden" id="year_seq_7" value="7">
                                    	2021</td>
                                    <td><input type='text' id="year_display_val_7" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_8" value="2022">
                                    	<input type="hidden" id="year_seq_8" value="8">
                                    	2022</td>
                                    <td><input type='text' id="year_display_val_8" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_9" value="2023">
                                    	<input type="hidden" id="year_seq_9" value="9">
                                    	2023</td>
                                    <td><input type='text' id="year_display_val_9" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_10" value="2024">
                                    	<input type="hidden" id="year_seq_10" value="10">
                                    	2024</td>
                                    <td><input type='text' id="year_display_val_10" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_11" value="2025">
                                    	<input type="hidden" id="year_seq_11" value="11">
                                    	2025</td>
                                    <td><input type='text' id="year_display_val_11" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_12" value="2026">
                                    	<input type="hidden" id="year_seq_12" value="12">
                                    	2026</td>
                                    <td><input type='text' id="year_display_val_12" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_13" value="2027">
                                    	<input type="hidden" id="year_seq_13" value="13">
                                    	2027</td>
                                    <td><input type='text' id="year_display_val_13" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_14" value="2028">
                                    	<input type="hidden" id="year_seq_14" value="14">
                                    	2028</td>
                                    <td><input type='text' id="year_display_val_14" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_15" value="2029">
                                    	<input type="hidden" id="year_seq_15" value="15">
                                    	2029</td>
                                    <td><input type='text' id="year_display_val_15" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_16" value="2030">
                                    	<input type="hidden" id="year_seq_16" value="16"  >
                                    	2030</td>
                                    <td><input type='text' id="year_display_val_16" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_17" value="2031">
                                    	<input type="hidden" id="year_seq_17" value="17">
                                    	2031</td>
                                    <td><input type='text' id="year_display_val_17" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_18" value="2032">
                                    	<input type="hidden" id="year_seq_18" value="18">
                                    	2032</td>
                                    <td><input type='text' id="year_display_val_18" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_19" value="2033">
                                    	<input type="hidden" id="year_seq_19" value="19" >
                                    	2033</td>
                                    <td><input type='text' id="year_display_val_19" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_20" value="2034">
                                    	<input type="hidden" id="year_seq_20" value="20" >
                                    	2034</td>
                                    <td><input type='text' id="year_display_val_20" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_21" value="2035">
                                    	<input type="hidden" id="year_seq_21" value="21">
                                    	2035</td>
                                    <td><input type='text' id="year_display_val_21" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_22" value="2036">
                                    	<input type="hidden" id="year_seq_22" value="22">
                                    	2036</td>
                                    <td><input type='text' id="year_display_val_22" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_23" value="2037" >
                                    	<input type="hidden" id="year_seq_23" value="23">
                                    	2037</td>
                                    <td><input type='text' id="year_display_val_23" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_24" value="2038">
                                    	<input type="hidden" id="year_seq_24" value="24">
                                    	2038</td>
                                    <td><input type='text' id="year_display_val_24" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_25" value="2039">
                                    	<input type="hidden" id="year_seq_25" value="25">
                                    	2039</td>
                                    <td><input type='text' id="year_display_val_25" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_26" value="2040">
                                    	<input type="hidden" id="year_seq_26" value="26">
                                    	2040</td>
                                    <td><input type='text' id="year_display_val_26" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_27" value="2041">
                                    	<input type="hidden" id="year_seq_27" value="27">
                                    	2041</td>
                                    <td><input type='text' id="year_display_val_27" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_28" value="2042">
                                    	<input type="hidden" id="year_seq_28" value="28">
                                    	2042</td>
                                    <td><input type='text' id="year_display_val_28" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_29" value="2043">
                                    	<input type="hidden" id="year_seq_29" value="29">
                                    	2043</td>
                                    <td><input type='text' id="year_display_val_29" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_30" value="2044">
                                    	<input type="hidden" id="year_seq_30" value="30">
                                    	2044</td>
                                    <td><input type='text' id="year_display_val_30" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_31" value="2045">
                                    	<input type="hidden" id="year_seq_31" value="31">
                                    	2045</td>
                                    <td><input type='text' id="year_display_val_31" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_32" value="2046">
                                    	<input type="hidden" id="year_seq_32" value="32">
                                    	2046</td>
                                    <td><input type='text' id="year_display_val_32" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_33" value="2047">
                                    	<input type="hidden" id="year_seq_33" value="33">
                                    	2047</td>
                                    <td><input type='text' id="year_display_val_33" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_34" value="2048">
                                    	<input type="hidden" id="year_seq_34" value="34">
                                    	2048</td>
                                    <td><input type='text' id="year_display_val_34" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_35" value="2049">
                                    	<input type="hidden" id="year_seq_35" value="35">
                                    	2049</td>
                                    <td><input type='text' id="year_display_val_35" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="year_original_value_36" value="2050">
                                    	<input type="hidden" id="year_seq_36" value="36">
                                    	2050</td>
                                    <td><input type='text' id="year_display_val_36" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                
                            </table>
                        </div>
                    </div>
                </div>
                <div class="container" id="_month">
                    <div class="top">
                        <div class="row">
                            <div class="item">
                                <span class="text" style="margin-right:5px;"><dict:lang value="类型" />：</span>
                                <dict:lang value="月" />
                            </div>
                        </div>
                        <div class="row" style="margin-top:15px;">
                            <div class="item">
                                <span class="text"><span class="dot">*</span><dict:lang value="名称" />：</span>
                                <input type="text" id="monthName" class="_name _VAL_DATABASE" value="" maxlength="50" onkeyup="javascript:utilsFp.replaceLikeVal(this)" >
                            </div>
                        </div>
                    </div>
                    <div class="bottom"  style="margin-top:15px;">
                        <div class="tableHead head3">
                            <table>
                                <tr>
                                    <td><dict:lang value="月份" /></td>
                                    <td><dict:lang value="条码值" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll3">
                            <table id="_month_table" class="_chackVal">
                                <tr>
                                    <td><input type="hidden" id="month_original_value_1" value="1">
                                    	<input type="hidden" id="month_seq_1" value="1">
                                    	1</td>
                                    <td><input type="text" id="month_display_val_1" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="month_original_value_2" value="2">
                                    	<input type="hidden" id="month_seq_2" value="2">
                                    	2</td>
                                    <td><input type="text" id="month_display_val_2" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="month_original_value_3" value="3">
                                    	<input type="hidden" id="month_seq_3" value="3">
                                    	3</td>
                                    <td><input type="text" id="month_display_val_3" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="month_original_value_4" value="4">
                                    	<input type="hidden" id="month_seq_4" value="4" >
                                    	4</td>
                                    <td><input type="text" id="month_display_val_4" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="month_original_value_5" value="5">
                                    	<input type="hidden" id="month_seq_5" value="5">
                                    	5</td>
                                    <td><input type="text" id="month_display_val_5" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="month_original_value_6" value="6">
                                    	<input type="hidden" id="month_seq_6" value="6">
                                    	6</td>
                                    <td><input type="text" id="month_display_val_6" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="month_original_value_7" value="7">
                                    	<input type="hidden" id="month_seq_7" value="7">
                                    	7</td>
                                    <td><input type="text" id="month_display_val_7" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="month_original_value_8" value="8">
                                    	<input type="hidden" id="month_seq_8" value="8">
                                    	8</td>
                                    <td><input type="text" id="month_display_val_8" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="month_original_value_9" value="9">
                                    	<input type="hidden" id="month_seq_9" value="9">
                                    	9</td>
                                    <td><input type="text" id="month_display_val_9" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="month_original_value_10" value="10">
                                    	<input type="hidden" id="month_seq_10" value="10">
                                    	10</td>
                                    <td><input type="text" id="month_display_val_10" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="month_original_value_11" value="11">
                                    	<input type="hidden" id="month_seq_11" value="11">
                                    	11</td>
                                    <td><input type="text" id="month_display_val_11" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="month_original_value_12" value="12">
                                    	<input type="hidden" id="month_seq_12" value="12">
                                    	12</td>
                                    <td><input type="text" id="month_display_val_12" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="container" id="_day">
                    <div class="top">
                        <div class="row">
                            <div class="item">
                                <span class="text" style="margin-right:5px;"><dict:lang value="类型" />：</span>
                                <dict:lang value="天" />
                            </div>
                        </div>
                        <div class="row" style="margin-top:15px;">
                            <div class="item">
                                <span class="text"><span class="dot">*</span><dict:lang value="名称" />：</span>
                                <input type="text" id="dayName" class="_name _VAL_DATABASE" value="" maxlength="50" onkeyup="javascript:utilsFp.replaceLikeVal(this)" >
                            </div>
                        </div>
                    </div>
                    <div class="bottom" style="margin-top:15px;">
                        <div class="tableHead head4">
                            <table>
                                <tr>
                                    <td><dict:lang value="日期" /></td>
                                    <td><dict:lang value="条码值" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tableBody scroll4">
                            <table id="_day_table" class="_chackVal">
                                <tr>
                                    <td><input type="hidden" id="day_original_value_1" value="1">
                                    	<input type="hidden" id="day_seq_1" value="1">
                                    	1</td>
                                    <td><input type="text" id="day_display_val_1" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_2" value="2">
                                    	<input type="hidden" id="day_seq_2" value="2">
                                    	2</td>
                                    <td><input type="text" id="day_display_val_2" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_3" value="3">
                                    	<input type="hidden" id="day_seq_3" value="3">
                                    	3</td>
                                    <td><input type="text" id="day_display_val_3" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_4" value="4">
                                    	<input type="hidden" id="day_seq_4" value="4">
                                    	4</td>
                                    <td><input type="text" id="day_display_val_4" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_5" value="5">
                                    	<input type="hidden" id="day_seq_5" value="5">
                                    	5</td>
                                    <td><input type="text" id="day_display_val_5" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_6" value="6">
                                    	<input type="hidden" id="day_seq_6" value="6">
                                    	6</td>
                                    <td><input type="text" id="day_display_val_6" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_7" value="7">
                                    	<input type="hidden" id="day_seq_7" value="7">
                                    	7</td>
                                    <td><input type="text" id="day_display_val_7" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_8" value="8">
                                    	<input type="hidden" id="day_seq_8" value="8">
                                    	8</td>
                                    <td><input type="text" id="day_display_val_8" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_9" value="9">
                                    	<input type="hidden" id="day_seq_9" value="9">
                                    	9</td>
                                    <td><input type="text" id="day_display_val_9" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_10" value="10">
                                    	<input type="hidden" id="day_seq_10" value="10">
                                    	10</td>
                                    <td><input type="text" id="day_display_val_10" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_11" value="11">
                                    	<input type="hidden" id="day_seq_11" value="11">
                                    	11</td>
                                    <td><input type="text" id="day_display_val_11" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_12" value="12">
                                    	<input type="hidden" id="day_seq_12" value="12">
                                    	12</td>
                                    <td><input type="text" id="day_display_val_12" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_13" value="13">
                                    	<input type="hidden" id="day_seq_13" value="13">
                                    	13</td>
                                    <td><input type="text" id="day_display_val_13" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr> 
                                <tr>
                                    <td><input type="hidden" id="day_original_value_14" value="14">
                                    	<input type="hidden" id="day_seq_14" value="14">
                                    	14</td>
                                    <td><input type="text" id="day_display_val_14" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_15" value="15">
                                    	<input type="hidden" id="day_seq_15" value="15">
                                    	15</td>
                                    <td><input type="text" id="day_display_val_15" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_16" value="16">
                                    	<input type="hidden" id="day_seq_16" value="16">
                                    	16</td>
                                    <td><input type="text" id="day_display_val_16" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_17" value="17">
                                    	<input type="hidden" id="day_seq_17" value="17">
                                    	17</td>
                                    <td><input type="text" id="day_display_val_17" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_18" value="18">
                                    	<input type="hidden" id="day_seq_18" value="18">
                                    	18</td>
                                    <td><input type="text" id="day_display_val_18" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_19" value="19">
                                    	<input type="hidden" id="day_seq_19" value="19">
                                    	19</td>
                                    <td><input type="text" id="day_display_val_19" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_20" value="20">
                                    	<input type="hidden" id="day_seq_20" value="20">
                                    	20</td>
                                    <td><input type="text" id="day_display_val_20" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_21" value="21">
                                    	<input type="hidden" id="day_seq_21" value="21">
                                    	21</td>
                                    <td><input type="text" id="day_display_val_21" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_22" value="22">
                                    	<input type="hidden" id="day_seq_22" value="22">
                                    	22</td>
                                    <td><input type="text" id="day_display_val_22" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_23" value="23">
                                    	<input type="hidden" id="day_seq_23" value="23">
                                    	23</td>
                                    <td><input type="text" id="day_display_val_23" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                    <td><input type="hidden" id="day_original_value_24" value="24">
                                    	<input type="hidden" id="day_seq_24" value="24">
                                    	24</td>
                                    <td><input type="text" id="day_display_val_24" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_25" value="25">
                                    	<input type="hidden" id="day_seq_25" value="25">
                                    	25</td>
                                    <td><input type="text" id="day_display_val_25" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_26" value="26">
                                    	<input type="hidden" id="day_seq_26" value="26">
                                    	26</td>
                                    <td><input type="text" id="day_display_val_26" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_27" value="27">
                                    	<input type="hidden" id="day_seq_27" value="27">
                                    	27</td>
                                    <td><input type="text" id="day_display_val_27" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_28" value="28">
                                    	<input type="hidden" id="day_seq_28" value="28">
                                    	28</td>
                                    <td><input type="text" id="day_display_val_28" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_29" value="29">
                                    	<input type="hidden" id="day_seq_29" value="29">
                                    	29</td>
                                    <td><input type="text" id="day_display_val_29" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_30" value="30">
                                    	<input type="hidden" id="day_seq_30" value="30">
                                    	30</td>
                                    <td><input type="text" id="day_display_val_30" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>
                                <tr>
                                    <td><input type="hidden" id="day_original_value_31" value="31">
                                    	<input type="hidden" id="day_seq_31" value="31">
                                    	31</td>
                                    <td><input type="text" id="day_display_val_31" value="" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)" ></td>
                                </tr>

                            </table>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
    <div style="display: none;" id="bVValLs">
    </div>
		 </form>
	</div>
	</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 
<bu:script viewId="2c2859a0ff234a348d6224f159abf3f5" />
<%@ include file="/plf/common/pub_end.jsp"%>
    <script>
        var checkedUrl = '${path}plf/page/mlabel/img/checked.png';
        var uncheckedUrl = '${path}plf/page/mlabel/img/unchecked.png';

        // 点击显示系统默认添加
        $('.head').on('click', '.operation span:nth-of-type(2)', function (event) {
            $(this).css('background-image', 'url(${path}plf/page/mlabel/img/ico-add-h.png)');
            $(this).parents('.head').find('.add_div').slideDown('fast');
            event.stopPropagation();
            loadScroll(".scroll");
        })

        //阻止事件冒泡
        $('.head').on('click', '.add_div', function (event) {
            event.stopPropagation();
        })

        //点击自定义添加
        $('.head').on('click', '.operation span:nth-of-type(1)', function () { 
        	dataId = "";
        	TYPE = $(this).parents('.item').attr('id');
            $('#_' + $(this).parents('.item').attr('id'))
                            .css('display','block')
                            .siblings()
                            .css('display','none');
            //清空该模块的内容
           $('#_' + $(this).parents('.item').attr('id')).find("input[type='text']").val('');
           $('#_radix').find('.tableBody table').html('');
           loadScroll(".scroll");
        })

        // 名称为空时不可编辑变量值-获取焦点时
        $(".right").on("focus",".bottom input[type='text']" ,function () { 
            if("" == $(this).parents(".container").find("._name").val()){
            	var err = $(this).parents('.container').find('._name');
            	_alertValMsg(err,"<dict:lang value="名称不能为空" />");
            	$(this).blur();
            }
        })
		
		// 条码值获取焦点时--通过上下键实现换行
		$(".right").on("keyup",".bottom input[type='text']" ,function () { 
           if (event.keyCode==38){	//上
           		$(this).parents('tr').prev().find("input[type='text']").focus()
           
           }
			if (event.keyCode==40){	//下 
           		$(this).parents('tr').next().find("input[type='text']").focus()
           
           }
        })
		
        // 变量值不可重复-失去焦点时
        $(".right").on("change",".bottom input[type='text']" ,function () { 
        	var flag = 0;
        	var str = $(this).val();
			if(100 < str.length){
	            _alertValMsg($(this),"<dict:lang value="变量值长度不能超过100字符" />");
	            $(this).val("")
	            $(this).focus();
	         }
        	$(this).parents('._chackVal').find("input[type='text']").each(function(index,item){
        		if(str == $(item).val()){
        			flag ++;
        		}
        	});
			if(1 < flag){
	            _alertValMsg($(this),"<dict:lang value="变量值不能重复" />");
	            $(this).val("")
	            $(this).focus();
	         }
        })
        
        // 点击删除选中项
        $('.head').on('click', '.operation span:nth-of-type(3)', function () { 
            $(this).parents('.item').find("li").each(function(index,item){
            	if("selected" == $(item).attr("class")){
        			var delId = $(item).attr("id");
        			utilsFp.confirmIcon(1,"","delData",delId, "<dict:lang value="确认删除选中的标签变量" />",1,"300","");
        		}
            });
        })

		//删除操作
		function delData(delId){
		        	var url = getDelUrl();
		            $.ajax({
							type: "POST",
						    dataType: "json",
						    url: url,
						    data: "delId="+delId,
							success: function(data){
								if ("NG" == data.ajaxString) {
									utilsFp.confirmIcon(1,"","","", "<dict:lang value='条码数据项已使用此标签变量，不能删除' />",0,"300","");
									return ;
								}
									//清空该模块的内容
							           $("#_radix").find("input[type='text']").val("");
							           $("#_year").find("input[type='text']").val("");
							           $("#_month").find("input[type='text']").val("");
							           $("#_day").find("input[type='text']").val("");
							           $("#_radix").find(".tableBody table").html("");
									getInfo();
									msgPop("<dict:lang value="删除成功" />","","<dict:lang value="摩尔提示" />",200,150,3000);
										$(".main>.container").css("display","none");
							},
								error: function(msg){
									if(msg.readyState!=0){
        							util.closeLoading();
        							utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        							}
							  }	
							});
		}
		
        // 内容项点击事件
        $('.body').on('click', 'li', function () {
            $(this).addClass('selected').siblings().removeClass('selected');
        })

        //点击隐藏添加的div
        $(document).click(function () {
            $(".add_div").slideUp('fast', function () {
                $('.operation span:nth-of-type(2)').css('background-image', 'url(${path}plf/page/mlabel/img/ico-add.png)');
            });
        });

        //选择checkBox事件
        $('.head').on('click', '.add_div li', function () {
            var text = $(this).text();
            var id = $(this).attr("bsId");
            var type = $(this).next().val();
           
	        	var url = getAddUrl();
	        	$.ajax({
						type: "POST",
					    dataType: "json",
					    url: url,
					    data: {
					    	'FALG': "SYS",
					    	'dataId': id
					    },
					    success: function(data){
							 if ("" != data.ajaxString) {
								getInfo();
								
							}
						},
							error: function(msg){
							if(msg.readyState!=0){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
							}
						  }	
						});

        })

        // 动态根据进制添加行     
        $('.right').on('change', '._radixVal', function () {
            var count = $(this).val();
            console.log($(this).parents('.container').find('.tableBody table').html());
            if(count == ""){
                $(this).parents('.container').find('.tableBody table').html("");
                return;
            }
            if (/^\d+$/.test(count) && count > 0) {
                var str = ""
                for (var i = 0; i < count; i++) {	

                    str += "<tr>"
                    str += "<td><input type='hidden' id='radix_original_value_"+(i+1)+"' value='"+i+"'><input type='hidden' id='radix_seq_"+(i+1)+"' value='"+(i+1)+"'>" + i + "</td>"
                    str += "<td><input type='text' id='radix_display_val_"+(i+1)+"' value='' maxlength='33' onkeyup=\"javascript:utilsFp.replaceLikeVal(this)\" ></td>"
                    str += "</tr>"
                }
                $(this).parents('.container').find('.tableBody table').html(str);
                loadScroll(".scroll");
            } else {
            	$(this).val("");
	            _alertValMsg($(this),"<dict:lang value="进制必需为大于0的正整数" />");
            	$(this).focus();
            }

        });
        
        //显示变量值
        var TYPE = "";
        var dataId = "";
        function getSerialBarcodeVal(type, id){
			$("#_"+type).css("display","block")
                            .siblings()
                            .css('display','none');
			TYPE = type;
			dataId = id;
        	var url = getInfoUrl();
            $.ajax({
					type: "POST",
				    dataType: "json",
				    url: url,
				    data: "flag=barcodeVal&bvId="+id,
					success: function(data){
							$("#_"+type+"_table").empty();
							if(null == data){
							return ;}
							if(null != data.ajaxList){
								var barcodeValLs = data.ajaxList;	//变量值
								$("#"+type+"Name").val(barcodeValLs[0].VARIABLE_NAME);
								if ("0" != barcodeValLs[0].DECIMAL_DIGITS) {
									$("#radixVal").val(barcodeValLs[0].DECIMAL_DIGITS);
								}
								
								for(var i = 0;i < barcodeValLs.length; i++){
									var val = barcodeValLs[i].DISPLAY_VAL;
									$("#_"+type+"_table").append("<tr></tr>");
									$("#_"+type+"_table tr:last").append("<td><input type='hidden' id='"+type+"_original_value_"+(i+1)+"' value='"+barcodeValLs[i].ORIGINAL_VALUE+"'><input type='hidden' id='"+type+"_seq_"+(i+1)+"' value='"+barcodeValLs[i].SEQ+"'>"+barcodeValLs[i].ORIGINAL_VALUE+"</td>");
									$("#_"+type+"_table tr:last").append("<td><input type='text' id='"+type+"_display_val_"+(i+1)+"' value=\""+val+"\" title=\""+val+"\" maxlength='33' onkeyup=\"javascript:utilsFp.replaceLikeVal(this)\" ></td>");
								}
							}
					},
						error: function(msg){
        					if(msg.readyState!=0){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
							}
					  }	
					});
            loadScroll(".scroll");
        }
        
        $(function(){
        	getInfo();
        });
        
        //页面——加载数据
        function getInfo(){
		 	var url = getInfoUrl();
		  	$.ajax({
					type: "POST",
				    dataType: "json",
				    url: url,
				    data: "flag=getInfo&dataAuth="+$("#deptLs_data_auth").val(),
					success: function(data){
							if(null == data){
							return ;}
							if(null != data.ajaxString){
								if ("Y" == data.ajaxString) {
									$(".operation span:nth-of-type(2)").attr("style", "display:none;");
								}
							}
							if(null != data.ajaxMap){
								var bVValLs = data.ajaxMap.bVValLs;	//变量值
								var serialLs = data.ajaxMap.serialLs;	//系统流水号tableHead
								$("#serial_ul").empty();
								for(var i = 0;i < serialLs.length; i++){
									var serialId = serialLs[i].ID;
									var serialName = serialLs[i].VARIABLE_NAME;
									$("#serial_ul").append("<li bsId='"+serialId+"' title='"+serialName+"'></li>");
									$("#serial_ul li:last").append(serialName);
									$("#serial_ul li:last").append("<input type='hidden' value='"+serialId+"'>");
								}
								var yearLs = data.ajaxMap.yearLs;	//年
								$("#year_ul").empty();
								for(var i = 0;i < yearLs.length; i++){
									var yearId = yearLs[i].ID;
									var yearName = yearLs[i].VARIABLE_NAME;
									$("#year_ul").append("<li bsId='"+yearLs[i].ID+"' title='"+yearName+"'></li>");
									$("#year_ul li:last").append(yearName);
									$("#year_ul li:last").append("<input type='hidden' value='"+yearId+"'>");
								}
								var monthLs = data.ajaxMap.monthLs;	//月
								$("#month_ul").empty();
								for(var i = 0;i < monthLs.length; i++){
									var monthId = monthLs[i].ID;
									var monthName = monthLs[i].VARIABLE_NAME;
									$("#month_ul").append("<li bsId='"+monthLs[i].ID+"' title='"+monthName+"'></li>");
									$("#month_ul li:last").append(monthName);
									$("#month_ul li:last").append("<input type='hidden' value='"+monthId+"'>");
								}
								var dayLs = data.ajaxMap.dayLs;	//日
								$("#day_ul").empty();
								for(var i = 0;i < dayLs.length; i++){
									var dayId = dayLs[i].ID;
									var dayName = dayLs[i].VARIABLE_NAME;
									$("#day_ul").append("<li bsId='"+dayLs[i].ID+"' title='"+dayName+"'></li>");
									$("#day_ul li:last").append(dayName);
									$("#day_ul li:last").append("<input type='hidden' value='"+dayId+"'>");
								}
								
								//企业数据
								var serialEnLs = data.ajaxMap.serialEnLs;	//系统流水号
								$("#serialEn_ul").empty();
								for(var i = 0;i < serialEnLs.length; i++){
									var serialEnId = serialEnLs[i].ID;
									var serialEnName = serialEnLs[i].VARIABLE_NAME;
									$("#serialEn_ul").append("<li id='"+serialEnId+"' onclick=\"getSerialBarcodeVal('radix', '"+serialEnId+"');\" value='"+serialEnId+"'></li>");
									$("#serialEn_ul li:last").append(serialEnName);
								}
								var yearEnLs = data.ajaxMap.yearEnLs;	//年
								$("#yearEn_ul").empty();
								for(var i = 0;i < yearEnLs.length; i++){
									var yearEnId = yearEnLs[i].ID;
									var yearEnName = yearEnLs[i].VARIABLE_NAME;
									$("#yearEn_ul").append("<li id='"+yearEnId+"' onclick=\"getSerialBarcodeVal('year', '"+yearEnId+"');\" value='"+yearEnId+"'></li>");
									$("#yearEn_ul li:last").append(yearEnName);
								}
								var monthEnLs = data.ajaxMap.monthEnLs;	//月
								$("#monthEn_ul").empty();
								for(var i = 0;i < monthEnLs.length; i++){
									var monthEnId = monthEnLs[i].ID;
									var monthEnName = monthEnLs[i].VARIABLE_NAME;
									$("#monthEn_ul").append("<li id='"+monthEnId+"' onclick=\"getSerialBarcodeVal('month', '"+monthEnId+"');\" value='"+monthEnId+"'></li>");
									$("#monthEn_ul li:last").append(monthEnName);
								}
								var dayEnLs = data.ajaxMap.dayEnLs;	//日
								$("#dayEn_ul").empty();
								for(var i = 0;i < dayEnLs.length; i++){
									var dayEnId = dayEnLs[i].ID;
									var dayEnName = dayEnLs[i].VARIABLE_NAME;
									$("#dayEn_ul").append("<li id='"+dayEnId+"' onclick=\"getSerialBarcodeVal('day', '"+dayEnId+"');\" value='"+dayEnId+"'></li>");
									$("#dayEn_ul li:last").append(dayEnName);
								}
							}
					},
						error: function(msg){
        					if(msg.readyState!=0){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
							}
					  }	
					});
            loadScroll(".scroll");
        }
function checkRadixName(){
    $("#serialEn_ul li").each(function(){
    	        var doc = $(this).text();
    	         console.log(doc);
        	        if(doc == $("#radixName").val()){
        	        _alertValMsg($("#radixName"),"<dict:lang value="变量名称已存在" />");
        	           return false ;
    	            } 
	            })    
            }

	//保存
	function add(){
	    
		var newJSON = null;
    	var valArr = [];
		var figure = 0;
		var flag = true;
			var name = $("#"+TYPE+"Name").val();
			console.log("name"+name);
			var radix = "";
			if ("radix" == TYPE) {
				radix = $("#radixVal").val();
				if ("" == radix) {
	           	 	_alertValMsg($("#radixVal"),"<dict:lang value="进制数不能为空" />");
					return false;
				}
				 $("#serialEn_ul li").each(function(){
    	        var doc = $(this).text();
    	         console.log(doc);
        	        if(doc == name){
        	        _alertValMsg($("#radixName"),"<dict:lang value="变量名称已存在" />");
        	           flag = false;
        	           return  ;
    	            } 
	            }) 
 
	        }else if("year" == TYPE){
	        $("#yearEn_ul li").each(function(){
	            var doc = $(this).text();
	            if(doc ==name){
	             _alertValMsg($("#yearName"),"<dict:lang value="变量名称已存在" />");
        	           flag = false;
        	           return  ;
	            }
	        })
	            
	        }else if("month" == TYPE) {
	            $("#monthEn_ul li").each(function(){
	                var doc = $(this).text();if(doc ==name){
	             _alertValMsg($("#monthName"),"<dict:lang value="变量名称已存在" />");
        	           flag = false;
        	           return  ;
	               }
	            })
	        }else {
    	        $("#dayEn_ul li").each(function(){
    	                var doc = $(this).text();if(doc ==name){
    	             _alertValMsg($("#monthName"),"<dict:lang value="变量名称已存在" />");
            	           flag = false;
            	           return  ;
    	               }
    	            })
	            
	        }
	        
	        
	        if (flag != true){
	                return false;
	            }
	        
			
			if ("" != name.trim()) {
				if (50 < $("#"+TYPE+"Name").val().length) {
	           	 	_alertValMsg($("#"+TYPE+"Name"),"<dict:lang value="变量名称不能超过50字符" />");
					return false;
				}
				if(!val.valDataBaseSetData()){
                return false ;
               }	
				var len = $("#_"+TYPE+"_table tr").length;
				for(var i=0;i<len;i++){
					if ("" == $("#"+TYPE+"_display_val_"+(i+1)).val()) {
	           	 		_alertValMsg($("#"+TYPE+"_display_val_"+(i+1)),"<dict:lang value="变量值不能为空" />");
						return false;
						break ;
					}
					if (figure == 0) {
						figure = $("#"+TYPE+"_display_val_"+(i+1)).val().replace(/\s/g, "").length;
					}
					if (figure != $("#"+TYPE+"_display_val_"+(i+1)).val().replace(/\s/g, "").length) {
	           	 		_alertValMsg($("#"+TYPE+"_display_val_"+(i+1)),"<dict:lang value="变量值位数不一致" />");
						return false;
						break ;
					}
					valArr.push({
						ORIGINAL_VALUE: $("#"+TYPE+"_original_value_"+(i+1)).val(),
						SEQ: $("#"+TYPE+"_seq_"+(i+1)).val(),
						DISPLAY_VAL: $("#"+TYPE+"_display_val_"+(i+1)).val()
					});
					}
					newJSON = JSON.stringify(valArr);
				}else{
					_alertValMsg($("#"+TYPE+"Name"),"<dict:lang value="变量名称不能为空" />");
					return false;
				}
	        	var url = getAddUrl();
	        	//console.log("TYPE==> "+TYPE+"  name==>"+name+"   figure==>"+figure+" radix==>"+radix+"  dataId==>"+dataId+"  newJSON==>"+newJSON)
	        	$.ajax({
						type: "POST",
					    dataType: "json",
					    url: url,
					    data: {
					    	'FALG': "",
					    	'TYPE': TYPE,
					    	'NAME': name,
					    	'DISPLAY_VAL_FIGURE': figure,
					    	'DECIMAL_DIGITS': radix,
					    	'dataId': dataId,
					    	'newJSON': newJSON
					    },
					    success: function(data){
							 if ("" != data.ajaxString) {
								getInfo();
								if (null != data.ajaxString) {
									_alertValMsg($("#"+TYPE+"Name"),"<dict:lang value="变量名称已存在" />");
									return false;
								}else{
										getInfo();
										util.closeLoading();
										msgPop("<dict:lang value="保存成功" />","","<dict:lang value="摩尔提示" />",200,150,3000);
										//$(".main>.container").css("display","none");
										if ("" == dataId) {
											$("#_" + TYPE).find("input[type='text']").val("");
           								 	$("#_radix").find('.tableBody table').html("");
										}else{
											getSerialBarcodeVal(TYPE, dataId);
										}
										 
								}
							}
						},
							error: function(msg){
        					if(msg.readyState!=0){
								util.closeLoading();
								utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
								}
						  }	
						});
	}
    </script>
    <script>
    
    	//加载滚动条
    	function loadScroll(id){
    			$(id).mCustomScrollbar("destroy");
    	         $(id).mCustomScrollbar({
                    axis: "yx",
                    snapAmount: 40,
                    theme: "minimal-dark",
                    keyboard: { scrollAmount: 40 },
                    mouseWheel: { deltaFactor: 40, preventDefault: true },
                    scrollInertia: 80,
                });
    	}
        (function ($) {
            $(window).on("load", function () {
            	loadScroll(".scroll");	
          
            });
        })(jQuery); 
    </script>
    <script>(function($){
      $(window).on('load',function(){
      setPopScroll('.bd');
        setPopScroll('.scroll1','.head1');
        
        setPopScroll('.scroll2','.head2');
        setPopScroll('.scroll3','.head3');
        setPopScroll('.scroll4','.head4');
      })
    })(jQuery)</script>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
 
 
</body>
