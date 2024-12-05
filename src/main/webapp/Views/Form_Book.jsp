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
        /* Ẩn mũi tên xuống trên nút dropdown */
		.dropdown-toggle::after {
    		display: none;
		}  
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
        <h1 class="text-center mb-4">Quản lý Sách</h1>
        <form method="post" enctype="multipart/form-data" class="mb-4">
		    <!-- Trường ẩn để lưu ID (nếu sửa sách) -->
		    <input type="hidden" id="bookId" name="id">
		
		    <!-- Các trường nhập liệu -->
		    <div class="row g-3">
			    <div class="col-md-3">
			        <label for="tenSach" class="form-label">Tên Sách</label>
			        <input type="text" id="tenSach" name="tenSach" class="form-control" placeholder="Tên Sách" required>
			    </div>
			    <div class="col-md-3">
			        <label for="tenLoai" class="form-label">Thể Loại</label>
			        <input type="text" id="tenLoai" name="tenLoai" class="form-control" placeholder="Thể Loại" required>
			    </div>
			    <div class="col-md-3">
			        <label for="tacGia" class="form-label">Tác Giả</label>
			        <input type="text" id="tacGia" name="tacGia" class="form-control" placeholder="Tác Giả" required>
			    </div>
			    <div class="col-md-3">
			        <label for="nxb" class="form-label">Nhà Xuất Bản</label>
			        <input type="text" id="nxb" name="nxb" class="form-control" placeholder="Nhà Xuất Bản" required>
			    </div>
			</div>
			<div class="row g-3">
			    <div class="col-md-3">
			        <label for="giaGoc" class="form-label">Giá Gốc</label>
			        <input type="number" step="0.01" id="giaGoc" name="giaGoc" class="form-control" placeholder="Giá Gốc" required>
			    </div>
			    <div class="col-md-3">
			        <label for="giaBan" class="form-label">Giá Bán</label>
			        <input type="number" step="0.01" id="giaBan" name="giaBan" class="form-control" placeholder="Giá Bán" required>
			    </div>
			    <div class="col-md-3">
			        <label for="soLuong" class="form-label">Số Lượng Tồn</label>
			        <input type="number" id="soLuong" name="soLuong" class="form-control" placeholder="Số Lượng Tồn" required>
			    </div>
			</div>
			<div>
                <label for="moTa" class="form-label">Mô Tả</label>
                <textarea class="form-control" aria-label="With textarea" id="moTa" name="moTa"></textarea>
            </div>
            <div class="row g-3">
	            <div class="col-md-3">
				    <label for="image" class="form-label">Hình Ảnh</label>
					<input type="file" id="image" name="image" class="form-control" accept="image/*">
				    <input type="hidden" id="imageName" name="nameimg">
				</div>
				<div class="col-md-3">
				    <img id="currentImage" src="https://photo.znews.vn/w660/Uploaded/natmts/2023_02_03/z4080571344877_dcc05eb033d9e910039ad77df6eb1b05.jpg" class="img-thumbnail mt-3" style="width: 200px; height: 250px;">
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
        <table class="table table-striped table-bordered">
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
	                        <div>
	                            <label for="moTa" class="form-label">Mô Tả</label>
	                            <textarea class="form-control" aria-label="With textarea" id="moTa" name="moTa"></textarea>
	                        </div>
	                        <div class="col-md-6">
	                            <label for="image" class="form-label">Chọn Ảnh</label>
								<input type="file" id="image" name="image" class="form-control" accept="image/*">
	                        </div>
	                        <div class="col-md-6">
	                            <img id="currentImage" src="https://photo.znews.vn/w660/Uploaded/natmts/2023_02_03/z4080571344877_dcc05eb033d9e910039ad77df6eb1b05.jpg" alt="Hình Ảnh" class="img-thumbnail mt-2" style="width: 200px; height: 170px;">
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
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
