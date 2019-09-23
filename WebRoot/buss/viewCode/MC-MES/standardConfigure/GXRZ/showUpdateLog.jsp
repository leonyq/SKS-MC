<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	
			<!-- head里面 -->
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
  <!-- 产品静态资源 -->
<style type="text/css">

#myDiv img {
    max-width: 700px;
    max-height: 100px;
}

 /* 查看原图 */
        .master_map{
            position: fixed;
            background-color: #fff;
            cursor: move;
            z-index: 1010;
        }

        .shadow_div{
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #000;
            opacity: 0.35;
            z-index: 1000;
        }

        .close_img{
            position: fixed;
            width: 36px;
            height: 36px;
            top: 0;
            right: 0;
            background-image: url(${path}plf/page/mlabel/img/close-big.png);
            z-index: 1020;
            cursor: pointer;
        }

        .close_img:hover{
            background-image: url(${path}plf/page/mlabel/img/close-big-h.png);
        }
</style>
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="4b8431cdb7f64a48bfc4cd96790b9cab" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="4b8431cdb7f64a48bfc4cd96790b9cab" />
	<input type="hidden" id="prefixInd" name="4b8431cdb7f64a48bfc4cd96790b9cab" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'3541e10938c842529f58430d4febce54'" />
		<s:set name="_$formId_1" value="'4b8431cdb7f64a48bfc4cd96790b9cab'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:100px;" /><bu:uitn colNo="CUL_SN" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec-self" colNo="CUL_SN" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_SN" formId="4b8431cdb7f64a48bfc4cd96790b9cab" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" style="width:100px;" /><bu:uitn colNo="CUL_MODEL" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_MODEL" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_MODEL" formId="4b8431cdb7f64a48bfc4cd96790b9cab" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUL_NAME" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_NAME" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_NAME" formId="4b8431cdb7f64a48bfc4cd96790b9cab" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CUL_RANK" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_RANK" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_RANK" formId="4b8431cdb7f64a48bfc4cd96790b9cab" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr style="display:none;">
			<td class="name"  /><bu:uitn colNo="CUL_CONTENT" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colNo="CUL_CONTENT" formId="4b8431cdb7f64a48bfc4cd96790b9cab" style="height:120px;" colspan="3"><bu:ui colNo="CUL_CONTENT" formId="4b8431cdb7f64a48bfc4cd96790b9cab" style="height:100%;width:100%;" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
		<tr>
		    <td class="name"/><bu:uitn colNo="CUL_CONTENT" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
		    <bu:td cssClass="dec" colNo="CUL_CONTENT" formId="4b8431cdb7f64a48bfc4cd96790b9cab" style="height:220px;" colspan="3">
		    <div id="myDiv" style="height:220px;overflow-y:scroll; word-wrap:break-word;border:1px solid #ccc">
			</div>
			</bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUL_FILE" formId="4b8431cdb7f64a48bfc4cd96790b9cab" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="CUL_FILE" formId="4b8431cdb7f64a48bfc4cd96790b9cab" ><bu:ui colNo="CUL_FILE" style="width:200px;" formId="4b8431cdb7f64a48bfc4cd96790b9cab" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="4b8431cdb7f64a48bfc4cd96790b9cab" formIndex="1" />
				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_18" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
    <script>
        $(function(){
   
    $("#paraMapObj_CUL_MODEL").attr("disabled","disabled");
    $("#paraMapObj_CUL_MODEL").attr("class","isSubmit input _VAL_DATABASE dept_select");
    $("#paraMapObj_CUL_NAME").attr("disabled","disabled");
    $("#paraMapObj_CUL_NAME").attr("class"," isSubmit input readonly _VAL_DATABASE");
    $("#paraMapObj_CUL_FILE").attr("disabled","disabled");
    
    $("#paraMapObj_CUL_RANK").attr("disabled","disabled");
    $("#paraMapObj_CUL_RANK").attr("class","isSubmit input _VAL_DATABASE dept_select");
   $("#paraMapObj_CUL_MODEL").trigger("chosen:updated");
   $("#paraMapObj_CUL_RANK").trigger("chosen:updated");
})
    
    </script>
    <script>
    	$(function(){
        	    	$("#myDiv").html($("#paraMapObj_CUL_CONTENT").val());
        	    //	$("#myDiv1").html($("#paraMapObj_CPF_HANDLE_WAY").val());
        	})
        	
        	 //点击查看原图
        $('#myDiv').on('click','p img',function(){ 
            var url = $(this).attr('src')
            $("<div class='shadow_div'>").appendTo('body');

            $("<img class ='master_map' src='" + url + "'>").appendTo('body');
            $('.master_map').css('left','calc((100% - ' + $('.master_map').width() + 'px)/2)'); 
            $('.master_map').css('top','calc((100% - ' + $('.master_map').height() + 'px)/2)'); 
            
            $("<div class='close_img'>").appendTo('body');  
        })



        //关闭放大
        function closeBig(){
            $('.shadow_div').remove();
            $('.master_map').remove();
            $('.close_img').remove();
        }
        $('body').on('click','.shadow_div',closeBig)
        $('body').on('click','.close_img',closeBig)

        //移除默认的拖动事件
        $('body').on('dragstart','.master_map',function(){
            return false;
        })

        //点击拖动图片
        $('body').on('mousedown','.master_map',function(e){
            var event = $(this);     
            var oldx = e.offsetX;
            var oldy = e.offsetY;
            document.onmousemove = function(ev){        
                $(event).css('left',ev.clientX - oldx +'px');
                $(event).css('top',ev.clientY - oldy +'px');
            }    
        })
        
        //松开移除拖动事件
        window.onmouseup = function(){
            document.onmousemove = null;
        }

        //图片滚动事件(放大缩小)
        $('body').on('mousewheel','.master_map',function(e,d){
            var direction = d > 0 ? 'Up' : 'Down';
            if (direction == 'Up') {
                resizeImg($(this),false)
            } else {
                resizeImg($(this),true)
            }

            return false;
        })

        //图片放大缩小  参数1:执行放大缩小的元素   参数2:是否放大(否的话则缩小)
        function resizeImg(item,isBig){
            var oldHeight = $(item).height();
            var oldWidth = $(item).width();
            var oldTop = $(item).css('top');
            var oldLeft = $(item).css('left');
            
            if(isBig){
                $(item).height($(item).height() + 50);
            }else{
                if(oldHeight <= 100 || oldHeight <= 100){
                    //太小就不允许缩
                }else{
                    $(item).height($(item).height() - 50);
                }
                
            }

            // 重新定位
            var top = parseFloat(oldTop) - ($(item).height() - oldHeight)/2;
            var left = parseFloat(oldLeft) - ($(item).width() - oldWidth)/2;

            $(item).css('top',top + 'px').css('left',left + 'px');
        }
    </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
