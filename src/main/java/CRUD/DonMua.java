package CRUD;


import java.io.IOException;
import java.sql.Connection;
import java.util.List;


import Model.DBUtils;
import Model.DonMuaModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DB.Database;

@WebServlet("/DonMua")
public class DonMua extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Phương thức GET để hiển thị danh sách đơn mua
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Kết nối cơ sở dữ liệu
            Connection conn = Database.getConnection();
            if (conn != null) {
                System.out.println("Kết nối thành công");
            } else {
                System.out.println("Kết nối không thành công");
                response.getWriter().println("Không thể kết nối đến cơ sở dữ liệu.");
                return;
            }

            // Lấy danh sách các đơn mua từ cơ sở dữ liệu
            List<DonMuaModel> listDonMua = DBUtils.LoadDonMua(conn);

                // Truyền dữ liệu sang JSP
            request.setAttribute("listDonMua", listDonMua);

            // Chuyển hướng sang trang JSP hiển thị đơn mua
            request.getRequestDispatcher("/Views/Form_DonMua.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().println("Đã xảy ra lỗi khi tải dữ liệu đơn mua: " + ex.getMessage());
        }
    }

    /**
     * Phương thức POST chuyển hướng sang GET.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}


