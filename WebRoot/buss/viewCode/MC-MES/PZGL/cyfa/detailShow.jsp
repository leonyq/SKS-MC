<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="查看" />
</title>
<style>
html,body{
	height:100% !important;
}

.edit{
	height:100%;
}


.bd{
	height:100% !important;
	box-sizing:border-box;
}

	.main-div table {
            border-collapse: collapse;
            table-layout: fixed;
        }

        .main-div td {
            border: 1px solid #dbe1df;
            width: 50px;
            height: 25px;
            box-sizing: border-box;
            text-align:center;
        }

        .main-div {
            width: 100%;
            height: 100%;
        }


        .main-div .left table tr td:nth-of-type(1) {
            width: 90px;
        }

        .main-div .top {
            height: 76px;
        }
        
        .main-div .top table tr:nth-of-type(2n+1){
        	background-color:#e6eaf4;
        	color:#666;
        }

        .main-div .bottom {
            height: calc(100% - 76px);
        }

	.main-div .bottom table tr:nth-of-type(2n+1){
        	background-color:#f0f4fd;
        }

        .main-div .left {
            float: left;
            height: 100%;
            width: 140px;
            overflow: hidden;
        }

        .main-div .right {
            float: left;
            height: 100%;
            width: calc(100% - 140px);
            overflow: hidden;
        }

        .main-div .bottom .right{
            overflow: auto;
        }
        
        .main-div span{
        	display:inline-block;
        	width:50%;
        	height:100%;
        	box-sizing:border-box;
        }
</style>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script type="text/javascript" src="${path}plf/js/ui/include.js"></script>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="inHead" />
</jsp:include>
</head>
<body>
	<div class="edit">
		<form id="editForm" name="editForm"
			action="" method="post"
			target="submitFrame" <bu:formet exeid="%{exeid}" /> style="height:100%;">
			
			<div class="bd" style="padding:0;overflow:auto;">
				
				<bu:set name="paraMapObj" value="${dataId}"
					formId="eec4f10d65b0411eb66da26fd2b55837" type="edit" />
				
				<div class="main-div">
						<s:if test="${ajaxString=='add' }">
							<table class="main" cellpadding="0" cellspacing="0">
							<tr>
								<td></td>
								<td></td>
								<td>AQL</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td style="width:90px;"><dict:lang value="样本大小代码" /></td>
								<td><dict:lang value="样本数" /></td>
								<td><input value="AC" readonly="readonly"><input
									value="RE" readonly="readonly"></td>

							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							</table>
						</s:if>
						<s:else>
        <div class="top">
            <div class="left">
                <table>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>样本大小字码</td>
                        <td>样本数</td>
                    </tr>
                </table>
            </div>
            <div class="right">
                <table>
                    <tr>
                    	<c:forEach items="${dataMap.AQL}">
				<td>AQL</td>
			</c:forEach>
                    </tr>
                    <tr>
                        <c:forEach items="${dataMap.AQL}" var="aqlList" varStatus="status">
				<td>${aqlList.QSD_AQL_VALUE }</td>
			</c:forEach>
                    </tr>
                    <tr>
                        <c:forEach items="${dataMap.AQL}">
				<td><span>AC</span><span>RE</span></td>
			</c:forEach>
                    </tr>
                </table>
            </div>
        </div>
        <div class="bottom">
            <div class="left"> 
                <table>
                    	<c:forEach items="${dataMap.rowList}" var="rowList" varStatus="status">
				<tr>
					<td>${rowList.QSD_SAMPLE_CODE }</td>
					<td>${rowList.QSD_SAMPLE_NUM }</td>
				</tr>
			</c:forEach>
                </table>
            </div>
            <div class="right">
                    <table class="main">
                        <c:forEach items="${dataMap.rowList}" var="rowList" varStatus="status">
				<tr>
					<c:forEach items="${rowList.QSD_AQL_VALUE}" var="aqlList" varStatus="xstatus">
							<td><span>${aqlList.QSD_AC_VALUE }</span><span>${aqlList.QSD_RE_VALUE }</span></td>
					</c:forEach>
				</tr>
			</c:forEach>
                    </table>

            </div>
        </div>
    </div>
</s:else>


			</div>
		</form>
	</div>

	
	<script type="text/javascript">
		var rowCount = $('.main tr:last td').length;
		$('.main-div .right table').width(rowCount * 50);
		
		$(".main tr").on('mouseover','td',function(){
			var td = $(this);	
			var index = $(td).parent().children().index(td)+1;
			$('.main-div .right table tr td:nth-of-type('+ index +')').css('background-color','#c3e2fb');	
		});
		
		
		$(".main tr").on('mouseout','td',function(){
			var td = $(this);	
			var index = $(td).parent().children().index(td)+1;
			$('.main-div .right table tr td:nth-of-type('+ index +')').css('background-color','');
			
		});
		
		$(".main").on('mouseover','tr',function(){
			var tr = $(this);	
			var index = $(tr).parent().children().index(tr)+1;
			$('.main-div .bottom table tr:nth-of-type('+ index +')').css('background-color','#c3e2fb');	
		});
		
		$(".main").on('mouseout','tr',function(){
			var tr = $(this);	
			var index = $(tr).parent().children().index(tr)+1;
			$('.main-div .bottom table tr:nth-of-type('+ index +')').css('background-color','');	
		});
		
		
	</script>
<script>
    (function ($) {
        $(window).on("load", function () {
            $(".bottom .right").mCustomScrollbar({
                axis:"yx",
                snapAmount:40,
                theme:"minimal-dark",
                keyboard:{scrollAmount:40},
                mouseWheel:{deltaFactor:40,preventDefault:true},
                scrollInertia:80,
                callbacks:{
                whileScrolling:function(){ 
                    if(this.mcs.left){
                        $(".top .right")[0].scrollLeft=(-this.mcs.left);
                    }
                    if(this.mcs.top){
                        $(".bottom .left")[0].scrollTop=(-this.mcs.top);
                    }
                }
              }
          });
        });
    })(jQuery);
</script>
	
	<!-- js初始化方法 -->
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
		<jsp:param name="modelName" value="VIEW_TYPE_11" />
		<jsp:param name="location" value="jsLoading" />
	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	<jsp:param name="modelName" value="VIEW_TYPE_11" />
	<jsp:param name="location" value="pageOver" />
</jsp:include>
