<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
    
    <script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <script>
    //加载父ifream中的js\css文件

        var linkList = window.parent.document.getElementsByTagName("link");
        var scriptList = window.parent.document.getElementsByTagName("script");
        var head = document.getElementsByTagName("head").item(0);
        //外联样式
        for(var i=0;i<linkList.length;i++)
        {
            var l = document.createElement("link");
            l.rel = 'stylesheet';
            l.type = 'text/css';
            l.href = linkList[i].href;
            head.appendChild(l);
        }
        
        //去除重复的js引用
        var json = {};
        var scripts = new Array();
        var j = 0;
        for(var i=0;i<scriptList.length;i++)
        {
            if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
            {
                json[scriptList[i].src] = 1;
                var script = document.createElement("script");
                script.type = 'text/javascript';
                script.src = scriptList[i].src;
                head.appendChild(script);
                scripts[j] = script;
                j++;
            }
        }
        
        window.scripts = scripts;
    </script>
</head>
<body style="overflow: hidden;background-color:white;">
<div class="mod">
<div class="edit">
    <div class="hd">
    
    <div class="bd" style="border-bottom-style: none;">
        <form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
            <bu:formet exeid="%{exeid}" />>
            <input type="hidden" name="exeid" value="${exeid}">
            <input type="hidden" name="definedMsg" value="${definedMsg}">
            <input type="hidden" name="formId" value="${formId}">
            <input type="hidden" name="dataId" value="${dataId}">
            <input type="hidden" name=iframeId value="${iframeId}">
            <input type="hidden" name="isCloseWin" id="isCloseWinHidden" value=""/>
            <s:set name="_$type" value="'edit'" />
            <table class="func_table">
                <tr>
                    <td width="100%" align="right"></td>
                </tr>
            </table>
                <table class="basic-table">
                    <input type="hidden" name="formIds" value="881411561f8f4940ac22575c4b8f02ef">
                    <input type="hidden" value="paraMap0@" name="881411561f8f4940ac22575c4b8f02ef">
                    <input type="hidden" value="1" name="paraMap0@__LEVEL__"/>
                    <input type="hidden" value="1" name="paraMap0@__DATA_COUNT__"/>
                    <tbody>
                        <tr>
                            <td class="name" style="width:70px;">
                                <bu:uitn colNo="CB_ITEM_CODE" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_ITEM_CODE" readonly="readonly" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_ITEM_CODE}" dataId="${dataId}" />
                            </td>                            
                            <td class="name" style="width:90px;">
                                <bu:uitn colNo="T2#CI_ITEM_NAME" style="background-color:white;" formId = "881411561f8f4940ac22575c4b8f02ef" /> <!--colNo="T2#CI_ITEM_NAME"-->
                            </td>
                            <td class="dec">
                                <bu:ui readonly="readonly" colNo="T2#CI_ITEM_NAME" style="background-color:white;" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{T2#CI_ITEM_NAME}" dataId="${dataId}" />
                            </td>
                            <!--<bu:td cssClass="dec" colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" >
								<bu:ui colNo="T2#CI_ITEM_NAME"  formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="1" />
							</bu:td>-->
                        </tr>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="T2#CI_ITEM_SPEC" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="T2#CI_ITEM_SPEC" readonly="readonly" style="background-color:white;" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{T2#CI_ITEM_SPEC}" dataId="${dataId}" />
                            </td>                            <td class="name">
                                <bu:uitn colNo="CB_VER" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_VER" readonly="readonly" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_VER}" dataId="${dataId}" />
                            </td>                        </tr>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="CB_DEFAULT" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="CB_DEFAULT" readonly="readonly" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_DEFAULT}" dataId="${dataId}" />
                            </td>                        </tr>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="CB_REMARK" formId = "881411561f8f4940ac22575c4b8f02ef" />
                            </td>
                            <td class="dec" colspan="3">
                                <bu:ui colNo="CB_REMARK" readonly="readonly" formId = "881411561f8f4940ac22575c4b8f02ef" value="%{CB_REMARK}" dataId="${dataId}" style="width:560px; height:80px;"/>
                            </td>                    </tbody>
                </table>
                <div class="js-tab two-js-tab">
                    <div id="hd">
                        <div id="hd">
                        <div class="mod-hd">
				<h3 class="tit"><dict:lang value="BOM清单明细" /></h3>
			</div>
                    </div>
                    </div>
                </div>
                <div style="margin-top:-20px;" class="topTab two-top-tab">
                    <div id="tabPanel_b9f80468a9fe4b74ada4fceff23db738" class="tabPanel">
                        
                        <div class="tab-add-div"></div>                        <div class="panel datagrid datagrid-div1"  id="881411561f8f4940ac22575c4b8f02ef">
                             <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-header1" style="width:auto;overflow-x: auto;height: 180px;">
                                 <div class="datagrid-header">
                                     <div class="datagrid-header-inner" id="datagrid-header-inner">
                                        <table  class="datagrid-htable fixedTable datagrid-div6" style="overflow-x: auto;width:1400px;table-layout: fixed;">
                                            <tbody>
                                                <input type="hidden" id="addTable_FORM_COL_ID_Db9f80468a9fe4b74ada4fceff23db738" value="3a6a195ea82c4ebbaaaacc3ee52c6438"/>
                                                <tr class="datagrid-header-row">
                                                	<td class="datagrid-cell" style="width:30px; text-align:center;display: none;"></td>
													<td class="datagrid-cell" style="width:30px; text-align:center;display: none;"><span>
														<input type="checkbox" id="selectAll" onclick="select_All()" style="cursor: pointer;" title="全选"></span>
													</td>
                                                	<td class="datagrid-cell" style="width:180px;"><span class="dot" style="width: 10px;"></span><bu:uitn colNo="CBD_ITEM_CODE" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="CBD_ITEM_NAME" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="CBD_ITEM_SPEC" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:100px;"><span class="dot"></span><bu:uitn colNo="CBD_UNITS" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:100px;"><span class="dot"></span><bu:uitn colNo="CBD_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_ITEM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_ITEM_SECTION" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_BOTTOM_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_BOTTOM_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_TOP_POINT" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CBD_TOP_NUM" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <td class="datagrid-cell" style=""><span class="dot"></span><bu:uitn colNo="CBD_ITEM_TYPE" formId="b9f80468a9fe4b74ada4fceff23db738" /></td>
                                                    <!--<td class="datagrid-cell" style="width:40px;">操作</td>-->
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="datagrid-body tab-table-height" style="overflow-y: auto;height: 150px;">
                                    <table class="datagrid-btable-pop fixedTable datagrid-div6 glxb-table" id="addTable_b9f80468a9fe4b74ada4fceff23db738">
                                        <input type="hidden" name="level_b9f80468a9fe4b74ada4fceff23db738" value="2"/>
                                        <input type="hidden" id="table_curRowSeqb9f80468a9fe4b74ada4fceff23db738" value="1"/>
                                        <input type="hidden" value="b9f80468a9fe4b74ada4fceff23db738" name="formIds"/>
                                        <input type="hidden" name="b9f80468a9fe4b74ada4fceff23db738" value="paraMap1@"/>
                                        <input type="hidden" value="1" name="paraMap1@__LEVEL__"/>
                                        <input type="hidden" value="1" name="paraMap1@__DATA_COUNT__"/>
                                        <tbody class="datagrid-btbody" style="overflow-y: auto;">
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>
           </div>
<script>
function initEditDataLs(){
getEditRows('b9f80468a9fe4b74ada4fceff23db738',1);}
</script>
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

var isQuery = false;
function edit(thisObj){
    if(!val.valNullData()){
        return ;
    }
    if(!valData()){
        return ;
    }
    if(!val.valOjbsData()){
        return ;
    }
    if($("#isCloseWin").is(":checked")){
        $("#isCloseWinHidden").val("1");
    }else{
        $("#isCloseWinHidden").val("");
    }
    //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题    
    emptyValToHide();
    document.forms.editForm.submit();
    isQuery = true;
}

<%-- 新增--%>
function addAssociatedData(formId,formIndex,viewId,levelForm,parentFormId){
     if(levelForm == "3"){
         var isTr = $("#addTable_"+parentFormId+" tr").length;
         if(isTr == 0){
             utilsFp.confirmIcon(3,"","","","父表单数据不能为空！","","260","145");
             return;
         }
         var selectedTr = $("#addTable_"+parentFormId).find(".selected").length;
         if(selectedTr == 0){
             utilsFp.confirmIcon(3,"","","","请先选中一条父表单数据！","","260","145");
             return;
         };
     }
    var associatedModel = $("#associatedModel"+formId).val();
    if(associatedModel == "1"){
        addRow(formId,formIndex,null,levelForm,parentFormId);
    }else{
        var popId = guid();
        var curRowSeq = $("#table_curRowSeq"+formId).val();
        var url = "buss/bussModel.ms?exeid="+viewId+"&formId="+formId+"&formIndex="+formIndex+"&curRowSeq="+curRowSeq+"&popId="+popId+"&type=1&levelForm="+levelForm+"&parentFormId="+parentFormId;
        showPopWinFp(url, 700, 300,null,"<dict:lang value="新增"/>",popId);
    }
};

<%-- 修改数据--%>
function updateAssociatedData(formId,formIndex,viewId){
    var selectedTr = $("#addTable_"+formId).find(".selected");
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
    var url ="/mes/buss/bussModel_ajaxAddSubComm.ms?FUNC_CODE=F285";
    var addTtable = $('#addTable_'+tableId);
    var tableTrJq = addTtable.find("tbody tr");
    var row_count = tableTrJq.length;
    if(row_count == 0){
        curRowSeq = 1;
    }else{
        curRowSeq = $("#table_curRowSeq"+tableId).val();
    }
    var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();
    $.ajax({
        type: "POST",
        dataType: "json",
        url: url,
        data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq},
        success: function(data){
            util.closeLoading();
            var row = $(data.ajaxString);
            if(row_count % 2 != 0){
                row.addClass("tr1");//
            }
            //_toClickColor(row);//
            addTtable.append(row);
            var associatedModel = $("#associatedModel"+tableId).val();
            var thisTr = $("#addTableTr"+curRowSeq+"_"+tableId);
            thisTr.prepend("<td class='datagrid-cell' style='width:30px; text-align:center;display:none'><input id='newAdd' type='hidden' value='newAdd'/></td>");
            thisTr.prepend("<td class='datagrid-cell' style='width:30px; text-align:center'><span><input type='checkbox' style='cursor: pointer;width:13px;height:30px;'></span></td>");
            thisTr.prepend("<td class='datagrid-cell' style='width:30px; text-align:center;'></td>");
            thisTr.attr("curRowSeq",curRowSeq);
            setRelColVal(formIndex,curRowSeq,thisTr,tableId,levelForm,parentFormId);
            var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
            dataCountObj.val(row_count+ 1);
            curRowSeq++;
            $("#table_curRowSeq"+tableId).val(curRowSeq);// 给子表单新增时使用
            if(associatedModel=="2"){// 弹出新增
                addData(tableId,formIndex,formData,curRowSeq,thisTr);
            };
            setChosen();//设置下拉框样式
            $(".glxb-table .chosen-container").css("width","100%");
            $(".glxb-table tr td:eq(0)").css("width","30px");
            $(".glxb-table tr td:eq(1)").css("width","30px");
            $(".glxb-table tr td:eq(2)").css("width","0px");
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
            thisTr.find("td:eq(8) input").css("text-align","right");
            thisTr.find("td:eq(9) input").css("text-align","right");
            thisTr.find("td:eq(11) input").css("text-align","right");
            thisTr.find("td:eq(13) input").css("text-align","right");
            $(".glxb-table tr td:last-child").css("display","none");
            /*$(".glxb-table tr td:last-child").css("width","40px;");*/
            reSort("addTable_b9f80468a9fe4b74ada4fceff23db738");
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
            util.closeLoading();
            var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
            if (null != sessionstatus && sessionstatus == "noAuthority") {
            }else{
                utilsFp.alert("error:"+errorThrown);
            };
       }
    });
}

function select_All() {
	var addTable = $("#addTable_b9f80468a9fe4b74ada4fceff23db738");
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

function deleteRow(){
	var addTable = $("#addTable_b9f80468a9fe4b74ada4fceff23db738");
	var i=0;
	var delObjs=new Array;
	var delRows=new Array();
	addTable.find("tbody tr").each(function() {
		//delEditRow($(this),);
		var trObj=$(this);
		if(trObj.find("input:checkbox").attr("checked")){
			i++;
			var hiVal=trObj.find("input:hidden").val();
			if(hiVal.indexOf("newAdd")!=-1){
				delRow(trObj);
			}else{
				//util.showLoading();
				delObjs.push(trObj);
				delRows.push(hiVal);
				//delEditRow(trObj,hiVal,'b9f80468a9fe4b74ada4fceff23db738');
			}
		}
	});
	for(var j=0;j<delRows.length;j++){
	alert();
		delEditRows(delObjs[j],delRows[j],'b9f80468a9fe4b74ada4fceff23db738');
	}
	if(i == 0) {
		utilsFp.confirmIcon(3, "", "", "", "请选择要删除的数据", 0, "", "");
	}
}

function delEditRows(thisObj,id,formId){
			var paramObj =new Object;
			paramObj.obj=thisObj;
			paramObj.id=id;
			paramObj.formId=formId;
	  	//utilsFp.confirm(_delEditRow,"",paramObj);
	  	_delEditRow(paramObj)
	  }


function _delEditRow(paramObj){
			var url ="/mes/buss/bussModel_ajaxDelEditRow.ms";
			//util.showLoading();
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.formId':paramObj.formId,'paraMap.ID':paramObj.id},
				success: function(data){
					//util.closeLoading();
					if(null != data && data.ajaxString == "1"){
						delRow(paramObj.obj);
					}else{
						//utilsFp.alert("删除失败");
						utilsFp.confirmIcon(3,"","","", "?删除失败","","260","145");
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						utilsFp.alert("error:"+errorThrown);
					}
					paramObj.obj.disabled = false;
					paramObj.obj.value = oldValue;
			   }
			});
			
		}


function reSort(objid){
     var i = 1;
     $("#"+objid+" tr").each(function(){
     
     $(this).find("td").eq(0).text(i);
     
     i++;
  });
}

<%-- 新增的行删除 --%>
function delRow(thisObj){
    var flag = valiDelEditRow(thisObj);
    if(flag){
        $(thisObj).remove();
        reSort("addTable_b9f80468a9fe4b74ada4fceff23db738");
    }
   
}

<%-- 已存在的行删除 --%>
function delEditRow(thisObj,id,formId){
    var flag = valiDelEditRow(thisObj);
    if(flag){
        var paramObj =new Object;
        paramObj.obj=thisObj;
        paramObj.id=id;
        paramObj.formId=formId;
        utilsFp.confirm(_delEditRow,"",paramObj);
		
    }
    
}

<%-- 删除时验证 --%>
function valiDelEditRow(thisObj){
    var formId = $(thisObj).parents("table").attr("id").replace("addTable_","");
    if($(thisObj).parents(".two-top-tab").length>0){
        var isTr = 0;
        $(".three-content-"+formId+" .threeForm tr").each(function (i){
            isTr++; 
            return false;
        });
        if(isTr > 0){
            utilsFp.confirmIcon(3,"","","","请先删除该行下的子数据！","","260","145");
            return false;
        }
    }
    //var oldCurRowSeq = $("#table_curRowSeq"+formId).val();
    //$("#table_curRowSeq"+formId).val(oldCurRowSeq-1);
    return true;
}

<%-- 二三级表单关联字段赋值 --%>
function setRelColVal(formIndex,curRowSeq,thisTr,tableId,levelForm,parentFormId){
    if($(".three-top-tab").length > 0){
       var val;
       var uuid = guid();
       var name = "paraMap"+formIndex+"@"+curRowSeq+"#";
       var tdStr = "<td style='display:none'>";
       if(levelForm=="2"){
           tdStr+="<input type='hidden' name='"+(name+"trAdd")+"' value='trAdd'>";//给新增的一个标识符
           val = uuid.replace(/-/g,"");
           name += $("#colNo"+tableId).val();
       }else{
           name += $("#colNoD"+tableId).val();
           val = $("#addTable_"+parentFormId).find(".selected .associted").val();
       };
       tdStr+="<input type='hidden' class='associted'  name='"+name+"' value='"+val+"'></td>";
       thisTr.prepend(tdStr);
   }
}


<%-- 二级表单 --%>
function getEditRows(tableId,formIndex){
    getEditRowsData(tableId,formIndex,"",2);
};

<%-- 三级表单 --%>
function getThreeEditRows(tableId,formIndex,trId){
    getEditRowsData(tableId,formIndex,trId,3);
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
            /*for(var i=0;i<trLength;i++){
            	var thisTr = $("#addTableTr"+i+"_"+tableId);
            	thisTr.prepend("<td class='datagrid-cell' style='width:30px; text-align:center;display:none'></td>");
		        thisTr.prepend("<td class='datagrid-cell' style='width:30px; text-align:center'><span><input type='checkbox' style='cursor: pointer;width:13px;height:30px;'></span></td>");
		        thisTr.prepend("<td class='datagrid-cell' style='width:30px; text-align:center;'></td>");
            	thisTr.find("td:eq(7) input").css("text-align","right");
	            thisTr.find("td:eq(8) input").css("text-align","right");
	            thisTr.find("td:eq(10) input").css("text-align","right");
	            thisTr.find("td:eq(12) input").css("text-align","right");
            }*/
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
            
            $(".glxb-table tr td:eq(0)").css("width","30px");
            $(".glxb-table tr td:eq(1)").css("width","30px");
            $(".glxb-table tr td:eq(2)").css("width","0px");
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
            
            $(".glxb-table tr td:eq(3) input").attr("readonly","readonly");
            $(".glxb-table tr td:eq(4) input").attr("readonly","readonly");
            $(".glxb-table tr td:eq(5) input").attr("readonly","readonly");
            $(".glxb-table tr td:eq(6) input").attr("readonly","readonly");
            $(".glxb-table tr td:eq(7) input").attr("readonly","readonly");
            $(".glxb-table tr td:eq(8) input").attr("readonly","readonly");
            $(".glxb-table tr td:eq(9) input").attr("readonly","readonly");
            $(".glxb-table tr td:eq(10) input").attr("readonly","readonly");
            $(".glxb-table tr td:eq(11) input").attr("readonly","readonly");
            $(".glxb-table tr td:eq(12) input").attr("readonly","readonly");
            $(".glxb-table tr td:eq(13) input").attr("readonly","readonly");
            $(".glxb-table tr td:eq(14) input").attr("readonly","readonly");
            
            $(".glxb-table tr td:eq(8) input").css("text-align","right");
            $(".glxb-table tr td:eq(9) input").css("text-align","right");
            $(".glxb-table tr td:eq(11) input").css("text-align","right");
            $(".glxb-table tr td:eq(13) input").css("text-align","right");
            $(".glxb-table tr td:last-child").css("display","none");
            /*$(".glxb-table tr td:last-child").css("width","40px;");*/
            reSort("addTable_b9f80468a9fe4b74ada4fceff23db738");
            setCurRowSeqToTr(addTtable,tableId);
            $("#addTable_b9f80468a9fe4b74ada4fceff23db738 tr").each(function(){
		       $(this).find("td:eq(8) input").css("text-align","right");
		       $(this).find("td:eq(9) input").css("text-align","right");
		       $(this).find("td:eq(11) input").css("text-align","right");
		       $(this).find("td:eq(13) input").css("text-align","right");
		       
		        $(this).find("td:eq(3) input").attr("readonly","readonly");
	            $(this).find("td:eq(4) input").attr("readonly","readonly");
	            $(this).find("td:eq(5) input").attr("readonly","readonly");
	            $(this).find("td:eq(6) input").attr("readonly","readonly");
	            $(this).find("td:eq(7) input").attr("readonly","readonly");
	            $(this).find("td:eq(8) input").attr("readonly","readonly");
	            $(this).find("td:eq(9) input").attr("readonly","readonly");
	            $(this).find("td:eq(10) input").attr("readonly","readonly");
	            $(this).find("td:eq(11) input").attr("readonly","readonly");
	            $(this).find("td:eq(12) input").attr("readonly","readonly");
	            $(this).find("td:eq(13) input").attr("readonly","readonly");
	            $(this).find("td:eq(14) input").attr("readonly","readonly");
	            
	            $(this).find("td:eq(3) input").removeAttr("onclick");
	            $(this).find("td:eq(3) input").removeClass("ico-search-input");
		    });
            rowNum++;
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
    var threeCurrentContent= $(".two-js-tab .current").attr("id").replace("title-","three-content-");
    $("."+threeCurrentContent).show();
    if(!init){
       $(".three-content").hide();
       $("."+threeCurrentContent).show();
    };
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
    $(".datagrid-btable-pop tr").live("click",function(e){
        var _this = $(this);
        if(!_this.hasClass("selected")){
            $(".datagrid-btable-pop tr").removeClass("selected");
            _this.addClass('selected');
        };
        <%-- 如果存在三级表单 --%>
        var uniqueness = $(e.target).attr("class");
        if($(".threeForm").length>0 && uniqueness!="uniqueness" && _this.parents(".threeForm").length == 0){
            var trId = $(this).find("input[name$='#ID']").val();
            var thisFormId = $(this).parents("table").attr("id").replace("addTable_","");
            eval("initThreeLevelEditDataLs_"+thisFormId+"('"+trId+"')");
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

<%-- 初始化修改数据 --%>
function init(){
   if($("input[type='hidden'][name='formIds']").length>1){
      initEditDataLs();
   }
   $("#paraMapObj_CB_ITEM_CODE_SHOW").removeAttr("onclick");
   $("#paraMapObj_CB_ITEM_CODE_SHOW").removeClass("ico-search-input");
}
</script>
<bu:script viewId="541ffc56c2bf48858778c4ad79d1e319" />
    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="popConfirm" value="1" />
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
