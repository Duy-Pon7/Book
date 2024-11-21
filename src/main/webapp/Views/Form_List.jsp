<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DreamBooks</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><b>DreamBooks</b></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="#">Sách
							tiếng Việt</a></li>
					<li class="nav-item"><a class="nav-link" href="#">English
							Books</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Sách giáo
							khoa </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Tiểu học</a></li>
							<li><a class="dropdown-item" href="#">THCS</a></li>
							<li><a class="dropdown-item" href="#">THPT</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Đại học</a></li>
						</ul></li>
					<li class="nav-item"><input class="form-control me-2"
						type="search" placeholder="Tìm kiếm sản phẩm" aria-label="Search"></li>

				</ul>
				<form class="d-flex">
					<a class="btn" href="#"> <svg
							xmlns="http://www.w3.org/2000/svg" fill="#737373"
							viewBox="0 0 24 24" width="24px" height="24px">    <path
								d="M 4.4140625 1.9960938 L 1.0039062 2.0136719 L 1.0136719 4.0136719 L 3.0839844 4.0039062 L 6.3789062 11.908203 L 5.1816406 13.824219 C 4.7816406 14.464219 4.7609531 15.272641 5.1269531 15.931641 C 5.4929531 16.590641 6.1874063 17 6.9414062 17 L 19 17 L 19 15 L 6.9414062 15 L 6.8769531 14.882812 L 8.0527344 13 L 15.521484 13 C 16.248484 13 16.917531 12.604703 17.269531 11.970703 L 20.873047 5.4863281 C 21.046047 5.1763281 21.041328 4.7981875 20.861328 4.4921875 C 20.681328 4.1871875 20.352047 4 19.998047 4 L 5.25 4 L 4.4140625 1.9960938 z M 6.0820312 6 L 18.298828 6 L 15.521484 11 L 8.1660156 11 L 6.0820312 6 z M 7 18 A 2 2 0 0 0 5 20 A 2 2 0 0 0 7 22 A 2 2 0 0 0 9 20 A 2 2 0 0 0 7 18 z M 17 18 A 2 2 0 0 0 15 20 A 2 2 0 0 0 17 22 A 2 2 0 0 0 19 20 A 2 2 0 0 0 17 18 z" /></svg>
						<p class="fw-light m-0">Giỏ hàng</p>
					</a> <a class="btn" href="#"> <svg
							xmlns="http://www.w3.org/2000/svg" fill="#737373"
							viewBox="0 0 24 24" width="24px" height="24px">
							<path
								d="M 12 3 C 9.8027056 3 8 4.8027056 8 7 C 8 9.1972944 9.8027056 11 12 11 C 14.197294 11 16 9.1972944 16 7 C 16 4.8027056 14.197294 3 12 3 z M 12 5 C 13.116414 5 14 5.8835859 14 7 C 14 8.1164141 13.116414 9 12 9 C 10.883586 9 10 8.1164141 10 7 C 10 5.8835859 10.883586 5 12 5 z M 12 14 C 10.255047 14 8.1871638 14.409783 6.4492188 15.095703 C 5.5802462 15.438663 4.7946961 15.84605 4.1660156 16.369141 C 3.5373351 16.892231 3 17.599384 3 18.5 L 3 21 L 21 21 L 21 20 L 21 18.5 C 21 17.599384 20.462665 16.892231 19.833984 16.369141 C 19.205304 15.84605 18.419754 15.438663 17.550781 15.095703 C 15.812836 14.409783 13.744953 14 12 14 z M 12 16 C 13.414047 16 15.346055 16.373999 16.818359 16.955078 C 17.554512 17.245618 18.176961 17.591965 18.554688 17.90625 C 18.932412 18.220535 19 18.434616 19 18.5 L 19 19 L 5 19 L 5 18.5 C 5 18.434616 5.0675867 18.220535 5.4453125 17.90625 C 5.8230383 17.591965 6.4454882 17.245618 7.1816406 16.955078 C 8.6539455 16.373999 10.585953 16 12 16 z" /></svg>
						<p class="fw-light m-0">Tài khoản</p>
					</a>
				</form>
			</div>
		</div>
	</nav>
	<div class="row">
		<div class="col-sm-4">
			<p>Tài khoản</p>
		</div>
		<img src="undraw_education_f8ru.png">
		<div class="col-sm-8 d-flex flex-wrap">
			<div class="row">
				<!-- Lặp qua danh sách sách -->
				<c:forEach var="book" items="${books}">
					<div class="col-sm-4">
						<div class="card m-2" style="width: 14rem;">
							<img src="${book.image}" class="card-img-top" alt="${book.name}">
							<div class="card-body">
								<h5 class="card-title">${book.name}</h5>
								<p class="card-text">Giá gốc: ${book.originalPrice} VND</p>
								<p class="card-text">Giá bán: ${book.salePrice} VND</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>