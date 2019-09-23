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
#paraMapObj_CEI_RECORD_EMP_SHOW {
   border:1px solid #ccc!important; 
}
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
			<div class="bd" style="top:0;border:0;height:372px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="5b459044dfc845bd98cf173f26aab70a" type="edit" />
	<table class="basic-table" style="table-layout: fixed;" >
	<input type="hidden" name="formIds" value="5b459044dfc845bd98cf173f26aab70a" />
	<input type="hidden" id="prefixInd" name="5b459044dfc845bd98cf173f26aab70a" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'99418eeb243a4f4c9a6fd03084c7d4cf'" />
		<s:set name="_$formId_1" value="'5b459044dfc845bd98cf173f26aab70a'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:65px;"  /> <bu:uitn colNo="CEI_TYPE" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<bu:td cssClass="dec"  style="width:230px;"  colNo="CEI_TYPE" formId="5b459044dfc845bd98cf173f26aab70a" ><bu:ui colNo="CEI_TYPE" formId="5b459044dfc845bd98cf173f26aab70a" dataId="${dataId}" formIndex="1" disabled="disabled"  /></bu:td>
		<td class="name" /><bu:uitn colNo="CEI_AREA_SN" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<bu:td cssClass="dec" style="width:230px;"  colNo="CEI_AREA_SN" formId="5b459044dfc845bd98cf173f26aab70a" ><bu:ui colNo="CEI_AREA_SN" formId="5b459044dfc845bd98cf173f26aab70a" dataId="${dataId}" formIndex="1" disabled="disabled"  /></bu:td>
		</tr>
		
		  <tr style="display:none;" >
			<td class="name"  /><bu:uitn colNo="CEI_RECORD_CONTENT" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<bu:td cssClass="dec" colNo="CEI_RECORD_CONTENT" formId="5b459044dfc845bd98cf173f26aab70a" style="height:250px;" colspan="3"><bu:ui colNo="CEI_RECORD_CONTENT" formId="5b459044dfc845bd98cf173f26aab70a" style="height:100%;width:100%;" dataId="${dataId}" formIndex="1" disabled="disabled"/></bu:td>
		</tr>
				<tr>
			<td class="name" /><bu:uitn colNo="CEI_RECORD_EMP" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<bu:td cssClass="dec" colNo="CEI_RECORD_EMP" formId="5b459044dfc845bd98cf173f26aab70a" ><bu:ui colNo="CEI_RECORD_EMP" formId="5b459044dfc845bd98cf173f26aab70a" dataId="${dataId}" formIndex="1" disabled="disabled"  /></bu:td>
				<td class="name" /><bu:uitn colNo="CEI_RECORD_TIME" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
			<bu:td cssClass="dec" colNo="CEI_RECORD_TIME" formId="5b459044dfc845bd98cf173f26aab70a" ><bu:ui colNo="CEI_RECORD_TIME" formId="5b459044dfc845bd98cf173f26aab70a" dataId="${dataId}" formIndex="1" disabled="disabled"  /></bu:td>
		</tr>
		<tr>
		    <td class="name"/><bu:uitn colNo="CEI_RECORD_CONTENT" formId="5b459044dfc845bd98cf173f26aab70a" /></td>
		    <bu:td cssClass="dec" colNo="CEI_RECORD_CONTENT" formId="5b459044dfc845bd98cf173f26aab70a" style="height:250px;" colspan="3">
		    <div id="myDiv" style="height:255px;width: 693px;overflow-y:scroll; word-wrap:break-word;border:1px solid #ccc">
			</div>
			</bu:td>
		</tr>

		</tr>
	
		
	</table>
			<bu:jsVal formId="5b459044dfc845bd98cf173f26aab70a" formIndex="1" />
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
        	    	$("#myDiv").html($("#paraMapObj_CEI_RECORD_CONTENT").val());
        	    //	$("#myDiv1").html($("#paraMapObj_CPF_HANDLE_WAY").val());
        	    $('.dialog-bd',parent.document).css('background-color','#fff')

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
    <script>
    $(function(){
        getAreaName();
        //$("#paraMapObj_CEI_TYPE").attr("disabled","disabled");
       // $("#paraMapObj_CEI_TYPE").attr("class","isSubmit input _VAL_DATABASE dept_select");
       // $("#paraMapObj_CEI_AREA_SN").attr("disabled","disabled");
        //$("#paraMapObj_CEI_AREA_SN").attr("class"," isSubmit input readonly _VAL_DATABASE");
        //$("#paraMapObj_CEI_RECORD_EMP").attr("disabled","disabled");
      //  $("#paraMapObj_CEI_RECORD_EMP_SHOW").attr("disabled","disabled");
      //  $("#paraMapObj_CEI_RECORD_EMP_SHOW").attr("class"," isSubmit input readonly _VAL_DATABASE");
         //$("#paraMapObj_CEI_RECORD_EMP_SHOW").attr("style", "border:1px solid #ccc;");
       //  $("#paraMapObj_CEI_RECORD_TIME").attr("disabled","disabled");
       // $("#paraMapObj_CEI_RECORD_TIME").attr("class"," isSubmit  input readonly WdateNomorl");
      // $("#paraMapObj_CEI_TYPE").trigger("chosen:updated");
      
        
    })
    function getAreaName(){
    var CEI_AREA_SN =$("#paraMapObj_CEI_AREA_SN").val();
    $.ajax({
        type:"post",
        dataType:"json",
        data:"type=2&CEI_AREA_SN="+CEI_AREA_SN,
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=0f0c6951cd85418ab4527a5c9b06ef55",//VM-环境信息-新增  操作功能  获取下拉树
        success:function(data){
            if(null==data){
                return;
            }
            if(null!=data.ajaxList){
                
                var list =  eval(data.ajaxList);
               // if(null==list[0].WA_AREA_NAME) list[0].WA_AREA_NAME="";
              //  $("#paraMapObj_CEI_AREA_SN").val(list[0].CA_NAME);
              if(null!=list &&　list.length>0){
                   
                   if(list[0].WA_AREA_NAME!=null){
                   
                   $("#AREA_NAME").val(list[0].WA_AREA_NAME);
                    }
              
            }
           
        },
        error:function(msg){
            	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
    })
}
    </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
