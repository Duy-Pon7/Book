package CRUD;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import DB.Database;
import Model.DBUtils;
import Model.KhachHangModel;
import Model.ThongTinDonMuaModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ChiTietHD")
public class ChiTietDonMua extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = Database.getConnection()) {
            int maDon = Integer.parseInt(request.getParameter("id"));
            System.out.println("ID nhận được: " + maDon);
            
            // Lấy danh sách chi tiết đơn mua
            List<ThongTinDonMuaModel> list = DBUtils.layTTDonMua(conn, maDon);

            // Thiết lập kiểu trả về là HTML
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            
            // Kiểm tra xem danh sách chi tiết có rỗng không
            if (list.isEmpty()) {
                out.write("<tr><td colspan='5' class='text-center'>Không có chi tiết đơn hàng.</td></tr>");
            } else {
                // Tạo HTML cho bảng chi tiết đơn hàng
            	for (int i = 0; i < list.size(); i++) {
            		ThongTinDonMuaModel item = list.get(i);
                    out.write("<tr>");
                    out.write("<td>" + item.getMaSach() + "</td>");
                    out.write("<td>" + item.getTenSach() + "</td>");
                    out.write("<td class='text-center'><img src='" + request.getContextPath() + "/Images/" + item.getImage() + "' "
                            + "alt='" + item.getTenSach() + "' class='img-thumbnail' "
                            + "style='width: 80px; height: auto;'></td>");
                    out.write("<td>" + item.getGiaBan() + "</td>");
                    out.write("<td>" + item.getSoluong() + "</td>");
                    out.write("</tr>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi: " + e.getMessage());
        }
    }
}
