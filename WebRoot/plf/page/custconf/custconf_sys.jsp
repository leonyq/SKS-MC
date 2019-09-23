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
			<form id="add_form" name="addForm" class="layui-form" action="${path}custconf/custconfAction_configCustconf_sys.ms" method="post" target="submitFrame">
				
				<input type="hidden" name="paraMap.id" value="${dataMap.id}">
				
				<table class="add_table">
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="弹出确认框标题" />
						</td>
						<td width="30%">
							<input type="text" name="paraMap.text_confirm_sys" lay-verify="text_confirm_sys_verify"  onkeyup="javascript:util.replaceLikeVal(this)" value="${dataMap.text_confirm_sys}" id="paraMap_text_confirm_sys" maxlength="15" />
							
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="弹出提示框标题" />
						</td>
						<td width="30%">
							<input type="text" name="paraMap.text_tip_sys" lay-verify="text_tip_sys_verify"  onkeyup="javascript:util.replaceLikeVal(this)" value="${dataMap.text_tip_sys}" id="paraMap_text_tip_sys" maxlength="15" />
							
						</td>
					</tr>
					
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="消息发送提示框标题" />
						</td>
						<td width="30%">
							<input type="text" name="paraMap.text_sendmsg_sys" lay-verify="text_sendmsg_sys_verify"  onkeyup="javascript:util.replaceLikeVal(this)" value="${dataMap.text_sendmsg_sys}" id="paraMap_text_sendmsg_sys" maxlength="15" />
							
						</td>

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
		window.location.href = "${path}custconf/custconfAction_showCustconf_sys.ms?paraMap.id=<s:property value="dataMap.id" />";
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
		document.forms.add_form.reset();
		
	}
	
	function deletec() {
		util.confirm(function(){
			$.ajax({
		           url:'${path}custconf/custconfAction_deleteCustconf_sys.ms',
		           type:'GET',
		           dataType:'json',
		           success:function (res) {
		               reloadPg('删除成功');
		               
		           }
		     });
		},"<dict:lang value="确定删除" />");
		
	}
	
	function review(){
		var review_url="${dataMap.review_pic}";
		if(review_url==null || review_url==''){
			review_url='plf/images/cust/review_pic_cust1.png';
		}
		previewImg(review_url,558,304);
	}
	
	function previewImg(url,img_width,img_height) {
        var img = new Image();  
        img.src = url;
        
        var img_width = img_width+ 50; //获取图片宽度
        var img_height = img_height + 50; //获取图片高度
        
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
	
	$(function(){
		layui.use('form', function(){
	    	 form = layui.form;
			 form.render();
			 
			 form.on('submit(filterSubmit)', function (data) {
		       return true;
				       
			}) 
			
			 form.verify({
		   		text_confirm_sys_verify: function(value,item){
			            var paraMap_text_confirm_sys = document.getElementById("paraMap_text_confirm_sys");
					   	if(!val.isBlank(paraMap_text_confirm_sys) && paraMap_text_confirm_sys.value.length>50){
					   		return '弹出确认框标题长度不能超过50';
					   	}
   	
				}
		     });
		     
		     form.verify({
		   		text_tip_sys_verify: function(value,item){
			            var paraMap_text_tip_sys = document.getElementById("paraMap_text_tip_sys");
					   	if(!val.isBlank(paraMap_text_tip_sys) && paraMap_text_tip_sys.value.length>50){
					   		return '弹出提示框标题长度不能超过50';
					   	}
   	
				}
		     });
		     
		     form.verify({
		   		text_sendmsg_sys_verify: function(value,item){
			            var paraMap_text_sendmsg_sys = document.getElementById("paraMap_text_sendmsg_sys");
					   	if(!val.isBlank(paraMap_text_sendmsg_sys) && paraMap_text_sendmsg_sys.value.length>50){
					   		return '消息发送提示框标题长度不能超过50';
					   	}
   	
				}
		     });

	    });
		    
	})

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>