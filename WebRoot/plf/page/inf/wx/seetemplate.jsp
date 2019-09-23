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
            font-size:14px;
        }
    
        .container{
            width: 810px;
            height: 520px;
            padding-top: 6px;
            box-sizing: border-box;
        }

        .container .top{
            background-color: #e8f5fc;
            height: 36px;
            border: 1px solid #a8c7ce;
            text-align: right;
            padding: 0 30px;
            box-sizing: border-box;
            text-align: right;
        }

        .container .top .ico{
            display: inline-block;
            width: 24px;
            height: 24px;
            border: 1px solid #a8c7ce;
            box-sizing: border-box;
            margin-left: 5px;
            border-radius:2px;
            padding: 3px; 
            cursor: pointer;
            margin-top:6px; 
        }

        .container .top .ico img{
            width: 100%;
            height: 100%;
        }

        .container .main{
            padding: 0 15px;
            overflow: auto;
        }

        .container .main ul{
            list-style: none;
        }

        .container .main li{
            float: left;
            width: 100%;
            padding: 20px 0;
            border-bottom: 1px solid #dbdbdb;
        }

        .container .main li:nth-last-of-type(1){
            border: 0;
        }

        .container li input[type='checkbox']{
            width: 15px;
            height: 15px;
            float: left;
            margin: 0 10px;
            outline: none;
        }
        
        .container li table{
            border-collapse: collapse;
            border-spacing: 0;
            width: calc(100% - 35px);
            float: left;
            table-layout: fixed;
        }

        .container li table tr{
            height: 28px;
        }

        .container li table tr:nth-of-type(1){
            height: 36px;
        }

        .container li table tr:nth-of-type(2){
            height: 130px;
        }

        .container li table td{
            border: 1px solid #e6e6e6;
            padding: 5px;
            box-sizing: border-box;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .container li table td:nth-of-type(2n+1){
            text-align: center;
            background-color: #f5f7f9;
        }
    </style>
</head>
<body>
    <div class='container'>
    	<form id="search_form" name="searchForm" action="${path}wx/wxAction_toseetemplate.ms?paramMap.DEPT_ID=<s:property value='paramMap.DEPT_ID'/>"  method="post">
    	
    	</form>
    	
    	<!-- 系统模板 
        <div class="top">
            <span style="float: left;line-height: 36px">系统模板</span>
        </div>-->
        <blockquote class="layui-elem-quote">
        <span>系统模板</span>
        </blockquote>
						
        <div class="main">
            <ul>
            	<s:iterator value="ajaxList" status="index">
                <li>
                	
                	<span style="width: 35px;float: left;">&nbsp;</span>
                    <table>
                        <tr>
                            <td style="width: 70px;">标题</td>
                            <td title='<s:property value="TITLE"/>'><s:property value="TITLE"/></td>
                            <td style="width: 70px;">模板ID</td>
                            <td title='<s:property value="TEMPLATE_ID"/>'><s:property value="TEMPLATE_ID"/></td>
                            <td style="width: 70px;">编码</td>
                            <td title='<s:property value="CODE"/>'><s:property value="CODE"/></td>
                            <td style="width: 70px;">场景</td>
                            <td title="<s:property value="SCENE"/>"><s:property value="SCENE"/></td>
                        </tr>
                        <tr>
                            <td>模板内容</td>
                            <td colspan="3" title='<s:property value="TEMPLATE"/>'>
                                <s:property value="TEMPLATE"/>
                            </td>
                            <td>模板示例</td>
                            <td colspan="3" title='<s:property value="EXAMPLE"/>'><s:property value="EXAMPLE"/></td>
                        </tr>
                    </table>                  
                </li>
                </s:iterator>
                
            </ul>
        </div>
        
        <!-- 企业模板
        <div class="top">
        	<span style="float: left;line-height: 36px">企业模板</span>
        	
            <span class="ico" onclick="addtp('<s:property value="paramMap.DEPT_ID"/>');">
                <img src="${path}/plf/page/inf/ding/img/button_add.gif">
            </span>
            <span class="ico" onclick="edittp('<s:property value="paramMap.DEPT_ID"/>');">
                <img src="${path}/plf/page/inf/ding/img/ico-set.png">
            </span>
            <span class="ico" onclick="deletetp();">
                <img src="${path}/plf/page/inf/ding/img/ico-clear.png">
            </span>
        </div> -->
        <blockquote class="layui-elem-quote">
        	<span>企业模板</span>
        	&nbsp;&nbsp;
        	<div style="float:right">
        	<span onclick="addtp('<s:property value="paramMap.DEPT_ID"/>');" class="layui-btn layui-btn-normal layui-btn-xs">
                <dict:lang value='新增'/>
            </span>
           
            <span class="layui-btn layui-btn-xs" onclick="edittp('<s:property value="paramMap.DEPT_ID"/>');">
                <dict:lang value='编辑'/>
            </span>
           
            <span class="layui-btn layui-btn-danger layui-btn-xs" onclick="deletetp();">
                <dict:lang value='删除'/>
            </span>
            </div>
        </blockquote>
        <div class="main">
            <ul>
                <s:iterator value="ajaxList2" status="index">
                <li>
                    <input type="checkbox" name="cbtp" value="<s:property value="ID"/>">
                    <table >
                        <tr>
                            <td style="width: 70px;">标题</td>
                            <td title='<s:property value="TITLE"/>'><s:property value="TITLE"/></td>
                            <td style="width: 70px;">模板ID</td>
                            <td title='<s:property value="TEMPLATE_ID"/>'><s:property value="TEMPLATE_ID"/></td>
                            <td style="width: 70px;">编码</td>
                            <td title='<s:property value="CODE"/>'><s:property value="CODE"/></td>
                            <td style="width: 70px;">场景</td>
                            <td title="<s:property value="SCENE"/>"><s:property value="SCENE"/></td>
                        </tr>
                        <tr>
                            <td>模板内容</td>
                            <td colspan="3" title='<s:property value="TEMPLATE"/>'>
                                <s:property value="TEMPLATE"/>
                            </td>
                            <td>模板示例</td>
                            <td colspan="3" title='<s:property value="EXAMPLE"/>'><s:property value="EXAMPLE"/></td>
                        </tr>
                    </table>                  
                </li>
                </s:iterator>
                
            </ul>
        </div>
        
    </div>

    <script>
        
    </script>
</body>
</html>

<script type="text/javascript">
var isSubmit = false;
function reloadPg(msg){
	isSubmit = false;
	window.parent.reloadPg(msg);
}

function alertInfo(msg){
	isSubmit = false;
	util.alert(msg);
}

function addtp(deptid){
    var url='${path}wx/wxAction_showaddtp.ms?paramMap.DEPT_ID='+deptid+"&mcIframeName="+window.name;
    showPopWin(url, 840, 420,null,"<dict:lang value="新增企业模板"/>");
}

function edittp(deptid){
	var obj = document.getElementsByName('cbtp');
    var ids = "";
    var num=0;
    for(var i = 0; i < obj.length; i++)
    {
      if(obj[i].checked)
      {
        ids += obj[i].value + ',';
        num=num+1;
      }
    }
    if (ids == '')
    {
        util.alert("<dict:lang value="请选择一条记录"/>");
        return false;
    }
    
    if(num>1){
    	util.alert("<dict:lang value="请选择一条记录"/>");
    	return false;
    }

    var url='${path}wx/wxAction_showedittp.ms?paramMap.DEPT_ID='+deptid+'&paramMap.ID='+ids+"&mcIframeName="+window.name;
    showPopWin(url, 840, 420,null,"<dict:lang value="编辑企业模板"/>");
    
}

function deletetp(){
	var obj = document.getElementsByName('cbtp');
    var ids = "";
    var num=0;
    for(var i = 0; i < obj.length; i++)
    {
      if(obj[i].checked)
      {
        ids += obj[i].value + ',';
        num=num+1;
      }
    }
    if (ids == '')
    {
        util.alert("<dict:lang value="请至少选择一条记录"/>");
        return false;
    }
    
	if (confirm("确定删除选中的企业模板吗？")){
		$.ajax({
	           url:'${path}wx/wxAction_deletetp.ms',
	           type:'GET',
	           dataType:'json',
	           data: {
	           	"paramMap.IDS":ids
	           },
	           success:function (res) {
	               if(res.ajaxMap.result=='0'){
	               		top.util.alert("企业模板删除成功");
	               		document.forms.searchForm.submit();
						util.showTopLoading();
		
	               }else{
	               		top.util.alert("企业模板删除失败");
	               }
	               
	           }
	     });
     
	}
	
}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>