<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
		<link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    	<style>
 
        ._tree{
            width: 300px;
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
       .maskdiv{
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }
    
    
</style>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:5px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>
			    	<div class="optn">
			    	        <button type="button" onclick="editCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        				<!--	<button type="button" onclick="resetForm1();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>-->
			    </div>

			</div>
			<div class="bd"  style="height:450px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="d271588ad1ba475f92435ea46a9e7947" type="edit" />
	<table class="basic-table" >
	<input type="hidden" id="tempType" name="tempType" value="" />
	<input type="hidden" name="formIds" value="d271588ad1ba475f92435ea46a9e7947" />
	<input type="hidden" name="d271588ad1ba475f92435ea46a9e7947" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="PTC_AREA_SN" value="${param.PTC_AREA_SN}"/>
		<s:set name="_$viewId" value="'328a3d906a7e4e13b0fe26a5c79b4088'" />
		<s:set name="_$formId_1" value="'d271588ad1ba475f92435ea46a9e7947'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PTC_TYPE" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<bu:td cssClass="dec" colNo="PTC_TYPE" formId="d271588ad1ba475f92435ea46a9e7947" ><bu:ui colNo="PTC_TYPE" style="width:300px;" onchange="changeType();" formId="d271588ad1ba475f92435ea46a9e7947" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PTC_PROJECT_ID" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<bu:td cssClass="dec" colNo="PTC_PROJECT_ID" formId="d271588ad1ba475f92435ea46a9e7947" ><bu:ui colNo="PTC_PROJECT_ID" style="width:300px;" formId="d271588ad1ba475f92435ea46a9e7947" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PTC_MODEL_CODE" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<bu:td cssClass="dec" colNo="PTC_MODEL_CODE" formId="d271588ad1ba475f92435ea46a9e7947" ><bu:ui colNo="PTC_MODEL_CODE" style="width:300px;" formId="d271588ad1ba475f92435ea46a9e7947" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PTC_CUST_CODE" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<bu:td cssClass="dec" colNo="PTC_CUST_CODE" formId="d271588ad1ba475f92435ea46a9e7947" ><bu:ui colNo="PTC_CUST_CODE" style="width:300px;" formId="d271588ad1ba475f92435ea46a9e7947" dataId="${dataId}" formIndex="1" />
			<div id="maskdiv" ></div>
			</bu:td>
		</tr>
		<tr>
		
		    <td class="name" /><bu:uitn colNo="PTC_AREA_SN" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<bu:td cssClass="dec" colNo="PTC_AREA_SN" formId="d271588ad1ba475f92435ea46a9e7947" > 
			    		<div class="_tree" onClick="showTree(this,event)" >
			    		    <input type="text" id="STORAGE_NAME" name="STORAGE_NAME" readonly="readonly" placeholder="点击弹出">
			    		    <input type="hidden" id="STORAGE_CODE" name="STORAGE_CODE">
			    		    <input type="hidden" id="WH_CODE" name="WH_CODE">
                			<div id="index_tree" class="ztree" style="display: none;"></div>
			    		</div>
			    
			</bu:td>
		</tr>
		<tr style="display:none;">
		    <td class="name-four" /><span class="dot">*</span><bu:uitn colNo="PTC_AREA_SN" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<bu:td cssClass="dec-self" colNo="PTC_AREA_SN" formId="d271588ad1ba475f92435ea46a9e7947" ><bu:ui colNo="PTC_AREA_SN" formId="d271588ad1ba475f92435ea46a9e7947" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:113px;"/><span class="dot">*</span><bu:uitn colNo="PTC_SN" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<bu:td cssClass="dec" colNo="PTC_SN" formId="d271588ad1ba475f92435ea46a9e7947" ><bu:ui colNo="PTC_SN" style="width:300px;" formId="d271588ad1ba475f92435ea46a9e7947" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="d271588ad1ba475f92435ea46a9e7947" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
		<script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>	
<script type="text/javascript">
$(function(){
    $("#paraMapObj_PTC_PROJECT_ID_SHOW").attr("disabled","disabled");
    
    $("#paraMapObj_PTC_MODEL_CODE_SHOW").attr("disabled","disabled");
    
    $("#paraMapObj_PTC_CUST_CODE_SHOW").attr("disabled","disabled");
    $("#maskdiv").addClass("maskdiv");
     $("#AREA_NAME").attr("disabled","disabled");
    $("#AREA_NAME").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
    if($("#paraMapObj_PTC_PROJECT_ID").val()!=""){
        $("#STORAGE_NAME").css("background-color","#ebebe4");
        $("#paraMapObj_PTC_PROJECT_ID_SHOW").removeAttr("disabled");
        $("#paraMapObj_PTC_MODEL_CODE_SHOW").css("background-color","#ebebe4");
        $("#paraMapObj_PTC_TYPE").val("1");
        $("#paraMapObj_PTC_TYPE").trigger("chosen:updated");
        $("#paraMapObj_PTC_PROJECT_ID_SHOW").attr("class","input _VAL_NULL isSubmit  _VAL_OjbsData _VAL_DATABASE ico-search-input");
        $("#tempType").val("1")
    }
    if($("#paraMapObj_PTC_MODEL_CODE").val()!=""){
        $("#STORAGE_NAME").css("background-color","#ebebe4");
        $("#paraMapObj_PTC_MODEL_CODE_SHOW").removeAttr("disabled");
        $("#paraMapObj_PTC_PROJECT_ID_SHOW").css("background-color","#ebebe4");
        $("#paraMapObj_PTC_TYPE").val("2");
        $("#paraMapObj_PTC_TYPE").trigger("chosen:updated");
        $("#paraMapObj_PTC_MODEL_CODE_SHOW").attr("class","input _VAL_NULL isSubmit  _VAL_OjbsData _VAL_DATABASE ico-search-input");
        $("#tempType").val("2")
    }
    if($("#paraMapObj_PTC_CUST_CODE").val()!=""){
        $("#maskdiv").removeClass("maskdiv");
        $("#STORAGE_NAME").css("background-color","#ebebe4");
        $("#paraMapObj_PTC_PROJECT_ID_SHOW").css("background-color","#ebebe4");
        $("#paraMapObj_PTC_MODEL_CODE_SHOW").css("background-color","#ebebe4");
        $("#paraMapObj_PTC_CUST_CODE_SHOW").removeAttr("disabled");
        $("#paraMapObj_PTC_TYPE").val("3");
        $("#paraMapObj_PTC_TYPE").trigger("chosen:updated");
        $("#paraMapObj_PTC_CUST_CODE_SHOW").attr("class","input _VAL_NULL isSubmit  _VAL_OjbsData _VAL_DATABASE ");
        $("#tempType").val("3")
    }
    if($("#paraMapObj_PTC_AREA_SN").val()!=""){
        $("#paraMapObj_PTC_PROJECT_ID_SHOW").css("background-color","#ebebe4");
        $("#paraMapObj_PTC_MODEL_CODE_SHOW").css("background-color","#ebebe4");    
        $("#AREA_NAME").removeAttr("disabled");
        $("#STORAGE_CODE").val($("#paraMapObj_PTC_AREA_SN").val());
        $("#paraMapObj_PTC_TYPE").val("4");
        $("#paraMapObj_PTC_TYPE").trigger("chosen:updated");
        getAreaName();
        $("#AREA_NAME").attr("class"," input isSubmit _VAL_NULL  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        $("#tempType").val("4");
        
    }
    if($("#paraMapObj_PTC_TYPE").val() == "4"){
                 changeType();
     }
   
    
})
        var curStatus = "init";
         var curAsyncCount = 0;
         var goAsync = false;
function getAreaName(){
    var CEI_AREA_SN =$("#paraMapObj_PTC_AREA_SN").val();
    $.ajax({
        type:"post",
        dataType:"json",
        data:"type=2&CEI_AREA_SN="+CEI_AREA_SN,
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=0f0c6951cd85418ab4527a5c9b06ef55",
        success:function(data){
            if(null==data){
                return;
            }
            if(null!=data.ajaxList){
                
                var list =  eval(data.ajaxList);
               // if(null==list[0].WA_AREA_NAME) list[0].WA_AREA_NAME="";
                $("#STORAGE_NAME").val(list[0].CA_NAME);
              
            }
           getArea();
        },
        error:function(msg){
            	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
    })
}
function getArea(){
    		
            
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
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=7a143bc30c9c4989be65d3138d51a9c5&type=1",
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
            $.fn.zTree.init($("#index_tree"),setting);
        
        
        
    }
    
    	 //获取下拉树
    function getAreaSn(){
          var typeVal = $("#paraMapObj_PTC_TYPE").val();
        if(typeVal=="4"){
            $("#STORAGE_NAME").removeAttr("disabled");
            $("#STORAGE_NAME").attr("class"," input isSubmit _VAL_NULL  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
            $("#STORAGE_NAME").val("");
           var setting = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        }			
                },
                callback: {
                        onClick: zTreeOnclick,
                        beforeAsync: beforeAsync,  
                        onAsyncSuccess: onAsyncSuccess
                },
                async: {
                    enable: true,
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=7a143bc30c9c4989be65d3138d51a9c5",
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
            
            $.fn.zTree.init($("#index_tree"),setting);
            setTimeout(function(){  
                expandAll("index_tree");  
            },500);
            
        }else{
             $("#STORAGE_NAME").attr("disabled","disabled");
            $("#STORAGE_NAME").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        }
        
        
    }
    
    function beforeAsync() {  
            curAsyncCount++;  
           }  
           
           function onAsyncSuccess(event, treeId, treeNode, msg) {  
            curAsyncCount--;  
            if (curStatus == "expand") {  
                expandNodes(treeNode.children);  
            } else if (curStatus == "async") {  
                asyncNodes(treeNode.children);  
            }  

            if (curAsyncCount <= 0) {  
                curStatus = "";  
            }
            //tree数据回显示
            if($("#paraMapObj_PTC_TYPE").val() == "4"){
                selectNode();
            }
        
            
        }
        //选中节点数据回显示
        function selectNode () {
         
          var PTC_AREA_SN1 = $("#PTC_AREA_SN").val();
          var treeObj = $.fn.zTree.getZTreeObj("index_tree");//ztree树的ID
            var node = treeObj.getNodeByParam("id",PTC_AREA_SN1);//根据ID找到该节点
            treeObj.selectNode(node);//根据该节点选中
            $("#STORAGE_NAME").val(node.name);
            $("#STORAGE_CODE").val(node.id);
        };
        
        //展开所有节点
        function expandAll() {  
            if (!check()) {  
                return;  
            }  
            var zTree = $.fn.zTree.getZTreeObj("index_tree");  
            expandNodes(zTree.getNodes());
            
            if (!goAsync) {  
                curStatus = "";  
            }  
        }  
                function expandNodes(nodes) {  
            if (!nodes) return;  
            curStatus = "expand";  
            var zTree = $.fn.zTree.getZTreeObj("index_tree");  
            for (var i=0, l=nodes.length; i<l; i++) {  
                zTree.expandNode(nodes[i], true, false, false);//展开节点就会调用后台查询子节点  
                if (nodes[i].isParent && nodes[i].zAsync) {  
                    expandNodes(nodes[i].children);//递归  
                } else {  
                    goAsync = true;  
                }  
            }  
        }  

        function check() {  
            if (curAsyncCount > 0) {  
                return false;  
            }  
            return true;  
        }  
        
        
            function zTreeOnclick(event,treeId,treeNode){
                
                //不是库位
                if(treeNode.AREA_TYPE!=1){
                    //alert(treeNode.AREA_TYPE);
                    utilsFp.confirmIcon(3,"","","", "<dict:lang value="请选择线别" />",0,"260","");
                    return false;
                }else{
                    $("#STORAGE_NAME").val(treeNode.name);
                    $("#STORAGE_CODE").val(treeNode.id);
                    $("#WH_CODE").val(getCurrentRoot(treeNode));
                }
                   //alert(getCurrentRoot(treeNode));
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
	  var typeVal = $("#paraMapObj_PTC_TYPE").val();
        if(typeVal=="4"){
            $(elem).find('.ztree').css('display','block');
        //阻止事件冒泡
        var e = arguments.callee.caller.arguments[0]||event; 
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else if (window.event) {
            window.event.cancelBubble = true;
        }
            
        }
        
        
    }

    //点空白处隐藏选项
    $(document).click(function () {
        $("._tree .ztree").css('display','none');
    });    	
	$(function(){
	    
	})
//重置   
function resetForm1(){
        $("#editForm")[0].reset();
        $("#paraMapObj_PTC_TYPE").val($("#tempType").val());
        $(".dept_select").trigger("chosen:updated");
        
}
        function changeType(){
    	    var typeVal = $("#paraMapObj_PTC_TYPE").val();
    	    if(typeVal==""){
                $("#paraMapObj_PTC_PROJECT_ID_SHOW").css("background-color","#ebebe4");
                $("#paraMapObj_PTC_MODEL_CODE_SHOW").css("background-color","#ebebe4");
                $("#STORAGE_NAME").css("background-color","#ebebe4");   	    
    	        $("#paraMapObj_PTC_PROJECT_ID_SHOW").attr("disabled","disabled");
    	        $("#paraMapObj_PTC_PROJECT_ID").val("");
    	        $("#paraMapObj_PTC_PROJECT_ID_SHOW").val("");
    	        $("#paraMapObj_PTC_MODEL_CODE_SHOW").attr("disabled","disabled");
    	        $("#paraMapObj_PTC_MODEL_CODE").val("");
    	        $("#paraMapObj_PTC_MODEL_CODE_SHOW").val("");
    	        $("#paraMapObj_PTC_CUST_CODE_SHOW").attr("disabled","disabled");
    	        $("#maskdiv").addClass("maskdiv");
    	        $("#paraMapObj_PTC_CUST_CODE").val("");
    	        $("#paraMapObj_PTC_CUST_CODE_SHOW").val("");
    	        $("#paraMapObj_PTC_SN").val("");
				$("#paraMapObj_PTC_SN_SHOW").val("");
				$("#STORAGE_NAME").attr("disabled","disabled");
                $("#STORAGE_NAME").attr("class","input  isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
			    $("#STORAGE_NAME").val("");
                    $("#STORAGE_CODE").val("");
                    $("#WH_CODE").val("");
    	    }else if(typeVal=="1"){ //工单
                $("#paraMapObj_PTC_PROJECT_ID_SHOW").css("background-color","");
                $("#paraMapObj_PTC_MODEL_CODE_SHOW").css("background-color","#ebebe4");
                $("#STORAGE_NAME").css("background-color","#ebebe4");      	    
    	        $("#paraMapObj_PTC_PROJECT_ID_SHOW").removeAttr("disabled");
    	        $("#paraMapObj_PTC_PROJECT_ID_SHOW").attr("class","input _VAL_NULL isSubmit  _VAL_OjbsData _VAL_DATABASE ico-search-input");
    	        $("#paraMapObj_PTC_MODEL_CODE_SHOW").attr("disabled","disabled");
    	        $("#paraMapObj_PTC_MODEL_CODE").val("");
    	        $("#paraMapObj_PTC_MODEL_CODE_SHOW").val("");
    	        $("#paraMapObj_PTC_CUST_CODE_SHOW").attr("disabled","disabled");
    	        $("#maskdiv").addClass("maskdiv");
    	        $("#paraMapObj_PTC_CUST_CODE").val("");
    	        $("#paraMapObj_PTC_CUST_CODE_SHOW").val("");
    	        $("#paraMapObj_PTC_SN").val("");
				$("#paraMapObj_PTC_SN_SHOW").val("");
				$("#STORAGE_NAME").attr("disabled","disabled");
                $("#STORAGE_NAME").attr("class","input  isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
			    $("#STORAGE_NAME").val("");
                    $("#STORAGE_CODE").val("");
                    $("#WH_CODE").val("");
    	    }else if(typeVal=="2"){ //机种
                $("#paraMapObj_PTC_PROJECT_ID_SHOW").css("background-color","#ebebe4");
                $("#paraMapObj_PTC_MODEL_CODE_SHOW").css("background-color","");
                $("#STORAGE_NAME").css("background-color","#ebebe4");      	    
    	        $("#paraMapObj_PTC_PROJECT_ID_SHOW").attr("disabled","disabled");
    	        $("#paraMapObj_PTC_PROJECT_ID").val("");
    	        $("#paraMapObj_PTC_PROJECT_ID_SHOW").val("");
    	        $("#paraMapObj_PTC_MODEL_CODE_SHOW").removeAttr("disabled");
    	        $("#paraMapObj_PTC_MODEL_CODE_SHOW").attr("class","input _VAL_NULL isSubmit  _VAL_OjbsData _VAL_DATABASE ico-search-input");
    	        $("#paraMapObj_PTC_CUST_CODE_SHOW").attr("disabled","disabled");
    	        $("#maskdiv").addClass("maskdiv");
    	        $("#paraMapObj_PTC_CUST_CODE").val("");
    	        $("#paraMapObj_PTC_CUST_CODE_SHOW").val("");
    	        $("#paraMapObj_PTC_SN").val("");
				$("#paraMapObj_PTC_SN_SHOW").val("");
				$("#STORAGE_NAME").attr("disabled","disabled");
                $("#STORAGE_NAME").attr("class","input  isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
			    $("#STORAGE_NAME").val("");
                    $("#STORAGE_CODE").val("");
                    $("#WH_CODE").val("");
    	    }else if(typeVal=="3"){ //客户
                $("#paraMapObj_PTC_PROJECT_ID_SHOW").css("background-color","#ebebe4");
                $("#paraMapObj_PTC_MODEL_CODE_SHOW").css("background-color","#ebebe4");
                $("#STORAGE_NAME").css("background-color","#ebebe4");      	    
    	        $("#paraMapObj_PTC_PROJECT_ID_SHOW").attr("disabled","disabled");
    	        $("#paraMapObj_PTC_PROJECT_ID").val("");
    	        $("#paraMapObj_PTC_PROJECT_ID_SHOW").val("");
    	        $("#paraMapObj_PTC_MODEL_CODE_SHOW").attr("disabled","disabled");
    	        $("#paraMapObj_PTC_MODEL_CODE").val("");
    	        $("#paraMapObj_PTC_MODEL_CODE_SHOW").val("");
    	        $("#paraMapObj_PTC_CUST_CODE_SHOW").removeAttr("disabled");
    	        $("#maskdiv").removeClass("maskdiv");
    	        $("#paraMapObj_PTC_CUST_CODE_SHOW").attr("class","input _VAL_NULL isSubmit  _VAL_OjbsData _VAL_DATABASE ");
    	        $("#paraMapObj_PTC_SN").val("");
				$("#paraMapObj_PTC_SN_SHOW").val("");
				$("#STORAGE_NAME").attr("disabled","disabled");
                $("#STORAGE_NAME").attr("class","input  isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
			    $("#STORAGE_NAME").val("");
                    $("#STORAGE_CODE").val("");
                    $("#WH_CODE").val("");
    	    }else if(typeVal=="4"){
                $("#paraMapObj_PTC_PROJECT_ID_SHOW").css("background-color","#ebebe4");
                $("#paraMapObj_PTC_MODEL_CODE_SHOW").css("background-color","#ebebe4");
                $("#STORAGE_NAME").css("background-color","");     	    
    	        $("#STORAGE_NAME").removeAttr("disabled");
                $("#STORAGE_NAME").attr("class"," input isSubmit _VAL_NULL  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
                $("#paraMapObj_PTC_PROJECT_ID_SHOW").attr("disabled","disabled");
             $("#paraMapObj_PTC_CUST_CODE_SHOW").attr("disabled","disabled");
             $("#maskdiv").addClass("maskdiv");
              $("#paraMapObj_PTC_MODEL_CODE_SHOW").attr("disabled","disabled");
              $("#paraMapObj_PTC_PROJECT_ID_SHOW").val("");
               $("#paraMapObj_PTC_PROJECT_ID").val("");
                $("#paraMapObj_PTC_MODEL_CODE").val("");
    	        $("#paraMapObj_PTC_MODEL_CODE_SHOW").val("");
    	         $("#paraMapObj_PTC_CUST_CODE").val("");
    	        $("#paraMapObj_PTC_CUST_CODE_SHOW").val("");
    	       //$.fn.zTree.init($("#index_tree"),setting);
    	        getAreaSn();
    	    }
    	    
    	    
    	}
    	//根据选择的值获取策略代码
    	function getTacticsCode(){
    	    var checkVal;
    	    var typeVal = $("#paraMapObj_PTC_TYPE").val();
    	    if(typeVal==""){
    	        checkVal = "";
    	    }else if(typeVal=="1"){
    	        checkVal = $("#paraMapObj_PTC_PROJECT_ID").val();
    	    }else if(typeVal=="2"){
    	        checkVal = $("#paraMapObj_PTC_MODEL_CODE").val();
    	    }else if(typeVal=="3"){
    	        checkVal = $("#paraMapObj_PTC_CUST_CODE").val();
    	    }
    	    
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=812f896f48b042e0a54ad80f65ca7e50",
			    data: {
			        checkVal: checkVal
			    },
				success: function(data){
						if(data.ajaxMap!=null){
							$("#paraMapObj_PTC_SN").val(data.ajaxMap.PTC_SN);
							$("#paraMapObj_PTC_SN_SHOW").val(data.ajaxMap.PTC_SN);
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
    	}
    	function editCal(){
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
            var storageName = $("#STORAGE_CODE").val();
          document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=8a173f1e1a18450fba0f1067de52f44b&storageName="+storageName+"&type=edit";
          document.forms.editForm.submit();
          changeType();
        }
</script>
	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
