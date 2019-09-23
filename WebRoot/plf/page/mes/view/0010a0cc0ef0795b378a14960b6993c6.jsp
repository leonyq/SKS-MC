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
            <div class="bd">
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
                    <input type="hidden" name="formIds" value="46a69fb9850f4b81909589215ac5053a">
                    <input type="hidden" value="paraMap1@1" name="46a69fb9850f4b81909589215ac5053a">
                    <input type="hidden" value="1" name="paraMap1@1__LEVEL__"/>
                    <input type="hidden" value="1" name="paraMap1@1__DATA_COUNT__"/>
                    <tbody>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="NAME" formId = "46a69fb9850f4b81909589215ac5053a" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="NAME" formId = "46a69fb9850f4b81909589215ac5053a" value="%{NAME}" />
                            </td>                            <td class="name">
                                <bu:uitn colNo="SEX" formId = "46a69fb9850f4b81909589215ac5053a" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="SEX" formId = "46a69fb9850f4b81909589215ac5053a" value="%{SEX}" />
                            </td>                        </tr>
                        <tr>
                            <td class="name">
                                <bu:uitn colNo="QQ" formId = "46a69fb9850f4b81909589215ac5053a" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="QQ" formId = "46a69fb9850f4b81909589215ac5053a" value="%{QQ}" />
                            </td>                            <td class="name">
                                <bu:uitn colNo="AGE" formId = "46a69fb9850f4b81909589215ac5053a" />
                            </td>
                            <td class="dec">
                                <bu:ui colNo="AGE" formId = "46a69fb9850f4b81909589215ac5053a" value="%{AGE}" />
                            </td>                        </tr>
                    </tbody>
                </table>
                <div class="js-tab">
                    <div id="hd">
                        <ul class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
                            <li id="title-612afe7157ae46479b87fdd32cb77485" class="current">
                                <a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1">子表单</span></a>
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
                            <a href="javascript:addAssociatedData('612afe7157ae46479b87fdd32cb77485','1','24c04f963db647769778aeed5eaead19');" title="添加" class="btn-op"><i class="ico ico-add"></i>添加</a>
                            <input type="hidden" id="associatedModel" value="1"/>
                        </div>
                        <div class="tab-add-div"></div>                        <div class="panel datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
                             <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-header1">
                                 <div class="datagrid-header">
                                     <div class="datagrid-header-inner" id="datagrid-header-inner">
                                        <table  class="datagrid-htable fixedTable datagrid-div6">
                                            <tbody>
                                                <input type="hidden" id="addTable_FORM_COL_ID_D612afe7157ae46479b87fdd32cb77485" value="8c6a9b933e49400aaf2134d7ba44cbc3"/>
                                                <tr class="datagrid-header-row">                                                    <td class="datagrid-cell"><bu:uitn colNo="NAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
                                                    <td class="datagrid-cell"><bu:uitn colNo="TYPENAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
                                                    <td class="datagrid-cell"><bu:uitn colNo="TESTNAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
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
                                        <input type="hidden" name="612afe7157ae46479b87fdd32cb77485" value="paraMap2@1"/>
                                        <input type="hidden" value="2" name="paraMap2@1__LEVEL__"/>
                                        <input type="hidden" value="1" name="paraMap2@1__DATA_COUNT__"/>
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
                            <input type="hidden" id="associatedModel" value="1"/>
                        </div>
                        <div class="tab-add-div"></div>                        <div class="panel datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
                             <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-header2">
                                 <div class="datagrid-header">
                                     <div class="datagrid-header-inner" id="datagrid-header-inner">
                                        <table  class="datagrid-htable fixedTable datagrid-div6">
                                            <tbody>
                                                <input type="hidden" id="addTable_FORM_COL_ID_D677346fc6b47486ba7a9164f03017738" value="838ca5844aa648d193678e96bd870742"/>
                                                <tr class="datagrid-header-row">                                                    <td class="datagrid-cell"><bu:uitn colNo="A" formId="677346fc6b47486ba7a9164f03017738" /></td>
                                                    <td class="datagrid-cell"><bu:uitn colNo="B" formId="677346fc6b47486ba7a9164f03017738" /></td>
                                                    <td class="datagrid-cell"><bu:uitn colNo="C" formId="677346fc6b47486ba7a9164f03017738" /></td>
                                                    <td class="datagrid-cell"><bu:uitn colNo="D" formId="677346fc6b47486ba7a9164f03017738" /></td>
                                                    <td class="datagrid-cell"><bu:uitn colNo="E" formId="677346fc6b47486ba7a9164f03017738" /></td>
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
                                        <input type="hidden" name="677346fc6b47486ba7a9164f03017738" value="paraMap2@2"/>
                                        <input type="hidden" value="2" name="paraMap2@2__LEVEL__"/>
                                        <input type="hidden" value="1" name="paraMap2@2__DATA_COUNT__"/>
                                        <tbody class="datagrid-btbody" >
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="js-tab">
                    <div id="hd">
                        <ul class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
                            <li id="title-ef89e60166894af08c5dfd37085b7f2e" class="current title-612afe7157ae46479b87fdd32cb77485">
                                <a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1">孙表单2</span></a>
                            </li>
                            <li id="title-783ba612e92847ad941f9f9d33cb331a">
                                <a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1">孙表单</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="topTab">
                    <div id="tabPanel_ef89e60166894af08c5dfd37085b7f2e" class="tabPanel">
                        <div class="tab-button more tab-add">
                            <a href="javascript:addAssociatedData('ef89e60166894af08c5dfd37085b7f2e','1','c195142ab55547cfbdd516ae3e532c4d');" title="添加" class="btn-op"><i class="ico ico-add"></i>添加</a>
                            <input type="hidden" id="associatedModel" value="1"/>
                        </div>
                        <div class="tab-add-div"></div>                        <div class="panel datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
                             <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-header1">
                                 <div class="datagrid-header">
                                     <div class="datagrid-header-inner" id="datagrid-header-inner">
                                        <table  class="datagrid-htable fixedTable datagrid-div6">
                                            <tbody>
                                                <input type="hidden" id="addTable_FORM_COL_ID_Def89e60166894af08c5dfd37085b7f2e" value="FORM_COL_ID_D"/>
                                                <tr class="datagrid-header-row">                                                    <td class="datagrid-cell" style="width:40px;">操作</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="datagrid-body tab-table-height">
                                    <table class="datagrid-btable-pop fixedTable datagrid-div6 glxb-table" id="addTable_ef89e60166894af08c5dfd37085b7f2e">
                                        <input type="hidden" id="table_curRowSeqef89e60166894af08c5dfd37085b7f2e" value="1"/>
                                        <input type="hidden" value="ef89e60166894af08c5dfd37085b7f2e" name="formIds"/>
                                        <input type="hidden" name="ef89e60166894af08c5dfd37085b7f2e" value="paraMap3@1"/>
                                        <input type="hidden" value="3" name="paraMap3@1__LEVEL__"/>
                                        <input type="hidden" value="1" name="paraMap3@1__DATA_COUNT__"/>
                                        <tbody class="datagrid-btbody" >
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>
                    <div id="tabPanel_783ba612e92847ad941f9f9d33cb331a" style="display:none" class="tabPanel">
                        <div class="tab-button more tab-add">
                            <a href="javascript:addAssociatedData('783ba612e92847ad941f9f9d33cb331a','2','e9072d2944164740baeb427e043acbbe');" title="添加" class="btn-op"><i class="ico ico-add"></i>添加</a>
                            <input type="hidden" id="associatedModel" value="1"/>
                        </div>
                        <div class="tab-add-div"></div>                        <div class="panel datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
                             <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-header2">
                                 <div class="datagrid-header">
                                     <div class="datagrid-header-inner" id="datagrid-header-inner">
                                        <table  class="datagrid-htable fixedTable datagrid-div6">
                                            <tbody>
                                                <input type="hidden" id="addTable_FORM_COL_ID_D783ba612e92847ad941f9f9d33cb331a" value="FORM_COL_ID_D"/>
                                                <tr class="datagrid-header-row">                                                    <td class="datagrid-cell" style="width:40px;">操作</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="datagrid-body tab-table-height">
                                    <table class="datagrid-btable-pop fixedTable datagrid-div6 glxb-table" id="addTable_783ba612e92847ad941f9f9d33cb331a">
                                        <input type="hidden" id="table_curRowSeq783ba612e92847ad941f9f9d33cb331a" value="1"/>
                                        <input type="hidden" value="783ba612e92847ad941f9f9d33cb331a" name="formIds"/>
                                        <input type="hidden" name="783ba612e92847ad941f9f9d33cb331a" value="paraMap3@2"/>
                                        <input type="hidden" value="3" name="paraMap3@2__LEVEL__"/>
                                        <input type="hidden" value="1" name="paraMap3@2__DATA_COUNT__"/>
                                        <tbody class="datagrid-btbody" >
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="js-tab">
                    <div id="hd">
                        <ul class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
                            <li id="title-cdba5173030f4b3da5bdb29f7dd9b0cd" class="current title-677346fc6b47486ba7a9164f03017738">
                                <a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1">孙表单4</span></a>
                            </li>
                            <li id="title-323f914f68b44838916953f0bc56668f">
                                <a class="selectli1"  href="javascript:void(0);"> <span class="selectspan1">孙表单3</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="topTab">
                    <div id="tabPanel_cdba5173030f4b3da5bdb29f7dd9b0cd" class="tabPanel">
                        <div class="tab-button more tab-add">
                            <a href="javascript:addAssociatedData('cdba5173030f4b3da5bdb29f7dd9b0cd','1','4e637dcc2d18489cb3522c92a9fb101e');" title="添加" class="btn-op"><i class="ico ico-add"></i>添加</a>
                            <input type="hidden" id="associatedModel" value="1"/>
                        </div>
                        <div class="tab-add-div"></div>                        <div class="panel datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
                             <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-header1">
                                 <div class="datagrid-header">
                                     <div class="datagrid-header-inner" id="datagrid-header-inner">
                                        <table  class="datagrid-htable fixedTable datagrid-div6">
                                            <tbody>
                                                <input type="hidden" id="addTable_FORM_COL_ID_Dcdba5173030f4b3da5bdb29f7dd9b0cd" value="FORM_COL_ID_D"/>
                                                <tr class="datagrid-header-row">                                                    <td class="datagrid-cell" style="width:40px;">操作</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="datagrid-body tab-table-height">
                                    <table class="datagrid-btable-pop fixedTable datagrid-div6 glxb-table" id="addTable_cdba5173030f4b3da5bdb29f7dd9b0cd">
                                        <input type="hidden" id="table_curRowSeqcdba5173030f4b3da5bdb29f7dd9b0cd" value="1"/>
                                        <input type="hidden" value="cdba5173030f4b3da5bdb29f7dd9b0cd" name="formIds"/>
                                        <input type="hidden" name="cdba5173030f4b3da5bdb29f7dd9b0cd" value="paraMap3@3"/>
                                        <input type="hidden" value="3" name="paraMap3@3__LEVEL__"/>
                                        <input type="hidden" value="1" name="paraMap3@3__DATA_COUNT__"/>
                                        <tbody class="datagrid-btbody" >
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>
                    <div id="tabPanel_323f914f68b44838916953f0bc56668f" style="display:none" class="tabPanel">
                        <div class="tab-button more tab-add">
                            <a href="javascript:addAssociatedData('323f914f68b44838916953f0bc56668f','2','acd5576586a74f9080c266148e3bf51c');" title="添加" class="btn-op"><i class="ico ico-add"></i>添加</a>
                            <input type="hidden" id="associatedModel" value="1"/>
                        </div>
                        <div class="tab-add-div"></div>                        <div class="panel datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
                             <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-header2">
                                 <div class="datagrid-header">
                                     <div class="datagrid-header-inner" id="datagrid-header-inner">
                                        <table  class="datagrid-htable fixedTable datagrid-div6">
                                            <tbody>
                                                <input type="hidden" id="addTable_FORM_COL_ID_D323f914f68b44838916953f0bc56668f" value="FORM_COL_ID_D"/>
                                                <tr class="datagrid-header-row">                                                    <td class="datagrid-cell" style="width:40px;">操作</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="datagrid-body tab-table-height">
                                    <table class="datagrid-btable-pop fixedTable datagrid-div6 glxb-table" id="addTable_323f914f68b44838916953f0bc56668f">
                                        <input type="hidden" id="table_curRowSeq323f914f68b44838916953f0bc56668f" value="1"/>
                                        <input type="hidden" value="323f914f68b44838916953f0bc56668f" name="formIds"/>
                                        <input type="hidden" name="323f914f68b44838916953f0bc56668f" value="paraMap3@4"/>
                                        <input type="hidden" value="3" name="paraMap3@4__LEVEL__"/>
                                        <input type="hidden" value="1" name="paraMap3@4__DATA_COUNT__"/>
                                        <tbody class="datagrid-btbody" >
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </div>

                </div>
         </form>
      </div>
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
    
    <%-- 删除多余的样式 --%>
    function removeClass(){
        if($(".datagrid-view").hasClass("datagrid-div2")){
            $(".datagrid-view").removeClass("datagrid-div2");
        }
    };
    
    <%-- 新增数据时回填 --%>
    function addData(tableId,formIndex,formData,curRowSeq,thisTr){
        $("#table_curRowSeq"+tableId).val(curRowSeq);// 给子表单新增时使用
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
</script>

    <jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
        <jsp:param name="needValidate" value="1" />
    </jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
