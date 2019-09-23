<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
	<link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->
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
        .input{
            width:200px;
        }
    
</style>
	
</head>
<body>
	<div class="edit" >
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
			        <button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:220px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="011bf0a0f9964a5f97d9493fb3a51e1b" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="011bf0a0f9964a5f97d9493fb3a51e1b" />
	<input type="hidden" name="011bf0a0f9964a5f97d9493fb3a51e1b" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'acd36ac2371f4305b15caf72618d33ca'" />
		<s:set name="_$formId_1" value="'011bf0a0f9964a5f97d9493fb3a51e1b'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:100px;" /><span class="dot">*</span><bu:uitn colNo="CKC_SN" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_SN" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_SN" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_SN}" formIndex="1" /></bu:td>
	
			<td class="name" style="width:100px;"  /><bu:uitn colNo="CKC_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_NAME}" formIndex="1" /></bu:td>
			
			<td class="name" style="width:80px;"  /><span class="dot">*</span><bu:uitn colNo="CKC_DATA_AUTH" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_DATA_AUTH" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_DATA_AUTH" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_DATA_AUTH}" formIndex="1" /></bu:td>		
	        
			
			
		</tr>
		<tr>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="CKC_AREA_TYPE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_AREA_TYPE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_AREA_TYPE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_AREA_TYPE}" formIndex="1" onchange="getAreaSn()" /></bu:td>
		
		   
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CKC_AREA_SN" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_AREA_SN" formId="011bf0a0f9964a5f97d9493fb3a51e1b" > 
			    		<div class="_tree" onClick="showTree(this,event)">
			    		    <input type="text" id="STORAGE_NAME" name="STORAGE_NAME" readonly="readonly" placeholder="点击弹出">
			    		    <input type="hidden" id="STORAGE_CODE" name="STORAGE_CODE">
			    		    <input type="hidden" id="WH_CODE" name="WH_CODE">
                			<div id="index_tree" class="ztree" style="display: none;"></div>
			    		</div>
			</bu:td>	
            			
            <td class="name" /><bu:uitn colNo="CKC_GROUP" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_GROUP" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_GROUP" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_GROUP}" formIndex="1"  onchange="ckcGroup();" /></bu:td>
	

		
			
		</tr>
		<tr style="display:none;">
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="CKC_AREA_SN" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_AREA_SN" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_AREA_SN" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_AREA_SN}" formIndex="1" /></bu:td>
		</tr>
		<tr style="display:none;">
		    <td class="name-four" /><bu:uitn colNo="CKC_AREA_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec-self" colNo="CKC_AREA_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_AREA_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_AREA_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    	<td class="name" /><bu:uitn colNo="CKC_EMP_NO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_EMP_NO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_EMP_NO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_EMP_NO}" formIndex="1" onchange="getUserName(this)" /></bu:td>
	
		
		    <td class="name" /><bu:uitn colNo="CKC_EMP_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_EMP_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_EMP_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_EMP_NAME}" formIndex="1" /></bu:td>
		
		
		    <td class="name" /><bu:uitn colNo="CKC_GROUP_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_GROUP_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_GROUP_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_GROUP_TWO}" formIndex="1" onchange="ckcGroupTwo();" /></bu:td>
	

			
		</tr>
		
		<tr>
		    <td class="name" /><bu:uitn colNo="CKC_EMP_NO_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_EMP_NO_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_EMP_NO_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_EMP_NO_TWO}" formIndex="1" onchange="getUserName(this)" /></bu:td>
	
		    
		    <td class="name" /><bu:uitn colNo="CKC_EMP_NAME_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_EMP_NAME_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_EMP_NAME_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_EMP_NAME_TWO}" formIndex="1" /></bu:td>
		
		
		    <td class="name" /><bu:uitn colNo="CKC_GROUP_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_GROUP_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_GROUP_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_GROUP_THREE}" formIndex="1" onchange="ckcGroupThree();"  /></bu:td>
	

		
		</tr>
		
		<tr>
		    <td class="name" /><bu:uitn colNo="CKC_EMP_NO_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_EMP_NO_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_EMP_NO_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_EMP_NO_THREE}" formIndex="1" onchange="getUserName(this)" /></bu:td>
	
		
		    <td class="name" /><bu:uitn colNo="CKC_EMP_NAME_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_EMP_NAME_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_EMP_NAME_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_EMP_NAME_THREE}" formIndex="1" /></bu:td>
		
	        
	        <!--<td class="name" /><bu:uitn colNo="CKC_RESERVE_ONE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_RESERVE_ONE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_RESERVE_ONE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_RESERVE_ONE}" formIndex="1" /></bu:td>
		    	-->


		</tr>
		<!--<tr>
			<td class="name" /><bu:uitn colNo="CKC_RESERVE_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_RESERVE_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_RESERVE_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_RESERVE_TWO}" formIndex="1" /></bu:td>			
		    <td class="name" /><bu:uitn colNo="CKC_RESERVE_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<bu:td cssClass="dec" colNo="CKC_RESERVE_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" ><bu:ui colNo="CKC_RESERVE_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" value="%{CKC_RESERVE_THREE}" formIndex="1" /></bu:td>
		
		</tr>-->
		
	</table>
			<bu:jsVal formId="011bf0a0f9964a5f97d9493fb3a51e1b" formIndex="1" />
				
			</div>
		 </form>
	</div>
    
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>		
    <script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>	
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
    <script type="text/javascript">
    $(function(){
        $("#STORAGE_NAME").attr("disabled","disabled");
        $("#STORAGE_NAME").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        
        
    })
    //获取下拉树
    function getAreaSn(){
        var type = $("#paraMap1_CKC_AREA_TYPE").val();
        if(type!=""){
            $("#STORAGE_NAME").removeAttr("disabled");
            $("#STORAGE_NAME").attr("class"," input isSubmit  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
            $("#STORAGE_NAME").val("");
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
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=170b633cbae94bbe929e02f94201f0fd&type="+type,
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
            $.fn.zTree.init($("#index_tree"),setting);
            
        }else{
             $("#STORAGE_NAME").attr("disabled","disabled");
            $("#STORAGE_NAME").attr("class","input isSubmit readonly  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
        }
        
        
    }
    	//双击对数据赋值
     function zTreeOnclick(event,treeId,treeNode){
                    
                    $("#STORAGE_NAME").val(treeNode.name);
                    $("#STORAGE_CODE").val(treeNode.id);
                    $("#WH_CODE").val(getCurrentRoot(treeNode));
                    $("#paraMap1_CKC_AREA_NAME").val(treeNode.name);
                    $("#paraMap1_CKC_AREA_SN").val(treeNode.id);
                    hideMenu();
            }
            function ajaxDataFilter(treeId,parentNode,responseDate){
                	
                var data = responseDate.ajaxList;
                		
               // $.each(data,function(i,v){
              //      v["isParent"] = true;
              //  });
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
	   var type = $("#paraMap1_CKC_AREA_TYPE").val();
      console.log(type);
        if(type!=""){
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
    //选择完后隐藏下拉树
    function hideMenu() {
        $("#index_tree").fadeOut("fast");
       // $("._tree .ztree").css('display','none');
       // $("body").unbind("mousedown", onBodyDown);
    } 	
    	$(function(){
    	    
    	})  
    	function getUserName(thisObj){
    	    var id = thisObj.value;
    	    var thisId = thisObj.id;
    	    var thisObjId= thisId.split("_");
    	    
    	    console.log(thisObjId);
    	    console.log(thisObjId.length);
    	    
    	    var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=170b633cbae94bbe929e02f94201f0fd";
    	    $.ajax({
    	        type:"post",
    	        dataType:"json",
    	        data: {

                "id" : id,									
                "type" :  "3"	
                    },
    	        //"id="+id+"&type=3",
    	        url:loadItemUrl,
    	        success:function(data){
    	            var list = eval(data.ajaxList);
    	            var names = list[0].NAME;
    	            if(thisObjId.length==4){
    	                $("#paraMap1_CKC_EMP_NAME").val(names);
    	            }else{
    	                $("#paraMap1_CKC_EMP_NAME_"+thisObjId[4]).val(names);
    	            }
    	            
    	        },
    	        error:function(msg){
			    	   
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			    	    
			    	}
    	    })
    	    
    	}
    	function add(thisObj){
		 
			isQuery = false;
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
			var  storageName =$("#STORAGE_NAME").val();
			if(null==storageName||　storageName==""){
			    utilsFp.confirmIcon(3,"","","", "区域代码不能为空",0,"300","");
			     return ;
			}
			
			if(""!=$("#paraMap1_CKC_GROUP").val()){
			    if(""==$("#paraMap1_CKC_EMP_NO").val()){
			         utilsFp.confirmIcon(3,"","","", "员工不能为空",0,"300","");
			        return ;
			    }
			}
			if(""!=$("#paraMap1_CKC_GROUP_TWO").val()){
			    if(""==$("#paraMap1_CKC_EMP_NO_TWO").val()){
			         utilsFp.confirmIcon(3,"","","", "员工不能为空",0,"300","");
			        return ;
			    }
			}
			if(""!=$("#paraMap1_CKC_GROUP_THREE").val()){
			    if(""==$("#paraMap1_CKC_EMP_NO_THREE").val()){
			         utilsFp.confirmIcon(3,"","","", "员工不能为空",0,"300","");
			        return ;
			    }
			}
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
			if($("#isCloseWin").length > 0 && $("#addForm").find("#isCloseWin").length == 0){
			 
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled",true);
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
		}
		
		$('#paraMap1_CKC_SN').bind('keyup', function () {
	            var calwStart=$("#paraMap1_CKC_SN");
             if(  /[\u4E00-\u9FA5]/i.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CKC_SN'),"<dict:lang value="不能输入中文" />");
             }
         });
         
         
        
        //班别一
         function ckcGroup(){
         	if ("" != $("#paraMap1_CKC_GROUP_TWO").val() || "" != $("#paraMap1_CKC_GROUP_THREE").val()) {
	         	var start = $("#paraMap1_CKC_GROUP").find("option:selected").attr("uuid");
	         	var end = $("#paraMap1_CKC_GROUP_TWO").find("option:selected").attr("uuid");
	         	var endS = $("#paraMap1_CKC_GROUP_THREE").find("option:selected").attr("uuid");
	        	var end_err = document.getElementById("paraMap1_CKC_GROUP");
         	    if($("#paraMap1_CKC_GROUP_TWO").val() == $("#paraMap1_CKC_GROUP").val() ||　$("#paraMap1_CKC_GROUP_THREE").val() == $("#paraMap1_CKC_GROUP").val()){
         	        _alertValMsg(end_err,"<dict:lang value='班别不能相同'/>");
					$("#paraMap1_CKC_GROUP").find("option[value='']").attr("selected",true);
					$("#paraMap1_CKC_GROUP").trigger("chosen:updated");
         	    }
         	}
         
         	if("" != $("#paraMap1_CKC_GROUP").val()){
         	    $("#paraMap1_CKC_EMP_NO").removeAttr("disabled");
                $("#paraMap1_CKC_EMP_NO").attr("class"," _VAL_NULL input isSubmit _VAL_OjbsData  isaddSubmit _VAL_DATABASE IS_SELECT_FILTER dept_select");
         		$("#paraMap1_CKC_EMP_NO").trigger("chosen:updated");
            }else{
			    $("#paraMap1_CKC_EMP_NO").find("option[value='']").attr("selected",true);
         	  // $("#paraMap1_CKC_EMP_NO").attr("disabled","disabled");
                $("#paraMap1_CKC_EMP_NO").attr("class"," _VAL_NULL input isSubmit _VAL_OjbsData readonly isaddSubmit _VAL_DATABASE IS_SELECT_FILTER dept_select");
         	    $("#paraMap1_CKC_EMP_NO").trigger("chosen:updated");
         	    $("#paraMap1_CKC_EMP_NAME").val("");
         	}
         	
         	
        } 
        
        //班别二
         function ckcGroupTwo(){
         	if ("" != $("#paraMap1_CKC_GROUP").val() || "" != $("#paraMap1_CKC_GROUP_THREE").val()) {
	         	var start = $("#paraMap1_CKC_GROUP").find("option:selected").attr("uuid");
	         	var end = $("#paraMap1_CKC_GROUP_TWO").find("option:selected").attr("uuid");
	        	var end_err = document.getElementById("paraMap1_CKC_GROUP_TWO");
	        	var endS = $("#paraMap1_CKC_GROUP_THREE").find("option:selected").attr("uuid");
         	    if($("#paraMap1_CKC_GROUP").val() == $("#paraMap1_CKC_GROUP_TWO").val() || $("#paraMap1_CKC_GROUP_THREE").val() == $("#paraMap1_CKC_GROUP_TWO").val()){
         	        _alertValMsg(end_err,"<dict:lang value='班别不能相同'/>");
					$("#paraMap1_CKC_GROUP_TWO").find("option[value='']").attr("selected",true);
					//$("#paraMap1_CKC_GROUP_TWO").val("");
					$("#paraMap1_CKC_GROUP_TWO").trigger("chosen:updated");
         	    }
         	}
         	if("" != $("#paraMap1_CKC_GROUP_TWO").val()){
         	    $("#paraMap1_CKC_EMP_NO_TWO").removeAttr("disabled");
                $("#paraMap1_CKC_EMP_NO_TWO").attr("class"," _VAL_NULL input isSubmit _VAL_OjbsData  isaddSubmit _VAL_DATABASE IS_SELECT_FILTER dept_select");
            	$("#paraMap1_CKC_EMP_NO_TWO").trigger("chosen:updated");
         	    
         	}else{	
                $("#paraMap1_CKC_EMP_NO_TWO").find("option[value='']").attr("selected",true);
         	      //$("#paraMap1_CKC_EMP_NO_TWO").attr("disabled","disabled");
                $("#paraMap1_CKC_EMP_NO_TWO").attr("class"," _VAL_NULL input isSubmit _VAL_OjbsData readonly isaddSubmit _VAL_DATABASE IS_SELECT_FILTER dept_select");
                 $("#paraMap1_CKC_EMP_NO_TWO").trigger("chosen:updated");
                 $("#paraMap1_CKC_EMP_NAME_TWO").val("");
         	}
        } 
        //班别三
         function ckcGroupThree(){
         	if ("" != $("#paraMap1_CKC_GROUP_TWO").val() || "" != $("#paraMap1_CKC_GROUP").val() ) {
	         	var start = $("#paraMap1_CKC_GROUP_THREE").find("option:selected").attr("uuid");
	         	var end = $("#paraMap1_CKC_GROUP_TWO").find("option:selected").attr("uuid");
	         	var ends = $("#paraMap1_CKC_GROUP").find("option:selected").attr("uuid");
	         	
	        	var end_err = document.getElementById("paraMap1_CKC_GROUP_THREE");
         	    if($("#paraMap1_CKC_GROUP_TWO").val() == $("#paraMap1_CKC_GROUP_THREE").val() ||　$("#paraMap1_CKC_GROUP").val() == $("#paraMap1_CKC_GROUP_THREE").val()　){
         	        _alertValMsg(end_err,"<dict:lang value='班别不能相同'/>");
					$("#paraMap1_CKC_GROUP_THREE").find("option[value='']").attr("selected",true);
					$("#paraMap1_CKC_GROUP_THREE").trigger("chosen:updated");
					
         	    }
         	}
         	if("" != $("#paraMap1_CKC_GROUP_THREE").val()){
         	    $("#paraMap1_CKC_EMP_NO_THREE").removeAttr("disabled");
                $("#paraMap1_CKC_EMP_NO_THREE").attr("class"," _VAL_NULL input isSubmit _VAL_OjbsData  isaddSubmit _VAL_DATABASE IS_SELECT_FILTER dept_select");
                $("#paraMap1_CKC_EMP_NO_THREE").trigger("chosen:updated");
         	}else{
         	    $("#paraMap1_CKC_EMP_NO_THREE").find("option[value='']").attr("selected",true);
         	     //$("#paraMap1_CKC_EMP_NO_THREE").attr("disabled","disabled");
                $("#paraMap1_CKC_EMP_NO_THREE").attr("class"," _VAL_NULL input isSubmit _VAL_OjbsData readonly isaddSubmit _VAL_DATABASE IS_SELECT_FILTER dept_select");
                 $("#paraMap1_CKC_EMP_NO_THREE").trigger("chosen:updated");
                 $("#paraMap1_CKC_EMP_NAME_THREE").val("");
         	}
        }
         
    </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
