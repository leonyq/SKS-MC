<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title><dict:lang value="指令集信息新增"/></title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="serializeForm" value="1" />
		<jsp:param name="dmp" value="1" />
		<jsp:param name="uEditor" value="1" />
	</jsp:include>
	<style>
	.layui-fluid{
		overflow:auto;
		padding-bottom:68px;
	}
	.layui-form-select dl {
		position: absolute;
		left: 0;
		top: 42px;
		padding: 5px 0;
		z-index: 1000;
		min-width: 100%;
		border: 1px solid #d2d2d2;
		max-height: 300px;
		overflow-y: auto;
		background-color: #fff;
		border-radius: 2px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, .12);
		box-sizing: border-box
	}
	 .config{
          height: 70%;
          min-height: 250px;
      }

      .config .layui-row{
          height: 100%;
      }
.group1 .layui-col-sm62 .operates {
    width: calc(100% - 76px);
}
.layui-col-sm62 .layui-card .layui-card-header .filter{
   width: calc(100% - 105px);
}
	.layui-form-item {
	 margin-bottom: 10px;
	}
	.headline{
	 margin-bottom: 10px;
	}
	</style>
</head>
<body>
    <div id="mainDiv" class="layui-fluid" style="padding-bottom:78px;overflow: auto;">
        <div class="headline"><dict:lang value="新增" /></div>
        <form id="add_form" class="layui-form" name="addForm" action="" method="post">
            <div id="orderSetDetailForm" style="display:none;">
    			
            </div>
            <div class="layui-row">
                <div class="searchItem">
                    <div class="search_l"><span class="Eng" style="color:red;">*</span><dict:lang value="指令集代码" /></div>
                    <div class="search_r">
                        <input type="text" maxlength="20" placeholder="<dict:lang value="请输入指令集代码"/>" class="layui-input" name="orderSetDto.tcsCode" id="orderSetDto_tcsCode" onblur="validateCode(this.value)" lay-verify="required" >
                    </div>
                </div>
                <div class="searchItem">
                    <div class="search_l"><span class="Eng" style="color:red;">*</span><dict:lang value="指令集名称" /></div>
                    <div class="search_r">
                        <input type="text" maxlength="33" placeholder="<dict:lang value="请输入指令集名称"/>" class="layui-input" name="orderSetDto.tcsName" id="orderSetDto_tcsName">
                    </div>
                </div>
                <div class="searchItem" style="width:100%">
                    <div class="search_l"><dict:lang value="备注信息" /></div>
                    <div class="search_r">
                        <input style="height:38px;padding:8px;" class="layui-input"  name="orderSetDto.tcsRemark" id="orderSetDto_tcsRemark" maxlength="500" oninput="OnInput(event)" onpropertychange="OnPropChanged(event)"/>
                    </div>
                </div>
            </div>
        </form>
        <div class="config">
            <div class="layui-row group1">
                <div class="layui-col-sm6 layui-col-sm61">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <span class="tit"><dict:lang value="待选指令" /></span>
                            <div class="operates">
                            	
	                                <div class="filter">
	                                    <input type="text"  id="paraMap_code" name="paraMap.TCL_CODE" oninput="OnInput(event)" onpropertychange="OnPropChanged(event)" placeholder="请输入指令(编码/名称)" >
	                                </div>
                           
                                <div class="btns">
                                    <span class="ico search" id="searchLeft"></span>
                                    <span class="ico add" onclick="orderAdd();"></span>
                                    <span class="ico edit" onclick="orderEditLeft2();"></span>
                                    <span class="ico toRight"></span>
                                </div>
                            </div>
                        </div>
                        <div class="layui-card-body type1">
                       
                         	 
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm6 layui-col-sm62">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <span class="tit"><dict:lang value="已选指令" /></span>
                            <div class="operates">
                                <div class="filter">
                                    <input type="text"  id="paraMap_code2" name="paraMap.TCL_CODE" oninput="OnInput2(event)" onpropertychange="OnPropChanged(event)" placeholder="请输入指令(编码/名称)" >
                                </div>
                                <div class="btns">
                                    <span class="ico search" id="searchRight"></span>
                                    <span class="ico edit" onclick="orderEditRight2();"></span>
                                    <span class="ico toLeft"></span>
                                </div>
                            </div>
                        </div>
                        <div class="layui-card-body type1"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ptop_10">
            <button class="layui-btn"  type="button"  lay-filter="filterSubmit"  onclick="submitForm()" type="button"><dict:lang value="保存" /></button>  <!-- lay-filter="filterSubmit" lay-submit="formSubmit"  -->
            <button class="layui-btn layui-btn-danger" onclick="comeback();" type="button"><dict:lang value="取消" /></button>   
        </div> 
        
    </div>
   <div id="otherBlock">
 						<iframe id="otheriframe" name="otheriframe" frameBorder="0"							
								src=""  scrolling="auto" style="border-right: 1px;width: 100%;height: 0px;" >
						</iframe>       
    </div>

<script>
<%-- 异步加载指令列表数据 --%>
	function OnInput(event) {
	    var newContent=event.target.value;
	    listOrderLeftList();
	}
	function OnInput2(event) {
	    var newContent=event.target.value;
	    var param=$("#paraMap_code2").val();
	    listOrderRightList(param);
	}
	function OnPropChanged (event) {
        if (event.propertyName.toLowerCase () == "value") {
            //alert ("The new content2: " + event.srcElement.value);
        }
    }
	listOrderLeftList();
	function listOrderLeftList(){
		var url = "${path}dmp/OrderSetAction_getOrderListForAdd.ms";
		var param=$("#paraMap_code").val();
		var formData = {"paraMap.TCL_CODE":param};//form.serialize($("#searchForm1"));
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: formData,
			success: function(data){
				$(".layui-col-sm61 .layui-card-body").html("");
				var operHtml = "";
				try{
					if(null !=data.ajaxList){	
					    var rccList=data.ajaxList;
						for(var i=0;i<rccList.length;i++){
							var tempFlag=false;
							$(".layui-col-sm62 .layui-card-body").find(".item").each(function(){
								var divArr=$(this);
								var tempStr=$(this).find("span").html();
								if($.trim(tempStr)==rccList[i].TCL_CODE){
									tempFlag=true;
								}
							});
							if(tempFlag==false){
								operHtml=operHtml+"<div class='item'><p><span class='num'>"+rccList[i].TCL_CODE+"</span><span class='name'>"+rccList[i].TCL_NAME+"</span></p></div>";
							}
						}
					    $(".layui-col-sm61 .layui-card-body").append(operHtml);					    
					}
				}catch(e){
					console.log(e);			
				}
			},
			error: function(msg){
				
			}
		});
	}
	function listOrderRightList(tcsCode){
		if(tcsCode==""||tcsCode==null){
			$(".layui-col-sm62 .layui-card-body").find(".item").each(function(){
				var divArr=$(this);
				divArr.attr("style","display:inline-block");
			});
		}else{
			$(".layui-col-sm62 .layui-card-body").find(".item").each(function(){
				var divArr=$(this);
				var tempStr=$(this).find(".num").html();
				var tempStr2=$(this).find(".name").html();
				if(($.trim(tempStr).indexOf(tcsCode))==-1 && ($.trim(tempStr2).indexOf(tcsCode))==-1 ){
					divArr.attr("style","display:none");
				}else{
					divArr.attr("style","display:inline-block");
				}
			});
		}
	}
	$("#searchLeft").click(function(){
		listOrderLeftList();
	});
	$("#searchRight").click(function(){
		var param=$("#paraMap_code2").val();
		listOrderRightList(param);
	});
	function orderAdd(){
		//新增指令
         var url = "${path}dmp/DmpOrderAction_addOrderPage.ms?flag=orderSetPage";     
        $("#mainDiv").css("display","none");
        $("#otherBlock").css("display","block");
        $("#otherBlock").css("height","100%");
        $("#otheriframe").css("min-height","100%");
	    $("#otheriframe").attr("src",url);
 	    
 	    
	}
	function orderEditLeft(){
		//修改指令
	var tcsCode=$(".layui-col-sm61 .layui-card-body .tcsactive").find("span").html();
        var url = "${path}dmp/DmpOrderAction_editOrderPage.ms?flag=orderSetPage&dir=left&paraMap.TCL_CODE="+tcsCode;
        $("#mainDiv").css("display","none");
        $("#otherBlock").css("display","block");
        $("#otherBlock").css("height","100%");
        $("#otheriframe").css("min-height","100%");
	$("#otheriframe").attr("src",url);
	}
	function orderEditRight(){
		//修改指令
	var tcsCode=$(".layui-col-sm62 .layui-card-body .tcsactive").find("span").html();
        var url = "${path}dmp/DmpOrderAction_editOrderPage.ms?flag=orderSetPage&dir=right&paraMap.TCL_CODE="+tcsCode;
        $("#mainDiv").css("display","none");
        $("#otherBlock").css("display","block");
        $("#otherBlock").css("height","100%");
        $("#otheriframe").css("min-height","100%");
	$("#otheriframe").attr("src",url);
	}
	function orderEditLeft2(){
		//修改指令
	var tcsCode=$(".layui-col-sm61 .layui-card-body .active").find("span").html();
	if(tcsCode==null){
	layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
	return false;
	}
        var url = "${path}dmp/DmpOrderAction_editOrderPage.ms?flag=orderSetPage&dir=left&paraMap.TCL_CODE="+tcsCode;
        $("#mainDiv").css("display","none");
        $("#otherBlock").css("display","block");
        $("#otherBlock").css("height","100%");
        $("#otheriframe").css("min-height","100%");
	$("#otheriframe").attr("src",url);
	}
	function orderEditRight2(){
		//修改指令
	var tcsCode=$(".layui-col-sm62 .layui-card-body .active").find("span").html();
	if(tcsCode==null){
	layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
	return false;
	}	
        var url = "${path}dmp/DmpOrderAction_editOrderPage.ms?flag=orderSetPage&dir=right&paraMap.TCL_CODE="+tcsCode;
        $("#mainDiv").css("display","none");
        $("#otherBlock").css("display","block");
        $("#otherBlock").css("height","100%");
        $("#otheriframe").css("min-height","100%");
	$("#otheriframe").attr("src",url);
	}	
	function submitForm(){
	 if(flag1==false){
     layer.msg("<dict:lang value='该指令集代码已存在，请重新输入'/>", {time: 1000, icon:5});
     return false;
     }	 
		if($("#orderSetDto_tcsCode").val()==""){
			$("#orderSetDto_tcsCode").val("");
			layer.msg("<dict:lang value='指令集代码不能为空'/>", {time: 1000, icon:5});
	    	return;
		}
		if($("#orderSetDto_tcsName").val()==""){
			$("#orderSetDto_tcsName").val("");
			layer.msg("<dict:lang value='指令集名称不能为空'/>", {time: 1000, icon:5});
	    	return;
		}
		var remarkVal=$("#orderSetDto_tcsRemark").val();
		var tcsCode = $("#orderSetDto_tcsCode").val();
        var tcsName = $("#orderSetDto_tcsName").val();
        var tcsRemark = $("#orderSetDto_tcsRemark").val();
    	var url = "${path}dmp/OrderSetAction_ordersetModelAdd.ms";
    	var tcsCode=$("#orderSetDto_tcsCode").val();
    	var operHtml = "";
        var i=0;
        var detailList = {};
    	$(".layui-col-sm62 .layui-card-body").find(".item").each(function(i){
			var divArr=$(this);
			var tclCode=$(this).find("span").html();//指令代码
			//operHtml=operHtml+"<input type='text' name='orderSetDetailList["+i+"].tclCode' value='"+tclCode+"' /><input type='text' name='orderSetDetailList["+i+"].tcsCode' value='"+tcsCode+"' />";
			detailList[i] = tclCode;
			operHtml=operHtml+"<input type='text' name='orderSetDetailList' value='"+tclCode+"' />";
			i++;
		});
         
    	$("#orderSetDetailForm").append(operHtml);
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.TCS_CODE":tcsCode,"paraMap.TCS_NAME":tcsName,"paraMap.TCS_REMARK":tcsRemark,"paraMap.orderSetDetailList":JSON.stringify(detailList)},
		success: function(data){
            var result = data.ajaxString;
            if(result=="SUCCESS"){
            	window.history.back();
            	window.location.reload();
            }else{
             	if(result=="FAIL2"){
	             	layer.msg("<dict:lang value='新增失败'/>", {time: 1000, icon:5});
	            }else{
	             	layer.msg("<dict:lang value='新增失败'/>", {time: 1000, icon:5});
	            }
            }
		},
		error: function(msg){
				 console.log(msg);
			}
		});
		//$("#orderSetDetailForm").append(operHtml);
    	//$("#add_form").attr("action",url);
    	//$("#add_form").submit();
    } 
    //校验是否已存在
    var flag1 = true;
    function validateCode(value){
   	  $.post("${path}dmp/OrderSetAction_validateCode.ms",{value:value},function(res){
		    if(res.ajaxMap.state==1){
		    	//$("#orderSetDto_tcsCode").val("");
		    	flag1 = false;
		    	layer.msg("<dict:lang value='该指令集代码已存在，请重新输入'/>", {time: 1000, icon:5});
		    }else{
		        flag1 = true;
		    }
      });
    }
    
    
</script>
<script>
    layui.use(['element','form'], function(){
        var element = layui.element
        
        //点击选中该项
        $('.layui-card-body').on('click','.item',function(){
            $(this).addClass('active').siblings().removeClass('active')
        })

        //鼠标移入添加功能按钮，移开时移除功能按钮
        $('.type1').on('mouseenter','.item',function(e){
            $(this).css('position','relative');
            $(this).addClass('tcsactive').siblings().removeClass('tcsactive');
            e=e||event;
            var X1 = e.pageX
            var Y1 = e.pageY
            var X2 = $(this).offset().left;
            var Y2 = $(this).offset().top;

            var width = $(this).outerWidth() 
            var left = X1-X2-30
            var top = Y1-Y2
            if($(this).parents('.layui-col-sm61').length > 0){
                if(left + 92 >= width){
                    left = width - 92
                }
                var str = '<div class="operates" style="left:' + left + 'px;top:' + top + 'px;width:70px;">\
                                <span class="ico edit" onclick="orderEditLeft();"></span>\
                                <span class="ico toRight"></span>\
                            </div>'
            }else if($(this).parents('.layui-col-sm62').length > 0){
                if(left + 92 >= width){
                    left = width - 92
                }
                var str = '<div class="operates" style="left:' + left + 'px;top:' + top + 'px;width:70px;">\
                                <span class="ico toLeft"></span>\
                                <span class="ico edit"  onclick="orderEditRight();"></span>\
                            </div>'
            }
            
            $(this).append(str)
        })

        $('.type1').on('mouseleave','.item',function(){
            $(this).css('position','static')
            $(this).find('.operates').remove();
        })

        // 动作右移事件
        $('.layui-col-sm61 .type1').on('click','.item .toRight',function(){
            var target = $(this).parents('.group1').find('.layui-col-sm62').find('.type1')
            var item = $(this).parents('.item').attr('style','').removeClass('active')
            $(this).parents('.operates').remove()
            $(item).appendTo($(target))
            return false
        })
        $('.layui-col-sm61 .layui-card-header').on('click','.toRight',function(){
            var target = $(this).parents('.group1').find('.layui-col-sm62').find('.type1')
            var item = $(this).parents('.layui-card').find('.item.active').attr('style','').removeClass('active')
            $(item).appendTo($(target))
            return false
        })

        // 动作左移事件
        $('.layui-col-sm62 .type1').on('click','.item .toLeft',function(){
            var target = $(this).parents('.group1').find('.layui-col-sm61').find('.type1')
            var item = $(this).parents('.item').attr('style','').removeClass('active')
            $(this).parents('.operates').remove()
            $(item).appendTo($(target))
            return false
        })
        $('.layui-col-sm62 .layui-card-header').on('click','.toLeft',function(){
            var target = $(this).parents('.group1').find('.layui-col-sm61').find('.type1')
            var item = $(this).parents('.layui-card').find('.item.active').attr('style','').removeClass('active')
            $(item).appendTo($(target))
            return false
        })

    });
    //otherDiv 操作相关
    function display1(){
    		$("#mainDiv").css("display","block");
    		$("#otherBlock").css("display","none");
    	}
    function addorderListFromSet(map,type,flag){   	
    	var key = map.TCL_CODE;
        var val = map.TCL_NAME;    	 
    	if(flag=="left"){
    	if(type=="1"){  //新增  	
	    	$(".layui-col-sm61 .layui-card .layui-card-body ").prepend("<div class='item' style='position: relative;'><p><span class='num'>"+key+"</span><span class='name' >"+key+" "+val+"</span></p></div>");
    	}else if(type=="2"){ //修改
    		$(".layui-col-sm61 .layui-card-body .active").remove();
    		$(".layui-col-sm61 .layui-card-body ").prepend("<div class='item' style='position: relative;'><p><span class='num'>"+key+"</span><span class='name' >"+key+" "+val+"</span></p></div>");
    	}
    	}else if(flag=="right"){
    		$(".layui-col-sm62 .layui-card-body .active").remove();
    		$(".layui-col-sm62 .layui-card-body").prepend("<div class='item' style='position: relative;'><p><span class='num'>"+key+"</span><span class='name' >"+key+" "+val+"</span></p></div>");
    	}
    	
   		 
    }
    function comeback(){
    var index = layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
    window.history.back();
    layer.close(index);
    }
</script>
</body>
</html>