<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="客户组配置" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	
	<style type="text/css">
	#display{
	display:none;
	}
	</style>
	<script type="text/javascript" language = "javascript">
	
	        function ajax_save(){
	        $("#table_s").empty();
	 		save_cu();
                        save_cu2();
                        var data = $("#moveform").serialize(); 
	 		$.ajax({
	 		type:'post',
	 		cache:false,
	 		url:'buss/bussModel_exeFunc.ms?FUNC_CODE=F753&funcMId=1afdd498ae3640738f248565c14ca3c3&'+data,
	 		success:function(data){
	 		var list = data.ajaxList;
	 		if(list == null){
	 		 alert("list为空");
	 		}
	 		for(var i = 0;i<list.length;i++){
	 		    var customer = data.ajaxList[i].CUSTOMER;
	 		    var cust_group = data.ajaxList[i].CUST_GROUP;
	 		     $("#table_s").append("<tr id="+i+"><td id=\"td01\">"+customer+"</td><td id=\"td02\">"+cust_group+"</td></tr>");
	 		}	 		
	 		} 
	 		});
	        }
	        function save_cu(){
                  var customer = "";
                  for(var i=0;i<$("#k2 li").length;i++){
                  var username = $("#k2 li").eq(i).text();
                  customer +=$.trim(username)+";"; 
                  }
                  $("#customer").val(customer);
                }
                
              function save_cu2(){
               var customer = "";
               for(var i=0;i<$("#k1 li").length;i++){
               var username = $("#k1 li").eq(i).text();
               customer +=$.trim(username)+";"; 
               }
               $("#customer2").val(customer);
             }
             
	        function search_cu1(){
	 	 var context1 = document.getElementById("cu_name").value;
	 	 for(var i=0;i<$("#k2 li").length;i++){
                 var context2 = $("#k2 li").eq(i).text();
                 if(context2.indexOf(context1)!= -1 && context1 != ""){
                   $("#k2 li:eq("+i+")").remove();
                   $("#k2 li:first").before("<li id='id"+i+"'  onclick=\"getYIdName('id"+i+"');\" ><i class='ico ico-user'></i><a   target='_blank'>"+context2+"</a></li>");
                 }
                }	 	
	 	}
	        
	        function search_cu2(){
	 	 var context1 = document.getElementById("cu_name2").value;
	 	 for(var i=0;i<$("#k1 li").length;i++){
                 var context2 = $("#k1 li").eq(i).text();
                 if(context2.indexOf(context1)!= -1 && context1 != ""){
                   $("#k1 li:eq("+i+")").remove();
                   $("#k1 li:first").before("<li id='id"+i+"'  onclick=\"getYIdName('id"+i+"');\" ><i class='ico ico-user'></i><a   target='_blank'>"+context2+"</a></li>");
                 }
                }	 	
	 	}
                
                
                
                 function getYIdName(objId){
		if($("#"+objId).hasClass("customer-list-choose")){
		        $("#"+objId).removeClass("customer-list-choose");
		        
			
		}else{  
			$("#"+objId).addClass("customer-list-choose");
		       
		}
	       }
	       
	       
	       
	        function getNIdName(objId){
		if($("#"+objId).hasClass("customer-list-choose")){
		        $("#"+objId).removeClass("customer-list-choose");
		        
			
		}else{  
			$("#"+objId).addClass("customer-list-choose");
		       
		}
	       }
	        
	                
	                                
	 	$(document).ready(function(){
	 	
	 	
	 	$("#b1").click(function(){
	 		$("#k2").append($("#k1 li"));
	 		ajax_save();
	 	}
	 	);
	 	
	 	
	 	$("#b2").click(function(){
	 	        
	 	        $("#k1").find("li").each(function(){
	     			if($(this).hasClass("customer-list-choose")){
	      			 var li_id = $(this).attr("id");
	       			 $("#k2").append($("#"+li_id));
	     			}
			});
	 		ajax_save();
	 		
	 	}
	 	);
	 	
	 	
	 	$("#b3").click(function(){
	 	
	 		$("#k2").find("li").each(function(){
	     			if($(this).hasClass("customer-list-choose")){
	      			 var li_id = $(this).attr("id");
	       			 $("#k1").append($("#"+li_id));
	     			}
			});
	 		ajax_save();
	 	}
	 	);
	 	
	 	
	 	$("#b4").click(function(){
	 		$("#k1").append($("#k2 li"));
	 		 ajax_save();
	 		
	 	}
	 	); 
	 	
	 	
	 	
	 	
            



















	 	});
	 	
	 	
function first_enter(){
              
              $("#k").on("click","li", function() {
                          $("#k1").empty();
	 		  $("#k2").empty();
	 		  $("#cu_name").val("");
	 		  $("#cu_name2").val("");
	 		  var tr_length = $("#table1 tr").length;
	 	 	  var tr_length2= $("#table_s tr").length;
			  var cg_name = $(this).attr("id");
			  
			  $("#k li").removeClass();
	                  $("#"+cg_name).addClass("item current");
			  $("#cg_name").val(cg_name);
			   
			  var jug =$("#table_s tr").find("td").text();
			  
			    if(jug==""){
	 	 
	 	 for(var i=1;i<tr_length+1;i++){ 
	 	 var username = $("#table1 tr[id="+i+"]").find("#td01").text();
	 	 var id = $.trim($("#table1 tr[id="+i+"]").find("#td02").text());
	 	   if(id==cg_name){
	 	   $("#k2").append("<li id='id"+i+"'  onclick=\"getYIdName('id"+i+"');\" ><i class='ico ico-user'></i><a   target='_blank'>"+username+"</a></li>");   
	 	   }else{
	 	  $("#k1").append("<li id='id_"+i+"'  onclick=\"getNIdName('id_"+i+"');\" ><i class='ico ico-user'></i><a  target='_blank'>"+username+"</a></li>");
	 	   }
	 	 }	 
	 	 }else{
	 	  for(var i=0;i<tr_length2;i++){
	 	 var username2 = $("#table_s tr[id="+i+"]").find("#td01").text();
	 	 var id2 = $.trim($("#table_s tr[id="+i+"]").find("#td02").text());
	 	   if(id2==cg_name){
	 	    $("#k2").append("<li id='id"+i+"'  onclick=\"getYIdName('id"+i+"');\"><i class='ico ico-user'></i><a  target='_blank'>"+username2+"</a></li>"); 
	 	   }else{
	 	  $("#k1").append("<li id='id_"+i+"'  onclick=\"getNIdName('id_"+i+"');\"><i class='ico ico-user'></i><a  target='_blank'>"+username2+"</a></li>");
	 	   }
	 	 }
	 	 
	 	 } 
 });
	 	   $("#k li:first").click();	 	
	 	}
	 
	</script>
	
</head>
<body scroll="auto" style="overflow: auto;" >
 <bu:funcsi viewId="1accca7e978441a0864a36e4af8e7b83" funcId="1afdd498ae3640738f248565c14ca3c3" isHidden="1"/>
      <div id="display">
      <table id = "table1">
      <tbody>
      <s:iterator value="dataList1" status="index">
       <tr id="<s:property value="#index.count"/>"> 
       <td id="td01">     
       <s:property value="CUSTOMER"/>
       </td>
       <td id="td02">
       <s:property value="CUST_GROUP"/>
       </td>
       </tr>
      </s:iterator>
      </tbody>
      </table>
      </div>
      
      <div id="display">
      <table id = "table_s">
      <tr>
      </tr>  
      </table>
      </div>

       <div class="customer comwrap">
	<div class="hd">
    <h2 class="tit"><i class="ico-hd"></i><dict:lang value="配置客户组" /></h2>
  </div>
  <div>
  	<form id="moveform" action="${path}buss/bussModel.ms" method="post">
      <input type="hidden" id="cg_name" name="cg_name" >
      <input type="hidden" id="customer" name="customer" >
      <input type="hidden" id="customer2" name="customer2" >
  	<div class="container" style="height:460px">
  		<div class="side"> <!--左 -->
            <ul class="neir-list" id="k">
                <s:iterator value="dataList" ><!--取数据 -->
								<li id="<s:property value="ID"/>">
									<a  target="_blank" class="item-con" style="cursor:pointer"><s:property value="CG_NAME"/></a>
								</li>
				        </s:iterator>
            </ul>
       </div>
       <div class="main"><!--右大块 -->
       	  <div class="customer-box"><!--已归属模块 -->
       	  	<div class="tit"><!--标题 -->
                <i class="ico ico-cus"></i><dict:lang value="已有客户" />
            </div>
            <div class="group"><!--搜索框部分 -->
            	<div class="name"><dict:lang value="查询" /></div>
                  <div class="dec">
                  <input type="text" id="cu_name" style="width: 173px" onkeyup="search_cu1()" />		
                  </div>
            </div>
           <div class="customer-con" style="height: 310px;overflow:scroll"><!--已归属客户信息（数据）模块 -->
                <ul class="customer-list" id="k2">
                </ul>
          </div>
            
            
          </div>
       	  
       	  <div class="customer-btn"><!--按钮模块 -->
              <button type="button" id = "b4">&gt;&gt;</button>
              <button type="button" id = "b3">&gt;</button>
              <button type="button" id = "b2">&lt;</button>
              <button type="button" id = "b1">&lt;&lt;</button>	
       	  </div>
       	  
       	  <div class="customer-box"><!--未归属模块 -->
       	  	<div class="tit"><!--标题 -->
                <i class="ico ico-cus"></i><dict:lang value="未选客户" />
            </div>
       	  	 <div class="group"><!--搜索框部分 -->
            	<div class="name"><dict:lang value="查询" /></div>
                  <div class="dec">
                  <input type="text" id="cu_name2" style="width: 173px" onkeyup="search_cu2()">		
                  </div>
            </div>
            <div class="customer-con" style="height: 310px;overflow:scroll"><!--未归属客户信息（数据）模块 -->
                <ul class="customer-list" id="k1">
                </ul>
            	
          </div>
       	  </div>
       </div>
    </div>
  </form>
  </div>
</div>   
                  
      
                       
           

<script src="${path}/plf/page/fp/js/iframe-design.js"></script>
		<bu:submit viewId="1accca7e978441a0864a36e4af8e7b83" />
		<bu:script viewId="1accca7e978441a0864a36e4af8e7b83" />
    <script type="text/javascript">
         $('.js-nav').slick({
            dots: false,
            autoplay: false,
            slidesToScroll:1,
            slidesToShow:8
        });
         $('.menu-sub').mCustomScrollbar({
          scrollInertia:150
        });
        $('#mCSB_1').css('overflow','visible');
        $('.banner .item1').hover(function(){
          $('.banner').css('border-bottom-color','#20c2ff');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });
        $('.banner .item2').hover(function(){
          $('.banner').css('border-bottom-color','#fccd00');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });
        $('.banner .item3').hover(function(){
          $('.banner').css('border-bottom-color','#8fcf3e');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });
        $('.banner .item4').hover(function(){
          $('.banner').css('border-bottom-color','#592e2e');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });

        function Height(){
          var H = $(window).height();
          $('.menu').css('height',H);
          $('.content').css('height',H - 70);
          $('.content').mCustomScrollbar({
            scrollInertia:150
          });
        }
        Height();
        $(window).resize(function(){
          $('.content').mCustomScrollbar("destroy");
          Height();
        });
        $(function(){
          $('.dept_select').chosen();
      });
        

    	var isQuery = false;
    	function query(thisObj){
    		//如果有时间段的存在，则复制到搜索表单中
    		if($("#timeBucketId")){
    			$("#searchForm").append($("#timeBucketId").clone());
    		}
    		if(isQuery){//utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");
    		utilsFp.confirmIcon(3,"","","", "<dict:lang value="数据正在提交，请稍候" />...",0,"","");}
    		document.forms.searchForm.submit();
    		util.showTopLoading();
    		isQuery=true;
    	}
    	
    	function alertInfo(msg){
    		utilsFp.alert(msg);
    	}
    	
    	function reloadPg(msg){
    		utilsFp.alert(msg,reloadPgExe);
    	}
    	
    	function reloadPgExe(){
    		document.forms.searchForm.submit();
    		util.showTopLoading();
    	}
    	
    	function init(){
    	
    		$(".table_list").each(function(seq) {
    			var tableTrJs =$(this).find("tbody tr");
    			_toClickColorMap(tableTrJs,$(this).attr("id"));
    			_tongLineColor(tableTrJs);
    		});
    		
    		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
    		//判断是否隐藏搜索框
    		if($("#searchParaNull").val()=="0"){
    			$(".search-box").hide();
    		}
    	}
        first_enter();
    </script>

<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
