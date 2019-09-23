function showPieChart() {
	var myChart = echarts.init(document.getElementById('pieChart'));
	option = {
		tooltip : {
			trigger : 'item',
			formatter : "{a} <br/>{b}: {c} ({d}%)"
		},
		legend : {
			orient : 'vertical',
			x : 'left',
			textStyle : {
				color : '#ffffff'
			},
			data : [ '一级告警', '二级告警', '三级告警', '四级告警' ]
		},
		grid : {
			x : 0,
			y : 0
		},
		series : [ {
			name : '告警级别',
			type : 'pie',
			radius : [ '50%', '70%' ],
			avoidLabelOverlap : false,
			label : {
				normal : {
					show : false,
					position : 'center'
				},
				emphasis : {
					show : true,
					textStyle : {
						fontSize : '30',
						fontWeight : 'bold'
					}
				}
			},
			labelLine : {
				normal : {
					show : false
				}
			},
			data : [ {
				value : 335,
				name : '一级告警'
			}, {
				value : 310,
				name : '二级告警'
			}, {
				value : 234,
				name : '三级告警'
			}, {
				value : 135,
				name : '四级告警'
			} ]
		} ]
	};
	myChart.setOption(option);

}
function showGauge() {
	var myChart = echarts.init(document.getElementById('gauge'));
	option = {
		title : {
			text : '货架空闲数',
			textStyle : {
				fontSize : 15,
				fontWeight : 'bolder',
				color : '#ffffff' // 主标题文字颜色
			}
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '告警数目' ]
		},
		calculable : true,
		xAxis : [ {
			axisLabel : { // 坐标轴文本标签，详见axis.axisLabel
				show : true,
				textStyle : {
					color : '#ffffff'
				}
			},
			type : 'category',
			data : [ '第一排', '第二排', '第三排', '第四排', '第五排' ],
			textStyle : {
				color : '#fff'
			}
		} ],
		yAxis : [ {
			axisLabel : { // 坐标轴文本标签，详见axis.axisLabel
				show : true,
				textStyle : {
					color : '#ffffff'
				}
			},
			type : 'value'
		} ],
		series : [ {
			name : '空余数',
			type : 'bar',
			itemStyle : {
				normal : {
					color : '#0f7bb7'
				}
			},
			data : [ 12, 4, 7, 23, 16 ],
			markPoint : {
				data : [ {
					type : 'max',
					name : '最大值'
				}, {
					type : 'min',
					name : '最小值'
				} ]
			},

		}, ]
	};

	myChart.setOption(option);

}
