﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
     <%@ include file="/WEB-INF/views/Admin/layout-ad/include-css.jsp"%>
  
        
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
                        <h4 class="page-title">Thêm Sản Phẩm</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="#">Trang Chủ</a></li>
                            <li class="active">Thêm Sản Phẩm</li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row row-main">
                   
                    <div class="col-md-12 col-xs-12">
                        <div class="white-box">
                            <form class="form-horizontal form-material" action="/Admin/UpdateSanPham/${HangSX.id}" method="post" modelAttribute="updateSanPham" enctype="multipart/form-data">
                                 <div class="form-group">
                                    <label class="col-md-12">Tên Sản Phẩm</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Johnathan Doe" class="form-control form-control-line"> </div>
                                </div>
                                 <div class="form-group">
                                    <label class="col-md-12">Giá</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Johnathan Doe" class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Thể loại</label>
                                    <div class="col-md-12">
                                         <select class="form-control form-control-line" path="category.id">
                                           <option>Danh sách 01</option>
                                                <option>Danh sách 02</option>
                                                <option>Danh sách 03</option>
                                                <option>Danh sách 04</option>
                                        <select>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label class="col-md-12">Tên Hãng</label>
                                    <div class="col-md-12">
                                         <select class="form-control form-control-line" path="category.id">
                                           <option>Danh sách 01</option>
                                                <option>Danh sách 02</option>
                                                <option>Danh sách 03</option>
                                                <option>Danh sách 04</option>
                                        <select>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label class="col-md-12">Mô tả</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Johnathan Doe" class="form-control form-control-line"> </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-md-12">Chất liệu</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Johnathan Doe" class="form-control form-control-line"> </div>
                                </div>
                                 <div class="form-group">
                                    <label class="col-md-12">Ảnh 1</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Johnathan Doe" class="form-control form-control-line"> </div>
                                </div>
                                 <div class="form-group">
                                    <label class="col-md-12">Ảnh 2</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Johnathan Doe" class="form-control form-control-line"> </div>
                                </div>
                                 <div class="form-group">
                                    <label class="col-md-12">Ảnh 3</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Johnathan Doe" class="form-control form-control-line"> </div>
                                </div>
                                 <div class="form-group">
                                    <label class="col-md-12">Ảnh 4</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Johnathan Doe" class="form-control form-control-line"> </div>
                                </div> <div class="form-group">
                                    <label class="col-md-12">status</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Johnathan Doe" class="form-control form-control-line"> </div>
                              
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button class="btn btn-success">Thêm</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
           
        </div>
       
    </div>
    <!-- /#wrapper -->
  <%@ include file="/WEB-INF/views/Admin/update/layout-update/include-js.jsp"%>
</body>

</html>
