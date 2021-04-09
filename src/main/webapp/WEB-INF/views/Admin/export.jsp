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
    <!-- ============================================================== -->
    <!-- Wrapper -->
    <!-- ============================================================== -->
    <div id="wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
       <%@ include file="/WEB-INF/views/Admin/layout-ad/header.jsp"%>
<div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Export hóa đơn</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="#">Trang Chủ</a></li>
                            <li class="active">Export hóa đơn</li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row row-main">
                   
                    <div class="col-md-12 col-xs-12">
                        <div class="white-box">
                            <form class="form-horizontal form-material" modelAttribute="exportHoaDon" action="/Admin/exportHoaDon" method="post" >
                                <div class="form-group">
                                    <label class="col-md-12">Từ ngày</label>
                                    <div class="col-md-12">
                                        <input type="date" id="from" class="form-control form-control-line"  name="fromDate"> </div>
                                </div>
                                 <div class="form-group">
                                    <label class="col-md-12">Đến ngày</label>
                                    <div class="col-md-12">
                                        <input type="date"	 id="to" class="form-control form-control-line"  name="toDate"> </div>
                               	</div>
                               	<button type="submit" id="bt" class="btn">Export</button>
                            </form>
                                <script type="text/javascript">
		
		
                           
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
           
        </div>
       
    </div>
<script>
$("#bt").on('click', function () {

    var from = $('#from').val();
    var to= $('#to"]').val();
    console.log("test");
    if (from == "" || to== "") {
        alert('Error; until date or since date is missing.');

    }
});
</script>
    <!-- /#wrapper -->
        <%@ include file="/WEB-INF/views/Admin/layout-ad/include-js.jsp"%>
</body>

</html>
