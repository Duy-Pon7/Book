<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách đơn mua</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Danh sách đơn mua</h1>
		
        <!-- Hiển thị thông báo nếu không có dữ liệu -->
        <c:if test="${not empty message}">
            <div class="alert alert-warning">${message}</div>
        </c:if>

        <table class="table table-bordered">
            <thead class="table-primary">
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
						    <button class="btn btn-primary" onclick="toggleFetchDetails('${item.maDon}'); event.preventDefault();">Chi tiết</button>
						</td>
				        <td class="text-center">
						    <form action="${pageContext.request.contextPath}/ListKH" method="get">
						        <input type="hidden" name="sdt" value="${item.sDT}" />
						        <button type="button" class="btn btn-primary" onclick="toggleAndFetchDetails('${item.sDT}')">Thông tin khách hàng</button>
						    </form>
						</td>
				    </tr>
				    <!-- Hàng chi tiết ẩn -->
				    <tr id="details-${item.maDon}" style="display: none;">
				        <td colspan="7">
				            <table class="table table-sm table-bordered">
				                <thead class="table-light">
				                    <tr>
				                        <th>Mã sản phẩm</th>
				                        <th>Tên sách</th>
				                        <th>Ảnh</th>
				                        <th>Giá bán</th>
				                        <th>Số lượng</th>
				                    </tr>
				                </thead>
				                <tbody>
				                    <tbody id="chitietdh">
				                </tbody>
				            </table>
				        </td>
				    </tr>
				    <!-- Hàng chi tiết ẩn -->
					<tr id="details-${item.sDT}" style="display: none;">
					    <td colspan="7">
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
					                <!-- Dữ liệu khách hàng sẽ được thêm vào đây thông qua AJAX -->
					            </tbody>
					        </table>
					    </td>
					</tr>
				</c:forEach>
            </tbody>
        </table>
    </div>
    <script>
	    function loadCustomerData(sdt) {
	        // Gửi AJAX request đến Servlet để lấy dữ liệu khách hàng
	        var xhr = new XMLHttpRequest();
	        xhr.open("GET", "/Book/ListKH?sdt=" + sdt, true);
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	        xhr.onload = function() {
	            if (xhr.status === 200) {
	                // Thêm dữ liệu HTML vào bảng khách hàng
	                document.getElementById("customerTable").innerHTML = xhr.responseText;
	            } else {
	                console.error("Lỗi khi tải danh sách khách hàng.");
	            }
	        };
	
	        xhr.send();
	        
	    }
	    function loadOrderDetails(maDon) {
	    	var xhr = new XMLHttpRequest();
	        xhr.open("GET", "/Book/ChiTietHD?id=" + maDon, true);
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	        xhr.onload = function() {
	            if (xhr.status === 200) {
	                document.getElementById("chitietdh").innerHTML = xhr.responseText;
	            } else {
	                console.error("Lỗi khi tải danh sách.");
	            }
	        };
	
	        xhr.send();
        }
	</script>

	<script>
	    function toggleAndFetchDetails(sdt) {
	        // Toggling the row visibility
	        var row = document.getElementById("details-" + sdt);
	        if (row.style.display === "none") {
	            row.style.display = "table-row";
	            loadCustomerData(sdt);
	        } else {
	            row.style.display = "none";
	        }
	    }
	    function toggleFetchDetails(maDon) {
	        // Toggling the row visibility
	        var row = document.getElementById("details-" + maDon);
	        if (row.style.display === "none") {
	            row.style.display = "table-row";
	            loadOrderDetails(maDon)
	        } else {
	            row.style.display = "none";
	        }
	    }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
