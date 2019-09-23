<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="车间信息新增" /></title>
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
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
	</script>
	<script type="text/javascript">
		
		var isQuery = false;
		var parentWindow;
		$(function(){
			if(top.$("#"+window.frameElement.name) != null && top.$("#"+window.frameElement.name).length > 0 && 
					top.$("#"+window.frameElement.name)[0].contentWindow != undefined){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			}
			
			
		});

		 function valData(){
    var checkRes = true;
    return checkRes;    }
        function disable(){
          
          var value = $("#paraMap1_CA_TYPE_chosen").find("a").find("span").html();
          
          if(value=="工作中心"){
                $("#thirdTable").css("display","block");
                switchTag('tag3','content3','');this.blur();
                $("#paraMap1_CA_EMP_ROLE").css("display","none");
	        $("#paraMap1_CA_GROUP").css("display","none");
	        $("#paraMap1_CA_EMP_ROLE_chosen").css("display","block");
	        $("#paraMap1_CA_GROUP_chosen").css("display","block");
	         $("#paraMap1_CA_EMP_ROLE").removeAttr("disabled");
	        $("#paraMap1_CA_GROUP").removeAttr("disabled");
          }else{
                $("#thirdTable").css("display","none");
                switchTag('tag1','content1','');this.blur();
                $("#paraMap1_CA_EMP_ROLE").css("display","block");
	        $("#paraMap1_CA_GROUP").css("display","block");
	        $("#paraMap1_CA_EMP_ROLE option:contains('--请选择--')").attr('selected', true);
	        $("#paraMap1_CA_GROUP    option:contains('--请选择--')").attr('selected', true);
	        $("#paraMap1_CA_EMP_ROLE").attr("disabled","disabled");
	        $("#paraMap1_CA_GROUP").attr("disabled","disabled");
	        $("#paraMap1_CA_EMP_ROLE_chosen").css("display","none");
	        $("#paraMap1_CA_GROUP_chosen").css("display","none");
          }
        }
	</script>
		<style type="text/css">
				#secondTable{
					display: none;
				
				}
				#thirdTable{
					display: none;
				
				}
				
			
				.input1 {
                      width: 139px;
                      box-sizing: border-box;
                      border: 1px solid #ccc;
                      height: 25px;
                      line-height: 25px;
                      padding-left: 5px;
                      font-size: 13px;
}
			.input2 {
                      width: 100px;
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
		
		</style>	
	</head>
		
<body>
  <div class="mod" style="margin-top: 37px;height: 363px;">
	<div class="edit">
            <div class="hd" style="height:0;margin:0;">
              
                <div style="margin-left:10px;position: absolute;top: 0;"><input type="checkbox" checked id="isCloseWin_s"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="saveNew(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
	<form id="addForm" name="addForm"   method="post"  <bu:formet exeid="%{exeid}" />target="submitFrame" style="padding:10px 20px;">
		<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="F28" />
		<s:token />
		<input type="hidden" name="userDto.pw" value="1" />
		<input type="hidden" id="isCloseWin" name="isCloseWin"/>
		<input type="hidden" id="userDto.photoName" name="userDto.photoName"/>
		<input type="hidden" id="iframeId" name="paraMap.iframeId" value="${iframeid}"/>
		<input type="hidden" id="tagli" name="tableState" value="" />
		
	<%-- <div class="ptop_10 txac" >
		<input type="button" value="<dict:lang value="保 存" />" onclick="add(this);" class="botton_img_add">
		&nbsp;&nbsp;
		<input type="button" value="<dict:lang value="关 闭" />" onclick="closeWindow();" class="botton_img_search"> 
	</div> --%>
	<table class="basic-table" >
	<input type="hidden" id="formId" name="formIds" value="a6f1789e15de48a4831030ad33f6134f" />
	<input type="hidden" name="a6f1789e15de48a4831030ad33f6134f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="flag_disable" id="flag_disable" value="${dataMap.flag_disable}">
	<input type="hidden" name="para_type" id="para_type" value="${dataMap.ca_type}">
		<s:set name="_$viewId" value="'50149d38f0284691aaa8d101987367ee'" />
		<s:set name="_$formId_1" value="'a6f1789e15de48a4831030ad33f6134f'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:52px;"/><span class="dot">*</span><bu:uitn colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_TYPE}" formIndex="1" /></bu:td>
		
			<td class="name"  style="width:52px;"/><bu:uitn colNo="CA_PARENTAREAID" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="CA_PARENTAREAID" formId="a6f1789e15de48a4831030ad33f6134f" >
			<input type="hidden" id="paraMap1_CA_PARENTAREAID"  name="paraMap1@0#CA_PARENTAREAID" class=" input isSubmit  _VAL_OjbsData" value="${dataMap.parentid}">
			<input type="text" disabled="disabled" id="PARENTAREAID_NAME"  name="PARENTAREAID_NAME" class=" input isSubmit  _VAL_OjbsData" value="${dataMap.parentname}">
			</bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CA_ID" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_ID" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_ID" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_ID}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CA_NAME" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_NAME" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_NAME" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CA_EMP_ROLE" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_EMP_ROLE" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_EMP_ROLE" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_EMP_ROLE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CA_GROUP" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_GROUP" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_GROUP" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_GROUP}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_STATUS}" formIndex="1" /></bu:td>
			<td class="name" nowrap /><bu:uitn colNo="CA_FEEDER_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_FEEDER_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_FEEDER_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_FEEDER_FLAG}" formIndex="1" /></bu:td>
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
						
	<div class="mod-hd" id="firstTable"  style="border: none;height:auto;margin: 5px 0;">		
  		
  		<div class="extend-btn" style="float:right;">
			<button type="button" onclick="popRoleDiv('addRole','backRole');" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" onclick="delRoleRow();" style="padding:0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>     		        
   		</div>	
	</div>
	<div class="mod-hd" id="secondTable" style="border: none;height:auto;margin: 5px 0;">		
  		
  		<div class="extend-btn" style="float:right;">
			<button type="button" onclick="popJobDiv('addJob','backJob');" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" onclick="delJobRow();" style="padding:0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>     		        
   		</div>	
	</div>
	<div class="mod-hd" id="thirdTable" style="border: none;height:auto;margin: 5px 0;">		
  		
  		<div class="extend-btn" style="float:right;">
			<button type="button" onclick="popOrderDiv('addOrder','backOrder');" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" onclick="delOrderRow();" style="padding:0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>     		        
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
		
    
    <table  class="dlist-table table-line"style="width: 100%" target="firstTable">
		<thead>
		<tr class="thcolor">
			<th style="width: 30px;text-align: center;">&nbsp;</th>
			<th style="width: 30px;text-align: center;"><input type="checkbox" id="role_list_cb_s" onchange="getAllRole_s();"  /></th >
			<th style="width: 154px;text-align: center;"><dict:lang value="设备序号" /></th>
			<th style="width: 154px; text-align: center;"><dict:lang value="设备代码" /></th>
			<th style="width: 154px; text-align: center;"><dict:lang value="设备名称" /></th>
		</tr>
		</thead>
    </table>
    <div style="width:760px;height:100px;overflow-y: auto;overflow-x: hidden;" >
       <table target="firstTable">
		<tbody id="addRoleList">
		</tbody>
	</table>
    </div>
    
      
	<table  class="dlist-table table-line " style="margin-top: -100px;width: 100%;display:none;" target="secondTable" >
		<thead>
		<tr class="thcolor">
			
			    <th style="width: 25px;text-align: center;">&nbsp;</th>
				<th style="width: 28px;text-align: center;"><input type="checkbox" id="job_list_cb_s" onchange="getAllJob_s();" /></th >
				<th style="width: 137px;text-align: center;"><dict:lang value="班别" /></th >
				<th style="width: 142px;text-align: center;"><dict:lang value="主要负责人" /></th >
				<th style="width: 142px;text-align: center;"><dict:lang value="工艺负责人" /></th >
				<th style="width: 142px;text-align: center;"><dict:lang value="设备负责人" /></th >
				<th style="width: 143px;text-align: center;"><dict:lang value="品质负责人" /></th >
				
		</tr>
		</thead>
		</table>
    <div style="width:760px;height:auto;overflow-y: auto;overflow-x: hidden;" >
       <table  target="secondTable">
		<tbody id="charge">
		</tbody>
	</table>
	</div>
	
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
<script >
//业务判断
$("#paraMap1_CA_TYPE").change(function(){
 var caType="";
 caType=document.getElementById("paraMap1_CA_TYPE").value; 
 if(caType=="0"||caType=="1"){
$("#paraMap1_CA_EMP_ROLE").attr("Disabled","true"); 
$("#paraMap1_CA_GROUP").attr("Disabled","true"); 
 }else{
 $("#paraMap1_CA_EMP_ROLE").attr("Disabled",false); 
 $("#paraMap1_CA_GROUP").attr("Disabled",false); 
 }
 }); 
 //关闭当前页并刷新列表
       function reloadPgExe(){
		//document.forms.searchForm.submit();
		
		util.showTopLoading();
		top.$(".dialog-close").click();
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
					
					
					
				   
					
			
	
		var TrRoleId = "";
		function getTrRoleId(trId){
			$("#roleTable").find("tr").each(function(){
				$(this).removeClass("selected");
			});
			$("#trr"+trId).addClass("selected");
			TrRoleId = trId;
			init();
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
			 var value = $("#paraMap1_CA_TYPE_chosen").find("a").find("span").html();
			if(value=="工作中心"){$("#thirdTable").show();}
			$("table[target='thirdTable']").show();
			$("#tagli").val("2");
		}
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
			$("#charge :checkbox").attr("checked",true);
		}else{
			$("#charge :checkbox").each(function(){
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
			var gzzx = $("#paraMap1_CA_ID").val();
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
		 	        alert("失败");
				util.closeLoading();
				//utilsFp.alert("error:"+msg);
				utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
		  }
		});

}



//日历表条件查询
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
						  
							
							
							
							$("#addRoleList").append("<tr id='trr"+$(this).attr("id")+"' name='trname' onclick=\"getTrRoleId('"+$(this).attr("id")+"')\"><input  type='hidden' name='deviceName' value='"+$(this).attr("id")+"'/><input  type='hidden' name='deviceSeq' value='"+total+"' /></tr>");
							$("#addRoleList tr:last").append("<td style='width: 43px;text-align: center;'></td>");
							$("#addRoleList tr:last").append("<td style='width: 43px;text-align: center;'><input  type='checkbox' /></td>");
							$("#addRoleList tr:last").append("<td style='width: 224px;text-align: center;'>"+total+"</td>");
							$("#addRoleList tr:last").append("<td style='width: 224px;text-align: center;'>"+$("#DEVICE_SN"+$(this).attr("id")).val()+"</td>");
							$("#addRoleList tr:last").append("<td style='text-align: center;'>"+$("#DEVICE_NAME"+$(this).attr("id")).val()+"</td>");
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
			var len = $("#addJobList tr").length;
			for(var i=0;i<len;i++){
				$("#addJobList tr:eq("+i+") td:first").text(i+1);
			} 
			
			$("#jobTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#job_list_cb").attr("checked",false);
			
		} 
	
		
		//负责人信息删除
		function delJobRow(){
		        
			$("#charge :checkbox").each(function(){
				if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			       
					$("#i"+trid).remove();
					$("#"+trid).remove();
					
				}
			});
		
		}
		//指令集相关信息新增
		 var total=0;
 function addOrderList(showId,backId){
                    
	 	var gzzx = $("#paraMap1_CA_ID").val();
			 $("#orderTbody :checkbox").each(function(){
			               
					if($(this).attr("checked")){
					      
						if (!$("#trr"+$(this).attr("id")).length) {
						     
							
							
							
							$("#order").append("<tr id='trr"+$(this).attr("id")+"' name='trname'><input  type='hidden' name='orderCode' value='"+$(this).attr("id")+"'/><input  type='hidden' name='orderName' value='"+$("#TCS_NAME"+$(this).attr("id")).val()+"'/><input  type='hidden' name='gzzxCode' value='"+gzzx+"'/><input  type='hidden' name='orderSeq' value='"+total+"' /></tr>");
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
		//指令集相关信息删除
		function delOrderRow(){
		        
			$("#order :checkbox").each(function(){
				if($(this).attr("checked")){
			var trid = $(this).parent().parent().attr("id");
			       
					$("#i"+trid).remove();
					$("#"+trid).remove();
					
				}
			});
		
		}	
		

</script>
<script type="text/javascript">
	
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		 flag_disable();
		 ca_type();
	}//初始化方法
	  //var check=document.getElementById("paraMap1_CA_STATUS_1")
	  //check.checked=true;
	function flag_disable(){
	        
	        var value = $("#flag_disable").val();//1为工作中心
	       
	        if(value==0){
	       
	        $("#paraMap1_CA_EMP_ROLE").css("display","block");
	        $("#paraMap1_CA_GROUP").css("display","block");
	        $("#paraMap1_CA_EMP_ROLE").attr("disabled","disabled");
	        $("#paraMap1_CA_GROUP").attr("disabled","disabled");
	        $("#paraMap1_CA_EMP_ROLE_chosen").css("display","none");
	        $("#paraMap1_CA_GROUP_chosen").css("display","none");
	        }else{
	         $("#paraMap1_CA_EMP_ROLE").css("display","none");
	        $("#paraMap1_CA_GROUP").css("display","none");
	        $("#paraMap1_CA_EMP_ROLE_chosen").css("display","block");
	        $("#paraMap1_CA_GROUP_chosen").css("display","block");
	         $("#paraMap1_CA_EMP_ROLE").removeAttr("disabled");
	        $("#paraMap1_CA_GROUP").removeAttr("disabled");
	        }
	       
	        }
	function ca_type(){
	        var value = $("#para_type").val();
	       
	        if(value==1){
	        $("#paraMap1_CA_TYPE option[value='0']").remove();
	        $("#paraMap1_CA_TYPE").trigger("chosen:updated");
	        }else if(value==3){
	        $("#paraMap1_CA_TYPE option[value='1']").remove();
	        $("#paraMap1_CA_TYPE option[value='2']").remove();
	        $("#paraMap1_CA_TYPE").trigger("chosen:updated");
	        }
	}          
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<bu:submit viewId="6c560c65516948149581dc95b13bae38" />
<bu:script viewId="6c560c65516948149581dc95b13bae38" />
</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>
