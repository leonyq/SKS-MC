<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="车间信息新增" /></title>
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
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				//head.appendChild(script);
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
				
		        		console.log('${dataMap}');
		
			
		});

		 function valData(){
    var checkRes = true;
    return checkRes;    }
        function disable(){
          
          //var value = $("#paraMap1_CA_TYPE_chosen").find("a").find("span").html();
          var value = $("#paraMap1_CA_TYPE").val();
          if(value=="2"){
                $("#thirdTable").css("display","block");
                switchTag('tag3','content3','');this.blur();
                $("#paraMap1_CA_EMP_ROLE").css("display","none");
	        $("#paraMap1_CA_GROUP").css("display","none");
	        $("#paraMap1_CA_EMP_ROLE_chosen").css("display","block");
	        $("#paraMap1_CA_GROUP_chosen").css("display","block");
	        $("#paraMap1_CA_EMP_ROLE").removeAttr("disabled");
	        $("#paraMap1_CA_GROUP").removeAttr("disabled");
	        $("#paraMap1_CA_GROUP_chosen").removeAttr("disabled");
	        $("#paraMap1_CA_GROUP").trigger("chosen:updated");
	        $('#tag2').css('display','none');
	        $('#tag3').css('display','block');
	        $('#charge').empty();
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
	        $('#tag2').css('display','block');
	        $('#tag3').css('display','none');
	        $('#order').empty();
          }
        }
        function disable2(){
        var value = $("#paraMap1_CA_TYPE").val();
        if(value=="2" || value=="0"){
        $("#paraMap1_CA_FEEDER_FLAG_1").attr("checked",false);
        $("#paraMap1_CA_FEEDER_FLAG_1").attr("disabled",true);
        }else if(value=="1"){
        $("#paraMap1_CA_FEEDER_FLAG_1").attr("disabled",false);
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
				#paraMap1_CA_TYPE_chosen{
				$(' .chosen-container').css("width","230px");
				}
				#searchDevTypeSelect_chosen{
				$(' .chosen-container').css("width","157px");
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
                      width: 100px;
                      box-sizing: border-box;
                      border: 1px solid #ccc;
                      height: 25px;
                      line-height: 25px;
                      padding-left: 5px;
                      font-size: 13px;
            }
							
                #charge	tr{
                    height:30px;
                }
        
				#charge td{
					border:1px solid #dbe1ef;
					text-overflow: ellipsis;
                   
				}
				
				#order tr{
                    height:30px;
                }
				
				#order td{
					border:1px solid #dbe1ef;								
                    text-overflow: ellipsis;
                   
				}
				
				#addRoleList	tr{
                    height:30px;
                }
				
				#addRoleList td{
					border:1px solid #dbe1ef;													
                    text-overflow: ellipsis;
                   
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
				
		
		</style>
		
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="inHead" />
    </jsp:include> 
	</head>
		
<body>
  <div class="mod" style="height: 500px;">
	<div class="edit">
	<form id="addForm" name="addForm"   method="post"  <bu:formet exeid="%{exeid}" />target="submitFrame" >
            <div class="hd" style="padding-bottom: 10px; margin-bottom: 0px;background-color: #f6f5f7;">
                <div class="save-close" style="margin-left:10px;" <dict:lang value = "保存并关闭窗口" /> onclick="saveClose(this);isCloseWincheck();"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;" />
                <!--<div style="margin-left:10px;position: absolute;top: 0;"><input type="checkbox" checked id="isCloseWin_s"  value="0"/><dict:lang value="保存并关闭窗口" /></div>-->
			    <div class="optn">
			        <button type="button" onclick="saveNew(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
	
			<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_10" />
        <jsp:param name="location" value="addForm" />
	</jsp:include>

		<input type="hidden" name="userDto.pw" value="1" />
		<input type="hidden" id="isCloseWin" name="isCloseWin"/>
		<input type="hidden" id="userDto.photoName" name="userDto.photoName"/>
		<!--
		<input type="hidden" id="iframeId" name="paraMap.iframeId" value="${iframeid}"/>
		-->
		<input type="hidden" id="iframeId" name="paraMap.iframeId" value="${iframeId}"/>
		<input type="hidden" id="tagli" name="tableState" value="" />
		

	<table class="basic-table" style="margin:0 10px; width:calc(100% - 20px);">
	<input type="hidden" id="formId" name="formIds" value="a6f1789e15de48a4831030ad33f6134f" />
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="formId" id="formId6" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<input type="hidden" name="formId" id="formId3" value='831b2dbf0dfb494695b7ce66538a5678'/>
	<input type="hidden" name="formId" id="formId4" value='831b2dbf0dfb494695b7ce66538a0000'/>
	<input type="hidden" name="formId" id="formId5" value='831b2dbf0dfb494695b7ce66538a1111'/>
	<input type="hidden" name="formId" id="formId7" value='4321'/>
	<input type="hidden" name="a6f1789e15de48a4831030ad33f6134f" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="flag_disable" id="flag_disable" value="${dataMap.flag_disable}">
	<input type="hidden" name="para_type" id="para_type" value="${dataMap.ca_type}">
	<input type="hidden" name="parentType" id="parentType" value="${dataMap.parentType}">
	<input type="hidden" name="add_type" id="add_type" value="${dataMap.add_type}">	
	<input type="hidden" name="trackFlag" id="trackFlag" value="${dataMap.trackFlag}">	
		<s:set name="_$viewId" value="'6c560c65516948149581dc95b13bae38'" />
		<s:set name="_$formId_1" value="'a6f1789e15de48a4831030ad33f6134f'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:85px;"/><span class="dot">*</span><bu:uitn colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_TYPE" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_TYPE}" formIndex="1" /></bu:td>
		
			<td class="name"  style="width:113px;"/><bu:uitn colNo="CA_PARENTAREAID" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
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
			<bu:td cssClass="dec" colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" >
			<bu:ui colNo="CA_STATUS" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_STATUS}" formIndex="1" />
			&nbsp;&nbsp;&nbsp;
			<bu:uitn colNo="CA_FEEDER_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" />
			<bu:ui colNo="CA_FEEDER_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_FEEDER_FLAG}" formIndex="1" />
			</bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CA_PROJECT_STEP" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_PROJECT_STEP" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_PROJECT_STEP" formId="a6f1789e15de48a4831030ad33f6134f"  value="%{CA_PROJECT_STEP}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CA_STOP_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_STOP_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_STOP_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_STOP_FLAG}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CA_STOP_TIME" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_STOP_TIME" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_STOP_TIME" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_STOP_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CA_TRACK_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_TRACK_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_TRACK_FLAG" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_TRACK_FLAG}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CA_TRACK" formId="a6f1789e15de48a4831030ad33f6134f" /></td>
			<bu:td cssClass="dec" colNo="CA_TRACK" formId="a6f1789e15de48a4831030ad33f6134f" ><bu:ui colNo="CA_TRACK" formId="a6f1789e15de48a4831030ad33f6134f" value="%{CA_TRACK}" formIndex="1" /></bu:td>
		</tr>
	</table>
   <div style="padding:0 10px;">
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
								<LI id="tag3"  style="display:none;"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();"
									href="javascript:void(0);"> <SPAN>关联指令集</SPAN> </A>
								</LI>

							</UL>
						</DIV>
		</DIV>
		</div>
						
	<div class="mod-hd" id="firstTable"  style="border: none;height:auto;margin: 5px 0;">		
  		
  		<div class="extend-btn" style="float:right;margin-top:-30px;">
			<button type="button" onclick="popRoleDiv('addRole','backRole');" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" onclick="delRoleRow();" style="padding:0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>     		        
   		</div>	
	</div>
	<div class="mod-hd" id="secondTable" style="border: none;height:auto;margin: 5px 0;">		
  		
  		<div class="extend-btn" style="float:right;margin-top:-30px;">
			<button type="button" onclick="popJobDiv('addJob','backJob');" style="padding:0;" title="新增"><i class="ico ico-kl-new-add ico-small"></i></button>
			<button type="button" onclick="delJobRow();" style="padding:0;" title="删除"><i class="ico ico-sc-new-add ico-small"></i></button>     		        
   		</div>	
	</div>
	<div class="mod-hd" id="thirdTable" style="border: none;height:auto;margin: 5px 0;">		
  		
  		<div class="extend-btn" style="float:right;margin-top:-30px;">
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
				<button type="button" onclick="searchEqInfo('formId6');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
				         </div>
				      
				<table>
				 <tr style="height:35px;">
			    		<td style="width: 90px;text-align: right;" ><dict:lang value="设备类型"/>&nbsp;</td>
			    		<td style="width: 162px;text-align: left;"><select id="searchDevTypeSelect" name="searchDevTypeSelect" class=" input isSubmit dept_select" style="width: 157px;"> <option value="" >--请选择--</option> </select></td>
			    		<td  style="width: 90px;text-align: right;" ><dict:lang value="设备SN"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqSN" class="input" style="width:157px;"/></td>
			    		<td  style="width: 90px;text-align: right;"><dict:lang value="设备名称"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchEqName" class="input" style="width:157px;"/></td>
			    		
			    	</tr>
			    	</table>
			    	<div >  
				<div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
    						<div class="datagrid-header" >
    							<div class="datagrid-header-inner head1" id="datagrid-header-inner1">
    								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234" >
    									<tbody>
    									<tr class="datagrid-header-row datagrid-title-ajax">
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
    						<div class="datagrid-body datagrid-div3 scroll1"   style="height:150px;">
    							<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" >
    								<tbody id="roleTbody" >
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
                    <div style="background-color: white;">
                                 <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchEqInfo&formId=formId6&showLoading=0" />
				        </div>
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
			    		<td style="width: 106px;text-align: right;" ><dict:lang value="指令集代码"/>&nbsp;</td>
			    		<td style="width: 162px;text-align: left;"><input  type="text" id="searchOrderCode" class="input" style="width:160px;"/></td>
			    		<td  style="width: 106px;text-align: right;" ><dict:lang value="指令集名称"/>&nbsp;</td>
			    		<td  style="width: 162px;text-align: left;"><input  type="text" id="searchOrderName" class="input" style="width:160px;"/></td>
			    		
			    		
			    	</tr>
			    	</table>
			    	<div style="width:780px;">  
			    	<table  width="780px" class="dlist-table table-line " >
				<thead>
			    	<tr>
			    	<th style="width: 30px;text-align: center;"></th >
				<th style="width: 30px;text-align: center;"><input type="checkbox" id="order_list_cb" onchange="getAllOrder();" /></th >
				<th style="width: 240px;text-align: center;"><dict:lang value="指令集代码" /></th >
				<th style="width: 240px;text-align: center;"><dict:lang value="指令集名称" /></th >
				<th style="text-align: center;"><dict:lang value="备注" /></th >
			        </tr>
			    	</thead>
			    	</table>
			    	</div>
			    	<div  style="width:780px;height:194px;overflow-y: auto;overflow-x: hidden;" >  
			    	<table id="Ordiv" width="780px" style="table-layout:fixed" class="dlist-table table-line " >
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
			<a class="dialog-close" href="javascript:void(0);" onclick="hideDivs('addUser','backUser');"></a>
			<div class="dialog-bd-div" style="width:100%;height:80%;">
			<div class="optn optn_div">
				<button type="button" onclick="addUser('addUser','backUser');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
				<button type="button" onclick="hideDivs('addUser','backUser');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				<button type="button" onclick="searchUserInfo('formId3');"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
			</div>
			
			    <table>
			    	<tr style="height:35px;">
			    		<td nowrap="" style="width: 10%;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员工编号&nbsp;&nbsp;</span></td>
			    		<td style="width: 23%;"><input class="input1" ;="" type="text" id="searchLogName"></td>
			    		<td nowrap="" style="width: 10%;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员工姓名&nbsp;&nbsp;</span></td>
			    		<td style="width: 23%;"><input class="input1" ;="" type="text" id="searchUserName"></td>
			    		<td nowrap="" style="width: 10%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所属部门&nbsp;&nbsp;</td>
			    		<td style="width: 23%;"><select id="searchDeptSelect" name="searchDeptSelect" class=" input isSubmit dept_select" style="width: 157px;"><option value="" >--请选择--</option></select></td>
			    		
			    	</tr>
			    </table>
			

	<div class="panel datagrid datagrid-div1">
    					<div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view">
    						<div class="datagrid-header" >
    							<div class="datagrid-header-inner head5" id="datagrid-header-inner5">
    								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz " id="datagrid-htable4321" >
    									<tbody>
    									<tr class="datagrid-header-row datagrid-title-ajax">
        									<td style="width: 30px;text-align: center;"></td >
                            				<td style="width: 30px;text-align: center;">&nbsp;</td >
                            				<td style="width: 170px;text-align: center;"><dict:lang value="员工编号" /></td >
                            				<td style="width: 170px;text-align: center;"><dict:lang value="员工姓名" /></td >
                            				<td style="width: 170px;text-align: center;"><dict:lang value="所属部门" /></td >
    									</tr>
    									</tbody>		
    								</table>
    							</div>
    						</div>
    						<div class="datagrid-body datagrid-div3 scroll5"   style="height:194px;">
    							<table class="datagrid-htable fixedTable dlist-table table-line" style="table-layout:fixed;" id="datagrid-btable-ajax4321" >
    								<tbody id="userTbody" >
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
	</div>
	<div style="background-color: white;">
        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchUserInfo&formId=formId3&showLoading=0" />
        </div>
	</div>
	</div>	
		
    
				<div class="panel-ajax1 datagrid datagrid-div1"  id="block1" style="margin-top:10px;"><!--143-->
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
						<div class="datagrid-body datagrid-div3 scroll2" style="height:100px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678" >
								<tbody id="addRoleList" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
    
      
				<div class="panel-ajax1 datagrid datagrid-div1" id="block2" style="margin-top:10px;"><!--143-->
					<div class="datagrid-div2 datagrid-div6 datagrid-view"  style="overflow-x:hidden;border-bottom:0;">
							<div class="datagrid-header" style="">
							<div class="datagrid-header-inner head4"  id="">
								<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1111" target="secondTable">
									<tbody>
									<tr class="datagrid-header-row thcolor">
									<td style="width: 30px;text-align: center;">&nbsp;</td>
									<td style="width: 30px;text-align: center;"><input type="checkbox" id="job_list_cb_s" onchange="getAllJob_s();" /></th >
									<td style="width: 137px;text-align: center;"><dict:lang value="班别" /></td >
									<td style="width: 142px;text-align: center;"><dict:lang value="主要负责人" /></td >
									<td style="width: 142px;text-align: center;"><dict:lang value="工艺负责人" /></td >
									<td style="width: 142px;text-align: center;"><dict:lang value="设备负责人" /></td >
									<td style="width: 142px;text-align: center;"><dict:lang value="品质负责人" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll4"  style="height:120px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1111" target="secondTable">
								<tbody id="charge" >
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
	

		
    <div style="height:200px;overflow-y: auto;overflow-x: hidden;display:none;margin-top:10px;" id="block3">
        <table  class="dlist-table table-line " style="width: 100%;display:none;" target="thirdTable" >
		<thead>
		<tr class="thcolor">
			<th style="width: 30px;text-align: center;">&nbsp;</th>
			<th style="width: 30px;text-align: center;"><input type="checkbox" id="order_list_cb_s" onchange="getAllOrder_s();"  /></th >
			<th style="width: 224px;text-align: center;"><dict:lang value="工作中心代码" /></th>
			<th style="width: 224px; text-align: center;"><dict:lang value="指令集代码" /></th>
			<th style="text-align: center;"><dict:lang value="指令集名称" /></th>
		</tr>
		</thead>
		</table>
       <table  target="thirdTable" style="width:100%;table-layout: fixed;">
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
			<dict:lang value="选择工厂日历" />
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
			    	<tr style="height:35px;">
			    		<td style="width: 8%;">&nbsp;&nbsp;<dict:lang value="日历名称"/></td>
			    		<td style="width: 75%;text-align: left;"><input class="input" style="width: 157px;left: 8%;" type="text" id="searchByCalName"/></td>
			    		
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
									<td class="datagrid-cell" style="width: 30px;text-align: center;"><input type="checkbox" id="job_list_cb" onchange="getAllJob();" /></td >
									<td class="datagrid-cell"  style="width: 120px;text-align: center;"><dict:lang value="日历名称" /></td >
									<td class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="起始月份" /></td >
									<td class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="结束月份" /></td >
									<td class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="周六上班" /></td >
									<td class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="周天上班" /></td >
									<td class="datagrid-cell"  style="width: 110px;text-align: center;"><dict:lang value="默认标识" /></td >
										
									</tr>
									</tbody>		
								</table>
							</div>
						</div>
						<div class="datagrid-body datagrid-div3 scroll3" style="height:180px;"><!--130-->
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a0000" >
								<tbody id="jobTbody" >
								</tbody>
							</table>
						</div>
						
					</div>
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

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<script >
var messageurl ="buss/bussModel_exeFunc.ms?funcMId=6f1756b59a42414db9b50917d8e7fec3";
function getSelectDept(obj){
  $.ajax({
	type: "POST",
	dataType: "json",
	url: "buss/bussModel_exeFunc.ms?funcMId=c11581ea6dc542b686159fccf6ba25f6",
	data: "",
	success: function(data){
		if(null == data){return ;}
		if(null != data.ajaxList){
			$("#searchDeptSelect").empty();
			$("#searchDeptSelect").append("<option value=''>--请选择--</option>");
			for(var i = 0;i < data.ajaxList.length; i++){
			$("#searchDeptSelect").append("<option value=\""+data.ajaxList[i].ID+"\">"+data.ajaxList[i].NAME+"</option>");
                              }
                        $("#searchDeptSelect").trigger("chosen:updated");
			};
                          init();
			},
		error: function(msg){
			util.closeLoading();
			utilsFp.alert("error:"+msg);
			}
		});

}
function getDevTypeSelect(){
$.ajax({
	type: "POST",
	dataType: "json",
	url: "buss/bussModel_exeFunc.ms?funcMId=69c873f00223430bad214b3c25e15d5a",
	data: "",
	success: function(data){
		if(null == data){return ;}
		if(null != data.ajaxList){
			$("#searchDevTypeSelect").empty();
			$("#searchDevTypeSelect").append("<option value=''>--请选择--</option>");
			for(var i = 0;i < data.ajaxList.length; i++){
			$("#searchDevTypeSelect").append("<option value=\""+data.ajaxList[i].CODE+"\">"+data.ajaxList[i].VALUE+"</option>");
                              }
                        $("#searchDevTypeSelect").trigger("chosen:updated");
			};
                          //init();
			},
		error: function(msg){
			util.closeLoading();
			utilsFp.alert("error:"+msg);
			}
		});

}
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
     if(caType=="1"){//为线别则可以设置停线开关
         $("#paraMap1_CA_STOP_FLAG_1").removeAttr("disabled");
         $("#paraMap1_CA_STOP_TIME").removeAttr("disabled");
         $("#paraMap1_CA_STOP_TIME").attr("class","input isSubmit  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
         $("#paraMap1_CA_PROJECT_STEP").removeAttr("disabled");
        // $("#paraMap1_CA_PROJECT_STEP").attr("class","input isSubmit  _VAL_OjbsData isaddSubmit _VAL_DATABASE");
         $("#paraMap1_CA_PROJECT_STEP").trigger("chosen:updated");
         //设置双轨标志
         $("#paraMap1_CA_TRACK_FLAG_1").removeAttr("disabled");
     }else{
         $("#paraMap1_CA_STOP_FLAG_1").attr("disabled","disabled");
         $("#paraMap1_CA_STOP_FLAG_1").removeAttr("checked");
         $("#paraMap1_CA_PROJECT_STEP").attr("disabled","disabled");
         $("#paraMap1_CA_PROJECT_STEP").removeAttr("checked");
        //  $("#paraMap1_CA_PROJECT_STEP").attr("class","input isSubmit readonly _VAL_OjbsData isaddSubmit _VAL_DATABASE");
         $("#paraMap1_CA_STOP_TIME").attr("disabled","disabled");
         $("#paraMap1_CA_STOP_TIME").val("");
         $("#paraMap1_CA_STOP_TIME").attr("class","input isSubmit readonly _VAL_OjbsData isaddSubmit _VAL_DATABASE");
         $("#paraMap1_CA_PROJECT_STEP").trigger("chosen:updated");
         $("#paraMap1_CA_TRACK_FLAG_1").attr("disabled","disabled");
         $("#paraMap1_CA_TRACK_FLAG_1").removeAttr("checked");
     }
     if(caType=="2"&&$("#trackFlag").val()=="Y"){  //为工作中心并且双轨标志为Y则允许选择
         $("#paraMap1_CA_TRACK option[value='S']").remove();
         $("#paraMap1_CA_TRACK").removeAttr("disabled");
         $("#paraMap1_CA_TRACK").attr("class","_VAL_NULL  input isSubmit  _VAL_OjbsData  isaddSubmit dept_select");
	     $("#paraMap1_CA_TRACK").trigger("chosen:updated");
     }else if(caType=="2"&&$("#trackFlag").val()=="N"){
         $("#paraMap1_CA_TRACK").val("S");
         $("#paraMap1_CA_TRACK").trigger("chosen:updated");
     }else{
         $("#paraMap1_CA_TRACK").val("");
         $("#paraMap1_CA_TRACK").attr("disabled","disabled");
         $("#paraMap1_CA_TRACK").attr("class"," input isSubmit readonly  _VAL_OjbsData isaddSubmit dept_select");
	     $("#paraMap1_CA_TRACK").trigger("chosen:updated");
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
	var dept = $("#searchDeptSelect").val();
	
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
	        "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
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
					$("#userTbody").append("<tr style='cursor: pointer;' calss='datagrid-row' id='"+data.ajaxPage.dataList[i].ID+"' ></tr>");
					$("#userTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
						$("#userTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='radio' id='"+userList[i].ID+"' name='selectValue' /></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;'>"+userList[i].LOGIN_NAME+"<input type='hidden' id='LOGIN_NAME"+userList[i].ID+"' value='"+userList[i].LOGIN_NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;'>"+userList[i].NAME+"<input type='hidden' id='NAME"+userList[i].ID+"' value='"+userList[i].NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;'>"+userList[i].DEPTNAME+"<input type='hidden' id='DEPTNAME"+userList[i].ID+"' value='"+userList[i].DEPTNAME+"'/></td>");
						
						
					}
					//init();
					pageFun(data.ajaxPage,"formId3");
					var tableTrJs = $("#userDiv tbody tr");_tongLineColor(tableTrJs);clickTrs('userTbody');
					 defTableWidthRewrite("4321");
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
				    //	console.log($("#2"+objectId).val());
					//document.getElementById(objectId).value=userName;
			
					
                            
					
					}
				});
				//init();
			
			
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#user_list_cb").attr("checked",false);
			switchTag('tag2','content2','');
		} 
					
					
					
				   
					
			
	
		var TrRoleId = "";
		function getTrRoleId(trId){
			$("#roleTable").find("tr").each(function(){
				$(this).removeClass("selected");
			});
			$("#trr"+trId).addClass("selected");
			TrRoleId = trId;
			//init();
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
					
					
						$("#userTbody").append("<tr style='cursor: pointer;' class='datagrid-row' id='"+data.ajaxPage.dataList[i].ID+"'></tr>");
						$("#userTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
						$("#userTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='radio' id='"+userList[i].ID+"' name='selectValue' /></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;text-overflow: ellipsis;  '>"+userList[i].LOGIN_NAME+"<input type='hidden' id='LOGIN_NAME"+userList[i].ID+"' value='"+userList[i].LOGIN_NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;text-overflow: ellipsis; '>"+userList[i].NAME+"<input type='hidden' id='NAME"+userList[i].ID+"' value='"+userList[i].NAME+"'/></td>");
						$("#userTbody tr:last").append("<td style='width: 170px;text-align: center;text-overflow: ellipsis;   '>"+userList[i].DEPTNAME+"<input type='hidden' id='DEPTNAME"+userList[i].ID+"' value='"+userList[i].DEPTNAME+"'/></td>");
						
						
						
					}
					//init();
					pageFun(data.ajaxPage,"formId3");
					var tableTrJs = $("#userDiv tbody tr");_tongLineColor(tableTrJs);clickTrs('userTbody');
						defTableWidthRewrite("4321");
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
			 var value = $("#paraMap1_CA_TYPE_chosen").find("a").find("span").html();
			if(value=="工作中心"){$("#thirdTable").show();}
			$("table[target='thirdTable']").show();
			$("#tagli").val("2");
			$('#block1').css('display','none')
			$('#block2').css('display','none')
			$('#block3').css('display','block')
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
		//	$("#"+showId).draggable();
			$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			$('.chosen-container').css("width","157px");
			$("#searchEqSN").val('');
			$("#searchEqName").val('');
			getRole();
			getDevTypeSelect();
		}
		
	function popJobDiv(showId,backId){
			//document.getElementById(showId).style.display = 'block';
			//document.getElementById(backId).style.display = 'block';
			$("#"+showId+",#"+backId).show();
		//	$("#"+showId).draggable();
				$("#"+showId).draggable({cancel:'.dialog-bd-div'});
			$('.chosen-container').css("width","230px");
			$("#searchByCalName").val('');
			getJob();
		}
		
	function popOrderDiv(showId,backId){
			var gzzx = $("#paraMap1_CA_ID").val();
			if(gzzx==""){
			//utilsFp.alert("请先填写工作中心代码");
			 utilsFp.confirmIcon(1,"","","", "<dict:lang value="请先填写工作中心代码" />",0,"","");
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
			var value = $("#add_type").val();
				//init();
			$("#"+showId+",#"+backId).hide();
			$("#role_list_cb").attr("checked",false);
			$("#job_list_cb").attr("checked",false);
			closeDivFp(showId+"pop");
			
		}
		function hideDivs(showId,backId){
			//document.getElementById(showId).style.display = 'none';
			//document.getElementById(backId).style.display = 'none';
			$(' .chosen-container').css("width","230px");
			var value = $("#add_type").val();
				//init();
			$("#"+showId+",#"+backId).hide();
			$("#role_list_cb").attr("checked",false);
			$("#job_list_cb").attr("checked",false);
			closeDivFp(showId+"pop");
			switchTag('tag2','content2','');
		}

 var eqObj="";
var paginationImpl = {};
function getRole(){

            var parentType=document.getElementById("parentType").value;
            console.log("parentType::;"+parentType);
            var trackFlag = $("#trackFlag").val();
            var areaSn = $("#paraMap1_CA_PARENTAREAID").val();
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url:messageurl,
			    data:{
			        "flag":"5",
			        "parentType":parentType,
			        "trackFlag":trackFlag,
			        "areaSn":areaSn
			    },
			    //data: "",
				success: function(data){
						util.closeLoading();
						if(null == data.ajaxPage.dataList){
				               
				                $("#roleTbody").empty();
				                pageFun(data.ajaxPage,"formId6");
				                return ;}
						if(null != data.ajaxPage.dataList){
							$(".firstTableClass").show();
							$("#roleTbody").empty();
							for(var i = 0;i < data.ajaxPage.dataList.length; i++){
							           
							            eqObj= data.ajaxPage.dataList[i];
								$("#roleTbody").append("<tr  style='cursor: pointer;' id='"+data.ajaxPage.dataList[i].ID+"'><input type='hidden' id='DEVICE_CLASS"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_CLASS+"'/></tr>");
								$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");								
								$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 125px;text-align: center;'>"+data.ajaxPage.dataList[i].DEVTYPEVALUE+"<input type='hidden' id='CD_DEVICE_TYPE"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_TYPE+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 115px;text-align: center;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"<input type='hidden' id='DEVICE_SN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'/></td>");
								$("#roleTbody tr:last").append("<td style='width: 130px;text-align: center;ext-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"<input type='hidden' id='DEVICE_NAME"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 92px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].NAME ==null?"":data.ajaxPage.dataList[i].NAME)+"'>"+(data.ajaxPage.dataList[i].NAME ==null?"":data.ajaxPage.dataList[i].NAME)+"<input type='hidden' id='CHARGE_MAN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].NAME+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 60px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].DSTATUS ==null?"":data.ajaxPage.dataList[i].DSTATUS)+"'>"+(data.ajaxPage.dataList[i].DSTATUS ==null?"":data.ajaxPage.dataList[i].DSTATUS)+"<input type='hidden' id='STATUS"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].DSTATUS+"' /></td>");
								$("#roleTbody tr:last").append("<td style='width: 217px;text-align: center;text-overflow:ellipsis;'title='"+(data.ajaxPage.dataList[i].SUPPLIER_NAME==null?"":data.ajaxPage.dataList[i].SUPPLIER_NAME)+"'>"+(data.ajaxPage.dataList[i].SUPPLIER_NAME==null?"":data.ajaxPage.dataList[i].SUPPLIER_NAME)+"<input type='hidden' id='SUPPLIER_ID"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].SUPPLIER_NAME+"' /></td>");
								
							}
							//init();
							pageFun(data.ajaxPage,"formId6");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
							_tongLineColor(tableTrJs);
							clickTr('roleTbody');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
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
	    data:{
	        "flag":"2"
	    },
	    //data: "",
		success: function(data){
		
		
				util.closeLoading();
				if(null == data.ajaxPage.dataList){
				
				$("#jobTbody").empty();
				pageFun(data.ajaxPage,"formId4");
				return ;}
				$(".secondTableClass").show();
				if(null != data.ajaxPage.dataList){
					var calendarList=data.ajaxPage.dataList;
					$("#jobTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					
					
						$("#jobTbody").append("<tr style='cursor: pointer;' class='datagrid-row' id='"+data.ajaxPage.dataList[i].ID+"'></tr>");
						$("#jobTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 30px;text-align: center;'><input type='radio' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CAL_NAME+"' class='isSubmit _selectdata' /></td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 120px;text-align: left;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_NAME+"<input type='hidden' id='remark_"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CAL_NAME+"'/></td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: right;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_START_MONTH+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: right;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].CAL_END_MONTH+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: center;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].SSAT_FLAG+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: center;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].SSUN_FLAG+"</td>");
						$("#jobTbody tr:last").append("<td class='datagrid-cell' style='width: 110px;text-align: center;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].MR_FLAG+"</td>");
					}
					//init();
					pageFun(data.ajaxPage,"formId4");
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a0000 tbody tr");
					_tongLineColor(tableTrJs);
					clickTrjob('jobTbody');
					defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a0000");
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
	var gzzx = $("#paraMap1_CA_ID").val();
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl,
	    data:{
	        "gzzx":gzzx,
	        "flag":"8"
	    },
	    //data: "gzzx="+gzzx,
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
					
					
						$("#orderTbody").append("<tr style='cursor: pointer;' id='order"+i+"' ></tr>");
						$("#orderTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 30px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].TCS_CODE+"' name='"+data.ajaxPage.dataList[i].TCS_CODE+"' class='isSubmit _selectdata' /></td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 240px;text-align: left;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_CODE+"<input type='hidden' id='TCS_CODE"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_CODE+"' /></td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 240px;text-align: left;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_NAME+"<input type='hidden' id='TCS_NAME"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_NAME+"' /></td>");
						$("#orderTbody tr:last").append("<td class='datagrid-cell' style='text-align: left;text-overflow:ellipsis;'>"+(data.ajaxPage.dataList[i].TCS_REMARK==null?"":data.ajaxPage.dataList[i].TCS_REMARK)+"</td>");
		
					}
					//init();
					pageFun(data.ajaxPage,"formId4");var tableTrJs = $("#orderTbody tr");_tongLineColor(tableTrJs);clickTr('orderTbody');
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
			 var data ={"calId":calId,
			     "flag":"1"
			 };
				
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: messageurl ,
			    data:data,
				success: function(data){
				        
						if(null == data){
						return ;}
						console.log(data.ajaxList);
						if(null != data.ajaxList){
						
							var worktimeList1 =  eval(data.ajaxList);
							var len = $("#charge tr").length;
							
							console.log(worktimeList1);
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
						     $("#charge tr:last").append("<td  style='width: 142px;text-align: center;'><input class='input2'  type='hidden' readonly='readonly'  name='chargeQuality' id='chargeQuality"+worktimeList1[i].ID+"'><input type='text' readonly=\"readonly\" id='2chargeQuality"+worktimeList1[i].ID+"'  onclick=\"popupDiv('"+chargeQuality+"')\"   value='请选择'></td>");
						     len++;
						}
                            defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1111");
							//init();
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
	var parentType=document.getElementById("parentType").value;
    var trackFlag = $("#trackFlag").val();
    var areaSn = $("#paraMap1_CA_PARENTAREAID").val();
	util.showLoading("处理中...");
	$.ajax({
		type: "POST",
	    dataType: "json",
	    url:messageurl,
	    data:{
	        "flag":"4",
	        "sn":sn,
	        "eqName":eqName,
	        "parentType":parentType,
	        "trackFlag":trackFlag,
	        "areaSn":areaSn,
	        "type":type,
	        "page.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
	        "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
	    },
	   // data:"type="+type+"&sn="+sn+"&eqName="+eqName+"&parentType="+parentType+"&trackFlag="+trackFlag+"&areaSn="+areaSn+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
	   
		success: function(data){
		util.closeLoading();
				if(null == data.ajaxPage.dataList){
				
				$("#roleTbody").empty();
				pageFun(data.ajaxPage,"formId6");
				return ;}
				if(null != data.ajaxPage.dataList){
				         
					var roleList = eval(data.ajaxPage.dataList[0]);
					$("#roleTbody").empty();
					for(var i = 0;i < data.ajaxPage.dataList.length; i++){
					       
						$("#roleTbody").append("<tr style='cursor: pointer;' id='"+data.ajaxPage.dataList[i].ID+"'><input type='hidden' id='DEVICE_CLASS"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_CLASS+"'/></tr>");
$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");						
$("#roleTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 125px;text-align: left;'>"+data.ajaxPage.dataList[i].DEVTYPEVALUE+"<input type='hidden' id='CD_DEVICE_TYPE"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_TYPE+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 115px;text-align: left;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"<input type='hidden' id='DEVICE_SN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_SN+"'/></td>");
$("#roleTbody tr:last").append("<td style='width: 130px;text-align: left;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"'>"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"<input type='hidden' id='DEVICE_NAME"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CD_DEVICE_NAME+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 92px;text-align: left;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].NAME+"'>"+(data.ajaxPage.dataList[i].NAME==null?"":data.ajaxPage.dataList[i].NAME)+"<input type='hidden' id='CHARGE_MAN"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].NAME+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 60px;text-align: left;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].DSTATUS+"'>"+(data.ajaxPage.dataList[i].DSTATUS==null?"":data.ajaxPage.dataList[i].DSTATUS)+"<input type='hidden' id='STATUS"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].DSTATUS+"' /></td>");
$("#roleTbody tr:last").append("<td style='width: 217px;text-align: left;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].SUPPLIER_NAME+"'>"+(data.ajaxPage.dataList[i].SUPPLIER_NAME==null?"":data.ajaxPage.dataList[i].SUPPLIER_NAME)+"<input type='hidden' id='SUPPLIER_ID"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].SUPPLIER_NAME+"' /></td>");

					}
					//init();
				pageFun(data.ajaxPage,"formId6");
					var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
				       _tongLineColor(tableTrJs);
				       clickTr('datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234');
				       	defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
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
	var gzzx = $("#paraMap1_CA_ID").val();
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
					       
$("#orderTbody").append("<tr style='cursor: pointer;' id='order"+i+"' ></tr>");
$("#orderTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 30px;text-align: center;'><input type='checkbox' id='"+data.ajaxPage.dataList[i].TCS_CODE+"' name='"+data.ajaxPage.dataList[i].TCS_CODE+"' class='isSubmit _selectdata' /></td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 240px;text-align: left;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_CODE+"<input type='hidden' id='TCS_CODE"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_CODE+"' /></td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='width: 240px;text-align: left;text-overflow:ellipsis;'>"+data.ajaxPage.dataList[i].TCS_NAME+"<input type='hidden' id='TCS_NAME"+data.ajaxPage.dataList[i].TCS_CODE+"' value='"+data.ajaxPage.dataList[i].TCS_NAME+"' /></td>");
$("#orderTbody tr:last").append("<td class='datagrid-cell' style='text-align: left;text-overflow:ellipsis;'>"+(data.ajaxPage.dataList[i].TCS_REMARK==null?"":data.ajaxPage.dataList[i].TCS_REMARK)+"</td>");
					}
					//init();
					pageFun(data.ajaxPage,"formId4");var tableTrJs = $("#orderTbody tr");_tongLineColor(tableTrJs);clickTr('orderTbody');
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
			    data:{
			        "flag":"3",
			        "calName":calName,
			        "age.currentPage":_GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
			        "page.pageRecord": _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
			    },
			    //data: "calName="+calName+"&page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
				success: function(data){
				util.closeLoading();
						if(null == data.ajaxPage.dataList){
						
                                                $("#jobTbody").empty();
                                                pageFun(data.ajaxPage,"formId4");
						return ;}
						if(null != data.ajaxPage.dataList){
							
							$("#jobTbody").empty();
							
							for(var i = 0;i < data.ajaxPage.dataList.length; i++){
							
								$("#jobTbody").append("<tr style='cursor: pointer;' id='"+data.ajaxPage.dataList[i].ID+"'></tr>");
								$("#jobTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='radio' id='"+data.ajaxPage.dataList[i].ID+"' name='"+data.ajaxPage.dataList[i].CAL_NAME+"' /></td>");
								$("#jobTbody tr:last").append("<td style='width: 120px;text-align: left;'>"+data.ajaxPage.dataList[i].CAL_NAME+"<input type='hidden' id='remark_"+data.ajaxPage.dataList[i].ID+"' value='"+data.ajaxPage.dataList[i].CAL_NAME+"'/></td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: right;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_START_MONTH+"'>"+data.ajaxPage.dataList[i].CAL_START_MONTH+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: right;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].CAL_END_MONTH+"'>"+data.ajaxPage.dataList[i].CAL_END_MONTH+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: center;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].SSAT_FLAG+"'>"+data.ajaxPage.dataList[i].SSAT_FLAG+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: center;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].SSUN_FLAG+"'>"+data.ajaxPage.dataList[i].SSUN_FLAG+"</td>");
								$("#jobTbody tr:last").append("<td style='width: 110px;text-align: center;text-overflow:ellipsis;'title='"+data.ajaxPage.dataList[i].MR_FLAG+"'>"+data.ajaxPage.dataList[i].MR_FLAG+"</td>");
							}
							//init();
							pageFun(data.ajaxPage,"formId4");
							var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a0000 tbody tr");
							_tongLineColor(tableTrJs);
							clickTrjob('jobTbody');
							defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a0000");
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
var trLength=$("#addRoleList tr").length;
	 function addRoleList(showId,backId){
	 	$(".firstTableBack").show();
	 	    
			 $("#roleTbody :checkbox").each(function(){
			 
					if($(this).attr("checked")){
						if (!$("#trr"+$(this).attr("id")).length) {
						  
                            var tableWork1 = document.getElementById("datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a5678");
					        var count1= tableWork1.rows.length;
					        
					        if(count1>0){
					            var	 num=1;
					            var attList = document.getElementsByName("DEVICE_CLASS");
								    for(var i=0;i<attList.length;i++){
								        if (($("#DEVICE_CLASS"+$(this).attr("id")).val()) == attList[i].value ) {
                                        	num++;
                                        }
									
								    }
								    
							$("#addRoleList").append("<tr id='trr"+$(this).attr("id")+"' name='trname' onclick=\"getTrRoleId('"+$(this).attr("id")+"')\"><input  type='hidden' name='deviceName' value='"+$(this).attr("id")+"'/><input id='iptseq"+$(this).attr("id")+"' type='hidden'  value='"+num+"' /></tr>");
							$("#addRoleList tr:last").append("<td id='tdseq"+$(this).attr("id")+"' style='width: 30px;text-align: center;'>"+(total+1)+"</td>");
							$("#addRoleList tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
							$("#addRoleList tr:last").append("<td style='width: 300px;text-align: center;'>"+$("#DEVICE_SN"+$(this).attr("id")).val()+"</td>");
							$("#addRoleList tr:last").append("<td style='width: 200px;text-align: center;'>"+$("#DEVICE_NAME"+$(this).attr("id")).val()+"<input type='hidden' id='CLASS"+$(this).attr("id")+"' name='DEVICE_CLASS' value='"+$("#DEVICE_CLASS"+$(this).attr("id")).val()+"'/></td>");                                                                    
							$("#addRoleList tr:last").append("<td style='width: 199px;text-align: center;'><input type='text' name='deviceSeq' style='width: 179px;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit'  value='"+num+"'/></td>");
								
					        }else{
    					        $("#addRoleList").append("<tr id='trr"+$(this).attr("id")+"' name='trname' onclick=\"getTrRoleId('"+$(this).attr("id")+"')\"><input  type='hidden' name='deviceName' value='"+$(this).attr("id")+"'/><input id='iptseq"+$(this).attr("id")+"' type='hidden' value='"+(total+1)+"' /></tr>");
    							$("#addRoleList tr:last").append("<td id='tdseq"+$(this).attr("id")+"' style='width: 30px;text-align: center;'>"+(total+1)+"</td>");
    							$("#addRoleList tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
    							$("#addRoleList tr:last").append("<td style='width: 300px;text-align: center;'>"+$("#DEVICE_SN"+$(this).attr("id")).val()+"</td>");
    							$("#addRoleList tr:last").append("<td style='width: 200px;text-align: center;'>"+$("#DEVICE_NAME"+$(this).attr("id")).val()+"<input type='hidden' id='CLASS"+$(this).attr("id")+"' name='DEVICE_CLASS' value='"+$("#DEVICE_CLASS"+$(this).attr("id")).val()+"'/></td>");                                                                    
    							$("#addRoleList tr:last").append("<td style='width: 199px;text-align: center;'><input type='text' name='deviceSeq' style='width: 179px;text-align: right;' maxlength='9' class='_VAL_NULL input isSubmit'  value='"+(count1+1)+"'/></td>");
    							
    							
					            
					        }
					        
								total+=1;
							
							
						
							
						}
					}
				});
                defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a5678");
				//init();
				
				
			
			$("#roleTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#role_list_cb").attr("checked",false);
			$(' .chosen-container').css("width","230px");
		} 
	
		
		//设备信息关联删除
		function delRoleRow(){
		
			$("#addRoleList :checkbox").each(function(){
				if($(this).attr("checked")){
					var trid = $(this).parent().parent().attr("id");
					$("#i"+trid).remove();
					$("#"+trid).remove();
				        total--;
				}
			});
			order();
		
		}
		
		
		function order(){
                var i=0;
                $("#addRoleList tr").each(function(){
                var tdid = "";
                var iptid = "";
                var id = $(this).attr("id");
                tdid = id.replace("trr","tdseq");
                iptid = id.replace("trr","iptseq");             
                $("#"+tdid).text(i+1);
                $("#"+iptid).val(i+1);
                i++;
                });
                 }
    function reSort(objid){
         
         var i = 1;
         $("#"+objid+" tr").each(function(){
         
         $(this).find("td").eq(0).text(i);
         
         i++;
      });
     }
		
	
//负责人关联信息表
  /*         var calId="";
	 function addJobList(showId,backId){
			 $("#jobTbody :radio").each(function(){
					if($(this).attr("checked")){
					        calId=$(this).attr("id");
						 	getWorktimeList(calId);
					}
				});

				//init();
			var len = $("#addJobList tr").length;
			//alert(len);
			for(var i=0;i<len;i++){			        
				$("#addJobList tr:eq("+i+") td:first").text(i+1);
				//alert("+");
			} 
			
			$("#jobTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#job_list_cb").attr("checked",false);
			
		} 
		*/
		  var calId="";
		function addJobList(showId,backId){
			 $("#jobTbody :radio").each(function(){
					if($(this).attr("checked")){
					        calId=$(this).attr("id");
					        console.log("calId::"+calId);
						 	getWorktimeList(calId);
					}
				});

				//init();
			var len = $("#addJobList tr").length;
			//alert(len);
			for(var i=0;i<len;i++){			        
				$("#addJobList tr:eq("+i+") td:first").text(i+1);
				//alert("+");
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
		reSort("charge");
		}
		//指令集相关信息新增
		 var total=0;
 function addOrderList(showId,backId){
                var len = $("#order tr").length;   
	 	var gzzx = $("#paraMap1_CA_ID").val();
			 $("#orderTbody :checkbox").each(function(index,item){
			               
					if($(this).attr("checked")){
					      
						if (!$("#trr"+$(this).attr("id")).length) {
						     
							
							
							
							$("#order").append("<tr id='trr"+$(this).attr("id")+"' name='trname'><input  type='hidden' name='orderCode' value='"+$(this).attr("id")+"'/><input  type='hidden' name='orderName' value='"+$("#TCS_NAME"+$(this).attr("id")).val()+"'/><input  type='hidden' name='gzzxCode' value='"+gzzx+"'/><input  type='hidden' name='orderSeq' value='"+total+"' /></tr>");
							$("#order tr:last").append("<td style='width: 30px;text-align: center;'>" + (len + 1) + "</td>");
							$("#order tr:last").append("<td style='width: 30px;text-align: center;'><input  type='checkbox' /></td>");
							$("#order tr:last").append("<td style='width: 224px;text-align: center;'>"+gzzx+"</td>");
							$("#order tr:last").append("<td style='width: 224px;text-align: center;'>"+$("#TCS_CODE"+$(this).attr("id")).val()+"</td>");
							$("#order tr:last").append("<td style='text-align: center;'>"+$("#TCS_NAME"+$(this).attr("id")).val()+"</td>");
								total++;len++;
						}
					}
				});

				//init();
			
			
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
		reSort("order");
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
		 var type = $("#add_type").val();
                 showOption(type);
                 showSelect(type);
                 showTag(type);
                 showCheckBox(type);
		 var check=document.getElementById("paraMap1_CA_STATUS_1");
	         check.checked=true;
	        
	}//初始化方法
	  

	function showOption(type){
	        if(type=="1" || type=="2"){
	        $("#paraMap1_CA_TYPE option[value='0']").remove();
	        $("#paraMap1_CA_TYPE option[value='1']").remove();
	        $("#paraMap1_CA_TYPE").trigger("chosen:updated");
	        }else if(type=="3"){
	        $("#paraMap1_CA_TYPE option[value='1']").remove();
	        $("#paraMap1_CA_TYPE option[value='2']").remove();
	        $("#paraMap1_CA_TYPE").trigger("chosen:updated");
	}
	}

	function showSelect(type){
	        if(type=="1"){
	        $("#paraMap1_CA_EMP_ROLE").css("display","none");
	        $("#paraMap1_CA_GROUP").css("display","none");
	        $("#paraMap1_CA_EMP_ROLE_chosen").css("display","block");
	        $("#paraMap1_CA_GROUP_chosen").css("display","block");
	        $("#paraMap1_CA_EMP_ROLE").removeAttr("disabled");
	        $("#paraMap1_CA_GROUP").removeAttr("disabled");
	}else{
	        $("#paraMap1_CA_EMP_ROLE").css("display","block");
	        $("#paraMap1_CA_GROUP").css("display","block");
	        $("#paraMap1_CA_EMP_ROLE").attr("disabled","disabled");
	        $("#paraMap1_CA_GROUP").attr("disabled","disabled");
	        $("#paraMap1_CA_EMP_ROLE_chosen").css("display","none");
	        $("#paraMap1_CA_GROUP_chosen").css("display","none");
	}

	}
	function showTag(type){
	        if(type=="1"){
	        $("#thirdTable").css("display","block");
	        switchTag('tag3','content3','');this.blur();
	        $('#tag2').css('display','none');
	        $('#tag3').css('display','block');	        
	}else{
	        $("#thirdTable").css("display","none");
	        switchTag('tag1','content1','');this.blur();
	        $('#tag2').css('display','block');
	        $('#tag3').css('display','none');	        
	}

	}
	function showCheckBox(type){
	        if(type=="1"){
	        $("#paraMap1_CA_FEEDER_FLAG_1").attr("disabled",false);
	}else{
	        $("#paraMap1_CA_FEEDER_FLAG_1").attr("disabled",true);
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
	    //
       function isCloseWincheck(){
	        if($('#isCloseWin').attr('checked')){
	           $('#isCloseWin').val("0"); 
	        }else{
	           $('#isCloseWin').val("1");  
	        }
	        }
	        
	      function clickTrs(tableId){
		
		    
		
			$("#"+tableId+" tr").unbind("click");
			$("#"+tableId+" tr input[type=radio]").unbind("click");
			$("#"+tableId+" tr").on("dblclick",function(){
		    	var trId = $(this).attr("id");
		        	
		        var  name = $("#LOGIN_NAME"+trId).val();
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
				//	document.getElementById(objectId).value=name;

				init();
			
			$(' .chosen-container').css("width","230px");
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#user_list_cb").attr("checked",false);
				switchTag('tag2','content2','');
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
				
				//init();
			var len = $("#addJobList tr").length;
			//alert(len);
			for(var i=0;i<len;i++){			        
				$("#addJobList tr:eq("+i+") td:first").text(i+1);
				//alert("+");
			} 
			
			$("#jobTbody").empty();
			document.getElementById(showId).style.display = 'none';
			document.getElementById(backId).style.display = 'none';
			$("#job_list_cb").attr("checked",false);
			
		}
		$('#paraMap1_CA_ID').bind('keyup', function () {
	            var calwStart=$("#paraMap1_CA_ID");
	         
             if(  /[\u4E00-\u9FA5]/i.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CA_ID'),"<dict:lang value="不能输入中文" />");
             }
             if(/['"“’]/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_CA_ID'),"<dict:lang value="不能输入双引号,单引号" />");
             } 
         });
		function saveNew(thisObj){
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
               var caId= $("paraMap1_CA_ID").val();
              
           //     var taid = caId.replace("""" ,"_");
              // $("paraMap1_CA_ID").val(taid);
               //  alert(caId);
      //document.forms.addForm.action = "@{funcUrl}&<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />";
      document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=5dbd880596be4e3b83e4fadf6b1d20b7";
      document.forms.addForm.submit();
           //$("#addRoleList").empty();
           //this.blur();

       
}          
		
</script>

    <script>
	    (function($){
            $(window).on('load',function(){
            //setPopScroll('.scroll');
            setPopScroll('.scroll1','.head1');
             setPopScroll('.scroll2','.head2');
             setPopScroll('.scroll3','.head3');
             setPopScroll('.scroll4','.head4');
             setPopScroll('.scroll5','.head5');
    	  })
        })(jQuery)
     </script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
<bu:submit viewId="6c560c65516948149581dc95b13bae38" />
<bu:script viewId="6c560c65516948149581dc95b13bae38" />
</body>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>