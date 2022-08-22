<%--
  Created by IntelliJ IDEA.
  User: Dour-Andish
  Date: 8/6/2020
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header_wrap fixed-top header_with_topbar">
    <div class="bottom_header dark_skin main_menu_uppercase">
        <div class="container">
            <nav class="navbar navbar-expand-lg">
                <a class="navbar-brand" href="${contextRoot}/home">
                    <img class="logo_light" src="assets/images/logo_light.png" alt="logo" />
                    <img class="logo_dark" src="assets/images/logo_dark.png" alt="logo" />
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-expanded="false">
                    <span class="ion-android-menu"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li><a class="nav-link nav_item" href="${contextRoot}/home">خانه</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle nav-link active" href="#" data-toggle="dropdown">صفحات</a>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a class="dropdown-item nav-link nav_item" href="${contextRoot}/about">درباره ما</a></li>
                                    <li><a class="dropdown-item nav-link nav_item" href="${contextRoot}/contact">تماس با ما</a></li>
                                    <li><a class="dropdown-item nav-link nav_item" href="faq.html">سؤالات متداول</a></li>
                                    <li><a class="dropdown-item nav-link nav_item" href="${contextRoot}/login">ورود</a></li>
                                    <li><a class="dropdown-item nav-link nav_item" href="${contextRoot}/membership">ثبت نام</a></li>
                                    <li><a class="dropdown-item nav-link nav_item" href="term-condition.html">شرایط و ضوابط</a></li>
                                </ul>
                            </div>
                        </li>

                        <li><a class="nav-link nav_item" href="contact.html">تماس با ما</a></li>
                    </ul>
                </div>
                <ul class="navbar-nav attr-nav align-items-center">
                    <li><a href="javascript:void(0);" class="nav-link search_trigger"><i class="linearicons-magnifier"></i></a>
                        <div class="search_wrap">
                            <span class="close-search"><i class="ion-ios-close-empty"></i></span>
                            <form action="${contextRoot}/show/search/0/product?SearchName=searchProduct&sort=name&sortBy=desc&currentPage=1" method="post">
                                <input type="text" placeholder="جستجو" class="form-control" id="search_input" name="searchText">
                                <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                                <button type="submit" class="search_icon"><i class="ion-ios-search-strong"></i></button>
                            </form>
                        </div><div class="search_overlay"></div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
