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
<!-- map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=888171e314154a5c9587dcd1171502d7&libraries=LIBRARY"></script>
<script>
	var positions = [];
	var markers = [];

	$(function draw() {
		mapContainer = document.getElementById('map'), // 지도의 중심좌표
		mapOption = {
			center : new kakao.maps.LatLng(37.5665591, 126.9583245), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};
		map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// panTo()
	})

	function setMarkers(map) {
		/* if(map != null){ */
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
		}
		/*         }
		}else if(map == null){
		        alert("검색결과가 없습니다. 다시 입력하세요.")
		        
		} */
	}

	function makeMap() {
		for (var i = 0; i < positions.length; i++) {
			marker = new kakao.maps.Marker({
				/* map: map, */
				position : positions[i].latlng,
			/* clickable: true */
			})
			markers.push(marker)
			/* marker.setMap(map) */
			setMarkers(map)
			var infowindow = new kakao.maps.InfoWindow({
				position : positions[i].latlng,
				content : '<div style="padding:15px; padding-bottom: 30px">'
						+ '<div style="font-size: 9pt; text-align: left">'
						+ "병원명: " + positions[i].name + '</div>'
						+ '<div style="font-size: 8pt; text-align: left">'
						+ "주　소: " + positions[i].address + '</div>'
						+ '<div style="font-size: 9pt; text-align: left">'
						+ "연락처: " + positions[i].phone + '</div>' + '</div>'

			});
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}
	}

	function recvSearch(data) {
		$.each(data.main, function(i, v) {
			/* console.log(data.main.h) */
			var position = {
				name : v.h_name,
				address : v.h_address,
				phone : v.h_phone,
				selected : v.h_selected,
				latlng : new kakao.maps.LatLng(v.h_long, v.h_lat)
			}
			$("#calctable").append(
					"<tr>" + "<td>" + "병원명:　" + v.h_name + "<br>" + "주　소:　"
							+ v.h_address + "<br>" + "연락처:　" + v.h_phone
							+ "<br>" + "<td>" + "</tr>")
			positions.push(position)
			console.log(position)
		})

		if (data.avg[0].avg_long != null && data.avg[0].avg_lat != null) {
			var moveLatLon = new kakao.maps.LatLng(data.avg[0].avg_long,
					data.avg[0].avg_lat);
			map.panTo(moveLatLon);
			makeMap()
		} else {
			alert("검색 결과가 없습니다. 다시 입력하세요.")
		}
	}

	function makeOverListener(map, marker, infowindow) {
		return function() {
			infowindow.open(map, marker);
		};
	}

	function makeOutListener(infowindow) {
		return function() {
			infowindow.close();
		};
	}

	function search() {

		setMarkers(null)
		positions = [];
		markers = [];

		$('#calctable').empty();
		/* alert($('#check').is(":checked")) */

		checkdata = 0;
		if ($('#check').is(":checked"))
			checkdata = 1;

		/* $.getJSON("search?search=" + $("#search_data").val(), recvSearch) */

		$.getJSON("search?search=" + $("#search_data").val() + "&check="
				+ checkdata, recvSearch)
	}
</script>
</head>
<body class="">
	<div class="page">
		<div class="flex-fill">
			<%@ include file="header.jsp"%>
			<%@ include file="menu.jsp"%>
			<div class="my-3 my-md-5">
				<div class="container">
					<div class="row row-cards">
						<div class="col-lg-4 col-md-6">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">병원 리스트</h3>
								</div>
								<div class="card-body">
									<div class="overflow-auto" style="weight: 300px; height: 700px;">
										<div class="table-responsive">
											<table id="calctable" class="table card-table table-striped">
												<tbody>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-8 col-md-6">
							<div class="card" style="height: 810px;">
								<div class="card-header">
									<div class="col-lg-1 col-xl-6"></div>
									<div style="display: inline-block; text-align: right">
										<input name="color" type="checkbox" id="check" value="true">지정병원 검색 <input type="text" id="search_data" placeholder="주소를 입력하세요...">
										<button onclick="search()" class="btn btn-success">검색</button>

									</div>
								</div>
								<div class="card-body" style="text-align: center; width: 100%; height: 100%;">
									<div class="map" style="height: 700px;">
										<div class="map-content">
											<div class="jvectormap-container" style="background-color: transparent;">
												<div id="map" style="width: 100%; height: 100%;"></div>
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
	</div>
</body>
</html>