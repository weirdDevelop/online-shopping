<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../flows-shared/header.jsp" %>
<div class="container">
	
	<div class="row">
	
		<div class="col-sm-6">


			<div class="card text-center">
				<div class="card-header">
					اطلاعات فردی
				</div>
				<div class="card-body">
					<h3>نام : <strong>${registerModel.user.firstName} ${registerModel.user.lastName}</strong></h3>
					<h4>ایمیل : <strong>${registerModel.user.email}</strong></h4>
					<h4>شماره تلفن : <strong>${registerModel.user.contactNumber}</strong></h4>

				</div>
				<div class="card-footer text-muted">
						<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-fill-line view-cart"> ویرایش<span class="ti ti-back-left"></span></a>
				</div>
			</div>
		</div>
		
		<div class="col-sm-6">

			<div class="card text-center">
				<div class="card-header">
					اطلاعات سکونت
				</div>
				<div class="card-body">
					<p><strong>${registerModel.billing.addressLineOne}, </strong></p>
					<p><strong>${registerModel.billing.city} - کد پستی :    ${registerModel.billing.postalCode}  , </strong></p>
					<p><strong>${registerModel.billing.state}</strong></p>

				</div>
				<div class="card-footer text-muted">
					<a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-fill-line view-cart">ویرایش<span class="ti ti-back-left"></span></a>
				</div>
			</div>
		
		</div>
	
	</div>
	<br>

	
	<div class="row">
		
		<div class="col-sm-12">
			
			<div class="text-center">
				
				<a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-fill-out checkout">تایید و ثبت</a>
				
			</div>
			
		</div>
		
	</div>

</div>
<br>
<%@include file="../flows-shared/footer.jsp" %>