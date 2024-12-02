<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DreamBooks</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<p class="fs-1 text-primary text d-flex justify-content-center mt-5">
					<b>DreamBooks</b>
				</p>
				<div
					class="border rounded border-2 mt-1 shadow-lg p-3 mb-5 bg-body-tertiary rounded">
					                    <!-- Display success or failure message -->
                    <% if (request.getAttribute("message") != null) { %>
                        <div class="alert alert-info text-center">
                            <%= request.getAttribute("message") %>
                        </div>
                    <% } %>
					<form class="row g-3" action="<%=request.getContextPath() + "/form_create" %>" method="post">
						<div class="col-md-6">
							<input type="text" class="form-control" id="inputFirstName" name="inputFirstName" placeholder="Họ">
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id="inputLastName" name="inputLastName" placeholder="Tên">
						</div>
						<div class="col-12">
							<input type="text" class="form-control" id="inputAddress" name="inputAddress" placeholder="Địa chỉ">
						</div>
						<div class="col-12">
							<input type="tel" class="form-control" id="inputPhone" name="inputPhone" placeholder="Số điện thoại, VD: 035*******">
						</div>
						<div class="col-12">
							<input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Nhập mật khẩu">
						</div>
						<div class="col-12">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="gridCheck" required>
								<label class="form-check-label" for="gridCheck"> Đồng ý với các thỏa thuận </label>
							</div>
						</div>
						<div class="col-12 d-flex justify-content-center">
							<button type="submit" class="btn btn-primary">Tạo tài khoản</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>
</body>
</html>
