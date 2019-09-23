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
			<form id="add_form" name="addForm" class="layui-form" action="${path}custconf/custconfAction_configCustconf_index.ms" method="post" enctype="multipart/form-data" target="submitFrame">
				
				<input type="hidden" name="paraMap.id" value="${dataMap.id}">
				
				<table class="add_table">
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="标签栏logo" />
						</td>
						<td width="35%">
							 <input type="file" lay-verify="logo_tab_index_verify" id="paraMap_logo_tab_index" name="logo_tab_index" /> 
							 <a class="layui-btn layui-btn-xs" href="javascript:review_tab('')" title="<dict:lang value="预览" />" id='review_tab'>预览</a>
							 
							 <a class="layui-btn layui-btn-xs" href="javascript:reset_tab('')" title="<dict:lang value="重置" />" >重置
							 </a>
							 	
							 <input type="hidden" id="paraMap_logo_tab_index_hidden" name="paraMap.logo_tab_index_hidden" value="${dataMap.logo_tab_index}">
						</td>
						
						<td width="15%" class="tr1">
							<dict:lang value="浏览器title名称" />
						</td>
						<td width="35%">
							<input type="text" name="paraMap.text_title"   onkeyup="javascript:util.replaceLikeVal(this)" value="${dataMap.text_title}" id="paraMap_text_title" maxlength="50" />
							
						</td>
						
						
					</tr>
					
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="菜单栏logo" />
						</td>
						<td width="35%">
							 <input type="file" lay-verify="logo_menu_index_verify" id="paraMap_logo_menu_index" name="logo_menu_index" /> 
							 <a class="layui-btn layui-btn-xs" href="javascript:review_menu('')" title="<dict:lang value="预览" />" id='review_menu'>预览</a>
							 
							 <a class="layui-btn layui-btn-xs" href="javascript:reset_menu('')" title="<dict:lang value="重置" />" >重置
							 </a>
							 	
							 <input type="hidden" id="paraMap_logo_menu_index_hidden" name="paraMap.logo_menu_index_hidden" value="${dataMap.logo_menu_index}">
						</td>
						
						<!--  
						<td width="10%" class="tr1">
							<dict:lang value="浏览器title图片" />
						</td>
						<td width="40%">
							 <input type="file" lay-verify="pic_title_verify" id="paraMap_pic_title" name="pic_title2" /> 
							 <a class="layui-btn layui-btn-xs" href="javascript:review_title('')" title="<dict:lang value="预览" />" id='review_title'>预览</a>
							 
							 <a class="layui-btn layui-btn-xs" href="javascript:reset_title('')" title="<dict:lang value="重置" />" >重置
							 </a>&nbsp;&nbsp;
							 	
							 <span class="Eng">64px*64px,.ico格式</span> 
							 <input type="hidden" id="paraMap_pic_title2_hidden" name="paraMap.pic_title2_hidden" value="${dataMap.pic_title}">
						</td>
						-->
					</tr>
					
					<tr>
                    	<blockquote class="layui-elem-quote" style="margin-left: 60px;margin-right: 60px;margin-top: 10px;">
							<div>
								<span class="Eng">
								标签栏logo : 110px*20px,.png格式。
								菜单栏logo : 32px*26px,.png格式。
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
		window.location.href = "${path}custconf/custconfAction_showCustconf_index.ms?paraMap.id=<s:property value="dataMap.id" />";
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
		
		$('#review_tab').css('display','none');
		$('#review_menu').css('display','none');
		
		document.forms.add_form.reset();
		
	}
	
	function deletec() {
		util.confirm(function(){
			$.ajax({
		           url:'${path}custconf/custconfAction_deleteCustconf_index.ms',
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
	 	$("#paraMap_pic_title2_hidden").val('');
	 	$('#review_title').css('display','none')
	 	alterWindows("浏览器title图片重置成功",6);
	}
	
	function reset_tab(){
	 	$("#paraMap_logo_tab_index").val('');
	 	$("#paraMap_logo_tab_index_hidden").val('');
	 	$('#review_tab').css('display','none')
	 	alterWindows("标签栏logo重置成功",6);
	}
	
	function reset_menu(){
	 	$("#paraMap_logo_menu_index").val('');
	 	$("#paraMap_logo_menu_index_hidden").val('');
	 	$('#review_menu').css('display','none')
	 	alterWindows("菜单栏logo重置成功",6);
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
	    				$('#paraMap_pic_title2_hidden').val(_this.value);
	    				$('#review_title').css('display','');
	    				
	    			}else {
	    				 alterWindows("浏览器title图片大小超过"+PIC_SIZE+"kb",5);
	    				_this.value="";
	    				$('#review_title').css('display','none');
	    			}
	    		}else {
	    			alterWindows("浏览器title图片宽度必须是"+PIC_WIDTH+"px",5);
	    			_this.value="";
	    			$('#review_title').css('display','none');
	    		}
	    	}else {
	    		alterWindows("浏览器title图片高度必须是"+PIC_HEIGHT+"px",5);
	    		_this.value="";
	    		$('#review_title').css('display','none');
	    	}
	    }
	});
	
	$("#paraMap_logo_tab_index").on("change",function(){
		var PIC_WIDTH = "110";
		var PIC_HEIGHT = "20";
		var PIC_SIZE = "1024";
		
		var _this = this;
		var fileName = $("#paraMap_logo_tab_index").val();
   		var strFileName = fileName.substring(fileName.lastIndexOf("\\")+1); 
   		if(strFileName.indexOf('.png')==-1){
   			$('#review_tab').css('display','none');
   			 alterWindows("标签栏logo必须是.png格式",5);
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
	    				review_tab_value='2';
	    				$('#paraMap_logo_tab_index_hidden').val(_this.value);
	    				$('#review_tab').css('display','');
	    				
	    			}else {
	    				 alterWindows("标签栏logo大小超过"+PIC_SIZE+"kb",5);
	    				_this.value="";
	    				$('#review_tab').css('display','none');
	    			}
	    		}else {
	    			alterWindows("标签栏logo宽度必须是"+PIC_WIDTH+"px",5);
	    			_this.value="";
	    			$('#review_tab').css('display','none');
	    		}
	    	}else {
	    		alterWindows("标签栏logo高度必须是"+PIC_HEIGHT+"px",5);
	    		_this.value="";
	    		$('#review_tab').css('display','none');
	    	}
	    }
	});
	
	$("#paraMap_logo_menu_index").on("change",function(){
		var PIC_WIDTH = "32";
		var PIC_HEIGHT = "26";
		var PIC_SIZE = "1024";
		
		var _this = this;
		var fileName = $("#paraMap_logo_menu_index").val();
   		var strFileName = fileName.substring(fileName.lastIndexOf("\\")+1); 
   		if(strFileName.indexOf('.png')==-1){
   			$('#review_menu').css('display','none');
   			 alterWindows("菜单栏logo必须是.png格式",5);
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
	    				review_menu_value='2';
	    				$('#paraMap_logo_menu_index_hidden').val(_this.value);
	    				$('#review_menu').css('display','');
	    				
	    			}else {
	    				 alterWindows("菜单栏logo大小超过"+PIC_SIZE+"kb",5);
	    				_this.value="";
	    				$('#review_menu').css('display','none');
	    			}
	    		}else {
	    			alterWindows("菜单栏logo宽度必须是"+PIC_WIDTH+"px",5);
	    			_this.value="";
	    			$('#review_menu').css('display','none');
	    		}
	    	}else {
	    		alterWindows("菜单栏logo高度必须是"+PIC_HEIGHT+"px",5);
	    		_this.value="";
	    		$('#review_menu').css('display','none');
	    	}
	    }
	});

	$(function(){
		var pic_title='${dataMap.pic_title}';
		if(pic_title!=null && pic_title!=''){
			$('#review_title').css('display','')
		}else{
			$('#review_title').css('display','none')
		}
		
		var logo_tab_index='${dataMap.logo_tab_index}';
		if(logo_tab_index!=null && logo_tab_index!=''){
			$('#review_tab').css('display','')
		}else{
			$('#review_tab').css('display','none')
		}
		
		var logo_menu_index='${dataMap.logo_menu_index}';
		if(logo_menu_index!=null && logo_menu_index!=''){
			$('#review_menu').css('display','')
		}else{
			$('#review_menu').css('display','none')
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
			review_url='plf/images/cust/review_pic_cust3.png';
		}
		previewImg(review_url,419,393);
	}
	
	var review_title_value='1';
	function review_title(){
		if(review_title_value=='1'){
			var review_url = $("#paraMap_pic_title2_hidden").val();
			//alert(review_url);
			previewImg(review_url,64,64);//64px*64px
			
		}else{
			previewImg2('paraMap_pic_title2',64,64);
		}
		
	}
	
	var review_tab_value='1';
	function review_tab(){
		if(review_tab_value=='1'){
			var review_url = $("#paraMap_logo_tab_index_hidden").val();
			//alert(review_url);
			previewImg(review_url,110,20);//110*20 logo_blue.png
			
		}else{
			previewImg2('paraMap_logo_tab_index',110,20);
		}
		
	}
	
	var review_menu_value='1';
	function review_menu(){
		if(review_menu_value=='1'){
			var review_url = $("#paraMap_logo_menu_index_hidden").val();
			//alert(review_url);
			previewImg(review_url,32,26);//32*26   N2-logo.png
			
		}else{
			previewImg2('paraMap_logo_menu_index',32,26);
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
	        
	        var img_width = img_width+ 200; //获取图片宽度
        	var img_height = img_height + 100; //获取图片高度
	        
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