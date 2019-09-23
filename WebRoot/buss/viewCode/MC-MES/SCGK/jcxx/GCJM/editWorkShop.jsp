<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>	
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script>
	//加载父ifream中的js\css文件

		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++) 
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				//head.appendChild(script);
				scripts[j] = script;
			}
		}
		
		window.scripts = scripts;
	</script>
	<script type="text/javascript">
	 function disable2(){
        var value = $("#paraMapObj_CA_TYPE").val();
        if(value=="2" || value=="0"){
        $("#paraMapObj_CA_FEEDER_FLAG_1").attr("disabled",true);
        }else if(value=="1"){
        $("#paraMapObj_CA_FEEDER_FLAG_1").attr("disabled",false);
        }
        }
        //原先位置273行
        /*
        <LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN>负责人信息</SPAN> </A>
								</LI>
								*/
	</script>
	<style type="text/css">
		     #secondTable{
					display: none;
				
				}	
                      #thirdTable{
					display: none;
				
				}	
				.input1 {
                      width: 157px;
                      
                      box-sizing: border-box;
                      border: 1px solid #ccc;
                      height: 25px;
                      line-height: 25px;
                      padding-left: 5px;
                      font-size: 13px;
}


				.input2 {
                      width: 139px;
                      box-sizing: border-box;
                      border: 1px solid #ccc;
                      height: 25px;
                      line-height: 25px;
                      padding-left: 5px;
                      font-size: 13px;
}
				
				#charge td input[type=text]{
					width:100% !important;
					height:100% !important;
					border:none;
					background-color: transparent;
					text-align:center;
				}
							    
		
				.black_overlay{
					display: none;
					position: absolute;
					top: 0%;
					left: 0%;
					width: 100%;
					height: 100%;
					background-color: #000;
					z-index: 1001;
					opacity:0.3;
					filter:alpha(opacity=88);	
				}
				.white_content{
					display: none;
					position: absolute;
					top: 21%;
					left: 8%;
					width: 89%;
					height: 54%;
					padding: 10px;
					border: 1px solid #cbe9ff;
					background-color: #f8fcff;
					z-index: 1002;
					overflow: auto;
				}
				
				 #charge	tr{
                    height:30px;
                }
        
				#charge td{
					border:1px solid #dbe1ef;
					text-overflow: ellipsis;
                    white-space: nowrap;
                    overflow: hidden;
				}
				
				#order tr{
                    height:30px;
                }
				
				#order td{
					border:1px solid #dbe1ef;								
                    text-overflow: ellipsis;
                    white-space: nowrap;
                    overflow: hidden;
				}
				
				#addRoleList	tr{
                    height:30px;
                }
				
				#addRoleList td{
					border:1px solid #dbe1ef;													
                    text-overflow: ellipsis;
                    white-space: nowrap;
                    overflow: hidden;
				}
				
				.display{
				display:none;
				}
				
				.dialog .dialog-bd-div {
                    border-bottom-left-radius: 0;
                    border-bottom-right-radius: 0;
                }
		
		</style>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
</head>
<body style="overflow:hidden;">
	
	<div class="edit">
	  	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
	
	
            <div class="hd">
               
			    	<div class="optn">
			    	        <button type="button" onclick="edit();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					
        					
			    </div>

			</div>
			<div class="bd" style="height: 500px;">
					        <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
							
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" id="dataId" name="dataId" value="${dataId}">
								<input type="hidden" name="flag_disable" id="flag_disable" value="${dataMap.flag_disable}">
								<input type="hidden" name="trackFlag" id="trackFlag" value="${dataMap.trackFlag}">
								<input type="hidden" name="parantId" id="parantId" value="${dataMap.parantId}">
								<input type="hidden" name="parantType" id="parantType" value="${dataMap.parantType}">
								<!--
								<input type="hidden" id="iframeId" name="paraMap.iframeId" value="${iframeid}"/>
								-->
								<input type="hidden" id="iframeId" name="iframeId" value="${iframeId}"/>
								
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="a6f1789e15de48a4831030ad33f6134f" type="edit" />
		
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="a6f1789e15de48a4831030ad33f6134f" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
	<input type="hidden" name="formId" id="formId4" value='831b2dbf0dfb494695b7ce66538a0000'/>
	<input type="hidden" name="formId" id="formId5" value='831b2dbf0dfb494695b7ce66538a1111'/>
	<input type="hidden" name="a6f1789e15de48a4831030ad33f6134f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'33370736dfeb497c953fd7f62ee0a7c1'" />
		<s:set name="_$formId_1" value="'a6f1789e15de48a4831030ad33f6134f'" />
		<s:set name="_$type" value="'edit'" />
		<div class="display">
		<bu:ui colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" />
		<bu:ui colNo="CA_PARENTAREAID" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1"/>
		<bu:ui colNo="CA_ID" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1"/>
		</div>
		<tr>
			<td class="name" style="width:85px;"/><span class="dot">*</span><bu:uitn colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec"  colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" style="width:113px;"/><bu:uitn colNo="CA_PARENTAREAID" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="CA_PARENTAREAID" formId="a6f1789e15de48a4831030ad33f6134f" ><input type="text" class="_VAL_NULL isSubmit input" value="${dataMap.parantname}" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CA_ID" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_ID" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_ID" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" disabled = "disabled"/></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CA_NAME" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_NAME" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_NAME" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CA_EMP_ROLE" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td  cssClass="dec" colNo="CA_EMP_ROLE" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_EMP_ROLE"    formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CA_GROUP" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_GROUP" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_GROUP"  formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
            <td class="name" /><bu:uitn colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" >
			<bu:ui colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;
			<bu:uitn colNo="CA_FEEDER_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" />
			<bu:ui colNo="CA_FEEDER_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" />
			</bu:td>		

			<td class="name" nowrap/><span class="dot">*</span><bu:uitn colNo="CA_PROJECT_STEP" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_PROJECT_STEP" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_PROJECT_STEP" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CA_STOP_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_STOP_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_STOP_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CA_STOP_TIME" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_STOP_TIME" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_STOP_TIME" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CA_TRACK_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_TRACK_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_TRACK_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CA_TRACK" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_TRACK" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_TRACK" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
		<div style="padding:0 10px;">
	<div style="width: 100%">
	<div style="width:100%;float: left;">
	<div class="">
	<DIV id="container">
						<DIV>
							<UL	id="ul1" class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
								<LI id="tag1" class="current"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN class="selectspan1">设备信息</SPAN>
								</A>
								</LI>
								
								 


							</UL>
						</DIV>
		</DIV>
		</div>
						
	<div class="mod-hd" id="firstTable" style="border: none;height:auto;margin: 5px 0;">		
  		
  		<div class="extend-btn" style="float:right;margin-top:-30px;"> 
			<button type="button" onclick="popRoleDiv('addRole','backRole');" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" onclick="delSbRow(id);" style="padding:0;"  title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>     		        
   		</div>	
	</div>
	<div class="mod-hd" id="secondTable"  style="border: none;height:auto;margin: 5px 0;">		
  		
  		<div class="extend-btn" style="float:right;margin-top:-30px;">
			<button type="button" onclick="popJobDiv('addJob','backJob');"  title="新增"><i class="ico ico-kl-new-add ico-small ico-small"></i></button>
			<button type="button" onclick="delChRow(id);"  title="删除"><i class="ico ico-sc-new-add ico-small ico-small"></i></button>     		        
   		</div>	
	</div>
	<div class="mod-hd" id="thirdTable"  style="border: none;height:auto;margin: 5px 0;">		
  		
  		<div class="extend-btn" style="float:right;margin-top:-30px;">
			<button type="button" onclick="popOrderDiv('addOrder','backOrder');"  title="新增"><i class="ico ico-kl-new-add ico-small ico-small"></i></button>
			<button type="button" onclick="delOrRow(id);"  title="删除"><i class="ico ico-sc-new-add ico-small ico-small"></i></button>     		        
   		</div>	
	</div>
	
         <!-- 指令信息表 -->
        <div >
		<div id="backOrder" class="black_overlay"/></div>
		<div class="dialog dialog-s1" id="addOrder" style="display:none;z-index:1030;margin-left:0px;left:10px;top:10px;width:780px;height:380px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="关联指令集" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addOrder','backOrder');"></a>
				<div class="dialog-bd-div" style="width:100%;height:80%;">
					<div class="optn optn_div">
			        <button type="button" onclick="addOrderList('addOrder','backOrder');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addOrder','backOrder');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchOrderInfo('formId4');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table>
				 <tr height="35px">
			    		<td style="width: 106px;text-align: right;" ><dict:lang value="指令集代码"/>&nbsp;</td>
			    		<td style="width: 162px;text-align: left;"><input  type="text" id="searchOrderCode" class="input" style="width:160px;"/></td>
			    		<td  style="width: 106px;text-align: right;" ><dict:lang value="指令集名称"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchOrderName" class="input" style="width:160px;"/></td>
			    		
			    		
			    	</tr>
			    	</table>
			    	<div style="width:780px;">  
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head3"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a0000">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;text-align: center;"></td >
									<td style="width: 30px;text-align: center;"><input type="checkbox" id="order_list_cb" onchange="getAllOrder();" /></td >
									<td style="width: 120px;text-align: center;"><dict:lang value="指令集代码" /></td >
									<td style="width: 110px;text-align: center;"><dict:lang value="指令集名称" /></td >
									<td style="width: 489px;text-align: center;"><dict:lang value="备注" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll3" style="width:780px;height:185px;overflow-y: auto;overflow-x: hidden;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a0000" >
								<tbody id="orderTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				</div>
				<div style="background-color: white;">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchOrderInfo&formId=formId4&showLoading=0" />
                                 </div>
</div>
<div class="dialog-mask" id="addRoleshadow" style="z-index:1029"></div>			    	
</div>
        
	
	<!-- 员工信息表 -->
	
	<div>	
<div id="backUser" class="black_overlay"/></div>
<div class="dialog dialog-s1" id="addUser" style="display:none;z-index:1030;margin-left:0px;left:10px;top:10px;width:780px;height:380px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="员工信息" />
			</h3>
			</div>
			<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addUser','backUser');"></a>
			<div class="dialog-bd-div" style="width:100%;height:80%;">
			<div class="optn optn_div">
				<button type="button" onclick="addUser('addUser','backUser');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addUser','backUser');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchUserInfo('formId3');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>
			
			    <table>
			    	<tr style="height:35px;">
			    		<td nowrap="" style="width: 10%;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员工编号&nbsp;&nbsp;</span></td>
			    		<td style="width: 23%;"><input class="input1" ;="" type="text" id="searchLogName"></td>
			    		<td nowrap="" style="width: 10%;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员工姓名&nbsp;&nbsp;</span></td>
			    		<td style="width: 23%;"><input class="input1" ;="" type="text" id="searchUserName"></td>
			    		<td nowrap="" style="width: 10%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所属部门&nbsp;&nbsp;</td>
			    		<td style="width: 23%;"><select id="searchDeptSelect" name="searchDeptSelect" class=" input isSubmit dept_select" style="width: 157px;"><option value=''>--请选择--</option></select></td>
			    		
			    	</tr>
			    </table>
			

	<div style="width:780px;">  
	<table  width="780px" class="dlist-table table-line " >
		<thead>
			<tr>
				<!-- <th style="width: 30px;text-align: center;">&nbsp;</th > -->
				<th style="width: 30px;text-align: center;"></th >
				<th style="width: 30px;text-align: center;">&nbsp;</th >
				<th style="width: 170px;text-align: center;"><dict:lang value="员工编号" /></th >
				<th style="width: 170px;text-align: center;"><dict:lang value="员工姓名" /></th >
				<th style="text-align: center;"><dict:lang value="所属部门" /></th >
				
				
			</tr>
		</thead>
		</table>
	        </div>
		<div style="width:780px;height:194px;overflow-y: auto;overflow-x: hidden;" >  
	        <table id="userDiv" width="780px" style="table-layout:fixed" class="dlist-table table-line " >
		<tbody id="userTbody">
		
		</tbody>
	</table>
	</div>
	</div>
	<div style="background-color: white;">
        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchUserInfo&formId=formId3&showLoading=0" />
        </div>
	</div>
	</div>	
				<div class="panel-ajax1 datagrid datagrid-div1" id="block1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head2"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a5678" target="firstTable">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;text-align: center;"></td>
									<td style="width: 30px;text-align: center;"><input type="checkbox" id="role_list_cb_s" onchange="getAllRole_s();"  /></td >
									<td style="width: 300px; text-align: center;"><dict:lang value="设备代码" /></td>
									<td style="width: 200px;text-align: center;"><dict:lang value="设备名称" /></td>
									<td style="width: 200px;text-align: center;"><dict:lang value="设备序号" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll2" style="height:100px;" ><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678" target="firstTable">
								<tbody id="addRoleList" >
										<c:forEach items="${dataList0}" var="device" >
										<tr id='tnew${device.ID}' name='trname' >
											<td id='tdnewseq${device.ID}' style="width: 30px;text-align: center;">${device.CAD_DEVICE_SEQUENCE}</td>
											<input type="hidden" id='iptnewseq${device.ID}'   value='${device.CAD_DEVICE_SEQUENCE}' >
										<td style="width: 30px;text-align: center;"><input type="checkbox" id="${device.ID}"  /><input type="hidden" name='deviceId_n'  value='${device.ID}' ></td >
										<td style="width: 313px;text-align: center;">${device.CD_DEVICE_SN}</td>
										<td style="width: 213px;text-align: center;">${device.CD_DEVICE_NAME}<input type='hidden' name='DEVICE_CLASS' id='DEVICE_CLASS${device.ID}' value='${device.CD_DEVICE_CLASS}'/></td>
										<td style="width: 200px;text-align: center;"><input type='text' name='iptnewseqval' style='width: 179px;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit'  value='${device.CAD_DEVICE_SEQUENCE}'/></td>
										
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							
							
						</div>
						
					</div>
				</div>

    <div style="height:170px;overflow-y: auto;overflow-x: hidden;display:none;" id="block2" >
    <table  class="dlist-table table-line " style="width: 100%;display:none;" target="secondTable">
		<thead>
		<tr class="thcolor">
			
			    <th style="width: 30px;text-align: center;">&nbsp;</th>
				<th style="width: 30px;text-align: center;"><input type="checkbox" id="charge_list" onchange="getAllcharge_s();" /></th >
				<th style="width: 137px;text-align: center;"><dict:lang value="班别" /></th >
				<th style="width: 142px;text-align: center;"><dict:lang value="主要负责人" /></th >
				<th style="width: 142px;text-align: center;"><dict:lang value="工艺负责人" /></th >
				<th style="width: 142px;text-align: center;"><dict:lang value="设备负责人" /></th >
				<th style="text-align: center;"><dict:lang value="品质负责人" /></th >
				
		</tr>
		</thead>
		</table>
       <table  target="secondTable" style="width:100%;table-layout:fixed;">
		
		<tbody id="charge">
		<c:forEach items="${dataList1}" var="charge" varStatus="status" >
		
		<tr class="thcolor"  id='ttcnew${charge.ID}' >
			<input type="hidden" name='chargeId_n'  value='${charge.ID}' >
			    <td style="width: 30px;text-align: center;">${status.count}</td>
				<td style="width: 30px;text-align: center;"><input  type="checkbox" id="${charge.ID}" /></td >
				<td style="width: 137px;text-align: center;">${charge.CAC_GROUP}</td >
			<!--	<td style="width: 142px;text-align: center;"><input  class='input1' type='text' readonly='readonly'  value='${charge.CAC_CHARGE_EMP==null?"请选择":charge.CAC_CHARGE_EMP}'  name='chargeEmp_n'  id='chargeEmp${charge.ID}' onclick="popupDiv('chargeEmp${charge.ID}')"><span></span></td>-->
				<td style="width: 142px;text-align: center;"><input class='input2' type='hidden' readonly='readonly' name='chargeEmp_n'  id='chargeEmp${charge.ID}' value='${charge.CAC_CHARGE_EMP==null?"":charge.CAC_CHARGE_EMP}'><input type='text' readonly='readonly' id='2chargeEmp${charge.ID}'   onclick="popupDiv('chargeEmp${charge.ID}')"  value='${charge.CHARGE_EMP==null?"请选择":charge.CHARGE_EMP}'  ></td>
			<!--	<td style="width: 142px;text-align: center;"><input class='input1' type='text' readonly='readonly' value='${charge.CAC_CHARGE_TECH==null?"请选择":charge.CAC_CHARGE_TECH}'  name='chargetech_n'  id='chargetech${charge.ID}' onclick="popupDiv('chargetech${charge.ID}')"></td >-->
				<td  style='width: 142px;text-align: center;'><input class='input2'   type='hidden' readonly='readonly'  name='chargetech_n'  id='chargetech${charge.ID}' value='${charge.CAC_CHARGE_TECH==null?"":charge.CAC_CHARGE_TECH}'><input type='text' readonly='readonly'  id='2chargetech${charge.ID}'   onclick="popupDiv('chargetech${charge.ID}')"  value='${charge.CHARGE_TECH==null?"请选择":charge.CHARGE_TECH}'></td>
			<!--	<td style="width: 142px;text-align: center;"><input class='input1'type='text' readonly='readonly' value='${charge.CAC_CHARGE_DEVICE==null?"请选择":charge.CAC_CHARGE_DEVICE}'  name='device_n'  id='device${charge.ID}' onclick="popupDiv('device${charge.ID}')"></td >-->
				<td  style='width: 142px;text-align: center;'><input class='input2'  type='hidden' readonly='readonly'  name='device_n'  id='device${charge.ID}' value='${charge.CAC_CHARGE_DEVICE==null?"":charge.CAC_CHARGE_DEVICE}'><input type='text' readonly='readonly' id='2device${charge.ID}'   onclick="popupDiv('device${charge.ID}')" value='${charge.CHARGE_DEVICE==null?"请选择":charge.CHARGE_DEVICE}'></td>
			<!--	<td style="text-align: center;"><input class='input1' type='text' readonly='readonly' value='${charge.CAC_CHARGE_QUALITY ==null?"请选择":charge.CAC_CHARGE_QUALITY}'  name='chargequality_n'  id='chargequality${charge.ID}' onclick="popupDiv('chargequality${charge.ID}')"></td > -->
			    <td  style='text-align: center;'><input class='input2'  type='hidden' readonly='readonly'  name='chargequality_n' id='chargequality${charge.ID}' value='${charge.CAC_CHARGE_QUALITY ==null?"请选择":charge.CAC_CHARGE_QUALITY}'><input type='text' readonly='readonly' id='2chargequality${charge.ID}'  onclick="popupDiv('chargequality${charge.ID}')" value='${charge.CHARGE_QUALITY==null?"请选择":charge.CHARGE_QUALITY}'></td>	
		</tr>
		</c:forEach>
		</tbody>
	</table>
		
	</div>
	
	<!-- 指令集tap页table列表 -->
	
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px; height:380px;display:none;" id="block3"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head4"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1111" target="thirdTable">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;text-align: center;">&nbsp;</td>
									<td style="width: 30px;text-align: center;"><input type="checkbox" id="order_list_cb_s" onchange="getAllOrder_s();"  /></td >
									<td style="width: 224px;text-align: center;"><dict:lang value="工作中心代码" /></td>
									<td style="width: 224px; text-align: center;"><dict:lang value="指令集代码" /></td>
									<td style="width: 249px;text-align: center;"><dict:lang value="指令集名称" /></td>
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll4"  style="height:120px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1111" target="thirdTable">
								<tbody id="order" >
										<c:forEach items="${dataList2}" var="order" >
		
									<tr class="thcolor"  id='tornew${order.ID}' >
										<input type="hidden" name='orderId_n'  value='${order.TCS_CODE}' >
											<td style="width: 30px;text-align: center;">&nbsp;</td>
											<td style="width: 30px;text-align: center;"><input  type="checkbox" id="${order.ID}" /></td >
											<td style="width: 224px;text-align: center;">${order.TW_STATIONSN}</td >
											<td style="width: 224px;text-align: center;">${order.TCS_CODE}<span></span></td>
											<td style="width: 249px;text-align: center;">${order.TCS_NAME}</td >
											
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
	
	
	<div style="width:45%;float: right;" >
	
		<div >
		<div id="backJob" class="black_overlay"/></div>
		<div class="dialog dialog-s1" id="addJob" style="display:none;z-index:1030;margin-left:0px;left:10px;top:10px;width:780px;height:380px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="选择班别" />
			</h3>
			</div>
			<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addJob','backJob');"></a>
			<div class="dialog-bd-div" style="width:100%;height:80%;">
			<div class="optn optn_div">
				<button type="button" onclick="addJobList('addJob','backJob');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addJob','backJob');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchCalendar('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>
			
			    <table style="width: 100%;margin-top:4px;margin-bottom:10px;">
			    	<tr>
			    		<td style="width: 8%;"><dict:lang value="日历名称"/></td>
			    		<td style="width: 75%;text-align: left;"><input class="input" style="width: 157px;left: 8%;" type="text" id="searchByCalName"/></td>
			    		
			    	</tr>
			    </table>
			<div style="width:780px;">
			 
	        <table  width="780px" class="dlist-table table-line " >
		<thead>
			<tr class="datagrid-header-row">
				<!-- <th style="width: 30px;text-align: center;">&nbsp;</th > -->
				<th style="width: 30px;text-align: center;"></th >
				<th class="datagrid-cell" style="width: 30px;text-align: center;"><input type="checkbox" id="job_list_cb" onchange="getAllJob();" /></th >
				<th class="datagrid-cell"  style="width: 120px;text-align: center;"><dict:lang value="日历名称" /></th >
				<th class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="起始月份" /></th >
				<th class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="结束月份" /></th >
				<th class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="周六上班" /></th >
				<th class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="周天上班" /></th >
				<th class="datagrid-cell"  style="text-align: center;"><dict:lang value="默认标识" /></th >
				
			</tr>
		</thead>
		</table>
	        </div>
		<div style="width:780px;height:194px;overflow-y: auto;overflow-x: hidden;" >  
		<table id="jobTable" width="780px" style="table-layout:fixed" class="dlist-table table-line " >
		<tbody id="jobTbody">
		
		</tbody>

	        </table>
		</div>
			
	        </div>
	        <div style="background-color: white;">
                <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchCalendar&formId=formId2&showLoading=0" />
                </div>
	    
		<div style="max-height: 170px;overflow: auto;">
	    	<table  class="dlist-table table-line " style="width: 100%;table-layout:fixed;" id="jobTable">
				<thead>
				</thead>
				<tbody id="addJobList">
					
				</tbody>
			</table>
		</div>
	</div>
	</div>
	</div>
     </form>
   </div>
</div>
</div>	

<div >
		<div id="backRole" class="black_overlay"/></div>
		<div class="dialog dialog-s1" id="addRole" style="display:none;z-index:1030;margin-left:0px;left:10px;top:10px;width:780px;height:380px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="设备信息" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addRole','backRole');"></a>
				<div class="dialog-bd-div" style="width:100%;height:80%;">
					<div class="optn optn_div">
			        <button type="button" onclick="addRoleList('addRole','backRole');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addRole','backRole');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchEqInfo('formId1');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table style="margin-top:4px;margin-bottom:10px;width:100%;">
				 <tr>
			    		<td style="width: 90px;text-align: right;" ><dict:lang value="设备类型"/>&nbsp;</td>
			    		<td style="width: 162px;text-align: left;"><select id="searchDevTypeSelect" name="searchDevTypeSelect" class=" input isSubmit dept_select" style="width: 157px;"> <option value="" >--请选择--</option> </select></td>
			    		<td  style="width: 90px;text-align: right;" ><dict:lang value="设备SN"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqSN" class="input" style="width:157px;"/></td>
			    		<td  style="width: 90px;text-align: right;"><dict:lang value="设备名称"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqName" class="input" style="width:157px;"/></td>
			    		
			    	</tr>
			    	</table>
			    	<div style="width:780px;">  
				<div class="panel-ajax1 datagrid datagrid-div1" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head1"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;text-align: center;"></td >
									<td style="width: 30px;text-align: center;"><input type="checkbox" id="role_list_cb"  onchange="getAllRole();" /></td >
									<td style="width: 125px;text-align: center;"><dict:lang value="设备类型" /></td >
									<td style="width: 115px;text-align: center;"><dict:lang value="设备SN" /></td >
									<td style="width: 130px;text-align: center;"><dict:lang value="设备名称" /></td >
									<td style="width: 92px;text-align: center;"><dict:lang value="负责人" /></td >
									<td style="width: 60px;text-align: center;"><dict:lang value="状态" /></td >
									<td style="width: 217px;text-align: center;"><dict:lang value="供应商" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll1" style="height:150px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
								<tbody id="roleTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
				</div>
				<div style="background-color: white;">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchEqInfo&formId=formId1&showLoading=0" />
                                 </div>
</div>
<div class="dialog-mask" id="addRoleshadow" style="z-index:1029"></div>			    	
</div>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<script>
    (function($){
        $(window).on('load',function(){
        //setPopScroll('.scroll');
        setPopScroll('.scroll1','.head1');
         setPopScroll('.scroll2','.head2');
         setPopScroll('.scroll3','.head3');
         setPopScroll('.scroll4','.head4');
         defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1111");
	  })
    })(jQuery)
 </script>
<script type="text/javascript">
var messageurl ="buss/bussModel_exeFunc.ms?funcMId=871e2d048f3a4967ab20507106ce0043";
//业务
$("#paraMapObj_CA_TYPE").change(function(){
 var caType="";
 caType=document.getElementById("paraMapObj_CA_TYPE").value; 
 if(caType=="0"||caType=="1"){
$("#paraMapObj_CA_EMP_ROLE").attr("Disabled","true"); 
$("#paraMapObj_CA_GROUP").attr("Disabled","true"); 
 $("#paraMapObj_CA_GROUP").trigger("chosen:updated");
 }else{
 $("#paraMapObj_CA_EMP_ROLE").attr("Disabled",false); 
 $("#paraMapObj_CA_GROUP").attr("Disabled",false); 
  $("#paraMapObj_CA_GROUP").trigger("chosen:updated");
 }
 }); 
	
//负责人关联全选
function getAllcharge_s(){
		if($("#charge_list").attr("checked")=="checked"){
			$("#charge :checkbox").attr("checked",true);
		}else{
			$("#charge :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}

 //负责人信息关联删除   
	function delChRow(id)	{
	        var list=[];
		var tr = "";  
			$("#charge :checkbox").each(function(){
				if($(this).attr("checked")){
					 id= $(this).attr("id");
					 
					 list.push(id);
					var trid = $(this).parent().parent().attr("id");
				    $("#i"+trid).remove();
					$("#"+trid).remove();
					 tr=trid.substring(0,6);
					 
					 }
					}); 
			if(tr=="ttcnew"){
			$.ajax({type: "POST",dataType: "json",
url:delChUrl ,
data:{"checkid":JSON.stringify(list)},
 success: function(data){
                         if(null == data){return ;}
                      if(null != data.ajaxList){
                          }
                         },error: function(msg){
	util.closeLoading();
	//utilsFp.alert("error:"+msg);
	utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");}});
}
reSort("charge");
				}
			
    function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
     }					
		
		
//修改设备信息关联删除
		function delSbRow(id){
		var list=[];
		var tr = "";
		var delurl = "buss/bussModel_exeFunc.ms?funcMId=55e0323a658d430cb1eba26f8f50d232&formId=%{formId}"; 
			$("#addRoleList :checkbox").each(function(){
				if($(this).attr("checked")){
					 id= $(this).attr("id");
					list.push(id);
				var trid = $(this).parent().parent().attr("id");
				    $("#i"+trid).remove();
					$("#"+trid).remove();
					 tr=trid.substring(0,4);}
			});		
			if(tr=="tnew"){
			$.ajax({type: "POST",dataType: "json",
                        url:delurl ,
                        data:{"checkid":JSON.stringify(list)},
                        success: function(data){
                         if(null == data){return ;}
                      if(null != data.ajaxList){
                          }
                         },error: function(msg){
	                 util.closeLoading();
	              utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");}});
	              }	
				
		     order();
		     }

							
//指令集相关信息删除
		function delOrRow(id){
		var list=[];
		var tr = "";
		var delorurl = "buss/bussModel_exeFunc.ms?funcMId=3817ce23585f46e2889d1a5654a77f62&formId=%{formId}"; 
			$("#order :checkbox").each(function(){
				if($(this).attr("checked")){
					id= $(this).attr("id");
					list.push(id);
				var trid = $(this).parent().parent().attr("id");
				    $("#i"+trid).remove();
					$("#"+trid).remove();
					 tr=trid.substring(0,6);}
			});		
			if(tr=="tornew"){
			$.ajax({type: "POST",dataType: "json",
                        url:delorurl ,
                        data:{"checkid":JSON.stringify(list)},
                        success: function(data){
                         if(null == data){return ;}
                      if(null != data.ajaxList){
                          }
                         },error: function(msg){
	                 util.closeLoading();
	              utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");}});
	              }	
				
			reSort("order");
		     }
		
//指令集相关信息新增
		 var total=0;
 function addOrderList(showId,backId){
                    
	 	var gzzx = $("#paraMapObj_CA_ID").val();
	 	var len = $("#order tr").length;
			 $("#orderTbody :checkbox").each(function(){
			               
					if($(this).attr("checked")){
					         //alert($("#trr"+$(this).attr("id")));
						if (!$("#trr"+$(this).attr("id")).length) {
						     
							
							
							
							$("#order").append("<tr id='trr"+$(this).attr("id")+"' name='trname'><input  type='hidden' name='orderCode' value='"+$(this).attr("id")+"'/><input  type='hidden' name='orderName' value='"+$("#TCS_NAME"+$(this).attr("id")).val()+"'/><input  type='hidden' name='orderStation' value='"+gzzx+"'/><input  type='hidden' name='orderSeq' value='"+total+"' /></tr>");
							$("#order tr:last").append("<td style='width: 30px;text-align: center;'></td>");//"+(len+1)+"
							$("#order tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
							$("#order tr:last").append("<td style='width: 224px;text-align: center;'>"+gzzx+"</td>");
							$("#order tr:last").append("<td style='width: 224px;text-align: center;'>"+$("#TCS_CODE"+$(this).attr("id")).val()+"</td>");
							$("#order tr:last").append("<td style='width:249px;text-align: center;'>"+$("#TCS_NAME"+$(this).attr("id")).val()+"</td>");
								total+=1;len++;
						}
						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1111");
					}
				});
				var value = $("#paraMap1_CA_TYPE_chosen").find("a").find("span").html();
				if(value == "车间"){
				$("#para_type").val(0);
				$("#flag_disable").val(0);
				}else if(value == "线别"){
				$("#para_type").val(1);
				$("#flag_disable").val(0);
				}else{
				$("#para_type").val(2);
				$("#flag_disable").val(1);
				}
				init();
			
			
			$("#orderTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#order_list_cb").attr("checked",false);
		}
							
						
					
					
				

function switchTag(tag, content, url) {
		
		if(tag=="tag1"){
		
		    $("#tag1").addClass("current");
		    $("#tag2").removeClass("current"); 
		    $("#tag3").removeClass("current"); 
			$("#firstTable").show();
			$("table[target='firstTable']").show();
			$("#secondTable").hide();
			$("table[target='secondTable']").hide();
			$("#thirdTable").hide();
			$("table[target='thirdTable']").hide();
			$("#tagli").val("0");
			$('#block1').css('display','block')
			$('#block2').css('display','none')
			$('#block3').css('display','none')					
		}else if(tag=="tag2"){
		 $("#tag2").addClass("current");
		 $("#tag1").removeClass("current"); 
		 $("#tag3").removeClass("current"); 
		document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
			$("#firstTable").hide();
			$("table[target='firstTable']").hide();
			$("#secondTable").show();
			$("table[target='secondTable']").show();
			$("#thirdTable").hide();
			$("table[target='thirdTable']").hide();
			$("#tagli").val("1");
			$('#block1').css('display','none')
			$('#block2').css('display','block')
			$('#block3').css('display','none')						
		}else{
		 $("#tag3").addClass("current");
		 $("#tag1").removeClass("current"); 
		 $("#tag2").removeClass("current"); 
		document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
			$("#firstTable").hide();
			$("table[target='firstTable']").hide();
			$("#secondTable").hide();
			$("table[target='secondTable']").hide();
			$("#thirdTable").show();
			$("table[target='thirdTable']").show();
			$("#tagli").val("2");
			$('#block1').css('display','none')
			$('#block2').css('display','none')
			$('#block3').css('display','block')					
		}
	}
	//根据条件查询员工信息
function searchUserInfo(paginationImpl){
	var logName = $("#searchLogName").val();
	
	var userName = $("#searchUserName").val();
	var dept = $("#searchDeptSelect").val();
	console.log(dept);
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl,
	    data:{
	        "flag":"7",
	        "logName":logName,
	        "userName":userName,
	        "dept":dept,
	        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
	        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
	    },
	    //data:"logName="+logName+"&userName="+userName+"&dept="+dept+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
		success: function(data){
		util.closeLoading();
				if(null == data.ajaxPage.dataList){
				
                                        $("#userTbody").empty();
                                        pageFun(data.ajaxPage,"formId3");
				return ;}
				if(null != data.ajaxPage.dataList){
					var userList=data.ajaxPage.dataList;
					$("#userTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					$("#userTbody").append("<tr id='"+userList[i].ID+"' class='datagrid-row'  style='cursor: pointer;' ></tr>");
					$("#userTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
						$("#userTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='radio' id='"+userList[i].ID+"' name='selectValue' /></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;'>"+userList[i].LOGIN_NAME+"<input type='hidden' id='LOGIN_NAME"+userList[i].ID+"' value='"+userList[i].LOGIN_NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;'>"+userList[i].NAME+"<input type='hidden' id='NAME"+userList[i].ID+"' value='"+userList[i].NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='text-align: center;'>"+userList[i].DEPTNAME+"<input type='hidden' id='DEPTNAME"+userList[i].ID+"' value='"+userList[i].DEPTNAME+"'/></td>");
						
						
					}
					init();pageFun(data.ajaxPage,"formId3");var tableTrJs = $("#userDiv tbody tr");_tongLineColor(tableTrJs);clickTrs('userTbody');
				}
		},
		 	error: function(msg){
				util.closeLoading();
				//utilsFp.alert("error:"+msg);
				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
		  }
		});

}	

//新增保存到负责人
var objectId;
 function addUser(showId,backId){
	 	
			 $("#userTbody :radio").each(function(){
			 
					if($(this).attr("checked")){
					var userName=$("#LOGIN_NAME"+$(this).attr("id")).val();
					var userName1=$("#NAME"+$(this).attr("id")).val();
					
					
					$("#"+objectId).val(userName);
					$("#2"+objectId).val(userName1);
				//	document.getElementById(objectId).value=userName;
					
                            
					
					}
				});
				init();
			
			$(' .chosen-container').css("width","230px");
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#user_list_cb").attr("checked",false);
		} 
					
					
					
				   
					
			
	
		
//员工列表
function getUserList(){
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl,
	    data:{
	        "flag":"6"
	    },
	    //data: "",
		success: function(data){
		
		
				util.closeLoading();
				if(null == data.ajaxPage.dataList){
				
				$("#userTbody").empty();
				pageFun(data.ajaxPage,"formId3");
			
				
				return ;}
				
				if(null != data.ajaxPage.dataList){
					var userList=data.ajaxPage.dataList;
					$("#userTbody").empty();
					for(var i = 0;i <userList.length; i++){
					
					
						$("#userTbody").append("<tr id='"+userList[i].ID+"' class='datagrid-row' style='cursor: pointer;' ></tr>");
						$("#userTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
						$("#userTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='radio' id='"+userList[i].ID+"' name='selectValue' /></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;text-overflow: ellipsis; white-space: nowrap;overflow: hidden; '>"+userList[i].LOGIN_NAME+"<input type='hidden' id='LOGIN_NAME"+userList[i].ID+"' value='"+userList[i].LOGIN_NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;text-overflow: ellipsis; white-space: nowrap;overflow: hidden; '>"+userList[i].NAME+"<input type='hidden' id='NAME"+userList[i].ID+"' value='"+userList[i].NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='text-align: center;text-overflow: ellipsis; white-space: nowrap;overflow: hidden; '>"+userList[i].DEPTNAME+"<input type='hidden' id='DEPTNAME"+userList[i].ID+"' value='"+userList[i].DEPTNAME+"'/></td>");
						
						
						
					}
					init();pageFun(data.ajaxPage,"formId3");var tableTrJs = $("#userDiv tbody tr");_tongLineColor(tableTrJs);clickTrs('userTbody');
				}
			},
		error: function(msg){
				util.closeLoading();
				//utilsFp.alert("error:"+msg);
				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
		  }
		});

}

	
	
	
	function getAllRole(){
		if($("#role_list_cb").attr("checked")=="checked"){
			$("#roleTbody :checkbox").attr("checked",true);
		}else{
			$("#roleTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}
	
	function getAllRole_s(){
		if($("#role_list_cb_s").attr("checked")=="checked"){
			$("#addRoleList :checkbox").attr("checked",true);
		}else{
			$("#addRoleList :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}	
	
	function getAllJob(){
		if($("#job_list_cb").attr("checked")=="checked"){
			$("#jobTbody :checkbox").attr("checked",true);
		}else{
			$("#jobTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}	
	
		function getAllJob_s(){
		if($("#job_list_cb_s").attr("checked")=="checked"){
			$("#addJobList :checkbox").attr("checked",true);
		}else{
			$("#addJobList :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}
	
	function getAllOrder(){
		if($("#order_list_cb").attr("checked")=="checked"){
			$("#orderTbody :checkbox").attr("checked",true);
		}else{
			$("#orderTbody :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}	
	
	function getAllOrder_s(){
		if($("#order_list_cb_s").attr("checked")=="checked"){
			$("#order :checkbox").attr("checked",true);
		}else{
			$("#order :checkbox").each(function(){
				$(this).attr("checked",false);
			});
		}
	}
	
	
	//显示员工信息列表

	function popupDiv(obj){
	           objectId=obj;
	        
	       
			document.getElementById("addUser").style.display = 'block';
			document.getElementById("backUser").style.display = 'block';
			$('.chosen-container').css("width","157px");
			$("#searchLogName").val("");
			$("#searchUserName").val("");
		getUserList();
		getSelectDept(this);	
		}
	function popRoleDiv(showId,backId){
			//document.getElementById(showId).style.display = 'block';
			//document.getElementById(backId).style.display = 'block';
		        $("#"+showId+",#"+backId).show();
			//$("#"+showId).draggable();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			$('.chosen-container').css("width","157px");
			$("#searchEqSN").val('');
			$("#searchEqName").val('')
			getRole();
			getDevTypeSelect();
		}
		
	function popJobDiv(showId,backId){
			//document.getElementById(showId).style.display = 'block';
			//document.getElementById(backId).style.display = 'block';
			
			$("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			$('.chosen-container').css("width","230px");
			$("#searchByCalName").val('');
			getJob();
		}
	function popOrderDiv(showId,backId){
			var gzzx = $("#paraMapObj_CA_ID").val();
			if(gzzx==""){
			utilsFp.alert("请先填写工作中心代码");
			}else{
			$("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			$('.chosen-container').css("width","230px");
			getOrder();
			}
			
		}
		
	function hideDiv(showId,backId){
			//document.getElementById(showId).style.display = 'none';
			//document.getElementById(backId).style.display = 'none';
			$(' .chosen-container').css("width","230px");
			$("#"+showId+",#"+backId).hide();
			$("#role_list_cb").attr("checked",false);
			$("#job_list_cb").attr("checked",false);
			closeDivFp(showId+"pop");
		}

 var eqObj="";
var paginationImpl = {};
function getRole(){	
            
            var parentType=document.getElementById("parantType").value;
            var trackFlag = $("#trackFlag").val();
            var areaSn = $("#parantId").val();
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    data:{
			        "flag":"5",
			        "parentType":parentType,
			        "trackFlag":trackFlag,
			        "areaSn":areaSn
			    },
			    url:messageurl,
			    //data: "",
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxPage.dataList){
				
				$("#roleTbody").empty();
				pageFun(data.ajaxPage,"formId1");
				return ;}
						if(null != data.ajaxPage.dataList){
							$(".firstTableClass").show();
							$("#roleTbody").empty();
							for(var i = 0;i < data.ajaxPage.dataList.length; i++){
							            
							            eqObj= data.ajaxPage.dataList[i];
								$("#roleTbody").append("<tr id='"+data.ajaxPage.dataList[i].ID+"' style='cursor: pointer;'><input type='hidden' id='DEVICE_CLASS"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_CLASS+"'/></tr>");
								$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");								
								$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 125px;text-align: center;'>"+data.ajaxPage.dataList[i].DEVTYPEVALUE+"<input type='hidden' id='CD_DEVICE_TYPE"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_TYPE+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 115px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"<input type='hidden' id='DEVICE_SN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'/></td>");
								$("#roleTbody tr:last").append("<td style='width: 130px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"<input type='hidden' id='DEVICE_NAME"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 92px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].NAME+"'>"+(data.ajaxPage.dataList[i].NAME ==null?"":data.ajaxPage.dataList[i].NAME)+"<input type='hidden' id='CHARGE_MAN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].NAME+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 60px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].DSTATUS+"'>"+(data.ajaxPage.dataList[i].DSTATUS ==null?"":data.ajaxPage.dataList[i].DSTATUS)+"<input type='hidden' id='STATUS"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].DSTATUS+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width:217px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].SUPPLIER_NAME+"'>"+(data.ajaxPage.dataList[i].SUPPLIER_NAME==null?"":data.ajaxPage.dataList[i].SUPPLIER_NAME)+"<input type='hidden' id='SUPPLIER_ID"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].SUPPLIER_NAME+"' /></td>");
								
							}
							init();pageFun(data.ajaxPage,"formId1");var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");_tongLineColor(tableTrJs);clickTr('roleTbody');defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
						}
					},
				error: function(msg){
						util.closeLoading();
						//utilsFp.alert("error:"+msg);
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});

	}

//查询日历列表
function getJob(){
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl,
	    data:{"flag":"2"},
		success: function(data){
		
		
				util.closeLoading();
				if(null == data.ajaxPage.dataList){
				
				$("#jobTbody").empty();
				pageFun(data.ajaxPage,"formId2");
			
				
				return ;}
				$(".secondTableClass").show();
				if(null != data.ajaxPage.dataList){
					var calendarList=data.ajaxPage.dataList;
					$("#jobTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					
					
						$("#jobTbody").append("<tr id='"+data.ajaxPage.dataList[i].ID+"' style='cursor: pointer;'></tr>");
						$("#jobTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 30px;text-align: center;'><input type='radio' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CAL_NAME+"' class='isSubmit _selectdata' /></td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 120px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_NAME+"<input type='hidden' id='remark_"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CAL_NAME+"'/></td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: right;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_START_MONTH+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: right;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_END_MONTH+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].SSAT_FLAG+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].SSUN_FLAG+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].MR_FLAG+"</td>");
					}
					init();pageFun(data.ajaxPage,"formId2");var tableTrJs = $("#jobTable tbody tr");_tongLineColor(tableTrJs);clickTrjob('jobTbody');
				}
			},
		error: function(msg){
				util.closeLoading();
				//utilsFp.alert("error:"+msg);
				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
		  }
		});

}
	//查询指令集信息
        function getOrder(){
	util.showLoading("处理中...");
	var gzzx = $("#paraMapObj_CA_ID").val();
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl,
	    
	    data:{ "gzzx":gzzx,
	        "flag":"8"
	    },
		success: function(data){
		
		
				util.closeLoading();
				if(null == data.ajaxPage.dataList){
				
				$("#orderTbody").empty();
				pageFun(data.ajaxPage,"formId4");
				return ;}
				//$(".secondTableClass").show();
				if(null != data.ajaxPage.dataList){
					var orderList=data.ajaxPage.dataList;
					$("#orderTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					
					
						$("#orderTbody").append("<tr id='order"+i+"' style='cursor: pointer;' ></tr>");
						$("#orderTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 30px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].TCS_CODE+"' name='"+data.ajaxPage.dataList[i].TCS_CODE+"' class='isSubmit _selectdata' /></td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 120px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_CODE+"<input type='hidden' id='TCS_CODE"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_CODE+"' /></td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_NAME+"<input type='hidden' id='TCS_NAME"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_NAME+"' /></td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 489px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+(data.ajaxPage.dataList[i].TCS_REMARK==null?"":data.ajaxPage.dataList[i].TCS_REMARK)+"</td>");
		
					}
					init();pageFun(data.ajaxPage,"formId4");var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a0000 tbody tr");_tongLineColor(tableTrJs);clickTr('orderTbody');defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a0000");
				}
			},
		error: function(msg){
				util.closeLoading();
				//utilsFp.alert("error:"+msg);
				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
		  }
		});

}

//var messageurl ="buss/bussModel_exeFunc.ms?FUNC_CODE=F3013&funcMId=871e2d048f3a4967ab20507106ce0043&formId=%{formId}";
        
     //指令集信息条件查询
function searchOrderInfo(paginationImpl){
    
	var searchOrderCode = $("#searchOrderCode").val();
	var gzzx = $("#paraMapObj_CA_ID").val();
	var searchOrderName = $("#searchOrderName").val();
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl,
	    data:{
	        "flag":"9",
	        "searchOrderCode":searchOrderCode,
	        "gzzx":gzzx,
	        "searchOrderName":searchOrderName,
	        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
	        "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
	    },
	    //data:"searchOrderCode="+searchOrderCode+"&gzzx="+gzzx+"&searchOrderName="+searchOrderName+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
	   
		success: function(data){
		util.closeLoading();
				if(null == data.ajaxPage.dataList){
				
				$("#orderTbody").empty();
				pageFun(data.ajaxPage,"formId4");
				return ;}
				if(null != data.ajaxPage.dataList){
				         
					var orderList = eval(data.ajaxPage.dataList[0]);
					$("#orderTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					       
$("#orderTbody").append("<tr id='order"+i+"' style='cursor: pointer;' ></tr>");
$("#orderTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 30px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].TCS_CODE+"' name='"+data.ajaxPage.dataList[i].TCS_CODE+"' class='isSubmit _selectdata' /></td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 120px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_CODE+"<input type='hidden' id='TCS_CODE"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_CODE+"' /></td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_NAME+"<input type='hidden' id='TCS_NAME"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_NAME+"' /></td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 489px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+(data.ajaxPage.dataList[i].TCS_REMARK==null?"":data.ajaxPage.dataList[i].TCS_REMARK)+"</td>");
					}
					init();pageFun(data.ajaxPage,"formId4");var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a0000 tbody tr");_tongLineColor(tableTrJs);clickTr('orderTbody');defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a0000");
				}
		},
		 	error: function(msg){
				util.closeLoading();
				//utilsFp.alert("error:"+msg);
				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
		  }
		});

}

           

	//新增保存到负责人信息表
function getWorktimeList(calId){
			var data ={"calId":calId,"flag":"1"};
			 
			 //,"flag":"1"
			
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: messageurl,
			    data:data,
			    success: function(data){
				
						if(null == data){
						return ;}
						if(null != data.ajaxList){
							var worktimeList1 =  eval(data.ajaxList);
							var len = $("#charge tr").length;
							 for(var i=0;i<worktimeList1.length;i++){
						 

						           
						     $("#charge").append("<tr id='trj"+worktimeList1[i].ID+"' name='trname' ><input type='hidden' name='group' value='"+worktimeList1[i].CALW_GROUP+"' /></tr>");
						     $("#charge tr:last").append("<td style='width: 30px;text-align: center;'>" + (len+1) + "</td>");
						     $("#charge tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+worktimeList1[i].ID+"' /></td>");
						     $("#charge tr:last").append("<td  style='width: 137px;text-align: center;'>"+worktimeList1[i].CALW_GROUP+"</td>");
						     var empId='chargeEmp'+worktimeList1[i].ID;
						     var chargeTech='chargeTech'+worktimeList1[i].ID;
						     var chargeDevice='chargeDevice'+worktimeList1[i].ID;
						     var chargeQuality='chargeQuality'+worktimeList1[i].ID;
						  	 $("#charge tr:last").append("<td  style='width: 142px;text-align: center;'><input class='input2' type='hidden' readonly='readonly' name='chargeEmp'  id='chargeEmp"+worktimeList1[i].ID+"'><input type='text' readonly=\"readonly\"  id='2chargeEmp"+worktimeList1[i].ID+"'   onclick=\"popupDiv('"+empId+"')\" value='请选择' ></td>");
						     $("#charge tr:last").append("<td  style='width: 142px;text-align: center;'><input class='input2'   type='hidden' readonly='readonly'  name='chargeTech'  id='chargeTech"+worktimeList1[i].ID+"'><input type='text' readonly=\"readonly\" id='2chargeTech"+worktimeList1[i].ID+"'   onclick=\"popupDiv('"+chargeTech+"')\"   value='请选择'></td>");
						     $("#charge tr:last").append("<td  style='width: 142px;text-align: center;'><input class='input2'  type='hidden' readonly='readonly'  name='chargeDevice'  id='chargeDevice"+worktimeList1[i].ID+"'><input type='text' readonly=\"readonly\" id='2chargeDevice"+worktimeList1[i].ID+"'   onclick=\"popupDiv('"+chargeDevice+"')\"   value='请选择'></td>");
						     $("#charge tr:last").append("<td  style='text-align: center;'><input class='input2'  type='hidden' readonly='readonly'  name='chargeQuality' id='chargeQuality"+worktimeList1[i].ID+"'><input type='text' readonly=\"readonly\" id='2chargeQuality"+worktimeList1[i].ID+"'  onclick=\"popupDiv('"+chargeQuality+"')\"   value='请选择'></td>");
						        len++;
						}

							init();
						}
					
				},
				 	error: function(msg){
						util.closeLoading();
						//utilsFp.alert("error:"+msg);
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});

	}	
//设备信息条件查询
function searchEqInfo(paginationImpl){
    
	var type = $("#searchDevTypeSelect").val();
	console.log(type);
	var sn = $("#searchEqSN").val();
	var eqName = $("#searchEqName").val();
	var parentType=document.getElementById("parantType").value;
    var trackFlag = $("#trackFlag").val();
    var areaSn = $("#parantId").val();
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl,
	    data:{
	        "flag":"4",
	        "type":type,
	        "sn":sn,
	        "eqName":eqName,
	        "parentType":parentType,
	        "trackFlag":trackFlag,
	        "areaSn":areaSn,
	        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
	        "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
	    },
	   // data:"type="+type+"&sn="+sn+"&eqName="+eqName+"&parentType="+parentType+"&trackFlag="+trackFlag+"&areaSn="+areaSn+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
	   
		success: function(data){
		util.closeLoading();
				if(null == data.ajaxPage.dataList){
				
				$("#roleTbody").empty();
				pageFun(data.ajaxPage,"formId1");
				return ;}
				if(null != data.ajaxPage.dataList){
				         
					var roleList = eval(data.ajaxPage.dataList[0]);
					$("#roleTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					       
						$("#roleTbody").append("<tr id='"+data.ajaxPage.dataList[i].ID+"' style='cursor: pointer;'><input type='hidden' id='DEVICE_CLASS"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_CLASS+"'/></tr>");
$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");						
$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 125px;text-align: left;'>"+data.ajaxPage.dataList[i].DEVTYPEVALUE+"<input type='hidden' id='CD_DEVICE_TYPE"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_TYPE+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 115px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"<input type='hidden' id='DEVICE_SN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'/></td>");
$("#roleTbody tr:last").append("<td style='width: 130px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"<input type='hidden' id='DEVICE_NAME"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 92px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].NAME+"'>"+(data.ajaxPage.dataList[i].NAME==null?"":data.ajaxPage.dataList[i].NAME)+"<input type='hidden' id='CHARGE_MAN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].NAME+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 60px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].DSTATUS+"'>"+(data.ajaxPage.dataList[i].DSTATUS==null?"":data.ajaxPage.dataList[i].DSTATUS)+"<input type='hidden' id='STATUS"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].DSTATUS+"' /></td>");
$("#roleTbody tr:last").append("<td style='width:217px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].SUPPLIER_NAME+"'>"+(data.ajaxPage.dataList[i].SUPPLIER_NAME==null?"":data.ajaxPage.dataList[i].SUPPLIER_NAME)+"<input type='hidden' id='SUPPLIER_ID"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].SUPPLIER_NAME+"' /></td>");

					}
					init();pageFun(data.ajaxPage,"formId1");var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");_tongLineColor(tableTrJs);clickTr('roleTbody');defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
				}
		},
		 	error: function(msg){
				util.closeLoading();
				//utilsFp.alert("error:"+msg);
				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
		  }
		});

}		//日历表条件查询
function searchCalendar(paginationImpl){
var calName=$("#searchByCalName").val();
			
			
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:messageurl,
			    data:{
			        "flag":"3",
			        "calName":calName,
			        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord" :_GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			        
			    },
			    //data: "calName="+calName+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				util.closeLoading();
						if(null == data.ajaxPage.dataList){
						
                                                $("#jobTbody").empty();
                                                pageFun(data.ajaxPage,"formId2");
						return ;}
						if(null != data.ajaxPage.dataList){
							
							$("#jobTbody").empty();
							
							for(var i = 0;i < data.ajaxPage.dataList.length; i++){
							
								$("#jobTbody").append("<tr id='"+data.ajaxPage.dataList[i].ID+"' style='cursor: pointer;'></tr>");
								$("#jobTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='radio' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CAL_NAME+"' /></td>");
								$("#jobTbody tr:last").append("<td style='width: 120px;text-align: left;'>"+data.ajaxPage.dataList[i].CAL_NAME+"<input type='hidden' id='remark_"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CAL_NAME+"'/></td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: right;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_START_MONTH+"'>"+data.ajaxPage.dataList[i].CAL_START_MONTH+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: right;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_END_MONTH+"'>"+data.ajaxPage.dataList[i].CAL_END_MONTH+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_SAT_FLAG+"'>"+data.ajaxPage.dataList[i].SSAT_FLAG+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_SUN_FLAG+"'>"+data.ajaxPage.dataList[i].SSUN_FLAG+"</td>");
								$("#jobTbody tr:last").append("<td style='text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_DEFAULT_FLAG+"'>"+data.ajaxPage.dataList[i].MR_FLAG+"</td>");
							}
							init();pageFun(data.ajaxPage,"formId2");var tableTrJs = $("#jobTable tbody tr");_tongLineColor(tableTrJs);clickTrjob('jobTbody');
						}
				},
				 	error: function(msg){
						util.closeLoading();
						//utilsFp.alert("error:"+msg);
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
				  }
				});

	}	

	//设备关联信息新增
var total=1;
var seqnum = 0;
	  function addRoleList(showId,backId){
	    
	 	$(".firstTableBack").show();
			 $("#roleTbody :checkbox").each(function(){
					if($(this).attr("checked")){
						if (!$("#trr"+$(this).attr("id")).length) {
						        
							var tableWork1 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678");
					        var count1= tableWork1.rows.length;
					        
					        if(count1>0){
					            	
					            var	 tempNums=1;
					            
					            var attList = document.getElementsByName("DEVICE_CLASS");
								    for(var i=0;i<attList.length;i++){
								        if (($("#DEVICE_CLASS"+$(this).attr("id")).val()) == attList[i].value ) {
                                        	
                                        	tempNums++;
                                        }
									
								    }
								   
							$("#addRoleList").append("<tr id='trr"+$(this).attr("id")+"' name='trname' onclick=\"getTrRoleId('"+$(this).attr("id")+"')\"><input  type='hidden' name='deviceName' value='"+$(this).attr("id")+"'/></tr>");	    
							$("#addRoleList tr:last").append("<td id='tdseq"+$(this).attr("id")+"' style='width: 30px;text-align: center;'>"+(count1+1)+"<input type='hidden'  value='"+tempNums+"' /></td>");
							$("#addRoleList tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
							$("#addRoleList tr:last").append("<td style='width: 300px;text-align: center;'>"+$("#DEVICE_SN"+$(this).attr("id")).val()+"</td>");
							$("#addRoleList tr:last").append("<td style='width: 200px;text-align: center;'>"+$("#DEVICE_NAME"+$(this).attr("id")).val()+"<input type='hidden' id='CLASS"+$(this).attr("id")+"' name='DEVICE_CLASS' value='"+$("#DEVICE_CLASS"+$(this).attr("id")).val()+"'/></td>");                                                                    
							$("#addRoleList tr:last").append("<td style='width: 199px;text-align: center;'><input type='text' name='deviceSeq' style='width: 179px;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit'  value='"+tempNums+"'/></td>");
						
					        }else{
					            	
    					        $("#addRoleList").append("<tr id='trr"+$(this).attr("id")+"' name='trname' onclick=\"getTrRoleId('"+$(this).attr("id")+"')\"><input  type='hidden' name='deviceName' value='"+$(this).attr("id")+"'/><input  type='hidden' value='"+(count1+1)+"' /></tr>");
    							$("#addRoleList tr:last").append("<td id='tdseq"+$(this).attr("id")+"' style='width: 30px;text-align: center;'>"+(count1+1)+"</td>");
    							$("#addRoleList tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
    							$("#addRoleList tr:last").append("<td style='width: 300px;text-align: center;'>"+$("#DEVICE_SN"+$(this).attr("id")).val()+"</td>");
    							$("#addRoleList tr:last").append("<td style='width: 200px;text-align: center;'>"+$("#DEVICE_NAME"+$(this).attr("id")).val()+"<input type='hidden' id='CLASS"+$(this).attr("id")+"' name='DEVICE_CLASS' value='"+$("#DEVICE_CLASS"+$(this).attr("id")).val()+"'/></td>");                                                                    
    							$("#addRoleList tr:last").append("<td style='width: 199px;text-align: center;'><input type='text' name='deviceSeq' style='width: 179px;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit'  value='"+(count1+1)+"'/></td>");
    						
    							
					            
					        }
					        defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
								count1+=1;
						}
					}
				});
				order();
				
				init();
			
			
			$("#roleTbody").empty();
			$(' .chosen-container').css("width","230px");
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#role_list_cb").attr("checked",false);
		} 
	
	
function order(){
                var i=0;
                $("#addRoleList tr").each(function(){
                var tdid = "";
		var iptid = "";
                var id = $(this).attr("id");
                var trflag=id.substring(0,4);
		if(trflag=="tnew"){
                tdid = id.replace("tnew","tdnewseq");
                iptid = id.replace("tnew","iptnewseq");
                         
                $("#"+tdid).text(i+1);
                $("#"+iptid).val(i+1);
                i++;
		}else{
		tdid = id.replace("trr","tdseq");
                iptid = id.replace("trr","iptseq");             
                $("#"+tdid).text(i+1);
                $("#"+iptid).val(i+1);
                i++;
		}            
                });
                 }
		//设备信息关联删除
		function delRoleRow(){
		
			$("#addRoleList :checkbox").each(function(){
				if($(this).attr("checked")){
					var trid = $(this).parent().parent().attr("id");
					$("#i"+trid).remove();
					$("#"+trid).remove();
					
				
				}
			});
		$("#role_list_cb_s").attr("checked",false);
			
			var len = $("#addRoleList tr").length;
			for(var i=0;i<len;i++){
				$("#addRoleList tr:eq("+i+") td:first").text(i+1);
			} 
		}
	
//负责人关联信息表
           var calId="";
	 function addJobList(showId,backId){
			 $("#jobTbody :radio").each(function(){
					if($(this).attr("checked")){
					        calId=$(this).attr("id");
						 	getWorktimeList(calId);
					}
				});
				init();
			var len = $("#addJobList tr").length;
			for(var i=0;i<len;i++){
				$("#addJobList tr:eq("+i+") td:first").text(i+1);
			} 
			
			$("#jobTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#job_list_cb").attr("checked",false);
			
		} 
	
	
		
		
	

</script>
	<script type="text/javascript">
			var parentWindow;
			$(function(){
			
				 if(top.$("#"+window.frameElement.name) != null && top.$("#"+window.frameElement.name).length > 0 && 
					top.$("#"+window.frameElement.name)[0].contentWindow != undefined){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			    }	
                var caType = $("#paraMapObj_CA_TYPE").val();
                if(caType=="1"){//为线别则可以设置停线开关
                     $("#paraMapObj_CA_STOP_FLAG_1").removeAttr("disabled");
                     $("#paraMapObj_CA_STOP_TIME").removeAttr("disabled");
                     $("#paraMapObj_CA_STOP_TIME").attr("class","input isSubmit  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
                     $("#paraMapObj1_CA_PROJECT_STEP").removeAttr("disabled");
                    // $("#paraMap1_CA_PROJECT_STEP").attr("class","input isSubmit  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
                     $("#paraMapObj_CA_PROJECT_STEP").trigger("chosen:updated");
                     //设置双轨标志
                     $("#paraMapObj_CA_TRACK_FLAG_1").removeAttr("disabled");
                      $("#paraMapObj_CA_GROUP").trigger("chosen:updated");
                 }else{
                     $("#paraMapObj_CA_STOP_FLAG_1").attr("disabled","disabled");
                     $("#paraMapObj_CA_STOP_FLAG_1").removeAttr("checked");
                     $("#paraMapObj_CA_PROJECT_STEP").attr("disabled","disabled");
                     $("#paraMapObj_CA_PROJECT_STEP").removeAttr("checked");
                    //  $("#paraMap1_CA_PROJECT_STEP").attr("class","input isSubmit readonly _VAL_OjbsData isaddSubmit _VAL_DATABASE");
                     $("#paraMapObj_CA_STOP_TIME").attr("disabled","disabled");
                     $("#paraMapObj_CA_STOP_TIME").val("");
                     $("#paraMapObj_CA_STOP_TIME").attr("class","input isSubmit readonly _VAL_OjbsData isaddSubmit _VAL_DATABASE");
                     $("#paraMapObj_CA_PROJECT_STEP").trigger("chosen:updated");
                     $("#paraMapObj_CA_TRACK_FLAG_1").attr("disabled","disabled");
                     $("#paraMapObj_CA_TRACK_FLAG_1").removeAttr("checked");
                      $("#paraMapObj_CA_GROUP").trigger("chosen:updated");
                 }
                 if(caType=="2"&&$("#trackFlag").val()=="Y"){  //为工作中心并且双轨标志为Y则允许选择
                     $("#paraMapObj_CA_TRACK option[value='S']").remove();
                     $("#paraMapObj_CA_TRACK").removeAttr("disabled");
                     $("#paraMapObj_CA_TRACK").attr("class","_VAL_NULL  input isSubmit  _VAL_OjbsData  isaddSubmit dept_select");
            	     $("#paraMapObj_CA_TRACK").trigger("chosen:updated");
            	      $("#paraMapObj_CA_GROUP").trigger("chosen:updated");
                 }else if(caType=="2"&&$("#trackFlag").val()=="N"){
                     $("#paraMapObj_CA_TRACK option[value='A']").remove();
		             $("#paraMapObj_CA_TRACK option[value='B']").remove();
                     $("#paraMapObj_CA_TRACK").removeAttr("disabled");
                     $("#paraMapObj_CA_TRACK").attr("class","_VAL_NULL  input isSubmit  _VAL_OjbsData  isaddSubmit dept_select");
            	     $("#paraMapObj_CA_TRACK").trigger("chosen:updated");
            	      $("#paraMapObj_CA_GROUP").trigger("chosen:updated");
                 }else{
                     $("#paraMapObj_CA_TRACK").val("");
                     $("#paraMapObj_CA_TRACK").attr("disabled","disabled");
                     $("#paraMapObj_CA_TRACK").attr("class"," input isSubmit readonly  _VAL_OjbsData isaddSubmit dept_select");
            	     $("#paraMapObj_CA_TRACK").trigger("chosen:updated");
            	      $("#paraMapObj_CA_GROUP").trigger("chosen:updated");
                 }
			});
		var isQuery = false;
	/*	function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
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
			document.forms.editForm.submit();
			isQuery = true;
		}*/
		function edit(){
      			if(!val.valNullData()){
				return ;
			}

			if(!val.valOjbsData()){
				return ;
			}
			emptyValToHide();
			console.log($("#dataId").val());
      document.forms.editForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=579213bbdde54df68fbe1ec766b6b1de";
      document.forms.editForm.submit();
      isQuery = true;
      
    

       
}    
		
		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
				
		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			
			$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	
		//	initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
	
	        function flag_disable(){
	        	
	        var value = $("#flag_disable").val();
	        if(value==0){
	         
		    //$("#tag3").css("display","none");
		    document.getElementById("ul1").innerHTML+="<li id=\"tag2\"><A class=\"\" onclick=\"switchTag('tag2','content2','');this.blur();\" href=\"javascript:void(0);\"><span>"+"负责人信息"+"<\/span><\/A><\/li>";
            /*document.getElementById("ul1").innerHTML+="<LI id="tag2";><A class="" "+
								"	onclick="switchTag('tag2','content2','');this.blur();" "+
								"	href="javascript:void(0);"> <SPAN>负责人信息</SPAN> </A> "+
							"	</LI>";*/
	    	$("#tag2").css("display","block");
	    	$("#thirdTable").css("display","none");
	        $("#paraMapObj_CA_EMP_ROLE").css("display","block");
	        $("#paraMapObj_CA_GROUP").css("display","block");
	        $("#paraMapObj_CA_EMP_ROLE").attr("disabled","disabled");
	        $("#paraMapObj_CA_GROUP").attr("disabled","disabled");
	        $("#paraMapObj_CA_EMP_ROLE_chosen").css("display","none");
	        $("#paraMapObj_CA_GROUP_chosen").css("display","none");
	         $("#paraMapObj_CA_GROUP").trigger("chosen:updated");
	        }else{
	        document.getElementById("ul1").innerHTML+="<li id=\"tag3\"><A class=\"\" onclick=\"switchTag('tag3','content3','');this.blur();\" href=\"javascript:void(0);\"><span>"+"关联指令集"+"<\/span><\/A><\/li>";
	        
	        
	        
		$("#tag3").css("display","block");
		//$("#tag2").css("display","none");
		$("#thirdTable").css("display","block");
		switchTag('tag3','content3','');this.blur();
        $("#paraMapObj_CA_GROUP").trigger("chosen:updated");
	        //$("#paraMapObj_CA_EMP_ROLE_chosen").css("display","block");
	        //$("#paraMapObj_CA_GROUP_chosen").css("display","block");
	        //$("#paraMapObj_CA_EMP_ROLE").removeAttr("disabled");
	        //$("#paraMapObj_CA_GROUP").removeAttr("disabled");
	        //$("#paraMapObj_CA_EMP_ROLE").css("display","none");
	        //$("#paraMapObj_CA_GROUP").css("display","none");	           		
		}
	       
	        }
	        
	        
	            flag_disable();
	       
                disable2();
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
		function clickTrs(tableId){
		
		    $(".datagrid-row").on("dblclick",function(){
		    	var trId = $(this).attr("id");
		        var name=$("#LOGIN_NAME"+trId).val();	
		        var  name1 = $("#NAME"+trId).val();
		        
    			addUsers('addUser','backUser',name,name1);
    		});
		
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=radio]").unbind("click");
			$("#"+tableId+" tr").on("dblclick",function(){
		    	var trId = $(this).attr("id");
		        	
		       var name=$("#LOGIN_NAME"+trId).val();	
		         var  name1 = $("#NAME"+trId).val();
    			addUsers('addUser','backUser',name,name1);
    		});
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :radio").attr("checked")) {
				$("#"+trId+" :radio").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='radio']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :radio").prop("checked",true);
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=radio]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
		  
		  
		}
		 function addUsers(showId,backId,name,name1){

					$("#"+objectId).val(name);
					$("#2"+objectId).val(name1);
					//document.getElementById(objectId).value=name;

				init();
			
			$(' .chosen-container').css("width","230px");
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#user_list_cb").attr("checked",false);
		} 
		function clickTrjob(tableId){
		
		    
		
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=radio]").unbind("click");
			$("#"+tableId+" tr").on("dblclick",function(){
		    	
		         calId=$(this).attr("id");
		         addJobLists('addJob','backJob',calId)
				

    		});
			
			$("#"+tableId+" tr").on("click",function(e){
			var trId = $(this).attr("id");
			if ($("#"+trId+" :radio").attr("checked")) {
				$("#"+trId+" :radio").prop("checked",false);
				$("#"+trId).css("background-color","");
			}else{
				$("#"+tableId+" input[type='radio']").each(function(){
					if ($(this).attr("checked")) {
						$(this).prop("checked",false);
						$(this).parents("tr").css("background-color","");
					}
				});
				$("#"+trId+" :radio").prop("checked",true);
				$("#"+trId).css("background-color","#a0c8e5");
			}
		});
		
		  $("#"+tableId+" tr input[type=radio]").click(function(e) {
			  e.stopPropagation();
			  var style = $(this).parents("tr").attr("style");
			  if(style && style.indexOf("background-color") > -1){
				  $(this).parents("tr").css("background-color","");
			  }else{
				  $(this).parents("tr").css("background-color","#a0c8e5");
			  }
		  });
		  
		  
		}
		function addJobLists(showId,backId,calId){
			
						 	getWorktimeList(calId);
				
				init();
			var len = $("#addJobList tr").length;
			for(var i=0;i<len;i++){
				$("#addJobList tr:eq("+i+") td:first").text(i+1);
			} 
			
			$("#jobTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#job_list_cb").attr("checked",false);
			
		} 
		
	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<bu:submit viewId="33370736dfeb497c953fd7f62ee0a7c1" />
<bu:script viewId="33370736dfeb497c953fd7f62ee0a7c1" />
    <script>
	    (function($){
            $(window).on('load',function(){
            //setPopScroll('.scroll');
            setPopScroll('.scroll1','.head1');
             setPopScroll('.scroll2','.head2');
             setPopScroll('.scroll3','.head3');
             setPopScroll('.scroll4','.head4');
             defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1111");
    	  })
        })(jQuery)
     </script>
</body>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp"%>
