<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="查看" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
   
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="d9ea51e4ac084f0b8b227807c5b6539d" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="d9ea51e4ac084f0b8b227807c5b6539d" />
	<input type="hidden" id="prefixInd" name="d9ea51e4ac084f0b8b227807c5b6539d" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'54746dd9a74f4608873315c1b357f488'" />
		<s:set name="_$formId_1" value="'d9ea51e4ac084f0b8b227807c5b6539d'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="WEC_SN" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_SN" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_SN" formId="d9ea51e4ac084f0b8b227807c5b6539d" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="WEC_NAME" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_NAME" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_NAME" formId="d9ea51e4ac084f0b8b227807c5b6539d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="WEC_SHELF_IP" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_SHELF_IP" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_SHELF_IP" formId="d9ea51e4ac084f0b8b227807c5b6539d" dataId="${dataId}" formIndex="1" /></bu:td>
	
			<td class="name-four" /><bu:uitn colNo="WEC_DATE" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_DATE" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_DATE" formId="d9ea51e4ac084f0b8b227807c5b6539d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="WEC_DEPT" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_DEPT" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_DEPT" formId="d9ea51e4ac084f0b8b227807c5b6539d" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-four" /><bu:uitn colNo="WEC_EMP" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_EMP" formId="d9ea51e4ac084f0b8b227807c5b6539d" ><bu:ui colNo="WEC_EMP" formId="d9ea51e4ac084f0b8b227807c5b6539d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
				<td class="name-four" /><bu:uitn colNo="WEC_MEMO" formId="d9ea51e4ac084f0b8b227807c5b6539d" /></td>
			<bu:td cssClass="dec-self" colNo="WEC_MEMO" formId="d9ea51e4ac084f0b8b227807c5b6539d" colspan="3"><bu:ui colNo="WEC_MEMO" formId="d9ea51e4ac084f0b8b227807c5b6539d" dataId="${dataId}" formIndex="1" style="height:80px;width:90%;"/></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="d9ea51e4ac084f0b8b227807c5b6539d" formIndex="1" />
									
		
			
	<div class="dialog dialog-s1" id="addFCWT"
											style="display:none;z-index:1030;margin-left:0px;left:260px;top:15px;width:390px;height:360px;">
											<div class="dialog-hd">
												<h3 class="tit">
													<dict:lang value="电子料车" />
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
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="货位编码"/></td>
												<td class="dec"><input type="text" id="STORAGE_SN" class=" input isSubmit"/>
												<span class="Eng"><span id="STORAGE_SN_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="硬体编码"/></td>
												<td class="dec"><input type="text" id="SHELF_SN" class=" input isSubmit "/>
												<span class="Eng"><span id="SHELF_SN_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="料盘尺寸"/></td>
												<td class="dec"><dict:selectDict id="ITEM_SIZE" name="ITEM_SIZE" dictCode="ITEM_SIZE" dictValue="%{userDto.ITEM_SIZE}"  style="cursor: pointer;width:230px;" /></td>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="说明"/></td>
												<td class="dec"><textarea id="WEC_MEMO" style="height: 62px;" class=" input isSubmit "></textarea></td>
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
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="货位编码前缀"/></td>
												<td class="dec"><input type="text" id="STORAGE_SN1" class=" input isSubmit"/></td>
												<span class="Eng"><span id="STORAGE_SN_err1"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="硬体编码前缀"/></td>
												<td class="dec"><input type="text" id="SHELF_SN1" class=" input isSubmit"/>
												<span class="Eng"><span id="SHELF_SN_err1"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="料盘尺寸"/></td>
												<td class="dec"><dict:selectDict id="ITEM_SIZE1"  dictCode="ITEM_SIZE" dictValue="%{userDto.ITEM_SIZE}"  style="cursor: pointer;width:230px;" /></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="货位起始流水"/></td>
												<td class="dec"><input type="text" id="CDL_STAR" class=" input isSubmit"/>
												<span class="Eng"><span id="CDL_STAR_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="硬体起始流水"/></td>
												<td class="dec"><input type="text" id="SHELF_STAR" class=" input isSubmit"/>
												<span class="Eng"><span id="SHELF_STAR_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><span class="dot">*</span><dict:lang value="数量"/></td>
												<td class="dec"><input type="text" id="LOADPOINT_COUNT" class=" input isSubmit"/></td>
												<span class="Eng"><span id="LOADPOINT_COUNT_err"></span></span></td>
											</tr>
											<tr>
												<td style="width: 27%;text-align: right;" class="name"><dict:lang value="说明"/></td>
												<td class="dec"><textarea id="WEC_MEMO1" style="height: 62px;" class=" input isSubmit"></textarea></td>
											</tr>
								</tbody>
							 </table>
							 </div>
						</div>
					</div>
					<div class="dialog-mask" id="back" style="z-index:1029"></div>
<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>			
<div class="mod">
<div class="mod-hd" style="margin-bottom:5px;">
    			
        
				 <h3 class="tit"><dict:lang value="基本信息"/></h3>
				 <div class="extend-btn" style="float: right;margin-top:5px;margin-bottom:5px;">

</div>
	</div>	





<div class="panel datagrid datagrid-div1">
	<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view" style="width:100%;height:100%">
			<div class="datagrid-header">
				<div class="datagrid-header-inner" id="datagrid-header-inner" >
				<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
						<td class="datagrid-cell" align="center" style="width:30px;text-align: center"></td >
						<td class="datagrid-cell" align="center" style="width:30px;text-align: center"><input type="checkbox" id="allSelect" name="allSelect" onchange="getAllItems();"/></td >
						<td class="datagrid-cell" style="width:131px;" ><dict:lang value="货位编码" /></td >
						<td class="datagrid-cell" style="width:134px;" ><dict:lang value="硬体编码" /></td >
						<td class="datagrid-cell" style="width:137px;" ><dict:lang value="料盘尺寸" /></td >
						<td class="datagrid-cell" style="width:120px;" ><dict:lang value="货位容量" /></td >
						<td class="datagrid-cell" style="width:120px;"><dict:lang value="说明" /></td >
					</tr>
					</tbody>
					
				</table>
			</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body" style="height: 270px;width:100%;">
		<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
				
					
					<tbody id="addLoadPoint">
					</tbody>
					
				</table>
					</div>
	
		    </div>
	    </div>
	</div>

			</form>
  
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
	

	<!-- js初始化方法 -->
	 

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
	    $(function(){
	        getInfo();
	    })
	    var trCount=0;
	    function getInfo(){
	        util.showLoading("处理中...");
	        var id="${dataId}";
	        var jsondata={"id":id};
	        var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=7aea4fc4929c4c94bca5f5742302e9fd";  //FM-仓库电子周转料车信息表 操作功能 获取电子料表信息 
	        $.ajax({
	            type:"post",
	            dataType:"json",
	            url:loadItemUrl,
	            data:jsondata,
	            success:function(data){	
                    util.closeLoading();
                    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").empty();
                    if(null==data){
                        return;
                    }
                    
                    if(null!=data.ajaxList){
                        var list = eval(data.ajaxList);
                        //console.log(list);
                       
                        for(var i=0;i<list.length;i++){
                            	trCount++;
                            	var size="";
                            	if(list[i].WEC_MEMO==null) list[i].WEC_MEMO="";
                            	if(list[i].WEC_ITEM_SIZE=="1"){
                            	    size="7吋";
                            	}else if(list[i].WEC_ITEM_SIZE=="2"){
                            	    size="13吋";
                            	}else if(list[i].WEC_ITEM_SIZE=="3"){
                            	    size="其他";
                            	}
                            	
                        var divN="<div id='hidDiv_"+trCount+"'>"+
						"<input name='STORAGE' type='hidden' id='STORAGE' value='"+list[i].WEC_STORAGE_SN+"'>"+
						"<input name='SHELF' type='hidden' id='SHELF' value='"+list[i].WEC_SHELF_SN+"'>"+
						"<input name='ITEM' type='hidden' id='ITEM' value='"+list[i].WEC_ITEM_SIZE+"'>"+
						"<input name='WEC' type='hidden' id='WEC' value='"+list[i].WEC_CAPACITY+"'>"+
						"<input name='tempMemo' type='hidden' id='tempMemo' value='"+list[i].WEC_MEMO+"'>"+
						"</div>";
					
					
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+trCount+"' ></tr>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width:30px;text-align: center;'>"+$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' name='STORAGE_SN' align='left' style='width:131px;'>"+list[i].WEC_STORAGE_SN+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' name='SHELF_SN' align='left' style='width:134px;'>"+list[i].WEC_SHELF_SN+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' name='ITEM_SIZE' align='left' style='width:137px;'>"+size+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' name='WEC_CAPACITY' align='left' style='width:120px;'>"+list[i].WEC_CAPACITY+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' name='WEC_MEMO' align='left' style='width:120px;'>"+list[i].WEC_MEMO+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
						_tongLineColor(tableTrJs);
                        }
                        clickTr("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
                        defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
                    }
	                
	            },
	            error:function(msg){
	                  util.closeLoading();
	               	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	            }
	            
	        });
	    }
	   $('#LOADPOINT_COUNT').bind('keyup', function () {
	            var calwStart=$("#LOADPOINT_COUNT");
             if(  ! /^(1)$|^100$|^[1-9][0-9]?$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#LOADPOINT_COUNT'),"<dict:lang value="该项只能为不大于100的数字" />");
             }
         });
         $('#SHELF_STAR').bind('keyup', function () {
	            var calwStart=$("#SHELF_STAR");
             if(!/^[1-9]\d*$/gi.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#SHELF_STAR'),"<dict:lang value="该项只能为数字" />");
             }
         });
         $('#CDL_STAR').bind('keyup', function () {
	            var calwStart=$("#CDL_STAR");
             if(!/^[1-9]\d*$/gi.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#CDL_STAR'),"<dict:lang value="该项只能为数字" />");
             }
         });
		window.onload = function() {
        		$('#saveInfo').attr("onclick","addCal('"+trCount +"')"); 
        		//$('#paraMap0_CD_VALID_FLAG_1').attr("checked","checked");
   
  		}
  		function getAllItems(){
        if($("#allSelect").attr("checked")=="checked"){
			$("#addLoadPoint :checkbox").attr("checked",true);
		}else{
			$("#addLoadPoint :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
        
        
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
	//删除电子料站
			var tCount=0;
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
        	 }else {
        	     utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
        	 }
        	 
		}
	    function popLoadpointDiv(showId,backId){
			/*document.getElementById(showId).style.display = 'block';
			document.getElementById(backId).style.display = 'block';*/
			$("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			//$('.chosen-container').css("width","230px");
		}
		function hideDiv(showId,backId){
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			document.getElementById("STORAGE_SN").value="";
			document.getElementById("SHELF_SN").value="";
			document.getElementById("ITEM_SIZE").value="1";
			document.getElementById("WEC_MEMO").value="";
			document.getElementById("STORAGE_SN_err").innerHTML="";
			document.getElementById("SHELF_SN_err").innerHTML="";

			document.getElementById("STORAGE_SN1").value="";
			document.getElementById("SHELF_SN1").value="";
			document.getElementById("CDL_STAR").value="";
			document.getElementById("SHELF_STAR").value="";
			document.getElementById("LOADPOINT_COUNT").value="";
			document.getElementById("ITEM_SIZE1").value="1";
			document.getElementById("WEC_MEMO1").value="";
			document.getElementById("STORAGE_SN_err1").innerHTML="";
			document.getElementById("SHELF_SN_err1").innerHTML="";
			document.getElementById("LOADPOINT_COUNT_err").innerHTML="";
			document.getElementById("CDL_STAR_err").innerHTML="";
			document.getElementById("SHELF_STAR_err").innerHTML="";
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
		function addLoadPoint(showId,backId){
			if(!checkData()){
      				return ;
  			}
			var loadPointCount = $("#LOADPOINT_COUNT").val();
			var addWay2 = document.getElementById("addWay").value;
			
			//alert(loadPointCount);
			if(addWay2=="0"){
				trCount++;
			
				var divN="<div id='hidDiv_"+trCount+"'>"+
						"<input name='STORAGE' type='hidden' id='STORAGE' value='"+$("#STORAGE_SN").val()+"'>"+
						"<input name='SHELF' type='hidden' id='SHELF' value='"+$("#SHELF_SN").val()+"'>"+
						"<input name='ITEM' type='hidden' id='ITEM' value='"+$("#ITEM_SIZE").val()+"'>"+
						"<input name='tempMemo' type='hidden' id='tempMemo' value='"+$("#WEC_MEMO").val()+"'>"+
						"</div>";
				
				
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+trCount+"' ></tr>");
			
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width:30px;text-align: center;'>"+$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length+"</td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' name='STORAGE_SN' align='left' style='width:141px;'>"+$("#STORAGE_SN").val()+"</td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' name='SHELF_SN' align='left' style='width:144px;'>"+$("#SHELF_SN").val()+"</td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' name='ITEM_SIZE' align='left' style='width:147px;'>"+$('#ITEM_SIZE option:selected').text()+"</td>");
				$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' name='WEC_MEMO' align='left'><div>"+$("#WEC_MEMO").val()+"</div></td>");
			    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);
				
				var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
				_tongLineColor(tableTrJs);
				defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
			}else if(addWay2=="1"){
				if(loadPointCount<=1){
					var tableWork1 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
					var count1= tableWork1.rows.length;//alert(tableWork1.rows[i].cells[1].innerHTML);
					if (count1>0) {
					        for ( var z = 0; z < count1; z++) {
								if (($("#STORAGE_SN1").val()+$("#CDL_STAR").val()) == tableWork1.rows[z].cells[2].innerHTML ) {
								var STORAGE_SN1 = document.getElementById("STORAGE_SN1");
								_alertValMsg(STORAGE_SN1,"<dict:lang value="货位编码不能相同" />");
								return false;
								}
							}		

							for ( var j = 0; j < count1; j++) {
								if (($("#SHELF_SN1").val()+$("#SHELF_STAR").val()) == tableWork1.rows[j].cells[3].innerHTML) {
								var SHELF_SN1 = document.getElementById("SHELF_SN1");
								_alertValMsg(SHELF_SN1,"<dict:lang value="硬体编码不能相同" />");
								return false;
								}
							}
							
					}	
					trCount++;
					var divN="<div id='hidDiv_"+trCount+"'>"+
						"<input name='STORAGE' type='hidden' id='STORAGE' value='"+$("#STORAGE_SN1").val()+$("#CDL_STAR").val()+"'>"+
						"<input name='SHELF' type='hidden' id='SHELF' value='"+$("#SHELF_SN1").val()+$("#SHELF_STAR").val()+"'>"+
						"<input name='ITEM' type='hidden' id='ITEM' value='"+$("#ITEM_SIZE1").val()+"'>"+
						"<input name='tempMemo' type='hidden' id='tempMemo' value='"+$("#WEC_MEMO1").val()+"'>"+
						"</div>";
					
					
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+trCount+"' ></tr>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width:30px;text-align: center;'>"+$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' name='STORAGE_SN' align='left' style='width:141px;'>"+$("#STORAGE_SN1").val()+$("#CDL_STAR").val()+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' name='SHELF_SN' align='left' style='width:144px;'>"+$("#SHELF_SN1").val()+$("#SHELF_STAR").val()+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' name='ITEM_SIZE' align='left' style='width:147px;'>"+$('#ITEM_SIZE1 option:selected').text()+"</td>");
					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' name='WEC_MEMO' align='left' style='width:120px;'>"+$("#WEC_MEMO1").val()+"</td>");
				    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
					_tongLineColor(tableTrJs);
					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					
				}else if(loadPointCount>1){
					for(var i=1;i<=loadPointCount;i++){
						var tableWork2 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
						var count2= tableWork2.rows.length;
						if (count2>0) {
							for ( var k = 0; k < count2; k++) {
							    if (($("#STORAGE_SN1").val()+(parseInt($("#CDL_STAR").val())+i-1)) == tableWork2.rows[k].cells[2].innerHTML ) {
								    var STORAGE_SN1 = document.getElementById("STORAGE_SN1");
								    _alertValMsg(STORAGE_SN1,"<dict:lang value="货位编码不能相同" />");
								    return false;
								}	

								if (($("#SHELF_SN1").val()+(parseInt($("#SHELF_STAR").val())+i-1)) == tableWork2.rows[k].cells[3].innerHTML) {
								    var SHELF_SN1 = document.getElementById("SHELF_SN1");
								    _alertValMsg(SHELF_SN1,"<dict:lang value="硬体编码不能相同" />");
								    return false;
								}
								
							}
						}	
						trCount=trCount+1;
						var divN="<div id='hidDiv_"+trCount+"'>"+
						"<input name='STORAGE' type='hidden' id='STORAGE' value='"+$("#STORAGE_SN1").val()+(parseInt($("#CDL_STAR").val())+i-1)+"'>"+
						"<input name='SHELF' type='hidden' id='SHELF' value='"+$("#SHELF_SN1").val()+(parseInt($("#SHELF_STAR").val())+i-1)+"'>"+
						"<input name='ITEM' type='hidden' id='ITEM' value='"+$("#ITEM_SIZE1").val()+"'>"+
						"<input name='tempMemo' type='hidden' id='tempMemo' value='"+$("#WEC_MEMO1").val()+"'>"+
						"</div>";
					
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='"+trCount+"' ></tr>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-0' style='width:30px;text-align: center;'>"+$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr").length+"</td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center'><input type='checkbox' value='"+trCount+"' name='isSelect1'/></td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' name='STORAGE_SN' align='left' style='width:141px;'>"+$("#STORAGE_SN1").val()+(parseInt($("#CDL_STAR").val())+i-1)+"</td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' name='SHELF_SN' align='left' style='width:144px;'>"+$("#SHELF_SN1").val()+(parseInt($("#SHELF_STAR").val())+i-1)+"</td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' name='ITEM_SIZE' align='left' style='width:147px;'>"+$('#ITEM_SIZE1 option:selected').text()+"</td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' name='WEC_MEMO' align='left' style='width:120px;'>"+$("#WEC_MEMO1").val()+"</td>");
						$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append(divN);
						
						var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
						_tongLineColor(tableTrJs);
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
					}
				}
			}
			//trCount++;			
            
			document.getElementById("STORAGE_SN").value="";
			document.getElementById("SHELF_SN").value="";
			document.getElementById("ITEM_SIZE").value="1";
			document.getElementById("WEC_MEMO").value="";

			document.getElementById("STORAGE_SN1").value="";
			document.getElementById("SHELF_SN1").value="";
			document.getElementById("CDL_STAR").value="";
			document.getElementById("SHELF_STAR").value="";
			document.getElementById("LOADPOINT_COUNT").value="";
			document.getElementById("ITEM_SIZE1").value="1";
			document.getElementById("WEC_MEMO1").value="";
			/*
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';*/
			$("#"+showId+",#"+backId).hide();
			$("#saveInfo").attr("onclick","addCal("+trCount+")");
			clickTr("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			return;
		}
		function checkData(){
			var addWay1 = document.getElementById("addWay").value;
			document.getElementById("STORAGE_SN_err").innerHTML="";
			document.getElementById("SHELF_SN_err").innerHTML="";
			document.getElementById("SHELF_SN_err1").innerHTML="";
			document.getElementById("SHELF_SN_err1").innerHTML="";
			document.getElementById("LOADPOINT_COUNT_err").innerHTML="";
			document.getElementById("CDL_STAR_err").innerHTML="";
			document.getElementById("SHELF_STAR_err").innerHTML="";
			var tableWork = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
			var count = tableWork.rows.length;
			if (addWay1=="0") {
				if($("#STORAGE_SN").val() == null || $("#STORAGE_SN").val() ==""){
					var STORAGE_SN = document.getElementById("STORAGE_SN");
					_alertValMsg(STORAGE_SN,"<dict:lang value="货位编码不能为空" />");
					return false;
				}
				if($("#SHELF_SN").val() == null || $("#SHELF_SN").val() ==""){
					var SHELF_SN = document.getElementById("SHELF_SN");
					_alertValMsg(SHELF_SN,"<dict:lang value="硬体编码不能为空" />");
					return false;
				}
				if (count>0) {
					for ( var i = 0; i < count; i++) {
						if ($("#STORAGE_SN").val() == tableWork.rows[i].cells[2].innerHTML) {
								var STORAGE_SN = document.getElementById("STORAGE_SN");
								_alertValMsg(STORAGE_SN,"<dict:lang value="货位编码不能相同" />");
								return false;
							}
						if ($("#SHELF_SN").val() == tableWork.rows[i].cells[3].innerHTML ) {
								var SHELF_SN = document.getElementById("SHELF_SN");
								_alertValMsg(SHELF_SN,"<dict:lang value="硬体编码不能相同" />");
								return false;
							}	
						}
				}
			}else if(addWay1=="1"){
			   
				if($("#CDL_STAR").val() == null || $("#CDL_STAR").val() ==""){
					var CDL_STAR = document.getElementById("CDL_STAR");
					_alertValMsg(CDL_STAR,"<dict:lang value="货位起始流水不能为空" />");
					return false;
				}
				if($("#SHELF_STAR").val() == null || $("#SHELF_STAR").val() ==""){
					var SHELF_STAR = document.getElementById("SHELF_STAR");
					_alertValMsg(SHELF_STAR,"<dict:lang value="硬件起始流水不能为空" />");
					return false;
				}
				if($("#LOADPOINT_COUNT").val() == null || $("#LOADPOINT_COUNT").val() ==""){
					var LOADPOINT_COUNT = document.getElementById("LOADPOINT_COUNT");
					_alertValMsg(LOADPOINT_COUNT,"<dict:lang value="数量不能为空" />");
					return false;
				}
				
			}
			return true;
		}
		
		function resetForm(){
    	    	
                        $("#editForm")[0].reset();
                        $(".dept_select").trigger("chosen:updated");
                        
                        getInfo();
                    }
		
		function editCall(){
  
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
        	
        		var tableWork3 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234");
					var len= tableWork3.rows.length;
                        if(len<=0){
                           utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少添加一条料站信息" />",0,"260","");
                           return;
                        }
            var WEC_SN = $("#paraMapObj_WEC_SN").val();
  document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=9acf3984825541f2a91c752e4f9dab04&WEC_SN="+WEC_SN;
  document.forms.editForm.submit();
}
		
	</script>
	<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->

