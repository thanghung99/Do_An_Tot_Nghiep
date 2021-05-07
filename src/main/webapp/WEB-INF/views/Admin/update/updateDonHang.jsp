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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ include file="/WEB-INF/views/Admin/add/layout-add/inlude-css.jsp"%>

    </style>
</head>

<body class="fix-header">
    <!-- ============================================================== -->
    <!-- Preloader -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Wrapper -->
    <!-- ============================================================== -->
     <%@ include file="/WEB-INF/views/Admin/layout-ad/header.jsp"%>
   <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Cập nhật đơn hàng</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="#">Trang Chủ</a></li>
                            <li class="active">Cập nhật đơn hàng</li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row row-main">

                    <div class="col-md-12 col-xs-12">
                        <div class="white-box">
                            <form:form class="form-horizontal form-material" action="/Admin/UpdateMuaHang${DonHang.id}" method="post" modelAttribute="status">
                                 <div class="form-group">
                                    <label class="col-md-12">Tên Sản Phẩm</label>
                                    <div class="col-md-12">
                                        <input type="text" value="${DonHang.muaHang_sanpham.tenSP}" class="form-control form-control-line" disabled> </div>
                                </div>
                                 <div class="form-group">
                                   <label class="col-md-12">Số lượng</label>
                                   <div class="col-md-12">
                                    <input type="text" value="${DonHang.soLuong}" class="form-control form-control-line" disabled > </div>
                                 </div>
                                 <div class="form-group">
                                  <label class="col-md-12">Size</label>
                                   <div class="col-md-12">
                                   <input type="text" value="${DonHang.size}" class="form-control form-control-line"disabled > </div>
                                 </div>
                                 <div class="form-group">
                                   <label class="col-md-12">Địa chỉ nhận</label>
                                      <div class="col-md-12">
                                       <input type="text" value="${DonHang.muaHang_giohang.diaChiNhan}" class="form-control form-control-line" disabled> </div>
                                 </div>
                                 <div class="form-group">
                                   <label class="col-md-12">Người nhận</label>
                                     <div class="col-md-12">
                                       <input type="text" value="${DonHang.muaHang_giohang.nguoiNhan}" class="form-control form-control-line" disabled > </div>
                                  </div>
                                 <div class="form-group">
                                    <label class="col-md-12">SĐT</label>
                                       <div class="col-md-12">
                                          <input type="text" value="${DonHang.muaHang_giohang.sdtNhan}" class="form-control form-control-line" disabled> </div>
                                 </div>
                                 <div class="form-group">
                                   <label class="col-md-12">Status</label>

                                 <div class="form-check form-check-inline">
                                    <c:if test = "${DonHang.status ==1 }">
                                   <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="1" checked>
                                   </c:if>
                                   <c:if test = "${DonHang.status !=1 }">
                                     <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="1">
                                   </c:if>
                                   <label class="form-check-label" for="inlineRadio1">Đang xử lí</label>
                                 </div>
                                 <div class="form-check form-check-inline">
                                  <c:if test = "${DonHang.status == 2 }">
                                   <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="2" checked>
                                   </c:if>
                                    <c:if test = "${DonHang.status !=2 }">
                                      <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="2">
                                   </c:if>
                                   <label class="form-check-label" for="inlineRadio2" >Đang tiếp nhận</label>
                                 </div>
                                  <div class="form-check form-check-inline">
                                   <c:if test = "${DonHang.status == 3 }">
                                    <input class="form-check-input" type="radio" name="status" id="inlineRadio3" value="3" checked>
                                    </c:if>
                                     <c:if test = "${DonHang.status != 3 }">
                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio3" value="3" >
                                      </c:if>
                                    <label class="form-check-label" for="inlineRadio3">Đang giao</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                  <c:if test = "${DonHang.status == 4 }">
                                     <input class="form-check-input" type="radio" name="status" id="inlineRadio4" value="4" checked>
                                   </c:if>
                                  <c:if test = "${DonHang.status != 4 }">
                                    <input class="form-check-input" type="radio" name="status" id="inlineRadio4" value="4" >
                                   </c:if>
                                      <label class="form-check-label" for="inlineRadio4 ">Đã giao</label>
                                  </div>
                                    </div>
                                     <div class="form-group">
                                      <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Cập nhật</button>
                                      </div>
                                    </div>
                            </form:form>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->

        </div>

    </div>
    <!-- /#wrapper -->
   <%@ include file="/WEB-INF/views/Admin/add/layout-add/include-js.jsp"%>

    <script type="text/javascript">

	 	// ::: for richtext editor
		$(document).ready(function() {
		  $('#moTa').summernote("code", "${SanPham.moTa}");
		});

    </script>
</body>

</html>
