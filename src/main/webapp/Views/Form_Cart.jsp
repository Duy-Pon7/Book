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
</head>
<body>
	<div class="container mt-5">
		<h1 class="text-center mb-4">Giỏ hàng của bạn</h1>
		<div class="row">
			<!-- Phần bên trái: Bảng danh sách sản phẩm -->
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

			<!-- Phần bên phải: Thông tin tổng tiền và nút hành động -->
			<div class="col-md-3">
				<div class="border p-4 border-bordered">
					<h5 class="mb-3">
						Thành tiền:
						<th><c:set var="total" value="0" /> <c:forEach var="item"
								items="${listCart}">
								<c:set var="total" value="${total + item.getTotal()}" />
							</c:forEach> ${total} VND</th>
					</h5>
					<!-- Nút hành động -->
					<button class="btn btn-info w-100 mt-2"
						onclick="submitPayment('${total}','${sdt}')">Thanh toán</button>
					<button class="btn btn-secondary w-100 mt-2"
						onclick="home()">Tiếp tục mua hàng</button>
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
