<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title><dict:lang value="算法模型源码"/></title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="dmp" value="1" />
		<jsp:param name="uEditor" value="1" />
		<jsp:param name="ace" value="1" />
	</jsp:include>
<style>
.layui-form .layui-form-item .list-left{
margin-left:0px!important;
}

</style>
</head>
<body>
  <form id="add_form" class="layui-form" name="addForm" action="" method="post" style="height:100%">
	<input type="hidden" value='${dataMap.WPL_DESC}' id="procedureDto_wplDesc">
	<input type="hidden"  id="procedureContent" name="procedureContent">
	<input type="hidden" value="${dataMap.id}" id="procedureDto_id" name="procedureDto.id">
	<input type="hidden" value="${dataMap.WPL_CODE}" id="procedureDto_wplCode" name="procedureDto.wplCode">
	<input type="hidden" value="${dataMap.WPL_NAME}" id="procedureDto_wplName" name="procedureDto.wplName">
	<input type="hidden" value="${dataMap.WPL_TYPE}" id="procedureDto_wplType" name="procedureDto.wplType">
    <div class="layui-fluid isHelp">
        <div class="listOperate">
            <div class="tit"><span class="current"><dict:lang value="算法模型源码"/></span></div>
            <div class="operates">
                <span class="ico help" data-method="offset"></span>
             <!--     <span class="ico edit"></span>-->
                <span class="ico saveAs"></span>
            </div>
        </div>
     
        <div class="codeBox">       <!--代码输入框（注意请务必设置高度，否则无法显示）-->
        	<pre id="code" class="ace_editor" style="height:100%;">
        		<textarea class="ace_text-input">${procedureContent}</textarea>
        	</pre>
        </div>
        <div class="helpDiv">
            <div class="head"><dict:lang value="算法模型详情说明"/>
              
            </div>
            <div class="body">
                  <script id="editor" name="procedureDto.wplDesc" type="text/plain" style="height:600px"  ></script>
            </div>
        </div>
        <div class="ptop_10">
            <button class="layui-btn" type="button" id="addButton" onclick="moctionEdit()"><dict:lang value="保存"/></button>   
            <button class="layui-btn layui-btn-danger" type="button"   onclick="addblack()"><dict:lang value="取消"/></button>   
        </div> 
    </div>
 </form>
<script>
bulidEvenForDmpIcon();
function bulidEvenForDmpIcon(){
	$('.help').attr('title',"<dict:lang value='详情说明'/>");
	$('.saveAs').attr('title',"<dict:lang value='另存为'/>");
}
	util.initDictMap('["ALGORITH_MODEL_TYPE","ALGORITH_MODEL_TYPE"]');
    layui.use(['layer','form'], function(){
        var layer = layui.layer,form =layui.form
      var str0 = '<form class="layui-form" name="addForm" action="" method="post" id="dialog_form">\
        	<input type="hidden"  id="procedureContentDia" name="procedureContent">\
        	<input type="hidden"  id="procedureDto_wplDescDia" name="procedureDto.wplDesc">\
        	<input type="hidden" value="${dataMap.id}" id="procedureDto_id" name="paraMap.oldId">\
        	<input type="hidden" value="${dataMap.WPL_CODE}" id="procedureDto_wplCode" name="paraMap.oldCode">\
        	<input type="hidden"  id="saveAsFlag" name="paraMap.saveAs" value="saveAs">\
            <div class="layui-form-item">\
            <div class="list-left"><span class="Eng">*</span><dict:lang value="算法名称"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="text" placeholder="<dict:lang value='请输入算法名称'/>"  id="procedureDto_wplCode2" class="layui-input" name="procedureDto.wplCode" onblur="validateCode(this.value)" >\
                    </div>\
                </div>\
            </div>\
            <div class="layui-form-item" >\
                <div class="list-left"><dict:lang value="算法描述"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="text" placeholder="<dict:lang value='请输入算法描述'/>" class="layui-input" name="procedureDto.wplName">\
                    </div>\
                </div>\
            </div>\
            <div class="layui-form-item">\
                <div class="list-left"><span class="Eng">*</span><dict:lang value="应用分类"/></div>\
                <div class="list-right">\
                     <div class="pane" style="position:relative" >\
                    <div class="layui-form" lay-filter="pane1" style="position:absolute;float:left;margin-top:0px;" id="wpltype0" >\
                     <select lay-search verify="required" name="procedureDto.wplType" id="selectType">\
                     </select>\
                    </div>\
                    <div class="layui-form" style="position:absolute;float:right;right:-70px;top:0px;margin-top:0px;">\
                    <button  type="button" class="layui-btn addAlgType"  ><dict:lang value="新增"/></button>\
                    </div>\
                     </div>\
                </div>\
            </div>\
        </form>\
        <div class="ptop_10">\
            <button class="layui-btn" onclick="submitDialog()"><dict:lang value="确定"/></button>\
            <button class="layui-btn layui-btn-danger layui-layer-close"><dict:lang value="取消"/></button>\
        </div>';		        
		$('.operates .saveAs').on('click', function(){
		/////每次打开窗口重新加载下拉框
		var selcUrl = "${path}dmp/DmpAction_getAlgType.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    data:"",
	    url: selcUrl,
		success: function(data){
		var items = data.ajaxMap.ALG_TYPE;
 
		layer.open({
			   title: '<dict:lang value="另存为"/>',
			   skin: 'layui-layer-molv',
			   area: ['580px','340px'],
			   type: 1, 
			   id: 'layerDemo', //防止重复弹出
			   content: str0,
			   shade: 0.3 
			});
			for(var i=0;i<items.length;i++){
		    $("#selectType").append('<option value="'+items[i].MODELTYPE_CODE+'">'+items[i].MODELTYPE_NAME+'</option>');			
			}

			//var options =  _DICT_MAP_GOL["ALGORITH_MODEL_TYPE"];
			//var optionsStr =  "${dataMap.ALG_TYPE}";
          //  console.log(optionsStr);
          	form.render();
            menter();
            mleave();
            saveAsSaveBtn(); 			   		
			},
			error: function(msg){
				util.alert("error:"+msg);
		   }
		});  
		/////
                     

			
		})
///////////////////////////////////////
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
               var editopen = layer.open({//修改弹窗
                title: '<dict:lang value="应用分类-修改"/>',
                skin: 'layui-layer-molv',
                area: ['390px','250px'],
                type: 1, 
                id: 'layerDemo2', //防止重复弹出
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
    $('#selectType option').each(function(){
                  if($(this).val()==oldTypeCode){
                   $(this).remove();
                   return false;
                  }
    })    
    $('#selectType').append('<option selected value="'+typeCode+'">'+typeName+'</option>');
    form.render(null,'pane1');
    menter();
    mleave();  
    layer.close(editopen);	
	})	
	//取消
	$('.quit').on('click',function(){
	layer.close(editopen);
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
                $('#selectType option').each(function(){
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

       function saveAsSaveBtn(){
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
               var addOpen = layer.open({//新增弹窗
                title: '<dict:lang value="应用分类-新增"/>',
                skin: 'layui-layer-molv',
                area: ['390px','250px'],
                type: 1, 
                id: 'layerDemo2', //防止重复弹出
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
    $('#selectType').append('<option selected value="'+typeCode+'">'+typeName+'</option>');
    form.render(null,'pane1');
    menter();
    mleave();  
    layer.close(addOpen);
	})
	//取消
	$('.quit').on('click',function(){
	layer.close(addOpen);
	})      	
	}) 
       }
		
		var flag = '${dataMap.SAVE_AS}';
		if(flag=="saveAs"){
		  layer.msg("<dict:lang value='另存成功'/>", {time: 1000, icon:6});
		}
    })

    $('.operates .help').on('click', function(){
        $(this).parents('.layui-fluid').toggleClass('isHelp');
        initAce();
    });

    $('.helpDiv .layui-layer-close').click(function(){
        $('.layui-fluid').removeClass('isHelp')
    })

    $('.helpDiv').on('click','li',function(){
        $(this).addClass('active').siblings('li').removeClass('active')
    })

  
   	$('.operates .edit').bind('click',function(){
   	 	editor.setReadOnly(false); 
		//$('.codeBox').attr("contenteditable","true");
		ue.setEnabled();
	});
	
    function submitForm(){
    	var url = "${path}dmp/DmpAction_saveProcedure.ms";
    	$("#procedureContent").val(editor.getValue());
    	$("#add_form").attr("action",url);
    	$("#add_form").submit();
    }   
    
    
    function moctionEdit(){

    	
		$("#procedureContent").val(editor.getValue());
	var flag='${param.flag}';
		//console.log("---------------------------------");
		//console.log($("#procedureContent").val());
		var url = "${path}dmp/DmpAction_saveProcedure.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    data:{
	    	"procedureContent":$("#procedureContent").val(),
	    	"paraMap.ID":$("#procedureDto_id").val(),
	    	"paraMap.WPL_CODE":$("#procedureDto_wplCode").val(),
	    	"paraMap.WPL_NAME":$("#procedureDto_wplName").val(),
	    	"paraMap.WPL_TYPE":$("#procedureDto_wplType").val(),
	    	"paraMap.WPL_DESC":ue.getContent() 
	    },
	    url: url,
		success: function(data){
		
				if(data.ajaxString=="success"){
					if(flag=="orderSetting"){										
				  	  			  	 	 					  	 					
						window.parent.display1(); 
					}else{
						window.history.back();
					}
				
				}else {
					util.alert("<dict:lang value='算法模型说明编码有误'/>");
					
				}	
				
		         			
			},
			error: function(msg){
				util.alert("error:"+msg);
		   }
		});
	}     
    var flag = true;
    function submitDialog(){        
        validateCode($("#procedureDto_wplCode2").val()); 
        if(!flag){
           return;
        }  
    	if($("#procedureDto_wplCode2").val()==""){
    		layer.msg("<dict:lang value='请输入算法名称'/>", {time: 1000, icon:5});
    		return;
    	}
    	var reg = /^[a-zA-Z]$/;
    	if(!reg.test($("#procedureDto_wplCode2").val().substring(0,1))){
    		layer.msg("<dict:lang value='首位必须为字母'/>", {time: 1000, icon:5});
    		return;
    	}
    	
    	
    	if($('#selectType option:selected').val()==""){
    		layer.msg("<dict:lang value='请输入应用分类'/>", {time: 1000, icon:5});
    		return;
    	}
    	$("#procedureContentDia").val(editor.getValue());
    	var content = ue.getContent();
    	$("#procedureDto_wplDescDia").val(content);
       	var url = "${path}dmp/DmpAction_saveAs.ms";
    	$("#dialog_form").attr("action",url);
    	$("#dialog_form").submit();
    	
    }
    
    function validateCode(value){
     	  $.post("${path}dmp/DmpAction_validateCode.ms",{value:value},function(res){
  		    if(res.ajaxMap.state==1){
  		    	$("#procedureDto_wplCode").val("");
  		    	layer.msg("<dict:lang value='该模型代码已存在,请重新输入'/>", {time: 1000, icon:5});
  		    	flag = false; 	
  		    }else{
  		        flag = true;
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
   // ue.setEnabled();
    ue.ready(function() {
        //不可编辑
       // ue.setDisabled();
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
</script>


<script>
	function initAce(){
	     //初始化对象
	     editor = ace.edit("code");
	     
	     //设置风格和语言（更多风格和语言，请到github上相应目录查看）
	     theme = "clouds_midnight"
	     language = "mysql"
	     editor.setTheme("ace/theme/" + theme);
	     editor.session.setMode("ace/mode/" + language);
	     
	     //字体大小
	     editor.setFontSize(14);
	     
	     //设置只读（true时只读，用于展示代码）
	    // editor.setReadOnly(true); 
	     editor.setReadOnly(false); 
	     //自动换行,设置为off关闭 free
	     editor.setOption("wrap", "off");
	     
	     //启用提示菜单
	     ace.require("ace/ext/language_tools");
	     editor.setOptions({
	         enableBasicAutocompletion: true,
	         enableSnippets: true,
	         enableLiveAutocompletion: true
	     });
	     
		
	}
	
	$(function(){
		if("${paraMap.type}"=="add"){
			$("#addButton").addClass("layui-btn-disabled");
		}
		initAce();
	});
	 function addblack(){
	        var index = layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
			var flag='${param.flag}';
			if(flag=="orderSetting"){										
			  	    	 	 					  	 					
					window.parent.display1(); 
				}else{
					window.history.back();
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