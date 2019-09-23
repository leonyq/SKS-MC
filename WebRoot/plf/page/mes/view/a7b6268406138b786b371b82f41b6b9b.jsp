<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
				head.appendChild(script);
				scripts[j] = script;
			}
		}
		
		window.scripts = scripts;
	</script>
	<style type="text/css">
		     #secondTable{
					display: none;
				
				}	
		     #secondtagtable{
					display: none;
				
				}	
				.input1 {
                      width: 100px;
                      
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
				}
							    
		
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
				.extend-btn button .ico-kl-new-add{
				 width: 15px;
				 height: 15px;
				 margin-right: 5px;
				 margin-bottom: 3px; 
				 background: url(${path}plf/page/fp/img/ico-kl.png) no-repeat; 
				}
				.extend-btn button:hover .ico-kl-new-add{
				 width: 15px;
				 height: 15px;
				 margin-right: 5px;
				 margin-bottom: 3px; 
				 background: url(${path}plf/page/fp/img/ico-kl-h.png) no-repeat; 
				}
				.extend-btn button .ico-sc-new-add{
				 width: 15px;
				 height: 15px;
				 margin-right: 5px;
				 margin-bottom: 3px; 
				 background: url(${path}plf/page/fp/img/ico-sc.png) no-repeat; 
				}
				.extend-btn button:hover .ico-sc-new-add{
				 width: 15px;
				 height: 15px;
				 margin-right: 5px;
				 margin-bottom: 3px; 
				 background: url(${path}plf/page/fp/img/ico-sc-h.png) no-repeat; 
				}
				.display{
				display:none;
				}
		
		</style>	
</head>
<body>
	
	<div class="edit">
            <div class="hd">
               
			    	<div class="optn">
			    	        <button type="button" onclick="edit();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					
        					
			    </div>

			</div>
			<div class="bd">
					<form id="editForm" name="editForm" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name="flag_disable" id="flag_disable" value="${dataMap.flag_disable}">
								<input type="hidden" id="iframeId" name="paraMap.iframeId" value="${iframeid}"/>
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
			<td class="name" style="width:52px;"/><span class="dot">*</span><bu:uitn colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec"  colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" style="width:52px;"/><bu:uitn colNo="CA_PARENTAREAID" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
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
			<bu:td  cssClass="dec" colNo="CA_EMP_ROLE" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_EMP_ROLE" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CA_GROUP" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_GROUP" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_GROUP" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" nowrap/><bu:uitn colNo="CA_FEEDER_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_FEEDER_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_FEEDER_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
		<div >
	<div style="width: 100%">
	<div style="width:100%;float: left;">
	<div class="">
	<DIV id="container">
						<DIV>
							<UL class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
								<LI id="tag1" class="current"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN class="selectspan1">设备信息</SPAN>
								</A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN>负责人信息</SPAN> </A>
								</LI>
								 <LI id="tag3"><A class=""
                                                                 onclick="switchTag('tag3','content3','');this.blur();"
								 href="javascript:void(0);"> <SPAN>关联指令集</SPAN> </A>
								 </LI>


							</UL>
						</DIV>
		</DIV>
		</div>
						
	<div class="mod-hd" id="firstTable" style="height:21px;border:none;margin:5px 0;">		
  		
  		<div class="extend-btn" style="float:right;"> 
			<button type="button" onclick="popRoleDiv('addRole','backRole');" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" onclick="delSbRow(id);" style="padding:0;"  title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>     		        
   		</div>	
	</div>
	<div class="mod-hd" id="secondTable"  style="height:21px;border:none;margin:5px 0;">		
  		
  		<div class="extend-btn" style="float:right;">
			<button type="button" onclick="popJobDiv('addJob','backJob');"  title="新增"><i class="ico ico-kl-new-add ico-small ico-small"></i></button>
			<button type="button" onclick="delChRow(id);"  title="删除"><i class="ico ico-sc-new-add ico-small ico-small"></i></button>     		        
   		</div>	
	</div>
	<div class="mod-hd" id="thirdTable"  style="height:21px;border:none;margin:5px 0;">		
  		
  		<div class="extend-btn" style="float:right;">
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
			    		<td style="width: 106px;text-align: right;" ><dict:lang value="指令集代码"/></td>
			    		<td style="width: 162px;text-align: left;"><input  type="text" id="searchOrderCode"/></td>
			    		<td  style="width: 106px;text-align: right;" ><dict:lang value="指令集名称"/></td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchOrderName"/></td>
			    		
			    		
			    	</tr>
			    	</table>
			    	<div style="width:780px;height:35px;">  
			    	<table  width="780px" class="dlist-table table-line " >
				<thead>
			    	<tr>
			    	<th style="width: 50px;text-align: center;"><dict:lang value="序号" /></th >
				<th style="width: 50px;text-align: center;"><input type="checkbox" id="order_list_cb" onchange="getAllOrder();" /></th >
				<th style="width: 120px;text-align: center;"><dict:lang value="指令集代码" /></th >
				<th style="width: 110px;text-align: center;"><dict:lang value="指令集名称" /></th >
				<th style="text-align: center;"><dict:lang value="备注" /></th >
			        </tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div style="width:780px;height:207px;overflow-y: auto;overflow-x: hidden;" >  
			    	<table width="780px" style="table-layout:fixed" class="dlist-table table-line " >
			    	<tbody id="orderTbody">
		                </tbody>
				
				</table>
				
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
			    	<tr>
			    		<td  nowrap ><span><dict:lang value="员工编号"/></span></td>
			    		<td style="width: 63%;text-align: left;"><input class="input1" ; type="text" id="searchLogName"/></td>
			    		<td  nowrap><span><dict:lang value="员工姓名"/></span></td>
			    		<td style="width: 63%;text-align: left;"><input class="input1" ; type="text" id="searchUserName"/></td>
			    		<td  nowrap ><dict:lang value="所属部门"/></td>
			    		<td style="width: 63%;text-align: left;"><input class="input1" ; type="text" id="searchDept"/></td>
			    		
			    	</tr>
			    </table>
			

	<div style="width:780px;height:35px;">  
	<table  width="780px" class="dlist-table table-line " >
		<thead>
			<tr>
				<!-- <th style="width: 30px;text-align: center;">&nbsp;</th > -->
				<th style="width: 50px;text-align: center;"><dict:lang value="序号" /></th >
				<th style="width: 50px;text-align: center;">&nbsp;</th >
				<th style="width: 170px;text-align: center;"><dict:lang value="员工编号" /></th >
				<th style="width: 170px;text-align: center;"><dict:lang value="员工姓名" /></th >
				<th style="width: 170px;text-align: center;"><dict:lang value="所属部门" /></th >
				<th style="width: 170px;text-align: center;"><dict:lang value="状态" /></th >
				
			</tr>
		</thead>
		</table>
	        </div>
		<div style="width:780px;height:207px;overflow-y: auto;overflow-x: hidden;" >  
	        <table width="780px" style="table-layout:fixed" class="dlist-table table-line " >
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
    <table  class="table-line"style="width: 100%" target="firstTable">
		<thead>
		<tr class="thcolor">
			<th style="width: 43px;text-align: center;">&nbsp;</th>
			<th style="width: 43px;text-align: center;"><input type="checkbox" id="role_list_cb_s" onchange="getAllRole_s();"  /></th >
			<th style="width: 224px;text-align: center;"><dict:lang value="设备序号" /></th>
			<th style="width: 224px;text-align: center;"><dict:lang value="设备代码" /></th>
			<th style="width: 225px;text-align: center;"><dict:lang value="设备名称" /></th>
		</tr>
		</thead>
		 </table>
    <div style="width:760px;height:100px;overflow-y: auto;overflow-x: hidden;" >
       <table target="firstTable">
		
		<tbody id="addRoleList">
		<c:forEach items="${dataList0}" var="device" >
		    <tr id='tnew${device.ID}' name='trname' >
		    <td style="width: 43px;text-align: center;">&nbsp;</td>
			<td style="width: 43px;text-align: center;"><input type="checkbox" id="${device.ID}"  /><input type="hidden" name='deviceId_n'  value='${device.ID}' ></td >
			<td style="width: 224px;text-align: center;">${device.CAD_DEVICE_SEQUENCE}</td>
			<td style="width: 224px;text-align: center;">${device.CD_DEVICE_SN}</td>
			<td style="width: 225px;text-align: center;">${device.CD_DEVICE_NAME}</td>
			</tr>
	 </c:forEach>
		</tbody>
	</table>
	</div>
	<table  class="dlist-table table-line " style="margin-top: -100px;width: 100%;display:none;" target="secondTable">
		<thead>
		<tr class="thcolor">
			
			    <th style="width: 25px;text-align: center;">&nbsp;</th>
				<th style="width: 28px;text-align: center;"><input type="checkbox" id="charge_list" onchange="getAllcharge_s();" /></th >
				<th style="width: 137px;text-align: center;"><dict:lang value="班别" /></th >
				<th style="width: 142px;text-align: center;"><dict:lang value="主要负责人" /></th >
				<th style="width: 142px;text-align: center;"><dict:lang value="工艺负责人" /></th >
				<th style="width: 142px;text-align: center;"><dict:lang value="设备负责人" /></th >
				<th style="width: 143px;text-align: center;"><dict:lang value="品质负责人" /></th >
				
		</tr>
		</thead>
		</table>
    <div style="width:760px;height:auto;overflow-y: auto;overflow-x: hidden;"  target="secondTable">
       <table id="secondtagtable" target="secondTable">
		
		<tbody id="charge">
		<c:forEach items="${dataList1}" var="charge" >
		
		<tr class="thcolor"  id='ttcnew${charge.ID}' >
			<input type="hidden" name='chargeId_n'  value='${charge.ID}' >
			    <td style="width: 25px;text-align: center;">&nbsp;</td>
				<td style="width: 28px;text-align: center;"><input  type="checkbox" id="${charge.ID}" /></td >
				<td style="width: 137px;text-align: center;">${charge.CAC_GROUP}</td >
				<td style="width: 142px;text-align: center;"><input  class='input1' type='text' readonly='readonly'  value='${charge.CAC_CHARGE_EMP==null?"请选择":charge.CAC_CHARGE_EMP}'  name='chargeEmp_n'  id='chargeEmp${charge.ID}' onclick="popupDiv('chargeEmp${charge.ID}')"><span></span></td>
				<td style="width: 142px;text-align: center;"><input class='input1' type='text' readonly='readonly' value='${charge.CAC_CHARGE_TECH==null?"请选择":charge.CAC_CHARGE_TECH}'  name='chargetech_n'  id='chargetech${charge.ID}' onclick="popupDiv('chargetech${charge.ID}')"></td >
				<td style="width: 142px;text-align: center;"><input class='input1'type='text' readonly='readonly' value='${charge.CAC_CHARGE_DEVICE==null?"请选择":charge.CAC_CHARGE_DEVICE}'  name='device_n'  id='device${charge.ID}' onclick="popupDiv('device${charge.ID}')"></td >
				<td style="text-align: center;"><input class='input1' type='text' readonly='readonly' value='${charge.CAC_CHARGE_QUALITY ==null?"请选择":charge.CAC_CHARGE_QUALITY}'  name='chargequality_n'  id='chargequality${charge.ID}' onclick="popupDiv('chargequality${charge.ID}')"></td >
				
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	
	<!-- 指令集tap页table列表 -->
	
	<table  class="dlist-table table-line " style="margin-top: -100px;width: 100%;display:none;" target="thirdTable" >
		<thead>
		<tr class="thcolor">
			<th style="width: 43px;text-align: center;">&nbsp;</th>
			<th style="width: 43px;text-align: center;"><input type="checkbox" id="order_list_cb_s" onchange="getAllOrder_s();"  /></th >
			<th style="width: 224px;text-align: center;"><dict:lang value="工作中心代码" /></th>
			<th style="width: 224px; text-align: center;"><dict:lang value="指令集代码" /></th>
			<th style="text-align: center;"><dict:lang value="指令集名称" /></th>
		</tr>
		</thead>
		</table>
    <div style="width:760px;height:auto;overflow-y: auto;overflow-x: hidden;" >
       <table  target="thirdTable">
		<tbody id="order">
		
		<c:forEach items="${dataList2}" var="order" >
		
		<tr class="thcolor"  id='tornew${order.ID}' >
			<input type="hidden" name='orderId_n'  value='${order.TCS_CODE}' >
			    <td style="width: 43px;text-align: center;">&nbsp;</td>
				<td style="width: 43px;text-align: center;"><input  type="checkbox" id="${order.ID}" /></td >
				<td style="width: 224px;text-align: center;">${order.TW_STATIONSN}</td >
				<td style="width: 224px;text-align: center;">${order.TCS_CODE}<span></span></td>
				<td style="text-align: center;">${order.TCS_NAME}</td >
				
		</tr>
		</c:forEach>
		
		</tbody>
	</table>
	</div>
	
	
	<div style="width:45%;float: right;" >
	
		<div >
		<div id="backJob" class="black_overlay"/></div>
		<div class="dialog dialog-s1" id="addJob" style="display:none;z-index:1030;margin-left:0px;left:10px;top:10px;width:780px;height:380px;">
			<div class="dialog-hd">
			<h3 class="tit">
			<dict:lang value="负责人信息" />
			</h3>
			</div>
			<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addJob','backJob');"></a>
			<div class="dialog-bd-div" style="width:100%;height:80%;">
			<div class="optn optn_div">
				<button type="button" onclick="addJobList('addJob','backJob');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDiv('addJob','backJob');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchCalendar('formId2');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>
			
			    <table style="width: 100%;">
			    	<tr>
			    		<td style="width: 8%;"><dict:lang value="日历名称"/></td>
			    		<td style="width: 75%;text-align: left;"><input class="input" style="width: 157px;left: 8%;" type="text" id="searchByCalName"/></td>
			    		
			    	</tr>
			    </table>
			<div style="width:780px;height:35px;">
			 
	        <table  width="780px" class="dlist-table table-line " >
		<thead>
			<tr class="datagrid-header-row">
				<!-- <th style="width: 30px;text-align: center;">&nbsp;</th > -->
				<th style="width: 50px;text-align: center;"><dict:lang value="序号" /></th >
				<th class="datagrid-cell" style="width: 50px;text-align: center;"><input type="checkbox" id="job_list_cb" onchange="getAllJob();" /></th >
				<th class="datagrid-cell"  style="width: 120px;text-align: center;"><dict:lang value="日历名称" /></th >
				<th class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="起始月份" /></th >
				<th class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="结束月份" /></th >
				<th class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="周六上班" /></th >
				<th class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="周天上班" /></th >
				<th class="datagrid-cell"  style="width: 120px;text-align: center;"><dict:lang value="默认标识" /></th >
				
			</tr>
		</thead>
		</table>
	        </div>
		<div style="width:780px;height:207px;overflow-y: auto;overflow-x: hidden;" >  
		<table width="780px" style="table-layout:fixed" class="dlist-table table-line " >
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
				      
				<table>
				 <tr>
			    		<td style="width: 106px;text-align: right;" ><dict:lang value="设备类型"/></td>
			    		<td style="width: 162px;text-align: left;"><input  type="text" id="searchEqType"/></td>
			    		<td  style="width: 106px;text-align: right;" ><dict:lang value="设备SN"/></td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqSN"/></td>
			    		<td  style="width: 106px;text-align: right;"><dict:lang value="设备名称"/></td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqName"/></td>
			    		
			    	</tr>
			    	</table>
			    	<div style="width:780px;height:35px;">  
			    	<table  width="780px" class="dlist-table table-line " >
				<thead>
			    	<tr>
			    	<th style="width: 50px;text-align: center;"><dict:lang value="序号" /></th >
				<th style="width: 50px;text-align: center;"><input type="checkbox" id="role_list_cb" onchange="getAllRole();" /></th >
				<th style="width: 120px;text-align: center;"><dict:lang value="设备类型" /></th >
				<th style="width: 112px;text-align: center;"><dict:lang value="设备SN" /></th >
				<th style="width: 127px;text-align: center;"><dict:lang value="设备名称" /></th >
				<th style="width: 89px;text-align: center;"><dict:lang value="负责人" /></th >
				<th style="width: 57px;text-align: center;"><dict:lang value="状态" /></th >
				<th style="width: 75px;text-align: center;"><dict:lang value="供应商" /></th >
				<th style="width: 99px;text-align: center;"><dict:lang value="有效标志" /></th >
			        </tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div style="width:780px;height:207px;overflow-y: auto;overflow-x: hidden;" >  
			    	<table width="780px" style="table-layout:fixed" class="dlist-table table-line " >
			    	<tbody id="roleTbody">
		                </tbody>
				
				</table>
				
				</div>
				</div>
				<div style="background-color: white;">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchEqInfo&formId=formId1&showLoading=0" />
                                 </div>
</div>
<div class="dialog-mask" id="addRoleshadow" style="z-index:1029"></div>			    	
</div>



<script type="text/javascript">
//业务
$("#paraMapObj_CA_TYPE").change(function(){
 var caType="";
 caType=document.getElementById("paraMapObj_CA_TYPE").value; 
 if(caType=="0"||caType=="1"){
$("#paraMapObj_CA_EMP_ROLE").attr("Disabled","true"); 
$("#paraMapObj_CA_GROUP").attr("Disabled","true"); 
 }else{
 $("#paraMapObj_CA_EMP_ROLE").attr("Disabled",false); 
 $("#paraMapObj_CA_GROUP").attr("Disabled",false); 
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
				}
			
					
		
		
//修改设备信息关联删除
		function delSbRow(id){
		var list=[];
		var tr = "";
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
				
			
		     }

							
//指令集相关信息删除
		function delOrRow(id){
		var list=[];
		var tr = "";
		
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
				
			
		     }
		
//指令集相关信息新增
		 var total=0;
 function addOrderList(showId,backId){
                    
	 	var gzzx = $("#paraMapObj_CA_ID").val();
	 	
			 $("#orderTbody :checkbox").each(function(){
			               
					if($(this).attr("checked")){
					      
						if (!$("#trr"+$(this).attr("id")).length) {
						     
							
							
							
							$("#order").append("<tr id='trr"+$(this).attr("id")+"' name='trname'><input  type='hidden' name='orderCode' value='"+$(this).attr("id")+"'/><input  type='hidden' name='orderName' value='"+$("#TCS_NAME"+$(this).attr("id")).val()+"'/><input  type='hidden' name='orderStation' value='"+gzzx+"'/><input  type='hidden' name='orderSeq' value='"+total+"' /></tr>");
							$("#order tr:last").append("<td style='width: 43px;text-align: center;'>"+total+"</td>");
							$("#order tr:last").append("<td style='width: 43px;text-align: center;'><input  type='checkbox' /></td>");
							$("#order tr:last").append("<td style='width: 224px;text-align: center;'>"+gzzx+"</td>");
							$("#order tr:last").append("<td style='width: 224px;text-align: center;'>"+$("#TCS_CODE"+$(this).attr("id")).val()+"</td>");
							$("#order tr:last").append("<td style='text-align: center;'>"+$("#TCS_NAME"+$(this).attr("id")).val()+"</td>");
								total+=1;
						}
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
		}
	}
	//根据条件查询员工信息
function searchUserInfo(paginationImpl){
	var logName = $("#searchLogName").val();
	
	var userName = $("#searchUserName").val();
	var dept = $("#searchDept").val();
	
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl+"&flag=7",
	    data:"logName="+logName+"&userName="+userName+"&dept="+dept+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
		success: function(data){
		util.closeLoading();
				if(null == data.ajaxPage.dataList){
				utilsFp.alert("没查询到数据");
                                        $("#userTbody").empty();
                                        pageFun(data.ajaxPage,"formId3");
				return ;}
				if(null != data.ajaxPage.dataList){
					var userList=data.ajaxPage.dataList;
					$("#userTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					$("#userTbody").append("<tr></tr>");
					$("#userTbody tr:last").append("<td style='width: 50px;text-align: center;'>"+(i+1)+"</td>");
						$("#userTbody tr:last").append("<td style='width: 50px;text-align: center;'><input type='radio' id='"+userList[i].ID+"' name='selectValue' /></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;'>"+userList[i].LOGIN_NAME+"<input type='hidden' id='LOGIN_NAME"+userList[i].ID+"' value='"+userList[i].LOGIN_NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;'>"+userList[i].NAME+"<input type='hidden' id='NAME"+userList[i].ID+"' value='"+userList[i].NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;'>"+userList[i].DEPTNAME+"<input type='hidden' id='DEPTNAME"+userList[i].ID+"' value='"+userList[i].DEPTNAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='text-align: center;'>"+userList[i].VALUE+"<input type='hidden' id='VALUE"+userList[i].ID+"' value='"+userList[i].VALUE+"'/></td>");
						
					}
					init();pageFun(data.ajaxPage,"formId3");
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
					var userName=$("#NAME"+$(this).attr("id")).val();
					
					
					$("#"+objectId).val(userName);
					$("#2"+objectId).val(userName);
					document.getElementById(objectId).value=userName;
					
                            
					
					}
				});
				init();
			
			
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
	    url:messageurl+"&flag=6",
	    data: "",
		success: function(data){
		
		
				util.closeLoading();
				if(null == data.ajaxPage.dataList){
				utilsFp.alert("没查询到数据");
				$("#userTbody").empty();
				pageFun(data.ajaxPage,"formId3");
			
				
				return ;}
				
				if(null != data.ajaxPage.dataList){
					var userList=data.ajaxPage.dataList;
					$("#userTbody").empty();
					for(var i = 0;i <userList.length; i++){
					
					
						$("#userTbody").append("<tr></tr>");
						$("#userTbody tr:last").append("<td style='width: 50px;text-align: center;'>"+(i+1)+"</td>");
						$("#userTbody tr:last").append("<td style='width: 50px;text-align: center;'><input type='radio' id='"+userList[i].ID+"' name='selectValue' /></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;text-overflow: ellipsis; white-space: nowrap;overflow: hidden; '>"+userList[i].LOGIN_NAME+"<input type='hidden' id='LOGIN_NAME"+userList[i].ID+"' value='"+userList[i].LOGIN_NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;text-overflow: ellipsis; white-space: nowrap;overflow: hidden; '>"+userList[i].NAME+"<input type='hidden' id='NAME"+userList[i].ID+"' value='"+userList[i].NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;text-overflow: ellipsis; white-space: nowrap;overflow: hidden; '>"+userList[i].DEPTNAME+"<input type='hidden' id='DEPTNAME"+userList[i].ID+"' value='"+userList[i].DEPTNAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='text-align: center;text-overflow: ellipsis; white-space: nowrap;overflow: hidden; '>"+userList[i].VALUE+"<input type='hidden' id='VALUE"+userList[i].ID+"' value='"+userList[i].VALUE+"'/></td>");
						
						
					}
					init();pageFun(data.ajaxPage,"formId3");
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
		getUserList();
			
		}
	function popRoleDiv(showId,backId){
			//document.getElementById(showId).style.display = 'block';
			//document.getElementById(backId).style.display = 'block';
		        $("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			$('.chosen-container').css("width","230px");
			getRole();
		}
		
	function popJobDiv(showId,backId){
			//document.getElementById(showId).style.display = 'block';
			//document.getElementById(backId).style.display = 'block';
			
			$("#"+showId+",#"+backId).show();
			$("#"+showId).draggable();
			$('.chosen-container').css("width","230px");
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
			$("#"+showId+",#"+backId).hide();
			$("#role_list_cb").attr("checked",false);
			$("#job_list_cb").attr("checked",false);
			closeDivFp(showId+"pop");
		}

 var eqObj="";
var paginationImpl = {};
function getRole(){


			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:messageurl+"&flag=5",
			    data: "",
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxPage.dataList){
				utilsFp.alert("没查询到数据");
				$("#roleTbody").empty();
				pageFun(data.ajaxPage,"formId1");
				return ;}
						if(null != data.ajaxPage.dataList){
							$(".firstTableClass").show();
							$("#roleTbody").empty();
							for(var i = 0;i < data.ajaxPage.dataList.length; i++){
							            
							            eqObj= data.ajaxPage.dataList[i];
								$("#roleTbody").append("<tr></tr>");
								$("#roleTbody tr:last").append("<td style='width: 50px;text-align: center;'>"+(i+1)+"</td>");								
								$("#roleTbody tr:last").append("<td style='width: 50px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 120px;text-align: center;'>"+data.ajaxPage.dataList[i].CD_DEVICE_TYPE+"<input type='hidden' id='CD_DEVICE_TYPE"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_TYPE+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 112px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"<input type='hidden' id='DEVICE_SN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'/></td>");
								$("#roleTbody tr:last").append("<td style='width: 127px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"<input type='hidden' id='DEVICE_NAME"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 89px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_CHARGE_MAN+"'>"+data.ajaxPage.dataList[i].CD_CHARGE_MAN+"<input type='hidden' id='CHARGE_MAN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_CHARGE_MAN+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 57px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_STATUS+"'>"+data.ajaxPage.dataList[i].CD_STATUS+"<input type='hidden' id='STATUS"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_STATUS+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 75px;text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_SUPPLIER_ID+"'>"+data.ajaxPage.dataList[i].CD_SUPPLIER_ID+"<input type='hidden' id='SUPPLIER_ID"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_SUPPLIER_ID+"' /></td>");
								$("#roleTbody tr:last").append("<td style='text-align: center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_VALID_FLAG+"'>"+data.ajaxPage.dataList[i].CD_VALID_FLAG+"<input type='hidden' id='VALID_FLAG"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_VALID_FLAG+"' /></td>");
							}
							init();pageFun(data.ajaxPage,"formId1");
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
	    url:messageurl+"&flag=2",
	    data: "",
		success: function(data){
		
		console.log(data.ajaxPage.dataList);
				util.closeLoading();
				if(null == data.ajaxPage.dataList){
				utilsFp.alert("没查询到数据");
				$("#jobTbody").empty();
				pageFun(data.ajaxPage,"formId2");
			
				
				return ;}
				$(".secondTableClass").show();
				if(null != data.ajaxPage.dataList){
					var calendarList=data.ajaxPage.dataList;
					$("#jobTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					
					
						$("#jobTbody").append("<tr class='datagrid-row'></tr>");
						$("#jobTbody tr:last").append("<td style='width: 50px;text-align: center;'>"+(i+1)+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 50px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CAL_NAME+"' class='isSubmit _selectdata' /></td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 120px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_NAME+"<input type='hidden' id='remark_"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CAL_NAME+"'/></td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_START_MONTH+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_END_MONTH+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_SAT_FLAG+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_SUN_FLAG+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_DEFAULT_FLAG+"</td>");
					}
					init();pageFun(data.ajaxPage,"formId2");
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
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl+"&flag=8",
	    data: "",
		success: function(data){
		
		console.log(data.ajaxPage.dataList);
				util.closeLoading();
				if(null == data.ajaxPage.dataList){
				utilsFp.alert("没查询到数据");
				$("#orderTbody").empty();
				pageFun(data.ajaxPage,"formId4");
				return ;}
				//$(".secondTableClass").show();
				if(null != data.ajaxPage.dataList){
					var orderList=data.ajaxPage.dataList;
					$("#orderTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					
					
						$("#orderTbody").append("<tr class='datagrid-row' ></tr>");
						$("#orderTbody tr:last").append("<td style='width: 50px;text-align: center;'>"+(i+1)+"</td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 50px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].TCS_CODE+"' name='"+data.ajaxPage.dataList[i].TCS_CODE+"' class='isSubmit _selectdata' /></td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 120px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_CODE+"<input type='hidden' id='TCS_CODE"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_CODE+"' /></td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_NAME+"<input type='hidden' id='TCS_NAME"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_NAME+"' /></td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_REMARK+"</td>");
		
					}
					init();pageFun(data.ajaxPage,"formId4");
				}
			},
		error: function(msg){
				util.closeLoading();
				//utilsFp.alert("error:"+msg);
				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
		  }
		});

}
        
    
        
     //指令集信息条件查询
function searchOrderInfo(paginationImpl){
    
	var searchOrderCode = $("#searchOrderCode").val();
	
	var searchOrderName = $("#searchOrderName").val();
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl+"&flag=9",
	    data:"searchOrderCode="+searchOrderCode+"&searchOrderName="+searchOrderName+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
	   
		success: function(data){
		util.closeLoading();
				if(null == data.ajaxPage.dataList){
				utilsFp.alert("没查询到数据");
				$("#orderTbody").empty();
				pageFun(data.ajaxPage,"formId4");
				return ;}
				if(null != data.ajaxPage.dataList){
				         
					var orderList = eval(data.ajaxPage.dataList[0]);
					$("#orderTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					       
$("#orderTbody").append("<tr class='datagrid-row' ></tr>");
$("#orderTbody tr:last").append("<td style='width: 50px;text-align: center;'>"+(i+1)+"</td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 50px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].TCS_CODE+"' name='"+data.ajaxPage.dataList[i].TCS_CODE+"' class='isSubmit _selectdata' /></td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 120px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_CODE+"<input type='hidden' id='TCS_CODE"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_CODE+"' /></td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_NAME+"<input type='hidden' id='TCS_NAME"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_NAME+"' /></td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_REMARK+"</td>");
					}
					init();pageFun(data.ajaxPage,"formId4");
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
			 var data ={"calId":calId};
			
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: messageurl+"&flag=1" ,
			    data:data,
				success: function(data){
				
						if(null == data){
						return ;}
						if(null != data.ajaxList){
							var worktimeList1 =  eval(data.ajaxList);
							
							 for(var i=0;i<worktimeList1.length;i++){
						 

						           
						     $("#charge").append("<tr id='trj"+worktimeList1[i].ID+"' name='trname' ><input type='hidden' name='group' value='"+worktimeList1[i].CALW_GROUP+"' /></tr>");
						     $("#charge tr:last").append("<td style='width: 25px;text-align: center;'>&nbsp;</td>");
						     $("#charge tr:last").append("<td style='width: 28px;text-align: center;'><input type='checkbox' id='"+worktimeList1[i].ID+"' /></td>");
						     $("#charge tr:last").append("<td  style='width: 137px;text-align: center;'>"+worktimeList1[i].CALW_GROUP+"</td>");
						     var empId='chargeEmp'+worktimeList1[i].ID;
						     var chargeTech='chargeTech'+worktimeList1[i].ID;
						     var chargeDevice='chargeDevice'+worktimeList1[i].ID;
						     var chargeQuality='chargeQuality'+worktimeList1[i].ID;
						   
						     $("#charge tr:last").append("<td  style='width: 142px;text-align: center;'><input class='input2' type='hidden' readonly='readonly' name='chargeEmp'  id='chargeEmp"+worktimeList1[i].ID+"'><input type='text' readonly=\"readonly\"  id='2chargeEmp"+worktimeList1[i].ID+"'   onclick=\"popupDiv('"+empId+"')\" value='请选择' ></td>");
						     $("#charge tr:last").append("<td  style='width: 142px;text-align: center;'><input class='input2'   type='hidden' readonly='readonly'  name='chargeTech'  id='chargeTech"+worktimeList1[i].ID+"'><input type='text' readonly=\"readonly\" id='2chargeTech"+worktimeList1[i].ID+"'   onclick=\"popupDiv('"+chargeTech+"')\"   value='请选择'></td>");
						     $("#charge tr:last").append("<td  style='width: 142px;text-align: center;'><input class='input2'  type='hidden' readonly='readonly'  name='chargeDevice'  id='chargeDevice"+worktimeList1[i].ID+"'><input type='text' readonly=\"readonly\" id='2chargeDevice"+worktimeList1[i].ID+"'   onclick=\"popupDiv('"+chargeDevice+"')\"   value='请选择'></td>");
						     $("#charge tr:last").append("<td  style='text-align: center;'><input class='input2'  type='hidden' readonly='readonly'  name='chargeQuality' id='chargeQuality"+worktimeList1[i].ID+"'><input type='text' readonly=\"readonly\" id='2chargeQuality"+worktimeList1[i].ID+"'  onclick=\"popupDiv('"+chargeQuality+"')\"   value='请选择'></td>");
						 
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
    
	var type = $("#searchEqType").val();
	
	var sn = $("#searchEqSN").val();
	var eqName = $("#searchEqName").val();
	
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl+"&flag=4",
	    data:"type="+type+"&sn="+sn+"&eqName="+eqName+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
	   
		success: function(data){
		util.closeLoading();
				if(null == data.ajaxPage.dataList){
				utilsFp.alert("没查询到数据");
				$("#roleTbody").empty();
				pageFun(data.ajaxPage,"formId1");
				return ;}
				if(null != data.ajaxPage.dataList){
				         
					var roleList = eval(data.ajaxPage.dataList[0]);
					$("#roleTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					       
						$("#roleTbody").append("<tr></tr>");
$("#roleTbody tr:last").append("<td style='width: 50px;text-align: center;'>"+(i+1)+"</td>");						
$("#roleTbody tr:last").append("<td style='width: 50px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 120px;text-align: left;'>"+data.ajaxPage.dataList[i].CD_DEVICE_TYPE+"<input type='hidden' id='CD_DEVICE_TYPE"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_TYPE+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 112px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"<input type='hidden' id='DEVICE_SN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'/></td>");
$("#roleTbody tr:last").append("<td style='width: 127px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"<input type='hidden' id='DEVICE_NAME"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 89px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_CHARGE_MAN+"'>"+data.ajaxPage.dataList[i].CD_CHARGE_MAN+"<input type='hidden' id='CHARGE_MAN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_CHARGE_MAN+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 57px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_STATUS+"'>"+data.ajaxPage.dataList[i].CD_STATUS+"<input type='hidden' id='STATUS"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_STATUS+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 75px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_SUPPLIER_ID+"'>"+data.ajaxPage.dataList[i].CD_SUPPLIER_ID+"<input type='hidden' id='SUPPLIER_ID"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_SUPPLIER_ID+"' /></td>");
$("#roleTbody tr:last").append("<td style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_VALID_FLAG+"'>"+data.ajaxPage.dataList[i].CD_VALID_FLAG+"<input type='hidden' id='VALID_FLAG"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_VALID_FLAG+"' /></td>");
					}
					init();pageFun(data.ajaxPage,"formId1");
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
			    url:messageurl+"&flag=3",
			    data: "calName="+calName+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				util.closeLoading();
						if(null == data.ajaxPage.dataList){
						utilsFp.alert("没查询到数据");
                                                $("#jobTbody").empty();
                                                pageFun(data.ajaxPage,"formId2");
						return ;}
						if(null != data.ajaxPage.dataList){
							
							$("#jobTbody").empty();
							
							for(var i = 0;i < data.ajaxPage.dataList.length; i++){
							
								$("#jobTbody").append("<tr></tr>");
								$("#jobTbody tr:last").append("<td style='width: 50px;text-align: center;'>"+(i+1)+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 50px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CAL_NAME+"' /></td>");
								$("#jobTbody tr:last").append("<td style='width: 120px;text-align: left;'>"+data.ajaxPage.dataList[i].CAL_NAME+"<input type='hidden' id='remark_"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CAL_NAME+"'/></td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_START_MONTH+"'>"+data.ajaxPage.dataList[i].CAL_START_MONTH+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_END_MONTH+"'>"+data.ajaxPage.dataList[i].CAL_END_MONTH+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_SAT_FLAG+"'>"+data.ajaxPage.dataList[i].CAL_SAT_FLAG+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_SUN_FLAG+"'>"+data.ajaxPage.dataList[i].CAL_SUN_FLAG+"</td>");
								$("#jobTbody tr:last").append("<td style='text-align: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_DEFAULT_FLAG+"'>"+data.ajaxPage.dataList[i].CAL_DEFAULT_FLAG+"</td>");
							}
							init();pageFun(data.ajaxPage,"formId2");
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
	  function addRoleList(showId,backId){
	 	$(".firstTableBack").show();
			 $("#roleTbody :checkbox").each(function(){
			 
					if($(this).attr("checked")){
						if (!$("#trr"+$(this).attr("id")).length) {
						  
							
							
							
							$("#addRoleList").append("<tr id='trr"+$(this).attr("id")+"' name='trname' onclick=\"getTrRoleId('"+$(this).attr("id")+"')\"><input  type='hidden' name='deviceName' value='"+$(this).attr("id")+"'/><input  type='hidden' name='deviceId_o' value='"+$(this).attr("id")+"' /><input  type='hidden' name='deviceSeq_o' value='"+total+"' /></tr>");
							$("#addRoleList tr:last").append("<td style='width: 43px;text-align: center;'></td>");
							$("#addRoleList tr:last").append("<td style='width: 43px;text-align: center;'><input  type='checkbox' /></td>");
							$("#addRoleList tr:last").append("<td style='width: 224px;text-align: center;'>"+total+"</td>");
							$("#addRoleList tr:last").append("<td style='width: 224px;text-align: center;'>"+$("#DEVICE_SN"+$(this).attr("id")).val()+"</td>");
							$("#addRoleList tr:last").append("<td style='text-align: center;'>"+$("#DEVICE_NAME"+$(this).attr("id")).val()+"</td>");
								total+=1;
						}
					}
				});
				init();
			
			
			$("#roleTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#role_list_cb").attr("checked",false);
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
			 $("#jobTbody :checkbox").each(function(){
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
			console.log(top.$("#"+window.frameElement.name));
				 if(top.$("#"+window.frameElement.name) != null && top.$("#"+window.frameElement.name).length > 0 && 
					top.$("#"+window.frameElement.name)[0].contentWindow != undefined){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			}
			});
		var isQuery = false;
		function edit(thisObj){
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
		}
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
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
		$("#tag3").css("display","none");
		$("#thirdTable").css("display","none");
	        $("#paraMapObj_CA_EMP_ROLE").attr("disabled","disabled");
	        $("#paraMapObj_CA_GROUP").attr("disabled","disabled");
	        }else{
		$("#tag3").css("display","block");
		$("#thirdTable").css("display","block");
		switchTag('tag3','content3','');this.blur();
		}
	       
	        }
                flag_disable();

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
</body>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

<%@ include file="/plf/common/pub_end.jsp"%>
