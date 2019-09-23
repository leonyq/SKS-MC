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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
	<style type="text/css">
	.x-fieldset{border:1px solid #B5B8C8;padding:10px;margin-botton:10px;display:block;}
	</style>
	<script type = "text/javascript">
	function selectType(obj){
	     //全局0工单1机种2
	      var selectvalue = $("#paraMap1_CR_TYPE").val();
	      var inputobj1 = document.getElementById("CR_PROJECT_ID_SHOW");
	      var inputobj2 = document.getElementById("MODEL_CODE_SHOW");
	      if(obj=="2"){
	       $("#CR_MAIN_NAME").attr("value","");
              $("#CR_MAIN_TYPE").attr("value","");
	      }
	     
	      if(selectvalue =="0"){
	      document.getElementById("cr_project_item").style.display = "none";
	      document.getElementById("cr_bom_item").style.display = "none";
	      document.getElementById("itemitem").style.display = "block";
	      $("#paraMapObj.CR_ITEM_MIAN").attr("value","");
	      $("#paraMapObj_CR_ITEM_MIAN_SHOW").attr("value","");
	      $("#paraMapObj_CR_PROJECT_ITEM").attr("value","");
              $("#paraMapObj_CR_PROJECT_ITEM_SHOW").attr("value","");
              $("#paraMapObj_CR_BOM_ITEM").attr("value","");
              $("#paraMapObj_CR_BOM_ITEM_SHOW").attr("value","");
	     // $("#CR_MAIN_NAME").attr("value","");
	    //  $("#CR_MAIN_TYPE").attr("value","");
	            $("#pi").text("");
                    $("#mc").text("");
	          $("#MODEL_CODE").attr("value","");
	          $("#CR_PROJECT_ID").attr("value","");
	          $("#CR_PROJECT_ID_SHOW").attr("value","");
	          $("#MODEL_CODE_SHOW").attr("value","");
	          inputobj1.disabled =true;
	          inputobj2.disabled =true;
	           $("#CR_PROJECT_ID_SHOW").addClass("readonly");
	           $("#CR_PROJECT_ID_SHOW").next("img").unbind("click").removeAttr("onclick");
	           $("#MODEL_CODE_SHOW").addClass("readonly");
	           $("#MODEL_CODE_SHOW").next("img").unbind("click").removeAttr("onclick");
	          $(inputobj1).parent().find("button").attr("disabled",true);
	          $(inputobj2).parent().find("button").attr("disabled",true);
	          $("#CR_PROJECT_ID_SHOW").removeClass("_VAL_NULL");
	          $("#MODEL_CODE_SHOW").removeClass("_VAL_NULL");	          
	          $("#paraMapObj_CR_ITEM_MIAN_SHOW").addClass("_VAL_NULL");
	          $("#paraMapObj_CR_PROJECT_ITEM_SHOW").removeClass("_VAL_NULL");
	          $("#paraMapObj_CR_BOM_ITEM_SHOW").removeClass("_VAL_NULL");
	     }else if(selectvalue =="1"){
	          document.getElementById("cr_project_item").style.display = "block";
	          document.getElementById("cr_bom_item").style.display = "none";
	          document.getElementById("itemitem").style.display = "none";
	          $("#paraMapObj.CR_ITEM_MIAN").attr("value","");
	          $("#paraMapObj_CR_ITEM_MIAN_SHOW").attr("value","");
	          $("#paraMapObj_CR_BOM_ITEM").attr("value","");
                  $("#paraMapObj_CR_BOM_ITEM_SHOW").attr("value","");
	       //   $("#CR_MAIN_NAME").attr("value","");
	       //   $("#CR_MAIN_TYPE").attr("value","");
	           $("#pi").text("*");
                    $("#mc").text("");
	            $("#MODEL_CODE").attr("value","");
	            $("#MODEL_CODE_SHOW").attr("value","");
	          inputobj1.disabled = false;
	          $("#CR_PROJECT_ID_SHOW").removeClass("readonly");
	          $("#CR_PROJECT_ID_SHOW").next("img").bind().attr("onclick","_showSelFkSql(document.getElementById('CR_PROJECT_ID_SHOW'),'edit%2C65eec5ae8fa948b0bfaa48c814f5725d%2Cb83dbcf606e746fc92fcfa1592447ff9','工单','','%7B%22WP_WIDTH%22%3A%221100%22%2C%22WP_HEIGHT%22%3A%22500%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','53b181d2-2c88-4d77-b7a9-287c8343c8d1');");
	          inputobj2.disabled = true;
	          $("#MODEL_CODE_SHOW").addClass("readonly");
	          $("#MODEL_CODE_SHOW").next("img").unbind("click").removeAttr("onclick");
	           $(inputobj1).parent().find("button").attr("disabled",false);
	          $(inputobj2).parent().find("button").attr("disabled",true);
	   
	           $("#CR_PROJECT_ID_SHOW").addClass("_VAL_NULL");
	          $("#MODEL_CODE_SHOW").removeClass("_VAL_NULL");	          
	          $("#paraMapObj_CR_ITEM_MIAN_SHOW").removeClass("_VAL_NULL");
	          $("#paraMapObj_CR_PROJECT_ITEM_SHOW").addClass("_VAL_NULL");
	         $("#paraMapObj_CR_BOM_ITEM_SHOW").removeClass("_VAL_NULL");  
		 
	           
	     }else if(selectvalue =="2"){
	          document.getElementById("cr_project_item").style.display = "none";
	          document.getElementById("cr_bom_item").style.display = "block";
	          document.getElementById("itemitem").style.display = "none";
	          $("#paraMapObj.CR_ITEM_MIAN").attr("value","");
	          $("#paraMapObj_CR_ITEM_MIAN_SHOW").attr("value","");
	          $("#paraMapObj_CR_PROJECT_ITEM").attr("value","");
                  $("#paraMapObj_CR_PROJECT_ITEM_SHOW").attr("value","");
	     //     $("#CR_MAIN_NAME").attr("value","");
	     //    $("#CR_MAIN_TYPE").attr("value","");
	           $("#pi").text("");
                   $("#mc").text("*");
	           $("#CR_PROJECT_ID").attr("value","");
	           $("#CR_PROJECT_ID_SHOW").attr("value","");
	          inputobj1.disabled = true;
	          $("#CR_PROJECT_ID_SHOW").addClass("readonly");
	          $("#CR_PROJECT_ID_SHOW").next("img").unbind("click").removeAttr("onclick");
	          inputobj2.disabled = false;
	           $("#MODEL_CODE_SHOW").removeClass("readonly");
	           $("#MODEL_CODE_SHOW").next("img").bind().attr("onclick","_showSelFkSql(document.getElementById('MODEL_CODE_SHOW'),'edit%2C65eec5ae8fa948b0bfaa48c814f5725d%2C334029b6caab44c49d1b63f3b027fb4e','机种','','%7B%22WP_WIDTH%22%3A%22%22%2C%22WP_HEIGHT%22%3A%22400%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','68d897e1-f49d-4b4a-bda4-f74e9051d20e');");
	           $(inputobj1).parent().find("button").attr("disabled",true); 
	          $(inputobj2).parent().find("button").attr("disabled",false);
	         
		  $("#CR_PROJECT_ID_SHOW").removeClass("_VAL_NULL");
	          $("#MODEL_CODE_SHOW").addClass("_VAL_NULL");		          
	          $("#paraMapObj_CR_ITEM_MIAN_SHOW").removeClass("_VAL_NULL");
	          $("#paraMapObj_CR_PROJECT_ITEM_SHOW").removeClass("_VAL_NULL");
	         $("#paraMapObj_CR_BOM_ITEM_SHOW").addClass("_VAL_NULL");
	    
	          
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
	           $("#CR_PROJECT_ID_SHOW").next("img").unbind("click").removeAttr("onclick");
	           $("#MODEL_CODE_SHOW").addClass("readonly");
	           $("#MODEL_CODE_SHOW").next("img").unbind("click").removeAttr("onclick");
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
	           $("#CR_PROJECT_ID_SHOW").next("img").bind().attr("onclick","_showSelFkSql(document.getElementById('CR_PROJECT_ID_SHOW'),'edit%2C65eec5ae8fa948b0bfaa48c814f5725d%2Cb83dbcf606e746fc92fcfa1592447ff9','工单','','%7B%22WP_WIDTH%22%3A%221100%22%2C%22WP_HEIGHT%22%3A%22500%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','53b181d2-2c88-4d77-b7a9-287c8343c8d1');");
	          inputobj2.disabled = true;
	          $("#MODEL_CODE_SHOW").addClass("readonly");
	          $("#MODEL_CODE_SHOW").next("img").unbind("click").removeAttr("onclick");
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
	           $("#CR_PROJECT_ID_SHOW").next("img").unbind("click").removeAttr("onclick");
	          inputobj2.disabled = false;
	           $("#MODEL_CODE_SHOW").removeClass("readonly");
	           $("#MODEL_CODE_SHOW").next("img").bind().attr("onclick","_showSelFkSql(document.getElementById('MODEL_CODE_SHOW'),'edit%2C65eec5ae8fa948b0bfaa48c814f5725d%2C334029b6caab44c49d1b63f3b027fb4e','机种','','%7B%22WP_WIDTH%22%3A%22%22%2C%22WP_HEIGHT%22%3A%22400%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','68d897e1-f49d-4b4a-bda4-f74e9051d20e');");
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
	    		 $("#CR_PROJECT_ID_SHOW").next("img").unbind("click").removeAttr("onclick");
	    		 $("#MODEL_CODE_SHOW").addClass("readonly");
	    		 $("#MODEL_CODE_SHOW").next("img").unbind("click").removeAttr("onclick");
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
	    		 $("#CR_PROJECT_ID_SHOW").next("img").bind().attr("onclick","_showSelFkSql(document.getElementById('CR_PROJECT_ID_SHOW'),'edit%2C65eec5ae8fa948b0bfaa48c814f5725d%2Cb83dbcf606e746fc92fcfa1592447ff9','工单','','%7B%22WP_WIDTH%22%3A%221100%22%2C%22WP_HEIGHT%22%3A%22500%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','53b181d2-2c88-4d77-b7a9-287c8343c8d1');");
	    		 $("#MODEL_CODE_SHOW").attr("disabled","disabled");
	    		  $("#MODEL_CODE_SHOW").addClass("readonly");
	    		  $("#MODEL_CODE_SHOW").next("img").unbind("click").removeAttr("onclick");
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
	    	         $("#CR_PROJECT_ID_SHOW").next("img").unbind("click").removeAttr("onclick");
	    		 $("#MODEL_CODE_SHOW").removeAttr("disabled");
	    		 $("#MODEL_CODE_SHOW").removeClass("readonly");
	    		 $("#MODEL_CODE_SHOW").next("img").bind().attr("onclick","_showSelFkSql(document.getElementById('MODEL_CODE_SHOW'),'edit%2C65eec5ae8fa948b0bfaa48c814f5725d%2C334029b6caab44c49d1b63f3b027fb4e','机种','','%7B%22WP_WIDTH%22%3A%22%22%2C%22WP_HEIGHT%22%3A%22400%22%2C%22WP_FULL_SCREEN%22%3A%220%22%7D','68d897e1-f49d-4b4a-bda4-f74e9051d20e');");
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
	      
	        var sqlUrl2 ="${path}buss/bussModel_exeFunc.ms?funcMId=d55495acbdfa4f0b858d8ee6b9be0600"; 
	    	 var info='';
	    	 if(val==0){
	    		 info='物料信息'; 
	    	 }else if(val==1){
	    		 info='工单BOM信息';
	    	 }else if(val==2){
	    		 info='BOM信息';
	    	 }
	    	var project_id = $("#CR_PROJECT_ID").val();
	    	 var mode_code = $("#MODEL_CODE").val();
	    	 var url=sqlUrl2;//+"&type="+val+"&project_id="+project_id+"&mode_code="+mode_code;
	    	   $.ajax({
		    		url:url,
		    		type:"post",
		    		data:{
		    		    "type":val,
		    		    "project_id":project_id,
		    		    "mode_code":mode_code
		    		},
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
		$("#paraMapObj_CR_BOM_ITEM").attr("disabled",true);
		$("#paraMapObj_CR_PROJECT_ITEM").attr("disabled",true);
		if($("#paraMap1_CR_TYPE").val()==1){
      $("#CR_PROJECT_ID_SHOW").addClass('_VAL_NULL');
      $("#MODEL_CODE_SHOW").removeClass('_VAL_NULL');
   }else  if($("#paraMap1_CR_TYPE").val()==2){
      $("#MODEL_CODE_SHOW").addClass('_VAL_NULL');
      $("#CR_PROJECT_ID_SHOW").removeClass('_VAL_NULL');
   }
   
            if($("#paraMap1_CR_TYPE").val()==""){
				_alertValMsg($("#paraMap1_CR_TYPE_chosen"), "<dict:lang value="该项不能为空" />");
				return;
			}
   
			var isQuery = false; 
			if(isQuery){util.alert("?数据正在提交，请稍候...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			
	        emptyValToHide('N');
			validate_code();
			isQuery = true;
		}
	
	 function validate_code(){
             var ipt1 = document.getElementById("MODEL_CODE").value;
          //   var ipt2 = document.getElementById("main_code_SHOW").value; 
             var ipt2 = document.getElementById("paraMapObj_CR_ITEM_MIAN").value;
             var ipt3 = document.getElementById("replay_code_SHOW").value; 
             var ipt4 = document.getElementById("CR_PROJECT_ID").value;
             var ipt5 = $("#paraMap1_CR_TYPE option:selected").val();
             
             if(ipt1!=null && ipt1!="" &&ipt1 == ipt2 && ipt1!=ipt3){
            // utilsFp.alert("<dict:lang value="机种与主料不能相同" />");
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
                 $("#CR_ITEM_NAME").removeAttr("disabled");
      		 $("#CR_ITEM_DESC").removeAttr("disabled");
                 document.forms.editForm.submit();
               }
             }else if(ipt5 == "2"){
               if(ipt1 == ""){
               //utilsFp.alert("<dict:lang value="机种不能为空" />");
               utilsFp.confirmIcon(3,"","","", "<dict:lang value="机种不能为空" />",0,"","");
               }else{
                 $("#CR_ITEM_NAME").removeAttr("disabled");
                 $("#CR_ITEM_DESC").removeAttr("disabled");
                 document.forms.editForm.submit();
               }
             }else if(ipt5 == "0"){
                 $("#CR_ITEM_NAME").removeAttr("disabled");
                 $("#CR_ITEM_DESC").removeAttr("disabled");
                 document.forms.editForm.submit();
             }
             }
             
             }
	</script>
	
</head>
<body style="background-color:#fff;">
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame">
								<bu:formet exeid="%{exeid}" /> 
            <div class="hd" style="background-color: #f6f5f7;padding-bottom: 10px;padding-top: 6px;margin:0">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:10px;">
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
			    	        <button type="button" onclick="validate(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd" style="padding-top:0;border-bottom:0;">
					
					<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
			 					<input type="hidden" name="iframeId" value="${iframeId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name="file_type" value="edit_file">
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="65eec5ae8fa948b0bfaa48c814f5725d" type="edit" />
  <div class="mod">		
  <div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
  <div class="mod-hd" style="height:160px;border-bottom: none;">
	<table class="basic-table" id="table1" name="table1" style="margin-top:10px;">
	<input type="hidden" name="formIds" value="65eec5ae8fa948b0bfaa48c814f5725d" />
	<input type="hidden" name="65eec5ae8fa948b0bfaa48c814f5725d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="paraItemCode" id="paraItemCode" />
		<s:set name="_$viewId" value="'740286f0f47f40d9a9d52f3dc4005a9f'" />
		<s:set name="_$formId_1" value="'65eec5ae8fa948b0bfaa48c814f5725d'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:68px"/><span class="dot"></span><bu:uitn colNo="CR_TYPE" formId="65eec5ae8fa948b0bfaa48c814f5725d" id="CR_TYPE_T"/></td>
			<td class="dec" ><bu:ui colNo="CR_TYPE" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" id="paraMap1_CR_TYPE"/></td>
			<td class="name" style="width:65px"><span class="dot"></span><bu:uitn colNo="CR_STATUS" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
			<td class="dec"  style="width:230px"><bu:ui colNo="CR_STATUS" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
		<td class="name" ><span class="dot">*</span><bu:uitn colNo="CR_PROJECT_ID" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
                <td class="dec"><bu:ui colNo="CR_PROJECT_ID" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" id="CR_PROJECT_ID"  /></td>
                <td class="name"><span class="dot">*</span><bu:uitn colNo="CR_MODEL_CODE" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
                <td class="dec"><bu:ui colNo="CR_MODEL_CODE" id="MODEL_CODE" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1"  /></td>
		</tr>
		<tr>
		<td class="name"/><bu:uitn colNo="CR_MODEL_CODE_VER" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td class="dec"><bu:ui colNo="CR_MODEL_CODE_VER" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" readonly="readonly"/></td>	
		</tr>		
		<tr>
		<td  class="name"><bu:uitn colNo="CR_MEMO" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td  colspan="3" height="80px" class="dec"><bu:ui colNo="CR_MEMO" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" style="width:100%;height:100%"/></td>
		</tr>	
			
	</table>
	</div>

	    <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="主料信息" /></h3>	
        </div>
        <div class="mod-hd" style="height:80px;border-bottom: none;">	
        	<!-- value="${dataMap1.paraid}"-->
	 <table class="basic-table" id="table2" name="table2"  style="margin-top:10px;">
		<tr>
		<input type="hidden" id="main_code" name="paraMap1@0#CR_ITEM_MIAN" class="_VAL_NULL input isSubmit _VAL_OjbsData">
		<td class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="CR_ITEM_MIAN" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<bu:td cssClass="dec" id="itemitem" colNo="CR_ITEM_MIAN" formId="65eec5ae8fa948b0bfaa48c814f5725d" ><bu:ui colNo="CR_ITEM_MIAN" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" />
		</bu:td>
		<bu:td cssClass="dec" id="cr_project_item" colNo="CR_PROJECT_ITEM" formId="65eec5ae8fa948b0bfaa48c814f5725d" ><bu:ui colNo="CR_PROJECT_ITEM" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="2" />
		</bu:td>
		<bu:td cssClass="dec" id="cr_bom_item" colNo="CR_BOM_ITEM" formId="65eec5ae8fa948b0bfaa48c814f5725d" ><bu:ui colNo="CR_BOM_ITEM" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="2" />
		</bu:td>
		</tr>
		

		<tr>
		<td class="name"><bu:uitn colNo="CR_MAIN_NAME" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td class="dec"><bu:ui id="CR_MAIN_NAME" colNo="CR_MAIN_NAME" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" /></td>
		<td class="name" style="width:65px"><bu:uitn colNo="CR_MAIN_TYPE" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td class="dec" style="width:230px"><bu:ui id="CR_MAIN_TYPE" colNo="CR_MAIN_TYPE" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" /></td>
		</tr> 
	</table> 
	</div>
	
	
	
	
	
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="替代料信息" /></h3>	
 	</div>
  	<div class="mod-hd" style="height:80px;border-bottom: none;">
	<table class="basic-table" id="table3" name="table3"  style="margin-top:10px;">
			<tr>
		<td class="name" style="width:65px"><span class="dot">*</span><bu:uitn colNo="CR_ITEM_REPLACE" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td class="dec"><bu:ui colNo="CR_ITEM_REPLACE" id="replay_code" formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
		<td class="name"><bu:uitn colNo="CR_ITEM_NAME" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td class="dec"><bu:ui id="CR_ITEM_NAME" colNo="CR_ITEM_NAME"  formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" /></td>
		<td class="name" style="width:65px"><bu:uitn colNo="CR_ITEM_DESC" formId="65eec5ae8fa948b0bfaa48c814f5725d" /></td>
		<td class="dec" style="width:230px"><bu:ui id="CR_ITEM_DESC" colNo="CR_ITEM_DESC"  formId="65eec5ae8fa948b0bfaa48c814f5725d" dataId="${dataId}" formIndex="1" /></td>
		</tr>	
	</table>
	</div>
	

	</div>											
			<bu:jsVal formId="65eec5ae8fa948b0bfaa48c814f5725d" formIndex="1" />
									</form>
			</div>
		
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
        <bu:submit viewId="740286f0f47f40d9a9d52f3dc4005a9f" />
        <bu:script viewId="740286f0f47f40d9a9d52f3dc4005a9f" />
	<script type="text/javascript">
	    	$('#paraMapObj_CR_STATUS_1').on("click",function(){
	    
	    if($(this).attr('checked')){
	       
	        $('#paraMapObj_CR_STATUS_1').val("Y");
	    }else{
	        
	        $('#paraMapObj_CR_STATUS_1').val("N");
	        
	    }
	    
	});
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			
			
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		

		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
					}
			   }
			});
		}
		$(function(){
		    $('#CR_ITEM_NAME').removeClass('readonly');
			$('#CR_ITEM_DESC').removeClass('readonly');
		    
		})
		function init(){
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		
	//重置	
	var itemReplaceSn = $("#paraMapObj_CR_ITEM_MIAN").val();
	var type = $("#paraMap1_CR_TYPE").val();//0 全局 2 机种 1 工单	
	function resetForm(){
		$("#editForm")[0].reset();
		$("#paraMapObj_CR_ITEM_MIAN").val(itemReplaceSn);
		$("#paraMapObj_CR_ITEM_MIAN_SHOW").val(itemReplaceSn);		
		if(type=="0"){
		$("#paraMapObj_CR_PROJECT_ITEM").val("");
		$("#paraMapObj_CR_PROJECT_ITEM_SHOW").val("");
		$("#paraMapObj_CR_BOM_ITEM").val("");
		$("#paraMapObj_CR_BOM_ITEM_SHOW").val("");		
		}else if(type=="2"){
		$("#paraMapObj_CR_BOM_ITEM").val(itemReplaceSn);
		$("#paraMapObj_CR_BOM_ITEM_SHOW").val(itemReplaceSn);
		$("#paraMapObj_CR_PROJECT_ITEM").val("");
		$("#paraMapObj_CR_PROJECT_ITEM_SHOW").val("");			
		}else if(type=="1"){
		$("#paraMapObj_CR_PROJECT_ITEM").val(itemReplaceSn);
		$("#paraMapObj_CR_PROJECT_ITEM_SHOW").val(itemReplaceSn);
		$("#paraMapObj_CR_BOM_ITEM").val("");
		$("#paraMapObj_CR_BOM_ITEM_SHOW").val("");			
		}
		
	}
	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>

</script>
<script type="text/javascript">
      function initRepleace(){
           var value = $("#paraMapObj_CR_ITEM_MIAN_SHOW").val();
           selectType("1");
           var selectvalue = $("#paraMap1_CR_TYPE").val();
           if(selectvalue =="1"){
           $("#paraMapObj_CR_PROJECT_ITEM_SHOW").val(value);
		   $("#CR_PROJECT_ID_SHOW").addClass("_VAL_NULL");
	          $("#MODEL_CODE_SHOW").removeClass("_VAL_NULL");	          
	          $("#paraMapObj_CR_ITEM_MIAN_SHOW").removeClass("_VAL_NULL");
	          $("#paraMapObj_CR_PROJECT_ITEM_SHOW").addClass("_VAL_NULL");
	         $("#paraMapObj_CR_BOM_ITEM_SHOW").removeClass("_VAL_NULL");           
           }else if(selectvalue =="2"){
           $("#paraMapObj_CR_BOM_ITEM_SHOW").val(value);
		  $("#CR_PROJECT_ID_SHOW").removeClass("_VAL_NULL");
	          $("#MODEL_CODE_SHOW").addClass("_VAL_NULL");		          
	          $("#paraMapObj_CR_ITEM_MIAN_SHOW").removeClass("_VAL_NULL");
	          $("#paraMapObj_CR_PROJECT_ITEM_SHOW").removeClass("_VAL_NULL");
	         $("#paraMapObj_CR_BOM_ITEM_SHOW").addClass("_VAL_NULL");	
           }else if(selectvalue =="0"){
           $("#paraMapObj_CR_ITEM_MIAN_SHOW").val(value);
	          $("#CR_PROJECT_ID_SHOW").removeClass("_VAL_NULL");
	          
	          $("#MODEL_CODE_SHOW").removeClass("_VAL_NULL");	          
	          $("#paraMapObj_CR_ITEM_MIAN_SHOW").addClass("_VAL_NULL");
	          $("#paraMapObj_CR_PROJECT_ITEM_SHOW").removeClass("_VAL_NULL");
	          $("#paraMapObj_CR_BOM_ITEM_SHOW").removeClass("_VAL_NULL");
           }
	      
       } 
         initRepleace();
         
         /*
         function cbfuns(){
	    var mian=$("#paraMapObj_CR_ITEM_MIAN_SHOW").val();
	    if(mian==""||mian==null){
	        $("#CR_MAIN_NAME").val("");
	         $("#CR_MAIN_TYPE").val("");
	    }
	    
	}
	function cbfuno(){
	    var mian=$("#paraMapObj_CR_PROJECT_ITEM_SHOW").val();
	    if(mian==""||mian==null){
	        $("#CR_MAIN_NAME").val("");
	         $("#CR_MAIN_TYPE").val("");
	    }
	    
	}
	function cbfunp(){
	    var mian=$("#paraMapObj_CR_BOM_ITEM_SHOW").val();
	    if(mian==""||mian==null){
	        $("#CR_MAIN_NAME").val("");
	         $("#CR_MAIN_TYPE").val("");
	    }
	    
	}
	
	function cbFu(){
	    var mian=$("#replay_code_SHOW").val();
	    if(mian==""||mian==null){
	        $("#CR_ITEM_NAME").val("");
	         $("#CR_ITEM_DESC").val("");
	    }
	    
	}
	*/
	</script> 
	
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
</jsp:include>
</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
