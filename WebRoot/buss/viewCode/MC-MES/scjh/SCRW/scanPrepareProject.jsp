<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="VOID-扫描备料" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="cfbe3bf0d5aa41398415daf4b28f48c9"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="3882efd45a12482fadd7b06734fbe216" />
            </div>
          
          	
          
           <div class="optn">
                <button type="button" onclick="userSave();"><i class="ico ico-save"></i><dict:lang value="一键备料"/></button>
                <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消"/>
                </button>
            </div>
          
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                 <tr>
                    <td class="name"/>
                    <span class="dot">*</span>
                    工单号</td>
                    <bu:td cssClass="dec" colNo="CFO_FIX_SN_S" formId="cfbe3bf0d5aa41398415daf4b28f48c9" colspan="4">
                        <input type="text" id="CFO_FIX_SN_S" name="CFO_FIX_SN_S" autocomplete="off" value="" class="input isSubmit" save_mark="0"  style="width:300px;"  onclick="newaddRow()"> </bu:td>
                </tr>
                     
<!--
  <table class="search_table">
      <bu:search deal_mark="1" viewId="3882efd45a12482fadd7b06734fbe216" /> 

  </table>--><DIV style="margin-bottom: 11px;">
                    <UL class="tab-list tab">
                        <LI id="tag1">
                            <A class="selectli1" href="javascript:void(0);">
                                <SPAN><dict:lang value="工单信息"/></SPAN>
                            </A>
                        </LI>

                    </UL>
                </DIV>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
      
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagecfbe3bf0d5aa41398415daf4b28f48c9" id="formPagecfbe3bf0d5aa41398415daf4b28f48c9" value="${formPagecfbe3bf0d5aa41398415daf4b28f48c9}"/>
		<input type="hidden" name="formId" id="formId1" value='cfbe3bf0d5aa41398415daf4b28f48c9'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="cfbe3bf0d5aa41398415daf4b28f48c9">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxcfbe3bf0d5aa41398415daf4b28f48c9" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innercfbe3bf0d5aa41398415daf4b28f48c9">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablecfbe3bf0d5aa41398415daf4b28f48c9">
		<s:set name="_$type" value="'view'" />
		<!--
        <tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="cfbe3bf0d5aa41398415daf4b28f48c9" i18n="1"/></td>
         	<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_cfbe3bf0d5aa41398415daf4b28f48c9" onclick="_selectAjaxTableAllData(this,'cfbe3bf0d5aa41398415daf4b28f48c9')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_PROJECT_ID"  style="width:160px;"class="datagrid-cell"><bu:uitn colNo="PROJECT_ID" formId="cfbe3bf0d5aa41398415daf4b28f48c9" /></td>			
            <td name="noprintset_PRODUCT_MATERIAL"  style="width:160px;" class="datagrid-cell"><bu:uitn colNo="PRODUCT_MATERIAL" formId="cfbe3bf0d5aa41398415daf4b28f48c9" /></td>
			<td name="noprintset_PRODUCT_NAME" style="width:160px;"  class="datagrid-cell"><bu:uitn colNo="PRODUCT_NAME" formId="cfbe3bf0d5aa41398415daf4b28f48c9" /></td>
			<td name="noprintset_PRODUCT_COUNT"  style="width:160px;" class="datagrid-cell"><bu:uitn colNo="PRODUCT_COUNT" formId="cfbe3bf0d5aa41398415daf4b28f48c9" /></td>
			<td name="noprintset_CREATE_TIME"  style="width:160px;" class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="cfbe3bf0d5aa41398415daf4b28f48c9" /></td>		
		</bu:tr>
		</tbody>
		</bu:table>-->
         
       
            
          </div>
		</div>
		</div>
		 <!-- <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivcfbe3bf0d5aa41398415daf4b28f48c9" onscroll="ajaxTableScroll(this,'cfbe3bf0d5aa41398415daf4b28f48c9')">
		
          <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxcfbe3bf0d5aa41398415daf4b28f48c9">
		  <tbody id="tbody_cfbe3bf0d5aa41398415daf4b28f48c9">
		  </tbody>
		
          </table>		</div>-->
          
          <div class="datagrid-div2 datagrid-div6 datagrid-view">
           <div class="datagrid-header">
                                          
                     <div class="datagrid-header-inner" id="datagrid-header-innerb376f2a126f2414d81c63507a3c699c0">
                        <bu:addSub formid="d34c8f48bead40d88c24a153c731de82"  selfformid="b376f2a126f2414d81c63507a3c699c0" formIndex="1" hidecol="" viewid=""/>
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
          
		
		
		<c:if test="${formPagecfbe3bf0d5aa41398415daf4b28f48c9==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=cfbe3bf0d5aa41398415daf4b28f48c9&showLoading=0" />
			</div>
		</c:if>
<!--
 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('cfbe3bf0d5aa41398415daf4b28f48c9','1');">打印</button>
 </div>
 </div>
 <div style="height: 390px;overflow:auto;border-top: 1px solid #eaeaea;">
   
 
 </div>
 </div>-->
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="3882efd45a12482fadd7b06734fbe216" />
  <!--
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="3882efd45a12482fadd7b06734fbe216" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>-->
    
  <script type="text/javascript">
  		
    var manual = true;

    var error = false;

    var stop = false;

    function newaddRow() {

        var projectSnArr = [];

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
            var url = "${path}buss/bussModel_exeFunc.ms?funcMId=2cfa91fe73e647bbbfacb3709d15f441";
			
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
                        console.log("projectSn>>>");
						console.log(projectSn);
                        var len = $("#tbody_b376f2a126f2414d81c63507a3c699c0 tr").length;
                        var j = len + 1;
                        var pre = "paraMap" + j + "_";
                        var preName = "paraMap1@" + j + "#";
                        var tempHtml = "<tr id='addTableTr" + j + "_' onclick=\"_selectExtend(event,this,'')\">"
                            + "<td style='width:30px;height:30px;text-align:center' class=''><input type='checkbox' style='width:15px;' name='checkboxb376f2a126f2414d81c63507a3c699c0' id='checkboxb376f2a126f2414d81c63507a3c699c0'></td>"

                            //工单号
                            + "<td style='position:relative;' class='dec' width='150px'><input type='text' disabled='disabled' id='" + pre + "PROJECT_ID' name='paraMap1@PROJECT_ID' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"

                            //机种料号
                            + "<td style='position:relative;' class='dec' width='150px'><input type='text' disabled='disabled' id='" + pre + "ITEM_CODE' name='paraMap1@ITEM_CODE' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"

                            //机种名称
                            + "<td style='position:relative;' class='dec' width='150px'><input type='text' disabled='disabled' id='" + pre + "ITEM_NAME' name='paraMap1@ITEM_NAME' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"

                            //计划数量
                            + "<td style='position:relative;' class='dec' width='150px'><input type='text' disabled='disabled' id='" + pre + "PRODUCT_COUNT' name='paraMap1@PRODUCT_COUNT' value='' class=' input isSubmit ' readonly='' disabled='disabled'></td>"

                            //创建时间
                            + "<td style='position:relative;' class='dec' width='150px'><input type='text' disabled='disabled' id='" + pre + "CREATE_TIME' name='paraMap1@CREATE_TIME' value='' class='_VAL_NULL input isSubmit _VAL_OjbsData'></td>"

                            + "</tr>";
                        $("#tbody_b376f2a126f2414d81c63507a3c699c0").append(tempHtml);

                        $("#" + pre + "PROJECT_ID").val(projectSn);
                        $("#" + pre + "ITEM_CODE").val(itemCode);
                        $("#" + pre + "ITEM_NAME").val(itemName);
                        $("#" + pre + "PRODUCT_COUNT").val(projectNum);
                        $("#" + pre + "CREATE_TIME").val(createDate);
                    } else {
                        error = true;
                    }
                }
            });
        }

        if(error){
            error = false;
            doBlur();
            utilsFp.confirmIcon(3, "", "doFocus", "", "<dict:lang value="该工单不存在"/>", 0, "300", "");
        }
        doFocus();
    }
     function doFocus() {
        $("#CFO_FIX_SN_S").focus();
        $("#CFO_FIX_SN_S").val("");
        stop = false;
    }
        //添加工单分隔符
    
    function addSplit(e) {
        var e = e || window.event;
        var str = $("#CFO_FIX_SN_S").val();
        var projectSnArr = [];

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
                        if(!stop){
                            setTimeout(function (){
                                if(!stop) {
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
        }else{
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
    
    function doBlur(){
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
  </script>


<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
