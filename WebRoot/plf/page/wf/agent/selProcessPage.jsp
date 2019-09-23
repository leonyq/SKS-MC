<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="流程选择" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		<jsp:param name="datePicker" value="1" />
		</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/wf/process/common.jsp"%>
	<link href="${path}plf/page/wf/process/css/style.css?_mc_res_version=<%=PlfStaticRes.WF_STYLE_CSS %>" rel="stylesheet" type="text/css" />

</head>
	
<body style="overflow: hidden;" class="work-content">
			<form id="searchform" name="searchform"  class="layui-form" action="" method="post">

    <div class="children-page-search">
	    <div class="children-search-box">
	        <div class="search-box-content">
	           <div class="search-box-group">
	           
	              <input type="text" value="<c:out value='${flowName}' />" name="flowName"  class="input input-box" placeholder="<dict:lang value='输入流程名称' /> ">
	           </div>
	           
	        </div>
	        <div class="optn work-time-optn" style="left:260px">
		        <button type="button" onclick="query(this)" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
            </div>
	           
	    </div>
        
	</div>
	</form>
    <div class="bd" id="main" style="overflow-y:auto;padding-left:15px;height:calc(100% - 50px);">
    <c:forEach items="${dataList }" var="ld">			
		  <div  id="mainCard"  style="border-bottom: 1px solid #ededed;">
		    <div class="layui-card-title clear-float">
		        <span  class="layui-card-title-font">${ld.name} <span>(${ld.COUNT })</span></span>
		        <div class="card-body-toggle">
		             <dict:lang value='展开' />
		        </div>     
		    </div>
		    
		    <div class="work-card-body">
		           <ul style="padding-bottom: 25px;">
		            <c:forEach var="map" items="${processdeMap}" varStatus="status">		        
		          <c:if test="${map.key==ld.id  }">
		          <c:forEach var="mapli" items="${map.value}">
		               <li class="card-item" onclick="selFlow('${mapli.proc_de_id}','${mapli.proc_de_show_name }');" >                
		                 <a lay-href="javascript:void(0);">
		                   <span class="card-icon">
		                      <img  src="${path}${mapli.icon_path}">
		                    </span>
		                    <span class="card-font">
		                      ${mapli.proc_de_show_name }
		                     </span>
		                    
		                 </a>
		               </li> 
		               </c:forEach>  
		               </c:if>		          
		        </c:forEach>
		          </ul>  
		       
		    </div>
		  </div>
		</c:forEach>    
		  
	</div>
	

	
	
<script type="text/javascript">

var ciframeId="<c:out value='${param.ciframeId}' />";		
var parentWindows = $(window.parent.document).contents().find("#"+ciframeId)[0].contentWindow;
	
	$(function(){
          
         $(".work-card-body").each(function(i,ele){
          if($(ele).find('.card-item').length>0){
            $(ele).css('display','block');
            $(ele).parents("div").find(".card-body-toggle").text("<dict:lang value='收起' />");
          }
      });
          _newScroll("main");  

          $(".card-font").each(function(){
       	   if($(this).height()>92){
       	    	$(this).css("top","0px");
       	    }else{
       	    	 $(this).css({"top":"50%","transform": "translateY(-50%)"});
       	    }
          });
          $(".card-font").hover(function(e){
          	if($(this).height()>92){
          		 $(this).attr('title',$(this).text());         		 
          	} 	
         });
    });
      
    $(window).resize(function(){  
		//initHeight();	  		
	});
    
    $('.card-body-toggle').click(function(){
  	  $(this).parents("#mainCard").children(".work-card-body").toggle();
  	  if($(this).parents("#mainCard").children(".work-card-body").css('display')==="none"){
  		  $(this).text("<dict:lang value='展开' />");
  	  }
  	  if($(this).parents("#mainCard").children(".work-card-body").css('display')==="block"){
  		  $(this).text("<dict:lang value='收起' />");
  	  }
    });
	function query(){         
    	document.forms.searchform.submit();  
    }	
    function selFlow(flowId,name){
        var flag=false;
		 
						
			parentWindows.$("#addProcessList  tr ").each(function(j,ele){
			
			  if($(ele).find("td:eq(1)").find("input").val()==flowId){
			    flag=true;
			    utilsFp.confirmIcon(1,"","","", "<dict:lang value="流程设置已存在"  moName="plf"/>",0,"300","");
			    return false;			    
			  }
			});
			
		if(flag) return false;
       parentWindows.addProcessRow(flowId,name);
       closeTopPopWinFp('selProcessPagepop');
    }
   
    

</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js?_mc_res_version=<%=PlfStaticRes.POPMULTPAGE %>"></script>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp" />
</body>
<%@ include file="/plf/common/pub_end.jsp" %>