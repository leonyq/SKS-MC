<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="文件上传" />
	</title> 
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
   
</head>
<body scroll="auto" style="overflow: auto;" >

          <div class="content-in">
              <div class="dlist">
                  <div class="hd">
                  
		<bu:func viewId="17d3b7a47f0a41979a13cc4409ebdfc6" />
                    
                  </div>
                 
                      
                      
		      <div>
		<bu:funcsi viewId="17d3b7a47f0a41979a13cc4409ebdfc6" funcId="ef5aadbcea32432f9e421a0008990ae7" isHidden="1"/>
		<form id="upfileForm" name="upfileForm" action="${path}buss/bussModel.ms" method="post" enctype="multipart/form-data">
		<font color="blue"> <dict:lang value="请选择要上传的excel文件:" /> </font>	
        <input type="file" name="upFile" id="upFile">
        
		</form>
		</div>
                      
                  </div>
             
          </div>


		<bu:submit viewId="17d3b7a47f0a41979a13cc4409ebdfc6" />
		<bu:script viewId="17d3b7a47f0a41979a13cc4409ebdfc6" />
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
    		}
    		if(isQuery){//utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");
    		utilsFp.confirmIcon(3,"","","", "<dict:lang value="数据正在提交，请稍候" />...",0,"","");}
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
    		$(".table_list").each(function(seq) {
    			var tableTrJs =$(this).find("tbody tr");
    			_toClickColorMap(tableTrJs,$(this).attr("id"));
    			_tongLineColor(tableTrJs);
    		});
    		
    		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
    		//判断是否隐藏搜索框
    		if($("#searchParaNull").val()=="0"){
    			$(".search-box").hide();
    		}
    	}

    </script>

<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
