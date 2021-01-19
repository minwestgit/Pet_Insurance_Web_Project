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
										<div class="card-header">
											<h3 class="card-title">가입 정보 확인</h3>
										</div>
										<form class="card" method="POST" id="chkform" action="inscomplete">
											<div class="card-body">
												<div class="text-muted">반려견 정보</div>
												<div style="margin-left: 10px; margin-top: 10px;">
													<div>
														이름<span id="p_name" style="margin-left: 20px;"></span>
													</div>
													<div>
														견종<span id="p_type" style="margin-left: 20px;"></span>
													</div>
													<div>
														생일<span id="p_birth" style="margin-left: 20px;"></span>
													</div>
												</div>
												<hr>
												<div class="text-muted">고객 정보</div>
												<div style="margin-left: 10px; margin-top: 10px;">
													<div>
														이름<span id="c_name" style="margin-left: 20px;"></span>
													</div>
													<div>
														생일<span id="c_pid" style="margin-left: 20px;"></span>
													</div>
													<div>
														주소<span id="c_add" style="margin-left: 20px;"></span>
													</div>
												</div>
												<hr>
												<div class="text-muted">보험 정보</div>
												<div style="margin-left: 10px; margin-top: 10px;">
													<div>
														상품명<span id="i_name" style="margin-left: 52px;">아이(I)러브(LOVE)펫보험</span>
													</div>
													<div>
														자기 부담금<span id="i_burden" style="margin-left: 20px;"></span>만원
													</div>
													<div>
														보상 비율<span id="i_per" style="margin-left: 34px;"></span>%
													</div>
													<div>
														납입 방법<span id="i_paytype" style="margin-left: 34px;"></span>
													</div>
													<div>
														보험료<span id="i_total" style="margin-left: 53px;"></span>원
													</div>
													<div>
														특별 약관<span id="i_special" style="margin-left: 34px;"></span>
													</div>
												</div>
												<div class="form-footer">
													<a href="./insobligation" type="button" class="btn btn-success" id="prev" style="width: 80px; margin-right: 385px;">이전</a>
													<button type="button" class="btn btn-success" id="next" style="width: 80px;" onclick="finalfn();">가입</button>
												</div>
											</div>
										</form>
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
			$("#p_name").text(sessionStorage.getItem("petname"));
			var p_type = sessionStorage.getItem("pettype");
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
			$("#p_birth").text(sessionStorage.getItem("petbirth") + "세");

			$("#c_name").text(sessionStorage.getItem("c_name"));
			c_pid = sessionStorage.getItem("c_pid").substr(0, 2) + "년 "
					+ sessionStorage.getItem("c_pid").substr(2, 2) + "월 "
					+ sessionStorage.getItem("c_pid").substr(4, 2) + "일";
			$("#c_pid").text(c_pid);
			$("#c_add").text(
					"(" + sessionStorage.getItem("c_zipcode") + ") "
							+ sessionStorage.getItem("c_road") + " "
							+ sessionStorage.getItem("c_detail"));
			$("#i_burden").text(sessionStorage.getItem("burden"));
			$("#i_per").text(sessionStorage.getItem("perval"));
			$("#i_paytype").text(sessionStorage.getItem("typeval"));
			$("#i_total").text(sessionStorage.getItem("totaldiscount"));
			$("#i_special").text(
					sessionStorage.getItem("gugang") + " "
							+ sessionStorage.getItem("talgu") + " "
							+ sessionStorage.getItem("skin") + " "
							+ sessionStorage.getItem("funeral") + " "
							+ sessionStorage.getItem("baesang"));
		})

		function finalfn() {

			var getval = "inscomplete?" + "burden="
					+ sessionStorage.getItem("burden") + "&perval="
					+ sessionStorage.getItem("perval") + "&typeval="
					+ sessionStorage.getItem("typeval") + "&totaldiscount="
					+ sessionStorage.getItem("totaldiscount") + "&c_pid="
					+ sessionStorage.getItem("c_pid") + "&c_name="
					+ sessionStorage.getItem("c_name");
			if (sessionStorage.getItem("gugang") == ' ') {
				getval = getval + "&gugang=" + "0";
			} else {
				getval = getval + "&gugang=" + "1";
			}
			if (sessionStorage.getItem("talgu") == ' ') {
				getval = getval + "&talgu=" + "0";
			} else {
				getval = getval + "&talgu=" + "1";
			}
			if (sessionStorage.getItem("skin") == ' ') {
				getval = getval + "&skin=" + "0";
			} else {
				getval = getval + "&skin=" + "1";
			}
			if (sessionStorage.getItem("funeral") == ' ') {
				getval = getval + "&funeral=" + "0";
			} else {
				getval = getval + "&funeral=" + "1";
			}
			if (sessionStorage.getItem("baesang") == ' ') {
				getval = getval + "&baesang=" + "0";
			} else {
				getval = getval + "&baesang=" + "1";
			}

			$('#chkform').attr({
				'action' : getval
			}).submit();
		}
	</script>
</body>
</html>