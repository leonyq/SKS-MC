<%@page import="com.more.fw.core.common.method.ProductType"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<head>
	<%@ include file="/plf/common/pub_meta.jsp" %>
	<title><dict:lang value="组织机构" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<style type="text/css">
		.edit{
			height:100%;
		}
		
		.edit .bd{
			height:calc(100% - 45px);
			box-sizing:border-box;
			padding:20px 27px 20px 27px;
		}
		
		.main{
			height:100%;
			box-sizing:border-box;
			overflow:auto;
		}
		
		.main li{
			position: relative;
		    float: left;
		    width: 250px;
		    height: 90px;
		    border: 1px solid #eaeaea;
    		border-radius: 4px;
		    margin: 10px;
	        cursor: pointer;
		}
		
		.main li.current::after{
			content:" ";
			position: absolute;
			width:21px;
			height:21px;
			bottom:5px;
			right:5px;
			background-image:url(${path}plf/page/fp/img/current.png);
		}
		
		.main li:hover{
			border:1px solid #aace36;
			background-color:#f9f9f9;
		}
		
		.main li img{
			position: absolute;
			width:40px;
			height:40px;
			left:25px;
			top:25px;
		}
		
		.main li .name{
			position: absolute;
			width:150px;
			line-height:18px;
			max-height:36px;
			-webkit-transform:translate(0,-50%);
		    -moz-transform:translate(0,-50%);
		    transform:translate(0,-50%);
		    left:80px;
		    top:50%;
		}
		
		.mCSB_outside + .mCS-minimal-dark.mCSB_scrollTools_vertical{
			right:-20px;
		}
	</style>
</head>
<body>
	<div class="edit">
		<div class="hd">
			<div class="optn">
		        <button type="button" onclick="changeOrg();"><i class="ico ico-save"></i><dict:lang value="确定" /></button>
		        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
		    </div>
		</div>
		<div class="bd">
			<div class="main">
				<ul>
					<c:forEach items="${dataList}" var="dataAuth">
						<li ondblclick="changeOrg();" <c:if test="${sessionScope.mcDataAuth == dataAuth.id}">class="current"</c:if>>
							<img src="${path}plf/page/fp/img/organization.png">
							<div class="name"><c:out value="${dataAuth.name}"/><input type="hidden" value="<c:out value="${dataAuth.id}"/>"/></div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	
	
	<script type="text/javascript">
		//切换组织机构
		function changeOrg(){
/* 			console.log($(".current div").text());
			console.log($(".current input").val());	 */		
			var url="${path}sys/UserAction_ajaxChangeOrganization.ms";
	    	$.ajax({
	    		type: "POST",
			    dataType: "json",
			    data:"authName="+$(".current div").text()+"&authId="+$(".current input").val(),
			    url: url,
				success: function(data){
					if(data.ajaxMap != null){
						utilsFp.confirmIcon(1,"","refreshMain",data.ajaxMap.mcDataAuth,data.ajaxMap.msg,"","310","160");
					}else{
						utilsFp.confirmIcon(3,"","","","<dict:lang value="更改组织机构失败,请重新登录再试" />","","310","160");
					}
					
					
	    		},
	    		error: function(data){
	    			util.closeLoading();
					util.alert("error:"+data);
			  	}	
	    		
	    	});
		}
		
		//刷新首页
		function refreshMain(mcDataAuth){
			top.$("#_mcDataAuth").val(mcDataAuth);//更新存放在mainFrame.jsp中的值，这样已经打开的列表页可不用刷新也能取到最新的权限ID
			parent.flushIndex();
			closeWindow();
			//top.location.reload();
		}
		
		$(function(){
			if($('.main li').length == 1){
				$('.main li').css('margin','100px 147px')
			}else if($('.main li').length == 2){
				$('.main').css('padding','45px 0')
				$('.main li').css('margin','10px 147px')
			}else{
				setPopScroll('.main');
			}
			
					
			$('.main').on('click','li',function(){
				$(this).addClass('current').siblings().removeClass('current');
			});
			
		});

	</script>
</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>