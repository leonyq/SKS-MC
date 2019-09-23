<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="地域测试后台01" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<script src="${path}/plf/js/ui/textform/js/jquery.validate.js"></script>

</head>
<body scroll="auto" >

          <div class="content-in">
              <div class="dlist">
                  <div class="hd">
                  
		<bu:func viewId="4e692f38509147b1a7b1833fa2cf9550" />
                    
                  </div>
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="4e692f38509147b1a7b1833fa2cf9550" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>
                      
                      
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<table id="table_3b1b0a53bf9144978bc1c4df1888712e" border="1" width="100%" class="dlist-table table-line ">
    <thead style="
    display: table;
    width: calc( 100% - 1em );
    /* width: 99%; */
    table-layout:fixed;
    width: calc( 100% - 1em );
">
    <tr class="thcolor">
<th style="
    width: 30px;
"></th>
<th style="
    padding-left: -5px;
    /* width: 409px; */
"><input type="checkbox" id="selectAll_3b1b0a53bf9144978bc1c4df1888712e" onclick="_selectAllData(this,'3b1b0a53bf9144978bc1c4df1888712e');" style="cursor: pointer;" title="?全选"></th>
<th style="
    /* text-align: center; */
">员工姓名</th>
<th style="
    /* text-align: center; */
">员工编号</th>
<th>累计产量</th>
      <th>累计产量</th>
      <th>累计产量</th>
      <th>累计产量</th>
      <th>累计产量</th>
      <th>累计产量</th>
      <th>累计产量</th>
      <th>累计产量</th>
      <th>累计产量</th>
      <th>累计产量</th>
      <th>累计产量</th>
      <th>累计产量</th>
      <th>累计产量</th>
      <th style="
    width: 4px;
"></th>
    </tr>
    </thead>
    <tbody id="tbody_3b1b0a53bf9144978bc1c4df1888712e" style="
    display: block;
    height: 90px;
    overflow-y: scroll;
    overflow-x: hidden;
" class="tbodyClass">
    <tr id="2" onclick="showSubFormLs('3b1b0a53bf9144978bc1c4df1888712e','22e069ee83fc4906aa878ab72da8c908','5d4b85f9235a49859912dbfd1213d415','2');" style="
    display: table;
    width:100%;
    table-layout:fixed;
">
<td style="/* text-align:center; */padding-left: 10px;width: 20px;">1</td>
<td class="_noedit"><input type="checkbox" name="3b1b0a53bf9144978bc1c4df1888712e$ID" value="2" class="isSubmit _selectdata" style="cursor: pointer;"></td>
      <td style="
    /* padding-left: 5px; */
    /* text-align: center; */
">ename_2</td>
      <td style="
    /* padding-left: 10px; */
    /* text-align: center; */
">2</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
    </tr>
    <tr id="1" onclick="showSubFormLs('3b1b0a53bf9144978bc1c4df1888712e','22e069ee83fc4906aa878ab72da8c908','5d4b85f9235a49859912dbfd1213d415','1');" class="tr-hover" style="
    /* display: block; */
    /* height:195px; */
    display: table;
    width:100%;
    table-layout:fixed;
    /* overflow-y:scroll; */
">
<td style="/* text-align:center; */padding-left: 10px;width: 20px;">2</td>
<td class="_noedit"><input type="checkbox" name="3b1b0a53bf9144978bc1c4df1888712e$ID" value="1" class="isSubmit _selectdata" style="cursor: pointer;"></td>
      <td>ename_1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr id="1" onclick="showSubFormLs('3b1b0a53bf9144978bc1c4df1888712e','22e069ee83fc4906aa878ab72da8c908','5d4b85f9235a49859912dbfd1213d415','1');" class="tr-hover" style="
    /* display: block; */
    /* height:195px; */
    display: table;
    width:100%;
    table-layout:fixed;
    /* overflow-y:scroll; */
">
<td style="/* text-align:center; */padding-left: 10px;width: 20px;">2</td>
<td class="_noedit"><input type="checkbox" name="3b1b0a53bf9144978bc1c4df1888712e$ID" value="1" class="isSubmit _selectdata" style="cursor: pointer;"></td>
      <td>ename_1</td>
      <td>1</td>
      <td>1</td>
        <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr id="1" onclick="showSubFormLs('3b1b0a53bf9144978bc1c4df1888712e','22e069ee83fc4906aa878ab72da8c908','5d4b85f9235a49859912dbfd1213d415','1');" class="tr-hover" style="
    /* display: block; */
    /* height:195px; */
    display: table;
    width:100%;
    table-layout:fixed;
    /* overflow-y:scroll; */
">
<td style="/* text-align:center; */padding-left: 10px;width: 20px;">2</td>
<td class="_noedit"><input type="checkbox" name="3b1b0a53bf9144978bc1c4df1888712e$ID" value="1" class="isSubmit _selectdata" style="cursor: pointer;"></td>
      <td>ename_1</td>
      <td>1</td>
      <td>1</td>
        <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr id="1" onclick="showSubFormLs('3b1b0a53bf9144978bc1c4df1888712e','22e069ee83fc4906aa878ab72da8c908','5d4b85f9235a49859912dbfd1213d415','1');" class="tr-hover" style="
    /* display: block; */
    /* height:195px; */
    display: table;
    width:100%;
    table-layout:fixed;
    /* overflow-y:scroll; */
">
<td style="/* text-align:center; */padding-left: 10px;width: 20px;">2</td>
<td class="_noedit"><input type="checkbox" name="3b1b0a53bf9144978bc1c4df1888712e$ID" value="1" class="isSubmit _selectdata" style="cursor: pointer;"></td>
      <td>ename_1</td>
      <td>1</td>
      <td>1</td>
        <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr id="1" onclick="showSubFormLs('3b1b0a53bf9144978bc1c4df1888712e','22e069ee83fc4906aa878ab72da8c908','5d4b85f9235a49859912dbfd1213d415','1');" class="tr-hover" style="
    /* display: block; */
    /* height:195px; */
    display: table;
    width:100%;
    table-layout:fixed;
    /* overflow-y:scroll; */
">
<td style="/* text-align:center; */padding-left: 10px;width: 20px;">2</td>
<td class="_noedit"><input type="checkbox" name="3b1b0a53bf9144978bc1c4df1888712e$ID" value="1" class="isSubmit _selectdata" style="cursor: pointer;"></td>
      <td>ename_1</td>
      <td>1</td>
      <td>1</td>
        <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr id="1" onclick="showSubFormLs('3b1b0a53bf9144978bc1c4df1888712e','22e069ee83fc4906aa878ab72da8c908','5d4b85f9235a49859912dbfd1213d415','1');" class="tr-hover" style="
    /* display: block; */
    /* height:195px; */
    display: table;
    width:100%;
    table-layout:fixed;
    /* overflow-y:scroll; */
">
<td style="/* text-align:center; */padding-left: 10px;width: 20px;">2</td>
<td class="_noedit"><input type="checkbox" name="3b1b0a53bf9144978bc1c4df1888712e$ID" value="1" class="isSubmit _selectdata" style="cursor: pointer;"></td>
      <td>ename_1</td>
      <td>1</td>
      <td>1</td>
        <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    </tbody>
  </table>
		
		
		
		
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>


		</form>
                      
                  </div>
                </div>
          </div>


		<bu:submit viewId="4e692f38509147b1a7b1833fa2cf9550" />
		<bu:script viewId="4e692f38509147b1a7b1833fa2cf9550" />
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
    		top.$(".dialog-close").click();
    	}
    	
    	function init(){
    		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
            $(".search-box .more").click(function(){
                $(".search-box").toggleClass("show");
              })
    		//判断是否隐藏搜索框
    		if($("#searchParaNull").val()=="0"){
    			$(".search-box").hide();
    		}else if($("#searchParaNull").val() <= "3"){
    			$(".search-box .more").hide();
    		}
    	}

    </script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
