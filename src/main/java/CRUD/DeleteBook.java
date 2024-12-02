package CRUD;

import java.io.IOException;
import java.sql.Connection;

import DB.Database;
import Model.DBUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookDelete")
public class DeleteBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Phương thức GET chỉ hiển thị thông tin xác nhận, không thực hiện xóa.
        try {
            // Lấy id sách từ request
            int id = Integer.parseInt(request.getParameter("id"));

            // Hiển thị thông báo xác nhận trước khi xóa
            response.getWriter().println("Bạn có chắc chắn muốn xóa sách có ID: " + id + "?");
            response.getWriter().println("<form method='post'>");
            response.getWriter().println("<input type='hidden' name='id' value='" + id + "' />");
            response.getWriter().println("<input type='submit' value='Xóa' />");
            response.getWriter().println("</form>");
        } catch (Exception e) {
            e.printStackTrace(); // Log lỗi
            response.getWriter().println("Có lỗi xảy ra. Vui lòng thử lại.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = Database.getConnection(); // Lấy kết nối
            // Lấy id sách từ request
            int id = Integer.parseInt(request.getParameter("id"));

            // Xóa sách từ CSDL
            boolean isDeleted = DBUtils.deleteBook(conn, id);
            
            if (isDeleted) {
                // Nếu xóa thành công, chuyển hướng đến danh sách sách
                response.sendRedirect("BookList");
            } else {
                // Nếu không xóa được, thông báo lỗi nhẹ
                response.getWriter().println("Khong the xoa sach co ID: " + id);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log lỗi
            response.getWriter().println("Có lỗi xảy ra khi xóa sách. Vui lòng thử lại sau.");
        } finally {
            // Nếu bạn không sử dụng Connection Pool, đảm bảo đóng kết nối tại đây
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
