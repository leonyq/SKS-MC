<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="持久化模型" /><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="chosen" value="1" />
		<jsp:param name="layui" value="1" />
		<jsp:param name="popDivWin" value="1" />
		
	</jsp:include>
	
    <link rel="stylesheet" href="${path}/plf/page/fp/css/jquery.mCustomScrollbar.css?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CSS %>" type="text/css" />
    <link rel="stylesheet" href="${path}/plf/page/fp/css/chosen.css?_mc_res_version=<%=PlfStaticRes.CHOSEN_CSS %>" type="text/css" />
    <link rel="stylesheet" href="${path}/plf/page/fp/css/sub-style.css?_mc_res_version=<%=PlfStaticRes.SUB_STYLE_CSS %>" type="text/css" />
    
    <script src="${path}/plf/page/fp/js/jquery.mCustomScrollbar.concat.min.js?_mc_res_version=<%=PlfStaticRes.JQUERY_MCUSTOMSCROLLBAR_CONCAT_MIN_JS %>"></script>
    <script src="${path}/plf/page/fp/js/slick.js?_mc_res_version=<%=PlfStaticRes.SLICK_JS %>"></script>
    <script src="${path}/plf/page/fp/js/chosen.jquery.js?_mc_res_version=<%=PlfStaticRes.CHOSEN_JQUERY_JS %>"></script>
	

</head>
<body>
<div class="customer comwrap">
  <div>
    <div class="container" style="height: 460px;border:none">
        <div class="main">
            <div class="customer-box">
              <div class="tit" style='font-size: 14px;'>
                <i class="ico ico-cus"></i><dict:lang value="已有字段：" />
              </div>

              <div class="customer-con scroll scroll1" style="height:400px;min-height: 250px;padding:0;padding-left:10px;overflow: auto;">
                <ul class="customer-list" id="k1">
                </ul>
            	<input type="hidden" id="Yuser">
              </div>
              
            </div>
            <div class="customer-btn" style="padding-top: 14%;">
              <button type="button" onclick="b2();" style="background-color: #FF5722;width:60px;">&gt;&gt;</button>
              <button type="button" onclick="b1();" style="background-color: #1E9FFF;width:60px;">&gt;</button>
              <button type="button" onclick="b3();" style="background-color: #1E9FFF;width:60px;">&lt;</button>
              <button type="button" onclick="b4();"style="background-color: #FF5722;width:60px;">&lt;&lt;</button>
            </div>
            <div class="customer-box">
              <div class="tit" style='font-size: 14px;'>
                <i class="ico ico-cus"></i><dict:lang value="配置字段：" />
              </div>

              <div class="customer-con scroll scroll2" style="height:400px;min-height: 250px;padding:0;padding-left:10px;overflow: auto;">
                <ul class="customer-list" id="k2">
                </ul>
            	<input type="hidden" id="Nuser">
              </div>
              
            </div>
        </div>
        
        <div class="ptop_10 txac">
				<blockquote class="layui-elem-quote" style="margin-left: 30px;margin-right: 30px;text-align:left;">
					<span class="Eng">*</span>说明:</br>
					1.已有字段:是持久模型配置的表字段，大文本和二进制字段除外（这两个字段无法创建索引）</br>
					2.配置字段:目前已经选择用来做为组合索引的字段，如果之前比如配置了名称、类型、状态三个字段但是后面持久模型删除了状态字段这样在我们的配置字段只显示名称、类型
				</blockquote>
		
				<button type="button" onclick="sub_index();" class="layui-btn">确定</button>
				
				<input id="sub_but_index2" type="button" value="<dict:lang value="取消" />" onclick="closePopWin();" class="layui-btn">
				
					
		</div>
		
    </div>
  </div>
</div>
	

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="needValidate" value="1" />
</jsp:include>

<script type="text/javascript">	
	$(function(){
		 layui.use('form', function(){
		 	var form = layui.form;
		 	
		 })
		 
		 $(window).on('load',function(){
			setPopScroll('.side');
			setPopScroll('.scroll1');
			setPopScroll('.scroll2');
		})
		 
	})
	
	window.onload = init_fields;

	function init_fields(){
		var all_fields='${all_fields}';//已有字段
		var all_fields_arr=all_fields.split(",");
		var all_fields_arr_copy=all_fields.split(",");
		
		var use_fields='${use_fields}';//配置字段
		var use_fields_arr=use_fields.split(",");
		
		//已有字段 要删除已经配置过的字段
		for(var i = 0;i < all_fields_arr.length; i++){
			for(var j = 0;j < use_fields_arr.length; j++){
				if(all_fields_arr[i]==use_fields_arr[j]){
					all_fields_arr[i]='';
					break;
				}
				
			}
			
		}
		
		//配置字段  要删除已经不存在的字段
		for(var j = 0;j < use_fields_arr.length; j++){
			var flag=true;
			for(var i = 0;i < all_fields_arr_copy.length; i++){
				if(use_fields_arr[j]==all_fields_arr_copy[i]){
					flag=false;
					break;
				}
				
			}
			
			if(flag){
				use_fields_arr[j]='';
			}
			
		}
		
		if(all_fields!=null && all_fields!=''){		
			$("#k1").empty();
			
			var htmlK1 = "";
			for(var i = 0;i < all_fields_arr.length; i++){
				if(all_fields_arr[i]!=''){
					var id='k1_'+i;
					htmlK1 = htmlK1 + "<li id='"+id+"' title='"+all_fields_arr[i]+"' onclick=\"getYIdName('"+id+"');\"><i class='ico ico-cus'></i><a href='javascript:void(0);' target='_blank'>"+all_fields_arr[i]+"</a></li>";
				}
				
			}
			$("#k1").append(htmlK1);
		
		}
		
		if(use_fields!=null && use_fields!=''){		
			$("#k2").empty();
			
			var htmlK2 = "";
			for(var j = 0;j < use_fields_arr.length; j++){
				if(use_fields_arr[j]!=''){
					var id='k2_'+j;
					htmlK2 = htmlK2 + "<li id='"+id+"' title='"+use_fields_arr[j]+"' onclick=\"getYIdName('"+id+"');\"><i class='ico ico-cus'></i><a href='javascript:void(0);' target='_blank'>"+use_fields_arr[j]+"</a></li>";
				
				}
				
			}
			$("#k2").append(htmlK2);
		
		}
		
	}
	
	function getYIdName(objId){
		userN_id = objId;
		if($("#"+userN_id).hasClass("customer-list-choose")){
			$("#"+userN_id).removeClass("customer-list-choose");
		}else{
			$("#"+userN_id).addClass("customer-list-choose");
		}
	}
	
	function b1(){
		$('.scroll1').mCustomScrollbar("destroy");
		$('.scroll2').mCustomScrollbar("destroy");
		
		var falg = false;
		$("#k1 li.customer-list-choose").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k2").append("<li id='"+ids+"' title='"+names+"' onclick=\"getYIdName('"+ids+"');\"><i class='ico ico-cus'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});

		setPopScroll('.scroll1');
		setPopScroll('.scroll2');
	}
	
	function b3(){
		$('.scroll1').mCustomScrollbar("destroy");
		$('.scroll2').mCustomScrollbar("destroy");
		
		var falg = false;
		$("#k2 li.customer-list-choose").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k1").append("<li id='"+ids+"' title='"+names+"' onclick=\"getYIdName('"+ids+"');\"><i class='ico ico-cus'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});
		
		setPopScroll('.scroll1');
		setPopScroll('.scroll2');
		
	}
	
	function b2(){
		$('.scroll1').mCustomScrollbar("destroy");
		$('.scroll2').mCustomScrollbar("destroy");
		
		var falg = false;
		$("#k1 li").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k2").append("<li id='"+ids+"' title='"+names+"' onclick=\"getYIdName('"+ids+"');\"><i class='ico ico-cus'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});
		$("#k1 li").remove();

		setPopScroll('.scroll1');
		setPopScroll('.scroll2');
		
	}
	
	function b4(){
		$('.scroll1').mCustomScrollbar("destroy");
		$('.scroll2').mCustomScrollbar("destroy");
		
		var falg = false;
		$("#k2 li").each(function(){
			var ids = $(this).attr("id");
			var names = $(this).attr("title");
			$("#"+ids).remove();
			$("#k1").append("<li id='"+ids+"' title='"+names+"' onclick=\"getYIdName('"+ids+"');\"><i class='ico ico-cus'></i><a href='javascript:void(0);' target='_blank'>"+names+"</a></li>");
			falg = true;
		});
		$("#k2 li").remove();

		setPopScroll('.scroll1');
		setPopScroll('.scroll2');
	}
	
	function sub_index(){
		var fields = '';
		$("#k2 li").each(function(){
			var names = $(this).attr("title");
			if(fields==''){
				fields=names;
			}else{
				fields=fields+','+names;
			}
			
		});
		
		if(fields==''){
			alterWindows("<dict:lang value="请先配置字段" />",5);
			return false;
		}
		
		var mcIframeName='${mcIframeName}';
		var index_id='${index_id}';
		var obj={"mcIframeName":mcIframeName,"type":"window"};
		//alert(mcIframeName);
		//alert(index_id);
		//alert(obj);
		getSrcByIframeName(obj).set_indexid(index_id,fields);
		closePopWin();

	}
  
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>