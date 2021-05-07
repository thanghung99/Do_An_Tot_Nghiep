<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Blog</title>
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
			Đổi mật khẩu
		</h2>
	</section>


	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="col-md-12 col-xs-12">
                                    <div class="white-box">
                                       <form:form class="form-horizontal form-material" modelAttribute="DoiMK" action="/Admin/doiMK" method="post" >
                                                                       <div class="form-group">
                                                                           <label class="col-md-12">Tên tài khoản</label>
                                                                           <div class="col-md-12">
                                                                               <input type="text" placeholder="User Name" id="UserName" class="form-control form-control-line" name="userName" > </div>
                                                                       </div>

                                                                       <div class="form-group">
                                                                           <label class="col-md-12">Mật khẩu cũ </label>
                                                                           <div class="col-md-12">
                                                                               <input type="password" id="OldPassWord"  class="form-control form-control-line" name="passWord" > </div>
                                                                       </div>

                                                                      <div class="form-group">
                                                                           <label class="col-md-12">Mật khẩu mới</label>
                                                                           <div class="col-md-12">
                                                                               <input type="password" id="NewPassWord1" class="form-control form-control-line" name="newPassWord"> </div>
                                                                       </div>
                                                                       <div class="form-group">
                                                                           <label class="col-md-12">Nhập lại mật khẩu</label>
                                                                           <div class="col-md-12">
                                                                               <input type="password" id="NewPassWord2"  class="form-control form-control-line" name="confirmPassWord"></div>
                                                                       </div>
                                                                       <div class="form-group">
                                                                           <div class="col-sm-12">
                                                                               <button class="btn btn-success" type="button" onclick="Update.MatKhau();">Cập nhật</button>
                                                                           </div>
                                                                       </div>
                                                                        </form:form>
                                                                       <script type="text/javascript">

                                       		var Update = {
                                       				MatKhau : function() {
                                       				var UserName = $('#UserName').val();
                                       				var OldPassWord = $('#OldPassWord').val();
                                       				var NewPassWord1 = $('#NewPassWord1').val();
                                       				var NewPassWord2 = $('#NewPassWord2').val();

                                       			 	var dataSendToBackEnd = {};
                                       				dataSendToBackEnd["userName"] = UserName;
                                       				dataSendToBackEnd["passWord"] = OldPassWord;
                                       				dataSendToBackEnd["newPassWord"] = NewPassWord1;
                                       				dataSendToBackEnd["confirmPassWord"] = NewPassWord2;

                                       				 var jsonString = JSON.stringify(dataSendToBackEnd);

                                       				// call ajax
                                       				$.ajax({
                                       					url: "/api/DoiMK",
                                       					type: "post",
                                       					contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
                                       					data: JSON.stringify(dataSendToBackEnd), // object json -> string json

                                       					dataType: "json", // dữ liệu từ web-service trả về là json.
                                       					success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.

                                       						if(jsonResult.statusCode == 200) {
                                       							alert(jsonResult.data);


                                       						} else {
                                       							alert("Thất bại");
                                       						}
                                       					}
                                       				});

                                       			}
                                       		}

                                       	</script>



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