  var ExportMaxNum=100000;
  $(function(){ 
	  //sys/excel/ExcelAction_ExportPage.ms
	  initExcelExportNum(); 
  });
  
  function initExcelExportNum(){
	  $("#excelExportNum").keydown(
			    function(e){
			      var code=parseInt(e.keyCode)
			      
			      if(code>=96 && code <=105 
			    	|| code>=48 && code<=57
			    	||code==8
			    	 ||code==0)return true
			      else return false;
			    }
			  );
	 $("#excelExportNum").bind("input propertychange",function(){
			        if(isNaN(parseFloat($(this).val()))||parseFloat($(this).val())<=0)
			         //$(this).val(1)
			         $(this).val();
			     } 
			  ); 
	  
  }// function inidata(){
  
  function ExeclExportStep02Data(){
	    var iframeId=$("#iframeId").val();
	    var pifrWin;
		try {
			pifrWin =$(window.parent.document).contents().find("#"+iframeId)[0].contentWindow;
		}
		catch(err) {
			pifrWin =window.parent;
		}
	    var pifrDoc=pifrWin.document; 
	    var formId = $("#formId1",pifrDoc ).val(); 
	    var isFirstLoad = 0;
	    var currentPage =0;
	    var pageRecord =  0; 
	    var totalRecord=0;
	    var synMark=true;
	   try{ 
		    if(pifrWin.isPage(formId)){
		          isFirstLoad = pifrWin.firstLoadThisPage(formId);
		          currentPage = isFirstLoad? 1 : pifrWin._GLO_FORM_PAGE_MAP[formId].currentPage;
		          pageRecord =  isFirstLoad? 20 : pifrWin._GLO_FORM_PAGE_MAP[formId].pageRecord;
		     }
		    totalRecord= pifrWin._GLO_FORM_PAGE_MAP[formId ].totalRecord;
	    }catch(err){synMark=false;
	       formId=$("input[type=hidden][name='formId']",pifrDoc ).val();  
	       currentPage= $("#page-num",pifrDoc ).val();
	       pageRecord =  $("select[name='dept']",pifrDoc ).val();
	       totalRecord=  $(".count",pifrDoc ).text();  
	    }
	  //<span class="count"> 356976 </span>
	    //"/plf/page/fp/paginationPopMultAx.jsp
	   if($("input[name='radioExcelExportMark']:checked").val()=="20")
         if(totalRecord>=$("#controlExportMaxNum").val()){ 
    	     utilsFp.alert($("#infoExportMaxNum").val()+ExportMaxNum)  ;
    	     getSQL();
	         return ;
         }
	  
      if($("#excelExportNum").val()>60000){ 
        utilsFp.alert($("#info60000").val())  ;
        return false;
      }
      if($("#excelExportNum").val()<1000){         
          utilsFp.alert($("#info1000").val())  ;
          return false;
        }     
      //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
      var url = util.getContextPath()+"/buss/bussModel_ExeclExport.ms";
      var searchParams =$("#searchForm",pifrDoc).serialize()+"&"+$("#searchFormTop",pifrDoc).serialize();
     
     
      //exeid=74c9de6e1fb2492eb0a74cdf8e24e51b&searchParaShowState=&
      //DATA_AUTH=&searchParaList%5B0%5D._PAGE_SEARCH_VALUE=ss&searchParaList%5B0%5D.ID=6e3a6fcd82224d379cb017728696e0ff&sortColMap.sortCol=&sortColMap.sortColOrder=&
     
      searchParams=  pramNullDeal(searchParams);
  //    util.showLoading(searchParams);
       
      url+="?excelExportNum="+$("#excelExportNum").val()
      +"&ExportMark="+$("#ExportMark").val()
     +"&ExcelExportFileExt="+$("#ExcelExportFileExt").val()
     +"&radioExcelExportMark="+$("input[name='radioExcelExportMark']:checked").val()
      +searchParams;//+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord;
     if(synMark)
    	 url+= "&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord;
      //utilsFp.alert(url);
     
     	//错误日志查看按钮
        if(document.getElementById("export_err_but")==null){
        	$("#export_but_div").append("<input type='button' id='export_err_but' value='错误日志' onclick='getexeclexport_errinfo();' >");
        }
        
      //  window.location.href=url;
       //更改form的action  
    //   $("#submitForm").attr("action", url);  
      // $("#submitForm").submit();  
     // $("#ifrExcel").attr("src",url);
     // $("#ifrExcel" ).load(
    	// function(){ 
    	//	 parent. closePopWinFp('popupFrameFpIdpop');
    	// }	  
     // );
      
        var util_parent = parent.util?parent.util:util;
        util_parent.showLoading("处理中...");

	    $("#ifrExcel").attr("src",url);
       
     
       var finishfun = function()
       {
    	   util_parent.closeLoading();
       };
       var busyfun = function()
       { 
    	   setTimeout(function(){FindExeclExportStatus(finishfun,busyfun);},2000);
       };
      
       setTimeout( busyfun,2000);
  }//  function ExeclExportStep02Data(){
  function FindExeclExportStatus(finishfun,busyfun)
  {
	  var url_findstatus = util.getContextPath()+"/buss/bussModel_FindExeclExportStatus.ms";
	  var isfinish = false;
	  $.ajax({ 
	        url:url_findstatus,
	        async: true,  
	        success:function (res) {	
	        	if(res=="ok")
	        	{
	        		isfinish = true; 
	        		if(finishfun)
	        			finishfun();
	        		 
	        	}
	        	if(!isfinish)
	        	{
	        		if(busyfun)
	        			busyfun();
	        	}
	        		 
	        },
	        error:function (res) 
	        {
	        	if(!isfinish)
	        	{
	        		if(busyfun)
	        			busyfun();
	        	} 
	        } 
	   });
  }
  function pramNullDeal(searchParamsUrl){
	var retUrl="";
	var ArrUrl=searchParamsUrl.split("&");
	var tmpStr="";
	var arrTmpStr;
	for (var i=0;i<ArrUrl.length;i++){
		tmpStr=ArrUrl[i];
		arrTmpStr=tmpStr.split("=");
		var arrTmpStr1 = arrTmpStr[1];
		//参考commCode.jsp 修改 对DATA_AUTH字段处理
		if("DATA_AUTH" == arrTmpStr[0])
			retUrl+="&DATA_AUTH="+arrTmpStr1;
		else if(arrTmpStr1!="" || arrTmpStr[0].indexOf("%5D._PAGE_SEARCH_VALUE")>1){
			if(arrTmpStr[0].indexOf("_PAGE_SEARCH_VALUE_CN")>1&&arrTmpStr1){
				arrTmpStr1=_mcBase64JsToJava.getMcDealBase64Encode(decodeURIComponent(arrTmpStr1)); 
			}
			retUrl+="&"+arrTmpStr[0]+"="+ arrTmpStr1;
		}
	}//ArrUrl
	
	return retUrl;
  }//function pramNullDeal(searchParamsUrl){
 function getSQL(){
	  var url = util.getContextPath()+"/buss/bussModel_ExportSQL.ms"
     $.post(url,{"exeid":$("#exeid").val()},
       function (data){
    	 $("#textareaShowSQL").val("\n  "+data.sql);
    	 $("#divShowSQL").show();
       }//  function (data){
     );
 }
 $( function(){ 
	 $("#btnExeclExport").click(
			 function(){ 
				 var busyfun=function(res)
				 {
					 alert("导出任务进行中,请稍后重试!");
				 };
				 FindExeclExportStatus(ExeclExportStep02Data,busyfun); 
			 }
	 
	 )
  }
 );
 
 function getexeclexport_errinfo(){
	 $.ajax({
	        url:util.getContextPath()+'/buss/bussModel_getexeclexport_errinfo.ms',
	        success:function (res) {
	        	 var execlexport_errinfo=res.ajaxMap.EXECLEXPORT_ERRINFO;
	        	 if(execlexport_errinfo==null || execlexport_errinfo==''){
	        		 $("#errinfo_div").html('无异常日志...');
	        		 showDivFp(300, 200, '', '导出错误日志查看', 'errinfo_div'); 
	        		 
	        	 }else{
	        		 $("#errinfo_div").html(execlexport_errinfo);
	        		 showDivFp(1100, 550, '', '导出错误日志查看', 'errinfo_div'); 
	        	 }

	           	 //overflow: auto;word-break: break-all;padding: 10px 20px;box-sizing: border-box;"
	           	 $("#showdivfpid").css("overflow","auto");
	           	 $("#showdivfpid").css("word-break","break-all");
	           	 $("#showdivfpid").css("padding","20px 30px");
	           	 $("#showdivfpid").css("box-sizing","border-box");
	           	 
	           	 _newScroll("showdivfpid");//美化滚动条
	           	 setPopScroll("#showdivfpid");
	            
	        }
	 })
 }
  