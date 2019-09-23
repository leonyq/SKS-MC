<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="报表模型" /><dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
	</jsp:include>
    <link href="${path}plf/page/common/msui/css/css_tab.css?_mc_res_version=<%=PlfStaticRes.CSS_TAB_CSS %>" rel="stylesheet" type="text/css" />	
    <link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
</head>
<body style="background-color: #ffffff;">
	<div id="container" class="all" >
	    <DIV id=title style="display:none;">
            <UL>
                    <LI id="tag1">
                        <A class="selectli1" onclick="switchTag('tag1','content1','');this.blur();"
                            href="javascript:void(0);"><span class="selectspan1"><dict:lang value="基础信息" /></span></A>
                    </LI>
                    <LI id="tag2" style="display:none;">
                        <A onclick="switchTag('tag2','content2','');this.blur();"
                            href="javascript:void(0);"><span ><dict:lang value="查询条件" /></span></A>
                    </LI>                   
            </UL>
        </DIV>
		<div  class="add_table_div">
        <form id="editForm" class="layui-form" name="editForm" action="${path}rep/editReport.ms" method="post" enctype="multipart/form-data" target="submitFrame">
        <DIV class="content" id="content">
                <DIV id="content1" class="">
                    <%--<table width="100%">
                        <tr>
                            <td>        
							<div>--%>
									<s:hidden name="paraMap.MID" />
									<s:hidden name="paraMap.ID" />
									<table class="add_table">
										<tr>
											<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
												<dict:lang value="报表类型" />
											</td>
											
											<td style="width: 270px;">
												<select name="paraMap.REPTYPE" id="selectRepType">  
										         <option value="1"  <s:if test="${dataMap.REPTYPE=='1'}"> selected </s:if>><dict:lang value="wisBI报表" /></option>
										         <option value="2" <s:if test="${dataMap.REPTYPE=='2'}"> selected </s:if>><dict:lang value="iReport报表" /></option>
										        
										       </select>
											</td>
											<td>&nbsp;</td>
											<td style="width: 100px;" class="tr1 mc_form_title">
												<span class="Eng">*</span><dict:lang value="报表模版" />
											</td>
											<td style="width: 270px;">
												<s:property value="dataMap.FNAME"/> 
												<s:file name="upFile" value="%{dataMap.FNAME}" onchange="setName(this.value);"  ></s:file>
												
												<s:hidden name="paraMap.FNAME" value="%{dataMap.FNAME}" />
												<s:hidden name="paraMap2.FNAME" value="%{dataMap.FNAME}" />
												<s:hidden name="paraMap2.JASPER_NAME" value="%{dataMap.JASPER_NAME}" />
											</td>
										</tr>
								
				   <tr id="trWisBIType">
					   <td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
					     <dict:lang value="wisBI类型" />
					   </td>
					   <td  colspan="4">
					      <select id="selectwisBIType" name="paraMap.WISBIREPTYPE">
					        <option value="0" <s:if test="${dataMap.WISBIREPTYPE=='0'}"> selected </s:if>  ><dict:lang value="wisBI普通报表" /></option>
					         <option value="1" <s:if test="${dataMap.WISBIREPTYPE=='1'}"> selected </s:if>  ><dict:lang value="wisBI大看板报表" /></option>
					      </select>
					   </td>
					</tr>			
										
										
										
							<tr>
								<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
									<dict:lang value="报表名称" />
								</td>
								<td style="width: 270px;">
									<s:textfield name="paraMap.NAME" value="%{dataMap.NAME}" id="paraMap_NAME" maxlength="60" />
								</td>
								<td>&nbsp;</td>
								<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
									<dict:lang value="报表路径" />
								</td>
								<td width="270px;">
									<s:textfield value="%{dataMap.PATH}" id="paraMap_PATH" readonly="true" cssClass="readonly" />
								</td>
							</tr>
				
							
							
							<tr>
								<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
									<dict:lang value="数据源类型" />
								</td>
								<td width="270px;">
									<dict:selectDict id="paraMap_DS" name="paraMap.DS" dictCode="REPORT_DS" dictValue="%{dataMap.DS}" />
								</td>
								<td>&nbsp;</td>
								<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
									<span class="Eng">*</span><dict:lang value="报表类型" />
								</td>
								<td width="270px;">
									<dict:selectDict id="paraMap_TYPE" name="paraMap.TYPE" dictCode="REPORT_TYPE" dictValue="%{dataMap.TYPE}" />
									
								</td>
							</tr>
							<tr  style="display:none;">
								<td width="20%" class="tr1">
									<dict:lang value="附属JAR包" />
								</td>
								<td width="30%" colspan="3">
									<s:textfield value="%{dataMap.JAR}" id="paraMap_JAR"   maxlength="200" cssStyle="width: 500px;" />
								</td>
							  </tr>
						   </table> 
						   <%--</div> 
                         </td>
                       </tr>
                    </table>--%>
                </DIV>
<DIV id="content2" class="hidecontent">
        <table class="func_table">
            <tr>
                <td width="100%" align="right">
                    <input type="button" value="<dict:lang value="新增" />" onclick="_addRow();" class="botton_img_add"> 
                    <input type="button" value="<dict:lang value="编辑" />" onclick="_editRow();" class="botton_img_add"> 
                    <input type="button" value="<dict:lang value="删除" />" onclick="_delRow();" class="botton_img_search">
                </td>
            </tr>
        </table>
                <table id="editTable" class="table_list">
                    <thead>
                    <tr>
                        <th width="3%">
                            <input type="checkbox" onclick="selectAll(this);" />
                        </th>
                        <th width="5%">
                            <dict:lang value="序号" />
                        </th>
                        <th width="10%">
                            <dict:lang value="条件名称" />
                        </th>
                        <th width="10%">
                            <dict:lang value="条件字段" />
                        </th>
                        <th width="7%">
                            <dict:lang value="条件符号" />
                        </th>
                        <th width="7%">
                            <dict:lang value="关联符号" />
                        </th>
                        <th width="6%">
                            <dict:lang value="显示顺序" />
                        </th>                       
                        <th width="10%">
                            <dict:lang value="条件UI" />
                        </th>
                        <th width="6%">
                            <dict:lang value="是否时间段" />
                        </th>
                        <th width="6%">
                            <dict:lang value="连接符" />
                        </th>
                        <th width="12%">
                            <dict:lang value="方法事件" />
                        </th>                   
                        <th width="10%">
                            <dict:lang value="样式表" />
                        </th>
                        <th width="10%">
                            <dict:lang value="样式属性" />
                        </th>                       
                    </tr>
                    </thead>
                    <tbody>
                                    
                    <s:iterator value="dataList" status="index">
                        <tr>
                            <td>
                                <input type="checkbox" name="chk" value="<s:property value="#index.index+1"/>"/>
                            </td>
                            <td>
                                <span><s:property value="#index.count" /></span>
                            </td>
                            <td><s:property value="CONDITION_NAME" /><input type='hidden' name='paramList[<s:property value="#index.index"/>].CONDITION_NAME' value='<s:property value="CONDITION_NAME" />'/></td>
                            <td><s:property value="CONDITION_FIELD" /><input type='hidden' name='paramList[<s:property value="#index.index"/>].CONDITION_FIELD' value='<s:property value="CONDITION_FIELD" />'/></td>
                            <td><dict:viewDict dictCode="SEARCH_COM" dictValue="%{SEARCH_COM}"/><input type='hidden' name='paramList[<s:property value="#index.index"/>].SEARCH_COM' value='<s:property value="SEARCH_COM" />'/></td>
                            <td><dict:viewDict dictCode="SEARCH_REL" dictValue="%{SEARCH_REL}"/><input type='hidden' name='paramList[<s:property value="#index.index"/>].SEARCH_REL' value='<s:property value="SEARCH_REL" />'/></td>
                            <td><s:property value="SHOW_ORDER"/><input type='hidden' name='paramList[<s:property value="#index.index"/>].SHOW_ORDER' value='<s:property value="SHOW_ORDER" />'/></td>
                            <td><s:property value="UI_NAME"/><input type='hidden' name='paramList[<s:property value="#index.index"/>].SEARCH_UI' value='<s:property value="SEARCH_UI" />'/></td>
                            <td><s:if test="IS_TIME_BUCKET == 1"><dict:lang value="是" /></s:if><s:else><dict:lang value="否" /></s:else><input type='hidden' name='paramList[<s:property value="#index.index"/>].IS_TIME_BUCKET' value='<s:property value="IS_TIME_BUCKET" />'/></td>
                            <td><s:property value="CONN_SYMBOL"/><input type='hidden' name='paramList[<s:property value="#index.index"/>].CONN_SYMBOL' value='<s:property value="CONN_SYMBOL" />'/></td>
                            <td><s:property value="SH_UI_FUN"/><input type='hidden' name='paramList[<s:property value="#index.index"/>].SH_UI_FUN' value='<s:property value="SH_UI_FUN" />'/></td>
                            <td><s:property value="SH_UI_CLASS"/><input type='hidden' name='paramList[<s:property value="#index.index"/>].SH_UI_CLASS' value='<s:property value="SH_UI_CLASS" />'/></td>
                            <td><s:property value="SH_UI_SYTLE"/><input type='hidden' name='paramList[<s:property value="#index.index"/>].SH_UI_SYTLE' value='<s:property value="SH_UI_SYTLE" />'/></td>                                                    
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
</DIV>              
        </DIV>   
        <div class="ptop_10 txac">
            <input type="button" value="<dict:lang value="提交" />" lay-submit lay-filter="*" onclick="/*edit(this);*/" class="layui-btn">
           
            <input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
        </div>             		
        </form>
        </div>
        
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	
	var isSubmit = false;
	function reloadPg(msg){
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	$(function(){
		$("#paraMap_NAME").attr("lay-verify","required");
	});
	layui.use('form', function(){
	  	  var form = layui.form;
	  		form.render("select");
	  		form.on('submit(*)', function(data){
	  			edit();
	  	 	});
		});
	
	function edit(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		document.forms.editForm.submit();
		isSubmit = true;
	}
	
	function showEditCode(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
		var tableName = "<s:property value="%{@com.more.fw.core.sysmain.model.TableName@MS_REPORT}"/>";
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID+"&paraMap.tableName="
				+tableName+"&paraMap.colName="+colName;
		showPopWin(url, "99%", "99%",null,"<dict:lang value="修改类源码"/>");
		//window.open(url);
	}
	
	function updateCLASS_NAME_TEXT(id,txt){
		$("#"+id).val(txt);
		closePopWin();
		window.location.href = "${path}rep/showEditReport.ms?paraMap.ID=<s:property value='paraMap.ID' />";
	}
        
	function valData(){
		var paraMap_NAME = document.getElementById("paraMap_NAME");
   	if(val.isBlank(paraMap_NAME)){
   		_alertValMsg(paraMap_NAME,"<dict:lang value="报表名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
		var paraMap_DS = document.getElementById("paraMap_DS");
   	if(val.isBlank(paraMap_DS)){
   		_alertValMsg(paraMap_DS,"<dict:lang value="数据源类型" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}
	
	function init(){
		reloadTabKey();
	}
	
<%
/***********************以下为编辑器优化设置*****************************/
 /*
//截获了Tab按键，其他的textarea框不进行此配置
        //下面的代码就是为了实现这个功能，原理很简单，采用上一行的缩进就行
        //只要在html中插入脚本调用reloadTabKey()函数就可以了
        //注1：需要jQuery支持，如果不喜欢jQuery改成javascript也很方便的
        //兼容firefox和IE！
*/
%>
        /*------selection operations-------*/
	function insertAtCursor(obj, txt) {
		obj.focus();
	            //IE support
		if (document.selection) {
			sel = document.selection.createRange();
			sel.text = txt;
		} else {
			var startPos = obj.selectionStart;
			var scrollTop = obj.scrollTop;
			var endPos = obj.selectionEnd;
			obj.value = obj.value.substring(0, startPos) + txt + obj.value.substring(endPos, obj.value.length);
			startPos += txt.length;
			obj.setSelectionRange(startPos, startPos);
			obj.scrollTop = scrollTop;
		}
	}
	function getCaretPos(ctrl) {
		var caretPos = 0;
		if (document.selection) {
	                // IE Support
			var range = document.selection.createRange();
	                // We'll use this as a 'dummy'
			var stored_range = range.duplicate();
	                // Select all text
			stored_range.moveToElementText(ctrl);
	                // Now move 'dummy' end point to end point of original range
			stored_range.setEndPoint("EndToEnd", range);
	                // Now we can calculate start and end points
			ctrl.selectionStart = stored_range.text.length - range.text.length;
			ctrl.selectionEnd = ctrl.selectionStart + range.text.length;
			caretPos = ctrl.selectionStart;
		} else {
			if (ctrl.selectionStart || ctrl.selectionStart == "0") {
	            // Firefox support
			}
		}
		caretPos = ctrl.selectionStart;
		return (caretPos);
	}
	function getCurrentLineBlanks(obj) {
		var pos = getCaretPos(obj);
		var str = obj.value;
		var i = pos - 1;
		while (i >= 0) {
			if (str.charAt(i) == "\n") {
				break;
			}
			i--;
		}
		i++;
		var blanks = "";
		while (i < str.length) {
			var c = str.charAt(i);
			if (c == " " || c == "\t") {
				blanks += c;
			} else {
				break;
			}
			i++;
		}
		return blanks;
	}
	function reloadTabKey() {
		/* set all the tab indent for all the text areas */
		$("textarea").each(function () {
			$(this).keydown(function (eve) {
				if (eve.target != this) {
					return;
				}
				if (eve.keyCode == 13) {
					last_blanks = getCurrentLineBlanks(this);
				} else {
					if (eve.keyCode == 9) {
						eve.preventDefault();
						insertAtCursor(this, "\t");
						this.returnValue = false;
					}
				}
			}).keyup(function (eve) {
				if (eve.target == this && eve.keyCode == 13) {
					insertAtCursor(this, last_blanks);
				}
			});
		});
	}



var tab_len = 2;
    var currentTag ;
        function switchTag(tag, content,url) {
            if(currentTag == tag){
                return false;
            }
            for (i = 1; i < (tab_len+1); i++) {<%-- 下标从1开始 --%>
                if ("tag" + i == tag) {
                    document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
                    document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "selectspan1";
                } else {
                    document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
                    document.getElementById("tag" + i).getElementsByTagName("a")[0].getElementsByTagName("span")[0].className = "";
                }
                if ("content" + i == content) {
                    currentTag = tag;
                    document.getElementById(content).className = "";
                } else {
                    document.getElementById("content" + i).className = "hidecontent";
                }
                document.getElementById("content").className = content;
            }
        }

    var rowNum = $("#editTable").find("tbody tr").length + 1;        
    function _addRow(){
        var url = "${path}rep/forAddSearch.ms";
        rowNum = $("#editTable").find("tbody tr").length + 1;
        showPopWin(url, "700", "500",null,"<dict:lang value="新增" />","addSearchWinId");
    }
    
    function addRowData(data){
        if(data != null && data != ""){
            var tableHtml = "<tr><td><input type=\"checkbox\" name=\"chk\" value=\""+rowNum+"\" class=\"isSubmit\" /></td><td>"+rowNum+"</td>"+data+"</tr>";
            $("#editTable tbody").append(tableHtml);
        }
    }
    
    function _delRow(){
        if(checkSelected()){
            util.confirm(delConfirm,"<dict:lang value="确定要删除选中的数据" />");
        }else{
            util.alert("<dict:lang value="请至少勾选一条记录" />");
        }
    }
    
    function delConfirm(){
        $("#editTable").find("tbody tr td input[type='checkbox']:checked").each(function(seq) {
            $(this).parent().parent().remove();
        }); 
        
        //重新计算序号
        $("#editTable").find("tbody tr").each(function(seq) {
            $($(this).find("td").eq(0).find("input").get(0)).val(seq+1);
            $(this).find("td").eq(1).text(seq+1);
            $($(this).find("td").eq(2).find("input").get(0)).prop("name","paramList["+seq+"].CONDITION_NAME");
            $($(this).find("td").eq(3).find("input").get(0)).prop("name","paramList["+seq+"].CONDITION_FIELD");
            $($(this).find("td").eq(4).find("input").get(0)).prop("name","paramList["+seq+"].SEARCH_COM");
            $($(this).find("td").eq(5).find("input").get(0)).prop("name","paramList["+seq+"].SEARCH_REL");
            $($(this).find("td").eq(6).find("input").get(0)).prop("name","paramList["+seq+"].SHOW_ORDER");
            $($(this).find("td").eq(7).find("input").get(0)).prop("name","paramList["+seq+"].SEARCH_UI");
            $($(this).find("td").eq(8).find("input").get(0)).prop("name","paramList["+seq+"].IS_TIME_BUCKET");
            $($(this).find("td").eq(9).find("input").get(0)).prop("name","paramList["+seq+"].CONN_SYMBOL");
            $($(this).find("td").eq(10).find("input").get(0)).prop("name","paramList["+seq+"].SH_UI_FUN");
            $($(this).find("td").eq(11).find("input").get(0)).prop("name","paramList["+seq+"].SH_UI_CLASS");
            $($(this).find("td").eq(12).find("input").get(0)).prop("name","paramList["+seq+"].SH_UI_SYTLE");
        });            
    }
    
    <%-- 检查是否有选中记录 --%>
    function checkSelected(){
        var finded = false;
        $("#editTable").find("tbody tr").each(function(seq) {
            if($(this).find("td").eq(0).find("input[type='checkbox']").prop("checked")){
                finded = true;
                return true;
            }
        });
        return finded;
    }
    
    //计算选中数量
    function getSelectedCount(){
        var count = 0;
            $("#editTable").find("tbody tr").each(function(seq) {
            if($(this).find("td").eq(0).find("input[type='checkbox']").prop("checked")){
                count++;
            }
        });
        return count;
    }

    function selectAll(thisObj){
        $("#editTable").find("tbody tr").each(function(seq) {
            $(this).find("td").eq(0).find("input[type='checkbox']").prop("checked",$(thisObj).prop("checked"));
        });
    }
    
    function _editRow(){
    
        if(getSelectedCount() != 1){
            util.alert("<dict:lang value="请选择一条记录编辑" />");
        }else{
              var param = "";
                $("#editTable").find("tbody tr td input[type='checkbox']:checked").each(function(seq) {
                     param = "paraMap.CHK="+$(this).val()+"&";
                    $(this).parent().siblings().each(function(seq,item){
                        //console.log($($(item).find("input").get(0)).val());
                        switch(seq){
                          case 1:
                              param +="paraMap.CONDITION_NAME="+$(item).text()+"&";
                              break;
                          case 2:
                              param +="paraMap.CONDITION_FIELD="+$(item).text()+"&";
                              break;
                          case 3:
                              param +="paraMap.SEARCH_COM="+$($(item).find("input").get(0)).val()+"&";
                              break;
                          case 4:
                              param +="paraMap.SEARCH_REL="+$($(item).find("input").get(0)).val()+"&";
                              break;            
                          case 5:
                              param +="paraMap.SHOW_ORDER="+$(item).text()+"&";
                              break;
                          case 6:
                              param +="paraMap.SEARCH_UI_NAME="+$(item).text()+"&"+"paraMap.SEARCH_UI="+$($(item).find("input").get(0)).val()+"&";
                              break;
                          case 7:
                              param +="paraMap.IS_TIME_BUCKET="+$($(item).find("input").get(0)).val()+"&";
                              break;
                          case 8:
                              param +="paraMap.CONN_SYMBOL="+$(item).text()+"&";
                              break;
                          case 9:
                              param +="paraMap.SH_UI_FUN="+$(item).text()+"&";
                              break;
                          case 10:
                              param +="paraMap.SH_UI_CLASS="+$(item).text()+"&";
                              break;
                          case 11:
                              param +="paraMap.SH_UI_SYTLE="+$(item).text();
                              break;                       
                        }
                    });
                }); 
            var url = "${path}rep/forEditSearch.ms?"+param;
            showPopWin(url, "700", "500",null,"<dict:lang value="编辑" />","editSearchWinId");
        }   

    }
    
    //编辑回调
    function editRowData(data){
        if(data != null && data != ""){
        var $chk = $($("#editTable").find("tbody tr td input[type='checkbox']:checked").get(0));
        var seq = $chk.val();
            var tableHtml = "<td><input type=\"checkbox\" name=\"chk\" value=\""+seq+"\" class=\"isSubmit\" checked/></td><td>"+seq+"</td>"+data;
             $("#editTable").find("tbody tr td input[type='checkbox']:checked").each(function(seq) {
                $(this).parent().parent().html(tableHtml);
            });
        }
    }
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<script src="${path}plf/page/js_files/rep/reportMcUtils.js?_mc_res_version=<%=PlfStaticRes.REPORTMCUTILS %>"></script>