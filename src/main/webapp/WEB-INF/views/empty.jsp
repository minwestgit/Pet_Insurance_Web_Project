<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
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
<script src="assets/js/require.min.js"></script>
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./assets/js/postcode.v2.js"></script>
</head>
<body class="">
	<div class="page">
		<div class="flex-fill">
			<%@ include file="header.jsp"%>
			<%@ include file="menu.jsp"%>
			<div class="my-3 my-md-5">
				<div class="container">
					<c:choose>
						<c:when test="${not empty sessionScope.user}">
							<div class="page-header">
								<h1 class="page-title">프로필</h1>
							</div>
							<div class="row">
								<div class="col-lg-3 order-lg-1 mb-4">
									<!-- Components -->
									<div class="list-group list-group-transparent mb-0">
										<a href="profile" class="list-group-item list-group-item-action">
											<span class="icon mr-3"><i class="fe fe-user"></i></span>회원정보 수정
										</a>

										<a href="empty" class="list-group-item list-group-item-action active">
											<span class="icon mr-3"><i class="fe fe-bar-chart-2"></i></span>기타 정보
										</a>
										<a href="delete" class="list-group-item list-group-item-action">
											<span class="icon mr-3"><i class="fe fe-user-x"></i></span>계정 탈퇴
										</a>
									</div>
								</div>

								<div class="col-9">
									<div class="card">
										<div class="card-header">
											<div class="card-status bg-green"></div>
											<h3 class="card-title">통계 정보</h3>
										</div>
										<div class="col-lg-6 col-xl-4">
											<div class="card">
												<div class="card-header">
													<h3 class="card-title">가입자 성비</h3>
												</div>
												<div class="card-body">
													<div id="chart-donut" style="height: 16rem"></div>
												</div>
											</div>
											<script>
												var male;
												var permale;
												var female;
												var perfemale;
												$
														.get(
																"genderStat",
																function(data) {
																	console
																			.log(data);
																	var perobj = eval("("
																			+ data
																			+ ")");
																	male = perobj[0].gender;
																	permale = perobj[0].pergender;
																	female = perobj[1].gender;
																	perfemale = perobj[1].pergender;
																})
														.then(
																function() {
																	require(
																			[
																					'c3',
																					'jquery' ],
																			function(
																					c3,
																					$) {
																				$(
																						document)
																						.ready(
																								function() {
																									var chart = c3
																											.generate({
																												bindto : '#chart-donut', // id of chart wrapper
																												data : {
																													columns : [
																															[
																																	'data1',
																																	permale ],
																															[
																																	'data2',
																																	perfemale ] ],
																													type : 'donut',
																													colors : {
																														'data1' : tabler.colors["blue"],
																														'data2' : tabler.colors["red"]
																													},
																													names : {
																														// name of each serie
																														'data1' : '남자',
																														'data2' : '여자',
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
																								})
																			})
																});
											</script>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<meta http-equiv='refresh' content='0;url=login'>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
	<script type="text/javascript">
		$(function() {
			var c_gender = '${sessionScope.user.c_gender}'
			console.log(c_gender);
			$('input:radio[name=c_gender]:input[value=' + c_gender + ']').attr(
					"checked", true);
		})

		$(function() {
			var result = '${alertmsg}';
			var updateok = "회원정보 수정에 성공했습니다.";
			var updatefail = "업데이트 fail";
			if (result == updateok) {
				alert(updateok);
			} else if (result == updatefail) {
				alert(updatefail);
			}

		})

		$(function() {
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				console.log("keyup");
				var pwd1 = $("#c_pw").val();
				var pwd2 = $("#c_pw_check").val();
				if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submit").removeAttr("disabled");
					} else {
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
					}
				}
			});
		});

		$("#update_btn").click(function() {
			$("#updateform").submit();
		});
	</script>
</body>
</html>