<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<title><dict:lang value="断点调试" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="chosen" value="1" />
		</jsp:include>
		<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
		
    	
		<link href="${path}buss/taskCenter/css/taskCenter.css?_mc_res_version=<%=PlfStaticRes.TASKCENTER_CSS %>" rel="stylesheet" type="text/css" />
		
		<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="dhtmlxtree" value="1" />
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
		<jsp:param name="zTree" value="1" />
	</jsp:include>
	
		 <link rel="stylesheet" href="${path}plf/style/debug/font.css">
    	<link rel="stylesheet" href="${path}plf/style/debug/debug.css">
		<link rel=stylesheet href="${path}plf/js/debug/codeMirror/doc/docs.css">
		<link rel="stylesheet" href="${path}plf/js/debug/codeMirror/lib/codemirror.css">
		<link rel="stylesheet" href="${path}plf/style/debug/codeMirror/blackboard.css">
		<link rel="stylesheet" href="${path}plf/style/debug/debug_deep.css">
		<script src="${path}plf/js/debug/codeMirror/lib/codemirror.js"></script>
		<script src="${path}plf/js/debug/codeMirror/mode/javascript/javascript.js"></script>
    	<style>
	
	  li{
	  	   
	  	    cursor: default;
	  }
	   .item-Class{
	   		padding-left: 20px;
    		background: url(${path}plf/js/dhtmlxtree/imgs/csh_books/plus.gif) no-repeat;
    		margin-left: 5px;
    		
	  } 
	   .item-Class-active{
	   		padding-left: 20px;
    		background: url(${path}plf/js/dhtmlxtree/imgs/csh_books/minus.gif) no-repeat;
    		margin-left: 5px;
      } 
	  .item-Class:hover {
    		color:#d084c6;;
    		
	  } 
	  
	  .item-Class:hover li{
			color:#ccc;
		}
	  .close-li{
	  	  display: none;
	  }
	  .open-li{
	  		padding-left: 20px;
	  		margin-left: 20px;
	  	  	display: block;
	  	  	background: url(${path}plf/js/dhtmlxtree/imgs/csh_books/blank.gif) no-repeat;
	  }
	   .open-li-active{
	   		padding-left: 20px;
	  		margin-left: 20px;
	  	  	display: block;
	  	  	background-color: #494a50;
	  	  	
	  }
	  ul {
    	margin: 0;
    	padding-left: 0px;
	 }
	  .breakpoints {width: .8em;}
      .breakpoint { color: #822; }
      .table{
      	width: 97%;
      }
	  .table tr td{ border:1px #565555 solid;
	  	width: 50%;
	  	padding-left: 7px;
	  }
	  
	    .table tr td input{
	   		border: 0px saddlebrown;
	   		background: #262a39;
	   		color:#d4d4c4;
	   		width: 70%;
	   }
	    .add-icon{
	    	padding-left: 20px;
	  		background: url(${path}plf/style/css1/images/button_add.gif?_mc_res_version=20180205) no-repeat;
	  }
	  .CodeMirror-gutters{
	  	border:0px;
	  }
	  .CodeMirror-gutters {
	    /* border-right: 1px solid #ddd; */
	    background-color: #0c1021;
	    white-space: nowrap;
	}
	  .break-class{
	  	    color: #dbdbc0;
	  }
	  .popDiv{
	  	display: none;
	  }
	  .shadow{
	  	display: none;
	  }
	  .popDiv{
	  	width: 506px;
    	height: 275px;
	  }
	  .popDiv .warning{
	  	color: #ff0000;
    	font-size: 15px;
    	margin-top: 10px;
	  }
	  .popDiv .goOn{
	  	font-size: 15px;
    	margin-top: 10px;
	  }
	  .prohibit{
	  	color: #76777b;
	  }
	  .all {
    	width: 100%;
    	margin: 1px auto 0px auto;
	}
	 .layui-layer-content{
	 	color: #676161;
    	
	 } 
	 .layui-btn:hover {
	    opacity: 1;
	    filter: alpha(opacity=80);
	   
	}
	#classContent {
		position: relative;
	}
	.floatImg:hover {
		transition: all 1s;
		transform: rotate(180deg);
	}
	.floatImg {
		position: absolute;
		right: 5px;
		top: 25px;
		transform:rotate(0deg);
		-ms-transform:rotate(0deg); /* Internet Explorer */
		-moz-transform:rotate(0deg); /* Firefox */
		-webkit-transform:rotate(0deg); /* Safari 和 Chrome */
		-o-transform:rotate(0deg); /* Opera */
		z-index: 9999;
		cursor: pointer;
		display: none;
	}
	.floatImgBck {
		display: block;
		width: 60px;
		height: 60px;
		background: url("${path}plf/style/debug/images/synchronization.png") no-repeat center center;
	}
	.frame_class {
    width: 396px;
	}
	
  </style>
	</head>
	<div class="main all">
        <div class='container'>
            <div class="frameset frame_top">
                <div class="frame frame_tree" onclick="hideClass()">
                    <div class="tab_bar">
                        <div class="tab tab_active"><dict:lang value="线程" /></div>
                        <div class="tab"><dict:lang value="类模式" /></div>
                    </div>
                    <div class="tab_pane">
                        <div class="pane pane_active" >
                            <div class="btns">
                                <span class="icon icon-skip-all resume-icon prohibit" onclick="gotoResume(this)" style="color:#6f6f6d" title="<dict:lang value="释放" />"  ></span>
                                <span class="icon icon-step-out resume-icon prohibit" onclick="gotoStepInto(this)" style="color:#6f6f6d" title="<dict:lang value="步入" />" ></span>
                                <span class="icon icon-step-in  resume-icon prohibit" onclick="gotoNextStep(this)" style="color:#6f6f6d" title="<dict:lang value="下一步" />" ></span>
                                <span class="icon icon-back resume-icon prohibit" onclick="gotostepReturn(this)" style="color:#6f6f6d" title="<dict:lang value="步出" />" ></span>
                                <span class="icon icon-minimize"></span>
                            </div>
                            <div id="threadContent"></div>
                        </div>
                        <div class="pane" style="overflow: hidden;">
                            <div class="btns">
                                <span class="icon icon-refresh" onclick="xtreeLoad()" title="<dict:lang value="刷新" />"></span>
                                <span class="icon icon-minimize"></span>
                            </div>
                            <div class="searchDiv">
                                <span class="icon icon-search"></span>
                                <input type="text" onkeyup="gainClassName(this)" id='currentClassValue'>
                                <div class="btn" onclick="xtreeNodeOpen()">Search</div>
                            </div>
                            <div style="height:calc(100% - 36px);overflow: auto;">
                            <div id="indexTree" class="ztree" style="margin-top:1px;"></div>
                             <div  style="margin-top:1px;margin-left: 30px;display: none" id="searchInfo"></div>
                             </div>
                        </div>
                    </div>
                </div>
                <div class="verticalLine"></div>
                <div class="frame frame_control" >
                    <div class="tab_bar" onclick="hideClass()">
                        <div class="tab tab_active"><dict:lang value="变量" /></div>
                        <div class="tab"><dict:lang value="断点" /></div>
                        <div class="tab"><dict:lang value="表达式" /></div>
                    </div>
                    <div class="tab_pane">
                        <div class="pane pane_active">
                            <div class="btns">
                                <span class="icon icon-minimize"></span>
                            </div>
                            <div id="variables"></div>
                        </div>
                        <div class="pane breakpoint">
                            <div class="btns">
                                <span class="icon icon-add" onclick="popDiv('a')" title="<dict:lang value="添加断点" />" style="display: none"></span>
                                <span class="icon icon-del-dot" onclick="deleteCurrentPoint()" title="<dict:lang value="删除" />"></span>
                                <span class="icon icon-del-all" onclick="deleteAllPoint()" title="<dict:lang value="删除全部" />"></span>
                                <span class="icon icon-checkbox-h" onclick="selectAll()" style="float: none;" title="<dict:lang value="全部选中" />"></span>
                                <span class="icon icon-checkbox" onclick="selectNoAll()" style="float: none;" title="<dict:lang value="全部不选" />"></span>
                                <span class="icon icon-minimize"></span>
                            </div>
                            <div class="list">
                                <ul id='BreakPointTarget'>
                                    
                                </ul>
                            </div>
                            <div class="bottom" style="background-color: #262a39;">
                                
                                
                            </div>
                        </div>
                        <div class="pane" id="expression">
                            <div class="btns">
                            	<span class="icon icon-del-dot" onclick="deleteExpression()" title="<dict:lang value="删除表达式" />"></span>
                                <span class="icon icon-minimize" ></span>
                            </div>
                            <table class="table">
                            	<thead>
                            	<tr>
                            		<td> <dict:lang value="内容" /></td>
                            		<td> <dict:lang value="结果" /></td>
                            	</tr>
                            	</thead>
                            <tbody id="expressValue">
                            <tr  class='express-class'>
                            	<td onclick="addExpression(this)"  name='999'><li class="add-icon">add new expression</li></td>
                            	<td id='999'  onclick="expressionValueClick(this)" class="express-value"></td>
                            </tr>
                            </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="acrossLine"></div>
            <div class="frameset frame_center">
                <div class="frame frame_main">
                	<div class="floatImg" onclick="determineInfo()">
                        	<span class="floatImgBck"></span>
                        </div>
                    <div class="btns">
                        
                       <!--  <span class="icon icon-save" onclick="closeDebugPage()"></span> -->
                    </div>
                    <div class="more">别人
                        <ul>
                            <li><span class="icon icon-selected"></span><p>Llllzzz33.java</p></li>
                            
                        </ul>
                    </div>
                    <div class="tab_bar" id='classTitle'>
                        <div class="tab tab_active " ><span id='currentClass'>Llllzzz33</span><span class="icon icon-close" onclick="closeTagView(1001,this)"></span></div>
                       	  <div class="tab tab_no" style="display: none"><span id="nofindClass"></span><span class="icon icon-close" onclick="closeNoClass()"></span></div>
                       
                    </div>
                    <div class="tab_pane " id='classContent' >
                        <div class="pane pane_active ">
                           <textarea id="code" name="code" ></textarea>
                        </div>
                         <div class="pane  pane_no" style="text-align: center;padding-top: 5%;display: none">
                           	<img src="${path}plf/style/debug/images/noCode.png" >
                           	<div style="color: #c1c5c5;"><dict:lang value="搜索不到代码" /></div>
                        </div>
                        
                        
                    </div>
                </div>
                <div class="verticalLine"></div>
                <div class="frame frame_class">
                    <div class="btns">
                        <span class="icon icon-minimize"></span>
                    </div>
                    <div class="tab_bar">
                        <div class="tab tab_active"><dict:lang value="类结构" /></div>
                    </div>
                    <div class="tab_pane">
                        <div class="pane pane_active" id='classStructs'></div>
                    </div>
                </div>
            </div> 
            <div class="acrossLine"></div>
            <div class="frameset frame_bottom">
                <div class="frame frame_log">
                    <div class="btns">
                        <span class="icon icon-lock" onclick="consoleSwitch(this)" title="<dict:lang value="关闭" />"></span>
                        <span class="icon icon-clear" onclick="clearDuty()" title="<dict:lang value="清除" />"></span>
                        <span class="icon icon-minimize"></span>
                    </div>
                    <div class="tab_bar">
                        <div class="tab tab_active"><dict:lang value="控制台" /></div>
                    </div>
                    <div class="tab_pane">
                        <div class="pane pane_active" id="logInfo">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="menu"></div>

        <div class="shadow" style="display:none"></div>
       	<div class="popDiv" id="codeSynch" style="display:none"><!-- id记得自己改 -->
            <div class="h" style="font-size: 15px"><dict:lang value="提示信息" /><span class="icon icon-close" onclick="cancelWindow()"></span></div>
            <div class="b" style="text-align: center">
                <div class="warning"><dict:lang value="页面代码已经发生变更," /></div>
                <div class="warning"><dict:lang value="需要重新加载类代码，否则调试代码将无法同步。" /></div>
                <div class="goOn"><dict:lang value="此操作将会中断当前调试线程，是否继续" /></div>
                <div style="margin-top: 30px;">
                	<button class="layui-btn" onclick="determineInfo()"><dict:lang value="继续" /></button>
                	<button class="layui-btn  layui-btn-primary" onclick="cancelWindow()"><dict:lang value="取消" /></button>
                </div>
            </div>
        </div>
        <div class="popDiv" id="b" style="display:none"><!-- id记得自己改 -->
            <div class="h">条件断点<span class="icon icon-close"></span></div>
            <div class="b">
                <div class="row">
                    <div class="left">Type:</div>
                    <div class="right">com.xxxx</div>
                </div>
                <div class="row">
                    <div class="left">LineNumber:</div>
                    <div class="right">37</div>
                </div>
                <div class="row">
                    <div class="left">Member:</div>
                    <div class="right">int main(sting)</div>
                </div>
                <div class="row">
                    <div class="checkbox"><span class="icon icon-checkbox"></span>被捕获</div>
                </div>
                <div class="row">
                    <div class="checkbox"><span class="icon icon-checkbox"></span>启用条件</div>
                    <div class="radiobox"><span class="icon icon-radio"></span>当条件为true</div>
                    <div class="radiobox"><span class="icon icon-radio"></span>当变量值发生变化</div>
                </div>
                <textarea></textarea>
                <div class="row" style="text-align:center;">
                    <div class="btn">提交</div>
                    <div class="btn btn2">取消</div>
                </div>
            </div>
        </div>
    </div>
	<s:hidden name="paraMap.ipport" id="ipport"> </s:hidden>
    <s:hidden name="paraMap.proName" id="proName"> </s:hidden>
    <script>
    var dutyCount=1;//摩尔日志开始行数
    var methodPos=new Array();//方法位置数组
    var pointArray=new Array();//设置断点数组
    var currentThead="";//当前线程
    var currentExpress=1000;
    var currentExpressParentObj;//当前表达式父类
    var currentExpressObject;
    var curentExpressId;//当前表达式id
    var currentPointLine=0;
    var addBreakLine=0;//断点位置
    var addBreakArray=new Array();//断点数组
    var expressionArray=new Array();//变量表达式
    var responseClassName;//返回类名称
   	var currentClassName=localStorage.currentClassName;//当前类名称
   	var currentPackage=localStorage.packageName;
   	var currentClass=localStorage.className;
   	var currentPointLiValue;//当前断点选中节点
   	var currentPointLiId;
   	var editorDataArray=new Array();//装载类数组
   	var editorArray=new Array();//装载编辑器数组
   	var currentEditor;//当前编辑器
   	var lastSelectEditor;//上一行被选中文本
   	var pointDataArray;//断点数据
   	var pointResponseFlag=false;//断点返回情况
   	var socketResponseFlag=false;//断点返回情况
 	var expressionResponseFlag=false;//表达式返回情况
   	var zTreeclickValue=true;//树点击标志未
   	var pageThreadArray=new Array();//线程数组
   	var debugFlag='${debugFlag}';//页面断点标志
   	var startTmep='${is_debug}';
   	var HitTargetJson={image:""};//命中断点信息
   	var threadFlagTemp=false;//线程存在
   	var pointInitLast=false;//断电初始化结束
   	var expressInitLast=false;//表达式初始化结束
   	if(startTmep!="TRUE"){
   		util.initLangMap('["非调试状态"]');
		util.alert(util.getLangShow("非调试状态"));
   		
   	}
   	
    document.onkeydown=function(event){
        var e = event || window.event || arguments.callee.caller.arguments[0];
        
        if(e && e.keyCode==116){ // 按F5步入
        	gotoStepInto();
          }
        if(e && e.keyCode==117){ // 按 F6 下一步
        	gotoNextStep();
           }            
         if(e && e.keyCode==118){ // 按  F7 返回
        	 gotostepReturn();
        }
         if(e && e.keyCode==119){ // 按  F8跳过
        	 gotoResume();
        }
    }; 
    $(".popDiv").css('display','none');//隐藏弹窗
    $(".shadow").css('display','none');
    $("#currentClass").html(currentClass);//当前类
    $("#currentClass").parent().attr("name",localStorage.codeId);
    $("#currentClass").parent().addClass(localStorage.codeId);//父类添加class
    $("#code").parent().addClass(localStorage.codeId);//父类添加class
    $("#currentClass").siblings().attr("name",localStorage.codeId);
    xtreeLoad();//树加载
   	//初始化编辑器
    var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
    	  lineNumbers: true,
    	  gutters: ["CodeMirror-linenumbers", "breakpoints"]
    	});
   	var classJson={"classId":localStorage.codeId,"className":localStorage.className,packageName:localStorage.packageName,editor:editor,classNameValue:localStorage.currentClassName,codeType:localStorage.codeType};
   	editorDataArray.push(classJson);
   	editor.on("gutterClick", eventFn);
    	function eventFn(cm, n,type) {
    		  var info = cm.lineInfo(n);
    		  console.log(info.gutterMarkers);
    		  cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? deleteMarker(n,type,cm) : makeMarker(n,cm));
    		 
    	}
    	editor.setOption("theme", "blackboard");
    	
    	/**
    	 * 当前断点调试
    	 * param:cm(编辑器)
    	 * param:n(所处行号 )
    	 */
    	function eventCurrentPoint(cm, n) {
    		HitTargetJson.editor=cm;
    		HitTargetJson.line=n;
    		var addBreakFlag=false;
    		var currentEditorValue;
    		for(var i=0;i<pointArray.length;i++){
    			if(pointArray[i].line==(n+1)&&pointArray[i].editor==cm){
    				addBreakFlag=true;
    				currentEditorValue=pointArray[i].editor;
    				break;
    			}
    		}
    		if(lastSelectEditor!=undefined){//移除上一步跳转编辑器记录
    			lastSelectEditor.editor.setGutterMarker(lastSelectEditor.line, "breakpoints", null);
    			lastSelectEditor.editor.setSelection({line:lastSelectEditor.line,ch:0},{line:lastSelectEditor.line,ch:0});
    		}
    		if(addBreakFlag){//下一步在断点内
    			
    			var info = cm.lineInfo(n);
    	  		var marker = document.createElement("div");
    	  		 marker.innerHTML = "<img src='${path}plf/style/debug/images/shot-point.png' style='width: 30px;margin-top: 4px'>";
    	    	cm.setGutterMarker(n, "breakpoints", marker);
    	    	cm.setSelection({line:n,ch:0},{line:n,ch:1000});
    	    	currentPointLine=n;
    	    	for(var i=0;i<pointArray.length;i++){
    	    		if(n!=pointArray[i].line-1&&currentPointLine!=pointArray[i].editor){
    	    		var marker = document.createElement("div");
    	    		marker.innerHTML = "<img src='${path}plf/style/debug/images/break-point.png' style='width: 15px;margin-top: 4px'>";
       	        	var line=pointArray[i].line-1;
       	        	pointArray[i].editor.setGutterMarker(line, "breakpoints", marker);
    	    		}
    	    		
    	    	}
    	    	
    			return false;
    			
    		}else{//断点移动
    			cm.setGutterMarker(currentPointLine, "breakpoints", null);
    	    	var info = cm.lineInfo(n);
    	  		var marker = document.createElement("div");
    	  		 marker.innerHTML = "<img src='${path}plf/style/debug/images/go-point.png' style='width: 15px;margin-top: 4px'>";
    	    	cm.setGutterMarker(n, "breakpoints", marker);
    	    	cm.setSelection({line:n,ch:0},{line:n,ch:1000});
    	    	currentPointLine=n;
    	    	lastSelectEditor={editor:cm,line:n};//装载当前编辑器记录行
    	    	for(var i=0;i<pointArray.length;i++){
    	    		var marker = document.createElement("div");
    	    		marker.innerHTML = "<img src='${path}plf/style/debug/images/break-point.png' style='width: 15px;margin-top: 4px'>";
       	        	var line=pointArray[i].line-1;
       	        	pointArray[i].editor.setGutterMarker(line, "breakpoints", marker);
    	    	}
    		}
    	  
  		}
    	
    	/**
    	 * 验证断点位置
    	 * param:currentLine(当前行号)
    	 */
    	function validatePointArray(currentLine){
    		var validateFlag=false;
    		for(var i=0;i<pointArray.length;i++){
    			if((currentLine+1)==pointArray[i].line){
    				validateFlag=true;
    				break;
    			}
    		}
    		return validateFlag;
    	}
    	/**
    	 * 设置断点
    	 * param:line(行号)
    	 * param:currentEditorParam(当前编辑器   )
    	 */
    	function makeMarker(line,currentEditorParam) {
		if(debugFlag=="false"){
    			return false;
    	}	
    	  addBreakLine=line;
    	  var currentNum=0;
    	  var minPostion=0;//当前行最小数
    	  var maxPostion=0;//当前行最大数
    	  var currentEditorParamData=getEditorMessageByEditor(currentEditorParam);
    	  currentPackage=currentEditorParamData.packageName;
    	  currentClass=currentEditorParamData.className;
    	  for(var i=0;i<line;i++){
    		  var currentText=currentEditorParam.getLine(i);
 			 currentNum+=currentText.length+1; //换行占位符 
    	  }
    	 
    	  var currentText=currentEditorParam.getLine(line);
    	  minPostion=currentNum;
    	  maxPostion=currentNum+currentText.length;
    	  for(var i=0;i<currentText.length;i++){
    		  if(currentText.charAt(i)=="\t"||currentText.charAt(i)==" "){
    			  currentNum++;//空格字符
    		  }else{
    			  break;
    		  }
    	  }
    	  var resultJson=validateCurrentMethod(minPostion,maxPostion,currentNum);//验证断点是否在方法内
    	  currentNum=resultJson.currentNum;
    	  line++;
    	  var flag=false;
    	  var resultData;
    	  //异步去添加断点
    	  $.ajax({
    			type : "POST",
    			dataType : "text",
    			async:false, 
    			url : "${path}sys/pageDebugAction_addBreakPoint.ms",
    			data:{"paraMap.colNum":line,//行号
    				"paraMap.charNum":currentNum,//行位置
    				"paraMap.packageName":currentPackage,//当前包名
    				"paraMap.javaName":currentClass,//当前类名
    				"paraMap.clsCode":currentEditorParam.getValue(),
    				"paraMap.paramType":resultJson.paramType,
    				"paraMap.codeType":currentEditorParamData.codeType,
    			},
    			
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
    				var data= JSON.parse(data);
    				resultData=data;
    				if(data.ajaxMap.flag=="true"){
    					flag=true;
    					var pointFlag=true;
    					for(var i=0;i<pointArray.length;i++){
    						if(pointArray[i].line==line&&(currentEditorParam==pointArray[i].editor)){
    							pointFlag=false;
    							pointArray[i].breakPointId=data.ajaxMap.breakPointId;
    							break;
    						}
    					}
    					if(pointFlag){//添加断点到标题栏
    						var editorJson=getEditorMessageByEditor(currentEditorParam);
    						var lineIdValue=currentEditorParamData.classId+line;
    						var html="<li id='"+lineIdValue+"' class='break-class' name='"+editorJson.classNameValue+"' title='"+line+"'  style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;-webkit-text-overflow:ellipsis;'><span class='icon icon-checkbox-h' ></span>"+editorJson.classNameValue+"("+"line:"+line+")</li>";
        					 var liFlag=false;//断点信息添加标志
        					 $(".break-class").each(function(){
        					 		var lineValue=parseInt($(this).attr("title"));
        					 		if(lineValue==line&&($(this).attr("name")==editorJson.classNameValue)){
        					 			liFlag=true;
        					 			$(this).find('.icon').removeClass('icon-checkbox').addClass('icon-checkbox-h');//增加断点
        					 		}
        					 })
        					 if(!liFlag){//未添加
        					 	$("#BreakPointTarget").append(html);
        					 }
        					 var pointTempFlag=true;
        					for(var i=0;i<pointArray.length;i++){
        						if((pointArray[i].classNameValue==currentEditorParamData.classNameValue)&&(pointArray[i].line==line)){
        							pointArray[i].breakPointId=data.ajaxMap.breakPointId;
        							pointArray[i].editor=currentEditorParam;
        							pointTempFlag=false;
        						}
        					}
        					if(pointTempFlag){
        						var json={line:line,breakPointId:data.ajaxMap.breakPointId,editor:currentEditorParam,className:currentClass,classNameValue:currentEditorParamData.classNameValue};
    							pointArray.push(json);//断点添加数组
        					}
        					
        					
    						var pointKeyName=new Array();
    						var currentPointArray=new Array();
    						for (var key in pointDataArray){
			    				pointKeyName.push(key);
			    			}
    						for (var i=0;i<pointKeyName.length;i++){
    							var pointKey=pointDataArray[pointKeyName[i]];
    							 var className=pointKey.className;
			    				 var colNum=parseInt(pointKey.colNum);
			    				 if(className==currentClass&&colNum==line){
			    				 	delete pointDataArray[pointKeyName[i]];
			    				 	break;
			    				 }
    						}
    						var breakPointId=data.ajaxMap.breakPointId;
    						pointDataArray[breakPointId]={breakPointId:data.ajaxMap.breakPointId,charNum:currentNum,className:currentClass,colNum:line,packageName:currentPackage};
    						
    					}
    					
    				}
    				
    				
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
    	  if(flag&&resultData.ajaxMap.result!="1"){
    		  var marker = document.createElement("div");
        	  marker.innerHTML = "<img src='${path}plf/style/debug/images/break-point.png' style='width: 15px;margin-top: 4px'>";
        	  return marker;
        	  
    	  }else if(flag&&resultData.ajaxMap.result=="1"){
    		  var marker = document.createElement("div");
        	 	marker.innerHTML = "<img src='${path}plf/style/debug/images/break-point_no.png' style='width: 15px;margin-top: 4px'>";
        	  return marker;
    	  }
    	  
    	}
    	
    	
    	 /**
     	 * 获取断点信息
     	 */
    	function getUserBugMsg(){
    		expressionResponseFlag=true;
    		if(debugFlag=="false"){
    			return false;
    		}
    		 $.ajax({
	    			type : "POST",
	    			dataType : "text", 
	    			async:false, 
	    			url : "${path}sys/pageDebugAction_getUserBugMsg.ms",
	    			success : function(data) {
	    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
	    				if(resultJson.result==false){
	    					
	    					return false;
	    				}
	    				data=JSON.parse(data);
	    			
	    				var ajaxMap=data.ajaxMap;
	    				var point=ajaxMap.point;
	    				var express=ajaxMap.express;
	    				if(point!="null"&&point!=null&&point.length>0){
	    					var pointKeyName=new Array();
	    					point=JSON.parse(point);
	    					pointDataArray=point;
	    					 for (var key in point){
	    						 pointKeyName.push(key);
	    					 }
	    					 for(var i=0;i<pointKeyName.length;i++){
	    						 var curentPoint=point[pointKeyName[i]];
	    						 var className=curentPoint.packageName+"."+curentPoint.className;
	    						 var colNum=parseInt(curentPoint.colNum)-1;
	    						 if(!( validateClassNameEditorDataArray(className))){
	    						 	
	    							 eventFn(currentEditor, colNum);
	    						 }else{
	    						 	addOtherPoint(curentPoint);
	    						 }
	    						
	    					 }
	    					
	    				}else{
	    					pointDataArray=new Object();
	    					
	    				}
	    				pointInitLast=true;
	    				 if(express!="null"&&express!=null&&express.length>6){
							 express="3"+express;
							 var resultArray=analysisExpression(express);
							 var html="";
							 for(var i=0;i<resultArray.length;i++){
							 	var expressionFlag=false;
					      		for(var j=0;j<expressionArray.length;j++){
					      			if(expressionArray[j]==resultArray[i]){
					      				expressionFlag=true;
					      			}
					      		}
							 
							 	 if(resultArray[i].key!=""&&(!expressionFlag)){
							 	 	   currentExpress++;
									html+="<tr><td name='"+currentExpress+"'><span></span><input type='text' onblur='editExpression(this)' name='"+currentExpress+"' value='"+resultArray[i].key+"' class='express-value-class'></td>"+
								    	"<td id='"+currentExpress+"' onclick='expressionValueClick(this)' class='express-value'></td>"+
										"</tr>";
									//sendExpressToHost(resultArray[i].key);
									expressionArray.push(resultArray[i].key);
							 	 }
								
								
							 }
							 $(".table").prepend(html);
							  $(".express-value-class").each(function(){
							       editExpression(this);
							  });
							 
							 
						 }
						 initAllInfo();
						 
						
	    			},
	    			error : function(msg) {
	    				alert();
	    			}
	    		});
    	} 
    	 /**
    	 * 增加表达式到后台
    	 * param:currentExpress(表达式内容)
    	 */
    	 function sendExpressToHost(currentExpress){
    	 	$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_addBreakPointForExpress.ms",
    			data:{
    				"paraMap.threadId":null,
    				"paraMap.expression":currentExpress
    			},
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
    	 
    	 }
    	 
		/**
    	 * 获取编辑器详细内容
    	 * param:currentEditorParam(编辑器内容)
    	 */
		function getEditorMessageByEditor(currentEditorParam){
			var json;
			for(var i=0;i<editorDataArray.length;i++){
				if(currentEditorParam==editorDataArray[i].editor){
					json=editorDataArray[i];
					break;
				}
			}
			return json;
		}
		/**
    	 * 通过类名称获取编辑器内容
    	 * param:classNameValue(类名称)
    	 */
		function getEditorMessageByClassName(classNameValue){
			var json;
			for(var i=0;i<editorDataArray.length;i++){
				if(classNameValue==editorDataArray[i].className){
					json=editorDataArray[i];
					break;
				}
			}
			return json;
		}
		
		/**
    	 * 通过类名称获取编辑器内容
    	 * param:classNameValue(类名称)
    	 */
		function getEditorMessageByAllClassName(classNameValue){
			var json;
			for(var i=0;i<editorDataArray.length;i++){
				if(classNameValue==editorDataArray[i].classNameValue){
					json=editorDataArray[i];
					break;
				}
			}
			return json;
		}
		
		
		/**
    	 * 通过类id获取编辑内容
    	 * param:classNameValue(类名称)
    	 */
		function getEditorMessageByCodeId(codeId){
			var json;
			for(var i=0;i<editorDataArray.length;i++){
				if(codeId==editorDataArray[i].classId){
					json=editorDataArray[i];
					break;
				}
			}
			return json;
		}
		
		/**
    	 * 隐藏类
    	 */
		function hideClass(){
			$("#searchInfo").hide();
			$("#indexTree").show();
			$(".express-class").css({"background":"#262a39"});
      		$(".table tr").css({"background":"#262a39"});
      		$(".table tr td input").css({"background":"#262a39"});
		}
		/**
    	 * 获取后台类名
    	 */
		function gainClassName(obj){
		
			 $.ajax({
	    			type : "POST",
	    			dataType : "text",
	    			async:false, 
	    			url : "${path}sys/pageDebugAction_gainClassName.ms",
	    			data:{"paraMap.className":$(obj).val().replace(/^\s+|\s+$/g,"")//去除空格号
	    			},
	    			
	    			success : function(data) {
	    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
	    				if(resultJson.result==false){
	    					
	    					return false;
	    				}
	    				data=JSON.parse(data);
	    				var ajaxList=data.ajaxList;
	    				var ajaxMap=data.ajaxMap;
	    				var codeType=ajaxMap.codeType;
	    				var html="";
	    				var countValue=0;
	    				for(var i=0;i<ajaxList.length;i++){
	    					if(ajaxList[i][codeType]!=null&ajaxList[i][codeType]!=""&ajaxList[i][codeType]!='null'){
	    						html+="<div style='border-bottom: 1px solid #251e1e' onclick='selectCurrent(this)'>"+ajaxList[i][codeType]+"</div>";
	    						countValue++;
	    					}else if(ajaxList[i]["REL_CLASS_NAME"]!=null&ajaxList[i]["REL_CLASS_NAME"]!=""&ajaxList[i]["REL_CLASS_NAME"]!='null'){
	    						html+="<div style='border-bottom: 1px solid #251e1e' onclick='selectCurrent(this)'>"+ajaxList[i]["REL_CLASS_NAME"]+"</div>";
	    						countValue++;
	    					}
	    					if(countValue==10){
	    						break;
	    					}	
	    				}
	    				$("#searchInfo").html(html);
	    				$("#searchInfo").show();
	    				$("#indexTree").hide();
	    				
	    					
	    			},
	    			error : function(msg) {
	    				alert();
	    			}
	    		});
		}
		/**
    	 * 获取选中内容
    	 */
		
		function selectCurrent(obj){
			var currentHmml=$(obj).html();
			$("#currentClassValue").val(currentHmml);
			$("#searchInfo").hide();
			$("#indexTree").show();
		}
		
		/**
    	 * 获取编辑器详细内容
    	 * param:obj(当前对象)
    	 * param:line(行号)
    	 */
		function detailBreakPoint(obj,line){
			
			 if($(this).hasClass('icon-checkbox')){
	                $(this).removeClass('icon-checkbox').addClass('icon-checkbox-h');
	                //makeMarker(line);
	            }else{
	                $(this).removeClass('icon-checkbox-h').addClass('icon-checkbox');
	                //deleteMarker(line);
	        } 
		}
		/**
    	 * 删除断点
    	 * param:line(当前行号)
    	 * param:type(类型1 移除css样式)
    	 */
    	function deleteMarker(line,type,editorValue){
    		line++;
    		for(var i=0;i<pointArray.length;i++){
    			if(line==pointArray[i].line&&editorValue==pointArray[i].editor){
    				var breakPointId=pointArray[i].breakPointId;
    				 $.ajax({
    		    			type : "POST",
    		    			dataType : "text",
    		    			async:false, 
    		    			url : "${path}sys/pageDebugAction_delform.ms",
    		    			data:{"paraMap.breakPointId":breakPointId
    		    			},
    		    			
    		    			success : function(data) {
    		    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
			    				if(resultJson.result==false){
			    					
			    					return false;
			    				}
			    				
    		    				if(type!=1){
    		    				 var currentEditorParamData=getEditorMessageByEditor(editorValue);
       	        				 var pointId="#"+currentEditorParamData.classId+pointArray[i].line;
       		    				 	$(pointId).remove();
       		    				 	pointArray.removeValue(pointArray[i]);
       		    				 	delete pointDataArray[breakPointId];
       		    				}else{
       		    					 pointArray.removeValue(pointArray[i]);
       		    				 	delete pointDataArray[breakPointId];	
       		    				}
    		    				
    		    				
    		    			},
    		    			error : function(msg) {
    		    				alert();
    		    			}
    		    		});
    				
    			}
    		}
    		
    		if(HitTargetJson.editor==editorValue&&HitTargetJson.line==(line-1)&&pointResponseFlag){
    			if(HitTargetJson.image==""){
    				var marker = document.createElement("div");
	    	  		 marker.innerHTML = "<img src='${path}plf/style/debug/images/go-point.png' style='width: 15px;margin-top: 4px'>";
	    	  		 line--;
	    	    	editorValue.setGutterMarker(line, "breakpoints", marker);
	    	    	HitTargetJson.image="go-point.png";
	    	    	return marker;
    			}else{
    				 line--;
    				
    				makeMarker(line,editorValue);
    				var marker = document.createElement("div");
    			    marker.innerHTML = "<img src='${path}plf/style/debug/images/shot-point.png' style='width: 30px;margin-top: 4px'>";
    				editorValue.setGutterMarker(line, "breakpoints", marker);
    				HitTargetJson.image="";
    				return marker;
    			}
    			
    		}else{
    			return null;
    		}
    		
    	}
  		loadClsCode();
    	/**
    	 * 获取后台类代码
    	 */
    	function loadClsCode(){
    		$.ajax({
			type : "POST",
			dataType : "text",
			url : "${path}sys/pageDebugAction_loadClsCodeByClassName.ms",
			data:{"paraMap.className":localStorage.beforeCurrentClassName,
				"paraMap.codeType":localStorage.codeType,
				"paraMap.codeId":localStorage.codeId
			},
			success : function(data) {
				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
				data=JSON.parse(data);
				//后台查找不到代码
				if(data.ajaxMap!="null"&&data.ajaxMap!=null){
				editor.setValue(data.ajaxMap.classCode);
				currentEditor=editor;
				getClassStructs();
				getUserBugMsg();
				}
			},
			error : function(msg) {
				alert();
			}
		});
    	}
    	/**
    	 * 通过className获取类源码
    	 */
    	function loadClsCodeByClassName(obj,num,lineNum){
    		expressionValidate();
    		var classNameValue=$(obj).attr("name");
    		var classNameclassLength=classNameValue.lastIndexOf(".");
    		classNameValue=classNameValue.substring(0,classNameclassLength);//包名称
    		classNameclassLength=classNameValue.lastIndexOf(".");
    		var classNameTemp=classNameValue.substring(classNameclassLength+1,classNameValue.length);//类名
    		//classNameValue=classNameValue.substring(0,classNameclassLength);//包名称
    		if(!validateClassNameEditorDataArray(classNameValue)){
    			var classNameValueTemp;
    			for(var i=0;i<editorDataArray.length;i++){
	    			if(classNameValue==editorDataArray[i].classNameValue){//调用类树方法
	    				classNameValueTemp=editorDataArray[i].classId;
	    			}
    			}
    				
    			 $("."+classNameValueTemp).each(function(){
        		     if($(this).hasClass("tab")){
        		    	 $(this).addClass('tab_active')
                         .siblings('.tab')
                         .removeClass('tab_active')
                 	}else{
        		    	 $(this).addClass('pane_active')
                         .siblings('.pane')
                         .removeClass('pane_active')
        		     }
        		  });
    			 $.ajax({
 	    			type : "POST",
 	    			dataType : "text",
 	    			async:false, 
 	    			url : "${path}sys/pageDebugAction_skipFrame.ms",
 	    			data:{"paraMap.threadId":$(obj).attr("title"),
 	    				"paraMap.num":num
 	    			},
 	    			success : function(data) {
 	    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
	    				if(resultJson.result==false){
	    					
	    					return false;
	    				}
 	    				var currentJson=getEditorMessageByAllClassName(classNameValue);
 	    				if(currentJson!=undefined){
 	    					lineNum--;
 	    					eventCurrentPoint(currentJson.editor,lineNum);
 	    					currentJson.editor.setSelection({line:lineNum,ch:0},{line:lineNum,ch:1000});
 	    					currentThead=$(obj).attr("title");
 	    				}
 	    				
 	    			},
 	    			error : function(msg) {
 	    				alert();
 	    			}
 	    		});
    			
    			
    			
    		}else{
	    		addClassCodeByClassName(classNameValue);
    		}
    		
    	}
    	/**
    	 *根据类全名获取类信息
    	 */
    	function addClassCodeByClassName(classNameValue){
    		$.ajax({
	    			type : "POST",
	    			dataType : "text",
	    			url : "${path}sys/pageDebugAction_loadClsCodeByClassName.ms",
	    			data:{"paraMap.className":classNameValue,
	    			},
	    			async: false,
	    			success : function(data) {
	    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
	    				if(resultJson.result==false){
	    					
	    					return false;
	    				}
	    				data=JSON.parse(data);
	    				//后台查找不到代码
	    				if(data.ajaxMap=="null"||data.ajaxMap==null){
	    					 $('.tab_no').siblings('.tab').removeClass('tab_active');
	    					 $('.pane_no').siblings('.pane').removeClass('pane_active');
	    					 $('.tab_no').addClass('tab_active');
	    					 $('.pane_no').addClass('pane_active');
	    					var classNameclassLength=classNameValue.lastIndexOf(".");//获取类全名长度
    						var className=classNameValue.substring(classNameclassLength+1,classNameValue.length);//类名
    						$('#nofindClass').html(className);
	    					 $('.tab_no').show();
	    					 $('.pane_no').show();
	    				}else if(validateeditorDataArray(data.ajaxMap.classId)){
	    					var result=data.ajaxMap;
	    					var packageLength=result.className.lastIndexOf(".");
		    				packageName=result.className.substring(0,packageLength);//包名称
		    				var className=result.className.substring(packageLength+1,result.className.length);//包名称
		    				var classJson={"classId":result.classId,"className":className,packageName:packageName,classNameValue:result.className};
		    				var contentId=timest();
		    				var classTitle="<div class='tab "+data.ajaxMap.classId+"' name='"+data.ajaxMap.classId+"'><span>"+className+"</span><span class='icon icon-close 'name='"+result.classId+"'  onclick='closeTagView("+contentId+",this)'></span></div>";
		    				var classContent="<div class='pane "+data.ajaxMap.classId+"'> <textarea id='"+contentId+"' name='"+contentId+"'></textarea></div>";
		    				$("#classTitle").append(classTitle);
		    				$("#classContent").append(classContent);
		    				$("."+data.ajaxMap.classId).each(function(){
								 if($(this).hasClass("tab")){
									 $(this).addClass('tab_active')
									 .siblings('.tab')
									 .removeClass('tab_active')
								}else{
									 $(this).addClass('pane_active')
									 .siblings('.pane')
									 .removeClass('pane_active')
								 }
								});
		    				
		    				addCodeMirror(result.classCode,contentId,result,classJson,"");
		    				if(editorDataArray.length>10){//类加载超过10个
		    					util.initLangMap('["代码页超过上限,关闭第一个"]');
								util.alert(util.getLangShow("代码页超过上限,关闭第一个"));
								var obj=$(".tab_no").siblings('.tab').eq(0).find("span").eq(1);
								removeFirstCodeMiror(obj);
					
							}
	    				}
	    			},
	    			error : function(msg) {
	    				alert();
	    			}
	    		});
    	
    	}
    	/**
    	 * 树加载
    	 */
    	function xtreeLoad(){
    			var setting = {
				data: {
					simpleData: {
						enable: true,
						pIdKey: "upId"
					}
				},
				callback: {
					onClick: zTreeOnClick,
				},
				async: {
					enable: true,
					url: "${path}sys/pageDebugAction_listPackegeTree.ms",
					autoParam: ["id","codeId"],
					dataFilter: ajaxDataFilter
				},
				edit: {
					enable: true,
					showRemoveBtn: false,
					showRenameBtn: false
				},
				view: {
					fontCss : {color:"#dbdbc0"}
				}
			};
			$.fn.zTree.init($("#indexTree"), setting);
    		/* tree=new dhtmlXTreeObject("indexTree","100%",null,"/");
    		tree.setImagePath("${path}plf/js/dhtmlxtree/imgs/csh_books/");
    		tree.getAllChildless();
    		tree.enableTreeLines(false); 
    		tree.setOnClickHandler(tonclickCallBack);
    		tree.loadXML("${path}sys/pageDebugAction_listPackegeTree.ms");
    		
    		tree.setXMLAutoLoading("${path}sys/pageDebugAction_listPackegeTree.ms"); */
    	}
    		function ajaxDataFilter(treeId, parentNode, responseData) {
			    return responseData.ajaxList;
			};
			
			function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
		        var treeObj = $.fn.zTree.getZTreeObj("indexTree");
		        var node = treeObj.getNodeByParam("id", "0", null);
		        if(node!=null){
		          treeObj.expandNode(node, true, false, true);
		        }
		              
		    };
			function get_selectednode(){
				var selectednode=null;
				
				var treeObj = $.fn.zTree.getZTreeObj("indexTree");
				var node = treeObj.getSelectedNodes();
				if(node!=null){
					selectednode=node[0];
				}
				
				return selectednode;
				
			}
		
		/**
    	 * 树节点打开
    	 */
		function xtreeNodeOpen(){
			var defaultId=$("#currentClassValue").val();
			var treeObj = $.fn.zTree.getZTreeObj("indexTree");
            var treeNode = treeObj.getNodeByParam("id", defaultId, null);
            treeObj.expandNode(treeNode, true, true, true);
            treeObj.selectNode(treeNode);
            $(".curSelectedNode").removeClass("curSelectedNode");//取消节点颜色
		}
		
		/**
    	 * 树点击回调函数
    	 * param:id
    	 * param:cid
    	  * param:row
    	  	tonclickCallBack(id,cid,row)
    	   zTreeOnClick(event, treeId, treeNode)
    	 */
		function zTreeOnClick(event, treeId, treeNode){
				$(".curSelectedNode").removeClass("curSelectedNode");//取消节点颜色
				var result=treeNode.codeId;
				if(!zTreeclickValue||treeNode.isParent){
					zTreeclickValue=true;
					return false;
				}
				zTreeclickValue=false;
				if(result==undefined||result==null||result==""){
					return false;   
				}else if(validateeditorDataArray(result)){
					$.ajax({
		    			type : "POST",
		    			dataType : "text",
		    			url : "${path}sys/pageDebugAction_showView.ms",
		    			data:{
		    				"paraMap.classId":result,
		    				"paraMap.className":treeNode.id
		    			},
		    			success : function(data) {
		    				zTreeclickValue=true;
		    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
		    				if(resultJson.result==false){
		    					
		    					return false;
		    				}
		    				var packageLength=treeNode.id.lastIndexOf(".");
		    				packageName=treeNode.id.substring(0,packageLength);//包名称
		    				var className=treeNode.id.substring(packageLength+1,treeNode.id.length);//类名
		    				var classJson={"classId":result,"className":className,packageName:packageName,classNameValue:treeNode.id};
		    				var contentId=timest();
		    				var classTitle="<div class='tab "+result+"' name='"+result+"' id='"+result+"'><span>"+className+"</span><span class='icon icon-close 'name='"+result+"'  onclick='closeTagView("+contentId+",this)'></span></div>";
		    				var classContent="<div class='pane "+result+"'> <textarea id='"+contentId+"' name='"+contentId+"'></textarea></div>";
		    				$("#classTitle").append(classTitle);
		    				$("#classContent").append(classContent);
		    				var currentId="#"+result;
		    				 var index = $(currentId).index();  //获取点击的是第几个tab
		    		            $(currentId).addClass('tab_active')
		    		                    .siblings('.tab')
		    		                    .removeClass('tab_active');
		    		            //点击的tab添加当前样式，同级的tab移除，pane同理
		    		            $(currentId).parents('.tab_bar')
		    		                    .next('.tab_pane')
		    		                    .find('.pane')
		    		                    .eq(index)
		    		                    .addClass('pane_active')
		    		                    .siblings('.pane')
		    		                    .removeClass('pane_active');
		    				
		    				addCodeMirror(data,contentId,result,classJson,""); 
		    				if(editorDataArray.length>10){//类加载超过10个
		    					util.initLangMap('["代码页超过上限,关闭第一个"]');
								util.alert(util.getLangShow("代码页超过上限,关闭第一个"));
								var obj=$(".tab_no").siblings('.tab').eq(0).find("span").eq(1);
								removeFirstCodeMiror(obj);
					
							}
		    				
		    				
		    			},
		    			error : function(msg) {
		    				alert();
		    			}
		    		});	
				}
				
		}
		/**
    	 * 验证类名
    	 * param:classId(类Id)
    	 */
		function validateeditorDataArray(classId){
			var temp=true;
			for(var i=0;i<editorDataArray.length;i++){
				if(classId==editorDataArray[i].classId ){
					temp=false;
					break;
				}
			}
			return temp;
		}
		/**
    	 * 验证类名
    	 * param:className(类Id)
    	 */
		function validateClassNameEditorDataArray(className){
			var temp=true;
			for(var i=0;i<editorDataArray.length;i++){
				if(className==editorDataArray[i].classNameValue ){
					temp=false;
					break;
				}
			}
			return temp;
		}
		/**
    	 * 验证类名
    	 * param:data(打印数据)
    	 * param:contentId(建立编辑器id)
    	 * param:classId(类id)
    	 * param:classJson(编辑器数据)
    	 */
		function addCodeMirror(data,contentId,classId,classJson,codeType){
			
			 var codeSecond = CodeMirror.fromTextArea(document.getElementById(contentId), {
		    	  lineNumbers: true,
		    	  gutters: ["CodeMirror-linenumbers", "breakpoints"]
		    	});
			 	codeSecond.on("gutterClick", eventFn);
			 	codeSecond.setValue(data);
			 	codeSecond.setOption("theme", "blackboard");
			 	tabSwitch();
			 	classJson.editor=codeSecond;
			 	classJson.codeType=codeType;
			 	editorDataArray.push(classJson);
			 	if(pointDataArray!=undefined){
				 		var pointKeyName=new Array();
					 	 for (var key in pointDataArray){
							 pointKeyName.push(key);
						 }
						 for(var i=0;i<pointKeyName.length;i++){
							 var curentPoint=pointDataArray[pointKeyName[i]];
							  if(curentPoint!=undefined&&curentPoint!=""){
				    			 var classNameValue=curentPoint.packageName+"."+curentPoint.className;
								 var colNum=parseInt(curentPoint.colNum)-1;
								 if(classNameValue==classJson.classNameValue){
									 eventFn(codeSecond, colNum);
								 }
				    		 }
						 }
				 	}
			 	 
			 	
			 currentEditor=codeSecond;
			getClassStructs(); 	
			 	
		}
		
		function tabSwitch(){
		      //tab页切换事件
	        $('.tab_bar').on('click','.tab',function(){
	        	if($(this).hasClass("tab_no")&&$(this).css('display')=="none"){
	        		return false;
	        	}
	            var index = $(this).index();  //获取点击的是第几个tab
	            $(this).addClass('tab_active').siblings('.tab').removeClass('tab_active');
	            var curentHtml=$(this).attr("name");
	            var resultJson=getEditorMessageByCodeId(curentHtml);
	            if(resultJson!=undefined&&editorDataArray.length>0){
	            	currentEditor=resultJson.editor;
	            	currentEditor.setSelection({line:0,ch:0},{line:0,ch:0});
	            	getClassStructs();
	            	
	            }
	            //点击的tab添加当前样式，同级的tab移除，pane同理
	            $(this).parents('.tab_bar')
	                    .next('.tab_pane')
	                    .find('.pane')
	                    .eq(index)
	                    .addClass('pane_active')
	                    .siblings('.pane')
	                    .removeClass('pane_active')
	        })
	        
		}
		/**
    	 * 时间戳
    	 */
		function timest() {
			  var tmp = Date.parse( new Date() ).toString();
			  tmp = tmp.substr(0,10);
			  return tmp;
			}

		/**
    	 * 获取树结构
    	 */
    	function getClassStructs(){
    		var current=currentEditor.getValue();
    		$.ajax({
			type : "POST",
			dataType : "text",
			url : "${path}sys/pageDebugAction_getClassStructs.ms",
			data:{"paraMap.classCode":currentEditor.getValue(),
				
			},
			success : function(data) {
				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
				var data= JSON.parse(data);
				var importList=data.importList;
				var html="<ul ><li class='item-Class'>"+data.packageName+"</li><ul >";
				html+="<ul ><li onclick='registerClick(this)' class='item-Class' switch='off' >import declarations</li>";
				for(var i=0;i<importList.length;i++){
					html+="<li class='close-li' name='"+importList[i].pos+"' onclick='callBackCodeMirror(this,1)'>"+importList[i].importName+"</li>";
				}
				html+="</ul>";
				$("#classStructs").html(html);
				var className=data.classNameList;
				var html="<ul  ><li onclick='registerClick(this)' class='item-Class' switch='off'>"+className[0].name+"</li>";
				var methodList=data.methodList;
				for(var i=0;i<methodList.length;i++){
					var currrentHtml="<li class='close-li' name='"+methodList[i].pos+"' onclick='callBackCodeMirror(this,2)'>"+methodList[i].name+"(";
					var paramArray=	methodList[i].paramType;
					var paramTypeValue="";
					if(paramArray!=null&&paramArray!="null"){
						for(var j=0;j<paramArray.length;j++){
							if(j==paramArray.length-1){
								currrentHtml+=paramArray[j];
								paramTypeValue+=paramArray[j];
							}else{
								currrentHtml+=paramArray[j]+",";
								paramTypeValue+=paramArray[j]+",";
							}
							
							
						}
					}  
					var methodJson={pos:methodList[i].pos,paramType:paramTypeValue};
					methodPos.push(methodJson);
					currrentHtml+=")";
					currrentHtml+="</li>";
					html+=currrentHtml;
					
				}
				html+="</ul>";
				$("#classStructs").append(html);
				
			},
			error : function(msg) {
				alert();
			}
		});
    	}
    	/**
    	 * 注册点击事件
    	 * param:obj(当前对象)
    	 */
    	function registerClick(obj){
    		if($(obj).attr("switch") == "on"){
    			$(obj).attr("switch","off");
    			$(obj).siblings().attr("class","close-li");
    			$(obj).attr("class","item-Class");
    		}else{
    			$(obj).attr("switch","on");
    			$(obj).siblings().attr("class","open-li");
    			
    			$(obj).attr("class","item-Class-active");
    		}
	        
	                        
	           
    	}
    	 /**
     	 * 回调填充codeMirror颜色
     	 * param:obj(当前对象)
     	 * param:type(回调类型)
     	 */
    	function callBackCodeMirror(obj,type){
    		var pos=parseInt($(obj).attr("name"));
    		var countNum=currentEditor.lineCount();
    		var currentNum=0;
    		var currentLine=1;
    		for(var i=0;i<countNum;i++){
    			var currentText=currentEditor.getLine(i);
    			 currentNum+=currentText.length+1;
    			 if(pos<=currentNum){
    			 	currentLine=i;
    			 	break;
    			 }
    		}
    		if(type==1){
    			currentLine++;
    		}
    		
    		var selectLength=currentEditor.getLine(currentLine).length;
    		currentEditor.setSelection({line:currentLine,ch:0},{line:currentLine,ch:selectLength});
    		$(".open-li").attr("class","open-li");
    		$(".open-li-active").attr("class","open-li");
    		$(obj).attr("class","open-li-active");
    	}
    	
    	
     	/**
      	 * 验证断点是否在方法内
      	 * param:minPostion(断点所在开始位置)
      	 * param:maxPostion(断点所在结束位置)
      	 * param:currentNum(断点位置)
      	 */
      	function validateCurrentMethod(minPostion,maxPostion,currentNum){
      		var paramType="";
      		var resultJson={paramType:paramType,currentNum:currentNum};
    		for(var i=0;i<methodPos.length;i++){
    			if((minPostion<=methodPos[i].pos)&&(maxPostion>=methodPos[i].pos)){
    				resultJson.currentNum=methodPos[i].pos;
    				resultJson.paramType=methodPos[i].paramType;
    			}
    		}
    		
    		return resultJson;
    	}
      	/**
       	 * 进入下一步
       	 */
      	function gotoNextStep(){
      			//添加置灰样式
	      	if($(".resume-icon").hasClass("prohibit")){
	      		return false;
	      	}
	      	$(".resume-icon").addClass("prohibit");
	      	$(".resume-icon").css({"color":"#6f6f6d"});
	      	
      		cleanLastPointInfo();
      		$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_nextStep.ms",
    			data:{
    				"paraMap.threadId":currentThead
    			},
    			
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
      		
      	}
      	/**
       	 * 步入方法
       	 */
      	function gotoStepInto(){
      			//添加置灰样式
	      	if($(".resume-icon").hasClass("prohibit")){
	      		return false;
	      	}
	      	$(".resume-icon").addClass("prohibit");
	      	$(".resume-icon").css({"color":"#6f6f6d"});
	      	
      		cleanLastPointInfo();
      		$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_stepInto.ms",
    			data:{
    				"paraMap.threadId":currentThead
    			},
    			
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
      		
      	}
      	/**
       	 * 步出方法
       	 */
      	function gotostepReturn(){
      			//添加置灰样式
	      	if($(".resume-icon").hasClass("prohibit")){
	      		return false;
	      	}
	      	$(".resume-icon").addClass("prohibit");
	      	$(".resume-icon").css({"color":"#6f6f6d"});
	      	
      		cleanLastPointInfo();
      		$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_stepReturn.ms",
    			data:{
    				"paraMap.threadId":currentThead
    			},
    			
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
      		
      	}
      	/**
       	 * 跳出断点
       	 */
      function gotoResume(){
      	//添加置灰样式
      	if($(".resume-icon").hasClass("prohibit")){
      		return false;
      	}
      	$(".resume-icon").addClass("prohibit");
      	$(".resume-icon").css({"color":"#6f6f6d"});	
      		cleanLastPointInfo();
      		$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_resume.ms",
    			data:{
    				"paraMap.threadId":currentThead
    			},
    			
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
      		
      	}
      	/**
       	 * 清除上一个断点信息
       	 */
      	function cleanLastPointInfo(){
      		pointResponseFlag=false;
      		socketResponseFlag=false;
      		resetBreakpointInformation();
      		expressionValidate();
      		setTimeout(function (){
      			if(!pointResponseFlag){
      				//$(".express-value").html("");//清除表达式
      				//$("#variables").html("");//变量树清除
      				pageThreadArray.removeValue(currentThead);//移除数组
      				$("."+currentThead).remove();
      				if(pageThreadArray.length>0){
      					currentThead=pageThreadArray[0];
      				}else if(pageThreadArray.length==0&&!socketResponseFlag){
      					$("#threadContent").html("");//清除线程树
      				}
      				//$(".resume-icon").removeClass("prohibit");//移除置灰样式;//允许操作按钮
      			}else if(expressionResponseFlag){
      				$(".resume-icon").removeClass("prohibit");//移除置灰样式
      				$(".resume-icon").css({"color":"#dbdbc0"});
      			}
      		},1000);
      	}
      	/**
     	 * 验证线程是否已经存在
     	 * param:threadValue(线程值)
      	 */
      	function validateThreadExistence(threadValue){
      		var returnFlag=false;
      		for(var i=0;i<pageThreadArray.length;i++){
      			if(pageThreadArray[i]==threadValue){
      				returnFlag=true;
      			}
      		}
      		return returnFlag;
      	}
      	
      	/**
     	 * 重置断点信息
     	 * param:reportData(报文数据)
      	 */
      	function resetBreakpointInformation(){
      		var addBreakFlag=false;
      		for(var i=0;i<pointArray.length;i++){
    			if(pointArray[i].line==(currentPointLine+1)&&pointArray[i].editor==currentEditor){
    				addBreakFlag=true;
    			}
    		}
    		if(addBreakFlag){
    			var marker = document.createElement("div");
    			marker.innerHTML = "<img src='${path}plf/style/debug/images/break-point.png' style='width: 15px;margin-top: 4px'>";
        	    currentEditor.setGutterMarker(currentPointLine, "breakpoints", marker);
        	    currentEditor.setSelection({line:currentPointLine,ch:0},{line:currentPointLine,ch:0});
    		}else{
    			currentEditor.setGutterMarker(currentPointLine, "breakpoints", null);
    			currentEditor.setSelection({line:currentPointLine,ch:0},{line:currentPointLine,ch:0});
    		}
      	
      	}
      	
    	 /**
     	 * 命中断点
     	 * param:reportData(报文数据)
      	 */
      	function HitTarget(reportData){
      		
      		var className=reportData;//获取全类名
      		className=className.substring(1,100);
    		className=className.replace(/\s/g,"");//去除类空格
    		responseClassName=className;
    		var currentJson;//当前编辑器内容
    		for(var i=0;i<editorDataArray.length;i++){//获取当前编辑器内容
    			if(editorDataArray[i].classNameValue==className){
    				currentJson=editorDataArray[i];
    				currentEditor=editorDataArray[i].editor;
    				break;
    			}
    		}
    		//代码不在tab，移除断点
    		if(currentJson==undefined){
    			addClassCodeByClassName(className);
    			currentEditor.setGutterMarker(currentPointLine, "breakpoints", null);
    		}
    		for(var i=0;i<editorDataArray.length;i++){//获取当前编辑器内容
    			if(editorDataArray[i].classNameValue==className){
    				currentJson=editorDataArray[i];
    				currentEditor=editorDataArray[i].editor;
    				break;
    			}
    		}
    		if(currentJson==undefined){
    			return false;
    		}
    		var classNameValue=currentJson.classId;
    		 $("."+classNameValue).each(function(){
    		     if($(this).hasClass("tab")){
    		    	 $(this).addClass('tab_active')
                     .siblings('.tab')
                     .removeClass('tab_active')
             	}else{
    		    	 $(this).addClass('pane_active')
                     .siblings('.pane')
                     .removeClass('pane_active')
    		     }
    		    });
    		reportData=reportData.substring(reportData.length-6);
      		reportData--;
      		var selectLength=currentEditor.getLine(reportData).length+30;
      		currentEditor.setSelection({line:reportData,ch:0},{line:reportData,ch:selectLength});
    		className=className.substring(1,100);
    		className=className.replace(";","");//获取全类名
    		eventCurrentPoint(currentEditor,reportData,className);//下一步页面
    		getClassStructs(); //类结构
    	}
      	/**
     	 * 表达式回调
     	 * param:reportData(报文数据)
     	 */
      
      	function expressionCallBack(reportData){
      		 
      		var result=analysisExpressionVesion(reportData);
      		if(result==null||result==""||result=="null"){
      			return false;
      		}
      		 $(".express-value-class").each(function(){
      			var currentValue=searchExpressionValue($(this).val(),result);
      			var callBackId="#"+$(this).attr("name");
      			if(currentValue.type=="1"){
    						$(this).siblings("span").addClass("item-Class");
    						$(this).siblings("span").attr("onclick","addExpressionOpen(this,1)");
    						$(this).siblings("span").attr("title",currentValue.key);
    						$(this).siblings("span").css({"margin-left":"-4px"});
    						$(callBackId).html("");
    					}else{
    						$(this).siblings().find("span").removeClass("item-Class");
    						$(this).siblings().find("span").attr("title","");
    						$(callBackId).html(currentValue.value);
    					}
      			
      			
      		  });
      	}
      	/**
     	 * 表达式查找
     	 * param:currentKey(当前key)
     	 * param:result(表达式内容)
     	 */
      	function searchExpressionValue(currentKey,result){
      		var returnValue="";
      		for(var i=0;i<result.length;i++){
      			if(currentKey==result[i].key){
      				returnValue=result[i];
      				break;
      			}
      		}
      		return returnValue;
      	}
      	/**
     	 * 变量树内容
     	 * param:currentKey(报文数据)
     	 */
      	function variablesTree(reportData){
     		
      		var variablesLength=parseInt(reportData.substring(1,7));
      		var reportData=reportData.substring(reportData.length-variablesLength);
      		reportData=reportData.replace(/\s/g,"");//获取全类名
      		var html="";
      		var variablesArray =reportData.split(";");
      		for(var i=0;i<variablesArray.length;i++){
      			var resultArray=variablesArray[i].split(":");
      			if(variablesArray[i]==""){
      				continue;
      			}
      				if(resultArray[1]=="1"){
              			html+="<div><span onclick='addExpressionOpen(this,2)' title='"+resultArray[0]+"' class='item-Class'>"+resultArray[0]+"</span></div>";
              		}else{
              			html+="<div class='open-li'  style='margin-left: 8px;'>"+resultArray[0]+"</div>";
              		}
          		
          		
      		}
      		
      		
      		$("#variables").html(html);
      	}
      	/**
     	 * 添加线程树
     	 * param:reportData(报文数据)
     	 */
      	function addThreadTree(reportData){
      		//pageThreadArray.length=0;//初始化线程
      		var variablesLength=parseInt(reportData.substring(1,7));
      		reportData=reportData.substring(reportData.length-variablesLength);
      		var threadArray=reportData.split(";");
      		var allJson=new Array();
      		for(var i=0;i<threadArray.length;i++){
      			var currentArray=threadArray[i].split(",");
      			var json={};
      			for(var j=0;j<currentArray.length;j++){
      				var tempArray=currentArray[j].split("=");
      				var temp=tempArray[0];
      				 json[temp]=tempArray[1];
      			}
      			allJson.push(json);
      		}
      		allJson=orderThread(allJson);
      		var html="";
      		var threadFlag=false;
      		var pageThreadArrayTemp=new Array();
      		for(var i=0;i<allJson.length;i++){
      			if(allJson[i].status!="0"&&allJson[i].lines!=""&&allJson[i].lines!=undefined){
      				html+="<li class='item-Class-active "+allJson[i].id+"' onclick='detailThread(this)'>"+allJson[i].name+"</li>";
      				if(allJson[i].status=="1"){
      					currentThead=allJson[i].id;//当前线程id
      				}
      				pageThreadArrayTemp.push(allJson[i].id);
      				
      				
      				var lines=allJson[i].lines;
      				var linesArray=lines.split("|");
      				for(var j=0;j<linesArray.length;j++){
      					var threadValue=linesArray[j].split(":");
      					html+="<li style='margin-left: 20px;' title='"+allJson[i].id+"' onclick='loadClsCodeByClassName(this,"+threadValue[2]+","+threadValue[1]+")' name='"+threadValue[0]+"' class='open-li "+allJson[i].id+"'>"+threadValue[0]+" line:"+threadValue[1]+"</li>";
      					if(j==0&&responseClassName==currentClassName){
      						var currentLine=parseInt(threadValue[1]);
      						if(currentEditor.getLine(currentLine)!=undefined){
      							var selectLength=currentEditor.getLine(currentLine).length;
      							currentLine--;
      							currentEditor.setSelection({line:currentLine,ch:0},{line:currentLine,ch:1000});
      						}
      					}
      				}
      				threadFlag=true;
      			}else{
      				html+="<li style='margin-left: 20px;'>"+allJson[i].name+"</li>";
      			}
      		}
      		pageThreadArray=pageThreadArrayTemp;
      		$("#threadContent").html(html);
      		if(threadFlag==false){
      			$("#threadContent").html("");	
      		}
      	}
      	
      	function detailThread(obj){
      		if($(obj).hasClass('item-Class-active')){
      			$(obj).siblings(".open-li").attr("class","close-li");//展开树
      			$(obj).attr("class","item-Class");
      		}else{
      			$(obj).siblings(".close-li").attr("class","open-li");//展开树
      			$(obj).attr("class","item-Class-active");
      		}
      		
      		
      	}
      	
      	/**
     	 * 线程排序
     	 * param:allJson(线程数据)
     	 */
      	function orderThread(allJson){
      		for(var i=0;i<allJson.length;i++){
      			if(allJson[i].status!="0"){
      				var temp=allJson[0];
      				allJson[0]=allJson[i];
      				allJson[i]=temp;
      				break;
      			}
      		}
      		return allJson;
      	}
      	//线程树点击回调函数
      	function threadClickCallBack(obj){
      		alert($(obj).attr("name"));
      	}
      	/**
     	 * 展开树结构
     	 * param:allJson(线程数据)
     	 */
      	function appendVariablesTree(obj){
      		
      		if($(obj).parent().hasClass('item-Class-active')){
      			$(obj).parent().attr("class","item-Class");
      			var title=$(obj).attr("title");
				var name=$(obj).attr("name");
				var html="<li onclick='appendVariablesTree(this)' name='"+name+"' title='"+title+"'>"+$(obj).attr("title")+"</li>";
				$(obj).parent().html(html);
    			return null;
      		}else{
      			$(obj).parent().attr("class","item-Class-active");
    			
      		}
      		var textValue=$(obj).attr("name");
      		textValue=textValue.replace(" ","");
      		$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_extendsStack.ms",
    			data:{
    				"paraMap.threadId":currentThead,
    				"paraMap.expression":textValue
    			},
    			
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
    				var result=openVariablesTree(data);
    				var title=$(obj).attr("title");
    				var name=$(obj).attr("name");
    				var html="<li onclick='appendVariablesTree(this)' name='"+name+"' title='"+title+"'>"+$(obj).attr("title")+"</li>";
    				if(result!=null&&result!=""){
    					for(var i=0;i<result.length;i++){
        					if(result[i].type=="1"){
        						var name=textValue+"."+result[i].key;
        						if(result[i].value!=undefined){
        							var currentValue=result[i].value;
            						html+="<ul class='item-Class' name='"+result[i].key+"' ><li   onclick='appendVariablesValue(this,"+currentValue+")' name='"+name+"' title='"+result[i].key+"'>"+result[i].key+"</li></ul>";
        						}else{
            						html+="<ul class='item-Class' ><li  onclick='appendVariablesTree(this)' name='"+name+"' title='"+result[i].key+"' >"+result[i].key+"</li></ul>";
        						}
        					}else{
        						html+="<li class='open-li'  style='margin-left: 8px;'>"+result[i].key+"="+result[i].value+"</li>";
        					}
        					
        				}
    				}
    				
    				var parent=$(obj).parent();
    				parent.html(html);
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
      	}
      	/**
     	 *变量表达式展开
     	 * param:obj(当前对象)
     	 * param:currentValue(当前值)
     	 */
      	function appendVariablesValue(obj,currentValue){
      		
      		if($(obj).parent().hasClass("item-Class")){
      			$(obj).parent().attr("class","item-Class-active");
      		}else{
      			$(obj).parent().attr("class","item-Class");
          		var html="<li   onclick='appendVariablesValue(this,"+currentValue+")' name='"+$(obj).attr("name")+"' title='"+$(obj).attr("title")+"'>"+$(obj).attr("title")+"</li>";
          		$(obj).parent().html(html);
          		return false;
      		}
      		var title=$(obj).attr("title");
      		var name=$(obj).attr("name");
      		var html="<li   onclick='appendVariablesValue(this,"+currentValue+")' name='"+$(obj).attr("name")+"' title='"+$(obj).attr("title")+"'>"+$(obj).attr("title")+"</li>";
      		for(var i=0;i<currentValue;i++){
      			var currentTitle=title+"["+i+"]";
      			var currentName=name+"["+i+"]";
      			html+="<li class='item-Class' name='"+currentName+"' onclick='expendArrayValue(this)' title='"+name+"' >" +currentTitle+"</li>";
      		}
      		$(obj).parent().html(html);
      	}
      	/**
     	 *table内容
     	 * param:obj(当前对象)
     	 */
      	function expendArrayValue(obj){
      		
      		if($(obj).hasClass("item-Class")){
      			$(obj).attr("class","item-Class-active");
      		}else{
      			$(obj).attr("class","item-Class");
          		var html=$(obj).children(":first").html();
          		$(obj).html(html);
          		return false;
      		}
      		var currentName=$(obj).attr("name");
      		$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_extendsStack.ms",
    			data:{
    				"paraMap.threadId":currentThead,
    				"paraMap.expression":currentName
    			},
    			
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
    				var result=openVariablesTree(data);
    				var html="<span>"+$(obj).html()+"</span>";
    				if(result!=null&&result!=""){
    					for(var i=0;i<result.length;i++){
    						html+="<li class='open-li'>"+result[i].key+"="+result[i].value+"</li>";
    					}
    				}
    				$(obj).html(html);
    			
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
      	}
      	/**
     	 *删除表达式
     	 */
      	function deleteExpression(){
      		if(curentExpressId==undefined||curentExpressId==""){
      			return null;
      		}
      		var expressionValue= $("input[name='"+curentExpressId+"']").val();
      		var expressId=$("input[name='"+curentExpressId+"']").attr("id");
      		if(expressionValue==""){
      			currentExpressParentObj.remove();
      			return false;
      		}
      		 $.ajax({
	    			type : "POST",
	    			dataType : "text",
	    			async:false, 
	    			url : "${path}sys/pageDebugAction_delExpression.ms",
	    			data:{"paraMap.expression":expressionValue,
	    				  "paraMap.expressId":expressId
	    			},
	    			
	    			success : function(data) {
	    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
	    				if(resultJson.result==false){
	    					
	    					return false;
	    				}
	    				currentExpressParentObj.remove();
	    				curentExpressId="";
	    				
	    				
	    			},
	    			error : function(msg) {
	    				alert();
	    			}
	    		});
      	}
      	/**
     	 *添加表达式
     	 * param:obj(当前对象)
     	 */
      	function addExpression(obj){
      		var name=$(obj).attr("name");
      		var objhtml="<span></span><input type='text' onBlur='editExpression(this)' name='"+name+"' class='express-value-class'>";
    	  	$(obj).html(objhtml);
    	  	$(obj).attr("onclick",null);
    	  	var appendHtml="<tr class='express-class'><td onclick='addExpression(this)' name='"+currentExpress+"'><li class='add-icon'>add new expression</li></td ><td id='"+currentExpress+"' onclick='expressionValueClick(this)' class='express-value'></td></tr>";
    	  	$(".table").append(appendHtml);
    	  	currentExpress++;
    	  	
    	  	
    	 }
      	/**
     	 *删除表达式
     	 * param:obj(当前对象)
     	 */
      	function expressionValueClick(obj){
      		$(".express-class").css({"background":"#262a39"});
      		$(".table tr").css({"background":"#262a39"});
      		$(".table tr td input").css({"background":"#262a39"});
      		var curerntId=$(obj).attr("id");
      		curentExpressId=curerntId;
      		var expression=$(obj).siblings().html();
      		currentExpressParentObj=$(obj).parent();
      		currentExpressParentObj.css({"background":"#63656b"});
      		var name=$(obj).attr("id");
      		$(".table tr td input").css({"background":"#262a39"});
      		$("input[name='"+name+"']").css({"background":"#63656b"});
      		var preHtml=$(obj).prev().html();
      		if(preHtml.indexOf("add new expression")>0){
      			curentExpressId="";
      		}
      	}
      	/**
     	 *增加跟修改表达式
     	 * param:obj(当前对象)
     	 */
      	function editExpression(obj){
      		var expression=$(obj).val();
      		expression=$.trim(expression);
      		if(expression==""){
      			var valueId="#"+$(obj).attr("name");
      			$(valueId).html("");
      			return false;
      		}
      		var expressionFlag=false;
      		for(var i=0;i<expressionArray.length;i++){
      			if(expressionArray[i]==expression){
      				expressionFlag=true;
      			}
      		}
      		if(!expressionFlag){
      			expressionArray.push(expression);
      		}
      		var expressId=$(obj).attr("id");
      		if(expressId==undefined||expressId==null||expressId==null){
      			expressId="";
      		}
      		$(".resume-icon").addClass("prohibit");
      		$(".resume-icon").css({"color":"#6f6f6d"});
      		$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_addBreakPointForExpress.ms",
    			data:{
    				"paraMap.threadId":currentThead,
    				"paraMap.expression":expression,
    				"paraMap.expressId":expressId
    			},
    			
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
    				if(pointResponseFlag){
    					$(".resume-icon").removeClass("prohibit");//移除置灰样式
      					$(".resume-icon").css({"color":"#dbdbc0"});
    				}
    				
    				data=JSON.parse(data);
    				var result=data.ajaxMap.result;
    				result=analysisExpressionVesion(result);
    				
    				var valueId="#"+$(obj).attr("name");
    				if(result.length>0){
    					$(obj).parent().siblings().html(result[0].value);
    					$(obj).attr("id",result[0].id);
    					if(result[0].type=="1"){
    						$(obj).siblings("span").addClass("item-Class");
    						$(obj).siblings("span").attr("onclick","addExpressionOpen(this,1)");
    						$(obj).siblings("span").attr("title",expression);
    						$(obj).siblings("span").css({"margin-left":"-4px"});
    						
    					}else{
    						$(obj).siblings().find("span").removeClass("item-Class");
    						$(obj).siblings().find("span").attr("title","");
    					}
    				}
    				
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
      		
      	}
      	
      	/**
     	 *展开表达式
     	 * param:obj(变量数据)
     	 */
      	function addExpressionOpen(obj,type){
      		$(".express-class").css({"background":"#262a39"});
      		$(".table tr").css({"background":"#262a39"});
      		$(".table tr td input").css({"background":"#262a39"});
      		if($(obj).hasClass('item-Class-active')){
      			$(obj).attr("class","item-Class");
      			$(obj).siblings("div").remove();
      			
      			return false;
      		}else{
      			$(obj).attr("class","item-Class-active");
      		}
      		$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_extendsStack.ms",
    			data:{
    				"paraMap.threadId":currentThead,
    				"paraMap.expression":$(obj).attr("title")
    			},
    			
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
    				html="<div style='padding-left: 20px'>";
    				var result=openVariablesTree(data);
    				if(result!=null&&result!=""){
    					for(var i=0;i<result.length;i++){
        					if(result[i].type=="1"){
        						if(result[i].value!=undefined){
        							var currentValue=result[i].value;
            						html+="<div><span onclick='addExpressionOpen(this,2)' title='"+result[i].key+"' class='item-Class'>"+result[i].key+"</span></div>";
        						}
        					}else{
        						html+="<div class='open-li'  style='margin-left: 8px;'>"+result[i].key+"="+result[i].value+"</div>";
        					}
        					
        				}
    				}
    				html+="</div>";
    				var parent=$(obj).parent();
    				parent.append(html);
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
      	}
      	
      	/**
     	 *展开变量树
     	 * param:obj(变量数据)
     	 */
      	function openVariablesTree(data){
      		
      		var resultArray=new Array();
      		var begin = 0;
      	    var end = 1;
      	    var alltype = data.substring(begin, end);
      	    begin = end;
      	    end += 6;
      	    var keyValueLength = data.substring(begin, end);
      	    var iKeyVal = parseInt(keyValueLength.trim());
   			var keyValInt = 0;// 校验长度
   			do
   		    {
   			var resultMap={};
   		      begin = end;
   		      end += 6;
   		      var keyLength = data.substring(begin, end);
   		      var iKey = parseInt(keyLength.trim());
   		      begin = end;
   		      end += 6;
   		      var valueLength = data.substring(begin, end);
   		      var iVal = parseInt(valueLength.trim());
   		      begin = end;
   		      end += 1;
   		      var type = data.substring(begin, end);
   		      begin = end;
   		      end += iKey;
   		      var key = data.substring(begin, end);
   		      begin = end;
   		      end += iVal;
   		      var value = data.substring(begin, end);
   		      resultMap.key=key;
   		   	  resultMap.value=value;
   		   	  resultMap.type=type; 
   		      resultArray.push(resultMap);
   		      keyValInt = keyValInt + 6 + 6 + 1 + iKey + iVal;
   		    }
   		    while (end < data.length);
   		    if (iKeyVal == keyValInt)
   		    {
   		      return resultArray;
   		    }
   		    else
   		    {
   		      return null;
   		    }
      	}
      	
    	/**
     	 *展开变量树
     	 * param:obj(变量数据)
     	 */
      	function analysisExpression(data){
     		var resultArray=new Array();
      		var begin = 0;
      	    var end = 1;
      	    var alltype = data.substring(begin, end);
      	    begin = end;
      	    end += 6;
      	    var keyValueLength = data.substring(begin, end);
      	    var iKeyVal = parseInt(keyValueLength.trim());
   			var keyValInt = 0;// 校验长度
   			do
   		    {
   			var resultMap={};
   		      begin = end;
   		      end += 6;
   		      var keyLength = data.substring(begin, end);
   		      var iKey = parseInt(keyLength.trim());
   		      begin = end;
   		      end += iKey;
   		      var valueLength = data.substring(begin, end);
   		      resultMap.key=valueLength;
   		      resultArray.push(resultMap);
   		      keyValInt = keyValInt + iKey;
   		    }
   		    while (end < data.length);
   			return resultArray;
      	}
      	
      	
      	/**
     	 *二次解析表达式
     	 * param:obj(变量数据)
     	 */
      	function analysisExpressionVesion(data){
     		var resultArray=new Array();
      		var begin = 0;
      	    var end = 1;
      	    var alltype = data.substring(begin, end);
      	    begin = end;
      	    end += 6;
      	    var keyValueLength = data.substring(begin, end);
      	    var iKeyVal = parseInt(keyValueLength);
   			var keyValInt = 0;// 校验长度
   			do
   		    {
   			var resultMap={};
   		      begin = end;
   		      end += 6;
   		      var idLength = data.substring(begin, end);
   		      var idKey = parseInt(idLength);
   		      
   		      begin = end;
   		      end += 6;
   		      var keyLength = data.substring(begin, end);
   		      var iKey = parseInt(keyLength);
   		      begin = end;
   		      end += 6;
   		      var valueLength = data.substring(begin, end);
   		      var iVal = parseInt(valueLength);
   		      begin = end;
   		      end += 1;
   		      var type = data.substring(begin, end);
   		      begin = end;
   		      end += idKey;
   		      var id = data.substring(begin, end);
   		      begin = end;
   		      end += iKey;
   		      var key = data.substring(begin, end);
   		      begin = end;
   		      end += iVal;
   		      var value = data.substring(begin, end);
   		      resultMap.key=key;
   		   	  resultMap.value=value;
   		   	  resultMap.type=type; 
   		   	  resultMap.id=id;
   		      resultArray.push(resultMap);
   		      keyValInt = keyValInt + 6 + 6 + 6+1 + iKey + iVal+32;
   		    }
   		    while (end < data.length);
   		    if (iKeyVal == keyValInt)
   		    {
   		      return resultArray;
   		    }
   		    else
   		    {
   		      return null;
   		    }
      	}
      	
    	//判断当前浏览器是否支持WebSocket  
    	if ('WebSocket' in window) { 
    		var ipport=$("#ipport").val();
    		var proName=$("#proName").val();
    		var protocol=location.protocol;
    		if("https:"==protocol){
    			var hp=location.host
    			websocket = new WebSocket("wss://" +hp+ "/" + proName+"/websocket/w");  
    		}else{
    			websocket = new WebSocket("ws://" +ipport+ "/" + proName+"/websocket/w");  
    		}
    	} else {  
    	    alert('当前浏览器 Not support websocket')  
    	}  
    	  		
    	//连接发生错误的回调方法  
    	websocket.onerror = function() {  
    	    alert("WebSocket连接发生错误");  
    	};  
    	  
    	//连接成功建立的回调方法  
    	websocket.onopen = function() {  
    	   
    	}  
    	//接收到消息的回调方法  
    	websocket.onmessage = function(event) {
    		
    		var reportData=event.data;
    		
    		var reportType=event.data.charAt(0);
    		switch(reportType)
    		{
    		case "1":
    			HitTarget(reportData); 
    		  break;
    		case "3":
    			expressionValidateCallBack();
    			expressionCallBack(reportData); 
    		  break;
    		case "4":
    			variablesTree(reportData);
    		   break;
    		case "2":
    			pointResponseFlag=true; 
    			socketResponseFlag=true;
    			addThreadTree(reportData);
     		   break;
    		case "5":
     		   break;
    		case "A":
    			dutyInfoDetail(reportData);
      		   break;
      		case "B":
    			
    			pointResponse(reportData);
      		   break;
      		 case "8":
    			
    			updateCodeMirror(reportData);
      		   break;
    		case "9":
    			debugCode(reportData);
      		   break;
      		case "C":
      			
      			window.location.href = "${path}sys/LoginAction_forLogin.ms";
      		   break; 
      		case "R":
      			selectNoAll();
      			$(".express-value-class").each(function(){
					editExpression(this);
				});
      			selectAll();
      			
    			//window.location.reload();
      		break;   
     		default:
    		}
    	} 
    	/**
     	 *更新codeMirror内容
     	 * param:reportData(报文数据)
     	 */
    	function updateCodeMirror(reportData){
    		$("#codeSynch").show();
			$(".floatImgBck").attr("name",reportData);
    		
    	}
    	
    	/**
     	 *代码调试信息,删除不符合断点
     	 * param:reportData(报文数据)
     	 */
    	function pointResponse(reportData){
    		 $("#BreakPointTarget").html("");
    		var pointLength=parseInt(reportData.substring(1,7));
      		var reportData=reportData.substring(reportData.length-pointLength);
      		if(reportData==""){//返回为空，删除全部断点
      			pointArray.length=0;
      			$("#BreakPointTarget").html("");
      			/* for(var i=0;i<pointArray.length;i++){
	      			currentPointLi=pointArray[i].line-1;
	      			eventFn(pointArray[i].editor, currentPointLi,2);
	      			
	      		} */
      		}else{//删除不符合端点
      			var resultArray=reportData.split(";");
	      		var responsePoint=new Array();
	      		for(var i=0;i<resultArray.length;i++){
	      			var result=JSON.parse("{"+resultArray[i]+"}");
	      				responsePoint.push(result);
	      		}
	      		var removePoint=new Array();//移除垃圾断点
	      		for(var i=0;i<pointArray.length;i++){
	      			var tempFlag=false;
	      			var tempPoint;
	      			for(var j=0;j<responsePoint.length;j++){ 
	      				if(responsePoint[j].id==pointArray[i].breakPointId){
	      					tempFlag=true;
	      					tempPoint=responsePoint[j];
	      					break;
	      				}
	      			}
	      			if(tempFlag){
	      				currentPointLi=pointArray[i].line-1;
	      				var marker = document.createElement("div");
	      				marker.innerHTML = "<img src='${path}plf/style/debug/images/break-point.png' style='width: 15px;margin-top: 4px'>";
       	        		pointArray[i].editor.setGutterMarker(currentPointLi, "breakpoints", marker);
       	        		currentPointLi++;
       	        		 var currentEditorParamData=getEditorMessageByEditor(pointArray[i].editor);
       	        		var lineIdValue=currentEditorParamData.classId+currentPointLi;
       	        		var html="<li id='"+lineIdValue+"' class='break-class' name='"+tempPoint.name+"' title='"+currentPointLi+"' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;-webkit-text-overflow:ellipsis;'><span class='icon icon-checkbox-h' ></span>"+tempPoint.name+"(line:"+currentPointLi+")</li>";
       	        		$("#BreakPointTarget").append(html);
       	        		
	      			}else{
	      				removePoint.push(pointArray[i]);
	      			
	      			}
	      		}
	      		for(var i=0;i<removePoint.length;i++){
	      			pointArray.removeValue(removePoint[i]);
	      		}
      		}
      		
      		
      		
    	}
    
    	/**
     	 *代码调试信息
     	 * param:reportData(报文数据)
     	 */
    	function debugCode(reportData){
    	  	currentClassName=localStorage.currentClassName;//当前类名称
    	   	currentPackage=localStorage.packageName;
    	   	currentClass=localStorage.className;
    	   	if(validateeditorDataArray(localStorage.codeId)){
    	   		$.ajax({
	    			type : "POST",
	    			dataType : "text",
	    			url : "${path}sys/pageDebugAction_showView.ms",
	    			data:{
	    				"paraMap.classId":localStorage.codeId,
	    				"paraMap.className":localStorage.beforeCurrentClassName
	    			},
	    			success : function(data) {
	    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
	    				if(resultJson.result==false){
	    					
	    					return false;
	    				}
	    				var classJson={"classId":localStorage.codeId,"className":localStorage.className,packageName:localStorage.packageName,classNameValue:localStorage.currentClassName};
	    				var contentId=timest();
	    				var classTitle="<div class='tab "+localStorage.codeId+"' name='"+localStorage.codeId+"' id='"+localStorage.codeId+"'><span>"+localStorage.className+"</span><span class='icon icon-close 'name='"+localStorage.codeId+"'  onclick='closeTagView("+contentId+",this)'></span></div>";
	    				var classContent="<div class='pane "+localStorage.codeId+"'> <textarea id='"+contentId+"' name='"+contentId+"'></textarea></div>";
	    				$("#classTitle").append(classTitle);
	    				$("#classContent").append(classContent);
	    				var currentId="#"+localStorage.codeId;
	    				 var index = $(currentId).index();  //获取点击的是第几个tab
	    		            $(currentId).addClass('tab_active')
	    		                    .siblings('.tab')
	    		                    .removeClass('tab_active');
	    		            //点击的tab添加当前样式，同级的tab移除，pane同理
	    		            $(currentId).parents('.tab_bar')
	    		                    .next('.tab_pane')
	    		                    .find('.pane')
	    		                    .eq(index)
	    		                    .addClass('pane_active')
	    		                    .siblings('.pane')
	    		                    .removeClass('pane_active');
	    				
	    				addCodeMirror(data,contentId,localStorage.codeId,classJson,localStorage.codeType); 
	    			},
	    			error : function(msg) {
	    				alert();
	    			}
	    		});		
    	   	}else{
    	   		
    	   	}
    	   	
    		
    	}
    	
    	/**
     	 *日志输出
     	 * param:reportData(报文数据)
     	 */
    	function dutyInfoDetail(reportData){
    		reportData=reportData.substring(9,reportData.length);//包名称
    		var html="<div id='duty"+dutyCount+"'>"+reportData+"</div>";
    		$("#logInfo").append(html);
    		dutyCount++;
    		if(dutyCount>1000){
    			var removeId="#duty"+(dutyCount-1000);
    			$(removeId).remove();
    		}
    		
    	}
    	/**
     	 *日志清除
     	 * param:reportData(报文数据)
     	 */
    	function clearDuty(){
    		$("#logInfo").html("");
    	}
    	/**
     	 *日志开启跟关闭
     	 * param:reportData(报文数据)
     	 */
    	function consoleSwitch(obj){
     		 var switchFlag;
     		 if($(obj).hasClass("icon-unlock")){
     			$(obj).removeClass("icon-unlock").addClass("icon-lock");
     			$(obj).attr("title","日志打开");
     			switchFlag="false";
     		 }else{
     			$(obj).removeClass("icon-lock").addClass("icon-unlock");
     			$(obj).attr("title","日志关闭");
     			switchFlag="true";
     		 }
    		$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_consoleSwitch.ms",
    			data:{
    				"paraMap.switchFlag":switchFlag
    			},
    			
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}	
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
     		 
    	}
    	
    	/**
     	 *打开日志
     	 */
    	function openDuty(){
    		$("#logInfo").html("");
    	}
    	//关闭tab界面
    	function closeTagView(id,obj){
    		var classId=$(obj).attr("name");
    		for(var i=0;i<editorDataArray.length;i++){
    			if(classId==editorDataArray[i].classId){
    				editorDataArray.removeValue(editorDataArray[i]);
    			}
    		}
    		classId="."+$(obj).parent().attr("name");
    		if($(obj).parent().hasClass('tab_active')){//本身点亮,切换到第一个
    			$(classId).remove();
    			$(".tab_no").siblings('.tab').eq(0).addClass('tab_active').siblings('.tab').removeClass('tab_active');
    			$(".pane_no").siblings('.pane').eq(0).addClass('pane_active') .siblings('.pane').removeClass('pane_active');
    		}else{
    			$(classId).remove();
    		}
    		classId=$(".tab_no").siblings('.tab').eq(0).attr("name");//加载右边类树
    		for(var i=0;i<editorDataArray.length;i++){
    			if(classId==editorDataArray[i].classId){//调用类树方法
    				currentEditor=editorDataArray[i].editor;
    				currentEditor.setSelection({line:0,ch:0},{line:0,ch:0});
	            	getClassStructs();
    			}
    		}
    		
    		//树结构切换
    		var treeFlag=false;
    		 $(".tab_active").each(function(){
    			var className=$(this).attr("name");
    			if(className!=null&&className!=undefined&&className!=""){
    				  var resultJson=getEditorMessageByClassName(className);
			          if(resultJson!=undefined){
			            	currentEditor=resultJson.editor;
			            	getClassStructs();
			          }
			          treeFlag=true;
    		}
  			});
  			if(!treeFlag){
  				$("#classStructs").html("");
  			}
    		
    	}
    	/**
     	 *codeMirror超过十个移除第一个
     	 * param:reportData(报文数据)
     	 */
    	function removeFirstCodeMiror(obj){
    		var classId=$(obj).attr("name");
    		for(var i=0;i<editorDataArray.length;i++){
    			if(classId==editorDataArray[i].classId){
    				editorDataArray.removeValue(editorDataArray[i]);
    			}
    		}
    		classId="."+$(obj).parent().attr("name");
    		$(classId).remove();
    		
    	}
    	//关闭未找到类
    	function closeNoClass(){
    		$('.tab_no').siblings().addClass('tab_active');
			$('.pane_no').siblings().addClass('pane_active');
			
			$('.tab_no').hide();
    		$('.pane_no').hide();
		}
    	
    	function closeDebugPage(){
    		
    		$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_closeDebugPage.ms",
    			data:{
    			},
    			
    			success : function(data) {
    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
    				if(resultJson.result==false){
    					
    					return false;
    				}
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
    	}
    	/**
     	 *ajax 数据返回处理
     	 */
    	  
    	function ajaxJSONDetail(str) {
    	var returnJson={result:true,msg:""};
	    if (typeof str == 'string') {
	        try {
	            var obj=JSON.parse(str);
	            if(typeof obj == 'object' && obj ){
	           	 	if(obj.ajaxMap!=undefined&&obj.ajaxMap.status=="false"){
	           	 		returnJson={result:false,msg:obj.ajaxMap.msg};
	           	 		var jsonText="['"+obj.ajaxMap.msg+"']";
	           	 		util.initLangMap(jsonText);
	           	 		util.alert(util.getLangShow(obj.ajaxMap.msg));
	           	 	}
	               return returnJson;
	            }else{
	               return returnJson;
	            }
	
	        } catch(e) {
	            return returnJson;
	        }
	    }
	    return returnJson;
	}
    	  
    	  
    	  
    	//连接关闭的回调方法  
    	websocket.onclose = function() {  
    	    
    	}  
    	  
    	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。  
    	window.onbeforeunload = function() {  
    	    closeWebSocket();  
    	}  
    	  
    	//关闭WebSocket连接  
    	function closeWebSocket() {  
    	    websocket.close();  
    	} 
    	/**
    	 * 移除数组中的内容
    	 */
    	Array.prototype.removeValue = function(val) {
    		var index = this.defIndexOf(val);
    		if (index > -1) {
    		this.splice(index, 1);
    		}
    	};
    		
    	Array.prototype.defIndexOf = function(val) {
    		for (var i = 0; i < this.length; i++) {
    		if (this[i] == val) return i;
    		}
    	}
    	
        // 样式操作，移除深色系样式表
        // $("#style").remove() 

        //竖线拖动事件
        $('.verticalLine').on('mousedown',function(e){
            var preFrame = $(this).prev('.frame') //获取前一个块
            var nextFrame = $(this).next('.frame') //获取后一个块
            var oldWidth = $(preFrame).width() 
            var oldWidth2 = $(nextFrame).width() //获取原来的宽度
            var widthCount =  oldWidth + oldWidth2
            var oldX = e.clientX //获取原鼠标x坐标

            document.onmousemove = function(ev){ //鼠标移动事件
                var newWidth = oldWidth + ev.clientX - oldX //新的宽度 = 原宽度 + 新的鼠标x坐标 - 旧的鼠标x坐标
                if(newWidth <= 400){
                    newWidth = 400
                }else if(newWidth >= (widthCount - 400)){
                    newWidth = widthCount - 400
                }
                $(preFrame).css('width',newWidth + 'px')
                $(nextFrame).css('width','calc(100% - ' + newWidth + 'px - 2px)')
            }
        })

        //横线拖动事件
        $('.acrossLine').on('mousedown',function(e){
            var preFrame = $(this).prev('.frameset') //获取前一个块
            var nextFrame = $(this).next('.frameset') //获取后一个块
            var oldHeight = $(preFrame).height() 
            var oldHeight2 = $(nextFrame).height() //获取原来的宽度
            var heightCount = oldHeight + oldHeight2 //获取两块的高度总和
            var oldY = e.clientY //获取原鼠标Y坐标

            document.onmousemove = function(ev){ //鼠标移动事件
                var newHeight = oldHeight + ev.clientY - oldY //新的高度 = 原高度 + 新的鼠标Y坐标 - 旧的鼠标Y坐标
                if(newHeight <= 100){
                    newHeight = 100
                }else if(newHeight >= (heightCount - 100)){
                    newHeight = heightCount - 100
                }
                $(preFrame).css('height',newHeight + 'px')
                $(nextFrame).css('height',heightCount - newHeight + 'px')
            }
        })

        //tab页切换事件
        $('.tab_bar').on('click','.tab',function(){
        	if($(this).hasClass("tab_no")&&$(this).css('display')=="none"){
        		return false;
        	}
            var index = $(this).index()  //获取点击的是第几个tab
            $(this).addClass('tab_active')
                    .siblings('.tab')
                    .removeClass('tab_active')
            //点击的tab添加当前样式，同级的tab移除，pane同理
            $(this).parents('.tab_bar')
                    .next('.tab_pane')
                    .find('.pane')
                    .eq(index)
                    .addClass('pane_active')
                    .siblings('.pane')
                    .removeClass('pane_active')
        })

        //目录树窗体缩小事件
        $('.frame_tree').on('click','.icon-minimize',function(){
            $('.main').removeClass('all')
            var count = $(this).parents('.frameset').find('.frame:visible').length 
            if(count == 2){
                $(this).parents('.frame').css('display','none')
                $(this).parents('.frameset').find('.verticalLine').css('display','none')
                $(this).parents('.frameset').find('.frame_control').css('width','100%')
            }else if(count == 1){
                $(this).parents('.frame').css('display','none')
                var height1 = $(this).parents('.frameset').height()
                var height2 = $('.frame_center').height()
                $(this).parents('.frameset').css('height','0')
                $(this).parents('.frameset').next('.acrossLine').css('display','none')
                $('.frame_center').css('height',height1 + height2 + 2 + 'px')
            }
            $('.menu').append('<div class="item tree"><span class="icon icon-menu"></span>目录树窗体</div><div class="item_line"></div>')
        })

        //目录树窗体展开事件
        $('.menu').on('click','.tree',function(){
            var count = $('.frame_tree').parents('.frameset').find('.frame:visible').length
            if(count == 1){
                $('.frame_tree').css('display','block').css('width','calc(50% - 1px)')
                $('.frame_tree').parents('.frameset').find('.verticalLine').css('display','block')
                $('.frame_tree').parents('.frameset').find('.frame_control').css('width','calc(50% - 1px)')
            }else if(count == 0){
                var height = $('.frame_center').height()
                $('.frame_top').css('height','200px')
                $('.frame_top').next('.acrossLine').css('display','block')
                $('.frame_center').css('height',height - 202 + 'px')
                $('.frame_tree').css('display','block').css('width','100%')
            }
            removeMenu($(this))
        })

        //监控窗体缩小事件
        $('.frame_control').on('click','.icon-minimize',function(){
            $('.main').removeClass('all')
            var count = $(this).parents('.frameset').find('.frame:visible').length 
            if(count == 2){
                $(this).parents('.frame').css('display','none')
                $(this).parents('.frameset').find('.verticalLine').css('display','none')
                $(this).parents('.frameset').find('.frame_tree').css('width','100%')
            }else if(count == 1){
                $(this).parents('.frame').css('display','none')
                var height1 = $(this).parents('.frameset').height()
                var height2 = $('.frame_center').height()
                $(this).parents('.frameset').css('height','0')
                $(this).parents('.frameset').next('.acrossLine').css('display','none')
                $('.frame_center').css('height',height1 + height2 + 2 + 'px')
            }
            $('.menu').append('<div class="item control"><span class="icon icon-consol"></span>监控窗体</div><div class="item_line"></div>')
        })

        //监控窗体展开事件
        $('.menu').on('click','.control',function(){
            var count = $('.frame_control').parents('.frameset').find('.frame:visible').length
            if(count == 1){
                $('.frame_control').css('display','block').css('width','calc(50% - 1px)')
                $('.frame_control').parents('.frameset').find('.verticalLine').css('display','block')
                $('.frame_control').parents('.frameset').find('.frame_tree').css('width','calc(50% - 1px)')
            }else if(count == 0){
                var height = $('.frame_center').height()
                $('.frame_top').css('height','200px')
                $('.frame_top').next('.acrossLine').css('display','block')
                $('.frame_center').css('height',height - 202 + 'px')
                $('.frame_control').css('display','block').css('width','100%')
            }
            removeMenu($(this))
        })

        //类结构缩小事件
        $('.frame_class').on('click','.icon-minimize',function(){
            $('.main').removeClass('all')

            $(this).parents('.frame').css('display','none')
            $(this).parents('.frameset').find('.verticalLine').css('display','none')
            $(this).parents('.frameset').find('.frame_main').css('width','100%')

            $('.menu').append('<div class="item struct"><span class="icon icon-struct"></span>类结构窗体</div><div class="item_line"></div>')
        })

        //类结构展开事件
        $('.menu').on('click','.struct',function(){
            $('.frame_class').css('display','block').css('width','400px')
            $('.frame_class').parents('.frameset').find('.verticalLine').css('display','block')
            $('.frame_class').parents('.frameset').find('.frame_main').css('width','calc(100% - 402px)')
            removeMenu($(this))
        })

        //日志缩小事件
        $('.frame_log').on('click','.icon-minimize',function(){
            $('.main').removeClass('all')
            $(this).parents('.frame').css('display','none')
            var height1 = $(this).parents('.frameset').height()
            var height2 = $('.frame_center').height()
            $(this).parents('.frameset').css('height','0')
            $(this).parents('.frameset').prev('.acrossLine').css('display','none')
            $('.frame_center').css('height',height1 + height2 + 2 + 'px')
            $('.menu').append('<div class="item log"><span class="icon icon-log"></span>日志窗体</div><div class="item_line"></div>')
        })

        //日志展开事件
        $('.menu').on('click','.log',function(){
            var height = $('.frame_center').height()
            $('.frame_bottom').css('height','200px')
            $('.frame_bottom').prev('.acrossLine').css('display','block')
            $('.frame_center').css('height',height - 202 + 'px')
            $('.frame_log').css('display','block').css('width','100%')
            removeMenu($(this))
        })

        //菜单展开后移除，且判断是不是最后一个菜单
        function removeMenu(elem){
            $(elem).next('.item_line').remove()
            $(elem).remove()
            if($('.menu').find('.item').length == 0){
                $('.main').addClass('all')
            }
        }

        //展开更多
        $('.frame_main .icon-more').click(function(){
            $('.frame_main .more').css('display','block')
            return false
        })

        //点击展开的框阻止冒泡
        $('.frame_main .more').click(function(){
            return false;
        })

        //点击任何地方隐藏用户详细,展开的下拉框
        $(document).click(function(){
            $('.frame_main .more').css('display','none')
        })

        //断点模拟复选框勾选
        $('.checkbox').on('click',function(){
            if($(this).find('.icon').hasClass('icon-checkbox')){
                $(this).find('.icon').removeClass('icon-checkbox').addClass('icon-checkbox-h')
            }else{
                $(this).find('.icon').removeClass('icon-checkbox-h').addClass('icon-checkbox')
            } 
        })

        $('.breakpoint .list').on('click','li',function(){
        	$('.breakpoint .list li').css({"background":"#262a39"});
        	$(this).css({"background":"#535a71"});
        	currentPointLiValue=$(this).attr("title");
        	currentPointLiId=$(this).attr("id");
        	var editorName=$(this).attr("name");//获取li中name
        	var currentJson=getEditorMessageByAllClassName(editorName);//获取editor里面数据
            if($(this).find('.icon').hasClass('icon-checkbox')){
                $(this).find('.icon').removeClass('icon-checkbox').addClass('icon-checkbox-h');//增加断点
                var currentId=parseInt($(this).attr("title"))-1;
                eventFn(currentJson.editor, currentId,1);
               
            }else{
                $(this).find('.icon').removeClass('icon-checkbox-h').addClass('icon-checkbox');//删除断点
                var currentId=parseInt($(this).attr("title"))-1;
                eventFn(currentJson.editor,currentId,1);
            } 
        })
		//删除当前节点 
        function deleteCurrentPoint(){
        	var currentPointTemp="#"+currentPointLiId;
        	var editorName=$(currentPointTemp).attr("name");//获取li中name
        	var currentJson=getEditorMessageByAllClassName(editorName);//获取editor里面数据
        	if($(currentPointTemp).find('.icon').hasClass("icon-checkbox-h")){
        		currentPointLiValue--; 
        		eventFn(currentJson.editor, currentPointLiValue);
        	}else{
        		 $(currentPointTemp).remove();
        		 removePointArray(currentPointLiValue,editorName);
        	}	
        }
        //删除所有断点
        function deleteAllPoint(){
        	HitTargetJson.image="";
        	 $(".break-class").each(function(){
        		if($(this).find('.icon').hasClass("icon-checkbox-h")){
        			 currentPointIdValue=parseInt($(this).attr("title"))-1;
        			 var editorName=$(this).attr("name");//获取li中name
        			var currentJson=getEditorMessageByAllClassName(editorName);//获取editor里面数据
             		 eventFn(currentJson.editor, currentPointIdValue);
             		 currentPointIdValue++;
             		 removePointArray(currentPointIdValue,editorName);
             	}else{
             		 currentPointIdValue=parseInt($(this).attr("title"));
             		 removePointArray(currentPointIdValue,editorName);
        		     
             	}	
                });
                $("#BreakPointTarget").html("");
                pointArray.length=0;
        }
        //全部选中
        function selectAll(){
        	 $(".break-class").each(function(){
        		 if($(this).children().first().hasClass("icon-checkbox")){
        			 $(this).children().first().removeClass("icon-checkbox").addClass("icon-checkbox-h");
        			 var curentId=parseInt($(this).attr("title"))-1;
        			 var editorName=$(this).attr("name");//获取li中name
        			 var currentJson=getEditorMessageByAllClassName(editorName);//获取editor里面数据
                     eventFn(currentJson.editor,curentId,1);//设置断点
        		 }
        	});
        }
        //全部不选
        function selectNoAll(){
        	HitTargetJson.image="";
        	 $(".break-class").each(function(){
        		 if($(this).children().first().hasClass("icon-checkbox-h")){
        			 $(this).children().first().removeClass("icon-checkbox-h").addClass("icon-checkbox");
        			 var curentId=parseInt($(this).attr("title"))-1;
        			 var editorName=$(this).attr("name");//获取li中name
        			var currentJson=getEditorMessageByAllClassName(editorName);//获取editor里面数据
                     eventFn(currentJson.editor,curentId,1);//设置断点
        		 }
        	});
        }
        
        //移除断点位置数组
        function removePointArray(lineValue,editorName){
        	for(var i=0;i<pointArray.length;i++){
        		if(lineValue==pointArray[i].line&&editorName==pointArray[i].classNameValue){
        			pointArray.removeValue(pointArray[i]);
        		}
        	}
        	 
        }
        //断点全选
        $('.breakpoint .checkAll').on('click',function(){
            if($(this).find('.icon').hasClass('icon-checkbox')){
                $(this).find('.icon').removeClass('icon-checkbox').addClass('icon-checkbox-h');
                $('.breakpoint .list li').find('.icon').removeClass('icon-checkbox').addClass('icon-checkbox-h');
                $(".break-class").each(function(){
                  	 var curentId=parseInt($(this).attr("id"))-1;
                      eventFn(currentEditor,curentId);//设置断点
                });

            }else{
                $(this).find('.icon').removeClass('icon-checkbox-h').addClass('icon-checkbox');
                $('.breakpoint .list li').find('.icon').removeClass('icon-checkbox-h').addClass('icon-checkbox');
                $(".break-class").each(function(){
               	 var curentId=parseInt($(this).attr("id"))-1;
                   eventFn(currentEditor,curentId);//设置断点
                 });
                
            }
        })

        //断点模拟单选框勾选
        $('.radiobox').on('click',function(){
            if($(this).find('.icon').hasClass('icon-radio')){
                $(this).find('.icon').removeClass('icon-radio').addClass('icon-radio-h')
                $(this).siblings('.radiobox').find('.icon').removeClass('icon-radio-h').addClass('icon-radio')
            }
        })

        $('.breakpoint .radio').on('click',function(){
            if($(this).find('.icon').hasClass('icon-radio')){
                $(this).find('.icon').removeClass('icon-radio').addClass('icon-radio-h')
                $(this).siblings('.radio').find('.icon').removeClass('icon-radio-h').addClass('icon-radio')
            }
        })

        //弹出弹窗
        function popDiv(id){
           // $('#' + id).css('display','block');
           // $('.shadow').css('display','block');
        }

        //关闭弹窗
        $('.popDiv .icon-close').click(function(){
            $(this).parents('.popDiv').css('display','none');
            $('.shadow').css('display','none');
        })
		//取消弹窗
		function cancelWindow(){
			$('.popDiv').css('display','none');
			$('.shadow').css('display','none');
			$("#codeSynch").hide();
			$('.floatImg').show();
			
		}
		//确定事件
		function determineInfo(){
			$(".shadow").show();
			var reportData=$(".floatImgBck").attr("name");
    		var length=parseInt(reportData.substring(1, 3));
			length=3+3+1+length;//id位置
			var classNameValue=reportData.substring(7, length);
			reportData=reportData.substring(length, reportData.legnth);
			var classId=reportData;
			var className;
			for(var i=0;i<editorDataArray.length;i++){
				 if(classId==editorDataArray[i].classId){
				    updateEditorCode(editorDataArray[i].editor,classNameValue,classId);
				 }
				 editorDataArray[i].editor.setSelection({line:0,ch:0},{line:0,ch:0});
			}
			$(".shadow").css("display","none");
	    	$("#codeSynch").hide(); 
	    	$('.floatImg').hide(); 
			 
		
		
			
		}
		/**
     	 *初始化信息
     	 */
		function initAllInfo(){
			$.ajax({
    			type : "POST",
    			dataType : "text",
    			url : "${path}sys/pageDebugAction_initAllInfo.ms",
    			data:{
    				"paraMap.threadId":null,
    				"paraMap.expression":currentExpress
    			},
    			success : function(data) {
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
			
		}
		
		
		function updateEditorCode(editorValue,classNameValue,codeId){
			$.ajax({
	    			type : "POST",
	    			dataType : "text",
	    			url : "${path}sys/pageDebugAction_loadClsCodeByClassName.ms",
	    			data:{"paraMap.className":classNameValue,
	    				"paraMap.codeId":codeId
	    			},
	    			async: false,
	    			success : function(data) {
	    				var resultJson=ajaxJSONDetail(data);//判断是否有异常
	    				if(resultJson.result==false){
	    					
	    					return false;
	    				}
	    				data=JSON.parse(data);
	    				//后台查找不到代码
	    				if(data.ajaxMap=="null"||data.ajaxMap==null){
	    					$('.tab_no').show();
	    					 $('.pane_no').show();
	    				}else {
	    					var classCode=data.ajaxMap.classCode;
		    				editorValue.setValue(classCode);
	    				}
	    				$(".shadow").css("display","none");
	    				$("#codeSynch").hide();
	    				resetRmi();
	    			},
	    			error : function(msg) {
	    				alert();
	    			}
	    		});
		
		
		}
		/**
     	 *重新启动RMI
     	 */
		function resetRmi(){
			$.ajax({
	    		    	type : "POST",
	    		    	dataType : "text",
	    		    	async:false, 
	    		    	url : "${path}sys/pageDebugAction_resetRMIJob.ms",
		    		    	data:{},
	    		    			
	    		    	success : function(data) {
	    		    		var resultJson=ajaxJSONDetail(data);//判断是否有异常
				    		if(resultJson.result==false){
				    			
				    			return false;
				    		}
				    		var data= JSON.parse(data);
	    					resultData=data;
	    					if(data.ajaxMap.flag=="true"){
	    						$('.floatImg').hide();
	    						
					    		 $(".shadow").hide();
					    		 $("#threadContent").html("");
					    		 $("#variables").html("");
					    		 $(".resume-icon").addClass("prohibit");
	      						$(".resume-icon").css({"color":"#6f6f6d"});
	      						pointResponseFlag=false;
	    					}
				    	},
	    		    	error : function(msg) {
	    		    		alert();
	    		    	}
	    		   });
		
		}
		/**
     	 *表达式标志位
     	 * param:obj(变量数据)
     	 */
		function expressionValidate(){
			if($("#expressValue").find("tr").length>1){
				expressionResponseFlag=false;//表达式返回情况
			}else{
				expressionResponseFlag=true;//表达式返回情况
			}
		
		}
		/**
     	 *表达式返回标志位
     	 * param:obj(变量数据)
     	 */
		function expressionValidateCallBack(){
			expressionResponseFlag=true;
			$(".resume-icon").removeClass("prohibit");//移除置灰样式
      		$(".resume-icon").css({"color":"#dbdbc0"});
		}
		/**
     	 *添加其他断点
     	 * param:obj(变量数据)
     	 */
		function addOtherPoint(object){
			 $.ajax({
    			type : "POST",
    			dataType : "text",
    			async:false, 
    			url : "${path}sys/pageDebugAction_addBreakOtherPoint.ms",
    			data:{"paraMap.charNum":object.charNum,//
    				"paraMap.className":object.className,//
    				"paraMap.colNum":object.colNum,//
    				"paraMap.condition":object.condition,
    				"paraMap.inClassName":object.inClassName,
    				"paraMap.methodName":object.methodName,
    				"paraMap.packageName":object.packageName,
    				"paraMap.parameter":object.parameter,
    				"paraMap.type":object.type,
    				"paraMap.variable":object.variable,
    			},
    			
    			success : function(data) {
    				//var otherLine=parseInt(object.colNum);
    				//var otherClassNameValue=object.packageName+","+object.className;
    				//var html="<li id='"+otherLine+"' class='break-class' name='"+otherClassNameValue+"' title='"+object.breakPointId+"'><span class='icon icon-checkbox-h' ></span>line:"+otherLine+"("+otherClassNameValue+")</li>";
    				//$("#BreakPointTarget").append(html);
    				
    			},
    			error : function(msg) {
    				alert();
    			}
    		});
		
		}
		
        //松开移除拖动事件
        window.onmouseup = function(){
            document.onmousemove = null;
        }
    </script>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>