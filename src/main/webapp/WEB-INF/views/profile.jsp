<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
					<c:choose>
						<c:when test="${not empty sessionScope.user}">
							<div class="page-header">
								<h1 class="page-title">프로필</h1>
							</div>
							<div class="row">
								<div class="col-lg-3 order-lg-1 mb-4">
									<!-- Components -->
									<div class="list-group list-group-transparent mb-0">
										<a href="profile" class="list-group-item list-group-item-action active">
											<span class="icon mr-3"><i class="fe fe-user"></i></span>회원정보 수정
										</a>

										<a href="empty" class="list-group-item list-group-item-action ">
											<span class="icon mr-3"><i class="fe fe-bar-chart-2"></i></span>기타 정보
										</a>
										<a href="delete" class="list-group-item list-group-item-action">
											<span class="icon mr-3"><i class="fe fe-user-x"></i></span>계정 탈퇴
										</a>
									</div>
								</div>

								<div class="col-9">
									<div class="card">
										<div class="card-header">
											<div class="card-status bg-green"></div>
											<h3 class="card-title">회원정보 수정</h3>
										</div>
										<div class="card-body">
											<form:form id="updateform" name="updateform" class="card" modelAttribute="true" action="updateProcess" method="post" autocomplete="off">
												<div class="card-body">
													<div class="card-title center">회원 정보</div>
													<div class="row">
														<div class="col-auto">
															<span class="avatar avatar-xl" style="background-image: url(./demo/photos/basicprofile.png)"></span>
														</div>
														<div class="col">
															<div class="form-group">
																<label class="form-label">아이디</label>
																<input type="text" name="c_id" id="c_id" class="form-control" placeholder="아이디" value='<c:out value="${sessionScope.user.c_id}"></c:out>' readonly="readonly">
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="form-label">가입날짜</label>
														<input type="text" name="c_joindate" id="c_joindate" class="form-control" placeholder="가입날짜" value='<c:out value="${sessionScope.user.c_joindate}"></c:out>' readonly="readonly">
													</div>
													<div class="form-group">
														<label class="form-label">패스워드 </label>
														<input type="password" name="c_pw" id="c_pw" class="form-control" placeholder="패스워드" value='<c:out value="${sessionScope.user.c_pw}"></c:out>'>
													</div>
													<div class="form-group">
														<label class="form-label">패스워드 확인 </label>
														<input type="password" name="c_pw_check" id="c_pw_check" class="form-control" placeholder="패스워드 확인" value='<c:out value="${sessionScope.user.c_pw}"></c:out>'>
														<div class="alert alert-success" id="alert-success" style="display: none;">비밀번호가 일치합니다.</div>
														<div class="alert alert-danger" id="alert-danger" style="display: none;">비밀번호가 일치하지 않습니다.</div>
													</div>
													<div class="form-group">
														<label class="form-label">이름</label>
														<input type="text" name="c_name" id="c_name" class="form-control" placeholder="이름" value='<c:out value="${sessionScope.user.c_name}"></c:out>'>
													</div>

													<div class="form-group">
														<label class="form-label">주민등록번호</label>
														<input type="text" name="c_pid" id="c_pid" class="form-control" value='<c:out value="${sessionScope.user.c_pid}"></c:out>' data-mask="000000-0000000" data-mask-clearifnotmatch="true" placeholder="000000-0000000" autocomplete="off" maxlength="14">
													</div>
													<div class="form-group">
														<div class="form-label">성별</div>
														<div id="c_gender" class="custom-controls-stacked">
															<label class="custom-control custom-radio custom-control-inline">
																<input type="radio" name="c_gender" id="c_gender1" class="custom-control-input" value="male"> <span class="custom-control-label">남자</span>
															</label>
															<label class="custom-control custom-radio custom-control-inline">
																<input type="radio" name="c_gender" id="c_gender2" class="custom-control-input" value="female"> <span class="custom-control-label">여자</span>
															</label>
														</div>
													</div>
													<div class="form-group">
														<label class="form-label">연락처</label>
														<input name="c_phone" id="c_phone" type="text" class="form-control" value='<c:out value="${sessionScope.user.c_phone}"></c:out>' data-mask="000-0000-0000" data-mask-clearifnotmatch="true" placeholder="000-0000-0000" autocomplete="off" maxlength="13">
													</div>
													<div class="form-group">
														<label class="form-label">주소</label>
														<div class="form-group">
															<input name="c_zipcode" id="c_zipcode" class="form-control" value='<c:out value="${sessionScope.user.c_zipcode}"></c:out>' style="width: 40%; display: inline;" placeholder="우편번호" type="text" readonly="readonly">
															<button type="button" class="btn btn-default" onclick="execPostCode();">
																<i class="fa fa-search"></i> 우편번호 찾기
															</button>
														</div>
														<div class="form-group">
															<input class="form-control" value='<c:out value="${sessionScope.user.c_road}"></c:out>' style="top: 5px;" placeholder="도로명 주소" name="c_road" id="c_road" type="text" readonly="readonly" />
														</div>
														<div class="form-group">
															<input class="form-control" value='<c:out value="${sessionScope.user.c_detail}"></c:out>' placeholder="상세주소" name="c_detail" id="c_detail" type="text" />
														</div>

													</div>
													<div class="form-group">
														<label class="form-label">이메일</label>
														<input name="c_email" id="c_email" value='<c:out value="${sessionScope.user.c_email}"></c:out>' class="form-control" placeholder="email@domain.com">
													</div>
													<div class="form-group">
														<label class="form-label">체크사항</label>
														<label class="custom-switch">
															<input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"> <span class="custom-switch-indicator"></span> <span class="custom-switch-description">DB손해보험 가입여부</span>
														</label>
													</div>
													<div class="form-footer">
														<button type="button" id="update_btn" class="btn btn-success btn-block">회원 정보 변경</button>
													</div>
												</div>
											</form:form>
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
		<%@ include file="footer.jsp"%>
	</div>
	<script type="text/javascript">
		$(function() {
			var c_gender = '${sessionScope.user.c_gender}'
			console.log(c_gender);
			$('input:radio[name=c_gender]:input[value=' + c_gender + ']').attr(
					"checked", true);
		})

		$(function() {
			var result = '${alertmsg}';
			var updateok = "회원정보 수정에 성공했습니다.";
			var updatefail = "업데이트 fail";
			if (result == updateok) {
				alert(updateok);
			} else if (result == updatefail) {
				alert(updatefail);
			}

		})

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

		$("#update_btn").click(function() {
			$("#updateform").submit();
		});
	</script>
</body>
</html>