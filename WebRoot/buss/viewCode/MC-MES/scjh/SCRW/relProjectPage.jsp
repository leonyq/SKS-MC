<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_10"/>
	<jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp" %>
	<title><dict:lang value="工单关联"/>
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1"/>
		<jsp:param name="datePicker" value="1"/>
		<jsp:param name="chosen" value="1"/>
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp" %>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
	<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_10"/>
		<jsp:param name="location" value="inHead"/>
	</jsp:include>
	<!-- head里面 -->
</head>
<body>
<div class="edit">
	<form id="addForm" name="addForm" action="${path}buss/bussModel.ms?" method="post"
			<bu:formet exeid="%{exeid}"/> target="submitFrame">
		<div class="hd">
			<div style="margin-left:10px;">
				<div class="save-close" style="display:none;"
						<dict:lang value="关闭保存并关闭窗口"/> onclick="saveClose(this)"></div>
				<input type="checkbox" checked id="isCloseWin" name="isCloseWin" value="0" style="display:none;"/>
				<s:if test="${isDataAuth == '1'}">
					<span class="dot">*</span>
					<dict:lang value="组织机构"/>
					<s:if test="${fn:length(deptLs)==1}">
						<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
					</s:if>
					<s:else>
						<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--' listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/>
					</s:else>
				</s:if>
			</div>
			
			<div style="margin-left:10px;">
				<div class="save-close" onclick="switchInput(this)"></div>
				<input type="checkbox" checked id="inputType" name="inputType" value="0" style="display: none;"/>
			</div>
			
			<div class="optn">
				<button type="button" onclick="userSave();"><i class="ico ico-save"></i><dict:lang value="建立关联"/>
				</button>
				<button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消"/>
				</button>
			</div>
		
		</div>
		<div class="bd">
			<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
				<jsp:param name="modelName" value="VIEW_TYPE_10"/>
				<jsp:param name="location" value="addForm"/>
			</jsp:include>
			<bu:set name="paraMapObj" value="${dataId}" formId="7be0e5e80b8f4977ba730bfdc6e382ae" type="add"/>
			<table class="basic-table">
				<input type="hidden" name="formIds" value="7be0e5e80b8f4977ba730bfdc6e382ae"/>
				<input type="hidden" name="7be0e5e80b8f4977ba730bfdc6e382ae" value="paraMap1@"/>
				<input type="hidden" name="paraMap1@__LEVEL__" value="1"/>
				<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1"/>
				<input type="hidden" name="_cfi_id" id="_cfi_id" value="<c:out value='${dataMap.id}'/>"/>
				<input type="hidden" name="loginName" id="loginName" value=""/>
				<input type="hidden" name="_ass_type" id="_ass_type" value="<c:out value='${dataMap.assistanttooltype}'/>"/>
				<s:set name="_$viewId" value="'c24df99aeef2475da3870e356a2f4a52'"/>
				<s:set name="_$formId_1" value="'7be0e5e80b8f4977ba730bfdc6e382ae'"/>
				<s:set name="_$type" value="'add'"/>
				
				<tr>
					<td class="name"/>
					<span class="dot">*</span>
					工单号</td>
					<bu:td cssClass="dec" colNo="CFO_FIX_SN_S" formId="7be0e5e80b8f4977ba730bfdc6e382ae" colspan="4">
						<input type="text" id="CFO_FIX_SN_S" name="CFO_FIX_SN_S" autocomplete="off" value="" class="input isSubmit " style="width:300px;" save_mark="0" onkeypress="addSplit(event);" onkeydown="addSplit();"> </bu:td>
				</tr>
			</table>
			<bu:jsVal formId="7be0e5e80b8f4977ba730bfdc6e382ae" formIndex="1"/>
			
			<div id="container">
				<DIV style="margin-bottom: 11px;">
					<UL class="tab-list tab">
						<LI id="tag1">
							<A class="selectli1" href="javascript:void(0);">
								<SPAN><dict:lang value="工单信息"/></SPAN>
							</A>
						</LI>
					</UL>
				</DIV>
				<DIV class="content1" id="content">
					<DIV id="content1" data-tab="tag1">
						<div class="mod">
							<div class="extend-btn" style="float: right;margin-top:-35px;">
								<button type="button" onclick="newaddRow();" style="padding:0;" title="<dict:lang value="添加" />">
									<i class="ico ico-kl-new-add ico-small"></i>
								</button>
								<button type="button" onclick="_delRowExtend('b376f2a126f2414d81c63507a3c699c0');" style="padding:0" title="<dict:lang value="移除" /> ">
									<i class="ico ico-sc-new-add ico-small"></i>
								</button>
							</div>
							
							<div class="mod-bd">
								<div class="panel datagrid datagrid-div1">
									<div class="datagrid-div2 datagrid-div6 datagrid-view">
										<div class="datagrid-header">
											
											<div class="datagrid-header-inner" id="datagrid-header-innerb376f2a126f2414d81c63507a3c699c0">
												<bu:addSub formid="d34c8f48bead40d88c24a153c731de82" selfformid="b376f2a126f2414d81c63507a3c699c0" formIndex="1" hidecol="" viewid=""/>
											</div>
										
										</div>
										<div class="datagrid-body datagrid-div3" style="height:235px" onscroll="ajaxTableScroll(this,'b376f2a126f2414d81c63507a3c699c0')">
											<table class="glxb-table " style="width:100%" id="addTable_b376f2a126f2414d81c63507a3c699c0">
												<!--fixedTable-->
												
												<tbody id="tbody_b376f2a126f2414d81c63507a3c699c0">
												
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					
					
					</DIV>
				</DIV>
			</div>
	</form>
</div>

</div>

<div style="display: none;">
	<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
</div>
<bu:submit viewId="c24df99aeef2475da3870e356a2f4a52"/> <bu:script viewId="c24df99aeef2475da3870e356a2f4a52"/>


<script type="text/javascript">
    $(function () {
        console.log("_mcDataAuth: >>> ");
        var _dataAu = top.$("#_mcDataAuth").val();
        console.log(_dataAu);
        editStyle();
    });

    function editStyle() {
        $('tbody tr').children().eq(4).width("100px");
        $('tbody tr').children().eq(5).width("100px");
        $('tbody tr').children().eq(6).width("200px");
        $('tbody tr').children().eq(7).width("100px");
        $('tbody tr').children().eq(8).width("140px");
        $('tbody tr').children().eq(9).width("100px");
        $('tbody tr').children().eq(10).width("60px");
    }
</script>


<script type="text/javascript">

    var manual = true;

    var error = false;

    var stop = false;


    function newaddRow() {

        var projectSnArr = new Array();

        $("input[id$='_PROJECT_ID']").each(function () {
            var curSn = $(this).val();
            if (curSn != null) {
                projectSnArr.push(curSn);
            }
        });

        var workOrderSn = $("#CFO_FIX_SN_S").val();

        if (projectSnArr.indexOf(workOrderSn) != -1) {
            doBlur();
            utilsFp.confirmIcon(3, "", "doFocus", "", "<dict:lang value="已存在该单号"/>", 0, "300", "");
            return;
        }

        if (workOrderSn.length > 1) {
            var projectSn = "";
            var itemCode = "";
            var itemName = "";
            var projectNum = "";
            var createDate = "";

            var projectSort = "";
            var url = "${path}buss/bussModel_exeFunc.ms?funcMId=53f9370954764a738d5cefdca0457f1c";

            $.ajax({
                type: "POST",
                dataType: "json",
                url: url,
                data: {"workOrderSn": workOrderSn},
                success: function (data) {
                    if (data.ajaxList.length > 0) {
                        var obj = data.ajaxList[0];
                        projectSn = obj.PROJECT_ID;
                        itemCode = obj.PRODUCT_MATERIAL;
                        itemName = obj.ITEM_NAME;
                        projectNum = obj.PRODUCT_COUNT;
                        createDate = obj.CREATE_TIME;
                        projectSort = obj.PROJECT_SORT;
                        var workSpace = obj.WORK_SPACE;
                        var wareHouse = obj.WARE_HOUSE;
                        var baseUnit = obj.BASE_UNIT;


                        var len = $("#tbody_b376f2a126f2414d81c63507a3c699c0 tr").length;
                        var j = 0;

                        //获取页面上的最后一个tr

                        var lastTrId = $('#tbody_b376f2a126f2414d81c63507a3c699c0 tr:last').attr("id");


                        //判断工单
                        var result = checkProjectFirst();
                        if (result == false) {
                            return;
                        }

                        //页面提第一条工单控制

                        if (lastTrId != null) {
                            var newTrId = lastTrId.replace("addTableTr", "").replace("_b376f2a126f2414d81c63507a3c699c0", "").trim();
                            var trid = parseInt(newTrId);
                            j = trid + 1;
                        } else {
                            j = len + 1;
                        }


                        var pre = "paraMap" + j + "_";
                        var preName = "paraMap1@" + j + "#";
                        var tempHtml = "<tr id='addTableTr" + j + "_b376f2a126f2414d81c63507a3c699c0' onclick=\"_selectExtend(event,this,'')\">"
                            + "<td style='width:30px;height:30px;text-align:center' class=''><input type='checkbox' style='width:15px;' name='checkboxb376f2a126f2414d81c63507a3c699c0' id='checkboxb376f2a126f2414d81c63507a3c699c0'></td>"

                            //工单号
                            + "<td style='position:relative;' class='dec' width='100px'><input type='text'  style='text-align:center' disabled='disabled' id='" + pre + "PROJECT_ID' name='paraMap1@PROJECT_ID' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"

                            //机种料号
                            + "<td style='position:relative;' class='dec' width='100pxpx'><input type='text'  style='text-align:center' disabled='disabled' id='" + pre + "ITEM_CODE' name='paraMap1@ITEM_CODE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"

                            //机种名称
                            + "<td style='position:relative;' class='dec' width='200pxpx'><input type='text'  style='text-align:center' disabled='disabled' id='" + pre + "ITEM_NAME' name='paraMap1@ITEM_NAME' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"

                            //计划数量
                            + "<td style='position:relative;' class='dec' width='100pxpx'><input type='text'  style='text-align:center' disabled='disabled' id='" + pre + "PRODUCT_COUNT' name='paraMap1@PRODUCT_COUNT' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"

                            //创建时间
                            + "<td style='position:relative;' class='dec' width='140pxpx'><input type='text'  style='text-align:center' disabled='disabled' id='" + pre + "CREATE_TIME' name='paraMap1@CREATE_TIME' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                            //工厂
                            // + "<td style='position:relative;' class='dec' width='66.4px'><input type='text' disabled='disabled' id='" + pre + "WORK_SPACE' name='paraMap1@WORK_SPACE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                            //基本单位
                            + "<td style='position:relative;' class='dec' width='100px'><input type='text' style='text-align:center' disabled='disabled' id='" + pre + "BASE_UNIT' name='paraMap1@BASE_UNIT' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"
                            //仓库
                            + "<td style='position:relative;' class='dec' width='60px'><input type='text' style='text-align:center' disabled='disabled' id='" + pre + "WARE_HOUSE' name='paraMap1@WARE_HOUSE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'><input type='hidden' id='" + pre + "prejectSort'  value='' ></td>"

                            + "</tr>";
                        $("#tbody_b376f2a126f2414d81c63507a3c699c0").append(tempHtml);


                        $("#" + pre + "PROJECT_ID").val(projectSn);
                        $("#" + pre + "ITEM_CODE").val(itemCode);
                        $("#" + pre + "ITEM_NAME").val(itemName);
                        $("#" + pre + "PRODUCT_COUNT").val(projectNum);
                        $("#" + pre + "CREATE_TIME").val(createDate);
                        $("#" + pre + "prejectSort").val(projectSort);


                        // $("#" + pre + "WORK_SPACE").val(workSpace);
                        $("#" + pre + "WARE_HOUSE").val(wareHouse);
                        $("#" + pre + "BASE_UNIT").val(baseUnit);


                        //checkProject();

                    } else {
                        error = true;
                    }
                }
            });
        }

        if (error) {
            error = false;
            doBlur();
            utilsFp.confirmIcon(3, "", "doFocus", "", "<dict:lang value="该工单不存在"/>", 0, "300", "");
        }
        doFocus();

    }


    //工单输入校验()
    function checkProjectFirst() {
        var projectId = $('#tbody_b376f2a126f2414d81c63507a3c699c0 tr:first').children().eq(1).find("input").val();
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=53f9370954764a738d5cefdca0457f1c";
        var projectSort = "";
        var packProjectNum = 0;
        var productNum = 0;
        var len = $("#tbody_b376f2a126f2414d81c63507a3c699c0 tr").length;
        var boolean = null;
        //工单大于等于1
        if (len >= 1) {
            if (projectId != null) {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: url,
                    async: false,
                    data: {"workOrderSn": projectId},
                    success: function (data) {
                        if (data.ajaxList.length > 0) {
                            var obj = data.ajaxList[0];
                            projectSort = obj.PROJECT_SORT;
                            console.log("projectSort>>>");
                            console.log(projectSort);
                            //判断若为制造单
                            if (projectSort == 1 || projectSort == "" || projectSort == null) {
                                boolean = 0;
                                utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="制造单无法关联！！！"/>", 0, "300", "");
                                //doFocus
                            }

                        }
                    }
                })

            }
            //paraMap1_prejectSort

        }


        if (boolean == 0) {
            return false;
        }
        return true;
    }


    function checkProjectLast() {

        var projectId = $('#tbody_b376f2a126f2414d81c63507a3c699c0 tr:first').children().eq(1).find("input").val();
        var url = "${path}buss/bussModel_exeFunc.ms?funcMId=53f9370954764a738d5cefdca0457f1c";
        var projectSort = "";
        var packProjectNum = 0;
        var productNum = 0;
        var len = $("#tbody_b376f2a126f2414d81c63507a3c699c0 tr").length;
        var boolean = null;
        //工单大于等于1
        if (len >= 1) {
            if (projectId != null) {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: url,
                    async: false,
                    data: {"workOrderSn": projectId},
                    success: function (data) {
                        if (data.ajaxList.length > 0) {
                            var obj = data.ajaxList[0];
                            projectSort = obj.PROJECT_SORT;
                            console.log("projectSort>>>");
                            console.log(projectSort);
                            //判断若为制造单
                            if (projectSort == 1 || projectSort == "" || projectSort == null) {
                                boolean = 0;
                                utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="制造单无法关联！！！"/>", 0, "300", "");
                                //doFocus
                            }

                        }
                    }
                })

            }
            //paraMap1_prejectSort
            if (len > 1) {
                $("#tbody_b376f2a126f2414d81c63507a3c699c0 tr").each(function (index) {
                    var tdArr = $(this).children();
                    projectSort = tdArr.eq(7).find("input").eq(1).val();

                    if (projectSort == 2) {
                        packProjectNum = packProjectNum + 1;
                        console.log("packProjectNum>>>");
                        console.log(packProjectNum);
                    }
                    if (projectSort == 1) {
                        productNum = productNum + 1;
                        console.log("productNum>>>");
                        console.log(productNum);
                    }
                })

                if (packProjectNum >= 2 && productNum == 0) {
                    boolean = 0;
                    utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请关联制造单！！！"/>", 0, "300", "");
                }
            }
        }

        if (boolean == 0) {
            return false;
        }
        return true;


    }


    function switchInput(self) {
        if (manual == true) {
            $(self).addClass('save-not-close');
            $(self).attr("title", "<dict:lang value="当前:扫描输入"/>");
            manual = false;
            $('#inputType').attr('checked', false);
        }
        else if (manual == false) {
            $(self).removeClass('save-not-close');
            $(self).attr("title", "<dict:lang value="当前:手动输入"/>");
            manual = true;
            $('#inputType').attr('checked', true);
        }
    }

    //添加工单分隔符
    function addSplit(e) {
        var e = e || window.event;
        var str = $("#CFO_FIX_SN_S").val();
        var projectSnArr = new Array();

        $("input[id$='_PROJECT_ID']").each(function () {
            var curSn = $(this).val();
            if (curSn != null) {
                projectSnArr.push(curSn);
            }
        });

        if (!manual) {
            if (projectSnArr.indexOf(str) != -1) {
                doBlur();
                utilsFp.confirmIcon(3, "", "doFocus", "", "<dict:lang value="已存在该单号"/>", 0, "300", "");
            } else {
                if (!manual) {
                    $("#CFO_FIX_SN_S").focus();
                    if (str.length > 0) {
                        if (!stop) {
                            setTimeout(function () {
                                if (!stop) {
                                    newaddRow();
                                }
                            }, 600);
                        }
                    }
                } else {
                    if (e.keyCode == 13) {
                        newaddRow();
                    }
                }
            }
        } else {
            if (e.keyCode == 13) {
                if (projectSnArr.indexOf(str) != -1) {
                    doBlur();
                    utilsFp.confirmIcon(3, "", "doFocus", "", "<dict:lang value="已存在该单号"/>", 0, "300", "");
                } else {
                    newaddRow();
                }
            }
        }

    }

    function doFocus() {
        $("#CFO_FIX_SN_S").focus();
        $("#CFO_FIX_SN_S").val("");
        stop = false;
    }

    function doBlur() {
        stop = true;
        $("#CFO_FIX_SN_S").blur();
    }


    function init() {
        if ($("#leftTable-kz").length > 0) {
            $("#leftTable-kz").show();
        }

        if ($("#leftTable").length > 0) {
            $("#leftTable").show();
        }

        $("#CFO_FIX_SN_S").focus();

        $(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
    }//初始化方法

    function userSave() {

        var _mcDataAuth = top.$("#_mcDataAuth").val();
        
        //核对工单
        var len = $("#tbody_b376f2a126f2414d81c63507a3c699c0 tr").length;

        if (len > 1) {
            var result = checkProjectLast();
            if (result == false) {
                return;
            }

        }


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
        if ($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0) {
            $("#addForm").append($("#isCloseWin").clone());
            $("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
        }
        var sn = $("#CFO_FIX_SN_S").val();

        if (sn == "") {
            var projectSnArr = new Array();

            $("input[id$='_PROJECT_ID']").each(function () {
                var curSn = $(this).val();
                if (curSn != null) {
                    projectSnArr.push(curSn);
                }
            });

            if (!(projectSnArr.length > 0)) {
                _alertValMsg($("#CFO_FIX_SN_S"), "请扫码！");
                return;
            }
            sn = projectSnArr.join(",");
        }

        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=45ec38406b234070a75df318fdae7acf&workOrderSn=" + sn+"&_mcDataAuth="+_mcDataAuth;
        document.forms.addForm.submit();
    }
</script>

<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
	<jsp:param name="needValidate" value="1"/>
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_10"/>
	<jsp:param name="location" value="pageOver"/>
</jsp:include>
