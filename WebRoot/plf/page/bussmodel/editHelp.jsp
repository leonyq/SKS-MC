<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="视图帮助" /> <dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
		<jsp:param name="uEditor" value="1" />
	</jsp:include>
</head>
<style>
	html,body{
              height: 99%;
         }
    .all{
    	margin:0px;
    	height:100%
    }
    .layui-form-select{
    	z-index:8888;
    }
    
    .add_table .title{
    	width:63px;
    }
    
    .layui-form-radio {
    margin: 6px 10px 13px 0;
    }

</style>
<body>
	<div class="all">
		<div  class="add_table_div" style="height: 100%;padding: 0 11%!important">
			<form id="add_form" class="layui-form"  name="addForm" action="${path}sys/BussModelAction_editHelp.ms" method="post" target="submitFrame" style="height: 100%">
				<s:hidden name="paraMap.ID" />
				<s:hidden name="paraMap.MID" />
				<table class="add_table" >

					<tr style="height:53px;">
						<td  class="tr1 title">
							<span class="Eng"></span>
							<dict:lang value="开启帮助" />
						</td>
						<td >
							<%-- <dict:selectDict dictCode="IS_SHOW_HELP" dictValue="%{dataMap.IS_SHOW_HELP}" name="paraMap.IS_SHOW_HELP"  /> --%>
							<dict:radioDict dictCode="IS_SHOW_HELP" dictValue="%{dataMap.IS_SHOW_HELP}" name="paraMap.IS_SHOW_HELP"  />
						</td>
					</tr>
					
				</table>
				
				<div class="textarea-wrap">
					<table class="add_table">
						<tr id="sql_code">
						<!--  
						<td class="tr1 title"><dict:lang value="帮助文档" /></td>
						-->
						
						<td colspan="4">
							<span style="position: relative;top: -2px;">&nbsp;&nbsp;多语言&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
													
							<!--  
							<input id="codeType_comm" name="codeType" value="comm" onclick="showSql(this)" type="radio" lay-filter="codeRadio" title='通用语句'  style="width: 20px;"> 
							<script id="codeType_comm_fwb" style='' type="text/plain"></script>  
							<input type="hidden"  id="codeType_comm_fwbhid" name="paraMap0@0#FWBTEST1" value="" />
							-->
							
							<span id="help_div"></span>
														
						</td>


					</tr>
					</table>
				</div>
			<div class="ptop_10 txac">
			 	<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
			 	<input type="reset" value="<dict:lang value="重置" />" onclick="resetv();" class="layui-btn layui-btn-primary" />
			</div>
			</form>
		</div>
	</div>
	
	
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	var isSubmit = false;

	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function reloadPg(msg){
		isSubmit = false;
		if("" != msg){
			top.util.alert(msg);
		}
		document.forms.addForm.target = "_self";
		document.forms.addForm.action = "${path}sys/BussModelAction_showCfgHelp.ms";
		document.forms.addForm.submit();
	}

 	var form ="";
 	var language_list;
	layui.use('form', function(){
  	  form = layui.form;
  	  
  	  form.on('submit(filterSubmit)', function (data) {
  	  	 $.each(language_list,function(key,values){   
		    var language_code=values.LANGUAGE_CODE;
		    var language_name=values.LANGUAGE_NAME;
		    
		    if(fwb_arr[language_code]!=null){
		    	var fwb_cont=fwb_arr[language_code].getContent();
		    	$('#fwb_hid_'+language_code).val(fwb_cont);
		    
		    }
									    
	    }); 
  	  
		  return true;
				       
	  })
	  
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
	  }; 
		
	  listhelpconfig();
	  
    });
    
    var fwb_arr=[];
    var help_info='${dataMap.HELP_INFO}';
	function listhelpconfig(){
		document.getElementById('help_div').innerHTML='';
		var url = "${path}sys/BussModelAction_more_language_ajaxbyhelp.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: '',
			success: function(data){
				var operHtml = "";
					//alert(data.ajaxMap.listData);
					language_list=data.ajaxMap.listData;
					if(null !=data.ajaxMap.listData){
						//初始化
						var help_div="";
						$.each(data.ajaxMap.listData,function(key,values){   
						    var language_code=values.LANGUAGE_CODE;
						    var language_name=values.LANGUAGE_NAME;
						    
						    help_div=help_div + "<input id='lt_"+language_code+"' name='language_type' value='"+language_code+"' lay-filter='"+language_code+"' type='radio'  title='"+language_name+"'  style='width: 20px;'>"; 
													    
					    }); 
					    
					    var winWidth = $(window).width()-400;
					    var winheight = $(window).height();		
						var set_height=winheight-260;
						//alert(winWidth);
						
					    $.each(data.ajaxMap.listData,function(key,values){   
						    var language_code=values.LANGUAGE_CODE;
						    var language_name=values.LANGUAGE_NAME;
						    							
							help_div=help_div+"<script id='ID_FWB_"+language_code+"' style='width:"+winWidth+"px;height:"+set_height+"px' type='text/plain'><\/script>";   
							
							help_div=help_div+"<input type='hidden'  id='fwb_hid_"+language_code+"' name='paraMap.fwb_hid_"+language_code+"' value='' />"; 
						    
					    }); 
					    document.getElementById('help_div').innerHTML=help_div;
					    form.render();	
					    
					    //实例化富文本
					    $.each(data.ajaxMap.listData,function(key,values){   
					    	var language_code=values.LANGUAGE_CODE;
						    var language_name=values.LANGUAGE_NAME;
						    
						    fwb_arr[language_code]=UE.getEditor('ID_FWB_'+language_code,{wordCount:false});
						    
						    var _maxSize = parseInt(1024)*1024;
							fwb_arr[language_code].options.serverUrl=fwb_arr[language_code].options.UEDITOR_HOME_URL+'/jsp/controller.jsp?savePath=help_fwb/{yyyy}{mm}{dd}/{time}{rand:6}&maxSize='+_maxSize;

						    $('#ID_FWB_'+language_code).css('display','none');
						    
						    //例如<mc_zh_CN>测试</mc_zh_CN><mc_en_US>test</mc_en_US>
						    var sub_str_beg='<mc_'+language_code+'>';
						    var sub_str_end='</mc_'+language_code+'>';
							var help_info_lang=getSubstr(help_info,sub_str_beg,sub_str_end);
							fwb_arr[language_code].addListener("ready", function () {
							      fwb_arr[language_code].setContent(help_info_lang);
							
							});
						    
					    }); 
					    
					    //切换多语言
					    $.each(data.ajaxMap.listData,function(key,values){   
					    	var language_code=values.LANGUAGE_CODE;
						    var language_name=values.LANGUAGE_NAME;
						    
						    form.on('radio('+language_code+')', function (data) {
					            //alert(data.value);//判断单选框的选中值

					            $('#ID_FWB_'+language_code).css('display','');
					            $("div[id^='ID_FWB_']").each(function() {
					            	//console.log( $(this).attr("id") );
					            	if($(this).attr("id")!='ID_FWB_'+language_code){
					            		$(this).css('display','none');
					            	}
					            	
					            })
					            
					        });
						    
					    });
					    
					    //初始化当前系统语言
					    var login_language=data.ajaxMap.login_language;
						$("#lt_"+login_language).attr("checked","checked"); 
						form.render();	
					
						$('#ID_FWB_'+login_language).css('display','');
						
					}
				
			}

		});
	}
	
	function resetv() {
		var url = "${path}sys/BussModelAction_more_language_ajaxbyhelp.ms";
		jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: '',
			success: function(data){
				var operHtml = "";
					//alert(data.ajaxMap.listData);
					language_list=data.ajaxMap.listData;
					if(null !=data.ajaxMap.listData){
					    $.each(data.ajaxMap.listData,function(key,values){   
					    	var language_code=values.LANGUAGE_CODE;
						    var language_name=values.LANGUAGE_NAME;
						    
						    fwb_arr[language_code].setContent('');
						    
					    }); 
						
					}
				
			}

		});
	}

	function getSubstr(ret,strs,stre)
	{
		var deps = ret.indexOf(strs)+strs.length;
		
		//如果结束字符为空，则取从开始字符到结束字符的所有字符串
		if (stre == "")
			var depe = ret.length;
		else
			var depe = ret.indexOf(stre);
		var dep = ret.substr(deps,depe-deps);
		
		return dep;
	}
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>