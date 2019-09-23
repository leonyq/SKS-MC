<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="视图类型" /> <dict:lang value="新增" /></title>
<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
</jsp:include>
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
span,img{border:0;}
span{color:#333;text-decoration:none;margin-left: 3px}
span:hover{text-decoration:none;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
/* box01 */
.box01{width:870px;margin:15px auto;position:relative;}
.box01 li{float:left;width:250px;text-align:center;padding-right:10px;margin-right:10px;height:150px;margin-bottom:10px;cursor:pointer;z-index:0;position:relative;border:1px solid #ccc;}
.box01 li img{height:120px;margin:0 auto;}
.box01 li .viewTypeDiv{position:absolute;left:0;top:0;width:180px;}
.box01 li .viewTypeDiv p{text-align:left;}
.box01 li.on{z-index:99;}
.box01 li.on .viewTypeDiv{padding:5px;border:1px solid #ccc;position:absolute;z-index:100;width:auto;text-align:center;top:-40px; background:#fff;}
.box01 li.on .viewTypeDiv p{position:relative;display:block;}
.box01 li.on img{height:auto;margin-bottom:8px;}
.viewType{position:absolute;right:-73px;width:19px;height:15px;font-size:0;float:right;margin-top:4px;}
.viewTypeImg{
 height: 150px;width: 250px;
}
.marginLeft{
  margin-left: 35px;
}
.detail{
     width: 160px;
     white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
 
</style>

<script type="text/javascript">
var preIframeName="<c:out value='${curIframeName}'  />";

$(function(){ 
	
    $(".viewType").change("on",function(){
    	//var document = getSrcDom({isFramesetMethod:false,type:'document'});
    	 
        var jsonObj={mcIframeName:preIframeName, type: 'document'};
        var document=getSrcByIframeName(jsonObj);
        $("#paraMap_VIEW_TYPE",document).val($("input[type='radio']:checked").val());
        $("#paraMap_VIEW_TYPE_TEXT",document).val(_this.next("span").text());
    });
    
    $(".viewTypeDiv").click(function(){
    	 //var document = getSrcDom({isFramesetMethod:false,type:'document'});
    	 var jsonObj={mcIframeName:preIframeName, type: 'document'};
         var document=getSrcByIframeName(jsonObj);
		 var _this = $(this).find(".viewType");
         _this.attr("checked","checked");
         $("#paraMap_VIEW_TYPE",document).val(_this.val());
         $("#paraMap_VIEW_TYPE_TEXT",document).val(_this.next("span").text());
        
    });
    function tabIsShow(viewType,associated,isThreeLevel,isChildForm,isTopForm){
    
    	//var document = getSrcDom({isFramesetMethod:false,type:'document'});
    	var jsonObj={mcIframeName:preIframeName, type: 'document'};
        var document=getSrcByIframeName(jsonObj);
        if(viewType == "12" || viewType == "20"){
            if(isTopForm=="true" && isChildForm=="true"){
                $("#tab_add_model_show",document).show();
                $("#tab_show",window.parent.document).hide();
                if(isThreeLevel=="true"){
					$("#tab_child_add_model_show",document).show();
				}else{
					$("#tab_child_add_model_show",document).hide();
				}
            } 
            if(isTopForm=="true" && isChildForm=="false"){
                $("#tab_show",document).show();
                $("#tab_add_model_show",document).hide();
            }
        }else{
            $("#tab_show","#tab_add_model_show","#tab_child_add_model_show",document).hide();
        }
    }
    $(".viewTypeDiv").dblclick(function(){
        
        var jsonObj={mcIframeName:preIframeName, type: 'document'};
        var document=getSrcByIframeName(jsonObj);
    	//var document = parent.getSrcDom({isFramesetMethod:false,type:'document'});
    	<%--
    	 var _this = $(this);
    	 var imgPath = _this.find(".viewTypeImg").attr("src");
    	 var detail = _this.find(".detailData").text();
    	var url = "${path}sys/BussModelAction_forPreviewImg.ms?paraMap.imgPath="+imgPath+"&paraMap.detail="+detail;
		showPopWin(url, 800, 450,null,"<dict:lang value='"+detail+"'/>");
		--%>
		var viewType = $(this).find(".viewType").val();
		//var document = getSrcDom({isFramesetMethod:false,type:document});
		var formId = $("#paraMap_FORMID",document).val();
		//var window = getSrcDom({isFramesetMethod:false,type:'window'});
		jsonObj={mcIframeName:preIframeName, type: 'window'};
		 var window=getSrcByIframeName(jsonObj);
		window.getChildFormList(formId,viewType,2);
        parent.closePage();
    });
});



</script>

</head>
<body>
<!-- 代码开始 -->
<ul class="box01">
   <c:forEach var="listData" items="${listData}"  varStatus="status">
   <c:choose>
    <c:when test="${status.index%3 == 0}">
     <li class="marginLeft">
        <div class="viewTypeDiv">
            <img src="${path}plf/page/bussmodel/preview/images/<c:out value='${listData.CODE}' />.png?_mc_res_version=<%=PlfStaticRes.LIST_DATA_CODE_PNG %>"  class="viewTypeImg"  />
            <p class="detail"><input type="radio" name="viewType" value="<c:out value='${listData.CODE}' />" class="viewType" /><span class="detailData"><c:out value='${listData.VALUE}' /></span></p>
        </div>
    </li>
    </c:when>
     <c:otherwise>
     <li>
        <div class="viewTypeDiv">
            <img src="${path}plf/page/bussmodel/preview/images/<c:out value='${listData.CODE}' />.png?_mc_res_version=<%=PlfStaticRes.LIST_DATA_CODE_PNG %>"  class="viewTypeImg"  />
            <p class="detail"><input type="radio" name="viewType" value="<c:out value='${listData.CODE}' />" class="viewType" /><span class="detailData"><c:out value='${listData.VALUE}' /></span></p>
        </div>
    </li>
    </c:otherwise>
    </c:choose>
   </c:forEach>
   </ul>
<div style="clear:both;"></div>
<!-- 代码结束 -->

</body>
</html>