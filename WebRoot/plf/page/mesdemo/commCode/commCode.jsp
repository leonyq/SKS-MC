<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@ taglib prefix="c" uri="/plf/tld/c.tld"%>
<%@ taglib prefix="fmt" uri="/plf/tld/fmt.tld"%>
<%@ taglib prefix="fn" uri="/plf/tld/fn.tld"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%@ taglib prefix="bu" uri="/plf/tld/buss-tags.tld"%>
<%@ taglib prefix="ui" uri="/plf/tld/ml-ui-tags.tld"%>
<%@ page isELIgnored="false"%>
<c:choose>
  <%-- 查询列表公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_1'}">
       <c:choose>
            <c:when test="${param.formName eq 'searchForm'}">
                  <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>" />
                  <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="<c:out value='${paraMap.searchParaShowState}' />" />
                  <s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
            </c:when>
            <c:when test="${param.formName eq 'listForm'}">
                 <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>" />
                 
            </c:when>
            <c:when test="${param.location eq 'jsLoading'}">
                 <script type="text/javascript">
                    $('.js-nav').slick({
                       dots: false,
                       autoplay: false,
                       slidesToScroll:1,
                       slidesToShow:8
                   });
                    $('.menu-sub').mCustomScrollbar({
                     scrollInertia:150
                   });
                   $('#mCSB_1').css('overflow','visible');
                   $('.banner .item1').hover(function(){
                     $('.banner').css('border-bottom-color','#20c2ff');
                   },
                   function(){
                      $('.banner').css('border-bottom-color','#20c2ff');
                   });
                   $('.banner .item2').hover(function(){
                     $('.banner').css('border-bottom-color','#fccd00');
                   },
                   function(){
                      $('.banner').css('border-bottom-color','#20c2ff');
                   });
                   $('.banner .item3').hover(function(){
                     $('.banner').css('border-bottom-color','#8fcf3e');
                   },
                   function(){
                      $('.banner').css('border-bottom-color','#20c2ff');
                   });
                   $('.banner .item4').hover(function(){
                     $('.banner').css('border-bottom-color','#592e2e');
                   },
                   function(){
                      $('.banner').css('border-bottom-color','#20c2ff');
                   });
            
                   function Height(){
                     var H = $(window).height();
                     $('.menu').css('height',H);
                     $('.content').css('height',H - 70);
                     $('.content').mCustomScrollbar({
                       scrollInertia:150
                     });
                   }
                   Height();
                   $(window).resize(function(){
                     $('.content').mCustomScrollbar("destroy");
                     Height();
                   });
                   $(function(){
                     $('.dept_select').chosen();
                 });
                   
            
                   var isQuery = false;
                   function query(thisObj){
                       //如果有时间段的存在，则复制到搜索表单中
                       if($("#timeBucketId")){
                           $("#searchForm").append($("#timeBucketId").clone());
                           $("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
                       }
                       if(isQuery){utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");}
                       if($("#isClearOrder").val()==1){
                           clearSelectOrder();
                       }
                       try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
                       document.forms.searchForm.submit();
                       util.showTopLoading();
                       isQuery=true;
                   }
                   
                   function alertInfo(msg){
                       utilsFp.confirmIcon(3,"","","", msg,"","350","");
                   }
                   
                   function reloadPg(msg,title,width,height,time){
                       //utilsFp.alert(msg,reloadPgExe);
                       msgPop(msg,reloadPgExe,title,width,height,time);
                   }
                   
                   function reloadPgExe(){
                       //document.forms.searchForm.submit();
                       query();
                       util.showTopLoading();
                       top.$(".dialog-close").click();
                   }
                   
                   function init(){
                       if($("#leftTable-kz").length>0){
                           $("#leftTable-kz").show();
                       }
                       
                       if($("#leftTable").length>0){
                           $("#leftTable").show();
                       }
                       <s:if test='null != #parameters[@com.more.fw.core.common.method.ConstantsMc@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.ConstantsMc@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
                   }
               </script>
            </c:when>
            <c:otherwise></c:otherwise>
       </c:choose>
  </c:when>
  
  <%-- 扩展列表公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_3'}">
     <c:choose>
         <c:when test="${param.formName eq 'searchForm'}">
                    <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>" />
                    <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="<c:out value='${paraMap.searchParaShowState}' />" />
                    <s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
            </c:when>
            <c:when test="${param.formName eq 'listForm'}">
                   <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>" />
            </c:when>
            <c:when test="${param.location eq 'jsLoading'}">
                 <script type="text/javascript">
                   var isQuery = false;
                   function query(thisObj){
                       if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
                       // if(! getDealSearchMultiTimeSlotBtn()) return;
                       //如果有时间段的存在，则复制到搜索表单中
                       if($("#timeBucketId")){
                           $("#searchForm").append($("#timeBucketId").clone());
                           $("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
                       }
                       if($("#isClearOrder").val()==1){
                           clearSelectOrder();
                       }
                      
                         try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
                         document.forms.searchForm.submit();
                         util.showTopLoading();
                         isQuery=true;
                        
                   }
                   
                   function alertInfo(msg){
                       utilsFp.confirmIcon(3,"","","", msg,"","350","");
                   }
                   
                   function reloadPg(msg,title,width,height,time){
                       //utilsFp.alert(msg,reloadPgExe);
                       msgPop(msg,reloadPgExe,title,width,height,time);
                   }
                   
                   function reloadPgExe(){
                       //document.forms.searchForm.submit();
                       query();
                       util.showTopLoading();
                       top.$(".dialog-close").click();
                   }
                   
                   
                   function reloadPgAx(msg,title,width,height,time,isCloseWin){
						msgPop(msg,reloadPgExeAx,title,width,height,time,isCloseWin);
					}
					
					function reloadPgExeAx(isCloseWin){
						query();
						util.showTopLoading();
						if(isCloseWin == "0"){
						    top.$(".dialog-close").click();
						}
					}
                   
                   function init(){
                       if($("#leftTable-kz").length>0){
                           $("#leftTable-kz").show();
                       }
                       
                       if($("#leftTable").length>0){
                           $("#leftTable").show();
                       }
                       <s:if test='null != #parameters[@com.more.fw.core.common.method.ConstantsMc@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.ConstantsMc@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
                    }
                </script>
        </c:when>
       <c:otherwise></c:otherwise>
     </c:choose>
  </c:when>
  
  <%-- 修改公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_4'}">
      <c:choose>
           <c:when test="${param.formName eq 'editForm'}">
                <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>">
                <input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}'/>">
                <input type="hidden" name="formId" value="<c:out value='${formId}'/>">
                <input type="hidden" name="dataId" value="<c:out value='${dataId}'/>">
                <bu:editcp exeid="%{exeid}" formId="%{formId}" dataId="%{dataId}" />
           </c:when>
             <c:when test="${param.location eq 'jsLoading'}">
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
                    document.forms.editForm.submit();
                    isQuery = true;
                }
                
                function alertInfo(msg){
                    isQuery = false;
                    utilsFp.confirmIcon(3,"","","", msg,"","350","");
                }
                
                function reloadPg(msg,title,width,height,time){
                    isQuery = false;
                    parent.reloadPg(msg,title,width,height,time);
                }

                var FORM_COL_ID_D=null;
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
                
                function init(){
                    if($("#leftTable-kz").length>0){
                        $("#leftTable-kz").show();
                    }
                    
                    if($("#leftTable").length>0){
                        $("#leftTable").show();
                    }
                    initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
                    /*
                    var formIds = $("input[type='hidden'][name='formIds']").val();
                    var formIdLs = formIds.split(",");
                    for(var i=0,j=formIdLs.length;i<j;i++){
                        getEditRows(formIdLs[i],"0");
                    }
                    */
                }
                

            <%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
            var maxLen =5;
            if(thisObj.value.length < maxLen ){
                _alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
                return false;
            }else{
                return true;
            }
             --%>
                </script>
        </c:when>
          <c:otherwise></c:otherwise>
       </c:choose>
  </c:when> 
  
   <%-- 查看公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_5'}">
      <c:choose>
           <c:when test="${param.formName eq 'searchForm'}">
                <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>" />
               <s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
           </c:when>
            <c:when test="${param.formName eq 'listForm'}">
                  <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>" />
            </c:when>
             <c:when test="${param.location eq 'jsLoading'}">
              <script type="text/javascript">
                var isQuery = false;
                function query(thisObj){
                    //如果有时间段的存在，则复制到搜索表单中
                    if($("#timeBucketId")){
                        $("#searchForm").append($("#timeBucketId").clone());
                        $("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
                    }
                    if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
                  try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
                    document.forms.searchForm.submit();
                    util.showTopLoading();
                    isQuery=true;
                }
                
                function alertInfo(msg){
                    util.alert(msg);
                }
                
                function reloadPg(msg){
                    util.alert(msg);
                    //document.forms.searchForm.submit();
                    query();
                    util.showTopLoading();
                }
                
                function init(){
                    $(".table_list").each(function(seq) {
                        var tableTrJs =$(this).find("tbody tr");
                        _toClickColorMap(tableTrJs,$(this).attr("id"));
                        _tongLineColor(tableTrJs);
                    });
                    if($("#leftTable-kz").length>0){
                        $("#leftTable-kz").show();
                    }
                    
                    if($("#leftTable").length>0){
                        $("#leftTable").show();
                    }
                    <s:if test='null != #parameters[@com.more.fw.core.common.method.ConstantsMc@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.ConstantsMc@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
                }
            </script>
          </c:when>
          <c:otherwise></c:otherwise>
       </c:choose>
  </c:when>  
  
  <%-- 新增公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_6'}">
   <c:choose>
            <c:when test="${param.formName eq 'addForm'}">
                  <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>">
                <input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}'/>">
                <s:token />
                <table class="func_table">
                    <tr>
                        <td width="100%" align="right">
                            <input type="button" value="<dict:lang value="保存" />" onclick="add(this);" class="botton_img_add">
                            <input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
                        </td>
                    </tr>
                </table>
                <bu:addcp exeid="%{exeid}" />
            </c:when>
            <c:otherwise></c:otherwise>
      </c:choose>
  </c:when>
  
  <%-- 配置公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_7'}">
     <c:choose>
          <c:when test="${param.formName eq 'searchForm'}">
              <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>" />
              <s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
           </c:when>
            <c:when test="${param.formName eq 'addForm'}">
                  <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>" />
            <table class="add_table">
                <tr>
                  <th colspan="2"><dict:lang value="xx配置页面" /><span class="Eng">* </span><dict:lang value="为必填写项" /></th>
                </tr>
                    <tr>
                        <td width="35%" class="tr1">配置项1</td>
                        <td width="65%">
                            <s:textfield id="dictValDto_code" name="dictValDto.code" maxlength="20" cssClass="text_input_150" />
                            <span class="Eng">*</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="tr1">配置项2</td>
                        <td>
                            <s:textfield id="dictValDto_value" name="dictValDto.value" maxlength="20" cssClass="text_input_150" />
                            <span class="Eng">*</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="tr1">下拉列表项：</td>
                        <td>
                            <dict:selectDict name="dictValDto.type" dictCode="YESNO" dictValue="" />
                        </td>
                    </tr>
            </table>
           <br />
           <br />
           <br />
           <div class="ptop_10 txac">
                <input type="button" value="提 交" onclick="add(this);" class="botton_img_add">
                &nbsp;&nbsp;
                <input type="reset" value="重 置"class="botton_img_search" />
            </div>
            </c:when>
            
               <c:when test="${param.location eq 'jsLoading'}">
            <script type="text/javascript">
            var isQuery = false;
            function query(thisObj){
                //如果有时间段的存在，则复制到搜索表单中
                if($("#timeBucketId")){
                    $("#searchForm").append($("#timeBucketId").clone());
                    $("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
                }
                if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
               try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
                document.forms.searchForm.submit();
                util.showTopLoading();
                isQuery=true;
            }
            
            function add(thisObj){
                if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
                if(!valData()){
                    return ;
                }
                document.forms.addForm.submit();
                isQuery=true;
            }
            
            function alertInfo(msg){
                util.alert(msg);
            }
            
            function reloadPg(msg){
                util.alert(msg);
                //document.forms.searchForm.submit();
                query();
                util.showTopLoading();
            }
            
            <%-- 这里验证合法性 --%>
            function valData(){
                var dictValDto_code = document.getElementById("dictValDto_code");
               if(val.isBlank(dictValDto_code)){
                   _alertValMsg(dictValDto_code,"<dict:lang value="配置项1" /> -- <dict:lang value="不能为空" />");
                   return false;
               }
               
                var dictValDto_value = document.getElementById("dictValDto_value");
               if(val.isBlank(dictValDto_value)){
                   _alertValMsg(dictValDto_value,"<dict:lang value="配置项1" /> -- <dict:lang value="不能为空" />");
                   return false;
               }
                return true;
            }
            
            function init(){
                $(".table_list").each(function(seq) {
                    var tableTrJs =$(this).find("tbody tr");
                    _toClickColorMap(tableTrJs,$(this).attr("id"));
                    _tongLineColor(tableTrJs);
                });
                if($("#leftTable-kz").length>0){
                    $("#leftTable-kz").show();
                }
                
                if($("#leftTable").length>0){
                    $("#leftTable").show();
                }
            }
            </script>
            </c:when>
            <c:otherwise></c:otherwise>
      </c:choose>
  </c:when>
  
  <%-- TAB标签页公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_8'}">
  <c:choose>
        <c:when test="${param.location eq 'inHead'}">
        </c:when>    
        <c:otherwise></c:otherwise>
    </c:choose>
  </c:when>
  
   <%-- TAB标签页子视图公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_9'}">
    <c:choose>
     <c:when test="${param.location eq 'jsLoading'}">
          <script type="text/javascript">
                var searchForm;
                var isQuery = false;
                function query(thisObj){
                    //如果有时间段的存在，则复制到搜索表单中
                    if($("#timeBucketId")){
                        $("#searchForm").append($("#timeBucketId").clone());
                        $("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
                    }
                    if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
                    var selectObj = $(window.parent.document.forms.searchForm).clone(true);
                    var pageHtml = $("#searchForm").html();
                    var page_currentPage = $("#page_currentPage").val();
                    var page_pageRecord = $("#page_pageRecord ").val(); 
                    $("#searchDiv").html(selectObj);
                    $("#searchDiv form").append(pageHtml);
                    $("#searchDiv form").append("<input type='hidden' name='parentExeid' value='"+$("#searchForm input[name='exeid']").val()+"'/>");
                    $("#searchForm input[name='exeid']").val($("#listForm input[name='exeid']").val());
                    $("#page_currentPage").val(page_currentPage);
                    $("#page_pageRecord ").val(page_pageRecord ); 
                    try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
                 
                    $("#searchForm").submit();
                    util.showTopLoading();
                    isQuery=true;
                }
                
                function alertInfo(msg){
                    util.alert(msg);
                }
                
                function reloadPg(msg){
                    util.alert(msg);
                    /*if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
                    var selectObj = $(window.parent.document.forms.searchForm).clone(true);
                    var pageHtml = $("#searchForm").html();
                    var page_currentPage = $("#page_currentPage").val();
                    var page_pageRecord = $("#page_pageRecord ").val(); 
                    $("#searchDiv").html(selectObj);
                    $("#searchDiv form").append(pageHtml);
                    $("#searchDiv form").append("<input type='hidden' name='parentExeid' value='"+$("#searchForm input[name='exeid']").val()+"'/>");
                    $("#searchForm input[name='exeid']").val($("#listForm input[name='exeid']").val());
                    $("#page_currentPage").val(page_currentPage);
                    $("#page_pageRecord ").val(page_pageRecord ); 
                    $("#searchForm").submit();*/
                    query();
                    util.showTopLoading();
                }
                
                function init(){
                    $(".table_list").each(function(seq) {
                        var tableTrJs =$(this).find("tbody tr");
                        _toClickColorMap(tableTrJs,$(this).attr("id"));
                        _tongLineColor(tableTrJs);
                    });
                    
                    if($("#leftTable-kz").length>0){
                        $("#leftTable-kz").show();
                    }
                    
                    if($("#leftTable").length>0){
                        $("#leftTable").show();
                    }
                    
                    <s:if test='null != #parameters[@com.more.fw.core.common.method.ConstantsMc@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.ConstantsMc@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
                    $(".botton_img_add").hide();
                }
            
            </script>
        </c:when>
      <c:otherwise></c:otherwise>
     </c:choose>
  </c:when>
  
  <%-- 扩展新增公用元素 --%>
<c:when test="${param.modelName eq 'VIEW_TYPE_10'}">
    <c:choose>
    	<c:when test="${param.location eq 'beforePageLoad'}">
    		<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
    		<%    %>
    	</c:when>
    
        <c:when test="${param.location eq 'inHead'}">
            <script>
         
       if( window.top != window.self ){
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
                     	  	    	
            	  	    }//if( window.top != window.self ){
             
          
                
            </script>
            <script type="text/javascript">
                var addTableTrMap;
                UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
                UE.Editor.prototype.getActionUrl = function(action){  
                    //调用自己写的Controller 
                    if(action == 'uploadimage' || action == 'uploadfile'){  
                   	 return "${path}/buss/bussModel_editorUploadImg.ms?savePath="+$("#_savePath").val(); //自己controller的action  
                    }else if(action == "uploadvideo"){  
                        return "<c:out value='${ctx}' />/ueditor/videoUp";//自己controller的action  
                    }else{  
                        return this._bkGetActionUrl.call(this,action);//百度编辑器默认的action  
                    }  
                }  
            	
            </script>
              
        </c:when>    
        <c:when test="${param.location eq 'addForm'}">
            <!-- Form里面 -->
            <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>">
            <input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}'/>">
            <input type="hidden" name="formId" value="<c:out value='${formId}'/>">
            <input type="hidden" name=iframeId value="<c:out value='${iframeId}'/>">
            <input type="hidden" id ="authIsGanged" name=authIsGanged value="<c:out value='${authIsGanged}'/>">
            <input type="hidden" id ="is_show_help" name="is_show_help" value="<c:out value='${IS_SHOW_HELP}'/>">
            <input type="hidden" name="mcTokenKey" value="${mc_token_key}">
            <input type="hidden" name="_formToken" value="${mc_token_key}"><%--
            <input type="hidden" name="_formToken" value="<c:out value='${formToken}'/>">
            
            --%><s:token />
            <table class="func_table">
                <tr>
                    <td width="100%" align="right">
                    </td>
                </tr>
            </table>
        </c:when>
        <c:when test="${param.location eq 'jsLoading'}">
              <script type="text/javascript">
              function init(){
                  if($("#leftTable-kz").length>0){
                      $("#leftTable-kz").show();
                  }
                  
                  if($("#leftTable").length>0){
                      $("#leftTable").show();
                  }
                  $(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
              }//初始化方法
              
              function resetForm(){
            	  setPrefixInd();
          		$("#addForm")[0].reset();
          		$(".dept_select").trigger("chosen:updated");
          	}
              
              $(function(){
              	setPrefixInd();
              	
              	//帮助
              	var exeid="<c:out value='${exeid}'/>";
              	var is_show_help=$("#is_show_help").val();
              	if(is_show_help=='Y'){
              		 var url="${path}/sys/BussModelAction_showHelp.ms?paraMap.VIEW_ID="+exeid;
			    	 utilsFp.setHelp({ifShow: true, url:url});
			    
              	}
              	
              });
              
              function setPrefixInd(){
              	if($(".multiFileUploadText").length>0){
              		var id = guid();
              		var prefixInd = $("#prefixInd").val();
              		if($("#"+prefixInd.replace('@', '')+"_"+"ID").length>0){
              			$("#"+prefixInd.replace('@', '')+"_"+"ID").remove();
              		}
              		$("#prefixInd").after("<input type='hidden' id="+(prefixInd.replace('@', '')+"_"+"ID")+" name="+(prefixInd+"0#ID")+" value="+id.replace(/-/g, '')+">");
              	};
              };
              
               var dataAuthSelect="";
	          	if("1"=="<c:out value='${mcIsOpenAuth}' />"){
	         		 dataAuthSelect =
	        			"<select id='deptLs_data_auth' style='display:none;width: 200px;'   name='_DATA_AUTH' >"
	        		    +"<option value='${sessionScope.mcDataAuth}'>${sessionScope.mcDataAuthName}</option>"
	        		    +"</select>"
	        	        +"<span class='dot'>*</span><dict:lang value='组织机构' />&nbsp;<select id='deptLs_data_auth_text' style='width: 200px;' class='dept_select' disabled ='disabled' name='_DATA_AUTH_TEXT' >"
	        	        +"<option value=''>${sessionScope.mcDataAuthName}</option>"
	        	        +"</select>";
	          	}
	          	if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" !="<c:out value='${isOldAuthDataPattern}' />"){
	          		dataAuthSelect = "<select id='deptLs_data_auth' style='display:none;width: 200px;'   name='_DATA_AUTH' >"
	      	        +"<option value='${sessionScope.mcDataAuth}'>${sessionScope.mcDataAuthName}</option>"
	      	        +"</select>";
	          	}
              $(".hd").append(dataAuthSelect);
              $(function(){
                  if($("#authIsGanged").val()=="1"){
                   	   if("1"=="<c:out value='${mcIsOpenAuth}' />"){ //14版本组织机构
                   		 var dataAuth = $("#deptLs_data_auth").val();
                   		 $(".dept_select").not("#deptLs_data_auth").each(function(){
                       		var thisId = $(this).prop("id");
                       		if($("#"+thisId+"_formId").length!=0){
                       			var formId = $("#"+thisId+"_formId").val();
                       			var formColId = $("#"+thisId+"_formColId").val();
                       			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                       			var uiType = $("#"+thisId+"_uiType").val();
                       			if(dataAuth==""){
                       				var option = "";
                       				$("#deptLs_data_auth option").each(function(){
                           				option = $(this).val();
                       					if(option==""){
                       						return true;
                       					}
                       					dataAuth+=option+",";
                       				});
                       				dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
                       			}
                       			_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
                       		};
                       	});
                   	  }
                   	 if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" !="<c:out value='${isOldAuthDataPattern}' />"){
                 		$(".dept_select").each(function(){
                        		var thisId = $(this).prop("id");
                        		if($("#"+thisId+"_formId").length!=0){
                        			var formId = $("#"+thisId+"_formId").val();
                        			var formColId = $("#"+thisId+"_formColId").val();
                        			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                        			var uiType = $("#"+thisId+"_uiType").val();
                        			_controlsDataAuth(formId,"1",thisId,"<c:out value='${sessionScope.mcDataAuth}'/>",formColId,uiType);
                        		};
                        	});
                 	}
                   	   
                   	  if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" =="<c:out value='${isOldAuthDataPattern}' />"){ //13版本组织机构
                   		if($("#deptLs_data_auth").length==0){
                      		$(".dept_select").not("#deptLs_data_auth").each(function(){
                          		var thisId = $(this).prop("id");
                          		if($("#"+thisId+"_formId").length!=0){
                          			var formId = $("#"+thisId+"_formId").val();
                          			var formColId = $("#"+thisId+"_formColId").val();
                          			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                          			var uiType = $("#"+thisId+"_uiType").val();
                          			var dataAuth = "mCAuthIsNull";
                          			_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
                          		};
                          	});
                      	}else{
                      		$("#deptLs_data_auth").change(function(){
                          		var dataAuth = $("#deptLs_data_auth").val();
                          		if(dataAuth!=""){
                          			$(".clearPopVal").val("");
                          		}
                          		$(".dept_select").not("#deptLs_data_auth").each(function(){
                              		var thisId = $(this).prop("id");
                              		if($("#"+thisId+"_formId").length!=0){
                              			var formId = $("#"+thisId+"_formId").val();
                              			var formColId = $("#"+thisId+"_formColId").val();
                              			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                              			var uiType = $("#"+thisId+"_uiType").val();
                              			if(dataAuth==""){
                              				var option = "";
                              				$("#deptLs_data_auth option").each(function(){
                                  				option = $(this).val();
                              					if(option==""){
                              						return true;
                              					}
                              					dataAuth+=option+",";
                              				});
                              				dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
                              			}
                              			_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
                              		};
                              	});
                          	});
                          	$("#deptLs_data_auth").trigger("change");
                      	  };
                   	  }
                   }
                });
                
              
            </script>
        </c:when>
         <c:when test="${param.location eq 'jsLoadingflow'}">
              <script type="text/javascript">
              function init(){
                  if($("#leftTable-kz").length>0){
                      $("#leftTable-kz").show();
                  }
                  
                  if($("#leftTable").length>0){
                      $("#leftTable").show();
                  }
                  $(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
              }//初始化方法
              
              function resetForm(){
            	  setPrefixInd();
          		$("#addForm")[0].reset();
          		$(".dept_select").trigger("chosen:updated");
          	}
              
              $(function(){
              	setPrefixInd();
              	
              });
              
              function setPrefixInd(){
              	if($(".multiFileUploadText").length>0){
              		var id = guid();
              		var prefixInd = $("#prefixInd").val();
              		if($("#"+prefixInd.replace('@', '')+"_"+"ID").length>0){
              			$("#"+prefixInd.replace('@', '')+"_"+"ID").remove();
              		}
              		$("#prefixInd").after("<input type='hidden' id="+(prefixInd.replace('@', '')+"_"+"ID")+" name="+(prefixInd+"0#ID")+" value="+id.replace(/-/g, '')+">");
              	}
              }

              </script>
              </c:when>
        <c:otherwise></c:otherwise>
    </c:choose>
</c:when>
  
  <%-- 扩展修改公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_11'}">
       <c:choose>
        <c:when test="${param.location eq 'inHead'}">
        <script>
             
            	  	    if( window.top != window.self ){
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
            	  	    	
            	  	    	
            	  	    }//if( window.top != window.self ){
             
     	  	  UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
     	         UE.Editor.prototype.getActionUrl = function(action){  
     	             //调用自己写的Controller 
     	             if(action == 'uploadimage' || action == 'uploadfile'){  
     	            	 return "${path}/buss/bussModel_editorUploadImg.ms?savePath="+$("#_savePath").val(); //自己controller的action  
     	             }else if(action == "uploadvideo"){  
     	                 return "<c:out value='${ctx}' />/ueditor/videoUp";//自己controller的action  
     	             }else{  
     	                 return this._bkGetActionUrl.call(this,action);//百度编辑器默认的action  
     	             }  
     	         }  
     	        	
            </script>
        </c:when>    
        <c:when test="${param.location eq 'editForm'}">
              <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>">
                <input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}'/>">
                <input type="hidden" name="formId" value="<c:out value='${formId}'/>">
                <input type="hidden" name="dataId" value="<c:out value='${dataId}'/>">
                 <input type="hidden" id ="authIsGanged" name=authIsGanged value="<c:out value='${authIsGanged}'/>">
                <input type="hidden" name=iframeId value="<c:out value='${iframeId}'/>">
                <input type="hidden" name="_formToken" value="<c:out value='${formToken}'/>">
                <input type="hidden" id ="is_show_help" name="is_show_help" value="<c:out value='${IS_SHOW_HELP}'/>">
                <table class="func_table">
                    <tr>
                        <td width="100%" align="right">
                        </td>
                    </tr>
                </table>
        </c:when>
        <c:when test="${param.location eq 'jsLoading'}">
             <script type="text/javascript">
                     var parentWindow;
                        $(function(){
                             parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
                        });
                    var isQuery = false;
                    function edit(thisObj){
                        if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
                        if(!val.valNullData()){
                            return ;
                        }
                        if(!val.valDataBaseSetData()){
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
                    
                    function alertInfo(msg){
                        isQuery = false;
                        utilsFp.confirmIcon(3,"","","", msg,"","350","");
                    }
                    
                    function reloadPg(msg,title,width,height,time){
                        isQuery = false;
                        parentWindow.reloadPg(msg,title,width,height,time);
                    }
            
                    //重置    
                    function resetForm(){
                        $("#editForm")[0].reset();
                        $(".dept_select").trigger("chosen:updated");
                    }
                    
                    function init(){
                        if($("#leftTable-kz").length>0){
                            $("#leftTable-kz").show();
                        }
                        
                        if($("#leftTable").length>0){
                            $("#leftTable").show();
                        }
                        if($("input[type='hidden'][name='formIds']").length>1){
                            initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
                        }
                        /*
                        var formIds = $("input[type='hidden'][name='formIds']").val();
                        var formIdLs = formIds.split(",");
                        for(var i=0,j=formIdLs.length;i<j;i++){
                            getEditRows(formIdLs[i],"0");
                        }
                        */
                    }
                    var dataAuthSelect="";
     	        	if("1"=="<c:out value='${mcIsOpenAuth}' />"){
     	         		 dataAuthSelect =
     	        			"<select id='deptLs_data_auth' style='display:none;width: 200px;'   name='paraMapObj._DATA_AUTH' >"
     	        		    +"<option value='${sessionScope.mcDataAuth}'>${sessionScope.mcDataAuthName}</option>"
     	        		    +"</select>"
     	        	        +"<span class='dot'>*</span><dict:lang value='组织机构' />&nbsp;<select id='deptLs_data_auth_text' style='width: 200px;' class='dept_select' disabled ='disabled' name='_DATA_AUTH_TEXT' >"
     	        	        +"<option value=''>${sessionScope.mcDataAuthName}</option>"
     	        	        +"</select>";
     	         	}
     	        	if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" !="<c:out value='${isOldAuthDataPattern}' />"){
     	         		dataAuthSelect = "<select id='deptLs_data_auth' style='display:none;width: 200px;'   name='paraMapObj._DATA_AUTH' >"
     	      	        +"<option value='${sessionScope.mcDataAuth}'>${sessionScope.mcDataAuthName}</option>"
     	      	        +"</select>";
     	         	}
     	           $(".hd").append(dataAuthSelect);
                    $(function(){
                    	if($("#authIsGanged").val()=="1"){
                    		if("1"=="<c:out value='${mcIsOpenAuth}' />"){ //14版本
                    		$(".dept_select").not("#deptLs_data_auth").each(function(){
                        		var thisId = $(this).prop("id");
                        		if($("#"+thisId+"_formId").length!=0){
                        			var formId = $("#"+thisId+"_formId").val();
                        			var formColId = $("#"+thisId+"_formColId").val();
                        			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                        			var uiType = $("#"+thisId+"_uiType").val();
                        			var dataAuth = $("#deptLs_data_auth").val();
                        			_controlsDataAuth(formId,"1",thisId,"${sessionScope.mcDataAuth}",formColId,uiType);
                        		};
                    	   });
                        }
                    	if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" !="<c:out value='${isOldAuthDataPattern}' />"){
                           		$(".dept_select").each(function(){
                            		var thisId = $(this).prop("id");
                            		if($("#"+thisId+"_formId").length!=0){
                            			var formId = $("#"+thisId+"_formId").val();
                            			var formColId = $("#"+thisId+"_formColId").val();
                            			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                            			var uiType = $("#"+thisId+"_uiType").val();
                            			_controlsDataAuth(formId,"1",thisId,"${sessionScope.mcDataAuth}",formColId,uiType);
                            		};
                        	   });	
                          }	
                    	if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" =="<c:out value='${isOldAuthDataPattern}' />"){
                    		if($("#deptLs_data_auth").length==0){
               				 $(".dept_select").not("#deptLs_data_auth").each(function(){
               		        		var thisId = $(this).prop("id");
               		        		if($("#"+thisId+"_formId").length!=0){
               		        			var formId = $("#"+thisId+"_formId").val();
               		        			var formColId = $("#"+thisId+"_formColId").val();
               		        			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
               		        			var uiType = $("#"+thisId+"_uiType").val();
               		        			var dataAuth = "mCAuthIsNull";
               		        			_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
               		        		};
               		        	});
               			 }else{
               				 $("#deptLs_data_auth").change(function(event, param){
               					    var dataAuth = $("#deptLs_data_auth").val();
               			    		if(dataAuth!="" && param!="1" ){
               			    			$(".clearPopVal").val("");
               			    		}				 
               			    		$(".dept_select").not("#deptLs_data_auth").each(function(){
               			        		var thisId = $(this).prop("id");
               			        		if($("#"+thisId+"_formId").length!=0){
               			        			var formId = $("#"+thisId+"_formId").val();
               			        			var formColId = $("#"+thisId+"_formColId").val();
               			        			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
               			        			var uiType = $("#"+thisId+"_uiType").val();
               			        			var dataAuth = $("#deptLs_data_auth").val();
               			        			if(dataAuth==""){
               			        				var option = "";
               			        				$("#deptLs_data_auth option").each(function(){
               			            				option = $(this).val();
               			        					if(option==""){
               			        						return true;
               			        					}
               			        					dataAuth+=option+",";
               			        				});
               			        				dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
               			        			}
               			        			_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
               			        		};
               			        	});
               			    	});
               			    	$("#deptLs_data_auth").trigger("change",["1"]);
               			  }
                    	}
                      }
                                            
                    });

					//帮助
	              	var exeid="<c:out value='${exeid}'/>";
	              	var is_show_help=$("#is_show_help").val();
	              	if(is_show_help=='Y'){
	              		 var url="${path}/sys/BussModelAction_showHelp.ms?paraMap.VIEW_ID="+exeid;
				    	 utilsFp.setHelp({ifShow: true, url:url});
				    
	              	}
              	            
                <%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
                var maxLen =5;
                if(thisObj.value.length < maxLen ){
                    _alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
                    return false;
                }else{
                    return true;
                }
                 --%>
             </script>
        </c:when>
        <c:otherwise></c:otherwise>
    </c:choose>
  </c:when>
  
  <%-- Tab标签页新增公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_12'}">
   <c:choose>
        <c:when test="${param.location eq 'inHead'}">
  <script>
             
           if( window.top != window.self ){
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
                        //include( [i].src);
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
            	  	    	
            	  	    	
        }//if( window.top != window.self ){
            
          
                
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
         background: url(${path}plf/page/fp/img/ico-kl.png?_mc_res_version=<%=PlfStaticRes.ICO_KL_PNG%>) no-repeat; 
        }
        .extend-btn button:hover .ico-kl-new-add{
         width: 15px;
         height: 15px;
         margin-right: 5px;
         margin-bottom: 3px; 
         background: url(${path}plf/page/fp/img/ico-kl-h.png?_mc_res_version=<%=PlfStaticRes.ICO_KL_H_PNG%>) no-repeat; 
        }
        .extend-btn button .ico-sc-new-add{
         width: 15px;
         height: 15px;
         margin-right: 5px;
         margin-bottom: 3px; 
         background: url(${path}plf/page/fp/img/ico-sc.png?_mc_res_version=<%=PlfStaticRes.ICO_SC_PNG%>) no-repeat; 
        }
        .extend-btn button:hover .ico-sc-new-add{
         width: 15px;
         height: 15px;
         margin-right: 5px;
         margin-bottom: 3px; 
         background: url(${path}plf/page/fp/img/ico-sc-h.png?_mc_res_version=<%=PlfStaticRes.ICO_SC_H_PNG%>) no-repeat; 
        }
    </style>
        </c:when>    
        <c:when test="${param.location eq 'addForm'}">
              <input type="hidden"  name="exeid" value="<c:out value='${exeid}'/>">
                <input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}'/>">
                <input type="hidden" name=iframeId value="<c:out value='${iframeId}'/>">
                <input type="hidden" name=formId value="<c:out value='${formId}'/>">
                <input type="hidden" name="_formToken" value="<c:out value='${formToken}'/>">
                <s:set name="_$type" value="'add'" />
                <s:token />
                <table class="func_table">
                    <tr>
                        <td width="100%" align="right">

                        </td>
                    </tr>
                </table>
        </c:when>
        <c:when test="${param.location eq 'jsLoading'}">
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
                    var url ="${path}buss/bussModel_ajaxAddSubComm.ms?FUNC_CODE=F285";
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
            </script>
        </c:when>
        <c:otherwise></c:otherwise>
    </c:choose>
  </c:when>
  
  <%-- 扩展修改公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_17'}">
     
        <c:choose>
        <c:when test="${param.location eq 'searchForm'}">
              <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>" />
              <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="<c:out value='${paraMap.searchParaShowState}' />" />
               <%--  异步查询列表不能带原有同步查询功能的FUNC_CODE，如果查询的异步数据需要权限控制，则新建一个异步的URL，并写上其功能ID
              <s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
               --%>
        </c:when>    
        <c:when test="${param.location eq 'listForm'}">
              <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>" />
              <input type="hidden" name="parentTrSelect" id="parentTrSelect" value="" />
              
        </c:when>
        <c:when test="${param.location eq 'jsLoading'}">
              <script type="text/javascript">
                <%--主列表--%>
                function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
                    if(isPage(formId)){
                        var isFirstLoad = firstLoadThisPage(formId);
                        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
                        var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    
                    //持久模型添加子表单增加数据过滤
                    var funcname="${paraMap.funcname}";//传参函数名称
                    var crmFilterValsJsons="";//执行函数体以后返回的json格式字符串
                    //alert(funcname);
                    //alert(funcbody);
                    if(funcname!=null && funcname!=''){                    	
	                    //执行函数体
	                    if(typeof(eval(funcname)) == "function"){     
	                    	 try{
					         	crmFilterValsJsons=eval(funcname+"();");
					         	//alert(crmFilterValsJsons);
					         }catch(err){
					         	 utilsFp.confirmIcon(3,"","","", "视图模型查询条件传参函数配置错误，请检查函数js语法!","","260","145");
					         	 
					         }
					         
					    }else{
					         // 函数不存在
					         
					    }
                    
                    }
                    
                    util.showLoading("处理中...");
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord +"&crmFilterValsJsons=" + crmFilterValsJsons,//持久模型添加子表单增加数据过滤
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                            clearChildTable();
                        	util.closeLoading();
                        },
                        error: function(msg){
                        	if(msg.readyState!=0){
				              util.closeLoading();
				              utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                            }
                        }
                    });
                }
                
                //打印
                function listAjaxTable_print(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsDataPrint.ms";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
                    if(isPage(formId)){
                        var isFirstLoad = firstLoadThisPage(formId);
                        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
                        var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    //util.showLoading("处理中...");
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
                        success: function(data){
                        	
                           
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                
                                createTableModel_print(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                            clearChildTable();
                        	util.closeLoading();
                        },
                        error: function(msg){
                        	if(msg.readyState!=0){
				              util.closeLoading();
				              utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                            }
                        }
                    });
                }
                
                <%--判断是否分页--%>
                function isPage(formId){
                    var isPageVal =  $("#formPage"+formId).val();
                    if(isPageVal =="1"){    
                       return true;
                    }
                    return false;
                }
                
                <%--查询--%>
                function query(thisObj){
                    var formId = $("#formId1").val();
                  // if( getDealSearchMultiTimeSlotBtn())
                  try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
                     listAjaxTable(formId);
                     //listAjaxTable_print(formId);
                }
                
                <%--清空表格--%>
                function clearChildTable(){
                    $(".isChilds").empty();
                    getFormIdInitChildPage();
                }
                
               <%--当出现滚动条时动态设置表格宽度 --%>
               function setTableWidth(formId){
                    /**
                    *var scrollHeight = $("#tableDiv"+formId)[0].scrollHeight;
                    var height = $("#tableDiv"+formId).height();
                    var datagridHeaderWidth = $("#datagrid-view-ajax"+formId+" .datagrid-header").width();
                    if(scrollHeight-height>0){
                      $("#datagrid-htable"+formId).css("width",datagridHeaderWidth-20+'px');
                      $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth-20+'px');
                    }else{
                      $("#datagrid-htable"+formId).css("width",datagridHeaderWidth+'px');
                      $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth+'px');    
                    }
                    *
                    */
                }
            
                
                function alertInfo(msg){
                    //utilsFp.alert(msg);
                    utilsFp.confirmIcon(3,"","","", msg,"","350","");
                    
                }
                
                <%--清空全选 --%>
                function clearAllSelect(){
                    $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
                }
                
                function reloadPg(msg,title,width,height,time){
                    msgPop(msg,"",title,width,height,time);
                }
                
                <%--子列表 --%>
                function listChildAjaxTable(formId,paramList){
                    var data = {
                        "paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,
                        "paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,
                        "paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,
                        "paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,
                        "paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
                        "paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
                    };
                    if(isPage(formId)){
                        data["page.currentPage"] = _GLO_FORM_PAGE_MAP[formId].currentPage;
                        data["page.pageRecord"] = _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    if(paramList != null && paramList != ""){
                        data["paramList"] = paramList;
                    }
                    
                    
                    if($("#DATA_AUTH").length>0){
                    	if("1"=="<c:out value='${mcIsOpenAuth}' />"){
                    		data["DATA_AUTH"] = $("#DATA_AUTH_ID_"+$("#parentTrSelect").val()).val();
                    	}
                    	if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1"=="<c:out value='${isOldAuthDataPattern}' />"){
                    		data["DATA_AUTH"] = $("#DATA_AUTH").val();
                    	}
                    	
                    }
                    var url = "${path}buss/bussModel_listMsCasData.ms?exeid=<c:out value='${exeid}'/>";
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:data,
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);    
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                        },
                        error: function(msg){
                        if(msg.readyState!=0){
				             utilsFp.confirmIcon(3,"","","", "后台操作出错!","","260","145");
                         }
                        }
                    });
                }
                <%-- 数据为空时设置横向滚动条 --%>
                function setCrossWiseScroll(formId,arrHtml){
                    if(arrHtml.length==0){
                        var tableWidth = $("#datagrid-btable-ajax"+formId).width();  
                        arrHtml.push("<tr>");
                        var tableWidth = 0;
                        var matchReg =/.*width\s*:\s*(\d*\.?\d*)px/;
						var widthDisplay =/.*display\s*:\s*(\d+)e/;
                        $("#datagrid-htable"+formId+" .datagrid-header-row>td").each(function (i,v) {
                        	var styleTd = $(this).attr("style");
                    		if(styleTd && styleTd.indexOf("display")>-1&&styleTd.match(widthDisplay)!=null&&styleTd.match(widthDisplay)=="non"){
                        		return true;
                        	}
                    		if(styleTd && styleTd.indexOf("width")>-1){
                    			arrHtml.push("<td  style='visibility:hidden;width:"+parseFloat(styleTd.match(matchReg)[1])+"px;'></td>");
                        	};
                    	});
                        arrHtml.push("</tr>");
                        $("#tableDiv"+formId).css({"overflow-y":"hidden","overflow-x":"auto"});
                   }else{
                        $("#tableDiv"+formId).css({"overflow-y":"auto","overflow-x":"auto"});    
                   }
               }
                
                <%-- 初始化子分页 --%>
                function initChildPage(formId){
                    var ajaxPage = new Object();
                    ajaxPage.currentPage = 1;
                    ajaxPage.pageRecord = 20;
                    ajaxPage.totalRecord = 0;
                    ajaxPage.totalPage = 1;
                    ajaxPage.first = true;
                    ajaxPage.last = true;
                    pageFun(ajaxPage,formId);
                }
                
                
                <%-- 初始化分页插件 --%>
                function initPage(page,formId){
                    var ajaxPage = new Object();
                    ajaxPage.currentPage = parseInt(page.currentPage);
                    ajaxPage.pageRecord = parseInt(page.pageRecord);
                    ajaxPage.totalPage = parseInt(page.totalPage);
                    ajaxPage.totalRecord = parseInt(page.totalRecord);
                    ajaxPage.first = page.first;
                    ajaxPage.last = page.last;
                    pageFun(ajaxPage,formId);
                };
                
                <%-- 判断是否首次异步访问 --%>
                function firstLoadThisPage(formId){
                    if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
                        return true;
                    }
                    return false;
                }
                
                <%-- 初始化子表单 --%>
                function getFormIdInitChildPage(){
                    var tableCount = $("#tableCount").val();
                    for ( var i = 2; i <= tableCount; i++) {
                        var formId = $("#formId"+i).val();
                        if(isPage(formId)){
                           initChildPage(formId);
                        }
                    }
                }
                
                <%-- 初始化表格宽度 --%>
                function initTableWidth(){
                    //var width = $(window).width() - 2;
                    //$(".datagrid-body-ajax >.datagrid-htable,.datagrid-body-ajax >.datagrid-btable").width(width);
                }
                
                
                
                function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    <s:if test='null != #parameters[@com.more.fw.core.common.method.ConstantsMc@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.ConstantsMc@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
                 }
            
                $(function(){
                    var colNo = $("#relColVals").val();
                    var subRelColIds = $("#subRelColIds").val();
                    var subFormIds = $("#subFormIds").val();
                    if(subRelColIds!="null"){
                        var formId1 = $("#formId1").val();
                        $(".isParents tr").live("click",function(){
                            var _this = $(this);
                            var relColVals = "";
                            var abbr = _this.attr("abbr");
                            var arrColNo = colNo.split(",");
                            $(arrColNo).each(function(i,v){
                                relColVals += $("tr[abbr='"+abbr+"']").find("input[name='"+v+"']").val()+",";
                            });
                            $("#parentTrSelect").val(abbr);
                            setSubData(formId1,subFormIds,subRelColIds,relColVals,"","",true);
                            
                        });
                    };
                });
                
                function getRelColVal(arr,obj,colNo){
                      if(colNo){
                       var arrColNo = colNo.split(",");
                          $(arrColNo).each(function(i,v){
                             if(v!="ID"){
                               arr.push("<input type='hidden' name='"+v+"' value='"+obj[v]+"' />");
                             }
                          });
                      }
                }
            var isFirstSetScroll = 0;
            
            </script>
        </c:when>
        <c:when test="${param.location eq 'pageOver'}">
            <script type="text/javascript">
                function hideAuthDataCol(){
                	if("1"!="<c:out value='${mcIsOpenAuth}' />"){
                	var interval = setInterval(function(){
                 		  if($(".TD_DATA_AUTH ").length>0 ){
                 			  $(".TD_DATA_AUTH ").remove(); 
                 			  clearInterval(interval);
                 		  }
                 		  //do whatever here..
                 		  }, 100);
            	    	$(".IS_DATA_AUTH_SPAN").parent("td").remove();
            	}
                };
              $(function(){
            		  hideAuthDataCol();
              })
            </script>
        </c:when>    
        
        <c:otherwise></c:otherwise>
    </c:choose>
  </c:when>
  
    <%-- 查看详情公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_18'}">
      <c:choose>
        <c:when test="${param.location eq 'inHead'}">
        <script>
          
        if( window.top != window.self ){
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
            	  	    	
            	  	    	
            	  	    }//if( window.top != window.self ){
             
                
            </script>
        </c:when>    
        <c:when test="${param.location eq 'detailForm'}">
                <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>">
                <input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}'/>">
                <input type="hidden" name="formId" value="<c:out value='${formId}'/>">
                <input type="hidden" name="dataId" value="<c:out value='${dataId}'/>">
                <input type="hidden" name=iframeId value="<c:out value='${iframeId}'/>">
                        <table class="func_table">
                            <tr>
                                <td width="100%" align="right">
        
                                </td>
                            </tr>
                        </table>
        </c:when>
        <c:when test="${param.location eq 'jsLoading'}">
           <script type="text/javascript">
                        var parentWindow;
                        $(function(){
                             parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
                        });
                    
                    function init(){
                        if($("#leftTable-kz").length>0){
                            $("#leftTable-kz").show();
                        }
                        
                        if($("#leftTable").length>0){
                            $("#leftTable").show();
                        }
                        if($("input[type='hidden'][name='formIds']").length>1){
                            initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
                        }
                        /*
                        var formIds = $("input[type='hidden'][name='formIds']").val();
                        var formIdLs = formIds.split(",");
                        for(var i=0,j=formIdLs.length;i<j;i++){
                            getEditRows(formIdLs[i],"0");
                        }
                        */
                    }
                    
                <%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
                var maxLen =5;
                if(thisObj.value.length < maxLen ){
                    _alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
                    return false;
                }else{
                    return true;
                }
                 --%>
            </script>
        </c:when>
        <c:otherwise></c:otherwise>
    </c:choose>
  </c:when>
  
  <%-- tab弹出新增子表单公用元素 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_19'}">
    <c:choose>
        <c:when test="${param.location eq 'inHead'}">
      <script>
         
      if( window.top != window.self ){
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
            	  	    	
            	  	    	
            	  	    }//if( window.top != window.self ){
            
          
                
            </script>
          <script type="text/javascript">
              var addTableTrMap;
          </script>
        </c:when>    
        <c:when test="${param.location eq 'saveForm'}">
             <input type="hidden" name="formId" value="<c:out value='${formId}'/>">
             <input type="hidden" name=iframeId value="<c:out value='${iframeId}'/>">
             <input type="hidden" id = "popId" name="popId" value="<c:out value='${popId}' />">
             <input type="hidden" id = "curRowSeq" name="curRowSeq" value="<c:out value='${curRowSeq}' />">
             <input type="hidden" id = "type" name="type" value="<c:out value='${type}' />">
             <input type="hidden" id ="authIsGanged" name=authIsGanged value="<c:out value='${authIsGanged}'/>">
             <input type="hidden" id = "levelForm" name="levelForm" value="<c:out value='${levelForm}' />">
             <input type="hidden" id = "parentFormId" name="parentFormId" value="<c:out value='${parentFormId}' />">
             <s:token />
             <table class="func_table">
                 <tr>
                     <td width="100%" align="right">
                     </td>
                 </tr>
             </table>
        </c:when>
        <c:when test="${param.location eq 'jsLoading'}">
         <script type="text/javascript">
            var parentWindow;
            if(top.$("#"+window.frameElement.name)[0] != null)
            {
               parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
            }
            function init(){
                $(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
            }//初始化方法
            
            // 回填数据
            function saveData(formId,formIndex,curRowSeq){
                var formData = form.serialize($("#saveForm"));
                var type = $("#type").val();
                var levelForm = $("#levelForm").val();
                var parentFormId = $("#parentFormId").val();
                if(type == "2"){
                    parentWindow.editData(formId,formIndex,changeKey(formData,formIndex,curRowSeq),curRowSeq);
                }else{
                    parentWindow.addRow(formId,formIndex,changeKey(formData,formIndex,curRowSeq),levelForm,parentFormId);
                }
                closeThisPopWin();
            };
            
            var dataAuthSelect="";
          	if("1"=="<c:out value='${mcIsOpenAuth}' />"){
         		 dataAuthSelect =
        			"<select id='deptLs_data_auth' style='display:none;width: 200px;'   name='_DATA_AUTH' >"
        		    +"<option value='${sessionScope.mcDataAuth}'>${sessionScope.mcDataAuthName}</option>"
        		    +"</select>"
        	        +"<span class='dot'>*</span><dict:lang value='组织机构' />&nbsp;<select id='deptLs_data_auth_text' style='width: 200px;' class='dept_select' disabled ='disabled' name='_DATA_AUTH_TEXT' >"
        	        +"<option value=''>${sessionScope.mcDataAuthName}</option>"
        	        +"</select>";
          	}
          	if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" !="<c:out value='${isOldAuthDataPattern}' />"){
          		dataAuthSelect = "<select id='deptLs_data_auth' style='display:none;width: 200px;'   name='_DATA_AUTH' >"
      	        +"<option value='${sessionScope.mcDataAuth}'>${sessionScope.mcDataAuthName}</option>"
      	        +"</select>";
          	}
          $(".hd").append(dataAuthSelect);
          $(function(){
              
              if($("#authIsGanged").val()=="1"){
              	   if("1"=="<c:out value='${mcIsOpenAuth}' />"){ //14版本组织机构
              		 var dataAuth = $("#deptLs_data_auth").val();
              		 $(".dept_select").not("#deptLs_data_auth").each(function(){
                  		var thisId = $(this).prop("id");
                  		if($("#"+thisId+"_formId").length!=0){
                  			var formId = $("#"+thisId+"_formId").val();
                  			var formColId = $("#"+thisId+"_formColId").val();
                  			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                  			var uiType = $("#"+thisId+"_uiType").val();
                  			if(dataAuth==""){
                  				var option = "";
                  				$("#deptLs_data_auth option").each(function(){
                      				option = $(this).val();
                  					if(option==""){
                  						return true;
                  					}
                  					dataAuth+=option+",";
                  				});
                  				dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
                  			}
                  			_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
                  		};
                  	});
              	  }
              	 if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" !="<c:out value='${isOldAuthDataPattern}' />"){
            		$(".dept_select").each(function(){
                   		var thisId = $(this).prop("id");
                   		if($("#"+thisId+"_formId").length!=0){
                   			var formId = $("#"+thisId+"_formId").val();
                   			var formColId = $("#"+thisId+"_formColId").val();
                   			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                   			var uiType = $("#"+thisId+"_uiType").val();
                   			_controlsDataAuth(formId,"1",thisId,"<c:out value='${sessionScope.mcDataAuth}'/>",formColId,uiType);
                   		};
                   	});
            	}
              	   
              	  if("0"=="<c:out value='${mcIsOpenAuth}' />" && "1" =="<c:out value='${isOldAuthDataPattern}' />"){ //13版本组织机构
              		if($("#deptLs_data_auth").length==0){
                 		$(".dept_select").not("#deptLs_data_auth").each(function(){
                     		var thisId = $(this).prop("id");
                     		if($("#"+thisId+"_formId").length!=0){
                     			var formId = $("#"+thisId+"_formId").val();
                     			var formColId = $("#"+thisId+"_formColId").val();
                     			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                     			var uiType = $("#"+thisId+"_uiType").val();
                     			var dataAuth = "mCAuthIsNull";
                     			_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
                     		};
                     	});
                 	}else{
                 		$("#deptLs_data_auth").change(function(){
                     		var dataAuth = $("#deptLs_data_auth").val();
                     		if(dataAuth!=""){
                     			$(".clearPopVal").val("");
                     		}
                     		$(".dept_select").not("#deptLs_data_auth").each(function(){
                         		var thisId = $(this).prop("id");
                         		if($("#"+thisId+"_formId").length!=0){
                         			var formId = $("#"+thisId+"_formId").val();
                         			var formColId = $("#"+thisId+"_formColId").val();
                         			var isOpenDataAuth = $("#"+thisId+"_isOpenDataAuth").val();//是否开启组织机构权限
                         			var uiType = $("#"+thisId+"_uiType").val();
                         			if(dataAuth==""){
                         				var option = "";
                         				$("#deptLs_data_auth option").each(function(){
                             				option = $(this).val();
                         					if(option==""){
                         						return true;
                         					}
                         					dataAuth+=option+",";
                         				});
                         				dataAuth = dataAuth.substring(0, dataAuth.length - 1); 
                         			}
                         			_controlsDataAuth(formId,"1",thisId,dataAuth,formColId,uiType);
                         		};
                         	});
                     	});
                     	$("#deptLs_data_auth").trigger("change");
                 	  };
              	  }
              }
              
              
            });
            function editData(formDataStr){
                var formDataJson = JSON.parse(formDataStr);
                form.deserialize($("#saveForm"),formDataJson);
            }
            
            // 关闭 
            function closeThisPopWin(){
                var popId = $("#popId").val();
                parent.closePopWinFp(popId+"pop",popId+"shadow");
            }
            
            function changeKey(formData,formIndex,curRowSeq){
                var newKey;
                var oldKey;
                for(key in formData){
                    if(key.indexOf("@0#")>-1){
                        oldKey = key;
                        newKey = key.replace("1@0#",formIndex+"@"+curRowSeq+"#");
                        formData[newKey]=formData[oldKey];
                    }
                }
                return formData;
            }
            
            $(function(){
                var type = $("#type").val();
                if(type == "2"){
                    var formDataStr = $("#formDataStr").text();
                    editData(formDataStr);
                };
            });
        </script>
        </c:when>
        <c:otherwise></c:otherwise>
    </c:choose>
  </c:when>
  
  <%-- tab标签页修改界面 --%>
  <c:when test="${param.modelName eq 'VIEW_TYPE_20'}">
   <c:choose>
        <c:when test="${param.location eq 'inHead'}">
           <script>
             
           if( window.top != window.self ){
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
            	  	    	
            	  	    	
          }//if( window.top != window.self ){
             
                
            </script>
        </c:when>    
        <c:when test="${param.location eq 'editForm'}">
           <input type="hidden" name="exeid" value="<c:out value='${exeid}'/>">
            <input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}'/>">
            <input type="hidden" name="formId" value="<c:out value='${formId}'/>">
            <input type="hidden" name="dataId" value="<c:out value='${dataId}'/>">
            <input type="hidden" name=iframeId value="<c:out value='${iframeId}'/>">
            <input type="hidden" name="_formToken" value="<c:out value='${formToken}'/>">
            <input type="hidden" name="isCloseWin" id="isCloseWinHidden" value=""/>
            <s:set name="_$type" value="'edit'" />
            <table class="func_table">
                <tr>
                    <td width="100%" align="right"></td>
                </tr>
            </table>
        </c:when>
        <c:when test="${param.location eq 'jsLoading'}">
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
                if(!val.valDataBaseSetData()){
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
                var url ="${path}buss/bussModel_ajaxAddSubComm.ms?FUNC_CODE=F285";
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
                        var associatedModel = $("#associatedModel"+tableId).val();
                        var thisTr = $("#addTableTr"+curRowSeq+"_"+tableId);
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
            
            <%-- 新增的行删除 --%>
            function delRow(thisObj){
                var flag = valiDelEditRow(thisObj);
                if(flag){
                    $(thisObj).parent().parent().remove();
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
                var oldCurRowSeq = $("#table_curRowSeq"+formId).val();
                $("#table_curRowSeq"+formId).val(oldCurRowSeq-1);
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
                util.showLoading();
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
                        util.closeLoading();
                        var row = $(data.ajaxPage.tableData);
                        var trLength = data.ajaxList.length;
                        _toClickColor(row);// <%-- 行点击着色 --%>
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
                        $(".glxb-table tr td:last-child").css("width","40px");
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
            }
            </script>
        </c:when>
        <c:otherwise></c:otherwise>
    </c:choose>
  </c:when>  
  <c:otherwise></c:otherwise>
</c:choose>
<%@ include file="/plf/common/i18n_js.jsp"%>
 