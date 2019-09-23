<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="beforePageLoad" />
</jsp:include>

<head>
    <title>
        <dict:lang value="SPI统计图表" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
        <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
            <jsp:param name="popdivWinFp" value="1" />
            <jsp:param name="datePicker" value="1" />
            <jsp:param name="chosen" value="1" />
            <jsp:param name="msData" value="1" />
            <jsp:param name="scroll" value="1" />
            <jsp:param name="jqueryprint" value="1" />

        </jsp:include>
        <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
            <bu:header formId="6d990dd0eeed43cd81529c8a8198c350" />


            <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                <jsp:param name="modelName" value="VIEW_TYPE_17" />
                <jsp:param name="location" value="inHead" />
            </jsp:include>
            <!-- head里面 -->
            <!-- 产品静态资源 -->

            <style>
                body {
                    background-color: #fff;
                }

                .chart_panel {
                    height: 450px;
                    margin: 20px;
                }

                .chart_panel .failPieFunnel {
                    height: 430px;
                    width: 60%;
                    float: left;
                }

                .chart_panel .failGrid {
                    width: 40%;

                    height: 450px;
                    ;
                    float: left;
                }

                .chart_panel table {
                    line-height: 25px;
                    border-collapse: collapse;
                    padding: 2px;
                    margin-left: auto;
                    margin-right: auto;
                    margin-top: 30px;
                    font-size: 12px;
                    text-shadow: 0 .5px white;
                    font-family: Consolas, Monaco, 'Andale Mono', 'Ubuntu Mono', monospace;
                }

                .chart_panel .failGrid th {
                    background-color: #fbfbfb;
                    font-weight: bold;
                }

                .chart_panel .failGrid th,
                .chart_panel .failGrid td {
                    border: 1px solid #e8e8e8;
                    padding: 3px 13px;
                }

                .chart_panel .failGrid td .color_span {
                    display: inline-block;
                    width: 30px;
                    height: 15px;
                    border-radius: 3px;
                }

                .none {
                    display: none;
                }

                .charts_tips_panel {
                    width: 130px;
                    background-color: #f5f5f5;
                    border-radius: 5px;
                    padding: 13px;
                    font-size: 12px;
                    font-weight: bold;
                    text-shadow: 0 .5px white;
                    font-family: Consolas, Monaco, 'Andale Mono', 'Ubuntu Mono', monospace;
                    position: absolute;
                    float: right;
                    top: 50px;
                    right: 30px;
                    opacity: 0.8;
                }

                .charts_tips_panel .charts_tips_title {
                    display: block;
                    width: 70px;
                    float: left;
                    text-align: right;
                }

                .charts_tips_panel .charts_tips_content {
                    clear: both;
                }
                .nopaste{
                    display:none;
                }
            </style>

            <script type="text/javascript" src="${path}plf/page/timer/perforMonit/js/echarts.min.js"></script>
</head>

<body>
    <div class="content-in">

        <div class="js-tab">
            <div id="container">
                <div class="hd">
                    <ul class="tab-list tab">
                        <li id="tag1" class="current">
                            <a class="selectli1" onclick="switchTag(this,'areaInfo');this.blur();" href="javascript:void(0);">
                                <span class="selectspan1">面积</span>
                            </a>
                        </li>
                        <li id="tag2">
                            <a class="selectli1" onclick="switchTag(this,'heightInfo');this.blur();" href="javascript:void(0);">
                                <span class="selectspan1">高度</span>
                            </a>
                        </li>
                        <li id="tag3">
                            <a class="selectli1" onclick="switchTag(this,'volumeInfo');this.blur();" href="javascript:void(0);">
                                <span class="selectspan1">体积</span>
                            </a>
                        </li>
                        <li id="tag4" class="nopaste">
                            <a class="selectli1" onclick="switchTag(this,'nopasteInfo');this.blur();" href="javascript:void(0);">
                                <span class="selectspan1">无焊锡</span>
                            </a>
                        </li>
                        
                        <li id="tag5">
                            <a class="selectli1" onclick="switchTag(this,'sharp2dInfo');this.blur();" href="javascript:void(0);">
                                <span class="selectspan1">Sharp2D</span>
                            </a>
                        </li>
                        
                        <li id="tag6">
                            <a class="selectli1" onclick="switchTag(this,'sharp3dInfo');this.blur();" href="javascript:void(0);">
                                <span class="selectspan1">Sharp3D</span>
                            </a>
                        </li>
                        
                        <li id="tag7">
                            <a class="selectli1" onclick="switchTag(this,'offsetInfo');this.blur();" href="javascript:void(0);">
                                <span class="selectspan1">XY错位</span>
                            </a>
                        </li>
                        <li id="tag8">
                            <a class="selectli1" onclick="switchTag(this,'failRateInfo');this.blur();" href="javascript:void(0);">
                                <span class="selectspan1">项目不良率</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="content1" id="content">
                    <div id="areaInfo" class="chart_panel">
                    </div>
                    <div id="heightInfo" class="chart_panel">
                    </div>
                    <div id="volumeInfo" class="chart_panel">
                    </div>
                    <div id="sharp2dInfo" class="chart_panel">
                    </div>
                    <div id="sharp3dInfo" class="chart_panel">
                    </div>
                    <div id="nopasteInfo" class="chart_panel nopaste">
                    </div>
                    <div id="offsetInfo" class="chart_panel">
                    </div>
                    <div id="failRateInfo" class="chart_panel">
                        <div id="failPieFunnel" class="failPieFunnel"></div>
                        <div id="failGrid" class="failGrid">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <bu:submit viewId="14ee161060754fc2aa7d58f2eda0d12f" />
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="beforeJsLoad" />
    </jsp:include>
    <bu:script viewId="14ee161060754fc2aa7d58f2eda0d12f" />

    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
    </jsp:include>

    <script>
        var areaInfo;
        var heightInfo;
        var volumeInfo;
        var nopasteInfo;
        var offsetInfo;
		var failPieFunnel;
		var sharp2dInfo;
		var sharp3dInfo;
        $(function () {
            initCharts(); 
            if(getUrlParam('type')=='detail'){
                var dataUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=d69daec7373d439397e695234b20e149";//VM-SPI统计图表 操作功能 获取SPI详情统计信息
                var json = null;
                //util.showLoading();
                areaInfo.showLoading();
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: dataUrl,
                    data: {
                        mo_number: getUrlParam('mo_number'),
                        inspectat_begin: getUrlParam('inspectat_begin'),
                        inspectat_end: getUrlParam('inspectat_end'),
                        area_name: getUrlParam('area_name'),
                        program_name: getUrlParam('program_name'), 
                        result: getUrlParam('result')
                    },
                    success: function (data) {
                        query(data.ajaxList);
                        //util.closeLoading();
                        areaInfo.hideLoading();
                    }
    
                });
            }else{
                var dataUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=326dba24b2974a3e99be65ef4da4e517"; //VM-SPI统计图表 操作功能 获取SPI统计信息
                var json = null;
                //util.showLoading();
                areaInfo.showLoading();
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: dataUrl,
                    data: {
                        result_id: getUrlParam('dataId')
                    },
                    success: function (data) {
                        query(data.ajaxList);
                        //util.closeLoading();
                        areaInfo.hideLoading();
                    }
    
                });
        	}
        });
        //
        function query(d) {  
        //&& d.AREA_NGLOWERLIMIT!="undefined"
            if (d != '' && d.length > 0 &&d[0]["AREA_NG_NUM"]!=null) {
                setLineBarCharts(areaInfo, d, 'AREA');
                setLineBarCharts(heightInfo, d, 'HEIGHT');
                setLineBarCharts(volumeInfo, d, 'VOLUME');
                setLineBarCharts(sharp2dInfo, d, 'SHARP2D');
                setLineBarCharts(sharp3dInfo, d, 'SHARP3D');
                //setLineBarCharts(nopasteInfo, d, 'NOPASTE');
                setScatterCharts(offsetInfo, d);
                setPieFunnelCharts(failPieFunnel, d);
            }
        }
        //不良率南丁格尔图赋值
        function setPieFunnelCharts(charts, d) {
            var area_ng_num = d[0]["AREA_NG_NUM"];
            var area_total_num = d[0]["AREA_TOTAL_NUM"];
            var height_ng_num = d[0]["HEIGHT_NG_NUM"];
            var height_total_num = d[0]["HEIGHT_TOTAL_NUM"];
            var volume_ng_num = d[0]["VOLUME_NG_NUM"];
            var volume_total_num = d[0]["VOLUME_TOTAL_NUM"];
            var nopaste_ng_num = d[0]["NOPASTE_NG_NUM"];
            var nopaste_total_num = d[0]["NOPASTE_TOTAL_NUM"];
            var cross_ng_num = d[0]["CROSS_NG_NUM"];
            var cross_total_num = d[0]["CROSS_TOTAL_NUM"];
            var rise_ng_num = d[0]["RISE_NG_NUM"];
            var rise_total_num = d[0]["RISE_TOTAL_NUM"];
            var offsetx_ng_num = d[0]["OFFSETX_NG_NUM"];
            var offsetx_total_num = d[0]["OFFSETX_TOTAL_NUM"];
            var offsety_ng_num = d[0]["OFFSETY_NG_NUM"];
            var offsety_total_num = d[0]["OFFSETY_TOTAL_NUM"];
            
            var sharp2d_ng_num = d[0]["SHARP2D_NG_NUM"];
            var sharp2d_total_num = d[0]["SHARP2D_TOTAL_NUM"];
            var sharp3d_ng_num = d[0]["SHARP3D_NG_NUM"];
            var sharp3d_total_num = d[0]["SHARP3D_TOTAL_NUM"];
             
            
            var bridge = eval(d[0]['BRIDGE']);
            var bridge_total_num = bridge.length;
            var bridge_ng_num = bridge.filter(item => item == "NG").length;
            var total_ng_num = area_ng_num + height_ng_num + volume_ng_num + nopaste_ng_num + cross_ng_num + rise_ng_num + offsetx_ng_num + offsety_ng_num + bridge_ng_num
            +sharp2d_ng_num+sharp3d_ng_num;
            var series = [
                { name: '面积', value: area_ng_num, total_num: area_total_num, color: '#cc4125', total_ng_num: total_ng_num },
                { name: '平均高度', value: height_ng_num, total_num: height_total_num, color: '#e06666', total_ng_num: total_ng_num },
                { name: '体积', value: volume_ng_num, total_num: volume_total_num, color: '#c27ba0', total_ng_num: total_ng_num },
                { name: 'Sharp2D', value: sharp2d_ng_num, total_num: sharp2d_total_num, color: '#8e7cc3', total_ng_num: total_ng_num },
                { name: 'Sharp3D', value: sharp3d_ng_num, total_num: sharp3d_total_num, color: '#6fa8dc', total_ng_num: total_ng_num },
                /*{ name: '无焊锡', value: nopaste_ng_num, total_num: nopaste_total_num, color: '#8e7cc3', total_ng_num: total_ng_num },
                { name: '焊桥', value: bridge_ng_num, total_num: bridge_total_num, color: '#6fa8dc', total_ng_num: total_ng_num },
                { name: '掠过', value: cross_ng_num, total_num: cross_total_num, color: '#76a5af', total_ng_num: total_ng_num },
                { name: '突起', value: rise_ng_num, total_num: rise_total_num, color: '#93c47d', total_ng_num: total_ng_num },*/
                { name: '错位X', value: offsetx_ng_num, total_num: offsetx_total_num, color: '#ffd966', total_ng_num: total_ng_num },
                { name: '错位Y', value: offsety_ng_num, total_num: offsety_total_num, color: '#f9cb9c', total_ng_num: total_ng_num },
            ];
            $('#failGrid').html(new failRateTable()
                .init(series)
                .getHtml());
            charts.setOption({//加载数据图表
                color: series.map(item => item.color),
                legend: {
                    data: series.map(item => item.name)
                },
                series: [{
                    data: series
                }]
            });
        }
        //XY错位散点图赋值
        function setScatterCharts(charts, d) {
            var data = eval(d[0]['OFFSET_VALUE_JSON']);
            charts.setOption({
                series: [{
                    name: 'NG',
                    data: data.filter(item => item[2] == "NG").map(function (item) {
                        return [item[0], item[1]];
                    })
                }, {
                    name: 'OK',
                    data: data.filter(item => item[2] == "OK").map(function (item) {
                        return [item[0], item[1]];
                    })
                }, {
                    name: 'WARN',
                    data: data.filter(item => item[2] == "WN").map(function (item) {
                        return [item[0], item[1]];
                    })
                }]
            });
        }
        //正态分布图赋值
        function setLineBarCharts(charts, d, tag_name) {
            var is_nopaste = (tag_name == 'NOPASTE'||tag_name == 'SHARP2D'||tag_name == 'SHARP3D');
            var data = eval(d[0][tag_name + '_VALUE_JSON']);
            var max = data[data.length - 1][0];
            var min = data[0][0];
            var usl = is_nopaste ? d[0][tag_name + '_NGUPPERLIMIT'] : d[0][tag_name + '_NGUPPERLIMIT'];
            var lsl = is_nopaste ? 0 : d[0][tag_name + '_NGLOWERLIMIT'];
            var usl_wn = is_nopaste ? d[0][tag_name + '_WARNUPPERLIMIT'] : d[0][tag_name + '_WARNUPPERLIMIT'];
            var lsl_wn = is_nopaste ? 0 : d[0][tag_name + '_WARNLOWERLIMIT'];
            var avg = d[0][tag_name + '_AVG'];
            var sigma = d[0][tag_name + '_SIGMA'];
            var cp = d[0][tag_name + '_CP'];
            var cpk = d[0][tag_name + '_CPK'];
            var nowX = data[0][0];
            for (var i = 0; i <= (usl + (is_nopaste ? 2 : 30)) * 10; i++) {
                var x = (i / 10).toFixed(1);
                var y = getGaussianDistributionY(x, avg, sigma);
                if (nowX.toFixed(1) == x) {
                    data[i][2] = y;
                    nowX = data.length > i + 1 ? data[i + 1][0] : 0;
                } else {
                    data.splice(i, 0, [x, 0, y]);
                }
                //console.log((i/10).toFixed(1));
            }
            var xaxis = data.map(function (item) {
                return item[0];
            });
            var series1 = data.map(function (item) {
                return item[1];
            });
            var series2 = data.map(function (item) {
                return item[2];
            });
            // xaxis.push(usl);
            // xaxis.unshift(lsl);
            charts.setOption({//加载数据图表
                xAxis: {
                    data: xaxis
                },
                // dataZoom: [{
                //     start: 20,
                //     end: 200
                // }, {
                //     start: 20,
                //     end: 200,
                // }],
                series: [{
                    data: series1
                },
                {
                    data: series2,
                    markLine: {
                        silent: true,
                        data: [{
                            xAxis: avg.toFixed(1),
                            itemStyle: {
                                normal: { label: { formatter: '平均值{c}' } }
                            }
                        }, {
                            xAxis: usl.toFixed(1),
                            itemStyle: {
                                normal: { lineStyle: { color: '#c00' }, label: { formatter: 'NG上限{c}' } }
                            }
                        }, {
                            xAxis: lsl.toFixed(1),
                            itemStyle: {
                                normal: { lineStyle: { color: '#c00' }, label: { formatter: 'NG下限{c}' } }
                            }
						}
						/*, {
                            xAxis: usl_wn.toFixed(1),
                            itemStyle: {
                                normal: { lineStyle: { color: '#ffd966' }, label: { formatter: 'WARN上限{c}', position: 'middle' } }
                            }
                        }, {
                            xAxis: lsl_wn.toFixed(1),
                            itemStyle: {
                                normal: { lineStyle: { color: '#ffd966' }, label: { formatter: 'WARN下限{c}', position: 'middle' } }
                            }
						}*/
						]
                    },
                    lineStyle: {
                        normal: {
                            width: 1
                        }
                    }
                }
                ]
            });
            $(charts.getDom()).first('div').prepend(new lineChartsTips()
                .init(max.toFixed(2), avg.toFixed(2), min.toFixed(2), usl.toFixed(2), lsl.toFixed(2), sigma.toFixed(2), cp.toFixed(2), cpk.toFixed(2))
                .getHtml());
        }
        function listAjaxTable() { }
        //初始化图表
        function initCharts() {
            areaInfo = echarts.init(document.getElementById('areaInfo'));
            initLineBarCharts(areaInfo, '面积');
            heightInfo = echarts.init(document.getElementById('heightInfo'));
            initLineBarCharts(heightInfo, '高度');
            volumeInfo = echarts.init(document.getElementById('volumeInfo'));
            initLineBarCharts(volumeInfo, '体积');
            sharp2dInfo = echarts.init(document.getElementById('sharp2dInfo'));
            initLineBarCharts(sharp2dInfo, 'SHARP2D');
            sharp3dInfo = echarts.init(document.getElementById('sharp3dInfo'));
            initLineBarCharts(sharp3dInfo, 'SHARP3D');
            nopasteInfo = echarts.init(document.getElementById('nopasteInfo'));
            initLineBarCharts(nopasteInfo, '无焊锡');
            offsetInfo = echarts.init(document.getElementById('offsetInfo'));
            initScatterCharts(offsetInfo, 'XY错位');
            failPieFunnel = echarts.init(document.getElementById('failPieFunnel'));
            initPieFunnelCharts(failPieFunnel, '项目分类不良率');
        }
        //初始化散点图
        function initScatterCharts(charts, name) {
            charts.setOption({
                xAxis: { scale: true },
                yAxis: { scale: true },
                series: [{
                    symbolSize: 6,
                    data: [
                    ],
                    type: 'scatter',
                    // itemStyle: {
                    //     normal: {
                    //         color: '#6aa84f'
                    //     }
                    // }
                },
                {
                    symbolSize: 6,
                    data: [
                    ],
                    type: 'scatter',
                    itemStyle: {
                        normal: {
                            color: '#22cc20'
                        }
                    }
                },
                {
                    symbolSize: 6,
                    data: [
                    ],
                    type: 'scatter',
                    itemStyle: {
                        normal: {
                            color: '#ffe599'
                        }
                    }
                }],
                title: {
                    text: name + '散点图'
                },
                legend: {
                    data: ['NG', 'OK', 'WARN']
                },
                tooltip: {
                    axisPointer: {
                        type: 'cross'
                    }
                }
            });
        }
        //初始化南丁格尔图
        function initPieFunnelCharts(charts, name) {
            charts.setOption({
                title: {
                    text: name,
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    x: 'center',
                    y: 'bottom',
                    data: []
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: { show: true },
                        dataView: { show: true, readOnly: false },
                        magicType: {
                            show: true,
                            type: ['pie', 'funnel']
                        },
                        restore: { show: true },
                        saveAsImage: { show: true }
                    }
                },
                calculable: true,
                series: [
                    {
                        name: '不良项目比率',
                        type: 'pie',
                        radius: [20, 110],
                        center: ['50%', '50%'],
                        roseType: 'radius',
                        label: {
                            normal: {
                                show: true
                            },
                            emphasis: {
                                show: false
                            }
                        },
                        lableLine: {
                            normal: {
                                show: false
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        data: [
                        ]
                    }
                ]
            });
        }
        //初始化正态分布图
        function initLineBarCharts(charts, name) {
            charts.setOption({
                title: {
                    text: '正态分布图'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: [name, '正态分布曲线'],
                    x: 'right'
                },
                toolbox: {
                    feature: {
                        //saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: []
                },
                yAxis: [{
                    type: 'value',
                    splitLine: false
                },
                {
                    type: 'value',
                    splitLine: false,
                    show: false
                }
                ],
                dataZoom: [{
                    type: 'inside',
                    start: 0,
                    end: 150
                }, {
                    start: 0,
                    end: 150,
                    handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                    handleSize: '80%',
                    handleStyle: {
                        color: '#fff',
                        shadowBlur: 3,
                        shadowColor: 'rgba(0, 0, 0, 0.6)',
                        shadowOffsetX: 2,
                        shadowOffsetY: 2
                    }
                }],
                series: [
                    {
                        name: name,
                        type: 'bar',
                        data: [],
                        itemStyle: {
                            normal: {
                                color: '#4a86e8'
                            }
                        }
                    },
                    {
                        name: "正态分布曲线",
                        type: 'line',
                        smooth: true,
                        yAxisIndex: 1,
                        data: [],
                        itemStyle: {
                            normal: {
                                color: '#51b227'
                            }
                        }
                    }
                ]
            });
        }
        //正态分布图 统计信息提示框
        function lineChartsTips() {
            var _This = this;
            var max, avg, min, usl, lsl, sigma, cp, cpk;
            this.init = function (_max, _avg, _min, _usl, _lsl, _sigma, _cp, _cpk) {
                max = _max;
                avg = _avg
                min = _min
                usl = _usl;
                lsl = _lsl;
                sigma = _sigma;
                cp = _cp;
                cpk = _cpk;
                return _This;
            }
            this.getHtml = function () {
                return initHtml();
            }
            function initHtml() {
                var html = '<div class="charts_tips_panel">';
                html += '<ul>';
                html += '    <li>';
                html += '        <span class="charts_tips_title">最大值：</span>';
                html += '        <span class="charts_tips_content">' + max + '</span>';
                html += '    </li>';
                html += '    <li>';
                html += '        <span class="charts_tips_title">平均值：</span>';
                html += '        <span class="charts_tips_content">' + avg + '</span>';
                html += '    </li>';
                html += '    <li>';
                html += '        <span class="charts_tips_title">最小值：</span>';
                html += '        <span class="charts_tips_content">' + min + '</span>';
                html += '    </li>';
                html += '    <li>';
                html += '        <span class="charts_tips_title">规格上限：</span>';
                html += '        <span class="charts_tips_content">' + usl + '</span>';
                html += '    </li>';
                html += '    <li>';
                html += '        <span class="charts_tips_title">规格下限：</span>';
                html += '        <span class="charts_tips_content">' + lsl + '</span>';
                html += '    </li>';
                html += '    <li>';
                html += '        <span class="charts_tips_title">Sigma：</span>';
                html += '        <span class="charts_tips_content">' + sigma + '</span>';
                html += '    </li>';
                html += '    <li>';
                html += '        <span class="charts_tips_title">Cp：</span>';
                html += '        <span class="charts_tips_content">' + cp + '</span>';
                html += '    </li>';
                html += '    <li>';
                html += '        <span class="charts_tips_title">Cpk：</span>';
                html += '        <span class="charts_tips_content">' + cpk + '</span>';
                html += '    </li>';
                html += '</ul>';
                html += '</div>';
                return html;
            }

        }
        function failRateTable() {
            var data;
            var _This = this;
            this.init = function (_data) {
                data = _data;
                return _This;
            }
            this.getHtml = function () {
                return initHtml();
            }
            function initHtml() {
                var html = '';
                html += '<table>';
                html += '    <thead><th></th><th>检查项目</th><th>不良数</th><th>不良率</th><th>比率</th></thead>';
                //console.log(data);
                $.each(data, function (i, item) {
                    html += '<tbody>';
                    html += '<td><span class="color_span" style="background-color:' + item.color + '"></span></td>';
                    html += '<td>' + item.name + '</td>';
                    html += '<td>' + item.value + '</td>';
                    html += '<td>' + (item.value * 100 / item.total_num).toFixed(2) + '%</td>';
                    if (item.total_ng_num == 0) {
                        html += '<td></td>';
                    } else {
                        html += '<td>' + (item.value * 100 / item.total_ng_num).toFixed(2) + '%</td>';
                    }
                    html += '</tbody>';
                });
                html += '</table>';
                return html;
            }
        }
        //切换tab
        function switchTag(obj, name) {
            if ($(obj).parent().hasClass('current')) {
                return;
            }
            $('li.current').removeClass('current');
            $(obj).parent().addClass('current');
            $('.chart_panel').hide();
            $('#' + name).show();
        }

        //计算正态分布Y值
        var inverseSqrt2PI = 1 / Math.sqrt(2 * Math.PI);
        function getGaussianDistributionY(x, avg, sigma) {
            var powOfE = -(Math.pow(Math.abs(x - avg), 2) / (2 * Math.pow(sigma, 2)));

            var result = (inverseSqrt2PI / sigma) * Math.pow(Math.E, powOfE);

            return result;
        }
        //获取地址参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg); //匹配目标参数
            if (r != null) return unescape(r[2]);
            return null; //返回参数值
        }
    </script>
    <script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
    <%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
    <!-- 页面结束 -->
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="pageOver" />
    </jsp:include>