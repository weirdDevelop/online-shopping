<%--
  Created by IntelliJ IDEA.
  User: sajjad
  Date: 3/3/2022
  Time: 12:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<spring:url var="images" value="/resources/images" />

<!-- START MAIN CONTENT -->
<div class="main_content">

    <!-- START SECTION BREADCRUMB -->
    <div class="breadcrumb_section bg_gray page-title-mini">
        <div class="container"><!-- STRART CONTAINER -->
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="page-title">
                        <h1>درباره ما</h1>
                    </div>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb justify-content-md-end">
                        <li class="breadcrumb-item"><a href="${contextRoot}/home">خانه</a></li>
                        <li class="breadcrumb-item active">درباره ما</li>
                    </ol>
                </div>
            </div>
        </div><!-- END CONTAINER-->
    </div>
    <!-- END SECTION BREADCRUMB -->

    <!-- STAT SECTION ABOUT -->
    <div class="section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="about_img scene mb-4 mb-lg-0">
                        <img src="assets/images/about_img.jpg" alt="about_img"/>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="heading_s1">
                        <h2>ما کی هستیم</h2>
                    </div>
                    <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است</p>
                    <p>برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- END SECTION ABOUT -->

    <!-- START SECTION WHY CHOOSE -->
    <div class="section bg_light_blue2 pb_70">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">
                    <div class="heading_s1 text-center">
                        <h2>چرا ما را انتخاب کنید؟</h2>
                    </div>
                    <p class="text-center leads">لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است.</p>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-4 col-sm-6">
                    <div class="icon_box icon_box_style4 box_shadow1">
                        <div class="icon">
                            <i class="ti-pencil-alt"></i>
                        </div>
                        <div class="icon_box_content">
                            <h5>طراحی خلاقانه</h5>
                            <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="icon_box icon_box_style4 box_shadow1">
                        <div class="icon">
                            <i class="ti-layers"></i>
                        </div>
                        <div class="icon_box_content">
                            <h5>طرح بندی انعطاف پذیر</h5>
                            <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="icon_box icon_box_style4 box_shadow1">
                        <div class="icon">
                            <i class="ti-email"></i>
                        </div>
                        <div class="icon_box_content">
                            <h5>بازاریابی ایمیلی</h5>
                            <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END SECTION WHY CHOOSE -->


    <!-- START SECTION SHOP INFO -->
    <div class="section pb_70">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-lg-4">
                    <div class="icon_box icon_box_style1">
                        <div class="icon">
                            <i class="flaticon-shipped"></i>
                        </div>
                        <div class="icon_box_content">
                            <h5>ارسال رایگان</h5>
                            <p>اگر قصد استفاده از لورم را دارید ، باید در هر چیزی مطمئن باشید</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="icon_box icon_box_style1">
                        <div class="icon">
                            <i class="flaticon-money-back"></i>
                        </div>
                        <div class="icon_box_content">
                            <h5>30 روز ضمانت بازگشت</h5>
                            <p>اگر قصد استفاده از لورم را دارید ، باید در هر چیزی مطمئن باشید</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="icon_box icon_box_style1">
                        <div class="icon">
                            <i class="flaticon-support"></i>
                        </div>
                        <div class="icon_box_content">
                            <h5>پشتیبانی 24 ساعته</h5>
                            <p>اگر قصد استفاده از لورم را دارید ، باید در هر چیزی مطمئن باشید</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END SECTION SHOP INFO -->
</div>
