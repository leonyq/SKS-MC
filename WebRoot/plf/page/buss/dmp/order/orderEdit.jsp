<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title><dict:lang value="指令信息-修改"/></title>
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
 	.layui-form-item {
	 margin-bottom: 10px;
	}
	.headline{
	 margin-bottom: 10px;
	}
 </style>
</head>
<body>
    <div class="layui-fluid" style="padding:0px;" id="mainDiv">
        <div class="layui-tab layui-tab-brief" lay-filter="nav">
        <div class="headline" style="width:100px;height:30px;float:left;margin-left:16px;margin-top:10px;"><dict:lang value="修改"/></div>
            <ul class="layui-tab-title" style="text-align:right;">
                <li id="baseInfo" class="layui-this"><dict:lang value="基本信息"/></li>
                <li id="setting"><dict:lang value="配置"/></li>
                <li id="setInfo"><dict:lang value="配置信息"/></li>
            </ul>
            <div class="layui-tab-content"  style="padding-bottom:78px;">
                <div class="layui-tab-item layui-show" lay-filter='tab1' style="">
                    <form class="layui-form" lay-filter='baseInfo' id="addForm"  action="${path}dmp/DmpOrderAction_orderAdd.ms" method="post">
                        <div class="layui-form-item">
                            <div class="list-left"><span class="Eng">*</span><dict:lang value="指令代码"/></div>
                            <div class="list-right">
                                <div class="pane">
                                    <input type="text" disabled placeholder="<dict:lang value="指令代码"/>" id="paraMap_code" name="paraMap.TCL_CODE" value="${dataMap.TCL_CODE}" maxlength="30" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="list-left"><span class="Eng">*</span><dict:lang value="指令名称"/></div>
                            <div class="list-right">
                                <div class="pane">
                                    <input type="text" placeholder="<dict:lang value="指令名称"/>" id="paraMap_name" name="paraMap.TCL_NAME" value="${dataMap.TCL_NAME}" maxlength="30" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="list-left"><span class="Eng">*</span><dict:lang value="指令类型"/></div>
                            <div class="list-right">
                             <div id="typeDiv" style="display:none;">
                     <select lay-search  name="paraMap.TOA_CLASSIFY" id="paraMap_toaType">
                     <c:forEach items="${dataMap.ACT_TYPE}" var="item">
                     <option value="${item.ACTIONTYPE_CODE}">${item.ACTIONTYPE_NAME}</option>
                     </c:forEach>
                     </select>	
                     <select lay-search  name="paraMap.ALGORITH_MODEL_TYPE" id="paraMap_algModelType">
                     <c:forEach items="${dataMap.ALG_TYPE}" var="item">
                     <option value="${item.MODELTYPE_CODE}">${item.MODELTYPE_NAME}</option>
                     </c:forEach>
                     </select>	                     
                            </div>
                        <div class="pane" style="position:relative" >
                    <div class="layui-form" lay-filter="pane1" style="position:absolute;float:left;" id="ordertype0" >                     
                     <select lay-search  name="paraMap.TCL_CLASSIFY" id="paraMap_tclClassify">
                     <c:set var="typeval" value="${dataMap.TCL_CLASSIFY}"></c:set>
                     
                     <option  value=""><dict:lang value="--请选择--"/></option>
                     <c:forEach items="${dataMap.ORDER_TYPE}" var="item">
                     <c:if test="${item.COMMANDTYPE_CODE==typeval}"><option selected value="${item.COMMANDTYPE_CODE}">${item.COMMANDTYPE_NAME}</option></c:if>
                     <c:if test="${item.COMMANDTYPE_CODE!=typeval}"><option value="${item.COMMANDTYPE_CODE}">${item.COMMANDTYPE_NAME}</option></c:if>
                     </c:forEach>
                     </select>	
                    </div>
                    <div class="layui-form" style="position:absolute;float:right;right:164px;top:0px;">
                    <button  type="button" class="layui-btn addOrderType"  ><dict:lang value="新增"/></button>
                    </div>
                     </div>                             
                            </div>
                        </div>
                     <!--   <div class="layui-form-item">
                            <div class="list-left"><dict:lang value="指令集"/></div>
                            <div class="list-right">
                                <div class="pane">
                                    <select id="commandSet" name="paraMap.COMMANDSET">
                                        <option value=""><dict:lang value="--请选择--"/></option>
                                    </select>
                                </div>
                            </div>
                        </div> -->  
                        <div class="layui-form-item">
                            <div class="list-left"><dict:lang value="备注信息"/></div>
                            <div class="list-right">
                                <div class="pane">
                                    <input style="height:38px;padding:8px;"  maxlength="200" id="paraMap_memo" name="TCL_REMARK" value="${dataMap.TCL_REMARK}"  class="layui-input"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="layui-tab-item layui-tab-item-config ">
                    <div class="config">
                        <div class="layui-row group1">
                            <div class="layui-col-sm6 layui-col-sm61">
                                <div class="layui-card">
                                    <div class="layui-card-header">
                                        <span class="tit"><dict:lang value="待选动作"/></span>
                                        <div class="operates">
                                            <div class="filter">
                                                <span class="icon"></span>
                                                <input type="text" placeholder="<dict:lang value="请输入动作(编码/名称)"/>" id="actSearch">
                                                <ul class="activeul">
                                                   
                                                </ul>
                                            </div>
                                            <ul class="layui-nav">
                                                <li class="layui-nav-item">
                                                    <a href="javascript:;"><dict:lang value="操作"/></a>
                                                    <dl class="layui-nav-child">
                                                        <dd><dict:lang value="查询"/></dd>
                                                        <dd class="activeAdd"><dict:lang value="增加"/></dd>
                                                        <dd class="actEdit"><dict:lang value="修改"/></dd>
                                                        <dd class="toRight"><dict:lang value="右移"/></dd>
                                                    </dl>
                                                </li>
                                            </ul>
                                            <div class="btns">
                                               <!--   <span class="ico search"  onclick="actsrico()"></span> -->
                                                <span class="ico add activeAdd"></span>
                                                <span class="ico edit actEdit2 "></span>
                                                <span class="ico toRight"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="layui-card-body type1 activeList">
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-sm6 layui-col-sm62">
                                <div class="layui-card">
                                    <div class="layui-card-header"><span class="tit"><dict:lang value="已选动作" /></span></div>
                                    <div class="layui-card-body type2">
				    
                                        <div id="drag" ></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-row group2">
                            <div class="layui-col-sm6 layui-col-sm61">
                                <div class="layui-card">
                                    <div class="layui-card-header">
                                        <span class="tit"><dict:lang value="待选模型"/></span>
                                        <div class="operates">
                                            <div class="filter">
                                                <span class="icon"></span>
                                                <input type="text" placeholder="<dict:lang value="请输入模型(编码/名称)"/>" id="algSearch">
                                                <ul class="algorithmul">
                                                </ul>
                                            </div>
                                            <ul class="layui-nav">
                                                <li class="layui-nav-item">
                                                    <a href="javascript:;"><dict:lang value="操作"/></a>
                                                    <dl class="layui-nav-child">
                                                        <dd><dict:lang value="查询"/></dd>
                                                        <dd class="algorithmAdd"><dict:lang value="增加"/></dd>
                                                        <dd class="algEdit"><dict:lang value="修改"/></dd>
                                                        <dd class="code"><dict:lang value="代码"/></dd>
                                                        <dd class="toRight"><dict:lang value="右移"/></dd>
                                                    </dl>
                                                </li>
                                            </ul>
                                            <div class="btns">
                                             <!--   <span class="ico search"  onclick="algsrico()"></span>-->  
                                                <span class="ico add algorithmAdd"></span>
                                                <span class="ico edit algEdit2"></span>
                                                <span class="ico code2"></span>
                                                <span class="ico toRight"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="layui-card-body type1 algorithmList">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-sm6 layui-col-sm62">
                                <div class="layui-card">
                                    <div class="layui-card-header"><span class="tit"><dict:lang value="已选模型"/></span><span><dict:lang value="当前动作"/>:<span class="selectAct"></span></span>  
                                        <div class="operates">
                                            <span class="ico toLeft"></span>
                                            <span class="ico edit algEdit3"></span>
                                            <span class="ico code3"></span>
                                        </div>
                                    </div>
                                    <div class="layui-card-body type3" id="drag2"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="configDiv">
                        <div class="hiddenBtn"></div>
                        <form class="layui-form">
                            <div class="tit"><dict:lang value="动作类型"/></div>
                            <div class="box">
                                <input type="hidden" id="preAct" value="">
                                <input type="checkbox" lay-skin="primary" lay-filter="lastAction"  title="<dict:lang value="最后动作"/>" id="lastAction"  class="checkAction" value="A">
                                <input type="checkbox" lay-skin="primary" lay-filter="exitOrder" title="<dict:lang value="退出指令"/>" id="exitOrder"  class="checkAction" value="B">
                            </div>
                            <div class="tit"><dict:lang value="参数保存方式"/></div>
                            <div class="box">
                                <input type="radio" name="saveWay" id="orderSet" class="radioAction" value="01" title="<dict:lang value="指令集"/>" checked="">
                                <input type="radio" name="saveWay" id="oneOrder" class="radioAction" value="02" title="<dict:lang value="指令"/>">
                                <input type="radio" name="saveWay" id="loopToLast" class="radioAction" value="03" title="<dict:lang value="循环到最后动作"/>" >
                                <input type="radio" name="saveWay" id="lastAction2" class="radioAction" value="04" title="<dict:lang value="最后动作"/>">
                            </div>
                            <div class="tit"><dict:lang value="分支动作"/></div>
                            <div class="box">
                                <select class="actions" lay-filter="otherAction" id="actions">
                                    <option value=""></option>
                                </select>
                            </div>
                            <div class="tit"><dict:lang value="动作操作流程码"/></div>
                            <div class="box flowbox">
                                <div class="flowCode">
                                    <input type="text" class="layui-input" id="flowcode1">
                                    <div class="gt"></div>
                                    <div class="selectBox">
                                        <select class="actions" id="actions1"  lay-filter="actions1" >
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="flowCode">
                                    <input type="text" class="layui-input" id="flowcode2">
                                    <div class="gt"></div>
                                    <div class="selectBox">
                                        <select class="actions" id="actions2"  lay-filter="actions2">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="flowCode">
                                    <input type="text" class="layui-input" id="flowcode3">
                                    <div class="gt"></div>
                                    <div class="selectBox">
                                        <select class="actions"  id="actions3"  lay-filter="actions3">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="flowCode">
                                    <input type="text" class="layui-input" id="flowcode4">
                                    <div class="gt"></div>
                                    <div class="selectBox">
                                        <select class="actions"  id="actions4"  lay-filter="actions4">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                                 <div class="flowCode">
                                    <input type="text" class="layui-input"  id="flowcode5">
                                    <div class="gt"></div>
                                    <div class="selectBox">
                                        <select class="actions"   id="actions5"  lay-filter="actions5">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="flowCode">
                                    <input type="text" class="layui-input" id="flowcode6">
                                    <div class="gt"></div>
                                    <div class="selectBox">
                                        <select class="actions"   id="actions6"  lay-filter="actions6">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>                                                                                               
                            </div>
                        </form>
                    </div>
                    <div class="showBtn"></div>
                </div>
 <!-- 指令配置信息  -->
 <div class='layui-tab-item tab-setInfo'></div>
            </div>
        </div>     
        
        <div class="ptop_10">
            <button class="layui-btn" onclick="saveInfo();"><dict:lang value="保存"/></button>   
            <button class="layui-btn layui-btn-danger"  onclick="comeback();"><dict:lang value="取消"/></button>   
        </div> 
    </div>
    <div id="otherBlock"  >
 						<iframe id="otheriframe" name="otheriframe" frameBorder="0"							
								src=""  scrolling="auto" style="border-right: 1px;width: 100%;height: 0px;" >
						</iframe>       
    </div>
 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script> 
<script src="${path}/plf/page/bussmodel/dmp/js/Sortable.min.js"></script><!-- 拖拽插件 -->
<script>

    var form;
    layui.use(['form','element'], function(){
        var element = layui.element;
            form = layui.form; 
            form.render(); 
        // tab切换事件
         element.on('tab(tab1)', function(data){
             //createSel();           
         });
///////////////////指令类型操作
               var str = '<span class="operates" style="width:70px;">\
                            <span class="ico edit "></span>\
                        </span>'
       function menter(){//鼠标移入事件      
	   $(".layui-form-select .layui-anim dd").on("mouseenter",function(e){
	        var typeCode = $(this).attr("lay-value");
	        var typeName = $(this).text();	
            var str = '<div class="operates" style="width:70px;position:relative;float:right;">\
                            <span class="ico edit typeEdit " style="position:absolute;right:20px;top:3px;"></span>\
                            <span class="ico close typeDel "style="position:absolute;right:-5px;top:3px;"></span>\
                        </div>'              
	       		if(typeCode!=""){
	          $(this).append(str); 
	        }
	var typeStr2 = '            <div style="margin-top:30px;"><div class="layui-form-item">\
                <div class="list-left" style="margin-left:-25px;"><span class="Eng">*</span><dict:lang value="编码"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="hidden" id="oldType" value="'+typeCode+'">\
                        <input type="text" value="'+typeCode+'"  placeholder="<dict:lang value="请输入指令类型编码"/>"    maxlength="33"  class="layui-input" name="typeCode" id="typeCode" >\
                    </div>\
                </div>\
            </div>\
                                   <div class="layui-form-item">\
                <div class="list-left" style="margin-left:-25px;"><span class="Eng">*</span><dict:lang value="名称"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="text" value="'+typeName+'"  placeholder="<dict:lang value="请输入指令类型名称"/>"    maxlength="33"  class="layui-input" name="typeName" id="typeName" >\
                    </div>\
                </div>\
            </div>\
            </div>\
             <div class="ptop_10" style="z-index:1000" >\
              <button type="button" class="layui-btn editTypeSave" lay-filter="filterSubmit" ><dict:lang value="保存"/></button>\
             <button type="button" class="view layui-btn layui-btn-danger quit"><dict:lang value="取消"/></button>\
                    </div>';
    //修改图标事件	       
	$('.typeEdit').on('click',function(){
               layer.open({//修改弹窗
                title: '<dict:lang value="指令类型-修改"/>',
                skin: 'layui-layer-molv',
                area: ['390px','250px'],
                type: 1, 
                id: 'layerDemo', //防止重复弹出
                content: typeStr2,
		scrollbar: false,
                shade: 0.3 
            });
    //弹窗按钮事件
	//修改保存
	$('.editTypeSave').on('click',function(){
	var oldTypeCode = $('#oldType').val();
    var typeCode = $('#typeCode').val();
    var typeName = $('#typeName').val();
    if(typeCode==""){
    layer.msg("<dict:lang value='指令类型编码不能为空'/>", {time: 1000, icon:5});
    return false;
    }
    if(typeName==""){
    layer.msg("<dict:lang value='指令类型名称不能为空'/>", {time: 1000, icon:5});
    return false;
    }    
    optOrderType("edit",oldTypeCode,typeCode,typeName);
                if(optFlag==false){
                return false;
                }    
    $('#paraMap_tclClassify option').each(function(){
                  if($(this).val()==oldTypeCode){
                   $(this).remove();
                   return false;
                  }
    })    
    $('#paraMap_tclClassify').append('<option selected value="'+typeCode+'">'+typeName+'</option>');
    form.render(null,'pane1');
    menter();
    mleave();  
    $('.layui-layer-close').click();	
	})	
	//取消
	$('.quit').on('click',function(){
	$('.layui-layer-close').click();
	}) 	
	}) 	
	//删除图标事件
    $('.typeDel').on('click',function(){
           	var item = layer.open({
                title: '<dict:lang value="摩尔提示"/>',
                skin: 'layui-layer-molv',
                btn: ['<dict:lang value="确定"/>', '<dict:lang value="取消"/>'],
                yes: function(index, layero){
                optOrderType("del",typeCode,typeCode,typeName);
                 if(optFlag==false){
                layer.close(item);
                return false;
                }               
                $('#paraMap_tclClassify option').each(function(){
                  if($(this).val()==typeCode){
                   $(this).remove();
                   return false;
                  }
                })
               form.render(null,'pane1');
               menter();
               mleave();                    
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
       };		  
       function mleave(){//鼠标移除事件
       $(".layui-form-select .layui-anim dd").on("mouseleave",function(e){
            $(this).find('.operates').remove();
        })	         
       };
       menter();
       mleave();	 
	//指令类型的新增   
	var typeStr = '            <div style="margin-top:30px;"><div class="layui-form-item">\
                <div class="list-left" style="margin-left:-25px;"><span class="Eng">*</span><dict:lang value="编码"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="text"  placeholder="<dict:lang value="请输入指令类型编码"/>"    maxlength="33"  class="layui-input" name="typeCode" id="typeCode" >\
                    </div>\
                </div>\
            </div>\
                                   <div class="layui-form-item">\
                <div class="list-left" style="margin-left:-25px;"><span class="Eng">*</span><dict:lang value="名称"/></div>\
                <div class="list-right">\
                    <div class="pane">\
                        <input type="text"  placeholder="<dict:lang value="请输入指令类型名称"/>"    maxlength="33"  class="layui-input" name="typeName" id="typeName" >\
                    </div>\
                </div>\
            </div>\
            </div>\
             <div class="ptop_10" style="z-index:1000" >\
              <button type="button" class="layui-btn addTypeSave"  lay-filter="filterSubmit" ><dict:lang value="保存"/></button>\
             <button type="button" class="view layui-btn layui-btn-danger quit" ><dict:lang value="取消"/></button>\
                    </div>';
	$('.addOrderType').on('click',function(){
               layer.open({//新增弹窗
                title: '<dict:lang value="指令类型-新增"/>',
                skin: 'layui-layer-molv',
                area: ['390px','250px'],
                type: 1, 
                id: 'layerDemo', //防止重复弹出
                content: typeStr,
		scrollbar: false,
                shade: 0.3 
            });
    //弹窗按钮事件
	//新增保存
	$('.addTypeSave').on('click',function(){
    var typeCode = $('#typeCode').val();
    var typeName = $('#typeName').val();
    if(typeCode==""){
    layer.msg("<dict:lang value='指令类型编码不能为空'/>", {time: 1000, icon:5});
    return false;
    }
    if(typeName==""){
    layer.msg("<dict:lang value='指令类型名称不能为空'/>", {time: 1000, icon:5});
    return false;
    }  
    optOrderType("add","",typeCode,typeName);
                if(optFlag==false){
                return false;
                }    
    $('#paraMap_tclClassify').append('<option selected value="'+typeCode+'">'+typeName+'</option>');
    form.render(null,'pane1');
    menter();
    mleave();  
    $('.layui-layer-close').click();	
	})
	//取消
	$('.quit').on('click',function(){
	$('.layui-layer-close').click();
	})      	
	}) 		         
         //createSel();
         /*function createSel(){
                    $(".layui-select-title .layui-input").on("keyup",function(e){  	 
	         if($(".layui-select-none").length==1){
	         	$(".layui-select-none").remove();
	         	$(".layui-anim .layui-anim-upbit").empty();

	         	$("#creatAndEdit").remove();
			    $(".layui-anim.layui-anim-upbit").append("<a id='creatAndEdit' style='cursor:pointer;' onclick='creatAndEdit()'><dict:lang value='创建与编辑'/>          "+$(".layui-select-title .layui-input").val()+"</a>");
	         }else{
	         	$("#creatAndEdit").remove();
	         }
		  });
		  $(".layui-select-title .layui-input").on("focus",function(e){
		  	$("#creatAndEdit").remove();
		  }); 
         }*/
  var actopt={};//存放单个act的操作
  //控件监听事件
  form.on('checkbox(lastAction)', function(data){//监听checkbox点击事件
  var actId = $("#drag .active").attr("id");
  var checkState = data.elem.checked;
  var checkVal = data.value;
  if(checkState==true){
  actopt["lastAction"] = checkVal;
  }else{
  actopt["lastAction"] = "";
  }
      }); 
  form.on('checkbox(exitOrder)', function(data){//监听checkbox点击事件
  var actId = $("#drag .active").attr("id");
  var checkState = data.elem.checked;
  var checkVal = data.value;
  if(checkState==true){
  actopt["exitOrder"] = checkVal;
  }else{
  actopt["exitOrder"] = "";
  }
      });       
 form.on('radio', function(data){
  var actId = $("#drag .active").attr("id");
  var radioVal = data.value;
  actopt["radio"] = radioVal;
}); 
form.on('select(otherAction)', function(data){
  var actId = $("#drag .active").attr("id");
  var selectVal = data.value;
  actopt["otherAction"] = selectVal;
}); 
form.on('select(actions1)', function(data){
  var actId = $("#drag .active").attr("id");
  var selectVal = data.value;
  actopt["actions1"] = selectVal;
});
form.on('select(actions2)', function(data){
  var actId = $("#drag .active").attr("id");
  var selectVal = data.value;
  actopt["actions2"] = selectVal;
});
form.on('select(actions3)', function(data){
  var actId = $("#drag .active").attr("id");
  var selectVal = data.value;
  actopt["actions3"] = selectVal;
});
form.on('select(actions4)', function(data){
  var actId = $("#drag .active").attr("id");
  var selectVal = data.value;
  actopt["actions4"] = selectVal;
});
form.on('select(actions5)', function(data){
  var actId = $("#drag .active").attr("id");
  var selectVal = data.value;
  actopt["actions5"] = selectVal;
});
form.on('select(actions6)', function(data){
  var actId = $("#drag .active").attr("id");
  var selectVal = data.value;
  actopt["actions6"] = selectVal;
});   
$('.flowCode').on('blur','#flowcode1',function(){
  var actId = $("#drag .active").attr("id");
  var inputVal = $('#flowcode1').val();
  actopt["flowcode1"] = inputVal;
})  
$('.flowCode').on('blur','#flowcode2',function(){
  var actId = $("#drag .active").attr("id");
  var inputVal = $('#flowcode2').val();
  actopt["flowcode2"] = inputVal;
}) 
$('.flowCode').on('blur','#flowcode3',function(){
  var actId = $("#drag .active").attr("id");
  var inputVal = $('#flowcode3').val();
  actopt["flowcode3"] = inputVal;
}) 
$('.flowCode').on('blur','#flowcode4',function(){
  var actId = $("#drag .active").attr("id");
  var inputVal = $('#flowcode4').val();
  actopt["flowcode4"] = inputVal;
}) 
$('.flowCode').on('blur','#flowcode5',function(){
  var actId = $("#drag .active").attr("id");
  var inputVal = $('#flowcode5').val();
  actopt["flowcode5"] = inputVal;
}) 
$('.flowCode').on('blur','#flowcode6',function(){
  var actId = $("#drag .active").attr("id");
  var inputVal = $('#flowcode6').val();
  actopt["flowcode6"] = inputVal;
}) 
        //获取已选动作的id
        function getAction(){
            
            var actid =  $('#drag .active').attr('id');
            var preact =$("#preAct").val();
            var objArray = $('#drag .item').not('.active');                       
            var str = "<option value=''></option>";
            //（除选中项）渲染到右侧下拉框
            $.each(objArray,function(index,item){
                var jug = $(item).find('.num').find('.TOA_KEY').val();
                if(jug!="COMMANDINIT"){
                   str += '<option>' + $(item).find('.num').text() + '</option>'
                } 
                //$(item).find('.num').text() 获取id 
                //$(item).find('.name').text() 获取名称
            })
            $('.actions').html(str)
            //初始化选择控件
        var actOpt = localStorage.getItem("ACTOPT_"+actid);
        if(preact!=actid){
          $("#preAct").val(actid);
          actopt={};
          if(actOpt=="null"){//未绑定，初始化
          $('.checkAction').prop('checked',false); 
          $('#orderSet').prop('checked',true);   //选择第一个指令集选中    
          $('.flowCode .layui-input').val("");
          $('.actions').val("");
          getActionParam(actid);
          }else{//已绑定，渲染相关信息
          var actOptArr = eval("("+actOpt+")");
          var lastAction = actOptArr["lastAction"];
          var exitOrder = actOptArr["exitOrder"]; 
          var radio = actOptArr["radio"];
          var otherAction = actOptArr["otherAction"];
          var actions1 = actOptArr["actions1"];
          var actions2 = actOptArr["actions2"];
          var actions3 = actOptArr["actions3"];
          var actions4 = actOptArr["actions4"];
          var actions5 = actOptArr["actions5"];
          var actions6 = actOptArr["actions6"];
          var flowcode1 = actOptArr["flowcode1"];
          var flowcode2 = actOptArr["flowcode2"];
          var flowcode3 = actOptArr["flowcode3"];
          var flowcode4 = actOptArr["flowcode4"];
          var flowcode5 = actOptArr["flowcode5"];
          var flowcode6 = actOptArr["flowcode6"];          
          actopt["lastAction"]=lastAction;
          actopt["exitOrder"]=exitOrder;
          actopt["radio"]=radio;
          actopt["otherAction"]=otherAction;
          actopt["actions1"]=actions1;
          actopt["actions2"]=actions2;
          actopt["actions3"]=actions3;
          actopt["actions4"]=actions4;
          actopt["actions5"]=actions5;
          actopt["actions6"]=actions6;
          actopt["flowcode1"]=flowcode1;
          actopt["flowcode2"]=flowcode2;
          actopt["flowcode3"]=flowcode3;
          actopt["flowcode4"]=flowcode4;
          actopt["flowcode5"]=flowcode5;
          actopt["flowcode6"]=flowcode6;         
          if(lastAction=="A"){$('#lastAction').prop('checked',true)}else{$('#lastAction').prop('checked',false)};
          if(exitOrder=="B"){$('#exitOrder').prop('checked',true)}else{$('#exitOrder').prop('checked',false)};
          if(radio=="01"){
          $('#orderSet').prop('checked',true); 
          }else if(radio=="02"){
          $('#oneOrder').prop('checked',true); 
          }else if(radio=="03"){
          $('#loopToLast').prop('checked',true); 
          }else if(radio=="04"){
          $('#lastAction2').prop('checked',true); 
          }
          $('#actions').val(otherAction);
          $('#actions1').val(actions1);
          $('#actions2').val(actions2);
          $('#actions3').val(actions3);
          $('#actions4').val(actions4);
          $('#actions5').val(actions5);
          $('#actions6').val(actions6);
          $('#flowcode1').val(flowcode1);
          $('#flowcode2').val(flowcode2);
          $('#flowcode3').val(flowcode3);
          $('#flowcode4').val(flowcode4);
          $('#flowcode5').val(flowcode5);
          $('#flowcode6').val(flowcode6);       
          }       
        }
          element.render();
          form.render();             
        }
          //右侧栏动作信息暂存      
        $(".configDiv").on('mouseleave',function(){
        var actid =  $('#drag .active').attr('id');
        localStorage.setItem("ACTOPT_"+actid,JSON.stringify(actopt));
        })
        //点击选中该项
        $('.layui-card-body').on('click','.actItem',function(){
            $(this).addClass('active').siblings().removeClass('active');
            $(this).addClass('actActive').siblings().removeClass('actActive');
            if($(this).parents('#drag').length > 0){
                getAction()
            }
        })
       $('.layui-card-body').on('click','.algItem',function(){
            $(this).addClass('active').siblings().removeClass('active');
            $(this).addClass('algActive').siblings().removeClass('algActive');
            if($(this).parents('#drag').length > 0){
                getAction()
            }
        })
        //鼠标移入添加功能按钮，移开时移除功能按钮
        $('.type1').on('mouseenter','.item',function(e){
            $(this).css('position','relative')
            e=e||event;
            var X1 = e.pageX
            var Y1 = e.pageY
            var X2 = $(this).offset().left;
            var Y2 = $(this).offset().top;

            var width = $(this).outerWidth() 
            var left = X1-X2-30
            var top = Y1-Y2
            
            if($(this).parents('.group1').length > 0){
                if(left + 92 >= width){
                    left = width - 92
                }
                var str = '<div class="operates" style="left:' + left + 'px;top:' + top + 'px;width:70px;">\
                            <span class="ico edit actEdit"></span>\
                            <span class="ico toRight"></span>\
                        </div>'
            }else if($(this).parents('.group2').length > 0){
                if(left + 127 >= width){
                    left = width - 127
                }
                var str = '<div class="operates" style="left:' + left + 'px;top:' + top + 'px;width:105px;">\
                            <span class="ico edit algEdit"></span>\
                            <span class="ico code"></span>\
                            <span class="ico toRight"></span>\
                        </div>'
            }
            
            $(this).append(str)
        })

        $('.type3').on('mouseenter','.item',function(e){
            $(this).css('position','relative')
            e=e||event;
            var X1 = e.pageX
            var Y1 = e.pageY
            var X2 = $(this).offset().left;
            var Y2 = $(this).offset().top;

            var width = $(this).outerWidth() 
            var left = X1-X2-30
            var top = Y1-Y2-5

            if(left + 127 >= width){
                left = width - 127
            }
            var str = '<div class="operates" style="left:' + left + 'px;top:' + top + 'px;width:105px;">\
                        <span class="ico toLeft"></span>\
                        <span class="ico edit algEdit"></span>\
                        <span class="ico code"></span>\
                    </div>'

            $(this).append(str)
        })

        $('.type1,.type3').on('mouseleave','.item',function(){
            $(this).css('position','static')
            $(this).find('.operates').remove();
        })
        //————左右移动事件————
        // 动作右移事件
        $('.group1 .type1').on('click','.item .toRight',function(){
            var target = $(this).parents('.group1').find('#drag')
            var item = $(this).parents('.item').removeClass('active')
            var actId = item.attr("id");//标识      
            localStorage.setItem("ACT2_"+actId,localStorage.getItem("ACT_"+actId));             
            localStorage.removeItem("ACT_"+actId); //从本地内存中清除    
            actLocalsLen--;
            delete actCodeMap[actId];
            $(this).parents('.operates').attr('style','').html('<span class="ico toLeft"></span><span class="ico edit actEdit"></span>')
            $(item).appendTo($('#drag'))
            getAction()
            return false
        })
        $('.group1 .layui-card-header').on('click','.toRight',function(){
            var target = $(this).parents('.group1').find('#drag')
            var item = $(this).parents('.layui-card').find('.item.active').attr('style','').removeClass('active')
            var actId = item.attr("id");//标识      
            localStorage.removeItem("ACT_"+actId); //从本地内存中清除     
            actLocalsLen--;
            delete actCodeMap[actId];                       
            $(item).append('<div class="operates">\
                        <span class="ico toLeft"></span>\
                        <span class="ico edit actEdit"></span>\
                    </div>')
            $(item).appendTo($('#drag'))
            getAction()
            return false
        })       
        // 动作左移事件
        $('.group1 .type2').on('click','.item .toLeft',function(){
            var target = $(this).parents('.group1').find('.type1')
            var item = $(this).parents('.item').removeClass('active')
            var actId = item.attr("id");//标识,动作id      
            localStorage.setItem("ACT_"+actId,localStorage.getItem("ACT2_"+actId));             
            localStorage.removeItem("ACT2_"+actId); //从本地内存中清除    
            localStorage.setItem("ACTOPT_"+actId,null);
            localStorage.setItem("HASNO_"+actId,JSON.stringify(algCodeMap));
            localStorage.setItem("HAS_"+actId,null);
            actLocalsLen++;
            actCodeMap[actId] = actId;          
            $(this).parents('.operates').remove()
            $(item).appendTo($(target))
            getAction()
            return false
        })
        //过滤模拟下拉框事件
        $('.filter .icon').click(function(){
            $(this).parents('.filter').toggleClass('filter_open')
            return false
        })
        $('.filter').on('click','li',function(){
            $(this).toggleClass('active')
            return false
        })

        //侧栏相关
        $('.showBtn').click(function(){
        var len = $("#drag .active").length;
        if(len==0){
        layer.msg("<dict:lang value='请选择一条已选动作'/>", {time: 1000, icon:5});
        return false;
        }
            $('.layui-tab-item-config').addClass('showConfigDiv')
        })
        $('.hiddenBtn').click(function(){
            $('.layui-tab-item-config').removeClass('showConfigDiv')
        })

        
        $(document).click(function(){
            $('.filter').removeClass('filter_open') //点击任意地方收起过滤下拉框
        })
    function getCommandSet(){
	    var url = "${path}dmp/DmpOrderAction_fetchCommandSet.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: "",
	success: function(data){
              var commandSetMap = data.ajaxMap.item;
              for(var i=0;i<commandSetMap.length;i++){              
                 var key = commandSetMap[i].TCS_CODE;
                 var val = commandSetMap[i].TCS_NAME;
                 $("#commandSet").append("<option value='"+key+"'>"+val+"</option>");
              }     
                 //form.render();
			},
	error: function(msg){
				
			}
		});        
        }
   function getActionParam(toaCode){
            var tclCode = $("#paraMap_code").val();
    	    var url = "${path}dmp/DmpOrderAction_fetchActParam.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.TOA_CODE":toaCode,"paraMap.TCL_CODE":tclCode},
	success: function(data){
                 var resList1 = data.ajaxMap.item[0];//动作参数相关
		 var resList2 = data.ajaxMap.item[1];//动作流程码相关
		 var flowCount = 1;
                 for(var i=0;i<resList1.length;i++){
		     var actType = resList1[0].TCA_TYPE;//已选动作
                     var errAction = resList1[0].TCA_ERR_ACTION;//分支动作
		     var paraType = resList1[0].TCA_PARA_TYPE;//参数保存方式
		     if(actType=="A|B"){
                     actopt["lastAction"] = "A";
		     actopt["exitOrder"] = "B";
                     $('#lastAction').prop('checked',true);
		     $('#exitOrder').prop('checked',true);
		     }else if(actType=="A"){
                     actopt["lastAction"] = "A";
		     actopt["exitOrder"] = null; 
                     $('#lastAction').prop('checked',true);
		     $('#exitOrder').prop('checked',false);		     
		     }else if(actType=="B"){
                     actopt["lastAction"] = null;
		     actopt["exitOrder"] = "B";
                     $('#lastAction').prop('checked',false);
		     $('#exitOrder').prop('checked',true);
		     }else{
                     actopt["lastAction"] = null;
		     actopt["exitOrder"] = null;
                     $('#lastAction').prop('checked',false);
		     $('#exitOrder').prop('checked',false);
		     }
                     actopt["radio"] = paraType;
		      if(paraType=="01"){
                       $('#orderSet').prop('checked',true); 
                       }else if(paraType=="02"){
                       $('#oneOrder').prop('checked',true); 
                       }else if(paraType=="03"){
                       $('#loopToLast').prop('checked',true); 
                       }else if(paraType=="04"){
                       $('#lastAction2').prop('checked',true); 
                      }
		     actopt["otherAction"] = errAction;
		     $('#actions').val(errAction);
		 }
		 for(var i=0;i<resList2.length;i++){
		  var flowCode = resList2[i].TCAF_FLOW_CODE;
		  var nextFlow = resList2[i].TCAF_NEXT_FLOW; 
                  actopt["flowcode"+flowCount] = flowCode;
		  actopt["actions"+flowCount] = nextFlow;
                  $('#flowcode'+flowCount).val(flowCode);
		  $('#actions'+flowCount).val(nextFlow);
		  flowCount++;
		 }
		 localStorage.setItem("ACTOPT_"+toaCode,JSON.stringify(actopt));    
                 form.render();

			},
	error: function(msg){
				
			}
		});   
    }

           
        $(function(){
            getCommandSet();
            getActiveType();
            getActiveData("","");
            getSysActiveData();
            getAlgorithmType();
            getAlgorithmData();
			
            // 允许拖拽

	    


            var drag = document.getElementById("drag");
            var drag2 = document.getElementById("drag2");
            Sortable.create(drag, {
                animation: 200, 
                handle: ".item", 
                draggable: ".item", 
                onUpdate: function (evt){
                    var item = evt.item; 
                }
            });

            Sortable.create(drag2, {
                animation: 200, 
                handle: ".item", 
                draggable: ".item", 
                onUpdate: function (evt){
                    var item = evt.item; 
                }
            });
            
        })
        // 配置相关JS
	          
  
      function getActiveType(){
       $("#paraMap_toaType option").each(function(){
       if($(this).val()!=""){
       var li = $(this).text();
       var val = $(this).val();
       $(".activeul").append("<li>"+li+"</li><input type='hidden' value='"+val+"' />");      
       }
      });
      //form.render();     
      }
     function getAlgorithmType(){
       $("#paraMap_algModelType option").each(function(){
       if($(this).val()!=""){
       var li = $(this).text();
       var val = $(this).val();
      $(".algorithmul").append("<li>"+li+"</li><input type='hidden' value='"+val+"' />");      
       }      
      });
      //form.render();     
      }
                //配置信息显示相关JS
        $("#setInfo").on('click',function(){
        
        $(".tab-setInfo").empty();
        var setOrderName = $("#paraMap_name"
        ).val();
        var actLen = $("#drag .actItem").length;
        var actInfo = "";
        var algInfo = "";
        var flowInfo = "";
        var headInfo = "<div class='headline' style='border:none;margin-bottom: 5px;'>"+
        "<span class='set'></span><span id='setOrderName'>"+setOrderName+"</span>"+
        "</div>";
        var actSetInfo = "";
        var selcAct = {};
        var selcAlg = {};
        $("#drag .actItem").each(function(i){//选取已配置动作

           selcAct["code_"+i] = $(this).find(".TOA_KEY").val();
           selcAct["name_"+i] = $(this).find(".TOA_NAME").val();
           selcAct["param_"+i] = $(this).find(".TOA_PARAM").val();
           selcAct["classify_"+i] = $(this).find(".TOA_CLASSIFY").val();
        });
        $("#setting").click();
        for(var i=0;i<actLen;i++){
        algInfo = "";
        flowInfo = "FlowCode: ";
        if(selcAct["param_"+i]=="null") selcAct["param_"+i]=" ";
        if(selcAct["classify_"+i]=="null") selcAct["classify_"+i]=" ";
        actInfo = "("+selcAct["code_"+i]+")"+" "+ selcAct["name_"+i]+" "+ selcAct["param_"+i]+" "+ selcAct["classify_"+i];
        var actCode = selcAct["code_"+i];//动作代码
        var hasAlg = eval("("+localStorage.getItem("HAS_"+actCode)+")");
        var actOptArr = eval("("+localStorage.getItem("ACTOPT_"+actCode)+")");
        for(var mkey2 in hasAlg){
         var oneAlg2 =  JSON.parse(localStorage.getItem("ALG_"+mkey2));
         var key = oneAlg2.WPL_CODE;
         var val = oneAlg2.WPL_NAME;
         algInfo = algInfo + "<p id='setAlgName'>"+"("+key+")"+" "+val+"</p>";
	    }  
	    if(actOptArr!=null){
	    if(actOptArr["radio"]=="01"){
	    actOptArr["radio"]="<dict:lang value="指令集"/>";
	    }else if(actOptArr["radio"]=="02"){
	    actOptArr["radio"]="<dict:lang value="指令"/>";
	    }else if(actOptArr["radio"]=="03"){
	    actOptArr["radio"]="<dict:lang value="循环到最后动作"/>";
	    }else if(actOptArr["radio"]=="04"){
	    actOptArr["radio"]="<dict:lang value="最后动作"/>";
	    }else{
	    actOptArr["radio"]="";
	    }
	    if(actOptArr["lastAction"]=="A"){
	    actOptArr["lastAction"]="<dict:lang value="最后动作"/>";
	    }else{
	    actOptArr["lastAction"]="";
	    }
	    if(actOptArr["exitOrder"]=="B"){
	    actOptArr["exitOrder"]="<dict:lang value="退出指令"/>";
	    }else{
	    actOptArr["exitOrder"]="";
	    }
	    if(actOptArr["otherAction"]==null){actOptArr["otherAction"]="";} 	    
	    if((actOptArr["lastAction"]!="" && actOptArr["exitOrder"]!="") && (actOptArr["lastAction"]!=null && actOptArr["exitOrder"]!=null)){
	    actInfo =actInfo + " " + actOptArr["lastAction"] + "|" + actOptArr["exitOrder"] + " " + actOptArr["radio"]  + " " + actOptArr["otherAction"];
	    }else{
	    actInfo =actInfo + " " + actOptArr["lastAction"] + actOptArr["exitOrder"] + " " + actOptArr["radio"]  + " " + actOptArr["otherAction"];
	    }	    
	    }	          
         for(var j=1;j<7;j++){
           if(actOptArr!= null && typeof(actOptArr["flowcode"+j])!="undefined" &&  actOptArr["flowcode"+j]!=""&&  actOptArr["flowcode"+j]!=null){
           flowInfo = flowInfo + actOptArr["flowcode"+j] + "-"+ actOptArr["actions"+j]+" ";
           }
           
         }         
    
        actSetInfo = actSetInfo +
        "<div class='layui-collapse'>"+
        "<div class='layui-colla-item'>"+
        "<h2 class='layui-colla-title'><span id='setActName'>"+actInfo+"</span></h2>"+
        "<div class='layui-colla-content  layui-show'>"+
        ""+algInfo+""+
        "</div>"+
        "<div class='layui-colla-font'><span id='setFlowCode'>"+flowInfo+"</span></div>"+
        "</div>"+
        "</div>";
        }
        $(".tab-setInfo").append(""+       
        headInfo
        +
        actSetInfo 
        +    
        ""
        );
        element.render(); 
        })        
      //动作点击事件
           
    })
    ////////////////// layui绑定事件之外
    //动作
        	 $(".activeul").on('click','li',function(){
         setTimeout(function (){ 
          searchActLocalStorage($("#actSearch").val());  
         }, 200);
	 });
    	 $(".algorithmul").on('click','li',function(){
         setTimeout(function (){ 
           var searchArry =$("#algSearch").val();
           var len = $("#drag .active").length;
           if(len==0){
           searchAlgLocalStorage(searchArry);
           }else{
           searchAlgLocalStorageByAct(searchArry)
           }	
         }, 200);
	 });   
    $(".activeAdd").click(function(){	    
		activeAdd();
	 });
        //加载动作新增页面
      function activeAdd(){			
        var url = "${path}dmp/DmpMotionAction_preMotionModelAdd.ms?flag=orderSetting";       
        $("#mainDiv").css("display","none");
		$("#otherBlock").css("display","block");
        $("#otherBlock").css("height","100%");
        $("#otheriframe").css("min-height","100%");
	    $("#otheriframe").attr("src",url);
      }   
     $(".group1").on('click','.actEdit',function(){
        var len = $(".actActive").length;
         var id = $(this).parents(".actActive").attr("id");  
        id=$("#id_"+id).val();	
        if(len==0){
        layer.msg("<dict:lang value='请选择一条记录'/>", {time: 1000, icon:5});
        return false;
        }   
         var dir = "";
        if($(this).parents(".layui-card-body").hasClass("type1")){
        dir="left";
        }else{
        dir="right";
        }          	    
		activeEdit(id,dir);
	 });
    $(".group1").on('click','.actEdit2',function(){
        var len = $(".group1 .layui-col-sm61 .active").length;
        var id = $(".activeList .active").attr("id"); 
        id=$("#id_"+id).val();	
        if(len==0){
        layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
        return false;
        } 
         var dir = "";
        if($(this).parents(".layui-card-body").hasClass("type1")){
        dir="left";
        }else{
        dir="right";
        }            	    
		activeEdit(id,dir);
	 });	 
      //加载动作编辑页面
      function activeEdit(id,dir){			
        var url = "${path}dmp/DmpMotionAction_preMotionModelEdit.ms?flag=orderSetting&paraMap.id="+id+"&dir="+dir;//?paraMap.UP_ID="+$("#up_id").val()+"&paraMap.typeFlag="+$("#typeFlag").val()+"&paraMap.mcIframeName="+window.parent.name;
        $("#mainDiv").css("display","none");
		$("#otherBlock").css("display","block");
        $("#otherBlock").css("height","100%");
        $("#otheriframe").css("min-height","100%");
	    $("#otheriframe").attr("src",url);
      }
      //算法模型新增
     $(".algorithmAdd").click(function(){	    
		algorithmAdd();
	 });
	 //加载算法新增页面
      function algorithmAdd(){			
        var url = "${path}dmp/DmpAction_preAlgorithModelAdd.ms?flag=orderSetting";
        $("#mainDiv").css("display","none");
		$("#otherBlock").css("display","block");
        $("#otherBlock").css("height","100%");
        $("#otheriframe").css("min-height","100%");
	    $("#otheriframe").attr("src",url);
      }
      //模型修改
    $(".group2").on('click','.algEdit',function(){
        var len = $(".algActive").length;
        if(len==0){
        layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
        return false;
        }     	    
        var id = $(this).parents(".algItem").attr("id");     
        id=$("#id_"+id).val();	    
		algorithmEdit(id);
	 });
	    $(".group2").on('click','.algEdit2',function(){
        var len = $(".group2 .layui-col-sm61 .algActive").length;
        if(len==0){
        layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
        return false;
        } 
        var id = $(".algorithmList .active").attr("id");          
        id=$("#id_"+id).val();	    
		algorithmEdit(id);
	 });
   $(".group2").on('click','.algEdit3',function(){
        var len = $(".group2 .layui-col-sm62 .active").length;
        if(len==0){
        layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
        return false;
        } 
        var id = $("#drag2 .active").attr("id");          
        id=$("#id_"+id).val();	    
		algorithmEdit(id);
	 });		 
	  //加载算法编辑页面   
      function algorithmEdit(id){		
          var url = "${path}dmp/DmpAction_preAlgorithModelEdit.ms?flag=orderSetting&paraMap.id="+id;//?paraMap.UP_ID="+$("#up_id").val()+"&paraMap.typeFlag="+$("#typeFlag").val()+"&paraMap.mcIframeName="+window.parent.name;
         $("#mainDiv").css("display","none");
		 $("#otherBlock").css("display","block");
        $("#otherBlock").css("height","100%");
        $("#otheriframe").css("min-height","100%");
	    $("#otheriframe").attr("src",url);
      }
	 //模型代码编辑
    $(".group2").on('click','.code',function(){
        var len = $(".algActive").length;
        if(len==0){
        layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
        return false;
        }     	    
		var code =$(this).parents(".algItem").attr("id");      
        var id=$("#id_"+code).val();
		
		toCodeView(id,code);
	 });
	   $(".group2").on('click','.code2',function(){
        var len = $(".group2 .layui-col-sm61 .algActive").length;
        if(len==0){
        layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
        return false;
        }  
		var code = $(".algorithmList .active").attr("id");   
        var id=$("#id_"+code).val();
		
		toCodeView(id,code);
	 });  
   $(".group2").on('click','.code3',function(){
        var len = $(".group2 .layui-col-sm62 .algActive").length;
        if(len==0){
        layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
        return false;
        }  
		var code = $("#drag2 .active").attr("id");   
        var id=$("#id_"+code).val();
		
		toCodeView(id,code);
	 }); 	 	 	 
	 function toCodeView(id,code){
     	$.post("${path}dmp/DmpAction_isHaveSourceCode.ms",{code:code},function(res){
  		    if(res.ajaxMap.state==1){
  		    	layer.msg("<dict:lang value='未找到该模型源码'/>", {time: 1000, icon:5});
  		    }else{
  		        algorithmCodeEdit(id,code);
  		    }
        });
    }
      function algorithmCodeEdit(id,code){			
          var url = "${path}dmp/DmpAction_preAlgorithModelSourceCode.ms?flag=orderSetting&paraMap.id="+id+"&paraMap.code="+code;//?paraMap.UP_ID="+$("#up_id").val()+"&paraMap.typeFlag="+$("#typeFlag").val()+"&paraMap.mcIframeName="+window.parent.name;
         $("#mainDiv").css("display","none");
          $("#otherBlock").css("display","block");
        $("#otherBlock").css("height","100%");
        $("#otheriframe").css("min-height","100%");
	    $("#otheriframe").attr("src",url);
      } 
      //算法模型相关JS
      //将动作显示于算法上方
      var algarr = {};
      var algarr2 = {};      
      function showActTitle(obj){
      var selectId = $("#"+obj.id).parent().attr("id");  
      if(selectId=="drag"){
      var selcAct = $("#"+obj.id).find(".toaVal").text();
      $(".selectAct").text(selcAct);  
      buildActClickEvent(obj.id);   
      }
      }      
      //点击已选动作，绑定动作和算法的索引数组0000
      function buildActClickEvent(id){
         $(".algorithmList").empty();
         $("#drag2").empty();
         var hasNo = localStorage.getItem("HASNO_"+id);
         if(hasNo=="null" || hasNo==null){//初始未绑定 ,绑定      
         //初始化左右窗口 	 
         getAlgorithmDataByAction(id);
         getAlgorithmDataByAction2(id);
         }else{//已绑定过
         var hasNoAlg = eval("("+localStorage.getItem("HASNO_"+id)+")");           
         var hasAlg = eval("("+localStorage.getItem("HAS_"+id)+")");                
         //显示未选模型
         var hasNoAlgStr = "";  
         algarr = {};     
         for(var mkey in hasNoAlg){
 
         var oneAlg =  JSON.parse(localStorage.getItem("ALG_"+mkey));
  
         var key = oneAlg.WPL_CODE;
         var val = oneAlg.WPL_NAME;
		 var id = oneAlg.ID;
         algarr[key] = key;	
         hasNoAlgStr = hasNoAlgStr +
         "<div class='item algItem'  id='"+key+"'><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>";
         }
         $(".algorithmList").append(hasNoAlgStr);
         //显示已选模型
         var hasAlgStr = "";
         algarr2 = {};
         for(var mkey2 in hasAlg){
         var oneAlg2 =  JSON.parse(localStorage.getItem("ALG_"+mkey2));
         var key = oneAlg2.WPL_CODE;
         var val = oneAlg2.WPL_NAME;
         var id = oneAlg2.ID;
         algarr2[key] = key;
         
         hasAlgStr = hasAlgStr +
         "<div class='item algItem'  id='"+key+"'><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>";
         }
         $("#drag2").append(hasAlgStr);         
         }
         
      }


	 //模型右移事件
    $(".group2").on('click','.toRight',function(){
        var len = $("#drag .active").length;
        if(len==0){
        layer.msg("<dict:lang value='请选择一条已选动作'/>", {time: 1000, icon:5});
        return false;
        }else{
            var target = $(this).parents('.group2').find('.type3')
            var item = $(this).parents('.item').attr('style','').removeClass('active')
            var algId = "";//标识，算法id
            algId = item.attr("id");
            if(typeof(algId)=="undefined"){
            algId = $(".algorithmList .active").attr("id");
            }	        
	        var clickActId = $("#drag .active").attr("id");
	        delete algarr[algId];
	        algarr2[algId] = algId;
 	        localStorage.setItem("HASNO_"+clickActId,JSON.stringify(algarr));
            localStorage.setItem("HAS_"+clickActId,JSON.stringify(algarr2));                       
            //$(this).parents('.operates').remove()
            $(item).appendTo($(target))
            var target = $(this).parents('.group2').find('.type3')
            var item = $(this).parents('.layui-card').find('.item.active').attr('style','').removeClass('active')
            $(item).appendTo($(target))
            return false
        }     	    
		
	 });	
	 //模型左移事件 	
    $(".group2").on('click','.toLeft',function(){
        var len = $("#drag .active").length;
        if(len==0){
        layer.msg("<dict:lang value='请选择一条已选动作'/>", {time: 1000, icon:5});
        return false;
        }else{
            var target = $(this).parents('.group2').find('.type1')
            var item = $(this).parents('.item').attr('style','').removeClass('active')
	        var algId = item.attr("id");//标识,算法id  
	        if(typeof(algId)=="undefined"){
	        algId = $("#drag2 .active").attr("id");
	        }    
  	        var clickActId = $("#drag .active").attr("id"); 	        
	        delete algarr2[algId];
	        algarr[algId] = algId;       
 	        localStorage.setItem("HASNO_"+clickActId,JSON.stringify(algarr));
            localStorage.setItem("HAS_"+clickActId,JSON.stringify(algarr2));             
            //$(this).parents('.operates').remove()
            $(item).appendTo($(target))
            var target = $(this).parents('.group2').find('.type1')
            var item = $(this).parents('.layui-card').find('.item.active').attr('style','').removeClass('active')
            $(item).appendTo($(target))
            return false
        }     	    		
	 });		  

       //查询条件绑定事件
       $("#actSearch").keyup(function(){
            actsrico();
        });
        $("#algSearch").keyup(function(){
            algsrico();          
        }); 
		function actsrico(){
           var searchArry = "";
           searchArry =$("#actSearch").val();
           searchActLocalStorage(searchArry);		
		}
		function algsrico(){
          var searchArry = "";
           searchArry =$("#algSearch").val();
           var len = $("#drag .active").length;
           if(len==0){
           searchAlgLocalStorage(searchArry);
           }else{
           searchAlgLocalStorageByAct(searchArry)
           }		
		}  
        //搜索动作本地缓存
        function searchActLocalStorage(searchStr){
           $(".activeList").empty();
           for(var mkey in actCodeMap){           
             
              var oneAct = JSON.parse(localStorage.getItem("ACT_"+mkey));
                 var key = oneAct.TOA_CODE;
                 var val = oneAct.TOA_NAME;
                 var actParam = oneAct.TOA_PARAM_CODE; 
                 var classify = oneAct.TOA_CLASSIFY;
				  var id = oneAct.ID; 
                 //判断是否筛选类别
                 if((val != null && val.indexOf(searchStr) != -1) ||(key!=null && key.indexOf(searchStr) != -1 )   ){
                 //var slecount = 0;
                 var slecount = $(".activeul").find(".active").length;
                 if(slecount==0){
                 $(".activeList").append("<div class='item actItem' id='"+key+"' onclick='showActTitle(this)'><p><span class='num toaKey'><input type='hidden' value='"+key+"' id='"+key+"' class='TOA_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='TOA_NAME' /><input type='hidden' value='"+id+"' id='id_"+key+"' class='TOA_ID'/><input type='hidden' value='"+classify+"' id='actclassify_"+key+"' class='TOA_CLASSIFY'/><input type='hidden' value='"+actParam+"' id='actParam_"+key+"' class='TOA_PARAM'/>"+key+"</span><span class='name toaVal' id='name_"+key+"'>"+val+"</span></p></div>");                   
                 }else{//勾选了类别
                 $(".activeul li").each(function(){
                   if($(this).hasClass('active')){
                     var selcclassify = $(this).next("input").val();
                     if(classify==selcclassify){
                        $(".activeList").append("<div class='item actItem' id='"+key+"' onclick='showActTitle(this)'><p><span class='num toaKey'><input type='hidden' value='"+key+"' id='"+key+"' class='TOA_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='TOA_NAME' /><input type='hidden' value='"+id+"' id='id_"+key+"' class='TOA_ID'/><input type='hidden' value='"+classify+"' id='actclassify_"+key+"' class='TOA_CLASSIFY'/><input type='hidden' value='"+actParam+"' id='actParam_"+key+"' class='TOA_PARAM'/>"+key+"</span><span class='name toaVal' id='name_"+key+"'>"+val+"</span></p></div>");                     
                     }
                  }
                 });                   
                 }                         
             }
           }

           
        }
                //搜索算法本地缓存（未点击动作）
        function searchAlgLocalStorage(searchStr){
           $(".algorithmList").empty();                  
           for(var mkey in algCodeMap){                       
              var oneAlg = JSON.parse(localStorage.getItem("ALG_"+mkey));
                 var key = oneAlg.WPL_CODE;
                 var val = oneAlg.WPL_NAME;
                 var classify = oneAlg.WPL_TYPE;
				 var id = oneAlg.ID;
                 if(searchStr==null){
                $(".algorithmList").append("<div class='item algItem'  id='"+key+"'><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>"); 
                 }else{
                  if((val != null && val.indexOf(searchStr) != -1) ||(key!=null && key.indexOf(searchStr) != -1 ) ){
                 //判断是否筛选类别
                 //
                 var slecount = $(".algorithmul").find(".active").length;
                 if(slecount==0){
                 $(".algorithmList").append("<div class='item algItem'  id='"+key+"'><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>");
                 }else{//勾选了类别
                 $(".algorithmul li").each(function(){
                   if($(this).hasClass('active')){
                     var selcclassify = $(this).next("input").val();
                     if(classify==selcclassify){
                        $(".algorithmList").append("<div class='item algItem' id='"+key+"'><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>");                     
                     }
                  }
                 });                   
                 }                         
             }                
                 }
           }

           
        }
                        //搜索算法本地缓存（点击了动作）
        function searchAlgLocalStorageByAct(searchStr){
           $(".algorithmList").empty();
           var clickActId = $("#drag .active").attr("id");//动作id
           var hasNoAlg = eval("("+localStorage.getItem("HASNO_"+clickActId)+")"); 
           for(var mkey in hasNoAlg){           
             
              var oneAlg = JSON.parse(localStorage.getItem("ALG_"+mkey));
                 var key = oneAlg.WPL_CODE;
                 var val = oneAlg.WPL_NAME;
                 var classify = oneAlg.WPL_TYPE;
				 var id = oneAlg.ID;
                 if((val != null && val.indexOf(searchStr) != -1) ||(key!=null && key.indexOf(searchStr) != -1 )){
                 //判断是否筛选类别
                 //
                 var slecount = $(".algorithmul").find(".active").length;
                 if(slecount==0){
                 $(".algorithmList").append("<div class='item algItem'  id='"+key+"'><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>");
                 }else{//勾选了类别
                 $(".algorithmul li").each(function(){
                   if($(this).hasClass('active')){
                     var selcclassify = $(this).next("input").val();
                     if(classify==selcclassify){
                        $(".algorithmList").append("<div class='item algItem' id='"+key+"'><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>");                     
                     }
                  }
                 });                   
                 }                         
             }
           }

           
        }
       //动作数据获取
        var actLocalsLen = 0;//全局变量，统计act在localstorage里的item（未选项）
        var actCodeMap = {};//全局变量，统计act的code（未选项）
       function getActiveData(searchStr,type){

	    var url = "${path}dmp/DmpOrderAction_fetchActive.ms";
	    var searchArry = "";
	    var tclCode = $("#paraMap_code").val();
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.TOA_CODE":searchStr,"paraMap.TOA_CLASSIFY":searchArry,"paraMap.TOA_TYPE":type,"paraMap.PAGE_TYPE":"EDIT","paraMap.TCL_CODE":tclCode},
	success: function(data){
              var commandSetMap = data.ajaxMap.item;   
              actLocalsLen =  commandSetMap.length;                    
              $(".activeList").empty();
              for(var i=0;i<commandSetMap.length;i++){
                 localStorage.setItem("ACT_"+commandSetMap[i].TOA_CODE,JSON.stringify(commandSetMap[i]));
                 localStorage.setItem("ACT2_"+commandSetMap[i].TOA_CODE,null);  
                 localStorage.setItem("HAS_"+commandSetMap[i].TOA_CODE,null);
                 localStorage.setItem("HASNO_"+commandSetMap[i].TOA_CODE,null); 
                 localStorage.setItem("ACTOPT_"+commandSetMap[i].TOA_CODE,null);
                 actCodeMap[commandSetMap[i].TOA_CODE] = commandSetMap[i].TOA_CODE;                               
                 var key = commandSetMap[i].TOA_CODE;
                 var val = commandSetMap[i].TOA_NAME;
                 var toatype = commandSetMap[i].TOA_CLASSIFY;
                 var actParam = commandSetMap[i].TOA_PARAM_CODE;    
				 var id = commandSetMap[i].ID; 
                 $(".activeList").append("<div class='item actItem' id='"+key+"' onclick='showActTitle(this)'><p><span class='num toaKey'><input type='hidden' value='"+key+"' id='"+key+"' class='TOA_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='TOA_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='TOA_ID'/><input type='hidden' value='"+toatype+"' id='actclassify_"+key+"' class='TOA_CLASSIFY'/><input type='hidden' value='"+actParam+"' id='actParam_"+key+"' class='TOA_PARAM'/>"+key+"</span><span class='name toaVal' id='name_"+key+"'>"+val+"</span></p></div>");      
              }  
                                         
			},
	error: function(msg){
				
			}
		});        
        }          
         //系统动作数据获取
       function getSysActiveData(){

	    var url = "${path}dmp/DmpOrderAction_fetchSysActive.ms";
        var tclCode = $("#paraMap_code").val();
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.PAGE_TYPE":"EDIT","paraMap.TCL_CODE":tclCode},
	success: function(data){
              var commandSetMap = data.ajaxMap.item;
              $("#drag").empty();
              for(var i=0;i<commandSetMap.length;i++){              
                 var key = commandSetMap[i].TOA_CODE;
                 var val = commandSetMap[i].TOA_NAME;
                 var toatype = commandSetMap[i].TOA_CLASSIFY;
                 var actParam = commandSetMap[i].TOA_PARAM_CODE;
				 var id = commandSetMap[i].ID; 
                 localStorage.setItem("ACT2_"+commandSetMap[i].TOA_CODE,JSON.stringify(commandSetMap[i]));
                 localStorage.setItem("HAS_"+commandSetMap[i].TOA_CODE,null);
                 localStorage.setItem("HASNO_"+commandSetMap[i].TOA_CODE,null); 
                 localStorage.setItem("ACTOPT_"+commandSetMap[i].TOA_CODE,null);
                 if(commandSetMap[i].TOA_TYPE=="A"){
                 $("#drag").append("<div class='item actItem' id='"+key+"' onclick='showActTitle(this)'><p><span class='num toaKey'><input type='hidden' value='"+key+"' id='"+key+"' class='TOA_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='TOA_NAME' /> <input type='hidden' value='"+id+"' id='id_"+key+"' class='TOA_ID'/><input type='hidden' value='"+toatype+"' id='actclassify_"+key+"' class='TOA_CLASSIFY'/><input type='hidden' value='"+actParam+"' id='actParam_"+key+"' class='TOA_PARAM'/>"+key+"</span><span class='name toaVal' id='name_"+key+"'>"+val+"</span></p></div>");
                 }else{
                 $("#drag").append("<div class='item actItem' id='"+key+"' onclick='showActTitle(this)'><p><span class='num toaKey'><input type='hidden' value='"+key+"' id='"+key+"' class='TOA_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='TOA_NAME' /> <input type='hidden' value='"+id+"' id='id_"+key+"' class='TOA_ID'/><input type='hidden' value='"+toatype+"' id='actclassify_"+key+"' class='TOA_CLASSIFY'/><input type='hidden' value='"+actParam+"' id='actParam_"+key+"' class='TOA_PARAM'/>"+key+"</span><span class='name toaVal' id='name_"+key+"'>"+val+"</span></p><div class='operates'><span class='ico toLeft'></span><span class='ico edit actEdit'></span></div></div>");
                 }
                  getActionParam2(commandSetMap[i].TOA_CODE);                  
              }   
              initActToAlg();  
			},
	error: function(msg){
				
			}
		});        
        }  
		//
		function initActToAlg(){
        $("#drag .actItem").each(function(){
		var actcode = $(this).attr("id");
		initActForAlg(actcode);
		});		
		}
        //算法数据获取
        var algLocalsLen = 0;//全局变量，统计act在localstorage里的item（未选项）
        var algCodeMap = {};//全局变量，统计act的code（未选项）        
       function getAlgorithmData(searchStr){
       	    var searchArry = "";
       	    var tclCode = $("#paraMap_code").val();
	    var url = "${path}dmp/DmpOrderAction_fetchAlgorithm.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.WPL_CODE":searchStr,"paraMap.WPL_TYPE":searchArry,"paraMap.PAGE_TYPE":"EDIT","paraMap.TCL_CODE":tclCode},
	success: function(data){
	          $(".algorithmList").empty();
              var commandSetMap = data.ajaxMap.item;
              for(var i=0;i<commandSetMap.length;i++){
                 algLocalsLen =  commandSetMap.length;  
                 localStorage.setItem("ALG_"+commandSetMap[i].WPL_CODE,JSON.stringify(commandSetMap[i])); 
                 algCodeMap[commandSetMap[i].WPL_CODE] = commandSetMap[i].WPL_CODE;                                          
                 var key = commandSetMap[i].WPL_CODE;
                 var val = commandSetMap[i].WPL_NAME;
				 var id = commandSetMap[i].ID;
                 $(".algorithmList").append("<div class='item algItem' id='"+key+"' ><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>");
                 
              }     
                 
			},
	error: function(msg){
				
			}
		});        
        }  
		// 初始化
		function initActForAlg(toaCode){
            algarr2 = {};
       	    var tclCode = $("#paraMap_code").val();
	    var url = "${path}dmp/DmpOrderAction_fetchAlgorithm2.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
		async:false,
	    url: url,
	    data: {"paraMap.TOA_CODE":toaCode,"paraMap.PAGE_TYPE":"EDIT2","paraMap.TCL_CODE":tclCode},
	success: function(data){
	          $("#drag2").empty();
              var commandSetMap = data.ajaxMap.item;
              for(var i=0;i<commandSetMap.length;i++){                                        
                 var key = commandSetMap[i].WPL_CODE;
                 var val = commandSetMap[i].WPL_NAME;
		 var id = commandSetMap[i].ID;
                 algarr2[key] = key;
                 //$("#drag2").append("<div class='item algItem' id='"+key+"' ><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>");
                 
              }   
              localStorage.setItem("HAS_"+toaCode,JSON.stringify(algarr2));  
			},
	error: function(msg){
				
			}
		});        
        } 
         //通过动作获取算法数据(未选)
       function getAlgorithmDataByAction(toaCode){
           algarr = {};
         var tclCode = $("#paraMap_code").val();
	    var url = "${path}dmp/DmpOrderAction_fetchAlgorithm2.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.TOA_CODE":toaCode,"paraMap.PAGE_TYPE":"EDIT1","paraMap.TCL_CODE":tclCode},
	success: function(data){
	          $(".algorithmList").empty();
              var commandSetMap = data.ajaxMap.item;
              for(var i=0;i<commandSetMap.length;i++){                                        
                 var key = commandSetMap[i].WPL_CODE;
                 var val = commandSetMap[i].WPL_NAME;
				 var id = commandSetMap[i].ID;
                 algarr[key] = key;
                 $(".algorithmList").append("<div class='item algItem' id='"+key+"' ><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>");
                 
              }     
              localStorage.setItem("HASNO_"+toaCode,JSON.stringify(algarr));  
			},
	error: function(msg){
				
			}
		});        
        } 
        //通过动作获取算法数据(已选)1111
       function getAlgorithmDataByAction2(toaCode){
            algarr2 = {};
       	    var tclCode = $("#paraMap_code").val();
	    var url = "${path}dmp/DmpOrderAction_fetchAlgorithm2.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.TOA_CODE":toaCode,"paraMap.PAGE_TYPE":"EDIT2","paraMap.TCL_CODE":tclCode},
	success: function(data){
	          $("#drag2").empty();
              var commandSetMap = data.ajaxMap.item;
              for(var i=0;i<commandSetMap.length;i++){                                        
                 var key = commandSetMap[i].WPL_CODE;
                 var val = commandSetMap[i].WPL_NAME;
				 var id = commandSetMap[i].ID;
                 algarr2[key] = key;
                 $("#drag2").append("<div class='item algItem' id='"+key+"' ><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>");
                 
              }   
              localStorage.setItem("HAS_"+toaCode,JSON.stringify(algarr2));  
			},
	error: function(msg){
				
			}
		});        
        }   
        //保存方法
        function saveInfo(){
          var tclCode = $("#paraMap_code").val();
          var tclName = $("#paraMap_name").val();
          var tclType = $("#paraMap_tclClassify").val();
          var flag='${param.flag}';
		  var dir='${param.dir}';
          var rtuMap = {};
          rtuMap["TCL_CODE"] = tclCode;
          rtuMap["TCL_NAME"] = tclName;         
	     if(tclCode==""){
   layer.msg("<dict:lang value='指令代码不能为空'/>", {time: 1000, icon:5});     
   return false;
   }
   if(tclName==""){
   layer.msg("<dict:lang value='指令名称不能为空'/>", {time: 1000, icon:5});    
   return false;
   }
   if(tclType==""){
   layer.msg("<dict:lang value='指令类型不能为空'/>", {time: 1000, icon:5}); 
   return false;
   }
          //var tclSet = $("#commandSet").val();
          var tclSet = "";
          var tclMemo = $("#paraMap_memo").val();
          var totalAct = {};//指令相关动作
          var totalAlg = {};//动作绑定算法的信息
          var totalOptArr = {};//流程代码相关
          $("#drag .actItem").each(function(i){
          var actCode = $(this).attr("id");
          var hasAlg = eval("("+localStorage.getItem("HAS_"+actCode)+")");
          var actOptArr = eval("("+localStorage.getItem("ACTOPT_"+actCode)+")");
          var oneAct = JSON.parse(localStorage.getItem("ACT2_"+actCode));
          var oneAlg = {};
          var oneActOpt = {};
           if(actOptArr!=null){
          oneActOpt["ACT_CODE"] = actCode;
          oneActOpt["ACT_OPT_CODE_LAST"] = actOptArr["lastAction"]==null?"":actOptArr["lastAction"];
          oneActOpt["ACT_OPT_CODE_EXIT"] = actOptArr["exitOrder"]==null?"":actOptArr["exitOrder"];
          oneActOpt["ACT_OPT_CODE_RADIO"] = actOptArr["radio"]==null?"":actOptArr["radio"];
          oneActOpt["ACT_OPT_CODE_OTHER"] = actOptArr["otherAction"]==null?"":actOptArr["otherAction"];
          oneActOpt["FLOWCODE1"] = actOptArr["flowcode1"]==null?"":actOptArr["flowcode1"];
          oneActOpt["FLOWCODE2"] = actOptArr["flowcode2"]==null?"":actOptArr["flowcode2"];
          oneActOpt["FLOWCODE3"] = actOptArr["flowcode3"]==null?"":actOptArr["flowcode3"];
          oneActOpt["FLOWCODE4"] = actOptArr["flowcode4"]==null?"":actOptArr["flowcode4"];
          oneActOpt["FLOWCODE5"] = actOptArr["flowcode5"]==null?"":actOptArr["flowcode5"];
          oneActOpt["FLOWCODE6"] = actOptArr["flowcode6"]==null?"":actOptArr["flowcode6"];
          oneActOpt["ACTIONS1"] = actOptArr["actions1"]==null?"":actOptArr["actions1"];
          oneActOpt["ACTIONS2"] = actOptArr["actions2"]==null?"":actOptArr["actions2"];
          oneActOpt["ACTIONS3"] = actOptArr["actions3"]==null?"":actOptArr["actions3"];
          oneActOpt["ACTIONS4"] = actOptArr["actions4"]==null?"":actOptArr["actions4"];
          oneActOpt["ACTIONS5"] = actOptArr["actions5"]==null?"":actOptArr["actions5"];
          oneActOpt["ACTIONS6"] = actOptArr["actions6"]==null?"":actOptArr["actions6"];          
          totalOptArr[actCode] = oneActOpt;         
          }else{
          oneActOpt["ACT_CODE"] = actCode;
          oneActOpt["ACT_OPT_CODE_LAST"] = "";
          oneActOpt["ACT_OPT_CODE_EXIT"] = "";
          oneActOpt["ACT_OPT_CODE_RADIO"] = "";
          oneActOpt["ACT_OPT_CODE_OTHER"] = "";
          oneActOpt["FLOWCODE1"] = "";
          oneActOpt["FLOWCODE2"] = "";
          oneActOpt["FLOWCODE3"] = "";
          oneActOpt["FLOWCODE4"] = "";
          oneActOpt["FLOWCODE5"] = "";
          oneActOpt["FLOWCODE6"] = "";
          oneActOpt["ACTIONS1"] = "";
          oneActOpt["ACTIONS2"] = "";
          oneActOpt["ACTIONS3"] = "";
          oneActOpt["ACTIONS4"] = "";
          oneActOpt["ACTIONS5"] = "";
          oneActOpt["ACTIONS6"] = "";         
          totalOptArr[actCode] = oneActOpt;	  
	  }   
          totalOptArr[actCode] = oneActOpt;
          totalAct[actCode] =  oneAct;
          oneAlg["ACT_CODE"] = actCode;
                  var j=1;
        for(var mkey2 in hasAlg){ 
         var oneAlg2 =  JSON.parse(localStorage.getItem("ALG_"+mkey2));
         var key = oneAlg2.WPL_CODE; 
         oneAlg["ALG_CODE_"+j] =  mkey2; 
         j++;      
	    } 
	      
	      totalAlg[i] =  oneAlg; 
          });
          
        
        var url = "${path}dmp/DmpOrderAction_orderEditSave.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.TCL_CODE":tclCode,"paraMap.TCL_NAME":tclName,
	    "paraMap.TCL_CLASSIFY":tclType,"paraMap.COMMANDSET":tclSet,"paraMap.TCL_REMARK":tclMemo,
	    "totalAct":JSON.stringify(totalAct),"totalAlg":JSON.stringify(totalAlg),"actOptArr":JSON.stringify(totalOptArr)},
	success: function(data){
				if(flag=="orderSetPage"){										
			  	  	window.parent.addorderListFromSet(rtuMap,"2",dir);			  	 	 					  	 					
					window.parent.display1(); 
				}else{
				        quit();
				}
			},
	error: function(msg){
				
			}
		});
          
        }
      //清空相关的本地缓存
        function clearLocalStorage(){
          //动作缓存清除
          for(var mkey in actCodeMap){   
        localStorage.removeItem("ACTOPT_"+mkey); 
	    localStorage.removeItem("ACT2_"+mkey); 
	    localStorage.removeItem("ACT_"+mkey); 
	    localStorage.removeItem("HASNO_"+mkey); 
	    localStorage.removeItem("HAS_"+mkey); 
            
	  }
          $("#drag .actItem").each(function(i){
          var actCode = $(this).attr("id");
            localStorage.removeItem("ACTOPT_"+actCode); 
	    localStorage.removeItem("ACT2_"+actCode); 
	    localStorage.removeItem("ACT_"+actCode); 
	    localStorage.removeItem("HASNO_"+actCode); 
	    localStorage.removeItem("HAS_"+actCode); 
          });
	  //算法缓存清除
          for(var mkey2 in algCodeMap){   
            localStorage.removeItem("ALG_"+mkey2); 
	  }
        }
        function quit(){
        clearLocalStorage();
       // window.history.back();
       window.location.href=document.referrer;
       //parent.reloadTable();
        }
       function getActionParam2(toaCode){
            var tclCode = $("#paraMap_code").val();
    	    var url = "${path}dmp/DmpOrderAction_fetchActParam.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.TOA_CODE":toaCode,"paraMap.TCL_CODE":tclCode},
	success: function(data){
                 var resList1 = data.ajaxMap.item[0];//动作参数相关
		 var resList2 = data.ajaxMap.item[1];//动作流程码相关
		 var flowCount = 1;
		 var actopt = {};
                 for(var i=0;i<resList1.length;i++){
		     var actType = resList1[0].TCA_TYPE;//已选动作
                     var errAction = resList1[0].TCA_ERR_ACTION;//分支动作
		     var paraType = resList1[0].TCA_PARA_TYPE;//参数保存方式
		     if(actType=="A|B"){
                     actopt["lastAction"] = "A";
		     actopt["exitOrder"] = "B";
                     $('#lastAction').prop('checked',true);
		     $('#exitOrder').prop('checked',true);
		     }else if(actType=="A"){
                     actopt["lastAction"] = "A";
		     actopt["exitOrder"] = null; 
                     $('#lastAction').prop('checked',true);
		     $('#exitOrder').prop('checked',false);		     
		     }else if(actType=="B"){
                     actopt["lastAction"] = null;
		     actopt["exitOrder"] = "B";
                     $('#lastAction').prop('checked',false);
		     $('#exitOrder').prop('checked',true);
		     }else{
                     actopt["lastAction"] = null;
		     actopt["exitOrder"] = null;
                     $('#lastAction').prop('checked',false);
		     $('#exitOrder').prop('checked',false);
		     }
                     actopt["radio"] = paraType;
		      if(paraType=="01"){
                       $('#orderSet').prop('checked',true); 
                       }else if(paraType=="02"){
                       $('#oneOrder').prop('checked',true); 
                       }else if(paraType=="03"){
                       $('#loopToLast').prop('checked',true); 
                       }else if(paraType=="04"){
                       $('#lastAction2').prop('checked',true); 
                      }
		     actopt["otherAction"] = errAction;
		     $('#actions').val(errAction);
		 }
		 for(var i=0;i<resList2.length;i++){
		  var flowCode = resList2[i].TCAF_FLOW_CODE;
		  var nextFlow = resList2[i].TCAF_NEXT_FLOW; 
                  actopt["flowcode"+flowCount] = flowCode;
		  actopt["actions"+flowCount] = nextFlow;
                  $('#flowcode'+flowCount).val(flowCode);
		  $('#actions'+flowCount).val(nextFlow);
		  flowCount++;
		 }
		 localStorage.setItem("ACTOPT_"+toaCode,JSON.stringify(actopt));    
                 

			},
	error: function(msg){
				
			}
		});   
    } 
       /* function creatAndEdit(){
 	    var type =  $("#selTypeDiv .layui-select-title .layui-input").val();
 	    var len  = $("#paraMap_tclClassify option").length-1;
	    var url = "${path}dmp/DmpOrderAction_addOrderType.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
	    data: {"paraMap.orderType":type},
	success: function(data){
              reLoadDictCache(len,type);
			},
	error: function(msg){
				util.alert(msg);
			}
		});    		
		  }
	function reLoadDictCache(Mkey,VAL){
		
		var url = "${path}comm/CacheAction_reLoadDictCache.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    url: url,
		success: function(data){	
				var content = '<option value="' + Mkey + '">' + VAL + '</option>';
				$("#paraMap_tclClassify").append(content);	
				$("#paraMap_tclClassify").val(Mkey);		
		        form.render('select','baseInfo');
   			$(".layui-select-title .layui-input").on("keyup",function(e){  	 
			       if($(".layui-select-none").length==1){
			         	$(".layui-select-none").remove();
			         	//if($("#creatAndEdit").length==0){
			         
			         	$(".layui-anim .layui-anim-upbit").empty();
			         	$("#creatAndEdit").remove();
			         	$(".layui-anim.layui-anim-upbit").append("<a id='creatAndEdit' style='cursor:pointer;' onclick='creatAndEdit()'>创建与编辑          "+$(".layui-select-title .layui-input").val()+"</a>");
			         	//}
			       }else{
			         	$("#creatAndEdit").remove();
			       }
				 });
				  $(".layui-select-title .layui-input").on("focus",function(e){
				  	$("#creatAndEdit").remove();
				  });  					       			
			},
			error: function(msg){
				util.alert("error:"+msg);
		   }
		});
		
	}*/
		//跳转控制
	function display1(){

    		$("#mainDiv").css("display","block");
    		$("#otherBlock").css("display","none");
    	}
    
    function addActiveList(map,type,flag){
    	
    	var key = map.TOA_CODE;
         var val = map.TOA_NAME;
         var actParam = map.TOA_PARAMCODE; 
         var classify = map.TOA_CLASSIFY;
    	 var id= map.ID;
    	 if(flag=="left"){
    	if(type=="1"){
    	
	    	$(".activeList").prepend("<div class='item actItem' id='"+key+"' onclick='showActTitle(this)'><p><span class='num toaKey'><input type='hidden' value='"+key+"' id='"+key+"' class='TOA_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='TOA_NAME' /><input type='hidden' value='"+id+"' id='id_"+key+"' class='TOA_ID'/><input type='hidden' value='"+classify+"' id='actclassify_"+key+"' class='TOA_CLASSIFY'/><input type='hidden' value='"+actParam+"' id='actParam_"+key+"' class='TOA_PARAM'/>"+key+"</span><span class='name toaVal' id='name_"+key+"'>"+val+"</span></p></div>");
	    	localStorage.setItem("ACT_"+key,JSON.stringify(map));
	    	localStorage.setItem("ACT2_"+key,null);
	    	localStorage.setItem("ACTOPT_"+key,null);
	    	actCodeMap[map.TOA_CODE] =map.TOA_CODE;
    	}else if(type=="2"){
    		$("#"+key).html("");
    		$("#"+key).prepend("<p><span class='num toaKey'><input type='hidden' value='"+key+"' id='"+key+"' class='TOA_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='TOA_NAME' /><input type='hidden' value='"+id+"' id='id_"+key+"' class='TOA_ID'/><input type='hidden' value='"+classify+"' id='actclassify_"+key+"' class='TOA_CLASSIFY'/><input type='hidden' value='"+actParam+"' id='actParam_"+key+"' class='TOA_PARAM'/>"+key+"</span><span class='name toaVal' id='name_"+key+"'>"+val+"</span></p>");
    		localStorage.setItem("ACT_"+key,JSON.stringify(map));
	    	actCodeMap[map.TOA_CODE] =map.TOA_CODE;
    	}
    	 }else if(flag=="right"){
    	 	$("#"+key).html("");
    		$("#"+key).prepend("<p><span class='num toaKey'><input type='hidden' value='"+id+"' id='id_"+key+"' class='TOA_ID'/><input type='hidden' value='"+key+"' id='"+key+"' class='TOA_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='TOA_NAME' /><input type='hidden' value='"+classify+"' id='actclassify_"+key+"' class='TOA_CLASSIFY'/><input type='hidden' value='"+actParam+"' id='actParam_"+key+"' class='TOA_PARAM'/>"+key+"</span><span class='name toaVal' id='name_"+key+"'>"+val+"</span> <div class='operates'><span class='ico toLeft'></span><span class='ico edit actEdit'></span></div></p>");
    		localStorage.setItem("ACT_"+key,JSON.stringify(map));
	    	actCodeMap[map.TOA_CODE] =map.TOA_CODE;
    	 
    	 }
    	
   		 
    }
    
    function addAlgList(map,flag){
    	
    	var key = map.WPL_CODE;
         var val = map.WPL_NAME;      
         var classify = map.WPL_TYPE;	
    	 var id= map.ID;
    	if(flag=="1"){
    		
	    	$(".group2 .algorithmList").prepend("<div class='item algItem'  id='"+key+"'><p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p></div>"); 
  			 		
   	    	localStorage.setItem("ALG_"+key,JSON.stringify(map)); 
	    	actCodeMap[map.WPL_CODE] =map.WPL_CODE;
	    	algarr[key]=key;
	    	$("#drag .actItem").each(function(i){ 
	    		var code =$(this).attr("id");
	    		localStorage.setItem("HASNO_"+code,JSON.stringify(algarr));
	    	
	    	});
    	}else if(flag=="2"){
    		
    		$("#"+key).html("");
    		$("#"+key).prepend("<p><span class='num wplKey'><input type='hidden' value='"+key+"' id='"+key+"' class='WPL_KEY'/><input type='hidden' value='"+val+"' id='name_"+key+"' class='WPL_NAME'/><input type='hidden' value='"+id+"' id='id_"+key+"' class='WPL_ID'/>"+key+"</span><span class='name wplVal' id='name_"+key+"'>"+val+"</span></p>");
    		localStorage.setItem("ALG_"+key,JSON.stringify(map));
	    	actCodeMap[map.WPL_CODE] =map.WPL_CODE;
	    	algarr[key]=key;
	    	$("#drag .actItem").each(function(i){ 
	    		var code =$(this).attr("id");
	    		localStorage.setItem("HASNO_"+code,JSON.stringify(algarr));
	    	
	    	});
    	} 
    }
    	function comeback(){
    	    var index = layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
			var flag='${param.flag}';
			if(flag=="orderSetPage"){										                    			  	  				  	 	 					  	 					
					window.parent.display1(); 
				}else{
					window.history.back();
				}
	
	clearLocalStorage();
	layer.close(index);	
	}
	  var firstFlag = true;  	
 $("#setting").click(function(){
     if(firstFlag){
       firstFlag = false;
       $("#COMMANDINIT").click();
     }
 }); 
    var optFlag = true;
 	function optOrderType(flag,oldCode,code,name){
    var url = "${path}dmp/DmpOrderAction_optOrderType.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    async:false,
	    data:{
	    	"paraMap.flag":flag,
	    	"paraMap.oldCode":oldCode,
	    	"paraMap.code":code,
	    	"paraMap.name":name
	    },
	    url: url,
		success: function(data){	
              var res = data.ajaxString;	
              if(res=="SUCCESS"){
              optFlag = true;
              layer.msg("<dict:lang value='操作成功'/>", {time: 1000, icon:6});
              }else if(res=="ADDFAIL"){
              optFlag = false;
              layer.msg("<dict:lang value='新增失败'/>", {time: 1000, icon:5});
              }else if(res=="EDITFAIL"){
              optFlag = false;
              layer.msg("<dict:lang value='修改失败'/>", {time: 1000, icon:5});
              }else if(res=="DELFAIL"){
              optFlag = false;
              layer.msg("<dict:lang value='删除失败'/>", {time: 1000, icon:5});
              }else if(res=="ADDAGAIN"){
              optFlag = false;
              layer.msg("<dict:lang value='该指令类型编码已存在，请重新输入'/>", {time: 1000, icon:5});
              }else if(res=="EDITAGAIN"){
              optFlag = false;
              layer.msg("<dict:lang value='该指令类型编码已存在，请重新输入'/>", {time: 1000, icon:5});
              }else if(res=="EDITUSED"){
              optFlag = false;
              layer.msg("<dict:lang value='该指令类型编码已被引用，不允许更改'/>", {time: 1000, icon:5});
              }else if(res=="DELUSED"){
              optFlag = false;
              layer.msg("<dict:lang value='该指令类型编码已被引用，不允许删除'/>", {time: 1000, icon:5});
              }		         			
			},
			error: function(msg){
				util.alert("error:"+msg);
		   }
		});    
	}  	 
</script>
</body>
</html>

