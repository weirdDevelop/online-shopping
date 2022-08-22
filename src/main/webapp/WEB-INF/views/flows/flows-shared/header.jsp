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
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="Anil z" name="author">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Shopwise is Powerful features and You Can Use The Perfect Build this Template For Any eCommerce Website. The template is built for sell Fashion Products, Shoes, Bags, Cosmetics, Clothes, Sunglasses, Furniture, Kids Products, Electronics, Stationery Products and Sporting Goods.">
    <meta name="keywords" content="ecommerce, electronics store, Fashion store, furniture store,  bootstrap 4, clean, minimal, modern, online store, responsive, retail, shopping, ecommerce store">

    <!-- SITE TITLE -->
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


    <!-- Style CSS -->
    <link rel="stylesheet" href="${css}/style.css">
    <link rel="stylesheet" href="${css}/responsive.css">
    <!-- RTL CSS -->
    <link rel="stylesheet" href="${css}/rtl-style.css">

    <script>
        window.contextRoot = '${contextRoot}'
    </script>

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
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
<header class="header_wrap fixed-top header_with_topbar">

    <div class="bottom_header dark_skin main_menu_uppercase">
        <div class="container">
            <nav class="navbar navbar-expand-lg">
                <a class="navbar-brand" href="${flowExecutionUrl}&_eventId=home">
                    <img class="logo_light" src="assets/images/logo_light.png" alt="logo" />
                    <img class="logo_dark" src="assets/images/logo_dark.png" alt="logo" />
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-expanded="false">
                    <span class="ion-android-menu"></span>
                </button>
            </nav>
        </div>
    </div>
</header>
<!-- END HEADER -->

<!-- START SECTION BREADCRUMB -->
<div class="breadcrumb_section bg_gray page-title-mini">
    <div class="container"><!-- STRART CONTAINER -->
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="page-title">
                    <h1>ثبت نام</h1>
                </div>
            </div>
            <div class="col-md-6">
                <ol class="breadcrumb justify-content-md-end">
                    <li class="breadcrumb-item"><a href="${contextRoot}/home">خانه</a></li>
                    <li class="breadcrumb-item active">ثبت نام</li>
                </ol>
            </div>
        </div>
    </div><!-- END CONTAINER-->
</div>
<!-- END SECTION BREADCRUMB -->
