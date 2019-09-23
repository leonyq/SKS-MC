<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <base href="${path}" />
  <title><dict:lang value="算法模型信息列表"/></title>
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
 </style>
</head>

<body>
    <div class="layui-fluid switch">
        <div class="listOperate">
            <div class="searchSwitch"></div>
            <div class="operates">
                <ul class="layui-nav">
                    <li class="layui-nav-item">
                        <a href="javascript:;"><dict:lang value="操作"/></a>
                        <dl class="layui-nav-child">
                            <dd class="tableAddData cardAddData"><dict:lang value="新增"/></dd>
                            <dd class="tableUpData cardUpData" ><dict:lang value="修改"/></dd>
                            <dd class="tableDetailData cardDetailData" ><dict:lang value="查看"/></dd>
                            <dd class="tableDelData cardDelData" id="tableDelData"><dict:lang value="删除"/></dd>
                        </dl>
                    </li>
                </ul>
                <span class="ico search"></span>
                <span class="ico list icolist"></span>
                <a><span class="ico card icocard"></span></a>
            </div>
        </div>
        <form class="layui-form searchDiv" id="searchForm" action="">
		  <s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
            <div class="layui-row">
           
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="算法名称"/></div>
                    <div class="search_r">
                        <input type="text"  id="paraMap_code" name="paraMap.WPL_CODE" maxlength="30" class="layui-input">
                    </div>
                </div>
                
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="算法描述"/></div>
                    <div class="search_r">
                        <input type="text"  id="paraMap_name" name="paraMap.WPL_NAME" maxlength="30"  class="layui-input">
                    </div>
                </div>
                
                <div class="searchItem">
                    <div class="search_l"><dict:lang value="应用分类"/></div>
                    <div class="search_r">
                     <select lay-search  name="paraMap.WPL_TYPE" id="paraMap_wplType">
                      <option  value=""><dict:lang value="--请选择--"/></option>
                     </select>                       
                    </div>
                </div>
                
            </div>
        </form>
        <div class="list" id="dmpList_div">
           <table id="dmpList" lay-filter="dmpListDemo"></table>
        </div>
        
        <div id="cardlist" style="display:none;">
           
        </div>
        
    </div>
    
<script>
bulidEvenForDmpIcon();
function bulidEvenForDmpIcon(){
	$('.search').attr('title',"<dict:lang value='查询'/>");
	$('.icolist').attr('title',"<dict:lang value='列表'/>");
	$('.icocard').attr('title',"<dict:lang value='卡片'/>");
	$('.code').attr('title',"<dict:lang value='源码'/>");
	$('.code2').attr('title',"<dict:lang value='源码'/>");
	$('.code3').attr('title',"<dict:lang value='源码'/>");
	$('.add').attr('title',"<dict:lang value='添加'/>");
	$('.toRight').attr('title',"<dict:lang value='右移'/>");
	$('.toLeft').attr('title',"<dict:lang value='左移'/>");
	$('.edit').attr('title',"<dict:lang value='修改'/>");
	$('.close').attr('title',"<dict:lang value='删除'/>");
	$('.play').attr('title',"<dict:lang value='启动'/>");
	$('.pause').attr('title',"<dict:lang value='停止'/>");
}
var storage=window.localStorage;
var tableIns;
var currPage = 1;
layui.use([ 'table', 'element', 'laypage'], function(){
	  var table = layui.table;
	  var element = layui.element;
	  var laypage = layui.laypage;
	  var form = layui.form;
  table.on('rowDouble', function(obj){
			  var data = obj.data;
			  var rowId = data.ID;
			   view(rowId);      
    });	 
    var url = "${path}dmp/DmpAction_getAlgType.ms";
	    jQuery.ajax({
		type: "POST",
	    dataType: "json",
	    data:"",
	    url: url,
		success: function(data){	
             var map =  data.ajaxMap.ALG_TYPE;
             for(var i=0;i<map.length;i++){
              $("#paraMap_wplType").append("<option value='"+map[i].MODELTYPE_CODE+"'>"+map[i].MODELTYPE_NAME+"</option>");
             }  
             form.render();			
			},
			error: function(msg){
				util.alert("error:"+msg);
		   }
		});     	  
	  //第一个实例
	    tableIns =  table.render({
	    id:'dmpList',
	    elem: '#dmpList',
	    url: '${path}dmp/DmpAction_fetchAlgorithModelList.ms', //数据接口
	    page: true, //开启分页
	    method: 'post',
	    limits:[10,20,50,100],
	    height: 'auto',
	    where:{"FUNC_CODE":"F_b12dbdfb400742e18c2bc59671ce99e0"},
	    parseData: function(res){ //res 即为原始返回的数据
	        return {
	          "code": res.ajaxMap.state, //解析接口状态
	          "msg": '', //解析提示文本
	          "count": res.ajaxMap.count, //解析数据长度
	          "data": res.ajaxMap.item //解析数据列表
	        };
	      },
	    request: {
	        pageName: 'page.currentPage', //页码的参数名称，默认：page
	        limitName: 'page.pageRecord' //每页数据量的参数名，默认：limit
	      },
	    cols: [[ //表头
	       {checkbox: true,fixed:'left'},
	       {field: 'WPL_CODE', title: '<dict:lang value="算法名称"/>', sort: true},
	       {field: 'WPL_NAME', title: '<dict:lang value="算法描述"/>', sort: true},
	       {field: 'WPL_TYPE', title: '<dict:lang value="应用分类"/>', sort: true}
	    ]],
	    done: function(res, curr, count){
	    	currPage = curr;
	    }
	  });
	  
	  // 新增
	  $(".tableAddData").click(function(){
		// do something
		add();
	  });
	  
	  
	  	
	
	  // 修改
	  $(".tableUpData").click(function(){
		  if(search_type=='tableSearch'){
			  var checkStatus = table.checkStatus('dmpList');
			  var data = checkStatus.data;
			  if(data.length==0){
				  layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
				  return;
			  }
			  if(data.length>1){
				  layer.msg("<dict:lang value='只能选择一条数据'/>", {time: 1000, icon:5});
				  return; 
			  }
			  var rowId = data[0].ID;
			
		  }else{
			  var card = $(".cards .active"); 
			  if(card.length==0){
			      layer.msg("<dict:lang value='请选中一张卡片'/>", {time: 1000, icon:5});
				  return;
			  }
			  var rowId = card.attr("rowId");
		  }
		  edit(rowId);
		  
	  });
	  // 查看
	  $(".tableDetailData").click(function(){
		  if(search_type=='tableSearch'){
			  var checkStatus = table.checkStatus('dmpList');
			  var data = checkStatus.data;
			  if(data.length==0){
                  layer.msg("<dict:lang value='请选择一条数据'/>", {time: 1000, icon:5});
				  return;
			  }
			  if(data.length>1){
				  layer.msg("<dict:lang value='只能选择一条数据'/>", {time: 1000, icon:5});
				  return; 
			  }
			  var rowId = data[0].ID;
			  
		  }else{
			 var card = $(".cards .active"); 
			 if(card.length==0){
				  layer.msg("<dict:lang value='请选中一张卡片'/>", {time: 1000, icon:5});
				  return;
			 }
			 var rowId = card.attr("rowId");
		  }
		  view(rowId);
	
	  });
	  // 删除
	  $(".tableDelData").click(function(){
		  if(search_type=='tableSearch'){
			  var checkStatus = table.checkStatus('dmpList');
			  var data = checkStatus.data;
			  if(data.length==0){
				  layer.msg("<dict:lang value='请选择数据'/>", {time: 1000, icon:5});
				  return;
			  }
			  var rowIds = "";
			  $.each(data,function(i,v){
				  rowIds+=v.ID+",";
			  });
          deleteData(rowIds,"list");
		  }else{
			 var card = $(".cards .active"); 
			 if(card.length==0){
				  layer.msg("<dict:lang value='请选中一张卡片'/>", {time: 1000, icon:5});
				  return;
			 }
			 var rowIds = card.attr("rowId");
             deleteData(rowIds,"card");
		  }
	  });
	  function deleteData(rowIds,type){
       	var item = layer.open({
                title: '<dict:lang value="摩尔提示"/>',
                skin: 'layui-layer-molv',
                btn: ['<dict:lang value="确定"/>', '<dict:lang value="取消"/>'],
                yes: function(index, layero){
 			  $.post("${path}dmp/DmpAction_delAjaxformParam.ms",{rowIds:rowIds},function(res){
 			      if(type=="list"){
 			      reloadTable();
 			      }else{
 				  listCardAx();				      
 			      }	   
		      });
                layer.close(item);
                },btn2: function(index, layero){
                  //按钮【取消】的回调
                },
                area: ['260px','150px'],
               	type: 1, 
                id: 'hintDiv', //防止重复弹出
                content: '<p style="margin-top:25px;text-align:left;padding-left:20px;"><dict:lang value="是否确认删除?"/></p>',
                shade: 0.3 
            });
	  }	  
	  table.on('row(dmpListDemo)', function(obj){
		  //console.log(obj.tr) //得到当前行元素对象
		  //console.log(obj.data) //得到当前行数据
		  //obj.del(); //删除当前行
		  //obj.update(fields) //修改当前行数据
	 });
	  
	  // 刷新列表
	});
	 var reloadTable = function(){
	      var formData = form.serialize($("#searchForm"));
		  formData["FUNC_CODE"] = "F_b12dbdfb400742e18c2bc59671ce99e0";
		  tableIns.reload({
			  where: formData,
			  page: {
			    curr: currPage
			  }
		  });
	   }
	
    $('.searchSwitch').click(function(){
        $('.layui-fluid').toggleClass('switch');
    });
    
    function add(){			
        var url = "${path}dmp/DmpAction_preAlgorithModelAdd.ms";
 	    window.location.href= url;
    }
    
    function edit(id){			
        var url = "${path}dmp/DmpAction_preAlgorithModelEdit.ms?paraMap.id="+id;//?paraMap.UP_ID="+$("#up_id").val()+"&paraMap.typeFlag="+$("#typeFlag").val()+"&paraMap.mcIframeName="+window.parent.name;
        window.location.href= url;
    }
    
    
    
    function view(id){			
        var url = "${path}dmp/DmpAction_preAlgorithModelView.ms?paraMap.id="+id;//?paraMap.UP_ID="+$("#up_id").val()+"&paraMap.typeFlag="+$("#typeFlag").val()+"&paraMap.mcIframeName="+window.parent.name;
        window.location.href= url;
    }
</script>

<script>
	//DMP卡片列表页面封装
	var search_type='cardSearch';//类型切换  tableSearch cardSearch
	$(function(){
			$("#dmpList_div").css('display','none'); 
			$("#cardlist").css('display',''); 
			listCardAx();
	});
	
	// 点击列表按钮
	$(".icolist").click(function(){
		search_type='tableSearch';
		$("#cardlist").css('display','none'); 
		$("#dmpList_div").css('display',''); 
		reloadTable();
		storage.type="list";
	});
	
	// 点击卡片按钮
	$(".icocard").click(function(){
		search_type='cardSearch';
		$("#dmpList_div").css('display','none'); 
		$("#cardlist").css('display',''); 
		listCardAx();
		storage.type="card";
	});
	
	// 点击搜索按钮
	$('.search').click(function(){
		if(search_type=='tableSearch'){
			reloadTable();
		}else{
			listCardAx();
		}
		
    });
	
	<%-- 异步刷新卡片列表数据 --%>
	function listCardAx(){
		var url = "${path}dmp/DmpAction_fetchAlgorithModelListCard.ms";
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
						//console.log(data.ajaxMap);
						$.each(data.ajaxMap,function(key,values){   
						  
							var arr= key.split(",");
						    
						    operHtml =operHtml +"<div class='cardPane open'>";
						    
						    operHtml =operHtml +"<fieldset class='layui-elem-field layui-field-title'>";
                			operHtml =operHtml +"<legend>"+arr[0]+"("+values.length+")</legend>";
                			operHtml =operHtml +"<div class='more'>";
                    		operHtml =operHtml +"<div class='moreBtn showBtn'>";
                        	operHtml =operHtml +"<span class='moreIco'></span>";
                    		operHtml =operHtml +"</div>";
                    		
                    		if(values.length>20){
                    			operHtml =operHtml +"<div class='moreBtn moreloadlist' moreload_dataauth_id='"+arr[1]+"'><span class='text'><dict:lang value='更多'/></span></div>";
                    		}
                    		
                			operHtml =operHtml +"</div>";
            				operHtml =operHtml +"</fieldset>";
            				operHtml =operHtml +"<div class='layui-row cards'>";
            				//console.log(values);
						    
						    $.each(values, function(i, paraDto) {
						    	//console.log(paraDto.PNAME);
						    	if(i>19){
						    		return false;
						    	}
						    
                				operHtml =operHtml +"<div class='item' rowId="+paraDto.ID +" code="+paraDto.WPL_CODE+">";
                    			operHtml =operHtml +"<div class='p1'><span class='ico'></span>"+paraDto.WPL_CODE+"</div>";
                    			operHtml =operHtml +"<div class='p2' title="+(paraDto.WPL_NAME==null?"":paraDto.WPL_NAME)+">"+(paraDto.WPL_NAME==null?"":paraDto.WPL_NAME)+"</div>";
                    			operHtml =operHtml +"<div class='code' title='<dict:lang value="源码"/>' ></div>";
                				operHtml =operHtml +"</div>";
            					
							});   
							
						    operHtml =operHtml +"</div>";
						    operHtml =operHtml +"</div>";
						    
					    }); 
					    					    
					}
					
					//console.log(operHtml);
					//$("#dmpList_div").html('');//列表
					//$("#dmpList_div").css('display','none'); 
					
					$("#cardlist").html(operHtml);
					
					//注册展开收起
					$('.showBtn').click(function(){
				        if($(this).parents('.cardPane').hasClass('open')){
				            $(this).parents('.cardPane').removeClass('open')
				            $(this).find('.text').html('<dict:lang value="展开"/>')
				        }else{
				            $(this).parents('.cardPane').addClass('open')
				            $(this).find('.text').html('<dict:lang value="收起"/>')
				        }
				
				    })
				    
				    
				   $('.cards .item').click(function(){
				       $(this).addClass('active').siblings().removeClass('active');
				       $(this).addClass('active').parent().parent().siblings().find('div.item').removeClass('active')
				   })
				   
			       $('.cards .item').dblclick(function(){
			    	   view($(this).attr("rowId"));
				   })
				   
				   
		           $('.cards .item .code').click(function(){
			    	   var id = $(this).parent().attr("rowId");
			    	   var code = $(this).parent().attr("code");
			    	   toCodeView(code,id);
				   })


				    
				    //更多
					$('.moreloadlist').click(function(){
						var moreload_dataauth_id=$(this).attr('moreload_dataauth_id');
						$("#paraMap_wplType").val(moreload_dataauth_id);
						layui.form.render("select");
						$("#cardlist").css('display','none'); 
						$("#dmpList_div").css('display',''); 
						search_type='tableSearch';
					    reloadTable();
							
					}); 
					
				}catch(e){
					console.log(e);			
				}
			},
			error: function(msg){
				
			}
		});
	}
	
    function toCodeView(code,id){
     	$.post("${path}dmp/DmpAction_isHaveSourceCode.ms",{code:code},function(res){
  		    if(res.ajaxMap.state==1){
  		    	layer.msg("<dict:lang value='未找到该模型源码'/>", {time: 1000, icon:5});
  		    }else{
  		        var url = "${path}dmp/DmpAction_preAlgorithModelSourceCode.ms?paraMap.code="+code+"&paraMap.id="+id;
  	 	    	window.location.href= url;
  		    }
        });
    }
    
    
    $(document).on("click", ".layui-table-body table.layui-table tbody tr", function (e) {
        if ($(e.target).hasClass("layui-table-col-special") || $(e.target).parent().hasClass("layui-table-col-special")) {
            return false;
        }
        var index = $(this).attr('data-index'), tableBox = $(this).closest('.layui-table-box'),
            tableFixed = tableBox.find(".layui-table-fixed.layui-table-fixed-l"),
            tableBody = tableBox.find(".layui-table-body.layui-table-main"),
            tableDiv = tableFixed.length ? tableFixed : tableBody,
            checkCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.laytable-cell-checkbox div.layui-form-checkbox i"),
            radioCell = tableDiv.find("tr[data-index=" + index + "]").find("td div.laytable-cell-radio div.layui-form-radio i");
        if (checkCell.length) {
            checkCell.click();
        }
        if (radioCell.length) {
            radioCell.click();
        }
    });
    $(document).on("click", "td div.laytable-cell-checkbox div.layui-form-checkbox,td div.laytable-cell-radio div.layui-form-radio", function (e) {
        e.stopPropagation();
    });
</script>

</body>
</html>