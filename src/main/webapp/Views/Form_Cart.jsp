<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<script>
	function confirmDelete(id) {
		if (confirm('Bạn có chắc chắn muốn xóa môn học này không?')) {
			// Nếu người dùng chọn OK, chuyển hướng đến servlet xóa môn học
			window.location.href = '/Book/DeleteCart?id=' + id;
		}
	}
	function submitPayment(total, phone) {
		// Chuyển hướng đến servlet với các biến total và phone trong URL
		if (confirm('Xác nhận thanh toán?')) {
			window.location.href = '/Book/Pay?total=' + total + '&phone=' + phone;
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
		<table class="table table-bordered">
			<thead class="table-primary">
				<tr>
					<th>ID</th>
					<th>Hình ảnh</th>
					<th>Tên sách</th>
					<th>Số lượng</th>
					<th>Đơn giá</th>
					<th>Tổng tiền</th>
					<th>Hành động</th>
				</tr>
			</thead>
			<tbody>
				<!-- Duyệt qua danh sách giỏ hàng -->
				<c:forEach var="item" items="${listCart}">
					<tr>
						<td>${item.getId()}</td>

						<td class="text-center"><img
							src="<%= request.getContextPath() %>/Images/${item.getImage()}"
							alt="${item.getName()}" class="img-thumbnail"
							style="width: 80px; height: auto;"></td>
						<td>${item.getName()}</td>
						<td>${item.getQty()}Cuốn</td>
						<td>${item.getPrice()}VND</td>
						<td>${item.getTotal()}VND</td>
						<td class="text-center">
							<button class="btn btn-danger w-100 h-100 mt-2"
								onclick="confirmDelete('${item.getId()}')">Xóa</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="6" class="text-end">Tổng cộng</th>
					<th><c:set var="total" value="0" /> <!-- Khởi tạo biến tổng -->
						<c:forEach var="item" items="${listCart}">
							<c:set var="total" value="${total + item.getTotal()}" />
							<!-- Cộng dồn giá trị -->
						</c:forEach> ${total} VND <!-- Hiển thị tổng --></th>
				</tr>
			</tfoot>
		</table>
		<div class="text-end mt-3">
		 	<a href="Form_List.jsp" class="btn btn-secondary">Tiếp tục mua sắm</a>
			<button class="btn btn-primary"
				onclick="submitPayment('${total}','${phone}')">Thanh toán</button>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-oBqDVmMz4fnFO9gyb4cFw3ATBwWfqw6nfbu7f2e9KAi6mNpQ8dW9KKbBn9Plx0x4"
		crossorigin="anonymous"></script>
</body>
</html>