<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <title><dict:lang value="新增" />
    </title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="serializeForm" value="1" />
    </jsp:include>
    <link href="${path}plf/page/common/msui/css/css_tab.css"
  rel="stylesheet" type="text/css" />
    <%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    
    
    
    
    <script type="text/javascript">
        var addTableTrMap;
    </script>
    <style type="text/css">
    	body{
    	    background-color:#f6f5f7;
    	}
		.datagrid-header-inner2  tbody { background-color: #e6eaf4; }
		.datagrid-header-inner2 tbody td { height: 30px; color: #666; font-size:15px;text-align: center;}
		.datagrid-header-inner2 td { color: #666; }
		.datagrid-header-inner2 .checkbox { text-align: center; }
		.datagrid-header2 td{
		  border-width: 0 1px 1px 0;
		  border-style: solid;
		  margin: 0;
		}
		.datagrid-header-inner2 tbody td { border-color:#dbe1ef; }
		.datagrid-div22{
			overflow-x: auto; overflow-y: hidden; width: 100%;
		}
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: #f8fcff;
            z-index: 1001;
            opacity:0.5;
            filter:alpha(opacity=88);    
        }
        .white_content{
            display: none;
            position: absolute;
            
            top: -1px;
                left: 0;
            width: 97%;
            height: 84%;
            padding: 10px;
            border: 1px solid #cbe9ff;
            background-color: #f8fcff;
            z-index: 1002;
            overflow: auto;
        }
        .white_contents{
            display: none;
            position: absolute;
            top: 15%;
            left: 2%;
            width: 94%;
            height: 65%;
            padding: 10px;
            border: 1px solid #cbe9ff;
            background-color: #f8fcff;
            z-index: 1002;
            overflow: auto;
        }
        .extend-btn button .ico-kl-new-add{
         width: 15px;
         height: 15px;
         margin-right: 5px;
         margin-bottom: 3px; 
         background: url(${path}plf/page/fp/img/ico-kl.png) no-repeat; 
        }
        .extend-btn button:hover .ico-kl-new-add{
         width: 15px;
         height: 15px;
         margin-right: 5px;
         margin-bottom: 3px; 
         background: url(${path}plf/page/fp/img/ico-kl-h.png) no-repeat; 
        }
        .extend-btn button .ico-sc-new-add{
         width: 15px;
         height: 15px;
         margin-right: 5px;
         margin-bottom: 3px; 
         background: url(${path}plf/page/fp/img/ico-sc.png) no-repeat; 
        }
        .extend-btn button:hover .ico-sc-new-add{
         width: 15px;
         height: 15px;
         margin-right: 5px;
         margin-bottom: 3px; 
         background: url(${path}plf/page/fp/img/ico-sc-h.png) no-repeat; 
        }
        .w80{
        	width:80px;
        }
        .w100{
        	width:100px;
        }
        .w180{
        	width:180px;
        }
        .w120{
        	width:120px;
        }
        .width100{
        	width:100%;
        }
        
        .glxb-table td{
            
                border-color: #dbe1ef;
        }
    </style>
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body style="overflow:hidden;">
<div class="">
    <div class="edit">
    	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
            <div class="hd" >
              
			       <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                	
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
                	</s:if>	
                </div>

                <div class="optn">
                    <button type="button" onclick="saveBom(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
                    <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
                </div>

            </div>
            <div class="bd" style="height:550px;">
           
                <div id="formDiv">
                <input type="hidden"  name="exeid" value="${exeid}">
                <input type="hidden" name="definedMsg" value="${definedMsg}">
                <input type="hidden" name=iframeId value="${iframeId}">
                <input type="hidden" name=formId value="${formId}">
                <s:set name="_$type" value="'add'" />
                <s:token />
                <table class="func_table">
                    <tr>
                        <td width="100%" align="right">

                        </td>
                    </tr>
                </table>
                <table class="basic-table" style="table-layout:fixed;">
                    <input type="hidden" name="formIds" value="881411561f8f4940ac22575c4b8f02ef">
                    <input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
                    <input type="hidden" name="formId" id="formId1" value='b9f80468a9fe4b74ada4fceff23db738'/>
                    <input type="hidden" value="paraMap0@" name="881411561f8f4940ac22575c4b8f02ef">
                    <input type="hidden" value="1" name="paraMap0@__LEVEL__"/>
                    <input type="hidden" value="1" name="paraMap0@__DATA_COUNT__"/>
                    <tbody>
                        <tr>
                            <td class="name" style="width:83px;"><span class="dot">*</span><bu:uitn colNo="CB_ITEM_CODE" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec" style="width:225px;">
                                <bu:ui colNo="CB_ITEM_CODE" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_ITEM_CODE}" style="width:200px;"/>
                            </td>                            
                            <td class="name" style="width:60px;">
                                <bu:uitn colNo="T2#CI_ITEM_NAME" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec" style="width:225px;">
                                <bu:ui colNo="T2#CI_ITEM_NAME" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{T2#CI_ITEM_NAME}"  style="width:200px;"/>
                            </td>                       
                            <td class="name" style="width:60px;">
                                <bu:uitn colNo="T2#CI_ITEM_SPEC" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec" style="width:205px;">
                                <bu:ui colNo="T2#CI_ITEM_SPEC" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{T2#CI_ITEM_SPEC}"  style="width:200px;"/>
                            </td>                            
                        </tr>
                        <tr>
                            <td class="name"><span class="dot">*</span><bu:uitn colNo="CB_VER" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_VER" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_VER}"  style="width:200px;"/>
                            </td>                        
                            <td class="name">
                                <bu:uitn colNo="CB_DEFAULT" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_DEFAULT" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_DEFAULT}"/>
                            </td> 
                            <td class="name">
                                <bu:uitn colNo="CB_TOP_REAL_NAME" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_TOP_REAL_NAME" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_TOP_REAL_NAME}" style="width:200px;"/>
                            </td> 
                        </tr>
                        <tr>
                            <td class="name"><bu:uitn colNo="CB_BOTTOM_REAL_NAME" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_BOTTOM_REAL_NAME" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_BOTTOM_REAL_NAME}"  style="width:200px;"/>
                            </td>                        
                            <td class="name">
                                <bu:uitn colNo="CB_DRAW_REAL_NAME" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_DRAW_REAL_NAME" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_DRAW_REAL_NAME}" style="width:200px;"/>
                            </td> 
                            
                        </tr>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="CB_REMARK" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec" colspan="5">
                                <bu:ui colNo="CB_REMARK" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_REMARK}" style="width:100%; height:80px;"/>
                            </td>                    </tbody>
                </table>
                <div class="js-tab two-js-tab" style="    margin-bottom: 5px;">
                    <div id="hd" class="mod">
                        <div class="mod-hd">
							<h3 class="tit"><dict:lang value="BOM清单明细" /></h3>					
                            <div class="extend-btn" style="float: right;margin-right:10px;margin-top:5px;">
                                <button type="button"    onclick="addAssociatedData('b9f80468a9fe4b74ada4fceff23db738','1','7488ba70464445468a6bb48cbe590988','2','881411561f8f4940ac22575c4b8f02ef');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
    			             	</button>
    			                <button type="button"  onclick="delList();"  style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
    		                    </button> 
                               
                                <input type="hidden"  value="2" id="associatedModelb9f80468a9fe4b74ada4fceff23db738"/>
                            
                            </div>
						</div>
                    </div>
                </div>
                <div style="margin-bottom:10px;" class="topTab two-top-tab">
                    <div id="tabPanel_b9f80468a9fe4b74ada4fceff23db738" class="tabPanel">
                        
                       <div class="panel datagrid datagrid-div1"  id="881411561f8f4940ac22575c4b8f02ef">
                             <div class="datagrid-div22 datagrid-div6 datagrid-view" id="datagrid-header1" style="width:620px;overflow-x: auto;height: 270px;">
                                 <div class="datagrid-header">
                                     <div class="datagrid-header-inner head1" id="datagrid-header-inner" style="overflow: hidden;">
                                        <table  class="datagrid-htable fixedTable datagrid-div6"  id="datagrid-htableb9f80468a9fe4b74ada4fceff23db738">
                                            <tbody>
                                                <input type="hidden" id="addTable_FORM_COL_ID_Db9f80468a9fe4b74ada4fceff23db738" value="3a6a195ea82c4ebbaaaacc3ee52c6438"/>
                                                <tr class="datagrid-header-row">  
                                                	<td class="datagrid-cell" style="width:30px; text-align:center;"></td>
													<td class="datagrid-cell" style="width:30px; text-align:center"><span>
														<input type="checkbox" id="selectAll" onclick="select_All()" style="cursor: pointer;" title="全选"></span>
													</td>
													<td class="datagrid-cell" style="width:180pxpx;text-align:center;display: none;"></td>
                                                	<td class="datagrid-cell" style="width:180px;"><span class="dot">*</span><bu:uitn colNo="CBD_ITEM_CODE" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="CBD_ITEM_NAME" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="CBD_ITEM_SPEC" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:100px;"><span class="dot">*</span><bu:uitn colNo="CBD_UNITS" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:100px;"><span class="dot">*</span><bu:uitn colNo="CBD_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><span class="dot">*</span><bu:uitn colNo="CBD_ITEM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_ITEM_SECTION" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_BOTTOM_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_BOTTOM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_TOP_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_TOP_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:120px;"><span class="dot">*</span><bu:uitn colNo="CBD_ITEM_TYPE" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <!--<td class="datagrid-cell" style="width:40px;">操作</td>-->
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-table-height scroll" style="width:100%;height:240px;overflow: auto;">
                                    <table class="datagrid-btable fixedTable dblClick glxb-table dlist-table" id="datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738" style="table-layout: fixed;">
                                        <input type="hidden" name="level_b9f80468a9fe4b74ada4fceff23db738" value="2"/>
                                        <input type="hidden" id="table_curRowSeqb9f80468a9fe4b74ada4fceff23db738" value="1"/>
                                        <input type="hidden" value="b9f80468a9fe4b74ada4fceff23db738" name="formIds"/>
                                        <input type="hidden" name="b9f80468a9fe4b74ada4fceff23db738" value="paraMap1@"/>
                                        <input type="hidden" value="1" name="paraMap1@__LEVEL__"/>
                                        <input type="hidden" value="1" name="paraMap1@__DATA_COUNT__"/>
                                        <tbody class="datagrid-btbody" id="addDetailBom">
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>
                </div>

                </div>
         </form>
      </div>
    </div>
    </div>

<div id="params">
    <c:forEach var="editParam" items="${editParamList}">
        <input type="hidden" id="relColVal${editParam.subFormId}" value="${editParam.relColVal}">
        <input type="hidden" id="colNoD${editParam.subFormId}" value="${editParam.colNoD}">
        <input type="hidden" id="colNo${editParam.subFormId}" value="${editParam.colNo}">
    </c:forEach>
</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
    <div style="display: none;">
        <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
    </div>

<script type="text/javascript">
     	
    function clearSel(pop,shadow){
		if(ccbFun == "" || ccbFun == null){
			_setSelValue("","",null);
		}else{
			eval("parentWindow."+ccbFun+"('','',null)");
		}
		$("#paraMap0_T2#CI_ITEM_NAME")/val("");
		$("#paraMap0_T2#CI_ITEM_SPEC")/val("");
		parent.closePopWinFp(pop,shadow);
	}
	

    
   
    <%-- 新增--%>
    function addAssociatedData(formId,formIndex,viewId,levelForm,parentFormId){
    
        if(levelForm == "3"){
            var isTr = $("#datagrid-btable-ajax"+parentFormId+" tr").length;
            if(isTr == 0){
                utilsFp.confirmIcon(3,"","","","父表单数据不能为空！","","260","145");
                return;
            }
            var selectedTr = $("#datagrid-btable-ajax"+parentFormId).find(".selected").length;
            if(selectedTr == 0){
              utilsFp.confirmIcon(3,"","","","请先选中一条父表单数据！","","260","145");
              return;
            };
        }
        var associatedModel = $("#associatedModel"+formId).val();
        if(associatedModel == "1"){
            addRow(formId,formIndex,null,levelForm,parentFormId);
        }else{
           // addRowNew();
            var popId = guid();
            var curRowSeq = $("#table_curRowSeq"+formId).val();
            var url = "buss/bussModel.ms?exeid="+viewId+"&formId="+formId+"&formIndex="+formIndex+"&curRowSeq="+curRowSeq+"&popId="+popId+"&type=1&levelForm="+levelForm+"&parentFormId="+parentFormId;
            showPopWinFp(url, 700, 300,null,"<dict:lang value="新增"/>",popId);
           	addRowNew();
            
       }
         defTableWidthRewrite('b9f80468a9fe4b74ada4fceff23db738');
    };
    var i=0;
  function addRowNew(){
                var dataAuth = $("#deptLs_data_auth").val();
               
               // var sobj = $("#isPcb").html();
                var tableLen = $("#datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738 tr ").length +1;
 				var len =i+1 ;
				var pre = "paraMapObj_"+len+"_";
				var preName = "paraMap1@"+len+"#";
				var tempHtml = "<tr id='addTableTr"+len+"_1abddbae1d704169a987c0af3e06c1df' currowseq='0'>"
				+"<td style='width:30px;text-align:center' class='datagrid-cell'><span>"+tableLen+"</span></td>"
         		        +"<td style='width:30px;text-align:center' class='datagrid-cell'><span><input type='checkbox' name='checkbox1abddbae1d704169a987c0af3e06c1df' style='cursor: pointer;width:13px;height:30px;'></span><input type='hidden' class='associted' name='"+preName+"ID' value=''></td>"
         		        +"<td class='datagrid-cell' style='display:none;'></td>"
         			+"<td style='position: relative; width: 180px;'><span><input type='hidden' id='"+pre+"CBD_ITEM_CODE' name='"+preName+"CBD_ITEM_CODE' value='' ><input editname='"+preName+"CBD_ITEM_CODE' textval='"+preName+"CBD_ITEM_CODESHOW' type='text' id='"+pre+"CBD_ITEM_CODE_SHOW' value='' maxlength='50' class='input _VAL_NULL isSubmit input _VAL_DATABASE ico-search-input' onclick=\"_showSelFkSql(this,'add%2Cb9f80468a9fe4b74ada4fceff23db738%2Ce39c1a17560c40639118d30ce3414d6b','物料代码','','%7B%22WP_WIDTH%22%3A%22600%22%2C%22WP_HEIGHT%22%3A%22560%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','68af9a6c-b396-4caa-9214-f027b53a05c4');\" readonly='readonly'></span><input type='hidden' id='paraMapObj_"+len+"_CBD_ITEM_CODE_SHOW_isOpenDataAuth' value='1'></td>"
				+"<td style='position: relative; width: 180px;'><input type='text' id='"+pre+"CBD_ITEM_NAME' disabled name='"+preName+"CBD_ITEM_NAME' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
				+"<td style='position: relative; width: 180px;'><input type='text' id='"+pre+"CBD_ITEM_SPEC' disabled name='"+preName+"CBD_ITEM_SPEC' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
				+"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CBD_UNITS' name='"+preName+"CBD_UNITS' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
				+"<td style='position: relative; width: 100px;'><input type='text' id='"+pre+"CBD_POINT' name='"+preName+"CBD_POINT' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
				+"<td style='position: relative; width: 80px;'><input type='text' style='text-align:right;' id='"+pre+"CBD_ITEM_NUM' name='"+preName+"CBD_ITEM_NUM' value='' maxlength='50' class='_VAL_NULL isSubmit input  _VAL_DATABASE' ></td>"
				+"<td style='position: relative; width: 80px;'><input type='text' style='text-align:right;' id='"+pre+"CBD_ITEM_SECTION' name='"+preName+"CBD_ITEM_SECTION' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
				+"<td style='position: relative; width: 80px;'><input type='text' style='text-align:right;' id='"+pre+"CBD_BOTTOM_POINT' name='"+preName+"CBD_BOTTOM_POINT' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
				+"<td style='position: relative; width: 80px;'><input type='text' style='text-align:right;' id='"+pre+"CBD_BOTTOM_NUM' name='"+preName+"CBD_BOTTOM_NUM' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
				+"<td style='position: relative; width: 80px;'><input type='text' style='text-align:right;' id='"+pre+"CBD_TOP_POINT' name='"+preName+"CBD_TOP_POINT' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
				+"<td style='position: relative; width: 80px;'><input type='text' style='text-align:right;' id='"+pre+"CBD_TOP_NUM' name='"+preName+"CBD_TOP_NUM' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ></td>"
			//	+"<td style='position: relative; width: 120px;'><input type='hidden' id='"+pre+"CBD_ITEM_TYPE' name='"+preName+"CBD_ITEM_TYPE' value='' maxlength='50' class='isSubmit input  _VAL_DATABASE' ><select id='"+pre+"CBD_ITEM_TYPE2' name='"+preName+"CBD_ITEM_TYPE2' class='' style='width:100%'>"+sobj
		    	+"<td style='position: relative; width: 120px;'><select id='"+pre+"CBD_ITEM_TYPE' name='"+preName+"CBD_ITEM_TYPE'  style='width:100%' class='_VAL_NULL input isSubmit _VAL_OjbsData IS_SELECT_FILTER dept_select'><option value=''>--请选择--</option><option value='0'>物料</option>"
                        +"<option value='1'>PCB</option></select>"
				+"</td>"
                        +"</tr>";
                    $("#addDetailBom").append(tempHtml);    
                     defTableWidthRewrite('b9f80468a9fe4b74ada4fceff23db738');
}  
   
   function addRowDataNew(formData){
        $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=3560820510e2450f8ac4486bfcc2a5fd",
        data:formData,
        success: function(data){   
        var resMap = data.ajaxMap;
        console.log(resMap);
        var len =i+1;
        var pre = "paraMapObj_"+len+"_";
        $("#"+pre+"CBD_ITEM_CODE").val(resMap.CBD_ITEM_CODE);
        $("#"+pre+"CBD_ITEM_CODE_SHOW").val(resMap.CBD_ITEM_CODE);
        $("#"+pre+"CBD_ITEM_NAME").val(resMap.CBD_ITEM_NAME);
        $("#"+pre+"CBD_ITEM_SPEC").val(resMap.CBD_ITEM_SPEC);
        $("#"+pre+"CBD_UNITS").val(resMap.CBD_UNITS);
        $("#"+pre+"CBD_POINT").val(resMap.CBD_POINT);
        $("#"+pre+"CBD_ITEM_NUM").val(resMap.CBD_ITEM_NUM);
        $("#"+pre+"CBD_ITEM_SECTION").val(resMap.CBD_ITEM_SECTION);
        $("#"+pre+"CBD_TOP_POINT").val(resMap.CBD_TOP_POINT);
        $("#"+pre+"CBD_BOTTOM_POINT").val(resMap.CBD_BOTTOM_POINT);
        $("#"+pre+"CBD_TOP_NUM").val(resMap.CBD_TOP_NUM);
        $("#"+pre+"CBD_BOTTOM_NUM").val(resMap.CBD_BOTTOM_NUM);
        $("#"+pre+"CBD_ITEM_TYPE").val(resMap.CBD_ITEM_TYPE);
        //$("#"+pre+"CBD_ITEM_TYPE2").val(resMap.CBD_ITEM_TYPE);
        i++;
        },
        error: function(msg){
 
       }
    });
} 
    <%-- 修改数据--%>
    function updateAssociatedData(formId,formIndex,viewId){
         var selectedTr = $("#datagrid-btable-ajax"+formId).find(".selected");
         if(selectedTr.length == 0){
             utilsFp.confirmIcon(3,"","","","请选择一条数据！","","260","145");
             return;
         };
         var uuid = guid();
         selectedTr.wrap("<form id="+uuid+" action=''></form>");
         var formData = form.serialize($("#"+uuid));
         var formDataStr = groupEditData(formData);
         var curRowSeq = selectedTr.attr("curRowSeq");
         selectedTr.unwrap();
         var url = "buss/bussModel.ms?exeid="+viewId+"&formId="+formId+"&formIndex="+formIndex+"&curRowSeq="+curRowSeq+"&popId="+uuid+"&formData="+formDataStr+"&type=2";
         showPopWinFp(url, 700, 300,null,"<dict:lang value="修改"/>",uuid);
    }
    
    <%-- 组合编辑数据--%>
    function groupEditData(formData){
        var str = "";
        for(var key in formData){
            str+=key+":"+formData[key]+",";
        };
        if(str!=""){
            str = str.replace(/#/g,"");
        }
        return str;
    }
    
    <%-- 新增行--%>
    var curRowSeq;
    function addRow(tableId,formIndex,formData,levelForm,parentFormId){
        util.showLoading();
        var addTtable = $('#datagrid-btable-ajax'+tableId);
        var tableTrJq = addTtable.find("tbody tr");
        var row_count = tableTrJq.length;
        if(row_count == 0){
            curRowSeq = 1;
        }else{
            curRowSeq = $("#table_curRowSeq"+tableId).val();
        }
        var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();
        var url ="${path}buss/bussModel_ajaxAddSubComm.ms?FUNC_CODE=F285";
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:{'paraMap.FORMID':tableId,
            'paraMap.formIndex':formIndex,
            'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,
            'paraMap.trIndex':curRowSeq},
            success: function(data){
                util.closeLoading();
                var row = $(data.ajaxString);
                if(row_count % 2 != 0){
                    row.addClass("tr1");//
                }
                //_toClickColor(row);
                addTtable.append(row);
                var associatedModel = $("#associatedModel"+tableId).val();
                var thisTr = $("#addTableTr"+curRowSeq+"_"+tableId);
                /*addTtable.find("tr")*/thisTr.prepend("<td class='datagrid-cell' style='width:30px; text-align:center'><span><input type='checkbox' style='cursor: pointer;width:13px;height:30px;'></span></td>");
                /*addTtable.find("tr")*/thisTr.prepend("<td class='datagrid-cell' style='width:30px; text-align:center;'></td>");
                thisTr.attr("curRowSeq",curRowSeq);
                setRelColVal(formIndex,curRowSeq,thisTr,tableId,levelForm,parentFormId);
                var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
                dataCountObj.val(row_count+ 1);
                curRowSeq++;
                $("#table_curRowSeq"+tableId).val(curRowSeq);// 给子表单新增时使用
                if(associatedModel == "2"){// 弹出新增
                    addData(tableId,formIndex,formData,curRowSeq,thisTr);
                };
                setChosen();//设置下拉框样式
                $(".glxb-table .chosen-container").css("width","100%");
                
                $(".glxb-table tr td:eq(0)").css("width","30px");
                $(".glxb-table tr td:eq(1)").css("width","30px");
                
                $(".glxb-table tr td:eq(2)").css("width","180px");
                $(".glxb-table tr td:eq(3)").css("width","180px");
                $(".glxb-table tr td:eq(4)").css("width","180px");
                $(".glxb-table tr td:eq(5)").css("width","180px");
                $(".glxb-table tr td:eq(6)").css("width","100px");
                $(".glxb-table tr td:eq(7)").css("width","100px");
                $(".glxb-table tr td:eq(8)").css("width","80px");
                $(".glxb-table tr td:eq(9)").css("width","80px");
                $(".glxb-table tr td:eq(10)").css("width","80px");
                $(".glxb-table tr td:eq(11)").css("width","80px");
                $(".glxb-table tr td:eq(12)").css("width","80px");
                $(".glxb-table tr td:eq(13)").css("width","80px");
                $(".glxb-table tr td:eq(14)").css("width","120px");
                
                /*$(".glxb-table .chosen-container").addClass("width100");
                $(".glxb-table tr td:eq(0)").css("width","30px");
                $(".glxb-table tr td:eq(1)").css("width","30px");
                $(".glxb-table tr td:eq(2)").addClass("w180");
                $(".glxb-table tr td:eq(3)").addClass("w180");
                $(".glxb-table tr td:eq(4)").addClass("w180");
                $(".glxb-table tr td:eq(5)").addClass("w100");
                $(".glxb-table tr td:eq(6)").addClass("w100");
                $(".glxb-table tr td:eq(7)").addClass("w80");
                $(".glxb-table tr td:eq(8)").addClass("w80");
                $(".glxb-table tr td:eq(9)").addClass("w80");
                $(".glxb-table tr td:eq(10)").addClass("w80");
                $(".glxb-table tr td:eq(11)").addClass("w80");
                $(".glxb-table tr td:eq(12)").addClass("w80");
                $(".glxb-table tr td:eq(13)").addClass("w120");*/
                //$(".glxb-table tr td:eq(2)").css("display","none");
                thisTr.find("td:eq(8) input").css("text-align","right");
                thisTr.find("td:eq(9) input").css("text-align","right");
                thisTr.find("td:eq(11) input").css("text-align","right");
                thisTr.find("td:eq(13) input").css("text-align","right");
                $(".glxb-table tr td:last-child").css("display","none");
                /*$(".glxb-table tr td:last-child").css("width","40px;");*/
                reSort("datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738");
                defTableWidthRewrite('b9f80468a9fe4b74ada4fceff23db738');
            },
            error: function(XMLHttpRequest, textStatus, errorThrown){
                util.closeLoading();
                var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
                if (null != sessionstatus && sessionstatus == "noAuthority") {
                }else{
                    utilsFp.alert("error:"+errorThrown);
                }
           }
        });
    }
    
    function select_All() {
    	var addTable = $("#datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738");
		if($("#selectAll").attr("checked")) {
			addTable.find("tbody :checkbox").each(function() {
				$(this).attr("checked", true);
			});
		} else {
			addTable.find("tbody :checkbox").each(function() {
				$(this).attr("checked", false);
			});
		}

	}
    function myDeleteRow(){
        var addTable = $("#datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738");
		addTable.find("tbody :checkbox").each(function() {
			if($(this).attr("checked")){
			   $(this).parent().parent().parent().remove(); 
			}
		});
		reSort("#datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738");
		
}
    
    function delList() {
    	var addTable = $("#datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738");
		var x = 0;
		addTable.find("tbody :checkbox").each(function() {
			if($(this).attr("checked")) {
				x++;
				$(this).parent().parent().parent().remove(); 
			//	var trid = "#" + $(this).parent().parent().parent().attr("id");
			//	$(trid).remove();
			//	reSort("datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738");
			/*	$(".glxb-table .chosen-container").css("width","100%");
                $(".glxb-table tr td:eq(0)").css("width","30px");
                $(".glxb-table tr td:eq(1)").css("width","30px");
                $(".glxb-table tr td:eq(2)").css("width","180px");
                $(".glxb-table tr td:eq(3)").css("width","180px");
                $(".glxb-table tr td:eq(4)").css("width","180px");
                $(".glxb-table tr td:eq(5)").css("width","100px");
                $(".glxb-table tr td:eq(6)").css("width","100px");
                $(".glxb-table tr td:eq(7)").css("width","80px");
                $(".glxb-table tr td:eq(8)").css("width","80px");
                $(".glxb-table tr td:eq(9)").css("width","80px");
                $(".glxb-table tr td:eq(10)").css("width","80px");
                $(".glxb-table tr td:eq(11)").css("width","80px");
                $(".glxb-table tr td:eq(12)").css("width","80px");
                $(".glxb-table tr td:eq(13)").css("width","120px");*/
			}
		});
		$("#selectAll2").attr("checked", false);
		if(x == 0) {
			utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="请选择要删除的数据"/>", 0, "", "");
			
		}
		reSort("datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738");
		
	}
    
    function reSort(objid){
    
         
         var i = 1;
         
         $("#"+objid+" tbody tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
      

     /*    var i = 1;
         $("#"+objid+" tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });*/
    }
    
    <%-- 二三级表单关联字段赋值 --%>
    function setRelColVal(formIndex,curRowSeq,thisTr,tableId,levelForm,parentFormId){
          if($(".three-top-tab").length > 0){
              var val;
               var uuid = guid();
               var name = "paraMap"+formIndex+"@"+curRowSeq+"#";
               var tdStr = "<td style='display:none'>";
               if(levelForm=="2"){
                   val = uuid.replace(/-/g,"");
                   name += $("#colNo"+tableId).val();
               }else{
                   name += $("#colNoD"+tableId).val();
                   val = $("#datagrid-btable-ajax"+parentFormId).find(".selected .associted").val();
               };
               tdStr+="<input type='hidden' class='associted'  name='"+name+"' value='"+val+"'></td>";
               thisTr.prepend(tdStr);
       }
    }
    
    <%-- 删除当前行 --%>
    function delRow(thisObj){
        var formId = $(thisObj).parents("table").attr("id").replace("datagrid-btable-ajax","");
        if($(thisObj).parents(".two-top-tab").length>0){
            var isTr = 0;
            $(".three-content-"+formId+" .threeForm tr").each(function (i){
                isTr++; 
                return false;
            });
            if(isTr > 0){
                utilsFp.confirmIcon(3,"","","","<dict:lang value="请先删除该行下的子数据"/>","","260","145");
                return;
            }
        }
        var oldCurRowSeq = $("#table_curRowSeq"+formId).val();
        $("#table_curRowSeq"+formId).val(oldCurRowSeq-1);
        $(thisObj).parent().parent().remove();
    }
    
    <%-- 删除多余的样式 --%>
    function removeClass(){
        if($(".datagrid-view").hasClass("datagrid-div2")){
            $(".datagrid-view").removeClass("datagrid-div2");
        }
    };
    
    <%-- 新增数据时回填 --%>
    function addData(tableId,formIndex,formData,curRowSeq,thisTr){
        deserializeData(tableId,formIndex,formData,curRowSeq,thisTr);
    }
    
    <%-- 修改数据时回填 --%>
    function editData(tableId,formIndex,formData,curRowSeq){
         var thisTr = $("#addTableTr"+curRowSeq+"_"+tableId);
         deserializeData(tableId,formIndex,formData,curRowSeq,thisTr);
         $(".dept_select").trigger("chosen:updated");
    }
    
    <%-- 反序列化数据 --%>
    function deserializeData(tableId,formIndex,formData,curRowSeq,thisTr){
        var uuid = guid();
        thisTr.wrap("<form id="+uuid+" action='#'></form>");
        form.deserialize($("#"+uuid),formData);
        thisTr.unwrap();
    }
    
    <%-- 验证 --%>
    function valData(){
        var checkRes = true;
        return checkRes;  
    }
    
    function setHideTab(init){
        //var threeCurrentContent= $(".two-js-tab .current").attr("id").replace("title-","three-content-");
        //$("."+threeCurrentContent).show();
        //if(!init){
           //$(".three-content").hide();
           //$("."+threeCurrentContent).show();
        //};
    }
    
    <%-- tab验证 --%>
    function switchTag(thisObj){
        if($(thisObj).parents(".tabDiv").length > 0){
            $(".tabDiv").hide();
            $(thisObj).parents(".tabDiv").show();
            var countTab = $(thisObj).parents(".tabDiv").attr("count-tab");
            $(".tab li").removeClass("current");
            $("#title-"+countTab).addClass("current");
        }else{
            var thisContent = $(thisObj).parents(".tabPanel");
            thisContent.siblings().hide();
            thisContent.show();
            var thisTab = thisContent.attr("id").replace("tabPanel_","title-");
            $("#"+thisTab).siblings().removeClass("current");
            $("#"+thisTab).addClass("current");
        }
    };
    
    $(function(){
        <%-- 选中行加标识 --%>
        $(".datagrid-btable-pop tr").live("click",function(){
            var _this = $(this);
            if(!_this.hasClass("selected")){
                $(".datagrid-btable-pop tr").removeClass("selected");
                _this.addClass('selected');
            };
        });
        
        <%-- 选中tab加标识 --%>
        $(".two-js-tab li").live("click",function(){
            var _this = $(this);
            if($(".datagrid-btable-pop").length>0){
                var thisTab = _this.attr("id").replace("title-","tabPanel_");
                $(".two-top-tab .tabPanel").hide();
                $("#"+thisTab).show();
                setHideTab(false);
            }else{
                var thisTab = _this.attr("id").replace("title-","tab");
                $(".tabDiv").hide();
                $("."+thisTab).show();
            };
            if(!_this.hasClass("current")){
                _this.siblings().removeClass("current");
                _this.addClass("current");
             };
        });
        
         <%-- 选中tab加标识 --%>
        $(".three-js-tab li").live("click",function(){
            var _this = $(this);
            var thisTab = _this.attr("id").replace("title-","tabPanel_");
            $("#"+thisTab ).siblings().hide();
            $("#"+thisTab).show();
            if(!_this.hasClass("current")){
                _this.siblings().removeClass("current");
                _this.addClass("current");
            };
        });
        setHideTab(true);
    });
    
    //验证bom明细不能为空
    function bomDetilVal(){
       var len = $("#datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738").find("tr").length;
       if(len == 0){
            utilsFp.confirmIcon(1,"","","","<dict:lang value="BOM清单明细不能为空"/>","","260","145");
           return false;
       }else{
            	return true;
        }
    }
    
    function saveBom(thisObj){
                        isQuery = false;
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
		        return ;
	       	}
                        var flagVal = bomDetilVal();
			if(!flagVal){
                           return ;
                         }
           
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
                        
                       if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                     

                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=4336a97f90f54017b2fc199298bf0d30"; 
       
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
}
function cbFun3(MKEY,val,obj){
	_thisSelObj.value = val;
	var editName=$(_thisSelObj).attr("editName");
	$("input[name='"+editName+"']").val(MKEY);
	//var editObj = "input[type='hidden'][name='"+$(_thisSelObj).attr("editName")+"']";
	if(null!=obj){
		var indx = editName.indexOf("#");
		var CB_ITEM_NAME = editName.substring(0,indx)+"#"+"CBD_ITEM_NAME";
		$("input[name='"+CB_ITEM_NAME+"']").val(obj.eq(4).text());
		var CB_ITEM_SPEC = editName.substring(0,indx)+"#"+"CBD_ITEM_SPEC";
		$("input[name='"+CB_ITEM_SPEC+"']").val(obj.eq(5).text());
		var CB_ITEM_TYPE = editName.substring(0,indx)+"#"+"CBD_ITEM_TYPE";
		var str='';
		if(obj.eq(6).text()==1){
			str='PCB';
		}else{
			str='物料';
		}
		$("input[name='"+CB_ITEM_TYPE+"']").val(str);
	}
	_thisSelObj.focus();
}

</script>
<script>(function($){
  $(window).on('load',function(){
       setPopScroll('.scroll','.head1');
  })
})(jQuery)</script>

<bu:script viewId="eb2fc1dcd74d4a20983047cea14e072e" />

<bu:submit viewId="eb2fc1dcd74d4a20983047cea14e072e" />
    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

