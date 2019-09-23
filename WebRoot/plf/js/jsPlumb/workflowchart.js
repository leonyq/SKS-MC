var ifEdited = false;//是否可编辑
var spec ;//颜色选择器
		//获取模块信息
		function getBlocks(){
			var blocks = [];
			$("#right .icon").each(function (idx, elem) {
				var $elem = $(elem);
				blocks.push({
					BlockId: $elem.attr('id'),
					BlockContent: $elem.html(),
					BlockX: parseInt($elem.css("left"), 10),
					BlockY: parseInt($elem.css("top"), 10)
				});
			});
			return JSON.stringify(blocks);
		}
		
		//获取连接信息
		function getConn(){
			var connects = [];
			$.each(jsPlumb.getAllConnections(), function (idx, connection) {
				var cont = connection.getLabel();
				connects.push({
					ConnectionId: connection.id,
					PageSourceId: connection.sourceId,
					PageTargetId: connection.targetId,
					SourceText: connection.source.innerText,
					TargetText: connection.target.innerText,
					SourceAnchor: connection.endpoints[0].anchor.type,
					TargetAnchor: connection.endpoints[1].anchor.type,
					StrokeStyle:connection._jsPlumb.paintStyle.strokeStyle,
					LineWidth: connection._jsPlumb.paintStyle.lineWidth,
					ConnectText: $(cont).html()			
				});
			});
			return JSON.stringify(connects);
		}

		//图标模块双击
		function iconDoubleclick(id) {
			$(id).dblclick(function () {
				var tempId = id.replace("#","");
				
				var text = $(this).text();
				var img = $(this).find("img").get(0);
				var spanClass = $(id+" div p").prop("class");
				$(this).html("");
				$(this).append(img).append("<p><input type='text' id='"+tempId+"_block' title='"+$("#iconFontSize").val()+"' size=8 value=''/></p>");//+"<input type='text' value=''/>"

				$("#"+tempId+"_block").val(text);
				$("#"+tempId+"_block").focus();
				//光标位置
				if(util.isIE()){
					var textRange = $("#"+tempId+"_block")[0].createTextRange();
					textRange.collapse(false);
					textRange.select();
				}				
				$("#"+tempId+"_block").blur(function () {
					var val = $("#"+tempId+"_block").val();
					if(val != undefined){
						val = "<p class="+spanClass+">"+val+"</p>";
						$(id).html("");
						$(id).prop("title",""+$(val).text()+"");
						$(id).append("<div class=\"icon_font\"></div>").find("div").append(img).append(val);
					}
					showCon();
				});
				
				//$(this).unbind("mouseleave");
			});
		}
		
		//图标单击
		function blockClick(id){
			$("#icon_box").show();
			$("#icon_name").text($("#"+id).text());
			$("#paraMap_icon_id").val(id);
			if($("#color_box").is(":visible")){
				$("#color_box").hide();
			}
			
			$("#name_direction").val($("#"+id+" div img").prop("class"));
		}
		
		//字双击
		function doubleclickText(id) {
			$(id).dblclick(function () {
				var tempId = id.replace("#","");
				var text = $(this).text();
				var $html = $(this).html();
				$(this).html("");
				$(this).append("<textarea id='"+tempId+"_text' rows=3 col=10></textarea>");
				$("#"+tempId+"_text").val(text);
				$("#"+tempId+"_text").focus();
				$("#"+tempId+"_text").blur(function () {
					if($("#"+tempId+"_text").val() == undefined || ($.trim($("#"+tempId+"_text").val()) != "" && $("#"+tempId+"_text").val()!=null)){
						$(id).html($("#"+tempId+"_text").val());
					}else{
						$(id).html($html);
					}
				});
			});
		}
		
			
			//基本连接线样式
			var connectorPaintStyle = {
				lineWidth: 2,
				//strokeStyle: "#61B7CF",
				strokeStyle: "#125CCB",
				joinstyle: "round",
				outlineColor: "white",
				outlineWidth: 2
			};
			// 鼠标悬浮在连接线上的样式
			var connectorHoverStyle = {
				lineWidth: 2,
				strokeStyle: "#216477",
				outlineWidth: 2,
				outlineColor: "white"
			};
		/*	var endpointHoverStyle = {
				fillStyle: "#216477",
				strokeStyle: "#216477"
			};*/
			//空心圆端点样式设置
			var hollowCircle = {
				endpoint: ["Dot", { radius: 8 }],  //端点的形状
				connectorStyle: connectorPaintStyle,//连接线的颜色，大小样式
				connectorHoverStyle: connectorHoverStyle,
				paintStyle: {
					//strokeStyle: "#216477",
					strokeStyle: "#125CCB",
					fillStyle: "transparent",
					radius: 3,//圆大小
					lineWidth: 2
				},		//端点的颜色样式
				//anchor: "AutoDefault",
				isSource: true,	//是否可以拖动（作为连线起点）
				connector: ["Flowchart", { stub: [0, 0], gap: 10, cornerRadius: 5, alwaysRespectStubs: true }],  //连接线的样式种类有[Bezier],[Flowchart],[StateMachine ],[Straight ]
				isTarget: true,	//是否可以放置（连线终点）
				maxConnections: -1,	// 设置连接点最多可以连接几条线
				connectorOverlays: [["Arrow", { width: 10, length: 10, location: 1 }]]
			};
			//实心圆样式
			var solidCircle = {
				endpoint: ["Dot", { radius: 8 }],  //端点的形状
				paintStyle: { fillStyle: "rgb(122, 176, 44)" },	//端点的颜色样式
				connectorStyle: { strokeStyle: "rgb(97, 183, 207)", lineWidth: 4 },	  //连接线的颜色，大小样式
				isSource: true,	//是否可以拖动（作为连线起点）
				connector: ["Flowchart", { stub: [40, 60], gap: 10, cornerRadius: 5, alwaysRespectStubs: true }], //连接线的样式种类有[Bezier],[Flowchart],[StateMachine ],[Straight ]
				isTarget: true,		//是否可以放置（连线终点）
				//anchor: "AutoDefault",
				maxConnections: 3,	// 设置连接点最多可以连接几条线
				connectorOverlays: [["Arrow", { width: 10, length: 10, location: 1 }]]
			};
			
	
		//显示连接线
		function connLine(obj){
			//setTimeout(function () {
				$.each(obj, function( a, elem ) {
					var conn = jsPlumb.connect({
						  source: elem.PageSourceId,
						  target: elem.PageTargetId,
						  id:elem.ConnectionId,
						 // paintStyle:{strokeStyle: "#61B7CF",lineWidth: 2,endpoint:hollowCircle},
						  anchors:[elem.SourceAnchor,elem.TargetAnchor],
						  endpointStyle:hollowCircle,
						  isSource: true,	//是否可以拖动（作为连线起点）
						  connector: ["Flowchart", { stub: [0, 0], gap: 10, cornerRadius: 5, alwaysRespectStubs: true }],  //连接线的样式种类有[Bezier],[Flowchart],[StateMachine ],[Straight ]
						  isTarget: true,	//是否可以放置（连线终点）
						  overlays: [["Arrow", { width: 10, length: 10, location: 1 }]],						  
						  maxConnections: -1/*,	// 设置连接点最多可以连接几条线
						  overlays: [
		                   ["label", { location: 1,label:"<span style='display:block;padding:10px;opacity: 0.5;height:auto;background-color:white;border:1px solid #346789;text-align:center;font-size:12px;color:black;border-radius:0.5em;'>" + elem.ConnectText + "</span>", width: 10, length: 12}]
		                        ]*/
						});
						if(elem.StrokeStyle != null && elem.StrokeStyle != "" 
							&& elem.LineWidth !=null && elem.LineWidth != ""){
							conn.setPaintStyle({strokeStyle:elem.StrokeStyle,lineWidth:elem.LineWidth});
						}
						if(elem.ConnectText != "" && elem.ConnectText != null){
							conn.setLabel("<span style='display:block;padding:10px;opacity: 0.5;height:auto;background-color:white;border:1px solid #346789;text-align:center;font-size:12px;color:black;border-radius:0.5em;'>" + elem.ConnectText + "</span>");
						//$("#"+elem.ConnectionId).html(elem.ConnectText);
						}
				});
			//}, 300);

		}	
		

	$(function () {
		$("#left,#right").bind("click",function(e){
			if($("#color_box").is(":visible")){
				var lineColorIsFocus = $("#paraMap_line_color").is(":focus"); 
				var lineWidthIsFocus = $("#paraMap_line_width").is(":focus"); 
				var lineId = $("#paraMap_line_id").val();
				if(!lineColorIsFocus && !lineWidthIsFocus){
					//connObj._jsPlumb.paintStyle.strokeStyle = $("#paraMap_line_color").val();
					//connObj._jsPlumb.paintStyle.lineWidth = $("#paraMap_line_width").val();
					$("#color_box").hide();
				}
			}
/*			
			if($("#icon_box").is(":visible")){
				//$("#icon_box").hide();
			}
			*/
		});
		
		 $("#paraMap_line_width").blur(function(){
				var type="^[0-9]*[1-9][0-9]*$";
		        var re = new RegExp(type);
				if(this.value.match(re)==null){
					util.alert($("#colorPickerLineWidthMsg").val());
					$(this).val(1);
		        	$(this).focus();
		        	return false;
		        }
				
				$.each(jsPlumb.getAllConnections(), function (idx, connection) {
					if(connection.id == $("#paraMap_line_id").val()){
						connection.setPaintStyle({strokeStyle:$("#paraMap_line_color").val(),lineWidth:$("#paraMap_line_width").val()});
						return true;
					}
				});					
		 });

		/*$(document).bind("contextmenu",function(){
			alert("right click!");
		});*/
			$("#left").children().draggable({
				helper: "clone",
				scope: "ss"
			});
			
			$("#right").droppable({
				scope: "ss",
				drop: function (event, ui) {
					var left = parseInt(ui.offset.left - $(this).offset().left);
					var top = parseInt(ui.offset.top - $(this).offset().top);
					var name = ui.draggable[0].id;
					var id = util.getUUID();
					if(name == "textA"){
						id = "textA_" + id;
						$(this).append('<div class="icon fontCls"  id="' + id + '" >' + $(ui.helper).html() + '</div>');
						$("#" + id).css("left", left).css("top", top);
						jsPlumb.draggable(id);
						$("#" + id).draggable({ containment: "parent" });
						doubleclickText("#" + id);
					}else {
						id = name+"_" + id;
						$(this).append('<div class="icon"  id="' + id + '" >' + $(ui.helper).html() + '</div>');
						$("#" + id).css("left", left).css("top", top);
							jsPlumb.addEndpoint(id, { anchors: "TopCenter" }, hollowCircle);
							jsPlumb.addEndpoint(id, { anchors: "RightMiddle" }, hollowCircle);
							jsPlumb.addEndpoint(id, { anchors: "BottomCenter" }, hollowCircle);
							jsPlumb.addEndpoint(id, { anchors: "LeftMiddle" }, hollowCircle);								

						jsPlumb.draggable(id);
						$("#" + id).draggable({ containment: "parent" });
						iconDoubleclick("#" + id);
						
						$("#"+id).click(function(e){
							//阻止冒泡
							//e.stopPropagation();
							//blockClick(id);
						});
												
					}
					
				}
			});
			
		//view if begin	
		if(paraMapModel != "view"){
			
				$("#right").on("mouseenter", ".icon", function () {
					if(this.id.indexOf("text") == -1){
						if($(this).find("img").length < 2){
								$(this).append('<img class="del_img" src="../plf/js/jsPlumb/images/close2.png"  style="position: absolute;top:-10px;left:70px;" />');
						}else{
							$($(this).find("img").get(1)).show();
						}
					}else{
						if($(this).find("img").get(0) == undefined){
							$(this).append('<img class="del_img" src="../plf/js/jsPlumb/images/close2.png"  style="position: absolute;top:-10px;left:30px;" />');
						}else{
							$($(this).find("img").get(0)).show();
						}
					}				
				});			
							
				$("#right").on("mouseleave", ".icon", function () {
					//$("img").remove();
					if(this.id.indexOf("text") == -1){
						if($(this).find("img").length == 2){
							$($(this).find("img").get(1)).hide();
						}/*else{
							$($(this).find("img").get(1)).hide();
						}*/
					}else{
						$($(this).find("img").get(0)).hide();
					}					
					//$($(this).find("img").get(0)).hide();
				});			
	
				$("#right").on("click", ".del_img", function (obj) {
					if (confirm("确定要删除吗?")) {
						jsPlumb.removeAllEndpoints($(this).parent().attr("id"));
						$(this).parent().remove();
	
					}
				});
				/*jsPlumb.bind("connection", function (connInfo, originalEvent) {
					connInfo.connection.setLabel("ss");
				});*/
				var _time = null;
				jsPlumb.bind("dblclick", function (conn, originalEvent) {
					clearTimeout(_time);
					var str = conn.getLabel();
					if (str == null) {
						conn.setLabel("<input type='text' id='"+conn.id+"_line' value=' ' />");
					} else {
						conn.setLabel("<input type='text' id='"+conn.id+"_line' value='" + $(str).text() + "' />");
						$("#"+conn.id+"_line").val($(str).text());
					}
					$("#"+conn.id+"_line").focus();
					//光标位置
					if(util.isIE()){
						var textRange = $("#"+conn.id+"_line")[0].createTextRange();
						textRange.collapse(false);
						textRange.select();
					}
					$("#"+conn.id+"_line").blur(function () {
						if ($.trim($(this).val()) == "") {
							conn.setLabel("");
						} else {
							conn.setLabel("<span style='display:block;padding:10px;opacity: 0.5;height:auto;background-color:white;border:1px solid #346789;text-align:center;font-size:12px;color:black;border-radius:0.5em;'>" + $(this).val() + "</span>");
						}
					});
				});
	
				jsPlumb.bind("connection", function (connInfo, originalEvent) {
				//console.log(connInfo.connection);	
	            if (connInfo.connection.sourceId == connInfo.connection.targetId) {
	            	util.alert("不能连接自己！");
	                jsPlumb.detach(connInfo);
	                //showCon();
	            }else{      
	              // console.log("连接"+connInfo.connection.sourceId+"==="+connInfo.connection.targetId);      
	            }
				
				//判断重复连接
				/*$.each(jsPlumb.getEndpoints(connInfo.source), function(i, el) {
				  if (connInfo.connection != el.connections[0] &&
					(el.connections[0].targetId == connInfo.targetId || (el.connections[0].sourceId == connInfo.targetId && el.connections[0].targetId == connInfo.sourceId))) {
					jsPlumb.detach(connInfo);
					alert("不能重复连接！");
					return false;
				  }
				  });*/
				
				});
	
				
				//右键 删除连接线
				jsPlumb.bind("contextmenu", function (conn, originalEvent) {
					//originalEvent.stopPropagation();
					clearTimeout(_time);
					//_time = setTimeout(function () {
						if (confirm("确定删除该连接线吗？")){
							jsPlumb.detach(conn);
						}
						//阻止默认浏览器的方法
						originalEvent.preventDefault();
					//}, 300);
					
				});
				
				//连接线 单击
				jsPlumb.bind("click", function (conn, originalEvent) {
					//conn._jsPlumb.paintStyle.strokeStyle = "#000000";
					//console.log(jsPlumb(conn.id));
					bindColor(conn._jsPlumb.paintStyle.strokeStyle);
					$("#color_box").show();
					if($(conn.getLabel()).text() != null && $(conn.getLabel()).text() != ""){
						$("#line_name").html("["+$(conn.getLabel()).text()+"]");
					}
					$("#paraMap_line_color").val(conn._jsPlumb.paintStyle.strokeStyle);
					$("#paraMap_line_width").val(conn._jsPlumb.paintStyle.lineWidth);
					$("#paraMap_line_id").val(conn.id);
					$("#paraMap_line_color").focus();
					
					if($("#icon_box").is(":visible")){
						$("#icon_box").hide();
					}
					
				});			
	
				
				spec = $("#paraMap_line_color").spectrum({
					   // color: "#ECC",
					    showInput: true,
					    className: "full-spectrum",
					    showInitial: true,
					    showPaletteOnly: true,
					    showSelectionPalette: true,
					    maxSelectionSize: 10,
					    preferredFormat: "hex",
					    cancelText:$("#colorPickerCancle").val(),
					    chooseText:$("#colorPickerChoose").val(),
					    togglePaletteOnly:true,
					    togglePaletteMoreText:$("#togglePaletteMoreText").val(),
					    togglePaletteLessText:$("#togglePaletteLessText").val(),					    
					    localStorageKey:false,
					   // localStorageKey: "spectrum.demo",
					    move: function (color) {
					        
					    },
					    show: function () {
					    
					    },
					    beforeShow: function () {
					    
					    },
					    hide: function () {
							$.each(jsPlumb.getAllConnections(), function (idx, connection) {
								if(connection.id == $("#paraMap_line_id").val()){
									connection.setPaintStyle({strokeStyle:$("#paraMap_line_color").val(),lineWidth:$("#paraMap_line_width").val()});
									return true;
								}
							});	
					    },
					    change: function() {
	
					    },
					    palette: [
					        ["rgb(0, 0, 0)", "rgb(67, 67, 67)", "rgb(102, 102, 102)",
					        "rgb(204, 204, 204)", "rgb(217, 217, 217)","rgb(255, 255, 255)"],
					        ["rgb(152, 0, 0)", "rgb(255, 0, 0)", "rgb(255, 153, 0)", "rgb(255, 255, 0)", "rgb(0, 255, 0)",
					        "rgb(0, 255, 255)", "rgb(74, 134, 232)", "rgb(0, 0, 255)", "rgb(153, 0, 255)", "rgb(255, 0, 255)"], 
					        ["rgb(230, 184, 175)", "rgb(244, 204, 204)", "rgb(252, 229, 205)", "rgb(255, 242, 204)", "rgb(217, 234, 211)", 
					        "rgb(208, 224, 227)", "rgb(201, 218, 248)", "rgb(207, 226, 243)", "rgb(217, 210, 233)", "rgb(234, 209, 220)", 
					        "rgb(221, 126, 107)", "rgb(234, 153, 153)", "rgb(249, 203, 156)", "rgb(255, 229, 153)", "rgb(182, 215, 168)", 
					        "rgb(162, 196, 201)", "rgb(164, 194, 244)", "rgb(159, 197, 232)", "rgb(180, 167, 214)", "rgb(213, 166, 189)", 
					        "rgb(204, 65, 37)", "rgb(224, 102, 102)", "rgb(246, 178, 107)", "rgb(255, 217, 102)", "rgb(147, 196, 125)", 
					        "rgb(118, 165, 175)", "rgb(109, 158, 235)", "rgb(111, 168, 220)", "rgb(142, 124, 195)", "rgb(194, 123, 160)",
					        "rgb(166, 28, 0)", "rgb(204, 0, 0)", "rgb(230, 145, 56)", "rgb(241, 194, 50)", "rgb(106, 168, 79)",
					        "rgb(69, 129, 142)", "rgb(60, 120, 216)", "rgb(61, 133, 198)", "rgb(103, 78, 167)", "rgb(166, 77, 121)",
					        "rgb(91, 15, 0)", "rgb(102, 0, 0)", "rgb(120, 63, 4)", "rgb(127, 96, 0)", "rgb(39, 78, 19)", 
					        "rgb(12, 52, 61)", "rgb(28, 69, 135)", "rgb(7, 55, 99)", "rgb(32, 18, 77)", "rgb(76, 17, 48)"]
					    ]
					});		
			
			}
			//view if end
		
		
			$("#name_direction").change(function(){
				var blockId = $("#paraMap_icon_id").val();
				$("#"+blockId+" div img").removeClass().addClass(this.value);
				$("#"+blockId+" div span").removeClass().addClass(this.value+"_span");
				//showCon();
			});
		
		});
	
	//初始化
	function initJsPlumb(){
		jsPlumb.ready(function() {
		    jsPlumb.importDefaults({  
		    connectorHoverStyle: connectorHoverStyle,
	        DragOptions : { cursor: 'pointer', zIndex:2000 },  
	      
	        Endpoints : [ [ "Dot", { radius:2 } ], [ "Dot", { radius: 2 } ]] ,
	       
	        PaintStyle:{strokeStyle: "#125CCB",lineWidth: 2},
			
			ConnectionOverlays : [  
	            [ "Arrow", { location:1,width: 12, length: 10 } ] 
	        ] 
			//ConnectorOverlays: [["Arrow", { width: 10, length: 10, location: 1 }]]
	    });  	if(blockIcon != null && blockIcon != ""){
	    			showBlock(blockIcon);
	    		}
			    
			    if(blackConn != null && blackConn != ""){
			    	connLine(blackConn);
			    }
				
	
		});
	}
	
	//initJumb();
	
	function showBlock(blockIcon){
		$.each(blockIcon, function( h, elem ) {
			var  fontCls = "";
			if(elem.BlockId.indexOf("textA") != -1){
				 fontCls = " fontCls";
			}
			$("#right").append('<div class="icon '+fontCls+'"  id="' + elem.BlockId + '" title="'+$(elem.BlockContent).text()+'">' +  elem.BlockContent + '</div>');
			$("#" + elem.BlockId ).css("left", elem.BlockX ).css("top", elem.BlockY);
			jsPlumb.draggable(elem.BlockId );
			$("#" + elem.BlockId ).draggable({ containment: "parent" });
			if(paraMapModel != "view"){
				if(elem.BlockId.indexOf("text") != -1){
					doubleclickText("#" + elem.BlockId);
				}else{
					iconDoubleclick("#" + elem.BlockId);
					$("#"+elem.BlockId).click(function(e){
						//阻止冒泡
						//e.stopPropagation();
						//blockClick(elem.BlockId);
					});					
				}
			}
			
		});

	}	
	
	//绑定颜色选择器
	function bindColor(paraColor){
		//$("#paraMap_line_color").spectrum("set",paraColor);
		//spec.color = paraColor;
		spec.spectrum("set",paraColor);
		spec.show();
	}
		
		function reset(){
		jsPlumb.reset();
		//jsPlumb.removeAllEndpoints(".icon");
			$("#right").html("");
		}
		
		//隐藏，显示连接
		function hideCon(){
			var conns = getConn();
			jsPlumb.deleteEveryEndpoint();
			if(conns != null && conns !=""){
				connLine(JSON.parse(conns));
			}
			//$("#edit_mode").show();
			//$("#finish_edit").hide();	
			ifEdited = false;
		}

		function showCon(){
			var conns = getConn();
			jsPlumb.deleteEveryEndpoint();
			$('#right .icon').each(function(index,elem){
				//var endpoints = jsPlumb.getEndpoints(elem);
				//jsPlumb.show(elem.id, true);
				if(elem.id.indexOf("text") != -1){
					return true;
				}
					jsPlumb.addEndpoint(elem.id,  {anchors: "TopCenter"},hollowCircle);
					jsPlumb.addEndpoint(elem.id , { anchors: "RightMiddle" }, hollowCircle);
					jsPlumb.addEndpoint(elem.id , { anchors: "BottomCenter" }, hollowCircle);
					jsPlumb.addEndpoint(elem.id , { anchors: "LeftMiddle" }, hollowCircle);	

			});
					if(conns != null && conns !=""){
						connLine(JSON.parse(conns));
					}
			//$("#edit_mode").hide();
			//$("#finish_edit").show();	
			ifEdited = true;
		}
		