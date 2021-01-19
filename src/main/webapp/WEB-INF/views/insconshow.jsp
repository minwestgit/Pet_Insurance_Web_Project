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
					<div class="row" style="margin-right: 200px;">
						<div class="col col-login mx-auto">
							<div class="row row-cards">
								<div class="col-md-6">
									<div class="card" style="width: 600px;">
										<div class="card-status bg-green"></div>
										<div class="card-header">
											<img src="demo/photos/petlogo.png" style="width: 300px; height: 70%;">
										</div>
										<div class="card-body">
											<div class="text-muted">반려견 정보</div>
											<div style="margin-left: 10px; margin-top: 10px;">
												<div style="margin-bottom: 5px;">
													이름<span id="p_name" style="margin-left: 20px;"></span>
												</div>
												<div style="margin-bottom: 5px;">
													견종<span id="p_type" style="margin-left: 20px;"></span>
												</div>
												<div style="margin-bottom: 5px;">
													생일<span id="p_birth" style="margin-left: 20px;"></span>
												</div>
											</div>
											<hr>
											<div class="text-muted">보험 정보</div>
											<div style="margin-left: 10px; margin-top: 10px;">
												<div style="margin-bottom: 5px;">
													<span class="text-muted">자기부담금</span><span id="i_pay" style="margin-left: 26px;"></span>만원
												</div>
												<div style="margin-bottom: 5px;">
													<span class="text-muted">보상비율</span><span id="i_percent" style="margin-left: 44px;"></span>%
												</div>
												<div style="margin-bottom: 5px;">
													<span class="text-muted">계약일</span><span id="i_startdate" style="margin-left: 60px;"></span>
												</div>
												<div style="margin-bottom: 5px;">
													<span class="text-muted">납입 방법</span><span id="i_paytype" style="margin-left: 40px;"></span>
												</div>
												<div style="margin-bottom: 5px;">
													<span class="text-muted">특별 약관</span><span id="i_special" style="margin-left: 40px;"></span>
												</div>
												<div style="margin-bottom: 10px;">
													<span class="text-muted">총 납입 금액</span><span id="i_total" style="margin-left: 22px;"></span>원
												</div>
											</div>
										</div>
									</div>
								</div>
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
			$("#p_name").text(sessionStorage.getItem("p_name"));
			var p_type = sessionStorage.getItem("p_type");
			switch (p_type) {
			case "poodle":
				$("#p_type").text("푸들");
				break;
			case "maltese":
				$("#p_type").text("말티즈");
				break;
			case "shitzu":
				$("#p_type").text("시츄");
				break;
			}
			$("#p_birth").text(sessionStorage.getItem("p_birth"));

			var json = {
				'c_pid' : sessionStorage.getItem("c_pid")
			};
			console.log(json);
			$.get("selectinsinfo", json, function(data) {
				console.log(data);
				var insobj = eval("(" + data + ")");
				console.log(insobj);
				$("#i_pay").text(insobj[0].i_pay);
				$("#i_percent").text(insobj[0].i_percent);
				$("#i_paytype").text(insobj[0].i_paytype);
				$("#i_total").text(insobj[0].i_total);
				$("#i_startdate").text(insobj[0].i_startdate);
				var s = "";
				if (insobj[0].i_sp1 == "1") {
					s += "구강질환 "
				}
				if (insobj[0].i_sp2 == "1") {
					s += "탈구 "
				}
				if (insobj[0].i_sp3 == "1") {
					s += "피부질환 "
				}
				if (insobj[0].i_sp4 == "1") {
					s += "장례지원비 "
				}
				if (insobj[0].i_sp5 == "1") {
					s += "배상책임 "
				}

				$("#i_special").text(s);
			});

		})
	</script>
</body>
</html>