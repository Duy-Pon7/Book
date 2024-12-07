<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống kê Đơn Mua</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Thống kê Đơn Mua</h2>

    <!-- Ô nhập năm và nút xử lý -->
    <div class="mb-4">
        <label for="yearInput" id="nam" class="form-label"></label>
        <input type="number" id="yearInput" class="form-control d-inline-block w-auto" value="${nam != null && nam != '' ? nam : ''}" placeholder="VD: 2024" min="2000" max="2100">
        <button class="btn btn-primary mb-1" onclick="handleYearInput()">Xem Thống Kê</button>
    </div>

    <!-- Canvas cho biểu đồ -->
    <div class="mt-5">
        <canvas id="chart"></canvas>
    </div>

    <!-- Script xử lý dữ liệu và vẽ biểu đồ -->
    <script>
    	function handleYearInput() {
    		const a = document.getElementById("yearInput").value
			window.location.href = '/Book/thongKe?nam=' + a;

		}
        // Khởi tạo mảng dữ liệu từ JSP
        var labels = [];
        var totalValue = [];

        <c:forEach var="tk" items="${thongKeList}">
            labels.push('Tháng ${tk.month}');
            totalValue.push(${tk.totalValue});
        </c:forEach>

        // Vẽ biểu đồ cột với tháng là trục x và tổng trị giá là trục y
        new Chart(document.getElementById('chart'), {
            type: 'bar', // Biểu đồ cột
            data: {
                labels: labels, // Tháng
                datasets: [{
                    label: 'Tổng Trị Giá Đơn Hàng',
                    data: totalValue, // Giá trị tổng trị giá của từng tháng
                    backgroundColor: 'rgba(75, 192, 192, 0.5)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Tháng'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Tổng Trị Giá'
                        },
                        beginAtZero: true
                    }
                }
            }
        });

        // Hàm xử lý khi chọn năm
        function handleYearSelection() {
            var selectedYear = document.getElementById('yearSelect').value;
            if (selectedYear) {
                alert('Bạn đã chọn năm: ' + selectedYear);
                // Thực hiện các hành động khác như gửi yêu cầu đến server để tải dữ liệu theo năm
            } else {
                alert('Vui lòng chọn năm để tiếp tục.');
            }
        }
    </script>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
