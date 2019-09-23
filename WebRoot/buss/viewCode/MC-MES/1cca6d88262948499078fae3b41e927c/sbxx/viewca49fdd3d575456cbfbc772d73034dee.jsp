<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="新增设备信息" /></title>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<link href="${path}plf/page/common/msui/css/css_tab.css"
	rel="stylesheet" type="text/css" />
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
<style type="text/css">
/*.input {
	width:200px !important;
}*/
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: #f8fcff;
	z-index: 1001;
	opacity: 0.5;
	filter: alpha(opacity = 88);
}
#llll div img{
    height:120px!important;
    width:159px!important;
        margin-bottom:3px;
}
.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 60%;
	padding: 10px;
	border: 1px solid #cbe9ff;
	background-color: #f8fcff;
	z-index: 1002;
	overflow: auto;
}

.white_contents {
	display: none;
	position: absolute;
	top: 15%;
	left: 2%;
	width: 94%;
	height: 65%;
	padding: 10px;
	border: 1px solid #cbe9ff;
	background-color: #f8fcff;
	z-index: 1002;
	overflow: auto;
}
		#container #content ul{
	    margin:0;
	}
	
	#container #content li{
	    margin:0;
	}

		.datagrid-header,.datagrid-div3{
	       		width:100% !important;
	        }
	
	</style>
	
	<!-- head里面 -->
<script>
		function init(){
		$("#tag1").addClass("current");
		var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
		
		//_toClickColor(tableTrJs);
		//_tongLineColor(tableTrJs);
		//clickTr();
	/*	$("#allSelect").click(function(){
		console.log(333);
    			if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
			});
		}*/
	}
	</script>
<script type="text/javascript">
	var loaded = 1;
	var tab_len = 2;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		for (i = 1; i < (tab_len + 1); i++) {
			if ("tag" + i == tag) {
				document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
				document.getElementById(tag).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "selectspan1";
			} else {
				document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
				document.getElementById("tag" + i).getElementsByTagName("a")[0]
						.getElementsByTagName("span")[0].className = "";
			}
			$("#" + tag).addClass("current").siblings().removeClass("current");
			if ("content" + i == content) {
				currentTag = tag;
				document.getElementById(content).className = "";
			} else {
				document.getElementById("content" + i).className = "hidecontent";
			}
			document.getElementById("content").className = content;
		}
	}

</script>
<script type="text/javascript">
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
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=checkbox]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
		}
						
    
		function popLoadpointDiv(showId,backId){
			/*document.getElementById(showId).style.display = 'block';
			document.getElementById(backId).style.display = 'block';*/
			$("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			//$('.chosen-container').css("width","230px");
		}
		var tCount=0;
		//var trCount = 0;
		function delLoadpointRow(){
		//alert(trCount);
		//var tempTrCount = 0;
		var falg = 0; 
		$("input[name='isSelect1']:checkbox").each(function () { 
			if ($(this).attr("checked")) { 
			falg =1; 
			} 
			});
			if (falg > 0) {
		$("input[name='isSelect1']:checked").each(function() { // 遍历选中的checkbox
	            var n = $(this).parents("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").index();  // 获取checkbox所在行的顺序
	            var temp=$(this).val();
			var hidDiv="#hidDiv_"+temp;
			$(hidDiv).html("");	
	            //tempTrCount++;
	          
	           
	            var trId=document.getElementById(temp);
	            var table1=document.getElementById("addLoadPoint");
	            table1.removeChild(trId);
	             //$("#loadPoint").find("tr:eq("+temp+")").remove();
        	 });
        	 tCount=0;
        	 $("#addLoadPoint tr").each(function(){ 
        	 tCount++;
                     $(this).children("td:first").html(tCount); 
                     
                 }) ;
                   //alert(trCount-tempTrCount);
        	 }else 
        	 utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
		}
		
		function hideDiv(showId,backId){
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			document.getElementById("CDL_TABLE").value="";
			document.getElementById("CDL_LOADPOINT").value="";
			document.getElementById("TRACK_TYPE").value="A";
			document.getElementById("CDL_MEMO").value="";
			document.getElementById("CDL_TABLE_err").innerHTML="";
			document.getElementById("CDL_LOADPOINT_err").innerHTML="";

			document.getElementById("CDL_TABLE1").value="";
			document.getElementById("CDL_LOADPOINT_PREFIX").value="";
			document.getElementById("CDL_STAR").value="";
			document.getElementById("CDL_LOADPOINT_COUNT").value="";
			document.getElementById("TRACK_TYPE1").value="A";
			document.getElementById("CDL_MEMO1").value="";
			document.getElementById("CDL_TABLE1_err").innerHTML="";
			document.getElementById("CDL_STAR_err").innerHTML="";
			document.getElementById("CDL_LOADPOINT_COUNT_err").innerHTML="";
			$("#"+showId+",#"+backId).hide();
		}

		function changeWay(){
			var addWay = document.getElementById("addWay").value;
			if(addWay=="1"){
				document.getElementById("addDiv1").style.display="none";
				document.getElementById("addDiv2").style.display="";
			}else{
				document.getElementById("addDiv2").style.display="none";
				document.getElementById("addDiv1").style.display="";
			}	
		}

		var rowIdStr = "";
		function trGroup(rowId){
			rowIdStr  = rowId;
			//document.getElementById("'"+rowId+"'").style.backgroundColor = 'blue';
		}
	
		var trCount = 0;
		function addLoadPoint(showId,backId){
			if(!checkData()){
      				return ;
  			}
  		        var loadPointCount = $("#CDL_LOADPOINT_COUNT").val();
    			var addWay2 = document.getElementById("addWay").value;
			var nums1 =0;
			var table1 = $("#CDL_TABLE1").val();
			//alert(loadPointCount);
			//2018-6-21 判断table和轨道的对应唯一性
			if(addWay2=="0"){
			    	var nums =0;
			    	
    			var table = $("#CDL_TABLE").val();
    		
    			if( $("#addLoadPoint").find("tr").length >= 1){
    			    
    			 $("#addLoadPoint tr").each(function(i){  
                    var text = $(this).children("td:nth-child(3)").text();//td:nth-child(3) 第三列 
                  
    			     	if(text==table){
    			     	   var texts = $(this).children("td:nth-child(5)").text();//td:nth-child(4) 第三列 		
                            							
                           // var typeVal=$("#CDL_TRACK_"+(i+1)).val();
                             var typeVal = $(this).children("td:nth-child(7)").text();//td:nth-child(4) 第三列 	
                          	//  var	 hh=$('#TRACK_TYPE').find('option:selected').text();
                         //    var typeVals=	$('#TRACK_TYPE').val();	
                             /*
    			     	   if(texts != $('#TRACK_TYPE').find('option:selected').text()){
    			     	         
    			     	       nums++;
    			     	       return;
    			     	   }*/
    			     	   if(typeVal != $('#TRACK_TYPE').val()){
    			     	         
    			     	       nums++;
    			     	       return;
    			     	   }
    			     	}
                });  
                
                               
			                    }
			   	
			   	
			 
			   if(nums>0){
			    var TRACK_TYPES1 = document.getElementById("TRACK_TYPE");
				_alertValMsg(TRACK_TYPES1,"<dict:lang value="相同的Table里轨道必须相同" />");
			       return 	false;
			   }
			   
			    
			   
				trCount++;
				 var tempTable="CDL_TABLE_"+trCount;
				 var tempLoadPoint="CDL_LOADPOINT_"+trCount;
				 var tempTrack="CDL_TRACK_"+trCount;
				 var tempMemo="CDL_MEMO_"+trCount;
				 var divN="<div id='hidDiv_"+trCount+"'>"+
						"<input name='"+tempTable+"' type='hidden' id='"+tempTable+"' value='"+$("#CDL_TABLE").val()+"'>"+
						"<input name='"+tempLoadPoint+"' type='hidden' id='"+tempLoadPoint+"' value='"+$("#CDL_LOADPOINT").val()+"'>"+
						"<input name='"+tempTrack+"' type='hidden' id='"+tempTrack+"' value='"+$("#TRACK_TYPE").val()+"'>"+
						"<input name='"+tempMemo+"' type='hidden' id='"+tempMemo+"' value='"+$("#CDL_MEMO").val()+"'>"+
						"</div>";
			//	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);
				//$("#loadPoint tbody:last").append("<tr id='"+trCount+"' onclick=\"trGroup('"+trCount+"');\"></tr>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+trCount+"' ></tr>");
				//$("#datagrid-body").css("height","222px;");
				//alert($("#loadPoint tr").length);
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length+"</td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' name='CDL_TABLE' align='left' style='width:141px;'>"+$("#CDL_TABLE").val()+"<input name='"+tempLoadPoint+"' type='hidden' id='"+tempLoadPoint+"' value='"+$("#CDL_LOADPOINT").val()+"'></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' name='CDL_LOADPOINT' align='left' style='width:144px;'>"+$("#CDL_LOADPOINT").val()+"<input name='"+tempTable+"' type='hidden' id='"+tempTable+"' value='"+$("#CDL_TABLE").val()+"'></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' name='TRACK_TYPES' align='left' style='width:147px;'>"+$('#TRACK_TYPE option:selected').text()+"<input type='hidden' id='TRACK_TYPE_"+trCount+"'  name='TRACK_TYPE' value='"+$("#TRACK_TYPE").val()+"' /></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' name='CDL_MEMO' align='left' style='width:379px;'><div>"+$("#CDL_MEMO").val()+"</div><input name='"+tempTrack+"' type='hidden' id='"+tempTrack+"' value='"+$("#TRACK_TYPE").val()+"'></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='display:none;' id='TRACK_TYPES_"+trCount+"' >"+$("#TRACK_TYPE").val()+"<input name='"+tempMemo+"' type='hidden' id='"+tempMemo+"' value='"+$("#CDL_MEMO").val()+"'></td>");
				var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
				_tongLineColor(tableTrJs);
				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
				//	$("#comp").val($("#TRACK_TYPE").val());
			}else if(addWay2=="1"){
			//2018-6-21 当料站值小于等于1 时 对于轨道的判断
				if(loadPointCount<=1){
					var tableWork1 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
					var count1= tableWork1.rows.length;//alert(tableWork1.rows[i].cells[1].innerHTML);
					if (count1>0) {
					    	
							for ( var j = 0; j < count1; j++) {
								if ($("#CDL_TABLE1").val() == tableWork1.rows[j].cells[2].innerHTML && ($("#CDL_LOADPOINT_PREFIX").val()+$("#CDL_STAR").val()) == tableWork1.rows[j].cells[3].innerHTML) {
								var CDL_TABLE1 = document.getElementById("CDL_TABLE1");
								_alertValMsg(CDL_TABLE1,"<dict:lang value="相同的Table里料站不能相同" />");
								return false;
				            }
						 }
            		
                			 	
                			 
                			 $("#addLoadPoint tr").each(function(i){  
                                var text1 = $(this).children("td:nth-child(3)").text();//td:nth-child(3) 第三列 
                               
                			     	if(text1==table1){
                			     	   var texts1 = $(this).children("td:nth-child(5)").text();//td:nth-child(4) 第三列 		
                                        //var typeVals=$("#CDL_TRACK_"+(i+1)).val();							
                                        var typeVals = $(this).children("td:nth-child(7)").text();//td:nth-child(4) 第三列 	
                                        var	 hh1=$('#TRACK_TYPE1').val();
                                         		
                			     	   if(typeVals != hh1){
                			     	         
                			     	       nums1++;
                			     	       return;
                			     	   }
                			     	}
                            });  
                            if(nums1>0){
                    			    var TRACK_TYPES2 = document.getElementById("TRACK_TYPE1");
                    				_alertValMsg(TRACK_TYPES2,"<dict:lang value="相同的Table里轨道必须相同" />");
                    			       return 	false;
                    			   }
                                			  
            					}

					
					
					trCount++;
					
					  var tempTable="CDL_TABLE_"+trCount;
				      var tempLoadPoint="CDL_LOADPOINT_"+trCount;
					  var tempTrack="CDL_TRACK_"+trCount;
					  var tempMemo="CDL_MEMO_"+trCount;
					var divN="<div id='hidDiv_"+trCount+"'>"+
						"<input name='"+tempTable+"' type='hidden' id='"+tempTable+"' value='"+$("#CDL_TABLE1").val()+"'>"+
						"<input name='"+tempLoadPoint+"' type='hidden' id='"+tempLoadPoint+"' value='"+$("#CDL_LOADPOINT_PREFIX").val()+$("#CDL_STAR").val()+"'>"+
						"<input name='"+tempTrack+"' type='hidden' id='"+tempTrack+"' value='"+$("#TRACK_TYPE1").val()+"'>"+
						"<input name='"+tempMemo+"' type='hidden' id='"+tempMemo+"' value='"+$("#CDL_MEMO1").val()+"'>"+
						"</div>";
				//	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);
					
			$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+trCount+"' ></tr>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' name='CDL_TABLE' align='left' style='width:141px;'>"+$("#CDL_TABLE1").val()+"<input name='"+tempTable+"' type='hidden' id='"+tempTable+"' value='"+$("#CDL_TABLE1").val()+"'></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' name='CDL_LOADPOINT' align='left' style='width:144px;'>"+$("#CDL_LOADPOINT_PREFIX").val()+$("#CDL_STAR").val()+"<input name='"+tempLoadPoint+"' type='hidden' id='"+tempLoadPoint+"' value='"+$("#CDL_LOADPOINT_PREFIX").val()+$("#CDL_STAR").val()+"'></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' name='TRACK_TYPE' align='left' style='width:147px;'>"+$('#TRACK_TYPE1 option:selected').text()+"<input type='hidden' id='TRACK_TYPE_"+trCount+"' name='TRACK_TYPE' value='"+$("#TRACK_TYPE1").val()+"'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' name='CDL_MEMO' align='left' style='width:379px;'>"+$("#CDL_MEMO1").val()+"<input name='"+tempTrack+"' type='hidden' id='"+tempTrack+"' value='"+$("#TRACK_TYPE1").val()+"'></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='display:none;' id='TRACK_TYPES_"+trCount+"' >"+$("#TRACK_TYPE1").val()+"<input name='"+tempMemo+"' type='hidden' id='"+tempMemo+"' value='"+$("#CDL_MEMO1").val()+"'></td>");
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					
				//当料站值大于1的情况下，轨道和table的对应唯一性
				}else if(loadPointCount>1){
				
			if( $("#addLoadPoint").find("tr").length >= 1){
    			    
    			 $("#addLoadPoint tr").each(function(i){  
                    var text = $(this).children("td:nth-child(3)").text();//td:nth-child(3) 第三列 
                
    			     	if(text==table1){
    			     	   var text1 = $(this).children("td:nth-child(5)").text();//td:nth-child(4) 第三列 		
                            //var typeVala=$("#CDL_TRACK_"+(i+1)).val();
                             var typeVala = $(this).children("td:nth-child(7)").text();//td:nth-child(4) 第三列 
                           			
                            var	 hhs=$('#TRACK_TYPE1').val();
                         			
    			     	   if(typeVala != hhs){
    			     	         
    			     	       nums1++;
    			     	       return;
    			     	   }
    			     	}
                });  
			   }
			   	
			   if(nums1>0){
			    var TRACK_TYPES = document.getElementById("TRACK_TYPE1");
				_alertValMsg(TRACK_TYPES,"<dict:lang value="相同的Table里轨道必须相同" />");
			       return 	false;
			   }
				
					for(var i=1;i<=loadPointCount;i++){
						var tableWork2 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
						
						var count2= tableWork2.rows.length;
					
						if (count2>0) {	

                            


							for ( var k = 0; k < count2; k++) {
								if ($("#CDL_TABLE1").val() == tableWork2.rows[k].cells[2].innerHTML && ($("#CDL_LOADPOINT_PREFIX").val()+(parseInt($("#CDL_STAR").val())+i-1)) == tableWork2.rows[k].cells[3].innerHTML) {
								var CDL_TABLE1 = document.getElementById("CDL_TABLE1");
								_alertValMsg(CDL_TABLE1,"<dict:lang value="相同的Table里料站不能相同" />");
								return false;
								}
						//		if ($("#TRACK_TYPE1").val() == tableWork2.rows[k].cells[6].innerHTML && ($("#CDL_TABLE1").val() == tableWork2.rows[k].cells[2].innerHTML) {
						//		var TRACK_TYPE1 = document.getElementById("TRACK_TYPE1");
						//		_alertValMsg(TRACK_TYPE1,"<dict:lang value="相同的Table里轨道不能不相同" />");
						//		return false;
						//		}	
							}
						}
					
						trCount=trCount+1;
						  var tempTable="CDL_TABLE_"+trCount;
						  var tempLoadPoint="CDL_LOADPOINT_"+trCount;
						  var tempTrack="CDL_TRACK_"+trCount;
						  var tempMemo="CDL_MEMO_"+trCount;
						 var divN="<div id='hidDiv_"+trCount+"'>"+
						"<input name='"+tempTable+"' type='hidden' id='"+tempTable+"' value='"+$("#CDL_TABLE1").val()+"'>"+
						"<input name='"+tempLoadPoint+"' type='hidden' id='"+tempLoadPoint+"' value='"+$("#CDL_LOADPOINT_PREFIX").val()+(parseInt($("#CDL_STAR").val())+i-1)+"'>"+
						"<input name='"+tempTrack+"' type='hidden' id='"+tempTrack+"' value='"+$("#TRACK_TYPE1").val()+"'>"+
						"<input name='"+tempMemo+"' type='hidden' id='"+tempMemo+"' value='"+$("#CDL_MEMO1").val()+"'>"+
						"</div>";
						var hH = (parseInt($("#CDL_STAR").val())+i-1);
					//	$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+trCount+"' ></tr>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length+"</td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' name='CDL_TABLE' align='left' style='width:141px;'>"+$("#CDL_TABLE1").val()+"<input name='"+tempTable+"' type='hidden' id='"+tempTable+"' value='"+$("#CDL_TABLE1").val()+"'></td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' name='CDL_LOADPOINT' align='left' style='width:144px;'>"+$("#CDL_LOADPOINT_PREFIX").val()+(parseInt($("#CDL_STAR").val())+i-1)+"<input name='"+tempLoadPoint+"' type='hidden' id='"+tempLoadPoint+"' value='"+$("#CDL_LOADPOINT_PREFIX").val()+(parseInt($("#CDL_STAR").val())+i-1)+"'></td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' name='TRACK_TYPE' align='left' style='width:147px;'>"+$('#TRACK_TYPE1 option:selected').text()+"<input type='hidden' id='TRACK_TYPE_"+trCount+"'  name='TRACK_TYPE' value='"+$("#TRACK_TYPE1").val()+"'/></td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' name='CDL_MEMO' align='left' style='width:379px;'>"+$("#CDL_MEMO1").val()+"<input name='"+tempTrack+"' type='hidden' id='"+tempTrack+"' value='"+$("#TRACK_TYPE1").val()+"'></td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='display:none;' id='TRACK_TYPES_"+trCount+"' >"+$("#TRACK_TYPE1").val()+"<input name='"+tempMemo+"' type='hidden' id='"+tempMemo+"' value='"+$("#CDL_MEMO1").val()+"'></td>");
						var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
						_tongLineColor(tableTrJs);
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					}
				}
			}
			//trCount++;
			document.getElementById("CDL_TABLE").value="";
			document.getElementById("CDL_LOADPOINT").value="";
			document.getElementById("TRACK_TYPE").value="A";
			document.getElementById("CDL_MEMO").value="";

			document.getElementById("CDL_TABLE1").value="";
			document.getElementById("CDL_LOADPOINT_PREFIX").value="";
			document.getElementById("CDL_STAR").value="";
			document.getElementById("CDL_LOADPOINT_COUNT").value="";
			document.getElementById("TRACK_TYPE1").value="A";
			document.getElementById("CDL_MEMO1").value="";
			
			/*document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';*/
			$("#"+showId+",#"+backId).hide();
			$("#saveInfo").attr("onclick","addCal("+trCount+")");
			clickTr("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			return;
		}
		window.onload = function() {
        	$('#saveInfo').attr("onclick","addCal('"+trCount +"')"); 
        	$('#paraMap0_CD_VALID_FLAG_1').attr("checked","checked");
  		}
		function checkData(){
			var addWay1 = document.getElementById("addWay").value;
			document.getElementById("CDL_TABLE_err").innerHTML="";
			document.getElementById("CDL_LOADPOINT_err").innerHTML="";
			document.getElementById("CDL_TABLE1_err").innerHTML="";
			document.getElementById("CDL_STAR_err").innerHTML="";
		//	document.getElementById("TRACK_TYPE_err").innerHTML="";
			document.getElementById("CDL_LOADPOINT_COUNT_err").innerHTML="";
			
			var tableWork = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			
			var count = tableWork.rows.length;
		        		

			if (addWay1=="0") {
				if($("#CDL_TABLE").val() == null || $("#CDL_TABLE").val() ==""){
					//document.getElementById("CDL_TABLE_err").innerHTML="<dict:lang value="Table名称不能为空" />";
					//window.setTimeout("closeValMsg('CDL_TABLE_err')", 2000);
					var CDL_TABLE = document.getElementById("CDL_TABLE");
					_alertValMsg(CDL_TABLE,"<dict:lang value="Table名称不能为空" />");
					return false;
				}
				if($("#CDL_LOADPOINT").val() == null || $("#CDL_LOADPOINT").val() ==""){
					var CDL_LOADPOINT = document.getElementById("CDL_LOADPOINT");
					_alertValMsg(CDL_LOADPOINT,"<dict:lang value="料站不能为空" />");
					return false;
				}
				if (count>0) {
					for ( var i = 0; i < count; i++) {
						if ($("#CDL_TABLE").val() == tableWork.rows[i].cells[2].innerHTML && $("#CDL_LOADPOINT").val() == tableWork.rows[i].cells[3].innerHTML) {
								var CDL_TABLE = document.getElementById("CDL_TABLE");
								_alertValMsg(CDL_TABLE,"<dict:lang value="相同的Table里料站不能相同" />");
								return false;
							}
					//	if ($("#TRACK_TYPE").val() == tableWork.rows[i].cells[4].innerHTML && $("#CDL_TABLE").val() == tableWork.rows[i].cells[2].innerHTML) {
					//			var TRACK_TYPE = document.getElementById("TRACK_TYPE");
					//			_alertValMsg(TRACK_TYPE,"<dict:lang value="相同的Table里轨道不能不相同" />");
					//			return false;
					//		}
						}
			        }
				
				
			}else if(addWay1=="1"){
				if($("#CDL_TABLE1").val() == null || $("#CDL_TABLE1").val() ==""){
					var CDL_TABLE1 = document.getElementById("CDL_TABLE1");
					_alertValMsg(CDL_TABLE1,"<dict:lang value="Table名称不能为空" />");
					return false;
				}
				if($("#CDL_STAR").val() == null || $("#CDL_STAR").val() ==""){
					var CDL_STAR = document.getElementById("CDL_STAR");
					_alertValMsg(CDL_STAR,"<dict:lang value="起始流水不能为空" />");
					return false;
				}
				if($("#CDL_LOADPOINT_COUNT").val() == null || $("#CDL_LOADPOINT_COUNT").val() ==""){
					var CDL_LOADPOINT_COUNT = document.getElementById("CDL_LOADPOINT_COUNT");
					_alertValMsg(CDL_LOADPOINT_COUNT,"<dict:lang value="料站数量不能为空" />");
					return false;
				}
				//	if (count>1) {
				//	for ( var i = 1; i < count; i++) {
					//	if ($("#TRACK_TYPE1").val() == tableWork.rows[i].cells[4].innerHTML && $("#CDL_TABLE1").val() == tableWork.rows[i].cells[2].innerHTML) {
					//			var TRACK_TYPE1 = document.getElementById("TRACK_TYPE1");
					//			_alertValMsg(TRACK_TYPE1,"<dict:lang value="相同的Table里轨道不能不相同" />");
					//			return false;
					//		}
				//}
				
				/*if (count>1) {
					for ( var i = 1; i < count; i++) {
						if ($("#CDL_TABLE1").val() == tableWork.rows[i].cells[1].innerHTML) {
								document.getElementById("CDL_TABLE1_err").innerHTML = "<dict:lang value="Table名称已存在" />";
								return false;
							}
						}
				}*/
			}
			return true;
		}
			function allCheck(){
    if($("#allSelect").attr("checked") == "checked"){
        			$("input[name='isSelect1']").attr("checked","checked");
    			}else{
        			$("input[name='isSelect1']").removeAttr("checked","checked");
    			}
}
</script>
<style type="text/css">
		.black_overlay{
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: #f8fcff;
			z-index: 1001;
			opacity:0.5;
			filter:alpha(opacity=88);	
		}
		.white_content{
			display: none;
			position: absolute;
			top: 25%;
			left: 25%;
			width: 50%;
			height: 65%;
			padding: 10px;
			border: 1px solid #cbe9ff;
			background-color: #f8fcff;
			z-index: 1002;
			overflow: auto;
		}
</style>
<script type="text/javascript">
	$("#paraMap1_CD_PICTURE").live('change',function(e){
	var $file = $(this);
        var fileObj = $file[0];
        if(fileObj && fileObj.files && fileObj.files[0]){
	  var objUrl = getObjectURL(this.files[0]) ;
	  if (objUrl) {
		$("#img0").attr("src", objUrl) ;
			$("#img0").attr("src", "111111111111111") ;
	   }
}
else{
//IE下，使用滤镜

                fileObj.select();
                var hhotoObj = document.getElementById("paraMap1_CD_PICTURE");
		var imgObjPreview = document.getElementById("img0");
			hhotoObj.select();
			var imgSrc = document.selection.createRange().text;
			var imgId = document.getElementById("photoImg");
			imgId.style.width = '180px';
			imgId.style.height = '120px';
			try {
				imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				//utilsFp.alert("<dict:lang value='您上传的图片格式不正确' />");
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="您上传的图片格式不正确" />",0,"","");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty(); 
}
}) ;

function getObjectURL(file) {
	var url = null ; 
	if (window.createObjectURL!=undefined) { // basic
		url = window.createObjectURL(file) ;
	} else if (window.URL!=undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file) ;
	} else if (window.webkitURL!=undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file) ;
	}
	return url ;
}

</script>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 

</head>
<body >
	<DIV class="multilist comwrap content-in">
		<div class="edit">
		<form id="addCalForm" name="addCalForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame" style="height:300px;">
       <div class="hd">
           
                <!--<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>-->
                <div style="margin-left:10px;">
                           <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                           	<s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
					id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                		<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
					listKey="id" listValue="name"  name="_DATA_AUTH"
					id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   		</s:else>
                		</s:if>	
                	</div>
			    <div class="optn">
			        <button type="button" onclick="addCal();" id="saveInfo"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>

			</div>

				<div class="js-tab">
					<DIV id="container" style="padding: 0 20px;box-sizing: border-box;height:500px;">
						<DIV >
							<UL class="tab-list tab">
								<LI id="tag1"><A class="selectli1"
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="基本信息" /></SPAN>
								</A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','${path}buss/bussModel.ms?exeid=b3d19dd778dc4bf6ae463d3c3a396e30');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="料站信息" /></SPAN> </A>
								</LI>

							</UL>
						</DIV>
					<!--<form id="addCalForm" name="addCalForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame" style="margin-top: 20px;height:300px;">-->
						
						<DIV class="content1" id="content">
							<DIV id="content1">
								
									<input type="hidden" name="exeid" value="${exeid}"> 
									<input type="hidden" name="iframeId" value="${iframeId}"> 
									<input type="hidden" name="definedMsg" value="${definedMsg}">
									<input type="hidden" name="formId" value="99338dfb95df4eec8d5714a4e773b127" />
									<!--<s:hidden
										name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}"
										value="%{FUNC_CODE_2}" />-->
									<s:token />
									<table class="func_table">
										<tr>
											<td width="100%" align="right"></td>
										</tr>
									</table>
									<bu:set name="paraMapObj" value="${dataId}"
										formId="99338dfb95df4eec8d5714a4e773b127" type="add" />
									<table class="basic-table">
										<input type="hidden" name="formIds"
											value="99338dfb95df4eec8d5714a4e773b127" />
										<input type="hidden" name="99338dfb95df4eec8d5714a4e773b127"
											value="paraMap0@" />
										<input type="hidden" name="paraMap0@__LEVEL__" value="0" />
										<input type="hidden" name="paraMap0@__DATA_COUNT__" value="1" />
										<s:set name="_$viewId"
											value="'ca49fdd3d575456cbfbc772d73034dee'" />
										<s:set name="_$formId_1"
											value="'99338dfb95df4eec8d5714a4e773b127'" />
										<s:set name="_$type" value="'add'" />
										<tr>
											<td class="name" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="CD_DEVICE_SN"
												formId="99338dfb95df4eec8d5714a4e773b127"/>
											</td>
											<bu:td cssClass="dec" colNo="CD_DEVICE_SN"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_DEVICE_SN"  style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_DEVICE_SN}" formIndex="0"  cssClass="_VAL_NULL input isSubmit"/>
											</bu:td>
											<td class="name" style="width:80px"/><span class="dot">*</span><bu:uitn colNo="CD_DEVICE_NAME"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_DEVICE_NAME"   style="width:230px"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_DEVICE_NAME" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_DEVICE_NAME}" formIndex="0" />
											</bu:td>
											<td class="name" rowspan="5"  style="width:64px;vertical-align: bottom;"/><bu:uitn colNo="CD_PICTURE" formId="99338dfb95df4eec8d5714a4e773b127" /></td>	
											<td class="dec" rowspan="5" id="llll" style="width:200px;vertical-align: bottom;">
												<bu:ui colNo="CD_PICTURE" name="upFile" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_PICTURE}" formIndex="1"  />
											</td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="CD_DEVICE_SPEC"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_DEVICE_SPEC"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_DEVICE_SPEC" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_DEVICE_SPEC}" formIndex="0" />
											</bu:td>
											<td class="name" /><span class="dot">*</span><bu:uitn colNo="CD_DEVICE_TYPE"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_DEVICE_TYPE"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_DEVICE_TYPE" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_DEVICE_TYPE}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" /><span class="dot">*</span><bu:uitn colNo="CD_DEVICE_CLASS"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_DEVICE_CLASS"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_DEVICE_CLASS" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_DEVICE_CLASS}" formIndex="0" />
											</bu:td>
											<td class="name" />
											<bu:uitn colNo="CD_VALID_FLAG"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_VALID_FLAG"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_VALID_FLAG"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_VALID_FLAG}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="CD_USE_DEP"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_USE_DEP"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_USE_DEP" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_USE_DEP}" formIndex="0" />
											</bu:td>

											<td class="name" /><span class="dot">*</span><bu:uitn colNo="CD_CHARGE_MAN"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_CHARGE_MAN"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_CHARGE_MAN" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_CHARGE_MAN}" formIndex="0" />
											</bu:td>
										</tr>
										
										
										
											<tr>
											<td class="name" />
											<bu:uitn colNo="CD_CHARGE_MAN_TWO"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_CHARGE_MAN_TWO"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_CHARGE_MAN_TWO" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_CHARGE_MAN_TWO}" formIndex="0" />
											</bu:td>

											<td class="name" />
											<bu:uitn colNo="CD_CHARGE_MAN_THREE"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_CHARGE_MAN_THREE"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_CHARGE_MAN_THREE" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_CHARGE_MAN_THREE}" formIndex="0" />
											</bu:td>
										</tr>
										
										
										<tr>
											<td class="name" />
											<bu:uitn colNo="CD_STATUS"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_STATUS"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_STATUS" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_STATUS}" formIndex="0" />
											</bu:td>

											<td class="name" /><span class="dot">*</span><bu:uitn colNo="CD_PRODECT_DATE"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_PRODECT_DATE"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_PRODECT_DATE" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_PRODECT_DATE}" formIndex="0" />
											</bu:td>
										</tr>
										<tr>
											<td class="name" /><span class="dot">*</span><bu:uitn colNo="CD_BUY_DATE"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_BUY_DATE"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_BUY_DATE" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_BUY_DATE}" formIndex="0" />
											</bu:td>

											<td class="name" />
											<bu:uitn colNo="CD_SUPPLIER_ID"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_SUPPLIER_ID"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_SUPPLIER_ID" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													value="%{CD_SUPPLIER_ID}" formIndex="0"  />
											</bu:td>
											
											<td class="name" />
											<bu:uitn colNo="CD_LOCATION"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_LOCATION"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_LOCATION" style="width:231px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													
													value="%{CD_LOCATION}" formIndex="0"  />
											</bu:td>
										</tr>
										<!--
										<tr>
											<td class="name"><span>设备文件<span></span></span></td>
											<td class="dec" ><input type="file" style="width:200px;" multiple="multiple" id="" name="upFile" value="" class=" input isSubmit  _VAL_OjbsData"></td>
										</tr>
										<tr>
											<td class="name"/>设备文件</td>
											<td class="dec" colspan="5">
											<div id="myDiv" style="height:80px;border:1px solid #ccc">
											</div>
											</td>
										</tr>
										-->
										<tr>
										    <td class="name" style="width:110px;" /><span class="dot">*</span>
											<bu:uitn colNo="CD_CYCLE"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_CYCLE"
												formId="99338dfb95df4eec8d5714a4e773b127">
												<bu:ui colNo="CD_CYCLE" style="width:200px;"
													formId="99338dfb95df4eec8d5714a4e773b127"
													
													value="%{CD_CYCLE}" formIndex="0"  />
											</bu:td>
										
											<td class="name" />
											<bu:uitn colNo="CD_FILES"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_FILES" style="width:80px;"
												formId="99338dfb95df4eec8d5714a4e773b127" colspan="3">
												<bu:ui colNo="CD_FILES"
													formId="99338dfb95df4eec8d5714a4e773b127" 
													value="%{CD_FILES}" formIndex="0" style="width:470px;height:100%;"/>
											</bu:td>
										</tr>
										<tr>
											<td class="name" />
											<bu:uitn colNo="CD_MEMO"
												formId="99338dfb95df4eec8d5714a4e773b127" />
											</td>
											<bu:td cssClass="dec" colNo="CD_MEMO" style="width:80px;"
												formId="99338dfb95df4eec8d5714a4e773b127" colspan="5">
												<bu:ui colNo="CD_MEMO"
													formId="99338dfb95df4eec8d5714a4e773b127" rows="4"
													value="%{CD_MEMO}" formIndex="0" style="width:810px;height:100%;"/>
											</bu:td>
										</tr>

									</table>
									<bu:jsVal formId="99338dfb95df4eec8d5714a4e773b127"
										formIndex="0" />
										
								
							</DIV>
							<DIV id="content2"  style="display:none">  <%-- <bu:addcp exeid="%{exeid}" />   --%>
									
										<!-- <iframe id="iframe2" name="iframe2" frameBorder="0"
												src='' width="100%" scrolling="auto" height="400"
												onload="dynIframesize('iframe2');"></iframe> -->
												
							 <div >
							 <bu:funcsi viewId="ca49fdd3d575456cbfbc772d73034dee" funcId="ed334aadf26347b78c1dcaa1b677691a" isHidden="1"/>
							 <div id="back" class="black_overlay"/></div>
							<!-- addFCWT begin -->
								<div class="dialog dialog-s1" id="addFCWT"
											style="display:none;z-index:1030;margin-left:0px;left:260px;top:15px;width:390px;height:330px;">
											<div class="dialog-hd">
												<h3 class="tit">
													<dict:lang value="料站信息" />
												</h3>
											</div>
						<a class="dialog-close" href="javascript:void(0);"
								onclick="hideDiv('addFCWT','back');"></a>
							<div class="dialog-bd" style="width:100%;height:330px;">
									<br />
									<div class="optn" style="margin-top:46px;">
									
			        				<button type="button" onclick="addLoadPoint('addFCWT','back');"><i class="ico ico-save"></i>保存</button>
			        				<button type="button" onclick="hideDiv('addFCWT','back');"><i class="ico ico-cancel"></i>取消</button>
			    					</div>
			    					<div>
							 <table class="basic-table" style="margin-top:15px;background-color: white;">
								<tr>
									<td style="width: 27%;text-align: right;" class="name"><dict:lang value="新增方式" /></td>
									<td class="dec">
										<select id="addWay" name="addWay" class=" input isSubmit" onchange="changeWay();">
	                						<option value="0" selected="selected"><dict:lang value="单个" /></option>
											<option value="1"><dict:lang value="批量" /></option>
										</select>
									</td>
								</tr>	
                                
								<tbody id="addDiv1">
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="Table"/></td>
												<td class="dec"><input type="text" id="CDL_TABLE" class=" input isSubmit"/>
												<span class="Eng"><span id="CDL_TABLE_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="料站"/></td>
												<td class="dec"><input type="text" id="CDL_LOADPOINT" class=" input isSubmit "/>
												<span class="Eng"><span id="CDL_LOADPOINT_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="轨道"/></td>
													<td class="dec"><dict:selectDict id="TRACK_TYPE" name="TRACK_TYPE" dictCode="TRACK_TYPE" dictValue="%{userDto.TRACK_TYPE}"  style="cursor: pointer;width:230px;" /></td>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="说明"/></td>
												<td class="dec"><textarea id="CDL_MEMO" style="height: 62px;" class=" input isSubmit "></textarea></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name">&nbsp;&nbsp;</td>
												<td class="dec">&nbsp;&nbsp;</td>
											<tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name">&nbsp;&nbsp;</td>
												<td class="dec">&nbsp;&nbsp;</td>
											<tr>
											
								</tbody>
								<tbody id="addDiv2" style="display: none;">
								<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="Table"/></td>
												<td class="dec"><input type="text" id="CDL_TABLE1" class=" input isSubmit"/>
												<span class="Eng"><span id="CDL_TABLE1_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="料站前缀"/></td>
												<td class="dec"><input type="text" id="CDL_LOADPOINT_PREFIX" class=" input isSubmit"/></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="起始流水"/></td>
												<td class="dec"><input type="text" id="CDL_STAR" class=" input isSubmit"/>
												<span class="Eng"><span id="CDL_STAR_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="料站数量"/></td>
												<td class="dec"><input type="text" id="CDL_LOADPOINT_COUNT" maxlength="3" class=" input isSubmit"/>
												<span class="Eng"><span id="CDL_LOADPOINT_COUNT_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="轨道"/></td>
												<td class="dec"><dict:selectDict id="TRACK_TYPE1"  dictCode="TRACK_TYPE" dictValue="%{userDto.TRACK_TYPE}"  style="cursor: pointer;width:230px;" /></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="说明"/></td>
												<td class="dec"><textarea id="CDL_MEMO1" style="height: 62px;" class=" input isSubmit"></textarea></td>
											</tr>
								</tbody>
							 </table>
							 </div>
						</div>
					</div>
					<div class="dialog-mask" id="back" style="z-index:1029"></div>
					<!-- addFCWT end -->
<div class="">



<div class="extend-btn" style="float:right;margin-top:-30px;">
<button href="javascript:void(0);" type="button" onclick="popLoadpointDiv('addFCWT','back');" title="添加"><i class="ico ico-kl-new-add ico-small"></i></button>
<button href="javascript:void(0);" type="button" onclick="delLoadpointRow();" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>
</div>

<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
<div class="panel datagrid datagrid-div1">
	<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" >								
    <!--	<input type="hidden" id="comp" name="comp" value=''/>-->
			<div class="datagrid-header">
				<div class="datagrid-header-inner" id="datagrid-header-inner">
				<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
						<tbody>
						<tr class="datagrid-header-row thcolor">
						<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
						<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" onclick="allCheck();" name="allSelect"  /></td >
						<td class="datagrid-cell" align="center" style="width:100px;" ><dict:lang value="Table" /></td >
						<td class="datagrid-cell" align="center" style="width:100px;" ><dict:lang value="料站" /></td >
						<td class="datagrid-cell" align="center" style="width:100px;" ><dict:lang value="轨道" /></td >
						<td class="datagrid-cell" align="center" style="width:100px;"><dict:lang value="说明" /></td >
						<td class="datagrid-cell" style="display:none;"><dict:lang value="" /></td >
					</tr>
					</tbody>
					
				</table>
			</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body" style="height: 380px;">
		<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
			<tbody id="addLoadPoint">
			</tbody>
					
		</table>
		</div>
	
		</div>
	</div>
			</form>
</div>
</div>	
									
							</DIV>

						</DIV>
						</form>
					</DIV>
				</div>
		</div>
	</DIV>
<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<bu:script viewId="ca49fdd3d575456cbfbc772d73034dee" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
	    function addCal(trCount){
                        
                        isQuery = false;
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
		        return ;
	        }
			
			$DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false);
                        			
                       if($("#isCloseWin") && $("#addCalForm").find("#isCloseWin").length == 0){
				$("#addCalForm").append($("#isCloseWin").clone());
				$("#addCalForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
            		
			           
                        document.forms.addCalForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=e59f8add26a04fd0a8503a6f0e87e923&trCount="+trCount;
                        document.forms.addCalForm.submit();
                        isQuery = true;
			$DisInput.attr("disabled", true);
            }
	
	</script>
	

	<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>

</body>


<%@ include file="/plf/common/pub_end.jsp"%>
 