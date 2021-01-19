<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

</head>
<body class="">
	<div class="page">
		<div class="flex-fill">
			<%@ include file="header.jsp"%>
			<%@ include file="menu.jsp"%>
			<div class="row justify-content-md-center">
				<c:forEach var="a" items="${arr}">
					<div class="col-lg-6">
						<form class="card" name="registerform" id="registerform" action="petinfoupdatesave" method="post" autocomplete="off" enctype="multipart/form-data">
							<div class="card-body">
								<div class="card-title center" style="font-weight: bold">반려견 수정</div>

								<div class="form-group">
									<label class="form-label">사진 업로드</label>
									<input type="file" name="p_photo" id="p_photo" accept=".jpg,.jpeg,.png,.gif"> <br>
									<div id="holder" style="width: 150px; height: 150px">
										<c:choose>
											<c:when test="${empty a.p_photo}"></c:when>
											<c:otherwise>
												<img src="${a.p_photo}" style="width: 150px; height: 150px;">
											</c:otherwise>
										</c:choose>
									</div>

								</div>

								<div class="form-group">
									<label class="form-label">이름</label>
									<input type="text" name="p_name" id="p_name" class="form-control" value="${a.p_name}">
								</div>

								<div class="form-group">
									<label class="form-label">견종</label>
									<select name="p_type" id="p_type" class="form-control">
										<option value="maltese" <c:if test="${a.p_type eq 'maltese'}">selected</c:if>>말티즈</option>
										<option value="poodle" <c:if test="${a.p_type eq 'poodle'}">selected</c:if>>푸들</option>
										<option value="shitzu" <c:if test="${a.p_type eq 'shitzu'}">selected</c:if>>시츄</option>
									</select>
								</div>
								
								<div class="form-group">
									<label class="form-label">생일</label>
									<input type="date" name="p_birth" id="p_birth" class="form-control" value="${a.p_birth}">
								</div>

								<div class="form-group">
									<div class="form-label">성별</div>
									<div class="custom-controls-stacked">
										<label class="custom-control custom-radio custom-control-inline">
											<input type="radio" class="custom-control-input" name="p_gender" id="p_gender" value="m_option"> <span class="custom-control-label">남자</span>
										</label>
										<label class="custom-control custom-radio custom-control-inline">
											<input type="radio" class="custom-control-input" name="p_gender" id="p_gender" value="w_option"> <span class="custom-control-label">여자</span>
										</label>
									</div>
								</div>

								<hr />
								<h4>추가정보</h4>
								<br>

								<div class="form-group">
									<label class="form-label">몸무게</label>
									<input type="number" name="p_weight" class="form-control" value="${a.p_weight}">
								</div>

								<div class="form-group">
									<div class="form-label">중성화</div>
									<div class="custom-controls-stacked">
										<label class="custom-control custom-radio custom-control-inline">
											<input type="radio" class="custom-control-input" name="p_status" value="y_option"> <span class="custom-control-label">Yes</span>
										</label>
										<label class="custom-control custom-radio custom-control-inline">
											<input type="radio" class="custom-control-input" name="p_status" value="n_option"> <span class="custom-control-label">No</span>
										</label>
									</div>
								</div>

								<div class="form-footer">
									<button type="button" class="btn btn-success btn-block" id="register_btn" onclick="checkValue()">반려견 정보 수정</button>
									<br>
									<button type="button" class="btn btn-danger pull-right" onclick="location.href='./petinfodelete?p_idx=${a.p_idx}' ">반려견 정보 삭제</button>

								</div>
							</div>
							<input type="hidden" name="p_idx" value="${a.p_idx}">
						</form>
					</div>
					<script>
						$(function() {
							var p_gender = '${a.p_gender}'
							console.log(p_gender);
							$(
									'input:radio[name=p_gender]:input[value='
											+ p_gender + ']').attr("checked",
									true);
						})
						$(function() {
							var p_status = '${a.p_status}'
							console.log(p_status);
							$(
									'input:radio[name=p_status]:input[value='
											+ p_status + ']').attr("checked",
									true);
						})
					</script>
				</c:forEach>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
	<script>
		var upload = $('#p_photo');

		$('#p_photo').on("change", function(e) {
			console.log('aaa');
			e.preventDefault();

			var file = this.files[0];
			reader = new FileReader();
			reader.onload = function(event) {
				var img = new Image();
				img.src = event.target.result;
				// note: no onload required since we've got the dataurl...I think! :)
				if (img.width > 150) { // holder width
					img.width = 150;
					img.height = 150;
				}
				holder.innerHTML = '';
				holder.appendChild(img);
			};
			reader.readAsDataURL(file);

			return false;
		});

		function checkValue() {

			if ($("#p_name").val() == "") {
				alert("이름을 입력하세요");
				return false;
			}

			if ($("#p_birth").val() == "") {
				alert("생일을 입력하세요");
				return false;
			}

			$("#registerform").submit();
		}
	</script>
</body>
</html>