<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title><dict:lang value="DMP服务列表"/></title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head_layui.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="dmp" value="1" />
	</jsp:include>
 <style type="text/css">
 .layui-form-select{
 	width: 220px;
 }
 
 .cards2{
 	margin: 0 -8px;
 }
 
	
 </style>
</head>

<body>
    <div class="layui-fluid switch">
        <div class="listOperate">
            <!--  <div class="searchSwitch"></div> -->
            <div class="operates">
                <span class="ico add"  onClick="addInfo();"></span>
               <!--  <span class="ico search" onClick="listCardAx();"></span>-->
            </div>
        </div>
        <!--  
        <form class="layui-form searchDiv" id="searchForm" action="">
            <div class="layui-row">
           
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="组织机构"/></div>
                    <div class="search_r">
                       <dict:selectDict  laysearch=""  verify="required"  dictCode="TOA_CLASSIFY" dictValue="%{TYPE}"  id="paraMap_dataAuth" name="paraMap.DATA_AUTH" custom_option="<option placeholder='请选择...' value=''>%{getText('--请选择--')}</option>" />
                    	<select  name="paraMap.DATA_AUTH" id="paraMap_dataAuth"  lay-search >
							<option placeholder='请选择...' value=''>--请选择--</option>
						</select>
                    </div>
                </div>
                
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="DMP服务IP"/></div>
                    <div class="search_r">
                        <input type="text"  id="paraMap_dmpId" name="paraMap.DMP_ID" maxlength="30"  class="layui-input">
                    </div>
                </div>
                
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="DMP服务名称"/></div>
                    <div class="search_r">
                        <input type="text"  id="paraMap_dmpRemark" name="paraMap.DMP_REMARK" maxlength="30"  class="layui-input">
                    </div>
                </div>
                
            </div>
        </form>-->
        <div id="cardlist">
            
        </div>
        <!-- <div class="cardPane open">
            <div class="layui-row cards2">
                 <div class="item active">
                    <div class="p1">DMP程序性能测试服务</div>
                    <div class="p2">DMP001</div>
                    <div class="operates">
                        <span class="ico edit"></span>
                        <span class="ico close"></span>
                        <span class="ico search"></span>
                        <span class="ico play"></span>
                        <span class="ico code"></span>
                    </div>
                </div>
            </div>
        </div> -->
    </div>
<script type="text/javascript" src="${path}plf/page/bussmodel/dmp/js/echarts.js"></script>
<script>
bulidEvenForDmpIcon();
function bulidEvenForDmpIcon(){
	$('.search').attr('title',"<dict:lang value='查看'/>");
	$('.icolist').attr('title',"<dict:lang value='列表'/>");
	$('.icocard').attr('title',"<dict:lang value='卡片'/>");
	$('.code').attr('title',"<dict:lang value='源码'/>");
	$('.code2').attr('title',"<dict:lang value='源码'/>");
	$('.code3').attr('title',"<dict:lang value='源码'/>");
	$('.add').attr('title',"<dict:lang value='新增'/>");
	$('.toRight').attr('title',"<dict:lang value='右移'/>");
	$('.toLeft').attr('title',"<dict:lang value='左移'/>");
	$('.edit').attr('title',"<dict:lang value='修改'/>");
	$('.close').attr('title',"<dict:lang value='删除'/>");
	$('.play').attr('title',"<dict:lang value='启动'/>");
	$('.pause').attr('title',"<dict:lang value='停止'/>");
}
	layui.use(['element','form','layer'], function(){
        var element = layui.element;
        var layer = layui.layer
        
        //解除绑定  弹窗提示
        $('#cardlist').on('click','.cards2 .close',function(){
        	var _id = $(this).parents('.item').find('.p2').text()
        	var item = layer.open({
                title: '<dict:lang value="摩尔提示"/>',
                skin: 'layui-layer-molv',
                btn: ['<dict:lang value="确定"/>', '<dict:lang value="取消"/>'],
                yes: function(index, layero){
                    delInfo(_id);
                	layer.close(item);
                },btn2: function(index, layero){
                  //按钮【取消】的回调
                },
                area: ['260px','150px'],
               	type: 1, 
                id: 'hintDiv', //防止重复弹出
                content: '<p style="margin-top:25px;text-align:left;padding-left:20px;"><dict:lang value="是否确认删除"/></p>',
                shade: 0.3 
            });
        })
    });
    
    $('.searchSwitch').click(function(){
        $('.layui-fluid').toggleClass('switch')
    });

    $('.cards2 .item').click(function(){
        $(this).addClass('active').siblings().removeClass('active')
    });
       
            listCardAx();               
  
    getSelInfo();
    function addInfo(){
    	var url = "${path}dmp/DmpServiceAction_dmpServiceAdd.ms";
 	    window.location.href= url;
    }
    function editInfo(dmpId){
    	var type=$("#playState"+dmpId).val();
		if(type=="1"){
			layer.msg("<dict:lang value="DMP程序处于开启状态,不可操作" />", {time: 1000, icon:5});
		}else{
			var url = "${path}dmp/DmpServiceAction_dmpServicelEdit.ms?paraMap.DMP_ID="+dmpId;
	 	    window.location.href= url;
		}
    }
    function viewInfo(dmpId){
    	var url = "${path}dmp/DmpServiceAction_dmpServicelView.ms?paraMap.DMP_ID="+dmpId;
 	    window.location.href= url;
    }
    <%-- 异步刷新卡片列表数据 --%>
	function listCardAx(){
		$("#cardlist").html("");
		var url = "${path}dmp/DmpServiceAction_getDmpServiceListCard.ms";
		var formData = form.serialize($("#searchForm"));
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: formData,
			success: function(data){
				var operHtml = "";
				try{
					if(null !=data.ajaxMap){	
						$.each(data.ajaxMap,function(key,values){
							var arr= key.split(",");
						    
						    operHtml =operHtml +"<div class='cardPane open'>";
						    
						    operHtml =operHtml +"<fieldset class='layui-elem-field layui-field-title'>";
                			operHtml =operHtml +"<legend><dict:lang value='服务列表'/>"+arr[0]+"("+values.length+")</legend>";
                			operHtml =operHtml +"<div class='more'>";
                    		operHtml =operHtml +"<div class='moreBtn showBtn'>";
                        	operHtml =operHtml +"<span class='moreIco'></span>";
                    		operHtml =operHtml +"</div>";
                    		
                    		if(values.length>20){
                    			operHtml =operHtml +"<div class='moreBtn moreloadlist' moreload_dataauth_id='"+arr[1]+"'><span class='text'><dict:lang value='更多'/></span></div>";
                    		}
                    		
                			operHtml =operHtml +"</div>";
            				operHtml =operHtml +"</fieldset>";
            				operHtml =operHtml +"<div class='layui-row cards2'>";
            				//console.log(values);
						    
						    $.each(values, function(i, paraDto) {
						    	//console.log(paraDto.PNAME);
						    	if(i>19){
						    		return false;
						    	}
						    
								operHtml =operHtml +"<div class='item'><input type='hidden' isrequest='N' id='req_"+paraDto.DMP_ID+"'>";
								operHtml =operHtml +"	<div class='p0' style='position:relative;width:50px;height:50px;'><span class='icon dmpServiceIcon'></span></div>";
				                operHtml =operHtml +"	<div class='p1' style='position:absolute;right:10px;top:20px;float:right;'><span class='ico'></span>"+paraDto.DMP_REMARK+"</div>";
				                operHtml =operHtml +"	<div class='p2' style='position:absolute;right:10px;top:30px;float:right;'>"+paraDto.DMP_ID+"</div><div class='p3' style='position:absolute;float:right;right:10px;top:65px;color: #999;'>"+(paraDto.IP==null?"":paraDto.IP)+(paraDto.SERVICE_PORT==null?"":":"+paraDto.SERVICE_PORT)+"</div>";
				                operHtml =operHtml +"	<div class='operates'>";
				                operHtml =operHtml +"		<span class='ico edit' title='<dict:lang value="修改"/>' onClick=\"editInfo('"+paraDto.DMP_ID+"');\"></span>";
				                operHtml =operHtml +"		<span class='ico close' title='<dict:lang value="删除"/>' ></span>";//onClick=\"delInfo('"+paraDto.DMP_ID+"');\"
				                operHtml =operHtml +"		<span class='ico search' title='<dict:lang value="查看"/>'  onClick=\"viewInfo('"+paraDto.DMP_ID+"');\"></span>";
				             //   if(paraDto.SERVICE_STATE=="N"){
				                	operHtml =operHtml +"		<span class='ico play' title='<dict:lang value="启动"/>' id=\"playButton"+paraDto.DMP_ID+"\" onClick=\"changeState('"+paraDto.DMP_ID+"');\"><input type='hidden' id=\"playState"+paraDto.DMP_ID+"\" value='2'/></span>";
					                operHtml =operHtml +"		<span class='ico code' title='<dict:lang value="监控"/>' id=\"showMonitorPage"+paraDto.DMP_ID+"\"  onClick=\"showMonitorPage('close','"+paraDto.DMP_ID+"');\"></span>";
				              //  }
				              /*  else{
				                	var object=paraDto.SERVICE_STATE;
				                	if(object.DMPACTIVE=="Y"){
				                		operHtml =operHtml +"		<span class='ico pause' title='<dict:lang value="停止"/>' id=\"playButton"+paraDto.DMP_ID+"\" onClick=\"changeState('"+paraDto.DMP_ID+"');\"><input type='hidden' id=\"playState"+paraDto.DMP_ID+"\" value='1'/></span>";//pause
						                operHtml =operHtml +"		<span class='ico code' title='<dict:lang value="监控"/>' id=\"showMonitorPage"+paraDto.DMP_ID+"\"  onClick=\"showMonitorPage('open','"+paraDto.DMP_ID+"');\"></span>";
				                	}else if(object.DMPACTIVE=="N"){
				                		operHtml =operHtml +"		<span class='ico play' title='<dict:lang value="启动"/>' id=\"playButton"+paraDto.DMP_ID+"\" onClick=\"changeState('"+paraDto.DMP_ID+"');\"><input type='hidden' id=\"playState"+paraDto.DMP_ID+"\" value='2'/></span>";
						                operHtml =operHtml +"		<span class='ico code' title='<dict:lang value="监控"/>' id=\"showMonitorPage"+paraDto.DMP_ID+"\"  onClick=\"showMonitorPage('close','"+paraDto.DMP_ID+"');\"></span>";
				                	}else{
				                		if(object.status=="404"){
				                			operHtml =operHtml +"		<span class='ico play' title='<dict:lang value="启动"/>' id=\"playButton"+paraDto.DMP_ID+"\" onClick=\"changeState('"+paraDto.DMP_ID+"');\"><input type='hidden' id=\"playState"+paraDto.DMP_ID+"\" value='2'/></span>";
							                operHtml =operHtml +"		<span class='ico code' title='<dict:lang value="监控"/>' id=\"showMonitorPage"+paraDto.DMP_ID+"\"  onClick=\"showMonitorPage('close','"+paraDto.DMP_ID+"');\"></span>";
				                		}
				                	}
				                } */
				                operHtml =operHtml +"	</div>";
				                operHtml =operHtml +"</div>";
	            					
							});   
							
						    operHtml =operHtml +"</div>";
						    operHtml =operHtml +"</div>";
						    
					    }); 
						$("#cardlist").html(operHtml);				    
					}
					$("#cards").html(operHtml);
				    
				   $('.cards2 .item').click(function(){
				       $(this).addClass('active').siblings().removeClass('active');
				       $(this).addClass('active').parent().parent().siblings().find('div.item').removeClass('active')
				   })
				   
			       //$('.cards2 .item').dblclick(function(){
			       //	   view($(this).attr("rowId"));
				   //})
				   
				   
		           $('.cards2 .item .code').click(function(){
			    	   var id = $(this).parent().attr("rowId");
			    	   var code = $(this).parent().attr("code");
				   })
				}catch(e){
					console.log(e);			
				}
             constr();
			},
			error: function(msg){
				
			}
		});
	}
var first = true;
function constr(){
if(first){
   first = false;
   	$("#cardlist .cardPane  .item ").each(function(i){
	  var dmpId = $(this).find(".p2").text();
          changeState2(dmpId);
	});
}
}
setInterval(function() {         
      	$("#cardlist .cardPane  .item ").each(function(i){
	  var dmpId = $(this).find(".p2").text();
	 
	  var reqFlag = document.getElementById("req_"+dmpId);
	  var reqFlag2 =$(reqFlag);
	      
	      //00000000
          if(reqFlag2.attr("isrequest")=="N"){
          reqFlag2.attr("isrequest","Y");
          changeState2(dmpId);
          
          }
	});               
}, 2000); 
function changeState2(dmpId){//更改DMP服务的状态
        var connect = false;       	
        var idMap = {};
        idMap[0] = dmpId;
        var url = "${path}dmp/DmpServiceAction_getServiceStatus.ms";
	jQuery.ajax({
	    type: "POST",
	    dataType: "json",
	    url: url,
	    data:{"paraMap.DMPIDS":JSON.stringify(idMap)},
	success: function(data){connect = true;
	   var resList = data.ajaxMap.RESLIST;
	   for(var i=0;i<resList.length;i++){
	   var dmpId = resList[i].DMP_ID;
	  var reqFlag = document.getElementById("req_"+dmpId);
	  var reqFlag2 =$(reqFlag);  
	  reqFlag2.attr("isrequest","N");	   
	   var dmpStatus = resList[i].DMP_STATUS;
	   var oldStauts = $("#playState"+dmpId).val();
	   if((oldStauts=="1"&&dmpStatus=="Y")||(oldStauts=="2"&&dmpStatus!="Y")){	   
	   continue;
	   }else{
        if(dmpStatus=="Y"){
        $("#playState"+dmpId).val("1");
        $("#playButton"+dmpId).removeClass("play");
        $("#playButton"+dmpId).addClass("pause");
	$("#playButton"+dmpId).attr('title','<dict:lang value="停止"/>');
        $("#showMonitorPage"+dmpId).attr('onclick','').unbind('click');
		$("#showMonitorPage"+dmpId).click(function(){
		showMonitorPage("open",dmpId);
		});        
        }else{
        $("#playState"+dmpId).val("2");
        $("#playButton"+dmpId).removeClass("pause");
        $("#playButton"+dmpId).addClass("play"); 
	$("#playButton"+dmpId).attr('title','<dict:lang value="启动"/>');
        $("#showMonitorPage"+dmpId).attr('onclick','').unbind('click');
		$("#showMonitorPage"+dmpId).click(function(){
		showMonitorPage("close",dmpId);
		});                 
        }	   
	   }	   
	   }
	   

			},
	error: function(msg){connect = true;
			
			}
		});  
}
	
	function getSelInfo(){
		//<option placeholder='请选择...' value=''>--请选择--</option>
		//<option value="A" >A</option>
		var operHtml="";
		var jsondata={"type":"1"};
		var url = "${path}dmp/DmpServiceAction_getSelInfo.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    async:false,
	    data:jsondata,
		success: function(data){	
			if(null !=data.ajaxMap){	
				//console.log(data.ajaxMap);
				$.each(data.ajaxMap,function(key,values){
					//console.log(key,values);
				    $.each(values, function(i, paraDto) {
				    	    if(paraDto.NAME==""){paraDto.NAME="";}
				    		operHtml=operHtml+"<option value='"+paraDto.ID+"' >"+paraDto.NAME+"</option>";
						});   
					}); 
				}
				$("#paraMap_dataAuth").append(operHtml);
			},
			error: function(msg){
				util.alert("error:"+msg);
		   }
		});
	}
	function delInfo(value){
		var type=$("#playState"+value).val();
		if(type=="1"){
			layer.msg("<dict:lang value="DMP程序处于开启状态,不可操作" />", {time: 1000, icon:5});
		}else{
			
			$.post("${path}dmp/DmpServiceAction_dmpServiceDelInfo.ms",{value:value},function(res){
			    if(res.ajaxMap.state==0){
				layer.msg("<dict:lang value="删除失败" />", {time: 1000, icon:5});
			    }else{
			    	//var url = "${path}dmp/DmpServiceAction_getDmpServiceList.ms";
			 	    //window.location.href= url;
			    	//window.location.reload();
			    	listCardAx();
			    }
	        });
		}
	}
	function changeState(value){
	    var type=document.getElementById("playState"+value).value;
		var param="";
		if(type=="1"){
			//开启转暂停
			param="n";
		}else if(type=="2"){
			//暂停转开启
			param="y";
		}
		var jsondata={"paraMap.DMP_ID":value,"paraMap.active":param};
		var url = "${path}dmp/DmpServiceAction_getServiceState.ms";
		jQuery.ajax({
			type: "POST",
		    dataType: "json",
		    url: url,
		    data: jsondata,
		    async:false,
			success: function(data){
	            var resultStr = data.ajaxString;
	            //console.log(resultStr);
	            if(resultStr=="EMPTY_ERROR"){
                        layer.msg("<dict:lang value="未找到IP地址" />", {time: 1000, icon:5});
	            }else if(resultStr=="N"){
			layer.msg("<dict:lang value="IP地址错误" />", {time: 1000, icon:5});
	            }else{
	                var result = "";
	                if(resultStr!=""){
	                result=JSON.parse(resultStr);
	                }else{
			  layer.msg("<dict:lang value="无返回数据" />", {time: 1000, icon:5});
	                  return false;
	                }
	            	$.each(result,function(i,info) {
	            		if(info.RESULT_FLAG=="11"){
		            		//开启成功
		            		layer.msg("<dict:lang value="开启成功" />", {time: 1000, icon:6});
		            		$("#playButton"+value).removeClass("play");
		        			$("#playButton"+value).addClass("pause");
						$("#playButton"+value).attr('title','<dict:lang value="停止"/>');
		        			$("#playState"+value).val("1");
		        			$("#showMonitorPage"+value).attr('onclick','').unbind('click');
		        			$("#showMonitorPage"+value).click(function(){
		        				showMonitorPage("open",value);
		        			}); //绑定点击事件函数 
		            	}else if(info.RESULT_FLAG=="12"){
		            		//关闭成功
		            		layer.msg("<dict:lang value="关闭成功" />", {time: 1000, icon:6});
		            		$("#playButton"+value).removeClass("pause");
		        			$("#playButton"+value).addClass("play");
						$("#playButton"+value).attr('title','<dict:lang value="启动"/>');
		        			$("#playState"+value).val("2");
		        			$("#showMonitorPage"+value).attr('onclick','').unbind('click');
		        			$("#showMonitorPage"+value).click(function(){
		        				showMonitorPage("close",value);
		        			});
		            	}else if(info.RESULT_FLAG=="13"){
		            		//DMP程序正处于运行状态
		            		layer.msg("<dict:lang value="DMP程序正处于运行状态" />", {time: 1000, icon:5});
		            	}else if(info.RESULT_FLAG=="14"){
		            		//
		            		layer.msg("<dict:lang value="DMP程序正处于关闭状态" />", {time: 1000, icon:5});
		            	}
            		});
	            }
			},
			error: function(msg){
				 console.log(msg);
			}
		});
		//if(type=="1"){
			//开启转暂停
		//	$("#playButton"+value).removeClass("pause");
		//	$("#playButton"+value).addClass("play");
		//	$("#playState"+value).val("2");
		//	$("#showMonitorPage"+value).attr('onclick','').unbind('click');
		//}else if(type=="2"){
			//暂停转开启
		//	$("#playButton"+value).removeClass("play");
		//	$("#playButton"+value).addClass("pause");
		//	$("#playState"+value).val("1");
		//	$("#showMonitorPage"+value).click(function(){
		//		showMonitorPage(value);
		//	}); //绑定点击事件函数 
		//}
	}
	//function showMonitorPage(value){
	//	console.log(value);
	//}
	function showMonitorPage(type,value){
		if(type=="close"){
			layer.msg("<dict:lang value="DMP程序正处于关闭状态" />", {time: 1000, icon:5});
		}else if(type=="open"){
			var url = "${path}dmp/DmpDeviceAction_getDeviceModel.ms?FUNC_CODE=F_cbd32e831f17482ba175e47150ef4b8f&paraMap.DMP_ID="+value;
		    window.location.href= url;
		}
	}
</script>	
<script>
        var option = {
			series : [ {
				name : 'System cpu',
				radius : '95%',
				splitNumber : 10, //每段的多少个
				title : {
					color : '#333',
				},
				type : 'gauge',
				detail : {
					formatter : '{value}%',
					offsetCenter: [0, "20%"],
					height: 10,
					textStyle : {
						color: '#009688',
						fontSize: 16
					}
				},
				axisLine : { //刻度区域样式
					lineStyle : {
						color: [[0.2, '#32c4c1'],[0.8, '#52b3fc'],[1, '#da7f80']],
						width : 12
					}
				},
				splitLine : { //大刻度线样式
					length : 12,
					lineStyle: {
						color: '#fff'
					}
				},
				axisTick : { //小刻度线样式
					length : 3,
					splitNumber : 1,
					lineStyle : {
						color : '#fff',
					}
				},
				axisLabel : {//刻度值
					show : true,
					distance : 2,
					textStyle: {
	  	            	fontSize: 10
	  	            }
				},
				pointer : {
					width : 3,
				},
				itemStyle : {
					color:['#198F77','#F7C92F']
				},
				title : {
					offsetCenter : [ 0, '-30%' ],
					textStyle: {
	  	            	fontSize: 10,
	  	            	color: '#666',
	  	            }
				},
				data : [ {
					value : 45,
				},{
					value : 55,
				}]
			} ]
        }
    	
    	var option1 = {
	        tooltip: {
	            trigger: 'item',
	            formatter: "{a} <br/>{b}: {c} ({d}%)"
	        },
	        color: ["#1c9179", "#e6e6e6"],
	        graphic:[{
	            type:'text',
	            left:'center',
	            top:'33%',
	            style:{
	                text:'5607.4G',
	                textAlign:'center',
	                fill:'#1C9179',
	                fontSize: 18,
	            }
	        },{
			    type: 'rect',
			    shape: {
			        x: 20,
			        y: 70,
			        width: 100,
			        height: 1
			    },
			    style:{
	                fill:'#c8c8c8',
	            }
			},{
	            type:'text',
	            left:'center',
	            top:'55%',
	            style:{
	                text:'5607.4G',
	                textAlign:'center',
	                fill:'#e6e6e6',
	                fontSize: 18,
	            }
	        }],
		    series: [
		        {
		            name:'访问来源',
		            type:'pie',
		            radius: ['90%', '100%'],
		            avoidLabelOverlap: false,
		            label: {
		                normal: {
		                    show: false,
		                    position: 'center'
		                },
		                emphasis: {
		                    show: true,
		                    textStyle: {
		                        fontSize: '30',
		                        fontWeight: 'bold'
		                    }
		                }
		            },
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:[
		                {value:335, name:'直接访问'},
		                {value:310, name:'邮件营销'}
		            ]
		        }
		    ]
	    };



 
    	
        //echarts.init(document.getElementById('a')).setOption(option)
        //echarts.init(document.getElementById('b')).setOption(option1)
</script>	

</body>
</html>