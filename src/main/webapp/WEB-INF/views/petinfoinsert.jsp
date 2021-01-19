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
				<div class="col-lg-6">
					<form class="card" name="registerform" id="registerform" action="petinfoinsertsave" method="post" autocomplete="off" enctype="multipart/form-data">
						<div class="card-body">
							<div class="card-title center" style="font-weight: bold">반려견 등록</div>

							<div class="form-group">
								<label class="form-label">사진 업로드</label>
								<input type="file" name="p_photo" id="p_photo" accept=".jpg,.jpeg,.png,.gif">
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
								<input type="text" name="p_name" id="p_name" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-label">견종</label>
								<select name="p_type" id="p_type" class="form-control">
									<option value="maltese">말티즈</option>
									<option value="poodle">푸들</option>
									<option value="shitzu">시츄</option>
								</select>
							</div>
							<div class="form-group">
								<label class="form-label">생일</label>
								<input type="date" name="p_birth" id="p_birth" class="form-control">
							</div>
							<div class="form-group">
								<div class="form-label">성별</div>
								<div class="custom-controls-stacked">
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="p_gender" id="p_gender" value="m_option" checked> <span class="custom-control-label">남자</span>
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
								<input type="number" name="p_weight" id="p_weight" class="form-control" placeholder="kg 단위로 입력하세요">
							</div>
							<div class="form-group">
								<div class="form-label">중성화</div>
								<div class="custom-controls-stacked">
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="p_status" id="p_status" value="y_option"> <span class="custom-control-label">Yes</span>
									</label>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="p_status" id="p_status" value="n_option" checked> <span class="custom-control-label">No</span>
									</label>
								</div>
							</div>
							<div class="form-footer">
								<button type="button" class="btn btn-success btn-block" id="register_btn" onclick="checkValue()">반려견 정보 등록</button>
							</div>
						</div>
					</form>
				</div>
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
				if (img.width > 150 || img.height > 150) { // holder width
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