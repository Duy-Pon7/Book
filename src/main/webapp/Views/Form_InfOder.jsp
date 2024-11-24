<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách đơn mua</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-oBqDVmMz4fnFO9gyb4cFw3ATBwWfqw6nfbu7f2e9KAi6mNpQ8dW9KKbBn9Plx0x4"
        crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Danh sách đơn mua</h1>
        <table class="table table-bordered">
            <thead class="table-primary">
                <tr>
                    <th>Mã Đơn</th>
                    <th>Số Điện Thoại</th>
                    <th>Ngày Mua</th>
                    <th>Trị Giá</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <!-- Duyệt qua danh sách đơn mua -->
                <c:forEach var="order" items="${listOrders}">
                    <tr>
                        <td>${order.maDon}</td>
                        <td>${order.phone}</td>
                        <td>${order.ngayMua}</td>
                        <td>${order.triGia} VND</td>
                        <td>
                            <!-- Nút mở modal -->
                            <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#orderDetailModal${order.maDon}">
                                Chi tiết
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="orderDetailModal${order.maDon}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Chi tiết đơn hàng: ${order.maDon}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table table-bordered">
                                                <thead class="table-secondary">
                                                    <tr>
                                                        <th>Tên Sách</th>
                                                        <th>Đơn Giá</th>
                                                        <th>Số Lượng</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!-- Duyệt qua danh sách sách trong đơn -->
                                                    <c:forEach var="book" items="${order.books}">
                                                        <tr>
                                                            <td>${book.tenSach}</td>
                                                            <td>${book.donGia} VND</td>
                                                            <td>${book.soLuong}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
