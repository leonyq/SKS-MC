<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_20" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <title><dict:lang value="修改" /></title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="serializeForm" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <style>
    	
		.datagrid-header-inner2  tbody { background-color: #e6eaf4; }
		.datagrid-header-inner2 tbody td { height: 30px; color: #666; font-size:15px;text-align: center;}
		.datagrid-header-inner2 td { color: #666; }
		.datagrid-header-inner2 .checkbox { text-align: center; }
		.datagrid-header2 td{
		  border-width: 0 1px 1px 0;
		  border-style: solid;
		  margin: 0;
		}
		.datagrid-header-inner2 tbody td { border-color: #dbe1ef; }
		.datagrid-div22{
			overflow-x: auto; overflow-y: hidden; width: 100%;
		}
		.glxb-table tr{
		    height:30px;
		}
		
		.glxb-table td{
		    padding:0 5px;
		    box-sizing:border-box;
		    text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
		}
		
		.glxb-table tr td:nth-of-type(1){
		    width:30px;
		}
		
		.glxb-table tr td:nth-of-type(2){
		    width:30px;
		}
		
		.glxb-table tr td:nth-of-type(3){
		    width:0px;
		}
		
		.glxb-table tr td:nth-of-type(4){
		    width:180px;
		}
		
		.glxb-table tr td:nth-of-type(5){
		    width:180px;
		}
		
		.glxb-table tr td:nth-of-type(6){
		    width:180px;
		}
		
		.glxb-table tr td:nth-of-type(7){
		    width:100px;
		}
		
		.glxb-table tr td:nth-of-type(8){
		    width:100px;
		}
		
		.glxb-table tr td:nth-of-type(9){
		    width:80px;
		    text-align:right;
		}
		
		.glxb-table tr td:nth-of-type(10){
		    width:80px;
		    text-align:right;
		}
		
		.glxb-table tr td:nth-of-type(11){
		    width:80px;
		}
		
		.glxb-table tr td:nth-of-type(12){
		    width:80px;
		    text-align:right;
		}
		
		.glxb-table tr td:nth-of-type(13){
		    width:80px;
		}
		
		.glxb-table tr td:nth-of-type(14){
		    width:80px;
		    text-align:right;
		}
		
		.glxb-table tr td:nth-of-type(15){
		    width:120px;
		}
            
            
            
            
    </style>
    <script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    
    
</head>
<body style="overflow: hidden;background-color:white;">
<div class="mod">
<div class="edit">
    
    <div class="bd" style="border-bottom-style: none;">
        <form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
            <bu:formet exeid="%{exeid}" />>
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				<jsp:param name="modelName" value="VIEW_TYPE_20" />
     				<jsp:param name="location" value="editForm" />
  				</jsp:include>
                <table class="basic-table" style="table-layout:fixed;">
                    <input type="hidden" name="formIds" value="881411561f8f4940ac22575c4b8f02ef">
                    <input type="hidden" name="formId" id="formId1" value='b9f80468a9fe4b74ada4fceff23db738'/>
                    <input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
                    <input type="hidden" value="paraMap0@" name="881411561f8f4940ac22575c4b8f02ef">
                    <input type="hidden" value="1" name="paraMap0@__LEVEL__"/>
                    <input type="hidden" value="1" name="paraMap0@__DATA_COUNT__"/>
                    <tbody>
                        <tr>
                            <td class="name" style="width:52px;">
                                <bu:uitn colNo="CB_ITEM_CODE" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec"  style="width:225px;">
                                <bu:ui colNo="CB_ITEM_CODE" readonly="readonly" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_ITEM_CODE}" dataId="${dataId}"  style="width:200px;"/>
                            </td>                            
                            <td class="name" style="width:52px;">
                                <bu:uitn colNo="T2#CI_ITEM_NAME" style="background-color:white;" formId = "881411561f8f4940ac22575c4b8f02ef" /> <!--colNo="T2#CI_ITEM_NAME"-->
                            </td>
                            <td class="dec" style="width:225px;">
                                <bu:ui  colNo="T2#CI_ITEM_NAME" readonly="readonly" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{T2#CI_ITEM_NAME}" dataId="${dataId}"  style="width:200px;"/>
                            </td>
                            <td class="name"  style="width:52px;">
                                <bu:uitn colNo="T2#CI_ITEM_SPEC" formId = "881411561f8f4940ac22575c4b8f02ef"  />
                            </td>
                            <td class="dec"  style="width:205px;">
                                <bu:ui colNo="T2#CI_ITEM_SPEC" readonly="readonly"  formId = "881411561f8f4940ac22575c4b8f02ef" value="%{T2#CI_ITEM_SPEC}" dataId="${dataId}"  style="width:200px;"/>
                            </td>                            
                        </tr>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="CB_VER" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_VER" readonly="readonly" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_VER}" dataId="${dataId}"  style="width:200px;"/>
                            </td>                      
                            <td class="name">
                                <bu:uitn colNo="CB_DEFAULT" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_DEFAULT" readonly="readonly" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_DEFAULT}" dataId="${dataId}" disabled="disabled"/>
                            </td>                        </tr>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="CB_REMARK" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec" colspan="5">
                                <bu:ui colNo="CB_REMARK" readonly="readonly" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_REMARK}" dataId="${dataId}" style="width:100%; height:80px;"/>
                            </td>                	</tr>    </tbody>
                </table>
                <div class="js-tab two-js-tab">
                    
                    <DIV class="hd">
							<UL class="tab-list tab" style="padding-left:12px;">
								
								<LI id="tag1"><A class=""
									onclick="switchTags('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="BOM明细" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTags('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="替代料" /></SPAN> </A>
								</LI>
								

							</UL>
						</DIV>
                </div>
                <div  style="margin-top:-20px;" id="content" class="topTab two-top-tab">
                    <div id="content1" class="tabPanel"  style="margin-top:4px;" data-tab="tag1">
                        
                        <div class="tab-add-div"></div>                        
                        <div class="panel datagrid datagrid-div1"  id="881411561f8f4940ac22575c4b8f02ef">
                             <div class="datagrid-div22 datagrid-div6 datagrid-view" id="datagrid-header1" >
                                 <div class="datagrid-header" ><!--  overflow-y: auto;"-->
                                     <div class="datagrid-header-inner head1" id="datagrid-header-inner" style="overflow:hidden;"><!---->
                                        <table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htableb9f80468a9fe4b74ada4fceff23db738">
                                            <tbody >
                                                <input type="hidden" id="addTable_FORM_COL_ID_Db9f80468a9fe4b74ada4fceff23db738" value="3a6a195ea82c4ebbaaaacc3ee52c6438"/>
                                                <tr class="datagrid-header-row thcolor">
                                                    <td class="datagrid-cell" style="width:180px; display:none;">
                                                	<td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="CBD_ITEM_CODE" formId="b9f80468a9fe4b74ada4fceff23db738" cssClass="a"/></td>
                                                    <td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="CBD_ITEM_NAME" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="CBD_ITEM_SPEC" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CBD_UNITS" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CBD_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_ITEM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_ITEM_SECTION" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_BOTTOM_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_BOTTOM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_TOP_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_TOP_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CBD_ITEM_TYPE" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <!--<td class="datagrid-cell" style="width:40px;">操作</td>-->
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div><!--datagrid-body-->
                                <div class=" datagrid-body datagrid-div3 scroll" style="width:100%;height: 250px;overflow: auto;"><!--overflow-y: auto;"-->
                                    <table class="datagrid-btable fixedTable dblClick glxb-table" id="datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738">
                                        <input type="hidden" name="level_b9f80468a9fe4b74ada4fceff23db738" value="2"/>
                                        <input type="hidden" id="table_curRowSeqb9f80468a9fe4b74ada4fceff23db738" value="1"/>
                                        <input type="hidden" value="b9f80468a9fe4b74ada4fceff23db738" name="formIds"/>
                                        <input type="hidden" name="b9f80468a9fe4b74ada4fceff23db738" value="paraMap1@"/>
                                        <input type="hidden" value="1" name="paraMap1@__LEVEL__"/>
                                        <input type="hidden" value="1" name="paraMap1@__DATA_COUNT__"/>
                                        <tbody id = "datagrid-btbody" class="datagrid-btbody" >
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                </div>
                 <div id="content2" style="display:none;" data-tab="tag2">
                        
                        <div class="tab-add-div"></div>                        
                        <div class="panel datagrid datagrid-div1" >
                             <div class="datagrid-div22 datagrid-div6 datagrid-view" id="datagrid-header1" >
                                 <div class="datagrid-header" ><!--  overflow-y: auto;"-->
                                     <div class="datagrid-header-inner head2" id="datagrid-header-inner1"  style="overflow: hidden;" ><!---->
                                        <table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
                                                    <td class="datagrid-cell" style="width:150px;" ><dict:lang value="类型" /></td >
													<td class="datagrid-cell" style="width:150px;" ><dict:lang value="主料代码" /></td >
													<td class="datagrid-cell" style="width:150px;" ><dict:lang value="主料名称" /></td >
													<td class="datagrid-cell" style="width:150px;" ><dict:lang value="主料规格" /></td >
													<td class="datagrid-cell" style="width:150px;" ><dict:lang value="替代料代码" /></td >
													<td class="datagrid-cell" style="width:150px;" ><dict:lang value="替代料名称" /></td >
													<td class="datagrid-cell" style="width:150px;" ><dict:lang value="替代料规格" /></td >
												
													
												</tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div><!--datagrid-body-->
                                <div class="datagrid-body datagrid-div3 scroll2" style="width:100%;height: 250px; overflow: hidden;">
									<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
										<tbody id="addSecondItemDetail" ><!--overflow: hidden;table-layout: fixed; -->
										</tbody>
									</table>
								</div>
                            </div>
                        </div>
                        <div style="background-color: white;" id="pageDiv">
                            <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchSecondItem&formId=formId3&showLoading=0" />
                        </div>
                </div>
                
           </div>
        </div>

      </form>
      
   </div>
</div>
<div id="params">
    <c:forEach var="editParam" items="${editParamList}">
        <input type="hidden" id="formidFirstId${editParam.subFormId}" value="${editParam.formidFirstId}">
        <input type="hidden" id="subRelColId${editParam.subFormId}"  value="${editParam.subRelColId}">
        <input type="hidden" id="relColVal${editParam.subFormId}" value="${editParam.relColVal}">
        <input type="hidden" id="colNoD${editParam.subFormId}" value="${editParam.colNoD}">
        <input type="hidden" id="colNo${editParam.subFormId}" value="${editParam.colNo}">
    </c:forEach>
</div>
<div style="display: none;">
    <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
</div>

<script type="text/javascript">
$(function(){
    $("#tag1").addClass("current");
})


function reSort(objid){
     var i = 1;
     $("#"+objid+" tr").each(function(){
     
     $(this).find("td").eq(0).text(i);
     
     i++;
  });
}




<%-- 获取数据 --%>
function getEditRowsData(tableId,formIndex,trId,levelForm){
    //util.showLoading();
    var formidFirstId = $("#formidFirstId"+tableId).val();
    var subRelColId = $("#subRelColId"+tableId).val();
    var relColVal = $("#relColVal"+tableId).val();
    var colNo = $("#colNo"+tableId).val();
    var colNoD = $("#colNoD"+tableId).val();
    var url ="${path}buss/bussModel_editSubDataAx.ms";
    var addTtable = $('#addTable_'+tableId);
    var tableTrJq = addTtable.find("tbody tr");
    var row_count = tableTrJq.length;
    var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
    $.ajax({
        type: "POST",
        dataType: "json",
        url: url,
        data:{
             'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,
             'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':"",
             'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':tableId,
             'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal,
             'paraMap.parentTrId':trId,'paraMap.parentTrId':levelForm,
             'paraMap.colNo':colNo,'paraMap.colNoD':colNoD
           },
        success: function(data){
            //util.closeLoading();
            var row = $(data.ajaxPage.tableData);
            var trLength = data.ajaxList.length;
            //_toClickColor(row);// <%-- 行点击着色 --%>
            if(trId != null){
                $("#addTable_"+tableId+" tbody").empty();
            }
            addTtable.append(row);
         
            var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
            dataCountObj.val(row_count+ 1);
            setChosen();//设置下拉框样式
            if(trLength==0){
                $("#table_curRowSeq"+tableId).val(1);
            }else{
                $("#table_curRowSeq"+tableId).val(trLength);
            }
            $(".glxb-table .chosen-container").css("width","100%");
            $(".glxb-table tr").prepend("<td class='datagrid-cell' style='width:30px; text-align:center;display:none'></td>");
            $(".glxb-table tr").prepend("<td class='datagrid-cell' style='width:30px; text-align:center;display:none'><span><input type='checkbox' style='cursor: pointer;width:13px;height:30px;'></span></td>");
            $(".glxb-table tr").prepend("<td class='datagrid-cell' style='width:30px; text-align:center;display:none'></td>");

            
            $(".glxb-table tr td:last-child").css("display","none");
           
            reSort("datagrid-btable-ajaxb9f80468a9fe4b74ada4fceff23db738");
            setCurRowSeqToTr(addTtable,tableId);

        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
            util.closeLoading();
            var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
            if (null != sessionstatus && sessionstatus == "noAuthority") {
            }else{
                util.alert("error:"+errorThrown);
            };
       }
    });
}

<%-- 设置curRowSeq --%>
function setCurRowSeqToTr(addTtable,tableId){
    var curRowSeq = 0;
    addTtable.find("tr").each(function(seq) {
        curRowSeq = seq;
        $(this).attr("curRowSeq",curRowSeq);
    });
    $("#table_curRowSeq"+tableId).val(curRowSeq+1);// 给子表单新增时使用
}




function getBomDet(){
    
    util.showLoading("处理中...");
    var dataAuth = "${param.dataAuth}";
    jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	    	url: "${path}buss/bussModel_exeFunc.ms?funcMId=c617ddd0179e4c74b11c21c2f64bb680&",
 	    	data:{
 	    	    "dataId":$("input[name='dataId']").val(),
 	    	    "dataAuth":dataAuth,
 	    	    "type":"showDetail"
 	    	},
 			success: function(data){
 			    util.closeLoading();
				if(null == data){return ;}
 				var pList=data.ajaxList;
 				if(null != data.ajaxList){
 				for(var i=0;i<pList.length;i++){
 				    if(i==0){
 				     	$("#datagrid-btbody").html('');
 				        curRowSeq=1;			    
 				    }
 				            if(pList[i].CBD_ITEM_CODE==null) pList[i].CBD_ITEM_CODE="";
							if(pList[i].CI_ITEM_NAME==null) pList[i].CI_ITEM_NAME="";
							if(pList[i].CI_ITEM_SPEC==null) pList[i].CI_ITEM_SPEC="";
							if(pList[i].CBD_UNITS==null) pList[i].CBD_UNITS="";
							if(pList[i].CBD_POINT==null) pList[i].CBD_POINT="";
							if(pList[i].CBD_ITEM_NUM==null) pList[i].CBD_ITEM_NUM="";
	                        if(pList[i].CBD_ITEM_SECTION==null) pList[i].CBD_ITEM_SECTION="";
							if(pList[i].CBD_BOTTOM_POINT==null) pList[i].CBD_BOTTOM_POINT="";
							if(pList[i].CBD_BOTTOM_NUM==null) pList[i].CBD_BOTTOM_NUM="";
							if(pList[i].CBD_TOP_POINT==null) pList[i].CBD_TOP_POINT="";
							if(pList[i].CBD_TOP_NUM==null) pList[i].CBD_TOP_NUM="";
							if(pList[i].CBD_ITEM_TYPE==null) pList[i].CBD_ITEM_TYPE="";
 				    
 				    var j=i+1;
 				    var pre="paraMapObj_"+i+"_";
 				    var preName = "paraMap1@"+i+"#";
 				    var tempHtml = "<tr id='addTableTr"+j+"_b9f80468a9fe4b74ada4fceff23db738' currowseq='0'>"
 				        +"<td style='position: relative; width: 180px; display:none;'></td>"
         				+"<td style='position: relative; width: 180px;' cssClass='a'>" + pList[i].CBD_ITEM_CODE + "</td>"
         				+"<td style='position: relative; width: 180px;'>" + pList[i].CI_ITEM_NAME + "</td>"
                        +"<td style='position: relative; width: 180px;'>" + pList[i].CI_ITEM_SPEC + "</td>"
                        +"<td style='position: relative; width: 100px;'>" + pList[i].CBD_UNITS + "</td>"
                        +"<td style='position: relative; width: 100px;'>" + pList[i].CBD_POINT + "</td>"
                        +"<td style='position: relative; width: 80px;'>" + pList[i].CBD_ITEM_NUM + "</td>"
                        +"<td style='position: relative; width: 80px;'>" + pList[i].CBD_ITEM_SECTION + "</td>"
                        +"<td style='position: relative; width: 80px;'>" + pList[i].CBD_BOTTOM_POINT + "</td>"
                        +"<td style='position: relative; width: 80px;'>" + pList[i].CBD_BOTTOM_NUM + "</td>"
                        +"<td style='position: relative; width: 80px;'>" + pList[i].CBD_TOP_POINT + "</td>"
                        +"<td style='position: relative; width: 80px;'>" + pList[i].CBD_TOP_NUM + "</td>"
                         +"<td style='position: relative; width: 120px;'><select id='"+pre+"CBD_ITEM_TYPE' name='"+preName+"CBD_ITEM_TYPE' style='width:100%' class='_VAL_NULL input isSubmit _VAL_OjbsData IS_SELECT_FILTER dept_select'><option value=''>--请选择--</option><option value='0'>物料</option>"
                        +"<option value='1'>PCB</option></select>"
                        +"</td>"
                       // +"<td style='position: relative; width: 120px;'>" + pList[i].CBD_ITEM_TYPE + "</td>"
                        +"</tr>";
                    $("#datagrid-btbody").append(tempHtml);
                     $("#"+pre+"CBD_ITEM_TYPE").val(pList[i].CBD_ITEM_TYPE);
 				}
 				defTableWidthRewrite("b9f80468a9fe4b74ada4fceff23db738");
 				searchItemDetail();
 				}
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
 				if (null != sessionstatus && sessionstatus == "noAuthority") {
 				}else{
	                utilsFp.confirmIcon(3,"","","", "error:"+errorThrown,0,"260","");
 				}
 		   }
 		});
}

$(function(){
    getBomDet();
   	
    $("#paraMapObj_CB_ITEM_CODE_SHOW").removeAttr("onclick");
    $("#paraMapObj_CB_ITEM_CODE_SHOW").removeClass("ico-search-input");        	
});
var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTags(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		//document.getElementById("content3").style.display="";
		//document.getElementById("content4").style.display="";
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
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
		if(tag=="tag1"){
			//listAjaxTable("7b5230d9dda44e8cadb18aa7137d1aa4");
			$("#allSelect").removeAttr("checked");
		}
		if(tag=="tag2"){
			//searchItemDetail();
			$("#allSelect1").removeAttr("checked");
		}
	}

function searchItemDetail(){
    var bomId = "${dataId}";
    var itemCode ;
    
    	itemCode= selectInfo();
    console.log("itemCode:"+itemCode);
   var cbItemCode = $("#paraMapObj_CB_ITEM_CODE").val();
    
    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=428c4b5b19eb4a04818c1145b80fcaeb";
    $.ajax({
        type: "POST",
        dataType: "json",
        url: loadItemUrl,
        data:{
            "bomId":bomId,
            "itemCode":itemCode,
            "cbItemCode":cbItemCode
            
        },
           success: function(data){
               	$("#addSecondItemDetail").empty();
               	if(null==data){
        	                return;
        	            }
        	    if(null!=data.ajaxList){
        	        
        	        var  list= data.ajaxList;
        	        var allTr = "";
        	        for(var i = 0;i < list.length; i++){
        	           	var type;
        	           if(list[i].CR_ITEM_REPLACE==null) list[i].CR_ITEM_REPLACE="";
        	         if(list[i].CR_ITEM_DESC==null) list[i].CR_ITEM_DESC="";
        	         if(list[i].CR_ITEM_NAME==null) list[i].CR_ITEM_NAME="";
        	         if(list[i].CI_ITEM_SPEC==null) list[i].CI_ITEM_SPEC="";
        	         if(list[i].CI_ITEM_NAME==null) list[i].CI_ITEM_NAME="";
        	         if(list[i].CR_ITEM_MIAN==null) list[i].CR_ITEM_MIAN="";
        	         if(list[i].CR_TYPE =="0"){
        	             type="全局";
        	         }else if(list[i].CR_TYPE =="1"){
        	             type="工单";
        	         }else if(list[i].CR_TYPE =="2"){
        	             type="机种";
        	         }
        	         var oneTr =
        	         "<tr id='tr2_"+i+"' >"+
        	         "<td class='datagrid-cell datagrid-cell-1' style='width:150px;text-align: center;' title='"+type+"'>"+type+"</td>"+
					 "<td class='datagrid-cell datagrid-cell-2' style='width:150px;text-align: left;' title='"+list[i].CR_ITEM_MIAN+"'>"+list[i].CR_ITEM_MIAN+"</td>"+
					"<td class='datagrid-cell datagrid-cell-3' style='width:150px;text-align: left;' title='"+list[i].CI_ITEM_NAME+"'>"+list[i].CI_ITEM_NAME+"</td>"+
					"<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: left;' title='"+list[i].CI_ITEM_SPEC+"'>"+list[i].CI_ITEM_SPEC+"</td>"+
					"<td class='datagrid-cell datagrid-cell-5' style='width:150px;text-align: left;' title='"+list[i].CR_ITEM_REPLACE+"'>"+list[i].CR_ITEM_REPLACE+"</td>"+
					"<td class='datagrid-cell datagrid-cell-6' style='width:150px;text-align: left;' title='"+list[i].CR_ITEM_NAME+"'>"+list[i].CR_ITEM_NAME+"</td>"+
					"<td class='datagrid-cell datagrid-cell-7' style='width:150px;text-align: left;' title='"+list[i].CR_ITEM_DESC+"'>"+list[i].CR_ITEM_DESC+"</td>"+
        	        "</tr>";
        	        allTr = allTr +  oneTr;   
        	        }
        	        $("#addSecondItemDetail").append(allTr);
        	        defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
        	         
        	    }          
           },
            error: function(msg){
             utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
       }
    
    });
    
	}
	
	function selectInfo() {
	    var clos = [];
	    $("#datagrid-btbody tr").each(function(){  
                    var text = $(this).children("td:nth-child(1)").text();//td:nth-child(3) 第三列 
                  console.log("text:"+text);
    			      clos.push($(this).children("td:nth-child(1)").text());
                }); 
	    
	    
	    /*
	    $(".a").each(function (item) {	
	        //if(item!=""){
	            clos.push($(this).val());
	       // }
	    });*/
	    console.log("clos:"+clos); 
    $.unique(clos);
    var b = clos.join(",");
    console.log("bbbbbb:"+b);
    return b;
}
</script>
<script>(function($){
  $(window).on('load',function(){
       setPopScroll('.scroll','.head1');
       setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>

<bu:script viewId="541ffc56c2bf48858778c4ad79d1e319" />
    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="popConfirm" value="1" />
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->

