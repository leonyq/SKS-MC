<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="审批" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
	<link href="${path}plf/page/wf/process/css/style.css?_mc_res_version=<%=PlfStaticRes.WF_STYLE_CSS %>" rel="stylesheet" type="text/css" />
	</head>
<body style="overflow: hidden;">
  <div class="working-time">
   <div class="time-header">
        <span data-tosrc="initiate" class="clickFont showImg"><dict:lang value="发起审批" /></span>
        <span data-tosrc="todo" isload="0"><dict:lang value="待办事宜" /></span>
        <span data-tosrc="done" isload="0"><dict:lang value="已办事宜" /></span>
        <span data-tosrc="mysend" isload="0"><dict:lang value="我发起的" /></span>
        <span data-tosrc="sendtome" isload="0"><dict:lang value="抄送我的" /></span>
   </div>
   <div class="work-content" style="height:calc(100% - 66px);">
         <div id="initiate" class="pane" style="height:100%;">
            <iframe id="ifr0"  src="${path}comm/ProcessAction_initiateFlow.ms" frameborder="0" scrolling="auto" height="100%" width="100%"  style="display: block;"></iframe>
        </div>
        <div id="todo" class="hideIframe" style="height:100%;">
            <iframe id="ifr"    frameborder="0" scrolling="auto" height="100%" width="100%"  style="display: block;"></iframe>
        </div>
       <div id="done" class="hideIframe" style="height:100%;">
            <iframe id="ifr2"   frameborder="0" scrolling="auto" height="100%" width="100%"  style="display: block;"></iframe>
        </div>
        <div id="mysend" class="hideIframe" style="height:100%;">
            <iframe id="ifr3"   frameborder="0" scrolling="auto" height="100%" width="100%"  style="display: block;"></iframe>
        </div>
        <div id="sendtome" class="hideIframe" style="height:100%;">
           <iframe id="ifr4"    frameborder="0" scrolling="auto" height="100%" width="100%"  style="display: block;"></iframe>
        </div>  
   </div>
  
	
  </div>
<script type="text/javascript">
	   
	    $('.time-header span').click(function(){
	    	switchTag(this,'clickFont','showImg','work-content');
	    	
	    });
	   function switchTag(currentNode,ClassName,ClassName2,tagTo){	    	
	    	$(currentNode).addClass(ClassName+" "+ClassName2).siblings().removeClass(ClassName+" "+ClassName2);	    	
	    	var showContent=$(currentNode).attr('data-tosrc');
	    	var isload=$(currentNode).attr('isload');
	    	if(isload==0)
	    	{
	    	  $(currentNode).attr('isload','1');
	    	  if(showContent=='done'){
	    	     document.getElementById('ifr2').src="${path}plf/page/wf/process/completedFlow.jsp";
	    	  }
	    	  else if(showContent=='mysend'){
	    	     document.getElementById('ifr3').src="${path}plf/page/wf/process/requestFlow.jsp";
	    	  }
	    	  else if(showContent=='sendtome'){
	    	     document.getElementById('ifr4').src="${path}plf/page/wf/process/sendToMeFlow.jsp";
	    	  }else if(showContent=='todo'){
	    		  document.getElementById('ifr').src="${path}plf/page/wf/process/todoFlow.jsp";
	    	  }
	    	}
	    	
	    	else
	    	{
	    	  if(showContent=='done'){
	    	    $("#ifr2")[0].contentWindow.query('formId1');
	    	  }
	    	  else if(showContent=='mysend'){
	    	    $("#ifr3")[0].contentWindow.query('formId1');
	    	  }
	    	  else if(showContent=='sendtome'){
	    	     $("#ifr4")[0].contentWindow.query('formId1');
	    	  }else if(showContent=='todo'){
	    		  $("#ifr")[0].contentWindow.query('formId1');
	    	  }	    	
	    	}
	    	$('.'+tagTo+' #'+showContent).show().siblings().hide(); 	
	    }
	    
	     function reloadPg(msg,title,width,height,time){
             msgPop(msg,"",title,width,height,time);
             if(document.getElementById("todo").style.display=='block')
             {
                $("#ifr")[0].contentWindow.query('formId1');
             }
          }
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>
