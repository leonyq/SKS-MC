<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="富文本编辑器" />UI <dict:lang value="配置" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
	
	<link rel="stylesheet" href="${path}/plf/page/fp/css/jquery.mCustomScrollbar.css?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CSS %>" type="text/css" />
    <link rel="stylesheet" href="${path}/plf/page/fp/css/chosen.css?_mc_res_version=<%=PlfStaticRes.CHOSEN_CSS %>" type="text/css" />
    <link rel="stylesheet" href="${path}/plf/page/fp/css/sub-style.css?_mc_res_version=<%=PlfStaticRes.SUB_STYLE_CSS %>" type="text/css" />
    <link rel="stylesheet" href="${path}/plf/js/ueditor/themes/default/css/ueditor.css?_mc_res_version=<%=PlfStaticRes.SUB_STYLE_CSS %>" type="text/css" />
    
    <script src="${path}/plf/page/fp/js/jquery.mCustomScrollbar.concat.min.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>
    <script src="${path}/plf/page/fp/js/slick.js?_mc_res_version=<%=PlfStaticRes.SLICK_JS %>"></script>
    <script src="${path}/plf/page/fp/js/chosen.jquery.js?_mc_res_version=<%=PlfStaticRes.CHOSEN_JQUERY_JS %>"></script>
    <style>
    	.edui-default .edui-for-insertparagraphbeforetable a {
    		word-break: break-all;
    	}
    </style>
</head>
<body>
	<div class="all">
		<div　class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				<input type="hidden" name="mcIframeName" id="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				<input type="hidden" id="paraMap_TOOLS" name="paraMap.TOOLS" value="">
				
				<table class="add_table element_table">

                    <tr>
                        <td class="tr1 title" >
                        	<span class="Eng">*</span>
                            <dict:lang value="图片大小" />
                        </td>
                        <td>
                            <input type="text" title="KB(<dict:lang value="最大不能超过10M" />)" id="paraMap_SIZE" name="paraMap.SIZE"  lay-verify="paraMap_SIZE_verify" onpaste="return false;" onkeyPress="keyPress()" value="<s:property value="dataMap.SIZE"/>" />
                            <!--  
                            <span class="Eng">KB(<dict:lang value="最大不能超过10M" />)</span>
                            -->
                        </td>
                    </tr>					
					<tr>
						<td class="tr1 title" >
							<span class="Eng">*</span>
							<dict:lang value="图片路径" />
						</td>
						<td>
                            <input type="text"  id="paraMap_PATH" name="paraMap.PATH" lay-verify="paraMap_PATH_verify" value="<s:property value="dataMap.PATH"/>" />
						</td>
					</tr>
				</table>
				
				<div class="customer comwrap">
					  <div>
					    <div class="container" style="height: 460px;border:none">
					        <div class="main">
					            <div class="customer-box">
					              <div class="tit" style='font-size: 14px;'>
					                <dict:lang value="所有工具：" />
					              </div>
					
					              <div class="customer-con scroll scroll1" style="height:400px;min-height: 250px;padding:0;padding-left:10px;overflow: auto;">
					                <ul class="customer-list edui-default" id="k1">
					                </ul>
					            	<input type="hidden" id="Yuser">
					              </div>
					              
					            </div>
					            <div class="customer-btn" style="padding-top: 14%;">
					              <button type="button" onclick="b2();" style="background-color: #FF5722;width:35px;">&gt;&gt;</button>
					              <button type="button" onclick="b1();" style="background-color: #1E9FFF;width:35px;">&gt;</button>
					              <button type="button" onclick="b3();" style="background-color: #1E9FFF;width:35px;">&lt;</button>
					              <button type="button" onclick="b4();"style="background-color: #FF5722;width:35px;">&lt;&lt;</button>
					            </div>
					            <div class="customer-box">
					              <div class="tit" style='font-size: 14px;'>
					                <span class="Eng">*</span><dict:lang value="已配工具：" />
					              </div>
					
					              <div class="customer-con scroll scroll2" style="height:400px;min-height: 250px;padding:0;padding-left:10px;overflow: auto;">
					                <ul class="customer-list edui-default" id="k2">
					                </ul>
					            	<input type="hidden" id="Nuser">
					              </div>
					              
					            </div>
					        </div>
							
					    </div>
					  </div>
				</div>
				
				<div class="ptop_10 txac">			
			
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin_ui();" class="layui-btn layui-btn-danger">
							
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
	
	//只允许数字，FF下无效,初始化方法中还有个针对FF的方法
	   function keyPress(){
	       var keyCode = event.keyCode;
	       if(keyCode >= 48 && keyCode <= 57){
	           event.returnValue = true;
	       }else{
	          event.returnValue = false;
	       }
	   }
	
		var isSubmit = false;
		function reloadPg(msg){
			isSubmit = false;
			//window.parent.parent.reloadPg(msg);
			window.parent.parent.add();
		}
		
		function alertInfo(msg){
			isSubmit = false;
			util.alert(msg);
		}
		
		function add(thisObj){
			//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!valData()){
				return false;
			}
			//document.forms.add_form.submit();
			//isSubmit = true;
			return true;
		}
		
		function valData(){
		    var paraMap_SIZE = document.getElementById("paraMap_SIZE");
			if(val.isBlank(paraMap_SIZE)){
				_alertValMsg(paraMap_SIZE,"<dict:lang value="图片大小" /> -- <dict:lang value="不能为空" />");
				return false;
			}else{
			     if(paraMap_SIZE.value > 10240){
			        _alertValMsg(paraMap_SIZE,"<dict:lang value="图片大小" /> -- <dict:lang value="不能超过10M" />");
                    return false;
			     }
			}
			
			var paraMap_PATH = document.getElementById("paraMap_PATH");
			if(val.isBlank(paraMap_PATH)){
				_alertValMsg(paraMap_PATH,"<dict:lang value="图片路径" /> -- <dict:lang value="不能为空" />");
				return false;
			}
			
			if(!validateInput(paraMap_PATH))
		   	{
		   		return false;
		   	}
		
			return true;
		}

	function validateInput(input)
	{
		var input_value = input.value;
	   	if(input_value != "" && input_value != null)
	   	{
	   		if(input_value.indexOf("\"") != -1  || input_value.indexOf("\'") != -1  || input_value.indexOf("<") != -1  || input_value.indexOf(">") != -1 
				|| input_value.indexOf("{") != -1  || input_value.indexOf("}") != -1  || input_value.indexOf("[") != -1  || input_value.indexOf("]") != -1  
				|| input_value.indexOf("(") != -1  || input_value.indexOf(")") != -1 )
			{
				_alertValMsg(input,"<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />");
		   		return false;	   		
		   	}
	   	}
	   	return true;
	}
		
		function init(){
		}
			</script>
	<script type="text/javascript">
	$(function()
	{
	       //只允许输入数字 IE下无效，keyPress方法针对IE
	       var _paraMap_SIZE = document.getElementById("paraMap_SIZE");
	       if(_paraMap_SIZE.addEventListener){
	                _paraMap_SIZE.addEventListener("input",function()
	                {
	                    $("#paraMap_SIZE").attr("value",$("#paraMap_SIZE").attr("value").replace(/\D+/g,""));
	                },true);
	            }else{
	                _paraMap_SIZE.attachEvent("input",function()
	                        {
	                            $("#paraMap_SIZE").attr("value",$("#paraMap_SIZE").attr("value").replace(/\D+/g,""));
	                        },true);             
	            }		
	});
	
	var form;
$(function(){
	layui.use('form', function(){
	    	 form = layui.form;
	          
			 form.on('submit(filterSubmit)', function (data) {
			 document.getElementById("mcIframeName").value=window.parent.location.href;
			 document.getElementById("curIframeName").value=window.parent.name;
			 
			var fields = '';
			$("#k2 li").each(function(){
				var names = $(this).attr("title");
				if(fields==''){
					fields=names;
				}else{
					fields=fields+','+names;
				}
				
			});
			
			//alert(fields);
			if(fields==''){
				alterWindows("<dict:lang value="请先配置工具" />",5);
				return false;
			}else{
				document.getElementById("paraMap_TOOLS").value=fields;
				
			}
				
			 /*
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
		       */
		       return true;
				       
			}) 
			
			form.verify({
		   		 paraMap_SIZE_verify: function(value,item){
						var paraMap_SIZE = document.getElementById("paraMap_SIZE");
						if(val.isBlank(paraMap_SIZE)){
							return "<dict:lang value="图片大小" /> -- <dict:lang value="不能为空" />";
						}else{
						     if(paraMap_SIZE.value > 10240){
			                    return "<dict:lang value="图片大小" /> -- <dict:lang value="不能超过10M" />";
						     }
						}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_PATH_verify: function(value,item){
						var paraMap_PATH = document.getElementById("paraMap_PATH");
						if(val.isBlank(paraMap_PATH)){
							return "<dict:lang value="图片路径" /> -- <dict:lang value="不能为空" />";
						}
						
						if(!validateInput(paraMap_PATH))
					   	{
					   		return "<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />";
					   	}
		   		 		
				 }
		     });
	
	    });
	    
})

</script>



<script type="text/javascript">	
	$(function(){
		 $(window).on('load',function(){
			setPopScroll('.side');
			setPopScroll('.scroll1');
			setPopScroll('.scroll2');
		})
		 
	})
	
	window.onload = init_fields;

	function init_fields(){
		var all_fields='${all_fields}';//已有字段
		var use_fields='<s:property value="dataMap.TOOLS"/>';//配置字段

		all_fields=all_fields+'anchor(锚点),undo(撤销),redo(重做),bold(加粗),indent(首行缩进),snapscreen(截图),italic(斜体),underline(下划线),strikethrough(删除线),subscript(下标),';
		all_fields=all_fields+'fontborder(字符边框),superscript(上标),formatmatch(格式刷),source(源代码),blockquote(引用),pasteplain(纯文本粘贴模式),selectall(全选),print(打印),';
		all_fields=all_fields+'preview(预览),horizontal(分隔线),removeformat(清除格式),time(时间),date(日期),unlink(取消链接),insertrow(前插入行),insertcol(前插入列),mergeright(右合并单元格),';
		all_fields=all_fields+'mergedown(下合并单元格),deleterow(删除行),deletecol(删除列),splittorows(拆分成行),splittocols(拆分成列),splittocells(完全拆分单元格),deletecaption(删除表格标题),';
		all_fields=all_fields+'inserttitle(插入标题),mergecells(合并多个单元格),deletetable(删除表格),cleardoc(清空文档),insertparagraphbeforetable(表格前插入行),insertcode(代码语言),fontfamily(字体),fontsize(字号),';
		all_fields=all_fields+'paragraph(段落格式),simpleupload(单图上传),insertimage(多图上传),edittable(表格属性),edittd(单元格属性),link(超链接),emotion(表情),';
		all_fields=all_fields+'spechars(特殊字符),searchreplace(查询替换),map(Baidu地图),gmap(Google地图),insertvideo(视频),help(帮助),justifyleft(居左对齐),';
		all_fields=all_fields+'justifyright(居右对齐),justifycenter(居中对齐),justifyjustify(两端对齐),forecolor(字体颜色),backcolor(背景色),insertorderedlist(有序列表),insertunorderedlist(无序列表),';
		all_fields=all_fields+'fullscreen(全屏),directionalityltr(从左向右输入),directionalityrtl(从右向左输入),rowspacingtop(段前距),rowspacingbottom(段后距),';
		all_fields=all_fields+'pagebreak(分页),insertframe(插入Iframe),imagenone(默认),imageleft(左浮动),imageright(右浮动),attachment(附件),';
		all_fields=all_fields+'imagecenter(居中),wordimage(图片转存),lineheight(行间距),edittip(编辑提示),customstyle(自定义标题),autotypeset(自动排版),';
		all_fields=all_fields+'webapp(百度应用),touppercase(字母大写),tolowercase(字母小写),background(背景),template(模板),scrawl(涂鸦),music(音乐),';
		all_fields=all_fields+'inserttable(插入表格),drafts(从草稿箱加载),charts(图表)';
		
		if(use_fields==null || use_fields==''){	
			//初始化默认工具
			use_fields=use_fields+'fullscreen(全屏),source(源代码),undo(撤销),redo(重做),';
			use_fields=use_fields+'bold(加粗),italic(斜体),underline(下划线),fontborder(字符边框),strikethrough(删除线),';
			use_fields=use_fields+'superscript(上标),subscript(下标),removeformat(清除格式),formatmatch(格式刷),autotypeset(自动排版),';
			use_fields=use_fields+'blockquote(引用),pasteplain(纯文本粘贴模式),forecolor(字体颜色),backcolor(背景色),insertorderedlist(有序列表),insertunorderedlist(无序列表),selectall(全选),cleardoc(清空文档),';
			use_fields=use_fields+'rowspacingtop(段前距),rowspacingbottom(段后距),lineheight(行间距),';
			use_fields=use_fields+'customstyle(自定义标题),paragraph(段落格式),fontfamily(字体),fontsize(字号),';
			use_fields=use_fields+'directionalityltr(从左向右输入),directionalityrtl(从右向左输入),indent(首行缩进),';
			use_fields=use_fields+'justifyleft(居左对齐),justifycenter(居中对齐),justifyright(居右对齐),justifyjustify(两端对齐),touppercase(字母大写),tolowercase(字母小写),';
			use_fields=use_fields+'link(超链接),unlink(取消链接),anchor(锚点),imagenone(默认),imageleft(左浮动),imageright(右浮动),imagecenter(居中),';
			use_fields=use_fields+'simpleupload(单图上传),pagebreak(分页),template(模板),';
			use_fields=use_fields+'horizontal(分隔线),date(日期),time(时间),spechars(特殊字符),wordimage(图片转存),';
			use_fields=use_fields+'inserttable(插入表格),deletetable(删除表格),insertpgbf(表格前插入行),insertrow(前插入行),deleterow(删除行),insertcol(前插入列),deletecol(删除列),';
			use_fields=use_fields+'mergecells(合并多个单元格),mergeright(右合并单元格),mergedown(下合并单元格),splittocells(完全拆分单元格),splittorows(拆分成行),splittocols(拆分成列),charts(图表),';
			use_fields=use_fields+'preview(预览),searchreplace(查询替换),drafts(从草稿箱加载),help(帮助)';

		}
		
		var all_fields_arr=all_fields.split(",");
		var all_fields_arr_copy=all_fields.split(",");
		
		var use_fields_arr=use_fields.split(",");
		
		//已有字段 要删除已经配置过的字段
		for(var i = 0;i < all_fields_arr.length; i++){
			for(var j = 0;j < use_fields_arr.length; j++){
				if(all_fields_arr[i]==use_fields_arr[j]){
					all_fields_arr[i]='';
					break;
				}
				
			}
			
		}
		
		//配置字段  要删除已经不存在的字段
		for(var j = 0;j < use_fields_arr.length; j++){
			var flag=true;
			for(var i = 0;i < all_fields_arr_copy.length; i++){
				if(use_fields_arr[j]==all_fields_arr_copy[i]){
					flag=false;
					break;
				}
				
			}
			
			if(flag){
				use_fields_arr[j]='';
			}
			
		}
		
		if(all_fields!=null && all_fields!=''){	
			$("#k1").empty();
			
			var htmlK1 = "";
			for(var i = 0;i < all_fields_arr.length; i++){
				if(all_fields_arr[i]!=''){
					var id='k1_'+i;
					//add class by tangws
					var patt = all_fields_arr[i].split("(");
					var css_patt = "edui-for-"+patt[0];
					htmlK1 = htmlK1 + "<li id='"+id+"' title='"+all_fields_arr[i]+"' class='"+css_patt+"' onclick=\"getYIdName('"+id+"');\"><i class='ico ico-cus edui-icon'></i><a href='javascript:void(0);' target='_blank'>"+all_fields_arr[i]+"</a></li>";
				}
				
			}
			$("#k1").append(htmlK1);
		
		}
		
		if(use_fields!=null && use_fields!=''){		
			$("#k2").empty();
			
			var htmlK2 = "";
			for(var j = 0;j < use_fields_arr.length; j++){
				if(use_fields_arr[j]!=''){
					var id='k2_'+j;
					//add class by tangws
					var patt = use_fields_arr[j].split("(");
					var css_patt = "edui-for-"+patt[0];
					
					htmlK2 = htmlK2 + "<li id='"+id+"' title='"+use_fields_arr[j]+"'class='"+css_patt+"' onclick=\"getYIdName('"+id+"');\"><i class='ico ico-cus edui-icon'></i><a href='javascript:void(0);' target='_blank'>"+use_fields_arr[j]+"</a></li>";
				
				}
				
			}
			$("#k2").append(htmlK2);
		
		}
		
	}
	
	function getYIdName(objId){
		userN_id = objId;
		if($("#"+userN_id).hasClass("customer-list-choose")){
			$("#"+userN_id).removeClass("customer-list-choose");
		}else{
			$("#"+userN_id).addClass("customer-list-choose");
		}
	}
	
	function b1(){
		$('.scroll1').mCustomScrollbar("destroy");
		$('.scroll2').mCustomScrollbar("destroy");
		
		var falg = false;
		$("#k1 li.customer-list-choose").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			//add class by tangws
			var css_patt = $(this).attr("class");
			
			$("#"+ids).remove();
			$("#k2").append("<li id='"+ids+"' title='"+names+"'class='"+css_patt+"' onclick=\"getYIdName('"+ids+"');\"><i class='ico ico-cus edui-icon'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});

		//setPopScroll('.scroll1');
		//setPopScroll('.scroll2');
		$('.scroll1').mCustomScrollbar();
		$('.scroll2').mCustomScrollbar();
	}
	
	function b3(){
		$('.scroll1').mCustomScrollbar("destroy");
		$('.scroll2').mCustomScrollbar("destroy");

		var falg = false;
		$("#k2 li.customer-list-choose").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			//add class by tangws
			var css_patt = $(this).attr("class");
			
			$("#"+ids).remove();
			$("#k1").append("<li id='"+ids+"' title='"+names+"'class='"+css_patt+"' onclick=\"getYIdName('"+ids+"');\"><i class='ico ico-cus edui-icon'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});
		
		//setPopScroll('.scroll1');
		//setPopScroll('.scroll2');

		$('.scroll1').mCustomScrollbar();
		$('.scroll2').mCustomScrollbar();

		
	}
	
	function b2(){
		$('.scroll1').mCustomScrollbar("destroy");
		$('.scroll2').mCustomScrollbar("destroy");
		
		var falg = false;
		$("#k1 li").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			//add class by tangws
			var css_patt = $(this).attr("class");
			
			$("#"+ids).remove();
			$("#k2").append("<li id='"+ids+"' title='"+names+"'class='"+css_patt+"' onclick=\"getYIdName('"+ids+"');\"><i class='ico ico-cus edui-icon'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});
		$("#k1 li").remove();

		//setPopScroll('.scroll1');
		//setPopScroll('.scroll2');
		$('.scroll1').mCustomScrollbar();
		$('.scroll2').mCustomScrollbar();
		
	}
	
	function b4(){
		$('.scroll1').mCustomScrollbar("destroy");
		$('.scroll2').mCustomScrollbar("destroy");
		
		var falg = false;
		$("#k2 li").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			//add class by tangws
			var css_patt = $(this).attr("class");
			
			$("#"+ids).remove();
			$("#k1").append("<li id='"+ids+"' title='"+names+"'class='"+css_patt+"' onclick=\"getYIdName('"+ids+"');\"><i class='ico ico-cus edui-icon'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});
		$("#k2 li").remove();

		//setPopScroll('.scroll1');
		//setPopScroll('.scroll2');
		$('.scroll1').mCustomScrollbar();
		$('.scroll2').mCustomScrollbar();
	}
  
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>