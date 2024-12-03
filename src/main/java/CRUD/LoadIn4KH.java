package CRUD;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import DB.Database;
import Model.DBUtils;
import Model.KhachHangModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ListKH")
public class LoadIn4KH extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = Database.getConnection()) {
            String sdt = request.getParameter("sdt");
            
            // In thông tin sdt ra console
            System.out.println("Số điện thoại nhận được: " + sdt);
            
            List<KhachHangModel> listKH = DBUtils.layIn4KH(conn, sdt);
            
            // Kiểm tra và in danh sách khách hàng ra console
            if (listKH.isEmpty()) {
                System.out.println("Không tìm thấy khách hàng.");
            } else {
                System.out.println("Danh sách khách hàng: ");
                for (KhachHangModel kh : listKH) {
                    System.out.println("Khách hàng: " + kh.getHo() + " " + kh.getTen() + ", SĐT: " + kh.getsDT() + ", Địa chỉ: " + kh.getDiaChi());
                }
            }

            // Thiết lập kiểu trả về là HTML
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            
            // Kiểm tra xem có khách hàng không
            if (listKH.isEmpty()) {
                out.write("<tr><td colspan='5' class='text-center'>Không có thông tin khách hàng.</td></tr>");
            } else {
                // Tạo HTML cho bảng danh sách khách hàng
                for (int i = 0; i < listKH.size(); i++) {
                    KhachHangModel kh = listKH.get(i);
                    out.write("<tr>");
                    out.write("<td>" + (i + 1) + "</td>");
                    out.write("<td>" + kh.getHo() + "</td>");
                    out.write("<td>" + kh.getTen() + "</td>");
                    out.write("<td>" + kh.getsDT() + "</td>");
                    out.write("<td>" + kh.getDiaChi() + "</td>");
                    out.write("</tr>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi: " + e.getMessage());
        }
    }
}


