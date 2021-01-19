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
<!-- Daum map api -->
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
					<div class="row">
						<div class="col col-login mx-auto">
							<div class="text-center mb-6">
								<img src="/resources/demo/photos/petlogo.png" class="h-6" alt="">
							</div>
							<form class="card" method="POST" id="cusform" action="insobligation">
								<div class="card-body p-6">
									<div class="card-title">고객 정보 입력하기</div>
									<div class="form-group">
										<label class="form-label">이름</label>
										<input type="text" class="form-control" name="c_name" id="c_name" placeholder="Enter Name">
									</div>
									<div class="form-group">
										<label class="form-label">주민등록번호</label>
										<input type="text" name="c_pid" id="c_pid" class="form-control" data-mask="000000-0000000" data-mask-clearifnotmatch="true" placeholder="000000-0000000" autocomplete="off" maxlength="14">
									</div>
									<label class="form-label">주소</label>
									<div class="form-group">
										<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="c_zipcode" id="c_zipcode" type="text">
										<button type="button" class="btn btn-default" onclick="execPostCode();">
											<i class="fa fa-search"></i> 우편번호 찾기
										</button>
									</div>
									<div class="form-group">
										<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="c_road" id="c_road" type="text" />
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="상세주소" name="c_detail" id="c_detail" type="text" />
									</div>
									<div class="form-group">
										<label class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="cusinfochk" /> <span class="custom-control-label">내 정보 불러오기</span>
										</label>
									</div>
									<div class="form-footer">
										<a href="./inscalmoney" type="button" class="btn btn-success" id="prev" style="width: 80px; margin-right: 127px;">이전</a>
										<button type="button" class="btn btn-success" id="next" style="width: 80px;" onclick="cuschk();">다음</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
	<script>
		$("#cusinfochk").on("click", function() {
			if ($("#cusinfochk:checked").length > 0) {
				var json = {
					'c_id' : '${sessionScope.user.c_id}'
				};
				console.log(json);
				$.get("selectcusinfo", json, function(data) {
					console.log(data);
					var cusobj = eval("(" + data + ")");
					console.log(cusobj);
					$("#c_name").val(cusobj[0].c_name);
					$("#c_pid").val(cusobj[0].c_pid);
					$("#c_zipcode").val(cusobj[0].c_zipcode);
					$("#c_road").val(cusobj[0].c_road);
					$("#c_detail").val(cusobj[0].c_detail);
				});
			} else {
				$("#c_name").val("");
				$("#c_pid").val("");
				$("#c_zipcode").val("");
				$("#c_road").val("");
				$("#c_detail").val("");
			}
		})

		function cuschk() {
			c_name = $("#c_name").val();
			c_pid = $("#c_pid").val();
			c_zipcode = $("#c_zipcode").val();
			c_road = $("#c_road").val();
			c_detail = $("#c_detail").val();

			sessionStorage.setItem('c_name', c_name);
			sessionStorage.setItem('c_pid', c_pid);
			sessionStorage.setItem('c_zipcode', c_zipcode);
			sessionStorage.setItem('c_road', c_road);
			sessionStorage.setItem('c_detail', c_detail);

			if (!c_name || !c_pid || !c_zipcode || !c_road) {
				alert("고객 정보를 입력하세요.")

			} else {
				$('#cusform').attr({
					'action' : 'insobligation'
				}).submit();
			}
		}
	</script>
</body>
</html>