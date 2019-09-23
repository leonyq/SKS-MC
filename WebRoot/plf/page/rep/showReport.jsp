<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
        <dict:lang value="报表展示" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>

</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
                
				  <form id="funForm" name="funForm" action="" method="post" target="submitFrame">
				     <bu:reporttimesearch reportId="${fn:escapeXml(paraMap.ID)}" />
				     <div class="optn">
				        <button type="button" class="botton_img_add" onclick="query(this)"><i class="ico ico-search-new"></i>查询</button>
				     </div>
				  </form>
				
            
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="" method="post">
                       <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="<c:out value='${paraMap.searchParaShowState}'/>" />
                       <c:set var='id_set' value='${fn:escapeXml(paraMap.ID)}'/>
                       <bu:reportsearch reportId="${fn:escapeXml(id_set)}" />
                   </form>
               </div>
               <div>
                    <iframe id="reportIframe" src="<c:out value='${dataMap.URL}'/>" style="width:100%;display:none;" scroll="auto" frameborder="0" allowtransparency="true" ></iframe>
               </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
<!--
//初始化iframe
function iframeInit(){
        //$("#reportIframe").css({"height":$(document).height()-200,"width":$(document).width()-90});
    $("#reportIframe").css("height",$(document).height()-200);
    
    $("#reportIframe").load(function(){
    
        var $iframeCon = $(this).contents();
        var $td = $($iframeCon.find("table tbody tr").get(0)).children();//最外层表的td
        
        //设置宽度
        $td.each(function(index,item){
            if(index==0 || index == 2){
              $(item).remove();// 删除掉两边空列$(item).removeAttr("width"); //
            }else if(index == 1){
                $(item).find("table").css("width","100%");
            }
        });
        
       $td.find("table tbody tr:even").css("background-color","#dcecfa");//设置奇偶换色
       
       $td.find("table tbody").each(function(idexn,item){
         $($(item).find("tr").get(0)).remove();//删除每个表第一个空行
       });//
       $("#reportIframe").show();//默认隐藏，待样式加载后显示
    });
    
    
}

//查询功能
function query(obj){
   // util.showLoading("处理中...");
    $("#reportIframe").hide();
    $("#reportIframe").attr("src","<c:out value='${dataMap.URL}'/>&"+$("#funForm").serialize()+"&"+$("#searchForm").serialize());
   // console.log($("#reportIframe").is(":visible"));
    //if($("#reportIframe").is(":visible")){
   //     util.closeLoading();
   // }
    //util.closeLoading();
    //iframeInit();
}

$(function(){
    iframeInit();
});
//-->
</script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

