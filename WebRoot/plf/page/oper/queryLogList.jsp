<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="日志管理"/><dict:lang value="列表"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="datePicker" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
	
		<style>
        *{
            margin: 0;
            padding: 0;
        }
    
        html,body{
            height: 100%;
            font-size: 14px;
        }
    
        .container{
            height: 100%;
            box-sizing: border-box;
            padding: 5px;
        }

        .top{
            background-color: #e8f5fc;
            border: 1px solid #a8c7ce;
            box-sizing: border-box;
            height: 35px;
            line-height: 33px;
        }
        
        .main{
            height: calc(100% - 35px - 42px);
            overflow: auto;
        }

        .main ul{
            list-style: none;
        }

        .main ul li{
            padding: 15px 20px 15px 15px;
            border-bottom:1px solid #eee; 
        }

        .main ul li div{
            display: inline-block;
            height: 20px;
            line-break: 20px;
        }

        .main ul li .left{
            height: 100%;
            width: calc(100% - 60px);
            white-space: nowrap;
            overflow: hidden;
        }
        
        .main ul li .line{
            width: 1px;
            height: 18px;
            background-color: #999;
            margin: 0px 10px;
            line-height: 18px;
            margin-top: 1px;
            vertical-align: top;

        }

        .main ul li .time{
            color: #333;
            font-weight:bold; 
            margin-right:15px; 
        }

        .main ul li .state{
            width: 50px;
            height: 20px;
            border-radius: 2px;
            font-size: 12px;
            text-align: center;
            line-height: 20px;
            color: #fff;
            margin-right: 10px;
        }

        .main ul li .state.error{
            background-color: #dd4b39;
        }
        
        .main ul li .state.info{
            background-color: #aace36;
        }

        .main ul li .right{
            float: right;
            cursor: pointer;
        }
        
        .main ul li .operation{
            color: #999;
            margin-right: 5px;
        }
        
        .main ul li .operation:hover{
            color: #666;
        }

        .main ul li .ico{
            width: 15px;
            height: 12px;  
            margin-top: 4px;
        }

        .main ul li .right[state="close"] .close{
            display: none;
        }

        .main ul li .right[state="open"] .open{
            display: none;
        }

        .main ul li .right[state="close"] .ico{
            background-image: url(${path}plf/images/ico-zhankai.png);
        }

        .main ul li .right[state="open"] .ico{
            background-image: url(${path}plf/images/ico-shouqi.png);
        }

        .main ul li.details{
            padding: 15px;
            color: #666;
            font-size: 12px;
            background-color: #f2f2f2;
        }

        .foot{
            margin-top:5px; 
            height: 27px;
            line-height: 27px;
            text-align: right;
        }
        .layui-form-select dl { /*min-height:210px;*/ }
        .layui-form-select{
        	width:180px !important ;
        }
        
        .search_table_wrap {
        	float: left;
        	padding: 5px 10px;
        }
        .search_table_wrap > span {
        	display: inline-block;
        	width: 80px; 
        	text-align: right;
        	overflow: hidden;
        	text-overflow: ellipsis;
        	white-space: nowrap;
        }
    </style>
	</head>
<body>
<div class="" style="overflow-x: visible;">
	<form id="search_form" name="searchForm" action="${path}oper/LogAction_queryLogData.ms" class="layui-form"  method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<table class="search_table" style="overflow: auto;">
		<tr>
			<td>
				<div class="search_table_wrap">
					<span><dict:lang value="节点"/></span>
					<div class="layui-input-inline">
						<s:select id="node" name="paraMap.node" cssClass="input_sh" list="nodeMap" listKey="key" listValue="value" value="hostAddress"></s:select>
					</div>
				</div>
				<div class="search_table_wrap">
					<span><dict:lang value="级别"/></span>
					<div class="layui-input-inline">
						<s:select id ="level" name="paraMap.level" cssClass="input_sh" list="#{1:'所有',2:'info',3:'error'}" listKey="key" listValue="value"></s:select>
					</div>	
				</div>
				<div class="search_table_wrap">
					<span><dict:lang value="关键字"/></span>
					<div class="layui-input-inline">
						<s:textfield id="keyWords" name="paraMap.keyWords" cssClass="input_sh"  maxlength="100"/>
									
						<c:set var='nowReadFile' value='<c:out value="${logObjDto.nowReadFile}"/>'/>
						<c:set var='nowReadFileRowsNum' value='<c:out value="${logObjDto.nowReadFileRowsNum}"/>'/>
						
						<s:hidden  id="nowReadFile" name="paraMap.nowReadFile" value="${nowReadFile}"/>
						<s:hidden  id="nowReadFileRowsNum" name="paraMap.nowReadFileRowsNum" value="${nowReadFileRowsNum}" />
					    <s:hidden  id="oldPath" name="paraMap.oldPath" value="${oldPath}" />
					</div>
				</div>
				<div class="search_table_wrap">
					<span><dict:lang value="起始时间"/></span>
					<input id="starttime" name="starttime"
								value='<fmt:formatDate value="${starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>'
						 class="input_sh WdateNomorl"
						onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d %H:%m:%s'})"
						readonly="readOnly"> 
				</div>
				<div class="search_table_wrap">
					<span><dict:lang value="结束时间"/></span>
					<input id="endtime"
							name="endtime" 
							value='<fmt:formatDate value="${endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>'
							class="input_sh WdateNomorl"
							onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d %H:%m:%s'})"
							readonly="readOnly">
				</div>
				<div class="search_table_wrap">
					<input type="button" value="<dict:lang value="查询" />" onclick="queryModule(1);" class="layui-btn">
				</div>
			</td>
			
	    </tr>
	</table>
	</form>
	
</div>
<div class="all">	

        <div class="main">

        </div>
	<div class="">
		<div id="fenye" style="Float:right"></div>
	</div>

</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">

   var path=${path};
        $('.main').on('click','li .right',function(){
            var state = $(this).attr('state')
            if(state=="close"){  
                $(this).attr('state','open')
                $(this).parents('li').next().css('display','block')
            }else{
                $(this).attr('state','close') 
                $(this).parents('li').next().css('display','none')
            }
        });
   layui.use('form', function(){
    	  var form = layui.form;
    	  $("#node").attr("style","width:180px;");
    	  form.render("select");
    });
	
	function queryModule(thisObj){
	
	

		if($('#starttime').val()==null||$('#starttime').val() == ""  || $('#starttime').val() == undefined){
		  util.alert("<dict:lang value="开始时间不能为空"/>");
		  return;
	    }
	 
	    if($('#endtime').val()==null||$('#endtime').val() == ""  || $('#endtime').val() == undefined){
		  util.alert("<dict:lang value="结束时间不能为空"/>");
		  return;
	    }
	    if($('#starttime').val() >=$('#endtime').val())  
		 {  
		  util.alert("开始时间不能大于结束时间！");  
		  return false;  
		 }
		 if(thisObj==1)
		 {
		 	 $("#nowReadFile").val(null);
	         $("#nowReadFileRowsNum").val(null);
	         $("#oldPath").val(null);
		 }

	    util.showTopLoading();
	    var params={};
	    params.starttime=$('#starttime').val();
	    params.endtime=$('#endtime').val();
	    params.nowReadFile=$('#nowReadFile').val();
	    params.nowReadFileRowsNum=$('#nowReadFileRowsNum').val();
	    params.level=$("#level").find("option:selected").val();
	    params.node=$("#node").find("option:selected").text();
	    params.keyWords=$("#keyWords").val();
   			$.ajax({
			type: "POST",
		    dataType: "json",
		    url: "${path}oper/LogAction_queryAjaxLogData.ms",
		    data: params,
			success: function(data){
			if(data.ajaxMap != null)
			{ $('.main').empty();
			  $('#fenye').empty();
			  var size=data.ajaxMap.size;
			  if(size>0)
			  {
			  var obj=data.ajaxMap.loglist;
			  $('#nowReadFile').val( obj.nowReadFile);
			  $('#nowReadFileRowsNum').val( obj.nowReadFileRowsNum);
			  obj.queTypeMark;
			  var list=obj.retRsOBJList;
			  
			   var html='';
			  
			   
			  $.each(list,function (index,d){  
			    html+='<ul>';
				html+='<li>';
				html+='<div class="left">';
				html+=' <div class="number">'+d.fileRowNum+'</div> ';
				html+='<div class="line"></div>  ';
				html+='<div class="time">'+d.logTime+'</div> ';
				if($.trim(d.leveMark)=='INFO')
				{
				html+=' <div class="state info">INFO</div>';
				}else{
				html+=' <div class="state error">ERROR</div>';
				}
				
				
				html+='  <div class="class">'+d.classMethRowNum+'</div> ';
				html+='</div>';
				html+='<div class="right" state="open">   ';
				html+='<div class="operation"><span class="open">展开</span><span class="close">收起</span></div> ';
				html+='<div class="ico"></div>';
				html+=' </div>   ';
				html+='</li>';
				html+='  <li class="details">'+d.promptMessage+'</li>';
				html+=' </ul>';
				});
				$('.main').append(html);
			 }
			  var fenyehtml='';
			  fenyehtml+='已查了'+size+'条信息';
			  if(size>=1)
			  {
			   fenyehtml+= '<a href="javascript:queryModule();" title="<dict:lang value="下一页" />" ><img src='+path+'plf/images/common/page//icon_next.gif?_mc_res_version=<%=PlfStaticRes.ICON_NEXT_GIF %>" /></a>';
			  }else
			  {
			  
			   fenyehtml+='<img src='+path+'plf/images/common/page/icon_next_n.gif?_mc_res_version=<%=PlfStaticRes.ICON_NEXT_N_GIF %>" /></label>';
			  }
			  $('#fenye').append(fenyehtml);
			  
			}
			
			
				
				util.closeLoading();
						
			},
				error: function(msg){
					util.closeLoading();
					
			  }	
			});
		
		
	}
	function importModule()
	{
		var url = "${path}sys/BussModelAction_importModule.ms";
		showPopWin(url, 300, 200,null,"<dict:lang value="模块导入"/>");
	}
	function exportModule()
	{
		var obj = document.getElementsByName('checkbox');
		var ids = "";
		for(var i = 0; i < obj.length; i++)
		{
			if(obj[i].checked)
			{
				ids += obj[i].value + ',';
			}
		}
		if (ids == '')
		{
			util.alert("<dict:lang value="请选择至少一条记录"/>");
		}
		else
		{
			var filepath = document.getElementById("filepaths");
			filepath.value = ids;
<%--			util.showTopLoading();--%>
			document.forms.moduleForm.submit();
		}
	}
	function alertInfo(msg){
<%--		util.closeTopLoading()--%>
		isSubmit = false;
		util.alert(msg);
	}
	$("#selectAll").click(function(){
		if($(this).is(":checked"))
		{
			$("[name=checkbox]:checkbox").attr("checked",true);
		}
		else
		{
			$("[name=checkbox]:checkbox").attr("checked",false);
		}
	});
	
	function reloadPg(msg){
		util.alert(msg,reload);
		//parent.leftFrame.location.href= "${path}sys/BussModelAction_listBussModelTree.ms";<%-- 刷新模型树菜单列表 --%>
		
		
	}
	
	function reload()
	{
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function update(id){
		var url = "${path}sys/BussModelAction_moduleExport.ms?mid="+id;
		showPopWin(url, 300, 400,null,"<dict:lang value="模块导出及配置"/>");
	}
	
	function init(){
		var tableTrJq = $("#listTable").find("tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);
	}

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>