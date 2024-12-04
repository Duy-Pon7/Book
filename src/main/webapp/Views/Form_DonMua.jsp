<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách đơn mua</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Ẩn mũi tên xuống trên nút dropdown */
		.dropdown-toggle::after {
    		display: none;
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
				<form class="d-flex me-5">
					<a class="btn" onclick="FormCart('${SDT}', '${pass}')"> <svg
							xmlns="http://www.w3.org/2000/svg" fill="#737373"
							viewBox="0 0 24 24" width="24px" height="24px">    <path
								d="M 4.4140625 1.9960938 L 1.0039062 2.0136719 L 1.0136719 4.0136719 L 3.0839844 4.0039062 L 6.3789062 11.908203 L 5.1816406 13.824219 C 4.7816406 14.464219 4.7609531 15.272641 5.1269531 15.931641 C 5.4929531 16.590641 6.1874063 17 6.9414062 17 L 19 17 L 19 15 L 6.9414062 15 L 6.8769531 14.882812 L 8.0527344 13 L 15.521484 13 C 16.248484 13 16.917531 12.604703 17.269531 11.970703 L 20.873047 5.4863281 C 21.046047 5.1763281 21.041328 4.7981875 20.861328 4.4921875 C 20.681328 4.1871875 20.352047 4 19.998047 4 L 5.25 4 L 4.4140625 1.9960938 z M 6.0820312 6 L 18.298828 6 L 15.521484 11 L 8.1660156 11 L 6.0820312 6 z M 7 18 A 2 2 0 0 0 5 20 A 2 2 0 0 0 7 22 A 2 2 0 0 0 9 20 A 2 2 0 0 0 7 18 z M 17 18 A 2 2 0 0 0 15 20 A 2 2 0 0 0 17 22 A 2 2 0 0 0 19 20 A 2 2 0 0 0 17 18 z" /></svg>
						<p class="fw-light m-0">Giỏ hàng</p>
					</a>
					<div class="dropdown">
						<a class="btn btn-light dropdown-toggle" href="#" role="button"
							id="dropdownMenuLink" data-bs-toggle="dropdown"
							aria-expanded="false"><svg xmlns="http://www.w3.org/2000/svg"
								fill="#737373" viewBox="0 0 24 24" width="24px" height="24px">
							<path
									d="M 12 3 C 9.8027056 3 8 4.8027056 8 7 C 8 9.1972944 9.8027056 11 12 11 C 14.197294 11 16 9.1972944 16 7 C 16 4.8027056 14.197294 3 12 3 z M 12 5 C 13.116414 5 14 5.8835859 14 7 C 14 8.1164141 13.116414 9 12 9 C 10.883586 9 10 8.1164141 10 7 C 10 5.8835859 10.883586 5 12 5 z M 12 14 C 10.255047 14 8.1871638 14.409783 6.4492188 15.095703 C 5.5802462 15.438663 4.7946961 15.84605 4.1660156 16.369141 C 3.5373351 16.892231 3 17.599384 3 18.5 L 3 21 L 21 21 L 21 20 L 21 18.5 C 21 17.599384 20.462665 16.892231 19.833984 16.369141 C 19.205304 15.84605 18.419754 15.438663 17.550781 15.095703 C 15.812836 14.409783 13.744953 14 12 14 z M 12 16 C 13.414047 16 15.346055 16.373999 16.818359 16.955078 C 17.554512 17.245618 18.176961 17.591965 18.554688 17.90625 C 18.932412 18.220535 19 18.434616 19 18.5 L 19 19 L 5 19 L 5 18.5 C 5 18.434616 5.0675867 18.220535 5.4453125 17.90625 C 5.8230383 17.591965 6.4454882 17.245618 7.1816406 16.955078 C 8.6539455 16.373999 10.585953 16 12 16 z" /></svg>
							<p class="fw-light m-0">Tài khoản</p> </a>
						<!-- Dropdown menu -->
						<ul class="dropdown-menu" aria-labelledby="dropdownMenu">
							<li><a class="dropdown-item" onclick="CheckRole1('${SDT}', '${role}')">Quản lý sản phẩm</a></li>
							<li><a class="dropdown-item" onclick="CheckRole2('${SDT}', '${role}')">Quản lý đơn bán</a></li>
							<li><a class="dropdown-item" onclick="LogOut()">Đăng xuất</a></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</nav>
    <div class="container mt-3 mb-3 bg-white p-3 rounded shadow">
        <h1 class="text-center mb-4">Danh sách đơn mua</h1>
		
        <!-- Hiển thị thông báo nếu không có dữ liệu -->
        <c:if test="${not empty message}">
            <div class="alert alert-warning">${message}</div>
        </c:if>

        <table class="table table-success table-striped text-center table-bordered">
            <thead class="table table-success table-striped">
                <tr>
                    <th>Mã Đơn</th>
                    <th>Số Điện Thoại</th>
                    <th>Ngày Mua</th>
                    <th>Trị Giá Đơn Hàng</th>
                    <th>Địa Chỉ</th>
                    <th>Xem chi tiết</th>
        			<th>Xem thông tin khách hàng</th>
                </tr>
            </thead>
            <tbody>
                <!-- Hiển thị danh sách đơn mua -->
                <c:if test="${empty listDonMua}"> 
                    <tr><td colspan="7" class="text-center">Không có đơn mua nào.</td></tr>
                </c:if>
                <c:forEach var="item" items="${listDonMua}">
				    <!-- Hàng chính hiển thị thông tin đơn mua -->
				    <tr>
				        <td>${item.maDon}</td>
				        <td>${item.sDT}</td>
				        <td>${item.ngayMua}</td>
				        <td>${item.triGiaDH} VND</td>
				        <td>${item.diaChi}</td>
				        <td class="text-center">
				            <button class="btn btn-outline-success" onclick="toggleFetchDetails('${item.maDon}'); event.preventDefault();">Chi tiết</button>
				        </td>
				        <td class="text-center">
				            <form action="${pageContext.request.contextPath}/ListKH" method="get">
				                <input type="hidden" name="sdt" value="${item.sDT}" />
				                <button type="button" class="btn btn-outline-success" onclick="toggleAndFetchDetails('${item.sDT}')">Thông tin khách hàng</button>
				            </form>
				        </td>
				    </tr>
				    <!-- Hàng chi tiết ẩn -->
				    <tr id="details-${item.maDon}" style="display: none;">
				        <td colspan="7">
				            <table class="table table-sm table-bordered text-center">
				                <thead class="table-info">
				                    <tr>
				                        <th>Mã sản phẩm</th>
				                        <th>Tên sách</th>
				                        <th>Ảnh</th>
				                        <th>Giá bán</th>
				                        <th>Số lượng</th>
				                    </tr>
				                </thead>
				                <tbody id="chitietdh-${item.maDon}">
				                    <!-- Dữ liệu chi tiết đơn hàng sẽ được thêm vào đây -->
				                </tbody>
				            </table>
				        </td>
				    </tr>
				    <!-- Hàng chi tiết khách hàng ẩn -->
				    <tr id="details-${item.sDT}" style="display: none;">
				        <td colspan="7">
				            <table class="table table-bordered table-striped text-center">
				                <thead class="table-info">
				                    <tr>
				                        <th>STT</th>
				                        <th>Họ Khách Hàng</th>
				                        <th>Tên Khách Hàng</th>
				                        <th>Số Điện Thoại</th>
				                        <th>Địa Chỉ</th>
				                    </tr>
				                </thead>
				                <tbody id="customerTable-${item.sDT}">
				                    <!-- Dữ liệu khách hàng sẽ được thêm vào đây -->
				                </tbody>
				            </table>
				        </td>
				    </tr>
				</c:forEach>

            </tbody>
        </table>
    </div>
    <script>
	    function loadOrderDetails(maDon) {
	        var xhr = new XMLHttpRequest();
	        xhr.open("GET", "/Book/ChiTietHD?id=" + maDon, true);
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	        xhr.onload = function() {
	            if (xhr.status === 200) {
	                document.getElementById("chitietdh-" + maDon).innerHTML = xhr.responseText;
	            } else {
	                console.error("Lỗi khi tải danh sách.");
	            }
	        };
	
	        xhr.send();
	    }
	
	    function loadCustomerData(sdt) {
	        var xhr = new XMLHttpRequest();
	        xhr.open("GET", "/Book/ListKH?sdt=" + sdt, true);
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	        xhr.onload = function() {
	            if (xhr.status === 200) {
	                document.getElementById("customerTable-" + sdt).innerHTML = xhr.responseText;
	            } else {
	                console.error("Lỗi khi tải danh sách khách hàng.");
	            }
	        };
	
	        xhr.send();
	    }
	
	    function toggleFetchDetails(maDon) {
	        var row = document.getElementById("details-" + maDon);
	        if (row.style.display === "none") {
	            row.style.display = "table-row";
	            loadOrderDetails(maDon);
	        } else {
	            row.style.display = "none";
	        }
	    }
	
	    function toggleAndFetchDetails(sdt) {
	        var row = document.getElementById("details-" + sdt);
	        if (row.style.display === "none") {
	            row.style.display = "table-row";
	            loadCustomerData(sdt);
	        } else {
	            row.style.display = "none";
	        }
	    }
	    function home() {
    		window.location.href = '/Book/read';
    	}
        function CheckRole1(sdt, role) {
            if (role === 'Admin') {
            	window.location.href = '/Book/BookList?sdt=' + sdt;
            } else {
                alert('Bạn không có quyền truy cập!');
            }
        }
		function CheckRole2(sdt, role) {
            if (role === 'Admin') {
            	window.location.href = '/Book/DonMua?sdt=' + sdt;
            } else {
                alert('Bạn không có quyền truy cập!');
            }
        }
		function LogOut() {
            window.location.href = 'Views/Form_Login.jsp';
        }
		function FormCart(sdt, pass) {
			window.location.href = '/Book/ViewCart?sdt=' + sdt + '&pass=' + pass;

		}

    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
