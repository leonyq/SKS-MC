<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
  
	
	<!-- 产品静态资源 -->
<!-- 自定义格式

-->    	



<style type="text/css">
 
 /*切换月份按键格式*/

 /*圆格式*/			
#grape .line{
    width: 100%;
    text-align: center;
}
	
.circle{ 
   width: 40px;
    height: 40px;
    border: 1px solid #aace36;
    display: inline-block;
    box-sizing:border-box; 
    text-align: center;
    line-height: 40px;
    margin: 0 1px;
    border-radius: 50%;
    -moz-border-radius: 50%; 
    -webkit-border-radius: 50%;
    cursor: pointer;
}

.circle:hover{ 
    background-color:#aace36;
    color:#fff;
}


#listTable tr:nth-of-type(2n){
    background-color: #f0f4fd;
    
}
    

 
#listTable input{
    width: 100%;
    border: none;
    background-color: transparent;
}
 
 td input{
    text-overflow:ellipsis;
 }

.pre{
    display:inline-block;
    background-image:url(${path}/plf/page/fp/img/paging_syy2.png);
    width:10px;
    height:20px;
    vertical-align: middle;
    margin-right:10px;
}

.next{
    display:inline-block;
    background-image:url(${path}/plf/page/fp/img/paging_xyy2.png);
    width:10px;
    height:20px; 	
    vertical-align: middle;
    margin-left:10px;
}

.cutMonth{
    position:absolute;
    top:68px;
    right:50px;
    width:280px;
    text-align:center;
    
}

#thistime{
    font-size:14px;
    color:#333;
    display: inline-block;
    height: 20px;
    line-height: 20px;
}

.leaf{
    position:absolute;
    
    top:100px;
    text-align:center;
    right: 50px;
    width: 280px;
}

.leaf span{
    display:inline-block;
    background-image:url(${path}/plf/page/fp/img/leaf.png);
    width:70px;
    height:38px;
}

	</style>
</head>

<body>

<!--<img  src="${path}/plf/page/fp/img/ico-save.png"/>-->
  
     
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" target="submitFrame" <bu:formet exeid="%{exeid}" />>
 					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
            
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
      
                </div>
			    <div class="optn" style="top:5px;">
			        <button type="button" id="mmz_save" onclick="mmz_add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
            
     
		
			<div class="bd">
	    			

		<bu:set name="paraMapObj" value="${dataId}" formId="fb66f7fc8c2f4978a861483d64b52ed2" type="add" />
	
        
	<table style="width:340px;"   class="basic-table"  >
	<input type="hidden" name="formIds" value="fb66f7fc8c2f4978a861483d64b52ed2" />
	<input type="hidden" name="fb66f7fc8c2f4978a861483d64b52ed2" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'321ba5b0dc574a4fa6036f945a2d852c'" />
		<s:set name="_$formId_1" value="'fb66f7fc8c2f4978a861483d64b52ed2'" />
		<s:set name="_$type" value="'add'" />
				
		<tr style="height: 50px;">
			<td  class="name" /><span class="dot">*</span><bu:uitn colNo="LOGIN_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" /></td>
			<bu:td  cssClass="dec" colNo="LOGIN_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" >
			<bu:ui  colNo="LOGIN_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" value="%{LOGIN_NAME}" formIndex="1" style="width:280px;"/></bu:td>
		</tr>
		<tr style="height: 50px;">
			<td class="name" /><bu:uitn colNo="USER_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" /></td>
			<bu:td cssClass="dec" colNo="USER_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" >
			<bu:ui colNo="USER_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" readonly="readonly" value="%{USER_NAME}" formIndex="1" style="width:280px;"/></bu:td>
		</tr>
		<tr style="height: 50px;">
			<td class="name" /><span>判定人员<span></td>
			<bu:td cssClass="dec" colNo="HEADMAN_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" value="1222" >
			<bu:ui colNo="HEADMAN_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" readonly="readonly"  formIndex="1" style="width:280px;"/></bu:td>
		</tr>
		
		<tr style="display:none">
			<td class="name" /><bu:uitn colNo="DEPT_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" /></td>
			<bu:td cssClass="dec" colNo="DEPT_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" ><bu:ui colNo="DEPT_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" value="%{DEPT_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr style="display:none">
			<td class="name" /><bu:uitn colNo="M_TOTAL_SCORE" formId="fb66f7fc8c2f4978a861483d64b52ed2" /></td>
			<bu:td cssClass="dec" colNo="M_TOTAL_SCORE" formId="fb66f7fc8c2f4978a861483d64b52ed2" ><bu:ui colNo="M_TOTAL_SCORE" formId="fb66f7fc8c2f4978a861483d64b52ed2" value="%{M_TOTAL_SCORE}" formIndex="1" /></bu:td>
		</tr >
		<tr style="display:none">
			<td class="name" /><bu:uitn colNo="ID" formId="fb66f7fc8c2f4978a861483d64b52ed2" /></td>
			<bu:td cssClass="dec" colNo="ID" formId="fb66f7fc8c2f4978a861483d64b52ed2" ><bu:ui colNo="ID" formId="fb66f7fc8c2f4978a861483d64b52ed2" value="%{ID}" formIndex="1" /></bu:td>
		</tr>
		<tr style="display:none">
			<td class="name" /><bu:uitn colNo="DEPT_ID" formId="fb66f7fc8c2f4978a861483d64b52ed2" /></td>
			<bu:td cssClass="dec" colNo="DEPT_ID" formId="fb66f7fc8c2f4978a861483d64b52ed2" ><bu:ui colNo="DEPT_ID" formId="fb66f7fc8c2f4978a861483d64b52ed2" value="%{DEPT_ID}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="fb66f7fc8c2f4978a861483d64b52ed2" formIndex="1" />
			    <div style="width:340px;height:260px;background-color:#FFF">
                	<!-- 					项目展示DIV					   -->
                    <span id = "searchtime" style="font-weight:bold;font-size:18px;color:#aace36;"></span>
                    <table class="dlist-table" style="width: 100%;table-layout: fixed;border:1px solid #eaeaea;background-color: #e6eaf4;color:#666;">
                        <tr id="e3bfbaf6c00b4d73b7c52f87d0e1e27a">
                            <td style="width:180px;text-align:center;">考核项目</td>
                            <td style="width:50px;text-align:center;">分数</td>
                            <td style="text-align:center;">备注</td>
                        </tr>
                    </table>   
                    <div class="scroll" style="height:180px;overflow:auto;">
                        <table id="listTable" class="dlist-table" style="width: 100%; table-layout: fixed;border:1px solid #eaeaea;">	
    	                    <tbody id="mmz_tbody001">
                                
                           
                            </tbody>
                        </table>
                    </div>
            	</div>
					<!-- 日期切换按键，图标-->
				<div class="cutMonth">
    			    <span class="pre" id="mmz_img1" onclick="premonth(this)" ></span>
    			    <span id ="thistime"></span>
                    <span class="next" id="mmz_img2" onclick="nextmonth(this)"><span>
                </div>
                <div class="leaf"><span></span></div>
				<!--葡萄图显示DIV-->
                <div id="grape" style="position:absolute;right:50px;top:140px;width:280px;background-color:#FFF;">
                    	
                </div>
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
    
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>


	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	
	   
    
        
    	
    	<!-- 测试结束 -->
    	
    	
    
    <script>				
        (function($){
     	    $(window).on('load',function(){
                setPopScroll('.scroll');
            })
        })(jQuery)
    </script>

</body>
    
    	<script>
	
    $("#paraMap1_HEADMAN_NAME").val('${user.name}');//input的值被强制设定了 ，只好如此
	
	/*定义必要的全局变量*/
	var user_id="";
	var dept_id;
	var item_id;
	var main_id;
	var headuser_id='${user.id}';
	var check_grape_01 = false;//触发点击一号葡萄事件
    var ifsave = false;
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var strDate = date.getDate();
	date = year + '-' + month + '-' + strDate// + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds(); 
	$("#searchtime").text(strDate+"号");
	$("#thistime").text(date.substring(0,4) + "年 " + month + "月");
    //var date = "";
	
    ////console.log(date);
	/**/
		
	var grapdatecolor = '#FFF'//葡萄日期颜色
	var grapecolor = '#000000'//葡萄背景颜色
	//获得月份天数
	//alert(GetLastDay('2012', '2'));
    function GetLastDay(year, month) {
        var date = new Date(year, month, 1),
        lastDay = new Date(date.getTime() - 864e5).getDate();
        //alert(date.getTime());   
        return lastDay;
    }
    
	//生成初始葡萄图
	$(function(){
       
		for(var i = 0 ;i < 6;i++){
            $("<p class='line'>").prependTo('#grape')
            for(var j = 0 ;j <= i ;j++){
                $("<span class='circle'>").html((1+i)*i/2+1+j).appendTo('#grape .line:first')
            }
        }
        
        for(var i = 0 ;i < 2;i++){
            $("<p class='line'>").prependTo('#grape')
            for(var j = 1 ;j <= 6 ;j++){
                $("<span class='circle'>").html(21+i*6+j).appendTo('#grape .line:first')
                if(21+i*6+j >= GetLastDay(year,month)){
                    break;
                }
            }
        }
         
	})

        		

function isNumberOr_Letter( s ){//判断是否是数字
        var regu = "^[0-9]{2}+$";
        var re = new RegExp(regu);
            if (re.test(s)) {
                    return true;
            }else{
                return false;
            }
}

$("td").onkeyup = function(){
  var _html = this.innerHTML;
  if(_html.length > 10){
    this.innerHTML = _html.substr(0,10);
    this.blur();
  }
}    
　
　　/*保存*/
 /*保存*/ 　
	function mmz_add(obj) {　　　　 //  var strdata ="&date="+date+"&user_id="+user_id+"&headuser_id="+headuser_id;
		if(!ifsave) {
		var lshow =$("#paraMap1_LOGIN_NAME_SHOW")[0];
		_alertValMsg(lshow,'<dict:lang value="员工号不能为空" />');
		return;
		}
		var j = {
			"date": date,
			"user_id": user_id,
			"time": $("#time").val(),
			"headuser_id": headuser_id
		};
	//	//console.log("开始保存--当前添加日期：" + date + "保存对象ID：" + user_id);　　
		var top = $("#mmz_tbody001").find('tr');　　
		var list = [];　　
		for(var i = 0; i < top.length; i++) {　　
			var k = top.get(i);
			var k1 = $(k).find('td').get(0);
			k1 = $(k1).attr("item_id");
			var k2 = $(k).find('td').get(1).firstChild;
			k2 = $(k2).val();
			var k3 = $(k).find('td').get(2).firstChild;
			k3 = $(k3).val();
			if(k1 == "" || null == k1 || undefined == k1) {
				k1 = 0;
			}
			if(k2 == "" || null == k2 || undefined == k2) {
				k2 = 0;
			}
			if(k3 == "" || null == k3 || undefined == k3) {
				k3 = 0;
			}
			list.push({
				"item_id": k1,
				"item_score": k2,
				"remark": k3
			});

			/* //console.log($(kl).attr("item_id"));	
			 //console.log($(k2).text());	
			 //console.log($(k3).text());	
			 //console.log(date);*/
		}
		list = JSON.stringify(list);
		j.itemList = list; //将项目信息加入itemList
		////console.log('在此'+j.itemList[1].item_id);
	//	//console.log(list);　　
		$.ajax({
			type: "POST",
			dataType: "json",
			url: "${path}buss/bussModel_exeFunc.ms?funcMId=d3a569e7af2b462e81a67f56bb0a5c4b",
			// data: "&BOX_ORGANIZE="+BOX_ORGANIZE+"&TALLY_BOX_DOC="+TALLY_BOX_DOC+"&TALLY_DOC="+TALLY_DOC+"&TALLY_LINE_NO="+TALLY_LINE_NO+"&DOC_STATUS="+DOC_STATUS+"&BOX_DATE="+BOX_DATE+"&BOX_DATE_END="+BOX_DATE_END+"&CREATE_USER="+CREATE_USER+"&CREATE_TIME="+CREATE_TIME+"&CREATE_TIME_END="+CREATE_TIME_END+"",
	data: j,
			success: function(data) {
				msgPop('保存成功', "", '提示', 200, 150, 3000, 5000);
				// var msg = data.responseText;
				////console.log(data);
				/*    if(parent.iframe2!=undefined)
             parent.iframe2.location.reload();
            if(parent.iframe3!=undefined)
             parent.iframe3.location.reload();
             parent.$("#_loading_lay_div").parent().next().remove();
*/          	//query("formId1");
                parentWindow.query("formId1");
                closeWinFun();
				showgrape(date, user_id);
			},
			error: function(msg) {
				// //console.log(msg);	
				//util.closeLoading();
				utilsFp.confirmIcon(3, "", "", "", "error:" + msg.responseText, 0, "300", "");
			}
		});　　
	}　　
	
	var parentWindow;
		$(function(){
			if(top.$("#"+window.frameElement.name) != null && top.$("#"+window.frameElement.name).length > 0 && 
					top.$("#"+window.frameElement.name)[0].contentWindow != undefined){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			    
			}
			
			//setPopScroll('.bd');
			
		});
　　
	var org_item_list = "";　　 /*展示考核项目*/ 　　
	function getItem() {
	console.log("dept_id："+dept_id);
		$('#mmz_tbody001').html('');　　　
		$.ajax({
			type: "POST",
			dataType: "json",
			url: "${path}buss/bussModel_exeFunc.ms?funcMId=42239c623c9a4a3fa9878168873fe809",
			data: "&dept_id=" + dept_id + "&user_id=" + user_id,
			success: function(data) {
				// //console.log(data);
				//if("success"==data.ajaxMap.msg){
				//}
				//    //console.log(data.toString());
				$("#mmz_tbody001").empty();
				if(null==data){
                return;
                }
				var k = data.ajaxPage.dataList;
				if(k == undefined || k == null) return;
				org_item_list = k;
				for(var i = 0; i < data.ajaxPage.dataList.length; i++) {

					$("#mmz_tbody001").append('<tr id="123" style="">' +
						'<td class="dec" style="width:180px;overflow: hidden; text-overflow:ellipsis;"  id = "' + data.ajaxPage.dataList[i].ID + '" item_id = "' + data.ajaxPage.dataList[i].ID + '" >' + data.ajaxPage.dataList[i].ITEM_NAME + '</td>' +
						'<td class="dec" style="width:50px;overflow: hidden; text-overflow:ellipsis;"  ><input  placeholder="<=' + data.ajaxPage.dataList[i].ITEM_SCORE + '" onclick="saveorgscore(this)" onkeyup="rule1(this)"  maxval="' + data.ajaxPage.dataList[i].ITEM_SCORE + '" id= input1_"' + data.ajaxPage.dataList[i].ID + '" type="text" size="10" value="" maxlength="3"/></td>' +
						'<td class="dec" style="overflow: hidden; text-overflow:ellipsis;"   ><input onchange="rule2(this)"  validateJson="" id= input2_"' + data.ajaxPage.dataList[i].NAME + '" type="text" size="10" value="" maxlength="20"/></td>' +
						'</tr>'); /*contenteditable="true"*/

				}
				/*   var obj = document.getElementById("input_1"+data.ajaxPage.dataList[i].ID);
				  var json = {"UI_RULE_RIGHT":$(obj).attr('maxval'),"UI_RULE_TIP":"不得大于"+$(obj).attr('maxval'),"UI_RULE_LEFT":"0","UI_RULE":"number"};
				  $(obj).attr('validateJson') = json;
				  addLoadEvent(function () 
				  {
				  initValidate(obj);
				  });
				  
				  */

			},
			error: function(msg) {
				////console.log(msg);	
				utilsFp.confirmIcon(3, "", "", "", "error:" + msg.responseText, 0, "300", "");
			}
		});　　
	}　　　　

　　function rule1(obj){//数字规则
　　var a = $(obj).val();
　　var b = $(obj).attr('maxval');
　　  if(!checkNumber(a)){
　　  _alertValMsg(obj,"请输入0~"+b+"整数");
　　  $(obj).val("");
　　  }else
　　    if(b<a){
　　　  _alertValMsg(obj,"请输入0~"+b+"整数");
　　    $(obj).val("");
　　        
　　    }
　　    
　　}
　　 
　　 
　　function rule2(){
　　   /*暂无*/ 
　　}
　//验证字符串是否是数字
function checkNumber(theObj) {
  var reg = /^[0-9]*$/;
  if (reg.test(theObj)){
    return true;
  }
  return false;
}

　　/*切换月份*/
　　function premonth(obj){
　　   if(""==user_id){
　　   var lshow =$("#paraMap1_LOGIN_NAME_SHOW")[0];
		_alertValMsg(lshow,'<dict:lang value="员工号不能为空" />');
　　       //_alertValMsg(obj,"员工号不能为空"); 
　　       return;
　　   }
       check_grape_01 = true;
　　   var old_y = date.substring(0,4);
　　   var m = date.substring(5,7);
　　   var old_d = date.substring(8,10);
　　   old_d = "01";//从一号开始
　　   var m = m-1;
　　   if(m==0){
　　       old_y = old_y-1;
　　       m ="12";
　　   }
　　   if(m<10){
　　       m="0"+m;
　　   }
　　   date = old_y+"-"+m+"-"+old_d;
        showgrape(date,user_id); 
        $("#searchtime").text("01"+"号");
        $("#thistime").text(date.substring(0,4) + "年 " + m + "月");

　　 }
　　
　　function nextmonth(obj){
　　    if(""==user_id){
　　    var lshow =$("#paraMap1_LOGIN_NAME_SHOW")[0];
		_alertValMsg(lshow,'<dict:lang value="员工号不能为空" />');
　　   　//_alertValMsg(obj,"员工号不能为空"); 
　　       return;
　　   }
　　    check_grape_01 = true;
　　	 init++;
　　   var old_y = date.substring(0,4);
　　   var m = date.substring(5,7);
　　   var old_d = date.substring(8,10);
　　   old_d = "01";//从一号开始
　　   var m = m-1+2;
　　   if(m==13){
　　       old_y = old_y-1+2;
　　       m ="1";
　　   }
　　   if(m<10){
　　       m="0"+m;
　　   }
　　   date = old_y+"-"+m+"-"+old_d;
　　  showgrape(date,user_id);
　　      $("#searchtime").text("01"+"号");
　　      	$("#thistime").text(date.substring(0,4) + "年 " + m + "月");

　　}
　　
　　/*展示葡萄图*/
　　function showgrape(date,userId){
　　    $('#grape .line').remove();
        strDate = date.substr(8);
　　    for(var i = 0 ;i < 6;i++){
            $("<p class='line'>").prependTo('#grape')
            for(var j = 0 ;j <= i ;j++){
                $("<span class='circle' id='grape_" + ((1+i)*i/2+1+j) + "' onclick='showScore(this)'>").html((1+i)*i/2+1+j).appendTo('#grape .line:first')
               
                     ////console.log((1+i)*i/2+1+j);
            }
        }
        
        if(GetLastDay(date.substring(0,4),date.substring(5,7)) == 28){
            for(var i = 0 ;true;i++){
            $("<p class='line'>").prependTo('#grape')
                for(var j = 1 ;j <= 5 ;j++){
                    $("<span class='circle'  id='grape_" + (21+i*5+j) + "' onclick='showScore(this)'>").html(21+i*5+j).appendTo('#grape .line:first')
                    if(21+i*5+j >= GetLastDay(date.substring(0,4),date.substring(5,7))){
                        $("#thistime").text(date.substring(0,4) + "年 " + date.substring(5,7) + "月");
                        git();//添加数据
                        return;
                    	//break;                    
                    }
                }
            }
        }else{
            for(var i = 0 ;true;i++){
                $("<p class='line'>").prependTo('#grape')
                for(var j = 1 ;j <= 6 ;j++){//xiu1
                    $("<span class='circle'  id='grape_" + (21+i*6+j) + "' onclick='showScore(this)'  >").html(21+i*6+j).appendTo('#grape .line:first')
                    // //console.log("2:"+(21+i*6+j));
                    if(21+i*6+j >= GetLastDay(date.substring(0,4),date.substring(5,7))){
                        //break;				
                        $("#thistime").text(date.substring(0,4) + "年 " + date.substring(5,7) + "月");
                        git();//添加数据
                        return;
                    }
                }
            }
        }    
        
        
　　}
　
　　function git(){//获得葡萄数据
　　    var j = {
			"date" : date,
			"user_id" : user_id,
			"time": $("#time").val(),
			"headuser_id":headuser_id
		};
　　    
　　    　$.ajax({
            type: "POST",
            dataType: "json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=51b13544d91941e88506289a2f537f08",
            data:j,
            success: function(data){
            // //console.log(data);
                var k = data.ajaxPage.dataList.length;
                for (var i =0; i< k;i++){
                var idx = data.ajaxPage.dataList[i].CHECK_DATE.substring(8,10)-1+1;
                   // 	//console.log(idx);
            　　 //  //console.log("进入1涨");
                    //	//console.log($("#grape_"+idx)[0].id+"我是id");
                    $("#grape_"+idx).css("background-color",data.ajaxPage.dataList[i].LEVEL_COLOR);//
                    ////console.log($("#grape_"+idx)[0].id);
                    $("#grape_"+idx).attr("data",data.ajaxPage.dataList[i].ID);//存储葡萄主表id 用于点击时获取项目信息
                }
                
            /*   该项用于查看员工考核信息中  故注释之 
                if(check_grape_01){//触发点击事件
                     $("#grape_"+"1").click();
                }
                */
                
		 	if(check_grape_01) { //触发点击事件
					$("#grape_" + "1").click();
				}else{
				   var d = strDate+"";
				    var d1 = d.indexOf("0");
				    if( d1==0 ) {
				      //console.log(d);   
				      d = d.substr(1);
				    }
				    $("#grape_" + d).click();
				}
            },
            error: function(msg){
                ////console.log(msg);
                utilsFp.confirmIcon(3,"","","", "error:"+msg.responseText,0,"300","");
            }
        });
　　    
　　}
　　
　	　　
	function showScore(obj) {
	//console.log("showScore中");
		//先清空项目
		
		$("#listTable input").each(function(i, obj) {
		
			$(obj).val("");
		});
		//更新时间

		var y = date.substring(0, 4);　　
		var m = date.substring(5, 7);
		if(m.indexOf('-')== 1){
		    m= m.substring(0,1);
		}
		strDate = $(obj).text();　　
		if(strDate < 10) {　　
			if(strDate.indexOf("0") == -1)
			strDate = "0" + strDate;　　
		}
		if(m < 10) {
		if(m.indexOf("0") == -1)
			m = "0" + m;　　
		}
		
		date = y + "-" + m + "-" + strDate;
		//展示时间
		$("#searchtime").text(strDate + "号");
		$("#thistime").text(date.substring(0, 4) + "年 " + date.substring(5, 7) + "月");

		//生成项目
		　　
		if(!$(obj).attr("data"))　　 {　　 ////console.log('进入项目');
			　　 //无数据时候显示默认项目
			　　$('#paraMapObj_HEADMAN_NAME').val("");			　
			　　$('#mmz_tbody001').html('');　　
			if(org_item_list == "") {
			    $("#paraMapObj_HEADMAN_NAME").val("");
			return;
			}
			for(var i = 0; i < org_item_list.length; i++) {
				$("#mmz_tbody001").append('<tr id="123" style="">' +
					'<td class="dec" style="width:180px;overflow: hidden; text-overflow:ellipsis;"  id = "' + org_item_list[i].ID + '" item_id = "' + org_item_list[i].ID + '" >' + org_item_list[i].ITEM_NAME + '</td>' +
					'<td class="dec" style="width:50px;overflow: hidden; text-overflow:ellipsis;"  ><input  placeholder="<=' + org_item_list[i].ITEM_SCORE + '" onkeyup="rule1(this)"  maxval="' + org_item_list[i].ITEM_SCORE + '" id= input1_"' + org_item_list[i].ID + '" type="text" size="10" value="" maxlength="3"/></td>' +
					'<td class="dec" style="overflow: hidden; text-overflow:ellipsis;"   ><input onchange="rule2(this)"  validateJson="" id= input2_"' + org_item_list[i].ID + '" type="text" size="10" value="" maxlength="20"/></td>' +
					'</tr>'); /*contenteditable="true"*/ 　　
			}
			$('#listTable').find('input').val('');　　
			
			return;
		}　　 //return;
		　　
		var mian_id = $(obj).attr("data").split(",")[0];　　 //	//console.log(mian_id);
		　var check_user_id = $(obj).attr("data").split(",")[1];
		var j = {
			"id" : mian_id,
			"check_user_id":check_user_id
		};　　　　　
		$.ajax({
			type: "POST",
			dataType: "json",
			url: "${path}buss/bussModel_exeFunc.ms?funcMId=a485f14a36f042c2950be41feab462fb",
			data: j,
			success: function(data) {
				//console.log(data);

				var k = data.ajaxPage.dataList;
				if(k == undefined || k == null) return;
				//k=k.length;
				/*  for (var i =0; i< k;i++){//原根据id注入信息方法  ---- 注： 现在已经改为直接根据返回信息生成表格
            //        $("#input1_"+data.ajaxPage.dataList[i].ITEM_ID).val(data.ajaxPage.dataList[i].ITEM_SCORE);
              //   $("#input2_"+data.ajaxPage.dataList[i].ITEM_ID).val(data.ajaxPage.dataList[i].REMARK);
                    var td1 = $("#"+data.ajaxPage.dataList[i].ITEM_ID).next();
                    $(td1).find('input').val(data.ajaxPage.dataList[i].ITEM_SCORE);
                    $(td1).next().find('input').val(data.ajaxPage.dataList[i].REMARK);
                }
          	//  */
				$('#mmz_tbody001').html('');
				//alert(k.length)

		//	//console.log("z展示长度："+k.length);
				for(var i = 0; i < k.length; i++) {
					$("#mmz_tbody001").append('<tr id="123" style="">' +
						'<td class="dec" style="width:180px;overflow: hidden; text-overflow:ellipsis;"  id = "' + data.ajaxPage.dataList[i].ITEM_ID + '" item_id = "' + data.ajaxPage.dataList[i].ITEM_ID + '" >' + data.ajaxPage.dataList[i].ITEM_NAME + '</td>' +
						'<td class="dec" style="width:50px;overflow: hidden; text-overflow:ellipsis;"  ><input style="text-align:center" placeholder="<=' + data.ajaxPage.dataList[i].MAX_SCORE + '" onchange="rule1(this)"  maxval="' + data.ajaxPage.dataList[i].MAX_SCORE + '" id= input1_"' + data.ajaxPage.dataList[i].ID + '" value="' + k[i].ITEM_SCORE + '" type="text" size="10" value="" maxlength="3"/></td>' +
						'<td class="dec" style="overflow: hidden; text-overflow:ellipsis;"  title="'+zeroTonull(data.ajaxPage.dataList[i].REMARK)+'" ><input onkeyup="rule2(this)"  value="' + zeroTonull(data.ajaxPage.dataList[i].REMARK) + '"  validateJson="" id= input2_"' + data.ajaxPage.dataList[i].ID + '" type="text" size="10" value="" maxlength="20" /></td>' +
						'</tr>');
				}
				   $('#paraMapObj_HEADMAN_NAME').val(data.ajaxMap.check_user_name);//更新判定人信息,如果判定人被开除了 就无此

			},
			error: function(msg) {
				//console.log(msg);
				utilsFp.confirmIcon(3, "", "", "", "error:" + msg.responseText, 0, "300", "");
			}
		});　　　　　　
	}　
　
　function rule1(obj){//数字规则
　　var a = $(obj).val();
　　var b = $(obj).attr('maxval');
　　  if(!checkNumber(a)){
　　  _alertValMsg(obj,"请输入0~"+b+"整数");
    　　  $(obj).val(orgscore);
　　  }else
　　    if((b-1+1)<(a-1+1)){
　　　  _alertValMsg(obj,"请输入0~"+b+"整数");
　　      $(obj).val(orgscore);
　　        
　　    }
　　}
　　var orgscore = "";
　function saveorgscore(obj){
　  //console.log(123);
　  orgscore = $(obj).val()
　}
　    
　//验证字符串是否是数字
function checkNumber(theObj) {
  var reg = /^[0-9]*$/;
  if (reg.test(theObj)){
    return true;
  }
  return false;
}

function zeroTonull(obj){//忘记在哪儿把备注默认成零了，先这样改回来
    if(obj=="0"){
        obj ="";
    }
    return obj;
}
　　


          function closeWinFun(){//关闭单前窗口方法
			//$("#isCloseWin").attr
			if($("#isCloseWin").attr("checked")) {
				//$("#isCloseWinVal").val("1");
				closeWindow();
			} else {
				//$("#isCloseWinVal").val("0");
			}
		}
		
    </script>
    
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
