<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- START SECTION BANNER -->
<div class="mt-4 staggered-animation-wrap" >
    <div class="custom-container" >
        <div class="row">
            <div class="col-lg-7 offset-lg-3">
                <div class="banner_section shop_el_slider">
                    <div id="carouselExampleControls" class="carousel slide carousel-fade light_arrow" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active background_bg" data-img-src="${images}/${mainBanners[0].name}.jpg">
                                <div class="banner_slide_content banner_content_inner">
                                    <div class="col-lg-7 col-10">
                                        <div class="banner_content3 overflow-hidden">
                                            <c:set var="bannerDes" value="${cfn:split(mainBanners[0].description, ',')}"/>
                                            <h5 class="mb-3 staggered-animation font-weight-light" data-animation="slideInRight" data-animation-delay="0.5s">${bannerDes[0]}</h5>
                                            <h2 class="staggered-animation" data-animation="slideInRight" data-animation-delay="1s">${bannerDes[1]}</h2>
                                            <h4 class="staggered-animation mb-4 product-price" data-animation="slideInRight" data-animation-delay="1.2s"><span class="price">${bannerDes[2]} تومان</span><del>${bannerDes[3]} تومان</del></h4>
                                            <a class="btn btn-fill-out btn-radius staggered-animation text-uppercase" href="${contextRoot}/show/${bannerDes[4]}/product" data-animation="slideInRight" data-animation-delay="1.5s">اکنون خرید کنید</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:forEach begin="1" items="${mainBanners}" var="banner">
                                <div class="carousel-item background_bg" data-img-src="${images}/${banner.name}.jpg">
                                    <div class="banner_slide_content banner_content_inner">
                                        <div class="col-lg-8 col-10">
                                            <div class="banner_content3 overflow-hidden">
                                                <c:set var="bannerDes" value="${cfn:split(banner.description, ',')}"/>
                                                <h5 class="mb-3 staggered-animation font-weight-light" data-animation="slideInRight" data-animation-delay="0.5s">${bannerDes[0]}</h5>
                                                <h2 class="staggered-animation" data-animation="slideInRight" data-animation-delay="1s">${bannerDes[1]}</h2>
                                                <h4 class="staggered-animation mb-4 product-price" data-animation="slideInRight" data-animation-delay="1.2s"><span class="price">${bannerDes[2]} تومان</span><del>${bannerDes[3]} تومان</del></h4>
                                                <a class="btn btn-fill-out btn-radius staggered-animation text-uppercase" href="${contextRoot}/show/${bannerDes[4]}/product" data-animation="slideInRight" data-animation-delay="1.5s">اکنون خرید کنید</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>


                        </div>
                        <ol class="carousel-indicators indicators_style3">
                            <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleControls" data-slide-to="1"></li>
                            <li data-target="#carouselExampleControls" data-slide-to="2"></li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 d-none d-lg-block">
                <c:set var="bannerDes" value="${cfn:split(categoryBanners[0].description, ',')}"/>
                <div class="shop_banner2 el_banner1">
                    <a href="${contextRoot}/show/category/${bannerDes[2]}/products" class="hover_effect1">
                        <div class="el_title text_white">
                            <h6>${bannerDes[0]}</h6>
                            <span>تا${bannerDes[1]} تخفیف</span>
                        </div>
                        <div class="el_img">
                            <img src="${images}/${categoryBanners[0].name}.jpg" alt="${categoryBanners[0].name}_img">
                        </div>
                    </a>
                </div>
                <c:set var="bannerDes" value="${cfn:split(categoryBanners[1].description, ',')}"/>
                <div class="shop_banner2 el_banner1">
                    <a href="${contextRoot}/show/category/${bannerDes[2]}/products" class="hover_effect1">
                        <div class="el_title text_white">
                            <h6>${bannerDes[0]}</h6>
                            <span>تا${bannerDes[1]} تخفیف</span>
                        </div>
                        <div class="el_img">
                            <img src="${images}/${categoryBanners[1].name}.jpg" alt="${categoryBanners[1].name}_img">
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END SECTION BANNER -->

<!-- START MAIN CONTENT -->
<div class="main_content">

    <!-- START SECTION SHOP -->
    <div class="section small_pt pb-0">
        <div class="custom-container">
            <div class="row">
                <div class="col-xl-3 d-none d-xl-block">
                    <div class="sale-banner">
                        <a class="hover_effect1" href="${contextRoot}/show/2/product">
                            <img src="${images}/bosch1.jpg" alt="${productBanners[0].name}_img">
                        </a>
                    </div>
                </div>
                <div class="col-xl-9" >
                    <div class="row">
                        <div class="col-12">
                            <div class="heading_tab_header">
                                <div class="heading_s2">
                                    <h4>محصولات اختصاصی</h4>
                                </div>
                                <div class="tab-style2">
                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#tabmenubar" aria-expanded="false">
                                        <span class="ion-android-menu"></span>
                                    </button>
                                    <ul class="nav nav-tabs justify-content-center justify-content-md-end" id="tabmenubar" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="arrival-tab" data-toggle="tab" href="#arrival" role="tab" aria-controls="arrival" aria-selected="true">پر تخفیف ترین ها</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="sellers-tab" data-toggle="tab" href="#sellers" role="tab" aria-controls="sellers" aria-selected="false">پر فروش ترین ها</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="featured-tab" data-toggle="tab" href="#featured" role="tab" aria-controls="featured" aria-selected="false">پر بازدید ترین ها</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="tab_slider">
                                <div class="tab-pane fade show active" id="arrival" role="tabpanel" aria-labelledby="arrival-tab">
                                    <div class="product_slider carousel_slider owl-carousel owl-theme dot_style1" data-loop="true" data-margin="20" data-responsive='{"0":{"items": "1"}, "481":{"items": "2"}, "768":{"items": "3"}, "991":{"items": "4"}}'>
                                        <c:forEach items="${mdProduct}" var="mdProduct">
                                            <c:choose>
                                            <c:when test="${mdProduct.quantity>=1}">
                                            <div class="item">
                                                <div class="product_wrap">
                                                    <div class="product_img">
                                                        <a href="${contextRoot}/show/${mdProduct.id}/product">
                                                            <img src="${images}/${mdProduct.code}.jpg" alt="${mdProduct.name}_img1">
                                                            <img class="product_hover_img" src="${images}/${mdProduct.code}1.jpg" alt="${mdProduct.name}_img2">
                                                        </a>
                                                        <div class="product_action_box">
                                                            <ul class="list_none pr_action_btn">
                                                                <li class="add-to-cart"><a href="${contextRoot}/cart/add/${mdProduct.id}/product"><i class="icon-basket-loaded"></i> افزودن به سبد خرید</a></li>
                                                                <li><a href="${contextRoot}/show/${mdProduct.id}/product"><i class="icon-eye"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="product_info">
                                                        <h6 class="product_title"><a href="${contextRoot}/show/${mdProduct.id}/product">${mdProduct.name}</a></h6>
                                                        <div class="product_price">
                                                                <c:choose>
                                                                    <c:when test="${mdProduct.discount > 0}">
                                                                        <span class="price">${mdProduct.unitPrice - mdProduct.unitPrice*mdProduct.discount/100}  تومان</span>
                                                                        <del>${mdProduct.unitPrice} تومان</del>
                                                                        <div class="on_sale">
                                                                            <span>٪${mdProduct.discount} تخفیف</span>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="price">${mdProduct.unitPrice} تومان</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                        </div>
                                                        <div class="rating_wrap">
                                                            <div class="rating">
                                                                <div class="product_rate" style="width:${mdProduct.productScore *20}%"></div>
                                                            </div>
                                                            <span class="rating_num">(${mdProduct.rateCount})</span>
                                                        </div>
                                                        <div class="pr_desc">
                                                            <p>${mdProduct.preDescription}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:when>
                                                <c:otherwise>
                                                    <div class="item">
                                                        <div class="product_wrap">
                                                            <div class="product_img">
                                                                <a href="${contextRoot}/show/${mdProduct.id}/product">
                                                                    <span class="pr_flash bg-danger">نا موجود</span>
                                                                    <img src="${images}/${mdProduct.code}.jpg" alt="${mdProduct.name}_img1">
                                                                    <img class="product_hover_img" src="${images}/${mdProduct.code}1.jpg" alt="${mdProduct.name}_img2">
                                                                </a>
                                                                <div class="product_action_box">
                                                                    <ul class="list_none pr_action_btn">
                                                                        <li class="add-to-cart"><a href="javascript:void(0)"><i class="icon-basket-loaded"></i> افزودن به سبد خرید</a></li>
                                                                        <li><a href="${contextRoot}/show/${mdProduct.id}/product"><i class="icon-eye"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <div class="product_info">
                                                                <h6 class="product_title"><a href="${contextRoot}/show/${mdProduct.id}/product">${mdProduct.name}</a></h6>
                                                                <div class="product_price">
                                                                    <c:choose>
                                                                        <c:when test="${mdProduct.discount > 0}">
                                                                            <span class="price">${mdProduct.unitPrice - mdProduct.unitPrice*mdProduct.discount/100}  تومان</span>
                                                                            <del>${mdProduct.unitPrice} تومان</del>
                                                                            <div class="on_sale">
                                                                                <span>٪${mdProduct.discount} تخفیف</span>
                                                                            </div>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="price">${mdProduct.unitPrice} تومان</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="rating_wrap">
                                                                    <div class="rating">
                                                                        <div class="product_rate" style="width:${mdProduct.productScore *20}%"></div>
                                                                    </div>
                                                                    <span class="rating_num">(${mdProduct.rateCount})</span>
                                                                </div>
                                                                <div class="pr_desc">
                                                                    <p>${mdProduct.preDescription}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="sellers" role="tabpanel" aria-labelledby="sellers-tab">
                                    <div class="product_slider carousel_slider owl-carousel owl-theme dot_style1" data-loop="true" data-margin="20" data-responsive='{"0":{"items": "1"}, "481":{"items": "2"}, "768":{"items": "3"}, "991":{"items": "4"}}'>
                                        <c:forEach items="${mpProduct}" var="mpProduct">
                                            <div class="item">
                                                <div class="product_wrap">
                                                    <div class="product_img">
                                                        <a href="${contextRoot}/show/${mpProduct.id}/product">
                                                            <img src="${images}/${mpProduct.code}.jpg" alt="${mpProduct.name}_img1">
                                                            <img class="product_hover_img" src="${images}/${mpProduct.code}1.jpg" alt="${mpProduct.name}_img2">
                                                        </a>
                                                        <div class="product_action_box">
                                                            <ul class="list_none pr_action_btn">
                                                                <li class="add-to-cart"><a href="${contextRoot}/cart/add/${mpProduct.id}/product"><i class="icon-basket-loaded"></i> افزودن به سبد خرید</a></li>
                                                                <li><a href="${contextRoot}/show/${mpProduct.id}/product" class="popup-ajax"><i class="icon-eye"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="product_info">
                                                        <h6 class="product_title"><a href="${contextRoot}/show/${mpProduct.id}/product">${mpProduct.name}</a></h6>
                                                        <div class="product_price">
                                                            <c:choose>
                                                                <c:when test="${mpProduct.discount > 0}">
                                                                    <span class="price">${mpProduct.unitPrice - mpProduct.unitPrice*mpProduct.discount/100}  تومان</span>
                                                                    <del>${mpProduct.unitPrice} تومان</del>
                                                                    <div class="on_sale">
                                                                        <span>٪${mpProduct.discount} تخفیف</span>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="price">${mpProduct.unitPrice} تومان</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="rating_wrap">
                                                            <div class="rating">
                                                                <div class="product_rate" style="width:${mpProduct.productScore *20}%"></div>
                                                            </div>
                                                            <span class="rating_num">(${mpProduct.rateCount})</span>
                                                        </div>
                                                        <div class="pr_desc">
                                                            <p>${mpProduct.preDescription}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="featured" role="tabpanel" aria-labelledby="featured-tab">
                                    <div class="product_slider carousel_slider owl-carousel owl-theme dot_style1" data-loop="true" data-margin="20" data-responsive='{"0":{"items": "1"}, "481":{"items": "2"}, "768":{"items": "3"}, "991":{"items": "4"}}'>
                                        <c:forEach items="${mvProduct}" var="mvProduct">
                                            <div class="item">
                                                <div class="product_wrap">
                                                    <div class="product_img">
                                                        <a href="${contextRoot}/show/${mvProduct.id}/product">
                                                            <img src="${images}/${mvProduct.code}.jpg" alt="${mvProduct.name}_img1">
                                                            <img class="product_hover_img" src="${images}/${mvProduct.code}1.jpg" alt="${mvProduct.name}_img2">
                                                        </a>
                                                        <div class="product_action_box">
                                                            <ul class="list_none pr_action_btn">
                                                                <li class="add-to-cart"><a href="${contextRoot}/cart/add/${mvProduct.id}/product"><i class="icon-basket-loaded"></i> افزودن به سبد خرید</a></li>
                                                                <li><a href="${contextRoot}/show/${mvProduct.id}/product" class="popup-ajax"><i class="icon-eye"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="product_info">
                                                        <h6 class="product_title"><a href="${contextRoot}/show/${mvProduct.id}/product">${mvProduct.name}</a></h6>
                                                        <div class="product_price">
                                                            <c:choose>
                                                                <c:when test="${mvProduct.discount > 0}">
                                                                    <span class="price">${mvProduct.unitPrice - mvProduct.unitPrice*mvProduct.discount/100}  تومان</span>
                                                                    <del>${mvProduct.unitPrice} تومان</del>
                                                                    <div class="on_sale">
                                                                        <span>٪${mvProduct.discount} تخفیف</span>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="price">${mvProduct.unitPrice} تومان</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="rating_wrap">
                                                            <div class="rating">
                                                                <div class="product_rate" style="width:${mvProduct.productScore *20}%"></div>
                                                            </div>
                                                            <span class="rating_num">(${mvProduct.rateCount})</span>
                                                        </div>
                                                        <div class="pr_desc">
                                                            <p>${mvProduct.preDescription}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END SECTION SHOP -->

    <!-- START SECTION BANNER -->
    <div class="section pb_20 small_pt">
        <div class="custom-container">
            <div class="row">
                <div class="col-md-4">
                    <c:forEach items="${brandBanners}" var="brandBanner">
                        <div class="sale-banner mb-3 mb-md-4">
                            <a class="hover_effect1" href="${contextRoot}/show/brand/${brandBanner.id}/products">
                                <img src="${images}/${brandBanner.name}.jpg" alt="${brandBanner.name}_img">
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <!-- END SECTION BANNER -->

    <!-- START SECTION CLIENT LOGO -->
    <div class="section pt-0 small_pb">
        <div class="custom-container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading_tab_header">
                        <div class="heading_s2">
                            <h4>برندهای ما</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="client_logo carousel_slider owl-carousel owl-theme nav_style3" data-dots="false" data-nav="true" data-margin="30" data-loop="true" data-autoplay="true" data-responsive='{"0":{"items": "2"}, "480":{"items": "3"}, "767":{"items": "4"}, "991":{"items": "5"}, "1199":{"items": "6"}}'>
                        <c:forEach items="${brands}" var="brands">
                            <div class="item">
                                <div class="cl_logo">
                                    <a href="${contextRoot}/show/brand/${brands.id}/products"> <img src="${images}/${brands.name}.jpg" alt="${brands.name}"/>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END SECTION CLIENT LOGO -->

</div>
<!-- START MAIN CONTENT -->