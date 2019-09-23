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
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>	
    <!-- 添加颜色编辑器 js 和 css-->
    <script type = "text/javascript" src = "${path}plf/js/spectrum/spectrum.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <link rel=stylesheet type=text/css
		href="${path}plf/js/spectrum/spectrum.css" />
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
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
  
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->
	
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
			        <button type="button" onclick="mmz_add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" id="#mmz_console" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="53e8ef46c6cd4a2f96cbd7d6caa9ff54" />
	<input type="hidden" name="53e8ef46c6cd4a2f96cbd7d6caa9ff54" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cdc48b3a601d4deeb436b7a36d4265fe'" />
		<s:set name="_$formId_1" value="'53e8ef46c6cd4a2f96cbd7d6caa9ff54'" />
		<s:set name="_$type" value="'add'" />
		<tr style="display:none">
			<td class="name-three"  /><bu:uitn colNo="LEVEL_CODE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
			<bu:td cssClass="dec-self" colNo="LEVEL_CODE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" ><bu:ui colNo="LEVEL_CODE" readonly="readonly" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" value="%{LEVEL_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" style="width:64.2px;"/><span class="dot">*</span><bu:uitn colNo="LEVEL_SCORE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
			<bu:td cssClass="dec-self" colNo="LEVEL_SCORE" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" ><bu:ui colNo="LEVEL_SCORE"   formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" value="%{LEVEL_SCORE}" formIndex="1" style="width:300px" /></bu:td><!-- <button type="button" onclick="check(this);">确认</button>-->

		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="LEVEL_COLOR" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" /></td>
			<bu:td cssClass="dec-self"   colNo="LEVEL_COLOR" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" ><bu:ui colNo="LEVEL_COLOR" style ="display:none" formId="53e8ef46c6cd4a2f96cbd7d6caa9ff54" value="%{LEVEL_COLOR}" formIndex="1" />
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
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	
<script>	

    //配置颜色选择器 	
        function updateBorders(color) {
            var hexColor = "transparent";
            if(color) {
                hexColor = color.toHexString();
            }
            $("#docs-content").css("border-color", hexColor);

		}
		var grape_color = '#000000';
	 	var slo;		
        var a =parent.$("#popupFrameFpId");
        var b = a.parent();
        var slo1;
		   function slower(){
              b.css({
                 height: function(index, value) {
                 if(parseFloat(value)<140){
                    self.clearInterval(slo);
                }
                    return parseFloat(value)-9;
              }

            });
             
        };

        function slower1(){
        a.css({
                height: function(index, value) {
                if(parseFloat(value)<140){
                    self.clearInterval(slo1);
                }
                 return parseFloat(value)-9;
                }
            });             
        };

  

	        
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
            localStorageKey: true,
            hideAfterPaletteSelect: false,
            move: function (color) {
                updateBorders(color);
            },
            show: function () {

            },
            change: function(color){
            $(".circle").css("background-color",color.toHexString());
				grape_color = color.toHexString();    
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
           //$("#full").spectrum("show");//显示面板
				$("#paraMap1_LEVEL_COLOR").val(grape_color);
                
                	//alert($("#paraMap1_LEVEL_COLOR").val())
           slo1 = self.setInterval("slower1()",1);
           slo = self.setInterval("slower()",1);     	
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
    var a =parent.$("#popupFrameFpId");
                	a.parent().css("height","136"); 
                	a.css("height","136");
    //$("#full").spectrum("show");//显示面板
      //$("#full").spectrum("hide");//隐藏面板


/*
function clock (){
    console.log($(document.activeElement))
self.setInterval("clock()",1000);

    
}
*/

    /*    var list;
        //获得现有数据和等级
　　    　$.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=0f8d1614ab9746c5b9470dc83c145316",
            data:"",
            success: function(data){
             console.log(data);
                var k = data.ajaxPage.dataList.length;
                list =  data.ajaxPage.dataList;
            },
            error: function(msg){
                console.log(msg);
                //utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
      */  
　　    //获得等级
    /*    function check(obj){
            
            if($("#paraMap1_LEVEL_SCORE").val()==""){
                return;
            }
            if(list.length==0){
               $("#paraMap1_LEVEL_CODE").val(1);
               return;
            }
            for(var i=0 ; i<list.length; i++){
            console.log("分"+list[i].LEVEL_SCORE);
                if(list[i].LEVEL_SCORE==$("#paraMap1_LEVEL_SCORE").val()){//
                    _alertValMsg(document.getElementById("paraMap1_LEVEL_SCORE"),"<dict:lang value="该值已存在" />");
                break;
                }
                	if($("#paraMap1_LEVEL_SCORE").val()>list[i].LEVEL_SCORE){
                	   $("#paraMap1_LEVEL_CODE").val(list[i].LEVEL_CODE);
                	   return;
                	}
               
                	
                }
                 $("#paraMap1_LEVEL_CODE").val(list[list.length-1].LEVEL_CODE+1);
            }
         
      */ 
     //新增       
        function mmz_add(obj,formid){
        var j = {};
        j.level_code=  $("#paraMap1_LEVEL_CODE").val();
        j.level_score= $("#paraMap1_LEVEL_SCORE").val();
        j.level_color= $("#paraMap1_LEVEL_COLOR").val();
        /*
        if(null==j.level_score||j.level_score==""){
            j.level_score ==0;
        }
        if(null==j.level_code||j.level_code==""){
            j.level_code ==0;
        }
        */
        j.model = "add"; 
        console.log(JSON.stringify(j));
           $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=6d36d4c00a484f25bd38d051d1bed92f",
            data:j,
            success: function(data){
            	//util.closeLoading();
         //msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title.ajaxMap,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
       //  msgPop('保存成功',"",'提示',200,150,3000,5000);
         //    $("#save").removeAttr("onclick");
          //  $("#filter").attr("onclick","filterInfo();");
            
            //if(parent.iframe2!=undefined)
           var i =window.parent.document.getElementsByTagName("iframe");//获取父页面iframe
            $(i).each(function(i,obj){
               if($(obj).parent().prop("class")!="hidecontent"){
                 console.log(obj.id);
                obj.contentWindow.location.reload(true)
               }
                
            });    
           //parent.iframe4.location.reload(true);
            parent.$("#_loading_lay_div").parent().next().remove(); //parent必须放外头，指向父页面
             console.log(data);
            // list.push(j);//添加验证
            },
            error: function(msg){
                console.log(msg);
                utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
        }
        
        
/*        
         function closeAndRefreshTab(){
        	var iframeId = "${iframeId}";
        	top.$("#"+iframeId)[0].contentWindow.reloadPg("<dict:lang value="保存成功" />","<dict:lang value="提示信息" />",200,150,3000);
  			parent.switchTabWithoutReload(iframeId.replace("iframe",""));
			//parent.closeTab(window.frameElement.name.replace("iframe",""));
        }
  */      
        
/*        
function ajaxDel(){
  if(checkNewIsSelected()){
	utilsFp.confirmIcon(1,"","delConfirm","", "是否确认删除？","1","260","");
  }else{
	return false;
  }
  
 
*/

 // closeAndRefreshTab();
         //upforms();
          //   utilsFp.confirmIcon(2,"","","", "保存成功",0,"300","");
              //window.location.reload();
                //window.opener.location.reload();
             //parent.location.reload();
             //parent.iframe3.location.reload();
             //$("#popupFrameFpIdpop").parent().hidpopupFrameFpIdshadowe();
             //$("#popupFrameFpIdpop").parent().				

</script>

</body>
<!-- 页面结束 -->
<!--
<%@ include file="/plf/common/pub_end.jsp"%>


 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
 -->
 
 
 
 
 
 
 
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
</script>
	 <script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

 

 
 
