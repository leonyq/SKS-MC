<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
		<link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
	<script src="${path}plf/js/ui/textform/js/jquery.validate.js"></script>
		
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	
	  
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
            
            max-height: 200px;
            margin-left:-1px;   
            display: none;
            overflow: auto;
            position:absolute;
            bottom:100%;
            background-color:#fff;

        }
    
</style>
</head>
<body>
	<div class="edit">
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />
" method="post"  target="submitFrame">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <!--<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>-->
                <div style="margin-left:10px;">
                           <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                           	<s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
					id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                		<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
					listKey="id" listValue="name"  name="_DATA_AUTH"
					id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   		</s:else>
                		</s:if>	
                	</div>
			    <div class="optn">
			        <button type="button" onclick="addGloble_s3()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 450px;">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c3a183e393ea4dfabb15712f9dba1873" type="add" />
	<table class="basic-table" >
	
	<input type="hidden" name="formIds" value="c3a183e393ea4dfabb15712f9dba1873" />
	<input type="hidden" name="c3a183e393ea4dfabb15712f9dba1873" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="_cfi_item_type" id="_cfi_item_type"/> 
	<input type="hidden" name="_cfi_mt_type" id="_cfi_mt_type"/>
	
	<input type="hidden" name="STORAGE_CODES" id="STORAGE_CODES"/>
	<input type="hidden" name="WH_CODES" id="WH_CODES"/>
	
		<s:set name="_$viewId" value="'bc00c4cebe524beaba8ba3ccc5f1e29b'" />
		<s:set name="_$formId_1" value="'c3a183e393ea4dfabb15712f9dba1873'" />
		<s:set name="_$type" value="'add'" />
	  
	 	<!--1-->
		<tr>
		   	<td class="name" style="width:85px;"/><bu:uitn colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ADDWAY" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		  
		   	<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_FIX_SN" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		  
		    	<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_COUNT" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		
		<!--2-->
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ITEM_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
	
		    	<td class="name" /><bu:uitn colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_INSTOCK_DOC" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		  
		    	<td class="name" /><span class="dot">*</span><bu:uitn colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_SUPPLIER_CODE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		
		
		<!--3-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ITEM_TYPE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" readonly="readonly" style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ASSISTANTTOOLNAME" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		 
		    	<td class="name" /><bu:uitn colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873"  colspan="7"><bu:ui colNo="CFI_ASSISTANTTOOLSPEC" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		
		<!--4-->
		<tr>
			<td class="name"  /><bu:uitn colNo="CFI_MAX_USAGE"  formId="c3a183e393ea4dfabb15712f9dba1873" style="text-align:center;"  /></td>
			<bu:td cssClass="dec" colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MAX_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
	     	
	     		<td class="name" /><bu:uitn colNo="CFI_CYCLE_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_CYCLE_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_CYCLE_REMIND" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" readonly="readonly" style="width:200px;"/></bu:td>
	    	
	    		<td class="name" /><bu:uitn colNo="CFI_REMIND_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_REMIND_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_REMIND_CYCLE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" readonly="readonly"  style="width:200px;"/></bu:td>
		</tr>
		<!--5-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_PERIOD_LIMIT" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_PERIOD_LIMIT" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_PERIOD_LIMIT" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" readonly="readonly" style="width:200px;"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="CFI_UPKEEP_PERIOD" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_UPKEEP_PERIOD" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_UPKEEP_PERIOD" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" readonly="readonly" style="width:200px;"/></bu:td>
		 
		    	<td class="name" /><bu:uitn colNo="CFI_REMIND_DAY" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_REMIND_DAY" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_REMIND_DAY" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" readonly="readonly" style="width:200px;"/></bu:td>
		</tr>
		<!--6-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_TOTAL_USAGE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		  
		    	<td class="name" /><bu:uitn colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_LEFT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
	     	
	     		<td class="name" /><bu:uitn colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_RIGHT_TOP" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		<!--7-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_MIDDLE" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		   
		    	<td class="name" /><bu:uitn colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_LEFT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_RIGHT_LOWER" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		<!--8-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_STRAIN_DIS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_STRAIN_DIS" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_STRAIN_DIS" formId="c3a183e393ea4dfabb15712f9dba1873" readonly="readonly" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		   
		    	<td class="name" /><bu:uitn colNo="CFI_TINCKNESS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_TINCKNESS" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_TINCKNESS" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
			
			<td class="name" /><bu:uitn colNo="CFI_FLATNESS" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_FLATNESS" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_FLATNESS" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		<!--9-->
		<tr>		
            <td class="name" /><bu:uitn colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			    <bu:td cssClass="dec" colNo="CFI_STOCK_SN" formId="c3a183e393ea4dfabb15712f9dba1873" > 
			    		<div class="_tree" onClick="showTree(this,event)">
			    		    <input type="text" id="STORAGE_NAME" name="STORAGE_NAME" readonly="readonly" placeholder="点击弹出">
			    		    <input type="hidden" id="STORAGE_CODE" name="STORAGE_CODE">
			    		    <input type="hidden" id="WH_CODE" name="WH_CODE">
                			<div id="index_tree" class="ztree" style="display: none;"></div>
			    		</div>
			    
			</bu:td>

		    <td class="name" /><bu:uitn colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" ><bu:ui colNo="CFI_ROHS_FLAG" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1"/></bu:td>
		</tr>
		<!--10-->
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" /></td>
			<bu:td cssClass="dec" colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" colspan="7"><bu:ui colNo="CFI_MEMO" formId="c3a183e393ea4dfabb15712f9dba1873" dataId="${dataId}" formIndex="1" style="height:80px;width:100%"/></bu:td>
	    	</tr>
		
	 
		 
	</table>
			<bu:jsVal formId="c3a183e393ea4dfabb15712f9dba1873" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<bu:submit viewId="bc00c4cebe524beaba8ba3ccc5f1e29b" />
	<bu:script viewId="bc00c4cebe524beaba8ba3ccc5f1e29b" />
	
<script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>	
<script type="text/javascript">
 var setting = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        }			
                },
                callback: {
                        onClick: zTreeOnclick
                },
                async: {
            enable: true,
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=848f9f24f8544ea8a4a1be288cfa9274",
            autoParam: ["id"],
            otherParam: {"dataAuth":"${sessionScope.mcDataAuth}"},
            //otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
            dataFilter: ajaxDataFilter
        }
            }
            /*
            function zTreeOnclick(event,treeId,treeNode){
                //不是库位
                if(treeNode.AREA_TYPE!=3){
                    //alert(treeNode.AREA_TYPE);
                    utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择库位" />",0,"260","");
                    return false;
                }else{
                    $("#STORAGE_NAME").val(treeNode.name);
                    $("#STORAGE_CODE").val(treeNode.id);
                    $("#WH_CODE").val(getCurrentRoot(treeNode));
                }
                  // alert(getCurrentRoot(treeNode));
            }
            function ajaxDataFilter(treeId,parentNode,responseDate){
                var data = responseDate.ajaxList;
                $.each(data,function(i,v){
            v["isParent"] = true;
        });
                return data;
            }
            //获取当前节点的根节点(treeNode为当前节点)  
            function getCurrentRoot(treeNode){  
               if(treeNode.getParentNode()!=null){    
                  var parentNode = treeNode.getParentNode();    
                  return getCurrentRoot(parentNode);    
               }else{    
                  return treeNode.id;   
               }  
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

    //点空白处隐藏选项
    $(document).click(function () {
        $("._tree .ztree").css('display','none');
    });    	
    	$(function(){
    	    $.fn.zTree.init($("#index_tree"),setting);
    	})
    	
    	*/
    	  function zTreeOnclick(event,treeId,treeNode){
        //不是库位
        if(treeNode.AREA_TYPE!=3){
            //alert(treeNode.AREA_TYPE);
            utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择库位" />",0,"260","");
            return false;
        }else{
            $("#STORAGE_NAME").val(treeNode.name);
            $("#STORAGE_CODE").val(treeNode.id);
            $("#WH_CODE").val(getCurrentRoot(treeNode));
        }
          // alert(getCurrentRoot(treeNode));
    }		

    function ajaxDataFilter(treeId,parentNode,responseDate){
        var data = responseDate.ajaxList;
        $.each(data,function(i,v){
            v["isParent"] = true;
        });
        return data;
    }
    
    //获取当前节点的根节点(treeNode为当前节点)  
    function getCurrentRoot(treeNode){  
       if(treeNode.getParentNode()!=null){    
          var parentNode = treeNode.getParentNode();    
          return getCurrentRoot(parentNode);    
       }else{    
          return treeNode.id;   
       }  
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

    //点空白处隐藏选项
    $(document).click(function () {
        $("._tree .ztree").css('display','none');
    });    		
	
	$(function(){
	    $.fn.zTree.init($("#index_tree"),setting);
	})
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
      		
      		$("#paraMap1_CFI_CYCLE_REMIND").addClass("readonly"); 	
      
      		$("#paraMap1_CFI_REMIND_CYCLE").addClass("readonly"); 	
      
     		 $("#paraMap1_CFI_PERIOD_LIMIT").addClass("readonly");
      		
      		$("#paraMap1_CFI_UPKEEP_PERIOD").addClass("readonly"); 	
      
      		$("#paraMap1_CFI_REMIND_DAY").addClass("readonly"); 
      
      		$("#paraMap1_CFI_ASSISTANTTOOLNAME").removeAttr("disabled"); 
			$("#paraMap1_CFI_COUNT").removeAttr("disabled"); 
			
      
		   $("#paraMap1_CFI_ASSISTANTTOOLNAME").removeAttr("disabled"); 
			$("#paraMap1_CFI_COUNT").removeAttr("disabled"); 
			
			
			$("#paraMap1_CFI_ITEM_TYPE").attr("readonly","readonly"); 
			$("#paraMap1_CFI_ITEM_TYPE").addClass("readonly");
			
			$("#paraMap1_CFI_ASSISTANTTOOLNAME").attr("readonly","readonly"); 
			$("#paraMap1_CFI_ASSISTANTTOOLNAME").addClass("readonly");  
			
			
			$("#paraMap1_CFI_ASSISTANTTOOLSPEC").attr("readonly","readonly"); 
			$("#paraMap1_CFI_ASSISTANTTOOLSPEC").addClass("readonly");
 
			$("#paraMap1_CFI_MAX_USAGE").attr("readonly","readonly"); 
			$("#paraMap1_CFI_MAX_USAGE").addClass("readonly");
			
			$("#paraMap1_CFI_MT_VAULE").attr("readonly","readonly"); 
			$("#paraMap1_CFI_MT_VAULE").addClass("readonly");
			
			$("#paraMap1_CFI_MT_REMIND").attr("readonly","readonly"); 
			$("#paraMap1_CFI_MT_REMIND").addClass("readonly"); 
			
			$("#paraMap1_CFI_COUNT").attr("disabled","disabled"); 
			$("#paraMap1_CFI_COUNT").addClass("readonly"); 
			
			$("#paraMap1_CFI_MT_TYPE").addAttr("disabled");
			 
			$("#paraMap1_CFI_TOTAL_USAGE").val("0");
       				
      			
      
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法

	
	
	 $("#paraMap1_CFI_ADDWAY").change(function(){
            if($(this).val()==1){
                 $("#paraMap1_CFI_COUNT").val("");
               
            	$("#paraMap1_CFI_COUNT").attr("disabled","disabled"); 
            	$("#paraMap1_CFI_COUNT").addClass("readonly");
            	
            	$("#paraMap1_CFI_FIX_SN").addClass("_VAL_NULL");
            	$("#paraMap1_CFI_FIX_SN").removeAttr("readonly"); 
            	$("#paraMap1_CFI_FIX_SN").removeClass("readonly");
           }else{
                $("#paraMap1_CFI_FIX_SN").val("");
                
             	$("#paraMap1_CFI_COUNT").removeAttr("disabled"); 
            	$("#paraMap1_CFI_COUNT").removeClass("readonly");
            	
            	$("#paraMap1_CFI_FIX_SN").attr("readonly","readonly"); 
            	$("#paraMap1_CFI_FIX_SN").addClass("readonly");
            	$("#paraMap1_CFI_FIX_SN").removeClass("_VAL_NULL");
            	
           }
       });  
       
	 
       $('#paraMap1_CFI_TOTAL_USAGE').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_TOTAL_USAGE");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_TOTAL_USAGE'),"<dict:lang value="该项只能为数字" />");
             }
         });
       
       
       
       
       	
	$('#paraMap1_CFI_LEFT_TOP').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_LEFT_TOP");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_LEFT_TOP'),"<dict:lang value="该项只能为正整数" />");
             }
         });
		
		$('#paraMap1_CFI_RIGHT_TOP').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_RIGHT_TOP");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_RIGHT_TOP'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
         $('#paraMap1_CFI_MIDDLE').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_MIDDLE");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_MIDDLE'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
         $('#paraMap1_CFI_LEFT_LOWER').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_LEFT_LOWER");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_LEFT_LOWER'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
         $('#paraMap1_CFI_RIGHT_LOWER').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_RIGHT_LOWER");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_RIGHT_LOWER'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         /*
         $('#paraMap1_CFI_TINCKNESS').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_TINCKNESS");
             if( ! /^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_TINCKNESS'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         */
         $('#paraMap1_CFI_TINCKNESS').bind('keyup', function () {
	            var calwStart=$("#paraMap1_CFI_TINCKNESS");
	     
               var reg = new RegExp(/^\d+\.[0-9]{2}/);
         
             if(!/^[0-9]+(.[0-9]{0,2})?$/.test(this.value)){
               
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_TINCKNESS'),"<dict:lang value="只能输入有两位小数的正实数" />");//只能输入有两位小数的正实数
             }
         });
         
         
         
         $('#paraMap1_CFI_FLATNESS').bind('keyup', function () {
	var calwStart=$("#paraMap1_CFI_FLATNESS");
             if( !/^[0-9]+(.[0-9]{0,2})?$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CFI_FLATNESS'),"<dict:lang value="只能输入有两位小数的正实数" />");
             }
         });
         
         
         
         
		
		
		
 
	
$('#paraMap1_CFI_COUNT').bind('keyup', function () {
 
  if( ! /^(1)$|^100$|^[1-9][0-9]?$/.test(this.value)){
 
             	this.value='';
   
             	_alertValMsg($('#paraMap1_CFI_COUNT'),"<dict:lang value="该项只能为小于100的数字" />");
             }
 
         });
       
       
       
       
       
       
	 function equal_3(){
		 	$("#paraMap1_CFI_LEFT_TOP").attr("readonly","readonly"); $("#paraMap1_CFI_LEFT_TOP").val(0);
            $("#paraMap1_CFI_RIGHT_TOP").attr("readonly","readonly"); $("#paraMap1_CFI_RIGHT_TOP").val(0);
            $("#paraMap1_CFI_MIDDLE").attr("readonly","readonly");  $("#paraMap1_CFI_MIDDLE").val(0);
            $("#paraMap1_CFI_LEFT_LOWER").attr("readonly","readonly"); $("#paraMap1_CFI_LEFT_LOWER").val(0);
            $("#paraMap1_CFI_RIGHT_LOWER").attr("readonly","readonly"); $("#paraMap1_CFI_RIGHT_LOWER").val(0);$("#paraMap1_CFI_TOTAL_USAGE").val("0");
             $("#paraMap1_CFI_TINCKNESS").val(0);$("#paraMap1_CFI_FLATNESS").val(0);
             $("#paraMap1_CFI_STRAIN_DIS").val(0);
		 }
		 
	function equal_2(){
		 	$("#paraMap1_CFI_LEFT_TOP").removeAttr("readonly");  $("#paraMap1_CFI_LEFT_TOP").val(0);
            $("#paraMap1_CFI_RIGHT_TOP").removeAttr("readonly");$("#paraMap1_CFI_RIGHT_TOP").val(0)
            $("#paraMap1_CFI_MIDDLE").removeAttr("readonly"); $("#paraMap1_CFI_MIDDLE").val(0);
            $("#paraMap1_CFI_LEFT_LOWER").removeAttr("readonly"); $("#paraMap1_CFI_LEFT_LOWER").val(0);
            $("#paraMap1_CFI_RIGHT_LOWER").removeAttr("readonly");$("#paraMap1_CFI_RIGHT_LOWER").val(0);$("#paraMap1_CFI_TOTAL_USAGE").val("0");
            $("#paraMap1_CFI_TINCKNESS").val(0);$("#paraMap1_CFI_FLATNESS").val(0);
		 }
		 
		 function addGloble_s3(){
		 
		  	$('#WH_CODES').val($('#WH_CODE').val());
            $('#STORAGE_CODES').val($('#STORAGE_CODE').val());
        
            $("#paraMap1_CFI_SUPPLIER_CODE_SHOW").addClass('_VAL_NULL');
            $("#_cfi_mt_type").val($("#paraMap1_CFI_MT_TYPE").val());
             
            if($("#paraMap1_CFI_ADDWAY").val()==1){//个体   
            $("#paraMap1_CFI_COUNT").removeClass("_VAL_NULL");
            $("#paraMap1_CFI_FIX_SN").addClass("_VAL_NULL");
            
            }else{
            $("#paraMap1_CFI_FIX_SN").val("");
            $("#paraMap1_CFI_COUNT").addClass("_VAL_NULL"); 
            $("#paraMap1_CFI_FIX_SN").removeClass("_VAL_NULL");
            
            }
            if(!val.valNullData()){ 
                       return ;
            }
       
            if(!valData()){
    				return ;
    			}
    		if(!val.valDataBaseSetData()){
		        return ;
	       	}
     
           if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
        	$("#addForm").append($("#isCloseWin").clone());
        	$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
           }
        
        
           document.forms.addForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=ec70aa7d2e354788b369961970cea670"; 
           document.forms.addForm.submit();

}
		 
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
 