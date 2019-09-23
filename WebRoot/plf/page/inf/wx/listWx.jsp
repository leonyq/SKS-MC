<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="com.more.fw.core.staticresource.PlfStaticRes" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="微信企业配置" /></title>
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
            //background-color: #e4eff9;
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
    	<form id="search_form" name="searchForm" action="${path}wx/wxAction_listDeptByWx.ms?FUNC_CODE=<s:property value='FUNC_CODE'/>"  method="post">
    	
    	</form>
        <ul id="ul_id">
            <s:iterator value="ajaxList" status="index">
            	<li>
	                <div class="operation">
	 					
						<span class="layui-btn  layui-btn-xs" onclick="ckmb('<s:property value="ID"/>');">查看模板</span>
	                    <span class="layui-btn  layui-btn-xs" onclick="ckuser('<s:property value="ID"/>','<s:property value="WX_CORP_ID"/>','<s:property value="WX_CORP_SECRET"/>');">查看用户</span>
	                    <%--layui-btn-normal layui-btn-warm<span class="line"></span>--%>
	                   	                    
	                    <s:if test="WX_CORP_ID == null || WX_CORP_ID == \"\" ">
							<span class="layui-btn layui-btn-xs" onclick="showconfigwx('<s:property value="ID"/>');">
	                        	<dict:lang value='编辑'/>
	                    	</span>
						</s:if>
						
						<s:if test="WX_CORP_ID != null && WX_CORP_ID != ''">
							<span class="layui-btn layui-btn-danger layui-btn-xs" onclick="deletewxconfig('<s:property value="ID"/>');">
	                        	<dict:lang value='删除'/>
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
	                            <td title='<s:property value="WX_CORP_ID"/>'><s:property value="WX_CORP_ID"/></td>
	                        </tr>
	                        <tr>
	                            <td>开发者密钥</td>
	                            <td title='<s:property value="WX_CORP_SECRET"/>'><s:property value="WX_CORP_SECRET"/></td>
	                        </tr>

	                    </table>
	                </div>
	            </li>
            </s:iterator>
           
            
        </ul>
        <div class="func" id="func_id" style="width:1260px">
        	<blockquote class="layui-elem-quote">
        	调用方法<br/>
        	平台通过com.more.fw.inf.wx.service.WxService提供两个服务层方法:<br>
        1.String getTemplateIdByCode(String code,String deptId)方法,<br>
        通过编码code和部门编码deptId查找到对应的templateId(MS_CORP_WX_TEMPLATE表),<br>
        返回模板ID<br>
        <br>
        2.String sendMsg(String userId ,Map<String, Object> msg_map)方法,调用实例如下:<br><br>
        
       WxService wx = (WxService)SpringContextUtil.getBean("wxService");<br>
       String template_id=wx.getTemplateIdByCode("2018060501","7ec0027c29b1451f90664fe7555ac7a8");<br>
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");<br>
      <br>
       Map<String, Object> map =  new HashMap();<br>
       map.put("touser","ovLz-thM87F_V2_8xFeaKkecY_N8");//微信注册的用户id 必填<br>
       map.put("template_id",template_id);//模板id 必填<br>
       map.put("url","http://www.baidu.com");//链接  必填  但是值可以为空<br>
       <br>
       Map map_first=new HashMap();<br>
       map_first.put("value", "新的任务通知！");<br>
       map_first.put("color", "#173177");<br>
       map.put("first", map_first);<br>
       
       Map map_keyword1=new HashMap();<br>
       map_keyword1.put("value", "demo");<br>
       map_keyword1.put("color", "#173177");<br>
       map.put("keyword1", map_keyword1);<br>
       <br>
       Map map_keyword2=new HashMap();<br>
       map_keyword2.put("value", "this is a content");<br>
       map_keyword2.put("color", "#173177");<br>
       map.put("keyword2", map_keyword2);<br>
       <br>
       Map map_keyword3=new HashMap();<br>
       map_keyword3.put("value", sdf.format(new Date()));<br>
       map_keyword3.put("color", "#173177");<br>
       map.put("keyword3", map_keyword3);<br>
       <br>
       Map map_remark=new HashMap();<br>
       map_remark.put("value", "感谢您的关注!");<br>
       map_remark.put("color", "#173177");<br>
       map.put("remark", map_remark);<br>
       <br>
       //wx_user_id sy_user表的id或者wx_user_id<br>
       //map 根据对应模板template_id封装的数据<br>
       String wx_user_id="ovLz-thM87F_V2_8xFeaKkecY_N8";<br>
       wx.sendMsg(wx_user_id,map);<br>
       <br>
	   <br>
              返回值说明：0：发送成功  1：userId用户不存在  2：企业不存在  3：企业未配置微信开发者ID密钥  4：微信消息发送异常<br>
        <br>
        	</blockquote>
            <%--<div class="head">调用方法<span class="ico" switch="true"></span></div>
            <div class="body">
            
                    平台通过com.more.fw.inf.wx.service.WxService提供两个服务层方法:<br>
        1.String getTemplateIdByCode(String code,String deptId)方法,<br>
        通过编码code和部门编码deptId查找到对应的templateId(MS_CORP_WX_TEMPLATE表),<br>
        返回模板ID<br>
        <br>
        2.String sendMsg(String userId ,Map<String, Object> msg_map)方法,调用实例如下:<br><br>
        
       WxService wx = (WxService)SpringContextUtil.getBean("wxService");<br>
       String template_id=wx.getTemplateIdByCode("2018060501","7ec0027c29b1451f90664fe7555ac7a8");<br>
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");<br>
      <br>
       Map<String, Object> map =  new HashMap();<br>
       map.put("touser","ovLz-thM87F_V2_8xFeaKkecY_N8");//微信注册的用户id 必填<br>
       map.put("template_id",template_id);//模板id 必填<br>
       map.put("url","http://www.baidu.com");//链接  必填  但是值可以为空<br>
       <br>
       Map map_first=new HashMap();<br>
       map_first.put("value", "新的任务通知！");<br>
       map_first.put("color", "#173177");<br>
       map.put("first", map_first);<br>
       
       Map map_keyword1=new HashMap();<br>
       map_keyword1.put("value", "demo");<br>
       map_keyword1.put("color", "#173177");<br>
       map.put("keyword1", map_keyword1);<br>
       <br>
       Map map_keyword2=new HashMap();<br>
       map_keyword2.put("value", "this is a content");<br>
       map_keyword2.put("color", "#173177");<br>
       map.put("keyword2", map_keyword2);<br>
       <br>
       Map map_keyword3=new HashMap();<br>
       map_keyword3.put("value", sdf.format(new Date()));<br>
       map_keyword3.put("color", "#173177");<br>
       map.put("keyword3", map_keyword3);<br>
       <br>
       Map map_remark=new HashMap();<br>
       map_remark.put("value", "感谢您的关注!");<br>
       map_remark.put("color", "#173177");<br>
       map.put("remark", map_remark);<br>
       <br>
       //wx_user_id sy_user表的id或者wx_user_id<br>
       //map 根据对应模板template_id封装的数据<br>
       String wx_user_id="ovLz-thM87F_V2_8xFeaKkecY_N8";<br>
       wx.sendMsg(wx_user_id,map);<br>
       <br>
	   <br>
              返回值说明：0：发送成功  1：userId用户不存在  2：企业不存在  3：企业未配置微信开发者ID密钥  4：微信消息发送异常<br>
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
        
        //$('#func_id').width($('#ul_id').width());
        
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
	
function showconfigwx(dept_id){
    var url='${path}wx/wxAction_showConfigWx.ms?paraMap.DEPT_ID='+dept_id+"&mcIframeName="+window.name;
    showPopWin(url, 450, 230,null,"<dict:lang value="配置企业"/>");
}

var dept_id_t;
function deletewxconfig(dept_id){
		dept_id_t=dept_id;
		util.confirm(delConfirm);
}
	
function delConfirm(){
		$.ajax({
	           url:'${path}wx/wxAction_deletewxconfig.ms',
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

function ckuser(dept_id,appid,appsecret){
	if(val.isBlank(appid) || val.isBlank(appsecret)){
	   	util.alert("请先配置企业开发者ID密钥");
	   	return false;
	}
	
	 var url="${path }wx/wxAction_toseeWxUser.ms?wxUserPageVO.jobType=1&wxUserPageVO.jobId=1&wxPageVO.wxPlatform.appid="+appid+"&wxPageVO.wxPlatform.appsecret="+appsecret+"&wxPageVO.wxPlatform.templateId=1";
     showPopWin(url, 700, 400, null, "微信查看用户");
       
}

function ckmb(dept_id){
     showPopWin("${path}wx/wxAction_toseetemplate.ms?paramMap.DEPT_ID="+dept_id+"&mcIframeName="+window.name, 930, 550, null, "查看模板");
       
}

</script>

<%@ include file="/plf/common/pub_dom.jsp" %>

<%@ include file="/plf/common/pub_end.jsp" %>