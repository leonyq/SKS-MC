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
            width: 230px;
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
            height:157px;
        }
    
</style>
<script>

function saveInfo(){
	
	    $('#WH_CODES').val($('#WH_CODE').val());
        $('#STORAGE_CODES').val($('#STORAGE_CODE').val());
        
        if($("#paraMap1_WSI_ADD_TYPE").val()==1){//个体   
           
            $("#paraMap1_WSI_ITEM_SN").addClass("_VAL_NULL");
            
            }else{
            $("#paraMap1_WSI_ITEM_SN").val("");
          
            $("#paraMap1_WSI_ITEM_SN").removeClass("_VAL_NULL");
            
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
        if($("#deptLs_data_auth").val()==""){
            _alertValMsg($("#deptLs_data_auth_chosen"), "<dict:lang value="该项不能为空" />");
	    	return;
        }
	    var addType=$("#paraMap1_WSI_ADD_TYPE").val();
	    if(addType==""){
	        _alertValMsg($("#paraMap1_WSI_ADD_TYPE_chosen"), "<dict:lang value="该项不能为空" />");
	    	return;
	    }else{
	        if(addType=="1"){
	            if($("#paraMap1_WSI_ITEM_SN").val()==""){
    	            _alertValMsg($("#paraMap1_WSI_ITEM_SN"), "<dict:lang value="该项不能为空" />");
    	    	    return;	
    	    	}
    	    	if($("#paraMap1_WSI_ITEM_CODE").val()==""){
    	            _alertValMsg($("#paraMap1_WSI_ITEM_CODE_SHOW"), "<dict:lang value="该项不能为空" />");
    	    	    return;		
    	    	}
	        }else if(addType=="2"){
	            if($("#paraMap1_WSI_ITEM_CODE").val()==""){
    	            _alertValMsg($("#paraMap1_WSI_ITEM_CODE_SHOW"), "<dict:lang value="该项不能为空" />");
    	    	    return;		
    	    	}
	        }
	    }
	    if($("#paraMap1_WSI_ITEM_NUM").val()==""){
	        _alertValMsg($("#paraMap1_WSI_ITEM_NUM"), "<dict:lang value="该项不能为空" />");
	    	return;
	    }else{
	        if(!/^\+?[1-9][0-9]*$/.test($("#paraMap1_WSI_ITEM_NUM").val())) {
				_alertValMsg($('#paraMap1_WSI_ITEM_NUM'), "<dict:lang value="该项只能为正整数" />");
				return;
			}
	    }
                        
        $("#addType").val(addType);
        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=9d33c4e4cfdb45fda6861f3c124879d5";
        document.forms.addForm.submit();
	}
</script>
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
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
			        <button type="button" onclick="saveInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height: 264px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ad49e8673c8d474d9f926b899bed9a9d" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ad49e8673c8d474d9f926b899bed9a9d" />
	<input type="hidden" name="ad49e8673c8d474d9f926b899bed9a9d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="addType" id="addType" value="" />
	<input type="hidden" name="STORAGE_CODES" id="STORAGE_CODES"/>
	<input type="hidden" name="WH_CODES" id="WH_CODES"/>
			
		<s:set name="_$viewId" value="'2185505765234324b1e14570d4a3175b'" />
		<s:set name="_$formId_1" value="'ad49e8673c8d474d9f926b899bed9a9d'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td  class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="WSI_ADD_TYPE" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td style="width:230px;" cssClass="dec" colNo="WSI_ADD_TYPE" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_ADD_TYPE" formId="ad49e8673c8d474d9f926b899bed9a9d" value="%{WSI_ADD_TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td  class="name" style="width:68px;" /><span class="dot">*</span><bu:uitn colNo="WSI_ITEM_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td style="width:230px;" cssClass="dec"  colNo="WSI_ITEM_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_ITEM_SN" disabled="" formId="ad49e8673c8d474d9f926b899bed9a9d" value="%{WSI_ITEM_SN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td  class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="WSI_ITEM_CODE" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td style="width:230px;" cssClass="dec" colNo="WSI_ITEM_CODE" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_ITEM_CODE" disabled="" formId="ad49e8673c8d474d9f926b899bed9a9d" value="%{WSI_ITEM_CODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td  class="name" style="width:68px;" /><span class="dot">*</span><bu:uitn colNo="WSI_ITEM_NUM" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td style="width:230px;" cssClass="dec"  colNo="WSI_ITEM_NUM" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_ITEM_NUM" formId="ad49e8673c8d474d9f926b899bed9a9d" value="%{WSI_ITEM_NUM}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td  class="name" style="width:68px;"/><bu:uitn colNo="WSI_ITEM_NAME" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td  colNo="WSI_ITEM_NAME" cssClass="dec" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_ITEM_NAME" formId="ad49e8673c8d474d9f926b899bed9a9d" value="%{WSI_ITEM_NAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" style="width:68px;"/><bu:uitn colNo="WSI_ITEM_SPEC" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td  colNo="WSI_ITEM_SPEC" cssClass="dec" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_ITEM_SPEC" formId="ad49e8673c8d474d9f926b899bed9a9d" value="%{WSI_ITEM_SPEC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td  class="name" style="width:68px;"/><bu:uitn colNo="WSI_PRODUCE_DATE" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td  colNo="WSI_PRODUCE_DATE" cssClass="dec" formId="ad49e8673c8d474d9f926b899bed9a9d" ><bu:ui colNo="WSI_PRODUCE_DATE" formId="ad49e8673c8d474d9f926b899bed9a9d" value="%{WSI_PRODUCE_DATE}" formIndex="1" /></bu:td>
		
	    	<td class="name" colspan='2'/><bu:uitn colNo="WSI_STOCK_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td cssClass="dec" colNo="WSI_STOCK_SN" formId="ad49e8673c8d474d9f926b899bed9a9d" > 
	    		<div class="_tree" onClick="showTree1(this,event)">
	    		    <input type="text" id="STORAGE_NAME" name="STORAGE_NAME" readonly="readonly" placeholder="点击弹出">
	    		    <input type="hidden" id="STORAGE_CODE" name="STORAGE_CODE">
	    		    <input type="hidden" id="WH_CODE" name="WH_CODE">
        			<div id="index_tree" class="ztree" style="display: none;"></div>
	    		</div>
			</bu:td>
		
		</tr>
		<tr>
			<td  class="name" style="width:80px;"/><bu:uitn colNo="WSI_MEMO" formId="ad49e8673c8d474d9f926b899bed9a9d" /></td>
			<bu:td  colNo="WSI_MEMO" cssClass="dec" style="height:80px;" formId="ad49e8673c8d474d9f926b899bed9a9d"  colspan="4"><bu:ui style="height:100%;width:100%" colNo="WSI_MEMO" formId="ad49e8673c8d474d9f926b899bed9a9d" value="%{WSI_MEMO}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="ad49e8673c8d474d9f926b899bed9a9d" formIndex="1" />
				
			</div>
		 </form>
	</div>
    <bu:submit viewId="2185505765234324b1e14570d4a3175b" />
	<bu:script viewId="2185505765234324b1e14570d4a3175b" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
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
                   //autoParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],	//otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],		
                  
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

    function showTree1(elem,event){
	
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
	}	
	//新增方式
	$("#paraMap1_WSI_ADD_TYPE").change(function(){
	    var addType=$(this).val();
	    if(addType==1){
	        //个体
	        $("#paraMap1_WSI_ITEM_CODE_SHOW").val("");
	        $("#paraMap1_WSI_ITEM_CODE").val("");
	        $("#paraMap1_WSI_ITEM_NAME").val("");
	        $("#paraMap1_WSI_ITEM_SPEC").val("");
	        //$("#paraMap1_WSI_ITEM_CODE_SHOW").attr("disabled",true);
	        $("#paraMap1_WSI_ITEM_SN").attr("disabled",false);
	         $("#paraMap1_WSI_ITEM_SN").removeAttr("readonly"); 
	          $("#paraMap1_WSI_ITEM_SN").removeClass("readonly");
	    }else if(addType==2){
	        //批量
	        $("#paraMap1_WSI_ITEM_SN").val("");
	        $("#paraMap1_WSI_ITEM_SN").attr("readonly","readonly"); 
            $("#paraMap1_WSI_ITEM_SN").addClass("readonly");
	        $("#paraMap1_WSI_ITEM_CODE").val("");
	        $("#paraMap1_WSI_ITEM_NAME").val("");
	        $("#paraMap1_WSI_ITEM_SPEC").val("");
	        //$("#paraMap1_WSI_ITEM_CODE_SHOW").attr("disabled",false);
	        //$("#paraMap1_WSI_ITEM_SN").attr("disabled",true);
	    }
	});
	
	//var itemCodeName=localStorage.getItem("ITEM_CODE_NAME");//工作中心名称
	//var itemCodeVal=localStorage.getItem("ITEM_CODE_VAL");//工作中心值
	//if(itemCodeName==null || itemCodeName==""){	
    //   var tempItemCodeName=$("#paraMap1_WSI_ITEM_CODE_SHOW").val();
    //    localStorage.setItem("ITEM_CODE_NAME",tempItemCodeName);
	//}else{
	//    $("#paraMap1_WSI_ITEM_CODE_SHOW").val(itemCodeName);
	//}
	//if(workStationVal==null || workStationVal==""){	
    //    var tempItemCodeVal=$("#paraMap1_WSI_ITEM_CODE").val();
    //    localStorage.setItem("ITEM_CODE_VAL",tempItemCodeVal);
	//}else{
	//    $("#paraMap1_WSI_ITEM_CODE").val(workStationVal);
	//}
	//function OnInput(){
	//   localStorage.removeItem("ITEM_CODE_VAL");
	//   localStorage.removeItem("ITEM_CODE_NAME");
 		
 	//	var tempItemCodeVal=$("#paraMap1_WSI_ITEM_CODE").val();
 	//	var tempItemCodeName=$("#paraMap1_WSI_ITEM_CODE_SHOW").val();
 		
 	//	localStorage.setItem("ITEM_CODE_NAME",tempItemCodeName);
 	//	localStorage.setItem("ITEM_CODE_VAL",tempItemCodeVal);
	//}
	</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
