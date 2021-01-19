<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="Content-Language" content="en" />
<meta name="msapplication-TileColor" content="#2d89ef">
<meta name="theme-color" content="#4188c9">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-capable" content="yes">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<link rel="icon" href="./favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" type="image/x-icon" href="./favicon.ico" />
<title>건강하개</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
<script src="./assets/js/vendors/jquery-3.2.1.min.js"></script>
<script src="./assets/js/require.min.js"></script>
<script>
	requirejs.config({
		baseUrl : '.'
	});
</script>
<!-- Dashboard Core -->
<link href="assets/css/dashboard.css" rel="stylesheet" />
<script src="assets/js/dashboard.js"></script>
<!-- c3.js Charts Plugin -->
<link href="assets/plugins/charts-c3/plugin.css" rel="stylesheet" />
<script src="assets/plugins/charts-c3/plugin.js"></script>
<!-- Google Maps Plugin -->
<link href="assets/plugins/maps-google/plugin.css" rel="stylesheet" />
<script src="assets/plugins/maps-google/plugin.js"></script>
<!-- Input Mask Plugin -->
<script src="assets/plugins/input-mask/plugin.js"></script>
<!-- Datatables Plugin -->
<script src="assets/plugins/datatables/plugin.js"></script>
</head>
<body class="">
	<div class="page">
		<div class="flex-fill">
			<%@ include file="header.jsp"%>
			<%@ include file="menu.jsp"%>
			<div class="my-3 my-md-5">
				<div class="container" style="padding-top: 30px;">
					<div class="card">
						<!-- 보험명 -->
						<div class="row">
							<div class="col-md-12">
								<div class="alert alert-primary" style="margin-left: 0px;">
									<div class="card-status card-status-left bg-blue"></div>
									<div class="card-body" style="padding-top: 5px; padding-bottom: 5px;">
										<span style="font-size: 20px;">아이(I)러브(LOVE)펫보험1904</span> <span id="p_name"></span>, <span id="p_age"></span>세, <span id="p_type"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8 col-lg-8">
								<div class="table-responsive dimmer active">
									<div id="loader"></div>
									<table id="calctable" class="table card-table table-striped table-vcenter" style="height: 475px;">
										<thead>
											<tr>
												<th>구분</th>
												<th>보장담보</th>
												<th>가입금액</th>
												<th>납부금액</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>기본약관</td>
												<td>반려동물 의료비</td>
												<td rowspan="4"><span id="join">900</span>만원</td>
												<td><span id="pay1">31040</span>원</td>
											</tr>
											<tr>
												<td rowspan="5">특별약관</td>
												<td>구강질환 확장보장</td>
												<td><span id="pay2">1366</span>원</td>
											</tr>
											<tr>
												<td>슬관절 및 고관절 탈구 확장보장</td>
												<td><span id="pay3">7605</span>원</td>
											</tr>
											<tr>
												<td>피부질환 확장보장</td>
												<td><span id="pay4">9157</span>원</td>
											</tr>
											<tr>
												<td>반려동물 장례지원비</td>
												<td>30만원</td>
												<td>269원</td>
											</tr>
											<tr>
												<td>반려동물 배상책임</td>
												<td>500만원</td>
												<td>419원</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<div class="col-md-4 col-lg-4" style="padding-left: 0%;">
								<form>
									<div class="form-group">
										<b>자기 부담금 </b> <span style="font-size: 0.8em; position: relative; top: 3px;"> (최소 1만원, 최대 3만원) </span>
									</div>
									<div class="form-group" style="padding-top: 2px;">
										<select id="cus_money" class="form-control custom-select selectized" style="width: 250px">
											<option value="1man">1만원</option>
											<option value="2man">2만원</option>
											<option value="3man" selected="selected">3만원</option>
										</select>
									</div>
									<div class="form-group">
										<b>보상 비율</b>
									</div>
									<div class="form-group">
										<button type="button" id="50per" class="btn btn-secondary" style="width: 80px; margin-right: 10px;" onclick="perfn1();">50%</button>
										<button type="button" id="70per" class="btn btn-success" style="width: 80px; margin-right: 10px;" onclick="perfn2();">70%</button>
									</div>
									<div class="form-group">
										<b>납부 방법</b>
									</div>
									<div class="form-group">
										<button type="button" id="monbtn" class="btn btn-success" style="width: 80px; margin-right: 10px;" onclick="monfn();">월납</button>
										<button type="button" id="yearbtn" class="btn btn-secondary" style="width: 80px; margin-right: 10px;" onclick="yearfn();">연납</button>
									</div>
									<div class="form-group">
										<b>특별약관</b>
									</div>
									<div class="form-group">

										<label class="colorinput">
											<input name="special" id="gugang" type="checkbox" value="gugang" class="colorinput-input" /> <span class="colorinput-color bg-green" style="width: 25px; height: 25px;"></span> <span>구강&nbsp;</span>
										</label>
										<label class="colorinput">
											<input name="special" id="talgu" type="checkbox" value="talgu" id="talgu" class="colorinput-input" /> <span class="colorinput-color bg-green" style="width: 25px; height: 25px;"></span> 탈구&nbsp;
										</label>
										<label class="colorinput">
											<input name="special" id="skin" type="checkbox" value="skin" id="skin" class="colorinput-input" /> <span class="colorinput-color bg-green" style="width: 25px; height: 25px;"></span> 피부&nbsp;
										</label>
										<label class="colorinput">
											<input name="special" id="funeral" type="checkbox" value="funeral" id="funeral" class="colorinput-input" /> <span class="colorinput-color bg-green" style="width: 25px; height: 25px;"></span> 장례&nbsp;
										</label>
										<label class="colorinput">
											<input name="special" id="baesang" type="checkbox" value="baesang" id="baesang" class="colorinput-input" /> <span class="colorinput-color bg-green" style="width: 25px; height: 25px;"></span> 배상&nbsp;
										</label>
									</div>
									<div class="form-group" style="width: 250px; height: 100px; background-color: MediumSeaGreen;">
										<div style="width: 250px; height: 35px; padding: 10px; color: white;">다이렉트 보험료(10% 할인)</div>
										<div style="width: 250px; padding-right: 10px; margin-top: 10px; color: white; font-size: 12px; text-align: right;">
											할인 전 <span id="totalbefore" style="text-decoration: line-through;">30000</span> 원
										</div>
										<div style="width: 250px; padding-right: 10px; color: white; text-align: right;">

											<span style="font-size: 20px;" id="typeshow">월</span> <span id="total" style="font-size: 18px;">27000</span> 원
										</div>
									</div>
									<div class="form-group">
										<button type="button" id="monbtn" class="btn btn-cyan" style="width: 100px; margin-right: 15px;" onclick="changecalc();">보험료 계산</button>
										<a href="./inscusinfo" type="button" class="btn btn-blue">보험 가입하러 가기</a>
									</div>
								</form>
							</div>
						</div>


					</div>
					<div class="card">
						<div class="row">
							<div class="col-md-12">
								<div class="alert alert-success" style="margin-left: 0px;">
									<div class="card-status card-status-left bg-green"></div>
									<div class="card-body" style="padding-top: 5px; padding-bottom: 5px;">
										<span style="font-size: 20px;">고객님들이 많이 선택한 조건</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-xl-6">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">자기 부담금</h3>
									</div>
									<div class="card-body">
										<div id="chart-pie" style="height: 16rem"></div>
									</div>
								</div>
								<script>
									var one;
									var two;
									var three;
									$
											.get(
													"selectper2",
													function(data) {
														console.log(data);
														var perobj = eval("("
																+ data + ")");

														one = perobj[0].per2;
														two = perobj[1].per2;
														three = perobj[2].per2;

													})
											.then(
													function() {
														require(
																[ 'c3',
																		'jquery' ],
																function(c3, $) {
																	//$(document).ready(function(){
																	var chart = c3
																			.generate({
																				bindto : '#chart-pie', // id of chart wrapper
																				data : {
																					columns : [
																							// each columns data
																							[
																									'data1',
																									one ],
																							[
																									'data2',
																									two ],
																							[
																									'data3',
																									three ] ],
																					type : 'donut', // default type of chart
																					colors : {
																						'data1' : tabler.colors["blue-darker"],
																						'data2' : tabler.colors["blue"],
																						'data3' : tabler.colors["blue-light"],
																					},
																					names : {
																						// name of each serie
																						'data1' : '1만원',
																						'data2' : '2만원',
																						'data3' : '3만원'
																					}
																				},
																				axis : {},
																				legend : {
																					show : true, //hide legend
																				},
																				padding : {
																					bottom : 0,
																					top : 0
																				},
																			});
																	//});
																});

													});
								</script>
							</div>
							<div class="col-lg-6 col-xl-6">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">보상 비율</h3>
									</div>
									<div class="card-body">
										<div id="chart-donut" style="height: 16rem"></div>
									</div>
								</div>
								<script>
									var five;
									var seven;
									$
											.get(
													"selectper",
													function(data) {
														var perobj = eval("("
																+ data + ")");

														five = perobj[0].per_per;
														seven = perobj[1].per_per;
														console.log(seven);
													})
											.then(
													function() {
														require(
																[ 'c3',
																		'jquery' ],
																function(c3, $) {
																	//$(document).ready(function(){
																	var chart = c3
																			.generate({
																				bindto : '#chart-donut', // id of chart wrapper
																				data : {
																					columns : [
																							// each columns data
																							[
																									'data1',
																									five ],
																							[
																									'data2',
																									seven ] ],
																					type : 'donut', // default type of chart
																					colors : {
																						'data1' : tabler.colors["green"],
																						'data2' : tabler.colors["green-light"]
																					},
																					names : {
																						// name of each serie
																						'data1' : '50%',
																						'data2' : '70%'
																					}
																				},
																				axis : {},
																				legend : {
																					show : true, //hide legend
																				},
																				padding : {
																					bottom : 0,
																					top : 0
																				},
																			});
																	//});
																});

													});
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
	<script>
		$(function() {
			var p_type = sessionStorage.getItem("pettype");
			switch (p_type) {
			case "poodle":
				$("#p_type").text("푸들");
				break;
			case "maltese":
				$("#p_type").text("말티즈");
				break;
			case "sichu":
				$("#p_type").text("시츄");
				break;
			}

			$("#p_age").text(sessionStorage.getItem("petbirth"));
			$("#p_name").text(sessionStorage.getItem("petname"));
		})

		perval = 70;
		typeval = 1;

		function perfn1() {
			$('#50per').attr('class', 'btn btn-success');
			$('#70per').attr('class', 'btn btn-secondary');
			perval = 50;
		}

		function perfn2() {
			$('#70per').attr('class', 'btn btn-success');
			$('#50per').attr('class', 'btn btn-secondary');
			perval = 70;
		}

		function monfn() {
			$('#monbtn').attr('class', 'btn btn-success');
			$('#yearbtn').attr('class', 'btn btn-secondary');
			typeval = 1;
		}

		function yearfn() {
			$('#yearbtn').attr('class', 'btn btn-success');
			$('#monbtn').attr('class', 'btn btn-secondary');
			typeval = 12;
		}

		function changecalc() {
			var burden = $("#cus_money option:selected").val();
			var joinmoney = 900;
			var paymoney1 = 30000;
			var paymoney2 = 1366;
			var paymoney3 = 7605;
			var paymoney4 = 9157;
			var paymoney5 = 269;
			var paymoney6 = 419;

			if (burden == "1man") {
				joinmoney *= 1.5;
				paymoney1 *= 1.5;
				paymoney2 *= 1.5;
				paymoney3 *= 1.5;
				paymoney4 *= 1.5;
				sessionStorage.setItem('burden', '1');
			}

			if (burden == "2man") {
				joinmoney *= 1.25;
				paymoney1 *= 1.25;
				paymoney2 *= 1.25;
				paymoney3 *= 1.25;
				paymoney4 *= 1.25;
				sessionStorage.setItem('burden', '2');
			}
			if (burden == "3man") {
				sessionStorage.setItem('burden', '3');
			}

			if (perval == 50) {
				joinmoney *= 0.7;
				paymoney1 *= 0.7;
				paymoney2 *= 0.7;
				paymoney3 *= 0.7;
				paymoney4 *= 0.7;
			}

			var totalmoney = paymoney1;

			if ($("input:checkbox[id=gugang]").is(":checked") == true) {
				totalmoney += paymoney2;
				sessionStorage.setItem('gugang', '구강질환');
			} else {
				sessionStorage.setItem('gugang', ' ');
			}
			if ($("input:checkbox[id=talgu]").is(":checked") == true) {
				totalmoney += paymoney3;
				sessionStorage.setItem('talgu', '탈구');
			} else {
				sessionStorage.setItem('talgu', ' ');
			}
			if ($("input:checkbox[id=skin]").is(":checked") == true) {
				totalmoney += paymoney4;
				sessionStorage.setItem('skin', '피부질환');
			} else {
				sessionStorage.setItem('skin', ' ');
			}
			if ($("input:checkbox[id=funeral]").is(":checked") == true) {
				totalmoney += paymoney5;
				sessionStorage.setItem('funeral', '장례');
			} else {
				sessionStorage.setItem('funeral', ' ');
			}
			if ($("input:checkbox[id=baesang]").is(":checked") == true) {
				totalmoney += paymoney6;
				sessionStorage.setItem('baesang', '배상책임');
			} else {
				sessionStorage.setItem('baesang', ' ');
			}

			totalmoney *= typeval;
			var totaldiscount = totalmoney * 0.9;

			sessionStorage.setItem('perval', perval);
			sessionStorage.setItem('totaldiscount', Math.floor(totaldiscount));
			$('#loader').attr({
				'class' : 'loader'
			}).submit();

			setTimeout(function() {
				$('#loader').attr({
					'class' : ''
				}).submit();
				$("#join").text(Math.floor(joinmoney));
				$("#pay1").text(Math.floor(paymoney1));
				$("#pay2").text(Math.floor(paymoney2));
				$("#pay3").text(Math.floor(paymoney3));
				$("#pay4").text(Math.floor(paymoney4));
				$("#totalbefore").text(Math.floor(totalmoney));
				$("#total").text(Math.floor(totaldiscount));
				if (typeval == 12) {
					$("#typeshow").text("연간");
					sessionStorage.setItem('typeval', '연납');
				} else {
					sessionStorage.setItem('typeval', '월납');
				}

			}, 1500);
		}
	</script>
</body>
</html>