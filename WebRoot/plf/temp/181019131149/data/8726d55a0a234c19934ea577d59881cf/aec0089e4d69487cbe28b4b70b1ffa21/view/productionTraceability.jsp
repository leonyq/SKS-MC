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
		<dict:lang value="VM-生产追溯报表" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
    <script type = "text/javascript" src = "${path}plf/js/zTree/js/jquery.ztree.core.js"></script>
    <link href="${path}plf/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
		<bu:header formId ="ff22f995cd064055b2658fb26776340b"/>

    
    <!-- head里面 -->
    <!-- 产品静态资源 -->
<style type="text/css">

.table1Div{
   top: 0px;
   left: 5px;    
}
.datagrid-btablemy td {
    max-height: 30px!important;
}

.table1Div table tr td:nth-of-type(2n+1) .name{
    text-align:right;
    margin-right:5px;
}

</style>
</head>

<body>
    <div  style="width: 100%;height:calc(100% - 10px);background-color:#fff;border: 1px solid #eaeaea;box-sizing:border-box;" >
    	<div id="treeDiv" style="width: 33%;height:40%;float: left;position: relative;">
    	<div class="block2 optn " id="block2" style="float: left;left:0;overflow:auto;position: absolute;">
    	<input type="text" class="input" id="proSn" placeholder="请输入产品SN,按Enter键或点击查询" style="margin-left:70px;margin-top:10px;height: 28px;line-height: 28px;">
    	<input type="hidden" id="hiddenlot" value="" >
    	<input type="hidden" id="hiddenitem" value="" >
    	<input type="hidden" id="proSn1" value="${param.proSn}" >
    	<input type="hidden" id="ctId" name="name"   value="${param.proSn}" >
    	<button type="button" id="querybtn" onclick="queryAllProData();" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
    	</div>
		<div class="block1" style="background:#ffffff;overflow:auto;position: absolute; top: 38px;height:calc(100% - 38px);width:100%;">
		    <div class="mod" style="height:100%;">
                <div class="mod-hd">
                    <h3 class="tit"><dict:lang value="产品结构" /></h3>	
                </div>	
                <div id="index_tree" class="ztree" style="height:calc(100% - 40px);box-sizing: border-box;">
          	    </div>
            </div>
      	</div>
      </div>
        <div  style="width: calc(67% - 20px);height:40%;float: right;position: relative;border-color:#eaeaea;background:#ffffff;" >
        	<div class="table1Div" style="position: absolute;width: 100%;height:100%;">
        	<table style="width: 100%;height:100%;">
        	<tr >
        	<td ><div class="name" ><dict:lang value="产品SN" /></div></td><td><div class="dec"><input readonly  id="proSn2" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="工单号" /></div></td><td><div class="dec"><input readonly id="proId" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="制令单号" /></div></td><td><div class="dec"><input readonly id="wtNum" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="机种" /></div></td><td><div class="dec"><input readonly class="input coc" id="proCode" style="width:147px;"></div></td>
        	</tr>
        	<tr>
        	<td ><div class="name" ><dict:lang value="线别" /></div></td><td><div class="dec"><input readonly id="areaSn" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="生产面别" /></div></td><td><div class="dec"><input readonly id="proFace" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="数量" /></div></td><td><div class="dec"><input readonly id="itemNum" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="生产批号" /></div></td><td><div class="dec"><input readonly id="lotNo" class="input coc" style="width:147px;"></div></td>
        	</tr>
        	<tr>
        	<td ><div class="name" ><dict:lang value="SN类型" /></div></td><td><div class="dec"><input readonly id="snType" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="客户" /></div></td><td><div class="dec"><input readonly id="customer" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="工序" /></div></td><td><div class="dec"><input readonly id="groupCode" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="回流工序" /></div></td><td><div class="dec"><input readonly id="backGroup" class="input coc" style="width:147px;"></div></td>
        	</tr>
        	<tr>
        	
        	<td ><div class="name" ><dict:lang value="不良数" /></div></td><td><div class="dec"><input readonly id="ngNum" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="报废数" /></div></td><td><div class="dec"><input readonly id="scrNum" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="报废标志" /></div></td><td><div class="dec"><input readonly id="scrFlag" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="返工标志" /></div></td><td><div class="dec"><input readonly id="backFlag" class="input coc" style="width:147px;"></div></td>        	
        	</tr>
        	<tr>
        	<td ><div class="name" ><dict:lang value="工艺代码" /></div></td><td ><div class="dec"><input readonly id="techSn" class="input coc" ondblclick="seeMaterialPro(this.value);" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="流程结束" /></div></td><td><div class="dec"><input readonly id="finishFlag" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="单面产出" /></div></td><td><div class="dec"><input readonly id="faceFlag" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="工作中心" /></div></td><td><div class="dec"><input readonly id="workSn" class="input coc"  style="width:147px;"></div></td>
        	</tr>
        	<tr>
        	
        	<td ><div class="name" ><dict:lang value="操作员" /></div></td><td><div class="dec"><input readonly id="wtEmp" class="input coc" style="width:147px;"></div></td>
        	<td ><div class="name" ><dict:lang value="过站时间" /></div></td><td><div class="dec"><input readonly id="wtTime" class="input coc" style="width:147px;"></div></td>

        	
        	</tr>
        	</table>
			</div>	
        </div>
        <div  style="width: 33%;height:60%;float: left;border-color:#eaeaea;background:#ffffff;border:1px;" >
            <div class="mod" style="height:100%;">
                <div class="mod-hd">
                    <h3 class="tit"><dict:lang value="同批次产品" /></h3>	
                </div>					
                <div style="height:calc(100% - 70px);">
            		<div class="panel-ajax datagrid datagrid-div1"  id="ff22f995cd064055b2658fb26776340b" style="height:100%;">
            		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxff22f995cd064055b2658fb26776340b" style="height:100%;">
            		<div class="datagrid-header">
            		<div class="datagrid-header-inner  prosn" id="datagrid-header-innerff22f995cd064055b2658fb26776340b">
            		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableff22f995cd064055b2658fb26776340b" style="width:100%;">
            		<s:set name="_$type" value="'view'" />
            		<tbody class="isParentsTitle">
            		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
            			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ff22f995cd064055b2658fb26776340b" i18n="1"/></td>
            			<td class="datagrid-cell" style=""><dict:lang value="产品SN" /></td>
            			<td class="datagrid-cell" style=""><dict:lang value="制令单号" /></td>
            		</bu:tr>
            		</tbody>
            		</bu:table>
            		</div>
            		</div>
            		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll" id="tableDivff22f995cd064055b2658fb26776340b" onscroll="ajaxTableScroll(this,'ff22f995cd064055b2658fb26776340b')">
            		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxff22f995cd064055b2658fb26776340b" style="width:100%;" >
            		<tbody id="tbody_proSn" class="isParents">
            		</tbody>
            		</table>		</div>
            		</div>
            		</div>
    		    </div>				
                <div class="center" style="width: 100%;height:30px;float: left;">
    			    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=oneLot2&formId=formId1&showLoading=0" />
    		    </div>
            </div>
        </div> 
       <div  style="width: calc(67% - 20px);height:60%;float: right;border-color:#eaeaea;background:#ffffff;" >
        	<div style="width: 100%;height:98%;">
      <DIV id="container" style="margin-bottom:5px;">
                        <DIV>
                            <UL class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
                                <LI id="tag1" class="current"><A class=""
                                    onclick="switchTag('tag1','content1','');this.blur();"
                                    href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="制程"/></SPAN>
                                </A>
                                </LI>
                                <LI id="tag2"><A class=""
                                    onclick="switchTag('tag2','content2','');this.blur();"
                                    href="javascript:void(0);"> <SPAN><dict:lang value="人员"/></SPAN> </A>
                                </LI>
                               <LI id="tag3"><A class=""
                                    onclick="switchTag('tag3','content3','');this.blur();"
                                    href="javascript:void(0);"> <SPAN><dict:lang value="物料"/></SPAN> </A>
                                </LI>    
                               <LI id="tag4"><A class=""
                                    onclick="switchTag('tag4','content4','');this.blur();"
                                    href="javascript:void(0);"> <SPAN><dict:lang value="质量"/></SPAN> </A>
                                </LI>  
                               <LI id="tag5"><A class=""
                                    onclick="switchTag('tag5','content5','');this.blur();"
                                    href="javascript:void(0);"> <SPAN><dict:lang value="环境"/></SPAN> </A>
                                </LI>                                  
                            </UL>
                        </DIV>
        </DIV> 
	        <div class="panel-ajax datagrid datagrid-div1" style="height:100%"  id="ff22f995cd064055b2658fb26776340b">
        <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxff22f995cd064055b2658fb26776340b" style="height:90%">
        <div class="datagrid-header dd01" >
        <div class="datagrid-header-inner scroll001" id="datagrid-header-innerff22f995cd064055b2658fb26776340b">
        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableff22f995cd064055b2658fb26776340b" style="">
        <s:set name="_$type" value="'view'" />
        <tbody class="isParentsTitle">
        <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
            <td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ff22f995cd064055b2658fb26776340b" i18n="1"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="工序"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="工序名称"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="工作中心"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="工作中心名称"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="线别"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="线别名称"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="标志"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="制令单号"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="工单号"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="机种"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="作业员"/></td>
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="过站时间"/></td>
        </bu:tr>
        </tbody>
        </bu:table>
        </div>
        </div>
        <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd01  scroll1" id="tableDivff22f995cd064055b2658fb26776340b" onscroll="ajaxTableScroll(this,'ff22f995cd064055b2658fb26776340b')">
        <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxff22f995cd064055b2658fb26776340b" style="">
        <tbody id="tbody_tab1">
        </tbody>
        </table>        </div>


        <div class="datagrid-header dd02">
        <div class="datagrid-header-inner scroll002" id="datagrid-header-innerff22f995cd064055b2658fb26776340b">
        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableff22f995cd064055b2658fb26776340b">
        <s:set name="_$type" value="'view'" />
        <tbody class="isParentsTitle" id="totalTitle">
        <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
            <td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ff22f995cd064055b2658fb26776340b" i18n="1"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="操作员"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="状态"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="工作中心"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="工作中心名称"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="线别"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="线别名称"/></td>            
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="操作时间"/></td>
        </bu:tr>
        </tbody>
        </bu:table>
        </div>
        </div>
        <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd02  scroll2" id="tableDivff22f995cd064055b2658fb26776340b" onscroll="ajaxTableScroll(this,'ff22f995cd064055b2658fb26776340b')">
        <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxff22f995cd064055b2658fb26776340b">
        <tbody id="tbody_tab2">
        </tbody>
        </table>        
        </div>      
        <div class="datagrid-header dd03">
        <div class="datagrid-header-inner scroll003" id="datagrid-header-innerff22f995cd064055b2658fb26776340b">
        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableff22f995cd064055b2658fb26776340b">
        <s:set name="_$type" value="'view'" />
        <tbody class="isParentsTitle" id="totalTitle">
        <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
            <td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ff22f995cd064055b2658fb26776340b" i18n="1"/></td>
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="物料SN"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="物料类型"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="制令单"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="生产阶别"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="机种代码"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="加工面"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="线别"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="工作中心"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="料号"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="批次"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="数量"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="点位"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="点数"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="供应商"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="作业员"/></td>
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="作业时间"/></td>
        </bu:tr>
        
        </tbody>
        </bu:table>
        </div>
        </div>
        <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd03  scroll3" id="tableDivff22f995cd064055b2658fb26776340b" onscroll="ajaxTableScroll(this,'ff22f995cd064055b2658fb26776340b')">
        <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxff22f995cd064055b2658fb26776340b">
        <tbody id="tbody_tab3">
        </tbody>
        </table>        
        </div>
        <div class="dd004" style="height:100%;width:100%;position: relative;">
        <div class="dd0041" style="height:48%;width:100%;position: absolute;top:0;">
        <div class="datagrid-header dd04">
        <div class="datagrid-header-inner scroll004" id="datagrid-header-innerff22f995cd064055b2658fb26776340b">
        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableff22f995cd064055b2658fb26776340b" style="min-width:1370px;">
        <s:set name="_$type" value="'view'" />
        <tbody class="isParentsTitle" id="totalTitle">
        <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
            <td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ff22f995cd064055b2658fb26776340b" i18n="1"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="检验单号"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="检验阶别"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="检验类型"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="判定结果"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="状态"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="关联单号"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="送检部门"/></td>
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="送检时间"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="送检人"/></td>
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="检验时间"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="检验人"/></td>            
        </bu:tr>
        </tbody>
        </bu:table>
        </div>
        </div>
        <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd04  scroll4" id="tableDivff22f995cd064055b2658fb26776340b" onscroll="ajaxTableScroll(this,'ff22f995cd064055b2658fb26776340b')">
        <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxff22f995cd064055b2658fb26776340b" style="min-width:1370px;">
        <tbody id="tbody_tab4">
        </tbody>
        </table>        
        </div> 
        </div>
        <div class="dd0061" style="height:48%;width:100%;position: absolute;bottom:0;">
        
       <div class="datagrid-header dd06">
        <div class="datagrid-header-inner scroll006" id="datagrid-header-innerff22f995cd064055b2658fb26776340b">
        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableff22f995cd064055b2658fb26776340b" style="min-width:1390px;">
        <s:set name="_$type" value="'view'" />
        <tbody class="isParentsTitle" id="totalTitle">
        <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
            <td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ff22f995cd064055b2658fb26776340b" i18n="1"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="工作中心"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="维修状态"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="制令单"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="机种"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="机种名称"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="规格"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="加工面"/></td>
        <!--<td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="记录类别"/></td>
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="二次不良标志"/></td>-->
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="不良代码"/></td> 
        <!--<td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="故障名称"/></td>-->
        <!--<td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="不良现象"/></td>-->
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="不良点位"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="不良点数"/></td>   
        <!--<td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="误判标志"/></td>
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="报废标志"/></td>-->
        <!--<td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="时段ID"/></td>
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="班组代码"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="不良物料SN"/></td> 
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="不良物料号"/></td>   
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="不良物料批次"/></td>
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="工序"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="检验员"/></td>
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="检验时间"/></td>-->
        </bu:tr>
        </tbody>
        </bu:table>
        </div>
        </div>
        <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd06  scroll6" id="tableDivff22f995cd064055b2658fb26776340b" onscroll="ajaxTableScroll(this,'ff22f995cd064055b2658fb26776340b')">
        <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxff22f995cd064055b2658fb26776340b" style="min-width:1390px;">
        <tbody id="tbody_tab6">
        </tbody>
        </table>        
        </div>  
        </div>
        </div>
       <div class="datagrid-header dd05">
        <div class="datagrid-header-inner scroll005" id="datagrid-header-innerff22f995cd064055b2658fb26776340b">
        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableff22f995cd064055b2658fb26776340b" style="min-width:870px;">
        <s:set name="_$type" value="'view'" />
        <tbody class="isParentsTitle" id="totalTitle">
        <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
            <td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ff22f995cd064055b2658fb26776340b" i18n="1"/></td>
            <td class="datagrid-cell" style="width:80px; text-align:center;" ><dict:lang value="类别"/></td>
            <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="区域"/></td>
            <td class="datagrid-cell" style="width:100px; text-align:center;" ><dict:lang value="记录人"/></td>
            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="记录时间"/></td>
            <td class="datagrid-cell" style="width:300px; text-align:center;" ><dict:lang value="记录内容"/></td>
        </bu:tr>
        </tbody>
        </bu:table>
        </div>
        </div>
        <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd05  scroll5" id="tableDivff22f995cd064055b2658fb26776340b" onscroll="ajaxTableScroll(this,'ff22f995cd064055b2658fb26776340b')">
        <table class=" fixedTable  dblClick  datagrid-btable "  id="datagrid-btable-ajaxff22f995cd064055b2658fb26776340b" style="min-width:870px;">
        <tbody id="tbody_tab5">
        </tbody>
        </table>        
        </div>        
        </div>
        </div>        
					</div>
        </div> 


        <!--
		<div style="width: 66%;height:10%;float: left;" >
		<div class="center" style="width: 100%;height:100%;float: left;" id="page1">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ff22f995cd064055b2658fb26776340b&showLoading=0" />
		</div>
		<div class="center" style="width: 100%;height:100%;float: left;" id="page2">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ff22f995cd064055b2658fb26776340b&showLoading=0" />
		</div>
		<div class="center" style="width: 100%;height:100%;float: left;" id="page3">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ff22f995cd064055b2658fb26776340b&showLoading=0" />
		</div>
		<div class="center" style="width: 100%;height:100%;float: left;" id="page4">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ff22f995cd064055b2658fb26776340b&showLoading=0" />
		</div>
		<div class="center" style="width: 100%;height:100%;float: left;" id="page5">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ff22f995cd064055b2658fb26776340b&showLoading=0" />
		</div>		
		</div>
          -->        
    </div>
		<bu:submit viewId="aec0089e4d69487cbe28b4b70b1ffa21" />
      
		<bu:script viewId="aec0089e4d69487cbe28b4b70b1ffa21" />    
<script>
$(function(){
    var proSn = $("#proSn1").val(); 
    $("#proSn").val(proSn);
      if(proSn!=""){
          trdbevent1(proSn);
      }
})
<%--生成异步表格--%>
function createTableModel(ms,formId){

}
function itemJump0(obj){
   
    itemJump(obj);
}
function docJump0(obj){
   
    docJump(obj);
}
function trdbevent1(id){
            $("#proSn").val(id);
		    initTree(id);
		    oneMsg(id);
		    resetTab();
}
function resetTab(){
    $("#tag1").addClass("current");
    $("#tag2").removeClass("current");    
    $("#tag3").removeClass("current");
    $("#tag4").removeClass("current");    
    $("#tag5").removeClass("current");    
    $('.dd01').css('display','block');
    $('.dd02').css('display','none');
    $('.dd03').css('display','none');  
    $('.dd004').css('display','none');
    $('.dd05').css('display','none');     
    $('#page1').css('display','block');
    $('#page2').css('display','none');
    $('#page3').css('display','none'); 
    $('#page4').css('display','none');
    $('#page5').css('display','none'); 
    $("#tbody_tab2").empty();
    $("#tbody_tab3").empty();
    $("#tbody_tab4").empty();
    $("#tbody_tab5").empty();
    $("#tbody_tab6").empty();
}
$('#proSn').bind('keyup', function(event) {

　　if (event.keyCode == "13") {

　　　　//回车执行查询

　　　　$('#querybtn').click();

　　}

});
function detailcon(obj){
  var url = "${path}buss/bussModel.ms?exeid=99418eeb243a4f4c9a6fd03084c7d4cf&FUNC_CODE=F10772&envId="+obj+"&dataId="+obj;
  //var url = "${path}buss/bussModel.ms?exeid=98b233093c5d4c9c9f8665e6719957db&envId="+obj+"&dataId="+obj;
  showPopWinFp(url, 800, 400,null,"记录内容","logCon");
}
</script>
		<script>
		function envinfo(timeArr){
   $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=4c187ba1fff2451dbbd10a8e00725e53&tab=5&timeArr="+timeArr,
        data: "",
        success: function(data){
              var reslist = data.ajaxPage.dataList;
              $("#tbody_tab5").empty();
               if(null != data.ajaxPage.dataList){
                                  for(var i=0;i<reslist.length;i++){
                    $("#tbody_tab5").append("<tr ondblclick='detailcon(this.id)' id='"+(reslist[i].ID==null?"":reslist[i].ID)+"' ></tr>");
                    $("#tbody_tab5 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                    $("#tbody_tab5 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].CEI_TYPE==null?"":reslist[i].CEI_TYPE)+"</td>");
                    $("#tbody_tab5 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].CEI_AREA_SN==null?"":reslist[i].CEI_AREA_SN)+"</td>"); 
                    $("#tbody_tab5 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].CEI_RECORD_EMP==null?"":reslist[i].CEI_RECORD_EMP)+"</td>");
                    $("#tbody_tab5 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].CEI_RECORD_TIME==null?"":reslist[i].CEI_RECORD_TIME)+"</td>");
                    $("#tbody_tab5 tr:last").append("<td  class='datagrid-cell' style='width:300px;text-align: center;padding:3px 5px;'><span  style='display:inline-block;width:100%;height:20px;'>"+(reslist[i].CEI_RECORD_CONTENT==null?"":reslist[i].CEI_RECORD_CONTENT)+"<span></td>");
                  }
               var tableTrJs = $("#tbody_tab5 tr");_tongLineColor(tableTrJs);  
               }
    
        },
        error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
                      
    });						    
		}		
		function qinfo2(proSn){
		    
   $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=4c187ba1fff2451dbbd10a8e00725e53&tab=6&proSn="+proSn,
        data: "",
        success: function(data){
              var reslist = data.ajaxPage.dataList;
              $("#tbody_tab6").empty();
                  if(null != data.ajaxPage.dataList){
                  for(var i=0;i<reslist.length;i++){
                    if(reslist[i].WR_FINISH_FLAG=="Y"){
                        reslist[i].WR_FINISH_FLAG = "完成维修";
                    }else{
                        reslist[i].WR_FINISH_FLAG = "未完成";
                    }
                    $("#tbody_tab6").append("<tr></tr>");
                    $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                    $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WR_REPAIR_STATION==null?"":reslist[i].WR_REPAIR_STATION)+"</td>");
                    $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+reslist[i].WR_FINISH_FLAG+"</td>"); 
                    $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WR_MO_NUMBER==null?"":reslist[i].WR_MO_NUMBER)+"</td>");
                    $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].PM_MODEL_CODE==null?"":reslist[i].PM_MODEL_CODE)+"</td>");
                    $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].CI_ITEM_NAME==null?"":reslist[i].CI_ITEM_NAME)+"</td>"); 
                    $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].CI_ITEM_SPEC==null?"":reslist[i].CI_ITEM_SPEC)+"</td>");
                    $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].PM_PROCESS_FACE==null?"":reslist[i].PM_PROCESS_FACE)+"</td>");
                  
                    $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WR_ERROR_CODE==null?"":reslist[i].WR_ERROR_CODE)+"</td>");
                    $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].WR_POINT==null?"":reslist[i].WR_POINT)+"</td>");
                    $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].WE_POINT_COUNT==null?"":reslist[i].WE_POINT_COUNT)+"</td>"); 
                  }
               var tableTrJs = $("#tbody_tab6 tr");_tongLineColor(tableTrJs);
               }
        },
        error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
                      
    });						    
		}
		function queryAllProData(){

    	    var proSn=$("#proSn").val();
    	    if(proSn==""){
    	      utilsFp.confirmIcon(1,"","","", "请输入产品SN",0,"300","");  
    	    }else{
    		    initTree(proSn);
    		    oneMsg(proSn);	        
    	    }

		}
		function seeMaterialPro(obj){
		    dblClicks(obj);
		}
		
		function empTab(){
		    var orderArr = "";
		    var timeArr = "";
		    $("#tbody_tab1 tr").each(function(){
		       var order = $(this).find("td").eq("8").text(); 
		       var time = $(this).find("td").eq("12").text(); 
		       if(orderArr==""){
		         orderArr =  order; 
		       }else{
		         orderArr = orderArr + "," +  order;
		       }
		       if(timeArr==""){
		         timeArr =  time; 
		       }else{
		         timeArr = timeArr + "," +  time;
		       }		       
		    });
		    empTab2(orderArr,timeArr);
		}
		function qinfo(proSn){
		    
   $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=4c187ba1fff2451dbbd10a8e00725e53&tab=4&proSn="+proSn,
        data: "",
        success: function(data){
              var reslist = data.ajaxPage.dataList;
              $("#tbody_tab4").empty();
              if(null != data.ajaxPage.dataList){
                  for(var i=0;i<reslist.length;i++){
                    $("#tbody_tab4").append("<tr style='cursor:pointer' id='"+(reslist[i].QII_INSPECT_SN==null?"":reslist[i].QII_INSPECT_SN)+"' ondblclick='docJump0(this.id)'  ></tr>");
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'><span style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].QII_INSPECT_SN==null?"":reslist[i].QII_INSPECT_SN)+"</span></td>");
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].QII_TEST_STEP==null?"":reslist[i].QII_TEST_STEP)+"</td>"); 
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].QII_SAMPLE_TYPE==null?"":reslist[i].QII_SAMPLE_TYPE)+"</td>");
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].QII_INSEPCT_RESULT==null?"":reslist[i].QII_INSEPCT_RESULT)+"</td>");
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].QII_LIST_FLAG==null?"":reslist[i].QII_LIST_FLAG)+"</td>"); 
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].QII_CONNECT_DOC==null?"":reslist[i].QII_CONNECT_DOC)+"</td>");
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].QII_SEND_DEP==null?"":reslist[i].QII_SEND_DEP)+"</td>");
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].QII_SEND_TIME==null?"":reslist[i].QII_SEND_TIME)+"</td>"); 
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].QII_SEND_EMP==null?"":reslist[i].QII_SEND_EMP)+"</td>");
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].QII_INSEPCT_TIME==null?"":reslist[i].QII_INSEPCT_TIME)+"</td>");
                    $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].QII_INSEPCT_EMP==null?"":reslist[i].QII_INSEPCT_EMP)+"</td>"); 
                  }
               var tableTrJs = $("#tbody_tab4 tr");_tongLineColor(tableTrJs);
               }
        },
        error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
                      
    });				    		    
		}
		function itemTab(proSn){
   $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=4c187ba1fff2451dbbd10a8e00725e53&tab=3&proSn="+proSn,
        data: "",
        success: function(data){
              var reslist = data.ajaxPage.dataList;
              $("#tbody_tab3").empty();
              if(null != data.ajaxPage.dataList){
                  for(var i=0;i<reslist.length;i++){
                    $("#tbody_tab3").append("<tr style='cursor:pointer' id='"+(reslist[i].WSI_ITEM_SN==null?"":reslist[i].WSI_ITEM_SN)+"' ondblclick='itemJump0(this.id)' ></tr>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;' title='"+(reslist[i].WSI_ITEM_SN==null?"":reslist[i].WSI_ITEM_SN)+"'><span style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].WSI_ITEM_SN==null?"":reslist[i].WSI_ITEM_SN)+"</span></td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].WSI_ITEM_TYPE==null?"":reslist[i].WSI_ITEM_TYPE)+"</td>"); 
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WSI_MO_NUMBER==null?"":reslist[i].WSI_MO_NUMBER)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].PM_PRODUCT_STEP==null?"":reslist[i].PM_PRODUCT_STEP)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WSI_MODEL_CODE==null?"":reslist[i].WSI_MODEL_CODE)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].WSI_PROCESS_FACE==null?"":reslist[i].WSI_PROCESS_FACE)+"</td>"); 
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].WSI_AREA_ID==null?"":reslist[i].WSI_AREA_ID)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].WSI_WORKSTATION_SN==null?"":reslist[i].WSI_WORKSTATION_SN)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WSI_ITEM_CODE==null?"":reslist[i].WSI_ITEM_CODE)+"</td>"); 
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].WSI_LOT_NO==null?"":reslist[i].WSI_LOT_NO)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].WSI_ITEM_COUNT==null?"":reslist[i].WSI_ITEM_COUNT)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].WSI_POINT==null?"":reslist[i].WSI_POINT)+"</td>"); 
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].WSI_POINT_NUM==null?"":reslist[i].WSI_POINT_NUM)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WSI_SUPPLIERS==null?"":reslist[i].WSI_SUPPLIERS)+"</td>");
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].WSI_EMP==null?"":reslist[i].WSI_EMP)+"</td>"); 
                    $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].WSI_LOADTIME==null?"":reslist[i].WSI_LOADTIME)+"</td>");
                  }
               var tableTrJs = $("#tbody_tab3 tr");_tongLineColor(tableTrJs); 
               }
        },
        error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
                      
    });				    
		}
		function empTab2(orderArr,timeArr){
   $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=4c187ba1fff2451dbbd10a8e00725e53&tab=2&orderArr="+orderArr+"&timeArr="+timeArr,
        data: "",
        success: function(data){
              var reslist = data.ajaxPage.dataList;
              $("#tbody_tab2").empty();
              if(null != data.ajaxPage.dataList){
                  for(var i=0;i<reslist.length;i++){
                    $("#tbody_tab2").append("<tr></tr>");
                    $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                    $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].USER_NAME==null?"":reslist[i].USER_NAME)+"</td>");
                    $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].ON_OFF_TYPE==null?"":reslist[i].ON_OFF_TYPE)+"</td>"); 
                    $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].CA_WORKSTATION_SN==null?"":reslist[i].CA_WORKSTATION_SN)+"</td>"); 
                    $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].CA_WORKSTATION_SN_NAME==null?"":reslist[i].CA_WORKSTATION_SN_NAME)+"</td>");
                    $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].CA_AREA_SN==null?"":reslist[i].CA_AREA_SN)+"</td>");
                    $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].CA_AREA_SN_NAME==null?"":reslist[i].CA_AREA_SN_NAME)+"</td>"); 
                   
                    $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].OP_TIME==null?"":reslist[i].OP_TIME)+"</td>");                    
                  }
                  var tableTrJs = $("#tbody_tab2 tr");_tongLineColor(tableTrJs);
                  }
        },
        error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
                      
    });				    
		}
		function queryTab(proSn){
   $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=4c187ba1fff2451dbbd10a8e00725e53&tab=1&proSn="+proSn,
        data: "",
        success: function(data){
              var reslist = data.ajaxPage.dataList;
              
              $("#tbody_tab1").empty();
              if(null != data.ajaxPage.dataList){
                  for(var i=0;i<reslist.length;i++){
                    $("#tbody_tab1").append("<tr></tr>");
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].WD_GROUP_CODE==null?"":reslist[i].WD_GROUP_CODE)+"</td>");
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].GROUP_NAME==null?"":reslist[i].GROUP_NAME)+"</td>");
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].WD_WORK_STATION==null?"":reslist[i].WD_WORK_STATION)+"</td>"); 
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WD_WORK_STATION_NAME==null?"":reslist[i].WD_WORK_STATION_NAME)+"</td>"); 
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].WD_AREA_SN==null?"":reslist[i].WD_AREA_SN)+"</td>");
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WD_AREA_SN_NAME==null?"":reslist[i].WD_AREA_SN_NAME)+"</td>");
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:80px;text-align: center;'>"+(reslist[i].WD_ERROR_FLAG==null?"":reslist[i].WD_ERROR_FLAG)+"</td>");
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WD_MO_NUMBER==null?"":reslist[i].WD_MO_NUMBER)+"</td>");
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WD_PROJECT_ID==null?"":reslist[i].WD_PROJECT_ID)+"</td>");
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:160px;text-align: center;'>"+(reslist[i].WD_MODEL_CODE==null?"":reslist[i].WD_MODEL_CODE)+"</td>");
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:100px;text-align: center;'>"+(reslist[i].WD_EMP==null?"":reslist[i].WD_EMP)+"</td>");
                    $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].WD_IN_TIME==null?"":reslist[i].WD_IN_TIME)+"</td>");
                  }
                 var tableTrJs = $("#tbody_tab1 tr");_tongLineColor(tableTrJs);
                 }
        },
        error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
                      
    });		    
		}
        function oneLot(lot,item){
   $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=c3bdb7809cc449e8ad709ae9b99848d4&lot="+lot+"&item="+item,
        data: "",
        success: function(data){
              var reslist = data.ajaxPage.dataList;
              $("#tbody_proSn").empty();
              if(null != data.ajaxPage.dataList){
                  for(var i=0;i<reslist.length;i++){
                    $("#tbody_proSn").append("<tr style='cursor:pointer' ondblclick='trdbevent1(this.id)' id='"+(reslist[i].WT_SN==null?"":reslist[i].WT_SN)+"'></tr>");
                    $("#tbody_proSn tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                    $("#tbody_proSn tr:last").append("<td class='datagrid-cell' style='text-align: center;'><span style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].WT_SN==null?"":reslist[i].WT_SN)+"</span></td>");
                    $("#tbody_proSn tr:last").append("<td class='datagrid-cell' style='text-align: center;'>"+(reslist[i].WT_MO_NUMBER==null?"":reslist[i].WT_MO_NUMBER)+"</td>");                   
                  }
                 var tableTrJs = $("#tbody_proSn tr");_tongLineColor(tableTrJs);
                 pageFun(data.ajaxPage,"formId1");
                 }
        },
        error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
                      
    });
        } 
        var paginationImpl = {};
        function oneLot2(paginationImpl){
        var lot = $("#hiddenlot").val();
        var item= $("#hiddenitem").val();
   $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=c3bdb7809cc449e8ad709ae9b99848d4&lot="+lot+"&item="+item,
        data: "page.currentPage="+_GLO_FORM_PAGE_MAP[paginationImpl].currentPage+"&page.pageRecord=" + _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord,
        success: function(data){
              var reslist = data.ajaxPage.dataList;
              var pagec = 0;
              if(_GLO_FORM_PAGE_MAP[paginationImpl].currentPage!="1"){
                pagec = _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord; 
                pagea = _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
              }
              $("#tbody_proSn").empty();
              if(null != data.ajaxPage.dataList){
                  for(var i=0;i<reslist.length;i++){
                    $("#tbody_proSn").append("<tr style='cursor:pointer' ondblclick='trdbevent1(this.id)' id='"+(reslist[i].WT_SN==null?"":reslist[i].WT_SN)+"'></tr>");
                    $("#tbody_proSn tr:last").append("<td class='datagrid-cell' style='width:30px;text-align: center;'>"+reslist[i].ROWNUM_+"</td>");
                    $("#tbody_proSn tr:last").append("<td class='datagrid-cell' style='text-align: center;'><span style='display: inline;border-bottom: 1px solid #004098;'>"+(reslist[i].WT_SN==null?"":reslist[i].WT_SN)+"</span></td>");
                    $("#tbody_proSn tr:last").append("<td class='datagrid-cell' style='text-align: center;'>"+(reslist[i].WT_MO_NUMBER==null?"":reslist[i].WT_MO_NUMBER)+"</td>");                   
                  }
                 var tableTrJs = $("#tbody_proSn tr");_tongLineColor(tableTrJs);
                 pageFun(data.ajaxPage,"formId1");
                 }
        },
        error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
                      
    });
        } 	        
        function oneMsg(prosn){
		    $('.scroll').mCustomScrollbar("destroy");
		    $('.scroll1').mCustomScrollbar("destroy");
		    $('.scroll2').mCustomScrollbar("destroy");
		    $('.scroll3').mCustomScrollbar("destroy");
		    $('.scroll4').mCustomScrollbar("destroy");
		    $('.scroll5').mCustomScrollbar("destroy");
		    $('.scroll6').mCustomScrollbar("destroy");        
   $.ajax({
        type: "POST",
        dataType: "json",
        url: "${path}buss/bussModel_exeFunc.ms?funcMId=5c636aa3911f4e5c8f50c8e6222fc24d&proSn="+prosn,
        data: "",
        success: function(data){
              var resmap = data.ajaxMap;
              var reslist = data.ajaxList;
              console.log(reslist);
              if(resmap.isSuccess=="N"){
                         $(".coc").val("");
                         oneLot("","");
                        queryTab("");
                        qinfo("");
            setPopScroll('.scroll','.prosn');
            setPopScroll('.scroll1','.scroll001');
            setPopScroll('.scroll2','.scroll002');
            setPopScroll('.scroll3','.scroll003');
            setPopScroll('.scroll4','.scroll004');
            setPopScroll('.scroll5','.scroll005');
            setPopScroll('.scroll6','.scroll006');
                utilsFp.confirmIcon(1,"","","", ""+resmap.errorMsg,0,"300","");  
              }else{
                  for(var i=0;i<reslist.length;i++){
                     	$("#proSn2").val(reslist[i].WT_SN); 
                        $("#proId").val(reslist[i].WT_PROJECT_ID);
                        $("#wtNum").val(reslist[i].WT_MO_NUMBER);
                        $("#proCode").val(reslist[i].WT_MODEL_CODE);
                        $("#areaSn").val(reslist[i].WT_AREA_SN);
                        $("#proFace").val(reslist[i].WT_PROCESS_FACE);
                        $("#itemNum").val(reslist[i].WT_NUM);
                        $("#lotNo").val(reslist[i].WT_LOT);
                        $("#snType").val(reslist[i].WT_SN_TYPE);
                        $("#customer").val(reslist[i].WT_CUST_CODE);
                        $("#groupCode").val(reslist[i].WT_GROUP_CODE);
                        $("#wtEmp").val(reslist[i].WT_EMP);
                        $("#wtTime").val(reslist[i].WT_IN_TIME);
                        $("#ngNum").val(reslist[i].WT_NG_NUM);
                        $("#scrNum").val(reslist[i].WT_SCRAP_NUM);
                        $("#backGroup").val(reslist[i].WT_BACK_GROUP);
                        $("#nextGroup").val(reslist[i].WT_NEXT_GROUP);
                        $("#finishFlag").val(reslist[i].WT_FINISH_FLAG);
                        $("#faceFlag").val(reslist[i].WT_SC_FINISH_FLAG);
                        $("#workSn").val(reslist[i].WT_WORK_STATION);
                        $("#techSn").val(reslist[i].WT_TECH_SN);
                        $("#ctId").val(reslist[i].ID);
                        $("#scrFlag").val(reslist[i].WT_SCRAP_FLAG);
                        $("#backFlag").val(reslist[i].WT_REWORK_FLAG);
                        oneLot(reslist[i].WT_LOT,reslist[i].WT_MODEL_CODE);
                        queryTab(reslist[i].WT_SN);
                        qinfo(reslist[i].WT_SN);
                        qinfo2(reslist[i].WT_SN);
                        itemTab(reslist[i].WT_SN);
                        $("#hiddenitem").val(reslist[i].WT_MODEL_CODE);
                        $("#hiddenlot").val(reslist[i].WT_LOT);
                  }
            setPopScroll('.scroll','.prosn');
            setPopScroll('.scroll1','.scroll001');
            setPopScroll('.scroll2','.scroll002');
            setPopScroll('.scroll3','.scroll003');
            setPopScroll('.scroll4','.scroll004');
            setPopScroll('.scroll5','.scroll005');
            setPopScroll('.scroll6','.scroll006');    
              }
        },
        error: function(msg){
                util.closeLoading();
            setPopScroll('.scroll','.prosn');
            setPopScroll('.scroll1','.scroll001');
            setPopScroll('.scroll2','.scroll002');
            setPopScroll('.scroll3','.scroll003');
            setPopScroll('.scroll4','.scroll004');
            setPopScroll('.scroll5','.scroll005');
            setPopScroll('.scroll6','.scroll006');
                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        }
                      
    });
        } 
         var curStatus = "init";
         var curAsyncCount = 0;
         var goAsync = false;
		function initTree(proSn){

	var areaUrl="${path}buss/bussModel_exeFunc.ms?funcMId=fa977322814844a8a04296fdc0ead42a&proSn="+proSn;
			    		var setting = {
                data: {
                        simpleData : {	
        				    	enable: true,
        				    	pIdKey: "upId"
                        }			
                },
                callback: {
                        //onClick: zTreeOnclick
                        onDblClick: zTreeOnclick,
                        beforeAsync: beforeAsync,  
                        onAsyncSuccess: onAsyncSuccess
                },
                async: {
                    enable: true,
                    url: areaUrl,
                    autoParam: ["id"],
                    otherParam: ["iconPath","${path}plf/js/dhtmlxtree/imgs/csh_bluebooks/"],
                    dataFilter: ajaxDataFilter
                }
            }
        // console.log("tree"+data.ajaxList);
         $.fn.zTree.init($("#index_tree"),setting);
            setTimeout(function(){  
                expandAll("index_tree");  
            },1000);//延迟加载 
            // var treeObj = $.fn.zTree.getZTreeObj(index_tree0);  //得到该tree  
         // var node = treeObj.getNodeByTId("index_tree_1");  //选中第一个节点  
        //  treeObj.expandNode(node, true, false, true);  //打开节点 ，第一个参数表示哪个节点，第二个参数表示展开还是关闭，第三个参数表示 是否打开全部子孙节点  
    resetTab();     
}
           function zTreeOnclick(event,treeId,treeNode){
            $("#proSn").val(treeNode.id);
		    initTree(treeNode.id);
             oneMsg(treeNode.id);
             resetTab();
            }

            function ajaxDataFilter(treeId,parentNode,responseDate){
                var data = responseDate.ajaxList;
                $.each(data,function(i,v){
                    v["isParent"] = true;
                });
                return data;
            }			
function switchTag(tag, content, url){
    if(tag=="tag1"){
    $("#tag1").addClass("current");
    $("#tag2").removeClass("current");    
    $("#tag3").removeClass("current");
    $("#tag4").removeClass("current");    
    $("#tag5").removeClass("current");    
    $('.dd01').css('display','block');
    $('.dd02').css('display','none');
    $('.dd03').css('display','none');  
    $('.dd004').css('display','none');
    $('.dd05').css('display','none');     
    $('#page1').css('display','block');
    $('#page2').css('display','none');
    $('#page3').css('display','none'); 
    $('#page4').css('display','none');
    $('#page5').css('display','none');     
    }else if(tag=="tag2"){
    $("#tag2").addClass("current");
    $("#tag1").removeClass("current");
    $("#tag3").removeClass("current");
    $("#tag4").removeClass("current");
    $("#tag5").removeClass("current");    
    $('.dd01').css('display','none');
    $('.dd03').css('display','none');
    $('.dd02').css('display','block'); 
    $('.dd004').css('display','none');
    $('.dd05').css('display','none');    
    $('#page1').css('display','none');
    $('#page3').css('display','none');
    $('#page2').css('display','block'); 
    $('#page4').css('display','none');
    $('#page5').css('display','none');
    empTab();
    }else if(tag=="tag3"){
    $("#tag3").addClass("current");
    $("#tag1").removeClass("current");
    $("#tag2").removeClass("current");
    $("#tag4").removeClass("current");
    $("#tag5").removeClass("current");    
    $('.dd01').css('display','none');
    $('.dd03').css('display','block');
    $('.dd02').css('display','none'); 
    $('.dd004').css('display','none');
    $('.dd05').css('display','none');    
    $('#page1').css('display','none');
    $('#page3').css('display','block');
    $('#page2').css('display','none'); 
    $('#page4').css('display','none');
    $('#page5').css('display','none'); 
    }else if(tag=="tag4"){
    $("#tag3").removeClass("current");
    $("#tag1").removeClass("current");
    $("#tag2").removeClass("current");
    $("#tag4").addClass("current");
    $("#tag5").removeClass("current");    
    $('.dd01').css('display','none');
    $('.dd03').css('display','none');
    $('.dd02').css('display','none'); 
    $('.dd004').css('display','block');
    $('.dd05').css('display','none');    
    $('#page1').css('display','none');
    $('#page3').css('display','none');
    $('#page2').css('display','none'); 
    $('#page4').css('display','block');
    $('#page5').css('display','none');     
    }else if(tag=="tag5"){
    $("#tag3").removeClass("current");
    $("#tag1").removeClass("current");
    $("#tag2").removeClass("current");
    $("#tag4").removeClass("current");
    $("#tag5").addClass("current");    
    $('.dd01').css('display','none');
    $('.dd03').css('display','none');
    $('.dd02').css('display','none'); 
    $('.dd004').css('display','none');
    $('.dd05').css('display','block');    
    $('#page1').css('display','none');
    $('#page3').css('display','none');
    $('#page2').css('display','none'); 
    $('#page4').css('display','none');
    $('#page5').css('display','block');
    envinfo0();
    }
}			
		function envinfo0(){
		    var timeArr = "";
		    $("#tbody_tab1 tr").each(function(){
		       var time = $(this).find("td").eq("12").text(); 
		       if(timeArr==""){
		         timeArr =  time; 
		       }else{
		         timeArr = timeArr + "," +  time;
		       }		       
		    });
		    envinfo(timeArr);
		}			
	$(function(){//alert(window.name);
    $('.dd01').css('display','block');
    $('.dd02').css('display','none');
    $('.dd03').css('display','none');
    $('.dd004').css('display','none');
    $('.dd05').css('display','none');    
    	});
    	
    	document.onreadystatechange = function () {      
               if(document.readyState=="complete") {            
                  var idd = '<%=session.getAttribute("firstId")%>';
                  
		  //tonclick(idd,idd);
               }     
       } 
    	
    	$(window).resize(function(){
    		initHeight();
    	})
    	
    	function initHeight(){
    		$('#areaiframe').height($(parent.window).height());
    	}
    
	function reloadPg(msg,title,width,height,time,isCloseWin){
		msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
	}
	function query(){
	    location.reload();
	}
	function reloadPgExe(isCloseWin){
		location.reload();
		util.showTopLoading();	
		
		if ("0" == isCloseWin || undefined == isCloseWin) {
      		top.$(".dialog-close").click();
    	}
		
	}
	
	function reloadIframe(){
	        
	       
		window.location.reload();
	}
	
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
		</script>
<script>(function($){
  $(window).on('load',function(){
    setPopScroll('.scroll','.prosn');
    setPopScroll('.scroll1','.scroll001');
    setPopScroll('.scroll2','.scroll002');
    setPopScroll('.scroll3','.scroll003');
    setPopScroll('.scroll4','.scroll004');
    setPopScroll('.scroll5','.scroll005');
    setPopScroll('.scroll6','.scroll006');
  })
})(jQuery)</script>
            <script>
           function beforeAsync() {  
            curAsyncCount++;  
           }  
            function onAsyncSuccess(event, treeId, treeNode, msg) {  
            curAsyncCount--;  
            if (curStatus == "expand") {  
                expandNodes(treeNode.children);  
            } else if (curStatus == "async") {  
                asyncNodes(treeNode.children);  
            }  

            if (curAsyncCount <= 0) {  
                curStatus = "";  
            }  
        }  
               function expandAll() {  
            if (!check()) {  
                return;  
            }  
            var zTree = $.fn.zTree.getZTreeObj("index_tree");  
            expandNodes(zTree.getNodes());  
            if (!goAsync) {  
                curStatus = "";  
            }  
        }  
                function expandNodes(nodes) {  
            if (!nodes) return;  
            curStatus = "expand";  
            var zTree = $.fn.zTree.getZTreeObj("index_tree");  
            for (var i=0, l=nodes.length; i<l; i++) {  
                zTree.expandNode(nodes[i], true, false, false);//展开节点就会调用后台查询子节点  
                if (nodes[i].isParent && nodes[i].zAsync) {  
                    expandNodes(nodes[i].children);//递归  
                } else {  
                    goAsync = true;  
                }  
            }  
        }  

        function check() {  
            if (curAsyncCount > 0) {  
                return false;  
            }  
            return true;  
        }  

     //   $(document).ready(function(){  
      //      $.fn.zTree.init($("#index_tree"), setting);  
           // setTimeout(function(){  
      //          expandAll("index_tree");  
          //  },1000);//延迟加载  
       // });  
        </script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
