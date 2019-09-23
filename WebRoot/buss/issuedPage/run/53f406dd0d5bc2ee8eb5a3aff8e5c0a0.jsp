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
		<dict:lang value="考核项目" />
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
		<bu:header formId ="144b88b89cbf4e988bdac5f3d1fea6f6"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    
    <style>
    .deptcss {
    text-align: left!important;

}
    .mmz_input_style{
    	    background-color:transparent;border:none;
    	}
    .mmz_load_set{
        height:30%
    }
 .chosen-container1 {
    width: 160px;
    position: static;
    
    /*
    top: 4.1818px;
    left: 24.455px;
    */
    
    text-align:center;
    /*position: relative;*/
    display: inline-block;
    vertical-align: middle;
    font-size: 14px;
    user-select: none;
 }
    select {
  /*Chrome和Firefox里面的边框是不一样的，所以复写了一下*/
  border: solid 0px #000;

  /*很关键：将默认的select选择框样式清除*/
  appearance:none;
  -moz-appearance:none;
  -webkit-appearance:none;

  /*在选择框的最右侧中间显示小箭头图片*/
  background: url("http://ourjs.github.io/static/2015/arrow.png") no-repeat scroll right center transparent;


  /*为下拉小箭头留出一点位置，避免被文字覆盖*/
  padding-right: 14px;

    font-size: 14px;
    width: 160px;
    opacity: 0.7;
    margin-top: 4px;
    font-family: Arial,Calibri,Tahoma, Verdana;
    cursor: pointer;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
    text-align:center;
}
  .mmz_div{
    left: 251px;
    top: 42px;
    text-align: center;
    width: 150px
  }
  
  .panel-ajax{
      height:345px !important;
  }
  
  #_alertValMsgDiv{
      z-index:12000 !important;
  }
	
    </style>
    <!-- 产品静态资源 -->

</head>

<body style="height:660px;">
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="42a2841ffed44962a32559a3737b3d3b" />
            </div>
            <div class="bd">
                <div id="hide_box" class="search-box" >
       							
        <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">					
                            
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                                         
		<bu:search viewId="42a2841ffed44962a32559a3737b3d3b" />

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage144b88b89cbf4e988bdac5f3d1fea6f6" id="formPage144b88b89cbf4e988bdac5f3d1fea6f6" value="${formPage144b88b89cbf4e988bdac5f3d1fea6f6}"/>
		<input type="hidden" name="formId" id="formId1" value='144b88b89cbf4e988bdac5f3d1fea6f6'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" id="addCode" name="addCode" value='null'/>
		<input type="hidden" id="addCodeVal" name="addCodeVal" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="144b88b89cbf4e988bdac5f3d1fea6f6">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax144b88b89cbf4e988bdac5f3d1fea6f6" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner144b88b89cbf4e988bdac5f3d1fea6f6">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable144b88b89cbf4e988bdac5f3d1fea6f6">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="144b88b89cbf4e988bdac5f3d1fea6f6" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_144b88b89cbf4e988bdac5f3d1fea6f6" onclick="_selectAjaxTableAllData(this,'144b88b89cbf4e988bdac5f3d1fea6f6')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="144b88b89cbf4e988bdac5f3d1fea6f6" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="ITEM_NAME" formId="144b88b89cbf4e988bdac5f3d1fea6f6" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="ITEM_SCORE" formId="144b88b89cbf4e988bdac5f3d1fea6f6" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" id="MMZ_TD"></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv144b88b89cbf4e988bdac5f3d1fea6f6" onscroll="ajaxTableScroll(this,'144b88b89cbf4e988bdac5f3d1fea6f6')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax144b88b89cbf4e988bdac5f3d1fea6f6">
		<tbody id="tbody_144b88b89cbf4e988bdac5f3d1fea6f6" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage144b88b89cbf4e988bdac5f3d1fea6f6==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=144b88b89cbf4e988bdac5f3d1fea6f6&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
	
	
	
	     
     <!--*测试自增DIV-->
    <div class="edit">
    <div class="bd" style="height:210px;">
    	<div id="backItem" class="dialog-mask" style="z-index:10000;"/></div>
		<div class="dialog dialog-s1 " id="addItem" style="display:none;z-index:11111;margin-left:0px;left:calc(50% - 265px);top:calc(50% - 150px);width:530px;height:180px;">
			<div class="dialog-hd" id="mmz_dialog-hd">
			<h3 class="tit" id="mmz_title">
			<dict:lang  value="新增" />
			</h3>
			</div>
				<a class="dialog-close" href="javascript:void(0);" onclick="hideDiv('addItem','backItem');"></a>
				<div class="dialog-bd-div" id="mmz_dialog-bd-div" style="width:100%;height:198Px;">
				
				
			   <div class="optn optn_div hd" style="width:517px;height:28Px;">
			             <div style="margin-left:10px;">
               
                  <div class="save-close" id="savelose"  onclick="saveClose(this)"></div>	
                <input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                  <div style="float:left" class="deptcss"><span class="dot">*</span><dict:lang value="组织机构"/> 
                  <select disabled class="dept_select IS_SELECT_FILTER" id="addfuncauth" ><option>--请选择--</option></select>
                  </div>	

                   	
          
                </div>
			            <button type="button"  id="mmz_btn" onclick="mmz_add(this)"><i class="ico ico-save"></i><dict:lang  value="保存"/></button>
			    	    <button type="button" onclick="hideDiv('addItem','backItem');"><i class="ico ico-cancel"></i><dict:lang value="取消"/></button>
				        
			        </div>	
			   
			
							
						<div  class="dialog-bd-div" id="mmz_dialog-bd-div" style="width:530px;height:148Px;padding-top:10px">       
            				 <table class="basic-table" style="margin-left:-70px;">
            	                 <tr style="width:64.2px;">
            			    		<td class="name" /><span class="dot">*</span><dict:lang value="项目名称"/></td>
            					<td  class="dec" style="width:310px" ><input type="text" id="MMZ_ITEM_NAME" name="MMZ_ITEM_NAME" class=" input isSubmit isaddSubmit" style="width:300px" /></td>
            			    	</tr>
            	                 <tr >
            			    		<td class="name" /><span class="dot">*</span><dict:lang value="最大分值"/></td>
            					<td  class="dec" style="width:310px"><input type="text" id="MMZ_ITEM_SCORE" name="MMZ_ITEM_SCORE" class=" input isSubmit isaddSubmit" style="width:300px" /></td>
            			    	</tr>
            	                <tr>
            			    		<td   class="name"	/><span class="dot">*</span><dict:lang value="所属部门"/></td>
            					  <td class="dec" style="width:310px" id="MMZ_ADD_TD"> 
            					  <!--选择部门-->
            					   </td>
            			    	</tr>
            			    </table>
			            </div>
            </div>
	</div>
	<script>
    	
    var dept_list={};//存储部门id  val, 名称信息 key
    var org_dept = "";
    //获得部门
	 $(function mmz_check(){//#F3
	        	
	       var dataAuth=$("#DATA_AUTH").val(); 
	       //&dept_id= +getCookie('mmz_garpe_dept_id')
           $.ajax({
            type: "POST",
            async:false,
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=c6b60f6b908142febb9689564b6c1407",
            data:{
                "dept_id":dataAuth
            },
            success: function(data){
                
              	$("#MMZ_TD").append('<select class="class="null dept_select"  id="mmz_select" name="GRAPE_DEPT_ID"  ></select>');
                $("#MMZ_ADD_TD").append('<select class="null dept_select" id="MMZ_DEPT_ID"  style="width:300px;margin-top:0px" name="GRAPE_DEPT_ID" onchange="getCode(this);" ></select>');
                
              //$("#CPI_GRAPE_DEPT_ID").html("");class="null dept_select"  id="MMZ_DEPT_ID"  
                //$("#mmz_select").append('<option value=""> &nbsp&nbsp&nbsp&nbsp&nbsp --所属部门--</option>');
             //$("#CPI_GRAPE_DEPT_ID").append('<option value="">--所属部门--</option>');
             if(null==data||undefined==data)return;
             if(null==data.ajaxPage||undefined==data.ajaxPage)return;
             if(null==data.ajaxPage.dataList||""==data.ajaxPage.dataList)return;
             $("#mmz_select").empty();
             $("#MMZ_DEPT_ID").empty();;
             for(var i=0;i<data.ajaxPage.dataList.length;i++){
                    		
                	var name = data.ajaxPage.dataList[i].NAME;
                	var id = data.ajaxPage.dataList[i].ID;
                    	//	if(i==1)org_dept=id;//初始显示的部门
                	dept_list[name] = id;
                $("#mmz_select").append('<option value="'+data.ajaxPage.dataList[i].ID+'">'+data.ajaxPage.dataList[i].NAME+'</option>');
               
             
            	}
            	for(var i=0;i<data.ajaxList.length;i++){
                	var name = data.ajaxList[i].NAME;
                	var id = data.ajaxList[i].ID;
                    	//	if(i==1)org_dept=id;//初始显示的部门
                	dept_list[name] = id;
                $("#MMZ_DEPT_ID").append('<option value="'+id+'">'+name+'</option>');
               
             
            	}
             
            	   	 $('#mmz_select').chosen();//获得框架默认样式
                     $('#MMZ_DEPT_ID').chosen();
                     $("#MMZ_DEPT_ID_chosen").css({"width":"300px","text-align":"center"});//设置宽度 居中
                     //$("#mmz_select_chosen").css({"":"center"});
                     $('#mmz_select_chosen').find("a").css({"background":"transparent","border":"0px"});//去背景
                     $('#MMZ_DEPT_ID_chosen').find("a").css({"background":"transparent"});
                     //$('#mmz_select_chosen').find("div[class='chosen-search']").attr("autocomplete","on");//自动加载,无用
                     //$('#MMZ_DEPT_ID_chosen').find("div[class='chosen-search']").attr("autocomplete","on");
                     $('#mmz_select_chosen').find("div[class='chosen-search']").css("display","inline");//强制让搜索框显示
                     $('#mmz_select_chosen').addClass("chosen-container1");//格式化选择框,解决select定位问题
                    console.log("aaaaaaaaaaa:"+data.ajaxPage.dataList[0].ID);
            	    $("#addCode").val(data.ajaxPage.dataList[0].ID);
            	//$("#mmz_select").attr("style","width:120px;");
            	
            	
                		
                        //select格式化后赋值f2
                        var span1 = $("#mmz_select_chosen").find('a span');										
                    	 span1.text(check_item_);
                        var span2 = $("#MMZ_DEPT_ID_chosen").find('a span');
                         span2.text(check_item_);                        
                    span1.bind('DOMNodeInserted',function(e){//新检索方式
                         if(lock)
                         select_dept(span1.text());
                    });
                     span2.bind('DOMNodeInserted',function(e){//新检索方式
                         if(lock)
                         select_dept(span2.text());
                    });
                    
                    
            },
            error: function(msg){
             utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
    }
);

function getCode(thisObj){
            
           $.ajax({
            type: "POST",
            async:false,
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=1dc5a034214c48aeaf2af6e7d5b5238b",
            data:{
                "ID":thisObj.value
            },
            success: function(data){
            		 console.log("value11:"+thisObj.value);
              $("#addCodeVal").val(data.ajaxMap.CODE);
              console.log("max11:"+data.ajaxMap.CODE);      
                    
            },
            error: function(msg){
             utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
    
    
    
}
function getCode1(id){
            			console.log("id::"+id);
           $.ajax({
            type: "POST",
            async:false,
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=1dc5a034214c48aeaf2af6e7d5b5238b",
            data:{
                "ID":id
            },
            success: function(data){
        
              $("#addCodeVal").val(data.ajaxMap.CODE);
                    
                    
            },
            error: function(msg){
             utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
    
    
    
}


function mmz_check1(){//#F3
	       	
	       var dataAuth=$("#DATA_AUTH").val(); 
	      
	       //&dept_id= +getCookie('mmz_garpe_dept_id')
           $.ajax({
            type: "POST",
            async:false,
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=c6b60f6b908142febb9689564b6c1407",
            data:{
                "dept_id":dataAuth
            },
            success: function(data){
        
               $("#mmz_select").empty();
               $("#MMZ_DEPT_ID").empty();
             if(null==data||undefined==data)return;
             if(null==data.ajaxPage||undefined==data.ajaxPage)return;
             if(null==data.ajaxPage.dataList||""==data.ajaxPage.dataList)return;
             for(var i=0;i<data.ajaxPage.dataList.length;i++){
             
                	var name = data.ajaxPage.dataList[i].NAME;
                	var id = data.ajaxPage.dataList[i].ID;
                    	//	if(i==1)org_dept=id;//初始显示的部门
                	dept_list[name] = id;
                $("#mmz_select").append('<option value="'+data.ajaxPage.dataList[i].ID+'">'+data.ajaxPage.dataList[i].NAME+'</option>');
                
             
            	}
            	for(var i=0;i<data.ajaxList.length;i++){
                	var name = data.ajaxList[i].NAME;
                	var id = data.ajaxList[i].ID;
                    	//	if(i==1)org_dept=id;//初始显示的部门
                	dept_list[name] = id;
                $("#MMZ_DEPT_ID").append('<option value="'+id+'">'+name+'</option>');
               
             
            	}
                    
            	   	  $('#mmz_select').chosen();//获得框架默认样式
                     $('#MMZ_DEPT_ID').chosen();
                     $("#MMZ_DEPT_ID_chosen").css({"width":"300px","text-align":"center"});//设置宽度 居中
                     //$("#mmz_select_chosen").css({"":"center"});
                     $('#mmz_select_chosen').find("a").css({"background":"transparent","border":"0px"});//去背景
                     $('#MMZ_DEPT_ID_chosen').find("a").css({"background":"transparent"});
                     //$('#mmz_select_chosen').find("div[class='chosen-search']").attr("autocomplete","on");//自动加载,无用
                     //$('#MMZ_DEPT_ID_chosen').find("div[class='chosen-search']").attr("autocomplete","on");
                     $('#mmz_select_chosen').find("div[class='chosen-search']").css("display","inline");//强制让搜索框显示
                     $('#mmz_select_chosen').addClass("chosen-container1");//格式化选择框,解决select定位问题
                     $("#mmz_select").val(data.ajaxPage.dataList[0].ID);
            	     $('#mmz_select').trigger("chosen:updated");
            	      $("#mmz_select_chosen").find('a span').text(data.ajaxPage.dataList[0].NAME);
            	      $('#MMZ_DEPT_ID').val(data.ajaxList[0].ID);
            	     $('#MMZ_DEPT_ID').trigger("chosen:updated");
            	     console.log("aaaaaaaaaaa:"+data.ajaxList[0].ID);
            	    $("#addCode").val(data.ajaxList[0].ID);
                		
                       //select格式化后赋值f2
                        var span1 = $("#mmz_select_chosen").find('a span');										
                    	 span1.text(check_item_);                    
                     span1.bind('DOMNodeInserted',function(e){//新检索方式
                         if(lock)
                         select_dept(span1.text());
                    });
                    
                    
            },
            error: function(msg){
             utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
    }

   // util.showLoading("123","5000");//读取图标
    var  i  =  $("#funForm").find("td").first().find("button").eq(3);
    i.css("display","none");
	</script>
	<div class="bd" style="height:500px;">
	</div>
	    </div>
	    </div>
    <!--新增结束-->
    <%--
    --%>
	
	<bu:script viewId="42a2841ffed44962a32559a3737b3d3b" />

    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>

		
<script>


function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,GRAPE_DEPT_ID\"}";
                    //var url = "/N2/buss/bussModel_listMsData.ms";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
                    if(isPage(formId)){
                        var isFirstLoad = firstLoadThisPage(formId);
                        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
                        var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    util.showLoading("处理中...");
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                            clearChildTable();
                        	util.closeLoading();
                        },
                        error: function(msg){
                        	util.closeLoading();
                            utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                        }
                    });
                }


    	//获取父页面body对象
	//var dom = window.parent.document.getElementsByTagName('body');
<%--生成异步表格--%>
var check_ = true;
var check_item_; 
var lock = true;					
var index = 0;
var item_list=[];//当前部门的项目数组
function createTableModel(ms,formId){
    
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    item_list.splice(0,item_list.length);//清空数组
    if(formId=='144b88b89cbf4e988bdac5f3d1fea6f6'){<%--考核项目--%>
        $.each(uiTxt,function(i,v){
            //调整select格式					
                       
                if(i==0)
				getMax(0,"mmz_null_id");//获取当前部门分数和


                 var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"'>"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'ITEM_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'ITEM_NAME')+"' "+ms.tdEvent(formId, 'ITEM_NAME')+">")
            arrHtml.push("<span colno='ITEM_NAME' class='"+ms.uiClass(formId, 'ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'ITEM_NAME')+"' "+ms.uiEvent(formId, 'ITEM_NAME')+" title='"+ms.titleAttr(formId,'ITEM_NAME','IS_TITLE_ATTR',v)+"'><input style='' type='text' id='ITEM_NAME_"+v.ID+"' name='ITEM_NAME_"+v.ID+"' class=' input isSubmit isaddSubmit mmz_input_style' style='width:300px;outline:medium;' value='"+v['ITEM_NAME']+"' onchange='itemRule(this)' onclick='saveorgitem(this)'  /></span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_SCORE' style='width:120px;text-align:center;' class='datagrid-cell "+ms.tdClass(formId, 'ITEM_SCORE')+"' style='"+ms.tdStyle(formId, 'ITEM_SCORE')+"' "+ms.tdEvent(formId, 'ITEM_SCORE')+">")
            arrHtml.push("<span colno='ITEM_SCORE' class='"+ms.uiClass(formId, 'ITEM_SCORE')+"' style='"+ms.uiStyle(formId, 'ITEM_SCORE')+"' "+ms.uiEvent(formId, 'ITEM_SCORE')+" title='"+ms.titleAttr(formId,'ITEM_SCORE','IS_TITLE_ATTR',v)+"' ><input onchange = 'checkScore(this.value,this)' data='"+v.ID+"' style='text-align:center;width:100px;' type='text' id='ITEM_SCORE_"+v.ID+"' name='ITEM_SCORE_"+v.ID+"' class=' input isSubmit isaddSubmit mmz_input_style' style='outline:medium;width:300px ' value='"+v['ITEM_SCORE']+"' /></span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='GRAPE_DEPT_ID' class='datagrid-cell "+ms.tdClass(formId, 'GRAPE_DEPT_ID')+"' style='width:120px;"+ms.tdStyle(formId, 'GRAPE_DEPT_ID')+"' "+ms.tdEvent(formId, 'GRAPE_DEPT_ID')+">")
            arrHtml.push("<span colno='GRAPE_DEPT_ID' class='"+ms.uiClass(formId, 'GRAPE_DEPT_ID')+"' style='"+ms.uiStyle(formId, 'GRAPE_DEPT_ID')+"' "+ms.uiEvent(formId, 'GRAPE_DEPT_ID')+" title='"+ms.titleAttr(formId,'GRAPE_DEPT_ID','IS_TITLE_ATTR',v)+"' >"+v['GRAPE_DEPT_ID']+"</span>")
            arrHtml.push("<input type='hidden' id='GRAPE_DEPT_ID"+v['ID']+"' value='"+uiRaw[i].GRAPE_DEPT_ID+"' /></td>");
            arrHtml.push("</tr>")
            item_list.push(v['ITEM_NAME']);
      });
      
      
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));

    }
    setOrgList()//保存初始分数
    scoreCore =0;//切换部门时候 重置值差
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll();    
    check_ = false;
   // mmz_check1();
}
$(function(){
	  
	    setDataAuth();
	   
	})
function setDataAuth(){
    		    $.ajax({
		        type:"post",
		        dataType:"json",
		        data:"",
		        url:"${path}buss/bussModel_exeFunc.ms?funcMId=47ef403e2fb04c2cbdb40754b90e9f80",
		        success: function(data){
		            var list = data.ajaxList;
		            $("#addfuncauth").empty();
		            $("#addfuncauth").append("<option value='"+list[0].ID+"'>"+list[0].NAME+"</option>");
		            $("#addfuncauth").trigger("chosen:updated");
		            $("#editfuncauth").empty();
		            $("#editfuncauth").append("<option value='"+list[0].ID+"'>"+list[0].NAME+"</option>");
		            $("#editfuncauth").trigger("chosen:updated");		            
		        },
		        error:function(msg){
		            
		        }
		        })
}
	
</script>
 <script>
function ajaxEdit(){

   // -  -  var selCount = getNewSelectedCount();
   v_modify1();
}


var item_val;//查询部门f1
function select_dept(obj){
    if(check_)return;//初次执行createTableModel初始化信息时候:select值的变化不触发检索
    lock=false;
    var dept = $("#GRAPE_DEPT_ID");
    //存储当前选择的dept到cookie
    setCookie("mmz_garpe_dept_id",dept_list[obj]);
    dept.val("");
      $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=f86ec031e2fd4271bea6ebde709bb77d&model=show_me&show="+dept_list[obj],
            data:"",

            success: function(data){
         
                 //  query(dept[0]);//触发检索
              //  $("#mmz_select_chosen").find('a span').text(obj);
             //   $("#MMZ_DEPT_ID_chosen").find('a span').text(obj)
                    //var global = parent.$("#mmz_var_global");//记忆每一次查询部门,添加修改时页面会刷新,刷新时候取当前存储的部门来显示
                    //if(null!==global&&undefined!=global) 
    					//global.text(obj);
    
                getMax(0,"mmz_null_id");//获取当前部门最大值
                window.setTimeout(function(){lock=true;},200);	
                
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
    
   
}



//阻止事件向上冒泡
$("#datagrid-btable-ajax144b88b89cbf4e988bdac5f3d1fea6f6").on('click','tr td input',function(e){
     e.stopPropagation(); 
})
//点击时候切换格式 实现input选中/取消
$("#datagrid-btable-ajax144b88b89cbf4e988bdac5f3d1fea6f6").on('click','tr',function(e){
     $(this).toggleClass("datagrid-row tr-hover-flag datagrid-selected");
})

//显示div增修窗口
function popItemDiv(showId,backId){
            v_modify1();//新增时候自动先保存一次
            getCode1($("#addCode").val());
            $("#itemCode").val("");
		    $("#"+showId+",#"+backId).show();
			
}
function hideDiv(showId,backId){
            $("#MMZ_ITEM_NAME").val("");
            $("#MMZ_ITEM_SCORE").val("");
			$("#"+showId+",#"+backId).hide(); 
			closeDivFp(showId+"pop");
}


///添加
function v_add(){
  popItemDiv('addItem','backItem');
    
}

var saveAndClose = true;
	    var	 saveose="0"; 
		function saveClose(self){
		 
			if(saveAndClose == true){
			   
				$(self).addClass('save-not-close');
				$(self).attr("title","?开启保存并关闭窗口");
				saveAndClose = false;
				$('#isCloseWin').attr('checked',false);
			    $('#isCloseWin').val("1");
			    
			    saveose="1"; 
			 
			}
			else if(saveAndClose == false){
			   
				$(self).removeClass('save-not-close');
				$(self).attr("title","?关闭保存并关闭窗口");
				saveAndClose = true;
				$('#isCloseWin').attr('checked',true);
				$('#isCloseWin').val("0");
			
                saveose="0";
              
			}
		}
var scinx =0; //新增保存时候 改变其值 合并作为 checkscore的一个项目

   //新增       
   var mmz_addable = true;
    function mmz_add(obj){//ID ITEM_SCORE=$("#MMZ_LEVEL_SCORE")  ITEM_NAME=$("#MMZ_LEVEL_NAME")  GRAPE_DEPT_ID = $("#MMZ_DEPT_ID").val()  
        
        if(!mmz_addable)return;//判断是否触发保存
        var j = {};//MMZ_ITEM_SCORE  MMZ_ITEM_NAME  
        //j.GRAPE_DEPT_ID  = $("#MMZ_DEPT_ID").val();
        var GRAPE_DEPT_ID = dept_list[$("#MMZ_DEPT_ID_chosen").find('a span').text()]; 
        console.log("GRAPE_DEPT_ID：：："+GRAPE_DEPT_ID);
        var ITEM_SCORE = $("#MMZ_ITEM_SCORE").val();
        var ITEM_NAME = $("#MMZ_ITEM_NAME").val();
     
        scinx = ITEM_SCORE;//判断总分附加项目
        if(!checkScore2(ITEM_SCORE,$("#MMZ_ITEM_SCORE"))){
            return false;
        }
        if(!checkName(ITEM_NAME,$("#MMZ_ITEM_NAME"))){
            return false;
        }
          var newname = $("#MMZ_ITEM_NAME").val();
         if (item_list.indexOf(newname)!=-1){
            _alertValMsg($("#MMZ_ITEM_NAME")[0],"项目名称重复");
            return false;
         }
        mmz_addable = false;//保存中禁止保存操作
        
        scinx =0;
        var model = "add"; 
        	
    
           $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=f86ec031e2fd4271bea6ebde709bb77d",
            data:{
                "GRAPE_DEPT_ID":GRAPE_DEPT_ID,
                "ITEM_SCORE":ITEM_SCORE,
                "ITEM_NAME":ITEM_NAME,
                "model":model
                
            },
            success: function(data){
             var error = data.ajaxMap.returnMsg;
             if(error=="addSucc"){
        	 msgPop('保存成功',"",'提示',200,150,3000,5000);
        	 if(saveose=="0"){
    			  hideDiv('addItem','backItem');
    			}
             //window.location.reload(true);          
             query("formId1");
             }else{
                 utilsFp.confirmIcon(3,"","","", "error:"+error,0,"300","");
             }
           
            
            },
            error: function(msg){
               
                utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
                
            }
        });
        mmz_addable = true;
        $("#MMZ_ITEM_NAME").val("");
        $("#MMZ_ITEM_SCORE").val("");
    }		
 
 
 
 //修改
   var isfirst = true;
   function  v_modify1(){

        if(!ifsave && !isfirst)  return;//判断是否触发保存
        //utilsFp.confirmIcon(2,"","","", "总分应小于100",0,"300","");
 
        var data = {};
        var list = [];
        data.model="modify";
        data.GRAPE_DEPT_ID = $("#mmz_select").val();
       // var model="modify";
        //var GRAPE_DEPT_ID = $("#mmz_select").val();
       // data.list = list;
        $("#tbody_144b88b89cbf4e988bdac5f3d1fea6f6").find("tr").each(function(i,obj){
          
            //list.push({});
            var k1;
            var k2;
            var k3;
            var k4;
            $(obj).find("input").each(function(k,obj1){//获取每行项目信息
                        
              if(k==1){
              k1 =$(obj1).val();
              }
              if(k==3){
              k2 =$(obj1).val();   
              }
              if(k==4){
              k3 =$(obj1).val();   
              }
              if(k==5){
               k4 =$(obj1).val();   
              }
             
              // list.push({"item_id":k1,"item_score":k2,"remark":k3});
       
            });
            //插入信息到list中
             if(k1!=undefined||k2!=undefined||k3!=undefined||k4!=undefined)
             list.push({"ID":k1,"ITEM_SCORE":k3,"ITEM_NAME":k2,"DEPT_NAME":k4});

        });
        console.log(list);
        if(list.length<1)return;
  
        list=JSON.stringify(list);//格式转化为字符串
        data.list = list;
    
        //modify(data);
    }
 
  function query(thisObj){
                    var formId = $("#formId1").val();
                  // if( getDealSearchMultiTimeSlotBtn())
                  try{chkMsSaveMarkUtils.saveConfig();}catch(err){}
                     listAjaxTable(formId);
                    
                     //listAjaxTable_print(formId);
                }

 
 
 
 function modify(date){
      isfirst = false;
      $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=f86ec031e2fd4271bea6ebde709bb77d",
            data: date,
         success: function(data){
        		 msgPop('修改成功',"",'提示',200,150,3000,5000);
        	 ifsave= false;
           
           
            },
            error: function(msg){				
                clickmore =true;
           
                utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
        }
$("#DATA_AUTH").change(function(e)
{
    var dataAuthId = e.target.value; // 获取选中下拉框的值
    console.log("dataAuthId:"+dataAuthId);
    getDataAuthVal(dataAuthId)
         
});
function getDataAuthVal(dataAuthId){
      isfirst = false;
      $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=a132a70f43a74999b6ac970f34822a67",
            data: {
                "dataAuthId":dataAuthId
            },
         success: function(data){
              $("#mmz_select").empty();
             if(null==data||undefined==data)return;
           
             if(null==data.ajaxList||""==data.ajaxList)return;
             for(var i=0;i<data.ajaxList.length;i++){
             
                	var name = data.ajaxList[i].NAME;
                	var id = data.ajaxList[i].ID;
                    	//	if(i==1)org_dept=id;//初始显示的部门
                	dept_list[name] = id;
                $("#mmz_select").append('<option value="'+data.ajaxList[i].ID+'">'+data.ajaxList[i].NAME+'</option>');
                
             
            	}
            	$('#mmz_select').chosen();//获得框架默认样式
                $('#mmz_select_chosen').find("a").css({"background":"transparent","border":"0px"});//去背景
                $('#mmz_select_chosen').find("div[class='chosen-search']").css("display","inline");//强制让搜索框显示
                $('#mmz_select_chosen').addClass("chosen-container1");//格式化选择框,解决select定位问题
                $("#mmz_select").val(data.ajaxList[0].ID);
            	  $('#mmz_select').trigger("chosen:updated");
            	     
            	       var span1 = $("#mmz_select_chosen").find('a span');										
                    	 span1.text(check_item_);
                                            
                    span1.bind('DOMNodeInserted',function(e){//新检索方式
                         if(lock)
                         select_dept(span1.text());
                    });
                   
         },
            error: function(msg){				
                clickmore =true;
           
                utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
        }




var max =0;
 function getMax(val,id){
    var m =0;
    var dept_id ;
    if(undefined==id||null==id){
        id="";
    }

    
     var inx = $("#mmz_select_chosen").find('a span').text();
     dept_id = dept_list[inx];
    $.ajax({
            type: "POST",
            dataType: "json",
            async:false,
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=f86ec031e2fd4271bea6ebde709bb77d&model=checkScore",
            data:{"score":val,"dept_id":dept_id,"id":id},
            success: function(data){
       
              m = data.ajaxMap.toatal; 
            },
            error: function(msg){
           
                utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
/*     $("#datagrid-btable-ajax144b88b89cbf4e988bdac5f3d1fea6f6").find("tr").each(function(i,obj){//原遍历页面取值 ，不适合评分项目超过分页数目时候
            
            $(obj).find("input").each(function(k,obj1){
                     
              if(k==3){
                 m= parseInt($(obj1).val())+m; 
                 
                }
                  
              });

        });
  */
  
     max =m;
  
    return m; 
 }
 
 //获得当前页分值原始列
  var orgList = [];
 function setOrgList(){//页面初始时候更新
   $("#datagrid-btable-ajax144b88b89cbf4e988bdac5f3d1fea6f6").find("tr").each(function(i,obj){//原遍历页面取值 ，不适合评分项目超过分页数目时候
            
            $(obj).find("input").each(function(k,obj1){
                
              if(k==3){
                 orgList[obj1.id]= obj1.value; 
                 
                }
                  
              });

        });   
 }

 //验证
function checkName(tempVal,obj){//  /^[0-9a-zA-Z\u4e00-\u9fa5_]{3,16}$/.test("add123百度true")
	if(!(/^[0-9a-zA-Z\u4e00-\u9fa5_]{2,16}$/.test( tempVal ))){
	obj =$("#MMZ_ITEM_NAME");
	//_alertValMsg(obj,"该项必须为小于100的正整数");
	_alertValMsg(obj,"输入2到16位合法字符");
	   
		return false;  
	}
	return true; 
}

var ifsave =false;//保存控制开关
var scoreCore = 0;//分数参变量（值差）--每次分数变化参变分数随之，它与一起 来计算当前可变化分值范围。
function checkScore(tempVal,obj){
      
    	var val = tempVal;
	if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal < 0|| tempVal>100){
		obj.value=orgList[obj.id];
		_alertValMsg(obj,"该项必须为小于100的正整数");
		return false;  
	}else{
	var s = parseInt(max) - parseInt(orgList[obj.id]) + parseInt(tempVal) +scoreCore;
	var title =s-100;

	//var k = parseInt(tempVal) + s;

	if( s> 100){
	  obj.value=orgList[obj.id];
	 
	    _alertValMsg(obj,"总分最大限制100分，超出:"+title);
	    return false;
	    }
	}
	
	 scoreCore = scoreCore + parseInt(tempVal) - parseInt(orgList[obj.id]) ;//获得值差
	  orgList[obj.id] = tempVal;
	ifsave = true;
	
	return true; 
}

function checkScore1(tempVal,obj){
	if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal < 0|| tempVal>100){
		_alertValMsg(obj,"该项必须为小于100的正整数");
		return false;  
	}else{
	var s= 0;
	   	console.log("max:"+max);
	  s = max +parseInt(tempVal) +scoreCore;;
	var title =s-100;

	//var k = parseInt(tempVal) + s;

	if( s> 100){
	
	    _alertValMsg(obj,"总分最大限制100分，超出:"+title);
	    return false;
	    }
	}
	return true; 
}


function checkScore2(tempVal,obj){
	if(!(/^(\+|-)?\d+$/.test( tempVal )) || tempVal < 0|| tempVal>100){

		_alertValMsg(obj,"该项必须为小于100的正整数");
		//_alertValMsg(obj,"<dict:lang value="该项必须为小于100的正整数" />");
		return false;  
	}else{
	var s= 0;
	   	console.log("max:"+$("#addCodeVal").val());
	   	var num =$("#addCodeVal").val() ;
	  s = parseInt(num)+parseInt(tempVal) +scoreCore;;
	var title =s-100;

	//var k = parseInt(tempVal) + s;

	if( s> 100){
	    _alertValMsg(obj,"总分最大限制100分，超出:"+title);
	   // _alertValMsg(obj,"<dict:lang value="总分最大限制100分" />");
	    return false;
	    }
	}
	return true; 
}




//删除项目--修改状态
function change_status(){
         var list = "";
         var i =true;
         $(":checkbox ").each(function(){
            if(this.checked==true&&this.id!='selectAll_144b88b89cbf4e988bdac5f3d1fea6f6'){
            if(i){
             list+=(this.value);
            item_list.splice($.inArray($("#ITEM_NAME_"+this.value).val(),item_list),1);
            scoreCore-=parseInt($(this).parent().parent().next().next().find('input')[0].value);
             i=false;
            }else
            {
                list+=","+(this.value);
                item_list.splice($.inArray($("#ITEM_NAME_"+this.value).val(),item_list),1);
            }
            }
             
         });
        // return;
         var j = {};
         j.model='change_status';
         j.model="chang_status";
         j.list = list;
    $.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=f86ec031e2fd4271bea6ebde709bb77d",
            data:j,
            success: function(data){
           //手动删除列表
             $(":checkbox ").each(function(){
            if(this.checked==true){
                this.checked=false;
                $(this).parents("tr").not($('#datagrid-title-ajax')[0]).remove();
            }
         });
         
             msgPop('删除成功',"",'提示',200,150,3000,5000);
                
            },
            error: function(msg){
             utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
              
            }
        });

};



//景峰兄的设计COOKIE方法
/*获取cookie*/
function getCookie(name) {
    var bikky = document.cookie;
    name += "=";
    var i = 0;
    while (i < bikky.length) {
        var offset = i + name.length;
        if (bikky.substring(i, offset) == name) {
            var endstr = bikky.indexOf(";", offset);
            if (endstr == -1) endstr = bikky.length;
            return unescape(bikky.substring(offset, endstr))
        }
        i = bikky.indexOf(" ", i) + 1;
        if (i == 0) break
    }
    return null
}

//设置Cookoe

function setCookie(name, value,key,expTime) {
    var Days = 7;
    if (expTime == undefined) {
        expTime = Days * 24 * 60 * 60 * 1000;
    }

    var exp = new Date();
    exp.setTime(exp.getTime() + expTime);
    if (key == null || key == "") {
        document.cookie = name + "=" + escape(value) + "; expires=" + exp.toGMTString() + "; path=/"
    } else {
        var nameValue = getCookie(name);
        if (nameValue == "") {
            document.cookie = name + "=" + key + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/"
        } else {
            var keyValue = getCookie(name, key);
            if (keyValue != "") {
                nameValue = nameValue.replace(key + "=" + keyValue, key + "=" + escape(value));
                document.cookie = name + "=" + nameValue + ";expires=" + exp.toGMTString() + ";path=/"
            } else {
                document.cookie = name + "=" + nameValue + "&" + key + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";path=/"
            }
        }
    }
}


　
　var orgitem = "";
　function saveorgitem(obj){
　  orgitem = $(obj).val()
　}
 //验证项目名称
function itemRule(obj){//  /^[0-9a-zA-Z\u4e00-\u9fa5_]{3,16}$/.test("add123百度true")

	if(!(/^[0-9a-zA-Z\u4e00-\u9fa5_]{2,16}$/.test( obj.value ))){
	    _alertValMsg(obj,"输入2到16位合法字符");
	       $(obj).val(orgitem);     
		return false;  
	}else if(item_list.indexOf(obj.value)!=-1){
	    _alertValMsg(obj,"项目名称不可重复");
	    $(obj).val(orgitem);     
	    return false;
	}
    item_list.splice($.inArray(orgitem,item_list),1);
    item_list.push(obj.value);
    ifsave=true;//触发新增时候保存修改
	return true; 
}

/*改变搜索框原格式
$("#GRAPE_DEPT_ID").attr("onchange","query(this)");
var search_dec = $(".search_table").find(".dec");
    	search_dec.css({ 
    	"left": "251px",
        "top": "42px",
        "text-align": "center",
        "width": "150px"});
*/
        
//div拖动
 $( "#addItem" ).draggable({ handle: '#mmz_dialog-hd'});

 </script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>

 <!-- 页面结束 -->
<%--
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>

<%@ include file="/plf/common/pub_end.jsp"%>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
 --%>


 
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
</script>
	 <script>(function($){
  $(window).on('load',function(){
    setPopScroll('.datagrid-body','.datagrid-header-inner');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
 
 

 
 
