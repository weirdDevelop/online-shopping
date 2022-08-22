<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dour-Andish
  Date: 9/17/2020
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- LOADER -->
<div class="preloader">
    <div class="lds-ellipsis">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<!-- END LOADER -->

<!-- START SECTION BREADCRUMB -->
<div class="breadcrumb_section bg_gray page-title-mini">
    <div class="container"><!-- STRART CONTAINER -->
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="page-title">
                    <h1>نمای لیستی فروشگاه</h1>
                </div>
            </div>
            <div class="col-md-6">
                <ol class="breadcrumb justify-content-md-end">
                    <li class="breadcrumb-item"><a href="${contextRoot}/home">خانه</a></li>
                    <li class="breadcrumb-item active">محصولات </li>
                </ol>
            </div>
        </div>
    </div><!-- END CONTAINER-->
</div>
<!-- END SECTION BREADCRUMB -->

<!-- START MAIN CONTENT -->
<div class="main_content">

    <!-- START SECTION SHOP -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row align-items-center mb-4 pb-1">
                        <div class="col-12">
                            <div class="product_header">
                                <div class="product_header_left">
                                    <div class="custom_select">
                                        <select class="form-control form-control-sm" onchange="location = this.value;">
                                            <option value="order"> مرتب سازی پیش فرض</option>
                                            <option value="${contextRoot}/show//search/0/product?SearchName=${searchedName}&sort=views&sortBy=desc&currentPage=1">مرتب سازی بر اساس بیشترین بازدید</option>
                                            <option value="${contextRoot}/show//search/0/product?SearchName=${searchedName}&sort=purchases&sortBy=desc&currentPage=1">مرتب سازی بر اساس پر فروش ترین</option>
                                            <option value="${contextRoot}/show//search/0/product?SearchName=${searchedName}&sort=unitPrice&sortBy=asc&currentPage=1">مرتب سازی بر اساس قیمت: پایین تا بالا</option>
                                            <option value="${contextRoot}/show//search/0/product?SearchName=${searchedName}&sort=unitPrice&sortBy=desc&currentPage=1">مرتب سازی بر اساس قیمت: بالا تا پایین</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="product_header_right">
                                    <div class="products_view">
                                        <a href="javascript:Void(0);" class="shorting_icon grid"><i
                                                class="ti-view-grid"></i></a>
                                        <a href="javascript:Void(0);" class="shorting_icon list active"><i
                                                class="ti-layout-list-thumb"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row shop_container list">
                        <c:forEach items="${resultProduct}" var="product">
                            <div class="col-lg-3 col-md-4 col-6">
                                <div class="product">
                                    <div class="product_img">
                                        <a href="${contextRoot}/show/${product.id}/product">
                                            <img src="${images}/${product.code}.jpg"
                                                 alt="${product.name}">
                                        </a>

                                        <div class="product_action_box">
                                            <ul class="list_none pr_action_btn">
                                                <c:choose>
                                                    <c:when test="${product.quantity < 1}">
                                                        <li class="add-to-cart"><a href="javascript:void(0)"><i
                                                                class="icon-basket-loaded disabled"></i> افزودن به سبد
                                                            خرید</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="add-to-cart"><a
                                                                href="${contextRoot}/cart/add/${product.id}/product"><i
                                                                class="icon-basket-loaded disabled"></i> افزودن به سبد
                                                            خرید</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <li><a href="${contextRoot}/show/${product.id}/product"
                                                       class="popup-ajax"><i class="icon-magnifier-add"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_info">
                                        <h6 class="product_title"><a
                                                href="${contextRoot}/show/${product.id}/product">${product.name}</a>
                                        </h6>
                                        <div class="product_price">
                                            <c:choose>
                                                <c:when test="${product.quantity < 1}">
                                                    <span class="price">نا موجود</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${product.discount > 0}">
                                                            <span class="price">${product.unitPrice - product.unitPrice*product.discount/100}  تومان</span>
                                                            <del>${product.unitPrice} تومان</del>
                                                            <div class="on_sale">
                                                                <span>٪${product.discount} تخفیف</span>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="price">${product.unitPrice} تومان</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="rating_wrap">
                                            <div class="rating">
                                                <div class="product_rate" style="width:${product.productScore *20}%"></div>
                                            </div>
                                            <span class="rating_num">(${product.rateCount})</span>
                                        </div>
                                        <div class="pr_desc">
                                            <p>${product.preDescription}</p>
                                        </div>
                                        <div class="list_product_action_box">
                                            <ul class="list_none pr_action_btn">
                                                <c:choose>
                                                    <c:when test="${product.quantity < 1}">
                                                        <li class="add-to-cart"><a href="javascript:void(0)"><i
                                                                class="icon-basket-loaded disabled"></i> افزودن به سبد
                                                            خرید</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="add-to-cart"><a
                                                                href="${contextRoot}/cart/add/${product.id}/product"><i
                                                                class="icon-basket-loaded disabled"></i> افزودن به سبد
                                                            خرید</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <li><a href="${contextRoot}/show/${product.id}/product">
                                                    <i class="icon-magnifier-add"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <ul class="pagination mt-3 justify-content-center pagination_style1">

                                <c:forEach begin="1" end="${pagesCount}" var="page" step="1">
                                    <c:choose>
                                        <c:when test="${currentPage eq page}">
                                            <li class="page-item active"><a href="#" class="page-link">${page}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" id=""
                                                                     href="${contextRoot}/show/search/${( page-1 ) * 10+1}/product?SearchName=${searchedName}&sort=${sort}&sortBy=${sortBy}&currentPage=${page}">${page}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END SECTION SHOP -->

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
                            <button type="submit" class="btn btn-dark rounded-0" name="submit" value="Submit">اشتراک
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- START SECTION SUBSCRIBE NEWSLETTER -->

</div>
<!-- END MAIN CONTENT -->

