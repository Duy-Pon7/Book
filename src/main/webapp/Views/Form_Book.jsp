<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Sách</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            text-align: center; /* Căn giữa nội dung trong container */
            margin-top: 50px; /* Thêm khoảng cách từ trên */
        }
        .row {
            margin-bottom: 15px; /* Thêm khoảng cách giữa các dòng */
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Quản lý Sách</h1>

        <form method="post" class="mb-4">
		    <!-- Trường ẩn để lưu ID (nếu sửa sách) -->
		    <input type="hidden" id="bookId" name="id">
		
		    <!-- Các trường nhập liệu -->
		    <div class="row g-3 text-center">
		        <div class="col-md-2">
		            <input type="text" id="tenSach" name="tenSach" class="form-control" placeholder="Tên Sách" required>
		        </div>
		        <div class="col-md-2">
		            <input type="text" id="tenLoai" name="tenLoai" class="form-control" placeholder="Thể Loại" required>
		        </div>
		        <div class="col-md-2">
		            <input type="text" id="tacGia" name="tacGia" class="form-control" placeholder="Tác Giả" required>
		        </div>
		        <div class="col-md-2">
		            <input type="text" id="nxb" name="nxb" class="form-control" placeholder="Nhà Xuất Bản" required>
		        </div>
		        <div class="col-md-2 text-center">
		            <input type="text" id="image" name="image" class="form-control" placeholder="Link Ảnh" required>
		        </div>
		    </div>
		    <div class="row g-3 text-center">
		        <div class="col-md-2">
		            <input type="number" step="0.01" id="giaGoc" name="giaGoc" class="form-control" placeholder="Giá Gốc" required>
		        </div>
		        <div class="col-md-2">
		            <input type="number" step="0.01" id="giaBan" name="giaBan" class="form-control" placeholder="Giá Bán" required>
		        </div>
		        <div class="col-md-2">
		            <input type="number" id="soLuong" name="soLuong" class="form-control" placeholder="Số Lượng Tồn" required>
		        </div>
		        <div class="col-md-2">
		            <input type="text" id="moTa" name="moTa" class="form-control" placeholder="Mô Tả" required>
		        </div>
		    </div>
		    
		    <!-- Nút Thêm và Sửa -->
		    <div class="mt-4 text-center">
		        <button type="submit" class="btn btn-success" formaction="${pageContext.request.contextPath}/BookAdd">Thêm Sách</button>
		        <button type="submit" class="btn btn-warning" formaction="${pageContext.request.contextPath}/BookUpdate">Sửa Sách</button>
		    </div>
		</form>


        <!-- Hiển thị danh sách sách -->
        <table class="table table-bordered">
            <thead class="table-primary">
                <tr>
                    <th>ID</th>
                    <th>Tên Sách</th>
                    <th>Thể Loại</th>
                    <th>Tác Giả</th>
                    <th>Nhà Xuất Bản</th>
                    <th>Giá Gốc</th>
                    <th>Giá Bán</th>
                    <th>Số Lượng Tồn</th>
                    <th>Mô Tả</th>
                    <th>Link Ảnh</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty bookList}">
                    <tr><td colspan="11" class="text-center">Không có sách nào.</td></tr>
                </c:if>
                <c:forEach var="book" items="${bookList}">
                    <tr onclick="editBook(${book.maSach}, '${book.tenSach}', '${book.tenLoai}', '${book.tacGia}', '${book.nxb}', '${book.moTa}', '${book.image}', ${book.soLuong}, ${book.giaGoc}, ${book.giaBan})">
                        <td>${book.maSach}</td>
                        <td>${book.tenSach}</td>
                        <td>${book.tenLoai}</td>
                        <td>${book.tacGia}</td>
                        <td>${book.nxb}</td>
                        <td>${book.giaGoc}</td>
                        <td>${book.giaBan}</td>
                        <td>${book.soLuong}</td> <!-- Hiển thị số lượng tồn kho -->
                        <td>${book.moTa}</td>
                        <td><img src="${book.image}" alt="Ảnh" style="width:50px;height:auto;"></td>
                        <td>
                            <!-- Nút Xóa -->
                            <form action="${pageContext.request.contextPath}/BookDelete" method="post" class="d-inline" onsubmit="return confirmDelete()">
							    <input type="hidden" name="id" value="${book.maSach}">
							    <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
							</form>
							
							<script>
							    function confirmDelete() {
							        return confirm("Bạn có chắc chắn muốn xóa sách này?");
							    }
							</script>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script>
        function editBook(id, tenSach, tenLoai, tacGia, nxb, moTa, image, soLuong, giaGoc, giaBan) {
            // Điền thông tin vào các ô input
            document.getElementById("bookId").value = id;
            document.getElementById("tenSach").value = tenSach;
            document.getElementById("tenLoai").value = tenLoai;
            document.getElementById("tacGia").value = tacGia;
            document.getElementById("nxb").value = nxb;
            document.getElementById("moTa").value = moTa;
            document.getElementById("image").value = image;
            document.getElementById("soLuong").value = soLuong;
            document.getElementById("giaGoc").value = giaGoc;
            document.getElementById("giaBan").value = giaBan;
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
