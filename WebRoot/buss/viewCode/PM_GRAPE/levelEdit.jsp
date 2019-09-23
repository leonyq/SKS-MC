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
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- 产品静态资源 -->
     <!-- 添加颜色编辑器 js 和 css-->
    <script type = "text/javascript" src = "${path}plf/js/spectrum/spectrum.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <link rel=stylesheet type=text/css
		href="${path}plf/js/spectrum/spectrum.css" />
		
			<!-- 自定义颜色编辑器样式 -->
    <style type="text/css">
    .sp-preview {
    position:relative;
    width:15px;
     height: 15px;
    border: solid 0px #222;
	border-radius: 50%;
   -moz-border-radius: 50%; 
   -webkit-border-radius: 50%;
    margin-right: 5px;
    float:left;
    z-index: 0;
    }
 
.sp-preview-inner{
	display:block;
    position:absolute;
    top:0;left:0;bottom:0;right:0;
    width:15px;
    height: 15px;
	border: solid 1px #a1a1a1;
	border-radius: 50%;
   -moz-border-radius: 50%; 
   -webkit-border-radius: 50%;
    margin-right: 5px;
    float:left;
    z-index: 0;

}

.sp-replacer {
    margin:0;
    overflow:hidden;
    cursor:pointer;
    padding: 4px;
    display:inline-block;
    *zoom: 1;
    *display: inline;
    border: solid 1px #91765d;
    background: #eee;
    color: #333;
    vertical-align: middle;
}
.sp-replacer:hover, .sp-replacer.sp-active {
    border-color: #F0C49B;
    color: #111;
}

  </style>
  

</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />
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
			    	        <button type="button" onclick="mmz_modify(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="53e8ef46c6cd4a2f96cbd7d6caa9ff54" />
	<input type="hidden" name="53e8ef46c6cd4a2f96cbd7d6caa9ff54" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'46ee6d71de6b48fd8959999de2d4639b'" />
		<s:set name="_$formId_1" value="'53e8ef46c6cd4a2f96cbd7d6caa9ff54'" />
		<s:set name="_$type" value="'edit'"/>
		<tr style="display: none;">
			<td class="name-three" /><bu:uitn colNo="LEVEL_CODE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
			<bu:td cssClass="dec-self" colNo="LEVEL_CODE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" ><bu:ui colNo="LEVEL_CODE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
            <tr style="display: none;">
			<td class="name-three" /><bu:uitn colNo="ID" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
			<bu:td cssClass="dec-self" colNo="ID" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" ><bu:ui colNo="ID"  formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" style="width:64.2px;"/><span class="dot">*</span><bu:uitn colNo="LEVEL_SCORE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
			<bu:td cssClass="dec-self" colNo="LEVEL_SCORE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" ><bu:ui colNo="LEVEL_SCORE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" dataId="${dataId}" style="width:300px" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="LEVEL_COLOR" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
			<bu:td cssClass="dec-self" colNo="LEVEL_COLOR" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" ><bu:ui colNo="LEVEL_COLOR" style="display: none;" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" dataId="${dataId}" formIndex="1" />
	
	<!-- 添加颜色编辑器 -->
            		<input id="full" style="height:10px;width:10px">		
			
			
			</bu:td>
		</tr>
	</table>
			<bu:jsVal formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

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


	
<script>	
    	var col2 = 'paraMapObj_LEVEL_SCORE';
    	var col1 = 'paraMapObj_LEVEL_CODE';
    	var col3 = 'paraMapObj_LEVEL_COLOR';
    //配置颜色选择器 	
        function updateBorders(color) {
            var hexColor = "transparent";
            if(color) {
                hexColor = color.toHexString();
            }
            $("#docs-content").css("border-color", hexColor);

		}
		var grape_color = '#000000';
    //初始化 LEVEL_COLOR 默认颜色
    $("#paraMap1_LEVEL_COLOR").val(grape_color);
        $("#full").spectrum({
            allowEmpty:true,
            color: "#000", //默认颜色
            showInput: true,
            containerClassName: "full-spectrum",
            showInitial: true,
            showPalette: true,
            showSelectionPalette: true,
            //showAlpha: true, 透明度条
            maxPaletteSize: 10,
            preferredFormat: "hex",
            localStorageKey: false,
            move: function (color) {
                updateBorders(color);
            },
            show: function () {

            },
            beforeShow: function () {
			  var a =parent.$("#popupFrameFpId");
                	a.parent().css("height","368"); 
                	a.css("height","368");
            },
            hide: function (color) {
                updateBorders(color);
			$(".circle").css("background-color",color.toHexString());
				grape_color = color.toHexString();
				//为字段LEVEL_COLOR赋颜色值
				$("#paraMapObj_LEVEL_COLOR").val(grape_color);
                     var a =parent.$("#popupFrameFpId");
                	a.parent().css("height","136"); 
                	a.css("height","136");
            },
            palette: [
                ["rgb(0, 0, 0)", "rgb(67, 67, 67)", "rgb(102, 102, 102)", /*"rgb(153, 153, 153)","rgb(183, 183, 183)",*/
                "rgb(204, 204, 204)", "rgb(217, 217, 217)", /*"rgb(239, 239, 239)", "rgb(243, 243, 243)",*/ "rgb(255, 255, 255)"],
                ["rgb(152, 0, 0)", "rgb(255, 0, 0)", "rgb(255, 153, 0)", "rgb(255, 255, 0)", "rgb(0, 255, 0)",
                "rgb(0, 255, 255)", "rgb(74, 134, 232)", "rgb(0, 0, 255)", "rgb(153, 0, 255)", "rgb(255, 0, 255)"],
                ["rgb(230, 184, 175)", "rgb(244, 204, 204)", "rgb(252, 229, 205)", "rgb(255, 242, 204)", "rgb(217, 234, 211)",
                "rgb(208, 224, 227)", "rgb(201, 218, 248)", "rgb(207, 226, 243)", "rgb(217, 210, 233)", "rgb(234, 209, 220)",
                "rgb(221, 126, 107)", "rgb(234, 153, 153)", "rgb(249, 203, 156)", "rgb(255, 229, 153)", "rgb(182, 215, 168)",
                "rgb(162, 196, 201)", "rgb(164, 194, 244)", "rgb(159, 197, 232)", "rgb(180, 167, 214)", "rgb(213, 166, 189)",
                "rgb(204, 65, 37)", "rgb(224, 102, 102)", "rgb(246, 178, 107)", "rgb(255, 217, 102)", "rgb(147, 196, 125)",
                "rgb(118, 165, 175)", "rgb(109, 158, 235)", "rgb(111, 168, 220)", "rgb(142, 124, 195)", "rgb(194, 123, 160)",
                "rgb(166, 28, 0)", "rgb(204, 0, 0)", "rgb(230, 145, 56)", "rgb(241, 194, 50)", "rgb(106, 168, 79)",
                "rgb(69, 129, 142)", "rgb(60, 120, 216)", "rgb(61, 133, 198)", "rgb(103, 78, 167)", "rgb(166, 77, 121)",
                /*"rgb(133, 32, 12)", "rgb(153, 0, 0)", "rgb(180, 95, 6)", "rgb(191, 144, 0)", "rgb(56, 118, 29)",
                "rgb(19, 79, 92)", "rgb(17, 85, 204)", "rgb(11, 83, 148)", "rgb(53, 28, 117)", "rgb(116, 27, 71)",*/
                "rgb(91, 15, 0)", "rgb(102, 0, 0)", "rgb(120, 63, 4)", "rgb(127, 96, 0)", "rgb(39, 78, 19)",
                "rgb(12, 52, 61)", "rgb(28, 69, 135)", "rgb(7, 55, 99)", "rgb(32, 18, 77)", "rgb(76, 17, 48)"]
            ]
        });
		  
       // $("#full").spectrum("show");//显示面板
  
		
		       
        function mmz_modify(obj){
        var j = {};
        j.id=  $("#paraMapObj_ID").val();
        j.level_score= $("#"+col2).val();
        j.level_color= $("#"+col3).val();
        
        /*
      '  if(null==j.level_score||j.level_score==""){
            j.level_score ==0;
        }
        if(null==j.level_code||j.level_code==""){
            j.level_code ==0;
        }
        */
        
        j.model = "modify"; 
        console.log(JSON.stringify(j));
           $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=6d36d4c00a484f25bd38d051d1bed92f",
            data:j,
            success: function(data){
            msgPop('修改成功',"",'提示',200,150,3000,5000);
           var i =window.parent.document.getElementsByTagName("iframe");//获取父页面iframe
            $(i).each(function(i,obj){
               if($(obj).parent().prop("class")!="hidecontent"){
                 console.log(obj.id);
                obj.contentWindow.location.reload(true)
               }
            });    
            parent.$("#_loading_lay_div").parent().next().remove(); //parent必须放外头，指向父页面
            },
            error: function(msg){
            console.log(msg);
              //  utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
        }
		
		

</script>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
