<%@include file="../../flows-shared/header.jsp" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">

    <div class="row">

        <div class="col-md-4">

            <h4>ادرس ارسال را انتخاب کنید</h4>
            <hr/>


                <c:forEach items="${addresses}" var="address">
                <div class="row">
                    <div class="cols-md-12">
                        <h3>${address.addressLineOne}</h3>
                        <h4>${address.city} - ${address.postalCode}</h4>
                        <h4>${address.state} </h4>
                        <hr/>
                        <div class="text-center">
                            <a href="${flowExecutionUrl}&_eventId_addressSelection&shippingId=${address.id}"
                               class="btn btn-primary">انتخاب</a>
                        </div>
                    </div>
                </div>
                </c:forEach>



        </div>

        <div class="col-md-8">


            <div class="panel panel-primary">

                <div class="panel-heading">
                    <h4>افزودن ادرس جدید</h4>
                </div>

                <div class="panel-body">

                    <sf:form method="POST"
                             modelAttribute="shipping"
                             id="billingForm">

                        <div class="form-group">
                            <label class="control-label col-md-4">استان شما</label>
                            <sf:select path="state" items="${provinces}" itemLabel="name" itemValue="name"
                                       class="form-control" id="provinceSelect"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-4">شهر شما</label>
                            <sf:select path="city" itemLabel="name"
                                       class="form-control"
                                       id="citySelect"/>
                        </div>
                        <div class="form-group">
                            <sf:textarea required="" class="form-control"
                                         placeholder="آدرس خود را به طور کامل وارد کنید "
                                         path="addressLineOne"/>
                            <sf:errors path="addressLineOne" cssClass="help-block" element="em"/>
                        </div>
                        <div class="form-group">
                            <sf:input type="text" required="" class="form-control"
                                      placeholder=" کد پستی خود را وارد کنید( 10 رقم باشد)"
                                      path="postalCode" maxlength="10"/>
                            <sf:errors path="postalCode" cssClass="help-block" element="em"/>
                        </div>


                        <div class="form-group">
                            <button type="submit" class="btn btn-fill-out checkout" name="_eventId_saveAddress">

                                ثیت آدرس
                            </button>
                        </div>
                    </sf:form>

                </div>


            </div>


        </div>


    </div>

</div>
<%@include file="../../flows-shared/footer.jsp" %>	