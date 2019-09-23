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
		<dict:lang value="测试商品页面" />
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
		<bu:header formId ="5e9b9c83a9fc435b95f7374e2357d49d"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>
      <!-- <script src="${path}plf/js/echarts/echarts.js"></script> -->
  <script src="${path}plf/js/highcharts/highcharts.js"></script>
  <script type = "text/javascript" src = "${path}plf/page/timer/perforMonit/js/echarts.min.js"></script>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="676fe684fcd34dcaade2680146be8eeb" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="676fe684fcd34dcaade2680146be8eeb" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form onchange="loadingData()" id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage5e9b9c83a9fc435b95f7374e2357d49d" id="formPage5e9b9c83a9fc435b95f7374e2357d49d" value="${formPage5e9b9c83a9fc435b95f7374e2357d49d}"/>
		<input type="hidden" name="formId" id="formId1" value='5e9b9c83a9fc435b95f7374e2357d49d'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		

<div class="pn pn2" id="usKeyList" >
  <!--饼图模块-->
    <div class="mod mod3">
        <div class="mod-in" >
            <div class="hd" id="hd4">
                <h2 class="tit">
                    <i class="ico-hd"></i>
                    "生产前十大不良"
                </h2>
                <div class="more">
                    <a href="javascript:void(0);" onclick="addTab() "> </a>
                </div>
            </div>
            <div class="bd" id="bd4" style="height:270px;"  >
                <div id="charts_auto_wh_f29c33a19d4e43b598e73db4ec1c40f33" style="width: 500px; margin: 0px auto;">
                    <div id="charts_background_f29c33a19d4e43b598e73db4ec1c40f33" style="width: 600px; height: 600px; max-height: 300px; max-width: 550px; background: transparent; opacity: 1; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" _echarts_instance_="ec_1560740319605">
                        <div style="position: relative; overflow: hidden; width: 550px; height: 300px; padding: 0px; margin: 0px; border-width: 0px;">
                            <canvas width="687" height="375" data-zr-dom-id="zr_0" style="position: absolute; left: 0px; top: 0px; width: 550px; height: 300px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>

                        </div>
                        <div></div>
                    </div>
                    <div id="charts_f29c33a19d4e43b598e73db4ec1c40f33" style="width: 500px; height: 500px; max-height: 300px; max-width: 550px;"></div>
                </div>
            </div>
        </div>
    </div>
 
    <!--列表模块-->
    <div class="mod mod4">
        <div class="mod-in">
            <div class="hd" id="hd3">
                <h2 class="tit">
                    <i class="ico-hd"></i>
                    "延期未完成制令单"
                </h2>
                <div class="more"></div>
            </div>
            <div class="bd" id="bd3" style="height: 270px">
                <div style="width: 100%;overflow: hidden">
                    <table class="htable" style="width: 100%" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td width="40%">商品</td>
                                <td width="40%">数量</td>
                                <td width="20%">延期天数</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="scroll mCustomScrollbar mCS_3 mCS_autoHide" style="width: 100%;height: 240px; overflow:visible; position: relative">
                    <div id="mCSB_3" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical_horizontal mCSB_outside" tabindex="0" style="max-height: none;">
                        <div id="mCSB_3_container" class="mCSB_container mCS_x_hidden mCS_no_scrollbar_x" style="position: relative; top: 0px; left: 0px; width: 100%; margin: 0px;" dir="ltr">
                            
                        </div>
                    </div>
                    <div id="mCSB_3_scrollbar_vertical" class="mCSB_scrollTools mCSB_3_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;">
                        <div class="mCSB_draggerContainer">
                            <div id="mCSB_3_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; display: block; height: 189px; max-height: 230px; top: 0px;">
                                <div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
                            </div>
                            <div class="mCSB_draggerRail"></div>
                        </div>
                    </div>
                </div>
                <div id="mCSB_3_scrollbar_horizontal" class="mCSB_scrollTools mCSB_3_scrollbar mCS-minimal-dark mCSB_scrollTools_horizontal" style="display: none;">
                    <div class="mCSB_draggerContainer" style>
                        <div id="mCSB_3_dragger_horizontal" class="mCSB_dragger" style="position: absolute; min-width: 50px; width: 0px; left: 0px;">
                            <div class="mCSB_dragger_bar"></div>
                        </div>
                        <div class="mCSB_draggerRail"></div>
                    </div>
                </div>
            </div>
              <div class="center">
        <s:include value="/plf/page/fp/pagination.jsp?listDataFn=listAjaxTable&formId=5e9b9c83a9fc435b95f7374e2357d49d&showLoading=0" />
      </div> 
        </div>
    </div>
   
  </form>
                 
             
                 
</div> 
<!--这个是饼图-->
<script type="text/javascript">
$(function() {
     pieInit();           
});
  
function pieInit(){      
      var getLoadUrl="${path}buss/bussModel_exeFunc.ms?funcMId=66309d33845e49a48e0392eff4411482";
  	  var arrHtml = [];
  	  arrHtml.push("<table class='btable' cellpadding='0' cellspacing='0' style='width:100%'><tbody>");
       $.ajax({
            type : 'POST', //传输类型
            async : true, //同步执行
            url : getLoadUrl, //web.xml中注册的Servlet的url-pattern
            data : {},
            datatype : 'json', //返回数据形式为json
            success : function(result) {
                if (result) {
                    var myChart = echarts.init(document.getElementById('bd4'));
                    var param = {legen:[],data:[]};
                    for(var i = 0 ;i<result.ajaxList.length;i++){
                        var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
                        param["legen"].push(result.ajaxList[i].NAME);
                        var obj = {};
                        obj.value = result.ajaxList[i].NUM;
                        obj.name =  result.ajaxList[i].NAME;
                        param["data"].push(obj);
                      arrHtml.push('<tr '+backgroudColor+'><td width="40%" title="MO170419_001-01">'+result.ajaxList[i].NAME+'</td><td width="40%" title="40.08.01.000000299">'+result.ajaxList[i].NUM+'</td><td width="20%" title="773.7">773.7</td></tr>');
                    }

		arrHtml.push("</tbody></table>");
        $("#mCSB_3_container").html(arrHtml.join(""));
                    var option = {
                        title: {
                            text: 'ECharts技术(饼图)',
                            subtext:'下级标签',
                             x:'center',
                             y:'top'
                        },
                        tooltip:{
                            trigger:'item',
                            formatter:"{a}<br/>{b}:({d}%)"
                        },
                        toolbox:{
                            show:true,
                            feature:{
                                mark:{show:true},
                                dataView:{show:true,readOnly:false},
                                magicType:{
                                    show:true,
                                    type:['pie','funnel'],
                                    option:{
                                        funnel:{
                                            x:'25%',
                                            width:'50%',
                                            funnelAlign:'left',
                                            max:1548
                                        }
                                    }
                                },
                                restore:{show:true},
                                saveAsImage:{show:true}
                            }
                        },
                        calculable:true,
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: param["legen"]
                        },
                        series : [ {
                            name : '商品名称',
                            type : 'pie',
                            radius : '65%',
                            center: ['50%', '60%'],
                            data:param["data"],
                            selectedMode:"multiple",//点击之后 扇形分离
                            legendHoverLink:true,
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        } ]
                    };

                    myChart.setOption(option);
                }
            },
            error : function(errorMsg) {
                alert("加载数据失败");
            }
        });//AJAX
 }
    
              
</script>
<script type="text/javascript">

function query(thisObj){
  var name_id=$("#NAME").val();
  if(name_id == "" || name_id == null || name_id == undefined){
    pieInit();
    return;
  }
  var getLoadUrl1="${path}buss/bussModel_exeFunc.ms?funcMId=66309d33845e49a48e0392eff4411482";
  var arrHtml1= [];
  arrHtml1.push("<table class='btable' cellpadding='0' cellspacing='0' style='width:100%'><tbody>");
  $.ajax({
     type : 'POST', //传输类型
     async : false, //同步执行
     url : getLoadUrl1, //web.xml中注册的Servlet的url-pattern
     data : "&name_id="+name_id,
     datatype : 'json', //返回数据形式为json
     success : function(result) {
        if (result) {
          for(var i = 0 ;i<result.ajaxList.length;i++){
            arrHtml1.push('<tr ><td width="40%" title="MO170419_001-01">'+result.ajaxList[i].NAME+'</td><td width="40%" title="40.08.01.000000299">'+result.ajaxList[i].NUM+'</td><td width="20%" title="773.7">773.7</td></tr>');
          }
        arrHtml1.push("</tbody></table>");
        $("#mCSB_3_container").html(arrHtml1.join(""));
        }
    },
      error : function(errorMsg){
        alert("加载数据失败");
      }
  })
}
  
function saveAj(){
  var formId = $("#formId1").val();
  var url = "${path}buss/bussModel.ms?exeid=b92bfde817cd45499701a1d32454254f&formId="+formId+"&iframeId="+_currentFrame;
    showPopWinFp(url, 900, 513,null,"商品新增");

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
