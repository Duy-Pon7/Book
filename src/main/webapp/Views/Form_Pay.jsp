<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán</title>
<script>
    function deleteAddress(id, tongGia, sdt) {
        if (confirm('Bạn có chắc muốn xóa địa chỉ này không?')) {
        	 window.location.href = '/Book/DeleteAddress?tongGia=' + tongGia + '&sdt=' + sdt + '&id=' + id;
        }
    }
    function openModal() {
        document.getElementById('customModal').style.display = 'block';
    }
    function closeModal() {
        document.getElementById('customModal').style.display = 'none';
    }
    function submitNewAddress(tongGia, sdt) {
        // Lấy giá trị từ input
        const newAddress = document.getElementById('newAddress').value;
        // Kiểm tra nếu giá trị không rỗng trước khi xử lý
        if (newAddress.trim() !== '') {
        	window.location.href = '/Book/AddAddress?tongGia=' + tongGia + '&sdt=' + sdt + '&diaChi=' + newAddress.trim();
            // Tiến hành xử lý khác, ví dụ gửi dữ liệu đến server hoặc hiển thị thông báo
        } else {
            alert('Vui lòng nhập địa chỉ!');
        }
    }
    function toggleOrderDetails() {
        const details = document.getElementById("orderDetails");
        if (details.style.display === "none" || details.style.display === "") {
            details.style.display = "block"; // Hiển thị
        } else {
            details.style.display = "none"; // Ẩn
        }
    }
    function updateTotal(tongGia) {
        // Lấy danh sách các radio button
        const radios = document.getElementsByName("phuongThucGiaoHang");
        let phiGiao = 0;
        // Kiểm tra radio button nào được chọn
        radios.forEach((radio) => {
            if (radio.checked) {
                phiGiao = parseInt(radio.value); // Lấy giá trị của radio (phí giao hàng)
            }
        });
        // Tính thành tiền
        const thanhTien = tongGia + phiGiao;
        // Cập nhật hiển thị phí giao hàng và thành tiền
        document.getElementById("phiGiaoHang").textContent = phiGiao.toLocaleString('vi-VN') + " VND";
        document.getElementById("thanhTien").textContent = thanhTien.toLocaleString('vi-VN') + " VND";
    }
    function submitPayment(sdt) {
        // Lấy giá trị thành tiền từ phần tử HTML
        const thanhTien = document.getElementById("thanhTien").textContent.replace(/[^\d]/g, ""); 
     	// Lấy địa chỉ được chọn
        const selectedAddress = document.querySelector('input[name="address"]:checked'); // Radio được chọn
        const diaChi = selectedAddress ? selectedAddress.nextElementSibling.querySelector('span').textContent : null;

        // Kiểm tra xem địa chỉ có được chọn không
        if (!diaChi) {
            alert('Vui lòng chọn địa chỉ để thanh toán.');
            return;
        }
        // Hiển thị thông tin kiểm tra
        alert('Thanh toán thành công');
        window.location.href = '/Book/Pay?tongGia=' + thanhTien + '&sdt=' + sdt + '&diaChi=' + diaChi;     
    }
    function FormCart(sdt) {
		window.location.href = '/Book/ViewCart?sdt=' + sdt;
	}
    function home() {
		window.location.href = '/Book/read';
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
				<form class="d-flex me-5">
					<a class="btn" onclick="FormCart('${SDT}')"> <svg
							xmlns="http://www.w3.org/2000/svg" fill="#737373"
							viewBox="0 0 24 24" width="24px" height="24px">    <path
								d="M 4.4140625 1.9960938 L 1.0039062 2.0136719 L 1.0136719 4.0136719 L 3.0839844 4.0039062 L 6.3789062 11.908203 L 5.1816406 13.824219 C 4.7816406 14.464219 4.7609531 15.272641 5.1269531 15.931641 C 5.4929531 16.590641 6.1874063 17 6.9414062 17 L 19 17 L 19 15 L 6.9414062 15 L 6.8769531 14.882812 L 8.0527344 13 L 15.521484 13 C 16.248484 13 16.917531 12.604703 17.269531 11.970703 L 20.873047 5.4863281 C 21.046047 5.1763281 21.041328 4.7981875 20.861328 4.4921875 C 20.681328 4.1871875 20.352047 4 19.998047 4 L 5.25 4 L 4.4140625 1.9960938 z M 6.0820312 6 L 18.298828 6 L 15.521484 11 L 8.1660156 11 L 6.0820312 6 z M 7 18 A 2 2 0 0 0 5 20 A 2 2 0 0 0 7 22 A 2 2 0 0 0 9 20 A 2 2 0 0 0 7 18 z M 17 18 A 2 2 0 0 0 15 20 A 2 2 0 0 0 17 22 A 2 2 0 0 0 19 20 A 2 2 0 0 0 17 18 z" /></svg>
						<p class="fw-light m-0">Giỏ hàng</p>
					</a>
				</form>
			</div>
		</div>
	</nav>
	<div class="container mt-3 mb-3 bg-white p-3 rounded shadow">
		<h1 class="text-center mt-1">Thanh toán</h1>
		<div id="customModal"
			style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 400px; background-color: white; box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); padding: 20px; z-index: 1000;">
			<h5>Thêm địa chỉ mới</h5>
			<form id="addAddressForm">
				<div class="mb-3">
					<label for="newAddress" class="form-label">Địa chỉ</label> <input
						type="text" class="form-control" id="newAddress" name="newAddress"
						placeholder="Nhập địa chỉ" required>
				</div>
			</form>
			<button type="button" class="btn btn-secondary"
				onclick="closeModal()">Đóng</button>
			<button type="button" class="btn btn-primary"
				onclick="submitNewAddress('${tongGia}','${sdt}')">Xác nhận</button>
		</div>

		<div class="container mt-3">
			<h4 class="mb-2">Chọn địa chỉ giao hàng</h4>
			<div class="row g-3" id="addressContainer">
				<c:forEach var="diaChi" items="${listAddress}">
					<div class="col-md-4 d-flex">
						<input type="radio" class="btn-check" name="address"
							id="address${diaChi.getId()}" autocomplete="off"> <label
							class="btn btn-outline-secondary w-100 p-3 d-flex flex-column justify-content-center"
							for="address${diaChi.getId()}"> <span>Địa
								chỉ: ${diaChi.getDiaChi()}</span>
							<button type="button" class="btn btn-outline-warning btn-sm mt-2"
								onclick="deleteAddress('${diaChi.getId()}','${tongGia}','${sdt}')">Xóa</button>
						</label>
					</div>
				</c:forEach>
				<div class="col-md-4 d-flex">
					<button type="button"
						class="btn btn-outline-secondary w-100 p-3 d-flex align-items-center justify-content-center"
						onclick="openModal()">
						<span style="font-size: 2rem; color: black; margin-right: 10px;">+</span>
						<strong style="color: black; margin-top: 5px;">Thêm địa
							chỉ</strong>
					</button>
				</div>
			</div>
			<div class="mt-3">
				<h4>Chọn một phương thức giao hàng</h4>
				<div class="border p-3 rounded p-3">
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="phuongThucGiaoHang" value="0" id="giaoTieuChuan" checked
							onclick="updateTotal(${tongGia})"> <label
							class="form-check-label" for="giaoTieuChuan">Giao hàng
							tiêu chuẩn (Miễn phí)</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="phuongThucGiaoHang" value="50000" id="giaoHoaToc"
							onclick="updateTotal(${tongGia})"> <label
							class="form-check-label" for="giaoHoaToc">Giao hàng hỏa
							tốc (+50.000 VND)</label>
					</div>
				</div>
			</div>
			<div class="mt-3">
				<h4>Chọn phương thức thanh toán</h4>
				<div class="border p-3 rounded p-3">
					<div class="form-check">
						<input type="radio" class="form-check-input" id="paymentMethod"
							checked> <label class="form-check-label">Thanh
							toán khi nhận hàng</label>
					</div>
				</div>
			</div>

			<div class="mt-3 mb-2">
				<h4>Tóm tắt đơn hàng</h4>
				<div class="order-summary border p-3 rounded p-3">
					<div class="d-flex justify-content-between align-items-center">
						<span> <c:set var="itemCount" value="0" /> <c:forEach
								var="sanPham" items="${listCart}">
								<c:set var="itemCount" value="${itemCount + sanPham.getQty()}" />
							</c:forEach> ${itemCount} mặt hàng - ${tongGia} VND
						</span>
						<button class="btn btn-link text-primary p-0" type="button"
							onclick="toggleOrderDetails()">Xem chi tiết</button>
					</div>
					<div class="mt-3" id="orderDetails" style="display: none;">
						<ul class="list-group">
							<c:forEach var="sanPham" items="${listCart}">
								<li class="list-group-item d-flex align-items-center"><img
									src="<%= request.getContextPath() %>/Images/${sanPham.getImage()}"
									alt="${sanPham.getName()}"
									style="width: 50px; height: 50px; margin-right: 10px;">
									<div class="flex-grow-1">
										<strong>${sanPham.getName()}</strong><br> <small>Số
											lượng: ${sanPham.getQty()}</small><br> <small>Đơn giá:
											${sanPham.getPrice()}₫</small>
									</div></li>
							</c:forEach>
						</ul>
					</div>
					<div class="mt-3">
						Phí giao hàng: <strong id="phiGiaoHang">0 VND</strong>
					</div>
					<div class="mt-3">
						Thành tiền: <strong id="thanhTien">${tongGia} VND</strong>
						<div class="text-end mt-3">
							<button class="btn btn-secondary" onclick="FormCart('${SDT}')">Trở
								lại</button>
							<button class="btn btn-primary" onclick="submitPayment('${sdt}')">Xác
								nhận</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-cn7l7gDp0eyRaIEFaOIrn6UGoB3z7lQGp3lOmMLH/6Qm3jmZ6OwYMX23kIB3SL9l"
		crossorigin="anonymous"></script>
</body>
</html>
