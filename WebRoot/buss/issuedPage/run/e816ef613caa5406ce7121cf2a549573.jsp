<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="用户配置" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="84fa309283694fe58ad09a6735d257a5"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="bd" style="height:calc(100%  - 10px);">
                <div class="search-box">
                   
               </div>
               <form id="listForm" name="listForm" action="" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
					<div class="js-tab">
					<DIV id="container" style="padding:0 2px;box-sizing: border-box;">
						<DIV class="hd">
							<UL class="tab-list tab">
								
								<LI id="tag1"><A class=""
									onclick="switchTag('tag1','content1','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="首页" /></SPAN> </A>
								</LI>
								<LI id="tag2"><A class=""
									onclick="switchTag('tag2','content2','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="产量" /></SPAN> </A>
								</LI>
								<LI id="tag3"><A class=""
									onclick="switchTag('tag3','content3','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="品质" /></SPAN> </A>
								</LI>
								<LI id="tag4"><A class=""
									onclick="switchTag('tag4','content4','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="仓储" /></SPAN> </A>
								</LI>
                                <LI id="tag5"><A class=""
									onclick="switchTag('tag5','content5','');this.blur();"
									href="javascript:void(0);"> <SPAN><dict:lang value="预警" /></SPAN> </A>
								</LI>
							</UL>
						</DIV>
					<DIV class="content1" id="content" style="margin-top: 25px;">
					<DIV id="content1" style="margin-top:4px;" data-tab="tag1">
						<div class="optn" style="top:69px;">
						<table class="func_table">
						    <tbody>
						      <tr>
						      <td width="100%" align="right">
								<button type="button" value="" onclick="popTextInfoDiv('addTextInfo','backTextInfo','1')" sytle="" class="botton_img_add"><i class="ico ico-kl "></i>新增</button>
								<button type="button" value="" onclick="saveMoudle('1')" sytle="" class="botton_img_add"><i class="ico ico-save "></i>提交</button>
								<button type="button" value="" onclick="delMoudle('1')" sytle="" class="botton_img_add"><i class="ico ico-sc "></i>删除</button>
								<button type="button" class="botton_img_add" onclick="queryTextInfo('1')"><i class="ico ico-search-new"></i>查询</button>
							  </td>
						      </tr>
						  	</tbody>
						</table>
						</div>
						<table class="search_table">
							<tbody>
								<tr>
									<td>      
									<div class="group">
										<div class="name" ><dict:lang value="功能名称" /></div>
										<div class="dec">				
											<input type="text" class="input" id="moudleName1" name="moudleName1" value="" >
										</div>			
									</div>
									</td>
									<td>      
									<div class="group">
										<div class="name" ><dict:lang value="功能细项" /></div>
										<div class="dec">				
											<input type="text" class="input" id="moudleMore1" name="moudleMore1" value="" >
										</div>			
									</div>
									</td>
								</tr>
							</tbody>
						</table>
							<div class="panel datagrid datagrid-div1">
	    					  <div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view" style="overflow: hidden">
	    						<div class="datagrid-header" style="width:100%;">
	    							<div class="datagrid-header-inner head1" style="width:100%;" >
	    								<table  class="datagrid-htable fixedTable  " id="datagrid-htable" style="width:100%;">
	    									<tbody>
	    									<tr class="datagrid-header-row datagrid-title-ajax">
	    										<td class="datagrid-cell" style="width:30px;"></td>
	    										<td class="datagrid-cell" style="width:30px;">
	    										<input type="checkbox" id="allSelects1" name="allSelect" onchange="getAllItems1();" />
	    										</td>
	    										<td class="datagrid-cell" style="width:200px;" ><dict:lang value="导航菜单" /></td >
	    										<td class="datagrid-cell" style="width:200px;" ><dict:lang value="功能名称" /></td >
	    										<td class="datagrid-cell" style="width:200px;" ><dict:lang value="功能细项" /></td >
	    										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="显示类型" /></td >
	    										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="图片" /></td >
	    										<td class="datagrid-cell" style="" ><dict:lang value="顺序" /></td >
	    									</tr>
	    									</tbody>		
	    								</table>
	    							</div>
	    						</div>
	    						<div class="datagrid-body datagrid-div3 scroll1"   style="height:450px;width:100%">
	    							<table class="dlist-table table-line" style="width:100%;table-layout:fixed;"  id="homeInfo" >
	    								<tbody id="addHomeInfo" >
	    								</tbody>
	    							</table>
	    						</div>
	    					</div>
	    				</div>
					</DIV>
        			<DIV id="content2" style="display:none" data-tab="tag2">
        				<div class="optn" style="top:69px;">
						<table class="func_table">
						    <tbody>
						      <tr>
						      <td width="100%" align="right">
								<button type="button" value="" onclick="popOutDiv('addOutInfo','backOutInfo','2')" sytle="" class="botton_img_add"><i class="ico ico-kl "></i>新增</button>
								<button type="button" value="" onclick="saveMoudle('2')" sytle="" class="botton_img_add"><i class="ico ico-save "></i>提交</button>
								<button type="button" value="" onclick="delMoudle('2')" sytle="" class="botton_img_add"><i class="ico ico-sc "></i>删除</button>
								<button type="button" class="botton_img_add" onclick="queryOutInfo('2')"><i class="ico ico-search-new"></i>查询</button>
							  </td>
						      </tr>
						  	</tbody>
						</table>
						</div>
						<table class="search_table">
							<tbody>
								<tr>
									<td>      
									<div class="group">
										<div class="name" ><dict:lang value="功能名称" /></div>
										<div class="dec">				
											<input type="text" class="input" id="moudleName2" name="moudleName2" value="" >
										</div>			
									</div>
									</td>
									
								</tr>
							</tbody>
						</table>
        				<div class="panel datagrid datagrid-div1">
	    					  <div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view" style="overflow: hidden">
	    						<div class="datagrid-header" style="width:100%;">
	    							<div class="datagrid-header-inner head2" style="width:100%;" >
	    								<table  class="datagrid-htable fixedTable  " id="datagrid-htable" style="width:100%;">
	    									<tbody>
	    									<tr class="datagrid-header-row datagrid-title-ajax">
	    										<td class="datagrid-cell" style="width:30px;"></td>
	    										<td class="datagrid-cell" style="width:30px;">
	    										<input type="checkbox" id="allSelects2" name="allSelect" onchange="getAllItems2();" />
	    										</td>
	    										<td class="datagrid-cell" ><dict:lang value="导航菜单" /></td >
	    										<td class="datagrid-cell" ><dict:lang value="功能名称" /></td >
	    										<td class="datagrid-cell" ><dict:lang value="显示类型" /></td >
	    										<td class="datagrid-cell" ><dict:lang value="顺序" /></td >
	    									</tr>
	    									</tbody>		
	    								</table>
	    							</div>
	    						</div>
	    						<div class="datagrid-body datagrid-div3 scroll2"   style="height:450px;width:100%">
	    							<table class="dlist-table table-line" style="width:100%;table-layout:fixed;"  id="outPutInfo" >
	    								<tbody id="addOutPutInfo" >
	    								</tbody>
	    							</table>
	    						</div>
	    					</div>
	    				</div>
        			</DIV>
					<DIV id="content3" style="display:none" data-tab="tag3">
						<div class="optn" style="top:69px;">
						<table class="func_table">
						    <tbody>
						      <tr>
						      <td width="100%" align="right">
								<button type="button" value="" onclick="popOutDiv('addOutInfo','backOutInfo','3')" sytle="" class="botton_img_add"><i class="ico ico-kl "></i>新增</button>
								<button type="button" value="" onclick="saveMoudle('3')" sytle="" class="botton_img_add"><i class="ico ico-save "></i>提交</button>
								<button type="button" value="" onclick="delMoudle('3')" sytle="" class="botton_img_add"><i class="ico ico-sc "></i>删除</button>
								<button type="button" class="botton_img_add" onclick="queryOutInfo('3')"><i class="ico ico-search-new"></i>查询</button>
							  </td>
						      </tr>
						  	</tbody>
						</table>
						</div>
						<table class="search_table">
							<tbody>
								<tr>
									<td>      
									<div class="group">
										<div class="name" ><dict:lang value="功能名称" /></div>
										<div class="dec">				
											<input type="text" class="input" id="moudleName3" name="moudleName3" value="" >
										</div>			
									</div>
									</td>
									
								</tr>
							</tbody>
						</table>
        				<div class="panel datagrid datagrid-div1">
	    					  <div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view" style="overflow: hidden">
	    						<div class="datagrid-header" style="width:100%;">
	    							<div class="datagrid-header-inner head3" style="width:100%;" >
	    								<table  class="datagrid-htable fixedTable  " id="datagrid-htable" style="width:100%;">
	    									<tbody>
	    									<tr class="datagrid-header-row datagrid-title-ajax">
	    										<td class="datagrid-cell" style="width:30px;"></td>
	    										<td class="datagrid-cell" style="width:30px;">
	    										<input type="checkbox" id="allSelects3" name="allSelect" onchange="getAllItems3();" />
	    										</td>
	    										<td class="datagrid-cell" ><dict:lang value="导航菜单" /></td >
	    										<td class="datagrid-cell" ><dict:lang value="功能名称" /></td >
	    										<td class="datagrid-cell" ><dict:lang value="显示类型" /></td >
	    										<td class="datagrid-cell" ><dict:lang value="顺序" /></td >
	    									</tr>
	    									</tbody>		
	    								</table>
	    							</div>
	    						</div>
	    						<div class="datagrid-body datagrid-div3 scroll3"   style="height:450px;width:100%">
	    							<table class="dlist-table table-line" style="width:100%;table-layout:fixed;"  id="qualityInfo" >
	    								<tbody id="addQualityInfo" >
	    								</tbody>
	    							</table>
	    						</div>
	    					</div>
	    				</div>
					</DIV>
					<DIV id="content4" style="display:none" data-tab="tag4">
						<div class="optn" style="top:69px;">
						<table class="func_table">
						    <tbody>
						      <tr>
						      <td width="100%" align="right">
								<button type="button" value="" onclick="popTextInfoDiv('addTextInfo','backTextInfo','4')" sytle="" class="botton_img_add"><i class="ico ico-kl "></i>新增</button>
								<button type="button" value="" onclick="saveMoudle('4')" sytle="" class="botton_img_add"><i class="ico ico-save "></i>提交</button>
								<button type="button" value="" onclick="delMoudle('4')" sytle="" class="botton_img_add"><i class="ico ico-sc "></i>删除</button>
								<button type="button" class="botton_img_add" onclick="queryTextInfo('4')"><i class="ico ico-search-new"></i>查询</button>
							  </td>
						      </tr>
						  	</tbody>
						</table>
						</div>
						<table class="search_table">
							<tbody>
								<tr>
									<td>      
									<div class="group">
										<div class="name" ><dict:lang value="功能名称" /></div>
										<div class="dec">				
											<input type="text" class="input" id="moudleName4" name="moudleName4" value="" >
										</div>			
									</div>
									</td>
									<td>      
									<div class="group">
										<div class="name" ><dict:lang value="功能细项" /></div>
										<div class="dec">				
											<input type="text" class="input" id="moudleMore4" name="moudleMore4" value="" >
										</div>			
									</div>
									</td>
								</tr>
							</tbody>
						</table>
							<div class="panel datagrid datagrid-div1">
	    					  <div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view" style="overflow: hidden">
	    						<div class="datagrid-header" style="width:100%;">
	    							<div class="datagrid-header-inner head4" style="width:100%;" >
	    								<table  class="datagrid-htable fixedTable  " id="datagrid-htable" style="width:100%;">
	    									<tbody>
	    									<tr class="datagrid-header-row datagrid-title-ajax">
	    										<td class="datagrid-cell" style="width:30px;"></td>
	    										<td class="datagrid-cell" style="width:30px;">
	    										<input type="checkbox" id="allSelects4" name="allSelect" onchange="getAllItems1();" />
	    										</td>
	    										<td class="datagrid-cell" style="width:200px;" ><dict:lang value="导航菜单" /></td >
	    										<td class="datagrid-cell" style="width:200px;" ><dict:lang value="功能名称" /></td >
	    										<td class="datagrid-cell" style="width:200px;" ><dict:lang value="功能细项" /></td >
	    										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="显示类型" /></td >
	    										<td class="datagrid-cell" style="width:120px;" ><dict:lang value="图片" /></td >
	    										<td class="datagrid-cell" style="" ><dict:lang value="顺序" /></td >
	    									</tr>
	    									</tbody>		
	    								</table>
	    							</div>
	    						</div>
	    						<div class="datagrid-body datagrid-div3 scroll4"   style="height:450px;width:100%">
	    							<table class="dlist-table table-line" style="width:100%;table-layout:fixed;"  id="stockInfo" >
	    								<tbody id="addStockInfo" >
	    								</tbody>
	    							</table>
	    						</div>
	    					</div>
	    				</div>
					</DIV>			
                    <DIV id="content5" style="display:none" data-tab="tag5">
                    	<div class="optn" style="top:69px;">
						<table class="func_table">
						    <tbody>
						      <tr>
						      <td width="100%" align="right">
								<button type="button" value="" onclick="popOutDiv('addOutInfo','backOutInfo','5')" sytle="" class="botton_img_add"><i class="ico ico-kl "></i>新增</button>
								<button type="button" value="" onclick="saveMoudle('5')" sytle="" class="botton_img_add"><i class="ico ico-save "></i>提交</button>
								<button type="button" value="" onclick="delMoudle('5')" sytle="" class="botton_img_add"><i class="ico ico-sc "></i>删除</button>
								<button type="button" class="botton_img_add" onclick="queryOutInfo('5')"><i class="ico ico-search-new"></i>查询</button>
							  </td>
						      </tr>
						  	</tbody>
						</table>
						</div>
						<table class="search_table">
							<tbody>
								<tr>
									<td>      
									<div class="group">
										<div class="name" ><dict:lang value="功能名称" /></div>
										<div class="dec">				
											<input type="text" class="input" id="moudleName5" name="moudleName5" value="" >
										</div>			
									</div>
									</td>
									
								</tr>
							</tbody>
						</table>
        				<div class="panel datagrid datagrid-div1">
	    					  <div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view" style="overflow: hidden">
	    						<div class="datagrid-header" style="width:100%;">
	    							<div class="datagrid-header-inner head5" style="width:100%;" >
	    								<table  class="datagrid-htable fixedTable  " id="datagrid-htable" style="width:100%;">
	    									<tbody>
	    									<tr class="datagrid-header-row datagrid-title-ajax">
	    										<td class="datagrid-cell" style="width:30px;"></td>
	    										<td class="datagrid-cell" style="width:30px;">
	    										<input type="checkbox" id="allSelects5" name="allSelect" onchange="getAllItems5();" />
	    										</td>
	    										<td class="datagrid-cell" ><dict:lang value="导航菜单" /></td >
	    										<td class="datagrid-cell" ><dict:lang value="功能名称" /></td >
	    										<td class="datagrid-cell" ><dict:lang value="显示类型" /></td >
	    										<td class="datagrid-cell" ><dict:lang value="顺序" /></td >
	    									</tr>
	    									</tbody>		
	    								</table>
	    							</div>
	    						</div>
	    						<div class="datagrid-body datagrid-div3 scroll5"   style="height:450px;width:100%">
	    							<table class="dlist-table table-line" style="width:100%;table-layout:fixed;"  id="warnInfo" >
	    								<tbody id="addWarnInfo" >
	    								</tbody>
	    							</table>
	    						</div>
	    					</div>
	    				</div>
					</DIV>
					</DIV>
				</DIV>
				</div>
				<!-- 首页和仓储弹出窗 -->
				<div id="backTextInfo" class="dialog-mask" style="z-index:1029px;"/></div>
				<div class="dialog dialog-s1" id="addTextInfo" style="display:none;z-index:1030;margin-left:190px;left:16px;top:20px;width:900px;height:560px;">
					<div class="dialog-hd">
					<h3 class="tit">
					<dict:lang value="新增功能模块" />
					</h3>
					</div>
						<a class="dialog-close" href="javascript:void(0);" onclick="hideTextDiv('addTextInfo','backTextInfo');"></a>
						<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
							<div class="optn optn_div">	
							    <button type="button" onclick="addTextList('addTextInfo','backTextInfo');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
								<button type="button" onclick="hideTextDiv('addTextInfo','backTextInfo');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
								<button type="button" onclick="getTextInfo();"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
						    </div>
						      
						<table class="basic-table">
							 <tr>
						    	<td class="name" style="text-align:right;width:100px;"/><dict:lang value="功能模块"/></td>
								<td class="dec"><input type="text" id="moudleId" name="moudleId" class=" input isSubmit isaddSubmit"/></td>
						     </tr>
					    </table>
					    	<div style="width:900px;height:30px;">  
					    	<table  width="900px" class="dlist-table table-line " >
								<thead>
								<tr>
					    			<th style="width: 30px;text-align: center;"></th>
									<th style="width: 30px;text-align: center;"><input type="checkbox" id="po_list_cb"  onchange="getAllPo();" /></th>
									<th style="width: 140px;text-align: center;"><dict:lang value="导航菜单" /></th>
									<th style="width: 140px;text-align: center;"><dict:lang value="功能模块" /></th>
									<th style="width: 60px;text-align: center;"><dict:lang value="显示类型" /></th>
									<th style="width: 140px;text-align: center;"><dict:lang value="功能细项" /></th>
									<th style="width: 90px;text-align: center;"><dict:lang value="图片" /></th>
									<th style="width: 90px;text-align: center;"><dict:lang value="默认显示" /></th>
									<th style="width: 90px;text-align: center;"><dict:lang value="显示顺序" /></th>
									<th style="text-align: center;"><dict:lang value="是否启用" /></th>
								</tr>
					    	</thead>
					    	</table>
					    	</div>
					    	<div class="scroll" style="width:900px;height:calc(100% - 171px);overflow-y: auto;overflow-x: hidden;" >  
					    	<table style="table-layout:fixed;width:100%;" class="dlist-table table-line " id="textTable">
						    	<tbody id="textTbody">
					            </tbody>
							</table>
							</div>					
						</div>
			        </div>
			        <!-- 首页和仓储弹出窗 -->
			     <!-- 其他三个tab页弹出窗 -->
				<div id="backOutInfo" class="dialog-mask" style="z-index:1029px;"/></div>
				<div class="dialog dialog-s1" id="addOutInfo" style="display:none;z-index:1030;margin-left:190px;left:16px;top:20px;width:900px;height:560px;">
					<div class="dialog-hd">
					<h3 class="tit">
					<dict:lang value="新增功能模块" />
					</h3>
					</div>
						<a class="dialog-close" href="javascript:void(0);" onclick="hideOutDiv('addOutInfo','backOutInfo');"></a>
						<div class="dialog-bd-div" style="width:100%;height:calc(100% - 37px);">
							<div class="optn optn_div">	
							    <button type="button" onclick="addOutList('addOutInfo','backOutInfo');"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
								<button type="button" onclick="hideOutDiv('addOutInfo','backOutInfo');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
								<button type="button" onclick="getOutInfo();"><i class="ico ico-search-new"></i><dict:lang value="查询"/></button>
						    </div>
						      
						<table class="basic-table">
							 <tr>
						    	<td class="name" style="text-align:right;width:100px;"/><dict:lang value="功能模块"/></td>
								<td class="dec"><input type="text" id="moudleId1" name="moudleId1" class=" input isSubmit isaddSubmit"/></td>
						     </tr>
					    </table>
					    	<div style="width:900px;height:30px;">  
					    	<table  width="900px" class="dlist-table table-line " >
								<thead>
								<tr>
					    			<th style="width: 30px;text-align: center;"></th>
									<th style="width: 30px;text-align: center;"><input type="checkbox" id="po_list_cb1"  onchange="getAllPo1();" /></th>
									<th style="width: 140px;text-align: center;"><dict:lang value="导航菜单" /></th>
									<th style="width: 140px;text-align: center;"><dict:lang value="功能模块" /></th>
									<th style="width: 90px;text-align: center;"><dict:lang value="显示类型" /></th>
									<th style="width: 90px;text-align: center;"><dict:lang value="默认显示" /></th>
									<th style="width: 90px;text-align: center;"><dict:lang value="显示顺序" /></th>
									<th style="text-align: center;"><dict:lang value="是否启用" /></th>
								</tr>
					    	</thead>
					    	</table>
					    	</div>
					    	<div class="scroll1" style="width:900px;height:calc(100% - 171px);overflow-y: auto;overflow-x: hidden;" >  
					    	<table style="table-layout:fixed;width:100%;" class="dlist-table table-line " id="outTable">
						    	<tbody id="outTbody">
					            </tbody>
							</table>
							</div>					
						</div>
			        </div>
			        <!-- 其他三个tab页弹出窗 -->
               </form>
            </div>
        </div>
    </div>
    	<form id="submit_Form" name="submitForm" action="" target="submitFrame" method="post">
                <table id="submitTable" style="display: none;" >
        		</table>
        </form>
		<bu:submit viewId="000664c6d0f14ec9bc0da78526c1cb8e" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="000664c6d0f14ec9bc0da78526c1cb8e" />
    
    
<script>
var loaded = 1;
	var tab_len = 5;

	var currentTag;
	var tabs = "";
	function switchTag(tag, content, url) {
		if (currentTag == tag) {
			return false;
		}
		document.getElementById("content2").style.display="";
		document.getElementById("content3").style.display="";
		document.getElementById("content4").style.display="";
		document.getElementById("content5").style.display="";
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
	$(function(){
	        $("#tag1").addClass("current");
	        queryTextInfo("1");
	        queryTextInfo("4");
	        queryOutInfo("2");
	        queryOutInfo("3");
	        queryOutInfo("5");
	});
function alertInfo(msg){
	utilsFp.confirmIcon(3,"","","", msg,0,"300","");
}
function reloadPg(msg,title,width,height,time){
    msgPop(msg,"",title,width,height,time);
    if($("#tag1").attr("class")=="current"){
    	queryTextInfo("1");
    }else if($("#tag2").attr("class")=="current"){
    	queryOutInfo("2");
    }else if($("#tag3").attr("class")=="current"){
    	queryOutInfo("3");
    }else if($("#tag4").attr("class")=="current"){
    	queryTextInfo("4");
    }else if($("#tag5").attr("class")=="current"){
    	queryOutInfo("5");
    }
}
var textType;//首页  1/仓储   4  
function popTextInfoDiv(showId,backId,type){ //首页  1
	textType = type;
	$("#moudleId").val("");
	$("#"+showId+",#"+backId).show();
	$("#"+showId).draggable();
	getTextInfo();
}
function hideTextDiv(showId,backId){
    $("#"+showId+",#"+backId).hide();
    closeDivFp(showId+"pop");     			
}
var outType;//产量  2/品质   3 /预警 5 
function popOutDiv(showId,backId,type){ //产量  2
	outType = type;
	$("#moudleId1").val("");
	$("#"+showId+",#"+backId).show();
	$("#"+showId).draggable();
	getOutInfo();
}
function hideOutDiv(showId,backId){
    $("#"+showId+",#"+backId).hide();
    closeDivFp(showId+"pop");	
}
//首页/仓储   新增获取数据功能
function getTextInfo(){
	util.showLoading("处理中...");
		var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=4e73d53303754f80891710df97764ae1";
		var moudleId = $("#moudleId").val();//功能模块
		var tableId;
		if(textType=="1"){ //首页
			tableId = "addHomeInfo";
		}else{ //仓储
			tableId = "addStockInfo";
		}
	      $.ajax({
	           type:"post",
	           dataType:"json",
	           data: {
	           	  "moudleId" : moudleId,
	           	  "type" : textType,
	           	  "showList" : "all"
	           },
	           url:loadItemUrl,
	           success:function(data){		
                	util.closeLoading();
                	$("#textTbody").empty();
                	if(null==data){
                	    return;
                	}
                	if(null!=data.ajaxList){
                	   var rccList = eval(data.ajaxList);
                	   for(var i=0;i<rccList.length;i++){
                	       if(rccList[i].ID==null) rccList[i].ID="";
                	       $("#textTbody").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
						   $("#textTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#textTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
							$("#textTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:140px;text-align: center;' title='"+rccList[i].MENU_ID+"'>"+rccList[i].MENU_ID+"<input type='hidden' id='MENU_ID"+rccList[i].ID+"' value='"+rccList[i].MENU_ID+"'/><input type='hidden' id='MENU_ID_R"+rccList[i].ID+"' value='"+rccList[i].TAS_MENU_ID+"'/></td>");
							$("#textTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:140px;text-align: center;' title='"+rccList[i].MOUDLE_NAME+"'>"+rccList[i].MOUDLE_NAME+"<input type='hidden' id='MOUDLE_NAME"+rccList[i].ID+"' value='"+rccList[i].MOUDLE_NAME+"'/><input type='hidden' id='MOUDLE_NAME_R"+rccList[i].ID+"' value='"+rccList[i].TAS_MOUDLE_ID+"'/></td>");
							$("#textTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:60px;text-align: center;' title='"+rccList[i].SHOW_TYPE+"'>"+rccList[i].SHOW_TYPE+"<input type='hidden' id='SHOW_TYPE"+rccList[i].ID+"' value='"+rccList[i].SHOW_TYPE+"'/><input type='hidden' id='SHOW_TYPE_R"+rccList[i].ID+"' value='"+rccList[i].TAS_SHOW_TYPE+"'/></td>");
							$("#textTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:140px;text-align: center;' title='"+rccList[i].TAS_FUN_NAME+"'>"+rccList[i].TAS_FUN_NAME+"<input type='hidden' id='TAS_FUN_NAME"+rccList[i].ID+"' value='"+rccList[i].TAS_FUN_NAME+"'/></td>");
							$("#textTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;' title='"+rccList[i].TAS_FUN_NAME+"'>"+rccList[i].TAS_FUN_NAME+"<input type='hidden' id='TAS_FUN_NAME"+rccList[i].ID+"' value='"+rccList[i].TAS_FUN_NAME+"'/></td>");
							$("#textTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;' title='"+rccList[i].IS_DEFAULT+"'>"+rccList[i].IS_DEFAULT+"<input type='hidden' id='IS_DEFAULT"+rccList[i].ID+"' value='"+rccList[i].IS_DEFAULT+"'/><input type='hidden' id='IS_DEFAULT_R"+rccList[i].ID+"' value='"+rccList[i].TAS_IS_DEFAULT+"'/></td>");
							$("#textTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;' title='"+rccList[i].TAS_SEQ+"'>"+rccList[i].TAS_SEQ+"<input type='hidden' id='TAS_SEQ"+rccList[i].ID+"' value='"+rccList[i].TAS_SEQ+"'/></td>");
							$("#textTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: center;' title='"+rccList[i].IS_OPEN+"'>"+rccList[i].IS_OPEN+"<input type='hidden' id='IS_OPEN"+rccList[i].ID+"' value='"+rccList[i].IS_OPEN+"'/><input type='hidden' id='IS_OPEN_R"+rccList[i].ID+"' value='"+rccList[i].TAS_STATUS+"'/></td>");
                	   }
                	}
					var tableTrJs = $("#textTable tbody tr");
					_tongLineColor(tableTrJs);
					clickTr("textTable");
	           },
	           error:function(msg){
	                	util.closeLoading();
	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	           }
	});
}
//保存选择的数据  首页/仓储
function addTextList(showId,backId){
	var tableId;
	var tbodyId;
	var trId;
	if(textType=="1"){ //首页
		tableId = "homeInfo";
		tbodyId = "addHomeInfo";
		trId = "trr1";
	}else{ //仓储
		tableId = "stockInfo";
		tbodyId = "addStockInfo";
		trId = "trr4";
	}
	var len = $("#"+tbodyId+" tr").length;	
	$("#textTbody :checkbox").each(function(){
			if($(this).attr("checked")){
				if (!$("#"+trId+$(this).attr("id")).length) {
					$("#"+tableId+" tbody:last").append("<tr id='"+trId+$(this).attr("id")+"' ></tr>");
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"</td>");
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+$(this).attr("id")+"'/></td>");
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;'>"+$("#MOUDLE_NAME"+$(this).attr("id")).val()+"<input type='hidden'  name='MOUDLE_NAME' value='"+$("#MOUDLE_NAME_R"+$(this).attr("id")).val()+"'/></td>");
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: center;'>"+$("#TAS_FUN_NAME"+$(this).attr("id")).val()+"<input type='hidden'  name='TAS_FUN_NAME' value='"+$("#TAS_FUN_NAME"+$(this).attr("id")).val()+"'/></td>");
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+$("#SHOW_TYPE"+$(this).attr("id")).val()+"<input type='hidden'  name='SHOW_TYPE' value='"+$("#SHOW_TYPE_R"+$(this).attr("id")).val()+"'/></td>");
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+$("#SHOW_TYPE"+$(this).attr("id")).val()+"<input type='hidden'  name='SHOW_TYPE' value='"+$("#SHOW_TYPE_R"+$(this).attr("id")).val()+"'/></td>");
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: center;padding:0;'><input type='text' style='width: 100%;padding:0;text-align: left;' maxlength='10' class=' input isSubmit' name='TAS_SEQ' value='"+$("#TAS_SEQ"+$(this).attr("id")).val()+"'/></td>");
						len = len+1;
					var tableTrJs = $("#"+tableId+" tbody tr");
					_tongLineColor(tableTrJs);
					clickTr(tableId);		
				}
			}
	});
	hideTextDiv(showId,backId);
}
//产量  2/品质   3 /预警 5   新增获取数据功能
function getOutInfo(){
	util.showLoading("处理中...");
		var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=4e73d53303754f80891710df97764ae1";
		var moudleId = $("#moudleId1").val();//功能模块
	      $.ajax({
	           type:"post",
	           dataType:"json",
	           data: {
	           	  "moudleId" : moudleId,
	           	  "type" : outType,
	           	  "showList" : "all"
	           },
	           url:loadItemUrl,
	           success:function(data){		
                	util.closeLoading();
                	$("#outTbody").empty();
                	if(null==data){
                	    return;
                	}
                	if(null!=data.ajaxList){
                	   var rccList = eval(data.ajaxList);
                	   for(var i=0;i<rccList.length;i++){
                	       if(rccList[i].ID==null) rccList[i].ID="";
                	       $("#outTbody").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
						   $("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input id='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:140px;text-align: center;' title='"+rccList[i].MENU_ID+"'>"+rccList[i].MENU_ID+"<input type='hidden' id='MENU_ID"+rccList[i].ID+"' value='"+rccList[i].MENU_ID+"'/><input type='hidden' id='MENU_ID_R"+rccList[i].ID+"' value='"+rccList[i].TAS_MENU_ID+"'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:140px;text-align: center;' title='"+rccList[i].MOUDLE_NAME+"'>"+rccList[i].MOUDLE_NAME+"<input type='hidden' id='MOUDLE_NAME"+rccList[i].ID+"' value='"+rccList[i].MOUDLE_NAME+"'/><input type='hidden' id='MOUDLE_NAME_R"+rccList[i].ID+"' value='"+rccList[i].TAS_MOUDLE_ID+"'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:90px;text-align: center;' title='"+rccList[i].SHOW_TYPE+"'>"+rccList[i].SHOW_TYPE+"<input type='hidden' id='SHOW_TYPE"+rccList[i].ID+"' value='"+rccList[i].SHOW_TYPE+"'/><input type='hidden' id='SHOW_TYPE_R"+rccList[i].ID+"' value='"+rccList[i].TAS_SHOW_TYPE+"'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;' title='"+rccList[i].IS_DEFAULT+"'>"+rccList[i].IS_DEFAULT+"<input type='hidden' id='IS_DEFAULT"+rccList[i].ID+"' value='"+rccList[i].IS_DEFAULT+"'/><input type='hidden' id='IS_DEFAULT_R"+rccList[i].ID+"' value='"+rccList[i].TAS_IS_DEFAULT+"'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:90px;text-align: center;' title='"+rccList[i].TAS_SEQ+"'>"+rccList[i].TAS_SEQ+"<input type='hidden' id='TAS_SEQ"+rccList[i].ID+"' value='"+rccList[i].TAS_SEQ+"'/></td>");
							$("#outTbody tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: center;' title='"+rccList[i].IS_OPEN+"'>"+rccList[i].IS_OPEN+"<input type='hidden' id='IS_OPEN"+rccList[i].ID+"' value='"+rccList[i].IS_OPEN+"'/><input type='hidden' id='IS_OPEN_R"+rccList[i].ID+"' value='"+rccList[i].TAS_STATUS+"'/></td>");
                	   }
                	}
					var tableTrJs = $("#outTable tbody tr");
					_tongLineColor(tableTrJs);
					clickTr("outTable");
	           },
	           error:function(msg){
	                	util.closeLoading();
	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	           }
	});
}
//保存选择的数据  产量  2/品质   3 /预警 5
function addOutList(showId,backId){
	var tableId;
	var tbodyId;
	var trId;
	if(outType=="2"){ //产量
		tableId = "outPutInfo";
		tbodyId = "addOutPutInfo";
		trId = "trr2";
	}else if(outType=="3"){ //品质 
		tableId = "qualityInfo";
		tbodyId = "addQualityInfo";
		trId = "trr3";
	}else{ //预警
		tableId = "warnInfo";
		tbodyId = "addWarnInfo";
		trId = "trr5";
	}
	var len = $("#"+tbodyId+" tr").length;	
	$("#outTbody :checkbox").each(function(){
			if($(this).attr("checked")){
				if (!$("#"+trId+$(this).attr("id")).length) {
					$("#"+tableId+" tbody:last").append("<tr id='"+trId+$(this).attr("id")+"' ></tr>");
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(len+1)+"</td>");
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1' value='"+$(this).attr("id")+"'/></td>");
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;'>"+$("#MOUDLE_NAME"+$(this).attr("id")).val()+"<input type='hidden'  name='MOUDLE_NAME' value='"+$("#MOUDLE_NAME_R"+$(this).attr("id")).val()+"'/></td>");
					
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;'>"+$("#SHOW_TYPE"+$(this).attr("id")).val()+"<input type='hidden'  name='SHOW_TYPE' value='"+$("#SHOW_TYPE_R"+$(this).attr("id")).val()+"'/></td>");
					
					$("#"+tableId+" tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: center;padding:0;'><input type='text' style='width: 100%;padding:0;text-align: left;' maxlength='10' class=' input isSubmit' name='TAS_SEQ' value='"+$("#TAS_SEQ"+$(this).attr("id")).val()+"'/></td>");
						len = len+1;
					var tableTrJs = $("#"+tableId+" tbody tr");
					_tongLineColor(tableTrJs);
					clickTr(tableId);		
				}
			}
	});
	hideOutDiv(showId,backId);
}
//提交方法
function saveMoudle(type){//首页  1/仓储   4   产量  2/品质   3 /预警 5
	var tableId;
	var tbodyId;
	var trId;
	if(type=="1"){
		tableId = "homeInfo";
		tbodyId = "addHomeInfo";
		trId = "trr1";
	}else if(type=="2"){ //产量
		tableId = "outPutInfo";
		tbodyId = "addOutPutInfo";
		trId = "trr2";
	}else if(type=="3"){ //品质 
		tableId = "qualityInfo";
		tbodyId = "addQualityInfo";
		trId = "trr3";
	}else if(type=="4"){
		tableId = "stockInfo";
		tbodyId = "addStockInfo";
		trId = "trr4";
	}else{
		tableId = "warnInfo";
		tbodyId = "addWarnInfo";
		trId = "trr5";
	}
	getSubmitTable(tableId);
	var len = $("#submitTable tbody tr").length;
	if(len>0){
		document.forms.submit_Form.action="${path}buss/bussModel_exeFunc.ms?funcMId=2c3063f210d040d6afa6693556a72868";
		document.forms.submit_Form.submit();
		$("#submitTable").empty();
	}else{
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
    	return;
	}
}
//表单  table克隆进行提交
function getSubmitTable(tableId){
		var submitTable = $("#submitTable");
		submitTable.empty();
    	$("#"+tableId).find("tbody tr").each(function (seq){
    	if($(this).find("td").find("input[type='checkbox']").prop("checked")){
    		var rowClone = $(this).clone(true);
				submitTable.append(rowClone);
			}
    	});
}
//删除方法
function delMoudle(type){//首页  1/仓储   4   产量  2/品质   3 /预警 5
	var tableId;
	var tbodyId;
	var trId;
	if(type=="1"){
		tableId = "homeInfo";
		tbodyId = "addHomeInfo";
		trId = "trr1";
	}else if(type=="2"){ //产量
		tableId = "outPutInfo";
		tbodyId = "addOutPutInfo";
		trId = "trr2";
	}else if(type=="3"){ //品质 
		tableId = "qualityInfo";
		tbodyId = "addQualityInfo";
		trId = "trr3";
	}else if(type=="4"){
		tableId = "stockInfo";
		tbodyId = "addStockInfo";
		trId = "trr4";
	}else{
		tableId = "warnInfo";
		tbodyId = "addWarnInfo";
		trId = "trr5";
	}
	getSubmitTable(tableId);
	var len = $("#submitTable tbody tr").length;
	if(len>0){
		utilsFp.confirmIcon(1,"","delReal","", "是否确认删除？","1","260","");
	}else{
		utilsFp.confirmIcon(3,"","","", "<dict:lang value="请至少选择一条记录" />",0,"260","");
    	return;
	}
}
function delReal(){
	document.forms.submit_Form.action="${path}buss/bussModel_exeFunc.ms?funcMId=1e8512b321bf4d939ddc356069e6625b";
	document.forms.submit_Form.submit();
	$("#submitTable").empty();
}
//加载首页/仓储   页面信息
function queryTextInfo(type){
	var tableId;
	var tbodyId;
	var trId;
	var moudleId;
	var moudleMore;
	if(type=="1"){ //首页
		tableId = "homeInfo";
		tbodyId = "addHomeInfo";
		trId = "trr1";
		moudleId = $("#moudleName1").val();//功能名称
		moudleMore = $("#moudleMore1").val();//功能细项
	}else{ //仓储
		tableId = "stockInfo";
		tbodyId = "addStockInfo";
		trId = "trr4";
		moudleId = $("#moudleName4").val();//功能名称
		moudleMore = $("#moudleMore4").val();//功能细项
	}
	util.showLoading("处理中...");
		var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=4e73d53303754f80891710df97764ae1";
	    $.ajax({
	           type:"post",
	           dataType:"json",
	           data: {
	           	  "moudleId" : moudleId,
	           	  "moudleMore" : moudleMore,
	           	  "type" : type,
	           	  "showList" : "userList"
	           },
	           url:loadItemUrl,
	           success:function(data){		
                	util.closeLoading();
                	$("#"+tbodyId).empty();
                	if(null==data){
                	    return;
                	}
                	if(null!=data.ajaxList){
                	   var rccList = eval(data.ajaxList);
                	   for(var i=0;i<rccList.length;i++){
                	       if(rccList[i].ID==null) rccList[i].ID="";
                	       $("#"+tbodyId).append("<tr id='"+trId+rccList[i].ID+"' ></tr>");
						   $("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input value='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
							$("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:200px;text-align: center;'>"+rccList[i].MOUDLE_NAME+"<input type='hidden' name='MOUDLE_NAME' value='"+rccList[i].TAS_MOUDLE_ID+"'/></td>");
							$("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:200px;text-align: center;'>"+rccList[i].TAS_FUN_NAME+"<input type='hidden' name='TAS_FUN_NAME' value='"+rccList[i].TAS_FUN_NAME+"'/></td>");
							$("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+rccList[i].SHOW_TYPE+"<input type='hidden' name='SHOW_TYPE' value='"+rccList[i].TAS_SHOW_TYPE+"'/></td>");
							$("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:120px;text-align: center;'>"+rccList[i].SHOW_TYPE+"<input type='hidden' name='SHOW_TYPE' value='"+rccList[i].TAS_SHOW_TYPE+"'/></td>");
							$("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: center;padding:0;'><input type='text' style='width: 100%;padding:0;text-align: left;' maxlength='10' class=' input isSubmit' name='TAS_SEQ' value='"+rccList[i].TAU_SEQ+"'/></td>");
                	   }
                	}
					var tableTrJs = $("#"+tableId+" tbody tr");
					_tongLineColor(tableTrJs);
					clickTr(tableId);
	           },
	           error:function(msg){
	                	util.closeLoading();
	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	           }
	});
}
//加载其他三个tab  页面信息
function queryOutInfo(type){
	var tableId;
	var tbodyId;
	var trId;
	var moudleId;
	var moudleMore="";
	if(type=="2"){ //产量
		tableId = "outPutInfo";
		tbodyId = "addOutPutInfo";
		trId = "trr2";
		moudleId = $("#moudleName2").val();//功能名称
	}else if(type=="3"){ //品质 
		tableId = "qualityInfo";
		tbodyId = "addQualityInfo";
		trId = "trr3";
		moudleId = $("#moudleName3").val();//功能名称
	}else{ //预警
		tableId = "warnInfo";
		tbodyId = "addWarnInfo";
		trId = "trr5";
		moudleId = $("#moudleName5").val();//功能名称
	}
	util.showLoading("处理中...");
		var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=4e73d53303754f80891710df97764ae1";
	    $.ajax({
	           type:"post",
	           dataType:"json",
	           data: {
	           	  "moudleId" : moudleId,
	           	  "moudleMore" : moudleMore,
	           	  "type" : type,
	           	  "showList" : "userList"
	           },
	           url:loadItemUrl,
	           success:function(data){		
                	util.closeLoading();
                	$("#"+tbodyId).empty();
                	if(null==data){
                	    return;
                	}
                	if(null!=data.ajaxList){
                	   var rccList = eval(data.ajaxList);
                	   for(var i=0;i<rccList.length;i++){
                	       if(rccList[i].ID==null) rccList[i].ID="";
                	       $("#"+tbodyId).append("<tr id='"+trId+rccList[i].ID+"' ></tr>");
						   $("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
							$("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input value='"+rccList[i].ID+"' type='checkbox' name='isSelect1'/></td>");
							$("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='text-align: center;'>"+rccList[i].MOUDLE_NAME+"<input type='hidden' name='MOUDLE_NAME' value='"+rccList[i].TAS_MOUDLE_ID+"'/></td>");
							
							$("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='text-align: center;'>"+rccList[i].SHOW_TYPE+"<input type='hidden' name='SHOW_TYPE' value='"+rccList[i].TAS_SHOW_TYPE+"'/></td>");
							
							$("#"+tbodyId+" tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='text-align: center;padding:0;'><input type='text' style='width: 100%;padding:0;text-align: left;' maxlength='10' class=' input isSubmit' name='TAS_SEQ' value='"+rccList[i].TAU_SEQ+"'/></td>");
                	   }
                	}
					var tableTrJs = $("#"+tableId+" tbody tr");
					_tongLineColor(tableTrJs);
					clickTr(tableId);
	           },
	           error:function(msg){
	                	util.closeLoading();
	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	           }
	});
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
//全选
function getAllPo(){
	if($("#po_list_cb").attr("checked")=="checked"){
		$("#textTbody :checkbox").attr("checked",true);
	}else{
		$("#textTbody :checkbox").each(function(){
				$(this).attr("checked",false);
		});
	}
} 
function getAllPo1(){
	if($("#po_list_cb1").attr("checked")=="checked"){
		$("#outTbody :checkbox").attr("checked",true);
	}else{
		$("#outTbody :checkbox").each(function(){
				$(this).attr("checked",false);
		});
	}
} 
</script>
<script>(function($){
  $(window).on('load',function(){
    
   // setPopScroll('.scroll1','.head1');
  
  });
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
