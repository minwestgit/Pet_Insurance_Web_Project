<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>
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
<!-- Generated: 2019-04-04 16:55:45 +0200 -->
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
				<div class="container">
					<form id="oblform" action="insfinalchk" method="POST">
						<div class="row" style="margin-right: 200px;">
							<div class="col col-login mx-auto">
								<div class="row row-cards">
									<div class="col-md-6">
										<div class="card" style="width: 600px;">
											<div class="card-status bg-green"></div>
											<div class="card-header">
												<h3 class="card-title">계약 전 알릴 의무 사항</h3>
											</div>
											<div class="card-body">
												<div class="form-group">
													<span>1. 애완/반려 이외의 목적으로 양육하고 있습니까?</span>
													<div class="custom-controls-stacked">
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="onechk" value="option1"> <span class="custom-control-label">YES</span>
														</label>
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="onechk" value="option2"> <span class="custom-control-label">NO</span>
														</label>
													</div>
												</div>
												<div class="form-group">
													<span>2. 반려동물이 현재 질병 및 사고로 치료 또는 경과 관찰 중이거나 과거 3개월 이내에 동물병원에서 예방목적 이외의 진찰을 받은 적이 있습니까?</span>
													<div class="custom-controls-stacked">
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="twochk" value="option1"> <span class="custom-control-label">YES</span>
														</label>
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="twochk" value="option2"> <span class="custom-control-label">NO</span>
														</label>
													</div>
												</div>
												<div class="form-group">
													<span>3. 반려동물이 과거부터 현재까지 슬·고관절탈구, 슬·고관절형성부전 또는 기타 이들과 유사한 질병 또는 상해로 진단되거나 의심소견을 받은적이 있습니까?</span>
													<div class="custom-controls-stacked">
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="threechk" value="option1"> <span class="custom-control-label">YES</span>
														</label>
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="threechk" value="option2"> <span class="custom-control-label">NO</span>
														</label>
													</div>
												</div>
												<div class="form-group">
													<span>4. 반려동물이 과거부터 현재까지 치석제거 및 치아부정교합 등 구강내 질환으로 진단되거나 의심소견을 받은적이 있습니까?</span>
													<div class="custom-controls-stacked">
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="fourchk" value="option1"> <span class="custom-control-label">YES</span>
														</label>
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="fourchk" value="option2"> <span class="custom-control-label">NO</span>
														</label>
													</div>
												</div>
												<div class="form-group">
													<span>5. 반려동물이 과거부터 현재까지 피부병(외이염, 중이염, 피부알러지, 피부트러블을 포함)으로 진단되거나 의심소견을 받은적이 있습니까?</span>
													<div class="custom-controls-stacked">
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="fivechk" value="option1"> <span class="custom-control-label">YES</span>
														</label>
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="fivechk" value="option2"> <span class="custom-control-label">NO</span>
														</label>
													</div>
												</div>
												<div class="form-group">
													<span>6. 반려동물이 현재 계속해서 복용(사용)하고 있는 의약품이 있습니까?</span>
													<div class="custom-controls-stacked">
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="sixchk" value="option1"> <span class="custom-control-label">YES</span>
														</label>
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="sixchk" value="option2"> <span class="custom-control-label">NO</span>
														</label>
													</div>
												</div>
												<div class="form-group">
													<span>7. 반려동물이 현재 일상적인 관리나 예방 접종을 받고 있는 동물병원이 있습니까? </span>
													<div class="custom-controls-stacked">
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="sevenchk" value="option1"> <span class="custom-control-label">YES</span>
														</label>
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="sevenchk" value="option2"> <span class="custom-control-label">NO</span>
														</label>
													</div>
												</div>
												<div class="form-group">
													<span>8. 현재 다른 애견보험 등에 가입하고 있습니까?</span>
													<div class="custom-controls-stacked">
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="eightchk" value="option1"> <span class="custom-control-label">YES</span>
														</label>
														<label class="custom-control custom-radio custom-control-inline">
															<input type="radio" class="custom-control-input" name="eightchk" value="option2"> <span class="custom-control-label">NO</span>
														</label>
													</div>
												</div>
												<div class="form-footer">
													<a href="./inscusinfo" type="button" class="btn btn-success" id="prev" style="width: 80px; margin-right: 385px;">이전</a>
													<!-- <a href="./inspetinfo" type="button" class="btn btn-success" id="next" style="width: 80px;" onclick="chkfn();">다음</a> -->
													<button type="button" class="btn btn-success" id="next" style="width: 80px;" onclick="chkfn();">다음</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
	<script>
		function chkfn() {
			var radioVal1 = $('input[name="onechk"]:checked').val();
			var radioVal2 = $('input[name="twochk"]:checked').val();
			var radioVal3 = $('input[name="threechk"]:checked').val();
			var radioVal4 = $('input[name="fourchk"]:checked').val();
			var radioVal5 = $('input[name="fivechk"]:checked').val();
			var radioVal6 = $('input[name="sixchk"]:checked').val();
			var radioVal7 = $('input[name="sevenchk"]:checked').val();
			var radioVal8 = $('input[name="eightchk"]:checked').val();
			if (radioVal1 != "option2" || radioVal2 != "option2"
					|| radioVal3 != "option2" || radioVal4 != "option2"
					|| radioVal5 != "option2" || radioVal6 != "option2"
					|| radioVal7 != "option1" || radioVal8 != "option2") {
				alert('해당 조건으로는 가입하실 수 없습니다.')
				/* location.replace("./insfinalchk") */

			} else {
				$('#oblform').attr({
					'action' : 'insfinalchk'
				}).submit();
			}

		}
	</script>
</body>
</html>