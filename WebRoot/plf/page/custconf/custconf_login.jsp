<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
		
	</jsp:include>
</head>
<body>
		<div>
			<div  class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}custconf/custconfAction_configCustconf_login.ms" method="post" enctype="multipart/form-data" target="submitFrame">
				
				<input type="hidden" name="paraMap.id" value="${dataMap.id}">
				
				<table class="add_table">
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="浏览器title名称" />
						</td>
						<td width="35%">
							<input type="text" name="paraMap.text_title"   onkeyup="javascript:util.replaceLikeVal(this)" value="${dataMap.text_title}" id="paraMap_text_title" maxlength="50" />
							
						</td>
						<td width="15%" class="tr1">
							<dict:lang value="浏览器title图片" />
						</td>
						<td width="35%">
							 <input type="file" lay-verify="pic_title_verify" id="paraMap_pic_title" name="pic_title" /> 
							 <a class="layui-btn layui-btn-xs" href="javascript:review_title('')" title="<dict:lang value="预览" />" id='review_title'>预览</a>
							 
							 <a class="layui-btn layui-btn-xs" href="javascript:reset_title('')" title="<dict:lang value="重置" />" >重置
							 </a>
							 	
							 <input type="hidden" id="paraMap_pic_title_hidden" name="paraMap.pic_title_hidden" value="${dataMap.pic_title}">
						</td>
					</tr>
					
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="登录页标题" />
						</td>
						<td width="35%">
							<input type="text" name="paraMap.text_login"   onkeyup="javascript:util.replaceLikeVal(this)" value="${dataMap.text_login}" id="paraMap_text_login" maxlength="15" />
							
						</td>
						
						<td width="15%" class="tr1">
							<dict:lang value="登录页logo" />
						</td>
						<td width="35%">
							<input type="file" lay-verify="logo_login_verify" id="paraMap_logo_login" name="logo_login" />
							<a class="layui-btn layui-btn-xs" href="javascript:review_logo('')" title="<dict:lang value="预览" />" id='review_logo'>预览</a>
							
							<a class="layui-btn layui-btn-xs" href="javascript:reset_logo('')" title="<dict:lang value="重置" />" >重置
							 </a>
							 
							<input type="hidden" id="paraMap_logo_login_hidden" name="paraMap.logo_login_hidden" value="${dataMap.logo_login}">
						</td>
						
					</tr>
					
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="是否多语言" />
						</td>
						<td width="35%">
							<select id="paraMap_is_morelang_login" name="paraMap.is_morelang_login" dictValue="%{dataMap.is_morelang_login}" 
							style="width:153px;" lay-filter="changemorelang" >
								<option value="1" <s:if test="dataMap.is_morelang_login==1">selected="selected"</s:if> >是</option>
								<option value="0" <s:if test="dataMap.is_morelang_login==0">selected="selected"</s:if> >否</option>
							</select>
							
						</td>
						
						<td width="15%" class="tr1">
							<dict:lang value="公司名称" />
						</td>
						<td width="35%">
							<input type="text" name="paraMap.compname_login"   onkeyup="javascript:util.replaceLikeVal(this)" value="${dataMap.compname_login}" id="paraMap_compname_login" maxlength="50" />
							
						</td>
						
					</tr>
					
					<tr style="display:none;" id="lang_show">
						<td width="15%" class="tr1">
							<dict:lang value="默认语言" />
						</td>
						<td width="35%">
							<s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']"/>
							<s:bean id="locales" name="com.more.fw.core.common.method.CommMethodMc"/>
							<s:select label="Language" 
									list="#locales.locales" listKey="value"    listValue="%{getText(key)}"
									value="dataMap.def_lang_login"
									name="paraMap.def_lang_login" id="langSelecter" 
									 theme="simple"/>
							
						</td>

					</tr>
					
					<tr>
                    	<blockquote class="layui-elem-quote" style="margin-left: 60px;margin-right: 60px;margin-top: 10px;">
							<div>
								<span class="Eng">
								浏览器title图片 : 64px*64px,.ico格式。
								登录页logo : 70px*60px,.png格式。
								</span>
							</div>
						</blockquote>
					</tr> 
				
				</table>
				
				 <div class="ptop_10 txac">
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
					<input type="reset" value="<dict:lang value="重置" />" onclick="reset();" class="layui-btn layui-btn-primary" />
					<input type="button" value="<dict:lang value="删除" />" onclick="deletec();" class="layui-btn layui-btn-danger" />
					<input type="button" value="<dict:lang value="查看" />" onclick="review();" class="layui-btn layui-btn-warm" />
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
	var form;
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function reloadPg(msg){
		isSubmit = false;
		//alert(msg);
		top.util.alert(msg);
		window.location.href = "${path}custconf/custconfAction_showCustconf_login.ms?paraMap.id=<s:property value="dataMap.id" />";
	}
	
	function edit(thisObj){
		//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return false;
		}
		//document.forms.add_form.submit();
		//isSubmit = true;
		return true;
		
	}
	
	function reset() {
		$('#review_title').css('display','none');
		$('#review_logo').css('display','none');
		
		document.forms.add_form.reset();
		
	}
	
	function deletec() {
		util.confirm(function(){
			$.ajax({
		           url:'${path}custconf/custconfAction_deleteCustconf_login.ms',
		           type:'GET',
		           dataType:'json',
		           success:function (res) {
		               reloadPg('删除成功');
		               
		           }
		     });
		},"<dict:lang value="确定删除" />");
		
	}
	
	function reset_title(){
	 	$("#paraMap_pic_title").val('');
	 	$("#paraMap_pic_title_hidden").val('');
	 	$('#review_title').css('display','none')
	 	alterWindows("浏览器title图片重置成功",6);
	}
	
	function reset_logo(){
	 	$("#paraMap_logo_login").val('');
	 	$("#paraMap_logo_login_hidden").val('');
	 	$('#review_logo').css('display','none')
	 	alterWindows("登录页logo重置成功",6);
	}
	
	
	$("#paraMap_pic_title").on("change",function(){
		var PIC_WIDTH = "64";
		var PIC_HEIGHT = "64";
		var PIC_SIZE = "1024";
		
		var _this = this;
		var fileName = $("#paraMap_pic_title").val();
   		var strFileName = fileName.substring(fileName.lastIndexOf("\\")+1); 
   		if(strFileName.indexOf('.ico')==-1){
   			$('#review_title').css('display','none');
   			 alterWindows("浏览器title图片必须是.ico格式",5);
    		_this.value="";
    		return;
   		}
		
		var url = window.URL || window.webkitURL;
	    //console.log(url.createObjectURL(this.files[0]));
	    var imgSize = this.files[0].size;
	    var img = new Image();
	    img.src = url.createObjectURL(this.files[0]);
	    img.onload = function () {
	    	var imgHeight = this.height;
	    	var imgWidth = this.width;
	    	
	    	if(imgHeight== PIC_HEIGHT){
	    		if(imgWidth == PIC_WIDTH){
	    			if(imgSize <= (PIC_SIZE*1024) ){
	    				//setImagePreview();
	    				review_title_value='2';
						
	    				$('#paraMap_pic_title_hidden').val(_this.value);
	    				$('#review_title').css('display','');
	    				
	    			}else {
	    				$('#review_title').css('display','none');
	    				 alterWindows("浏览器title图片大小超过"+PIC_SIZE+"kb",5);
	    				_this.value="";
	    				
	    			}
	    		}else {
	    			$('#review_title').css('display','none');
	    			alterWindows("浏览器title图片宽度必须是"+PIC_WIDTH+"px",5);
	    			_this.value="";
	    			
	    		}
	    	}else {
	    		$('#review_title').css('display','none');
	    		alterWindows("浏览器title图片高度必须是"+PIC_HEIGHT+"px",5);
	    		_this.value="";
	    		
	    	}
	    }
	});
	
	$("#paraMap_logo_login").on("change",function(){
		var PIC_WIDTH = "70";
		var PIC_HEIGHT = "60";
		var PIC_SIZE = "1024";
		
		var _this = this;
		var fileName = $("#paraMap_logo_login").val();
   		var strFileName = fileName.substring(fileName.lastIndexOf("\\")+1); 
   		if(strFileName.indexOf('.png')==-1){
   			$('#review_logo').css('display','none');
   			 alterWindows("登录页logo必须是.png格式",5);
    		_this.value="";
    		return;
   		}
		
		var url = window.URL || window.webkitURL;
	    //console.log(url.createObjectURL(this.files[0]));
	    var imgSize = this.files[0].size;
	    var img = new Image();
	    img.src = url.createObjectURL(this.files[0]);
	    img.onload = function () {
	    	var imgHeight = this.height;
	    	var imgWidth = this.width;

	    	if(imgHeight== PIC_HEIGHT){
	    		if(imgWidth == PIC_WIDTH){
	    			if(imgSize <= (PIC_SIZE*1024) ){
	    				//setImagePreview();
	    				review_logo_value='2';
						
	    				$('#paraMap_logo_login_hidden').val(_this.value);
	    				$('#review_logo').css('display','');
	    			}else {
	    				 alterWindows("登录页logo大小超过"+PIC_SIZE+"kb",5);
	    				_this.value="";
	    				$('#review_logo').css('display','none');
	    			}
	    		}else {
	    			alterWindows("登录页logo宽度必须是"+PIC_WIDTH+"px",5);
	    			_this.value="";
	    			$('#review_logo').css('display','none');
	    		}
	    	}else {
	    		alterWindows("登录页logo高度必须是"+PIC_HEIGHT+"px",5);
	    		_this.value="";
	    		$('#review_logo').css('display','none');
	    	}
	    }
	});

	$(function(){
		if($('#paraMap_is_morelang_login').val()=='1'){
			$('#lang_show').css('display','none')
		}else{
			$('#lang_show').css('display','')
		}
		
		var pic_title='${dataMap.pic_title}';
		if(pic_title!=null && pic_title!=''){
			$('#review_title').css('display','')
		}else{
			$('#review_title').css('display','none')
		}
		
		var logo_login='${dataMap.logo_login}';
		if(logo_login!=null && logo_login!=''){
			$('#review_logo').css('display','')
		}else{
			$('#review_logo').css('display','none')
		}
				
		layui.use('form', function(){
	    	 form = layui.form;
			 form.render();
			 
			 form.on('submit(filterSubmit)', function (data) {
		       return true;
				       
			}) 
			
			form.on('select(changemorelang)', function(data){   
			  	if($('#paraMap_is_morelang_login').val()=='1'){
				 	$('#lang_show').css('display','none')
				}else{
					$('#lang_show').css('display','')
				}

            });
			
			 form.verify({
		   		text_confirm_sys_verify: function(value,item){
			            var paraMap_text_confirm_sys = document.getElementById("paraMap_text_confirm_sys");
					   	if(!val.isBlank(paraMap_text_confirm_sys) && paraMap_text_confirm_sys.value.length>50){
					   		return '弹出确认框标题长度不能超过50';
					   	}
   	
				}
		     });

		
	    });
		    
	})
	
	function review(){
		var review_url="${dataMap.review_pic}";
		if(review_url==null || review_url==''){
			review_url='plf/images/cust/review_pic_cust2.png';
		}
		previewImg(review_url,379,309);
	}
	
	var review_title_value='1';
	function review_title(){
		if(review_title_value=='1'){
			var review_url = $("#paraMap_pic_title_hidden").val();
			//alert(review_url);
			previewImg(review_url,64,64);//64px*64px,.ico格式
			
		}else{
			previewImg2('paraMap_pic_title',64,64);
		}
		
	}
	
	var review_logo_value='1';
	function review_logo(){
		if(review_logo_value=='1'){
			var review_url = $("#paraMap_logo_login_hidden").val();
			//alert(review_url);
			previewImg(review_url,70,60);//70px*60px,.png格式
			
		}else{
			previewImg2('paraMap_logo_login',70,60);
		}
		
	}
	
	function previewImg(url,img_width,img_height) {
        var img = new Image();  
        img.src = url;
        
        var img_width = img_width+ 200; //获取图片宽度
        var img_height = img_height + 100; //获取图片高度
        
        var imgHtml = "<img src='${path}" + url + "?rand="+Math.random()+"' />";  
        //弹出层
        layer.open({  
            type: 1,  
            shade: 0.8,
            offset: 'auto',
            skin: 'layui-layer-molv',
            area: [img_width + 'px',img_height+'px'],
            shadeClose:true,//点击外围关闭弹窗
            scrollbar: false,//不现实滚动条
            title: "图片预览", //不显示标题  
            content: imgHtml, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响  
            cancel: function () {  
                //layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', { time: 5000, icon: 6 });  
            }  
        }); 
    }
    
    function previewImg2(file_id,img_width,img_height) {
		var hhotoObj = document.getElementById(file_id);
		
		if (hhotoObj.files && hhotoObj.files[0]) {
			//火狐下，直接設img属性
			url=window.URL.createObjectURL(hhotoObj.files[0]);
					
			var img = new Image();  
	        img.src = url;
	        
	        var img_width = img_width+ 150; //获取图片宽度
        	var img_height = img_height + 150; //获取图片高度
	        
	        var imgHtml = "<img src='" + url + "' />";  
	        //弹出层
	        layer.open({  
	            type: 1,  
	            shade: 0.8,
	            offset: 'auto',
	            skin: 'layui-layer-molv',
	            area: [img_width + 'px',img_height+'px'],
	            shadeClose:true,//点击外围关闭弹窗
	            scrollbar: false,//不现实滚动条
	            title: "图片预览", //不显示标题  
	            content: imgHtml, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响  
	            cancel: function () {  
	                //layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', { time: 5000, icon: 6 });  
	            }  
	        });
	        
	  }
  }
    
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>