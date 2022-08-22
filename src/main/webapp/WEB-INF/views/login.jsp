<%--
  Created by IntelliJ IDEA.
  User: Dour-Andish
  Date: 8/6/2020
  Time: 12:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<html>
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="Anil z" name="author">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Shopwise is Powerful features and You Can Use The Perfect Build this Template For Any eCommerce Website. The template is built for sell Fashion Products, Shoes, Bags, Cosmetics, Clothes, Sunglasses, Furniture, Kids Products, Electronics, Stationery Products and Sporting Goods.">
    <meta name="keywords" content="ecommerce, electronics store, Fashion store, furniture store,  bootstrap 4, clean, minimal, modern, online store, responsive, retail, shopping, ecommerce store">
    <title>Online Shopping - ${title}</title>

    <!-- SITE TITLE -->
    <title>Shopwise - eCommerce Bootstrap 4 HTML Template</title>
    <!-- Favicon Icon -->
    <link rel="shortcut icon" type="image/x-icon" href="${images}/favicon.png">
    <!-- Animation CSS -->
    <link rel="stylesheet" href="${css}/animate.css">
    <!-- Latest Bootstrap min CSS -->
    <link rel="stylesheet"  href="${bootstrapCss}/bootstrap.min.css">
    <!-- Google Font -->

    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="${css}/all.min.css">
    <link rel="stylesheet" href="${css}/ionicons.min.css">
    <link rel="stylesheet" href="${css}/themify-icons.css">
    <link rel="stylesheet" href="${css}/linearicons.css">
    <link rel="stylesheet" href="${css}/flaticon.css">
    <link rel="stylesheet" href="${css}/simple-line-icons.css">
    <!--- owl carousel CSS-->
    <link rel="stylesheet" href="${owlcarouselCss}/owl.carousel.min.css">
    <link rel="stylesheet" href="${owlcarouselCss}/owl.theme.css">
    <link rel="stylesheet" href="${owlcarouselCss}/owl.theme.default.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="${css}/magnific-popup.css">
    <!-- Slick CSS -->
    <link rel="stylesheet" href="${css}/slick.css">
    <link rel="stylesheet" href="${css}/slick-theme.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="${css}/style.css">
    <link rel="stylesheet" href="${css}/responsive.css">
    <!-- RTL CSS -->
    <link rel="stylesheet" href="${css}/rtl-style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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

<!-- START HEADER -->
<%@include file="./shared/justNavbar.jsp"%>
<!-- END HEADER -->

<!-- START SECTION BREADCRUMB -->
<div class="breadcrumb_section bg_gray page-title-mini">
    <div class="container"><!-- STRART CONTAINER -->
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="page-title">
                    <h1>ورود</h1>
                </div>
            </div>
            <div class="col-md-6">
                <ol class="breadcrumb justify-content-md-end">
                    <li class="breadcrumb-item"><a href="${contextRoot}/home">خانه</a></li>
                    <li class="breadcrumb-item active">ورود</li>
                </ol>
            </div>
        </div>
    </div><!-- END CONTAINER-->
</div>
<!-- END SECTION BREADCRUMB -->
<c:if test="${not empty message}">
    <div class="row">
        <div class="col-md-3"></div>
       <div class="col-md-6">
           <div class="alert alert-danger">${message}</div>
       </div>
        <div class="col-md-3"></div>
    </div>
</c:if>

<c:if test="${not empty logout}">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="alert alert-success">${logout}</div>
        </div>
        <div class="col-md-3"></div>
    </div>
</c:if>

<!-- START MAIN CONTENT -->
<div class="main_content">

    <!-- START LOGIN SECTION -->
    <div class="login_register_wrap section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6 col-md-10">
                    <div class="login_wrap">
                        <div class="padding_eight_all bg-white">
                            <div class="heading_s1">
                                <h3>ورود</h3>
                            </div>
                            <form action="${contextRoot}/login" method="post" id="loginForm">
                                <div class="form-group">
                                    <input type="text" required="" class="form-control" name="username" id="username" placeholder="ایمیل شما">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" required="" name="password" id="password" type="password"  placeholder="کلمه عبور">
                                </div>

                                <div class="login_footer form-group">
                                    <div class="chek-form">
                                        <div class="custome-checkbox">
                                            <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox1" value="" on>
                                            <label class="form-check-label" for="exampleCheckbox1"><span>مرا به خاطر بسپار</span></label>
                                        </div>
                                    </div>
                                    <a href="#">رمز عبور را فراموش کرده اید؟</a>
                                </div>
                                <div class="form-group">
                                    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-fill-out btn-block" name="login">ورود</button>
                                </div>
                            </form>
                            <div class="different_login">
                                <span></span>
                            </div>
                            <div class="form-note text-center">حساب کاربری ندارید؟ <a href="${contextRoot}/membership">ثبت نام کنید</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END LOGIN SECTION -->

    <!-- START SECTION SUBSCRIBE NEWSLETTER -->
    <div class="section bg_default small_pt small_pb">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="heading_s1 mb-md-0 heading_light">
                        <h3>اشتراک در خبرنامه ما</h3>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="newsletter_form">
                        <form>
                            <input type="text" required="" class="form-control rounded-0" placeholder="آدرس ایمیل">
                            <button type="submit" class="btn btn-dark rounded-0" name="submit" value="Submit">اشتراک</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- START SECTION SUBSCRIBE NEWSLETTER -->

</div>
<!-- END MAIN CONTENT -->

<!-- START FOOTER -->
<footer class="footer_dark">
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-12">
                    <div class="widget">
                        <div class="footer_logo">
                            <a href="#"><img src="assets/images/logo_light.png" alt="logo"/></a>
                        </div>
                        <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است</p>
                    </div>
                    <div class="widget">
                        <ul class="social_icons social_white">
                            <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                            <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                            <li><a href="#"><i class="ion-social-googleplus"></i></a></li>
                            <li><a href="#"><i class="ion-social-youtube-outline"></i></a></li>
                            <li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6">
                    <div class="widget">
                        <h6 class="widget_title">لینک های مفید</h6>
                        <ul class="widget_links">
                            <li><a href="#">درباره ما</a></li>
                            <li><a href="#">سؤالات متداول</a></li>
                            <li><a href="#">موقعیت</a></li>
                            <li><a href="#">شرکت ها</a></li>
                            <li><a href="#">تماس با ما</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6">
                    <div class="widget">
                        <h6 class="widget_title">دسته بندی</h6>
                        <ul class="widget_links">
                            <li><a href="#">مردانه</a></li>
                            <li><a href="#">زنانه</a></li>
                            <li><a href="#">بچه گانه</a></li>
                            <li><a href="#">بهترین فروش</a></li>
                            <li><a href="#">تازه رسیده ها</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 col-sm-6">
                    <div class="widget">
                        <h6 class="widget_title">حساب کاربری</h6>
                        <ul class="widget_links">
                            <li><a href="#">حساب من</a></li>
                            <li><a href="#">تخفیف</a></li>
                            <li><a href="#">برگشتی</a></li>
                            <li><a href="#">تاریخچه سفارشات</a></li>
                            <li><a href="#">رهگیری سفارش</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="widget">
                        <h6 class="widget_title">اطلاعات تماس</h6>
                        <ul class="contact_info contact_info_light">
                            <li>
                                <i class="ti-location-pin"></i>
                                <p> ایران , تهران , زعفرانیه , ساختمان هستی</p>
                            </li>
                            <li>
                                <i class="ti-email"></i>
                                <a href="mailto:info@sitename.com">info@sitename.com</a>
                            </li>
                            <li>
                                <i class="ti-mobile"></i>
                                <p>021 - 1234567</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom_footer border-top-tran">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <p class="mb-md-0 text-center text-md-left">© 1399 کلیه حقوق این سایت متعلق به ... است</p>
                </div>
                <div class="col-md-6">
                    <ul class="footer_payment text-center text-lg-right">
                        <li><a href="#"><img src="assets/images/visa.png" alt="visa"></a></li>
                        <li><a href="#"><img src="assets/images/discover.png" alt="discover"></a></li>
                        <li><a href="#"><img src="assets/images/master_card.png" alt="master_card"></a></li>
                        <li><a href="#"><img src="assets/images/paypal.png" alt="paypal"></a></li>
                        <li><a href="#"><img src="assets/images/amarican_express.png" alt="amarican_express"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- END FOOTER -->

<a href="#" class="scrollup" style="display: none;"><i class="ion-ios-arrow-up"></i></a>

<!-- Latest jQuery -->
<script src="${js}/jquery-1.12.4.min.js"></script>
<!-- jQuery.validate -->
<script src="${js}/jquery.validate.js"></script>
<!-- popper min js -->
<script src="${js}/popper.min.js"></script>
<!-- Latest compiled and minified Bootstrap -->
<script src="${bootstrapJs}/bootstrap.min.js"></script>
<!-- owl-carousel min js  -->
<script src="${owlcarouselJs}/owl.carousel.min.js"></script>
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
<!-- slick js -->
<script src="${js}/slick.min.js"></script>
<!-- elevatezoom js -->
<script src="${js}/jquery.elevatezoom.js"></script>
<!-- scripts js -->
<script src="${js}/scripts.js"></script>
<%--my app.js--%>
<script src="${js}/myapp.js"></script>

</body>
</html>
