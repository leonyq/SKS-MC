<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <%-- <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include> --%>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<link href="${path}buss/taskCenter/css/taskCenter.css" rel="stylesheet" type="text/css" />
    <link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
<head>
    <title>
		<dict:lang value="VM-设备保养计划" />
    </title>
    <style>
      	._tree{
            width: 200px;
            height: 25px;
            position: relative;
        }

        ._tree input{
            height: 100%;
            width: 100%;
            outline: none;
            border: none;
            box-sizing: border-box;
            float:left;
            border: 1px solid #ccc; 
            padding-left:5px;
            cursor:pointer;
        }
        		

        ._tree .icon{
            position: absolute;
            height: 100%;
            right: 0;
            top: 0;
            cursor: pointer;
        }

        ._tree .ztree{
            border:1px solid #ccc;
            width: 100%;  
            
            max-height: 120px;
            margin-left:-1px;   
            display: none;
            overflow: auto;
            position:absolute;
            top:100%;
            background-color:#fff;
            z-index:1;
        }
      #AREA_NAME{
        cursor:pointer;
      }
        .input{
            width:200px;
        }
    	.hd img{
    	    vertical-align: middle;
    	}
    	
        table{
            border-collapse: collapse;
            
        }
        .rightTable table td,.leftTable table td{
            border: 1px solid #dbe1ef;
            box-sizing: border-box;
            height: 28px;
            padding:0 5px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .leftTable{
            width: 511px;
            height:100%;
            float: left;
        }
        .rightTable{
            width: calc(100% - 511px);
            height:100%;
            float: left;
        }
        .leftTable>.bodyTable{
            width: 100%;
            height: calc(100% - 57px);
            overflow: hidden;
        }
        .rightTable>.headTable{
            overflow: hidden;
        }
        .rightTable>.bodyTable{
            width: 100%;
            height: calc(100% - 57px);
            overflow: auto;
        }
        .rightTable table{
            width:100%;
        }
        
        .headTable table tr{
            background-color:#e6eaf4;
            color:#666;
            font-size:14px;
        }
        
       
       	.bodyTable table td{
       		font-size:12px;
       	}
        /* 左边表格每列宽度 */
        .leftTable table tr td:nth-of-type(1){
            width:30px;
            border-left: none; 
            text-align:center;
            
        }
        .leftTable table tr td:nth-of-type(2){
            width: 30px;
            text-align:center;
        } 
        .leftTable table tr td:nth-of-type(3){
            width: 150px;
        }
        .leftTable table tr td:nth-of-type(4){
            width: 150px;
        }
        .leftTable table tr td:nth-of-type(5){
            width: 150px;
        }
        .leftTable table tr td:nth-of-type(6){
            width: 150px;
        }
        /* 右边表格每列宽度 */
        .rightTable table tr td{
            width: 60px;
            text-align:center;
        }
        
        .rightTable table tr td:nth-of-type(1){
             border-left: none; 
        }
        
    	
    	.bodyTable table tr:nth-of-type(2n){
    		background-color:#f0f4fd;
    	}
    	
    	.bodyTable table tr.selected{
    		background-color:#d3eafc;
    	}
    	
    	#content1,#content2{
    		height:calc(100% - 30px);
    	}
    	
    	.panel-ajax1{
    		height:100%;
    	}
    	
    	#content1 table,#content2 table{
    	    table-layout: fixed;
    	    width:100%;
    	}
    </style>
    
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="89947c5bb70d4ea09370952feddc625e"/>

    
   
    <!-- head里面 -->
</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<div class="">
			<dict:lang value="保养间隔"/>:<img src='${path}buss/facility/image/ico-keep.png'/>&nbsp;&nbsp;
			<dict:lang value="周"/>:<img src='${path}buss/facility/image/ico-week.png'/>&nbsp;&nbsp;
			<dict:lang value="月"/>:<img src='${path}buss/facility/image/ico-month.png'/>&nbsp;&nbsp;
			<dict:lang value="季度"/>:<img src='${path}buss/facility/image/ico-quarter.png'/>&nbsp;&nbsp;
			<dict:lang value="半年"/>:<img src='${path}buss/facility/image/ico-halfayear.png'/>&nbsp;&nbsp;
			<dict:lang value="年"/>:<img src='${path}buss/facility/image/ico-year.png'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<dict:lang value="实心代表已保养"/>
		</div>
		<div class="optn">
  			<table class="func_table">
    			<tbody>
    				<tr>
      					<td width="100%" align="right">
							<button type="button" class="botton_img_add" onclick="querys('formId2')"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>     
						</td>
      				</tr>
  				</tbody>
  			</table>
		</div>
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      
                       <input type="hidden" id="searchParaNull" value="6">
                   </form>
                   <table class="search_table">
						<tbody>
							<tr>
								<td>
 									<div class="group">
										<div class="name" title="<dict:lang value='等于'/>"><dict:lang value="组织机构"/></div>
 										<div class="dec">
 											<select id="DATA_AUTH" name="DATA_AUTH" class="dept_select"></select>
										</div>
									</div>
								</td>
								<td>
 									<div class="group">
										<div class="name" title="<dict:lang value='等于'/>"><dict:lang value="计划年份"/></div>
 										<div class="dec">
 											<select id="year" name="year" class="dept_select">
											</select>
										</div>
									</div>
								</td>
								<td>
 									<div class="group">
										<div class="name" title="<dict:lang value='等于'/>"><dict:lang value="保养月份"/></div>
 										<div class="dec">
 											<select id="month" name="month" class="dept_select">
 												<option value="">--<dict:lang value="请选择"/>--</option>
												<option value="1"><dict:lang value="1"/></option>
												<option value="2"><dict:lang value="2"/></option>
												<option value="3"><dict:lang value="3"/></option>
												<option value="4"><dict:lang value="4"/></option>
												<option value="5"><dict:lang value="5"/></option>
												<option value="6"><dict:lang value="6"/></option>
												<option value="7"><dict:lang value="7"/></option>
												<option value="8"><dict:lang value="8"/></option>
												<option value="9"><dict:lang value="9"/></option>
												<option value="10"><dict:lang value="10"/></option>
												<option value="11"><dict:lang value="11"/></option>
												<option value="12"><dict:lang value="12"/></option>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
 									<div class="group">
										<div class="name" title="<dict:lang value='等于'/>"><dict:lang value="所属区域"/></div>
 										<div class="dec _tree"  onClick="showTree(this,event)">
 											<!--<select id="CDPI_AREA_SN" name="CDPI_AREA_SN" class="null IS_SELECT_FILTER dept_select"></select>-->
                                          	<input type="text" id="AREA_NAME" oninput="setAreaSn(this)" name="AREA_NAME" placeholder="点击弹出" class="input"/>
                                          	<input type="hidden" name="CDPI_AREA_SN" id="CDPI_AREA_SN"/>
                                          	<input type="hidden" name="CDPI_AREA_NAME" id="CDPI_AREA_NAME"/>
                                          	<div id="index_tree" class="ztree" style="display: none;"></div>
										</div>
									</div>
								</td>
								<td>
 									<div class="group">
										<div class="name" title="<dict:lang value='模糊'/>"><dict:lang value="设备SN"/></div>
 										<div class="dec">
 											<input type="text" id="CDPI_DEVICE_SN" name="CDPI_DEVICE_SN" class="input">
										</div>
									</div>
								</td>
								<!-- <td>
 									<div class="group">
										<div class="name" title="<dict:lang value='模糊'/>"><dict:lang value="保养项目"/></div>
 										<div class="dec">
 											<input type="text" id="CDPI_ITEM_NAME" name="CDPI_ITEM_NAME" class="input"> 
										</div>
									</div>
								</td> -->
							</tr>
						</tbody>
					</table>
					
					
               </div>
               <div style="margin-bottom:20px;">
               		<ul class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
						<li id="tag1" class="current"><a class="selectli1" id="liId1" onclick="a(this,'content1')" href="javascript:void(0);"> <span class="selectspan1"><dict:lang value="设备保养计划"/>
							</span> </a></li>
						<li id="tag2"><a class="" onclick="a(this,'content2')" href="javascript:void(0);"> <span><dict:lang value="项目保养计划"/>
							</span> </a></li>
					</ul>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" style="height:calc(100% - 78px - 56px);">
                     
		<input type="hidden" name="formPage89947c5bb70d4ea09370952feddc625e" id="formPage89947c5bb70d4ea09370952feddc625e" value="${formPage89947c5bb70d4ea09370952feddc625e}"/>
		<input type="hidden" name="formId" id="formId1" value='89947c5bb70d4ea09370952feddc625e'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>

<div id="content1">	
		<div class="panel-ajax1 datagrid datagrid-div1" >
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax">
		
		<div class="leftTable">
        <div class="headTable">
            <table>
                <tr>
                    <td style="height:56px;width:30px; text-align:center;"></td>
                    <td style="width:30px; text-align:center;"></td>
       
                    <td style="width:150px; text-align:center;"><dict:lang value="设备SN"/></td>
                    <td style="width:150px; text-align:center;"><dict:lang value="设备名称"/></td>
                    <td style="width:150px; text-align:center;"><dict:lang value="保养计划代码"/></td>
                </tr>
            </table>
        </div>
        <div class="bodyTable">
            <table id="leftTable_s">
            </table>
        </div>
    </div>
    <div class="rightTable">
        <div class="headTable">
            <table id="rightTop_s">
				<tr id="rightTopTr1_s">
				</tr>
				<tr id="rightTopTr2_s">
				</tr>
            </table>
        </div>
        <div class="bodyTable" onscroll="roll(this)">
            <table id="rightTable_s">
            </table>
        </div>
    </div>

		</div>
		
		</div>
		
</div>
<div id="content2" style="display:none;">			
		<div class="panel-ajax1 datagrid datagrid-div1" >
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" >
		
	
		
		
	
		<div class="leftTable" style="width:660px;">
        <div class="headTable">
            <table>
                <tr>
                    <td style="height:56px;width:30px; text-align:center;"></td>
                    <td style="width:30px; text-align:center;"></td>
                    <td style="width:150px; text-align:center;"><dict:lang value="设备SN"/></td>
                    <td style="width:150px; text-align:center;"><dict:lang value="保养项目"/></td>
                    <td style="width:150px; text-align:center;"><dict:lang value="设备名称"/></td>
                    <td style="width:150px; text-align:center;"><dict:lang value="所属区域"/></td>
                </tr>
            </table>
        </div>
        <div class="bodyTable">
            <table id="leftTable">
            </table>
        </div>
    </div>
    <div class="rightTable"  style="width:calc(100% - 660px);">
        <div class="headTable">
            <table id="rightTop">
				<tr id="rightTopTr1">
				</tr>
				<tr id="rightTopTr2">
				</tr>
            </table>
        </div>
        <div class="bodyTable" onscroll="roll(this)">
            <table id="rightTable">
            </table>
        </div>
    </div>

		</div>
		
		</div>
			
</div>
		<div class="center">
				<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=querys&formId=formId2&showLoading=0" />
		</div>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="4c238c26113b4b8686fdb7f1d13502a5" />
      
		<bu:script viewId="4c238c26113b4b8686fdb7f1d13502a5" />
    
   
  
<script>


<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='89947c5bb70d4ea09370952feddc625e'){<%--FM-设备关联保养计划信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+SEQ+(i+1)+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDPI_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDPI_DEVICE_SN')+"' style='"+ms.tdStyle(formId, 'CDPI_DEVICE_SN')+"' "+ms.tdEvent(formId, 'CDPI_DEVICE_SN')+">")
            arrHtml.push("<span colno='CDPI_DEVICE_SN' class='"+ms.uiClass(formId, 'CDPI_DEVICE_SN')+"' style='"+ms.uiStyle(formId, 'CDPI_DEVICE_SN')+"' "+ms.uiEvent(formId, 'CDPI_DEVICE_SN')+" title='"+ms.titleAttr(formId,'CDPI_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['CDPI_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDPI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CDPI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'CDPI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CDPI_ITEM_CODE')+">")
            arrHtml.push("<span colno='CDPI_ITEM_CODE' class='"+ms.uiClass(formId, 'CDPI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CDPI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CDPI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CDPI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CDPI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CD_DEVICE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CD_DEVICE_NAME')+"' style='"+ms.tdStyle(formId, 'T2#CD_DEVICE_NAME')+"' "+ms.tdEvent(formId, 'T2#CD_DEVICE_NAME')+">")
            arrHtml.push("<span colno='T2#CD_DEVICE_NAME' class='"+ms.uiClass(formId, 'T2#CD_DEVICE_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CD_DEVICE_NAME')+"' "+ms.uiEvent(formId, 'T2#CD_DEVICE_NAME')+" title='"+ms.titleAttr(formId,'T2#CD_DEVICE_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#CD_DEVICE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDPI_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDPI_AREA_SN')+"' style='"+ms.tdStyle(formId, 'CDPI_AREA_SN')+"' "+ms.tdEvent(formId, 'CDPI_AREA_SN')+">")
            arrHtml.push("<span colno='CDPI_AREA_SN' class='"+ms.uiClass(formId, 'CDPI_AREA_SN')+"' style='"+ms.uiStyle(formId, 'CDPI_AREA_SN')+"' "+ms.uiEvent(formId, 'CDPI_AREA_SN')+" title='"+ms.titleAttr(formId,'CDPI_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['CDPI_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        $("#tbody_"+formId).html(arrHtml.join(""));
    }

}
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>	
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>

<script>
  $(function(){
       getArea();
        
        
    });

    function getArea(){
 
      
            $("#AREA_NAME").removeAttr("disabled");
            $("#AREA_NAME").attr("class"," input isSubmit  _VAL_OjbsData isaddSubmit _VAL_DATABASE");		
            
            var setting = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        }			
                },
                callback: {
                        onDblClick: zTreeOnclick
                },
                async: {
                    enable: true,
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=170b633cbae94bbe929e02f94201f0fd&type=1",
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
            $.fn.zTree.init($("#index_tree"),setting);
        
        
        
    }
     function zTreeOnclick(event,treeId,treeNode){
               
                    $("#AREA_NAME").val(treeNode.name);
                    $("#CDPI_AREA_SN").val(treeNode.id);
                    $("#CDPI_AREA_NAME").val(treeNode.name);
                   hideMenu();
            }
            function ajaxDataFilter(treeId,parentNode,responseDate){
                	
                var data = responseDate.ajaxList;
            //    $.each(data,function(i,v){
            //        v["isParent"] = true;
            //    });
                return data;
            }
            
    function showTree(elem,event){
            $(elem).find('.ztree').css('display','block');
            //阻止事件冒泡
            var e = arguments.callee.caller.arguments[0]||event; 
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else if (window.event) {
                window.event.cancelBubble = true;
            }
        
    }
  function hideMenu() {
        $("#index_tree").fadeOut("fast");
       // $("._tree .ztree").css('display','none');
       // $("body").unbind("mousedown", onBodyDown);
    }
  		var setting1 = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                          
                        }			
                },
                callback: {
                        onDblClick: zTreeOnclick
                }
                
            }
        var setting2 = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        }			
                },
                callback: {
                        onDblClick: zTreeOnclick
                },
                async: {
                    enable: true,
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=170b633cbae94bbe929e02f94201f0fd&type=1",
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
  function setAreaSn(txtObj) {
    if (txtObj.value.trim().length > 0) {
      	
		
        var zTree = $.fn.zTree.getZTreeObj("index_tree");
      	console.log(zTree);
      	var nodes = zTree.getNodes();
        var nodeList = zTree.getNodesByParamFuzzy("name", txtObj.value,null);
        zTree.expandAll(true);
        //nodeList = zTree.transformToArray(nodeList);
      	/*for(var n in nodeList){//遍历
            findParent(zTree,nodeList[n]);//找到其父节点
        }*/
      	//zTree.showNodes(nodeList);
        //将找到的nodelist节点更新至Ztree内
        $.fn.zTree.init($("#index_tree"), setting2, nodeList);
        //showTree($("._tree")[0],null);
    } else {
        //隐藏树
        //hideMenu();
        $.fn.zTree.init($("#index_tree"),setting2);               
    }              

  function findParent(treeObj,node){
        treeObj.expandNode(node,true,true,true);//展开treeObj中所有节点并获得焦点
    	console.log(node);
        var pNode = node.getParentNode();//获取父节点
        findNextNode(node);//后一个节点
        findPreNode(node);//前一个节点
        if(pNode != null){
            nodeList.push(pNode);//
            findParent(treeObj,pNode);//递归查询上上一级父节点
        }
    }
  function findNextNode(node) {//获取节点的下一个节点
      var nextNode=node.getNextNode();
      if(nextNode!=null){
            if(nextNode.lvl==1){
                return;
            }
            nodeList.push(nextNode);
            var children=nextNode.children;
            if(children){
                for(var i in children){
                    nodeList.push(children[i]);
                }
         }
            findNextNode(nextNode);//递归获取
      }
    }

    function findPreNode(node) {//获取节点的上一个节点
      var preNode=node.getPreNode();
      if(preNode!=null){
            if(preNode.lvl==1){
                return;
            }
         nodeList.push(preNode);
            var children=preNode.children;//获取节点的子节点集合
            if(children){
                for(var i in children){
                    nodeList.push(children[i]);
                }
            }
            findPreNode(preNode);
      }
    }
    function highlightAndExpand_ztree(highlightNodes) {
        //先把全部节点更新为普通样式
        for(var i = 0; i < highlightNodes.length; i++) {
            highlightNodes[i].highlight = false;
            zTreeObj.updateNode(highlightNodes[i]);
        }
        //把指定节点的样式更新为高亮显示，并展开
        if(highlightNodes != null) {
            for(var i = 0; i < highlightNodes.length; i++) {
               //高亮显示节点，并展开
               highlightNodes[i].highlight = true;
                    var t = highlightNodes[i].name;
                    t = "span style='color:red'" + t + "</span";//改变颜色
                    highlightNodes[i].name = t;
                    zTreeObj.updateNode(highlightNodes[i]);//执行修改
                   zTreeObj.expandNode(highlightNodes[i], true, true, true);
            }
        }
    }
  }
  
  
  $(document).click(function () {
        $("._tree .ztree").css('display','none');
    });  
	var url = null;
	//加载查询条的值
	function getSearchVal(){
		util.showLoading();
		//设置计划年份
		var thisDate = new Date();
		var year = parseInt(thisDate.getFullYear())-10;
		for(var i = year;i<=(year+20);i++){
			$("#year").append("<option value='"+i+"' class='select_name'>"+i+"</option>");
		}
		$("#year").find("option[value="+parseInt(thisDate.getFullYear())+"]").attr("selected",true);
		$("#year").trigger("chosen:updated");
	
		//异步获取组织机构和所属区域
		$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url: url,
     		    data:{
     		     "userId":$("#userId").val(),
     		     "falg":"getSearch"
     		    },
     			success: function(data){
   
     					util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							$("#DATA_AUTH").empty();
							$("#DATA_AUTH").append("<option value='' class='select_name'>--<dict:lang value='请选择'/>--</option>");
							for(var i = 0;i < data.ajaxList.length; i++){
								$("#DATA_AUTH").append("<option value='"+data.ajaxList[i].ID+"' class='select_name'>"+data.ajaxList[i].NAME+"</option>");
							}
							$("#DATA_AUTH").trigger("chosen:updated");
						}
						var areaLs = data.ajaxMap.areaLs;
						/*if(null != areaLs){
							$("#CDPI_AREA_SN").empty();
							$("#CDPI_AREA_SN").append("<option value='' class='select_name'>--<dict:lang value='请选择'/>--</option>");
							for(var i = 0;i < areaLs.length; i++){
								$("#CDPI_AREA_SN").append("<option value='"+areaLs[i].ID+"' class='select_name'>"+areaLs[i].NAME+"</option>");
							}
							$("#CDPI_AREA_SN").trigger("chosen:updated");
						}*/
     				},
     			error: function(msg){
     					util.closeLoading();
     					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     			  }
     			});		
	}
	
	//获取设备保养计划列表数据
	function getListData(data){
		var sunNum = (num-1)*7;
		var year = $("#year").val();
		var month = parseInt($("#month").val());
		if ("" == $("#month").val()) {
			month = 1;
		}
		console.log("2:"+data);
		util.showLoading();
		$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url: url,
     		    data: data,
     			success: function(data){
     		
     					util.closeLoading();
						$("#leftTable_s").empty();
						$("#rightTable_s").empty();
						if(null == data){return ;}
						if(null != data.ajaxMap){
						    console.log("xia");
							var leftLs = data.ajaxMap.leftLs;
							var planSn = null;
							var rightLs = null;
							$('#content1 .rightTable .bodyTable','#content1 .rightTable .headTable','#content1 .leftTable>.bodyTable').mCustomScrollbar("destroy");
			                    $('#content2 .rightTable .bodyTable','#content2 .rightTable .headTable','#content2 .leftTable>.bodyTable').mCustomScrollbar("destroy");
							if(null != leftLs){
								for(var i = 0;i < leftLs.length; i++){
									planSn = leftLs[i].CDPI_DEVICE_SN;
									$("#leftTable_s").append("<tr id='s_left_"+leftLs[i].CDPI_DEVICE_SN+"' onclick=\"getPlanSn('"+leftLs[i].CDPI_DEVICE_SN+"');\"></tr>");
									$("#leftTable_s tr:last").append("<td style='width:30px; text-align:center;'>"+(i+1)+"</td>");
									$("#leftTable_s tr:last").append("<td style='width:30px; text-align:center;'><input type='radio' id=\"radio_"+leftLs[i].CDPI_DEVICE_SN+"\" name='radioName'></td>");
									if (leftLs[i].CDPI_DEVICE_SN == null) {
										leftLs[i].CDPI_DEVICE_SN = "";
									}
									$("#leftTable_s tr:last").append("<td><span onclick='itemJump1(\""+leftLs[i].CDPI_DEVICE_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+leftLs[i].CDPI_DEVICE_SN+"</span></td>");
									if (leftLs[i].CD_DEVICE_NAME == null) {
										leftLs[i].CD_DEVICE_NAME = "";
									}
									$("#leftTable_s tr:last").append("<td>"+leftLs[i].CD_DEVICE_NAME+"</td>");
									if (leftLs[i].CDP_PLAN_SN == null) {
										leftLs[i].CDP_PLAN_SN = "";
									}
									$("#leftTable_s tr:last").append("<td>"+leftLs[i].CDP_PLAN_SN+"</td>");
									//右边添加对应的格子
									$("#rightTable_s").append("<tr id='s_"+i+"_"+planSn+"' onclick=\"getPlanSn('"+leftLs[i].CDPI_DEVICE_SN+"');\"></tr>");
									
									var flag = false;
									if ("" == $("#month").val()) {
										tdId = 1;
									}else{
										tdId = getDays(parseInt(year),parseInt($("#month").val()),1);
									}
									
									for(var j = 0;j < sunNum; j++){
										if ((thisDayIsNum-1) == j) {
											flag = true;
										}
										if (flag) {
											$("#rightTable_s tr:last").append("<td id='s_"+i+"_"+tdId+"'></td>");
											tdId ++;
										}else{
											$("#rightTable_s tr:last").append("<td></td>");
										}
										
									}
									$('#rightTable_s').width(sunNum * 60);
									rightLs = data.ajaxMap[planSn];
									if (rightLs!=null && rightLs!=undefined) {
										if (rightLs.INTERVAL!=null && rightLs.INTERVAL!=undefined) {		//计划类型——间隔
											var day = parseInt(rightLs.INTERVAL.DAY);
											if (parseInt(day)>0) {
												var mtDate = rightLs.INTERVAL.CD_MT_DATE;
												var mtDateArr = mtDate.split("-");
												var thisDays = parseInt(getDays(parseInt(year),parseInt(mtDateArr[1]),parseInt(mtDateArr[2])));
												var thisyears = parseInt(getDays(parseInt(year),12,31));
												var htm = "<div><img src='${path}buss/facility/image/ico-keep.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-keep-h.png'/></div>";
												if (parseInt(mtDateArr[0])==parseInt(year)) {
													while(thisDays <= thisyears){
														if ($("#s_"+i+"_"+thisDays).length) {
															$("#s_"+i+"_"+thisDays).html("");
															$("#s_"+i+"_"+thisDays).append(htm);
														} 
														thisDays = thisDays + day;
													}
												}else if (parseInt(mtDateArr[0])<parseInt(year)) {
													var numday = 0;
													for ( var num = parseInt(year); num <= parseInt(mtDateArr[0]); num++) {
														numday = numday+parseInt(getDays(parseInt(num),12,31));
													}
													while(thisDays <= numday){
														thisDays = thisDays + day;
													}
													var thisyears_s = parseInt(getDays(parseInt(mtDateArr[0]),12,31));
													thisDays = day-(parseInt(getDays(parseInt(mtDateArr[0])-1,12,31))-thisDays);
													while(thisDays <= thisyears_s){
														if ($("#s_"+i+"_"+thisDays).length) {
															$("#s_"+i+"_"+thisDays).html("");
															$("#s_"+i+"_"+thisDays).append(htm);
														} 
														thisDays = thisDays + day;
													}
												}
												
												if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
													getMtTime(rightLs.MTTIME,htm_h,"s_"+i);
												}
											}
										}else{									//计划类型——周期
											var tdnode = $("#s_"+i+"_"+planSn+" td");		//当前行下所有的td
											if (rightLs.YEAR!=null && rightLs.YEAR!=undefined) {		//计划类型——周期_全年
												var htm = "<div><img src='${path}buss/facility/image/ico-year.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-year-h.png'/></div>";
												for(var y = 0;y < rightLs.YEAR.length; y++){
													var thisMonth = parseInt(rightLs.YEAR[y].MONTH);
													var thisday = parseInt(rightLs.YEAR[y].DATE);//alert("thisMonth="+thisMonth+"--thisday="+thisday);
													if (thisMonth!=null && thisMonth!=undefined && thisday!=null && thisday!=undefined) {
														var maxDay = getLastDay(parseInt(year),thisMonth);
														if (parseInt(thisday)<=parseInt(maxDay)) {
															var thisDayNum = parseInt(getDays(parseInt(year),thisMonth,thisday));
															if ($("#s_"+i+"_"+thisDayNum).length) {
																$("#s_"+i+"_"+thisDayNum).html("");
																$("#s_"+i+"_"+thisDayNum).append(htm);
															} 
														}
													}
												}
											if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
												getMtTime(rightLs.MTTIME,htm_h,"s_"+i);
											}
											}else if (rightLs.HALFYEAR!=null && rightLs.HALFYEAR!=undefined) {		//计划类型——周期_半年
												var htm = "<div><img src='${path}buss/facility/image/ico-halfayear.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-halfayear-h.png'/></div>";
												for(var y = 0;y < rightLs.HALFYEAR.length; y++){
													var thisMonth = parseInt(rightLs.HALFYEAR[y].MONTH);
													var thisday = parseInt(rightLs.HALFYEAR[y].DATE);
													if (thisMonth!=null && thisMonth!=undefined && thisday!=null && thisday!=undefined) {
														var maxDay = getLastDay(parseInt(year),thisMonth);
														if (parseInt(thisday)<=parseInt(maxDay)) {
															var thisDayNum = parseInt(getDays(parseInt(year),thisMonth,thisday));
															if ($("#s_"+i+"_"+thisDayNum).length) {
																$("#s_"+i+"_"+thisDayNum).html("");
																$("#s_"+i+"_"+thisDayNum).append(htm);
															} 
														}
													}
												}
											if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
												getMtTime(rightLs.MTTIME,htm_h,"s_"+i);
											}
											}else if (rightLs.QUARTER!=null && rightLs.QUARTER!=undefined) {		//计划类型——周期_季度
												var htm = "<div><img src='${path}buss/facility/image/ico-quarter.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-quarter-h.png'/></div>";
												for(var y = 0;y < rightLs.QUARTER.length; y++){
													var thisMonth = parseInt(rightLs.QUARTER[y].MONTH);
													var thisday = parseInt(rightLs.QUARTER[y].DATE);
													if (thisMonth!=null && thisMonth!=undefined && thisday!=null && thisday!=undefined) {
														var maxDay = getLastDay(parseInt(year),thisMonth);
														if (parseInt(thisday)<=parseInt(maxDay)) {
															var thisDayNum = parseInt(getDays(parseInt(year),thisMonth,thisday));
															if ($("#s_"+i+"_"+thisDayNum).length) {
																$("#s_"+i+"_"+thisDayNum).html("");
																$("#s_"+i+"_"+thisDayNum).append(htm);
															} 
														}
													}
												}
											if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
												getMtTime(rightLs.MTTIME,htm_h,"s_"+i);
											}
											}else if (rightLs.MONTH!=null && rightLs.MONTH!=undefined) {		//计划类型——周期_月
												var htm = "<div><img src='${path}buss/facility/image/ico-month.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-month-h.png'/></div>";
												for(var y = 0;y < rightLs.MONTH.length; y++){
													var thisday = parseInt(rightLs.MONTH[y].DATE);
													if (thisday!=null && thisday!=undefined) {
														var month = 1;
														while(month <= 12){
															var maxDay = getLastDay(parseInt(year),parseInt(month));
															if (parseInt(thisday)<=parseInt(maxDay)) {
																var thisDayNum = parseInt(getDays(parseInt(year),parseInt(month),thisday));
																if ($("#s_"+i+"_"+thisDayNum).length) {
																	$("#s_"+i+"_"+thisDayNum).html("");
																	$("#s_"+i+"_"+thisDayNum).append(htm);
																}
															}
																month ++;
														} 
													}
												}
											if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
												getMtTime(rightLs.MTTIME,htm_h,"s_"+i);
											}
											}else if (rightLs.WEEK!=null && rightLs.WEEK!=undefined) {		//计划类型——周期_周
												var htm = "<div><img src='${path}buss/facility/image/ico-week.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-week-h.png'/></div>";
												for(var y = 0;y < rightLs.WEEK.length; y++){
													var weekId = parseInt(rightLs.WEEK[y].WEEK);
													while(weekId <= tdnode.length){
														$("#s_"+i+"_"+planSn+" td:nth-child("+weekId+")").html("");
														$("#s_"+i+"_"+planSn+" td:nth-child("+weekId+")").append(htm);
														weekId = weekId+7;
													} 
												}
											if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
												getMtTime(rightLs.MTTIME,htm_h,"s_"+i);
											}
											}
										}
									}
								}
								pageFun(data.ajaxPage,"formId2");
								setPopScroll('#content1 .rightTable .bodyTable','#content1 .rightTable .headTable','#content1 .leftTable>.bodyTable');					
		                        setPopScroll('#content2 .rightTable .bodyTable','#content2 .rightTable .headTable','#content2 .leftTable>.bodyTable');
								
							}
						}
						
     				},
     			error: function(msg){
     					util.closeLoading();
     					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     			  }
     			});	
    
	}
	
	//设备保养计划行点击事件
	function getPlanSn(deviceSn){
		var index = $("#radio_"+deviceSn).parents('tr').index();
		$("input:radio[name='radioName']").attr("checked",false);
		$("#radio_"+deviceSn).attr('checked','checked');
		$("#radio_"+deviceSn).parents('tr').addClass('selected').siblings().removeClass('selected');
		$('.rightTable .bodyTable table tr').eq(index).addClass('selected').siblings().removeClass('selected');

		data = "falg=getPlanData&CDPI_DEVICE_SN="+deviceSn;
        //+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
	}
	
	$('.bodyTable table').on('mouseover','tr',function(){
		$('.bodyTable table').find('tr:eq('+ $(this).index() +')').css('background-color','#c3e2fb');
	})
	
	$('.bodyTable table').on('mouseout','tr',function(){
		$('.bodyTable table').find('tr:eq('+ $(this).index() +')').css('background-color','');
	})
	
	//获取项目保养计划列表数据
	function getProjectListData(data){
		var sunNum = (num-1)*7;
		var year = $("#year").val();
		var month = parseInt($("#month").val());
		if ("" == $("#month").val()) {
			month = 1;
		}

		util.showLoading();
		$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url: url,
     		    data: data,
     			success: function(data){
     
     					util.closeLoading();
						$("#leftTable").empty();
						$("#rightTable").empty();
						if(null == data){return ;}
						if(null != data.ajaxMap){
							var leftLs = data.ajaxMap.leftLs;
							var planSn = null;
							var rightLs = null;
							if(null != leftLs){
								for(var i = 0;i < leftLs.length; i++){
									planSn = leftLs[i].CDP_PLAN_SN;
									$("#leftTable").append("<tr id='left_"+planSn+"'></tr>");
									$("#leftTable tr:last").append("<td style='width:30px; text-align:center;'>"+(i+1)+"</td>");
									$("#leftTable tr:last").append("<td style='width:30px; text-align:center;'><input type='radio'></td>");
									if (leftLs[i].CDPI_DEVICE_SN == null) {
										leftLs[i].CDPI_DEVICE_SN = "";
									}
									$("#leftTable tr:last").append("<td><span onclick='itemJump1(\""+leftLs[i].CDPI_DEVICE_SN+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+leftLs[i].CDPI_DEVICE_SN+"</span></td>");
									if (leftLs[i].CDI_ITEM_NAME == null) {
										leftLs[i].CDI_ITEM_NAME = "";
									}
									$("#leftTable tr:last").append("<td>"+leftLs[i].CDI_ITEM_NAME+"</td>");
									if (leftLs[i].CD_DEVICE_NAME == null) {
										leftLs[i].CD_DEVICE_NAME = "";
									}
									$("#leftTable tr:last").append("<td>"+leftLs[i].CD_DEVICE_NAME+"</td>");
									if (leftLs[i].CA_NAME == null) {
										leftLs[i].CA_NAME = "";
									}
									$("#leftTable tr:last").append("<td>"+leftLs[i].CA_NAME+"</td>");
									//右边添加对应的格子
									$("#rightTable").append("<tr id='"+i+"_"+planSn+"'></tr>");
									
									var flag = false;
									if ("" == $("#month").val()) {
										tdId = 1;
									}else{
										tdId = getDays(parseInt(year),parseInt($("#month").val()),1);
									}
									
									for(var j = 0;j < sunNum; j++){
										if ((thisDayIsNum-1) == j) {
											flag = true;
										}
										if (flag) {
											$("#rightTable tr:last").append("<td id='"+i+"_"+tdId+"'></td>");
											tdId ++;
										}else{
											$("#rightTable tr:last").append("<td></td>");
										}
										
									}
									$('#rightTable').width(sunNum * 60);
									rightLs = data.ajaxMap[planSn];
									if (rightLs!=null && rightLs!=undefined) {
										if (rightLs.INTERVAL!=null && rightLs.INTERVAL!=undefined) {		//计划类型——间隔
											var day = parseInt(rightLs.INTERVAL.DAY);
											if (parseInt(day)>0) {
												var mtDate = rightLs.INTERVAL.CD_MT_DATE;
												var mtDateArr = mtDate.split("-");
												var thisDays = parseInt(getDays(parseInt(year),parseInt(mtDateArr[1]),parseInt(mtDateArr[2])));
												var thisyears = parseInt(getDays(parseInt(year),12,31));
												var htm = "<div><img src='${path}buss/facility/image/ico-keep.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-keep-h.png'/></div>";
												if (parseInt(mtDateArr[0])<parseInt(year)) {
													while(thisDays <= thisyears){
														if ($("#"+i+"_"+thisDays).length) {
															$("#"+i+"_"+thisDays).html("");
															$("#"+i+"_"+thisDays).append(htm);
														} 
														thisDays = thisDays + day;
													}
												}else if (parseInt(mtDateArr[0])<parseInt(year)) {
													var numday = 0;
													for ( var num = parseInt(year); num <= parseInt(mtDateArr[0]); num++) {
														numday = numday+parseInt(getDays(parseInt(num),12,31));
													}
													while(thisDays <= numday){
														thisDays = thisDays + day;
													}
													var thisyears_s = parseInt(getDays(parseInt(mtDateArr[0]),12,31));
													thisDays = day-(parseInt(getDays(parseInt(mtDateArr[0])-1,12,31))-thisDays);
													while(thisDays <= thisyears_s){
														if ($("#s_"+i+"_"+thisDays).length) {
															$("#s_"+i+"_"+thisDays).html("");
															$("#s_"+i+"_"+thisDays).append(htm);
														} 
														thisDays = thisDays + day;
													}
												}
												if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
													getMtTime(rightLs.MTTIME,htm_h,i);
												}
											}
										}else{									//计划类型——周期
											var tdnode = $("#"+i+"_"+planSn+" td");		//当前行下所有的td
											if (rightLs.YEAR!=null && rightLs.YEAR!=undefined) {		//计划类型——周期_全年
												var htm = "<div><img src='${path}buss/facility/image/ico-year.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-year-h.png'/></div>";
												for(var y = 0;y < rightLs.YEAR.length; y++){
													var thisMonth = parseInt(rightLs.YEAR[y].MONTH);
													var thisday = parseInt(rightLs.YEAR[y].DATE);//alert("thisMonth="+thisMonth+"--thisday="+thisday);
													if (thisMonth!=null && thisMonth!=undefined && thisday!=null && thisday!=undefined) {
														var maxDay = getLastDay(parseInt(year),thisMonth);
														if (parseInt(thisday)<=parseInt(maxDay)) {
															var thisDayNum = parseInt(getDays(parseInt(year),thisMonth,thisday));
															if ($("#"+i+"_"+thisDayNum).length) {
																$("#"+i+"_"+thisDayNum).html("");
																$("#"+i+"_"+thisDayNum).append(htm);
															} 
														}
													}
												}
											if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
												getMtTime(rightLs.MTTIME,htm_h,i);
											}
											}else if (rightLs.HALFYEAR!=null && rightLs.HALFYEAR!=undefined) {		//计划类型——周期_半年
												var htm = "<div><img src='${path}buss/facility/image/ico-halfayear.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-halfayear-h.png'/></div>";
												for(var y = 0;y < rightLs.HALFYEAR.length; y++){
													var thisMonth = parseInt(rightLs.HALFYEAR[y].MONTH);
													var thisday = parseInt(rightLs.HALFYEAR[y].DATE);
													if (thisMonth!=null && thisMonth!=undefined && thisday!=null && thisday!=undefined) {
														var maxDay = getLastDay(parseInt(year),thisMonth);
														if (parseInt(thisday)<=parseInt(maxDay)) {
															var thisDayNum = parseInt(getDays(parseInt(year),thisMonth,thisday));
															if ($("#"+i+"_"+thisDayNum).length) {
																$("#"+i+"_"+thisDayNum).html("");
																$("#"+i+"_"+thisDayNum).append(htm);
															} 
														}
													}
												}
											if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
												getMtTime(rightLs.MTTIME,htm_h,i);
											}
											}else if (rightLs.QUARTER!=null && rightLs.QUARTER!=undefined) {		//计划类型——周期_季度
												var htm = "<div><img src='${path}buss/facility/image/ico-quarter.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-quarter-h.png'/></div>";
												for(var y = 0;y < rightLs.QUARTER.length; y++){
													var thisMonth = parseInt(rightLs.QUARTER[y].MONTH);
													var thisday = parseInt(rightLs.QUARTER[y].DATE);
													if (thisMonth!=null && thisMonth!=undefined && thisday!=null && thisday!=undefined) {
														var maxDay = getLastDay(parseInt(year),thisMonth);
														if (parseInt(thisday)<=parseInt(maxDay)) {
															var thisDayNum = parseInt(getDays(parseInt(year),thisMonth,thisday));
															if ($("#"+i+"_"+thisDayNum).length) {
																$("#"+i+"_"+thisDayNum).html("");
																$("#"+i+"_"+thisDayNum).append(htm);
															} 
														}
													}
												}
											if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
												getMtTime(rightLs.MTTIME,htm_h,i);
											}
											}else if (rightLs.MONTH!=null && rightLs.MONTH!=undefined) {		//计划类型——周期_月
												var htm = "<div><img src='${path}buss/facility/image/ico-month.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-month-h.png'/></div>";
												for(var y = 0;y < rightLs.MONTH.length; y++){
													var thisday = parseInt(rightLs.MONTH[y].DATE);
													var month = 1;
													if (thisday!=null && thisday!=undefined) {
														while(month <= 12){
															var maxDay = getLastDay(parseInt(year),parseInt(month));
															if (parseInt(thisday)<=parseInt(maxDay)) {
																var thisDayNum = parseInt(getDays(parseInt(year),parseInt(month),thisday));
																if ($("#"+i+"_"+thisDayNum).length) {
																	$("#"+i+"_"+thisDayNum).html("");
																	$("#"+i+"_"+thisDayNum).append(htm);
																}
															}
															month ++;
														} 
													}
												}
											if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
												getMtTime(rightLs.MTTIME,htm_h,i);
											}
											}else if (rightLs.WEEK!=null && rightLs.WEEK!=undefined) {		//计划类型——周期_周
												var htm = "<div><img src='${path}buss/facility/image/ico-week.png'/></div>";
												var htm_h = "<div><img src='${path}buss/facility/image/ico-week-h.png'/></div>";
												for(var y = 0;y < rightLs.WEEK.length; y++){
													var weekId = parseInt(rightLs.WEEK[y].WEEK);
													while(weekId <= tdnode.length){
														$("#"+i+"_"+planSn+" td:nth-child("+weekId+")").html("");
														$("#"+i+"_"+planSn+" td:nth-child("+weekId+")").append(htm);
														weekId = weekId+7;
													} 
												}
											if (rightLs.MTTIME!=null && rightLs.MTTIME!=undefined) {
												getMtTime(rightLs.MTTIME,htm_h,i);
											}
											}
										}
									}
								}
							}
								pageFun(data.ajaxPage,"formId2");
						}
						
     				},
     			error: function(msg){
     					util.closeLoading();
     					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     			  }
     			});		
	}

	var data = null;
	var paginationImpl = {};

	//查询方法
	function querys(paginationImpl){
		$('#content1').css('display','block');
		$('#content2').css('display','none');
		$("#liId1").parent().addClass('current').siblings().removeClass('current');
		var year = $("#year").val();
		var month = $("#month").val();
		data = {
      "falg":"getListData",
      "DATA_AUTH":$("#DATA_AUTH").val(),
      "CDPI_AREA_SN":$("#CDPI_AREA_SN").val(),
      "CDPI_DEVICE_SN":$("#CDPI_DEVICE_SN").val().trim(),
      "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,//
      "page.pageRecord":_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord//
      }
		//data = "falg=getListData&DATA_AUTH="+$("#DATA_AUTH").val()+"&CDPI_AREA_SN="+$("#CDPI_AREA_SN").val()+"&CDPI_DEVICE_SN="+$("#CDPI_DEVICE_SN").val().trim()+"&page.currentPage=1&page.pageRecord=10";
        num = 1;
        $("#rightTopTr1_s").empty();
        $("#rightTopTr2_s").empty();
        $("#rightTopTr1").empty();
        $("#rightTopTr2").empty();
		if ("" == month) {
			for(var i = 1; i < 13; i++) {
				getInfo(year,i);
			}
			thisDayIsNum = getWeek(year+"-1-1");
		}else{
			getInfo(year,month);
			thisDayIsNum = getWeek(year+"-"+month+"-1");
		}
		getListData(data);
		$(".rightTable").scrollLeft(0);
	}
	
	var thisDayIsNum = 0;	//当前选择年月的第一天是周几
     var tdId = 1;	//每行中每列代表一年中的第几天
		$(function(){
			url = getUrl();
			getSearchVal();
			thisYearDay = getWeek($("#year").val()+"-1-1");
			var year = $("#year").val();
			var month = $("#month").val();
	        num = 1;
	        $("#rightTopTr1_s").empty();
	        $("#rightTopTr2_s").empty();
			if ("" == month) {
				for(var i = 1; i < 13; i++) {
					
					getInfo(year,i);
				}
				thisDayIsNum = getWeek(year+"-1-1");
			}else{
				getInfo(year,month);
			thisDayIsNum = getWeek(year+"-"+month+"-1");
			}
			data = "falg=getListData";
			getListData(data);
	
		});
	
	function roll(e){
	            $('.rightTable .headTable').scrollLeft($(e).scrollLeft());
	            $('.leftTable .bodyTable').scrollTop($(e).scrollTop());
	            $('.rightTable_s .headTable').scrollLeft($(e).scrollLeft());
	            $('.leftTable_s .bodyTable').scrollTop($(e).scrollTop());
	}
	
	 
	 //从list中得到保养时间是一年中的第几天
	 function getMtTime(mtTimeList,htm,i){
	 	for(var z = 0;z < mtTimeList.length; z++){
			var mtDate_h = mtTimeList[z];
			var mtDateArr_h = mtDate_h.split("-");
			var thisDays_h = parseInt(getDays(parseInt(mtDateArr_h[0]),parseInt(mtDateArr_h[1]),parseInt(mtDateArr_h[2])));
			if (parseInt($("#year").val())==parseInt(mtDateArr_h[0])) {
				if ($("#"+i+"_"+thisDays_h).length) {
					$("#"+i+"_"+thisDays_h).html("");
					$("#"+i+"_"+thisDays_h).append(htm);
				}
			}
		}
	 }
	 
	 //获取当月有几天
	 function getMonthNum(year,month){
	 	var d = new Date(year, month, 0);
    	return parseInt(d.getDate());
	 }
	        
	//获取日期是周几
	function getWeek(dateStr){				//dateStr:yyyy-MM-dd
		var Nowdate = dateStr.split("-"), //获取某一日期 
		NowYear = parseInt(Nowdate[0]), //某年份 
		NowMonth = parseInt(Nowdate[1]), //某月份 
		Nowday = parseInt(Nowdate[2]), //某天 
		date = new Date(), 
		weekday=new Array(7); 
		weekday[0]="7"; 
		weekday[1]="1"; 
		weekday[2]="2"; 
		weekday[3]="3"; 
		weekday[4]="4"; 
		weekday[5]="5"; 
		weekday[6]="6"; 
		date.setFullYear(NowYear);//把当前年份设为某年 
		date.setMonth(NowMonth-1);//把当前月份设为某月 
		date.setDate(Nowday);//把当前日设为某天 
		return parseInt(weekday[date.getDay()]);
		//document.write(NowYear+"年"+NowMonth+"月"+Nowday+"号是"+weekday[date.getDay()]+"<br />"); 
	}

	//根据条件里的年月，列表展示相应的周
     var num = 1;	//周数
	 function getInfo(year, month) {
        var d = new Date();
        d.setFullYear(year, month-1, 1);
        var w1 = d.getDay();
        if (w1 == 0) {
        	w1 = 7;
        }
        d.setFullYear(year, month, 0);
        var dd = d.getDate();
        var year_s = year;
        var month_s = month;
        if (w1 != 1) {
        	d1 = 7 - w1 + 2;
        	if ("1" == month || $("#month").val() == month) {
        	if (month==1) {
				year_s = year - 1;
				month_s = 13;
			}
			var day_s = getMonthNum(year_s,month_s-1);
				$("#rightTopTr1_s").append("<td colspan='7' style='text-align:center;'><dict:lang value='第'/>"+num+"<dict:lang value='周'/>("+year_s+"/"+(month_s-1)+"/"+(day_s-w1+2)+"-"+year+"/"+month+"/"+(8-w1)+")</td>");
            	$("#rightTopTr2_s").append("<td><dict:lang value='一'/></td><td><dict:lang value='二'/></td><td><dict:lang value='三'/></td><td><dict:lang value='四'/></td><td><dict:lang value='五'/></td><td><dict:lang value='六'/></td><td><dict:lang value='日'/></td>");
				$("#rightTopTr1").append("<td colspan='7' style='text-align:center;'><dict:lang value='第'/>"+num+"<dict:lang value='周'/>("+year_s+"/"+(month_s-1)+"/"+(day_s-w1+2)+"-"+year+"/"+month+"/"+(8-w1)+")</td>");
            	$("#rightTopTr2").append("<td><dict:lang value='一'/></td><td><dict:lang value='二'/></td><td><dict:lang value='三'/></td><td><dict:lang value='四'/></td><td><dict:lang value='五'/></td><td><dict:lang value='六'/></td><td><dict:lang value='日'/></td>");
            	num ++ ;
			}
        }else {
        	d1 = 1;
        }
        week_count = Math.ceil((dd-d1+1)/7);
        for (var i = 0; i < week_count; i++) {
            var monday = d1+i*7;
            var sunday = monday + 6;
            var from = year+"/"+month+"/"+monday;
            var to;
            if (sunday <= dd) {
                to = year+"/"+month+"/"+sunday;
            } else {
                d.setFullYear(year, month-1, sunday);
                to = d.getFullYear()+"/"+(d.getMonth()+1)+"/"+d.getDate();
            }
            $("#rightTopTr1_s").append("<td colspan='7' style='text-align:center;'><dict:lang value='第'/>"+num+"<dict:lang value='周'/>("+from+"-"+to+")</td>");
            $("#rightTopTr2_s").append("<td><dict:lang value='一'/></td>");
            $("#rightTopTr2_s").append("<td><dict:lang value='二'/></td>");
            $("#rightTopTr2_s").append("<td><dict:lang value='三'/></td>");
            $("#rightTopTr2_s").append("<td><dict:lang value='四'/></td>");
            $("#rightTopTr2_s").append("<td><dict:lang value='五'/></td>");
            $("#rightTopTr2_s").append("<td><dict:lang value='六'/></td>");
            $("#rightTopTr2_s").append("<td><dict:lang value='日'/></td>");
            $("#rightTopTr1").append("<td colspan='7' style='text-align:center;'><dict:lang value='第'/>"+num+"<dict:lang value='周'/>("+from+"-"+to+")</td>");
            $("#rightTopTr2").append("<td><dict:lang value='一'/></td>");
            $("#rightTopTr2").append("<td><dict:lang value='二'/></td>");
            $("#rightTopTr2").append("<td><dict:lang value='三'/></td>");
            $("#rightTopTr2").append("<td><dict:lang value='四'/></td>");
            $("#rightTopTr2").append("<td><dict:lang value='五'/></td>");
            $("#rightTopTr2").append("<td><dict:lang value='六'/></td>");
            $("#rightTopTr2").append("<td><dict:lang value='日'/></td>");
            num ++ ;
            //document.write("第"+(i+1)+"周 从" + from + " 到 " + to + "");
          
        }
        $('#rightTop').width((num-1)*7 * 60);
        $('#rightTop_s').width((num-1)*7 * 60);
    }
    
    	//获取天数  
        function  getDays(year,month,day){  
        	//最后一天是几号
        	if (day == 0 || day == "0") {
				day = getLastDay(year,month);
			}
            //先将每个月份的天数存入数组中  
            var arr = [31,28,31,30,31,30,31,31,30,31,30,31];  
            //将输入月份之前月份的天数累加  
            for(var i = 0; i< month -1;i++){  
                day += arr[i];  
            }  
            //判断是否是闰年且看是否大于2月(小于2月没必要考虑闰年问题)  
            if(month > 2 && isLeap(year)){  
                day ++;  
            }  
            return parseInt(day);  
        }  
  		
  		//获取月的最后一天是几号
  		function getLastDay(year,month) {   
			 var new_year = year;  //取当前的年份   
			 var new_month = month++;//取下一个月的第一天，方便计算（最后一天不固定）   
			 if(month>12)      //如果当前大于12月，则年份转到下一年   
			 {   
			 new_month -=12;    //月份减   
			 new_year++;      //年份增   
			 }   
			 var new_date = new Date(new_year,new_month,1);        //取当年当月中的第一天   
			 return (new Date(new_date.getTime()-1000*60*60*24)).getDate();//获取当月最后一天日期   
		}
  
        //先判断是否是闰年  
        function isLeap(year){  
            if (year % 400 == 0 || year % 4 === 0 && year % 100 !== 0){  
                return true;  
            }else{  
                return false;  
            }  
        }  
	
	
	function a(e,id){
		if(id == "content2"){
			var obj=document.getElementsByName("radioName");
			var len=0;
			for(var i in obj){
			   if(obj[i].checked){
			      len ++;
			   }
			}
			if (0 == len) {
				utilsFp.confirmIcon(1,"","","", "<dict:lang value='请选择一条设备'/>",0,"","");
				return ;
			}
			$('#content1').css('display','none');
			getProjectListData(data);
		}
		$(e).parent().addClass('current').siblings().removeClass('current');
		$('#' + id).css('display','block');
		if(id == "content1"){
			$('#content2').css('display','none');
			querys("formId2");
		}
	}
	
	(function($){
		$(window).on('load',function(){
			setPopScroll('#content1 .rightTable .bodyTable','#content1 .rightTable .headTable','#content1 .leftTable>.bodyTable')
			setPopScroll('#content2 .rightTable .bodyTable','#content2 .rightTable .headTable','#content2 .leftTable>.bodyTable')
		})
	})(jQuery)
	function getUrl(){
        var thisUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=881920bf7da64854a932e932035fec5e"; 
        return thisUrl;
        }
        
</script>

<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//设备建档
function itemJump1(obj){
      winOptMethod.jump("574da5a0885547d58d4ea2db64af2158","F3181","jumpId",obj);
}  

</script>

<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

