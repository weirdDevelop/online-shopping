<%--
  Created by IntelliJ IDEA.
  User: Dour-Andish
  Date: 10/11/2020
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- START SECTION BREADCRUMB -->
<div class="breadcrumb_section bg_gray page-title-mini">
    <div class="container"><!-- STRART CONTAINER -->
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="page-title">
                    <h1>مدیریت</h1>
                </div>
            </div>
            <div class="col-md-6">
                <ol class="breadcrumb justify-content-md-end">
                    <li class="breadcrumb-item"><a href="${contextRoot}/home">خانه</a></li>
                    <li class="breadcrumb-item active">حساب مدیریت</li>
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
                <div class="col-lg-3 col-md-4">
                    <div class="dashboard_menu">
                        <ul class="nav nav-tabs flex-column" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="dashboard-tab" data-toggle="tab" href="#dashboard" role="tab" aria-controls="dashboard" aria-selected="false"><i class="ti-layout-grid2"></i>داشبورد</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="unConfirmedOrders-tab" data-toggle="tab" href="#unConfirmedOrders" role="tab" aria-controls="unConfirmedOrders" aria-selected="false"><i class="ti-shopping-cart-full"></i>سفارشات تایید نشده</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="unConfirmedRates-tab" data-toggle="tab" href="#unConfirmedRates" role="tab" aria-controls="unConfirmedOrders" aria-selected="false"><i class="ti-shopping-cart-full"></i>نظرات</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="ConfirmedOrders-tab" data-toggle="tab" href="#confirmedOrders" role="tab" aria-controls="confirmedOrders" aria-selected="false"><i class="ti-shopping-cart-full"></i>سفارشات تایید شده</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${contextRoot}/logout"><i class="ti-lock"></i>خروج</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8">
                    <div class="tab-content dashboard_content">

                        <div class="tab-pane fade" id="unConfirmedOrders" role="tabpanel" aria-labelledby="orders-tab">
                            <table id="unConfirmedOrdersListTable" class="table table-striped table-borderd">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>کد کاربر</th>
                                    <th>مبلغ کل</th>
                                    <th>آدرس ارسال</th>
                                    <th>تعداد سفارش</th>
                                    <th>تاریخ سفارش</th>
                                    <th>وضعیت سفارش</th>
                                    <th>محصولات سفارش</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>id</th>
                                    <th>کد کاربر</th>
                                    <th>مبلغ کل</th>
                                    <th>آدرس ارسال</th>
                                    <th>تعداد سفارش</th>
                                    <th>تاریخ سفارش</th>
                                    <th>وضعیت سفارش</th>
                                    <th>محصولات سفارش</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="unConfirmedRates" role="tabpanel" aria-labelledby="Rates-tab">
                            <table id="unConfirmedRatesListTable" class="table table-striped table-borderd">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>ایمیل فرستنده</th>
                                    <th>توضیحات</th>
                                    <th>نمره داده شده</th>
                                    <th>نام کاربری</th>
                                    <th>آیدی محصول</th>
                                    <th>وضعیت</th>
                                    <th>وضعیت پیشنهاد</th>
                                    <th>تاریخ ارسال</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>id</th>
                                    <th>ایمیل فرستنده</th>
                                    <th>توضیحات</th>
                                    <th>نمره داده شده</th>
                                    <th>نام کاربری</th>
                                    <th>آیدی محصول</th>
                                    <th>وضعیت</th>
                                    <th>وضعیت پیشنهاد</th>
                                    <th>تاریخ ارسال</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="confirmedOrders" role="tabpanel" aria-labelledby="orders-tab">
                            <table id="ConfirmedOrdersListTable" class="table table-striped table-borderd">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>کد کاربر</th>
                                    <th>مبلغ کل</th>
                                    <th>آدرس ارسال</th>
                                    <th>تعداد سفارش</th>
                                    <th>تاریخ سفارش</th>
                                    <th>وضعیت سفارش</th>
                                    <th>کد پستی ارسال</th>
                                    <th>محصولات سفارش</th>

                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>id</th>
                                    <th>کد کاربر</th>
                                    <th>مبلغ کل</th>
                                    <th>آدرس ارسال</th>
                                    <th>تعداد سفارش</th>
                                    <th>تاریخ سفارش</th>
                                    <th>وضعیت سفارش</th>
                                    <th>کد پستی ارسال</th>
                                    <th>محصولات سفارش</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="orderItemsListModal" tabindex="-1" role="dialog" aria-labelledby="orderItemsListModalLabel">
                <div class="modal-dialog modal-xl" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="orderItemsListModalLabel">view order items</h4>
                        </div>
                        <div class="modal-body">
                            <table id="orderItemsPerOrderDetailsTable" class="table table-striped table-borderd">
                                <thead>
                                <tr>
                                    <th>عکس محصول</th>
                                    <th>id</th>
                                    <th>آیدی محصول</th>
                                    <th>اسم محصول</th>
                                    <th>قیمت  اصلی محصول</th>
                                    <th>تخفیف محصول</th>
                                    <th>تعداد محصول</th>
                                    <th>قیمت بعد از تخفیف</th>
                                    <th>مجموع</th>
                                    <th>مشاهده محصول</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>عکس محصول</th>
                                    <th>id</th>
                                    <th>آیدی محصول</th>
                                    <th>اسم محصول</th>
                                    <th>قیمت  اصلی محصول</th>
                                    <th>تخفیف محصول</th>
                                    <th>تعداد محصول</th>
                                    <th>قیمت بعد از تخفیف</th>
                                    <th>مجموع</th>
                                    <th>مشاهده محصول</th>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="addProductPostalCodeModal" tabindex="-2" role="dialog" aria-labelledby="addProductPostalCodeModalLabel">
                <div class="modal-dialog modal-xl" role="document">
                    <div class="modal-content" id="updateOrderModal">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="addProductPostalCodeModalLabel">view order items</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" action="${contextRoot}/manage/admin/orderDetail/update"
                                  method="POST" id="updateOrderForm">

                                <div class="form-group">
                                    <label class="control-label col-md-4">order postal code</label>
                                    <textarea  class="form-control"
                                               placeholder="Enter order postal code!" id="orderPostalCode" name="orderPostalCode"></textarea>

                                </div>

                                <div class="form-group">

                                    <div class="col-md-offset-4 col-md-4">
                                        <input type="hidden" id="id" name="id">
                                        <input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}"/>
                                        <input type="submit" name="submit" value="Save"  class="btn btn-primary"/>

                                    </div>
                                </div>


                            </form>




                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="userOrderAddressModalForAdmin" tabindex="-1" role="dialog" aria-labelledby="orderAddressModalLabel">
                <div class="modal-dialog " role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="orderAddressModalLabel">مشاهده ادرس سفارش</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-3"></div>
                                <div class="col-lg-6">
                                    <div class="card mb-3 mb-lg-0">
                                        <div class="card-header">
                                            <h3>آدرس ارسال خرید</h3>
                                        </div>
                                        <div class="card-body" id="userAddressForAdmin">

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
