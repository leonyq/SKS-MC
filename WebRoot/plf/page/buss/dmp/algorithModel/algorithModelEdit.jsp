<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title><dict:lang value="算法模型信息修改"/></title>
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
		#add_form .list-left{
    margin-left: 0px;
}
	</style>
</head>
<body>
    <div class="layui-fluid">
        <div class="headline"><dict:lang value="修改"/></div>
        <div class="codeView" onclick="toCodeView()"></div>
        <form id="add_form" class="layui-form" name="addForm" action="${path}dmp/DmpAction_algorithModelEdit.ms" method="post">
        	<input type="hidden" value='${dataMap.WPL_DESC}' id="procedureDto_wplDesc">
        	<input type="hidden" value="${dataMap.id}" id="procedureDto_id" name="procedureDto.id">
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="算法名称"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" placeholder="<dict:lang value="请输入算法名称"/>" maxlength="20"  class="layui-input" name="procedureDto.wplCode" id="procedureDto_wplCode" value="${dataMap.WPL_CODE}" readonly="readonly" lay-verify="required">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="算法描述"/></div>
                <div class="list-right">
                    <div class="pane">
                        <input type="text" placeholder="<dict:lang value="请输入算法描述"/>" maxlength="33"  class="layui-input" name="procedureDto.wplName" id="procedureDto_wplName" value="${dataMap.WPL_NAME}" lay-verify="required">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><span class="Eng">*</span><dict:lang value="应用分类"/></div>
                <div class="list-right">
                    <div class="pane" style="position:relative" >
                     	<div class="layui-form" lay-filter="pane1" style="position:absolute;float:left;" id="wpltype0">	
                     <select lay-search lay-verify="required" name="procedureDto.wplType" id="procedureDto_wplType">
                     <c:set var="typeval" value="${dataMap.WPL_TYPE}"></c:set>
                     <option  value=""><dict:lang value="--请选择--"/></option>
                     <c:forEach items="${dataMap.ALG_TYPE}" var="item">
                     <c:if test="${item.MODELTYPE_CODE == typeval}"><option selected value="${item.MODELTYPE_CODE}">${item.MODELTYPE_NAME}</option></c:if>
                     <c:if test="${item.MODELTYPE_CODE != typeval}"><option value="${item.MODELTYPE_CODE}">${item.MODELTYPE_NAME}</option></c:if>
                     </c:forEach>
                     </select>	
                    	</div>
                    <div class="layui-form" style="position:absolute;float:right;right:113px;top:0px;">
                    <button  type="button" class="layui-btn addAlgType"  ><dict:lang value="新增"/></button>
                    </div>
                     </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="list-left"><dict:lang value="算法模型详情说明"/></div>
                <div class="list-right">
                        <script id="editor" name="procedureDto.wplDesc" id="procedure_wplDesc" type="text/plain" style="height:350px"  ></script>
                </div>
            </div>
          
         <div class="ptop_10"  style="z-index:1000">
        	 <button type="button" class="layui-btn" id="addButten" onclick="preAdd()"><dict:lang value="新增"/></button>   
         	<button type="button" class="layui-btn" lay-filter="filterSubmit"   onclick="editAlg()" lay-submit="formSubmit"><dict:lang value="保存"/></button>
            <button type="button" class="layui-btn layui-btn-danger" id="cancelButten" onclick="editblack()"><dict:lang value="取消"/></button>   
        </div> 
        
       </form> 
     
    </div>
 

<script>
bulidEvenForDmpIcon();
function bulidEvenForDmpIcon(){
	$('.search').attr('title',"<dict:lang value='查询'/>");
	$('.icolist').attr('title',"<dict:lang value='列表'/>");
	$('.icocard').attr('title',"<dict:lang value='卡片'/>");
	$('.codeView').attr('title',"<dict:lang value='源码'/>");
	$('.code2').attr('title',"<dict:lang value='源码'/>");
	$('.code3').attr('title',"<dict:lang value='源码'/>");
	$('.add').attr('title',"<dict:lang value='添加'/>");
	$('.toRight').attr('title',"<dict:lang value='右移'/>");
	$('.toLeft').attr('title',"<dict:lang value='左移'/>");
	$('.edit').attr('title',"<dict:lang value='修改'/>");
	$('.close').attr('title',"<dict:lang value='删除'/>");
	$('.play').attr('title',"<dict:lang value='启动'/>");
	$('.pause').attr('title',"<dict:lang value='停止'/>");
}
	 var form;
    layui.use(['form'], function(){
         form = layui.form;
        form.render();
       /* $(".layui-select-title .layui-input").on("keyup",function(e){  	 
	         if($(".layui-select-none").length==1){
	         	$(".layui-select-none").remove();
	         	$(".layui-anim .layui-anim-upbit").empty();
	         	//console.log($(".layui-select-title .layui-input").val());
	         	$("#creatAndEdit").remove();
			    $(".layui-anim.layui-anim-upbit").append("<a id='creatAndEdit' onclick='creatAndEdit()' style='cursor:pointer;'><dict:lang value='创建与编辑'/>          "+$(".layui-select-title .layui-input").val()+"</a>");
	         }else{
	         	$("#creatAndEdit").remove();
	         }
		  });
		  $(".layui-select-title .layui-input").on("focus",function(e){
		  	$("#creatAndEdit").remove();
		  }); */
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
	        if(typeCode!=""){
	          $(this).append(str); 
	        }	 
	var typeStr2 = '            <div style="margin-top:30px;"><div class="layui-form-item">\
                <div class="list-left" style="margin-left: -20px;"><span class="Eng">*</span><dict:lang value="编码"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="hidden" id="oldType" value="'+typeCode+'">\
                        <input type="text" value="'+typeCode+'"  placeholder="<dict:lang value="请输入应用分类编码"/>"    maxlength="33"  class="layui-input" name="typeCode" id="typeCode" >\
                    </div>\
                </div>\
            </div>\
                                   <div class="layui-form-item">\
                <div class="list-left" style="margin-left: -20px;"><span class="Eng">*</span><dict:lang value="名称"/></div>\
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
    optAlgType("edit",oldTypeCode,typeCode,typeName);
    if(optFlag==false){
        return false;
    }    
    $('#procedureDto_wplType option').each(function(){
                  if($(this).val()==oldTypeCode){
                   $(this).remove();
                   return false;
                  }
    })    
    $('#procedureDto_wplType').append('<option selected value="'+typeCode+'">'+typeName+'</option>');
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
                optAlgType("del",typeCode,typeCode,typeName);
                if(optFlag==false){
                 layer.close(item);
                 return false;
                 }    
                $('#procedureDto_wplType option').each(function(){
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
                <div class="list-left" style="margin-left: -20px;"><span class="Eng">*</span><dict:lang value="编码"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="text"  placeholder="<dict:lang value="请输入应用分类编码"/>"    maxlength="33"  class="layui-input" name="typeCode" id="typeCode" >\
                    </div>\
                </div>\
            </div>\
                                   <div class="layui-form-item">\
                <div class="list-left" style="margin-left: -20px;"><span class="Eng">*</span><dict:lang value="名称"/></div>\
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
	$('.addAlgType').on('click',function(){
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
    optAlgType("add","",typeCode,typeName);
    if(optFlag==false){
         return false;
    }     
    $('#procedureDto_wplType').append('<option selected value="'+typeCode+'">'+typeName+'</option>');
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
    
   /* function creatAndEdit(){
    	//alert($(".layui-select-title .layui-input").val());
    	
    	//var url = "${path}dmp/DmpMotionAction_motionAddType.ms";
		//var formData = form.serialize($("#searchForm"));
		var Mkey=$(".layui-select-title .layui-input").val();
	   
	   	$.post("${path}dmp/DmpAction_motionAddType.ms",{Mkey:Mkey},function(res){
		    if(res.ajaxMap.state==1){		    	
		    	reLoadDictCache(Mkey);
		    }
      });
      
	   
    }
    
    function reLoadDictCache(Mkey){
		
		var url = "${path}comm/CacheAction_reLoadDictCache.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){	
				var content = '<option value="' + Mkey + '">' + Mkey + '</option>';
				$("#procedureDto_wplType").append(content);	
				$("#procedureDto_wplType").val(Mkey);		
		        form.render(null,'pane1');
    			$(".layui-select-title .layui-input").on("keyup",function(e){  	 
			       if($(".layui-select-none").length==1){
			         	$(".layui-select-none").remove();
			         	//if($("#creatAndEdit").length==0){
			         
			         	$(".layui-anim .layui-anim-upbit").empty();
			         	$("#creatAndEdit").remove();
			         	$(".layui-anim.layui-anim-upbit").append("<a id='creatAndEdit' onclick='creatAndEdit()'><dict:lang value='创建与编辑'/>          "+$(".layui-select-title .layui-input").val()+"</a>");
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

    
    
    function preAdd(){
        var flag='${param.flag}';
        var url = "${path}dmp/DmpAction_preAlgorithModelAdd.ms?flag="+flag;
 	    window.location.href= url;
    }
    
    function toCodeView(){
     	$.post("${path}dmp/DmpAction_isHaveSourceCode.ms",{code:$("#procedureDto_wplCode").val()},function(res){
  		    if(res.ajaxMap.state==1){
  		    	layer.msg("<dict:lang value='未找到该模型源码'/>", {time: 1000, icon:5});
  		    }else{
  		        var url = "${path}dmp/DmpAction_preAlgorithModelSourceCode.ms?paraMap.code="+$("#procedureDto_wplCode").val()+"&paraMap.id="+$("#procedureDto_id").val();
  	 	    	window.location.href= url;
  		    }
        });
    }
    
    
</script>


<script type="text/javascript">
    //实例化编辑器
    var ue = UE.getEditor('editor', {
    toolbars: [
        [
         'undo', //撤销
         'bold', //加粗
         'underline', //下划线
         'preview', //预览
         'horizontal', //分隔线
         'inserttitle', //插入标题
         'cleardoc', //清空文档
         'fontfamily', //字体
         'fontsize', //字号
         'paragraph', //段落格式
         'simpleupload', //单图上传
         //'attachment', //附件
         'inserttable', //插入表格
         'justifyleft', //居左对齐
         'justifyright', //居右对齐
         'justifycenter', //居中对
         'justifyjustify', //两端对齐
         'forecolor', //字体颜色
         'fullscreen', //全屏
         'customstyle', //自定义标题
         'template', //模板
             ]
        ]
    });
    ue.addListener("ready",function(){
    	ue.setContent($("#procedureDto_wplDesc").val());
    });
    
    //重写上传图片/附件方法
    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
    UE.Editor.prototype.getActionUrl = function(action){  
        //调用自己写的Controller 
        if(action == 'uploadimage'){  
       		return "${path}/buss/bussModel_editorUploadImg.ms?savePath=plf/res/updoc/img"; //自己controller的action  
        }else if(action == "uploadvideo"){  
            return "<c:out value='${ctx}' />/ueditor/videoUp";//自己controller的action  
        }else{  
            return this._bkGetActionUrl.call(this,action);//百度编辑器默认的action  
        }  
    } ; 
    
    function editAlg(){
    var wplCode = $("#procedureDto_wplCode").val();
   if(wplCode==""){
   return false;
   }

   var wplType = $("#procedureDto_wplType").val();
   if(wplType==""){
   return false;
   }   
    var wplName = $("#procedureDto_wplName").val();
   if(wplName==""){
   return false;
   }  
    		var flag='${param.flag}';
    		var url = "${path}dmp/DmpAction_algorithModelEdit.ms";
    		//alert($(".view p").val());
    		
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    data:{
	    	"paraMap.ID":$("#procedureDto_id").val(),
	    	"paraMap.WPL_CODE":$("#procedureDto_wplCode").val(),
	    	"paraMap.WPL_NAME":$("#procedureDto_wplName").val(),
	    	"paraMap.WPL_TYPE":$("#procedureDto_wplType").val(),
	    	"paraMap.WPL_DESC":ue.getContent()
	    },
	    url: url,
		success: function(data){	
				
				if(flag=="orderSetting"){										
			  	  	window.parent.addAlgList(data.ajaxMap,"2");			  	 	 					  	 					
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
    function editblack(){
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
		//算法应用分类操作方法
	var optFlag = true;
    function optAlgType(flag,oldCode,code,name){
    var url = "${path}dmp/DmpAction_optAlgType.ms";
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