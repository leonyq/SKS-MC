<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
		<link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- 产品静态资源 -->
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
            top:100%;
            background-color:#fff;
            z-index:1111;
        }
    
</style>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;">
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
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="height:400px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="5b459044dfc845bd98cf173f26aab70a" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="5b459044dfc845bd98cf173f26aab70a" />
	<input type="hidden" id="prefixInd" name="5b459044dfc845bd98cf173f26aab70a" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'516f290fd8c0452a877229a577ad986f'" />
		<s:set name="_$formId_1" value="'5b459044dfc845bd98cf173f26aab70a'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:65px;" /><span class="dot">*</span><bu:uitn colNo="CEI_TYPE" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<bu:td cssClass="dec" colNo="CEI_TYPE" style="width:230px;" formId="5b459044dfc845bd98cf173f26aab70a" ><bu:ui colNo="CEI_TYPE" formId="5b459044dfc845bd98cf173f26aab70a" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="CEI_AREA_SN" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<bu:td cssClass="dec" colNo="CEI_AREA_SN" formId="5b459044dfc845bd98cf173f26aab70a" style="width:230px;" > 
			    		<div class="_tree" onClick="showTree(this,event)" >
			    		    <input type="text" id="AREA_NAME" name="AREA_NAME"  placeholder="点击弹出"readonly="readonly" placeholder="点击弹出">
			    		 
                			<div id="index_tree" class="ztree" style="display: none;"></div>
			    		</div>
			    
			</bu:td>
		</tr>
		<tr style="display:none;">
		    <td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CEI_AREA_SN" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<bu:td cssClass="dec-self" colNo="CEI_AREA_SN" formId="5b459044dfc845bd98cf173f26aab70a" ><bu:ui colNo="CEI_AREA_SN" formId="5b459044dfc845bd98cf173f26aab70a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CEI_RECORD_CONTENT" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<bu:td cssClass="dec" colNo="CEI_RECORD_CONTENT" formId="5b459044dfc845bd98cf173f26aab70a" colspan="3" style="height:200px;" ><bu:ui colNo="CEI_RECORD_CONTENT" style="width:100%;height:100%" formId="5b459044dfc845bd98cf173f26aab70a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="5b459044dfc845bd98cf173f26aab70a" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
    <script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>	
	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<script>
$(function(){
    getAreaName();
})

function getAreaName(){
    var CEI_AREA_SN =$("#paraMapObj_CEI_AREA_SN").val();
    
    
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
               if(null!=list &&　list.length>0){
                   
                   if(list[0].WA_AREA_NAME!=null){
                   
                   $("#AREA_NAME").val(list[0].WA_AREA_NAME);
                    }
               }
             
                
              
            }
           
        },
        error:function(msg){
            	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
    })
}
//获取下拉树
    
        
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
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=0f0c6951cd85418ab4527a5c9b06ef55&type=1",
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
            $.fn.zTree.init($("#index_tree"),setting);
            
        
        
        
    
    	//双击对数据赋值
     function zTreeOnclick(event,treeId,treeNode){
               
                    $("#AREA_NAME").val(treeNode.name);
                   // $("#STORAGE_CODE").val(treeNode.id);
                  //  $("#WH_CODE").val(getCurrentRoot(treeNode));
                    //$("#paraMap1_CKC_AREA_NAME").val(treeNode.name);
                    $("#paraMapObj_CEI_AREA_SN").val(treeNode.id);
                    hideMenu();
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
    //选择完后隐藏下拉树
    function hideMenu() {
        $("#index_tree").fadeOut("fast");
       // $("._tree .ztree").css('display','none');
       // $("body").unbind("mousedown", onBodyDown);
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
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=0f0c6951cd85418ab4527a5c9b06ef55&type=1",
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
            $.fn.zTree.init($("#index_tree"),setting);
       
        
        
    }
    
    var isQuery = false;
                    function edit(thisObj){
                        if(isQuery){util.alert("?数据正在提交，请稍候...");}
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
                        var id="${dataId}";
                        document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=136b28ab6cc0438397493bc771cc7b40&id="+id;//funcMId:VM-环境信息-修改   操作功能    修改
                        document.forms.editForm.submit();
                        isQuery = true;
                    }
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
