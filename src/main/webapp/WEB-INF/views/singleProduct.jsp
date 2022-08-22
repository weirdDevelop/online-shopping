<%--
  Created by IntelliJ IDEA.
  User: Dour-Andish
  Date: 9/20/2020
  Time: 12:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
<script>;
window.productScore = '${product.productScore}';
</script>
<!-- START SECTION BREADCRUMB -->
<div class="breadcrumb_section bg_gray page-title-mini">
    <div class="container"><!-- STRART CONTAINER -->
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="page-title">
                    <h1>${product.name}</h1>
                </div>
            </div>
            <div class="col-md-6">
                <ol class="breadcrumb justify-content-md-end">

                    <li class="breadcrumb-item"><a href="${contextRoot}/home">خانه</a></li>
                    <li class="breadcrumb-item"><a href="${contextRoot}/show/all/products">محصولات</a></li>
                    <li class="breadcrumb-item active">${product.name}</li>
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
                <div class="col-lg-6 col-md-6 mb-4 mb-md-0">
                    <div class="product-image">
                        <div class="product_img_box">
                            <img id="product_img" src='${images}/${product.code}.jpg'
                                 data-zoom-image='${images}/${product.code}.jpg' alt="product_img1"/>
                            <a href="#" class="product_img_zoom" title="Zoom">
                                <span class="linearicons-zoom-in"></span>
                            </a>
                        </div>
                        <div id="pr_item_gallery" class="product_gallery_item slick_slider"
                             data-slides-to-show="${product.imagesCount}" data-slides-to-scroll="1"
                             data-infinite="false">
                            <div class="item">
                                <a href="#" class="product_gallery_item active"
                                   data-image="${images}/${product.code}.jpg"
                                   data-zoom-image="${images}/${product.code}.jpg">
                                    <img src="${images}/${product.code}.jpg" alt="product_small_img1"/>
                                </a>
                            </div>
                            <c:forEach begin="1" end="${product.imagesCount - 1}" var="num" step="1">
                                <div class="item">
                                    <a href="#" class="product_gallery_item"
                                       data-image="${images}/${product.code}${num}.jpg"
                                       data-zoom-image="${images}/${product.code}${num}.jpg">
                                        <img src="${images}/${product.code}${num}.jpg" alt="product_small_img1"/>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="pr_detail">
                        <div class="product_description">
                            <h4 class="product_title"><a href="#">${product.name}</a></h4>
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
                                <div id="showrate"></div>
                                <c:choose>
                                    <c:when test="${product.rateCount <1}">
                                        <span class="rating_num">(بدون نظر)</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="rating_num" نظر (${product.rateCount})></span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="pr_desc">
                                <p>${product.preDescription}</p>
                            </div>
                            <div class="product_sort_info">
                                <ul>
                                    <li><i class="linearicons-shield-check"></i>${product.warranty}</li>
                                    <li><i class="linearicons-sync"></i> 30 روز برگشت</li>
                                    <li><i class="linearicons-bag-dollar"></i> پرداخت نقدی موجود است</li>
                                </ul>
                            </div>
                        </div>
                        <hr/>

                        <security:authorize access="isAnonymous() or hasAuthority('USER')">

                            <c:choose>

                                <c:when test="${product.quantity < 1}">

                                    <div class="cart_extra">
                                        <div class="cart_btn">
                                            <a href="javascript:void(0)">
                                                <button class="btn btn-fill-out btn-addtocart disabled" type="button"><i
                                                        class="icon-basket-loaded"></i> افزودن به سبد خرید
                                                </button>
                                            </a>
                                        </div>
                                    </div>

                                </c:when>
                                <c:otherwise>

                                    <div class="cart_extra">
                                        <div class="cart_btn">
                                            <a href="${contextRoot}/cart/add/${product.id}/product">
                                                <button class="btn btn-fill-out btn-addtocart" type="button"><i
                                                        class="icon-basket-loaded"></i> افزودن به سبد خرید
                                                </button>
                                            </a>
                                        </div>
                                    </div>

                                </c:otherwise>

                            </c:choose>
                        </security:authorize>


                        <security:authorize access="hasAuthority('ADMIN')">
                            <div class="cart_extra">
                                <div class="cart_btn">
                                    <a href="${contextRoot}/manage/${product.id}/product">
                                        <button class="btn btn-fill-out btn-addtocart" type="button"><i
                                                class="icon-pencil"></i> افزودن به سبد خرید
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </security:authorize>
                        <hr/>
                        <ul class="product-meta">
                            <li>کد: <a href="#">${product.code}</a></li>
                            <li>دسته بندی: <a href="#">${category} , ${subCategory}</a></li>
                        </ul>

                        <div class="product_share">
                            <span>اشتراک:</span>
                            <ul class="social_icons">
                                <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                                <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                                <li><a href="#"><i class="ion-social-googleplus"></i></a></li>
                                <li><a href="#"><i class="ion-social-youtube-outline"></i></a></li>
                                <li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="large_divider clearfix"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="tab-style3">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="Description-tab" data-toggle="tab" href="#Description"
                                   role="tab" aria-controls="Description" aria-selected="true">توضیحات</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Additional-info-tab" data-toggle="tab" href="#Additional-info"
                                   role="tab" aria-controls="Additional-info" aria-selected="false">اطلاعات اضافی</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="Reviews-tab" data-toggle="tab" href="#Reviews" role="tab"
                                   aria-controls="Reviews" aria-selected="false"> نظرات(${product.rateCount})</a>
                            </li>
                        </ul>
                        <div class="tab-content shop_info_tab">
                            <div class="tab-pane fade show active" id="Description" role="tabpanel"
                                 aria-labelledby="Description-tab">
                                <p>${product.description}</p>
                            </div>
                            <div class="tab-pane fade" id="Additional-info" role="tabpanel"
                                 aria-labelledby="Additional-info-tab">
                                <table class="table table-bordered">
                                    <tr>
                                        <td>وزن</td>
                                        <td>${product.weight}کیلو گرم</td>
                                    </tr>
                                    <tr>
                                        <td>توان</td>
                                        <td>${product.watt} وات</td>
                                    </tr>
                                    <tr>
                                        <td>متعلقات</td>
                                        <td>${product.accessories}</td>
                                    </tr>
                                    <tr>
                                        <td>نوع</td>
                                        <td>${product.species}</td>
                                    </tr>
                                    <tr>
                                        <td>ساخت کشور</td>
                                        <td>${product.country}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="Reviews" role="tabpanel" aria-labelledby="Reviews-tab">
                                <div class="comments">
                                    <h5 class="product_tab_title">${product.rateCount} نظر برای
                                        <span>${product.name}</span></h5>
                                    <ul class="list_none comment_list mt-4">
                                        <c:forEach items="${Rates}" var="rate">
                                            <li>
                                                <div class="comment_img">
                                                    <c:choose>
                                                        <c:when test="${rate.suggestion == 1}">
                                                            <img src="${images}/positiveRate.png" alt="userImage"/>
                                                        </c:when>
                                                        <c:when test="${rate.suggestion == 0}">
                                                            <img src="${images}/noRate.png" alt="userImage"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="${images}/negativeRate.png" alt="userImage"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="comment_block">
                                                    <div class="rating_wrap">
                                                        <div class="rating">
                                                            <div class="product_rate"
                                                                 style="width:${rate.rateNumber *20}%"></div>
                                                        </div>
                                                    </div>
                                                    <p class="customer_meta">
                                                        <span class="review_author">${rate.userName}</span>
                                                        <span class="comment-date">${rate.timeSent}</span>
                                                    </p>
                                                    <div class="description">
                                                        <p>${rate.description}</p>
                                                    </div>
                                                </div>
                                            </li>

                                        </c:forEach>

                                    </ul>
                                </div>
                                <div class="review_form field_form">
                                    <h5>ارسال نظرات</h5>
                                    <c:choose>
                                        <c:when test="${empty userModel.id}">
                                            ${id = 0}
                                        </c:when>
                                        <c:otherwise>
                                            ${id = userModel.id}
                                        </c:otherwise>
                                    </c:choose>
                                    <sf:form class="row mt-3" action="${contextRoot}/user/${product.id}/rate/${id}"
                                             method="post" modelAttribute="rate">
                                        <div id="rating"></div>

                                        <div class="form-group col-12"></div>

                                        <div class="form-group col-12">
                                            <sf:textarea path="description" required="required" placeholder="نظر شما *"
                                                         class="form-control" name="message" rows="4"/>
                                        </div>
                                        <security:authorize access="isAuthenticated()">

                                            <div class="form-group col-md-6">
                                                <sf:input path="userName" required="required"
                                                          placeholder="نام خود را وارد کنید *"
                                                          value="${userModel.fullName}" class="form-control"
                                                          name="name"/>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <sf:input path="userEmail" required="required"
                                                          placeholder="ایمیل خود را وارد کنید *" class="form-control"
                                                          value="${userModel.userEmail}" name="email" type="email"/>
                                            </div>

                                        </security:authorize>

                                        <security:authorize access="isAnonymous()">

                                            <div class="form-group col-md-6">
                                                <sf:input path="userName" required="required"
                                                          placeholder="نام خود را وارد کنید *"
                                                          class="form-control"
                                                          name="name"/>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <sf:input path="userEmail" required="required"
                                                          placeholder="ایمیل خود را وارد کنید *" class="form-control"
                                                          name="email" type="email"/>
                                            </div>

                                        </security:authorize>

                                        <div class="form-group col-md-6">
                                            <label for="suggestion">ایا این محصول را پیشنهاد میکنید؟ :</label>
                                            <sf:select path="suggestion" required="required"
                                                       placeholder="ایا این محصول را پیشنهاد میکنید؟"
                                                       class="form-control" name="suggestion">
                                                <sf:option value="1" label="پیشنهاد می کنم"/>
                                                <sf:option value="0" label="نظری ندارم"/>
                                                <sf:option value="-1" label="پیشنهاد نمی کنم"/>
                                            </sf:select>
                                            <sf:hidden path="rateNumber" id="hdrating" name="hdrating"/>
                                            <sf:hidden path="productId"/>
                                            <sf:hidden path="userId"/>

                                        </div>

                                        <div class="form-group col-12">
                                            <button type="submit" class="btn btn-fill-out" name="submit" value="Submit">
                                                ارسال نظر
                                            </button>
                                        </div>

                                    </sf:form>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="small_divider"></div>
                    <div class="divider"></div>
                    <div class="medium_divider"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="heading_s1">
                        <h3>محصولات مرتبط</h3>
                    </div>
                    <div class="releted_product_slider carousel_slider owl-carousel owl-theme" data-margin="20"
                         data-responsive='{"0":{"items": "1"}, "481":{"items": "2"}, "768":{"items": "3"}, "1199":{"items": "4"}}'>
                        <div class="item">
                            <div class="product">
                                <div class="product_img">
                                    <a href="shop-product-detail.html">
                                        <img src="assets/images/product_img1.jpg" alt="product_img1">
                                    </a>
                                    <div class="product_action_box">
                                        <ul class="list_none pr_action_btn">
                                            <li class="add-to-cart"><a href="#"><i class="icon-basket-loaded"></i>
                                                افزودن به سبد خرید</a></li>
                                            <li><a href="shop-compare.html"><i class="icon-shuffle"></i></a></li>
                                            <li><a href="shop-quick-view.html" class="popup-ajax"><i
                                                    class="icon-magnifier-add"></i></a></li>
                                            <li><a href="#"><i class="icon-heart"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product_info">
                                    <h6 class="product_title"><a href="shop-product-detail.html">لباس آبی زنانه</a></h6>
                                    <div class="product_price">
                                        <span class="price">45000 تومان</span>
                                        <del>55000 تومان</del>
                                        <div class="on_sale">
                                            <span>٪35 تخفیف</span>
                                        </div>
                                    </div>
                                    <div class="rating_wrap">
                                        <div class="rating">
                                            <div class="product_rate" style="width:80%"></div>
                                        </div>
                                        <span class="rating_num">(21)</span>
                                    </div>
                                    <div class="pr_desc">
                                        <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از
                                            طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله.</p>
                                    </div>
                                    <div class="pr_switch_wrap">
                                        <div class="product_color_switch">
                                            <span class="active" data-color="#87554B"></span>
                                            <span data-color="#333333"></span>
                                            <span data-color="#DA323F"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product">
                                <div class="product_img">
                                    <a href="shop-product-detail.html">
                                        <img src="assets/images/product_img2.jpg" alt="product_img2">
                                    </a>
                                    <div class="product_action_box">
                                        <ul class="list_none pr_action_btn">
                                            <li class="add-to-cart"><a href="#"><i class="icon-basket-loaded"></i>
                                                افزودن به سبد خرید</a></li>
                                            <li><a href="shop-compare.html"><i class="icon-shuffle"></i></a></li>
                                            <li><a href="shop-quick-view.html" class="popup-ajax"><i
                                                    class="icon-magnifier-add"></i></a></li>
                                            <li><a href="#"><i class="icon-heart"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product_info">
                                    <h6 class="product_title"><a href="shop-product-detail.html">کت اسپرت خاکستری</a>
                                    </h6>
                                    <div class="product_price">
                                        <span class="price">55000 تومان</span>
                                        <del>95000 تومان</del>
                                        <div class="on_sale">
                                            <span>٪25 تخفیف</span>
                                        </div>
                                    </div>
                                    <div class="rating_wrap">
                                        <div class="rating">
                                            <div class="product_rate" style="width:68%"></div>
                                        </div>
                                        <span class="rating_num">(15)</span>
                                    </div>
                                    <div class="pr_desc">
                                        <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از
                                            طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله.</p>
                                    </div>
                                    <div class="pr_switch_wrap">
                                        <div class="product_color_switch">
                                            <span class="active" data-color="#847764"></span>
                                            <span data-color="#0393B5"></span>
                                            <span data-color="#DA323F"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product">
                                <span class="pr_flash">جدید</span>
                                <div class="product_img">
                                    <a href="shop-product-detail.html">
                                        <img src="assets/images/product_img3.jpg" alt="product_img3">
                                    </a>
                                    <div class="product_action_box">
                                        <ul class="list_none pr_action_btn">
                                            <li class="add-to-cart"><a href="#"><i class="icon-basket-loaded"></i>
                                                افزودن به سبد خرید</a></li>
                                            <li><a href="shop-compare.html"><i class="icon-shuffle"></i></a></li>
                                            <li><a href="shop-quick-view.html" class="popup-ajax"><i
                                                    class="icon-magnifier-add"></i></a></li>
                                            <li><a href="#"><i class="icon-heart"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product_info">
                                    <h6 class="product_title"><a href="shop-product-detail.html">لباس کامل زنانه</a>
                                    </h6>
                                    <div class="product_price">
                                        <span class="price">68000 تومان</span>
                                        <del>99000 تومان</del>
                                    </div>
                                    <div class="rating_wrap">
                                        <div class="rating">
                                            <div class="product_rate" style="width:87%"></div>
                                        </div>
                                        <span class="rating_num">(25)</span>
                                    </div>
                                    <div class="pr_desc">
                                        <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از
                                            طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله.</p>
                                    </div>
                                    <div class="pr_switch_wrap">
                                        <div class="product_color_switch">
                                            <span class="active" data-color="#333333"></span>
                                            <span data-color="#7C502F"></span>
                                            <span data-color="#2F366C"></span>
                                            <span data-color="#874A3D"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product">
                                <div class="product_img">
                                    <a href="shop-product-detail.html">
                                        <img src="assets/images/product_img4.jpg" alt="product_img4">
                                    </a>
                                    <div class="product_action_box">
                                        <ul class="list_none pr_action_btn">
                                            <li class="add-to-cart"><a href="#"><i class="icon-basket-loaded"></i>
                                                افزودن به سبد خرید</a></li>
                                            <li><a href="shop-compare.html"><i class="icon-shuffle"></i></a></li>
                                            <li><a href="shop-quick-view.html" class="popup-ajax"><i
                                                    class="icon-magnifier-add"></i></a></li>
                                            <li><a href="#"><i class="icon-heart"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product_info">
                                    <h6 class="product_title"><a href="shop-product-detail.html">پیراهن آبی روشن</a>
                                    </h6>
                                    <div class="product_price">
                                        <span class="price">69000 تومان</span>
                                        <del>89000 تومان</del>
                                        <div class="on_sale">
                                            <span>٪20 تخفیف</span>
                                        </div>
                                    </div>
                                    <div class="rating_wrap">
                                        <div class="rating">
                                            <div class="product_rate" style="width:70%"></div>
                                        </div>
                                        <span class="rating_num">(22)</span>
                                    </div>
                                    <div class="pr_desc">
                                        <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از
                                            طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله.</p>
                                    </div>
                                    <div class="pr_switch_wrap">
                                        <div class="product_color_switch">
                                            <span class="active" data-color="#333333"></span>
                                            <span data-color="#A92534"></span>
                                            <span data-color="#B9C2DF"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product">
                                <div class="product_img">
                                    <a href="shop-product-detail.html">
                                        <img src="assets/images/product_img5.jpg" alt="product_img5">
                                    </a>
                                    <div class="product_action_box">
                                        <ul class="list_none pr_action_btn">
                                            <li class="add-to-cart"><a href="#"><i class="icon-basket-loaded"></i>
                                                افزودن به سبد خرید</a></li>
                                            <li><a href="shop-compare.html"><i class="icon-shuffle"></i></a></li>
                                            <li><a href="shop-quick-view.html" class="popup-ajax"><i
                                                    class="icon-magnifier-add"></i></a></li>
                                            <li><a href="#"><i class="icon-heart"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product_info">
                                    <h6 class="product_title"><a href="shop-product-detail.html">لباس آبی زنانه</a></h6>
                                    <div class="product_price">
                                        <span class="price">45000 تومان</span>
                                        <del>55000 تومان</del>
                                        <div class="on_sale">
                                            <span>٪35 تخفیف</span>
                                        </div>
                                    </div>
                                    <div class="rating_wrap">
                                        <div class="rating">
                                            <div class="product_rate" style="width:80%"></div>
                                        </div>
                                        <span class="rating_num">(21)</span>
                                    </div>
                                    <div class="pr_desc">
                                        <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از
                                            طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله.</p>
                                    </div>
                                    <div class="pr_switch_wrap">
                                        <div class="product_color_switch">
                                            <span class="active" data-color="#87554B"></span>
                                            <span data-color="#333333"></span>
                                            <span data-color="#5FB7D4"></span>
                                        </div>
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
</div>
<!-- END MAIN CONTENT -->

