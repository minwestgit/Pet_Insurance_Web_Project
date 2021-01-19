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
			<!-- complete -->
			<div class="my-3 my-md-5">
				<div class="container">
					<div class="text-center mb-6">
						<img src="demo/photos/petlogo.png" style="width: 300px;">
					</div>
					<div class="row" style="padding-left: 350px;">
						<form id="calcform" action="inscomplete" method="GET">
							<div class="card">
								<img class="card-img-top" src="./demo/photos/final.jpg">
								<div class="card-body d-flex flex-column">
									<div style="font-size: 20px; text-align: center;">
										사랑스러운 <span id="p_name" style="font-weight: bold;"></span>의 보험 가입을 환영합니다.
									</div>
									<div class="form-footer">
										<button type="button" id="connectbtn" onclick="loginchk();" class="btn btn-success btn-block" style="width: 200px; margin-left: 115px;">보험 연동하러 가기</button>

									</div>

								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
	<script>
		$(function() {
			$("#p_name").text(sessionStorage.getItem("petname"));
		})
		function loginchk() {
			if ('${sessionScope.user.c_id}' == "") {
				alert("로그인 후 이용해주세요.");
				$('#calcform').attr({
					'action' : 'login'
				}).submit();
			} else {
				$('#calcform').attr({
					'action' : 'insconnect'
				}).submit();

			}
		}
	</script>
</body>
</html>




