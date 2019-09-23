<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="cx-cs" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="46a69fb9850f4b81909589215ac5053a"/>

</head>
<body scroll="auto" >

          <div class="content-in">
              <div class="dlist">
                  <div class="hd">
                  
		<bu:func viewId="4b9d61c96cdc4965884c1d047c96392f" />
                    
                  </div>
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="4b9d61c96cdc4965884c1d047c96392f" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>
                      
                      
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="4b9d61c96cdc4965884c1d047c96392f" formId="46a69fb9850f4b81909589215ac5053a" list="dataList" formidFirstId="46a69fb9850f4b81909589215ac5053a" relColIds="3e990e1aa5f14593b7c5e47478d23932,3e990e1aa5f14593b7c5e47478d23932" subFormIds="677346fc6b47486ba7a9164f03017738,612afe7157ae46479b87fdd32cb77485" subRelColIds="838ca5844aa648d193678e96bd870742,8c6a9b933e49400aaf2134d7ba44cbc3" currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" />
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>

		<div style="padding:1px;"></div>

		<bu:form viewId="4b9d61c96cdc4965884c1d047c96392f" formId="612afe7157ae46479b87fdd32cb77485" isSubForm="1" list="dataListSub"  formidFirstId="46a69fb9850f4b81909589215ac5053a" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=612afe7157ae46479b87fdd32cb77485&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>

		<div style="padding:1px;"></div>

		<bu:form viewId="4b9d61c96cdc4965884c1d047c96392f" formId="677346fc6b47486ba7a9164f03017738" isSubForm="1" list="dataListSub"  formidFirstId="46a69fb9850f4b81909589215ac5053a" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=677346fc6b47486ba7a9164f03017738&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>
                      
                  </div>
                </div>
          </div>


		<bu:submit viewId="4b9d61c96cdc4965884c1d047c96392f" />
		<bu:script viewId="4b9d61c96cdc4965884c1d047c96392f" />
    <script type="text/javascript">
         $('.js-nav').slick({
            dots: false,
            autoplay: false,
            slidesToScroll:1,
            slidesToShow:8
        });
         $('.menu-sub').mCustomScrollbar({
          scrollInertia:150
        });
        $('#mCSB_1').css('overflow','visible');
        $('.banner .item1').hover(function(){
          $('.banner').css('border-bottom-color','#20c2ff');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });
        $('.banner .item2').hover(function(){
          $('.banner').css('border-bottom-color','#fccd00');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });
        $('.banner .item3').hover(function(){
          $('.banner').css('border-bottom-color','#8fcf3e');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });
        $('.banner .item4').hover(function(){
          $('.banner').css('border-bottom-color','#592e2e');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });

        function Height(){
          var H = $(window).height();
          $('.menu').css('height',H);
          $('.content').css('height',H - 70);
          $('.content').mCustomScrollbar({
            scrollInertia:150
          });
        }
        Height();
        $(window).resize(function(){
          $('.content').mCustomScrollbar("destroy");
          Height();
        });
        $(function(){
          $('.dept_select').chosen();
      });
        

    	var isQuery = false;
    	function query(thisObj){
    		//如果有时间段的存在，则复制到搜索表单中
    		if($("#timeBucketId")){
    			$("#searchForm").append($("#timeBucketId").clone());
    			$("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
    		}
    		if(isQuery){utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");}
    		if($("#isClearOrder").val()==1){
    		    clearSelectOrder();
    		}
    		document.forms.searchForm.submit();
    		util.showTopLoading();
    		isQuery=true;
    	}
    	
    	function alertInfo(msg){
    		utilsFp.alert(msg);
    	}
    	
    	function reloadPg(msg,title,width,height,time){
    		//utilsFp.alert(msg,reloadPgExe);
    		msgPop(msg,reloadPgExe,title,width,height,time);
    	}
    	
    	function reloadPgExe(){
    		//document.forms.searchForm.submit();
    		query();
    		util.showTopLoading();
    		top.$(".dialog-close").click();
    	}
    	
    	function init(){
    		if($("#leftTable-kz").length>0){
    			$("#leftTable-kz").show();
    		}
    		
    		if($("#leftTable").length>0){
    			$("#leftTable").show();
    		}
    		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
    	}

    </script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
