<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../flows-shared/header.jsp" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!-- START MAIN CONTENT -->
<div class="main_content">

    <div class="login_register_wrap section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6 col-md-10">
                    <div class="login_wrap">
                        <div class="padding_eight_all bg-white">
                            <div class="heading_s1">
                                <h3>ایجاد یک حساب کاربری</h3>
                            </div>
                            <sf:form method="post" modelAttribute="user"
                                     id="registerForm">
                                <div class="form-group">
                                    <sf:input type="text" required="" class="form-control"  placeholder="نام شما"
                                              path="firstName"/>
                                    <sf:errors path="firstName" cssClass="help-block" element="em"/>
                                </div>

                                <div class="form-group">
                                    <sf:input type="text" required="" class="form-control"  placeholder="نام خانوادگی شما"
                                              path="lastName"/>
                                    <sf:errors path="lastName" cssClass="help-block" element="em"/>

                                </div>
                                <div class="form-group">
                                    <sf:input class="form-control" required="" type="email" placeholder="ایمیل شما - مثال:( mail@gmail.com )"
                                              path="email"/>
                                    <sf:errors path="email" cssClass="help-block" element="em"/>
                                </div>
                                <div class="form-group">
                                    <sf:input type="tel" required="" class="form-control"  placeholder="شماره موبایل  - مثال:( 09308754334 )"
                                              path="contactNumber" maxlength="11"/>
                                    <sf:errors path="contactNumber" cssClass="help-block" element="em"/>

                                </div>
                                <div class="form-group">
                                    <sf:input type="password" required="" class="form-control"  placeholder=" رمز عبور خود را وارد کنید - حداقل 8 کاراکتز"
                                              path="password" id="userPass" name="userPass"/>
                                    <sf:errors path="password" cssClass="help-block" element="em"/>

                                </div>
                                <div class="form-group">
                                    <sf:input type="password" required="" class="form-control"  placeholder="رمز عبور خود را تکرار کنید"
                                              path="confirmPassword"/>
                                    <sf:errors path="confirmPassword" cssClass="help-block" element="em"/>
                                    <sf:hidden path="role" />


                                </div>
                                <div class="login_footer form-group">
                                    <div class="chek-form">
                                        <div class="custome-checkbox">

                                            <sf:checkbox cssClass="checkbox" path="accepted"  name="rulesCheckbox" id="rulesCheckbox"/>
                                            <label  for="rulesCheckbox"><span>من با شرایط و سیاست موافقم.</span></label><br><br>
                                            <sf:errors path="accepted" cssClass="help-block" element="em"/>


                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-fill-out btn-block" name="_eventId_billing">ثبت نام</button>
                                </div>
                            </sf:form>
                            <div class="different_login">
                                <span> </span>
                            </div>

                            <div class="form-note text-center">حساب کاربری دارید؟ <a href="${contextRoot}/login">وارد شوید</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../flows-shared/footer.jsp" %>			
