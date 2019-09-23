<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="com.more.fw.core.staticresource.PlfStaticRes" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="钉钉企业配置" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>

	</head>
	
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv='X-UA-Compatible' content='ie=edge'>
    <title></title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
    
        html,body{
            height: 100%;
            font-size:12px;
            color: #333;
        }
    
        .container{
            height: 100%;
            overflow: auto;
            padding-left: 7%;
        }

        .container ul{
            list-style: none;
        }

        .container ul li{
            float: left;
            width: 300px;
            box-sizing: border-box;
            margin: 10px;
        }

        .container li .operation{
            height: 56px;
            padding: 15px 10px;
            box-sizing: border-box;
            border: 1px solid #e6e6e6;
            border-bottom:none; 
        }
        
        .container li .operation span{
            float: left;
        }

        .container li .operation .btn{
            border: 1px solid #a8c7ce;
            width: 64px;
            height: 24px;
            border-radius:2px;
            line-height: 23px;
            text-align: center;
            font-size: 12px;
            box-sizing: border-box;
            margin-right: 10px;
            background-color: #f6f5f7;
            cursor: pointer;
        }

        .container li .operation .btn:hover{
            background-color:#e4eff9;
        }

        .container li .operation .line{
            width: 1px;
            height: 24px;
            background-color: #c1c1c1;
            margin: 0 10px;
        }

        .container li .operation .ico{
            width: 24px;
            height: 24px;
            border: 1px solid #a8c7ce;
            box-sizing: border-box;
            margin-left: 10px;
            border-radius:2px;
            padding: 3px; 
            cursor: pointer;
        }

        .container li .operation .ico img{
            width: 100%;
            height: 100%;
        }

        .container li .table table{
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            text-align: center;
            table-layout: fixed;
        }

        .container li .table table tr{
            height: 28px;
        }

        .container li .table table tr:nth-of-type(1){
            height: 30px;
            //background-color: #f2f2f2;
            color: #666666;
            font-weight:bold; 
        }

        .container li .table table td{
            border: 1px solid #e6e6e6;
            overflow: hidden;
    		white-space: nowrap;
    		text-overflow: ellipsis;
        }
        
        .container li .table table td:nth-of-type(1){
            width: 100px;
        }

        .container .func{
            float: left;
            width: calc(100% - 20px);
            margin: 10px;
            border: 1px solid #a8c7ce;
            box-sizing: border-box;
            border-bottom:none; 
        }

        .container .func .head{
            height: 34px;
            line-height: 34px;
            padding:0 20px;
            box-sizing: border-box;
            border-bottom:1px solid #a8c7ce; 
            background-color: #f5f7f9;
        }

        .container .func .head .ico{
            float: right;
            width: 16px;
            height: 16px;
            cursor: pointer;
            margin-top: 9px;
            
        }

        .container .func .head .ico[switch='true']{
            background-image: url('${path}/plf/page/inf/ding/img/ico-down.png');
        }

        .container .func .head .ico[switch='false']{
            background-image: url('${path}/plf/page/inf/ding/img/ico-up.png');
        }

        .container .func .body{
            padding: 15px;
            box-sizing: border-box;
            display: none;
            border-bottom:1px solid #a8c7ce; 
        }
    </style>
</head>
<body>
    <div class='container'>
    	<form id="search_form" name="searchForm" action="${path}ding/dingAction_listDeptByDing.ms?FUNC_CODE=<s:property value='FUNC_CODE'/>"  method="post">
    	
    	</form>
        <ul>
            <s:iterator value="ajaxList" status="index">
            	<li>
	                <div class="operation">
	 					
						<span class="layui-btn  layui-btn-xs" onclick="tbuser('<s:property value="ID"/>','<s:property value="DING_AGENT_ID"/>');">同步用户</span>
	                    <span class="layui-btn  layui-btn-xs" onclick="ckuser('<s:property value="ID"/>');">查看用户</span>
	                    <%--layui-btn-normal layui-btn-warm <span class="line"></span>--%>
	                   	                    
	                    <s:if test="DING_AGENT_ID == null || DING_AGENT_ID == \"\" ">
							<span class="layui-btn layui-btn-xs" onclick="showconfigding('<s:property value="ID"/>');">
	                        	<dict:lang value='编辑'/><%-- class="ico set" --%>
	                    	</span>
						</s:if>
						
						<s:if test="DING_AGENT_ID != null && DING_AGENT_ID!=''">
							<span class="layui-btn layui-btn-danger layui-btn-xs" onclick="deletedingconfig('<s:property value="ID"/>');">
	                        	<dict:lang value='删除'/><%-- class="ico clear" --%>
	                    	</span>
						</s:if>
				
	                </div>
	                <div class="table">
	                    <table class="table_list">
	                        <tr>
	                            <td>名称</td>
	                            <td title='<s:property value="NAME"/>'><s:property value="NAME"/></td>
	                        </tr>
	                        <tr>
	                            <td>开发者ID</td>
	                            <td  title='<s:property value="DING_CORP_ID"/>'><s:property value="DING_CORP_ID"/></td>
	                        </tr>
	                        <tr>
	                            <td>开发者密钥</td>
	                            <td  title='<s:property value="DING_CORP_SECRET"/>'><s:property value="DING_CORP_SECRET"/></td>
	                        </tr>
	                        <tr>
	                            <td>微应用ID</td>
	                            <td  title='<s:property value="DING_AGENT_ID"/>'><s:property value="DING_AGENT_ID"/></td>
	                        </tr>
	                    </table>
	                </div>
	            </li>
            </s:iterator>
           
            
        </ul>
        <div class="func" style="width:1260px;">
        	<blockquote class="layui-elem-quote">
        	调用方法<br/>
        	平台通过com.more.fw.inf.ding.service.DingService提供一个服务层方法:<br>
				Map<String, Object> sendMsg(String userId ,Map<String, Object> send_map)方法,<br>
				通过userId查找到DING_CORP_ID,DING_CORP_SECRET,<br>
				send_map由使用者拼接好Map格式的数据，例如：<br>
				{<br>
				   &nbsp; &nbsp;&nbsp;“touser”:”userid1|userid2|userid3”,  //接口支持多用户消息批量发送，sy_user的ding_user_id拼接而成<br>
				   &nbsp; &nbsp;&nbsp;“text”:{<br>
				       &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;“content”:”张三的请加申请”<br>
				    &nbsp; &nbsp;&nbsp;}<br>
				}<br>
				<br>
				返回结果map,<br>
				 * @return {<br>
			     * "errcode":0,//0表示成功，如果是如mc_1是mc开头的表示是mc平台返回的错误，其他是钉钉接口返回错误<br>
			     * "errmsg":"ok",<br>
			     * "messageId":"02e07c45a96a31fbba7e637d3a8e9458",<br>
			     * "invalidparty":"",//忽略<br>
			     * "forbiddenUserId":""，//被限流的用户<br>
			     * "invaliduser":""//无效的用户<br>
			     * }<br>
				<br>
        	</blockquote>
           <%-- <div class="head">调用方法<span class="ico" switch="true"></span></div>
            <div class="body">
		                平台通过com.more.fw.inf.ding.service.DingService提供一个服务层方法:<br>
				Map<String, Object> sendMsg(String userId ,Map<String, Object> send_map)方法,<br>
				通过userId查找到DING_CORP_ID,DING_CORP_SECRET,<br>
				send_map由使用者拼接好Map格式的数据，例如：<br>
				{<br>
				   &nbsp; &nbsp;&nbsp;“touser”:”userid1|userid2|userid3”,  //接口支持多用户消息批量发送，sy_user的ding_user_id拼接而成<br>
				   &nbsp; &nbsp;&nbsp;“text”:{<br>
				       &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;“content”:”张三的请加申请”<br>
				    &nbsp; &nbsp;&nbsp;}<br>
				}<br>
				<br>
				返回结果map,<br>
				 * @return {<br>
			     * "errcode":0,//0表示成功，如果是如mc_1是mc开头的表示是mc平台返回的错误，其他是钉钉接口返回错误<br>
			     * "errmsg":"ok",<br>
			     * "messageId":"02e07c45a96a31fbba7e637d3a8e9458",<br>
			     * "invalidparty":"",//忽略<br>
			     * "forbiddenUserId":""，//被限流的用户<br>
			     * "invaliduser":""//无效的用户<br>
			     * }<br>
				<br>
            </div>--%>
        </div>
    </div>
    
    <script>
        $('.func .head .ico').click(function(){
            $('.container .func .body').slideToggle();
            if($(this).attr('switch') == 'true'){
                $(this).attr('switch','false')
            }else{
                $(this).attr('switch','true')
            }
        })
    </script>
</body>
</html>

<script type="text/javascript">
function alertInfo(msg){
	util.alert(msg);
}

function reloadPg(msg){
	util.alert(msg,reloadPgCf);
}

function reloadPgCf(){
	document.forms.searchForm.submit();
	util.showTopLoading();
}
	
function showconfigding(dept_id){
    var url='${path}ding/dingAction_showConfigDing.ms?paraMap.DEPT_ID='+dept_id+"&mcIframeName="+window.name;
    showPopWin(url, 450, 230,null,"<dict:lang value="配置企业"/>");
}

var dept_id_t;
function deletedingconfig(dept_id){
		dept_id_t=dept_id;
		util.confirm(delConfirm);
}
	
function delConfirm(){
		$.ajax({
	           url:'${path}ding/dingAction_deletedingconfig.ms',
	           type:'GET',
	           dataType:'json',
	           data: {
	           	"paramMap.DEPT_ID":dept_id_t
	           },
	           success:function (res) {
	               if(res.ajaxMap.result=='0'){
	               		top.util.alert("企业配置删除成功");
	               		document.forms.searchForm.submit();
						util.showTopLoading();
		
	               }else{
	            	   top.util.alert("企业配置删除失败");
	               }
	               
	           }
	     });
}

function tbuser(dept_id,ding_agent_id){
	if(val.isBlank(ding_agent_id)){
	   	util.alert("请先配置企业开发者ID密钥");
	   	return false;
	}
	
	//util.showTopLoading();
	$.ajax({
           url:'${path}ding/dingAction_tbuser.ms',
           type:'GET',
           dataType:'json',
           data: {
           	"paramMap.DEPT_ID":dept_id
           },
           success:function (res) {
                var url='${path}ding/dingAction_showTbuserResult.ms?ajaxMap.result_num_succ='+res.ajaxMap.result_num_succ+'&ajaxMap.result_num_err='+res.ajaxMap.result_num_err+'&ajaxMap.result_name_err='+res.ajaxMap.result_name_err+'&ajaxMap.result='+res.ajaxMap.result;
     			showPopWin(url, 650, 540,null,"<dict:lang value="同步用户"/>");
               
           }
     });
	     
}

function ckuser(dept_id){
	 var url='${path}ding/dingAction_ckusertree.ms?ajaxMap.DEPT_ID='+dept_id;
     showPopWin(url, 700, 555,null,"<dict:lang value="查看用户"/>");
	     
}

</script>

<%@ include file="/plf/common/pub_dom.jsp" %>

<%@ include file="/plf/common/pub_end.jsp" %>