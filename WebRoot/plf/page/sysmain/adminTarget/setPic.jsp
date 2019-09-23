<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.ReadProperties"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="图片配置页面" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
	</jsp:include>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<style type="text/css">
	
	.user-drop{
		height:calc(100% - 46px);
		position:absolute;width:auto;background-color: #fff;
	}
	
	.user-drop .item:nth-of-type(1),
	.user-drop .item:nth-of-type(2),
	.user-drop .item:nth-of-type(3),
	.user-drop .item:nth-of-type(4){
		margin-top:0;
	}
	
	.user-drop .item{
		float:left;margin:0 10px;margin-top: 15px;
	}
	
	.user-drop .item span{
        display: block;
	    width: 85px;
	    overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    height: 14px;
	    line-height: 14px;
	    margin-top: 5px;
	    float: left;
	}
	
	.user-drop .item img{
		background:#f2f2f2;
	}
	
	.bod{
		padding: 10px 20px 10px 20px
	}
	.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{background-color:#ccc;}
	
	.mCSB_scrollTools .mCSB_draggerRail{background-color: transparent;}
	</style>
	</head>
	
  <body>
	<div class="edit" style="height:100%;">
            <div class="hd">
			    <div class="optn">
			    	
			        <button type="button" onclick="commit(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			        <button type="button" onclick="popWorkDiv('addPicDiv','backPicDivshadow');"><i class="ico ico-uploading"></i><dict:lang value="上传图片" /></button>
			   		<button type="button" onclick="query(this);"><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
			    </div>
			</div>
			<div class="user-drop" id="picList">	
			<form id="search_form" name="searchForm" action="${path}sys/AdminTargetDataAction_queryPic.ms" method="post" >
				<s:token />
				<table class="search_table" style="margin-top:15px;margin-bottom: 15px;">
				<tr>
					<td width="30%" >
					  	&#x3000;&#x3000;&#x3000;<dict:lang value="图片名称" />：
					  	<input class="input" id="picNameSh" name="picNameSh" cssClass="input_sh" maxlength="30" width="230px"/>
				  	</td>
			    </tr>
				</table>
					<s:hidden id="picId_id" name="picIdId"/>
					<s:hidden id="picId_value" name="picIdValue"/>
					<s:hidden id="picUrl_id" name="picUrlId"/>
					<s:hidden id="parentiframeId" name="iframeId"/>
					<s:hidden id="selfiframeId" name="selfiframeId"/>
			 </form>
			 <div class="scroll" style="height: calc(100% - 65px);overflow: auto;">
			 	
	 <s:iterator value="adminPicList" id="picdto" status="index">
		
				<div class="item">
					<div style="width: 100px;height:100px;">
						<img alt="" src="${path}plf/userPhoto/<c:out value='${picdto.picName}'/>?_mc_res_version=<%=PlfStaticRes.PICDTO_PICNAME %>" width="100px" height="100px">
					</div>
					<s:if test="${picIdValue==picdto.id}">
						<input type="radio" name="picNameRadio" id="picName_%{#index.index}" class="radio" checked="checked" onclick="setPicId(this)" style="width:15px;height:14px;float:left;margin-top:5px;" accept=".png">
						<span title="${picdto.picName}">${picdto.picName}</span>
					</s:if>
					<s:else>
						<input type="radio" name="picNameRadio" id="picName_%{#index.index}" class="radio" style="width:15px;height:14px;float:left;margin-top:5px;" onclick="setPicId(this)">
						<span title="${picdto.picName}">${picdto.picName}</span>
					</s:else>
					<s:hidden id="picId_%{#index.index}" name="${picdto.id}">
					</s:hidden>
					
				</div>
      
    </s:iterator>
    		
    	</div>
   
</div>
 <div class="dialog dialog-s1" id="addPicDiv" style="display:none;z-index:1030;margin-left:0px;left:60px;top:70px;width:350px;height:250px;" >
		<form id="add_form" name="searchForm" method="post" enctype="multipart/form-data" target="addFrame"> 
		 <div class="dialog-hd">
			 <h3 class="tit"><dict:lang value="上传图片"/></h3>
		 </div>	
		 <a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addPicDiv','backPicDivshadow');"></a>
		  <div class="dialog-bd" style="width:100%;height:250px;padding-top:0;background-color:#fff;">
			<div class="optn optn_div">
				<button type="button" onclick="addPic(this)"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addPicDiv','backPicDivshadow');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
			</div>
			<div>
				<div id="photoImg" style="margin-top:20px;">
	       				<img id="preview" dynsrc="" style="margin-left:100px;width:100px;height:100px;" src="${path}plf/page/fp/img/MoreWis.png" align="bottom">
						<span style="font-size:12px;color:#999;margin-left:5px;">支持2M以内</span>
						<div style="margin-left: 10%"></div>
	       		</div>
				<div style="padding-top: 10px;margin-left:100px;" id="photoImg">
						<input type="file" id="upFile" name="upFile" onchange="javascript:setImagePreview();" style="width:200px;"/>				
				</div>
				<s:hidden id="selfiframeId" name="${selfiframeId}"></s:hidden>
			</div>
			</form>
			<iframe id="addFrame" name="addFrame" src="" width="0" height="0" ></iframe>
   </div>
  </div>
   <div class="dialog-mask" id="backPicDivshadow" style="z-index:1029"></div>
   <script src="${path}plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_1_7_2_JS %>"></script>
	<script src="${path}plf/js/highcharts/fileUpload.js?_mc_res_version=<%=PlfStaticRes.FILEUPLOAD_JS %>"></script>
	<script src="${path}plf/page/fp/js/jquery.mCustomScrollbar.concat.min.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>
	<script type="text/javascript">
		var picIdSelected="";
		var picUrlSelected="";
		var isClick=false;
		function popWorkDiv(showId,backId){
			$("#"+showId+",#"+backId).show();
			$('.chosen-container').css("width","230px");//如果DIV中有下拉框，则需要这行代码
			$("#preview").attr("src", "${path}plf/page/fp/img/MoreWis.png");
			$("#upFile").val('');
		}
		function addPic(thisObj){//图片新增
			var picId_id=$("#picId_id").val();
			var picUrl_id=$("#picUrl_id").val();
			var picId_value=$("#picId_value").val();
			 var upFile = document.getElementById("upFile").files; 
			 var leng = upFile[0].name.length;
			var filename=upFile[0].name.substring(0,leng-4); 
			var regx4=/^[\u4e00-\u9fa5_a-zA-Z0-9]+$/
			if(!regx4.test(filename)){
				utilsFp.confirmIcon(1,"","","","<dict:lang value="文件名只能输入中英文数字下划线！" />",0,"300","");
				return false;
			}
			//获取当前iframe名称
			var url="${path}sys/AdminTargetDataAction_addPic.ms?picId_id="+picId_id+"&picUrl_id="+picUrl_id+"&picId_value="+picId_value+"&iframeId=setPicIframe";
			var len = document.getElementById("upFile").value.length;
			if(len==0){
				utilsFp.confirmIcon(1,"","","","<dict:lang value="图片不能为空,请选择图片！" />",0,"300","");
				return false;
			}else  if($.trim(document.getElementById("upFile").value.substring(len-3,len))!="png"){
				utilsFp.confirmIcon(1,"","","","<dict:lang value="图片格式不支持，请重新选择(.png后缀格式的图片)" />",0,"300","");
				return false;
			}
			document.forms.add_form.action=url;
			document.forms.add_form.submit();
		}
		function setPicId(thisObj){
			isClick=true;
			picIdSelected=$(thisObj).siblings("input").attr("name");
			picUrlSelected=$(thisObj).siblings("div").find("img").attr("src")
		}
		function query(thisObj){
			document.forms.search_form.submit();			
		}
		function commit(thisObj){
			var picId_id=$("#picId_id").val();
			var picUrl_id=$("#picUrl_id").val();
			var parentiframeId=$("#parentiframeId").val();
			var parentFrame=top.document.getElementById(parentiframeId);//获取到父iframe对象
			var parentPicIdId=parentFrame.contentWindow.document.getElementById(picId_id);//通过父iframe找到图片ID这个输入框
			var parentPicUrlId=parentFrame.contentWindow.document.getElementById(picUrl_id);//通过父iframe找到图片URL
			if(isClick){
				parentPicIdId.value=picIdSelected;
				parentPicUrlId.src=picUrlSelected;
			}
			closeWindow();
		}
		
		function reloadIframe(){
			window.location.reload();
		}
		function hideDiv(showId,backId){
			$("#"+showId+",#"+backId).hide();
		}
		function setImagePreview(){
			var hhotoObj = document.getElementById("upFile");
			var imgObjPreview = document.getElementById("preview");
			if (hhotoObj.files && hhotoObj.files[0]) {
				//火狐下，直接設img属性
				imgObjPreview.style.display = 'block';
				imgObjPreview.style.width = '100px';
				imgObjPreview.style.height = '120px';
				imgObjPreview.src = window.URL.createObjectURL(hhotoObj.files[0]);
			}else{
				//IE下，使用滤镜
				hhotoObj.select();
				var imgSrc = document.selection.createRange().text;
				document.selection.empty();
				var imgId = document.getElementById("photoImg");
				imgId.style.width = '100px';
				imgId.style.height = '120px';
				imgId.style.marginLeft = '120px';
				try {
					imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
					imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				} catch (e) {
					utilsFp.confirmIcon(3,"","","", "<dict:lang value='图片格式不支持，请重新选择(.png后缀格式的图片)' />",0,"300","");
					return false;
				}
				imgObjPreview.style.display = 'none';
				//document.selection.empty();
			}
			return true;
		}
		
		function valData(){
			   var type=$("#type").val();
				var menuId_value=$("#menuId_value").val();
			   if(type!=""){
				   if(type==0&&type!=""){
				   		document.getElementById("error_msg").innerHTML = "<dict:lang value="只能是功能级别菜单" />";
				    	window.setTimeout("closeValMsg('error_msg')", 2000);
				    	return false;
				   }
				   else{
				    	document.getElementById("error_msg").innerHTML = "";
				   }
			   }else if(menuId_value==null||menuId_value==""){
				   if(type==""){
					   	document.getElementById("error_msg").innerHTML = "<dict:lang value="请选择一个功能级别菜单" />";
				    	window.setTimeout("closeValMsg('error_msg')", 2000);
				    	return false;
				   }
			   }
	    		return true;
	    }
	    
	    (function($){
	    	$(window).on("load",function(){
	    		$('.scroll').mCustomScrollbar({
		        	scrollInertia:150,
		        	autoHideScrollbar:true,
		        	theme:"minimal-dark",
		      	});
	    	})
	    	
	    })(jQuery);
	    	

	</script>
  </body>
</html>
