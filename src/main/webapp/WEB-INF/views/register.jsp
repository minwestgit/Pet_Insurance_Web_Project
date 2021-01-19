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
<script src="assets/plugins/input-mask/plugin.js"></script>
<!-- Datatables Plugin -->
<script src="./assets/plugins/datatables/plugin.js"></script>
<!-- Daum map api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./assets/js/postcode.v2.js"></script>
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
				<div class="row justify-content-md-center">
					<div class="col-lg-8">
						<form:form id="registerform" name="registerform" class="card" modelAttribute="true" action="registerProcess" method="post" autocomplete="off">
							<div class="card-header">
								<div class="card-status bg-green"></div>
								<div class="col-lg-12 text-center">
									<a class="header-brand" href="./index">
										<img src="demo/photos/dbpetlogo.png" " class="header-brand-img" alt="dbpet logo">
									</a>
								</div>
							</div>
							<div class="card-body">
								<div class="form-group">
									<label class="form-label">아이디</label>
									<input type="text" name="c_id" id="c_id" class="form-control" placeholder="아이디">
								</div>
								<div class="form-group">
									<label class="form-label">패스워드 </label>
									<input type="password" name="c_pw" id="c_pw" class="form-control" placeholder="패스워드">
								</div>
								<div class="form-group">
									<label class="form-label">패스워드 확인 </label>
									<input type="password" name="c_pw_check" id="c_pw_check" class="form-control" placeholder="패스워드 확인">
									<div class="alert alert-success" id="alert-success" style="display: none;">비밀번호가 일치합니다.</div>
									<div class="alert alert-danger" id="alert-danger" style="display: none;">비밀번호가 일치하지 않습니다.</div>
								</div>
								<div class="form-group">
									<label class="form-label">이름</label>
									<input type="text" name="c_name" id="c_name" class="form-control" placeholder="이름">
								</div>

								<div class="form-group">
									<label class="form-label">주민등록번호</label>
									<input type="text" name="c_pid" id="c_pid" name="field-name" class="form-control" data-mask="000000-0000000" data-mask-clearifnotmatch="true" placeholder="000000-0000000" autocomplete="off" maxlength="14">
								</div>
								<div class="form-group">
									<div class="form-label">성별</div>
									<div id="c_gender" class="custom-controls-stacked">
										<label class="custom-control custom-radio custom-control-inline">
											<input type="radio" name="c_gender" id="c_gender1" class="custom-control-input bg-green" value="male" checked> <span class="custom-control-label">남자</span>
										</label>
										<label class="custom-control custom-radio custom-control-inline">
											<input type="radio" name="c_gender" id="c_gender2" class="custom-control-input bg-green" value="female"> <span class="custom-control-label">여자</span>
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="form-label">연락처</label>
									<input name="c_phone" id="c_phone" type="text" class="form-control" data-mask="000-0000-0000" data-mask-clearifnotmatch="true" placeholder="000-0000-0000" autocomplete="off" maxlength="13">
								</div>
								<div class="form-group">
									<label class="form-label">주소</label>
									<div class="form-group">
										<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="c_zipcode" id="c_zipcode" type="text" readonly="readonly">
										<button type="button" class="btn btn-default" onclick="execPostCode();">
											<i class="fa fa-search"></i> 우편번호 찾기
										</button>
									</div>
									<div class="form-group">
										<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="c_road" id="c_road" type="text" readonly="readonly" />
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="상세주소" name="c_detail" id="c_detail" type="text" />
									</div>

								</div>
								<div class="form-group">
									<label class="form-label">이메일</label>
									<input name="c_email" id="c_email" class="form-control" placeholder="email@domain.com">
								</div>
								<div class="form-group">
									<label class="form-label">체크사항</label>
									<label class="custom-switch">
										<input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"> <span class="custom-switch-indicator"></span> <span class="custom-switch-description">DB손해보험 가입여부</span>
									</label>
								</div>
								<div class="form-footer">
									<button type="button" id="register_btn" class="btn btn-success btn-block">회원 가입</button>
								</div>
							</div>
							<div class="card-footer text-muted text-center">
								이미 계정이 있습니까?
								<a href="./login">로그인</a>
							</div>
						</form:form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script>
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

		$("#register_btn").click(function() {
			var json = {
				c_id : $("#c_id").val(),
				c_pw : $("#c_pw").val(),
				c_pw_check : $("#c_pw_check").val(),
				c_name : $("#c_pw_check").val(),
				c_pid : $("#c_pid").val(),
				c_gender : $('input[name=c_gender]:checked').val(),
				c_phone : $("#c_phone").val(),
				c_zipcode : $("#c_zipcode").val(),
				c_road : $("#c_road").val(),
				c_detail : $("#c_detail").val(),
				c_email : $("#c_email").val()
			};

			if (json.c_pw != json.c_pw_check) {
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}

			console.log(json)

			for ( var str in json) {
				if (json[str].length == 0) {
					alert($("#" + str).attr("placeholder") + "를 입력해주세요.");
					$("#" + str).focus();
					return;
				}
			}
			$("#registerform").submit();
		});
	</script>
</body>
</html>