<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<script>
    window.userRole = '${userModel.role}';
</script>
<header class="header_wrap">
    <div class="top-header light_skin bg_dark d-none d-md-block">
        <div class="custom-container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-8">
                    <div class="header_topbar_info">
                        <div class="header_offer">
                            <span>ارسال رایگان خرید بیشتر از 100 هزار تومان</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="middle-header dark_skin">
        <div class="custom-container">
            <div class="nav_block">
                <a class="navbar-brand" href="${contextRoot}/home">
                    <img class="logo_light" src="assets/images/logo_light.png" alt="logo" />
                    <img class="logo_dark" src="assets/images/logo_dark.png" alt="logo" />
                </a>
                <div class="product_search_form rounded_input">
                    <form action="${contextRoot}/show/search/0/product?SearchName=searchProduct&sort=name&sortBy=desc&currentPage=1" method="post">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="custom_select">
                                    <select class="first_null" name="searchCat">
                                        <option value="0">همه دسته ها</option>
                                        <c:forEach items="${categories}" var="category">
                                            <option value="${category.key.id}" >${category.key.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <input class="form-control" placeholder="جستجوی محصول ..." required="" name="searchText" type="text">
                            <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                            <button type="submit" class="search_btn2"><i class="fa fa-search"></i></button>
                        </div>
                    </form>
                </div>

                <ul class="navbar-nav attr-nav align-items-center">
                    <security:authorize access="isAuthenticated()">
                    <li><a href="#" class="nav-link">${userModel.fullName}<i class="linearicons-user"></i></a></li>

                        <security:authorize access="hasAuthority('USER')">

                    <li class="dropdown cart_dropdown"><a class="nav-link cart_trigger" href="#" data-toggle="dropdown"><i class="linearicons-bag2"></i><span class="cart_count">${userModel.cart.cartLines}</span><span class="amount">${userModel.cart.grandTotal}<span class="currency_symbol"> تومان</span></span></a>
                        <div class="cart_box cart_right dropdown-menu dropdown-menu-right">
                            <ul class="cart_list">
                                <c:forEach items="${userModel.cartLines}" var="item">
                                    <li>
                                        <a href="#" class="item_remove"><i class="ion-close"></i></a>
                                        <a href="#"><img src="${images}/${item.product.code}.jpg" alt="cart_thumb1">${item.product.name}</a>
                                        <span class="cart_quantity">    ${item.productCount}عدد <span class="cart_amount"> <span class="price_symbole">${item.buyingPrice*item.productCount}تومان </span></span></span>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="cart_footer">
                                <p class="cart_total"><strong>جمع:</strong> ${userModel.cart.grandTotal} <span class="cart_price"> <span class="price_symbole">تومان</span></span></p>
                                <p class="cart_buttons"><a href="${contextRoot}/cart/show" class="btn btn-fill-line view-cart">سبد خرید</a><a href="#" class="btn btn-fill-out checkout">بررسی</a></p>
                            </div>
                        </div>
                    </li>
                        </security:authorize>
                    </security:authorize>
                </ul>

            </div>
        </div>
    </div>
    <div class="bottom_header dark_skin main_menu_uppercase border-top border-bottom">
        <div class="custom-container">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6 col-3">
                    <div class="categories_wrap">
                        <button type="button" data-toggle="collapse" data-target="#navCatContent" aria-expanded="false" class="categories_btn">
                            <i class="linearicons-menu"></i><span>همه دسته بندی ها </span>
                        </button>
                        <div id="navCatContent" class="nav_cat navbar collapse">
                            <ul>
                                <c:forEach items="${categories}" var="category">
                                <li class="dropdown dropdown-mega-menu">
                                    <a class="dropdown-item nav-link dropdown-toggler" href="#"  data-toggle="dropdown"><i class="flaticon-tv"></i> <span>${category.key.name}</span></a>
                                    <div class="dropdown-menu">
                                        <ul class="mega-menu d-lg-flex">
                                            <li class="mega-menu-col col-lg-7">
                                                <ul class="d-lg-flex">
                                                    <li class="mega-menu-col col-lg-6">
                                                        <ul>
                                                            <li class="dropdown-header"><a href="${contextRoot}/show/category/${category.key.id}/products">نمایش همه ی محصولات مرتبط</a></li>
                                                            <c:forEach items="${category.value}" var="subCat">
                                                            <li><a class="dropdown-item nav-link nav_item" href="${contextRoot}/show/subCategory/${subCat.id}/products">${subCat.name}</a></li>

                                                            </c:forEach>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="mega-menu-col col-lg-5">
                                                <div class="header-banner2">
                                                    <c:set var="dateParts" value="${cfn:split(category.key.imageOneCaption, ',')}" />
                                                    <img src="${images}/${category.key.code}.jpg" alt="${category.key.name}">
                                                    <div class="banne_info">
                                                        <h6>${dateParts[0]}</h6>
                                                        <h4>${dateParts[1]}</h4>
                                                        <a href="${contextRoot}/${dateParts[2]}">اکنون خرید کنید</a>
                                                    </div>
                                                </div>
                                                <c:set var="dateParts1" value="${cfn:split(category.key.imageSecondCaption, ',')}" />
                                                <div class="header-banner2">
                                                    <img src="${images}/${category.key.code}1.jpg" alt="${category.key.name}">
                                                    <div class="banne_info">
                                                        <h6>${dateParts1[0]}</h6>
                                                        <h4>${dateParts1[1]}</h4>
                                                        <a href="${contextRoot}/${dateParts1[2]}">اکنون خرید کنید</a>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                             </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 col-sm-6 col-9">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler side_navbar_toggler" type="button" data-toggle="collapse" data-target="#navbarSidetoggle" aria-expanded="false">
                            <span class="ion-android-menu"></span>
                        </button>
                        <div class="pr_search_icon">
                            <a href="javascript:void(0);" class="nav-link pr_search_trigger"><i class="linearicons-magnifier"></i></a>
                        </div>
                        <div class="collapse navbar-collapse mobile_side_menu" id="navbarSidetoggle">
                            <ul class="navbar-nav">
                                <li class="dropdown">
                                    <a data-toggle="dropdown" class="nav-link nav_item active" href="${contextRoot}/home">خانه</a>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle nav-link" href="#" data-toggle="dropdown">صفحات</a>
                                    <div class="dropdown-menu">
                                        <ul>
                                            <li><a class="dropdown-item nav-link nav_item" href="${contextRoot}/about">درباره ما</a></li>
                                            <li><a class="dropdown-item nav-link nav_item" href="${contextRoot}/contact">تماس با ما</a></li>
                                            <li><a class="dropdown-item nav-link nav_item" href="${contextRoot}/show/all/products">محصولات</a></li>
                                        </ul>
                                    </div>
                                </li>

                                <security:authorize access="hasAuthority('ADMIN')">
                                    <li><a id="AdminManage" class="nav-link nav_item" href="${contextRoot}/manage/product">مدیرت محصولات</a></li>

                                </security:authorize>
                                <security:authorize access="hasAuthority('ADMIN')">
                                    <li><a id="AdminDashboard" class="nav-link nav_item" href="${contextRoot}/manage/admin/dashboard" >داشبورد</a></li>
                                </security:authorize>
                                <security:authorize access="hasAuthority('USER')">
                                    <li><a id="UserDashboard" class="nav-link nav_item" href="${contextRoot}/account/user/dashboard" >داشبورد</a></li>
                                </security:authorize>


                                <security:authorize access="isAnonymous()">
                                <li><a id="login" class="nav-link nav_item" href="${contextRoot}/login" >ورود</a></li>
                                <li><a id="signup" class="nav-link nav_item"href="${contextRoot}/membership">ثبت نام</a></li>
                                </security:authorize>
                                <security:authorize access="isAuthenticated()">
                                    <li><a id="logout" class="nav-link nav_item" href="${contextRoot}/logout" >خروج از حساب کاربری</a></li>
                                </security:authorize>

                            </ul>
                        </div>
                        <div class="contact_phone contact_support">
                            <i class="linearicons-phone-wave"></i>
                            <span>021-1234567</span>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>
