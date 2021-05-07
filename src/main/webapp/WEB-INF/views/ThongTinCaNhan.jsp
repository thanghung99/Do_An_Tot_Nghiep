<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Thông tin cá nhân</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>

	<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
<script type="text/javascript" src="vendor/jquery/jquery-3.4.1.min.js"></script>

 <%@ include file="/WEB-INF/views/layout/include-css.jsp"%>
<!--===============================================================================================-->
</head>
<body class="animsition">

	  <%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Thông tin cá nhân
		</h2>
	</section>


	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="col-md-12 col-xs-12">
                                    <div class="white-box">
                                        <form class="form-horizontal form-material" modelAttribute="infor" action="/ThongTinCaNhan" method="post" >
                                            <div class="form-group">
                                                <label class="col-md-12">Tên Người Dùng</label>
                                                <div class="col-md-12">
                                                    <input type="text"	value="${ThongTinCaNhan.tenND}"  class="form-control form-control-line"  name="tenND"> </div>
                                            </div>
                                             <div class="form-group">
                                                <label class="col-md-12">Địa CHỉ</label>
                                                <div class="col-md-12">
                                                    <input type="text"	value="${ThongTinCaNhan.diaChi}"  class="form-control form-control-line"  name="diaChi"> </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="col-md-12">SỐ điện thoại</label>
                                                <div class="col-md-12">
                                                    <input type="text"	value="${ThongTinCaNhan.sdt}"  class="form-control form-control-line"  name="sdt"> </div>
                                            </div>
                                              <div class="form-group">
                                                <label class="col-md-12">email</label>
                                                <div class="col-md-12">
                                                    <input type="email"	value="${ThongTinCaNhan.email}"  class="form-control form-control-line"  name="email"> </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <button class="btn btn-success" type="submit" >Lưu</button>
                                                </div>
                                            </div>
                                             </form>
                                            <script type="text/javascript">



                                    </div>
                                </div>
		</div>
	</section>


	<!-- Map -->
	<div class="map">
		<div class="size-303" id="google_map" data-map-x="40.691446" data-map-y="-73.886787" data-pin="images/icons/pin.png" data-scrollwhell="0" data-draggable="1" data-zoom="11"></div>
	</div>


<!-- Foooter -->
  <%@ include file="/WEB-INF/views/layout/footer.jsp"%>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<!--===============================================================================================-->
  <%@ include file="/WEB-INF/views/layout/include-js.jsp"%>

</body>
</html>