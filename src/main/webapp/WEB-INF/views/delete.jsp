<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<script src="assets/js/vendors/jquery-3.2.1.min.js"></script>
<script src="assets/js/require.min.js"></script>
<script>
	requirejs.config({
		baseUrl : '.'
	});
</script>
<link href="assets/css/dashboard.css" rel="stylesheet" />
<script src="assets/js/dashboard.js"></script>
<link href="assets/plugins/charts-c3/plugin.css" rel="stylesheet" />
<script src="assets/plugins/charts-c3/plugin.js"></script>
<link href="assets/plugins/maps-google/plugin.css" rel="stylesheet" />
<script src="assets/plugins/maps-google/plugin.js"></script>
<script src="assets/plugins/input-mask/plugin.js"></script>
<script src="assets/plugins/datatables/plugin.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="assets/js/postcode.v2.js"></script>
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

										<a href="empty" class="list-group-item list-group-item-action">
											<span class="icon mr-3"><i class="fe fe-bar-chart-2"></i></span>기타 정보
										</a>
										<a href="delete" class="list-group-item list-group-item-action active">
											<span class="icon mr-3"><i class="fe fe-user-x"></i></span>계정 탈퇴
										</a>
									</div>
								</div>
								<div class="col-9">
									<div class="card">
										<div class="card-header">
											<div class="card-status bg-green"></div>
											<h3 class="card-title">계정 탈퇴</h3>
										</div>
										<div class="card-body">
											<h2 class="mt-0 mb-4">제7조(회원 탈퇴 및 자격 상실 등)</h2>
											<h5 id="setup-environment">① 회원은 "건강하개"에 언제든지 탈퇴를 요청할 수 있으며 "건강하개"은 즉시 회원탈퇴를 처리합니다.</h5>
											<br>
											<h5 id="setup-environment">② 회원이 다음 각 호의 사유에 해당하는 경우, "건강하개"은 회원자격을 제한 및 정지시킬 수 있습니다.</h5>
											<ol>
												<li>가입 신청 시에 허위 내용을 등록한 경우</li>
												<li>"건강하개"을 이용하여 구입한 재화·용역 등의 대금, 기타 "건강하개" 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</li>
												<li>다른 사람의 "건강하개" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우</li>
												<li>"건강하개"을 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li>
											</ol>
											<br>
											<h5 id="setup-environment">③ "건강하개"이 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "건강하개"은 회원자격을 상실시킬 수 있습니다.</h5>
											<br>
											<h5 id="setup-environment">④ "건강하개"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.</h5>
											<br> <!-- <img class="card-img-top" src="./demo/photos/sad_cat.png" alt="ㅠㅠ"><br> --> <br>
											<button type="button" id="delete_btn" class="btn btn-square btn-danger btn-block">계정 탈퇴</button>
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
	</div>
	<%@ include file="footer.jsp"%>
	<script type="text/javascript">
		$('#delete_btn').click(function(event) {
			var result = confirm('정말로 탈퇴하실건가요?');
			if (result) {
				var user = {
					c_id : "${sessionScope.user.c_id}",
					c_pw : "${sessionScope.user.c_pw}",
					c_name : "${sessionScope.user.c_name}",
					c_pid : "${sessionScope.user.c_pid}",
					c_gender : "${sessionScope.user.c_gender}",
					c_zipcode : "${sessionScope.user.c_zipcode}",
					c_road : "${sessionScope.user.c_road}",
					c_detail : "${sessionScope.user.c_detail}",
					c_phone : "${sessionScope.user.c_phone}",
					c_email : "${sessionScope.user.c_email}",
					c_joindate : "${sessionScope.user.c_joindate}"
				};
				console.log(user)
				console.log("탈퇴");
				$.post("/sanghwa/deleteProcess", user, function(data) {
					console.log(data);
					console.log("삭제성공");
					location = "index";
				});
			} else {
				console.log("취소");
			}
		});
	</script>
</body>
</html>