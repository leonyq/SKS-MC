<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes" %>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11"/>
	<jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp" %>
	<title><dict:lang value="修改"/></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1"/>
		<jsp:param name="datePicker" value="1"/>
		<jsp:param name="chosen" value="1"/>
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp" %>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
	<script type="text/javascript" src="${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_11"/>
		<jsp:param name="location" value="inHead"/>
	</jsp:include>
	<!-- 产品静态资源 -->

</head>
<body style="overflow:auto;">
<div class="edit">
	<div class="js-tab">
		<%--<form id="listForm" name="listForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame" <bu:formet exeid="%{exeid}"/>>--%>
		<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame" <bu:formet exeid="%{exeid}"/>>
			<div class="hd">
				<%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
				<div style="margin-left:40px;">
					<s:if test="${isDataAuth == '1'}">
						<span class="dot">*</span>
						<dict:lang value="组织机构"/> <s:if test="${fn:length(deptLs)==1}">
						<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
					</s:if> <s:else>
						<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
					</s:else> </s:if>
				</div>
				<div class="optn">
					<button type="button"  onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
				</div>
			</div>
			<div class="bd">
				<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
					<jsp:param name="modelName" value="VIEW_TYPE_11"/>
					<jsp:param name="location" value="editForm"/>
				</jsp:include>
				<bu:set name="paraMapObj" value="${dataId}" formId="b36254ac37e74240b1528d44627b6a84" type="edit"/>
				<table class="basic-table">
					<input type="hidden" name="formIds" value="b36254ac37e74240b1528d44627b6a84"/>
					<input type="hidden" id="prefixInd" name="b36254ac37e74240b1528d44627b6a84" value="paraMap1@"/>
					<input type="hidden" name="paraMap1@__LEVEL__" value="1"/>
					<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1"/>
					<s:set name="_$viewId" value="'2ee93fb82f634d6abf18c3b1fa665ff3'"/>
					<s:set name="_$formId_1" value="'b36254ac37e74240b1528d44627b6a84'"/>
					<s:set name="_$type" value="'edit'"/>

					<%--工单+批次+机种--%>
					<tr>
						<td class="name-four"/>
						<bu:uitn colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84"/></td>
						<bu:td cssClass="dec-self" colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84" disabled="disabled" >
							<bu:ui style="background-color:rgb(235, 235, 228);"colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}" disabled="disabled" formIndex="1"/>
						</bu:td>

						<td class="name-four"/>
						<bu:uitn colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84"/></td>
						<bu:td cssClass="dec-self" colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84" >
							<bu:ui colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}"  formIndex="1"/>
						</bu:td>

						<td class="name-four"/>
						<bu:uitn colNo="MODEL_CODE" formId="b36254ac37e74240b1528d44627b6a84"/></td>
						<bu:td cssClass="dec-self" colNo="MODEL_CODE" formId="b36254ac37e74240b1528d44627b6a84" >
							<bu:ui colNo="MODEL_CODE" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}"  formIndex="1"/>
						</bu:td>
					</tr>

					<%--司称+监称+工艺--%>
					<tr>
						<td class="name-four"/>
						<bu:uitn colNo="WEIGHT_EMP" formId="b36254ac37e74240b1528d44627b6a84"/></td>
						<bu:td cssClass="dec-self" colNo="WEIGHT_EMP" formId="b36254ac37e74240b1528d44627b6a84" >
							<bu:ui colNo="WEIGHT_EMP" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}"  formIndex="1"/>
						</bu:td>

						<td class="name-four"/>
						<bu:uitn colNo="WEIGHT_MONITOR" formId="b36254ac37e74240b1528d44627b6a84"/></td>
						<bu:td cssClass="dec-self" colNo="WEIGHT_MONITOR" formId="b36254ac37e74240b1528d44627b6a84" >
							<bu:ui colNo="WEIGHT_MONITOR" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}"  formIndex="1"/>
						</bu:td>

						<td class="name-four"/>
						<bu:uitn colNo="CRAFTS_EMP" formId="b36254ac37e74240b1528d44627b6a84"/></td>
						<bu:td cssClass="dec-self" colNo="CRAFTS_EMP" formId="b36254ac37e74240b1528d44627b6a84" >
							<bu:ui colNo="CRAFTS_EMP" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}"  formIndex="1"/>
						</bu:td>
					</tr>

					<%--总重+备重+实投--%>
					<tr>
						<td class="name-four"/>
						<bu:uitn colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
						<bu:td cssClass="dec-self" colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84" >
							<bu:ui colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}"  formIndex="1"/>
						</bu:td>

						<td class="name-four"/>
						<bu:uitn colNo="T2#PREPARE_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
						<bu:td cssClass="dec-self" colNo="T2#PREPARE_COUNT" formId="b36254ac37e74240b1528d44627b6a84" >
							<bu:ui colNo="T2#PREPARE_COUNT" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}"  formIndex="1"/>
						</bu:td>

						<td class="name-four"/>
						<bu:uitn colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84"/></td>
						<bu:td cssClass="dec-self" colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84" >
							<bu:ui colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}"  formIndex="1"/>
						</bu:td>
					</tr>

					<%--投个+管理员--%>
					<tr>
						<td class="name-four"/>
						<bu:uitn colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84"/></td>
						<bu:td cssClass="dec-self" colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84" >
							<bu:ui colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}"  formIndex="1"/>
						</bu:td>

						<td class="name-four"/>
						<bu:uitn colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84"/></td>
						<bu:td cssClass="dec-self" colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84" >
							<bu:ui colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84" dataId="${dataId}"  formIndex="1"/>
						</bu:td>
					</tr>
				</table>
				<bu:jsVal formId="b36254ac37e74240b1528d44627b6a84" formIndex="1"/>

				<div id="container">
					<DIV style="margin-bottom: 11px;">
						<UL class="tab-list tab">
							<LI id="tag1">
								<A class="selectli1" onclick="switchTag('tag1','content1','','');this.blur();" href="javascript:void(0);">
									<SPAN><dict:lang value="投料明细"/></SPAN>
								</A>
                              
							</LI>
                           <LI id="tag2" style="display:block;margin-left:93%;">
                            <div class="extend-btn" style="float: right;margin-top:-25px;">
                                <button type="button" onclick="_addRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f','1');" style="padding:0;" title="<dict:lang value="添加" />">
                                    <i class="ico ico-kl-new-add ico-small"></i>
                                </button>
                                <button type="button" onclick="_delRowExtend('92c585de53ff4e9f879b4e4bc0c16e8f','');" style="padding:0" title="<dict:lang value="移除" /> ">
                                    <i class="ico ico-sc-new-add ico-small"></i>
                                </button>
                            </div>

                        </LI>
						</UL>
					</DIV>
					<DIV class="content1" id="content">
						<DIV id="content1" data-tab="tag1">
							<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
								<div class="datagrid-div2 datagrid-div6 datagrid-view" style="overflow-x:hidden;border-bottom:0;">
									<div class="datagrid-header">
										<div class="datagrid-header-inner" id="datagrid-header-inner92c585de53ff4e9f879b4e4bc0c16e8f">
                                                <bu:addSub formid="b36254ac37e74240b1528d44627b6a84" formIndex="1" selfformid="92c585de53ff4e9f879b4e4bc0c16e8f" hidecol="" viewid=""/>
                                            </div>
                                       
									</div>
									<div class="datagrid-body datagrid-div3" style="height:235px" >
                                       <table class="glxb-table " style="width:100%" id="addTable_92c585de53ff4e9f879b4e4bc0c16e8f"><!--fixedTable-->
                                          <tbody id="tbody_92c585de53ff4e9f879b4e4bc0c16e8f">
                                              <c:forEach var="item" items="${dataList}" varStatus="status">
												<tr>
                                                  
													<td class='dec' style="position:relative; width:30px; text-align:center "><input type="checkbox" style="width:15px; " name="checkbox92c585de53ff4e9f879b4e4bc0c16e8f" id="checkbox92c585de53ff4e9f879b4e4bc0c16e8f" class="parM_ID${status.count}" value="${item.ID}"></td>
                                                    <td class='dec' style="position:relative;">
                                                      <input type="hidden"  id="paraMap${status.count}_ITEM_CODE_SHOW1" name="paraMap1@${status.count}#ITEM_CODE1" value="" maxlength="200" class=" input isSubmit  _VAL_OjbsData _VAL_DATABASE" SAVE_MARK='0'  />
                                                      <input type="text" value="${item.ITEM_CODE}" onBlur="val.valNullDataOnblur(this),val.valOjbsDataOnblur(this)" maxlength="100" id='paraMap${status.count}_ITEM_CODE1' name="paraMap1@${status.count}#ITEM_CODE1" SAVE_MARK='0' onclick="_showCommonTablePage(this,'d54039a23620414c9f79ae8b602d7382','980633287ff9426892f103d4f2fb2c90','物料编码','','%7B%22WP_WIDTH%22%3A%22%22%2C%22WP_HEIGHT%22%3A%22%22%2C%22WP_FULL_SCREEN%22%3A%22%22%7D','cba0b640-7a37-4e3c-ae09-d10f7cc87b2b');" onfocus="this.blur()" readonly="readonly" >
                                                    </td>
                                                    <td class='dec' style="position:relative;"><input type="text" value="${item.ITEM_NUM}" onBlur="val.valNullDataOnblur(this),val.valOjbsDataOnblur(this)" maxlength="100" id='paraMap${status.count}_ITEM_NUM1' name="paraMap1@${status.count}#ITEM_NUM1" SAVE_MARK='0' ></td>
  													<td class='dec' style="position:relative;"><input type="text" value="${item.FEED_NUM}" onBlur="val.valNullDataOnblur(this),val.valOjbsDataOnblur(this)" maxlength="100" id='paraMap${status.count}_FEED_NUM1' name="paraMap1@${status.count}#FEED_NUM1" SAVE_MARK='0' ></td>
	  												<td class='dec' style="position:relative;"><input type="text" value="${item.PROCESS_ORDER}" onBlur="val.valNullDataOnblur(this),val.valOjbsDataOnblur(this)" maxlength="100" id='paraMap${status.count}_PROCESS_ORDER1' name="paraMap1@${status.count}#PROCESS_ORDER1" SAVE_MARK='0' ></td>
                                                   
												</tr>											
											</c:forEach>
											</tbody>
										</table>
                                        
									</div>

								</div>
							</div>
						</DIV>
					</DIV>
				</div>
			</div>
		</form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_11"/>
		<jsp:param name="location" value="jsLoading"/>
	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1"/>
		<jsp:param name="needValidate" value="1"/>
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11"/>
	<jsp:param name="location" value="pageOver"/>
</jsp:include>

<script type="text/javascript">
    var addTableTrMap;
    var loaded = 1;
    var tab_len = 1;

    var currentTag;
    var tabs = "";

    var tabLength = 0;

    function switchTag(tag, content, url) {
        if (currentTag == tag) {
            return false;
        }
        document.getElementById("content1").style.display = "";

        for (i = 1; i < (tab_len + 1); i++) {
            if ("tag" + i == tag) {
                document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
                document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
            } else {
                document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
                document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
            }
            $("#" + tag).addClass("current").siblings().removeClass("current");
            if ("content" + i == content) {
                currentTag = tag;
                document.getElementById(content).className = "";
            } else {
                document.getElementById("content" + i).className = "hidecontent";
            }
            document.getElementById("content").className = content;
        }
    }

    function saveObj() {
        isQuery = false;
        var itemCode = "";
        var itemNum = "";
        var feedCount = "";
        var processOrder = "";
        var flag = true;
        var i = 1;
        var len = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").length;

        var itemCodeArr = [];
        var itemNumArr = [];
        var feedCountArr = [];
        var processOrderArr = [];

        $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").each(function () {
            itemCode = $("#paraMap" + i + "_ITEM_CODE").val();
            itemNum = $("#paraMap" + i + "_ITEM_NUM").val();
            feedCount = $("#paraMap" + i + "_FEED_NUM").val();
            processOrder = $("#paraMap" + i + "_PROCESS_ORDER").val();

            console.log("itemCode: >>> ");
            console.log(itemCode);
            console.log("itemNum: >>> ");
            console.log(itemNum);
            console.log("feedCount: >>> ");
            console.log(feedCount);
            console.log("processOrder: >>> ");
            console.log(processOrder);

            if (itemCode == "" || itemNum == "" || feedCount == "" || processOrder == "") {
                switchTag('tag1', 'content1', '${path}buss/bussModel.ms?exeid=b3d19dd778dc4bf6ae463d3c3a396e30');
            } else {
                itemCodeArr.push(itemCode);
                itemNumArr.push(itemNum);
                feedCountArr.push(feedCount);
                processOrderArr.push(processOrder);

            }

            if (!/^[1-9]+$/.test(itemNum)) {
                flag = false;
                _alertValMsg($("#paraMap" + i + "_ITEM_NUM"), "<dict:lang value="该项只能为正整数" />");
            }

            if (!/^[1-9]+$/.test(feedCount)) {
                flag = false;
                _alertValMsg($("#paraMap" + i + "_FEED_NUM"), "<dict:lang value="该项只能为正整数" />");
            }

            if (!/^[1-9]+$/.test(processOrder)) {
                flag = false;
                _alertValMsg($("#paraMap" + i + "_PROCESS_ORDER"), "<dict:lang value="该项只能为正整数" />");
            }

            i++;
         
        });

        itemCodeArr = itemCodeArr.join(",");
        itemNumArr = itemNumArr.join(",");
        feedCountArr = feedCountArr.join(",");
        processOrderArr = processOrderArr.join(",");


        if (!val.valNullData()) {
            return;
        }
        if (!valData()) {
            return;
        }
        if (!val.valOjbsData()) {
            return;
        }
        if (!val.valDataBaseSetData()) {
            return;
        }

        if ($("#paraMap0_PROJECT_ID").val() == "") {
            _alertValMsg($("#paraMap0_PROJECT_ID_chosen"), "<dict:lang value="该项不能为空" />");
            return;
        }
        if ($("#paraMap1_PROJECT_FLAG_1").val() == "Y") {
            var stratNum = Number($("#paraMap0_PRODUCT_SN_START").val());
            var endNum = Number($("#paraMap0_PRODUCT_SN_END").val());

            if (!isNaN(stratNum) && !isNaN(endNum)) {
                if (stratNum >= endNum) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_START"), "<dict:lang value="号段起始不能大于或等于号段终止" />");
                    return;
                }
                if (endNum - stratNum >= Number($("#paraMap0_PRODUCT_COUNT").val())) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_END"), "<dict:lang value="号段终止不能大于计划数量" />");
                    return;
                }
            } else {
                if ($("#paraMap0_PRODUCT_SN_START").val() >= $("#paraMap0_PRODUCT_SN_END").val()) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_START"), "<dict:lang value="号段起始不能大于或等于号段终止" />");
                    return;
                }
            }
        }

        $("#paraMap1_PROJECT_FLAG_1").attr("disabled", "disabled");
        if (flag == true) {
            $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
            $DisInput.attr("disabled", false);
            if ($("#isCloseWin") && $("#editForm").find("#isCloseWin").length == 0) {
                $("#editForm").append($("#isCloseWin").clone());
                $("#editForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
            }
            $("#saveBtn").prop("disabled", "disabled");
            var ckval = $("#PROJECT_OFONESELF").val();
            var flag = $("#paraMap1_PROJECT_FLAG_1").val();
            document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=6db7bc9fe7994715b514af25e7a4a4f6&ckval=" + ckval + "&flag=" + flag + "&itemCodeArr=" + itemCodeArr + "&itemNumArr=" + itemNumArr + "&feedCountArr=" + feedCountArr + "&processOrderArr=" + processOrderArr;

            var seval = $("#paraMap0_PRODUCT_LINE").val();
            if (ckval == "Y") {
                if (seval == "") {
                    utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择线别" />", 0, "260", "");
                } else {
                    //20180531 工单自动下达校验指示单
                    //checkIndicator();
                    document.forms.editForm.submit();

                }
            } else {
                document.forms.editForm.submit();
            }

            isQuery = true;
            $DisInput.attr("disabled", true);
            parentWindow.query("");
            $("#paraMap1_PROJECT_FLAG_1").removeAttr("disabled");
        }
    }
  
  
 
  function saveObj1() {
        isQuery = false;
        var itemCode = "";
        var itemNum = "";
        var feedCount = "";
        var processOrder = "";
        var cid = "";
    
        var flag = true;
        var i = 1;
    	var a = 1;
        var c = 0;
        var len = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").length;
		console.log("len>>>>>>>");
    	console.log(len);
    
    		
        var itemCodeArr = [];
        var itemNumArr = [];
        var feedCountArr = [];
        var processOrderArr = [];
    	var cidArr = [];
    	
        $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").each(function () {
          
            itemCode1 = $("#paraMap" + a + "_ITEM_CODE1").val();
            itemNum1 = $("#paraMap" + a + "_ITEM_NUM1").val();
            feedCount1 = $("#paraMap" + a + "_FEED_NUM1").val();
            processOrder1 = $("#paraMap" + a + "_PROCESS_ORDER1").val();
          
            cid=$(".parM_ID"+a).val();
          
            console.log("id>>>>");
            console.log(cid);
            console.log("itemCode11: >>> ");
            console.log(itemCode1);
            console.log("itemNum11: >>> ");
            console.log(itemNum1);
            console.log("feedCount11: >>> ");
            console.log(feedCount1);
            console.log("processOrder11: >>> ");
            console.log(processOrder1);
            $("#_alertValMsgDiv").css("top", "0.1px");
          	if (itemCode1 == undefined || itemNum1 == undefined || feedCount1 == undefined || processOrder1 == undefined) {
              console.log("i>>>>>"+i);
              itemCode = $("#paraMap" + i + "_ITEM_CODE_SHOW").val();
              itemNum = $("#paraMap" + i + "_ITEM_NUM").val();
              feedCount = $("#paraMap" + i + "_FEED_NUM").val();
              processOrder = $("#paraMap" + i + "_PROCESS_ORDER").val();
              
              console.log("itemCode: >>> ");
              console.log(itemCode);
              console.log("itemNum: >>> ");
              console.log(itemNum);
              console.log("feedCount: >>> ");
              console.log(feedCount);
              console.log("processOrder: >>> ");
              console.log(processOrder);
              
               if (!/^[1-9]+$/.test(itemNum)) {
                flag = false;
                _alertValMsg($("#paraMap" + i + "_ITEM_NUM"), "<dict:lang value="该项只能为正整数" />");
            	}

                if (!/^[1-9]+$/.test(feedCount)) {
                flag = false;
                _alertValMsg($("#paraMap" + i + "_FEED_NUM"), "<dict:lang value="该项只能为正整数" />");
            	}

            	if (!/^[1-9]+$/.test(processOrder)) {
                flag = false;
                _alertValMsg($("#paraMap" + i + "_PROCESS_ORDER"), "<dict:lang value="该项只能为正整数" />");
            	}
              
                if (itemCode == undefined || itemNum == undefined || feedCount == undefined || processOrder == undefined || itemCode=="") {
               _alertValMsg($("#paraMap0_PROJECT_ID_chosen"), "<dict:lang value="该项不能为空" />");
                return;
                }
                itemCodeArr.push(itemCode);
                itemNumArr.push(itemNum);
                feedCountArr.push(feedCount);
                processOrderArr.push(processOrder);
                i++;
              
            }else {
                if (!/^[1-9]+$/.test(itemNum1)) {
                flag = false;
                _alertValMsg($("#paraMap" + a + "_ITEM_NUM"), "<dict:lang value="该项只能为正整数" />");
            	}

                if (!/^[1-9]+$/.test(feedCount1)) {
                flag = false;
                _alertValMsg($("#paraMap" + a + "_FEED_NUM"), "<dict:lang value="该项只能为正整数" />");
            	}

            	if (!/^[1-9]+$/.test(processOrder1)) {
                flag = false;
                _alertValMsg($("#paraMap" + a + "_PROCESS_ORDER"), "<dict:lang value="该项只能为正整数" />");
            	}
                
                console.log("a>>>>");
                console.log(a);
                itemCodeArr.push(itemCode1);
                itemNumArr.push(itemNum1);
                feedCountArr.push(feedCount1);
                processOrderArr.push(processOrder1);
              	cidArr.push(cid);
                a++;
                
            }
         
            
        });

		
        itemCodeArr = itemCodeArr.join(",");
        itemNumArr = itemNumArr.join(",");
        feedCountArr = feedCountArr.join(",");
        processOrderArr = processOrderArr.join(",");
    	cidArr = cidArr.join(",");
        console.log("itemCodeArr >>>>");
    	console.log(itemCodeArr);

        if (!val.valNullData()) {
            return;
        }
        if (!valData()) {
            return;
        }
        if (!val.valOjbsData()) {
            return;
        }
        if (!val.valDataBaseSetData()) {
            return;
        }
		
        console.log("PROJECT_ID >>>>");
    	console.log($("#paraMapObj_PROJECT_ID_SHOW").val());
    	console.log("PROJECT_FLAG_1 >>>>");
        console.log($("#paraMap1_PROJECT_FLAG_1").val());
        var projectId = $("#paraMapObj_PROJECT_ID_SHOW").val();
    	var modelCode = $("#paraMapObj_MODEL_CODE").val();
        var weightEmpShow = $("#paraMapObj_WEIGHT_EMP_SHOW").val();
    	var weightMonitorShow = $("#paraMapObj_WEIGHT_MONITOR_SHOW").val();
        var crafisEmpShow = $("#paraMapObj_CRAFTS_EMP_SHOW").val();
        var adminEmpShow = $("#paraMapObj_ADMIN_EMP_SHOW").val();
        
      
    		
        if ($("#paraMap0_PROJECT_ID_SHOW").val() == "") {
            _alertValMsg($("#paraMap0_PROJECT_ID_chosen"), "<dict:lang value="该项不能为空" />");
            return;
        }
        if ($("#paraMap1_PROJECT_FLAG_1").val() == "Y") {
            var stratNum = Number($("#paraMap0_PRODUCT_SN_START").val());
            var endNum = Number($("#paraMap0_PRODUCT_SN_END").val());

            if (!isNaN(stratNum) && !isNaN(endNum)) {
                if (stratNum >= endNum) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_START"), "<dict:lang value="号段起始不能大于或等于号段终止" />");
                    return;
                }
                if (endNum - stratNum >= Number($("#paraMap0_PRODUCT_COUNT").val())) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_END"), "<dict:lang value="号段终止不能大于计划数量" />");
                    return;
                }
            } else {
                if ($("#paraMap0_PRODUCT_SN_START").val() >= $("#paraMap0_PRODUCT_SN_END").val()) {
                    _alertValMsg($("#paraMap0_PRODUCT_SN_START"), "<dict:lang value="号段起始不能大于或等于号段终止" />");
                    return;
                }
            }
        }

        $("#paraMap1_PROJECT_FLAG_1").attr("disabled", "disabled");
        if (flag == true) {
            $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
            $DisInput.attr("disabled", false);
            if ($("#isCloseWin") && $("#editForm").find("#isCloseWin").length == 0) {
                $("#editForm").append($("#isCloseWin").clone());
                $("#editForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
            }
            $("#saveBtn").prop("disabled", "disabled");
            var ckval = $("#PROJECT_OFONESELF").val();
            var flag = $("#paraMap1_PROJECT_FLAG_1").val();
            document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=02df0acbe5a74e93963f9bafd099c224&itemCodeArr=" + itemCodeArr + "&itemNumArr=" + itemNumArr + "&feedCountArr=" + feedCountArr + "&processOrderArr=" + processOrderArr + "&projectId=" + projectId +"&modelCode=" + modelCode +"&weightEmpShow="+weightEmpShow +"&weightEmpShow=" + weightEmpShow +"&weightMonitorShow=" +weightMonitorShow +"&crafisEmpShow=" +crafisEmpShow+"&adminEmpShow=" +adminEmpShow + "&cidArr="+cidArr;
            var seval = $("#paraMap0_PRODUCT_LINE").val();
            if (ckval == "Y") {
                if (seval == "") {
                    utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择线别" />", 0, "260", "");
                } else {
                    //20180531 工单自动下达校验指示单
                    //checkIndicator();
                    document.forms.editForm.submit();

                }
            } else {
                document.forms.editForm.submit();
            }

            isQuery = true;
            $DisInput.attr("disabled", true);
            parentWindow.query("");
            $("#paraMap1_PROJECT_FLAG_1").removeAttr("disabled");
         
          if(isCloseWin == "0"){
			top.$(".dialog-close").click();
		}
 
        }
    }
</script>
<script>
 function _addchitable(){
   var tlen = $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f tr").length;
   var b = tlen + 1;
   var thisObj = "this";
   var forid = "'d54039a23620414c9f79ae8b602d7382'";
   var exid = "'980633287ff9426892f103d4f2fb2c90'";
   var title = "'物料编码'";
   var fe = "''";
   var arg1 = "'%7b%22wp_width%22%3a%22%22%2c%22wp_height%22%3a%22%22%2c%22wp_full_screen%22%3a%22%22%7d'";
   var arg2 = "'cba0b640-7a37-4e3c-ae09-d10f7cc87b2b'";
   
   console.log("tableTrLen>>>>>");
   console.log(b);
   var CtableHtml=[];
   CtableHtml.push("<tr id='addTableTr1_92c585de53ff4e9f879b4e4bc0c16e8f'  onclick='_selectExtend(event,this,'')' >");
   CtableHtml.push("<td style='position:relative;width:30px;text-align:center'  class=''>");
   CtableHtml.push("<input type='checkbox' style='width:15px;' name='checkbox92c585de53ff4e9f879b4e4bc0c16e8f' id='checkbox92c585de53ff4e9f879b4e4bc0c16e8f' />");
   CtableHtml.push("</td>");
   CtableHtml.push("<td   style='position:relative;' class='dec'>");
   CtableHtml.push("<input type='hidden'  id='paraMap"+b+"_ITEM_CODE' name='paraMap1@"+b+"#ITEM_CODE' value='' maxlength='200' class='input isSubmit  _VAL_OjbsData _VAL_DATABASE' SAVE_MARK='0'  />");
   CtableHtml.push("<input editName='paraMap1@"+b+"#ITEM_CODE' textVal='paraMap1@"+b+"#ITEM_CODESHOW' type='text'  id='paraMap"+b+"_ITEM_CODE_SHOW' value=''  maxlength='200' class='input  input isSubmit  _VAL_OjbsData _VAL_DATABASE ico-search-input' onclick='_showCommonTablePage("+thisObj+")' onfocus='this.blur()'    SAVE_MARK='0'  /></div>");
   CtableHtml.push("</td>");
   CtableHtml.push("<td   style='position:relative;' class='dec'>");
   CtableHtml.push("<input type='text'  onBlur='val.valNullDataOnblur(this),val.valOjbsDataOnblur(this)' id='paraMap"+b+"_ITEM_NUM' name='paraMap1@"+b+"#ITEM_NUM' value='' class='input isSubmit' SAVE_MARK='0'  />");
   CtableHtml.push("</td>");
   CtableHtml.push("<td   style='position:relative;' class='dec'>");
   CtableHtml.push("<input type='text'  onBlur='val.valNullDataOnblur(this),val.valOjbsDataOnblur(this)'  id='paraMap"+b+"_FEED_NUM' name='paraMap1@"+b+"#FEED_NUM' value='' class='input isSubmit' SAVE_MARK='0'  />");
   CtableHtml.push("</td>");
   CtableHtml.push("<td   style='position:relative;' class='dec'>");
   CtableHtml.push("<input type='text'  onBlur='val.valNullDataOnblur(this),val.valOjbsDataOnblur(this)' id='paraMap"+b+"_PROCESS_ORDER' name='paraMap1@"+b+"#PROCESS_ORDER' value='' maxlength='100' class='input isSubmit  _VAL_DATABASE' SAVE_MARK='0'  />");
   CtableHtml.push("</td>");
   CtableHtml.push("</tr>");
   
   $("#tbody_92c585de53ff4e9f879b4e4bc0c16e8f").append(CtableHtml.join(""));
 }  
  
  
function clearItemVal(thisId){
$("#"+thisId).val("");
$("#"+thisId+"_SHOW").val("");
}
function backFillItemVal(obj,thisId){
$("#"+thisId).val(obj.MKEY);
$("#"+thisId+"_SHOW").val(obj.MKEY);
}

</script>

