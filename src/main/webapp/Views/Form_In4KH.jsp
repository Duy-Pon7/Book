<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin khách hàng</title>
    <!-- Link Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center mb-4">Thông Tin Khách Hàng</h2>

        <!-- Tìm kiếm -->
        <div class="row mb-3">
            <div class="col-md-4 offset-md-4">
                <input type="text" id="searchPhone" class="form-control" placeholder="Nhập số điện thoại cần tìm...">
            </div>
        </div>

        <!-- Bảng thông tin khách hàng -->
		<table class="table table-bordered table-striped text-center">
		    <thead class="table-dark">
		        <tr>
		            <th>STT</th>
		            <th>Họ Khách Hàng</th>
		            <th>Tên Khách Hàng</th>
		            <th>Số Điện Thoại</th>
		            <th>Địa Chỉ</th>
		        </tr>
		    </thead>
		    <tbody id="customerTable">
		        <c:if test="${empty listKH}">
		            <tr><td colspan="5" class="text-center">Không có thông tin khách hàng.</td></tr>
		        </c:if>
		        <c:forEach var="kh" items="${listKH}" varStatus="status">
		            <tr>
		                <td>${status.index + 1}</td>
		                <td>${kh.ho}</td>
		                <td>${kh.ten}</td>
		                <td>${kh.sDT}</td>
		                <td>${kh.diaChi}</td>
		            </tr>
		        </c:forEach>
		    </tbody>
		</table>

    </div>

    <!-- Link Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Xử lý tìm kiếm
        document.getElementById('searchPhone').addEventListener('input', function () {
            const searchValue = this.value.toLowerCase();
            const rows = document.querySelectorAll('#customerTable tr');
            
            rows.forEach(row => {
                const phone = row.cells[3].textContent.toLowerCase();
                if (phone.includes(searchValue)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>
