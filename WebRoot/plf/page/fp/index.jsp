<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8" />
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp" >
		<jsp:param name="pieChartsFp" value="1" />
</jsp:include>
<title><%=CommMethodMc.getText(ConstantsMc.N2_SHOW_TITLE) %>
</title>
<script type="text/javascript" src="${path}/plf/page/sysmain/echarts/js/showMchart.js?_mc_res_version=<%=PlfStaticRes.SHOWMCHART_JS %>"></script>
 <script src="${path}plf/page/fp/js/echarts/echarts.js?_mc_res_version=<%=PlfStaticRes.ECHARTS_JS %>"></script>
<style type="text/css">			
			.bd{
				text-align:center;
			}

			.htable{
				background-color:#eef1f8;
			}	
			.htable,.btable{
				table-layout: fixed;
				border:1px solid #ebeff8;
				border-top:none;
			}
			.htable td{
				height: 30px;
			    color: #777;
			    font-size: 14px;
			    text-align: left;
			  
			    overflow:hidden;
				white-space: nowrap;
				text-overflow: ellipsis;
				
			}
			.btable td{
				height:30px;	
				font-size:14px;
				overflow:hidden;
				white-space: nowrap;
				text-overflow: ellipsis;
				text-align:left;
				 color: #333;
			}
			.htable td,.btable td{
				padding-left:14px;
				padding-right:8px;
			}
			.htable tr,.btable tr{
				border:1px solid #ebeff8;	
			}
			.pn2 .mCSB_scrollTools .mCSB_draggerContainer{ right:-6px }
			
			.content-in>.mCS-minimal-dark.mCSB_scrollTools_vertical{right:-10px}
</style>
</head>
<body >
	<div class="content-in" style="">
		<div class="pn pn1">
			<ul class="banner">
				<s:iterator value="fiveShowDataList" status="st" id="index">
					<li class="item item<c:out value='${st.index+1}' />">
						<div>
							<span class="title"><dict:lang value="${index.targetName}"/></span>
							<div class="main">
								<div class="num" title="<c:out value='${index.dataValue}' />">
									<span
										style="text-align: center;white-space:nowrap;overflow:hidden;width:118px;display:inline-block;line-height:1;">${fn:substring(index.dataValue,0,5)}</span>
									<span style="float:right;font-size: 15px;margin-top: 23px;line-height:15px;"><dict:viewDict dictCode="CI_UNIT" dictValue="${fn:escapeXml(index.unit)}"/></span>
								</div>
								<div class="pic">
									<img src="${path}plf/userPhoto/<c:out value='${index.picName}' />?_mc_res_version=<%=PlfStaticRes.INDEX_PICNAME %>" width="50"
										height="50" alt="" />
									
								</div>
							</div>
							<div style="background-color: #fff;height: 1px;width: calc(100% - 30px);margin-left: 15px;opacity: 0.3;"></div>
							<div class="footer">
							
								<s:if test="${index.menuUrl!=null}">
									<s:if test="${index.menuUrl.indexOf('?exeid=')==-1||index.menuUrl.indexOf('?')==-1}">
									<a href="javascript:void(0);"
										onclick="addTab('${path}<c:out value="${index.menuUrl}" />?FUNC_CODE=<c:out value="${index.funcCode}" />','<c:out value="${index.menuName}" />','<c:out value="${index.menuId}" />')">查看详情>></a>
									</s:if>
									<s:else>
									<a href="javascript:void(0);"
										onclick="addTab('${path}<c:out value="${index.menuUrl}" />&FUNC_CODE=<c:out value="${index.funcCode}" />','<c:out value="${index.menuName}" />','<c:out value="${index.menuId}" />')">查看详情>></a>
										
									</s:else>
								</s:if>
							</div>
						</div></li>
				</s:iterator>
			</ul>
		</div>
		<!-- end.pn1 -->
		<div class="pn pn2" id="usKeyList" >
		<div class="mod mod1">
		<div class="mod-in">
			 <div class="hd" id="hd1">
			  </div>
			  <div class="bd" style='height:270px;'id="bd1">
				
			  </div>
		</div>
		</div>
		<div class="mod mod2">
		<div class="mod-in">
			 <div class="hd" id="hd2">
			  </div>
			  <div class="bd" style='height:270px;' id="bd2">
			  </div>
		</div>
		</div>
		<div class="mod mod3">
		<div class="mod-in">
				<div class="hd" id="hd3">
			  </div>
			  <div class="bd" id="bd3"style='height:270px;'>
			  </div>
		</div>
		</div>
		<div class="mod mod4">
		<div class="mod-in">
			<div class="hd" id="hd4">
			  </div>
			  <div class="bd" id="bd4" style='height:270px;'>
			  </div>
		</div>
		</div>
	</div>
	<!-- <div id="cls"></div>-->
	</div>
</body>
<script type="text/javascript">
var height=null;
var width=null;
	$.ajax({
		type: "POST",
	    url: "${path}sys/UsKeyDataAction_queryUsKeyDataAjax.ms?",
		success: function(data){
			var arr=data.ajaxList
			var colProArr=null;
			var colPro=null;
			var showName=null;
			var fieLdName=null;
			var showWidth=null;
			var keyDataHtml="";
			var dataList=null;
			var showNumber=null;
			var shwoNumbers=null;
			var path=${path};
			var number=0;
			var url=null;
			var jsonParam={};
			var funcCode=null;
			var jsonText="['";
			if(arr.length>0){
			for(var i=0;i<arr.length;i++){//遍历出4个用户关键数据
				if(i==arr.length-1){
					jsonText+=arr[i].keyName+"']";
				}
				else{
					jsonText+=arr[i].keyName+"','";
				}
			}
			util.initLangMap(jsonText)
			}
			
			for(var i=0;i<arr.length;i++){//遍历出4个用户关键数据
				number++
				colProJson=arr[i].colPro;//获取当前位置用户配置的表头json组
				dataList=arr[i].dataList;//获取当前位置查询出来的记录数
				showNumber=arr[i].showNumber;//获取用户配置的显示行数
				if(arr[i].showType==0){
						
						keyDataHtml="<h2 class=\"tit\"><i class=\"ico-hd\"></i>"+util.getLangShow(arr[i].keyName)+"</h2>"
						+"<div class=\"more\">"
						if(arr[i].menuUrl!=null){
							url=arr[i].menuUrl;
							if(url.indexOf("?exeid=")==-1||url.indexOf("?")==-1){
                  				funcCode="?FUNC_CODE="+arr[i].funcCode;
                  			}else{
                  				funcCode="&FUNC_CODE="+arr[i].funcCode;
                  			}
							keyDataHtml+="<a  href=\"javascript:void(0);\" onclick=\"addTab('"+path+url+funcCode+"','"+arr[i].menuName+"','"+arr[i].menuId+"') \"> </a>"
						}
						keyDataHtml+="</div>"
					   $("#hd"+number).html(keyDataHtml)//关键数据名称和超链接内容
				    if(colProJson!=null){
						keyDataHtml="<div style='width:100%;overflow:hidden'><table  class=\"htable\" style=\"width:100%\" cellpadding=\"0\" cellspacing=\"0\">"//列表表头开始
	              		+"<tr>"
						colPro=eval(colProJson);//字符串转换
						for(var j=0;j<colPro.length;j++){//遍历用户配置的表头json组
							 showName=colPro[j].SHOW_NAME;//获取当前json里的显示名称
							 showWidth=colPro[j].SHOW_WIDTH;//获取当前json里的显示函数
							 keyDataHtml+="<td width="+showWidth+"%\">"+showName+"</td>"
							 if(j==(colPro.length-1)){ 
					        	 keyDataHtml+="</tr></table></div>"
			              	}
						}
						if(dataList==null){
							var str = '<div style="width: 210px;height: 100px;background-image: url(${path}plf/page/fp/img/null-data.png?_mc_res_version=<%=PlfStaticRes.NULL_DATA_PNG%>);display: inline-block;margin-top: 50px;"></div>'
							    str += '<p style="margin-top: 20px;color: #666;">当前无数据</p>'
							$("#bd"+number).html(str);
							continue;
						}
						keyDataHtml+="<div  class=\"scroll\" style=\"width:100%;height:240px;overflow:auto;overflow-x:hidden;\"><table  class=\"btable\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:100%\"><tbody >"
						if(showNumber<(dataList.length)){
								shwoNumbers=showNumber;
							}else{
								shwoNumbers=dataList.length;
							}
							for(var z=0;z<shwoNumbers;z++){//遍历用户配置的表体json组
							if((z%2)==0){
								keyDataHtml+="<tr>"
							}else{
								keyDataHtml+="<tr class=\"tr-hover\">"
							}
							for(var j=0;j<colPro.length;j++){//遍历用户配置的表头json组
								 fieldName=(colPro[j].FIELD_NAME).toUpperCase();//获取当前json里的字段名称
								 showWidth=colPro[j].SHOW_WIDTH;//获取当前json里的显示函数
								 cloName=dataList[z][fieldName];
								 if(cloName==null){
									 keyDataHtml+="<td width='"+showWidth+"%' title='"+cloName+"'></td>"
								 }else{
								 	keyDataHtml+="<td width='"+showWidth+"%' title='"+cloName+"'>"+cloName+"</td>"
								 }
							}
							if(z!=(shwoNumbers-1)){
								keyDataHtml+="</tr>"
							}
							 if(z==(shwoNumbers-1)){ 
					        	 keyDataHtml+="</tr></table></div>"
			              	}
						}
						$("#bd"+number).html(keyDataHtml);
					}else{
						$("#bd"+number).html(keyDataHtml);
					}
				  }
				if(arr[i].showType!=0){
					keyDataHtml="<h2 class=\"tit\"><i class=\"ico-hd\"></i>"+util.getLangShow(arr[i].keyName)+"</h2>"
					+"<div class=\"more\">"
					
					if(arr[i].menuUrl!=null){
						url=arr[i].menuUrl;
						if(url.indexOf("?exeid=")==-1||url.indexOf("?")==-1){
              				funcCode="?FUNC_CODE="+arr[i].funcCode;
              			}else{
              				funcCode="&FUNC_CODE="+arr[i].funcCode;
              			}
						keyDataHtml+="<a  href=\"javascript:void(0);\" onclick=\"addTab('"+path+url+funcCode+"','"+arr[i].menuName+"','"+arr[i].menuId+"') \"> </a>"
					}
					keyDataHtml+="</div>"
				   $("#hd"+number).html(keyDataHtml)//关键数据名称和超链接内容
				   	keyDataHtml="<div id=\"charts_auto_wh_"+arr[i].chartsId+""+i+"\"><div id=\"charts_background_"+arr[i].chartsId+""+i+"\" style=\"width:10px;height:10px;\"></div>"
				  	+"<div id=\"charts_"+arr[i].chartsId+""+i+"\" style=\"width:500px;height:500px;\"></div></div>"
				  	$("#bd"+number).html(keyDataHtml);//关键数据名称和超链接内容
				  	$("#charts_background_"+arr[i].chartsId+""+i).css('max-height','300px');
				  	$("#charts_background_"+arr[i].chartsId+""+i).css('max-width','550px');
				  	$("#charts_"+arr[i].chartsId+""+i).css('max-height','300px');
				  	$("#charts_"+arr[i].chartsId+""+i).css('max-width','550px');
					  	if(arr[i].showType==1){
					  		mchart.pieMchart(arr[i].chartsId,"charts_background_"+arr[i].chartsId+""+i,jsonParam);	
					  	}
						if(arr[i].showType==2){
					  		mchart.lineMchart(arr[i].chartsId,"charts_background_"+arr[i].chartsId+""+i,jsonParam);	
					  	}
						if(arr[i].showType==3){
					  		mchart.barMchart(arr[i].chartsId,"charts_background_"+arr[i].chartsId+""+i,jsonParam);	
					  	}
						if(arr[i].showType==4){
					  		mchart.gagueMchart(arr[i].chartsId,"charts_background_"+arr[i].chartsId+""+i,jsonParam);	
					  	}
						if(arr[i].showType==5){
					  		mchart.calMchart(arr[i].chartsId,"charts_background_"+arr[i].chartsId+""+i,jsonParam);	
					  	}
				  	}
					$("#charts_auto_wh_"+arr[i].chartsId+""+i).width($("#charts_"+arr[i].chartsId+""+i).width()).css('margin','0 auto');
				}
				Height();
				
		},
		error: function(msg){
				utilsFp.confirmIcon("3","","","","error:"+msg,"",320,150);
		}
			
		});
function Height(){
    var H = $(window).height();
    var W = $(window).width();
    $('.content-in').css('height','calc(100% - 10px)');
    $('.content-in').css('width',W - 10);
    var mCustomScrollPara = {
		    axis:"yx",
			snapAmount:40,
			theme:"minimal-dark",
			keyboard:{scrollAmount:40},
			mouseWheel:{deltaFactor:40,preventDefault:true},
			scrollInertia:100
	}
	var brow = $.browser;
	//if(brow.is!="msie"){
	 	$(".content-in").mCustomScrollbar(mCustomScrollPara);
	 	$(".scroll").mCustomScrollbar(mCustomScrollPara);
	/* }else{
		$("#usKeyList").css("overflow-y","auto");
	} */ 
    
    
    $('.btable').parent().css('margin','0');
}

  $(window).resize(function(){
    $('.content-in').mCustomScrollbar("destroy");
    $('.scroll').mCustomScrollbar("destroy");
    Height();
  });
  function addTab(url,name,id){
  	window.parent.addTab(url,name,id);
  }			   
	$('.pn2').on('mouseover','td,th',function(){
		$(this).attr('title',$(this).text())
	})  

	</script>
</html>