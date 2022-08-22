<%--
  Created by IntelliJ IDEA.
  User: Dour-Andish
  Date: 8/10/2020
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="mt-4 staggered-animation-wrap">
    <div class="custom-container">
        <div class="row">
            <div class="col-lg-9 offset-lg-3">
                <c:choose>
                    <c:when test="${userClickAllProducts == true}">
                        <script>
                            window.categoryId = '';
                            window.subCategoryId='';
                            window.brandId='';
                        </script>

                        <div class="breadcrumb  bg_gray">
                            <div class="container"><!-- STRART CONTAINER -->
                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <div class="page-title">
                                            <h1>محصولات</h1>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <ol class="breadcrumb justify-content-md-end">
                                            <li class="breadcrumb-item"><a href="${contextRoot}/home">خانه</a></li>
                                            <li class="breadcrumb-item active">همه ی محصولات</li>
                                        </ol>
                                    </div>
                                </div>
                            </div><!-- END CONTAINER-->
                        </div>
                    </c:when>
                    <c:when test="${userClickCategoryProducts == true}">
                        <script>
                            window.categoryId = '${category.id}';
                        </script>

                        <div class="breadcrumb  bg_gray">
                            <div class="container"><!-- STRART CONTAINER -->
                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <div class="page-title">
                                            <h1>محصولات</h1>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <ol class="breadcrumb justify-content-md-end">
                                            <li class="breadcrumb-item"><a href="${contextRoot}/home">خانه</a></li>
                                            <li class="breadcrumb-item active">${category.name}</li>
                                        </ol>
                                    </div>
                                </div>
                            </div><!-- END CONTAINER-->
                        </div>
                    </c:when>
                    <c:when test="${userClickSubCategoryProducts == true}">
                        <script>
                            window.subCategoryId = '${subCategory.id}';
                        </script>

                        <div class="breadcrumb bg_gray ">
                            <div class="container"><!-- STRART CONTAINER -->
                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <div class="page-title">
                                            <h1>محصولات</h1>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <ol class="breadcrumb justify-content-md-end">
                                            <li class="breadcrumb-item"><a href="${contextRoot}/home">خانه</a></li>
                                            <li class="breadcrumb-item"><a href="${contextRoot}/show/category/${category.id}/products"> ${category.name}</a></li>
                                            <li class="breadcrumb-item active">${subCategory.name}</li>
                                        </ol>
                                    </div>
                                </div>
                            </div><!-- END CONTAINER-->
                        </div>
                    </c:when>
                    <c:when test="${userClickBrandProducts == true}">
                        <script>
                            window.brandId= '${brand.id}';
                        </script>

                        <div class="breadcrumb bg_gray ">
                            <div class="container"><!-- STRART CONTAINER -->
                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <div class="page-title">
                                            <h1>محصولات</h1>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <ol class="breadcrumb justify-content-md-end">
                                            <li class="breadcrumb-item"><a href="${contextRoot}/home">خانه</a></li>
                                            <li class="breadcrumb-item active">${brand.name}</li>
                                        </ol>
                                    </div>
                                </div>
                            </div><!-- END CONTAINER-->
                        </div>

                    </c:when>
                </c:choose>



            </div>

        </div>

        <div class="row small_padding">

            <div class="col-lg-9 offset-lg-3">

                <table id="productListTable" class="table table-striped table-borderd">


                    <thead>

                    <tr>
                        <th></th>
                        <th>نام</th>
                        <th>برند</th>
                        <th>قیمت</th>
                        <th>موجودی</th>
                        <th></th>

                    </tr>

                    </thead>


                    <tfoot>

                    <tr>
                        <th></th>
                        <th>نام</th>
                        <th>برند</th>
                        <th>قیمت</th>
                        <th>موجودی</th>
                        <th></th>

                    </tr>

                    </tfoot>
                </table>

            </div>

        </div>
    </div>
</div>
