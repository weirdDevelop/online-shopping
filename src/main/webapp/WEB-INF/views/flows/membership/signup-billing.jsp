<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../flows-shared/header.jsp" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="main_content">

	<div class="login_register_wrap section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6 col-md-10">
					<div class="login_wrap">
						<div class="padding_eight_all bg-white">
							<div class="heading_s1">
								<h3>ادرس های خود را وارد کنید</h3>
							</div>
							<sf:form method="post" modelAttribute="billing"
									 id="billingForm">

								<div class="form-group">
									<label class="control-label col-md-4">استان شما</label>
										<sf:select path="state" items="${provinces}" itemLabel="name" itemValue="name"
												   class="form-control" id="provinceSelect"/>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">شهر شما</label>
										<sf:select path="city"  itemLabel="name"
												   class="form-control"
												   id="citySelect"/>
								</div>
								<div class="form-group">
									<sf:textarea required="" class="form-control"  placeholder="آدرس خود را به طور کامل وارد کنید "
											  path="addressLineOne"/>
									<sf:errors path="addressLineOne" cssClass="help-block" element="em"/>
								</div>
								<div class="form-group">
									<sf:input type="text" required="" class="form-control"  placeholder=" کد پستی خود را وارد کنید( 10 رقم باشد)"
											  path="postalCode" maxlength="10"/>
									<sf:errors path="postalCode" cssClass="help-block" element="em"/>
								</div>




								<div class="form-group">
									<ul>



										<button type="submit"  class="btn btn-fill-out checkout" name="_eventId_confirm" >
                                            <span class="ti ti-hand-point-right"></span>
                                            ثیت آدرس

                                        </button>

										<button type="submit" class="btn btn-fill-line view-cart" name="_eventId_personal">مرحله قبل
										<span class="ti ti-back-left"></span>
									    </button>


									</ul>
								</div>
							</sf:form>
							<div class="form-note text-center">حساب کاربری دارید؟ <a href="${contextRoot}/login">وارد شوید</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../flows-shared/footer.jsp" %>			
