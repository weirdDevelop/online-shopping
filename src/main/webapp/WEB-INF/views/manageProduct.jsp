<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8" %>

<div class="container">

    <c:if test="${not empty message}">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="alert alert-danger">${message}</div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </c:if>
    <!-- START LOGIN SECTION -->
    <div class="login_register_wrap section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6 col-md-10">
                    <div class="login_wrap">
                        <div class="padding_eight_all bg-white">
                            <div class="heading_s1">
                                <h3>مدیریت</h3>
                            </div>
                            <sf:form class="form-horizontal" modelAttribute="product" action="${contextRoot}/manage/product"
                                     method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="control-label col-md-4">نام محصول</label>
                                    <div class="col-md-12">
                                        <sf:input type="text" path="name" class="form-control"
                                                  placeholder="نام محصول را وراد کنید"/>
                                        <sf:errors path="name" cssClass="help-block" element="em"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">توضیحات کامل</label>
                                    <div class="col-md-12">
                                        <sf:textarea path="description" class="form-control"
                                                     placeholder="توضیحات محصول را وراد کنید"/>
                                        <sf:errors path="description" cssClass="help-block" element="em"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">توضیحات کوتاه</label>
                                    <div class="col-md-12">
                                        <sf:textarea path="preDescription" class="form-control"
                                                     placeholder="توضیحات کوتاه محصول را وارد کنید"/>
                                        <sf:errors path="preDescription" cssClass="help-block" element="em"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">قیمت</label>
                                    <div class="col-md-8">
                                        <sf:input type="number" path="unitPrice" class="form-control"
                                                  placeholder="Enter Unit Price"/>
                                        <sf:errors path="unitPrice" cssClass="help-block" element="em"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">تعداد موجودی</label>
                                    <div class="col-md-12">
                                        <sf:input type="number" path="quantity" class="form-control"
                                                  placeholder="Enter Quantity"/>
                                        <sf:errors path="quantity" cssClass="help-block" element="em"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4">تخفیف</label>
                                    <div class="col-md-12">
                                        <sf:input type="number"  step="any" path="discount" class="form-control"
                                                  placeholder="Enter discount"/>
                                        <sf:errors path="discount" cssClass="help-block" element="em"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4">توان</label>
                                    <div class="col-md-12">
                                        <sf:input type="number" step="any" path="watt" class="form-control"
                                                  placeholder="Enter weight"/>
                                        <sf:errors path="weight" cssClass="help-block" element="em"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4">وزن</label>
                                    <div class="col-md-12">
                                        <sf:input type="number" step="any" path="weight" class="form-control"
                                                  placeholder="Enter weight"/>
                                        <sf:errors path="weight" cssClass="help-block" element="em"/>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-md-4">گارانتی محصول</label>
                                    <div class="col-md-12">
                                        <sf:select path="warranty" items="${warranties}" itemLabel="name" itemValue="name"
                                                   class="form-control"
                                                   id="warrantyId"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">برند </label>
                                    <div class="col-md-12">
                                        <sf:select path="brand" items="${brands}" itemLabel="name" itemValue="name"
                                                   class="form-control"
                                                   id="brandSelect"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4">کشور سازنده</label>
                                    <div class="col-md-12">
                                        <sf:select path="country" items="${countries}" itemLabel="name" itemValue="name"
                                                   class="form-control"
                                                   id="countrySelect"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">تصاویر را انتخاب کنید</label>
                                    <div class="col-md-12">
                                        <sf:input type="file" path="file" class="form-control" multiple="multiple"/>
                                        <sf:errors path="file" cssClass="help-block" element="em"/>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-md-4">دسته بندی</label>
                                    <div class="col-md-12">
                                        <sf:select path="categoryId" items="${mainCategories}" itemLabel="name" itemValue="id"
                                                   class="form-control"
                                                   id="selectCategory"/>

                                        <sf:select path="subCategoryId" class="form-control"
                                                   id="subCategory"/>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4">ویژگی های محصول</label>
                                    <div class="col-md-12">
                                        <sf:select path="species" class="form-control"
                                                   id="speciesSelect"/>
                                        <div class="text-right">
                                            <br/>
                                            <sf:hidden path="id"/>
                                            <sf:hidden path="code"/>
                                            <sf:hidden path="supplierId"/>
                                            <sf:hidden path="active"/>
                                            <sf:hidden path="rateCount"/>
                                            <sf:hidden path="productScore"/>
                                            <sf:hidden path="imagesCount"/>
                                            <sf:hidden path="lastUpdate"/>
                                            <sf:hidden path="creationTime"/>
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <button type="button" class="btn btn-warning" data-toggle="modal"
                                                            data-target="#myCategoryModal">افرودن دسته بندی جدید
                                                    </button>
                                                </div>
                                                <div class="col-md-2"></div>
                                                <div class="col-md-5">
                                                    <button type="button" class="btn btn-warning" data-toggle="modal"
                                                            data-target="#mySubCategoryModal">افزودن زیر دسته جدید
                                                    </button>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-md-5">
                                                <button type="button" class="btn btn-warning" data-toggle="modal"
                                                        data-target="#myWarrantyModal">افزودن گارانتی
                                                </button>
                                                </div>
                                                <div class="col-md-2"></div>
                                                <div class="col-md-5">
                                                    <button type="button" class="btn btn-warning" data-toggle="modal"
                                                            data-target="#mySpeciesModal">افزودن ویژگی جدید
                                                    </button>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <button type="button" class="btn btn-warning" data-toggle="modal"
                                                            data-target="#myBrandModal">افزودن برند جدید
                                                    </button>
                                                </div>
                                                <div class="col-md-2"></div>
                                                <div class="col-md-5">
                                                    <button type="button" class="btn btn-warning" data-toggle="modal"
                                                            data-target="#myCountryModal">افزودن کشور جدید
                                                    </button>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <button type="button" class="btn btn-warning" data-toggle="modal"
                                                            data-target="#myBannerModal">افزودن بنر صفحه اصلی
                                                    </button>
                                                </div>
                                                <div class="col-md-2"></div>
                                                <div class="col-md-5">
                                                    <button type="button" class="btn btn-danger">
                                                        <a href="${contextRoot}/manage/product">حذف محصول انتخاب شده برای آپدیت</a>
                                                    </button>
                                                </div>
                                            </div>
                                            <br>
                                            <button type="submit" class="btn btn-fill-out btn-block" name="login">ثبت محصول</button>
                                        </div>
                                    </div>
                                </div>

                            </sf:form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END LOGIN SECTION -->

    <!--Category Modal -->
    <div class="modal fade" id="myCategoryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">دسته بندی جدید</h4>
                </div>
                <div class="modal-body">

                    <sf:form id="categoryForm" class="form-horizontal" modelAttribute="category"
                             action="${contextRoot}/manage/category"  method="POST" enctype="multipart/form-data">

                        <div class="form-group">
                            <label class="control-label col-md-4">نام</label>
                            <div class="col-md-8 validate">
                                <sf:input type="text" path="name" class="form-control"
                                          placeholder="نام دسته بندی"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">توضیحات</label>
                            <div class="col-md-8 validate">
                                <sf:textarea path="description" class="form-control"
                                             placeholder="توضیحات دسته بندی"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">دو عکس مرتبط را انتخاب کنید</label>
                            <div class="col-md-8">
                                <sf:input type="file" path="file" class="form-control" multiple="multiple"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-4">توضیحات یک</label>
                            <div class="col-md-8 validate">
                                <sf:textarea path="imageOneCaption" class="form-control"
                                             placeholder="توضیحات عکس اول"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-4">توضیحات دو</label>
                            <div class="col-md-8 validate">
                                <sf:textarea path="imageSecondCaption" class="form-control"
                                             placeholder="توضیحات عکس دوم"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-4">
                                <input type="submit" name="submit" value="ذخیره" class="btn btn-primary"/>
                            </div>
                        </div>
                    </sf:form>
                </div>
            </div>
        </div>
    </div>

    <!-- SubCategory Modal -->
    <div class="modal fade" id="mySubCategoryModal" tabindex="-2" role="dialog" aria-labelledby="mySubModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="mySubModalLabel">زیر دسته جدید</h4>
                </div>
                <div class="modal-body">

                    <sf:form id="subCategoryForm" class="form-horizontal" modelAttribute="subCategory"
                             action="${contextRoot}/manage/subCategory" method="POST">

                        <div class="form-group">
                            <label class="control-label col-md-4">نام</label>
                            <div class="col-md-8 validate">
                                <sf:input type="text" path="name" class="form-control"
                                          placeholder="نام زیر دسته"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">توضیحات</label>
                            <div class="col-md-8 validate">
                                <sf:textarea path="description" class="form-control"
                                             placeholder="توضیحات زیر دسته"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">دسته بندی مرتبط</label>
                            <div class="col-md-8 validate">
                                <sf:select path="categoryId" items="${mainCategories}" itemLabel="name" itemValue="id"
                                           class="form-control"
                                           id="selectCategory"/>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-4">
                                <input type="submit" name="submit" value="ذخیره" class="btn btn-primary"/>
                            </div>
                        </div>
                    </sf:form>
                </div>
            </div>
        </div>
    </div>

    <!-- Warranty Modal -->
    <div class="modal fade" id="myWarrantyModal" tabindex="-3" role="dialog" aria-labelledby="myWarrantyModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myWarrantyModalLabel">گارانتی جدید</h4>
                </div>
                <div class="modal-body">

                    <sf:form id="warrantyForm" class="form-horizontal" modelAttribute="warranty"
                             action="${contextRoot}/manage/warranty" method="POST">

                        <div class="form-group">
                            <label class="control-label col-md-4">نام</label>
                            <div class="col-md-8 validate">
                                <sf:input type="text" path="name" class="form-control"
                                          placeholder="نام گارانتی"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">توضیحات</label>
                            <div class="col-md-8 validate">
                                <sf:textarea path="description" class="form-control"
                                             placeholder="توضیحات گارانتی"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-4">
                                <input type="submit" name="submit" value="ذخیره" class="btn btn-primary"/>
                            </div>
                        </div>
                    </sf:form>
                </div>
            </div>
        </div>
    </div>

    <!-- Species Modal -->
    <div class="modal fade" id="mySpeciesModal" tabindex="-4" role="dialog" aria-labelledby="mySpeciesModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="mySpeciesModalLabel">مشخصات جدید</h4>
                </div>
                <div class="modal-body">

                    <sf:form id="speciesForm" class="form-horizontal" modelAttribute="species"
                             action="${contextRoot}/manage/species" method="POST">

                        <div class="form-group">
                            <label class="control-label col-md-4">نام</label>
                            <div class="col-md-8 validate">
                                <sf:input type="text" path="name" class="form-control"
                                          placeholder="نام مشخصات جدید"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">انتخاب زیر دسته مرتبط</label>
                            <div class="col-md-8 validate">
                                <sf:select path="subId" items="${subCategories}" itemLabel="name" itemValue="id"
                                           class="form-control"
                                           id="selectCategory"/>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-4">
                                <input type="submit" name="submit" value="ذخیره" class="btn btn-primary"/>
                            </div>
                        </div>

                    </sf:form>
                </div>
            </div>
        </div>
    </div>

    <!-- Brand Modal -->
    <div class="modal fade" id="myBrandModal" tabindex="-5" role="dialog" aria-labelledby="myBrandModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myBrandModalLabel">برند جدید</h4>
                </div>
                <div class="modal-body">

                    <sf:form id="brandForm" class="form-horizontal" modelAttribute="brand"
                             action="${contextRoot}/manage/brand" method="POST" enctype="multipart/form-data">

                        <div class="form-group">
                            <label class="control-label col-md-4">نام</label>
                            <div class="col-md-8 validate">
                                <sf:input type="text" path="name" class="form-control"
                                          placeholder="نام برند"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">توضیحات</label>
                            <div class="col-md-8 validate">
                                <sf:textarea path="description" class="form-control"
                                             placeholder="توضیحات برند"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">عکس مرتبط را انتخاب کنید</label>
                            <div class="col-md-8">
                                <sf:input type="file" path="image" class="form-control" multiple="multiple"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-4">
                                <input type="submit" name="submit" value="ذخیره" class="btn btn-primary"/>
                            </div>
                        </div>
                    </sf:form>
                </div>
            </div>
        </div>
    </div>

    <!-- Country Modal -->
    <div class="modal fade" id="myCountryModal" tabindex="-6" role="dialog" aria-labelledby="myCountryModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myCountryModalLabel">کشور سازنده جدید</h4>
                </div>
                <div class="modal-body">

                    <sf:form id="countryForm" class="form-horizontal" modelAttribute="country"
                             action="${contextRoot}/manage/country" method="POST">

                        <div class="form-group">
                            <label class="control-label col-md-4">نام </label>
                            <div class="col-md-8 validate">
                                <sf:input type="text" path="name" class="form-control"
                                          placeholder="نام کشور"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-4">
                                <input type="submit" name="submit" value="ذخیره" class="btn btn-primary"/>
                            </div>
                        </div>
                    </sf:form>
                </div>
            </div>
        </div>
    </div>

    <!--Banners Modal -->
    <div class="modal fade" id="myBannerModal" tabindex="-7" role="dialog" aria-labelledby="myBannersModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myBannersModalLabel">افزودن بنر جدید</h4>
                </div>
                <div class="modal-body">

                    <sf:form id="bannersForm" class="form-horizontal" modelAttribute="banners"
                             action="${contextRoot}/manage/banner"  method="POST" enctype="multipart/form-data">

                        <div class="form-group">
                            <label class="control-label col-md-4">نام مرتبط</label>
                            <div class="col-md-8 validate">
                                <sf:input type="text" path="name" class="form-control"
                                          placeholder="نام مرتبط با عکس"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">توضیحات بنر</label>
                            <div class="col-md-8 validate">
                                <sf:textarea path="description" class="form-control"
                                             placeholder="توضبحات مرتبط با بنر"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4">عکس بنر</label>
                            <div class="col-md-8">
                                <sf:input type="file" path="Image" class="form-control" />
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-4">
                                <input type="submit" name="submit" value="ذخیره" class="btn btn-primary"/>
                            </div>
                        </div>
                    </sf:form>
                </div>
            </div>
        </div>
    </div>



    <hr/>
    <h1>کالاها</h1>
    <hr/>

    <div class="row">


        <div class="col">


            <table id="productsTable" class="table table-condensed table-bordered">

                <thead>
                <tr>
                    <th>Id</th>
                    <th>&#160;</th>
                    <th>نام</th>
                    <th>برند</th>
                    <th>تعداد موجودی</th>
                    <th>قیمت واحد</th>
                    <th>وضعیت دسترسی</th>
                    <th>اخرین به روز رسانی</th>
                    <th>مشاهده اطلاعات</th>
                    <th>ویرایش</th>
                </tr>
                </thead>

                <tfoot>
                <tr>
                    <th>Id</th>
                    <th>&#160;</th>
                    <th>نام</th>
                    <th>برند</th>
                    <th>تعداد موجودی</th>
                    <th>قیمت واحد</th>
                    <th>وضعیت دسترسی</th>
                    <th>اخرین به روز رسانی</th>
                    <th>مشاهده اطلاعات</th>
                    <th>ویرایش</th>
                </tr>
                </tfoot>


            </table>


        </div>


    </div>

    <div class="modal fade" id="productDetailsModalForAdmin" tabindex="-1" role="dialog" aria-labelledby="productDetailsModalForAdminLabel">
        <div class="modal-dialog " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="productDetailsModalForAdminLabel">جزییات محصول</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-3"></div>
                        <div class="col-lg-6">
                            <div class="card mb-3 mb-lg-0">
                                <div class="card-header">
                                    <h3>جزییات محصول</h3>
                                </div>
                                <div class="card-body" id="productDetailsForAdmin">

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>



</div>