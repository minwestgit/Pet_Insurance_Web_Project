<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
<script src="./assets/js/vendors/jquery-3.2.1.min.js"></script>
<script src="./assets/js/require.min.js"></script>
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
</head>
<style>
.panel-group {
	margin-bottom: 0
}

.panel {
	border-radius: 0 box-shadow: none border-top: none margin-top: 0
}

.panel-heading {
	padding: 0
}

.panel-body {
	padding-top: 0
}

.panel-heading, .panel-collapse> ,list-group {
	border-top: none
}

.panel-heading, .panel-collapse> ,panel-body {
	border-top: none
}
</style>
</head>
<body class="">
	<div class="page">
		<div class="flex-fill">
			<%@ include file="header.jsp"%>
			<%@ include file="menu.jsp"%>
			<div class="my-3 my-md-5">

				<div class="container">
					<div class="row">
						<div class="col-12">
							<h2>
								자주묻는 질문과 답변
								<button onclick="main()" class="btn btn-outline-secondary">목록으로 돌아가기</button>
							</h2>
							<br>

							<!-- <div class="header collapse d-lg-flex p-0" id ="headerMenuCollapse"> -->
							<!-- <div class="container"> -->



							<!-- </div> -->
							<!-- </div> -->



							<div class="panel-group" id="accordion">
								<c:forEach var="item" items="${list}" varStatus="status">

									<div class="panel panel-default">
										<div class="panel-heading" id="heading${status.count}" role="tab" style="padding: 20px;">
											<h4 class="panel-title">
												<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${status.count}" aria-expanded="false" aria-controls="collapse${status.count}">
													${item.qeustion} <i class="pull-right fa fa-plus"></i>
												</a>
											</h4>
										</div>
										<div class="panel-collapse collapse" id="collapse${status.count}" role="tabpanel" aria-labelledby="heading${status.count}">
											<div class="panel-body" style="padding: 10px;">
												<p>${item.answer}</p>
											</div>
										</div>
									</div>

								</c:forEach>

							</div>

							<!-- pagination{s} -->
							<br>
							<div class="card-title" style="text-align: center;">
								총 <strong>${listCnt}</strong>건 <strong>${pageCnt}</strong>페이지 <br>
							</div>

							<div id="paginationBox" style="text-align: center;">
								<ul class="pagination" style="display: inline-block;">

									<c:if test="${pagination.prev}">

										<li class="page-item">
											<%--<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a> --%> <a class="page-link" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
										</li>
									</c:if>

									<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">

										<%--<c:forEach begin="1" end="5" var="idx"> --%>

										<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}')"> ${idx} </a> <%-- <a class="page-link" onClick="fn_pagination('${idx}', '${pagination.range}')"> ${idx} </a> --%></li>

									</c:forEach>

									<c:if test="${pagination.next}">

										<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a> <%-- <a class="page-link" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a> --%></li>

									</c:if>

								</ul>
							</div>

							<div style="text-align: center">

								<input type="text" id="search_data" placeholder="검색어 입력..." value="${search}">
								<button onclick="fn_search()" class="btn btn-success">검색</button>
								<%-- <button onclick="view('${pagination.page}', '${pagination.range}')" class="btn btn-success">검색</button> --%>

								<!-- pagination{e} -->

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
	<script>
		function fn_search() {
			if ($("#search_data").val() != "") {
				var url = "${pageContext.request.contextPath}/faq";
				url = url + "?page=" + 1;
				url = url + "&range=" + 1;
				url = url + "&search=" + $("#search_data").val();
				location.href = url;
			} else {
				alert("검색어를 입력해주세요.")
			}
		}
		function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "${pageContext.request.contextPath}/faq";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&search=" + $("#search_data").val();
			location.href = url;
		}
		function fn_pagination(page, range) {
			var url = "${pageContext.request.contextPath}/faq";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&search=" + $("#search_data").val();
			location.href = url;
		}
		function main() {
			var url = "${pageContext.request.contextPath}/faq";
			location.href = url;
		}
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "${pageContext.request.contextPath}/faq";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&search=" + $("#search_data").val();
			location.href = url;
		}
	</script>
</body>
</html>