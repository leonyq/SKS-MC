<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>

<script type="text/javascript">
        var checkedUrl = '${path }plf/page/mlabel/img/checked.png';
        var uncheckedUrl = '${path }plf/page/mlabel/img/unchecked.png';
        var currentRule;
        var serialNumberSelect='';
        var variateSelect='';

     //数据项名变更
     function itemNameChange(obj){
                     //var $testInput = $(obj).parent().siblings().eq(9).find("input");//测试数据输入框    
                     var isbar = $(obj).parent().siblings().eq(3).find("input")[0].checked;
                     var isPic = $(obj).parent().siblings().eq(8).find("input")[0].checked;
                     var isSub = $(obj).parent().siblings().eq(9).find("input")[0].checked;
                      if(!isbar && !isPic &&!isSub){//不是条码、图片、子级数量标识时，添加到下一页的 数据项值域中
                        if(globalItemName != "" && globalItemName != null){
                            $("#dataValSel option[value='"+globalItemName+"']").remove(); //先删除原值
                        }
                        //添加新值
                        $("#dataValSel").append("<option value='"+obj.value+"'>"+obj.value+"</option>");
                        updateBarcodeVal(globalItemName,obj.value);
                      }
                     
                      else{
                        if(globalItemName != "" && globalItemName != null){
                            deleteItemName(globalItemName);
                        }
                        codeRulesChange();
                      }
                      
     }
     //更新条码数据项下拉
     function codeRulesChange(){
         $('#codeRules').html('');
         $('.data_item input:checked').each(function(i,elem){
              var itemid=$(elem).parents('tr').find('td').eq(12).text();
              $('#codeRules').append("<option value='"+itemid+"'> " + $(elem).parents('tr').find('.itemName input').val() + "</option>");
           });
     }
     
     //删除数据项
     function deleteItemName(itemName){
      $("#dataValSel option[value='"+itemName+"']").remove(); //删除原值
      updateBarcodeVal(itemName,"");
     }
     
     //增加数据项
     function addItemName(itemName){
      $("#dataValSel").append("<option value='"+itemName+"'>"+itemName+"</option>");
      updateBarcodeVal("",itemName);
     }
     
     //更新第二页码段为数据项时，值域选项的信息
     function updateBarcodeVal(oldVal,newVal){
      //barcodeRule
      
      if(oldVal==newVal){
        return false;
      }
      if($('#barcodeRuleRegi tr').length > 0){
        $('#barcodeRuleRegi tr').each(function(i,item){
          var dataItemVal = $($(item).find("td").get(2)).find("select").val();//数据项
          
          var dataSel = $($(item).find("td").get(3)).find("select");//值域
          
          //var dataVal = .val();//值域
          if(dataItemVal == "dataItem"){//实际使用时，请改为数据项选项的真实值
            if(oldVal != "" && oldVal != null && (newVal == null || newVal == "")){
              dataSel.find("option[value='"+oldVal+"']").remove(); //删除原值
            }else if(newVal != "" && newVal != null && (oldVal == null || oldVal == "")){
              dataSel.append("<option value='"+newVal+"'>"+newVal+"</option>");
            }else if(oldVal != "" && oldVal != null && newVal != "" && newVal != null){
              dataSel.find("option[value='"+oldVal+"']").remove(); //删除原值
              dataSel.append("<option value='"+newVal+"'>"+newVal+"</option>");
            }
          }
        });
      }   
            
     }
     
     //条码规则下拉框变动
     function showCodeRule(obj){
        //console.log(obj);
        $("#"+currentRule).css("display","none");//之前选择的隐藏
        var itemid=$(obj).children('option:selected').val();//
        currentRule=itemid;
        $("#"+itemid).removeAttr("style");
        previewBarData();
     }
        
      //数据项名称得到焦点时
      var globalItemName = "";//
      function itemNameFocus(obj){
        globalItemName = obj.value;//记录原值
      }
      //数据项名称失去焦点时
      function itemNameBlur(obj){
                    if(obj.value == null || obj.value == ""){
                      return;
                    }
                   /* var str=obj.value;
                    if(!/\D/.test(str.substr(0,1))){
                      utilsFp.confirmIcon(3, "", "", "",	"<dict:lang value="数据项名不能以数字开头" />", 0, "300", "");
                      obj.value = "";
                      return false;
                    }
                    var pat=new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]","i");   
                    if(pat.test(str)){
                      utilsFp.confirmIcon(3, "", "", "",	"<dict:lang value="数据项名不能含有特殊字符" />", 0, "300", "");
                      obj.value = "";
                      return false;
                    }  */ 
                
                    var currentRowNum = $(obj).parent().siblings().get(0).innerText;
                    
                    $("#dataItem").find("tbody tr").each(function(j,trObj){
                      if(j == (currentRowNum-1)){
                        return true;
                      }
                      var dataItemVal = $($(trObj).find("td").get(2)).find("input").val();//数据项
                      if(dataItemVal == obj.value){
                        utilsFp.confirmIcon(3, "", "", "",	"<dict:lang value="数据项名不能重复" />", 0, "260", "");
                        obj.value = "";
                        return false;
                      }
                    });
                    
                    itemNameChange(obj);
  
      }
      
      
      
      //是否条码数据项
      function isBarcode(obj){
        var $testInput = $(obj).parent().siblings().eq(10).find("input");//测试数据输入框
        //alert(obj);
        var itemName = $($(obj).parent().siblings().get(2)).find("input").val();//数据项名
        
        if(obj.checked){//条码数据项时测试数据列值不可编辑
         
          $testInput.attr("disabled","disabled");
         
          //$testInput.val("");
          $testInput.css("background","#ddd");
          
           //$("#dataValSel option[value='"+itemName+"']").remove(); //删除原值
           deleteItemName(itemName);
          
        }else{
        
          $testInput.removeAttr("disabled");
          $testInput.removeAttr("style");
          var isPic = $(obj).parent().siblings().eq(8).find("input")[0].checked;
          var isSub = $(obj).parent().siblings().eq(9).find("input")[0].checked;
          if(!isPic&&!isSub){
             addItemName(itemName);
          }
        }
          showHiddenSet(obj);
        
       codeRulesChange();
                
      }
      
      //
      function isItem(obj){
        var $testInput = $(obj).parent().siblings().eq(10).find("input");//测试数据输入框
        var itemName = $($(obj).parent().siblings().get(2)).find("input").val();//数据项名
  
        if(obj.checked){
           deleteItemName(itemName);
        }else{
          var isBar= $(obj).parent().siblings().eq(4).find("input")[0].checked;
          var isSub = $(obj).parent().siblings().eq(9).find("input")[0].checked;
          var isExist=isExistOption('dataValSel',itemName);
          
          if(!isBar&&!isSub&&!isExist){
             addItemName(itemName);
          }
        }
        showHiddenSet(obj);             
      }
      
     function isExistOption(id,value) {  
       var isExist = false;  
       var count = $('#'+id).find('option').length;  
       for(var i=0;i<count;i++)     
       {     
         if($('#'+id).get(0).options[i].value == value){     
             isExist = true;     
             break;     
          }     
      }    
      return isExist;  
   }  

        // 点击添加行
        $("#add1").click(function () {
            var rowCount = $('#first .tableBody table tr').length + 1;
            
            if(rowCount > 60){
              utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value="最大允许添加60个数据项" />", 0, "260", "");
              return;
            }
            var uuid=util.getUUID();
            var str = "";
            str += "<tr>";
            str += "<td>" + rowCount + "</td>";
            str += "<td><div class='selectBox check'></div><input type=\"checkbox\"></td>";
            str += "<td class='itemName'><input type='text' onfocus='itemNameFocus(this)' onblur='itemNameBlur(this)'></td>";
            str += "<td><div class='selectBox check' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\"></td>";
            str += "<td class='data_item'><div class='selectBox check'></div><input type=\"checkbox\"  onchange=\"isBarcode(this);\"></td>";
            str += "<td><div class='selectBox check'></div><input type=\"checkbox\"></td>";
            str += "<td style='display:none'><div class='selectBox check' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\"></td>";
            str += "<td><div class='selectBox radio1'></div><input type=\"checkbox\"></td>";
            str += "<td><div class='selectBox radio2'></div><input type=\"checkbox\" onchange=\"isLabelCount(this);\"></td>";
            str += "<td><div class='selectBox showUpLoading'></div><input type=\"checkbox\" onchange=\"isItem(this);\"></td>";
            str += "<td><div class='selectBox radio3'></div><input type=\"checkbox\" onchange=\"isItem(this);\"></td>";
            str += "<td><input type=\"text\" maxlength=\"200\" class=' _VAL_DATABASE'></td>";
            str += "<td style='display:none'>"+uuid+"</td>";
            str += "<td style='display:none'></td>";
            str += "<td style='display:none'></td>";
            str += "<td style='display:none'></td>";
            str += "<td style='display:none'></td>";
            str += "<td style='display:none'></td>";
            str += "<td style='display:none'></td>";
            str += "<td style='display:none'></td>";
            str += "<td style='width:40px;'><button class='setDataCol' type='button' onclick=\"showSetDiv('setcolumn','backShadow',this);\" ></button></td>";
            str += "<td class='operation' style='width:110px;'><p><span style='margin: 0 1px;' onclick='toTop(this,1)'></span> " ;
				str += "<span style='margin: 0 1px;' onclick='toPrev(this,1)'></span> " ;
				str += "<span style='margin: 0 1px;' onclick='toNext(this,1)'></span> <span style='margin: 0 1px;' onclick='toBottom(this,1)'></span>";
												
				str +="</p></td>";
            str += "</tr>";
            $('#first .tableBody table').append(str);
        })
        
        function showDataItems(data,type){
        	var pList = data.ajaxList;
        	var sourceFlag=true;
			$("#codeRules").html('');
			$("#dataValSel").html('');
			$("#dataValSel").append("<option value=''>--<dict:lang value="请选择" />--</option>");
		    for ( var i = 0; i < pList.length; i++) {
			    if(pList[i].BARCODE_ITEM=='N'&&pList[i].PICTURE_FLAG=='N'&&pList[i].SUBLEVEL_QTY_FLAG=='N'){
		          $("#dataValSel").append("<option value='"+pList[i].DATA_ITEMS_NAME+"'>"+pList[i].DATA_ITEMS_NAME+"</option>");
		        }
		    }
			$('#first .tableBody').find("tr").remove();
			var checkstr = "<div class='selectBox check' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\">";
			var uncheckstr = "<div class='selectBox check'></div><input type=\"checkbox\">";
			for ( var i = 0; i < pList.length; i++) {
				var sourceTemplateId=pList[i].SOURCE_TEMPLATE_ID;
				if(sourceTemplateId!=null&&sourceFlag){
					uncheckstr = "<div class='selectBox'></div><input type=\"checkbox\">";
					checkstr = "<div class='selectBox' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\">"
					sourceFlag=false;
					$("#sourceLabel").val(pList[i].SOURCE_TEMPLATE_ID);
					$("#sourceLabel").trigger("chosen:updated");
					$("#sourceItem").removeAttr("disabled");
					$("#sourceItem").trigger("chosen:updated");
					querySourceItem(pList[i].SOURCE_TEMPLATE_ID);
				}
				var uuid = pList[i].ID;
				if(type=='add'){
				   uuid = util.getUUID();
				}
				var str = "";
				str += "<tr>"
				str += "<td>" + pList[i].SEQ + "</td>";
				str += "<td><div class='selectBox check'></div><input type=\"checkbox\"></td>";
				if(sourceTemplateId!=null){
					str += "<td class='itemName' title='"+ pList[i].DATA_ITEMS_NAME + "'><input type='text' readonly  value='"
					+ pList[i].DATA_ITEMS_NAME + "'></td>";
				}
				else{
					str += "<td class='itemName' title='"+ pList[i].DATA_ITEMS_NAME + "'><input type='text' maxlength=\"100\" class=' _VAL_DATABASE' onfocus='itemNameFocus(this)' onblur='itemNameBlur(this)' value='"
						+ pList[i].DATA_ITEMS_NAME + "'></td>";
				}
				var v = pList[i].EMPTY_FLAG;
				if (v == 'Y') {
					str += "<td>" + checkstr + "</td>";
				} else {
					str += "<td>" + uncheckstr + "</td>";
				}
				v = pList[i].BARCODE_ITEM;
				if (v == 'Y') {
					
					$('#codeRules').append("<option value='"+uuid+"'> " + pList[i].DATA_ITEMS_NAME + "</option>");
					
				    if(sourceTemplateId!=null){
						  str += "<td class='data_item'><div class='selectBox'  style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\" ></td>";
				    }
				    else{
					  str += "<td class='data_item'><div class='selectBox check'  style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\" onchange=\"isBarcode(this);\"></td>";
				    }
					var barData = pList[i].barlist;
					
					var barTable = "<table id='"+uuid+"' style='display:none'>";
					for ( var j = 0; j < barData.length; j++) {
						barTable += "<tr>"
						barTable += "<td>"
								+ barData[j].ITEM_ORDER
								+ "</td>";
						barTable += "<td><div class='selectBox check'></div><input type=\"checkbox\"></td>";
						if (barData[j].ITEM_TYPE == 1) {
							barTable += "<td class='codeName'><select>"
							barTable += "<option value='text' selected><dict:lang value="文本" /></option>"
							barTable += "<option value='dataItem'><dict:lang value="数据项" /></option>"
							barTable += "<option value='serialNumber'><dict:lang value="流水号" /></option>"
							barTable += "<option value='variate'><dict:lang value="变量" /></option>"
							barTable += "</select></td>";
							barTable += "<td class='codeMain'><input type='text' value='"+barData[j].ITEM_VALUE+"' ></td>";
							barTable += "<td class='codeLength'></td><td class='fillStyle'></td><td class='fillChar'></td>";
						} else if (barData[j].ITEM_TYPE == 2) {
							barTable += "<td class='codeName'><select>";
							barTable += "<option value='text' ><dict:lang value="文本" /></option>";
							barTable += "<option value='dataItem' selected><dict:lang value="数据项" /></option>";
							barTable += "<option value='serialNumber'><dict:lang value="流水号" /></option>";
							barTable += "<option value='variate'><dict:lang value="变量" /></option>";
							barTable += "</select></td>";
							
							barTable += "<td class='codeMain'><select>"
									+ $("#dataValSel").html()
									+ "</select></td>";
									
							barTable += "<td class='codeLength'></td><td class='fillStyle'></td><td class='fillChar'></td>";
						} else if (barData[j].ITEM_TYPE == 3) {
							barTable += "<td class='codeName'><select>"
							barTable += "<option value='text' ><dict:lang value="文本" /></option>"
							barTable += "<option value='dataItem' ><dict:lang value="数据项" /></option>"
							barTable += "<option value='serialNumber'><dict:lang value="流水号" /></option>"
							barTable += "<option value='variate' selected><dict:lang value="变量" /></option>"
							barTable += "</select></td>";
							barTable += "<td class='codeMain'><select>"
									+ variateSelect
									+ "</select></td>";
							barTable += "<td class='codeLength' ></td><td class='fillStyle'></td><td class='fillChar'></td>";

						} else if (barData[j].ITEM_TYPE == 4) {
							barTable += "<td class='codeName'><select>"
							barTable += "<option value='text' ><dict:lang value="文本" /></option>"
							barTable += "<option value='dataItem' ><dict:lang value="数据项" /></option>"
							barTable += "<option value='serialNumber' selected><dict:lang value="流水号" /></option>"
							barTable += "<option value='variate' ><dict:lang value="变量" /></option>"
							barTable += "</select></td>"
							barTable += "<td class='codeMain'><select>"
									+ serialNumberSelect
									+ "</select></td>";
							var str4 = "<td class='codeLength' ><input type='text' value='"+barData[j].ITEM_LEN+"'></td>";
							var str5 = "<td class='fillStyle'><select><option value='1'><dict:lang value='左' /></option><option value='2'><dict:lang value='右' /></option><option value='0'><dict:lang value='无填充' /></option></select></td>";
							var str6 = "<td class='fillChar'><input type='text' maxlength='1' value='"+nullToEmpty(barData[j].FILL_CHAR)+"'></td>";
							barTable += str4;
							barTable += str5;
							barTable += str6;
						}
						if(type!='view'){
						barTable += "<td class='operation'><p><span onclick='toTop(this)'></span><span onclick='toPrev(this)'></span><span onclick='toNext(this)'></span><span onclick='toBottom(this)'></span></p></td>"
						}
						barTable += "</tr>";
					}
					barTable += "</table>";
					$("#barcodeRule").after(barTable);
					$("#"+uuid+" tr").each(function(t,e){
                       $(e).find("td:eq(3)").find('select').val(barData[t].ITEM_VALUE);
                       $(e).find("td:eq(5)").find('select').val(barData[t].FILL_STYLE); 
                     }); 

				} else {
					if(sourceTemplateId!=null){
						str += "<td class='data_item'><div class='selectBox'></div><input type=\"checkbox\"  ></td>";
					}
					else{
						str += "<td class='data_item'><div class='selectBox check'></div><input type=\"checkbox\"  onchange=\"isBarcode(this);\"></td>";
					}
				}
				v = pList[i].ALLOW_EDIT;
				if (v == 'Y') {
					str += "<td>" + checkstr + "</td>";
				} else {
					str += "<td>" + uncheckstr + "</td>";
				}
				v = pList[i].ALLOW_DISPLAY;
				if (v == 'Y') {
					str += "<td style='display:none'>" + checkstr + "</td>";
				} else {
					str += "<td style='display:none'>" + uncheckstr + "</td>";
				}
				v = pList[i].MATCH_CODE;
				if (v == 'Y') {
					if(sourceTemplateId!=null){
					   str += "<td><div class='selectBox' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\" ></td>";
					}
					else {
						str += "<td><div class='selectBox radio1' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\" ></td>";
					}
				} else {
					if(sourceTemplateId!=null){
						str += "<td><div class='selectBox'></div><input type=\"checkbox\"></td>";

					}
					else {
						str += "<td><div class='selectBox radio1'></div><input type=\"checkbox\"></td>";
					}
				}

				v = pList[i].LABEL_COUNT;
				if (v == 'Y') {
					if(sourceTemplateId!=null){
						str += "<td><div class='selectBox' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\"  ></td>";
					}
					else{
						str += "<td><div class='selectBox radio2' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\" onchange=\"isLabelCount(this);\"></td>";
					}
				} else {
					if(sourceTemplateId!=null){
						str += "<td><div class='selectBox'></div><input type=\"checkbox\" ></td>";
					}
					else{
						str += "<td><div class='selectBox radio2'></div><input type=\"checkbox\" onchange=\"isLabelCount(this);\"></td>";
					}
				}
				v = pList[i].PICTURE_FLAG;
				if (v == 'Y') {
					str += "<td><div class='selectBox showUpLoading' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\" onchange=\"isItem(this);\"></td>";
				} else {
					str += "<td><div class='selectBox showUpLoading'></div><input type=\"checkbox\" onchange=\"isItem(this);\"></td>";
				}
				v = pList[i].SUBLEVEL_QTY_FLAG;
				if (v == 'Y') {
					if(sourceTemplateId!=null){
						str += "<td><div class='selectBox' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\" ></td>";
					}
					else{
						str += "<td><div class='selectBox radio3' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\" onchange=\"isItem(this);\"></td>";
					}
				} else {
					if(sourceTemplateId!=null){
						str += "<td><div class='selectBox'></div><input type=\"checkbox\" ></td>";

					}
					else{
						str += "<td><div class='selectBox radio3'></div><input type=\"checkbox\" onchange=\"isItem(this);\"></td>";
					}
				}
				v = pList[i].PICTURE_FLAG;
				if (v == 'Y') {
					str += "<td><label ><span  class='upLoading'><dict:lang value='图片上传' /></span><input type='file' name='upFiles' accept='image/*' style='left:-9999px;position:absolute;'></label><span class=\"fileName\" title='"+pList[i].PICTURE_NAME_S+"'>"
							+ pList[i].PICTURE_NAME_S
							+ "</span></td>";
				} else {
					str += "<td><input type=\"text\" maxlength=\"200\" class=' _VAL_DATABASE' value='"+nullToEmpty(pList[i].TEST_DATA)+"'></td>";
				}

				str += "<td style='display:none'>" + uuid
						+ "</td>";
				str += "<td style='display:none'>" + pList[i].DATA_ITEMS_ALIAS
						+ "</td>";
			    str += "<td style='display:none'>" + nullToEmpty(pList[i].PICTURE_NAME_S)
						+ "</td>";
				str += "<td style='display:none'>" + nullToEmpty(pList[i].PICTURE_PATH)
						+ "</td>";
				str += "<td style='display:none'>" + nullToEmpty(pList[i].SOURCE_TEMPLATE_ID)
						+ "</td>";
				str += "<td style='display:none'>" + nullToEmpty(pList[i].SOURCE_ITEM_ID)
				        + "</td>";
				str += "<td style='display:none'>" + nullToEmpty(pList[i].COLUMN_TYPE)
				        + "</td>";
                str += "<td style='display:none'>" + nullToEmpty(pList[i].COLUMN_DATA)
				        + "</td>";
			 if(type!='view'){
                str += "<td style='width:40px;'>";
                if(sourceTemplateId==null||sourceTemplateId==''){
                   if(pList[i].BARCODE_ITEM=='N'&&pList[i].LABEL_COUNT=='N'&&pList[i].PICTURE_FLAG=='N'&&pList[i].SUBLEVEL_QTY_FLAG=='N'){
                   str += "<button class='setDataCol' type='button' onclick=\"showSetDiv('setcolumn','backShadow',this);\" ></button>";
                   }else{
                      str += "<button class='setDataCol' style='display:none' type='button' onclick=\"showSetDiv('setcolumn','backShadow',this);\" ></button>";
                   }
                }
                str +="</td>";
 
				str += "<td class='operation' style='width:110px;'><p><span style='margin: 0 1px;' onclick='toTop(this,1)'></span> " ;
				str += "<span style='margin: 0 1px;' onclick='toPrev(this,1)'></span> " ;
				str += "<span style='margin: 0 1px;' onclick='toNext(this,1)'></span> <span style='margin: 0 1px;' onclick='toBottom(this,1)'></span>";
												
				str +="</p></td>";
			}
				str += "</tr>";
				$('#first .tableBody table').append(str);
			}
        }
        
        function copyTemplate() {
			var sourceTemplate = $("#sourceTemplate").val();
			if (sourceTemplate == '') {
				utilsFp.confirmIcon(1, "", "", "",
						"<dict:lang value="请选择复制来源" />", 0, "260", "");
				return;
			}
			jQuery
					.ajax({
						type : "POST",
						dataType : "json",
						url : templateurl
								+ "&type=copyTemplate&sourceTemplate="
								+ sourceTemplate,
						success : function(data) {
							var pList = data.ajaxList;
							for ( var i = 0; i < pList.length; i++) {
								var sourceTemplateId=pList[i].SOURCE_TEMPLATE_ID;
								if(sourceTemplateId!=null){
									$("#boxLabelFlag").val('Y');
							        document.getElementById("box_label_checkbox").checked=true;
							        	  
							      }
	
							}
							showDataItems(data,'add');
							
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							util.closeLoading();

						}
					});
		}
        $("#add2").click(function () {
            var codeRules=$("#codeRules").val();
            var rowCount = $('#'+codeRules+' tr').length + 1;
            var str = "";
            str += "<tr>"
            str += "<td>" + rowCount + "</td>"
            str += "<td><div class='selectBox check'></div><input type=\"checkbox\"></td>"
            str += "<td class='codeName'><select>"
            str += "<option value='text'><dict:lang value="文本" /></option>"                       
            str += "<option value='dataItem'><dict:lang value="数据项" /></option>"                        
            str += "<option value='serialNumber'><dict:lang value="流水号" /></option>"                        
            str += "<option value='variate'><dict:lang value="变量" /></option>" 
            str += "</select></td>"
            str += "<td class='codeMain'><input type='text'></td>"
            str += "<td class='codeLength'></td><td class='fillStyle'></td><td class='fillChar'></td>"
            str += "<td class='operation'><p><span onclick='toTop(this)'></span><span onclick='toPrev(this)'></span><span onclick='toNext(this)'></span><span onclick='toBottom(this)'></span></p></td>"
            str += "</tr>" 

            $('#'+codeRules).append(str);    
        })


        // 点击删除行
        $("#delete1").click(function () {
            if($('#first .tableBody tr').find('td:eq(1)').find('input:checked').length == 0){
              utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少选择一条记录" />","","260","145");
              return;
            }
            utilsFp.confirmIcon(1,"","delete1",'', "<dict:lang value='确认删除？' />","1","","");
            
        });
        
        function delete1(){
          $('#first .tableBody tr').find('td:eq(1)').find('input:checked').each(function (i, elem) {
                var index = $(elem).parents('tr').index();
                
                
                var $testInput = $(elem).parent().siblings().eq(11).find("input");//测试数据输入框
        
                var itemName = $($(elem).parent().siblings().get(1)).find("input").val();//数据项名
                if(itemName != "" && itemName != "" && !$testInput.attr("disabled") && $testInput.attr("type") != "file"){
                  deleteItemName(itemName);
                } 
               
                $('#first .tableBody').find("tr:eq(" + index + ")").remove();
            });
            sort('#first');
            codeRulesChange();
        }
        $("#delete2").click(function () {
           var codeRules=$("#codeRules").val();
          
            if($('#'+codeRules+' tr').find('td:eq(1)').find('input:checked').length == 0){
              utilsFp.confirmIcon(1,"","","", "<dict:lang value="请至少选择一条记录" />","","260","145");
              return;
            } 
               
            utilsFp.confirmIcon(1,"","delete2",codeRules, "<dict:lang value='确认删除？' />","1","","");   
            
        });
        
        function delete2(codeRules){
          $('#'+codeRules+' tr').find('td:eq(1)').find('input:checked').each(function (i, elem) {
                var index = $(elem).parents('tr').index();
                $('#'+codeRules).find("tr:eq(" + index + ")").remove();
            })
            
            sortBar('#'+codeRules);
        }

        //重新排序
        function sort(block) {
            $(block +' .tableBody  tr').find('td:eq(0)').each(function (i, elem) {
                $(elem).html(i + 1);
            });
        }
        
        function sortBar(block) {
            $(block +'  tr').find('td:eq(0)').each(function (i, elem) {
                $(elem).html(i + 1);
            });
            previewBarData();
        }

        //点击模拟checkBox事件
        $('.bottom').on('click', '.check', function () {
            $(this).next().click();
            if ($(this).css('background-image').indexOf('unchecked.png') > 0) {
                $(this).css('background-image', 'url(' + checkedUrl + ')');
            } else {
                $(this).css('background-image', 'url(' + uncheckedUrl + ')');
                $(this).parents('.bottom').find('.checkAll').css('background-image', 'url(' + uncheckedUrl + ')');
                $(this).parents('.bottom').find('.checkAll').next().attr("checked", false);
            }
        })

        // 绑定全选 
        function selectAll(block){
            $(block + ' .bottom').on('click', '.checkAll', function () {
                $(this).next().click();
                var isCheck = $(this).css('background-image').indexOf('unchecked.png') > 0 ? false : true;
                if (isCheck) {//如果已是勾选状态
                    $(this).css('background-image', 'url(' + uncheckedUrl + ')');
                    $(block + ' .tableBody tr td:nth-of-type(2) .check').each(function (i, elem) {
                        //遍历所有勾选框
                        if ($(elem).css('background-image').indexOf('unchecked.png') == -1) {
                            $(elem).click();  //如果是已勾选，触发该元素的点击事件
                        }
                    })
                } else {
                    $(this).css('background-image', 'url(' + checkedUrl + ')');
                    $(block + ' .tableBody tr td:nth-of-type(2) .check').each(function (i, elem) {
                        if ($(elem).css('background-image').indexOf('unchecked.png') > 0) {
                            $(elem).click();
                        }
                    })
                }
            })
        }
        

        //点击单选
        $('#first .bottom').on('click', '.radio1', function () {
            if ($(this).css('background-image').indexOf('unchecked.png') > 0) {
                $('#first .radio1').each(function (i, elem) {
                    $(elem).css('background-image', 'url(' + uncheckedUrl + ')');
                    $(elem).next().attr("checked", false);
                })
                $(this).next().click();
                $(this).css('background-image', 'url(' + checkedUrl + ')');
            } else {
                $('#first .radio1').each(function (i, elem) {
                    $(elem).css('background-image', 'url(' + uncheckedUrl + ')');
                    $(elem).next().attr("checked", false);
                })
            }
        })

        $('#first .bottom').on('click', '.radio2', function () {
            if ($(this).css('background-image').indexOf('unchecked.png') > 0) {
                $('#first .radio2').each(function (i, elem) {
                    $(elem).css('background-image', 'url(' + uncheckedUrl + ')');
                    $(elem).next().attr("checked", false);
                })
                $(this).next().click();
                $(this).css('background-image', 'url(' + checkedUrl + ')');
            } else {
                $(this).next().click();
                $('#first .radio2').each(function (i, elem) {
                    $(elem).css('background-image', 'url(' + uncheckedUrl + ')');
                    $(elem).next().attr("checked", false);
                })
            }
        })
        $('#first .bottom').on('click', '.radio3', function () {
            if ($(this).css('background-image').indexOf('unchecked.png') > 0) {
                $('#first .radio3').each(function (i, elem) {
                    if($(elem).next().is(':checked')){
                       $(elem).css('background-image', 'url(' + uncheckedUrl + ')');
                       $(elem).next().attr("checked", false);
                       isItem($(elem).next());
                    }
                    
                });
                $(this).next().click();
                $(this).css('background-image', 'url(' + checkedUrl + ')');
            } else {
                /* $('#first .radio3').each(function (i, elem) {
                    $(elem).css('background-image', 'url(' + uncheckedUrl + ')');
                    $(elem).next().attr("checked", false);
                    isItem($(elem).next());
                }) */
                $(this).next().click();
                $(this).css('background-image', 'url(' + uncheckedUrl + ')');
            }
        })
        //点击显示上传框
        $('#first .bottom').on('click', '.showUpLoading', function () {
            var str1 = "<label ><span  class='upLoading'><dict:lang value='图片上传' /></span><input type='file' name='upFiles' accept='image/*' style='left:-9999px;position:absolute;'></label><span class='fileName'></span>";
            var str2 = "<input type=\"text\">";
            $(this).next().click();
            if ($(this).css('background-image').indexOf('unchecked.png') > 0) {
                $(this).css('background-image', 'url(' + checkedUrl + ')');
                $(this).parent().next().next().html(str1);
            } else {
                $(this).css('background-image', 'url(' + uncheckedUrl + ')');
                $(this).parent().next().next().html(str2);
            }
        })

        //点击模拟图片上传
        $('#first .bottom').on('click', '.upLoading', function () {
            //$(this).next().click();
        })

        //图片改变获取文件名
       $('#first .bottom').on('change',"input[type='file']",function() {

					//var file = this.files[0];
					var fileSize = 0;
					var isIE = /msie/i.test(navigator.userAgent)
							&& !window.opera;

					if (isIE && !$(this)[0].files) {
						var filePath = $(this)[0].value;
						var fileSystem = new ActiveXObject(
								"Scripting.FileSystemObject");
						var file = fileSystem.GetFile(filePath);
						fileSize = file.Size;
					} else {
						fileSize = $(this)[0].files[0].size;
					}
					var size = fileSize / 1024;
					if (size > 500) {
						utilsFp.confirmIcon(1, "", "", "",
								"<dict:lang value='图片上传不能大于'/>500K", 0, "300",
								"");
						$(this)[0].value = "";
						$(this).parent().next().html('');
					    $(this).parent().next().attr("title", '');
						return false;
					}
					var fileName = $(this)[0].files[0].name;
					$(this).parent().next().html(fileName);
					$(this).parent().next().attr("title", fileName);
				})
        
        function toTop(elem,tb){
            var tr = $(elem).parents('tr');
            $(elem).parents('table').prepend(tr);
            if(tb==1){
              sort('#first');
            }
            else{
               sortBar('#'+currentRule);
            }
        }
        function toBottom(elem,tb){
            var tr = $(elem).parents('tr');
            $(elem).parents('table').append(tr);
            if(tb==1){
              sort('#first');
            }
            else{
               sortBar('#'+currentRule);
            }
        }
        function toPrev(elem,tb){
            var tr = $(elem).parents('tr');
            var index = $(elem).parents('tr').index();
            if(index > 0){
                $(elem).parents('table').find('tr').eq(index - 1).before(tr);
            }
            if(tb==1){
              sort('#first');
            }
            else{
               sortBar('#'+currentRule);
            }
        }
        function toNext(elem,tb){
            var tr = $(elem).parents('tr');
            var index = $(elem).parents('tr').index();
            var rowCount = $(elem).parents('table').find('tr').length;
            if(index + 1 < rowCount){
                $(elem).parents('table').find('tr').eq(index + 1).after(tr);
            }
            if(tb==1){
              sort('#first');
            }
            else{
               sortBar('#'+currentRule);
            }
        }


        //码段改变事件
        $('#second .bottom').on('change','.codeName select',function(){
            var self = $(this)
            switch($(this).val()){
                case 'text':
                {
                    var str1 = "<input type='text'>";
                    self.parents('tr').find('.codeMain').html(str1);
                    self.parents('tr').find('.codeLength').html('');
                    self.parents('tr').find('.fillStyle').html('');
                    self.parents('tr').find('.fillChar').html('');
                    break;
                }  
                case 'dataItem':
                {   
                    //var str2 = "<select><option>数据项1</option><option>数据项2</option></select>"
                    var str2 = "<select>"+$("#dataValSel").html()+"</select>";
                    self.parents('tr').find('.codeMain').html(str2);
                    self.parents('tr').find('.codeLength').html('');
                    self.parents('tr').find('.fillStyle').html('');
                    self.parents('tr').find('.fillChar').html('');
                    break;
                }     
                case 'serialNumber':
                {  
                    var str3 = "<select>"+serialNumberSelect+"</select>";
                    var str4 = "<input type='text' onkeyup=\"this.value=this.value.replace(/\\D/g,'')\" onafterpaste=\"this.value=this.value.replace(/\\D/g,'')\" >";
                    var str5 = "<select><option value='1'><dict:lang value='左' /></option><option value='2'><dict:lang value='右' /></option><option value='0'><dict:lang value='无填充' /></option></select>";
                    var str6 = "<input type='text' maxlength='1' >";
                    self.parents('tr').find('.codeMain').html(str3);
                    self.parents('tr').find('.codeLength').html(str4);
                    self.parents('tr').find('.fillStyle').html(str5);
                    self.parents('tr').find('.fillChar').html(str6);
                    break;
                }     
                case 'variate':
                {
                    //var str7 = "<input type='text'>";
                    var str7 = "<select>"+variateSelect+"</select>";
                    self.parents('tr').find('.codeMain').html(str7);
                    self.parents('tr').find('.codeLength').html('');
                    self.parents('tr').find('.fillStyle').html('');
                    self.parents('tr').find('.fillChar').html('');
                    break;
                }
                default:
                    break;
            }
            previewBarData();
            
        })
        
       
         //条码数据项表
        function validateBarItem(){
           
           var k;
           
           for(var m=0;m<document.getElementById('codeRules').options.length;m++){
               var itemid=document.getElementById('codeRules').options[m].value;
               var itemtext=document.getElementById('codeRules').options[m].text;
               var $barcodeRuletr=$('#'+itemid+' tbody tr');
               rowCount = $barcodeRuletr.length; //行数
               if(rowCount == 0){
                 utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='条码规则“%s”未添加条码数据项' param1='"+itemtext+"' />", 0, "360", "");

                  return false;
               }
               var serialNumberRows = new Array();
               for ( var i = 0; i < rowCount; i++) {
               
                k=i+1;                
                var itemType=$barcodeRuletr.eq(i).find('td').eq(2).find('select').val();
                var itemTypeV;
                var itemValue;
                
                /* 码段类型(1:文本 2:数据项 3:变量 4流水号) */
                if(itemType=='text') {
                   itemTypeV=1;
                   itemValue=$barcodeRuletr.eq(i).find('td').eq(3).find('input').val();
                }
                else if(itemType=='dataItem'){
                      itemTypeV=2;
                      itemValue=$barcodeRuletr.eq(i).find('td').eq(3).find('select').val();
                 }
                else if(itemType=='variate'){
                    itemTypeV=3;
                    itemValue=$barcodeRuletr.eq(i).find('td').eq(3).find('select').val();
                 }
                else if(itemType=='serialNumber'){//
                    itemTypeV=4;
                    itemValue=$barcodeRuletr.eq(i).find('td').eq(3).find('select').val();
                    var itemLen=$barcodeRuletr.eq(i).find('td').eq(4).find('input').val();
                    if(itemLen==null||itemLen==''){
                      utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='条码规则“%s”第%s行长度为空，请填写' param1='"+itemtext+"' param2='"+k+"' />", 0, "360", "");
				      return false;
                 
                    }
                    var itemChar=$barcodeRuletr.eq(i).find('td').eq(6).find('input').val();
                    if(itemChar==null||itemChar==''){
                      utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='条码规则“%s”第%s行填充字符为空，请填写' param1='"+itemtext+"' param2='"+k+"' />", 0, "360", "");
				      return false;
                 
                    }
                    serialNumberRows.push(k);
                 }
                if(itemTypeV==null||itemTypeV==''){
                    utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='条码规则“%s”第%s行码段为空，请填写' param1='"+itemtext+"' param2='"+k+"' />", 0, "360", "");
				    return false;
                 
                 }
                 if(itemValue==null||itemValue==''){
                    utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='条码规则“%s”第%s行值域为空，请填写' param1='"+itemtext+"' param2='"+k+"'/>", 0, "360", "");
					return false;
                 }
                
             }
             if(serialNumberRows.length > 1){
              utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='条码规则“%s”码段流水号不能选择多个' param1='"+itemtext+"' />", 0, "360", "");
              return false;
            }
           }
           return true;
        }
       
        //数据项表
        function validateItem(){
            
            var $dataItemTr = $("#dataItem").find("tbody tr");
            
            if($dataItemTr.length == 0){
              utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='请添加标签数据项' />", 0, "260", "");
              return false;
            }
            
            //判断必填项是否有填            
            var emptyRows = new Array();//记录数据项为空的行号
            var requiredRows = new Array();//非条码数据项时测试数据列值必填，最长100个字符
            //var barcodeRows = new Array();//条码数据项
            var matchCodeRows = new Array();
            var countsRows = new Array();
            $dataItemTr.each(function(j,trObj){
                   var dataItemVal = $($(trObj).find("td").get(2)).find("input").val();//数据项
                      if(dataItemVal == "" ||　dataItemVal == null){//数据项为空时，记录行号
                        emptyRows.push(j+1);
                      }
  
                      var $testInput = $(trObj).find("td").eq(11).find("input");//测试数据输入框
                      var isBar = $($(trObj).find("td").get(4)).find("input")[0].checked;
                      
                      var isPic = $($(trObj).find("td").get(9)).find("input")[0].checked;
                      if(isPic){
                    	 var fileName=$(trObj).find("td").eq(11).find("label").next().html();
                        if(fileName==null||fileName==''){
                          requiredRows.push(j+1);
                        }
                      }
                      if(!isBar&&!isPic && ($testInput.val() == "" || $testInput.val() == null)){
                    	 
                        requiredRows.push(j+1);
                       
                      }
                      /* var isCheck=$(trObj).find('td').eq(4).find('input')[0].checked;
                      if(isCheck){
                        barcodeRows.push(j+1);
                      } */
                      var isCheck=$(trObj).find('td').eq(7).find('input')[0].checked;
                      if(isCheck){
                        matchCodeRows.push(j+1);
                      }
                      isCheck=$(trObj).find('td').eq(8).find('input')[0].checked;
                      if(isCheck){
                        countsRows.push(j+1);
                      }
              });
            
            if(emptyRows.length > 0){
              utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='第%s行 数据项为空，请填写' param1='"+emptyRows[0]+"' />", 0, "360", "");
              return false;
            }
            if(matchCodeRows.length > 1){
              utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='匹配料号不能选择多个' />", 0, "360", "");
              return false;
            }
            if(matchCodeRows.length !=countsRows.length){
              utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='匹配料号和张数计算项必须同时选中或不选' />", 0, "400", "");
              return false;
            }
            
            
            if(requiredRows.length > 0){
              utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='第%s行 测试数据为空，请填写' param1='"+requiredRows[0]+"' />", 0, "360", "");
              return false;
            }
            /*if(barcodeRows.length == 0){
              utilsFp.confirmIcon(3, "", "", "",
								"<dict:lang value='请选中条码数据项，再下一步' />", 0, "360", "");
              return false;
            }*/
            return true;
        }

        // 上下页面互换
        $('.main').on('click','.next',function(){
            if (!val.valNullData()) {
				return false;
		    } 
            if(!validateItem()) return false;
            if($('.data_item input:checked').length==0){
            	 utilsFp.confirmIcon(3, "", "", "",
							"<dict:lang value='未选中条码数据项，不需要下一步' />", 0, "360", "");
                 return false;
            }
            $('#first').css('display','none');
            $('#second').css('display','block');
            $('#codeRules').html('');
            $('.data_item input:checked').each(function(i,elem){
                var itemid=$(elem).parents('tr').find('td').eq(12).text();
                $('#codeRules').append("<option value='"+itemid+"'> " + $(elem).parents('tr').find('.itemName input').val() + "</option>");
                
                //创建table
                if($("#"+itemid).length==0){
                  var $tab=$("#barcodeRule").clone(true).attr('id',itemid);
                  //console.log($tab);
                  $("#barcodeRule").after($tab);
                 
                }
                if(i==0){
                  currentRule=itemid;                
                  $("#"+itemid).removeAttr("style");
                 }
                 else{
                  $("#"+itemid).css('display','none');
                 }
            });
            previewBarData();
        });

        $('.main').on('click','.prev',function(){
            $('#first').css('display','block');
            $("#"+currentRule).css('display','none');
            $('#second').css('display','none');
        });
        
       function nullToEmpty(str){
	     if(str==null){
	        return '';
	      }
	        return str;
	     }
	     
	     function querySerialNumber(){
	         jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	   		async:false,
 	    	url: templateurl+"&type=querySerialNumber",
 			success: function(data){
 				var pList=data.ajaxList; 				
 				for(var i=0;i<pList.length;i++){ 				  
 				   serialNumberSelect+="<option value='"+pList[i].ID+"'>"+pList[i].VARIABLE_NAME+"</option>";
 				}
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				
 		   }
 		});
	    }
	    
	    function queryVar(){
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	   		async:false,
 	    	url: templateurl+"&type=queryVar",
 			success: function(data){
 				var pList=data.ajaxList; 				
 				for(var i=0;i<pList.length;i++){ 				  
 				  variateSelect+="<option value='"+pList[i].ID+"'>"+pList[i].VARIABLE_NAME+"</option>";
 				}
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				
 		   }
 		});
	    
	    }
	    
	    $('#barcodeRuleRegi').on('change','.codeMain,.fillStyle select',function(){
	       previewBarData();
	    });
	    $('#barcodeRuleRegi').on('input','input',function(){
	       previewBarData();
	    });
	    
	    function previewBarData(){
	           var itemid=$("#codeRules").val();
	           var $barcodeRuletr=$('#'+itemid+' tbody tr');
               rowCount = $barcodeRuletr.length; //行数
               var barArr=[];
               for ( var i = 0; i < rowCount; i++) {
                var  baritemS = {};
                baritemS.DI_ID=itemid;
               
                seq=$barcodeRuletr.eq(i).find('td').eq(0).text();
                baritemS.ITEM_ORDER=seq;
                var itemType=$barcodeRuletr.eq(i).find('td').eq(2).find('select').val();
                var itemTypeV;
                var itemValue;
                
                /* 码段类型(1:文本 2:数据项 3:变量 4流水号) */
                if(itemType=='text') {
                   itemTypeV=1;
                   itemValue=$barcodeRuletr.eq(i).find('td').eq(3).find('input').val();
                }
                else if(itemType=='dataItem'){
                      itemTypeV=2;
                      itemValue=$barcodeRuletr.eq(i).find('td').eq(3).find('select').val();
                      
                      $("#dataItem tbody tr" ).each(function(index,item){
 				        var text=$(item).find('td:eq(2) input').val();
 				        if(text==itemValue) {
 				          itemValue=$(item).find('td:eq(11) input').val();
 				          return false;
 				        }
 				        
                });
                 }
                else if(itemType=='variate'){
                    itemTypeV=3;
                    itemValue=$barcodeRuletr.eq(i).find('td').eq(3).find('select').val();
                 }
                else if(itemType=='serialNumber'){//
                    itemTypeV=4;
                    itemValue=$barcodeRuletr.eq(i).find('td').eq(3).find('select').val();                   
                    var itemLen=$barcodeRuletr.eq(i).find('td').eq(4).find('input').val();
                    if(itemLen=='') return;
                    baritemS.ITEM_LEN=itemLen;
                    var fillStyle=$barcodeRuletr.eq(i).find('td').eq(5).find('select').val();
                    baritemS.FILL_STYLE=fillStyle;
                    var fillChar=$barcodeRuletr.eq(i).find('td').eq(6).find('input').val();
                    if(fillChar=='') return;
                    baritemS.FILL_CHAR=fillChar;
                 }
                
                 baritemS.ITEM_TYPE=itemTypeV;
                 baritemS.ITEM_VALUE=itemValue;
                 
                 barArr.push(baritemS);
            
             
           }
           //$("#barArr").val();
           var barArrS=JSON.stringify(barArr);
	        jQuery.ajax({
 			type: "POST",
 	   		dataType: "json",
 	   		//async:false,
 	    	url: templateurl+"&type=previewBarData",
 	    	data :{'barArr':barArrS},
 			success: function(data){
 			   if(data.ajaxString!=null&&data.ajaxString!=''){
 			     $("#previewBarData").html('<span>'+data.ajaxString+'</span>');
 				 $("#dataItem tbody tr" ).each(function(index,item){
 				   var uid=$(item).find('td:eq(12) ').text();
 				   if(uid==itemid) {
 				      $(item).find('td:eq(11) input').val(data.ajaxString);
 				      return false;
 				      }
                });
 			   }				
 				
 			},
 			error: function(XMLHttpRequest, textStatus, errorThrown){
 				util.closeLoading();
 				
 		   }
 		});
	    
	    }
	    
	    function querySourceItem(val){
			   $("#sourceItem").empty();
			   $("#sourceItem").append("<option value='''><dict:lang value="--请选择--"/></option>");
			  jQuery.ajax({
		 			type: "POST",
		 	   		dataType: "json",
		 	    	url: templateurl+"&type=querySourceItem&sourceLabel="+val,
		 			success: function(data){
		 				var pList=data.ajaxList; 				
		 				for(var i=0;i<pList.length;i++){ 				  
		 				   $("#sourceItem").append("<option value='"+pList[i].ID+"'>"+pList[i].DATA_ITEMS_NAME+"<option>");
		 				}
		 				$("#sourceItem").trigger("chosen:updated");
		 			},
		 			error: function(XMLHttpRequest, textStatus, errorThrown){
		 				util.closeLoading();
		 				
		 		   }
		 		});
			}

	    
	    function boxLabelChange(obj){
			   if (obj.checked) {
				   $("#sourceLabel").removeAttr("disabled");
			       $("#sourceLabel").trigger("chosen:updated");
				   $("#sourceItem").removeAttr("disabled");
				   $("#sourceItem").trigger("chosen:updated");
				   $("#boxLabelFlag").val('Y');
				
			   }
			   else{
				   var flag=true;
			       $("#first .tableBody table tr" ).each(function(index,item){
				        var text=$(item).find('td').eq(17).text(); 
				        if(text!=''&&text!=null) {
				        	flag= false;
				        }
				    });
				   if(!flag){
			    		utilsFp.confirmIcon(1, "", "", "",
								"<dict:lang value="请先删除对应的数据项" />", 0, "300", "");
			    		return false;
			       }
				   $("#boxLabelFlag").val('N');
				   $("#sourceLabel").attr("disabled","disabled");
				   $("#sourceLabel").trigger("chosen:updated");
				   $("#sourceItem").attr("disabled","disabled");
				   $("#sourceItem").trigger("chosen:updated");
			   }
			}
	    
	  
 
	    function addSourceItem() {
	    	if(!$('#box_label_checkbox').is(':checked')) {
	    		utilsFp.confirmIcon(1, "", "", "",
						"<dict:lang value="请选中外箱标签" />", 0, "260", "");
				return;
	    	}
			var sourceLabel = $("#sourceLabel").val();
			if (sourceLabel == '') {
				utilsFp.confirmIcon(1, "", "", "",
						"<dict:lang value="请选择来源标签" />", 0, "260", "");
				return;
			}
			var sourceItem = $("#sourceItem").val();
			if (sourceItem == '') {
				utilsFp.confirmIcon(1, "", "", "",
						"<dict:lang value="请选择来源数据项" />", 0, "260", "");
				return;
			}
			var flag=false;
			$("#first .tableBody table tr" ).each(function(index,item){
			        var text=$(item).find('td').eq(17).text(); 
			        if(text==sourceItem) {
			          utilsFp.confirmIcon(1, "", "", "",
								"<dict:lang value="已添加过该数据项" />", 0, "260", "");
			          flag=true;
			          return false;
			        }
			});
			if(flag){
				return false;
			}
			var labelName=$("#sourceLabel").find("option:selected").text();
			jQuery
					.ajax({
						type : "POST",
						dataType : "json",
						url : templateurl
								+ "&type=addSourceItem&sourceLabel="
								+ sourceLabel+"&sourceItem="+sourceItem,
						success : function(data) {
							$("#sourceLabel").attr("disabled","disabled");
							$("#sourceLabel").trigger("chosen:updated");
							var pList = data.ajaxList;
							var rowCount = $('#first .tableBody table tr').length ;
							var checkstr = "<div class='selectBox' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\">";
							var uncheckstr = "<div class='selectBox'></div><input type=\"checkbox\">";
							for ( var i = 0; i < pList.length; i++) {
								rowCount=rowCount+1;
								var uuid = util.getUUID();
								var str = "";
								str += "<tr>"
								str += "<td>" +rowCount + "</td>";
								str += "<td><div class='selectBox check'></div><input type=\"checkbox\"></td>";
								str += "<td class='itemName'><input type='text' readonly  value='("+labelName+")"
										+ pList[i].DATA_ITEMS_NAME + "'></td>";
								//添加新值
								addItemName("("+labelName+")"+pList[i].DATA_ITEMS_NAME);
								var v = pList[i].EMPTY_FLAG;
								if (v == 'Y') {
									str += "<td>" + checkstr + "</td>";
								} else {
									str += "<td>" + uncheckstr + "</td>";
								}
								v = pList[i].BARCODE_ITEM;
								if (v == 'Y') {	
									
								} else {
									str += "<td class='data_item'><div class='selectBox'></div><input type=\"checkbox\"  ></td>";
								}
								v = pList[i].ALLOW_EDIT;
								if (v == 'Y') {
									str += "<td>" + checkstr + "</td>";
								} else {
									str += "<td>" + uncheckstr + "</td>";
								}
								v = pList[i].ALLOW_DISPLAY;
								if (v == 'Y') {
									str += "<td style='display:none'>" + checkstr + "</td>";
								} else {
									str += "<td style='display:none'>" + uncheckstr + "</td>";
								}
								v = pList[i].MATCH_CODE;
								if (v == 'Y') {
									str += "<td><div class='selectBox' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\" ></td>";
								} else {
									str += "<td><div class='selectBox'></div><input type=\"checkbox\"></td>";
								}

								v = pList[i].LABEL_COUNT;
								if (v == 'Y') {
									str += "<td><div class='selectBox' style=\"background-image: url('${path }plf/page/mlabel/img/checked.png');\"></div><input type=\"checkbox\" checked=\"true\" ></td>";
								} else {
									str += "<td><div class='selectBox'></div><input type=\"checkbox\"></td>";
								}
								v = pList[i].PICTURE_FLAG;
								
								str += "<td><div class='selectBox showUpLoading'></div><input type=\"checkbox\" ></td>";

								str += "<td><div class='selectBox'></div><input type=\"checkbox\"></td>";
								
								str += "<td><input type=\"text\" readonly maxlength=\"100\" value='"+pList[i].TEST_DATA+"'></td>";
								

								str += "<td style='display:none'>" + uuid
										+ "</td>";
								str += "<td style='display:none'></td>";
							    str += "<td style='display:none'>" + nullToEmpty(pList[i].PICTURE_NAME_S)
										+ "</td>";
								str += "<td style='display:none'>" + nullToEmpty(pList[i].PICTURE_PATH)
										+ "</td>";
								str += "<td style='display:none'>" + pList[i].TEMPLATE_ID
										+ "</td>";
								str += "<td style='display:none'>" + pList[i].ID
										+ "</td>";
								str += "<td style='display:none'>" + nullToEmpty(pList[i].COLUMN_TYPE)
				                        + "</td>";
                                str += "<td style='display:none'>" + nullToEmpty(pList[i].COLUMN_DATA)
				                        + "</td>";
								
								str += "<td style='width:40px;'></td>";
 
				                str += "<td class='operation' style='width:110px;'><p><span style='margin: 0 1px;' onclick='toTop(this,1)'></span> " ;
				                str += "<span style='margin: 0 1px;' onclick='toPrev(this,1)'></span> " ;
				                str += "<span style='margin: 0 1px;' onclick='toNext(this,1)'></span> <span style='margin: 0 1px;' onclick='toBottom(this,1)'></span>";
												
				                str +="</p></td>";
				                str += "</tr>";
								$('#first .tableBody table').append(str);
							}
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							util.closeLoading();

						}
					});
		}
		
  function isLabelCount(obj){
    showHiddenSet(obj);
  }
  
  function showHiddenSet(obj){
    var isBar= $(obj).parents('tr').find('td').eq(4).find('input')[0].checked;
    var isLabelCount= $(obj).parents('tr').find('td').eq(8).find('input')[0].checked;
    var isPic= $(obj).parents('tr').find('td').eq(9).find('input')[0].checked;
    var isSub= $(obj).parents('tr').find('td').eq(10).find('input')[0].checked;
    if(isBar||isLabelCount||isPic||isSub){
       $(obj).parents('tr').find('td').eq(20).find("button")[0].style.display="none";
    }
    else{
      $(obj).parents('tr').find('td').eq(20).find("button")[0].style.display="";
    }
  }
  
  function hideDiv(showId,backId){
		$("#"+showId+",#"+backId).hide();
	}
	
  function showSetDiv(showId,backId,thisObj){
	
	var id=$(thisObj).parents('tr').find('td').eq(12).text();
    var columnType=$(thisObj).parents('tr').find('td').eq(18).text();
    var columnData=$(thisObj).parents('tr').find('td').eq(19).text();
	$("#thisItem").val(id);
    $("#columnType").val(columnType);
    $("#columnData").val(columnData);
    $("#"+showId+",#"+backId).show();
    $("#"+showId).draggable();
    $("#columnType").trigger("chosen:updated");
    $("#columnData").trigger("chosen:updated");
	$('.chosen-container').css("width","280px");
  }
  
  function editSet(showId,backId){
    var id=$("#thisItem").val();
    var columnType=$("#columnType").val();
    var columnData=$("#columnData").val();
  
    $("#dataItem tbody tr" ).each(function(index,item){
 			var uid=$(item).find('td:eq(12) ').text();
 			if(uid==id) {
 				$(item).find('td:eq(18)').text(columnType);
 				$(item).find('td:eq(19)').text(columnData);
 				return false;
 			}
       });
       hideDiv(showId,backId);
  }

    </script>

