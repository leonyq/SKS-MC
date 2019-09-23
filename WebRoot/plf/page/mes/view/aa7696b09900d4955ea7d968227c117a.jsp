<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="we" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
<script src="${path}plf/js/ui/textform/js/jquery.validate.js"></script>

<style type="text/css">
.extend-btn button .ico-save2{
	width: 15px;
	height: 15px;
	margin-right: 5px;
	margin-bottom: 3px;
	background: url(${path}plf/page/fp/img/17.png) no-repeat;
}

.extend-btn button:hover .ico-save2 {
	width: 15px;
	height: 15px;
	margin-right: 5px;
	margin-bottom: 3px;
	background: url('${path}plf/page/fp/img/17.png') no-repeat;
}
</style>


</head>
<body scroll="auto" style="overflow: auto;">

	<div class="content-in">
		<div class="dlist">
			<div class="hd">
				<div class="tit">
					<div class="group">
						<div class="dec">
							<select name="dept" data-placeholder="开单日期" id="dept"
								class="dept_select">
								<option value="-1"></option>
								<option value="开单日期">开单日期</option>
								<option value="开单日期">开单日期</option>
							</select>
						</div>
					</div>
					<div class="group">
						<div class="dec">
							<input type="" name="" class="input" value="2016-03-03"><span
								class="ico ico-date"></span>
						</div>
						<span class="txt">至</span>
						<div class="dec">
							<input type="" name="" class="input" value="2016-03-03"><span
								class="ico ico-date"></span>
						</div>
					</div>
				</div>
				<bu:func viewId="441975e1ef504962aff7b7fe6e95fe70" />
				<bu:funcsi viewId="441975e1ef504962aff7b7fe6e95fe70"
					funcId="0495b20be0df49af91ccaf36de9ee1bd" />

			</div>
			<div class="bd">
				<div class="search-box">
					<form id="searchForm" name="searchForm"
						action="${path}buss/bussModel.ms" method="post">
						<input type="hidden" name="exeid" value="${exeid}" />
						<s:hidden
							name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
						<bu:search viewId="441975e1ef504962aff7b7fe6e95fe70" />
						<a href="javascript:;" class="more"></a>
						<script type="text/javascript">
                          $('.search-box .more').click(function(){
                            $('.search-box').toggleClass('show');
                          })
                        </script>
					</form>

				</div>
				<form id="listForm" name="listForm"
					action="${path}buss/bussModel.ms" method="post">
					<input type="hidden" name="exeid" value="${exeid}" />
					<s:hidden
						name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
					<bu:form viewId="441975e1ef504962aff7b7fe6e95fe70"
						formId="81020f8751264246b22d7335795a141d" list="dataList"
						formidFirstId="81020f8751264246b22d7335795a141d"
						relColIds="682399edb37e439b97edca87fc110640"
						subFormIds="2fc75c6d985a46a1996156f151c522a2"
						subRelColIds="0f2abf2de97f45e8afc1dc2ca1a9cdd5" />
					<%
					  if (null != request.getAttribute("page")) {
									PaginationImpl _pageTop = (PaginationImpl) request
											.getAttribute("page");
									if (_pageTop.isPage()) {
					%>
					<div class="center">
						<s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
					</div>
					<%
					  }
								}
					%>
				
			</div>

			<div style="padding:1px;"></div>

			<bu:form viewId="441975e1ef504962aff7b7fe6e95fe70"
				formId="2fc75c6d985a46a1996156f151c522a2" isSubForm="1"
				list="dataListSub" formidFirstId="81020f8751264246b22d7335795a141d"
				relColIds="" subFormIds="" subRelColIds="" />

			<div class="center">
				<s:include
					value="/plf/common/paginationAx.jsp?formId=2fc75c6d985a46a1996156f151c522a2&listDataFn=_listSubDataAx&showLoading=0" />
			</div>
		</div>


		</form>
	</div>
	</div>
	</div>


	<bu:submit viewId="441975e1ef504962aff7b7fe6e95fe70" />
	<bu:script viewId="441975e1ef504962aff7b7fe6e95fe70" />
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

                

    	var isQuery = false;
    	function query(thisObj){
    		if(isQuery){utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");}
    		document.forms.searchForm.submit();
    		util.showTopLoading();
    		isQuery=true;
    	}
    	
    	function alertInfo(msg){
    		utilsFp.alert(msg);
    	}
    	
    	function reloadPg(msg){
    		utilsFp.alert(msg,reloadPgExe);
    	}
    	
    	function reloadPgExe(){
    		document.forms.searchForm.submit();
    		util.showTopLoading();
    	}
    	
    	function init(){
    		$(".dlist-table").each(function(seq) {
    			var tableTrJs =$(this).find("tbody tr");
    			//_toClickColorMap(tableTrJs,$(this).attr("id"));
    			_tongLineColor(tableTrJs);
    		});

 
    		
    		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
    	}
      
    </script>

	<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
