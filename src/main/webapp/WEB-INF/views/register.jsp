<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- tag-libs -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V3</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="/login/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100">
				<form:form method="post" action="/api/Register" class="login100-form validate-form">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						????NG K??
					</span>
					<div class="wrap-input100 validate-input" data-validate = "Nh???p username">
						<input class="input100" type="text"  placeholder="H??? V?? T??n"  id="tenND">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Nh???p ?????a ch???">
						<input class="input100" type="text"  placeholder="?????a CH???"   id="diaChi">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "nh???p sdt">
						<input class="input100" type="text" placeholder="S??? ??i???n Tho???i"  id="sdt"/>
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Nh???p email">
						<input class="input100" type="email"placeholder="Email"  id="email"/>
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" placeholder="Username"  id="userName"/>
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password"  placeholder="Password"  id="passWord"/>
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Enter Confirm password">
						<input class="input100" type="password"  placeholder="Confirm password"  id="confirmPassWord"/>
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					<!-- <div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
						<label class="label-checkbox100" for="ckb1">
							Remember me
						</label>
					</div> -->

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="Register.Account();">
							????ng k??
						</button>
						<button class="login100-form-btn"style="margin-left: 60px;">
                        	<a href="/">H???y b???</a>
                        </button>
					</div>

					<!-- <div class="text-center p-t-90">
						<a class="txt1" href="#">
							Forgot Password?
						</a>
					</div> -->
				</form:form>
			</div>
		</div>
	</div>
	   <script type="text/javascript">
		
		var Register = {
				Account : function() {	
				var tenND = $('#tenND').val();
				var diaChi = $('#diaChi').val();
				var sdt = $('#sdt').val();
				var email = $('#email').val();
				var userName = $('#userName').val();
				var passWord = $('#passWord').val();
				var confirmPassWord = $('#confirmPassWord').val();
				
			 	var dataSendToBackEnd = {};
				dataSendToBackEnd["tenND"] = tenND;
				dataSendToBackEnd["diaChi"] = diaChi;
				dataSendToBackEnd["sdt"] = sdt;
				dataSendToBackEnd["email"] = email;
				dataSendToBackEnd["userName"] = userName;
				dataSendToBackEnd["passWord"] = passWord;
				dataSendToBackEnd["confirmPassWord"] = confirmPassWord;
				
				 var jsonString = JSON.stringify(dataSendToBackEnd); 
				
				// call ajax
				$.ajax({
					url: "/api/Register",
					type: "post",
					contentType: "application/json", // d??? li???u g???i l??n web-service c?? d???ng l?? json.
					data: JSON.stringify(dataSendToBackEnd), // object json -> string json
					
					dataType: "json", // d??? li???u t??? web-service tr??? v??? l?? json.
					success: function(jsonResult) { // ???????c g???i khi web-service tr??? v??? d??? li???u.
	
						if(jsonResult.statusCode == 200) {
							alert(jsonResult.data);
							
							
						} else {
							alert("Th???t b???i");
						}
					}
				});
								
			}				
		}
	
	</script>

	
	
<!--===============================================================================================-->
	<script src="/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/login/vendor/bootstrap/js/popper.js"></script>
	<script src="/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/login/js/main.js"></script>

</body>
</html>