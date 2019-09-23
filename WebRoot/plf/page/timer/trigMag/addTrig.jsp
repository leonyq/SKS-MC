<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="触发器新增" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
	</jsp:include>
</head>
<style>
.widget .layui-form-select{
width:404px;
}
.layui-form-item{
margin-bottom: 0px;
}


</style>
<body>
	<div class="all">
		<div>
			<div  class="add_table_div">
			<form id="addForm" name="addForm" class="layui-form" action="${path}sys/trigMagAction_addTrig.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.UP_ID" />
				
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">

				<table class="add_table">
					<tr>
						<td  class="tr1" style="width:130px;">
							<span class="Eng">*</span><dict:lang value="触发器名称" />
						</td>
						<td class="widget">
							<input type="text" id="triggerName" name="trig.triggerName" style="width:404px;"/>
						</td>
					</tr>
					<tr>
						<s:if test="${isOpenAuth==0}">
							<s:hidden name="userDataAuth" id="userDataAuth" value="${dataAuthTop}"></s:hidden>
						</s:if>
						<s:else>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="组织机构" />
						</td>
							<td style="width: 270px;" class="widget">
								  <select   lay-verify="required"  id="userDataAuth" lay-filter="userDataAuth1" lay-search>
								       <c:forEach items="${dataAuthMap}" var="listData">
								        <s:if test="${dataAuthTop== listData.ID}">
								       		<option value="${listData.ID}" selected="selected"><dict:lang value="${listData.NAME}" /></option>
								       </s:if>
								       <s:else>
								       	 <option value="${listData.ID}"><dict:lang value="${listData.NAME}" /></option>
								       </s:else>
		  							   </c:forEach>
								   </select>
							</td>
						</s:else>
					</tr>
					<tr>
						<td  class="tr1" style="width:130px;">
							<span class="Eng">*</span><dict:lang value="触发器事务" />
						</td>
						<td class="widget">
								<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
                				<input type="text" id="workDec" class="p_r_30" name="trig.workDec"  readonly="readonly" style="width:404px;"/>
                            	<i class="layui-icon layui-icon-search" onclick="selectWork();" style="position: absolute;top:11px;right: 8px;"></i>
                      			</div>
                      
						</td>
					</tr>
					<tr>
						<td  class="tr1" style="width:130px;">
							<dict:lang value="触发器描述" />
						</td>
						<td class="widget">
							<input id="dec" type="text" name="trig.dec" style="width:404px;"></input>
						</td>
					</tr>
					
					<tr>
						<td  class="tr1" style="width:130px;">
							<span class="Eng">*</span><dict:lang value="执行节点" />
						</td>
						<td class="widget" >
						<div class="layui-form-item" >
						<div class="layui-input-block" style="margin-left:0px;width:100%;">
							<select id="node" name="trig.node" >
								<s:iterator value="nodeList" status="index" id="node">
									<s:if test="${currentNode==ipport}">
	                                          <option value="<s:property value="ipport" />" selected="selected"><s:property value="ipport" /></option>
									</s:if>
									<s:else>
									 <option value="<s:property value="ipport" />"><s:property value="ipport" /></option>
									</s:else>
								</s:iterator>
							</select>
							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td  class="tr1" style="width:130px;vertical-align: top;">
							<span style="display: block;margin-top:8px;"><dict:lang value="自定义监听器" /></span>
						</td>
						<td class="widget">
								<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
                				<input type="text" id="lisCodeName"  class="p_r_30" name="paraMap.lisCodeName" readonly="readonly" style="width:404px;"/>
                            	<i class="layui-icon layui-icon-search" onclick="showEditCode('lis');" style="position: absolute;top:11px;right: 8px;"></i>
                      			</div>
                      			
                      			<blockquote class="layui-elem-quote" style="margin-top: 10px;width:370px;">
								<div>
									<dict:lang value="实现接口com.more.fw.core.base.core.timer.IJobListener" />
								</div>
								</blockquote>
						</td>
					</tr> 
					<tr>
						<td class="tr1" style="width:130px;">
							<span class="Eng">*</span><dict:lang value="执行频率" />
						</td>
						<td class="widget mc-database-radio-td">
							<dict:radioDict dictCode="TIMER_TYPE" dictValue="date" id="timerType" name="timerType" style="width:30px;"  bindEvent="changeTimer"/>
						</td>
					</tr>
					</tr> 
						<td class="tr1" style="width:130px;vertical-align: top;">
							<span style="display: block;margin-top:8px;"><span class="Eng">*</span><dict:lang value="执行时间" /></span>
						</td>
						<td class="widget">
							<span id="dayContext">
								<input type="text" id="hour_day" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')"  onblur="vailHour(this.value)" style="width:12%"><dict:lang value="时" />
								<input type="text" id="minute_day" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailMinute(this.value)"style="width:12%"><dict:lang value="分" />
							</span>
							<span id="weekContext" style="display:none">
								<dict:lang value='第'/><input id="date_week" type="text" style="width:12%" onblur="vailWeek(this.value)"><dict:lang value='天' />
								<input id="hour_week" type="text" style="width:12%" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailHour(this.value)" /><dict:lang value='时' />
								<input id="minute_week" type="text" style="width:12%"onkeyup"this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailMinute(this.value)" /><dict:lang value='分' />
								
								<blockquote class="layui-elem-quote" style="margin-top: 10px;width:370px;">
								<div>
								<dict:lang value='小写数字，从周日到周六：1,2,3,4,5,6,7 以‘,’分隔'/>
								</div>
								</blockquote>
							</span>
							<span id="monthContext" style="display:none">
								<dict:lang value='第'/><input type="text" id="date_month" style="width:12%" onblur="vailDayOfmonth(this.value)"/><dict:lang value='号' />
								<input type="text" id="hour_month" style="width:12%" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailHour(this.value)" /><dict:lang value='时' />
								<input type="text" id="minute_month" style="width:12%"onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailMinute(this.value)" /><dict:lang value='分' />
								
								<blockquote class="layui-elem-quote" style="margin-top: 10px;width:370px;">
								<div>
								<dict:lang value='小写数字，以‘,’分隔'/>
								</div>
								</blockquote>
							</span>
							<span id="seasonContext" style="display:none">
								<dict:lang value='第'/><input type="text" id="month_season" style="width:12%"  onblur="vailmonthOfSeason(this.value)"><dict:lang value='月' />
								<dict:lang value='第'/><input type="text" id="date_season" style="width:12%" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailDay(this.value)"><dict:lang value='天' />
								<input type="text"id="hour_season" style="width:12%" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailHour(this.value)" /><dict:lang value='时' />
								<input type="text" id="minute_season" style="width:12%"onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailMinute(this.value)" /><dict:lang value='分' />
								
								<blockquote class="layui-elem-quote" style="margin-top: 10px;width:370px;">
								<div>
								<dict:lang value='月份只能输入1-3，支持1，2，3，日期只可以输入1-31'/>
								</div>
								</blockquote>
							</span>
							<span id="yearContext" style="display:none">
							
								<dict:lang value='第'/>
								<input type="text" id="month_year" style="width:12%" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailmonthOfYear(this.value)"><dict:lang value='月' />
								<dict:lang value='第'/><input id="date_year" type="text" style="width:12%" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailDay(this.value)"><dict:lang value='天' />
								<input type="text" id="hour_year" style="width:12%" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailHour(this.value)" /><dict:lang value='时' />
								<input type="text" id="minute_year" style="width:12%"onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" onblur="vailMinute(this.value)" /><dict:lang value='分' />
								
								<blockquote class="layui-elem-quote" style="margin-top: 10px;width:370px;">
								<div>
								<dict:lang value='月份可以输入1-12，日期根据月历输入'/>
								</div>
								</blockquote>
							</span>
							<span id="cronContext" style="display:none">
							
							<dict:lang value='表达式'/><input id="cron" type="text" style="width:360px;">
							<blockquote class="layui-elem-quote" style="margin-top: 10px;width:370px;">
							<div>
							<dict:lang value='示例：0 0 2 1 * ? *'/>
							</div>
							</blockquote>
							</span>
							<span id="frequencyContext" style="display:none">
								<dict:lang value='重复执行次数'/><input id="frequency" type="text" style="width:12%" onblur="vailRe(this.value)"/>
								<dict:lang value='执行间隔'/><input id="interval"  maxlength="10"  type="text" style="width:12%"  onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" />
								
								<blockquote class="layui-elem-quote" style="margin-top: 10px;width:370px;">
								<div><dict:lang value='任务启动时执行，-1表示无限次数，0表示立即执行，只执行一次，执行间隔单位为秒'/></div>
								</blockquote>
							</span>
							<span id="trigContext" style="display:none" >

								<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
                				<input type="text" id="trigName" class="p_r_30" style="width:404px;" readonly="readonly">
                            	<i class="layui-icon layui-icon-search" onclick="showEditCode('trig');" style="position: absolute;top:11px;right: 8px;"></i>
                      			</div>
                      			
								<s:hidden id="workLis"></s:hidden>
								
								<blockquote class="layui-elem-quote" style="margin-top: 10px;width:370px;">
								<div>
								<dict:lang value='实现接口com.more.fw.core.base.core.timer.ITrigger' />
								</div>
								</blockquote>
							</span>
							<s:hidden id="trigCodeName" name="paraMap.trigCodeName"></s:hidden>
							<s:hidden id="trigCodeType" name="paraMap.trigCodeType"></s:hidden>
							<s:textarea id="trigClsCode" name="paraMap.trigClsCode" cssClass="tabIndent"
								wrap="off" cssStyle="display:none;word-wrap: normal; width: 100%;height: 364px;"></s:textarea>
							<s:hidden id="expression" name="paraMap.expression"></s:hidden>
							<s:hidden id="lisCodeType" name="paraMap.lisCodeType"></s:hidden>
							<s:textarea  id="lisClsCode" name="paraMap.lisClsCode" cssClass="tabIndent"
								wrap="off" cssStyle="display:none;word-wrap: normal; width: 100%;height: 364px;"></s:textarea>
							<s:hidden  name="moduleId" ></s:hidden>
							<s:hidden id="workMessage" name="paraMap.workMessage"></s:hidden>
							<s:hidden id="checkId" name="paraMap.checkId"></s:hidden>
							<s:hidden id="workModuleId" name="paraMap.workModuleId"></s:hidden>
							<s:hidden id="type" name="paraMap.type"></s:hidden>
							<s:hidden id="type" name="paraMap.type"></s:hidden>
							<s:hidden id="USER_DATA_AUTH" name="trig.userDataAuth"></s:hidden>
							<s:hidden id="trigCodeId"></s:hidden>
						</td>
					</tr>
				</table>
				
				<div class="ptop_10 txac">
					<!--  
					<span style="float:right;margin-right:5px" >
						<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
					</span>
					-->
					
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				
			</form>
			</div>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	layui.use('form', function(){
		  var form = layui.form;
		  form.render("select");
	});
	
	var expression=null;
	var dayContext=$("#dayContext");
	var weekContext=$("#weekContext");
	var monthContext=$("#monthContext");
	var seasonContext=$("#seasonContext");
	var yearContext=$("#yearContext");
	var cronContext=$("#cronContext");
	var frequencyContext=$("#frequencyContext");
	var trigContext=$("#trigContext");
	var expression=$("#expression");
	var isSubmit=false;
	var context=null
	var lisCodeName =$("#lisCodeName").val();
	var trigCodeName =$("#trigCodeName").val();
	var lisClsCode =$("#lisClsCode").val();
	var trigClsCode =$("#trigClsCode").val();
	var canSubmit=false;
	var vailReason=null;
	var nameValil=false;
	function vailtName(){
		var triggerName =$("#triggerName").val();
		$.ajax({
			type: "POST",
		    dataType: "json",
		    async:false,
		    data: {
		    	"paraMap.triggerName":triggerName,
		    	"paraMap.triggerId":""
		    },
		    url: "${path}sys/trigMagAction_vailtName.ms",
			success: function(data){
				if(data.ajaxMap.status=='false'){
					util.alert(data.ajaxMap.info);
					nameValil=false;
					return false;
				}else{
					nameValil=true;
					return true;
				}
			},
			error: function(msg){
				util.closeLoading();
			}
		});
	}
	function changeTimer(obj){
		var timerType=obj;
		var timeContext=$("#timeContext");
		var trigCodeId=$("#trigCodeId").val();
		var trigCodeType=$("#trigCodeType").val();
		var context=null;
		var triButton=$("#trigButton");
		if(timerType=="date"){
			dayContext.show();
			weekContext.hide();
			monthContext.hide();
			seasonContext.hide();
			yearContext.hide();
			cronContext.hide();
			frequencyContext.hide();
			trigContext.hide();
		}
		if(timerType=="week"){
			dayContext.hide();
			weekContext.show();
			monthContext.hide();
			seasonContext.hide();
			yearContext.hide();
			cronContext.hide();
			frequencyContext.hide();
			trigContext.hide();
		}
		if(timerType=="month"){
			dayContext.hide();
			weekContext.hide();
			monthContext.show();
			seasonContext.hide();
			yearContext.hide();
			cronContext.hide();
			frequencyContext.hide();
			trigContext.hide();
		}
		if(timerType=="season"){
			dayContext.hide();
			weekContext.hide();
			monthContext.hide();
			seasonContext.show();
			yearContext.hide();
			cronContext.hide();
			frequencyContext.hide();
			trigContext.hide();
		}
		if(timerType=="year"){
			dayContext.hide();
			weekContext.hide();
			monthContext.hide();
			seasonContext.hide();
			yearContext.show();
			cronContext.hide();
			frequencyContext.hide();
			trigContext.hide();
		}
		if(timerType=="cron"){
			dayContext.hide();
			weekContext.hide();
			monthContext.hide();
			seasonContext.hide();
			yearContext.hide();
			cronContext.show();
			frequencyContext.hide();
			trigContext.hide();
		}
		if(timerType=="frequency"){
			dayContext.hide();
			weekContext.hide();
			monthContext.hide();
			seasonContext.hide();
			yearContext.hide();
			cronContext.hide();
			frequencyContext.show();
			trigContext.hide();
		}
		if(timerType=="class"){
			dayContext.hide();
			weekContext.hide();
			monthContext.hide();
			seasonContext.hide();
			yearContext.hide();
			cronContext.hide();
			frequencyContext.hide();
			trigContext.show();
			if(trigCodeId!=null&&trigCodeId!=""){
				triButton.html("<dict:lang value='编辑' />")
			}else{
				triButton.html("<dict:lang value='新增' />")
			}
		}
	}
	
	function showEditCode(Obj){
		 var mcIframeName = window.frameElement.name; //外层iframe的name
		if(Obj=='lis'){
			var url = "${path}sys/trigMagAction_toEditCode.ms?paraMap.type=lis&mcIframeName="+mcIframeName;
			
		}else{
			var url = "${path}sys/trigMagAction_toEditCode.ms?paraMap.type=trig&mcIframeName="+mcIframeName;
		}
		showPopWin(url, "99%", "99%",null,"<dict:lang value="类源码"/> <dict:lang value="新增"/>");
	}
	
	var isSubmit = false;
	
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function add(thisObj){
		if(!vailCommit()){
			return false;
		}
		vailtName();
		if(!nameValil){
			return false;
		}
		/* if(!val.isBlank(lisCodeName)){
			analyClsCode(lisClsCode,"lis");
		}
		if(!val.isBlank(trigCodeName)){
			analyClsCode(lisClsCode,"trig");
		} */
		expression.val(context);
		if(isSubmit){
			//document.forms.addForm.submit();
			return true;
		}
		isSubmit = true;
	}
	
	function updateCodeData(codeType,className,classCode,type) {
		if(type=="lis"){
			$("#lisCodeName").val(className);
			$("#lisCodeType").val(codeType);
			$("#lisClsCode").val(classCode);
			$("#lisName").val(className)
			$("#lisButton").text("编辑")
		}else{
			$("#trigName").val(className)
			$("#trigCodeName").val(className);
			$("#trigCodeType").val(codeType);
			$("#trigClsCode").val(classCode);
			$("#trigButton").text("编辑")
		}
	}
	function vailHour(obj){//校验小时
		var regx=/^(2[0-3]|[0-1]?\d)$/
		if(!obj.match(regx)){
			util.alert("小时范围值只能是0-23");
			isSubmit=false;
			return false;
		};
		return true;
	}	
	function vailMinute(obj){//校验分钟
		var regx=/^[0-5]?[0-9]$/
		if(!obj.match(regx)){
			util.alert("分钟范围值只能是0-59");
			isSubmit=false;
			return false;
		};
		return true;
	}
	function vailWeek(obj){//校验日期
		var regx=/^(?![1-7,]*?\b([1-7])\b(?=[1-7,]*\b\1\b))[1-7](,[1-7])*$/
		if(!obj.match(regx)){
			util.alert("从周日到周六：1,2,3,4,5,6,7 以‘,’分隔");
			isSubmit=false;
			return false;
		};
		return true;
	}
	function vailDayOfmonth(obj){//校验一个月的执行天数
		var regx=/^(?!.*?\b((?:[1-9]|[12]\d|3[01]))\b(?=.*?\b\1\b))(?:\b((?:[1-9]|[12]\d|3[01])),)*\b((?:[1-9]|[12]\d|3[01]))$/
		if(!obj.match(regx)){
			util.alert("小写数字(1-31)，以‘,’分隔");
			isSubmit=false;
			return false;
		};
		return true;
	}
	function vailDay(obj){//校验天数
		var regx=/^([1-2][0-9]|[1-9]|3[0-1])$/
		if(!obj.match(regx)){
			util.alert("日期只能输入1-31");
			isSubmit=false;
			return false;
		};
		return true;
	}
	function vailmonthOfSeason(obj){//校验一个季度月数
		var regx=/^(?![1-3,]*?\b([1-3])\b(?=[1-3,]*\b\1\b))[1-3](,[1-3])*$/
		if(!obj.match(regx)){
			util.alert("月份只能输入1-3，可以以‘,’分隔");
			isSubmit=false;
			return false;
		};
		return true;
	}
	function vailmonthOfYear(obj){//校验一年的月数
		var regx=/^([1-9]|11|12)$/
		if(!obj.match(regx)){
			util.alert("月份只能输入1-12");
			isSubmit=false;
			return false;
		};
		return true;
	}
	function vailRe(obj){//校验重复次数
		var regx=/^([1-9]\d*|-1|0)$/
		if(!obj.match(regx)){
			util.alert("-1表示无限次数，0表示立即执行，其余数字只能为正整数");
			isSubmit=false;
			return false;
		};
		return true;
	}
	function cleanWork(){
		$("#workDec").val("");
	}
	function vailCommit(){
		var timerType=$("input[name='timerType']").filter(':checked').val();
		var triggerName=$("#triggerName").val();
		var workDec=$("#workDec").val();
		var dec=$("#dec").val();
		if(triggerName==""){
			util.alert("触发器名称必输");
			isSubmit=false;
			return false;
		}
		if(workDec==""){
			util.alert("触发器事务必须选择");
			isSubmit=false;
			return false;
		}
		if(triggerName.length>100){
			util.alert("触发器名称长度必须小于100");
			isSubmit=false;
			return false;
		};
		if(dec.length>300){
			util.alert("触发器描述长度必须小于300");
			isSubmit=false;
			return false;
		};
		if(timerType=="date"){
			var hourDay=$("#hour_day").val();
			var minuteDay=$("#minute_day").val();
			if(val.isBlank(hourDay)){
				util.alert("小时必输");
				isSubmit=false;
				return false;
			}
			if(!vailHour(hourDay)){//校验小时
				return false;
			}	
			if(!vailMinute(minuteDay)){//校验分钟
				return false;
			}
			if(val.isBlank(minuteDay)){
				util.alert("分钟必输");
				isSubmit=false;
				return false;
			}
			context="{\"type\":\"date\",\"context\":{ \"hour\":\""+hourDay+"\",\"min\":\""+minuteDay+"\"}}"
		}
		if(timerType=="week"){
			var dateWeek=$("#date_week").val();
			var hourWeek=$("#hour_week").val();
			var minuteWeek=$("#minute_week").val();
			if(val.isBlank(dateWeek)){
				util.alert("天必输");
				isSubmit=false;
				return false;
			}
			if(!vailWeek(dateWeek)){
				return false;
			}
			if(val.isBlank(hourWeek)){
				util.alert("小时必输");
				isSubmit=false;
				return false;
			}
			if(val.isBlank(minuteWeek)){
				util.alert("分钟必输");
				isSubmit=false;
				return false;
			}
			if(!vailHour(hourWeek)){//校验小时
				return false;
			}	
			if(!vailMinute(minuteWeek)){//校验分钟
				return false;
			}
			context="{\"type\":\"week\",\"context\":{\"date\":\""+dateWeek+"\", \"hour\":\""+hourWeek+"\",\"min\":\""+minuteWeek+"\"}}"
		}
		if(timerType=="month"){
			var datemonth=$("#date_month").val();
			var hourmonth=$("#hour_month").val();
			var minutemonth=$("#minute_month").val();
			if(val.isBlank(datemonth)){
				util.alert("天必输");
				isSubmit=false;
				return false;
			}
			if(!vailDayOfmonth(datemonth)){
				return false;
			}
			if(val.isBlank(hourmonth)){
				util.alert("小时必输");
				isSubmit=false;
				return false;
			}
			if(val.isBlank(minutemonth)){
				util.alert("分钟必输");
				isSubmit=false;
				return false;
			}
			if(!vailHour(hourmonth)){//校验小时
				return false;
			}	
			if(!vailMinute(minutemonth)){//校验分钟
				return false;
			}
			context="{\"type\":\"month\",\"context\":{\"date\":\""+datemonth+"\", \"hour\":\""+hourmonth+"\",\"min\":\""+minutemonth+"\"}}"
		}
		if(timerType=="season"){
			var monthSeason=$("#month_season").val();
			var dateSeason=$("#date_season").val();
			var hourSeason=$("#hour_season").val();
			var minuteSeason=$("#minute_season").val();
			if(val.isBlank(monthSeason)){
				util.alert("月必输");
				isSubmit=false;
				return false;
			}
			if(val.isBlank(dateSeason)){
				util.alert("天必输");
				isSubmit=false;
				return false;
			}
			if(!vailDay(dateSeason)){//校验天数
				return false;
			}
			if(!vailmonthOfSeason(monthSeason)){//校验一个季度月数
				return false;
			}
			if(val.isBlank(hourSeason)){
				util.alert("小时必输");
				isSubmit=false;
				return false;
			}
			if(val.isBlank(minuteSeason)){
				util.alert("分钟必输");
				isSubmit=false;
				return false;
			}
			if(!vailHour(hourSeason)){//校验小时
				return false;
			}	
			if(!vailMinute(minuteSeason)){//校验分钟
				return false;
			}
			context="{\"type\":\"season\",\"context\":{\"month\":\""+monthSeason+"\",\"date\":\""+dateSeason+"\", \"hour\":\""+hourSeason+"\",\"min\":\""+minuteSeason+"\"}}"
		}
		if(timerType=="year"){
			var monthYear=$("#month_year").val();
			var dateYear=$("#date_year").val();
			var hourYear=$("#hour_year").val();
			var minuteYear=$("#minute_year").val();
			if(val.isBlank(monthYear)){
				util.alert("月必输");
				isSubmit=false;
				return false;
			}
			if(val.isBlank(dateYear)){
				util.alert("天必输");
				isSubmit=false;
				return false;
			}
			if(!vailmonthOfYear(monthYear)){//校验一年的月数
				return false;
			}
			if(!vailDay(dateYear)){//校验天数
				return false;
			}
			if(val.isBlank(hourYear)){
				util.alert("小时必输");
				isSubmit=false;
				return false;
			}
			if(val.isBlank(minuteYear)){
				util.alert("分钟必输");
				isSubmit=false;
				return false;
			}
			if(!vailHour(hourYear)){//校验小时
				return false;
			}	
			if(!vailMinute(minuteYear)){//校验分钟
				return false;
			}
			context="{\"type\":\"year\",\"context\":{\"month\":\""+monthYear+"\",\"date\":\""+dateYear+"\", \"hour\":\""+hourYear+"\",\"min\":\""+minuteYear+"\"}}"
		}
		if(timerType=="cron"){
			var cron=$("#cron").val();
			if(val.isBlank(cron)){
				util.alert("表达式必输");
				isSubmit=false;
				return false;
			}
			context="{\"type\":\"cron\",\"context\":\""+cron+"\"}"
		}
		if(timerType=="frequency"){
			var frequency=$("#frequency").val();
			var interval=$("#interval").val();
			if(val.isBlank(frequency)){
				util.alert("重复执行次数必输");
				isSubmit=false;
				return false;
			}
			if(val.isBlank(interval)){
				util.alert("执行间隔必输");
				isSubmit=false;
				return false;
			}
			if(!vailRe(frequency)){//校验重复次数
				return false;
			}
			context="{\"type\":\"frequency\",\"context\":{\"number\":\""+frequency+"\",\"interval\":\""+interval+"\"}}"
		}
		if(timerType=="class"){
			var trigName=$("#trigName").val();
			if(val.isBlank(trigName)){
				util.alert("自定义触发器必输");
				isSubmit=false;
				return false;
			}
			context=""
		}
		isSubmit=true;
		return true;
	}
	
	function analyClsCode(clsCode,type){
		$.ajax({
			type: "POST",
		    dataType: "json",
		    async:false,
		    url: "${path}sys/trigMagAction_analyClsCode.ms?",
		    data:{'paraMap.clsCode':clsCode},
			success: function(data){
				if(data.ajaxMap.status=="false"){
					isSubmit=false;
					if(type=="lis"){
						util.alert("自定义监听器"+data.ajaxMap.info)
					}
					if(type=="trig"){
						util.alert("自定义触发器"+data.ajaxMap.info)
					}
				}else{
					isSubmit=true;
				}
			},
			error: function(msg){
				util.closeLoading();
				util.alert("error:"+msg);
			   }
				
			});
	}
	function selectWork(){
		var checkId=$("#checkId").val();
		var type=$("#type").val();
		var workDec=$("#workDec").val();
		var workModuleId=$("#workModuleId").val();
		var userDataAuth=$("#userDataAuth").val();
		var mcIframeName = window.frameElement.name; //外层iframe的name
		var url = "${path}sys/trigMagAction_checkTask.ms?paraMap.workModuleId="+workModuleId+"&paraMap.checkId="+checkId+"&paraMap.type="+type+"&paraMap.workDec="+workDec+"&mcIframeName="+mcIframeName+"&paraMap.userDataAuth="+userDataAuth+"&paraMap.queryType='checkTask'";;
		showPopWin(url, 910, 570,null,"<dict:lang value="触发器事务" /> <dict:lang value="选择" />");	
	}
	function updateCheckData(type,id,workDec,workModuleId){
		var param="{}"
		var json="{'id':'"+id+"','type':'"+type+"','param':"+param+"}"
		$("#workMessage").val(json);
		$("#workDec").val(workDec);
		$("#checkId").val(id);
		$("#workModuleId").val(workModuleId);
		$("#type").val(type);
	}
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	var form;
	$(function(){
		layui.use('form', function(){
	    	form = layui.form;
	    	form.render();
	    	  
           	form.on('submit(filterSubmit)', function (data) {
           		$("#USER_DATA_AUTH").val($("#userDataAuth").val());
           	document.getElementById("curIframeName").value=window.frameElement.name;
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
				       
			}) 
			
			form.on('radio(changeTimer)', function(data){
				//console.log(data.elem); //得到select原始DOM对象
				//console.log(data.value); //得到被选中的值
				//console.log(data.othis); //得到美化后的DOM对象
				
				//alert(data.value);
				changeTimer(data.value);
			
		 	});
        	form.on('select(userDataAuth1)', function(data){
           		$("#workMessage").val("");
        		$("#workDec").val("");
        		$("#checkId").val("");
        		$("#workModuleId").val("");
        		$("#type").val("");
				$("#USER_DATA_AUTH").val($("#userDataAuth").val());
		 	});
			
	    });
	    
	})
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>