<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
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
    
    <!-- 产品静态资源 -->
<style>
.dlist .bd {
    background-color: #fff;
    border: 1px solid #eaeaea;
    padding:10px;
    height: calc(100% - 10px);
    box-sizing: border-box;
}
        *{
            padding: 0;
            margin: 0;
        }

        html,body{
            height: 100%;
            font-size: 14px;
        }

   
        .bottom.scorl{
            height: calc(100% - 230px);
            overflow: auto;
        }

        .bottom ul{
            list-style: none;
        }

        .bottom ul li{
            border-top:1px solid #f1f1f1;
            padding: 30px 9px; 
            padding-bottom:28px;
            font-size: 14px;
        }

        .bottom ul li .highlight{
            color: #004098;
            cursor: pointer;
        }

        .bottom ul li .msg{
            height: 40px;
        }

        .bottom ul li .msg>*{
            float: left;
        }

        .bottom ul li .msg p{
            width: calc(100% - 50px);
            height: 18px;
            line-height: 18px;
            font-size: 12px;
        }

        .bottom ul li .msg p:nth-of-type(2){
            margin-top: 4px;
        }
        
        .bottom ul li .msg p .identity{
            color: #fff;
            background-color: #004098;
            padding: 2px 4px;
            margin-left: 10px;
            border-radius:2px; 
        }
        
        .bottom ul li .msg p .right{
            float: right;
        }
        
        .bottom ul li .msg p .right>*{
            float: left;
        }

        .bottom ul li .msg p .right .floor{
            color: #999;
        }

        .bottom ul li .msg p .right .line{
            width: 1px;
            height: 16px;
            background-color: #004098; 
            margin: 1px 10px;
        }

        .bottom ul li .msg img{
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }

        .bottom ul li .time{
            color: #004098;
            margin-right: 30px;
        }
        
        .bottom ul li>p{
            margin-top: 20px;
            margin-left: 50px;
        }
        
        .bottom ul li>div.reply p:nth-of-type(1){
            display:inline-block;
        }
        

        .bottom ul li>div.reply{
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            background-color: #f7f8fa;
            padding: 10px;
            margin-left:50px;
            margin-top:20px;
            height:19px;
        }
        
        .bottom ul li>div.reply img {
            vertical-align: top;
        }
        
        .bottom ul li>p img{
            max-width: 320px;
            max-height: 180px;
        }

        .bottom ul li>p .title{
            color: #004098;
            margin-right: 15px;
        }
        
        .bottom  .details{
            font-size:12px;
            color: #999; 
            position: absolute;
            right: 10px;
            bottom: 14px;
        }

         .bottom  .replyBtn{
            width: 80px;
            height: 30px;
            color: #fff;
            background-color: #aace36;
            position: absolute;
            right: 10px;
            top: 20px;
            text-align: center;
            line-height: 30px;
            border-radius: 2px;
            cursor:pointer;
        }

        .bottom  .replyBtn i{
            width: 15px;
            height: 15px;
            margin-right: 5px;
            margin-bottom: 2px;
            vertical-align: middle;
            display: inline-block;
            background-image:url(${path}plf/page/fp/img/ico-mxbj-h.png);
            cursor:pointer;
        }
        
        #followdata li{
            background-color:#F1F1F1;
            padding-top:20px;
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
        
        .bottom .noDota{
            height:100%;
            width:100%;
        }
</style>
</head>
<body>
    <div class="content-in">
	<div class="dlist">
	
            
			<div class="bd">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="00bc67ca8c8a456785891b90e2f470c3" type="edit" />
	<table class="basic-table" >
	<input type="hidden" id="curPath" name="curPath" value="${path}" >
	<input type="hidden" id ="curUser" name="curUser" value=<s:property value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}'/>
	<input type="hidden" name="formIds" value="00bc67ca8c8a456785891b90e2f470c3" />
	<input type="hidden" name="00bc67ca8c8a456785891b90e2f470c3" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'eb456d9eed1e42c4a3c4c2052f48904d'" />
		<s:set name="_$formId_1" value="'00bc67ca8c8a456785891b90e2f470c3'" />
		<s:set name="_$type" value="'edit'"/>
		<tr style="display:none;">	
            <td>
            <bu:ui colNo="CPF_SN" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" />
		    <bu:ui colNo="ID" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" />
			<bu:ui colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" />
			<bu:ui colNo="CPF_LAUNCH_EMP" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" />
			<bu:ui colNo="CPF_LAUNCH_DATE" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" />
			<bu:ui colNo="CPF_ABSTRACT" formId="00bc67ca8c8a456785891b90e2f470c3" dataId="${dataId}" formIndex="1" />
			</td>
	    </tr>
	</table>
	    <div class="bottom"  style="position: relative;">
					<ul id="followdata" class='scorl1' style="max-height:200px;overflow:auto;">
					    <li>
							<div class="msg">
                                <img id="img0" src="/N2/plf/images/user.png">		
                                <p><span class="name" id="userName"></span><span class="identity">楼主</span></p>
    
                                <p><span class="time"  id="userTime"></span></p>
                            </div>
			                <p><span class="title">问题摘要</span><span class="name" id="problemAbs"></span></p>
                            <p><span class="title">问题描述</span><span class="name" id="problemDes"></span></p>
                           
					        
					    </li>
					  
					</ul>
					 <span class="details" onclick="showDetail();">查看详情>></span> 
                    <span class="replyBtn" onclick="addRep();"><i></i>回复</span>
    	 </div>
	    <div class="bottom scorl" id="proDetailInfo" >
			<div class="noDota"></div>	
		</div>
		<div class="center">
					<s:include
						value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=loadDetailInfo&formId=formId2&showLoading=0" />
		</div>
			<bu:jsVal formId="00bc67ca8c8a456785891b90e2f470c3" formIndex="1" />
									
			</div>
	</div>
</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script>
    	$(function(){
    	    $("#userName").text($("#paraMapObj_CPF_LAUNCH_EMP_SHOW").val());
    	    $("#userTime").text($("#paraMapObj_CPF_LAUNCH_DATE").val());
    	    $("#problemAbs").text($("#paraMapObj_CPF_ABSTRACT").val());
    	    $("#problemDes").html($("#paraMapObj_CPF_DESCRIBE").val());
    	    getProFollowInfo();
    	})
    	function addRep(){
    	    var pronlemSn = $("#paraMapObj_CPF_SN").val();//问题编号
    	    var beReplyEmp = $("#paraMapObj_CPF_LAUNCH_EMP").val();//发帖人
            var urlDetail = "${path}buss/bussModel.ms?exeid=9c46499ba24f416abe89239b1e2a4259&formId=00bc67ca8c8a456785891b90e2f470c3&pronlemSn="+pronlemSn+"&beReplyEmp="+beReplyEmp;
             
        	showPopWinFp(urlDetail , 880, 350,null,"<dict:lang value="回复"/>","add_repDetail");
        }
        function addRep1(beReplyEmp,beReplyId){
    	    var pronlemSn = $("#paraMapObj_CPF_SN").val();//问题编号
            var urlDetail = "${path}buss/bussModel.ms?exeid=9c46499ba24f416abe89239b1e2a4259&formId=00bc67ca8c8a456785891b90e2f470c3&pronlemSn="+pronlemSn+"&beReplyEmp="+beReplyEmp+"&beReplyId="+beReplyId;
             
        	showPopWinFp(urlDetail , 880, 350,null,"<dict:lang value="回复"/>","add_repDetail");
        }
        //查看详情
        function showDetail(){
            var url = "${path}buss/bussModel.ms?exeid=d47102190729413082add50a664191b4&formId=00bc67ca8c8a456785891b90e2f470c3&dataId="+$("#paraMapObj_ID").val();
            showPopWinFp(url, 830, 500,null,"<dict:lang value="查看详情"/>");
        }
        //删除回复信息
        function delInfo(delId){
            utilsFp.confirmIcon(1,"","delInfofirm",delId, "是否确认删除？","1","260","");
        }
        function delInfofirm(delId){
            $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=bedd053f79b345a1876d931b64c43e23",
			    data: {
			        delId: delId
			    },
			    success: function(data){
						    if(null == data){return;}
						    if(null != data){
    							if(data.ajaxMap.returnMsg=="addSucc"){
    								msgPop(data.ajaxMap.alertMsg,"",data.ajaxMap.title,data.ajaxMap.width.ajaxMap,data.height,data.ajaxMap.time,"");
    								loadDetailInfo("formId2");
    							}
    							if(data.ajaxMap.returnMsg=="addError"){
	                                utilsFp.confirmIcon(3,"","","", "<dict:lang value="删除失败"/>",0,"300","");
    								return;
    							}
						    }
					},
			    //error: function(msg){
						
				//		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				error: function(msg){
                          if(msg.readyState!=0){
                      util.closeLoading();
                      utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                            }
                        }
			    });
        }
        //获取问题跟进信息
        function getProFollowInfo(){
            var pronlemSn = $("#paraMapObj_CPF_SN").val();//问题编号
			var beReplyEmp = $("#paraMapObj_CPF_LAUNCH_EMP").val();//发帖人
            util.showLoading('处理中...');//plf/images/user.png
            $.ajax({
                type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=18accb54b42341b1899aa6d6cecb6881",
			    data: {
			        pronlemSn: pronlemSn,
			        beReplyEmp: beReplyEmp
			    },
			    success: function(data){	
                    util.closeLoading();
			        if(null == data){return;}
			        if(null != data.ajaxMap&&null != data.ajaxMap.PHOTO_NAME){
			            var userImg = $("#curPath").val()+"plf/userPhoto/" + data.ajaxMap.PHOTO_NAME;
			            $("#img0").attr("src",userImg);
			            
			        }else{
			            var userImg = $("#curPath").val()+"plf/images/user.png";
			            $("#img0").attr("src",userImg);
			        }
					if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);	
                            var userImg;
							var htmlArr = [];
							var problemDes;
							var delBut;
							//是否显示删除按钮
							if($("#curUser").val()==$("#paraMapObj_CPF_LAUNCH_EMP").val()){
							    delBut = "Y";
							}else{
							    delBut = "N";
							}
							$('.scorl').mCustomScrollbar("destroy");
							for(var i=0;i<rccList.length;i++){
							    if(rccList[i].REPLY_PHOTO!=null){
							        userImg = $("#curPath").val()+"plf/userPhoto/" + rccList[i].REPLY_PHOTO;
							    }else{
							        userImg = $("#curPath").val()+"plf/images/user.png";
							    }
							    if(rccList[i].BEREPLY_DATE!=null){ //是回复
							        /*problemDes = "\""+rccList[i].BEREPLY_EMP+"&nbsp;发表于&nbsp;<span class='time'>"+rccList[i].BEREPLY_DATE+"</span>"+
							        "<p class='p2'><span class='name'>"+rccList[i].CPF_BEREPLY_CONTENT+"</span></p>\"";*/
							        problemDes = "<div class='reply'><span class='highlight'>回复&nbsp;"+rccList[i].CPF_BEFLOOR_NUM+"楼&nbsp;" + rccList[i].BEREPLY_EMP + "：</span>" + rccList[i].CPF_BEREPLY_CONTENT + "</div>";
							    }else{  //发表评论
							        problemDes = "";
							    }
							    htmlArr.push("<ul>");	
                                htmlArr.push("<li>");
    							
    							htmlArr.push("<div class='msg'>");
    							htmlArr.push("<img id='img"+i+"' src="+userImg+">");
    							htmlArr.push("<p><span class='name'>"+rccList[i].REPLY_EMP+"</span><span class='right'><span class='floor'>"+rccList[i].CPF_FLOOR_NUM+"楼</span><span class='line'></span><span class='highlight' onclick=\"addRep1('"+rccList[i].CPF_REPLY_EMP+"','"+rccList[i].ID+"');\">回复</span>");
    							if(delBut=="Y"){
    							    htmlArr.push("<span class='line'></span><span class='highlight' onclick=\"delInfo('"+rccList[i].ID+"');\">删除</span></span></p>");
    							}else{
    							     htmlArr.push("</span></p>");
    							}
    							htmlArr.push("<p><span class='time'>"+rccList[i].REPLY_DATE+"</span></p>");
    							htmlArr.push("</div>");
    							htmlArr.push(problemDes);
       							var str = rccList[i].CPF_REPLY_CONTENT;	
       							var reg=/#mc_a/g;
    							//var reg = new RegExp("#mc_a","g");//g,表示全部替换。
                                str=str.replace(reg,"<");
                                var regs = new RegExp("#mc_b","g");//g,表示全部替换。
    						    str=str.replace(regs,">");
    						    console.log("str:"+str);
    			                htmlArr.push("<p><span class='content'>" +str+ "</span></p>");
				                htmlArr.push("</li>");
				                htmlArr.push("</ul>");
							}
							$("#proDetailInfo").html(htmlArr.join(""));
							setPopScroll('.scorl');
					}
					pageFun(data.ajaxPage, "formId2");
			    },
			    //error: function(msg){
						
				//		utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				 error: function(msg){
                          if(msg.readyState!=0){
                      util.closeLoading();
                      utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                    }
				  }
            });
        }
        //分页
        var paginationImpl = {};
        function loadDetailInfo(paginationImpl){
            var isFirstLoad = firstLoadThisPage(paginationImpl);
			var currentPage = isFirstLoad ? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
			var pageRecord = isFirstLoad ? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
            var pronlemSn = $("#paraMapObj_CPF_SN").val();//问题编号
            util.showLoading('处理中...');//plf/images/user.png
            $.ajax({
                type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=18accb54b42341b1899aa6d6cecb6881",
			    data: {
			        pronlemSn: pronlemSn,
			        "page.currentPage": _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    success: function(data){	
                    util.closeLoading();
			        if(null == data){return;}
					if(null != data.ajaxPage.dataList){
							var rccList = eval(data.ajaxPage.dataList);
							var userImg;
							var htmlArr = [];
							var problemDes;
							var delBut;
							//是否显示删除按钮
							if($("#curUser").val()==$("#paraMapObj_CPF_LAUNCH_EMP").val()){
							    delBut = "Y";
							}else{
							    delBut = "N";
							}
							$('.scorl').mCustomScrollbar("destroy");
							for(var i=0;i<rccList.length;i++){
                				if(rccList[i].REPLY_PHOTO!=null){
							        userImg = $("#curPath").val()+"plf/userPhoto/" + rccList[i].REPLY_PHOTO;
							    }else{
							        userImg = $("#curPath").val()+"plf/images/user.png";
							    }
							    if(rccList[i].BEREPLY_DATE!=null){ //是回复
							        /*problemDes = "\""+rccList[i].BEREPLY_EMP+"&nbsp;发表于&nbsp;<span class='time'>"+rccList[i].BEREPLY_DATE+"</span>"+
							        "<p class='p2'><span class='name'>"+rccList[i].CPF_BEREPLY_CONTENT+"</span></p>\"";*/
							        problemDes = "<div class='reply'><span class='highlight'>回复&nbsp;"+rccList[i].CPF_BEFLOOR_NUM+"楼&nbsp;" + rccList[i].BEREPLY_EMP + "：</span>" + rccList[i].CPF_BEREPLY_CONTENT + "</div>";
							    }else{  //发表评论
							        problemDes = "";
							    }
							    htmlArr.push("<ul>");	
                                htmlArr.push("<li>");
    							
    							htmlArr.push("<div class='msg'>");
    							htmlArr.push("<img id='img"+i+"' src="+userImg+">");
    							htmlArr.push("<p><span class='name'>"+rccList[i].REPLY_EMP+"</span><span class='right'><span class='floor'>"+rccList[i].CPF_FLOOR_NUM+"楼</span><span class='line'></span><span class='highlight' onclick=\"addRep1('"+rccList[i].CPF_REPLY_EMP+"','"+rccList[i].ID+"');\">回复</span>");
    							if(delBut=="Y"){
    							    htmlArr.push("<span class='line'></span><span class='highlight' onclick=\"delInfo('"+rccList[i].ID+"');\">删除</span></span></p>");
    							}else{
    							     htmlArr.push("</span></p>");
    							}
    							htmlArr.push("<p><span class='time'>"+rccList[i].REPLY_DATE+"</span></p>");
    							htmlArr.push("</div>");
    							htmlArr.push(problemDes);
    								var str = rccList[i].CPF_REPLY_CONTENT;	
       							var reg=/#mc_a/g;
    							//var reg = new RegExp("#mc_a","g");//g,表示全部替换。
                                str=str.replace(reg,"<");
                                var regs = new RegExp("#mc_b","g");//g,表示全部替换。
    						    str=str.replace(regs,">");
    						    console.log("str:"+str);
    			                htmlArr.push("<p><span class='content'>" +str+ "</span></p>");
    			                //htmlArr.push("<p><span class='content'><" + rccList[i].CPF_REPLY_CONTENT + "></span></p>");
				                htmlArr.push("</li>");
				                htmlArr.push("</ul>");
							}
							$("#proDetailInfo").html(htmlArr.join(""));
							setPopScroll('.scorl');
					}
					pageFun(data.ajaxPage, "formId2");
			    },
			    error: function(msg){
                          if(msg.readyState!=0){
                      util.closeLoading();
                      utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                            }
                }
            });
        }
        
        
        //点击查看原图
        $('.bottom').on('click','li p img',function(){ 
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
		(function($) {
			$(window).on('load', function() {
				setPopScroll('.scorl');
				setPopScroll('.scorl1');
			})
		})(jQuery)
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
	<!-- js初始化方法 -->
	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

