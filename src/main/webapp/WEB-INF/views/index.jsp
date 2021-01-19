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
<style>
.fullscreen_bg2 {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-size: cover;
	background-position: 50% 50%;
	/* background-image: url( "./demo/photos/dbpet_bg3.jpg" ); */
	background-repeat: repeat;
	background-color: #ffffff;
	opacity: 0.1 !important;
	filter: alpha(opacity = 20);
	z-index: -1;
}

#item-wrapper {
	position: relative;
	background-image: url( "./demo/photos/exp1.jpg" );
	background-size: cover;
	background-position: 50% 50%;
	padding-top: 60px;
	padding-bottom: 70px;
	padding-right: 70px;
}

.item-info-box {
	position: absolute;
	left: 0;
	bottom: 0.75em;
}
</style>
<body class="">
	<div class="page">
		<div class="flex-fill">
			<%@ include file="header.jsp"%>
			<%@ include file="menu.jsp"%>
			<div class="my-3 my-md-5">
				<div class="fullscreen_bg2"></div>
				<div class="row row-cards" id="item-wrapper">
					<div class="col-lg-1"></div>
					<div class="col-lg-5">
						<form id="calcform" action="index" method="POST">
							<div class="card" id="item-info-box" style="width: 400px; margin-left: 170px;">
								<div>
									<div class="card-body" style="margin-left: 0%;">
										<div class="card-title">반려견 정보 입력하기</div>
										<div class="form-group">
											<label class="form-label">이름</label>
											<input type="text" class="form-control" name="p_name" id="p_name">
										</div>
										<div class="form-group">
											<label class="form-label">견종</label>
											<select name="petinput" id="petinput" class="form-control custom-select">
												<option value="maltese">말티즈</option>
												<option value="poodle">푸들</option>
												<option value="shitzu">시츄</option>
											</select>
										</div>
										<div class="form-group">
											<label class="form-label">생일</label>
											<input type="date" class="form-control custom-select" name="birthinput" id="birthinput">
										</div>
										<div class="form-group">
											<label class="form-label" style="color: gray;">회원이라면</label>
											<select name="callpet" id="callpet" class="form-control custom-select">
												<option value="defalutsel" disabled selected>반려견 정보 불러오기</option>
											</select>
										</div>
										<div class="form-footer">
											<button type="button" class="btn btn-success btn-block" id="paychk" onclick="setfn();">보험료 확인</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-lg-1"></div>
				</div>
			</div>
			<div class="row">
				<img src="./demo/photos/exp2.jpg">

			</div>
			<div class="row">
				<img src="./demo/photos/exp3.jpg">
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	</div>
	<script>
		$(function() {
			var json = {
				'c_id' : '${sessionScope.user.c_id}'
			};
			console.log(json);
			$.get("selectpetinput", json, function(data) {
				console.log(data);
				var obj2 = eval("(" + data + ")");
				console.log(obj2);

				$.each(obj2, function(key, value) {
					$("#callpet").append(
							"<option value=\"" + obj2[key].p_name + "\">"
									+ obj2[key].p_name + "</option>");

				});

			})

			$("#callpet").change(function() {
				s = $("#callpet > option:selected").val();
				$.get("selectpetinfo", {
					'p_name' : s
				}, function(data) {
					console.log(data)
					var obj = eval("(" + data + ")");
					$("#p_name").val(obj[0].p_name)
					var pi = $("#petinput").val(obj[0].p_type)
					$("#petinput").val(obj[0].p_type).prop("selected", true)
					$("#birthinput").val(obj[0].p_birth)
				})
			});

		})

		function setfn() {
			petname = $("#p_name").val()
			pettype = $("#petinput > option:selected").val();
			petbirth = $("#birthinput").val()

			yearbirth = parseInt(petbirth.substr(0, 4));
			todayyear = new Date().getFullYear();

			agecalc = todayyear - yearbirth + 1;

			sessionStorage.setItem('petname', petname);
			sessionStorage.setItem('pettype', pettype);
			sessionStorage.setItem('petbirth', agecalc);

			if (!pettype || !petbirth || !petname) {
				alert("반려견 정보를 입력하세요.")

			} else {
				$('#calcform').attr({
					'action' : 'inscalmoney'
				}).submit();
			}

		}
	</script>
</body>
</html>