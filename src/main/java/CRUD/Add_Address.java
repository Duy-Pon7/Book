package CRUD;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;

import DB.Database;
import Model.DBUtils;

/**
 * Servlet implementation class Add_Address
 */
@WebServlet("/AddAddress")
public class Add_Address extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Address() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tongGia = request.getParameter("tongGia");
		String sdt = request.getParameter("sdt");
		String diaChi = request.getParameter("diaChi");
		try {
			Connection conn = Database.getConnection();
			boolean check = DBUtils.Add1Address(conn, sdt, diaChi);
			if (check) {
				response.sendRedirect(request.getContextPath() + "/ViewPay?sdt=" + URLEncoder.encode(sdt, "UTF-8")
						+ "&tongGia=" + URLEncoder.encode(tongGia, "UTF-8"));

			} else {
				request.setAttribute("errorMessage", "Xoá không thành công!");
				response.sendRedirect(request.getContextPath() + "/ViewPay?sdt=" + URLEncoder.encode(sdt, "UTF-8")
				+ "&tongGia=" + URLEncoder.encode(tongGia, "UTF-8"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
