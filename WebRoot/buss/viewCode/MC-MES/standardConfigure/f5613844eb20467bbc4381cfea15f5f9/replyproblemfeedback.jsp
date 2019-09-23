<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
  <style type="text/css">
.input {
	width:200px !important;
}
.edit .bd{
    height:calc(100% - 30px);
    width:100%;
    overflow:auto;
    box-sizing:border-box;
}
.mCSB_outside + .mCS-minimal-dark.mCSB_scrollTools_vertical{
    right:6px;
}
#myDiv img {
    max-width: 700px;
    max-height: 100px;
 }   
     /* 查看原图 */
        .master_map{
            position: fixed;
            background-color: #fff;
            cursor: move;
            z-index: 1010;
        }

        .shadow_div{
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #000;
            opacity: 0.35;
            z-index: 1000;
        }

        .close_img{
            position: fixed;
            width: 36px;
            height: 36px;
            top: 0;
            right: 0;
            background-image: url(${path}plf/page/mlabel/img/close-big.png);
            z-index: 1020;
            cursor: pointer;
            background-size:100% 100%;
        }

        .close_img:hover{
            background-image: url(${path}plf/page/mlabel/img/close-big-h.png);
        }

</style>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	<script type="text/javascript">
                var addTableTrMap;
                UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
                UE.Editor.prototype.getActionUrl = function(action){  
                    //调用自己写的Controller 
                    if(action == 'uploadimage' || action == 'uploadfile'){  
                   	 return "${path}/buss/bussModel_editorUploadImg.ms?savePath="+$("#_savePath").val(); //自己controller的action  
                    }else if(action == "uploadvideo"){  
                        return "${ctx}/ueditor/videoUp";//自己controller的action  
                    }else{  
                        return this._bkGetActionUrl.call(this,action);//百度编辑器默认的action  
                    }  
                }  
                
            </script>
    <!-- 产品静态资源 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>     
</head>
<body>
	<div class="edit" style="height:calc(100% - 5px);">
	

	<form id="editForm" style="height:100%;" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
		<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
<jsp:param name="modelName" value="VIEW_TYPE_11" />
   <jsp:param name="location" value="editForm" />
		</jsp:include>
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
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd scroll">

		<bu:set name="paraMapObj" value="${dataId}" formId="00bc67ca8c8a456785891b90e2f470c3" type="edit" />
	<div class="mod">
<div class="mod-hd" style="margin-bottom:5px;">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
    <table class="basic-table" style="table-layout: fixed;">
	<input type="hidden" name="formIds" value="00bc67ca8c8a456785891b90e2f470c3" />
	<input type="hidden" name="00bc67ca8c8a456785891b90e2f470c3" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'e93b14d4adff42edad5ad0b233acc838'" />
		<s:set name="_$formId_1" value="'00bc67ca8c8a456785891b90e2f470c3'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:67px"/><bu:uitn colNo="CPF_SN" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" style="width:210px"   colNo="CPF_SN" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_SN" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
			<td class="name" style="width:67px"/><span class="dot">*</span><bu:uitn colNo="CPF_TYPE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" style="width:210px"  colNo="CPF_TYPE" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_TYPE" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" style="width:67px"/><span class="dot">*</span><bu:uitn colNo="CPF_PROBLEM_PROJECT" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" style="width:210px"  colNo="CPF_PROBLEM_PROJECT" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_PROBLEM_PROJECT" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:67px"/><span class="dot">*</span><bu:uitn colNo="CPF_LIABILITY_DEPT" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_LIABILITY_DEPT" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_LIABILITY_DEPT" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1"  /></bu:td>
			<td class="name" style="width:67px"/><span class="dot">*</span><bu:uitn colNo="CPF_REQUEST_DATE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_REQUEST_DATE" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_REQUEST_DATE" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1"/></bu:td>
		    <td class="name" style="width:67px"/><span class="dot">*</span><bu:uitn colNo="CPF_PRIORITY" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
		    <bu:td cssClass="dec" colNo="CPF_PRIORITY" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_PRIORITY" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		<td class="name" style="width:67px"/><span class="dot">*</span><bu:uitn colNo="CPF_PROBLEM_BELONG" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
		<bu:td cssClass="dec" colNo="CPF_PROBLEM_BELONG" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_PROBLEM_BELONG" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:67px"/><span class="dot">*</span><bu:uitn colNo="CPF_ABSTRACT" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_ABSTRACT" formId="00bc67ca8c8a456785891b90e2f470c3" colspan="8"><bu:ui colNo="CPF_ABSTRACT" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:25px;width:99%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		    <td class="name"  style="width:67px"/><bu:uitn colNo="CPF_PROPOSAL_SCHEME" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_PROPOSAL_SCHEME" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:60px;" colspan="8"><bu:ui colNo="CPF_PROPOSAL_SCHEME" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:100%;width:99%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr style="display:none;">
			<td class="name"  style="width:67px"/><bu:uitn colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:120px;" colspan="6"><bu:ui colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:100%;width:99%;" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
		    <td class="name" style="width:67px"/><span class="dot">*</span><bu:uitn colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
		    <bu:td cssClass="dec" colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:120px;width:99%;" colspan="6">
		    <div id="myDiv" style="height:125px;overflow-y:scroll; word-wrap:break-word;border:1px solid #ccc">
			</div>
			</bu:td>
		</tr>
	</table>
	
	<div class="mod-hd" style="margin-bottom:5px;">		
        <h3 class="tit"><dict:lang value="答复信息" /></h3>	
    </div>
    	<table class="basic-table" style="table-layout: fixed;">
		<tr>
			<td class="name" style="width:100px"/><span class="dot">*</span><bu:uitn colNo="CPF_EXPECTED_COMPLETION_TIME" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" style="width:205px" colNo="CPF_EXPECTED_COMPLETION_TIME" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_EXPECTED_COMPLETION_TIME" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" /></bu:td>
            <td class="name" style="width:52px"/><span class="dot">*</span><bu:uitn colNo="CPF_HANDLE_EMP" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec"  style="width:205px" colNo="CPF_HANDLE_EMP" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_HANDLE_EMP" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" /></bu:td>
	    	<td class="name" style="width:52px"/><span class="dot">*</span><bu:uitn colNo="CPF_STATUS" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" style="width:205px" colNo="CPF_STATUS" formId="00bc67ca8c8a456785891b90e2f470c3" ><bu:ui colNo="CPF_STATUS" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1"  /></bu:td>
	    </tr>
		<tr>
			<td class="name"/><span class="dot">*</span><bu:uitn colNo="CPF_HANDLE_WAY" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<bu:td cssClass="dec" colNo="CPF_HANDLE_WAY" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:130px;" colspan="6" ><bu:ui colNo="CPF_HANDLE_WAY" formId="00bc67ca8c8a456785891b90e2f470c3" style="height:100%;width:100%;" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
        </div>
</div>
	</form>	
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->


	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
        		
     <script>
     $(function(){
        	  $("#myDiv").html($("#paraMapObj_CPF_DESCRIBE").val());
        	    
        })
        	 //点击查看原图
        $('#myDiv').on('click','p img',function(){ 
            var url = $(this).attr('src')
            $("<div class='shadow_div'>").appendTo('body');

            $("<img class ='master_map' src='" + url + "'>").appendTo('body');
            $('.master_map').css('left','calc((100% - ' + $('.master_map').width() + 'px)/2)'); 
            $('.master_map').css('top','calc((100% - ' + $('.master_map').height() + 'px)/2)'); 
            
            $("<div class='close_img'>").appendTo('body');  
        })



        //关闭放大
        function closeBig(){
            $('.shadow_div').remove();
            $('.master_map').remove();
            $('.close_img').remove();
        }
        $('body').on('click','.shadow_div',closeBig)
        $('body').on('click','.close_img',closeBig)

        //移除默认的拖动事件
        $('body').on('dragstart','.master_map',function(){
            return false;
        })

        //点击拖动图片
        $('body').on('mousedown','.master_map',function(e){
            var event = $(this);     
            var oldx = e.offsetX;
            var oldy = e.offsetY;
            document.onmousemove = function(ev){        
                $(event).css('left',ev.clientX - oldx +'px');
                $(event).css('top',ev.clientY - oldy +'px');
            }    
        })
        
        //松开移除拖动事件
        window.onmouseup = function(){
            document.onmousemove = null;
        }

        //图片滚动事件(放大缩小)
        $('body').on('mousewheel','.master_map',function(e,d){
            var direction = d > 0 ? 'Up' : 'Down';
            if (direction == 'Up') {
                resizeImg($(this),false)
            } else {
                resizeImg($(this),true)
            }

            return false;
        })

        //图片放大缩小  参数1:执行放大缩小的元素   参数2:是否放大(否的话则缩小)
        function resizeImg(item,isBig){
            var oldHeight = $(item).height();
            var oldWidth = $(item).width();
            var oldTop = $(item).css('top');
            var oldLeft = $(item).css('left');
            
            if(isBig){
                $(item).height($(item).height() + 50);
            }else{
                if(oldHeight <= 100 || oldHeight <= 100){
                    //太小就不允许缩
                }else{
                    $(item).height($(item).height() - 50);
                }
                
            }

            // 重新定位
            var top = parseFloat(oldTop) - ($(item).height() - oldHeight)/2;
            var left = parseFloat(oldLeft) - ($(item).width() - oldWidth)/2;

            $(item).css('top',top + 'px').css('left',left + 'px');
        }
     function edit(){
    	    if($("#paraMapObj_VR_CLASS").val()==""){
    	        _alertValMsg($('#paraMapObj_VR_CLASS'),"<dict:lang value="项目编码不能为空" />");
    	    }
    	    
    	    if($("#paraMapObj_CPF_HANDLE_WAY").val()==""){
    	       utilsFp.confirmIcon(3,"","","", "处理对策不能为空","","","");
               return false;
    	      //  _alertValMsg($('#paraMapObj_CPF_HANDLE_WAY'),"<dict:lang value="处理对策不能为空" />");
    	    }  	    
            
            if(!val.valNullData()){ 
                   return ;
             }
   
            /*if(!valData()){
				return ;
			}*/
			if(!val.valDataBaseSetData()){
		        return ;
	        }
			if(!val.valOjbsData()){
        		return ;
        	}
        document.forms.editForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=1f667ed516784f429893cb886a64fe1a"; 
        document.forms.editForm.submit();  
    }
     </script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
