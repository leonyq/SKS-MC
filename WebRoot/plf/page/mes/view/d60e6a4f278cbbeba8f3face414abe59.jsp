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
                    <button type="button" onclick="addBefore(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
                    <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
                </div>

            </div>
            <div class="bd"><%--
                                        <form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
                                        target="submitFrame">
                                        --%>
                                        <div id="formDiv">
                                        <input type="hidden"  name="exeid" value="${exeid}">
                                        <input type="hidden" name="definedMsg" value="${definedMsg}">
                                        <input type="hidden" name=iframeId value="${iframeId}">
                                        <s:set name="_$type" value="'add'" />
                                        <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
                                        <s:token />
                                        <table class="func_table">
                                            <tr>
                                                <td width="100%" align="right">
                        
                                                </td>
                                            </tr>
                                        </table>
<table class="basic-table"><input type="hidden" name="formIds" value="46a69fb9850f4b81909589215ac5053a">
<tbody>
<tr>
<td class="name">
<bu:uitn colNo="NAME" formId = "46a69fb9850f4b81909589215ac5053a" />
</td>
<td class="dec">
<bu:ui colNo="NAME" formId = "46a69fb9850f4b81909589215ac5053a" value="%{NAME}" />
</td><td class="name">
<bu:uitn colNo="SEX" formId = "46a69fb9850f4b81909589215ac5053a" />
</td>
<td class="dec">
<bu:ui colNo="SEX" formId = "46a69fb9850f4b81909589215ac5053a" value="%{SEX}" />
</td></tr>
<tr>
<td class="name">
<bu:uitn colNo="QQ" formId = "46a69fb9850f4b81909589215ac5053a" />
</td>
<td class="dec">
<bu:ui colNo="QQ" formId = "46a69fb9850f4b81909589215ac5053a" value="%{QQ}" />
</td><td class="name">
<bu:uitn colNo="AGE" formId = "46a69fb9850f4b81909589215ac5053a" />
</td>
<td class="dec">
<bu:ui colNo="AGE" formId = "46a69fb9850f4b81909589215ac5053a" value="%{AGE}" />
</td></tr>
</tbody>
</table>
<div class="js-tab">
<div id="hd">
<ul class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
<li id="title-'612afe7157ae46479b87fdd32cb77485'">
<a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1">
子表单</span>
</a>
</li>
<li id="title-'677346fc6b47486ba7a9164f03017738'">
<a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1">
子表2</span>
</a>
</li>
</ul>
</div>
<div class="topTab">
<div id="tabPanel_612afe7157ae46479b87fdd32cb77485">
<div class="tab-button more">
<a href="javascript:addAssociatedData('612afe7157ae46479b87fdd32cb77485','1');" title="添加" class="btn-op"><i class="ico ico-add"></i>添加</a>
<a href="javascript:updateAssociatedData('612afe7157ae46479b87fdd32cb77485','1');" title="修改" class="btn-op"><i class="ico2 ico-xg"></i>修改</a>
<a href="javascript:delAssociatedData('612afe7157ae46479b87fdd32cb77485','1');" title="移除" class="btn-op"><i class="ico2 ico-sc"></i>移除</a>
</div>
 <div class="panel datagrid datagrid-div1"  id="612afe7157ae46479b87fdd32cb77485">
 <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
<table  class="datagrid-htable fixedTable datagrid-div6">
<tbody>
<tr class="datagrid-header-row"><td class="datagrid-cell">
姓名</td>
<td class="datagrid-cell">
类型名称</td>
<td class="datagrid-cell">
测试名称</td>
<td class="datagrid-cell">
父表ID</td>
  </tr>
  </tbody>
  </table>
  </div>
  </div>
<div class="datagrid-body datagrid-div3 tab-table-height">
<table class="datagrid-btable fixedTable datagrid-div6" id="addTable_612afe7157ae46479b87fdd32cb77485">
<tbody class="datagrid-btbody" >
   </tbody>
  </table>
  </div>
  </div>
  </div>
 </div>
</div>
<input type="hidden"  value="70929c7e899c4789b191614f526b9db2" id="viewId_612afe7157ae46479b87fdd32cb77485">
<div id="tabPanel_677346fc6b47486ba7a9164f03017738" style="display:none">
<div class="tab-button more">
<a href="javascript:addAssociatedData('677346fc6b47486ba7a9164f03017738','2');" title="添加" class="btn-op"><i class="ico ico-add"></i>添加</a>
<a href="javascript:updateAssociatedData('677346fc6b47486ba7a9164f03017738','2');" title="修改" class="btn-op"><i class="ico2 ico-xg"></i>修改</a>
<a href="javascript:delAssociatedData('677346fc6b47486ba7a9164f03017738','2');" title="移除" class="btn-op"><i class="ico2 ico-sc"></i>移除</a>
</div>
 <div class="panel datagrid datagrid-div1"  id="677346fc6b47486ba7a9164f03017738">
 <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
<table  class="datagrid-htable fixedTable datagrid-div6">
<tbody>
<tr class="datagrid-header-row"><td class="datagrid-cell">
测试字段0</td>
<td class="datagrid-cell">
测试字段1</td>
<td class="datagrid-cell">
测试字段2</td>
<td class="datagrid-cell">
测试字段3</td>
<td class="datagrid-cell">
测试字段4</td>
<td class="datagrid-cell">
父ID</td>
  </tr>
  </tbody>
  </table>
  </div>
  </div>
<div class="datagrid-body datagrid-div3 tab-table-height">
<table class="datagrid-btable fixedTable datagrid-div6" id="addTable_677346fc6b47486ba7a9164f03017738">
<tbody class="datagrid-btbody" >
   </tbody>
  </table>
  </div>
  </div>
  </div>
 </div>
</div>
<input type="hidden"  value="d1c7ddfb00774daaa9abadc738e696d9" id="viewId_677346fc6b47486ba7a9164f03017738">

                                        </div>
                                    <%--</form>
            --%></div>
        
    </div>

    <div style="display: none;">
        <iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
    </div>

<script type="text/javascript">
    function init(){
        if($("#leftTable-kz").length>0){
            $("#leftTable-kz").show();
        }
        
        if($("#leftTable").length>0){
            $("#leftTable").show();
        }
        $(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
        //$(".hideTr").addClass("tabTable");
    }//初始化方法
    
    function addBefore(thisObj){
        $(".datagrid-btbody").find("tr:first-child").find("td").children().removeClass("_VAL_NULL _VAL_NaN _VAL_OjbsData");
        if($("#addForm").length==0){
            $("#formDiv").wrap("<form id='addForm' action='${path}buss/bussModel_addComm.ms' method='post' <bu:formet exeid='%{exeid}'/> target='submitFrame' ></form>");
        };
        add(thisObj);
    };
    
    // 获取不重复随机数
    function guid(){
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,function(c){
            var r = Math.random()*16|0,v=c=='x'?r:(r&0x3|0x8);
            return v.toString(16);
        });
    }
    
    var cont = {
            clickSource:'add'
    };
    
    // 弹出新增赋值 
    function addAssociatedForm(thisObj){
        var uuid = guid();
        var tab = $(".current").attr("tab");
        var formData = form.serialize($("#current"+tab.replace(/[^0-9]/ig,"")));
        if(cont.clickSource=='add'){
            var _this = $("."+tab);
            _this.find(".datagrid-btbody").append(_this.find(".hideTr").clone());
            var lastTr = _this.find(".datagrid-btbody").find("tr:last-child");
            lastTr.removeClass("hideTr").removeClass("tabTable").children().removeClass("hideTd");
            lastTr.attr("uuid",uuid);
            lastTr.wrap("<form id="+uuid+" action=''></form>");
            form.deserialize($("#"+uuid),formData,uuid);
            lastTr.unwrap();
            setChosenWidth(lastTr);
            idDistinct(lastTr);
            replaceSelect(lastTr);
        }else{
            var selectedTr = $(".currentContent .datagrid-btbody").find(".datagrid-selected");
            var uuid = selectedTr.attr("uuid");
            selectedTr.wrap("<form id="+uuid+" action=''></form>");
            form.deserialize($("#"+uuid),formData);
            selectedTr.unwrap();
        }
        hideAssociatedForm(obj);
    };
    
    // 批量添加时候防止控件id重复
    function idDistinct(lastTr){
        var TrSize = lastTr.parent().children().length-1;
        lastTr.find("td").children().each(function(seq){
            var id = $(this).attr("id");//paraMap0_TASK_NAME
            var name = $(this).attr("name");//paraMap0@0#TASK_NAME
            var editName = $(this).attr("editName");//paraMap0@0#TASK_NAME
            if(id){
                $(this).attr("id",id.replace("paraMap0","paraMap"+TrSize));
            }
            if(name){
                $(this).attr("name",name.replace("0@0#","0@"+TrSize+"#"));
            };
            if(editName){
                $(this).attr("editName",editName.replace("0@0#","0@"+TrSize+"#"));
            };
        });
    }
    
    // 隐藏关联表单
    function hideAssociatedForm(thisObj){
        var tab = $(".current").attr("tab");
        $("#current"+tab.replace(/[^0-9]/ig,"")+" :input").not(":button,:submit,:reset,:hidden").val("").removeAttr("checked").remove("selected");
        $(".currentContent").next().find(".addFCWT,.back").css("display","none");
        
    }
    
    // 新增按钮
    function addAssociatedData(formId,formIndex){
        if($(".associated").length>0){// 存在关联表单并且为弹出新增
            //$(".currentContent").next().children(".addFCWT,.back").css("display","block");
            //$(".white_content").find(".chosen-container").css("width","230px");
            //cont.clickSource='add';
        	 showPopWinFp(url, 800, 400,null,"<dict:lang value="新增"/>");
            
        }else{// 存在关联表单并且为行新增
            var tab = $(".current").attr("tab");
            var _this = $("."+tab);
            _this.find(".datagrid-btbody").append(_this.find(".hideTr").clone());
            var lastTr = _this.find(".datagrid-btbody").find("tr:last-child");
            lastTr.attr("uuid",guid());
            lastTr.removeClass("hideTr").removeClass("tabTable").children().removeClass("hideTd");
            setChosenWidth(lastTr);
            idDistinct(lastTr);
            replaceSelect(lastTr);
        };
    };
    
    function replaceSelect(lastTr){
        lastTr.find(".dept_select").each(function(seq){
            var disabled = $(this).attr("disabled");
            if(!disabled){
                var thisName = $(this).attr("name");
                var thisId = $(this).attr("id");
                var $_par = $(this).parent();
                var arr = [];
                arr.push("<select class='dept_select' autocomplete='off' id="+thisId+" name="+thisName+"");
                arr.push("<option>--请选择--</option>");
                $(this).find("option").each(function(seq){
                    var val = $(this).attr("value");
                    var text = $(this).text();
                    arr.push("<option value="+val+">"+text+"</option>")
                });
                arr.push("</select>");
                $_par.children().remove();
                $_par.append(arr.join(""));
                $_par.find(".dept_select").chosen();
            };
        });
        //setChosen();//设置下拉框样式
        lastTr.find(".chosen-container").css("width","100%");
        setWidth(lastTr);
    }
    
     function setWidth(lastTr) {
         lastTr.find(".datagrid-cell-1").children().each(function(seq){
                 var icoData = $(this).hasClass("ico-date-h");
                 var icoSearch = $(this).hasClass("ico-search-input");
                 if(icoData||icoSearch){
                     $(this).css({"left":"90%","top":"6px"});
                 }else{
                     $(this).css("width","100%");
                 };
        });
    }
     
    function setChosenWidth(lastTr){
        var choosen = lastTr.find(".chosen-container");
        if(choosen.length>0 && choosen.width()==0){
            choosen.width(150);
        };
    };
    
    // 修改关联表单数据
    function updateAssociatedData(){
        var currentTr = $(".currentContent").find(" .datagrid-btbody tr");
        var currentSelectedTr = $(".currentContent .datagrid-btbody").find(".datagrid-selected");
        var selected = currentTr.hasClass('datagrid-selected');
        if(!selected){
            utilsFp.confirmIcon(3,"","","","请选择一条数据！","","260","145");
            return;
        };
        var tab = $(".current").attr("tab");
        var uuid = currentSelectedTr.attr("uuid");
        currentSelectedTr.wrap("<form id="+uuid+" action=''></form>");
        var formData = form.serialize($("#"+uuid));
        setKey(formData,$("#current"+tab.replace(/[^0-9]/ig,"")));
        form.deserialize($("#current"+tab.replace(/[^0-9]/ig,"")),formData);
        $(".currentContent").next().children(".addFCWT,.back").css("display","block");
        currentSelectedTr.unwrap();
        cont.clickSource='update';
    }
    
    function setKey(formData,thisFrom){
        for(var key in formData){
            if(key){
                var num = key.substring(9,10);
                thisFrom.find(".dec").children().each(function(seq){
                    var id = $(this).attr("id");//paraMap0_TASK_NAME
                    var name = $(this).attr("name");//paraMap0@0#TASK_NAME
                    var editName = $(this).attr("editName");//paraMap0@0#TASK_NAME
                    if(id){
                        $(this).attr("id",id.replace("paraMap0","paraMap"+num));
                    }
                    if(name){
                        $(this).attr("name",name.replace("0@0#","0@"+num+"#"));
                    };
                    if(editName){
                        $(this).attr("editName",editName.replace("0@0#","0@"+num+"#"));
                    };
                });
                break;
            };
        };
    }
    
    // 删除关联表单新增的数据
    function delAssociatedData(thisObj){
        var currentTr = $(".currentContent").find(" .datagrid-btbody tr");
        var selected = currentTr.hasClass('datagrid-selected');
        if(!selected){
            utilsFp.confirmIcon(3,"","","","请选择一条数据！","","260","145");
            return;
        };
         $(".currentContent .datagrid-btbody").find(".datagrid-selected").remove();
    }

    $(".tabList").click(function(){
        $(this).siblings().removeClass("current");
        $(this).addClass("current");
        var tab = $(this).attr("tab");
        $(".tabDiv").hide().removeClass("currentContent");
        $("."+tab).addClass("currentContent").show();
        
    });
    
    $(".datagrid-btbody tr").live("click",function(){
        var _this = $(this);
        if(_this.hasClass('datagrid-selected')){
          // _this.removeClass('datagrid-selected');
         // _this.find("td").children().removeClass('datagrid-selected');
        }else{
          $(".currentContent .datagrid-btbody").find("tr").removeClass('datagrid-selected').find("td").children().removeClass('datagrid-selected');
          _this.addClass('datagrid-selected');
          _this.find("td").children().addClass('datagrid-selected');
        };
    });
    
    function addRow(tableId,formIndex,formData){
        util.showLoading();
        var url ="/mes/buss/bussModel_ajaxAddSubComm.ms?FUNC_CODE=F285";
        var addTtable = $('#addTable_'+tableId);
        var tableTrJq = addTtable.find("tbody tr");
        var row_count = tableTrJq.length;
        if(row_count == 0){
            //curRowSeq=0;
        }
        var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();
      jQuery.ajax({
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
                var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
                dataCountObj.val(row_count+ 1);
                curRowSeq++;
                setChosen();//设置下拉框样式
                $(".glxb-table .chosen-container").css("width","100%");
                $("#")
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
    
    // 
    function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
        util.showLoading();
        var url ="${path}buss/bussModel_editSubDataAx.ms";
        var addTtable = $('#addTable_'+tableId);
        var tableTrJq = addTtable.find("tbody tr");
        var row_count = tableTrJq.length;
        if(row_count == 0){
            curRowSeq=0;
        }
        var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
      jQuery.ajax({
            type: "POST",
        dataType: "json",
        url: url,
        data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
            success: function(data){
                util.closeLoading();
                if("" == $("#aaaa").val()){
                $("#aaaa").val(data.ajaxPage.tableData);
                }else{
                $("#bbbb").val(data.ajaxPage.tableData);
                }
                var row = $(data.ajaxPage.tableData);
                _toClickColor(row);// <%-- 行点击着色 --%>
                addTtable.append(row);
                var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
                dataCountObj.val(row_count+ 1);
                curRowSeq=curRowSeq+row.length;
            },
            error: function(XMLHttpRequest, textStatus, errorThrown){
                util.closeLoading();
                var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
                if (null != sessionstatus && sessionstatus == "noAuthority") {
                }else{
                    util.alert("error:"+errorThrown);
                }
           }
        });
    }
    
</script>

    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
