<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script>
	//加载父ifream中的js\css文件

		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
	</script>
	<script type="text/javascript">
		var addTableTrMap;
	</script>
	<script type="text/javascript">
	     function selectType(){
	     //全局0工单1机种2
	      var selectvalue = $("#paraMap1_CR_TYPE").val();
	      var inputobj1 = document.getElementById("CR_PROJECT_ID_SHOW");
	      var inputobj2 = document.getElementById("MODEL_CODE_SHOW");
	      if(selectvalue =="0"){
	      document.getElementById("cr_project_item").style.display = "none";
	      document.getElementById("cr_bom_item").style.display = "none";
	      document.getElementById("itemitem").style.display = "block";//控制弹窗对应的input显示
	      $("#paraMap1_CR_ITEM_MIAN").attr("value","");
	      $("#paraMap1_CR_ITEM_MIAN_SHOW").attr("value","");//主料料号数值清空
	      $("#paraMap2_CR_PROJECT_ITEM").attr("value","");
              $("#paraMap2_CR_PROJECT_ITEM_SHOW").attr("value","");
              $("#paraMap2_CR_BOM_ITEM").attr("value","");
              $("#paraMap2_CR_BOM_ITEM_SHOW").attr("value","");//工单，机种input值的清空
	      $("#CR_MAIN_NAME").attr("value","");//主料名称的清空
	     
	      $("#CR_MAIN_TYPE").attr("value","");//主料规格的清空
	      
	            $("#pi").text("");//控制必填小红点的隐藏
                    $("#mc").text("");//控制必填小红点的隐藏
	          $("#MODEL_CODE").attr("value","");
	          $("#CR_PROJECT_ID").attr("value","");
	          $("#CR_PROJECT_ID_SHOW").attr("value","");
	          $("#MODEL_CODE_SHOW").attr("value","");
	          inputobj1.disabled =true;
	          inputobj2.disabled =true;
	           $("#CR_PROJECT_ID_SHOW").addClass("readonly");
	           $("#MODEL_CODE_SHOW").addClass("readonly");
	          $(inputobj1).parent().find("button").attr("disabled",true);
	          $(inputobj2).parent().find("button").attr("disabled",true);
	     }else if(selectvalue =="1"){
	          document.getElementById("cr_project_item").style.display = "block";
	          document.getElementById("cr_bom_item").style.display = "none";
	          document.getElementById("itemitem").style.display = "none";//paraMap1_CR_ITEM_MIAN_SHOW
	          $("#paraMap1_CR_ITEM_MIAN").attr("value","");
	          $("#paraMap1_CR_ITEM_MIAN_SHOW").attr("value","");
	          $("#paraMap2_CR_BOM_ITEM").attr("value","");
                  $("#paraMap2_CR_BOM_ITEM_SHOW").attr("value","");
	          $("#CR_MAIN_NAME").attr("value","");
	         
	          $("#CR_MAIN_TYPE").attr("value","");
	        
	           $("#pi").text("*");
                    $("#mc").text("");
	            $("#MODEL_CODE").attr("value","");
	            $("#MODEL_CODE_SHOW").attr("value","");
	          inputobj1.disabled = false;
	           $("#CR_PROJECT_ID_SHOW").removeClass("readonly");
	          inputobj2.disabled = true;
	          $("#MODEL_CODE_SHOW").addClass("readonly");
	           $(inputobj1).parent().find("button").attr("disabled",false);
	          $(inputobj2).parent().find("button").attr("disabled",true);
	     }else if(selectvalue =="2"){
	          document.getElementById("cr_project_item").style.display = "none";
	          document.getElementById("cr_bom_item").style.display = "block";
	          document.getElementById("itemitem").style.display = "none";
	          $("#paraMap1_CR_ITEM_MIAN").attr("value","");
	           $("#paraMap1_CR_ITEM_MIAN_SHOW").attr("value","");
	          $("#paraMap2_CR_PROJECT_ITEM").attr("value","");
                  $("#paraMap2_CR_PROJECT_ITEM_SHOW").attr("value","");
	          $("#CR_MAIN_NAME").attr("value","");
	        
	          $("#CR_MAIN_TYPE").attr("value","");
	        
	           $("#pi").text("");
                   $("#mc").text("*");
	           $("#CR_PROJECT_ID").attr("value","");
	           $("#CR_PROJECT_ID_SHOW").attr("value","");
	          inputobj1.disabled = true;
	           $("#CR_PROJECT_ID_SHOW").addClass("readonly");
	          inputobj2.disabled = false;
	           $("#MODEL_CODE_SHOW").removeClass("readonly");
	           $(inputobj1).parent().find("button").attr("disabled",true); 
	          $(inputobj2).parent().find("button").attr("disabled",false);
	     }
	
	}
	     function select(){
	 var selectobj = document.getElementById("paraMap1_CR_TYPE");
	        var inputobj1 = document.getElementById("CR_PROJECT_ID_SHOW");
	        var inputobj2 = document.getElementById("MODEL_CODE_SHOW");
	        var hinputobj = document.getElementById("flag");
	       for(var i=0;i<selectobj.length;i++){
	         var optionobj = selectobj[i];
	         var optionvalue = selectobj[i].value;
	         if(optionobj.selected==true){
	           if(optionvalue=="0"){
	            $("#pi").text("");
                    $("#mc").text("");
	          $("#MODEL_CODE").attr("value","");
	          $("#CR_PROJECT_ID").attr("value","");
	          $("#CR_PROJECT_ID_SHOW").attr("value","");
	          $("#MODEL_CODE_SHOW").attr("value","");
	          
	          inputobj1.disabled =true;
	          inputobj2.disabled =true;
	           $("#CR_PROJECT_ID_SHOW").addClass("readonly");
	           $("#MODEL_CODE_SHOW").addClass("readonly");
	          $(inputobj1).parent().find("button").attr("disabled",true);
	          $(inputobj2).parent().find("button").attr("disabled",true);
	          document.getElementById("cr_project_item").style.display = "none";
	          document.getElementById("cr_bom_item").style.display = "none";
	          document.getElementById("itemitem").style.display = "block";
	         }else if(optionvalue=="1"){
	               $("#pi").text("*");
                       $("#mc").text("");
	            $("#MODEL_CODE").attr("value","");
	            $("#MODEL_CODE_SHOW").attr("value","");
	          inputobj1.disabled = false;
	           $("#CR_PROJECT_ID_SHOW").removeClass("readonly");
	          inputobj2.disabled = true;
	          $("#MODEL_CODE_SHOW").addClass("readonly");
	           $(inputobj1).parent().find("button").attr("disabled",false);
	          $(inputobj2).parent().find("button").attr("disabled",true);
	          document.getElementById("cr_project_item").style.display = "block";
	          document.getElementById("cr_bom_item").style.display = "none";
	          document.getElementById("itemitem").style.display = "none";
	         }else if(optionvalue=="2"){
	           $("#pi").text("");
                   $("#mc").text("*");
	           $("#CR_PROJECT_ID").attr("value","");
	           $("#CR_PROJECT_ID_SHOW").attr("value","");
	          inputobj1.disabled = true;
	           $("#CR_PROJECT_ID_SHOW").addClass("readonly");
	          inputobj2.disabled = false;
	           $("#MODEL_CODE_SHOW").removeClass("readonly");
	           $(inputobj1).parent().find("button").attr("disabled",true); 
	          $(inputobj2).parent().find("button").attr("disabled",false);
	          document.getElementById("cr_project_item").style.display = "none";
	          document.getElementById("cr_bom_item").style.display = "block";
	          document.getElementById("itemitem").style.display = "none";
	         } 
	         } 
	         	       }
	}
	
	
	 function changeShow(obj){
	    	 var value=obj.value;
	    	 if(value=="0"){
	    	           set_null();
	    	           $("#pi").text("");
               		   $("#mc").text("");
	    	           $("#MODEL_CODE").attr("value","");
	                   $("#CR_PROJECT_ID").attr("value","");
	    	           $("#CR_PROJECT_ID_SHOW").attr("value","");
	                   $("#MODEL_CODE_SHOW").attr("value","");
	                 $("#CR_PROJECT_ID").parent().find("button").attr("disabled",true);
	                 $("#MODEL_CODE_SHOW").parent().find("button").attr("disabled",true);
	    	         $("#CR_PROJECT_ID_SHOW").attr("disabled","disabled");
	    	         
	    		 $("#MODEL_CODE_SHOW").attr("disabled","disabled");
	    		 
	    		 $("#CR_PROJECT_ID_SHOW").addClass("readonly");
	    		 $("#MODEL_CODE_SHOW").addClass("readonly");
	    		 
	    		 $("#MODEL_CODE_SHOW_BUTTON").attr("disabled","disabled");
	    		 $("#main_code_SHOW").removeAttr("ondblclick");
	    		 $("#main_code_SHOW").attr("ondblclick","showPopDiv(0)");
	    	 }else if(value=="1"){
	    	           set_null();
	    	           $("#pi").text("*");
               		   $("#mc").text("");
	    	           $("#MODEL_CODE").attr("value","");
	    	           $("#MODEL_CODE_SHOW").attr("value","");
	    	         $("#CR_PROJECT_ID").parent().find("button").attr("disabled",false);
	                 $("#MODEL_CODE_SHOW").parent().find("button").attr("disabled",true);
	                 
	    		 $("#CR_PROJECT_ID_SHOW").removeAttr("disabled");
	    		 $("#CR_PROJECT_ID_SHOW").removeClass("readonly");
	    		 $("#MODEL_CODE_SHOW").attr("disabled","disabled");
	    		  $("#MODEL_CODE_SHOW").addClass("readonly");
	    		 $("#MODEL_CODE_SHOW_BUTTON").attr("disabled","disabled");
	    		 $("#main_code_SHOW").removeAttr("ondblclick");
	    		 $("#main_code_SHOW").attr("ondblclick","showPopDiv(1)");
	    	 }else if(value=="2"){
	    	           set_null();
	    	           $("#pi").text("");
                           $("#mc").text("*");
	    	           $("#CR_PROJECT_ID").attr("value","");
	    	           $("#CR_PROJECT_ID_SHOW").attr("value","");
	    	         $("#CR_PROJECT_ID").parent().find("button").attr("disabled",true);
	                 $("#MODEL_CODE_SHOW").parent().find("button").attr("disabled",false);
	    	         $("#CR_PROJECT_ID_SHOW").attr("disabled","disabled");
	    	         $("#CR_PROJECT_ID_SHOW").addClass("readonly");
	    		 $("#MODEL_CODE_SHOW").removeAttr("disabled");
	    		 $("#MODEL_CODE_SHOW").removeClass("readonly");
	    		 $("#MODEL_CODE_SHOW_BUTTON").removeAttr("disabled");
	    		 $("#main_code_SHOW").removeAttr("ondblclick");         
	    		 $("#main_code_SHOW").attr("ondblclick","showPopDiv(2)");
	    	 }
	    	 
	     }
	     function set_null(){
	        $("#main_code").val('');
		$("#main_code_SHOW").val('');
		$("#CR_MAIN_NAME").val('');
		
		$("#CR_MAIN_TYPE").val('');
		
	     }
	     
	     function showPopDiv(val){
	    	 var info='';
	    	 if(val==0){
	    		 info='物料信息'; 
	    	 }else if(val==1){
	    		 info='工单BOM信息';
	    	 }else if(val==2){
	    		 info='BOM信息';
	    	 }
	    	 var project_id = $("#CR_PROJECT_ID").val();
	    	 var mode_code = $("#CR_MODEL_CODE").val();
	    	 var url=sqlUrl+"&type="+val+"&project_id="+project_id+"&mode_code="+mode_code;
	    	   $.ajax({
		    		url:url,
		    		type:"post",
	    			success: function(data){
	    				initPop('65eec5ae8fa948b0bfaa48c814f5725d',info,700,500);
	    				top.$("#hidePopc_65eec5ae8fa948b0bfaa48c814f5725d").append(data);
	    				//showPopDivFp(600, 450, returnFunc,title,'65eec5ae8fa948b0bfaa48c814f5725d',data)

    			}
	    	});
	     }
	     function initPop(tableId,title,width, height){
				if(width==null){
					width=700;
				}
				if(height==null){
					height=500;
				}
				var temp=top.document;
				var iTop=($(temp).height()-height)/4;
				var iLeft=($(temp).width()-width)/2;
				//alert("screenWidth"+window.screen.availWidth+"screenHeight"+window.screen.availHeight+"docWidth:"+$(temp).width()+"docHeight:"+$(temp).height()+"iTop"+iTop
				//		+"iLeft:"+iLeft+"height:"+height+"width:"+width);
				var divStr = "<div class=\"dialog dialog-s1\" id=\"hidePop_"+tableId+"\" style=\"z-index:"+(top.zcount+1)+";display:block;margin-left:0px;position:absolute;left:"+iLeft+"px;top:"+iTop+"px;width:"+width+"px;height:"+height+"px;\" >"
							+"   <div class=\"dialog-hd\">"
							+"		            <h3 class=\"tit\">"+title+"</h3><input type=\"hidden\" id=\"tableId\" value=\""+tableId+"\" \\>"
							+"		        </div>"
							+"		        <a class=\"dialog-close\" href=\"javascript:void(0);\" onclick=\"closePopWinFp('hidePop_"+tableId+"','hidePops_"+tableId+"');\"></a>"
							+"		        <div id=\"hidePopc_"+tableId+"\" class=\"dialog-bd bd\" style=\"width:100%;height:"+height+"px;\">"
							+"		        </div>"
							+"		    </div>";

				if($(".dialog-mask").length == 0){
					divStr += "<div class=\"dialog-mask\" id=\"hidePops_"+tableId+"\" style=\"z-index:"+top.zcount+"\"></div>";
					top.zcount++;
				}
				var tmpDiv = temp.createElement("div");
					tmpDiv.innerHTML = divStr;
				var body = temp.getElementsByTagName("body")[0];
					body.appendChild(tmpDiv);
					top.$("#hidePop_"+tableId).show();
					top.$("#hidePops_"+tableId).show();
					top.$("#hidePop_"+tableId).draggable();
					popcount++;
			}
			
 	    function validate(thisObj){
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
			
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false);
			validate_code(); 
			
			isQuery = true;
			$DisInput.attr("disabled", true);
		} 
             function validate_code(){
             var ipt1 = document.getElementById("MODEL_CODE").value;
             var ipt2 = document.getElementById("paraMap1_CR_ITEM_MIAN_SHOW").value;
             var ipt3 = document.getElementById("replay_code_SHOW").value; 
             var ipt4 = document.getElementById("CR_PROJECT_ID").value;
             var ipt5 = $("#paraMap1_CR_TYPE option:selected").val();
                                                   
             if(ipt1 == ipt2 && ipt1!=ipt3){
             
             //utilsFp.alert("<dict:lang value="机种与主料不能相同" />");
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种与主料不能相同" />",0,"","");
             }else if(ipt1 == ipt3 && ipt1!=ipt2){
             
             //utilsFp.alert("<dict:lang value="机种与替代料不能相同" />");
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种与替代料不能相同" />",0,"","");
             }else if(ipt2 == ipt3 && ipt1!=ipt2){
             
             //utilsFp.alert("<dict:lang value="主料与替代料不能相同" />");
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="主料与替代料不能相同" />",0,"","");
             }else if(ipt1 == ipt2 == ipt3){
             //utilsFp.alert("<dict:lang value="机种不能与主料，替代料相同" />");
             utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种不能与主料，替代料相同" />",0,"","");
             }else{
                if(ipt5 == "1"){
               if(ipt4 == ""){
               //utilsFp.alert("<dict:lang value="工单不能为空" />");
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="工单不能为空" />",0,"","");
               }else{
                 if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
                 document.forms.addForm.submit();
               }
             }else if(ipt5 == "2"){
               if(ipt1 == ""){
               //utilsFp.alert("<dict:lang value="机种不能为空" />");
                utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种不能为空" />",0,"","");
               }else{
               if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
                 document.forms.addForm.submit();
               }
             }else if(ipt5 == "0"){
             if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
                 document.forms.addForm.submit();
             }
             }
             
             }
	</script>
	<style type="text/css">
	.x-fieldset{border:1px solid #B5B8C8;padding:10px;margin-botton:10px;display:block;}
	</style>
	
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>

			    <div class="optn">
			        <button type="button" onclick="validate(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="padding-top:0;">
						    			
											
			 <form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />target="submitFrame">
			 <input type="hidden" name="exeid" value="${exeid}">
			 <input type="hidden" name="iframeId" value="${iframeId}">
			<input type="hidden" name="formId" value="65eec5ae8fa948b0bfaa48c814f5725d" />
			<input type="hidden" name="definedMsg" value="${definedMsg}">
			<input type="hidden" name="file_type" value="add_file">
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
			<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="65eec5ae8fa948b0bfaa48c814f5725d" type="add" />
  <div class="mod">		
  <div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
  <div class="mod-hd" style="height:160px;border-bottom: none;">
	<table class="basic-table" id="table1" name="table1" style="margin-top:10px">
	<input type="hidden" name="formIds" value="65eec5ae8fa948b0bfaa48c814f5725d" />
	<input type="hidden" name="65eec5ae8fa948b0bfaa48c814f5725d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'edaaa12f66d04b4e8eeb0bfaa863e9f5'" />
		<s:set name="_$formId_1" value="'65eec5ae8fa948b0bfaa48c814f5725d'" />
		<s:set name="_$type" value="'add'" />
		
		<tr>
		
               			
                <td  class="name" style="width:65px;"/><span class="dot">*</span><bu:uitn colNo="CR_TYPE" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td  class="dec" style="width:230px;"><bu:ui colNo="CR_TYPE" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_TYPE}" formIndex="1" /></td>
               
		<td  class="name" style="width:65px;"/><span class="dot">*</span><bu:uitn colNo="CR_STATUS" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td  class="dec" style="width:230px;"><bu:ui colNo="CR_STATUS" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_STATUS}" formIndex="1" /></td>
		</tr>
		<tr>
		<td  class="name " ><span class="dot" id="pi">*</span><bu:uitn colNo="CR_PROJECT_ID" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
                <td  class="dec" ><bu:ui colNo="CR_PROJECT_ID" id="CR_PROJECT_ID" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_PROJECT_ID}" formIndex="1" /></td>
                <td  class="name " ><span class="dot" id="mc">*</span><bu:uitn colNo="CR_MODEL_CODE" formId="65eec5ae8fa948b0bfaa48c814f5725d"  /></td>
                <td  class="dec" ><bu:ui colNo="CR_MODEL_CODE" id="MODEL_CODE" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_MODEL_CODE}" formIndex="1"  /></td>
		</tr>	
		<tr>
		<td class="name"/><bu:uitn colNo="CR_MEMO" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td  colspan="5" height="80px" class="dec"><bu:ui colNo="CR_MEMO" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_MEMO}" formIndex="1" style="height:100%;width:100%"/></td>	
		</tr>
			
	</table>
	</div>
       
			
        <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="主料信息" /></h3>	
        </div>
        <div class="mod-hd" style="height:80px;border-bottom: none;">
	<table class="basic-table" id="table2" name="table2"  style="margin-top:10px">
			<tr>
		<!--<td class="name"  style="width:65px;"/><span class="dot">*</span><bu:uitn colNo="CR_ITEM_MIAN" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>-->
	 
		<!--<td class="dec"><bu:ui  id="main_code" colNo="CR_ITEM_MIAN" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_ITEM_MAIN}" formIndex="1" /></td>-->
	 
		<!--<td class="dec">
		
		<input title="<dict:lang value="双击弹窗,选择主料"/>" editname="paraMap1@0#CR_ITEM_MIAN" type="text" id="main_code_SHOW" class="input _VAL_NULL input isSubmit _VAL_OjbsData" ondblclick="showPopDiv(0);" readonly="readonly">
		<button type="button" class="ico ico-search" onclick="showPopDiv(0);" title="单击弹窗,选择主料"></button>
		</td>-->
		<input type="hidden" id="main_code" name="paraMap1@0#CR_ITEM_MIAN" class="_VAL_NULL input isSubmit _VAL_OjbsData">
		<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CR_ITEM_MIAN" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		     <bu:td id="itemitem" cssClass="dec-self" colNo="CR_ITEM_MIAN" formId="65eec5ae8fa948b0bfaa48c814f5725d" ><bu:ui colNo="CR_ITEM_MIAN" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" />
		     <bu:td id="cr_project_item" cssClass="dec" colNo="CR_PROJECT_ITEM" formId="65eec5ae8fa948b0bfaa48c814f5725d" ><bu:ui colNo="CR_PROJECT_ITEM" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_PROJECT_ITEM}" formIndex="2" /></bu:td>
		     <bu:td id="cr_bom_item" cssClass="dec" colNo="CR_BOM_ITEM" formId="65eec5ae8fa948b0bfaa48c814f5725d" ><bu:ui colNo="CR_BOM_ITEM" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_BOM_ITEM}" formIndex="2" /></bu:td>
		</bu:td>
		
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="CR_MAIN_NAME" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td class="dec"><bu:ui id="CR_MAIN_NAME" colNo="CR_MAIN_NAME" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_MAIN_NAME}" formIndex="1" />
		
		</td>
		<td class="name" style="width:65px;"/><bu:uitn colNo="CR_MAIN_TYPE" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td class="dec" style="width:230px;"><bu:ui id="CR_MAIN_TYPE" colNo="CR_MAIN_TYPE" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_MAIN_TYPE}" formIndex="1" />
		
		</td>
		</tr>
	</table>
	</div>
	
			
        <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="替代料信息" /></h3>	
 	</div>
  	<div class="mod-hd" style="height:80px;border-bottom: none;">
	<table class="basic-table" id="table3" name="table3"  style="margin-top:10px">
			<tr>
		<td class="name" style="width:65px;"/><span class="dot">*</span><bu:uitn colNo="CR_ITEM_REPLACE" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td class="dec"><bu:ui id="replay_code"  colNo="CR_ITEM_REPLACE" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_ITEM_REPLACE}" formIndex="1" /></td>
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="CR_ITEM_NAME" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td class="dec"><bu:ui id="CR_ITEM_NAME" colNo="CR_ITEM_NAME" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_ITEM_NAME}" formIndex="1" /></td>
		<td class="name" style="width:65px;"/><bu:uitn colNo="CR_ITEM_DESC" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td class="dec" style="width:230px;"><bu:ui id="CR_ITEM_DESC" colNo="CR_ITEM_DESC" formId="65eec5ae8fa948b0bfaa48c814f5725d" value="%{CR_ITEM_DESC}" formIndex="1" /></td>
		</tr>	
	</table>
	</div>
	

  	
	</div>
												
			<bu:jsVal formId="65eec5ae8fa948b0bfaa48c814f5725d" formIndex="1" />
									</form>
									
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
                <bu:submit viewId="edaaa12f66d04b4e8eeb0bfaa863e9f5" />
		<bu:script viewId="edaaa12f66d04b4e8eeb0bfaa863e9f5" />
<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	select();
</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp"%>
