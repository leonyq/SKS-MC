<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="选择点位" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="0056deb42efa4d169a94dbc46f5a433a"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
    <style>
    .checkbox{
       	 
    }
    .label{
        margin-left:5px;
    }
    .span{
        display:inline-block;
        width: 80px;
        margin-bottom: 10px;
    }
    .tips{
        font-weight:bold;
        color:#164b94;
        font-size:14px;
        margin-bottom:10px;
    }
    </style>
	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>

</head>

<body class="edit">
    <div class="hd"> 
        <div class="optn"> 
            <button type="button" onclick="saveChecked();">保存</button>
            <button type="button" onclick="checkedAll();">全选</button>
            <button type="button" onclick="clearAll();">清空</button>
            <button type="button" onclick="closeWindow();">关闭</button>
        </div> 
    </div>
    <div class="bd" style="height:390px;overflow: auto;">
       
    </div>
<script>
var parentWindow;

$(function(){
    if(top.$("#"+window.frameElement.name) != null && top.$("#"+window.frameElement.name).length > 0 && 
					top.$("#"+window.frameElement.name)[0].contentWindow != undefined){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			}

    parent.$(".dialog-close").attr("class","testff");
    var points=getParam('itemPoints');
    var pointsSelected=getParam('itemPointsSelected');
    var pointsSelectedArr=pointsSelected.split(',');
    var pointArr=points.split(',');
    var itemNum=getParam('itemNum');
    var html='<div class="tips">料号:'+getParam('itemCode')+(itemNum=='undefined'?'':',用量:'+itemNum)+'</div>';
    $(pointArr).each(function(i,item){
        html+='<span class="span">';
        if(pointsSelectedArr.indexOf(item)>-1&&i<=itemNum-1){
            html+='<input type="checkbox" class="checkbox" checked id="'+item+'" />';
        }else{
            html+='<input type="checkbox" class="checkbox" id="'+item+'" />';
        }
        html+='<label for="'+item+'" class="label">'+item+'</label>';
        html+='</span>'
    });
    $('.bd').html(html);
});
var flag=0;
function saveChecked(){
    var pointArr=new Array();
    $(".checkbox:checked").each(function(i,item){
        pointArr.push($(item).attr('id'));
    });
    if(pointArr.length==0){
        utilsFp.alert("请至少选择1个点位");
        return;
    }
    if(pointArr.length!=getParam('itemNum')){  //pointArr.length<getParam('itemNum')
        //utilsFp.alert("请选择"+getParam('itemNum')+"个点位");
        utilsFp.confirmIcon(1,"","chConfirm",pointArr, "用量变更为"+pointArr.length+",请确认","1","260","");
        
    }else{
        flag=1;
        var points = pointArr.join(",");
        top.editItemPointCallback(points,pointArr.length,getParam('itemCode'));
        closeWindow();
    }
} 
function chConfirm(pointArr){
    flag=1;
    var points = pointArr.join(",");
        top.editItemPointCallback(points,pointArr.length,getParam('itemCode'));
        closeWindow();
}

function checkedAll(){
    $(".checkbox").attr("checked","checked");
} 
function clearAll(){ 
    $(".checkbox").removeAttr("checked");
} 
function closeWindow(){
	if(parent.$(".dialog-close").length > 0){
		parent.$(".dialog-close").click();				
	}else if(parentWindow != null){	
		var iframeSeq = parentWindow.name.replace("iframe","");
		if(flag==0){
            top.editItemPointNew(getParam('itemCode'));
        }
		parent.$(".testff").click();
	}	
    	
}

/**
 * 获取指定的URL参数值
 * URL:http://www.quwan.com/index?name=tyler
 * 参数：paramName URL参数
 * 调用方法:getParam("name")
 * 返回值:tyler
 */
function getParam(paramName) {
    paramValue = "", isFound = !1;
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&"), i = 0;
        while (i < arrSource.length && !isFound) arrSource[i].indexOf("=") > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase() && (paramValue = arrSource[i].split("=")[1], isFound = !0), i++
    }
    return paramValue == "" && (paramValue = null), paramValue
}
</script> 
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
