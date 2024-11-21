<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">DreamBooks</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled"
						aria-disabled="true">Disabled</a></li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<p class="fs-1 text-primary mt-5"><b>DreamBooks</b></p>
				<img src="undraw_education_f8ru.png" class="img-fluid" alt="...">
			</div>
			<div class="col-sm-6 mt-5">
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-7 border rounded border-2 mt-5 shadow-lg p-3 mb-5 bg-body-tertiary rounded">
						<div class="mt-3 mb-3">
							<input type="text" class="form-control"
								id="formGroupExampleInput" placeholder="Nhập tên tài khoản">
						</div>
						<div class="mb-3">
							<input type="password" id="inputPassword6" class="form-control"
								aria-describedby="passwordHelpInline"
								placeholder="Nhập mật khẩu">
						</div>
						<div class="d-flex justify-content-center">
<button type="button" class="btn btn-primary">Đăng nhập</button>
						</div>
						<div class="d-flex justify-content-center mt-2">
							<p>
								<a href="#"
									class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Tạo tài khoản</a>
							</p>
						</div>

					</div>
					<div class="col-sm-3"></div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>