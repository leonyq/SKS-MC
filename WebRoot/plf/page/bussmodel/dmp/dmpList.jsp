<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>模型信息列表</title>
  <%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
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
    <div class="layui-fluid">
        <div class="listOperate">
            <div class="searchSwitch"></div>
            <div class="operates">
                <ul class="layui-nav">
                    <li class="layui-nav-item">
                        <a href="javascript:;">操作</a>
                        <dl class="layui-nav-child">
                            <dd class="tableAddData cardAddData">新增</dd>
                            <dd class="tableUpData cardUpData" >修改</dd>
                            <dd class="tableDetailData cardDetailData" >查看</dd>
                            <dd class="tableDelData cardDelData" id="tableDelData">删除</dd>
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
                    <div class="search_l">组织机构</div>
                    <div class="search_r">
                       <select class="input_sh"  lay-search name="paraMap.DATA_AUTH" id='paraMap_DATA_AUTHE'>
							<option value="">--<dict:lang value="请选择" />--</option>
							<c:forEach items="${deptLs}"  var="dept">
							   <option value="<c:out value="${dept.id}"/>" <c:if test="${paraMap.DATA_AUTH eq dept.id}">selected</c:if>><c:out value="${dept.name}"/></option>
							</c:forEach>
					    </select>
                    </div>
                </div>
                <div class="searchItem">
                    <div class="search_l">参数KEY</div>
                    <div class="search_r">
                        <input type="text"  id="paraMap_PNAME" name="paraMap.PNAME" maxlength="30"  placeholder="参数KEY" class="layui-input">
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
util.initDictMap('["YESNO","FUNC_TYPE"]');
var tableIns;
var currPage = 1;
layui.use([ 'table', 'element', 'laypage'], function(){
	  var table = layui.table;
	  var element = layui.element;
	  var laypage = layui.laypage;
	  
	  //第一个实例
	    tableIns =  table.render({
	    elem: '#dmpList',
	    url: '${path}sys/FuncAction_platAjaxformParamList.ms', //数据接口
	    page: true, //开启分页
	    method: 'post',
	    limits:[10,20,50,100],
	    height: 315,
	    where:{"FUNC_CODE":"F10001958"},
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
	       {field: 'DEPTNAME', title: '组织机构'},
	       {field: 'PNAME', title: '参数KEY'},
	       {field: 'PVALUE', title: '参数VAL', sort: true},
	       {field: 'STATE', title: '状态',templet:function(d){
	    	  if(d.STATE=="1"){
	    		  return "启用";
	    	  }else{
	    		  return "禁用";
	    	  }
	      }}, 
	      {field: 'WIE', title: '是否立即生效',templet:function(d){
	    	  if(d.WIE=="1"){
	    		  return "是";
	    	  }else{
	    		  return "否";
	    	  }
	      }}
	    ]],
	    done: function(res, curr, count){
	    	currPage = curr;
	    }
	  });
	  
	  // 新增
	  $(".tableAddData").click(function(){
		// do something
	  });
	  // 修改
	  $(".tableUpData").click(function(){
		  var checkStatus = table.checkStatus('dmpList');
		  var data = checkStatus.data;
		  if(data.length==0){
			  layer.msg('请选择一条数据！');
			  return;
		  }
		  if(data.length>1){
			  layer.msg('只能选择一条数据！');
			  return; 
		  }
		  var rowId = data[0].id;
		  
	  });
	  // 查看
	  $(".tableDetailData").click(function(){
		  var checkStatus = table.checkStatus('dmpList');
		  var data = checkStatus.data;
		  if(data.length==0){
			  layer.msg('请选择一条数据！');
			  return;
		  }
		  if(data.length>1){
			  layer.msg('只能选择一条数据！');
			  return; 
		  }
		  var rowId = data[0].id;
		 
	  });
	  // 删除
	  $(".tableDelData").click(function(){
		  var checkStatus = table.checkStatus('dmpList');
		  var data = checkStatus.data;
		  if(data.length==0){
			  layer.msg('请选择数据！');
			  return;
		  }
		  var rowIds = "";
		  $.each(data,function(i,v){
			  rowIds+=v.ID+",";
		  });
		  $.post("${path}sys/FuncAction_delAjaxformParam.ms",{rowIds:rowIds},function(res){
			    if(res.ajaxMap.state==1){
			    	reloadTable();
			    }else{
			    	layer.msg(res.msg);
			    }
	      });
	  });
	  
	  table.on('row(dmpListDemo)', function(obj){
		  console.log(obj.tr) //得到当前行元素对象
		  console.log(obj.data) //得到当前行数据
		  //obj.del(); //删除当前行
		  //obj.update(fields) //修改当前行数据
	 });
	  
	  // 刷新列表
	});
	 var reloadTable = function(){
	      var formData = form.serialize($("#searchForm"));
		  formData["FUNC_CODE"] = "F10001958";
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
</script>

<script>
	//DMP卡片列表页面封装
	var search_type='tableSearch';//类型切换  tableSearch cardSearch
	$(function(){
		listCardAx();
	});
	
	// 点击列表按钮
	$(".icolist").click(function(){
		search_type='tableSearch';
		$("#cardlist").css('display','none'); 
		$("#dmpList_div").css('display',''); 
		reloadTable();
		
	});
	
	// 点击卡片按钮
	$(".icocard").click(function(){
		search_type='cardSearch';
		$("#dmpList_div").css('display','none'); 
		$("#cardlist").css('display',''); 
		listCardAx();
					
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
		var url = "${path}sys/FuncAction_platAjaxformParamList_card.ms";
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
						    //console.log(key);   
						    var dataauth_arr=key.split(',');
						    
						    operHtml =operHtml +"<div class='cardPane open'>";
						    
						    operHtml =operHtml +"<fieldset class='layui-elem-field layui-field-title'>";
                			operHtml =operHtml +"<legend>"+dataauth_arr[1]+"("+values.length+")</legend>";
                			operHtml =operHtml +"<div class='more'>";
                    		operHtml =operHtml +"<div class='moreBtn showBtn'>";
                        	operHtml =operHtml +"<span class='moreIco'></span>";
                    		operHtml =operHtml +"</div>";
                    		
                    		if(values.length>20){
                    			operHtml =operHtml +"<div class='moreBtn moreloadlist' moreload_dataauth_id='"+dataauth_arr[0]+"'><span class='text'>更多</span></div>";
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
						    
                				operHtml =operHtml +"<div class='item active'>";
                    			operHtml =operHtml +"<div class='p1'><span class='ico'></span>"+paraDto.PNAME+"</div>";
                    			operHtml =operHtml +"<div class='p2'>"+paraDto.PVALUE+"</div>";
                    			operHtml =operHtml +"<div class='set'></div>";
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
				            $(this).find('.text').html('展开')
				        }else{
				            $(this).parents('.cardPane').addClass('open')
				            $(this).find('.text').html('收起')
				        }
				
				    })
				    
				    //更多
					$('.moreloadlist').click(function(){
						var moreload_dataauth_id=$(this).attr('moreload_dataauth_id');
						$("#paraMap_DATA_AUTHE").val(moreload_dataauth_id);
						layui.form.render("select");
						$("#cardlist").css('display','none'); 
						$("#dmpList_div").css('display',''); 
						search_type='tableSearch';
					    reloadTable();
							
					}); 
					
				}catch(e){
								
				}
			},
			error: function(msg){
				
			}
		});
	}
	
</script>

</body>
</html>