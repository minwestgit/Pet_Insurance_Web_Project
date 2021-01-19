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
<!-- include -->
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
<!-- include -->
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
							<form class="card" method="POST" id="cusform" action="insconshow">
								<div class="card-body p-6">
									<div class="card-title" style="font-weight: bold;">보험 연동</div>
									<div class="form-group">
										<label class="form-label">이름</label>
										<input type="text" class="form-control" name="c_name" id="c_name" placeholder="Enter Name">
									</div>
									<div class="form-group">
										<label class="form-label">주민등록번호</label>
										<input type="text" name="c_pid" id="c_pid" class="form-control" data-mask="000000-0000000" data-mask-clearifnotmatch="true" placeholder="000000-0000000" autocomplete="off" maxlength="14">
									</div>

									<div class="form-group">
										<label class="form-label">반려견 선택</label>
										<select name="callpet" id="callpet" class="form-control custom-select" style="width: 250px;">
											<option value="defalutsel" disabled selected>불러오기</option>
										</select>
									</div>
									<div class="form-group">
										<label class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="cusinfochk" /> <span class="custom-control-label">내 정보 불러오기</span>
										</label>
									</div>

									<div class="form-footer">
										<button type="button" onclick="cuschk();" id="connectbtn" class="btn btn-success btn-block" style="width: 120px; margin-left: 85px;">연동하기</button>
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
					sessionStorage.setItem('p_name', obj[0].p_name);
					sessionStorage.setItem('p_type', obj[0].p_type);
					sessionStorage.setItem('p_birth', obj[0].p_birth);

				})
			});

		})

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
				});
			} else {
				$("#c_name").val("");
				$("#c_pid").val("");
			}
		})

		function cuschk() {
			var c_name = $("#c_name").val();
			var c_pid = $("#c_pid").val();
			sessionStorage.setItem('c_pid', c_pid);
			var compare;
			var json = {
				'c_pid' : c_pid
			};
			$.get("selectcompare", json, function(data) {
				var conobj = eval("(" + data + ")");
				console.log(conobj[0].c_name);
				if (conobj[0].c_name == c_name && c_pid == conobj[0].c_pid) {
					compare = 2;
				}
			}).then(function() {
				if (c_name == "" || c_pid == "") {
					alert("고객 정보를 입력하세요.")

				} else if (compare != 2) {
					alert("고객 정보가 일치하지 않습니다.")
				} else {

					$('#cusform').attr({
						'action' : 'insconshow'
					}).submit();
				}
			});

		}
	</script>
</body>
</html>