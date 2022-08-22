<%--
  Created by IntelliJ IDEA.
  User: Dour-Andish
  Date: 10/20/2020
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
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
                                <a class="nav-link" id="userOrders-tab" data-toggle="tab" href="#userOrders" role="tab" aria-controls="Orders" aria-selected="false"><i class="ti-shopping-cart-full"></i>سفارشات شما</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="userRates-tab" data-toggle="tab" href="#userRates" role="tab" aria-controls="Rates" aria-selected="false"><i class="ti-shopping-cart-full"></i>نظرات شما</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="userAddress-tab" data-toggle="tab" href="#address" role="tab" aria-controls="address" aria-selected="true"><i class="ti-location-pin"></i>آدرس من</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="userAccount-detail-tab" data-toggle="tab" href="#account-detail" role="tab" aria-controls="account-detail" aria-selected="true"><i class="ti-id-badge"></i>جزئیات حساب</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${contextRoot}/logout"><i class="ti-lock"></i>خروج</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8">
                    <div class="tab-content dashboard_content">
                        <div class="tab-pane fade active show" id="dashboard" role="tabpanel" aria-labelledby="dashboard-tab">
                            <div class="card">
                                <div class="card-header">
                                    <h3>داشبورد</h3>
                                </div>
                                <div class="card-body">
                                    <p>از داشبورد حساب شما. می توانید سفارشات اخیر خود را به راحتی بررسی کرده و <a href="javascript:void(0);" onclick="$('#orders-tab').trigger('click')">مشاهده کنید</a>، آدرس های ارسالی و <a href="javascript:void(0);" onclick="$('#address-tab').trigger('click')">صورتحساب خود را مدیریت کنید</a> و <a href="javascript:void(0);" onclick="$('#account-detail-tab').trigger('click')">گذرواژه و جزئیات حساب خود را ویرایش کنید.</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="userOrders" role="tabpanel" aria-labelledby="orders-tab">
                            <table id="userOrdersTable" class="table table-striped table-borderd">
                                <thead>
                                <tr>
                                    <th>تاریخ ثبت</th>
                                    <th>وضعیت بررسی</th>
                                    <th>کد پیگیری پستی</th>
                                    <th>تعداد محصولات سفارش</th>
                                    <th>جمع قیمت سفارش</th>
                                    <th> مشاهده آدرس دریافت</th>
                                    <th>مشاهده محصولات سفارش</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>تاریخ ثبت</th>
                                    <th>وضعیت بررسی</th>
                                    <th>کد پیگیری پستی</th>
                                    <th>تعداد محصولات سفارش</th>
                                    <th>جمع قیمت سفارش</th>
                                    <th> مشاهده آدرس دریافت</th>
                                    <th>مشاهده محصولات سفارش</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="userRates" role="tabpanel" aria-labelledby="Rates-tab">
                            <table id="unConfirmedRatesListTable" class="table table-striped table-borderd">
                                <thead>
                                <tr>
                                    <th>زمان</th>
                                    <th>نظر شما</th>
                                    <th>امتیاز داده شده</th>
                                    <th>وضعیت پیشنهاد</th>
                                    <th>وضعیت انتشار</th>
                                    <th> مشاهده محصول مرتبط</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>زمان</th>
                                    <th>نظر شما</th>
                                    <th>امتیاز داده شده</th>
                                    <th>وضعیت پیشنهاد</th>
                                    <th>وضعیت انتشار</th>
                                    <th> مشاهده محصول مرتبط</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>

                        <div class="tab-pane fade" id="account-detail" role="tabpanel" aria-labelledby="account-detail-tab">
                            <div class="card">
                                <div class="card-header">
                                    <h3>جزئیات حساب</h3>
                                </div>
                                <div class="card-body">
                                    <p>قبلاً حساب دارید؟ <a href="#">وارد شوید!</a></p>
                                    <form method="post" name="enq">
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label>نام <span class="required">*</span></label>
                                                <input required="" class="form-control" name="name" type="text">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>نام خانوادگی <span class="required">*</span></label>
                                                <input required="" class="form-control" name="phone">
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>نام کاربری <span class="required">*</span></label>
                                                <input required="" class="form-control" name="dname" type="text">
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>آدرس ایمیل <span class="required">*</span></label>
                                                <input required="" class="form-control" name="email" type="email">
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>کلمه عبور فعلی <span class="required">*</span></label>
                                                <input required="" class="form-control" name="password" type="password">
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>کلمه عبور جدید <span class="required">*</span></label>
                                                <input required="" class="form-control" name="npassword" type="password">
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>تأیید کلمه عبور <span class="required">*</span></label>
                                                <input required="" class="form-control" name="cpassword" type="password">
                                            </div>
                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-fill-out" name="submit" value="Submit">ذخیره</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="userOrderItemsListModal" tabindex="-1" role="dialog" aria-labelledby="orderItemsListModalLabel">
                <div class="modal-dialog " role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="orderItemsListModalLabel">view order items</h4>
                        </div>
                        <div class="modal-body">
                            <table id="userOrderItemsPerOrderDetailsTable" class="table table-striped table-borderd">
                                <thead>
                                <tr>
                                    <th>عکس محصول</th>
                                    <th>نام محصول</th>
                                    <th>تعداد خرید و قیمت خرید</th>
                                    <th>مجموع</th>
                                    <th>مشاهده ی محصول</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>عکس محصول</th>
                                    <th>نام محصول</th>
                                    <th>تعداد خرید و قیمت خرید</th>
                                    <th>مجموع</th>
                                    <th>مشاهده ی محصول</th>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="userOrderAddressModal" tabindex="-1" role="dialog" aria-labelledby="orderAddressModalLabel">
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
                                        <div class="card-body" id="userAddress">

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
