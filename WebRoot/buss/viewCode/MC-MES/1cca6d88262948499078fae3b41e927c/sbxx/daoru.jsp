<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
 
  <style>
            .main{
                margin-top:10px;
            }            			
            
	    	.main table {
	    	    width:100%;
	    	    table-layout:fixed;
	    	}
	    	
	    	.main table tr{
	    	    height:30px;
	    	}
	    	
	    	.main table td{
	    	    border:1px solid #dbe1ef;
	    	    box-sizing:border-box;
	    	    text-align:center;
	    	}
	    	
	    	.main .scroll{
	    	    height:230px;
	    	    overflow:auto;
	    	}
	    	
	    	.main .scroll table tr:nth-of-type(1) td{
	    	    border-top:0;
	    	}
	    	
	    	.main .scroll table tr:nth-of-type(2n){
	    	    	background-color:#f0f4fd;
	    	}
	    	
	    	
	    	.main .scroll table select{
	    	    width:100%;
	    	    height:100%;
	    	    outline:none;
	    	    border:0;
	    	    background-color:transparent;
	    	}
	    	
	    	.foot{
	    	    margin-top:10px;
	    	}
	    	
	    	.foot span{
	    	    font-size:16px;
	    	    font-weight:bold;
	    	    color:#f00;
	    	}
	    	
	    	.button{
	    	    display:inline-block;
	    	    height:25px;
	    	    width:60px;
	    	    background-color:#74c3fe;
	    	    color:#fff;
	    	    text-align:center;
	    	    cursor:pointer;
	    	}
  </style>
	<!-- head里面 -->
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div>
			    <div class="optn">
			        <button type="button" ><i class="ico ico-lead"></i><dict:lang value="开始导入" /></button>
			        <button type="button" ><i class="ico ico-save"></i><dict:lang value="保存模块" /></button>
			        <button type="button" ><i class="ico ico-save"></i><dict:lang value="下载模块" /></button>
			    </div>
			   
			</div>
			<div class="bd"	style="height:500px;">
			    <div style="height:30px;">
			        <p style="float:left;">默认值：<span>男</span>&#x3000;值映射：<span>男：0；女：1</span></p>		
                    <label style="float:right;">
                        <span>请选择文件...</span>
                        <span class="button">上传</span>
                        <input type="file" id="file" style="display:none;">
                    </label>
			    </div>
	    		
				<div class="main">
				    <table style="background-color:#e6eaf4;">
				        <tr>
				            <td>电子表格字段</td>
				            <td>数据码表字段</td>
				            <td>必须填</td>
				            <td>主键</td>
				            <td>默认值</td>
				            <td>值映射</td>
				            <td>对照表</td>
				            <td>对照字段</td>
				            <td>取值字段</td>
				        </tr>
				    </table>
				    <div class="scroll">
				        	<table>
			        	    	<tr>
		        	    	    	<td>编号</td>
		        	    	    	<td>
		        	    	    	    <select>
		        	    	    	    	<option>编号</option>
		        	    	    	    	<option>姓名</option>
		        	    	    	    	<option>出生日期</option>
		        	    	    	    	<option>性别</option>
		        	    	    	    </select>
		        	    	    	</td>
		        	    	    	<td><input type="checkbox"></td>
		        	    	    	<td><input type="radio" name="key"></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
			        	    	</tr>
			        	    	<tr>
		        	    	    	<td>姓名</td>
		        	    	    	<td>
		        	    	    	    <select>
		        	    	    	    	<option>编号</option>
		        	    	    	    	<option>姓名</option>
		        	    	    	    	<option>出生日期</option>
		        	    	    	    	<option>性别</option>
		        	    	    	    </select>
		        	    	    	</td>
		        	    	    	<td><input type="checkbox"></td>
		        	    	    	<td><input type="radio" name="key"></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
			        	    	</tr>
			        	    	<tr>
		        	    	    	<td>出生日期</td>
		        	    	    	<td>
		        	    	    	    <select>
		        	    	    	    	<option>编号</option>
		        	    	    	    	<option>姓名</option>
		        	    	    	    	<option>出生日期</option>
		        	    	    	    	<option>性别</option>
		        	    	    	    </select>
		        	    	    	</td>
		        	    	    	<td><input type="checkbox"></td>
		        	    	    	<td><input type="radio" name="key"></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
			        	    	</tr>
			        	    	<tr>
		        	    	    	<td>性别</td>
		        	    	    	<td>
		        	    	    	    <select>
		        	    	    	    	<option>编号</option>
		        	    	    	    	<option>姓名</option>
		        	    	    	    	<option>出生日期</option>
		        	    	    	    	<option>性别</option>
		        	    	    	    </select>
		        	    	    	</td>
		        	    	    	<td><input type="checkbox"></td>
		        	    	    	<td><input type="radio" name="key"></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
			        	    	</tr>
			        	    	<tr>
		        	    	    	<td>性别</td>
		        	    	    	<td>
		        	    	    	    <select>
		        	    	    	    	<option>编号</option>
		        	    	    	    	<option>姓名</option>
		        	    	    	    	<option>出生日期</option>
		        	    	    	    	<option>性别</option>
		        	    	    	    </select>
		        	    	    	</td>
		        	    	    	<td><input type="checkbox"></td>
		        	    	    	<td><input type="radio" name="key"></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
			        	    	</tr>
			        	    	<tr>
		        	    	    	<td>性别</td>
		        	    	    	<td>
		        	    	    	    <select>
		        	    	    	    	<option>编号</option>
		        	    	    	    	<option>姓名</option>
		        	    	    	    	<option>出生日期</option>
		        	    	    	    	<option>性别</option>
		        	    	    	    </select>
		        	    	    	</td>
		        	    	    	<td><input type="checkbox"></td>
		        	    	    	<td><input type="radio" name="key"></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
			        	    	</tr>
			        	    	<tr>
		        	    	    	<td>性别</td>
		        	    	    	<td>
		        	    	    	    <select>
		        	    	    	    	<option>编号</option>
		        	    	    	    	<option>姓名</option>
		        	    	    	    	<option>出生日期</option>
		        	    	    	    	<option>性别</option>
		        	    	    	    </select>
		        	    	    	</td>
		        	    	    	<td><input type="checkbox"></td>
		        	    	    	<td><input type="radio" name="key"></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
			        	    	</tr>
			        	    	<tr>
		        	    	    	<td>性别</td>
		        	    	    	<td>
		        	    	    	    <select>
		        	    	    	    	<option>编号</option>
		        	    	    	    	<option>姓名</option>
		        	    	    	    	<option>出生日期</option>
		        	    	    	    	<option>性别</option>
		        	    	    	    </select>
		        	    	    	</td>
		        	    	    	<td><input type="checkbox"></td>
		        	    	    	<td><input type="radio" name="key"></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
			        	    	</tr>
			        	    	<tr>
		        	    	    	<td>性别</td>
		        	    	    	<td>
		        	    	    	    <select>
		        	    	    	    	<option>编号</option>
		        	    	    	    	<option>姓名</option>
		        	    	    	    	<option>出生日期</option>
		        	    	    	    	<option>性别</option>
		        	    	    	    </select>
		        	    	    	</td>
		        	    	    	<td><input type="checkbox"></td>
		        	    	    	<td><input type="radio" name="key"></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
			        	    	</tr>
			        	    	<tr>
		        	    	    	<td>性别</td>
		        	    	    	<td>
		        	    	    	    <select>
		        	    	    	    	<option>编号</option>
		        	    	    	    	<option>姓名</option>
		        	    	    	    	<option>出生日期</option>
		        	    	    	    	<option>性别</option>
		        	    	    	    </select>
		        	    	    	</td>
		        	    	    	<td><input type="checkbox"></td>
		        	    	    	<td><input type="radio" name="key"></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
		        	    	    	<td></td>
			        	    	</tr>
				        	</table>
				    </div>
				    <p class="foot"><span>*学历、工作经历</span>为必填项，请核实Excel文档，再导入</p>
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
	   <script>
	        		$("#file").change(function(){
	        		    var fileName = $(this)[0].files[0].name;
			            $(this).prev().prev().html(fileName);
			            $(this).prev().prev().attr("title", fileName);
	        		})
	   </script>
	    
    	<script>(function($){
            $(window).on('load',function(){
                setPopScroll('.scroll');
            })
        })(jQuery)											
        </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
