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

        <form method="post" enctype="multipart/form-data" class="mb-4">
		    <!-- Trường ẩn để lưu ID (nếu sửa sách) -->
		    <input type="hidden" id="bookId" name="id">
		
		    <!-- Các trường nhập liệu -->
		    <div class="row g-3 text-center">
			    <div class="col-md-2">
			        <label for="tenSach" class="form-label">Tên Sách</label>
			        <input type="text" id="tenSach" name="tenSach" class="form-control" placeholder="Tên Sách" required>
			    </div>
			    <div class="col-md-2">
			        <label for="tenLoai" class="form-label">Thể Loại</label>
			        <input type="text" id="tenLoai" name="tenLoai" class="form-control" placeholder="Thể Loại" required>
			    </div>
			    <div class="col-md-2">
			        <label for="tacGia" class="form-label">Tác Giả</label>
			        <input type="text" id="tacGia" name="tacGia" class="form-control" placeholder="Tác Giả" required>
			    </div>
			    <div class="col-md-2">
			        <label for="nxb" class="form-label">Nhà Xuất Bản</label>
			        <input type="text" id="nxb" name="nxb" class="form-control" placeholder="Nhà Xuất Bản" required>
			    </div>
			    <div class="col-md-2">
				    <label for="image" class="form-label">Hình Ảnh</label>
				    <input type="file" id="image" name="image" class="form-control" accept="image/*">
				    <input type="hidden" id="imageName" name="nameimg">
				</div>
			</div>
			<div class="row g-3 text-center">
			    <div class="col-md-2">
			        <label for="giaGoc" class="form-label">Giá Gốc</label>
			        <input type="number" step="0.01" id="giaGoc" name="giaGoc" class="form-control" placeholder="Giá Gốc" required>
			    </div>
			    <div class="col-md-2">
			        <label for="giaBan" class="form-label">Giá Bán</label>
			        <input type="number" step="0.01" id="giaBan" name="giaBan" class="form-control" placeholder="Giá Bán" required>
			    </div>
			    <div class="col-md-2">
			        <label for="soLuong" class="form-label">Số Lượng Tồn</label>
			        <input type="number" id="soLuong" name="soLuong" class="form-control" placeholder="Số Lượng Tồn" required>
			    </div>
			    <div class="col-md-2">
			        <label for="moTa" class="form-label">Mô Tả</label>
			        <input type="text" id="moTa" name="moTa" class="form-control" placeholder="Mô Tả" required>
			    </div>
			    <div class="col-md-2">
				    <img id="currentImage" src="" alt="Hình Ảnh" class="img-thumbnail mt-2" style="width: 500px; height: auto;">
				</div>
			</div>

		    
		    <!-- Nút Thêm và Sửa -->
		    <div class="mt-4 text-center">
		    <!-- Nút Thêm Sách (mở modal) -->
				<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addBookModal">
				    Thêm Sách
				</button>
		        <button type="submit" class="btn btn-warning" formaction="${pageContext.request.contextPath}/BookUpdate" onclick="return confirmUpdate()">Sửa Sách</button>
		    </div>
		</form>


        <!-- Hiển thị danh sách sách -->
        <table class="table table-striped">
            <thead class="table-secondary">
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
                    <th>Hình Ảnh</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty bookList}">
                    <tr><td colspan="11" class="text-center">Không có sách nào.</td></tr>
                </c:if>
                <c:forEach var="book" items="${bookList}">
				    <tr onclick="editBook(${book.id}, '${book.name}', '${book.category}', '${book.author}', '${book.publisher}', '${book.description}', '${book.image}', ${book.quantity}, ${book.originalPrice}, ${book.salePrice})">
				        <td>${book.id}</td>
				        <td style="text-align: left;">${book.name}</td>
				        <td>${book.category}</td>
				        <td style="text-align: left;">${book.author}</td>
				        <td style="text-align: left;">${book.publisher}</td>
				        <td>${book.originalPrice}</td>
				        <td>${book.salePrice}</td>
				        <td>${book.quantity}</td> <!-- Hiển thị số lượng tồn kho -->
				        <td style="text-align: left;">${book.description}</td>
				        <td class="text-center">
				            <img
				                src="<%= request.getContextPath() %>/Images/${book.image}"
				                alt="${book.name}" class="img-thumbnail"
				                style="width: 80px; height: auto;">
				        </td>
				        <td>
				            <!-- Nút Xóa -->
				            <form action="${pageContext.request.contextPath}/BookDelete" method="post" class="d-inline" onsubmit="return confirmDelete()">
				                <input type="hidden" name="id" value="${book.id}">
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
	<!-- Modal Thêm Sách -->
	<div class="modal fade" id="addBookModal" tabindex="-1" aria-labelledby="addBookModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="addBookModalLabel">Thêm Sách</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		        	
	            </div>
	            <div class="modal-body">
	                <form method="post" enctype="multipart/form-data" class="mb-4">
	                    <input type="hidden" id="bookId" name="id">
	
	                    <!-- Các trường nhập liệu -->
	                    <div class="row g-3">
	                        <div class="col-md-6">
	                            <label for="tenSach" class="form-label">Tên Sách</label>
	                            <input type="text" id="tenSach" name="tenSach" class="form-control" placeholder="Tên Sách" required>
	                        </div>
	                        <div class="col-md-6">
	                            <label for="tenLoai" class="form-label">Thể Loại</label>
	                            <input type="text" id="tenLoai" name="tenLoai" class="form-control" placeholder="Thể Loại" required>
	                        </div>
	                        <div class="col-md-6">
	                            <label for="tacGia" class="form-label">Tác Giả</label>
	                            <input type="text" id="tacGia" name="tacGia" class="form-control" placeholder="Tác Giả" required>
	                        </div>
	                        <div class="col-md-6">
	                            <label for="nxb" class="form-label">Nhà Xuất Bản</label>
	                            <input type="text" id="nxb" name="nxb" class="form-control" placeholder="Nhà Xuất Bản" required>
	                        </div>
	                        <div class="col-md-6">
	                            <label for="image" class="form-label">Hình Ảnh</label>
	                            <input type="file" id="image" name="image" class="form-control" accept="image/*">
	                        </div>
	                        <div class="col-md-6">
	                            <img id="currentImage" src="" alt="Hình Ảnh" class="img-thumbnail mt-2" style="width: 100%; height: auto;">
	                        </div>
	                        <div class="col-md-6">
	                            <label for="giaGoc" class="form-label">Giá Gốc</label>
	                            <input type="number" step="0.01" id="giaGoc" name="giaGoc" class="form-control" placeholder="Giá Gốc" required>
	                        </div>
	                        <div class="col-md-6">
	                            <label for="giaBan" class="form-label">Giá Bán</label>
	                            <input type="number" step="0.01" id="giaBan" name="giaBan" class="form-control" placeholder="Giá Bán" required>
	                        </div>
	                        <div class="col-md-6">
	                            <label for="soLuong" class="form-label">Số Lượng Tồn</label>
	                            <input type="number" id="soLuong" name="soLuong" class="form-control" placeholder="Số Lượng Tồn" required>
	                        </div>
	                        <div class="col-md-6">
	                            <label for="moTa" class="form-label">Mô Tả</label>
	                            <input type="text" id="moTa" name="moTa" class="form-control" placeholder="Mô Tả" required>
	                        </div>
	                    </div>
	
	                    <!-- Nút Thêm -->
	                    <div class="mt-4 text-center">
	                        <button type="submit" class="btn btn-success" formaction="${pageContext.request.contextPath}/BookAdd">Thêm Sách</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	<script>
		// Hàm xử lý xem trước hình ảnh
		function handleImagePreview(input, previewImg) {
		    const file = input.files[0]; // Lấy file từ input
		    if (file) {
		        const reader = new FileReader();
		        reader.onload = function (e) {
		            // Gắn dữ liệu file vào src của ảnh
		            previewImg.src = e.target.result;
		        };
		        reader.readAsDataURL(file); // Đọc file dưới dạng Data URL
		    } else {
		        // Nếu không có file nào được chọn, đặt src về rỗng
		        previewImg.src = '';
		    }
		}
	
		// Thêm sự kiện cho input file chính
		document.getElementById('image').addEventListener('change', function () {
		    handleImagePreview(this, document.getElementById('currentImage'));
		});
	
		// Thêm sự kiện cho input file trong modal
		document.querySelector('#addBookModal #image').addEventListener('change', function () {
		    handleImagePreview(this, document.querySelector('#addBookModal #currentImage'));
		});
		function confirmUpdate() {
		    return confirm("Bạn có chắc chắn muốn sửa sách này?");
		}
	</script>
	<script>
        function editBook(id, tenSach, tenLoai, tacGia, nxb, moTa, image, soLuong, giaGoc, giaBan) {
            // Điền thông tin vào các ô input
            document.getElementById("bookId").value = id;
            document.getElementById("tenSach").value = tenSach;
            document.getElementById("tenLoai").value = tenLoai;
            document.getElementById("tacGia").value = tacGia;
            document.getElementById("nxb").value = nxb;
            document.getElementById("moTa").value = moTa;
            document.getElementById("imageName").value = image;
            document.getElementById("currentImage").src = `<%= request.getContextPath() %>/Images/`+image;
            document.getElementById("soLuong").value = soLuong;
            document.getElementById("giaGoc").value = giaGoc;
            document.getElementById("giaBan").value = giaBan;
        }
    </script>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
