<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="用户角色配置" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>
	<script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.excheck.js"></script>
	 <link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	#display{
	display:none;
	}
	</style>
	<script type="text/javascript" language = "javascript">
	
	        function ajax_save(){
	        
	       
	        $("#table_s").empty();
            var data = $("#moveform").serialize(); 
         
	 		$.ajax({
	 		type:'post',
	 		cache:false,
	 		url:"buss/bussModel_exeFunc.ms?funcMId=0ec67b3407ed41f6856378b9c1025e89",
	 		data:data,
	 		success:function(data){
	 		    
	 		
	 		    if(null==data){
	 		      getinfo($("#cg_name").val());
	        	  getinfos($("#cg_name").val());  
	 		    }
	 		    if(null != data){
	 		        	
        	 		    if(data.ajaxMap.returnMsg=="error"){
            				utilsFp.confirmIcon(3,"","","", "已关联用户:"+data.ajaxMap.name,0,"260","");
            				return;
            			}
        	        	if(data.ajaxMap.returnMsg=="addSucc"){	
                                 getinfo($("#cg_name").val());
	        	                getinfos($("#cg_name").val());       
    					
    				    }
	        	}
	        	
	        	
	 		
	 		} ,
	 		error:function(msg){
	 		    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"260","");
	 		}
	 		});
	        }
            var menuId="";
            var menuId1="";
                
      
	        function search_cu1(thisObj){
	 	 	 
	 	 	 
	 	 	 	
               	getinfo($("#cg_name").val());
	 	    }
	        
	        function search_cu2(thisObj){
	           
	 	 	    getinfos($("#cg_name").val());
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
	 	//	$("#k2").append($("#k1 li"));
	 		$("#type").val("2");
	 		
	 		
	 		
	 		
	 		ajax_save();
	 		
	 	}
	 	);
	 	
	 	
	 	$("#b2").click(function(){
	 	
	 	       

			$("#type").val("1");
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
			$("#type").val("3");
	 		ajax_save();
	 	}
	 	);
	 	
	 	
	 	$("#b4").click(function(){
	 		$("#k1").append($("#k2 li"));
	 		$("#type").val("4");
	 		 ajax_save();
	 		
	 	}
	 	); 
	 	});
	 	
	 	
	 	
	 	

	 
	</script>
	
</head>
<body scroll="auto" style="overflow: auto;" >
 <bu:funcsi viewId="4c5a1c82a3ec4388a5d263f8ed078a62" funcId="0ec67b3407ed41f6856378b9c1025e89" isHidden="1"/>
      <div id="display">
      <table id = "table1">
      <tbody>
      <s:iterator value="dataList1" status="index">
       <tr id="<s:property value="#index.count"/>"> 
       <td id="td01">     
      <!-- <s:property value="CUSTOMER"/> -->
       <s:property value="TAS_FUN_NAME"/>
       </td>
       <td id="td02">
     <!-- 
      <s:property value="CUST_GROUP"/>-->
      <s:property value="ID"/>
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
    <h2 class="tit"><i class="ico-hd"></i><dict:lang value="配置用户角色" /></h2>
  </div>
  <div>
  	<form id="moveform" action="${path}buss/bussModel.ms" method="post">
      <input type="hidden" id="cg_name" name="cg_name" >
      <input type="hidden" id="customer" name="customer" >
      <input type="hidden" id="customer2" name="customer2" >
      <input type="hidden" id="type" name="type" value="">
      <input type="hidden" id="list" name="list" value="">
      <input type="hidden" id="list1" name="list1" value="">
       <input type="hidden" id="ID" name="ID" value="">
  	<div class="container" style="max-height: 450px;">
  		<div class="side" style="height:450px;overflow: auto;"> <!--左 -->
            <ul class="neir-list" id="k">
                <s:iterator value="dataList" ><!--取数据 -->
								<li id="<s:property value="ID"/>" onclick="getinfo(this.id);">
									<a  target="_blank" class="item-con" style="cursor:pointer"><s:property value="NAME"/></a>
								</li>
				        </s:iterator>
            </ul>
       </div>
       <div class="main"><!--右大块 -->
       	  <div class="customer-box"><!--已归属模块 -->
       	  	<div class="tit"><!--标题 -->
                <i class="ico ico-cus"></i><dict:lang value="已配置功能" />
            </div>
            <div class="group"><!--搜索框部分 -->
            	<div class="name"><dict:lang value="查询" /></div>
                  <div class="dec">
                  		<!--<input type="text" id="cu_name" style="width: 173px" onkeyup="search_cu1()" />	-->
                    <select style="width:170px;" class="isSubmit input " id="cu_name" name="cu_name" onchange="search_cu1(this.id)" >
													    <option value="">--请选择--</option>
														<c:forEach items="${dataList2}" var="item" varStatus="status">
															<option value="${item.TAS_MENU_ID}">${item.VALUE}</option>
														</c:forEach>
					</select>
                  </div>
            </div>
           <div class="customer-con block2" id="block2" style="height: 310px;overflow:scroll"><!--已归属客户信息（数据）模块 -->
               <div id="index_tree1" class="ztree">
      		    </div>
          </div>
            
            
          </div>
       	  
       	  <div class="customer-btn" style="height:10px"><!--按钮模块 -->
              <button type="button" id = "b4">&gt;&gt;</button>
              <button type="button" id = "b3">&gt;</button>
              <button type="button" id = "b2">&lt;</button>
              <button type="button" id = "b1">&lt;&lt;</button>	
       	  </div>
       	  
       	  <div class="customer-box head2"><!--未归属模块 -->
       	  	<div class="tit"><!--标题 -->
                <i class="ico ico-cus"></i><dict:lang value="未配置功能" />
            </div>
       	  	 <div class="group"><!--搜索框部分 -->
            	<div class="name"><dict:lang value="查询" /></div>
                  <div class="dec">
                  <!--<input type="text" id="cu_name2" style="width: 173px" onkeyup="search_cu2()">	-->
                  <select style="width:170px;" class="isSubmit input " id="cu_name2" name="cu_name2" onchange="search_cu2(this.id)" >
													    <option value="">--请选择--</option>
														<c:forEach items="${dataList2}" var="item" varStatus="status">
															<option value="${item.TAS_MENU_ID}">${item.VALUE}</option>
														</c:forEach>
					</select>
                  </div>
            </div>
            <div class="customer-con block1" id="block1" style="height: 310px;overflow:scroll"><!--未归属客户信息（数据）模块 -->
                <div id="index_tree" class="ztree">
      		    </div>
          </div>
       	  </div>
       </div>
    </div>
  </form>
  </div>
</div>   
                  
      
                       
           

<script src="${path}/plf/page/fp/js/iframe-design.js"></script>
		<bu:submit viewId="4c5a1c82a3ec4388a5d263f8ed078a62" />
		<bu:script viewId="4c5a1c82a3ec4388a5d263f8ed078a62" />
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
       
        
    </script>
    <script>
            function getinfo(thisObj){
                	projectList=[];
                	projectList1=[];
                	
            	var menuId=$("#cu_name option:selected").val();
           var setting1 = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        },
                       
                },
                callback: {
                        onClick: zTreeOnclick,
                        onAsyncSuccess: zTreeOnAsyncSuccess,
                        onAsyncError: zTreeOnAsyncError,
	                    onCheck: zTreeOnCheck1
                },
                check: {
                        enable: true,
                		chkStyle: "checkbox",
                		chkboxType: { "Y": "s", "N": "ps" }
                },
                async: {
                    enable: true,
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=8b77ec5d7bdd43f8909e388ce9c40157&ID="+thisObj+"&menuId="+menuId,
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
            $.fn.zTree.init($("#index_tree1"),setting1);
            
            getinfos(thisObj);
           
        }
         
    function getinfos(ids){
        var menuId=$("#cu_name2 option:selected").val();
      
        var setting = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        }			
                },
                callback: {
                        onClick: zTreeOnclick,
                        onAsyncSuccess: zTreeOnAsyncSuccess,
                        onAsyncError: zTreeOnAsyncError,
	                    onCheck: zTreeOnCheck
                },
                check: {
                        enable: true,
                		chkStyle: "checkbox",
                		chkboxType: { "Y": "s", "N": "ps" }
                },
                async: {
                    enable: true,
                    url: "${path}buss/bussModel_exeFunc.ms?funcMId=661873cb296b49249696da2fdc11f1c1&ids="+ids+"&menuId="+menuId,
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
             $.fn.zTree.init($("#index_tree"),setting);
    }
    
            
            
    var projectList=[];
    function zTreeOnCheck(event, treeId, treeNode) {
            		//upId
           // alert(treeNode.id + ", " + treeNode.name + "," + treeNode.checked);
             var pNode = treeNode.getParentNode();
             var upId="";
             var upId2="";
            
            if(treeNode.checked==true){
                	if(null!=pNode){
    				
    				 upId = pNode.id;
    				 upId2=pNode.upId;
                    }
				projectList.push({
					    ID:treeNode.id,
					    UPID:upId,
					    UPID2:upId2,
					    TYPE:treeNode.type
					}); 	
            }else{
                for(var i=0;i<projectList.length;i++){
                    if(projectList[i].ID==treeNode.id)
                      projectList.remove(i);
                    
                }
                
            }
        
         $("#list").val(JSON.stringify(projectList)) ;
    };     
    
    var projectList1=[];
    function zTreeOnCheck1(event, treeId, treeNode) {
            		//upId
           // alert(treeNode.id + ", " + treeNode.name + "," + treeNode.checked);
             var pNode = treeNode.getParentNode();
             var upId="";
             var upId2="";
              
            if(treeNode.checked==true){
                	if(null!=pNode){
    				
    				 upId = pNode.id;
    				 upId2=pNode.upId;
                    }
                   
				projectList1.push({
					    ID:treeNode.id,
					    UPID:upId,
					    UPID2:upId2,
					    TYPE:treeNode.type
					}); 	
            }else{
                for(var i=0;i<projectList1.length;i++){
                    if(projectList1[i].ID==treeNode.id)
                      projectList1.remove(i);
                    
                }
                
            }
        
     
         $("#list1").val(JSON.stringify(projectList1)) ;
    };  

            
    function zTreeOnclick(event,treeId,treeNode){
    
            
            		
           // $("#CA_ID").val(treeNode.id);
            
            
		    //getInfo();
    }
    function ajaxDataFilter(treeId,parentNode,responseDate){
                var data = responseDate.ajaxList;
                return data;
    }
	$(function(){
	    
	   // initHeight();
    		newScroll("block1");
    		newScroll("block2");
    });
    var firstAsyncSuccessFlag = 0; 
    function zTreeOnAsyncSuccess(event, treeId, msg){
        if (firstAsyncSuccessFlag == 0) { 
    		var zTree = $.fn.zTree.getZTreeObj("index_tree");
    	        var nodes = zTree.getNodes();
    	        zTree.selectNode(nodes[0]);
    	        zTree.setting.callback.onClick(null, zTree.setting.treeId, nodes[0]);//点击第一个节点
    	        
    	    firstAsyncSuccessFlag = 1;
        }
    }
    function zTreeOnAsyncError(event, treeId, treeNode){
        utilsFp.confirmIcon(3,"","","", "数据加载失败",0,"200","");
    }
  /*     
       $(window).resize(function(){
           initHeight();
       })
function initHeight(){
    	$('.block1').height($(parent.window).height() - 95 - 36 - 6);//65-36-10
    	document.getElementById("block1").style.marginTop="0px";
        	$('.panel-ajax1').height($(window).height() - 97)
 }
*/
function newScroll(id){
		
	  $("#"+ id).mCustomScrollbar({
		axis:"yx",
		snapAmount:40,
		theme:"minimal-dark",
		keyboard:{scrollAmount:40},
		mouseWheel:{deltaFactor:40,preventDefault:true},
		scrollInertia:80,
			
	  });
	}
	first_enter();
       var ids;
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
	 	   $("#k2").append("<li id='id_"+id+"' value="+id+"  onclick=\"getYIdName('id_"+id+"');\" ><i class='ico ico-user'></i><a   target='_blank'>"+username+"</a></li>");   
	 	   }else{
	 	  $("#k1").append("<li id='id_"+id+"'  value="+id+"  onclick=\"getNIdName('id_"+id+"');\" ><i class='ico ico-user'></i><a  target='_blank'>"+username+"</a></li>");
	 	   }
	 	 }	 
	 	 }else{
	 	  
	 	  for(var i=0;i<tr_length2;i++){
	 	 var username2 = $("#table_s tr[id="+i+"]").find("#td01").text();
	 	 var id2 = $.trim($("#table_s tr[id="+i+"]").find("#td02").text());
	 	
	 	   if(id2==cg_name){
	 	    $("#k2").append("<li id='id_"+id2+"' value="+id2+"  onclick=\"getYIdName('id_"+id2+"');\"><i class='ico ico-user'></i><a  target='_blank'>"+username2+"</a></li>"); 
	 	   }else{
	 	  $("#k1").append("<li id='id_"+id2+"'  value="+id2+"  onclick=\"getNIdName('id_"+id2+"');\"><i class='ico ico-user'></i><a  target='_blank'>"+username2+"</a></li>");
	 	   }
	 	 }
	 	 
	 	 } 
 });
	 	   $("#k li:first").click();	 	
		  ids=$("#k li:first").attr("id");
		getinfos(ids);
	 	}
	
	
    
    </script>
    <script>(function($){
  $(window).on('load',function(){
    	setPopScroll('.side');
        setPopScroll('.customer-box .customer-con');
        setPopScroll('.head1 .block1');
  })
})(jQuery)</script>


<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
