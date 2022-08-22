<%--
  Created by IntelliJ IDEA.
  User: Dour-Andish
  Date: 8/3/2020
  Time: 1:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cfn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<spring:url var="slick" value="/resources/slick" />
<spring:url var="bootstrapJs" value="/resources/bootstrap/js" />
<spring:url var="bootstrapCss" value="/resources/bootstrap/css" />
<spring:url var="owlcarouselCss" value="/resources/owlcarousel/css" />
<spring:url var="owlcarouselJs" value="/resources/owlcarousel/js" />


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="Anilz" name="author">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Shopwise is Powerful features and You Can Use The Perfect Build this Template For Any eCommerce Website. The template is built for sell Fashion Products, Shoes, Bags, Cosmetics, Clothes, Sunglasses, Furniture, Kids Products, Electronics, Stationery Products and Sporting Goods.">
    <meta name="keywords" content="ecommerce, electronics store, Fashion store, furniture store,  bootstrap 4, clean, minimal, modern, online store, responsive, retail, shopping, ecommerce store">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <!-- SITE TITLE -->
    <title>tools Shop - ${title}</title>
    <!-- Favicon Icon -->
    <link rel="shortcut icon" type="image/x-icon" href="${images}/favicon.png">
    <!-- Animation CSS -->
    <link rel="stylesheet" href="${css}/animate.css">
    <!-- Latest Bootstrap min CSS -->
    <link rel="stylesheet" href="${bootstrapCss}/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="${css}/all.min.css">
    <link rel="stylesheet" href="${css}/ionicons.min.css">
    <link rel="stylesheet" href="${css}/themify-icons.css">
    <link rel="stylesheet" href="${css}/linearicons.css">
    <link rel="stylesheet" href="${css}/flaticon.css">
    <link rel="stylesheet" href="${css}/simple-line-icons.css">
    <!-- Bootstrap DataTables -->
    <link href="${css}/dataTables.bootstrap4.css" rel="stylesheet">
    <!--- owl carousel CSS-->
    <link rel="stylesheet" href="${owlcarouselCss}/owl.carousel.min.css">
    <link rel="stylesheet" href="${owlcarouselCss}/owl.theme.css">
    <link rel="stylesheet" href="${owlcarouselCss}/owl.theme.default.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="${css}/magnific-popup.css">
    <!-- Slick CSS -->
    <link rel="stylesheet" href="${css}/slick.css">
    <link rel="stylesheet" href="${css}/slick-theme.css">
    <!-- jQuery rateYo-->
    <link rel="stylesheet" href="${css}/jquery.rateyo.min.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="${css}/style.css">
    <link rel="stylesheet" href="${css}/responsive.css">
    <!-- RTL CSS -->
    <link rel="stylesheet" href="${css}/rtl-style.css">
    <link rel="stylesheet" href="${css}/myapp.css">
    <script>
        window.menu = '${title}';

        window.contextRoot = '${contextRoot}'

    </script>

</head>

<body dir="rtl">

<!-- LOADER -->
<div class="preloader">
    <div class="lds-ellipsis">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<!-- END LOADER -->

<!-- Home Popup Section -->
<%--<div class="modal fade subscribe_popup" id="onload-popup" tabindex="-1" role="dialog" aria-hidden="true">--%>
<%--    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-body">--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true"><i class="ion-ios-close-empty"></i></span>--%>
<%--                </button>--%>
<%--                <div class="row no-gutters">--%>
<%--                    <div class="col-sm-7">--%>
<%--                        <div class="popup_content text-left">--%>
<%--                            <div class="popup-text">--%>
<%--                                <div class="heading_s1">--%>
<%--                                    <h3>اشتراک در خبرنامه ما و دریافت 25٪ تخفیف!</h3>--%>
<%--                                </div>--%>
<%--                                <p>برای دریافت به روزرسانی ها و اخبار در مورد محصولات جدید ، در خبرنامه مشترک شوید.</p>--%>
<%--                            </div>--%>
<%--                            <form method="post">--%>
<%--                                <div class="form-group">--%>
<%--                                    <input name="email" required type="email" class="form-control" placeholder="ایمیل خود را وارد کنید">--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <button class="btn btn-fill-out btn-block text-uppercase" title="اشتراک" type="submit">اشتراک</button>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                            <div class="chek-form">--%>
<%--                                <div class="custome-checkbox">--%>
<%--                                    <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox3" value="">--%>
<%--                                    <label class="form-check-label" for="exampleCheckbox3"><span>این پنجره را دوباره نشان ندهید!</span></label>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-sm-5">--%>
<%--                        <div class="background_bg h-100" data-img-src="assets/images/popup_img3.jpg"></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- End Screen Load Popup Section -->
<c:if test="${userClickShowCart == true}">
    <%@include file="./shared/justNavbar.jsp"%>
    <%@include file="cart.jsp"%>
</c:if>

<c:if test="${userSearchedProducts == true}">
    <%@include file="./shared/justNavbar.jsp"%>
    <%@include file="shopList.jsp"%>
</c:if>

<c:if test="${userClickShowProduct == true}">
    <%@include file="./shared/justNavbar.jsp"%>
    <%@include file="singleProduct.jsp"%>
</c:if>
<!-- START HEADER -->

<!-- END HEADER -->

<!-- START MAIN CONTENT -->
<c:if test="${userClickHome == true }">
    <%@include file="./shared/header.jsp"%>
    <%@include file="home.jsp"%>

</c:if>
<!-- Load only when user clicks manage product -->
<c:if test="${userClickManageProduct == true}">
    <%@include file="./shared/header.jsp"%>
    <%@include file="manageProduct.jsp"%>
</c:if>

<!-- Load only when admin clicks dashboard -->
<c:if test="${userClickAdminDashboard == true}">
    <%@include file="./shared/header.jsp"%>
    <%@include file="adminDashboard.jsp"%>
</c:if>
<!-- Load only when user clicks dashboard -->
<c:if test="${userClickUserAccount == true}">
    <%@include file="./shared/header.jsp"%>
    <%@include file="userDashboard.jsp"%>
</c:if>

<!-- Load only when user clicks contact -->
<c:if test="${userClickAllProducts == true or userClickCategoryProducts == true or userClickSubCategoryProducts==true or userClickBrandProducts == true}">
    <%@include file="./shared/header.jsp"%>
    <%@include file="listProducts.jsp"%>
</c:if>

<c:if test="${userClickAbout == true}">
    <%@include file="./shared/header.jsp"%>
    <%@include file="about.jsp"%>
</c:if>

<c:if test="${userClickContact == true}">
    <%@include file="./shared/header.jsp"%>
    <%@include file="contact.jsp"%>
</c:if>
<c:if test="${userError == true}">
    <%@include file="./shared/header.jsp"%>
    <%@include file="error.jsp"%>
</c:if>

<!-- END MAIN CONTENT -->

<!-- START FOOTER -->
<!-- START SECTION SUBSCRIBE NEWSLETTER -->
<%@include file="./shared/footer.jsp"%>
<!-- END FOOTER -->

<a href="#" class="scrollup" style="display: none;"><i class="ion-ios-arrow-up"></i></a>

<!-- Latest jQuery -->
<script src="${js}/jquery-1.12.4.min.js"></script>
<!-- jQuery.validate -->
<script src="${js}/jquery.validate.js" ></script>
<!-- popper min js -->
<script src="${js}/popper.min.js"></script>
<!-- Latest compiled and minified Bootstrap -->
<script src="${bootstrapJs}/bootstrap.min.js"></script>
<!-- owl-carousel min js  -->
<script src="${owlcarouselJs}/owl.carousel.min.js" ></script>
<!-- magnific-popup min js  -->
<script src="${js}/magnific-popup.min.js"></script>
<!-- waypoints min js  -->
<script src="${js}/waypoints.min.js"></script>
<!-- parallax js  -->
<script src="${js}/parallax.js"></script>
<!-- countdown js  -->
<script src="${js}/jquery.countdown.min.js"></script>
<!-- imagesloaded js -->
<script src="${js}/imagesloaded.pkgd.min.js"></script>
<!-- isotope min js -->
<script src="${js}/isotope.min.js"></script>
<!-- jquery.dd.min js -->
<script src="${js}/jquery.dd.min.js"></script>
<!-- DataTable Plugin -->
<script src="${js}/jquery.dataTables.js"></script>
<!-- DataTable Bootstrap Script -->
<script src="${js}/dataTables.bootstrap4.js"></script>
<!-- DataTable Bootstrap Script -->
<script src="${js}/bootbox.min.js"></script>
<!-- jQuery rateYo Script -->
<script src="${js}/jquery.rateyo.min.js"></script>
<!-- slick js -->
<script src="${js}/slick.min.js"></script>
<!-- elevatezoom js -->
<script src="${js}/jquery.elevatezoom.js"></script>
<!-- scripts js -->
<script src="${js}/scripts.js"></script>
<!-- DataTable Bootstrap Script -->
<script src="${js}/myapp.js"></script>

</body>
</html>