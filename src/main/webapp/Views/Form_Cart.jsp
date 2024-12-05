<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<script>
	function confirmDelete(id, sdt) {
		if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')) {
			window.location.href = '/Book/DeleteCart?id=' + id + '&sdt=' + sdt;
		}
	}
	function home() {
		window.location.href = '/Book/read';
	}
	function submitPayment(tongGia, sdt) {
		window.location.href = '/Book/ViewPay?tongGia=' + tongGia + '&sdt='
				+ sdt;

	}
	function showQtyChangeAlert(inputElement) {
		const itemId = inputElement.getAttribute('data-id');
		const itemSdt = inputElement.getAttribute('data-sdt');
		const newQty = parseInt(inputElement.value, 10);
		if (newQty == 0) {
			confirmDelete(itemId, itemSdt);
		} else {
			window.location.href = '/Book/UpdateCart?soluong=' + newQty
					+ '&id=' + itemId + '&sdt=' + itemSdt;
		}
	}
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<style>
		body {
  			background-color:  #f0f0f0;
  			margin: 0; 
		}
	</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
		<div class="container-fluid">
			<a class="btn ms-5 me-3 text-danger" onclick="home()"
				style="font-size: 30px;"><b>DreamBooks</b></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto ms-5 mb-2 mb-lg-0">
					<div class="nav-item" style="position: relative;">
					</div>
				</ul>
				<form class="d-flex me-3">
					<a class="btn me-5"> <svg
							xmlns="http://www.w3.org/2000/svg" fill="#737373"
							viewBox="0 0 24 24" width="24px" height="24px">    <path
								d="M 4.4140625 1.9960938 L 1.0039062 2.0136719 L 1.0136719 4.0136719 L 3.0839844 4.0039062 L 6.3789062 11.908203 L 5.1816406 13.824219 C 4.7816406 14.464219 4.7609531 15.272641 5.1269531 15.931641 C 5.4929531 16.590641 6.1874063 17 6.9414062 17 L 19 17 L 19 15 L 6.9414062 15 L 6.8769531 14.882812 L 8.0527344 13 L 15.521484 13 C 16.248484 13 16.917531 12.604703 17.269531 11.970703 L 20.873047 5.4863281 C 21.046047 5.1763281 21.041328 4.7981875 20.861328 4.4921875 C 20.681328 4.1871875 20.352047 4 19.998047 4 L 5.25 4 L 4.4140625 1.9960938 z M 6.0820312 6 L 18.298828 6 L 15.521484 11 L 8.1660156 11 L 6.0820312 6 z M 7 18 A 2 2 0 0 0 5 20 A 2 2 0 0 0 7 22 A 2 2 0 0 0 9 20 A 2 2 0 0 0 7 18 z M 17 18 A 2 2 0 0 0 15 20 A 2 2 0 0 0 17 22 A 2 2 0 0 0 19 20 A 2 2 0 0 0 17 18 z" /></svg>
						<p class="fw-light m-0">Giỏ hàng</p>
					</a>
				</form>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="container mt-3 bg-white p-3 rounded shadow">
			<h1 class="text-center mb-4">Giỏ hàng của bạn</h1>
			<div class="row">
				<div class="col-md-9">
					<table class="table table-bordered">
						<thead class="table">
							<tr>
								<th>Mã sách</th>
								<th>Hình ảnh</th>
								<th>Tên sách</th>
								<th>Số lượng</th>
								<th>Đơn giá</th>
								<th>Tổng tiền</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${listCart}">
								<tr>
									<td>${item.getId()}</td>
									<td class="text-center"><img
										src="<%= request.getContextPath() %>/Images/${item.getImage()}"
										alt="${item.getName()}" class="img-thumbnail"
										style="width: 80px; height: auto;"></td>
									<td>${item.getName()}</td>
									<td><input type="number" class="form-control"
										value="${item.getQty()}" min="0" data-id="${item.getId()}"
										data-sdt="${sdt}" onchange="showQtyChangeAlert(this)">
									</td>
									<td>${item.getPrice()}VND</td>
									<td>${item.getTotal()}VND</td>
									<td class="text-center">
										<button class="btn btn-outline-danger w-100"
											onclick="confirmDelete('${item.getId()}', '${sdt}')">Xóa</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-md-3">
					<div class="border p-4 border-bordered">
						<h5 class="mb-3">
							Thành tiền:
							<th><c:set var="total" value="0" /> <c:forEach var="item"
									items="${listCart}">
									<c:set var="total" value="${total + item.getTotal()}" />
								</c:forEach> ${total} VND</th>
						</h5>
						<button class="btn btn-info w-100 mt-2"
							onclick="submitPayment('${total}','${sdt}')">Thanh toán</button>
						<button class="btn btn-secondary w-100 mt-2" onclick="home()">Tiếp
							tục mua hàng</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-oBqDVmMz4fnFO9gyb4cFw3ATBwWfqw6nfbu7f2e9KAi6mNpQ8dW9KKbBn9Plx0x4"
		crossorigin="anonymous"></script>
</body>
</html>