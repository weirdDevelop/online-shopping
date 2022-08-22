<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dour-Andish
  Date: 9/7/2020
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="availableCount" value="${userModel.cart.cartLines}"/>

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
                    <h1>سبد خرید</h1>
                </div>
            </div>
            <div class="col-md-6">
                <ol class="breadcrumb justify-content-md-end">
                    <li class="breadcrumb-item"><a href="${contextRoot}/home">خانه</a></li>
                    <li class="breadcrumb-item active">سبد خرید</li>
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


            <c:if test="${not empty message}">

                <div class="alert alert-info">
                    <h3 class="text-center">${message}</h3>
                </div>

            </c:if>
            <div class="row">
                <div class="col-12">
                    <c:choose>
                        <c:when test="${not empty cartLines}">
                            <div class="table-responsive shop_cart_table">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th class="product-thumbnail">&nbsp;</th>
                                        <th class="product-name">محصول</th>
                                        <th class="product-price">قیمت</th>
                                        <th class="product-quantity">تعداد</th>
                                        <th class="product-subtotal">جمع</th>
                                        <th class="product-remove">به روز رسانی / حذف</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${cartLines}" var="cartLine">
                                        <c:if test="${cartLine.available == false}">
                                            <c:set var="availableCount" value="${availableCount - 1}"/>
                                        </c:if>

                                        <tr>
                                            <td class="product-thumbnail"><a href="#"><img
                                                    src="${images}/${cartLine.product.code}.jpg"
                                                    alt="${cartLine.product.name}"></a></td>
                                            <td class="product-name" data-title="محصول"><h4
                                                    class="nomargin">${cartLine.product.name}
                                                <c:if test="${cartLine.available == false}">
                                                    <strong style="color:red">(Not Available)</strong>
                                                </c:if>
                                            </h4>
                                                <p>Brand : ${cartLine.product.brand}</p>
                                                <p>Description : ${cartLine.product.description}</p></td>
                                            <td class="product-price" data-title="قیمت">
                                                 ${cartLine.buyingPrice} تومان </td>
                                            <td class="product-quantity" data-title="تعداد">
                                                <div class="quantity">
                                                    <input type="button" value="-" class="minus">
                                                    <input type="text" id="count_${cartLine.id}" name="quantity"
                                                           value="${cartLine.productCount}" title="Qty" class="qty"
                                                           size="4" min="1" max="3">
                                                    <input type="button" value="+" class="plus">
                                                </div>
                                            </td>
                                            <td class="product-subtotal" data-title="جمع"> تومان${cartLine.total}</td>
                                            <td class="product-remove" data-title="به روز رسانی/حذف">
                                                <c:if test="${cartLine.available == true}">
                                                    <button type="button" name="refreshCart" class="btn btn-info " value="${cartLine.id}">
                                                        <span class="ti ti-reload"></span></button>

                                                </c:if>
                                                <a href="${contextRoot}/cart/${cartLine.id}/remove"><i
                                                        class="ti-close"></i></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="6" class="px-0">
                                            <div class="row no-gutters align-items-center">

                                                <div class="col-lg-4 col-md-6 mb-3 mb-md-0">
                                                    <div class="coupon field_form input-group">
                                                        <input type="text" value="" class="form-control form-control-sm"
                                                               placeholder="شماره کوپن را وارد کنید...">
                                                        <div class="input-group-append">
                                                            <button class="btn btn-fill-out btn-sm" type="submit">کوپن
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>



                                            </div>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="jumbotron">

                                <h3 class="text-center">Your Cart is Empty!</h3>

                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="medium_divider"></div>
                    <div class="divider center_icon"><i class="ti-shopping-cart-full"></i></div>
                    <div class="medium_divider"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="heading_s1 mb-3">
                        <h6>محاسبه هزینه ارسال</h6>
                    </div>
                    <form class="field_form shipping_calculator">
                        <div class="form-row">
                            <div class="form-group col-lg-12">
                                <div class="custom_select">
                                    <select class="form-control">
                                        <option value="">یک گزینه را انتخاب کنید ...</option>
                                        <option value="AF"> افغانستان</option>
                                        <option value="AL"> آلبانی</option>
                                        <option value="DZ"> الجزایر</option>
                                        <option value="AO"> آنگولا</option>
                                        <option value="AI"> آنگولا</option>
                                        <option value="AQ"> قطب جنوب</option>
                                        <option value="AG"> آنتیگوا و باربودا</option>
                                        <option value="AR"> آرژانتین</option>
                                        <option value="AM"> ارمنستان</option>
                                        <option value="AW"> آروبا</option>
                                        <option value="AU"> استرالیا</option>
                                        <option value="AT"> اتریش</option>
                                        <option value="AZ"> آذربایجان</option>
                                        <option value="BH"> بحرین</option>
                                        <option value="BD"> بنگلادش</option>
                                        <option value="BB"> باربادوس</option>
                                        <option value="BY"> بلاروس</option>
                                        <option value="BE"> بلژیک</option>
                                        <option value="BZ"> بلیز</option>
                                        <option value="BJ"> بنین</option>
                                        <option value="BM"> برمودا</option>
                                        <option value="BT"> بوتان</option>
                                        <option value="BO"> بولیوی</option>
                                        <option value="BA"> بوسنی و هرزگوین</option>
                                        <option value="BW"> بوتسوانا</option>
                                        <option value="BR"> برزیل</option>
                                        <option value="IO"> قلمرو اقیانوس هند بریتانیا</option>
                                        <option value="VG"> جزایر ویرجین بریتانیا</option>
                                        <option value="BN"> برونئی</option>
                                        <option value="BG"> بلغارستان</option>
                                        <option value="BI"> بوروندی</option>
                                        <option value="KH"> کامبوج</option>
                                        <option value="CM"> کامرون</option>
                                        <option value="CA"> کانادا</option>
                                        <option value="CV"> کیپ ورد</option>
                                        <option value="KY"> جزایر کیمن</option>
                                        <option value="CF"> جمهوری آفریقای مرکزی</option>
                                        <option value="TD"> چاد</option>
                                        <option value="CL"> شیلی</option>
                                        <option value="CN"> چین</option>
                                        <option value="CX"> جزیره کریسمس</option>
                                        <option value="CC"> جزایر کوکوس</option>
                                        <option value="CO"> کلمبیا</option>
                                        <option value="KM"> کومور</option>
                                        <option value="CG"> کنگو</option>
                                        <option value="CD"> کنگو</option>
                                        <option value="CK"> جزایر کوک</option>
                                        <option value="CR"> کاستاریکا</option>
                                        <option value="HR"> کرواسی</option>
                                        <option value="CU"> کوبا</option>
                                        <option value="CW"> کورااائو</option>
                                        <option value="CY"> قبرس</option>
                                        <option value="CZ"> جمهوری چک</option>
                                        <option value="DK"> دانمارک</option>
                                        <option value="DJ"> جیبوتی</option>
                                        <option value="DM"> دومینیکا</option>
                                        <option value="DO"> جمهوری دومنیکن</option>
                                        <option value="EC"> اکوادور</option>
                                        <option value="EG"> مصر</option>
                                        <option value="SV"> السالوادور</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-lg-6">
                                <input required="required" placeholder="کشور" class="form-control" name="name"
                                       type="text">
                            </div>
                            <div class="form-group col-lg-6">
                                <input required="required" placeholder="کد پستی" class="form-control" name="name"
                                       type="text">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-lg-12">
                                <button class="btn btn-fill-line" type="submit">به روزرسانی کل</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6">
                    <div class="border p-3 p-md-4">
                        <div class="heading_s1 mb-3">
                            <h6>جمع سبد خرید</h6>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td class="cart_total_label">جمع سبد خرید</td>
                                    <td class="cart_total_amount"> تومان ${userModel.cart.grandTotal}</td>
                                </tr>
                                <tr>
                                    <td class="cart_total_label">هزینه ارسال</td>
                                    <td class="cart_total_amount">ارسال رایگان</td>
                                </tr>
                                <tr>
                                    <td class="cart_total_label">جمع</td>
                                    <td class="cart_total_amount"><strong>${userModel.cart.grandTotal}</strong></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <c:choose>
                            <c:when test="${availableCount != 0}">
                                <a href="${contextRoot}/cart/validate"
                                   class="btn btn-fill-out">ادامه </a>
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:void(0)"
                                   class="btn btn-fill-out disabled">ادامه </a>
                            </c:otherwise>
                        </c:choose>

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
                        <p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک
                            است</p>
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
<script src="assets/js/jquery-1.12.4.min.js"></script>
<!-- jquery-ui -->
<script src="assets/js/jquery-ui.js"></script>
<!-- popper min js -->
<script src="assets/js/popper.min.js"></script>
<!-- Latest compiled and minified Bootstrap -->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<!-- owl-carousel min js -->
<script src="assets/owlcarousel/js/owl.carousel.min.js"></script>
<!-- magnific-popup min js -->
<script src="assets/js/magnific-popup.min.js"></script>
<!-- waypoints min js -->
<script src="assets/js/waypoints.min.js"></script>
<!-- parallax js -->
<script src="assets/js/parallax.js"></script>
<!-- countdown js -->
<script src="assets/js/jquery.countdown.min.js"></script>
<!-- imagesloaded js -->
<script src="assets/js/imagesloaded.pkgd.min.js"></script>
<!-- isotope min js -->
<script src="assets/js/isotope.min.js"></script>
<!-- jquery.dd.min js -->
<script src="assets/js/jquery.dd.min.js"></script>
<!-- slick js -->
<script src="assets/js/slick.min.js"></script>
<!-- elevatezoom js -->
<script src="assets/js/jquery.elevatezoom.js"></script>
<!-- scripts js -->
<script src="assets/js/scripts.js"></script>

