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
                //include(scriptList[i].src);
                //alert("include "+scriptList[i].src);
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
    <script type="text/javascript">
        var addTableTrMap;
    </script>
    <style type="text/css">
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
    </style>
</head>
<body>
    <div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
                <div class="optn">
                    <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
                    <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
                </div>

            </div>
            <div class="bd" style="border-bottom-style: none;">
           <form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
                <div id="formDiv">
                <input type="hidden"  name="exeid" value="${exeid}">
                <input type="hidden" name="definedMsg" value="${definedMsg}">
                <input type="hidden" name=iframeId value="${iframeId}">
                <input type="hidden" name=formId value="${formId}">
                <s:set name="_$type" value="'add'" />
                <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
                <s:token />
                <table class="func_table">
                    <tr>
                        <td width="100%" align="right">

                        </td>
                    </tr>
                </table>
                <table class="basic-table">
                    <input type="hidden" name="formIds" value="f7b9da40d1cd4f64b997ea0aa1230cfd">
                    <input type="hidden" value="paraMap0@" name="f7b9da40d1cd4f64b997ea0aa1230cfd">
                    <input type="hidden" value="1" name="paraMap0@__LEVEL__"/>
                    <input type="hidden" value="1" name="paraMap0@__DATA_COUNT__"/>
                    <tbody>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="TEST5" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="TEST5" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" value="%{TEST5}" />
                            </td>                            <td class="name">
                                <bu:uitn colNo="TEST8" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="TEST8" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" value="%{TEST8}" />
                            </td>                        </tr>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="TEST7" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="TEST7" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" value="%{TEST7}" />
                            </td>                            <td class="name">
                                <bu:uitn colNo="TEST6" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="TEST6" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" value="%{TEST6}" />
                            </td>                        </tr>
                    </tbody>
                </table>
                <div class="js-tab two-js-tab">
                    <div id="hd">
                        <ul class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
                            <li id="title-1" class="current" data-tab="1">
                                <a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1">TAB1</span></a>
                            </li>
                            <li id="title-2" data-tab="2">
                                <a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1"> TAB2</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div style="margin-bottom:50px;" class="topTab two-top-tab">
<div class="tabDiv tab1" data-tab="1" count-tab = "1">
<table class="basic-table"><s:set name="_$formId_1" value="f7b9da40d1cd4f64b997ea0aa1230cfd"/>
<input type="hidden" id="associated"  name="associated" value="">
<tbody>
<tr>
<td class="name">

<bu:uitn colNo="TEST1" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" />
</td>
<td class="dec">
<bu:ui colNo="TEST1" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" value="%{TEST1}" />
</td><td class="name">

<bu:uitn colNo="TEST2" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" />
</td>
<td class="dec">
<bu:ui colNo="TEST2" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" value="%{TEST2}" />
</td></tr>
</tbody>
</table>
</div>
<div class="tabDiv tabTable tab2" data-tab="2" style="display:none"  count-tab = "2">
<table class="basic-table"><s:set name="_$formId_1" value="f7b9da40d1cd4f64b997ea0aa1230cfd"/>
<input type="hidden" id="associated"  name="associated" value="">
<tbody>
<tr>
<td class="name">

<bu:uitn colNo="TEST3" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" />
</td>
<td class="dec">
<bu:ui colNo="TEST3" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" value="%{TEST3}" />
</td><td class="name">

<bu:uitn colNo="TEST4" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" />
</td>
<td class="dec">
<bu:ui colNo="TEST4" formId = "f7b9da40d1cd4f64b997ea0aa1230cfd" value="%{TEST4}" />
</td></tr>
</tbody>
</table>
</div>
</div>

                </div>
         </form>
      </div>
    </div>

<div id="params">
    <c:forEach var="editParam" items="${editParamList}">
        <input type="hidden" id="relColVal${editParam.subFormId}" value="${editParam.relColVal}">
        <input type="hidden" id="colNoD${editParam.subFormId}" value="${editParam.colNoD}">
        <input type="hidden" id="colNo${editParam.subFormId}" value="${editParam.colNo}">
    </c:forEach>
</div>
    <div style="display: none;">
        <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
    </div>

<script type="text/javascript">
    function init(){
        removeClass();
        $(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
    }//初始化方法
    
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
            showPopWinFp(url, 800, 400,null,"<dict:lang value="新增"/>",popId);
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
    function addRow(tableId,formIndex,formData,levelForm,parentFormId){
        util.showLoading();
        var addTtable = $('#addTable_'+tableId);
        var tableTrJq = addTtable.find("tbody tr");
        var row_count = tableTrJq.length;
        if(row_count == 0){
            curRowSeq = 1;
        }else{
            curRowSeq = $("#table_curRowSeq"+tableId).val();
        }
        var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();
        var url ="/mes/buss/bussModel_ajaxAddSubComm.ms?FUNC_CODE=F285";
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
                var associatedModel = $("#associatedModel"+tableId).val();
                var thisTr = $("#addTableTr"+curRowSeq+"_"+tableId);
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
                $(".glxb-table tr td:last-child").css("width","40px");
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
                   val = $("#addTable_"+parentFormId).find(".selected .associted").val();
               };
               tdStr+="<input type='hidden' class='associted'  name='"+name+"' value='"+val+"'></td>";
               thisTr.prepend(tdStr);
       }
    }
    
    <%-- 删除当前行 --%>
    function delRow(thisObj){
        var formId = $(thisObj).parents("table").attr("id").replace("addTable_","");
        if($(thisObj).parents(".two-top-tab").length>0){
            var isTr = 0;
            $(".three-content-"+formId+" .threeForm tr").each(function (i){
                isTr++; 
                return false;
            });
            if(isTr > 0){
                utilsFp.confirmIcon(3,"","","","请先删除该行下的子数据！","","260","145");
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
        	thisTab.siblings().hide();
        	thisTab.show();
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
</script>

    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
