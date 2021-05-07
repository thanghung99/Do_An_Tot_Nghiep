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
    <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
    <title>Ample Admin Template - The Ultimate Multipurpose admin template</title>
     <%@ include file="/WEB-INF/views/Admin/layout-ad/include-css.jsp"%>
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
    <div id="wrapper">
  <%@ include file="/WEB-INF/views/Admin/layout-ad/header.jsp"%>
  <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Danh sách sản phẩm</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="#">Trang chủ</a></li>
                            <li class="active">Sản phẩm</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title">Danh sách sản phẩm</h3>


                        <button class="add">
                                           <i class="fa fa-plus-square"></i>  <a href="/Admin/addSanPham" >  Thêm sản phẩm</a> </button> 


                            <!-- <p class="text-muted">Add class <code>.table</code></p> -->
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Giá</th>
                                            <th>Khuyến mại</th>
                                            <th>Loại sản phẩm </th>
                                            <th>Hãng sản xuất</th>
                                            <th>Mô tả</th>
                                            <th>Lượt xem</th>
                                            <th>Lượt Mua</th>
                                            <th>Chất liệu</th>
                                            <th>ảnh1</th>
                                            <th>ảnh2</th>
                                            <th>ảnh3</th>
                                            <th>ảnh4</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${ListSanPham}" var="sanpham">
                                        <tr>
                                            <td>${sanpham.id}</td>
                                            <td>${sanpham.tenSP}</td>
                                            <td>${sanpham.gia}</td>
                                             <td>${sanpham.khuyenMai}</td>
                                            <td>${sanpham.getTheloai().getTenTheLoai()}</td>
                                            <td>${sanpham.getHangsx().getTenHang()}</td>
                                            <td>${sanpham.moTa}</td>
                                            <td>${sanpham.luotXem}</td>
                                            <td>${sanpham.luotMua}</td>
                                            
                                         	<td>${sanpham.chatlieu}</td>
                                         	<td>${sanpham.anh1}</td>
                                         	<td>${sanpham.anh2}</td>
                                         	<td>${sanpham.anh3}</td>
                                         	<td>${sanpham.anh4}</td>

                                         	
                                            
                                            <td>
                                            <div class="table-data-feature">
                                                
                                                     <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
			                                            <a href="/Admin/UpdateSanPham/${sanpham.id}" >
                                                            <i class="fa fa-edit"></i></i></a>
                                                        </button>
                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                                                           <a href="/Admin/XoaSanPham${sanpham.id}" ><i class="fa fa-trash"></i></a>
                                                        </button>
                                                       
                                                    </div>
                                             </td>
                                        </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
<!-- Pagination -->
                               <div class="clearfix"  style="padding: 20px 169px;">
                               <a class="btn btn-primary float-left" href="/Admin/SanPham?page=${currentPage - 1 }">Quay lại</a>
                              <a class="btn btn-primary float-right" href="/Admin/SanPham?page=${currentPage + 1 }" style="float: right;">Trang Tiếp</a>
                              </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
           
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
       <%@ include file="/WEB-INF/views/Admin/layout-ad/include-js.jsp"%>
</body>

</html>
