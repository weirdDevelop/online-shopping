<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="breadcrumb_section bg_gray page-title-mini">
	<div class="container"><!-- STRART CONTAINER -->
		<div class="row align-items-center">
			<div class="col-md-6">
				<div class="page-title">
					<h1>صفحه یافت نشد</h1>
				</div>
			</div>
			<div class="col-md-6">
				<ol class="breadcrumb justify-content-md-end">
					<li class="breadcrumb-item"><a href="#">خانه</a></li>
					<li class="breadcrumb-item"><a href="#">صفحات</a></li>
					<li class="breadcrumb-item active">404</li>
				</ol>
			</div>
		</div>
	</div><!-- END CONTAINER-->
</div>
<!-- END SECTION BREADCRUMB -->

<!-- START MAIN CONTENT -->
<div class="main_content">

	<!-- START 404 SECTION -->
	<div class="section">
		<div class="error_wrap">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-lg-6 col-md-10 order-lg-first">
						<div class="text-center">
							<div class="error_txt">404</div>
							<h5 class="mb-2 mb-sm-3">صفحه مورد نظر شما یافت نشد!</h5>
							<p>صفحه مورد نظر شما منتقل شد ، حذف شد ، تغییر نام داد یا ممکن است هرگز وجود نداشته باشد.</p>
							<div class="search_form pb-3 pb-md-4">
								<form method="post">
									<input name="text" id="text" type="text" placeholder="جستجو" class="form-control">
									<button type="submit" class="btn icon_search"><i class="ion-ios-search-strong"></i></button>
								</form>
							</div>
							<a href="index.html" class="btn btn-fill-out">بازگشت به خانه</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END 404 SECTION -->

</div>