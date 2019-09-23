<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="持久化模型" /><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="chosen" value="1" />
		<jsp:param name="layui" value="1" />
		<jsp:param name="popDivWin" value="1" />
		
	</jsp:include>
	

</head>
<body>
		<div style="margin-bottom: 80px">
			<!-- 新增模板 -->
			<table id="addDemoTable_index" style="display: none;">
				<tr id="addDemoTr_index" onclick="trClickColor(this);">
					<td style="text-align: center;">
						<span>1</span>
					</td>
					
					<td>
						<dict:selectDict id="index_type" layignore="1" dictCode="INDEX_TYPE" name="index_type" cssClass="isSubmit mc-list-input-edit isSubmit" onchange="colTypeSel_index(this,0);"  />
		
					</td>
					
					<td>
						<s:textfield id="index_name" name="index_name" title='实际创建的索引名称是由持久模型表名称+下划线+自定义' cssClass="isSubmit mc-list-input-edit isSubmit" maxLength="50" onkeyup="javascript:util.replaceLikeVal(this)"/>
					</td>
					
					<td>
						<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
		             				<s:textfield id="index_fields" readonly="true" name="index_fields" cssStyle="" cssClass="isSubmit mc-list-input-edit readonly p_r_30 " maxLength="100" />
		                         	<i class="layui-icon layui-icon-search" onclick="showFields(this);" style="position: absolute;top:11px;right: 8px;"></i>
		                   		</div>
		                   		
					</td>
								
				</tr>
				
			</table>
			
			<!-- 编辑模板  只是查看-->
			<table id="addDemoTable_index2" style="display: none;">
				<tr id="addDemoTr_index2" onclick="trClickColor(this);">
					<td style="text-align: center;">
						<span>1</span>
					</td>
					
					<td>
						<dict:selectDict id="index_type"  layignore="1" dictCode="INDEX_TYPE" name="index_type" cssClass="isSubmit mc-list-input-edit isSubmit" onchange="colTypeSel_index(this,0);"  />
		
					</td>
					
					<td>
						<s:textfield id="index_name" readonly="true" name="index_name" title='实际创建的索引名称是由持久模型表名称+下划线+自定义' cssClass="isSubmit mc-list-input-edit isSubmit" maxLength="50" onkeyup="javascript:util.replaceLikeVal(this)"/>
					</td>
					
					<td>
						<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
		             				<s:textfield id="index_fields" readonly="true" name="index_fields" cssStyle="" cssClass="isSubmit mc-list-input-edit readonly p_r_30 " maxLength="100" />
		                   		</div>
		                   		
					</td>
								
				</tr>
				
			</table>
					
			<div id="index_div" >
				<div id="index_div" style="padding-top:20px;padding-left:20px;padding-right:20px;">
					<table id="addTable_index" class="table_list table-mc-form add_table" <%if(request.getHeader("User-agent").indexOf("Firefox")>-1){%> style="table-layout: fixed;" <%} %>>
						<thead>
							<tr>
								<th width="40px">
									<dict:lang value="序号" />
								</th>
								
								<th width="110px">
									<span class="Eng">*</span><dict:lang value="类型" />
								</th>
								
								<th >
									<span class="Eng">*</span><dict:lang value="名称" />
								</th>
								
								<th >
									<span class="Eng">*</span><dict:lang value="列" />
								</th>
			
							</tr>
						</thead>
						<tbody>
							<!--  
							<tr id="addDataTr_index" onclick="trClickColor(this);">
								<td style="text-align: center;">
									<span>1</span>
								</td>
								
								<td>
									<dict:selectDict id="index_type_0" layignore="1" dictCode="INDEX_TYPE" name="paramList[0].index_type" cssClass="isSubmit mc-list-input-edit" onchange="colTypeSel_index(this,0);"  />
			
								</td>
								
								<td>
									<s:textfield id="index_name_0" name="paramList[0].index_name" cssClass="isSubmit mc-list-input-edit" maxLength="50" onkeyup="javascript:util.replaceLikeVal(this)"/>
								</td>
								
								<td>
									<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
		                				<s:textfield id="index_fields_0" readonly="true" name="paramList[0].index_fields" cssStyle="" cssClass="isSubmit mc-list-input-edit readonly p_r_30" maxLength="100" />
		                            	<i class="layui-icon layui-icon-search" onclick="showFields(this);" style="position: absolute;top:11px;right: 8px;"></i>
		                      		</div>
		                      		
								</td>
			
							</tr>
							-->
						</tbody>
					</table>
					
				</div>
				
				<div class="ptop_10 txac">
					<c:if test="${orm_id==null || orm_id==''}">
						<input id="add_but_index" type="button" value="<dict:lang value="追加" />" onclick="addRow_index();" class="layui-btn">
					
						<input id="del_but_index" type="button" value="<dict:lang value="删除行" />" onclick="delRow_index();" class="layui-btn" >
					
						<input id="sub_but_index" type="button" value="<dict:lang value="确定" />" onclick="sub_index();" class="layui-btn">
					
					</c:if>

					<input id="sub_but_index2" type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn">
					
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
	$(function(){
		 layui.use('form', function(){
		 	var form = layui.form;
		 	
		 })
		 
	})
	
	//<%-- 追加行数据 --%>
	var row_count_index=0;
	function addRow_index(row_arr){
		var addTtable = $('#addTable_index');
		var addTableTr = $('#addDemoTr_index');
		var row = addTableTr.clone(true);
		row[0].id= "data_row_"+row_count_index;
		row.find("td").each(function(seq) {
			if(seq==0){
				$(this).find("span").text(row_count_index+1);
			}else{
				submitObj = $(this).find(".isSubmit");
				var inputName = submitObj.attr("name");
				
				submitObj.attr("id",submitObj.attr("id")+"_"+row_count_index);

				submitObj.attr("name","paramList["+(row_count_index)+"]."+inputName);
				
				if(row_arr!=null && row_arr!=''){
					var index_type=row_arr[0];
					var index_name=row_arr[1];
					var index_fields=row_arr[2];
					
					if("index_type" == inputName){
						submitObj.val(index_type);
					}
					
					if("index_name" == inputName){
						submitObj.val(index_name);
					}
					
					if("index_fields" == inputName){
						submitObj.val(index_fields);
					}
			
				}
				
			}
		});
		if(row_count_index % 2 != 0){
			row.addClass("tr1");
		}
		
		addTtable.append(row);		
		row_count_index++;
		$(document).scrollTop($(document).height());
						
	}
	
	function addRow_index_see(map){
		var addTtable = $('#addTable_index');
		var addTableTr = $('#addDemoTr_index2');
		var row = addTableTr.clone(true);
		row[0].id= "data_row_"+row_count_index;
		row.find("td").each(function(seq) {
			if(seq==0){
				$(this).find("span").text(row_count_index+1);
			}else{
				submitObj = $(this).find(".isSubmit");
				var inputName = submitObj.attr("name");
				
				submitObj.attr("id",submitObj.attr("id")+"_"+row_count_index);

				submitObj.attr("name","paramList["+(row_count_index)+"]."+inputName);
				//console.log(map);
				if(map!=null && map!=''){
					var index_type=map.INDEX_TYPE;
					var index_name=map.INDEX_NAME;
					var index_fields=map.INDEX_FIELDS;
					
					if("index_type" == inputName){
						submitObj.val(index_type);
						submitObj.prop("disabled","disabled");
					}
					
					if("index_name" == inputName){
						submitObj.val(index_name);
						submitObj.prop("title",index_name);
					}
					
					if("index_fields" == inputName){
						submitObj.val(index_fields);
						submitObj.prop("title",index_fields);
					}
			
				}
				
			}
		});
		if(row_count_index % 2 != 0){
			row.addClass("tr1");
		}
		
		addTtable.append(row);		
		row_count_index++;
		$(document).scrollTop($(document).height());
						
	}
	
	function delRow_index(){
		if(null == _oldSselectedTr){
			util.alert("<dict:lang value="请选择要删除的记录行" />");
			return;
		}
		if(row_count_index<2){
			util.alert("<dict:lang value="至少要有一个索引" />");
			return;
		}
		var delSeq = _oldSselectedTr.children("td").eq(0).find("span").text()-1;
		_oldSselectedTr.remove();
		_oldSselectedTr=null;
		row_count--;
		var arrCol = ["INDEX_TYPE","INDEX_NAME","INDEX_FIELDS"];
		$("#addTable_index tr").each(function(seq) {
			var _this = $(this);
			if(seq>delSeq){
				_this.find("td").each(function(sdq) {
					if(sdq==0){
						return true;
					}
					$(this).children().attr("id",arrCol[sdq-1]+"_"+(seq-1));
					$(this).children().attr("name","paramList["+(seq-1)+"]."+arrCol[sdq-1]);
				});
				_this.children("td").eq(0).text(seq);
				if(seq % 2 == 0){
					_this.addClass("tr1");
				}else{
					_this.removeClass("tr1");
				}
			}
		});
		
		
	}
	
	function sub_index(){
		var addTtable = $('#addTable_index');
		var isPass=true;
		if(addTtable.find("tr").length == 1){
			alterWindows("<dict:lang value="必须要添加字段"/>",5);
			return;
		}
		var index_names="";
		var index_value="";
		var pass_flag=false;
	    addTtable.find("tr").each(function (seq){
	    	if(seq==0){
	    		return;
	    	}
	    		
	    	var row_value='';
	    	
	    	var index_type='';
	    	var index_name='';
	    	var index_fields='';
	    	$(this).find("td").each(function (seq2){
	    		var submitObj=$(this).find(".isSubmit");//要提交的表单对象
	    		switch(seq2){
	    			case 1:
	    			index_type=submitObj.val();
	    			
	    			break;
	    			
	    			case 2:
	    			index_name=submitObj.val();
	    			if(val.isBlank(index_name)){
	    				pass_flag=true;
	    				alterWindows("第"+seq+"行"+"<dict:lang value="名称" /> -- <dict:lang value="不能为空" />",5);
	    				return;
	    			}else{
	    				if(index_names==''){
			            	index_names=index_name;
			            }else{
			            	index_names=index_names+','+index_name;
			            }
	    			}
	    			break;
	    			
	    			case 3:
	    			index_fields=submitObj.val();
	    			if(val.isBlank(index_fields)){
	    				pass_flag=true;
	    				alterWindows("第"+seq+"行"+"<dict:lang value="列" /> -- <dict:lang value="不能为空" />",5);
	    				return;
	    			}
	    			break;

	    		}
	    		
	    	});
	    		
	    	row_value=index_type+'@'+index_name+'@'+index_fields;
	    	
	    	if(index_value==''){
	    		index_value=row_value;
	    	}else{
	    		index_value=index_value+'||'+row_value;
	    	}
	    	
	    });
	    
	    if(pass_flag){
	    	return false;
	    }
	    
	    var resObj = util.isRepeat(index_names.split(","));
		if(resObj.res){
   			alterWindows("<dict:lang value="索引名称重复" />",5);
			return false;
		}
		
		//alert(index_value);
		var mcIframeName='${mcIframeName}';
		var obj={"mcIframeName":mcIframeName,"type":"window"};
		//alert(mcIframeName);
		//alert(obj);
		getSrcByIframeName(obj).set_index_value(index_value);
		closePopWin();
    
	}
	
	function showFields(thisObj){	
		var all_fields='${all_fields}';
		var use_fields = $(thisObj).parent().children("input").eq(0).val();
		var index_id=$(thisObj).parent().children("input").eq(0).attr('id');
		
		var mcIframeName = window.frameElement.name; //外层iframe的name
		var url = "${path}sys/BussModelAction_toAddFields.ms"+"?paraMap.mcIframeName="+mcIframeName+'&all_fields='+all_fields+'&use_fields='+use_fields+'&index_id='+index_id;
		showPopWin(url, "950", "680",null,"<dict:lang value="列"/> <dict:lang value="配置"/>");
		
		
	}
	
	function set_indexid(indexid,value){	
		$('#'+indexid).val(value);
		
	}
	
	$(function(){
		var orm_id='${orm_id}';
		if(orm_id==null || orm_id==''){
			//新增
			var mcIframeName='${mcIframeName}';
			var obj={"mcIframeName":mcIframeName,"type":"window"};
			//alert(mcIframeName);
			//alert(obj);
			var index_value=getSrcByIframeName(obj).get_index_value();
			//alert(index_value);
			if(index_value!=null && index_value!=''){
				var index_value_arr=index_value.split("||");
				for(var i=0;i<index_value_arr.length;i++){
					var row_value=index_value_arr[i];
					if(row_value!=null && row_value!=''){
						var row_arr=row_value.split("@");
						addRow_index(row_arr);
						
					}
					
				}
				
			}else{
				addRow_index();
			}
		
		}else{
			//编辑
			$.ajax({
		           url:'${path}sys/BussModelAction_ajaxcrmindex.ms?orm_id=${orm_id}',
		           type:'GET',
		           dataType:'json',
		           success:function (res) {
		           	   var index_value=res.ajaxMap.datas;
		               //alert(index_value);
		               $.each(index_value, function(i, indexDto) {
						    addRow_index_see(indexDto);
            					
					   });  
		               
		           }
		     });
		
		}
		
		
	});
  
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>