<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- 产品静态资源 -->

</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
                <div style="margin-left:40px;">
	               <s:if test="${isDataAuth == '1'}">
		               <span class="dot">*</span><dict:lang value="组织机构" />
		               <s:if test="${fn:length(deptLs)==1}">
		                   	<s:select list="deptLs" listKey="id" listValue="name" name="paraMapObj._DATA_AUTH" 
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		               </s:if>
		               <s:else>
		                	<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
							listKey="id" listValue="name"   name="paraMapObj._DATA_AUTH"
							id="deptLs_data_auth"  cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
				  		</s:else>
     				</s:if>	
               </div>
			    	<div class="optn">
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="mod">

							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="076c88e377ff4b5abf801455c055a202" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="076c88e377ff4b5abf801455c055a202" />
	<input type="hidden" id="prefixInd" name="076c88e377ff4b5abf801455c055a202" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="iframeId" name="iframeId" value="" />
	<input type="hidden" name=iframeIds value="${param.iframeId}">
		<s:set name="_$viewId" value="'2784136ec9e0455fbbb0944da12d6006'" />
		<s:set name="_$formId_1" value="'076c88e377ff4b5abf801455c055a202'" />
		<s:set name="_$type" value="'edit'"/>
	</table>
	<div class="mod" >
    			<div class="mod-bd" style="border-bottom: none;">
    				<div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
    						<div class="datagrid-header" style="width:100%;"> <!--min-width:1500px-->
    							<div class="datagrid-header-inner" style="width:100%;" id="datagrid-header-inner1">
    								<table  class="datagrid-htable fixedTable  " id="datagrid-htable" style="width:800x;">
    									<tbody>
    									<tr class="datagrid-header-row datagrid-title-ajax">
    										<td class="datagrid-cell" style="width:30px;"></td>
    										<td class="datagrid-cell" style="width:30px;">
    										<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItems();" />
    										</td>
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="项目编码" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="项目名称" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="项目描述" /></td >
    										<td class="datagrid-cell" style="width:185px;" ><dict:lang value="管控值" /></td >
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll"   style="height:380px;"><!--min-width:1500px;-->
    							<table class="dlist-table table-line" style="width:800px;table-layout:fixed;"  id="poInfoTable" >
    								<tbody id="poInfoTbody" >
    								</tbody>
    							</table>
    						</div>
    					
    					</div>
    				</div>
    			</div>
    		 </div>	

			<bu:jsVal formId="076c88e377ff4b5abf801455c055a202" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
    	<script>
    	$(function(){
    	    	var datas = "${param.iframeId}";
    	    $("#iframeId").val(datas);
    	   getInfo();
    	})
    	 var trCount=0;	
    	function getInfo(){
    	    var CLAS = "${dataId}";
    	   
    	    if(CLAS==""){
    	        return;
    	    }
    	    console.log(CLAS);
    	    var getInfoUrl="${path}buss/bussModel_exeFunc.ms?funcMId=24b7f18d5783473ca03215ac98495968";
    	    $.ajax({
    	        type:"post",
    	        dataType:"json",
    	        data://"CLAS="+CLAS,
    	         {

                "CLAS" : CLAS,
                },
    	        url:getInfoUrl,
    	        success:function(data){
    	            if(null==data){
    	                return;
    	            }
    	       
    	            if(null!=data.ajaxList){
    	            
    	                	
    	            
    	                var list = eval(data.ajaxList);
    	               
    	               console.log(data.ajaxList);
    	               
    	                for(var i=0; i<list.length;i++){
    	                if(list[i].VR_CLASS==null) list[i].VR_CLASS="";
    	                if(list[i].VR_ITEM==null) list[i].VR_ITEM="";
    	                if(list[i].VR_DESC==null) list[i].VR_DESC="";
    	                if(list[i].VR_VALUE==null) list[i].VR_VALUE="";
    	                
                        						
    	                
    	                $(".dept_select").trigger("chosen:updated");

    	                if(list[i].VR_NAME=="2"){
    	                    var arr=list[i].VR_DESC;
		  
		  	                var len=arr.split("|");
		  	                
		  	 
        		  	    var strs= new Array(); //定义一数组 
        
                        
                        for (var j=0;j<len.length ;j++ ) 
                         { 
                            var h = len[j].split(":");
                            
                            if(h.length >=2){
                                if(h.length==2){
                                strs.push(h[0]);
                                strs.push(h[1]);
                                }
                            }else{
                                
                                var R =len[j].split("：");
                                
                                if(R.length==2){
                                strs.push(R[0]);
                                strs.push(R[1]);
                                }
                            }			
                            
                    
                    
                            } 
                            
            		  	 if(strs.length%2!=0){
            		  	  
            		  	 }else{	
                            console.log("strs:"+strs);
                		     var htmlText = "<select id='wmsSel_"+(trCount+1)+"'  name='VR_VALUE' maxlength='32' class=' input isSubmit  _VAL_OjbsData _VAL_DATABASE dept_select'   >";
                		     htmlText=htmlText+"<option  value=''>"+"---请选择---"+"</option>";
                		     var optin="";
            		  	     for(var k=0;k<strs.length;k++){
            		         if(k%2==0){
            		           optin=optin+"<option  value='"+strs[k]+"'>"+strs[k+1]+"</option>";
            		          
            		             }
            		         }
                		     if(optin!=""){
                		         htmlText=htmlText+optin;
                		     }
                		     htmlText=htmlText+"</select>";
                		    // $("#VR_VALUE").append(htmlText);
                		    // $("#paraMapObj_VR_VALUE").val(list[0].VR_VALUE);
                		  	     
                		  	 }
    	                }else{
    	                    //htmlText=list[i].VR_VALUE +"<input type='hidden' name='VR_VALUE' id='wmsSel_"+(trCount+1)+"' value='"+list[i].VR_VALUE+"'/>";
    	                    htmlText="<input type='text' style='width:120px;' id=id='wmsSel_"+(trCount+1)+"' name='VR_VALUE' value='"+list[i].VR_VALUE+"' maxlength='128' class=' input isSubmit  _VAL_DATABASE'>";
    	                }
    	                 $("#poInfoTbody").append("<tr id='tr2_"+i+"' ></tr>");
						$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
						$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+list[i].VR_CLASS+"' type='checkbox' name='isSelect1'/></td>");
						$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:185px;text-align: center;' title='"+list[i].VR_CLASS+"'>"+list[i].VR_CLASS+"<input type='hidden' name='VR_CLASS' id='VR_CLASS"+list[i].VR_CLASS+"' value='"+list[i].VR_CLASS+"'/></td>");
						$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:185px;text-align: center;' title='"+list[i].VR_ITEM+"'>"+list[i].VR_ITEM+"<input type='hidden'  name='VR_ITEM' value='"+list[i].VR_ITEM+"'/></td>");
						$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:185px;text-align: center;' title='"+list[i].VR_DESC+"'>"+list[i].VR_DESC+"<input type='hidden' name='VR_DESC' id='VR_DESC"+list[i].VR_DESC+"' value='"+list[i].VR_DESC+"'/></td>");
						$("#poInfoTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:185px;text-align: center;' >"+htmlText+"</td>");
						if(list[i].VR_NAME=="2"){
						    mySetChosen();//设置下拉框样式
					        $("#wmsSel_"+(trCount+1)+"_chosen").attr("style","width:120px;");
						    $("#wmsSel_"+(trCount+1)).val(list[i].VR_VALUE);
						      $("#wmsSel_"+(trCount+1)).trigger("chosen:updated");
						}

						  	trCount++;
						  	}
						  		var tableTrJs = $("#poInfoTable tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('poInfoTable');
    	            }
						
    	        },
    	        error:function(msg){
    	         	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
    	            
    	        }
    	    });
    	}
    	
    	//设置下拉框样式
function mySetChosen(){
	
	var curWinHeight = $(document).height();//当前窗口高度
	$(".dept_select").chosen({
		//inherit_select_classes:true,//继承select class
		//width:"100%",
		//disable_search:true,//是否隐藏搜索框
		disable_search_threshold:15//少于15项，隐藏搜索框
	});

	//大于10个选项的，显示搜索框
	var len1 = $(".dept_select").length;
	$(".dept_select").each(function(index,item){
		if(item.id!=""&&item.id.indexOf("#")<0){
		if(item != null && item.length > 10){
			//.chosen-container-single .chosen-search
			$("#"+item.id+"_chosen .chosen-search").css("display","block");
		}

		var offset = $("#"+item.id+"_chosen").offset(); //计算当前下拉框的偏移量
		
		var maxHeight = $("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height").replace("px","");//下拉高度
		
		var searchHeight = 0;//下拉搜索框的高度，默认为0
		//如果有显示搜索框，则需多计算搜索框的高度
		if(!$("#"+item.id+"_chosen .chosen-drop .chosen-search").is(":hidden")){
			searchHeight = 35;
		}
		//如果下拉框在窗口位置比窗口高度的一半还往下，则往上拉
		if(offset.top > (curWinHeight/2)){
			$("#"+item.id+"_chosen .chosen-drop").css({"top":"auto","bottom": "100%","border-top":"1px solid #75c4ff","border-bottom": 0,"background-color":"#f8fcff"});
			//console.log($("#"+item.id+"_chosen .chosen-drop .chosen-results").css("max-height"));
			//console.log(itemHeight);
			if(offset.top < (maxHeight+searchHeight) && offset.top < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":offset.top-5-searchHeight});
			}
		}else{
			var itemHeight = curWinHeight - offset.top;
			if(itemHeight < (maxHeight+searchHeight) && itemHeight < 200){
				$("#"+item.id+"_chosen .chosen-drop .chosen-results").css({"max-height":itemHeight-32-searchHeight});
			}
		}
		}

	});
}



                    var isQuery = false;
                    function edit(thisObj){
                        if($("#poInfoTbody tr").length<=0){
                            return;
                        }
                        if(isQuery){
                        //utilsFp.confirmIcon(3,"","","", "数据正在提交，请稍候...",0,"300","");
                        return;
                        }
                        if(!val.valNullData()){
                            return ;
                        }
                        if(!val.valDataBaseSetData()){
                            return ;
                        }
                        if(!valData()){
                            return ;
                        }
                        if(!val.valOjbsData()){
                            return ;
                        }
                        //解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题    
                        emptyValToHide();
                        $("#saveBtn").prop("disabled",true);
                        // document.forms.editForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=24b7f18d5783473ca03215ac98495968"; 
                         document.forms.editForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=8c0c351e3b3d43c894b60f3f427497de"; 
                        document.forms.editForm.submit();  
                        isQuery = true;
               
                    }
    	
    	
    		   	    //点击行寄选中该行
function clickTr(tableId){
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=checkbox]").unbind("click");
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :checkbox").attr("checked")) {
				$("#"+trId+" :checkbox").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='checkbox']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :checkbox").prop("checked",true);
				$("#"+trId).css("background-color","#d3eafc");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#d3eafc");
			  }
		  });
}	
//全选2
     	function getAllItems(){
		if($("#allSelects").attr("checked")=="checked"){
			$("#poInfoTbody :checkbox").attr("checked",true);
		}else{
			$("#poInfoTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	} 
    	</script>
    	</script>
	<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
    setPopScroll('.scroll');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
