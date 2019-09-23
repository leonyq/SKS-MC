<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title><dict:lang value="动作配置新增"/></title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="dmp" value="1" />
		<jsp:param name="uEditor" value="1" />
	</jsp:include>	
	<style>
	.layui-fluid{
		overflow:auto;
		padding-bottom:68px;
	}
	.layui-form-select dl {
		position: absolute;
		left: 0;
		top: 42px;
		padding: 5px 0;
		z-index: 1000;
		min-width: 100%;
		border: 1px solid #d2d2d2;
		max-height: 300px;
		overflow-y: auto;
		background-color: #fff;
		border-radius: 2px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, .12);
		box-sizing: border-box
	}
	.layui-form-item {
	 margin-bottom: 10px;
	}
	.headline{
	 margin-bottom: 10px;
	}	
	
	</style>
</head>
<body>
    <div class="layui-fluid">
        <div class="headline"><dict:lang value="新增"/></div>   
        <form id="add_form" class="layui-form" name="addForm" action="${path}/dmp/DmpMotionAction_MotionModelAdd.ms" method="post">
        <input type="hidden" class="layui-input" name="procedureMotionDto.toaType" id="procedureMotionDto_toaType" value='B' lay-verify="required" >
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="动作编码"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" maxlength="20" placeholder="<dict:lang value="请输入动作编码"/>"  class="layui-input" name="procedureMotionDto.toaCode" id="procedureMotionDto_toaCode" onblur="validateCode(this.value)" lay-verify="required" >
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="动作名称"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" maxlength="33" placeholder="<dict:lang value="请输入动作名称"/>"   lay-verify="required" class="layui-input" name="procedureMotionDto.toaName" id="procedureMotionDto_toaName">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="提示信息"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" maxlength="50" placeholder="<dict:lang value="请输入提示信息"/>"  lay-verify="required" class="layui-input" name="procedureMotionDto.toaMsgCode" id="procedureMotionDto_toaMsgCode">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="参数"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" maxlength="20" placeholder="<dict:lang value="请输入参数"/>" lay-verify="required" class="layui-input" name="procedureMotionDto.toaParamCode" id="procedureMotionDto_toaParamCode" >
                    </div>

                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="应用分类"/></div>
                <div class="list-right">
                    <div class="pane" style="position:relative" >
                    <div class="layui-form" lay-filter="pane1" style="position:absolute;float:left;" id="acttype0" >                     
                     <select lay-search verify="required" name="procedureMotionDto.toaClassify" id="procedureMotionDto_toaClassify">
                     <c:forEach items="${dataMap.ACT_TYPE}" var="item">
                     <option value="${item.ACTIONTYPE_CODE}">${item.ACTIONTYPE_NAME}</option>
                     </c:forEach>
                     </select>	
                    </div>
                    <div class="layui-form" style="position:absolute;float:right;right:113px;top:0px;">
                    <button  type="button" class="layui-btn addActType"  ><dict:lang value="新增"/></button>
                    </div>
                     </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left" ><dict:lang value="备注信息"/></div>
                <div class="list-right">
                    <div class="pane">
                	<input class="layui-input" maxlength="600" style="height:38px;padding:8px;"  name="procedureMotionDto.toaRemark" id="procedureMotionDto_toaRemark" />
                	<!-- <script id="editor" name="procedureMotionDto.toaRemark" type="text/plain" style="height:350px"></script>  -->
                    </div>
                </div>
            </div>
          
        
        <div class="ptop_10">
         	 <button type="button" class="layui-btn" lay-filter="filterSubmit" onclick="addMotion()" ><dict:lang value="保存"/></button>
             <button type="button" class="layui-btn layui-btn-danger" id="cancelButten" onclick="addblack()"><dict:lang value="取消"/></button>   
        </div> 
       </form> 
    </div>
 

<script>
	 var form ;
    layui.use(['form'], function(){
       // var form = layui.form;
   		form = layui.form;
        form.render();
    
       /*  $(".layui-select-title .layui-input").on("keyup",function(e){  	 
	         if($(".layui-select-none").length==1){
	         	$(".layui-select-none").remove();
	         	$(".layui-anim .layui-anim-upbit").empty();
	         	$("#creatAndEdit").remove();
			    $(".layui-anim.layui-anim-upbit").append("<a id='creatAndEdit' style='cursor:pointer;' onclick='creatAndEdit()'><dict:lang value='创建与编辑'/>          "+$(".layui-select-title .layui-input").val()+"</a>");
	         }else{
	         	$("#creatAndEdit").remove();
	         }
		  });
		  $(".layui-select-title .layui-input").on("focus",function(e){
		  	$("#creatAndEdit").remove();
		  });  */
               var str = '<span class="operates" style="width:70px;">\
                            <span class="ico edit "></span>\
                        </span>'
       function menter(){//鼠标移入事件      
	   $(".layui-form-select .layui-anim dd").on("mouseenter",function(e){
	        var typeCode = $(this).attr("lay-value");
	        var typeName = $(this).text();	
            var str = '<div class="operates" style="width:70px;position:relative;float:right;">\
                            <span class="ico edit typeEdit " style="position:absolute;right:20px;top:3px;"></span>\
                            <span class="ico close typeDel "style="position:absolute;right:-5px;top:3px;"></span>\
                        </div>'              
	        $(this).append(str); 
	var typeStr2 = '            <div style="margin-top:30px;"><div class="layui-form-item">\
                <div class="list-left" style="margin-left:-25px;"><span class="Eng">*</span><dict:lang value="编码"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="hidden" id="oldType" value="'+typeCode+'">\
                        <input type="text" value="'+typeCode+'"  placeholder="<dict:lang value="请输入应用分类编码"/>"    maxlength="33"  class="layui-input" name="typeCode" id="typeCode" >\
                    </div>\
                </div>\
            </div>\
                                   <div class="layui-form-item">\
                <div class="list-left" style="margin-left:-25px;"><span class="Eng">*</span><dict:lang value="名称"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="text" value="'+typeName+'"  placeholder="<dict:lang value="请输入应用分类名称"/>"    maxlength="33"  class="layui-input" name="typeName" id="typeName" >\
                    </div>\
                </div>\
            </div>\
            </div>\
             <div class="ptop_10" style="z-index:1000" >\
              <button type="button" class="layui-btn editTypeSave" lay-filter="filterSubmit" ><dict:lang value="保存"/></button>\
             <button type="button" class="view layui-btn layui-btn-danger quit"><dict:lang value="取消"/></button>\
                    </div>';
    //修改图标事件	       
	$('.typeEdit').on('click',function(){
               layer.open({//修改弹窗
                title: '<dict:lang value="应用分类-修改"/>',
                skin: 'layui-layer-molv',
                area: ['390px','250px'],
                type: 1, 
                id: 'layerDemo', //防止重复弹出
                content: typeStr2,
		scrollbar: false,
                shade: 0.3 
            });
    //弹窗按钮事件
	//修改保存
	$('.editTypeSave').on('click',function(){
	var oldTypeCode = $('#oldType').val();
    var typeCode = $('#typeCode').val();
    var typeName = $('#typeName').val();
    if(typeCode==""){
    layer.msg("<dict:lang value='应用分类编码不能为空'/>", {time: 1000, icon:5});
    return false;
    }
    if(typeName==""){
    layer.msg("<dict:lang value='应用分类名称不能为空'/>", {time: 1000, icon:5});
    return false;
    }    
    optActType("edit",oldTypeCode,typeCode,typeName);
                    if(optFlag==false){
                return false;
                }
    $('#procedureMotionDto_toaClassify option').each(function(){
                  if($(this).val()==oldTypeCode){
                   $(this).remove();
                   return false;
                  }
    })    
    $('#procedureMotionDto_toaClassify').append('<option selected value="'+typeCode+'">'+typeName+'</option>');
    form.render(null,'pane1');
    menter();
    mleave();  
    $('.layui-layer-close').click();	
	})	
	//取消
	$('.quit').on('click',function(){
	$('.layui-layer-close').click();
	}) 	
	}) 	
	//删除图标事件
    $('.typeDel').on('click',function(){
           	var item = layer.open({
                title: '<dict:lang value="摩尔提示"/>',
                skin: 'layui-layer-molv',
                btn: ['<dict:lang value="确定"/>', '<dict:lang value="取消"/>'],
                yes: function(index, layero){
                optActType("del",typeCode,typeCode,typeName);
                if(optFlag==false){
                layer.close(item);
                return false;
                }
                $('#procedureMotionDto_toaClassify option').each(function(){
                  if($(this).val()==typeCode){
                   $(this).remove();
                   return false;
                  }
                })
               form.render(null,'pane1');
               menter();
               mleave();                    
                    layer.close(item);
                },btn2: function(index, layero){
                  //按钮【取消】的回调
                },
                area: ['260px','150px'],
               	type: 1, 
                id: 'hintDiv', //防止重复弹出
                content: '<p style="margin-top:25px;text-align:left;padding-left:20px;"><dict:lang value="是否确认删除"/></p>',
                shade: 0.3 
            });  
    })
	        
	   });       
       };		  
       function mleave(){//鼠标移除事件
       $(".layui-form-select .layui-anim dd").on("mouseleave",function(e){
            $(this).find('.operates').remove();
        })	         
       };
       menter();
       mleave();	 
	//应用分类的新增   
	var typeStr = '            <div style="margin-top:30px;"><div class="layui-form-item">\
                <div class="list-left" style="margin-left:-25px;"><span class="Eng">*</span><dict:lang value="编码"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="text"  placeholder="<dict:lang value="请输入应用分类编码"/>"    maxlength="33"  class="layui-input" name="typeCode" id="typeCode" >\
                    </div>\
                </div>\
            </div>\
                                   <div class="layui-form-item">\
                <div class="list-left" style="margin-left:-25px;"><span class="Eng">*</span><dict:lang value="名称"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="text"  placeholder="<dict:lang value="请输入应用分类名称"/>"    maxlength="33"  class="layui-input" name="typeName" id="typeName" >\
                    </div>\
                </div>\
            </div>\
            </div>\
             <div class="ptop_10" style="z-index:1000" >\
              <button type="button" class="layui-btn addTypeSave"  lay-filter="filterSubmit" ><dict:lang value="保存"/></button>\
             <button type="button" class="view layui-btn layui-btn-danger quit" ><dict:lang value="取消"/></button>\
                    </div>';
	$('.addActType').on('click',function(){
               layer.open({//新增弹窗
                title: '<dict:lang value="应用分类-新增"/>',
                skin: 'layui-layer-molv',
                area: ['390px','250px'],
                type: 1, 
                id: 'layerDemo', //防止重复弹出
                content: typeStr,
		scrollbar: false,
                shade: 0.3 
            });
    //弹窗按钮事件
	//新增保存
	$('.addTypeSave').on('click',function(){
    var typeCode = $('#typeCode').val();
    var typeName = $('#typeName').val();
    if(typeCode==""){
    layer.msg("<dict:lang value='应用分类编码不能为空'/>", {time: 1000, icon:5});
    return false;
    }
    if(typeName==""){
    layer.msg("<dict:lang value='应用分类名称不能为空'/>", {time: 1000, icon:5});
    return false;
    }  
    optActType("add","",typeCode,typeName);
    if(optFlag==false){
         return false;
    }
    $('#procedureMotionDto_toaClassify').append('<option selected value="'+typeCode+'">'+typeName+'</option>');
    form.render(null,'pane1');
    menter();
    mleave();  
    $('.layui-layer-close').click();	
	})
	//取消
	$('.quit').on('click',function(){
	$('.layui-layer-close').click();
	})      	
	}) 		  
    });
    var flag1 = true;
    function validateCode(value){
   	  $.post("${path}dmp/DmpMotionAction_validateCode.ms",{value:value},function(res){
		    if(res.ajaxMap.state==1){
		    	//$("#procedureMotionDto_toaCode").val("");
		    	flag1 = false;
		    	layer.msg("<dict:lang value='该动作代码已存在，请重新输入'/>", {time: 1000, icon:5});
		    }else{
		      flag1 = true;
		    }
      });
    }
    
   /* function creatAndEdit(){
    	//alert($(".layui-select-title .layui-input").val());
    	
    	var url = "${path}dmp/DmpMotionAction_motionAddType.ms";
		//var formData = form.serialize($("#searchForm"));
		var Mkey=$(".layui-select-title .layui-input").val();
	   
	   	$.post("${path}dmp/DmpMotionAction_motionAddType.ms",{Mkey:Mkey},function(res){
		    if(res.ajaxMap.state==1){		    	
		    	reLoadDictCache(Mkey);
		    }
      });
      
	   
    }*/

    /* jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {
	    	"Mkey":	Mkey
	    },
			success: function(data){
				var operHtml = "";
				try{
					if(null !=data.ajaxMap){	
						$.each(data.ajaxMap,function(key,values){   
						  
							var arr= key.split(",");						    
						    operHtml =operHtml +"<div class='cardPane open'>";						    
						    operHtml =operHtml +"<fieldset class='layui-elem-field layui-field-title'>";
                			operHtml =operHtml +"<legend>"+arr[0]+"("+values.length+")</legend>";
                			operHtml =operHtml +"<div class='more'>";
                    		operHtml =operHtml +"<div class='moreBtn showBtn'>";
                        	operHtml =operHtml +"<span class='moreIco'></span>";
                    		operHtml =operHtml +"</div>"; 
					    }); 
					    					    
					}					
					$("#cardlist").html(operHtml);
				}catch(e){
					console.log(e);			
				}
			},
			error: function(msg){
				
			}
		});*/
</script>


<script type="text/javascript">
    //实例化编辑器
 
   	
  /* 	$(function(){
   		addOption();

  
   	});
   	
     function addOption(){
			
	    	$("#procedureMotionDto_toaClassify").append("<option value='cjbj'>--创建与编辑--</option>");
	    	$(".layui-input layui-unselect").removeAttr("readonly");
	    	$(".layui-anim layui-anim-upbit").append("<div>33333</div>");
	 }*/
	 function addType(thisObj){
	 	
	 	
	 	
	 }
			
    	
	/*function reLoadDictCache(Mkey){
		
		var url = "${path}comm/CacheAction_reLoadDictCache.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){	
				var content = '<option value="' + Mkey + '">' + Mkey + '</option>';
				$("#procedureMotionDto_toaClassify").append(content);	
				$("#procedureMotionDto_toaClassify").val(Mkey);		
		        form.render(null,'pane1');
		       
    			$(".layui-select-title .layui-input").on("keyup",function(e){  	 
			       if($(".layui-select-none").length==1){
			         	$(".layui-select-none").remove();
			         	//if($("#creatAndEdit").length==0){
			         
			         	$(".layui-anim .layui-anim-upbit").empty();
			         	$("#creatAndEdit").remove();
			         	$(".layui-anim.layui-anim-upbit").append("<a id='creatAndEdit' style='cursor:pointer;' onclick='creatAndEdit()'><dict:lang value='创建与编辑'/>          "+$(".layui-select-title .layui-input").val()+"</a>");
			         	//}
			       }else{
			         	$("#creatAndEdit").remove();
			       }
				 });
				  $(".layui-select-title .layui-input").on("focus",function(e){
				  	$("#creatAndEdit").remove();
				  });  			
			},
			error: function(msg){
				util.alert("error:"+msg);
		   }
		});
	}*/
	function addMotion(){
   var toaCode = $("#procedureMotionDto_toaCode").val();
       if(flag1==false){
     layer.msg("<dict:lang value='该动作代码已存在，请重新输入'/>", {time: 1000, icon:5});
     return false;
     }	
   if(toaCode==""){
   return false;
   }
   var toaName = $("#procedureMotionDto_toaName").val();
   if(toaName==""){
   return false;
   }
   var toaMsgCode = $("#procedureMotionDto_toaMsgCode").val();
   if(toaMsgCode==""){
   return false;
   }
   var toaParamCode = $("#procedureMotionDto_toaParamCode").val();
   if(toaParamCode==""){
   return false;
   }
   var toaClassify = $("#procedureMotionDto_toaClassify").val();
   if(toaClassify==""){
   return false;
   }	
		var flag='${param.flag}';
		var url = "${path}dmp/DmpMotionAction_MotionModelAdd.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    data:{
	    	"paraMap.TOA_TYPE":$("#procedureMotionDto_toaType").val(),
	    	"paraMap.TOA_CODE":$("#procedureMotionDto_toaCode").val(),
	    	"paraMap.TOA_NAME":$("#procedureMotionDto_toaName").val(),
	    	"paraMap.TOA_MSGCODE":$("#procedureMotionDto_toaMsgCode").val(),
	    	"paraMap.TOA_PARAMCODE":$("#procedureMotionDto_toaParamCode").val(),
	    	"paraMap.TOA_CLASSIFY":$("#procedureMotionDto_toaClassify").val(),
	    	"paraMap.TOA_REMARK":$("#procedureMotionDto_toaRemark").val()	    
	    },
	    url: url,
		success: function(data){	
				/*var content = '<option value="' + Mkey + '">' + Mkey + '</option>';
				$("#procedureMotionDto_toaClassify").append(content);	
				$("#procedureMotionDto_toaClassify").val(Mkey);	*/	
				//alert("Ssssss");
				var dir='${param.dir}';
				if(flag=="orderSetting"){										
			  	  	window.parent.addActiveList(data.ajaxMap,"1","left");			  	 	 					  	 					
					window.parent.display1(); 
				}else{
					//window.history.back();
					window.location.href=document.referrer;
				}
		         			
			},
			error: function(msg){
				util.alert("error:"+msg);
		   }
		});
	}
	function addblack(){
	        var index = layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
			var flag='${param.flag}';
			if(flag=="orderSetting"){										
			  	  				  	 	 					  	 					
					window.parent.display1(); 
				}else{
					//window.history.back();
					window.location.href=document.referrer;
				}
	
		layer.close(index);
	}
	var optFlag = true;
	function optActType(flag,oldCode,code,name){
    var url = "${path}dmp/DmpMotionAction_optActType.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    async:false,
	    data:{
	    	"paraMap.flag":flag,
	    	"paraMap.oldCode":oldCode,
	    	"paraMap.code":code,
	    	"paraMap.name":name
	    },
	    url: url,
		success: function(data){	
              var res = data.ajaxString;	
              if(res=="SUCCESS"){
              optFlag = true;
              layer.msg("<dict:lang value='操作成功'/>", {time: 1000, icon:6});
              }else if(res=="ADDFAIL"){
              optFlag = false;
              layer.msg("<dict:lang value='新增失败'/>", {time: 1000, icon:5});
              }else if(res=="EDITFAIL"){
              optFlag = false;
              layer.msg("<dict:lang value='修改失败'/>", {time: 1000, icon:5});
              }else if(res=="DELFAIL"){
              optFlag = false;
              layer.msg("<dict:lang value='删除失败'/>", {time: 1000, icon:5});
              }else if(res=="ADDAGAIN"){
              optFlag = false;
              layer.msg("<dict:lang value='该应用分类编码已存在，请重新输入'/>", {time: 1000, icon:5});
              }else if(res=="EDITAGAIN"){
              optFlag = false;
              layer.msg("<dict:lang value='该应用分类编码已存在，请重新输入'/>", {time: 1000, icon:5});
              }else if(res=="EDITUSED"){
              optFlag = false;
              layer.msg("<dict:lang value='该应用分类编码已被引用，不允许更改'/>", {time: 1000, icon:5});
              }else if(res=="DELUSED"){
              optFlag = false;
              layer.msg("<dict:lang value='该应用分类编码已被引用，不允许删除'/>", {time: 1000, icon:5});
              }		         			
			},
			error: function(msg){
				util.alert("error:"+msg);
		   }
		});    
	}
</script>


</body>
</html>