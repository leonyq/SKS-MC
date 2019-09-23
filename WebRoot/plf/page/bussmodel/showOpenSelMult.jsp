<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="选择数据" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script src="${path}/plf/js/ui/textform/js/jquery.validate.js?_mc_res_version=<%=PlfStaticRes.JQUERY_VALIDATE_JS %>"></script>
<style type="text/css">
.hide {
	display: none;
}
</style>
<script type="text/javascript">
$(function(){
	$('th').each(function(i){
		if($(this).attr("class")=='hide'){
		 $('table tbody tr').each(function(j){
			$(this).find('td').eq(i).addClass('hide');
		 });
		}
	});
});

</script>
</head>
<body scroll="auto" >
	<div class="content-in">
		<div class="dlist">
			<div class="hd">
				<div>
					<div id='timeBucketId'></div>
					<div class="optn">
						<form id="funForm" name="funForm" action="${path}buss/bussModel.ms"
							method="post" target="submitFrame">
							<table class="func_table">
								<tr>
									<td width="100%" align="right">
										<button type="button" value=""
											onclick="add('<c:out value="${popId}" />pop','<c:out value="${popId}" />shadow');" sytle=""
											class="botton_img_add">
											<i class="ico ico-kl "></i>
											<dict:lang value="提交" />
										</button>
										<button type="button" value=""
											onclick="clearSel('<c:out value="${popId}" />pop','<c:out value="${popId}" />shadow');" sytle=""
											class="botton_img_add">
											<i class="ico ico-xg "></i>
											<dict:lang value="清空" />
										</button>
										<button type="button" value=""
											onclick="parent.closePopWinFp('<c:out value="${popId}" />pop','<c:out value="${popId}" />shadow');"
											sytle="" class="botton_img_add">
											<i class="ico ico-sc "></i>
											<dict:lang value="关闭" />
										</button>
										<button type="button" class="botton_img_add" onclick="searchOpen();">
											<i class="ico ico-search-new"></i>查询
										</button></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			<div class="bd">
				<div class="search-box">
					<form id="searchForm" name="searchForm" action="" method="post">
						<input type="hidden" name="paraMap.UI_DATA"
							value="<c:out value='${paraMap.UI_DATA}' />" />
						<input type="hidden" name="paraMap.param" value="${paraMap.param}"/>
					
						<input type="hidden" name="paraMap.filedVal" id="filedVal"
							value="<c:out value='${paraMap.filedVal}' />"/>
					 
							 <input type="hidden" name="paraMap.dataAuth" value="<c:out value='${paraMap.dataAuth}' />" />
					   <input type="hidden" name="paraMap.isOpenDataAuth" value="<c:out value='${paraMap.isOpenDataAuth}' />" />
						<table class="search_table">
							<tr>
								<td width="90%" id="search-td"><%--
								<s:if test='#request.multList.size()'>
											<s:iterator value="#request.titleLs" id="title">
												<s:iterator value="#request.multList" id="mult">
													<s:if test='%{IS_SEARCH == "1" && SHOW_NAME == #title}'>
														<div class="group">
															<div class="name" title="等于">
																<s:property value="title" />
															</div>
															<!--<s:set name="titleVal" value="%{title}" />-->
															<div class="dec">
																<input type="text"
																	id="paraMap2_<s:property value="FIELD_NAME"/>"
																	name="paraMap2.<s:property value="FIELD_NAME"/>"
																	value="<s:property value="%{paraMap2[FIELD_NAME]}"/>"
																	class="input" />
															</div>
														</div>
													</s:if>
												</s:iterator>
											</s:iterator>
									</s:if> <s:else>
											<s:iterator value="#request.titleLs" id="title">
												<div class="group">
													<div class="name" title="等于">
														<s:property value="title" />
													</div>
													<!--<s:set name="titleVal" value="%{title}" />-->
													<div class="dec">
														<input type="text"
															id="paraMap2_<s:property value="title"/>"
															name="paraMap2.<s:property value="title"/>"
															value="<s:property value="%{paraMap2[#title]}"/>"
															class="input"  />
													</div>
												</div>
											</s:iterator>
									</s:else>
								--%></td>
							</tr>
						</table>
						<input type="hidden" id="searchParaNull" value="4" />
						<input type="hidden" name="paraMap.searchParaShowState" id="paraMap_searchParaShowState" value="<c:out value='${paraMap.searchParaShowState}' />" />
						<input type="hidden" id="isOpener" value="1" />
						<input type="text" style="display:none;">
					</form>
					<a href="javascript:void(0);" class="more"></a>
				</div>

				<form id="submitForm" name="submitForm" action="" method="post"
					target="submitFrame">
					<div class="panel datagrid datagrid-div1">
					  <div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="">
					  	<div class="datagrid-header">
					  		<div class="datagrid-header-inner" id="datagrid-header-inner03b09741c53541aaaea80383029ebe4b">
								<table  id="datagrid-htable03b09741c53541aaaea80383029ebe4b" class="datagrid-htable fixedTable  " style="height: 30px; ">
									<tbody>
										<tr class="thcolor datagrid-header-row">
											<td style="width:30px"><!-- 序号 --></td>
											<td style="width:30px" align="center"><input type="checkbox" name="selectAll"
												title="<dict:lang value="全选" />"
												onclick="selectAllChk(this,'datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b');"></td>
											<s:iterator value="#request.titleLs" id="title">
												<c:forEach items="${multList }" var="colp">
													<c:choose>
														<c:when test="${colp.SHOW_NAME==title&&colp.IS_SHOW==1}">
															<td style="<c:out value='${colp.OBJ_STYLE}' />"><s:property value="title" /></td>
														</c:when>
														<c:when test="${colp.SHOW_NAME==title&&colp.IS_SHOW==0}">
															<td class="hide"><s:property value="title" /></td>
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</s:iterator>
										</tr>
									</tbody>
								  </table>
								</div>
							</div>
							<div class="datagrid-body datagrid-body-ajax datagrid-div3" id="tableDiv03b09741c53541aaaea80383029ebe4b">
								<table class="datagrid-btable fixedTable" id="datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b" style="border-left:1px solid #ccc;">
									<tbody id="tbody_03b09741c53541aaaea80383029ebe4b">
										<!--<s:iterator value="#request.dataLs" id="data" status="seq">
											<tr style="cursor: pointer;"
												onclick="selectVal(this,'<s:property value="key"/>','<s:property value="value"/>',false);">
												<td width="40px" align="center"><input type="checkbox"
													name="selectValue"
													onclick="selectVal(this,'<s:property value="key"/>','<s:property value="value"/>',true);">
												</td>
												<td><s:property value="#seq.count" />
												</td>
												<s:iterator value="dataLa" id="val">
													<td><s:property value="#val" />
													</td>
												</s:iterator>
											</tr>
										</s:iterator>-->
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="center">
			<c:choose>
				<c:when test="${isFullScreen==1}">
					<s:include value="/plf/page/fp/paginationAx.jsp?listDataFn=listAx&formId=formId1&showLoading=0" />
				</c:when>
				<c:otherwise>
					<s:include value="/plf/page/fp/paginationPopAx.jsp?listDataFn=listAx&formId=formId1&showLoading=0" />
				</c:otherwise>
			</c:choose>

			</div>
			
			<table class="table_list" id="choosenId">
				<thead>
					<tr style="cursor: pointer;">
						<th colspan="2">已选项目[+]</th>
					</tr>
				</thead>
				
			</table>
			
			<div id="choosenDiv"
					style="display:none;line-height:18px;border:1px #a8c7ce solid;width:99.7%;height:55px;text-align:left;overflow:auto;">
					<%--<textarea rows="3" style="margin:0;padding:0;width:99.5%;" readonly></textarea>--%>
				</div>
			
			</div>
			
			</form>

		</div>
	</div>
	</div>

	
	

	<script type="text/javascript">
	var paginationImpl = {};
	
	var vals = "<c:out value='${paraMap.filedVal}' />";
	var split ="<c:out value='${split}' />";
	var parentWindow=top.$("#"+window.frameElement.name)[0].contentWindow;
	
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){utilsFp.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	//删除节点
	function delSpan(obj){
		
		var chooseVal = $("#choosenDiv span");
		if(chooseVal != null && chooseVal !="" && chooseVal != undefined){
			chooseVal.each(function(h){
				$("#datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b tr").each(function(i,item){
					 var checkBoxObj = $(this).find("input[type='checkbox'][name='selectValue']").eq(0);
					 //console.log($(this).find("td").get(0));
					 //console.log($($(this).find("td").get(keyNum)).text()+"------>"+obj.id);
					 if($($(this).find("td").get(keyNum)).text() == obj.id){
							 checkBoxObj.prop("checked",false);
							 chooseTrColor(item);
						 return false;
					 }
				});	
			});

		}
		$(obj).remove();
	}
	
	function searchOpen(){
		listAx('formId1');
		//document.forms.searchForm.submit();
		//$("#searchForm").submit();
	}
	
	 function guid() {
	        return 'xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
	            var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
	            return v.toString(16);
	        });
	    }
	// 创建搜索条件
	function createSerachModel(titleLs,multList){
		var arr = [];
		if(!$.isEmptyObject(multList)){
			$.each(titleLs,function(i,title){
				$.each(multList,function(i,colp){//<s:property value="FIELD_NAME"/>
					if(title == colp.SHOW_NAME && colp.IS_SEARCH=="1"){
						var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
						var id=guid();
						arr.push("<div class='group'>");
						arr.push("<div class='name' title='等于'>");
						arr.push(title);
						arr.push("</div>");
						arr.push("<div class='dec'>");
						if(reg.test(colp.FIELD_NAME)){
							arr.push("<input type='text' id='paraMap2_a"+id+"' ");
							arr.push("name = 'paraMap2.a"+id+"' ");
							arr.push("value = '' class='input'>");
							arr.push("<input type='hidden' id='paraMap6_a"+id+"' ");
							arr.push("name = 'paraMap6.a"+id+"' ");
							arr.push("value = '"+colp.FIELD_NAME+"' class='input'>");
						}else{
							arr.push("<input type='text' id='paraMap2_"+colp.FIELD_NAME+"' ");
							arr.push("name = 'paraMap2."+colp.FIELD_NAME+"' ");
							arr.push("value = '' class='input'>");
						}
						arr.push("</div>");
						arr.push("</div>");
					}
				});
			});
		}else{
			$.each(titleLs,function(i,title){
				arr.push("<div class='group'>");
				arr.push("<div class='name' title='等于'>");
				arr.push(title);
				arr.push("</div>");
				arr.push("<div class='dec'>");
				arr.push("<input type='text' id='paraMap2_"+title+"' ");
				arr.push("name = 'paraMap2."+title+"' ");
				arr.push("value = '' class='input'");
				arr.push("</div>");
				arr.push("</div>");
			});
		}
		$("#search-td").html(arr.join(""));
		initSearch();
	}
	function firstLoadThisPage(paginationImpl){
		if(typeof(_GLO_FORM_PAGE_MAP[paginationImpl].currentPage) =="undefined"){
			return true;
		}
		return false;
	}
	
	function isShowColList(multList){
		var showCol = 0;
		$.each(multList,function(i,colp){
			if(colp.IS_SHOW=="1"){
				showCol++;
			}
		});
		return showCol;
		
	}
	
	function listAx(paginationImpl){
		var url = "${path}buss/bussModel_showSelFkSqlMultAx.ms";
		util.showLoading("处理中...");
		var isFirstLoad = firstLoadThisPage(paginationImpl);
		var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
		var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
		var tdWidth = "";
	  $.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: $("#searchForm").serialize()+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
		success: function(data){
				//alert(JSON.stringify(data));
				//util.alert(data.ajaxMap.nextselectId);
				util.closeLoading();
				var tbodyStr = "";
				if(data.ajaxList != null && data.ajaxList != ""){
					var checkedTag = "";//是否选中
					var chooseVal = $("#choosenDiv span");
					var tdWidth = "";
					if(data.ajaxList.length>0){
						tdWidth = ($(window).width() - 2)/(data.ajaxMap.multList)+"px";
					}
					for(var i=0,j=data.ajaxList.length;i<j;i++){
						if(chooseVal != null && chooseVal !="" && chooseVal != undefined){
							chooseVal.each(function(h){
								//console.log("id:"+this.id+",key:"+data.ajaxList[i].key);
								if(this.id == data.ajaxList[i].key){
									checkedTag = " checked = 'true' ";
									return false;
								}else{
									checkedTag = "";
								}
							});

						}							
						//判断是否选中 
						/*if(vals != "" && vals != null){var valObj = vals.split(split);
							$("#choosenId tbody").html("");
							for(var h = 0 ; h < valObj.length;h++){
								if(data.ajaxList[i].key == valObj[h] || data.ajaxList[i].value == valObj[h]){
									checkedTag = " checked = 'true' ";
									$("#choosenId tbody").append("<tr><td>"+data.ajaxList[i].key+"</td><td>"+data.ajaxList[i].value+"</td></tr>");
									break;
								}else{
									checkedTag = "";
								}
							}
						}*/
						var hideCol = [];
						
						$(".thcolor").find("td").each(function(i,obj){
							if($(this).hasClass("hide")){
								hideCol.push("display:none;");
							}else{
								hideCol.push("");
							}
						});
						var keyText = data.ajaxList[i].key.replace(/&#39;/g, 'mc!@');
						var valText = data.ajaxList[i].value.replace(/&#39;/g, 'mc!@');
						tbodyStr +="<tr class='datagrid-row' style='cursor: pointer;' onclick=\"selectVal(this,'"+keyText+"','"+valText+"',false);\">"
								+"<td class='datagrid-cell' style='width:30px;' align=\"center\">"+((currentPage-1)*pageRecord+(i+1))+"</td>"
								+"<td class=\"datagrid-cell\" style='width:30px;' align=\"center\"><input type='checkbox' name='selectValue' "+checkedTag+" onclick=\"selectVal(this,'"+keyText+"','"+valText+"',true);\"></td>";
								for(var h = 0;h < data.ajaxList[i].dataLa.length;h++){
									tbodyStr += "<td class=\"datagrid-cell\"  style="+hideCol[h+2]+";width:"+tdWidth+">"+tableTextIsNull(data.ajaxList[i].dataLa[h])+"</td>";
								}
								tbodyStr +="</tr>";
					}
				}
				if(isFirstLoad){
					createSerachModel(data.ajaxMap.titleLs,data.ajaxMap.multList);
				}
				var ajaxPage = new Object();
			   	ajaxPage.currentPage = parseInt(data.ajaxPage.currentPage);
		    	ajaxPage.pageRecord = parseInt(data.ajaxPage.pageRecord);
		    	ajaxPage.totalPage = parseInt(data.ajaxPage.totalPage);
		    	ajaxPage.totalRecord = parseInt(data.ajaxPage.totalRecord);
		    	ajaxPage.first = data.ajaxPage.first;
		    	ajaxPage.last = data.ajaxPage.last;
				$("#datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b tbody").html(tbodyStr);
				showPageBar(ajaxPage,"formId1");
				tableTrColor();
				//选中变色
				$("#datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b").find("tbody tr").each(function(seq,item) {
					chooseTrColor(item);
				});
				var formId = "03b09741c53541aaaea80383029ebe4b";
				var widthDisplay =/.*display\s*:\s*(\d+)e/;
				var header=$('#datagrid-htable'+formId+' .datagrid-header-row>td');
				var body=$('#datagrid-btable-ajax'+formId+'>tbody>tr:first-child');
				//setPlatformTableWidthPop(formId,widthDisplay,header,body);
				defTableWidthRewrite("03b09741c53541aaaea80383029ebe4b");
				setScroll("03b09741c53541aaaea80383029ebe4b");
				//_addDragTableEvent("03b09741c53541aaaea80383029ebe4b");
				
				//减去已选项目的高度
				if( $("#choosenDiv").length>0 ){
					var choosenDivHei = $("#choosenDiv").height();
					var choosenIdHeight = $("#choosenId").height()+2;
					var initHeight = parseInt($(".panel").css("height"));
					$(".panel").css("height", initHeight-choosenDivHei-choosenIdHeight);
				}
				

			},
		error: function(msg){
				util.closeLoading();
				utilsFp.alert("error:"+msg);
		  }
		});	
	}

	function tableTextIsNull(v){
		if(v == null || v == "null"){
			return "";
		}else{
			return v;
		}
	}
	
	function add(pop,shadow){
		
		/*$("#add_table tr:gt(0)").each(function(i){
			//console.log(i);
			 var checkBoxObj = $(this).find("input[type='checkbox'][name='selectValue']").eq(0);
			 //console.log(checkBoxObj.prop("checked"));
			 if(checkBoxObj.prop("checked")){
				 _key += $($(this).find("td").get(keyNum)).text()+split;
				 _value += $($(this).find("td").get(valNum)).text()+split;
			 }
		});
		*/
		var kvs = "";
		var _thisSelObj=null;
		var chooseVal = $("#choosenDiv span");
		if(chooseVal != null && chooseVal !="" && chooseVal != undefined){
			chooseVal.each(function(i){
				_key += this.id+split;
				_value += $(this).text();
				kvs += this.id+":"+$(this).text();
			});

		}		

		if(null == _key || _key == ""){
			//utilsFp.alert("<dict:lang value="选择项不能为空" />");
			utilsFp.confirmIcon(3,"","","", "<dict:lang value="选择项不能为空" />","","260","145");
			return false;
		}
		_key = _key.substring(0,_key.length - split.length);
		_value = _value.substring(0,_value.length - split.length);
		/*if(parent._thisSelObj.value != "" &&　parent._thisSelObj.value != null){
			_key = split + _key;
			_value = split + _value;
		}*/
		_thisSelObj=parentWindow._thisSelObj;
		var editName = $(_thisSelObj).attr("editName");
		_thisSelObj.value = "";
		//console.log($("input[name='"+editName+"']",window.parent.document).val());
		parentWindow.$("input[name='"+editName+"']").val("");
		<s:if test="null == #request.ccbFun || \"\" == #request.ccbFun">
			_setSelMultValue(_key,_value,_resObj,kvs);
		</s:if>
		<s:else>
		parentWindow.<c:out value='${ccbFun}' />(_key,_value,_resObj);<%-- 加入自定义回调函数 --%>
		</s:else>
		parent.closePopWinFp(pop,shadow);
	}
	
	<%-- 回填选择的值(多选) --%>
	function _setSelMultValue(key,val,obj,kvs){
	/*	var hiddenId = _thisSelObj.id.replace("_SHOW","")
		if($("#"+hiddenId).val().indexOf(key) == -1){
			$("#"+hiddenId).val($("#"+hiddenId).val()+key);	
			_thisSelObj.value += val;
		}else if(key == "" || key == null){
			$("#"+hiddenId).val("");	
			_thisSelObj.value = "";
		}*/
		/*editName=$(_thisSelObj).attr("editName");
		//console.log(_thisSelObj);
		if($("input[name='"+editName+"']").val().indexOf(key) == -1){
			$("input[name='"+editName+"']").val($("input[name='"+editName+"']").val()+key);	
			_thisSelObj.value += val;
		}*/
		_thisSelObj=parentWindow._thisSelObj;
		var editName=$(_thisSelObj).attr("editName");
		var hiddenname=parentWindow.$("[hiddenname]");
		hiddenname.each(function(){
			if(editName == $(this).attr("hiddenname")){
				$(this).val(kvs);
				return false;
			}
		});
		if(key != ""  && key != null){
			_thisSelObj.value += val;
			parentWindow.$("input[name='"+editName+"']").val(parentWindow.$("input[name='"+editName+"']").val()+key);
		}else{
			_thisSelObj.value = "";
			parentWindow.$("input[name='"+editName+"']").val("");			
		}
		_thisSelObj.focus();
	}
	
	function clearSel(pop,shadow){
		<s:if test="null == #request.ccbFun || \"\" == #request.ccbFun">
		_setSelMultValue("","",null);
		</s:if>
		<s:else>
		parentWindow.<c:out value='${ccbFun}'/>("","",null);<%-- 加入自定义回调函数 --%>
		</s:else>
		parent.closePopWinFp(pop,shadow);
	}
	
	var _key = "";
	var _value = "";
	var _resObj = new Object();
	function selectVal(thisObj,key,value,isCheckBox){

		if(isCheckBox){
			thisObj = thisObj.parentNode.parentNode;//$(thisObj).parent().parent()[0];
		}
		var chkBox = $(thisObj).find("input[type='checkbox'][name='selectValue']").eq(0);
		var extVals = $(thisObj).find("td");
		<s:iterator value="#request.titleLs" id="title" status="seq">
			_resObj.<s:property value="title"/> = extVals.eq(<s:property value="#seq.count"/>+1).text();
		</s:iterator>
		if(chkBox.prop("checked")){
			chkBox.prop("checked",false);
			/*$("#choosenId tbody tr").each(function(){
				if($($(this).find("td").get(0)).text() == key){
					$(this).remove();
				}
			});*/
			var chooseVal = $("#choosenDiv span");
			if(chooseVal != null && chooseVal !="" && chooseVal != undefined){
				chooseVal.each(function(i){
					if(this.id == key){
						$(this).remove();
					}
				});

			}
			
		}else{
			var keyText = key.replace(/mc!@/g, '&#39;');
			var valText = value.replace(/mc!@/g, '&#39;');
			
			chkBox.prop("checked",true);
			$("#choosenDiv").append("<span id='"+keyText+"' onclick=\"delSpan(this);\" style='cursor:pointer;margin-left:5px;' title='<dict:lang value="单击删除" />'>"+valText+split+"</span>");
		}
		//$(thisObj).find("input[type='checkbox'][name='selectValue']").eq(0).prop("checked",true);
		//if(isClose){add();}
		chooseTrColor(thisObj);
	}
	
	//function init(){
	//	var tableTrJq = $("#add_table tbody tr");
	//	_toClickColor(tableTrJq);
	//	_tongLineColor(tableTrJq);
	//}
	
	function selectAllChk(thisObj,formId){
		var chooseVal = $("#choosenDiv span");
		$("#"+formId).find("tbody tr").each(function(seq) {
			$(this).find("td").eq(1).find("input[type='checkbox']").prop("checked",$(thisObj).prop("checked"));
			chooseTrColor(this);
			var trObj = $("#"+formId).find("tbody tr").get(seq);
			if(chooseVal != null && chooseVal !="" && chooseVal != undefined){
				if(chooseVal.length == 0){
					if($(thisObj).prop("checked")){//"+$(trObj).find('td').get(keyNum).innerText+" "+$(trObj).find('td').get(valNum).innerText+split+"
						$("#choosenDiv").append("<span id='"+$(trObj).find('td').get(keyNum).innerText+"' onclick=\"delSpan(this);\" style='cursor:pointer;margin-left:5px;' title='<dict:lang value="单击删除" />'>"+$(trObj).find('td').get(valNum).innerText+split+"</span>");
					}
				}else{
					var isExist = false;
					chooseVal.each(function(i){
							if(this.id == $(trObj).find('td').get(keyNum).innerText){
								if(!$(thisObj).prop("checked")){
									$(this).remove();
								}
								isExist = true;
								return false;
							}
					});
					
					if($(thisObj).prop("checked")){
						if(!isExist){
							$("#choosenDiv").append("<span id='"+$(trObj).find('td').get(keyNum).innerText+"' onclick=\"delSpan(this);\" style='cursor:pointer;margin-left:5px;' title='<dict:lang value="单击删除" />'>"+$(trObj).find('td').get(valNum).innerText+split+"</span>");
						}
					}
				}

			}
			//$("#choosenId tbody").append("<tr><td>"+$($(this).find("td").get(keyNum)).text()+"</td><td>"+$($(this).find("td").get(valNum)).text()+"</td></tr>");
		});
	}
	
	var keyNum = 0;
	var valNum = 0;
	var trCon = $("#datagrid-htable03b09741c53541aaaea80383029ebe4b").find("tr").get(0);
	//console.log($(trCon).find("th").length);
	$(trCon).find("td").each(function(i){
		var t = $(this).text();
		//console.log('${multList}');
		var mList = eval('${multList}');
		//console.log(mList.length);
		if(mList.length == 0 ){
			if(t.toUpperCase()=="MKEY"){
				keyNum = i;
			}
			if(t.toUpperCase()=="VAL"){
				valNum = i;
			}			
		}else{
			for(var j = 0 ; j < mList.length; j ++){
				if(t.toUpperCase() == mList[j].SHOW_NAME){
					if(mList[j].FIELD_NAME.toUpperCase() == "MKEY"){
						keyNum = i;
					}else if(mList[j].FIELD_NAME.toUpperCase() == "VAL"){
						valNum = i;
					}
				}
			}
		}
	});
	
	//阻止冒泡
	/*$("input[type='checkbox']").click(function(e){
		e.stopPropagation();
	});*/
	//回填值
	function feedBackVal(){
		//var hiddenname = $(parent._thisSelObj);//.attr("hiddenname");
		//console.log(_thisSelObj);
		//var parentKy = $("input[name='"+hiddenname+"']",window.parent.document).val();
		//console.log(parentKy);
		if(vals != "" && vals != null){
			/*var valObj = vals.split(split);
			for(var i = 0 ; i < valObj.length;i++){
				$("#add_table tr:gt(0)").each(function(j){
					 var checkBoxObj = $(this).find("input[type='checkbox'][name='selectValue']").eq(0);
					 if($($(this).find("td").get(keyNum)).text() == valObj[i] || $($(this).find("td").get(valNum)).text() == valObj[i]){
						 //$("#choosenId tbody").append("<tr><td>"+$($(this).find("td").get(keyNum)).text()+"</td><td>"+$($(this).find("td").get(valNum)).text()+"</td></tr>");
						 checkBoxObj.prop("checked",true);
						 return false;
					 }
				});
			}*/
			_thisSelObj=parentWindow._thisSelObj;
			var editName = $(_thisSelObj).attr("editName");//$(parent._thisSelObj).attr("editName");
			var hiddenname=parentWindow.$("[hiddenname]");//$("[hiddenname]",window.parent.document);
			hiddenname.each(function(){
				if(editName == $(this).attr("hiddenname")){
					var kvs = $(this).val().split(split);
					for(var j = 0 ; j < kvs.length; j++){
						if(kvs[j] != "" && kvs[j] != null && kvs[j] != undefined){
							$("#choosenDiv").append("<span id='"+kvs[j].split(":")[0]+"' onclick=\"delSpan(this);\" style='cursor:pointer;margin-left:5px;' title='<dict:lang value="单击删除" />'>"+kvs[j].split(":")[1]+split+"</span>");
							$("#datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b tr").each(function(){
								 var checkBoxObj = $(this).find("input[type='checkbox'][name='selectValue']").eq(0);
								 if($($(this).find("td").get(keyNum)).text() == kvs[j].split(":")[0]){
									 checkBoxObj.prop("checked",true);
									 chooseTrColor(this);
									 return false;
								 }
							});							
							
						}
					}
					return false;
				}
			});
		}
	}
	
	$("#choosenId").toggle(function(){
		$("#choosenDiv").show();
		$("#choosenId thead th").get(0).innerText = "已选项目[-]";
	},
	function(){
		$("#choosenDiv").hide();
		$("#choosenId thead th").get(0).innerText = "已选项目[+]";
	});
	
	$(function(){
		feedBackVal();
		$('.dept_select').chosen();
	});
	
	function deptChange(thisObj)
	{
		var value = thisObj.options[thisObj.selectedIndex].value;	
		fn_reloadByChangePerPage(value);
	}

	//加载数据
	function getColData(){
		//var colNum;//列号
		var mapHide = new Map();
		var tdWidth = ($(window).width() - 2)/("${colSum}")+"px";
		var map = new Map();
		$($("#datagrid-htable03b09741c53541aaaea80383029ebe4b").find("tr").get(0)).find("td").each(function(i,obj){

			if(!$(obj).is(":visible")){
				//colNum = i;
				mapHide.put(i,"hide");
			}else{
				mapHide.put(i,"");
			}
			map.put(i,$(obj).width());
		});

		if(mapHide != undefined && mapHide != "" && mapHide != null){
			
			/*$("#datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b").find("tr").each(function(i,obj){
				$(obj).find("td").each(function(j,tdObj){
					if(j == colNum){
						$(tdObj).addClass("hide");
					}
				});
			});*/
			
			var trHtml = "<tbody id='tbody_03b09741c53541aaaea80383029ebe4b'>";
			var tdClass = "";
			<s:iterator value="#request.dataLs" id="data" status="seq">
			var tdCount = 2;
			trHtml+="<tr  class=\"datagrid-row \" style=\"cursor: pointer;\""
			+" onclick=\"selectVal(this,'<s:property value="key"/>','<s:property value="value"/>',false);\">"
			+" <td class=\"datagrid-cell\" style=\"width:30px;\"   align=\"center\"><s:property value="#seq.count" /></td>"
			+" <td class=\"datagrid-cell\" style=\"width:30px;\" align=\"center\"><input type=\"checkbox\" name=\"selectValue\""
			+"	onclick=\"selectVal(this,'<s:property value="key"/>','<s:property value="value"/>',true);\"></td>";
			<s:iterator value="dataLa" id="val">

			trHtml+="	<td class=\"datagrid-cell "+mapHide.get(tdCount)+"\" style='width:"+tdWidth+"'><s:property value="#val.replace('\n','</br>')" escape="true"/></td>";
			tdCount++;
			</s:iterator>
			trHtml+="</tr>";
			</s:iterator>
			trHtml+="</tbody>";
			$("#datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b").html(trHtml);
			tableTrColor();
		}
	}
	
	//表格隔行换色
	function tableTrColor(){
		$(".datagrid-btable-ajax03b09741c53541aaaea80383029ebe4b> tbody tr:odd").addClass("tr-hover");//奇数行
	}
	
	//选中变色
	function chooseTrColor(thisObj){
		var checkFlag = $(thisObj).find("td").eq(1).find("input[type='checkbox']").prop("checked");
		if(!$(thisObj).hasClass("datagrid-selected") && checkFlag){
	      $(thisObj).addClass("datagrid-selected");
	    }else if(!checkFlag){
	    	$(thisObj).removeClass("datagrid-selected");
	    }
	    
	  	if($(thisObj).hasClass("tr-hover") && $(thisObj).hasClass("datagrid-selected")){
		    	 $(thisObj).removeClass("tr-hover").addClass("tr-hover-flag");
		    }else if($(thisObj).hasClass("tr-hover-flag") && !$(thisObj).hasClass("datagrid-selected")){
		    	$(thisObj).addClass("tr-hover").removeClass("tr-hover-flag");
		    }
	 	 
	}
	
	//平台中有弹出选择框页面列表的的查询条件要支持自适应列数
	function get_select_nums(){
		var select_nums=parseInt((Number($(window).width())-50*2)/330);//每行查询条件数量
		select_nums=select_nums-1;
		if(select_nums<=0){
			select_nums=0;
		}
	
		return select_nums;
	}
	
	
	function initSearch(){
		if($(".group").length =="0"){
			$(".search-box").hide();
		}else if($(".group").length <= "1"){
			$(".search-box .more").hide();
		}else{
			$(".search-box .group").each(function(i){
				//平台中有弹出选择框页面列表的的查询条件要支持自适应列数
   				//if(i > 0 && ($("#paraMap_searchParaShowState").val() == "" || $("#paraMap_searchParaShowState").val() == "0")){
   				if(i > get_select_nums() && ($("#paraMap_searchParaShowState").val() == "" || $("#paraMap_searchParaShowState").val() == "0")){
					$(this).hide();
				}
			});
			
			if($("#paraMap_searchParaShowState").val() == "" || $("#paraMap_searchParaShowState").val() == "0"){
				$(".search-box").addClass("show");
			}else{
				$(".search-box").removeClass("show");
			}
		}		
	}
	
	function init(){
		
		$(".search-box .more").click(function(){

   			$(".search-box .group").each(function(i){
   				//平台中有弹出选择框页面列表的的查询条件要支持自适应列数
   				//if(i > 0){
   				if(i > get_select_nums() ){
   					$(this).toggle();
   				}
   			});
   			
            if($("#paraMap_searchParaShowState").val() == "" || $("#paraMap_searchParaShowState").val() == "0"){
            	$("#paraMap_searchParaShowState").val("1");
            	$(".search-box").removeClass("show");
            }else{
            	$("#paraMap_searchParaShowState").val("0");
            	$(".search-box").addClass("show");
            }
               			
		});
		
		$(".dept_select").chosen({
			disable_search_threshold:15//少于15项，隐藏搜索框
		});
	}
	//getColData();
	function setPlatformTableWidthPop(formId,widthDisplay,header,body){
		 var arrNoWidth = [];
		 var tdWidth = ($(window).width() - 2)/("${colSum}");
		header.each(function (i,v) {
			var styleTd = $(this).attr("style");
			
			if(styleTd && styleTd.indexOf("display")>-1&&styleTd.match(widthDisplay)!=null&&styleTd.match(widthDisplay)=="non"){
	    		return true;
	    	}
			if(typeof(styleTd) == "undefined" || styleTd.indexOf("width")<0){
				arrNoWidth.push(i);
				$(this).width(tdWidth);
			}
		});
		body.each(function (i,v) {
			
			if(i==arrNoWidth[i]){
				$(this).width(tdWidth);
			}
		});
	}
	
	$(function(){
		listAx('formId1');
		//setPopScroll("#bodyScroll"); 
	});
</script>

	<script> window.history.forward(1);  try{init();/*调用默认的初始化方法*/}catch(e){} </script>
</body>
