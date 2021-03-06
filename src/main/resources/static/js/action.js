// angularjs params
var app = angular.module('JdbcApp', []);
app.controller('JdbcController', function($scope, $http) {
	$scope.appid = 1;
	$scope.listData = {};
	$scope.listDataSearch = {};
	$scope.limitTo = 10;
	$scope.pageLength = 10;
});
var appid = 1;

var currentTab_id = null;
var currentTab_TimeDuration = 'YEAR';

var durationTimeHelper = {
	"YEAR" : 4,
	"MONTH" : 7,
	"DAY" : 10,
	"HOUR" : 13,
	"MINUTE" : 16
};

var queryByPageAjaxReq = null;
var searchByPageAjaxReq = null;
var startDateTime = '';
var stopDateTime = '';

$(document).ready(
		function() {
			// 获取APPID
			appid = common_utils_getURLParam('appid');
			var scope = angular.element($('body')).scope();
			scope.cpu = appid;
			scope.$apply();
			$(".tab_div").hide();
			$("#div_durationTime").show();

			$('#select_durationTime').change(function() {
				if (queryByPageAjaxReq != null) {
					queryByPageAjaxReq.abort();
				}
				queryByPage(1);
			});

			$("#li_chevron_left_search").val("<");
			$("#li_chevron_right_search").val(">");
			$("#li_chevron_last_search").val(">>")
			$("#li_chevron_first_search").val("<<");
			$('#a_current_page_search').keydown(function(e) {
				if (e.keyCode == 13) {
					searchpageJump();
				}
			});

			$("#li_chevron_left").val("<");
			$("#li_chevron_right").val(">");
			$("#li_chevron_last").val(">>")
			$("#li_chevron_first").val("<<");
			$('#a_current_page').keydown(function(e) {
				if (e.keyCode == 13) {
					searchpageJump();
				}
			});
			
			queryByPage(1);

		});

function select_tab(tab_id) {
	if (tab_id != null && tab_id != undefined) {
		currentTab_id = tab_id;
		$(".tab_div").hide();
		$("#" + tab_id).show();
		$('.collection a').attr('class', 'collection-item');
		$('#a_' + tab_id).attr('class', 'collection-item active');
		if (tab_id.indexOf('durationTime') > 0) {
			queryByPage(1);
		}
		if (tab_id.indexOf('customTime') > 0) {
			searchByPage(1);
		}

	}
}

function searchPage() {
	startDateTime = $('#start_date_time').val();
	stopDateTime = $('#stop_date_time').val();
	if (searchByPageAjaxReq != null) {
		searchByPageAjaxReq.abort();
	}
	searchByPage(1);
}

function searchpageJump() {
	var tagPage = new Number($('#tagPage_search').val());
	searchByPage(tagPage);

}
function searchpageFirst() {
	if ($('#a_current_page_search').val() == '1') {
		Materialize.toast("当前已经是第一页", 4000, 'blue rounded');
		return;
	}
	var tagPage = 1;
	searchByPage(tagPage);
	$('#a_current_page_search').val(tagPage);
}
function searchpageLast() {
	var tagPage = -1;
	searchByPage(tagPage);
}
function searchpageNext() {
	var tagPage = 1 + new Number($('#a_current_page_search').val());
	searchByPage(tagPage);
}

function searchpagePrevious() {
	var tagPage = new Number($('#a_current_page_search').val()) - 1;
	if (tagPage <= 0) {
		Materialize.toast("当前已经是第一页", 4000, 'blue rounded');
		return;
	}
	searchByPage(tagPage);
}

function searchByPage(tagPage) {
	$('.progress').show();
	var url = "../actionstatistics/queryByPage";
	var data = "appid=" + appid;
	data += "&tagPage=" + tagPage;
	data += "&timeDuration=";
	data += "&condition=" + $('#input_condition').val();
	data += "&startTime=" + startDateTime;
	data += "&stopTime=" + stopDateTime;
	searchByPageAjaxReq = $
			.ajax({
				url : url,
				method : "GET",
				async : true,
				data : data,
				dataType : "html"
			})
			.done(
					function(responseText) {
						$('.progress').hide();
						if (responseText != undefined) {
							try {
								var resParam = null;
								var resParam = JSON.parse(responseText); // get
								// list
							} catch (e) {
								Materialize.toast("返回数据解析失败", 4000,
										'red rounded');
							}

							if (resParam != undefined
									&& resParam.data != undefined) {
								if (resParam.header.code == commonConstraits.resCode_success) {
									var scope = angular.element($('body'))
											.scope();
									scope.listDataSearch = resParam.data; // get
									while (scope.listDataSearch.length < scope.pageLength) {
										scope.listDataSearch[scope.listDataSearch.length] = {};
									}
									// list
									if (resParam.bundle != undefined) {
										$('#a_current_page_search').val(
												resParam.bundle[0]);
										$('#a_last_page_search').val(
												resParam.bundle[1]);
									}
									scope.$apply();
								} else {
									Materialize.toast(resParam.header.des,
											4000, 'red rounded');
								}
							} else {
								Materialize.toast("服务器数据异常", 4000,
										'red rounded');
							}
						}
					}).fail(
					function(jqXHR, textStatus) {
						$('.progress').hide();
						Materialize.toast("Request failed: " + textStatus,
								4000, 'red rounded');
					});

}

function pageJump() {
	var tagPage = new Number($('#a_current_page').val());
	queryByPage(tagPage);

}

function pageFirst() {
	if ($('#a_current_page').val() == '1') {
		Materialize.toast("当前已经是第一页", 4000, 'blue rounded');
		return;
	}
	var tagPage = 1;
	queryByPage(tagPage);
}
function pageLast() {
	var tagPage = -1;
	queryByPage(tagPage);
}
function pageNext() {
	var tagPage = 1 + new Number($('#a_current_page').val());
	queryByPage(tagPage);
}

function pagePrevious() {
	var tagPage = new Number($('#a_current_page').val()) - 1;
	if (tagPage <= 0) {
		Materialize.toast("当前已经是第一页", 4000, 'blue rounded');
		return;
	}
	queryByPage(tagPage);
}

function queryByPage(tagPage) {
	$('.progress').show();
	var url = "../actionstatistics/queryByPage";
	var data = "appid=" + appid;
	data += "&tagPage=" + tagPage;
	var select_durationTime = $("#select_durationTime option:selected").val(); // 获取选中的项
	var scope = angular.element($('body')).scope();
	scope.limitTo = durationTimeHelper[select_durationTime];
	scope.$apply();
	data += "&timeDuration=" + select_durationTime;
	data += "&condition=''";

	queryByPageAjaxReq = $
			.ajax({
				url : url,
				method : "GET",
				async : true,
				data : data,
				dataType : "html"
			})
			.done(
					function(responseText) {
						$('.progress').hide();
						if (responseText != undefined) {
							try {
								var resParam = null;
								var resParam = JSON.parse(responseText); // get
								// list
							} catch (e) {
								Materialize.toast("返回数据解析失败", 4000,
										'red rounded');
							}

							if (resParam != undefined
									&& resParam.data != undefined) {
								if (resParam.header.code == commonConstraits.resCode_success) {
									var scope = angular.element($('body'))
											.scope();
									scope.listData = resParam.data; // get
									while (scope.listData.length < scope.pageLength) {
										scope.listData[scope.listData.length] = {};
									}
									// list
									if (resParam.bundle != undefined) {
										$('#a_current_page').val(
												resParam.bundle[0]);
										$('#a_last_page').val(
												resParam.bundle[1]);
									}
									scope.$apply();
								} else {
									Materialize.toast(resParam.header.des,
											4000, 'red rounded');
								}
							} else {
								Materialize.toast("服务器数据异常", 4000,
										'red rounded');
							}
						}
					}).fail(
					function(jqXHR, textStatus) {
						$('.progress').hide();
						Materialize.toast("Request failed: " + textStatus,
								4000, 'red rounded');
					});

}

function getLatestJdbcOption(list) {

	var titles = [ '活跃连接数', '已使用连接数' ];
	for (var i = 0; i < list.length; i++) {

		if (list[i].id > latestEChartJdbcMaxId) {
			latestEChartJdbcMaxId = list[i].id;
		}

		latestEChartUsedConnectionCounts[i] = list[i].usedConnectionCount;
		latestEChartActiveConnectionCount[i] = list[i].activeConnectionCount;
		latestEChartQueryTime[i] = list[i].queryTime.substring(11,
				list[i].queryTime.length - 3);
	}

	var option = {
		backgroundColor : '#394056',
		title : {
			text : '',
			textStyle : {
				fontWeight : 'normal',
				fontSize : 16,
				color : '#F1F1F3'
			},
			left : '6%'
		},
		tooltip : {
			trigger : 'axis',
			axisPointer : {
				lineStyle : {
					color : '#57617B'
				}
			}
		},
		legend : {
			icon : 'rect',
			itemWidth : 14,
			itemHeight : 5,
			itemGap : 13,
			data : titles,
			right : '4%',
			textStyle : {
				fontSize : 12,
				color : '#F1F1F3'
			}
		},
		grid : {
			left : '3%',
			right : '4%',
			bottom : '3%',
			containLabel : true
		},
		xAxis : [ {
			type : 'category',
			boundaryGap : false,
			axisLine : {
				lineStyle : {
					color : '#57617B'
				}
			},
			data : latestEChartQueryTime
		} ],
		yAxis : [ {
			type : 'value',
			name : '单位(次)',
			axisTick : {
				show : false
			},
			axisLine : {
				lineStyle : {
					color : '#57617B'
				}
			},
			axisLabel : {
				margin : 10,
				textStyle : {
					fontSize : 14
				}
			},
			splitLine : {
				lineStyle : {
					color : '#57617B'
				}
			}
		} ],
		series : [ {
			name : titles[0],
			type : 'line',
			smooth : true,
			symbol : 'circle',
			symbolSize : 5,
			showSymbol : false,
			lineStyle : {
				normal : {
					width : 1
				}
			},
			areaStyle : {
				normal : {
					color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [ {
						offset : 0,
						color : 'rgba(137, 189, 27, 0.3)'
					}, {
						offset : 0.8,
						color : 'rgba(137, 189, 27, 0)'
					} ], false),
					shadowColor : 'rgba(0, 0, 0, 0.1)',
					shadowBlur : 10
				}
			},
			itemStyle : {
				normal : {
					color : 'rgb(137,189,27)',
					borderColor : 'rgba(137,189,2,0.27)',
					borderWidth : 12

				}
			},
			data : latestEChartUsedConnectionCounts
		}, {
			name : titles[1],
			type : 'line',
			smooth : true,
			symbol : 'circle',
			symbolSize : 5,
			showSymbol : false,
			lineStyle : {
				normal : {
					width : 1
				}
			},
			areaStyle : {
				normal : {
					color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [ {
						offset : 0,
						color : 'rgba(0, 136, 212, 0.3)'
					}, {
						offset : 0.8,
						color : 'rgba(0, 136, 212, 0)'
					} ], false),
					shadowColor : 'rgba(0, 0, 0, 0.1)',
					shadowBlur : 10
				}
			},
			itemStyle : {
				normal : {
					color : 'rgb(0,136,212)',
					borderColor : 'rgba(0,136,212,0.2)',
					borderWidth : 12

				}
			},
			data : latestEChartActiveConnectionCount
		} ]
	};
	return option;
}

function queryLatestJdbc() {
	var url = "../actionstatistics/queryLatest";
	var data = "maxId=" + latestEChartJdbcMaxId  + "&appId=" + appid;
	$.ajax({
		url : url,
		method : "POST",
		data : data,
		async : true,
		dataType : "html"
	}).done(
			function(responseText) {
				if (responseText != undefined) {
					try {
						var list = JSON.parse(responseText); // get
						if (list.length > 0) {
							for (var i = 0; i < list.length; i++) {

								if (list[i].id > latestEChartJdbcMaxId) {
									latestEChartJdbcMaxId = list[i].id;
								}

								latestEChartUsedConnectionCounts.shift();
								latestEChartUsedConnectionCounts
										.push(list[i].usedConnectionCount);

								latestEChartActiveConnectionCount.shift();
								latestEChartActiveConnectionCount
										.push(list[i].activeConnectionCount);

								latestEChartQueryTime.shift();
								latestEChartQueryTime.push(list[i].queryTime
										.substring(11,
												list[i].queryTime.length - 3));
							}
							latestEChartJdbcDiv.setOption({
								xAxis : [ {
									data : latestEChartQueryTime
								} ],
								series : [ {
									data : latestEChartUsedConnectionCounts
								}, {
									data : latestEChartActiveConnectionCount
								} ]
							});
					
						}
						setTimeout("queryLatestJdbc()", 1000);
					} catch (e) {
						Materialize.toast("返回数据解析失败", 4000, 'red rounded');
					}
				}
			}).fail(function(jqXHR, textStatus) {
		Materialize.toast("返回数据解析失败", 4000, 'red rounded');
	});
}

function getJdbcNowOption(obj) {

	var javaUsedMemory = obj.usedConnectionCount;
	var javaMaxMemory = obj.maxConnectionCount;

	var color1 = 'green';
	if (javaUsedMemory / javaMaxMemory >= 0.9) {
		color1 = 'red';
	} else {
		if (javaUsedMemory / javaMaxMemory >= 0.7) {
			color1 = 'yellow';
		}
	}

	var option = {
		series : [ {
			center : [ '40.0%', '50%' ],
			radius : [ '60%', '75%' ],
			hoverAnimation : false,
			type : 'pie',
			labelLine : {
				normal : {
					show : false
				}
			},
			data : [
					{
						value : javaUsedMemory,
						name : common_utils_toFixed(javaUsedMemory * 100
								/ javaMaxMemory, 1)
								+ ' %',
						label : {

							normal : {
								position : 'center',
								show : true,
								textStyle : {
									fontSize : '16',
									color : color1
								}
							}
						},
						itemStyle : {
							normal : {
								color : color1
							}
						}
					}, {
						value : javaMaxMemory - javaUsedMemory,
						itemStyle : {
							normal : {
								color : '#BEBEBE'
							}
						}
					} ]
		} ]
	};
	return option;
}