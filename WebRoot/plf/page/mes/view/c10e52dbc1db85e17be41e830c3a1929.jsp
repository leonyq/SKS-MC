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
<body>
<div class="edit">
    <div class="hd">
        <div class="optn">
            <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
            <button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        </div>
    </div>
    <div class="bd">
        <form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
            <bu:formet exeid="%{exeid}" />>
            <input type="hidden" name="exeid" value="${exeid}">
            <input type="hidden" name="definedMsg" value="${definedMsg}">
            <input type="hidden" name="formId" value="${formId}">
            <input type="hidden" name="dataId" value="${dataId}">
            <input type="hidden" name=iframeId value="${iframeId}">
            <s:set name="_$type" value="'edit'" />
            <table class="func_table">
                <tr>
                    <td width="100%" align="right"></td>
                </tr>
            </table>
                <table class="basic-table">
                    <input type="hidden" name="formIds" value="46a69fb9850f4b81909589215ac5053a">
                    <input type="hidden" value="paraMap0@" name="46a69fb9850f4b81909589215ac5053a">
                    <input type="hidden" value="0" name="paraMap0@__LEVEL__"/>
                    <input type="hidden" value="1" name="paraMap0@__DATA_COUNT__"/>
                    <tbody>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="NAME" formId = "46a69fb9850f4b81909589215ac5053a" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="NAME" formId = "46a69fb9850f4b81909589215ac5053a" value="%{NAME}" dataId="${dataId}" />
                            </td>                            <td class="name">
                                <bu:uitn colNo="SEX" formId = "46a69fb9850f4b81909589215ac5053a" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="SEX" formId = "46a69fb9850f4b81909589215ac5053a" value="%{SEX}" dataId="${dataId}" />
                            </td>                        </tr>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="QQ" formId = "46a69fb9850f4b81909589215ac5053a" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="QQ" formId = "46a69fb9850f4b81909589215ac5053a" value="%{QQ}" dataId="${dataId}" />
                            </td>                            <td class="name">
                                <bu:uitn colNo="AGE" formId = "46a69fb9850f4b81909589215ac5053a" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="AGE" formId = "46a69fb9850f4b81909589215ac5053a" value="%{AGE}" dataId="${dataId}" />
                            </td>                        </tr>
                    </tbody>
                </table>
                <div class="js-tab">
                    <div id="hd">
                        <ul class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
                            <li id="title-612afe7157ae46479b87fdd32cb77485" class="current">
                                <a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1">子单</span></a>
                            </li>
                            <li id="title-677346fc6b47486ba7a9164f03017738">
                                <a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1">子表2</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="topTab">
                    <div id="tabPanel_612afe7157ae46479b87fdd32cb77485" class="tabPanel">
                        <div class="tab-button more tab-add">
                            <a href="javascript:addAssociatedData('612afe7157ae46479b87fdd32cb77485','1','31e77a0b39b543da981ab07e692a89e4');" title="添加" class="btn-op"><i class="ico ico-add"></i>添加</a>
                            <input type="hidden" id="associatedModel" value="2"/>
                            <a href="javascript:updateAssociatedData('612afe7157ae46479b87fdd32cb77485','1','31e77a0b39b543da981ab07e692a89e4');" title="修改" class="btn-op"><i class="ico2 ico-xg"></i>修改</a>
                        </div>
                        <div class="tab-add-div"></div>                        <div class="panel datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
                             <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-header1">
                                 <div class="datagrid-header">
                                     <div class="datagrid-header-inner" id="datagrid-header-inner">
                                        <table  class="datagrid-htable fixedTable datagrid-div6">
                                            <tbody>
                                                <input type="hidden" id="addTable_FORM_COL_ID_D612afe7157ae46479b87fdd32cb77485" value="8c6a9b933e49400aaf2134d7ba44cbc3"/>
                                                <tr class="datagrid-header-row">                                                    <td class="datagrid-cell">                                                        <bu:uitn colNo="NAME" formId="612afe7157ae46479b87fdd32cb77485" />                                                    </td>
                                                    <td class="datagrid-cell">                                                        <bu:uitn colNo="TYPENAME" formId="612afe7157ae46479b87fdd32cb77485" />                                                    </td>
                                                    <td class="datagrid-cell">                                                        <bu:uitn colNo="TESTNAME" formId="612afe7157ae46479b87fdd32cb77485" />                                                    </td>
                                                    <td class="datagrid-cell" style="width:40px;">操作</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="datagrid-body tab-table-height">
                                    <table class="datagrid-btable-pop fixedTable datagrid-div6 glxb-table" id="addTable_612afe7157ae46479b87fdd32cb77485">
                                        <input type="hidden" id="table_curRowSeq612afe7157ae46479b87fdd32cb77485" value="1"/>
                                        <input type="hidden" value="612afe7157ae46479b87fdd32cb77485" name="formIds"/>
                                        <input type="hidden" name="612afe7157ae46479b87fdd32cb77485" value="paraMap1@"/>
                                        <input type="hidden" value="1" name="paraMap1@__LEVEL__"/>
                                        <input type="hidden" value="1" name="paraMap1@__DATA_COUNT__"/>
                                        <tbody class="datagrid-btbody" >
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>
                    <div id="tabPanel_677346fc6b47486ba7a9164f03017738" style="display:none" class="tabPanel">
                        <div class="tab-button more tab-add">
                            <a href="javascript:addAssociatedData('677346fc6b47486ba7a9164f03017738','2','69764c35a2c1496c803b8dfe9caf8076');" title="添加" class="btn-op"><i class="ico ico-add"></i>添加</a>
                            <input type="hidden" id="associatedModel" value="2"/>
                            <a href="javascript:updateAssociatedData('677346fc6b47486ba7a9164f03017738','2','69764c35a2c1496c803b8dfe9caf8076');" title="修改" class="btn-op"><i class="ico2 ico-xg"></i>修改</a>
                        </div>
                        <div class="tab-add-div"></div>                        <div class="panel datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
                             <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-header2">
                                 <div class="datagrid-header">
                                     <div class="datagrid-header-inner" id="datagrid-header-inner">
                                        <table  class="datagrid-htable fixedTable datagrid-div6">
                                            <tbody>
                                                <input type="hidden" id="addTable_FORM_COL_ID_D677346fc6b47486ba7a9164f03017738" value="838ca5844aa648d193678e96bd870742"/>
                                                <tr class="datagrid-header-row">                                                    <td class="datagrid-cell">                                                        <bu:uitn colNo="A" formId="677346fc6b47486ba7a9164f03017738" />                                                    </td>
                                                    <td class="datagrid-cell">                                                        <bu:uitn colNo="B" formId="677346fc6b47486ba7a9164f03017738" />                                                    </td>
                                                    <td class="datagrid-cell">                                                        <bu:uitn colNo="C" formId="677346fc6b47486ba7a9164f03017738" />                                                    </td>
                                                    <td class="datagrid-cell">                                                        <bu:uitn colNo="D" formId="677346fc6b47486ba7a9164f03017738" />                                                    </td>
                                                    <td class="datagrid-cell">                                                        <bu:uitn colNo="E" formId="677346fc6b47486ba7a9164f03017738" />                                                    </td>
                                                    <td class="datagrid-cell" style="width:40px;">操作</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="datagrid-body tab-table-height">
                                    <table class="datagrid-btable-pop fixedTable datagrid-div6 glxb-table" id="addTable_677346fc6b47486ba7a9164f03017738">
                                        <input type="hidden" id="table_curRowSeq677346fc6b47486ba7a9164f03017738" value="1"/>
                                        <input type="hidden" value="677346fc6b47486ba7a9164f03017738" name="formIds"/>
                                        <input type="hidden" name="677346fc6b47486ba7a9164f03017738" value="paraMap2@"/>
                                        <input type="hidden" value="2" name="paraMap2@__LEVEL__"/>
                                        <input type="hidden" value="1" name="paraMap2@__DATA_COUNT__"/>
                                        <tbody class="datagrid-btbody" >
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>
<script>
function initEditDataLs(){
getEditRows('612afe7157ae46479b87fdd32cb77485',1);getEditRows('677346fc6b47486ba7a9164f03017738',2);}
</script>

      </form>
   </div>
</div>
<div id="params">
    <c:forEach var="editParam" items="${editParamList}">
        <input type="hidden" id="formidFirstId${editParam.subFormId}" value="${editParam.formidFirstId}">
        <input type="hidden" id="subRelColId${editParam.subFormId}"  value="${editParam.subRelColId}">
        <input type="hidden" id="relColVal${editParam.subFormId}" value="${editParam.relColVal}">
    </c:forEach>
</div>
<div style="display: none;">
    <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
</div>

<script type="text/javascript">

var isQuery = false;
function edit(thisObj){
	if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
	if(!val.valNullData()){
		return ;
	}
	if(!valData()){
		return ;
	}
	if(!val.valOjbsData()){
		return ;
	}
	//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
	emptyValToHide();
	document.forms.editForm.submit();
	isQuery = true;
}

<%-- 新增--%>
function addAssociatedData(formId,formIndex,viewId){
    var associatedModel = $("#associatedModel").val();
    if(associatedModel == "1"){
        addRow(tableId,formIndex,formData);
    }else{
         var popId = guid();
         var curRowSeq = $("#table_curRowSeq"+formId).val();
         var url = "buss/bussModel.ms?exeid="+viewId+"&formId="+formId+"&formIndex="+formIndex+"&curRowSeq="+curRowSeq+"&popId="+popId+"&type=1";
         showPopWinFp(url, 800, 400,null,"<dict:lang value="新增"/>",popId);
    }
  
};

<%-- 修改数据--%>
function updateAssociatedData(formId,formIndex,viewId){
     var selectedTr = $("#addTable_"+formId+" .datagrid-btbody").find(".selected");
     if(!selectedTr){
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
     showPopWinFp(url, 800, 400,null,"<dict:lang value="修改"/>",uuid);
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
function addRow(tableId,formIndex,formData){
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
            _toClickColor(row);//
            addTtable.append(row);
            var associatedModel = $("#associatedModel").val();
            var thisTr = $("#addTableTr"+curRowSeq+"_"+tableId);
            thisTr.attr("curRowSeq",curRowSeq);
            var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
            dataCountObj.val(row_count+ 1);
            curRowSeq++;
            if(associatedModel=="2"){// 弹出新增
            	$("#table_curRowSeq"+tableId).val(curRowSeq);// 给子表单新增时使用
                addData(tableId,formIndex,formData,curRowSeq,thisTr);
            };
            setChosen();//设置下拉框样式
            $(".glxb-table .chosen-container").css("width","100%");
            $(".glxb-table tr td:last-child").css("width","40px");
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

function getEditRows(tableId,formIndex){
    util.showLoading();
    var formidFirstId = $("#formidFirstId"+tableId).val();
    var subRelColId = $("#subRelColId"+tableId).val();
    var relColVal = $("#relColVal"+tableId).val();
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
             'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal
           },
        success: function(data){
            util.closeLoading();
            var row = $(data.ajaxPage.tableData);
            var trLength = data.ajaxList.length;
            _toClickColor(row);// <%-- 行点击着色 --%>
            addTtable.append(row);
            var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
            dataCountObj.val(row_count+ 1);
            setChosen();//设置下拉框样式
            if(trLength==0){
            	$("#table_curRowSeq"+tableId).val(1);// 给子表单新增时使用
            }else{
            	$("#table_curRowSeq"+tableId).val(trLength);// 给子表单新增时使用
            }
            $(".glxb-table .chosen-container").css("width","100%");
            $(".glxb-table tr td:last-child").css("width","40px");
            setCurRowSeqToTr(addTtable);
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
};

function setCurRowSeqToTr(addTtable){
	addTtable.find("tr").each(function(seq) {
		$(this).attr("curRowSeq",seq);
	});
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
    $(".tab-list li").live("click",function(){
        var _this = $(this);
        var thisTab = _this.attr("id").replace("title-","tabPanel_");
        $(".tabPanel").hide();
        $("#"+thisTab).show();
        if(!_this.hasClass("current")){
            $(".tab-list li").removeClass("current");
            _this.addClass("current");
        };
    });
});

function init(){
   if($("input[type='hidden'][name='formIds']").length>1){
      initEditDataLs();
   }
}
</script>

    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="popConfirm" value="1" />
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
