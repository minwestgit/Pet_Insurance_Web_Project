<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link href="./assets/css/dashboard.css" rel="stylesheet" />
<script src="./assets/js/dashboard.js"></script>
<!-- c3.js Charts Plugin -->
<link href="./assets/plugins/charts-c3/plugin.css" rel="stylesheet" />
<script src="./assets/plugins/charts-c3/plugin.js"></script>
<!-- Google Maps Plugin -->
<link href="./assets/plugins/maps-google/plugin.css" rel="stylesheet" />
<script src="./assets/plugins/maps-google/plugin.js"></script>
<!-- Input Mask Plugin -->
<script src="./assets/plugins/input-mask/plugin.js"></script>
<!-- Datatables Plugin -->
<script src="./assets/plugins/datatables/plugin.js"></script>
<style>
.fullscreen_bg {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-size: cover;
	background-position: 50% 50%;
	background-image: url( "./demo/photos/dbpet_bg.jpg" );
	background-repeat: repeat;
	background-color: #ffffff;
	opacity: 0.5 !important;
	filter: alpha(opacity = 50);
	z-index: -1;
}
</style>
</head>
<body class="">
	<div class="fullscreen_bg"></div>
	<div class="page">
		<div class="page-single">
			<div class="container">
				<div class="row">
					<div class="col col-login mx-auto">
						<form:form id="loginform" name="loginform" class="card" action="LoginProcess" method="post" autocomplete="on">
							<div class="card-header">
								<div class="card-status bg-green"></div>
								<div class="col-lg-12 text-center">
									<a class="header-brand" href="./index">
										<img src="demo/photos/dbpetlogo.png" class="img-responsive center-block" alt="dbpet logo" style="margin: 0 auto;">
									</a>
								</div>
							</div>
							<div class="card-body p-6">
								<div class="form-group">
									<label class="form-label">아이디</label>
									<input type="text" name="c_id" id="c_id" class="form-control" placeholder="아이디">
								</div>
								<div class="form-group">
									<label class="form-label"> 비밀번호 </label>
									<input type="password" name="c_pw" id="c_pw" class="form-control" placeholder="비밀번호">
								</div>
								<div class="form-footer">
									<button type="button" id="login_btn" class="btn btn-success btn-block">로그인</button>
								</div>
							</div>
							<div class="card-footer text-muted text-center">
								혹시 처음이신가요?
								<a href="./register">회원가입</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var result = '${alertmsg}';
		var success = "회원가입에 성공했습니다.";
		var loginfail = "아이디 혹은 패스워드가 틀렸습니다.";

		if (result == success) {
			alert(success);
		} else if (result == loginfail) {
			alert(loginfail);
		}

		$("#login_btn").click(function() {
			var json = {
				c_id : $("#c_id").val(),
				c_pw : $("#c_pw").val()
			};

			for ( var str in json) {
				if (json[str].length == 0) {
					alert($("#" + str).attr("placeholder") + "를 입력해주세요.");
					$("#" + str).focus();
					return;
				}
			}

			$("#loginform").submit();
		});
	</script>
</body>
</html>

