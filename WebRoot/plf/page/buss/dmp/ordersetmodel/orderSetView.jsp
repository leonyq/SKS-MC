<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title><dict:lang value="指令集信息查看"/></title>
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
          height: 50%;
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
    <div class="layui-fluid" style="padding-bottom:78px;overflow: auto;">
        <div class="headline"><dict:lang value="查看" /></div>
        <form id="edit_form" class="layui-form" name="editForm" action="" method="post">
            <div id="orderSetDetailForm" style="display:none;">
    			
            </div>
            <div class="layui-row">
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="指令集代码" /></div>
                    <div class="search_r">
                        <input type="text" placeholder="指令集代码" readonly="readonly" class="layui-input" name="orderSetDto.tcsCode" id="orderSetDto_tcsCode" value="${dataMap.TCS_CODE}"   >
                    </div>
                </div>
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="指令集名称" /></div>
                    <div class="search_r">
                        <input type="text" placeholder="指令集名称" readonly="readonly"  class="layui-input" name="orderSetDto.tcsName" id="orderSetDto_tcsName"  value="${dataMap.TCS_NAME}">
                    </div>
                </div>
                <div class="searchItem" style="width:100%">
                    <div class="search_l"><dict:lang value="备注信息" /></div>
                    <div class="search_r">
                        <input  readonly="readonly" style="height:38px;padding:8px;"  class="layui-input"  name="orderSetDto.tcsRemark" id="orderSetDto_tcsRemark" value="${dataMap.TCS_REMARK}"  />
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
	                              <!--  <div class="filter">
	                                    <input type="text"  id="paraMap_code" name="paraMap.TCL_CODE" placeholder="这是搜索用的" >
	                                </div> -->
                                <div class="btns">
                                   <!--  <span class="ico search" id="searchLeft"></span>
                                     <span class="ico add"></span>
                                    <span class="ico edit"></span>
                                    <span class="ico toRight"></span>-->
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
                               <!-- <div class="filter">
                                    <input type="text"  id="paraMap_code2" name="paraMap.TCL_CODE" placeholder="这是搜索用的" >
                                </div> -->
                                <div class="btns">
                                    <!--<span class="ico search" id="searchRight"></span>
                                     <span class="ico edit"></span>
                                    <span class="ico toLeft"></span> -->
                                </div>
                            </div>
                        </div>
                        <div class="layui-card-body type1"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ptop_10">
        	<button type="button" class="layui-btn" id="addButten" onclick="preAdd()"><dict:lang value="新增"/></button> 
        	<button type="button" class="layui-btn" id="editButten" onclick="preEdit()"><dict:lang value="编辑"/></button>   
            <button class="layui-btn layui-btn-danger" onclick="backListPage()" type="button"><dict:lang value="取消" /></button>   
        </div> 
    </div>
 

<script>
<%-- 异步加载指令列表数据 --%>
	listOrderLeftList();
	listOrderLeftRight();
	function listOrderLeftList(){
		var url = "${path}dmp/OrderSetAction_getOrderListForEdit.ms";
		var param=$("#paraMap_code").val();
		var param2=$("#orderSetDto_tcsCode").val();
		var formData = {"paraMap.TCL_CODE":param,"paraMap.TCS_CODE":param2};//form.serialize($("#searchForm1"));
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
	
	function listOrderLeftRight(){
		var url = "${path}dmp/OrderSetAction_getOrderListForEditRight.ms";
		//var param=$("#paraMap_code").val();
		var param2=$("#orderSetDto_tcsCode").val();
	
		var formData = {"paraMap.TCS_CODE":param2};//form.serialize($("#searchForm1"));
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: formData,
			success: function(data){
				$(".layui-col-sm62 .layui-card-body").html("");
				var operHtml = "";
				try{
					if(null !=data.ajaxList){	
					    var rccList=data.ajaxList;
						for(var i=0;i<rccList.length;i++){
							operHtml=operHtml+"<div class='item'><p><span class='num'>"+rccList[i].TCL_CODE+"</span><span class='name'>"+rccList[i].TCL_NAME+"</span></p></div>";
						}
					    $(".layui-col-sm62 .layui-card-body").append(operHtml);					    
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
				var tempStr=$(this).find("span").html();
				if(!($.trim(tempStr)==tcsCode)){
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
        //var url = "${path}dmp/DmpAction_preAlgorithModelAdd.ms";
 	    //window.location.href= url;
	}
	function orderEdit(tscCode){
		//修改指令
        //var url = "${path}dmp/DmpAction_preAlgorithModelAdd.ms";
 	    //window.location.href= url;
	}
	$("#add").click(function(){
		orderAdd();
	});
	$("#edit").click(function(){
		var tscCode=$(".layui-card-body .active").find("span").html();
		orderEdit(tscCode);
	});
	function submitForm(){
		if($("#orderSetDto_tcsCode").val()==""){
			$("#orderSetDto_tcsCode").val("");
	    	layer.msg("指令集代码不能为空");
	    	return;
		}
    	var url = "${path}dmp/OrderSetAction_ordersetModelAdd.ms";
    	var tcsCode=$("#orderSetDto_tcsCode").val();
    	var operHtml = "";
        var i=0;
    	$(".layui-col-sm62 .layui-card-body").find(".item").each(function(){
			var divArr=$(this);
			var tclCode=$(this).find("span").html();//指令代码
			operHtml=operHtml+"<input type='text' name='orderSetDetailDto["+i+"].tclCode' value='"+tclCode+"' /><input type='text' name='orderSetDetailDto["+i+"].tcsCode' value='"+tcsCode+"' />";
			i++;
		});
		$("#orderSetDetailForm").append(operHtml);
    	$("#edit_form").attr("action",url);
    	$("#edit_form").submit();
    } 
    //校验是否已存在
    function validateCode(value){
   	  $.post("${path}dmp/OrderSetAction_validateCode.ms",{value:value},function(res){
		    if(res.ajaxMap.state==1){
		    	$("#orderSetDto_tcsCode").val("");
		    	layer.msg("该指令集代码已存在，请重新输入");
		    }
      });
    }
    
    function preAdd(){
        var url = "${path}dmp/OrderSetAction_preOrderSetModelAdd.ms";
 	    window.location.href= url;
    }
    
    function preEdit(){
        var url = "${path}dmp/OrderSetAction_preOrderSetModelEdit.ms?paraMap.tcsCode="+$("#orderSetDto_tcsCode").val()+"&returnType=edit";
 	    window.location.href= url;
    }
    
    function backListPage(){
        var index = layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
    	var url = "${path}dmp/OrderSetAction_getOrderSetModel.ms?FUNC_CODE=F_2704e59a41f64756bb0be83d557b4d5e";
 	    window.location.href= url;
 	    layer.close(index);
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
        /*$('.type1').on('mouseenter','.item',function(e){
            $(this).css('position','relative')
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
                                <span class="ico edit"></span>\
                                <span class="ico toRight"></span>\
                            </div>'
            }else if($(this).parents('.layui-col-sm62').length > 0){
                if(left + 92 >= width){
                    left = width - 92
                }
                var str = '<div class="operates" style="left:' + left + 'px;top:' + top + 'px;width:70px;">\
                                <span class="ico toLeft"></span>\
                                <span class="ico edit"></span>\
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
        })*/

    });
</script>
</body>
</html>