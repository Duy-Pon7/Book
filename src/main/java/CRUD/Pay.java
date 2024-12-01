package CRUD;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import DB.Database;
import Model.CartModel;
import Model.DBUtils;

/**
 * Servlet implementation class Pay
 */
@WebServlet("/Pay")
public class Pay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		float tongGia = Float.parseFloat(request.getParameter("tongGia"));
		String sdt = request.getParameter("sdt");
		String diaChi = request.getParameter("diaChi");
		try {
			Connection conn = Database.getConnection();
			int maDon = DBUtils.Add_bill(conn, sdt, tongGia, diaChi);
			boolean check = false;
			if(maDon != -1) {
				check = DBUtils.Add_InfBill(conn, sdt, maDon);
				if(check) {
					check = DBUtils.DeleteAllCart(conn, sdt);
				}
			}
			if(check) {
				request.setAttribute("sdt", sdt); 
				response.sendRedirect(request.getContextPath() + "/ViewCart?sdt=" + URLEncoder.encode(sdt, "UTF-8"));
			}else {
				request.setAttribute("errorMessage", "Thanh toán không thành công!");
				request.setAttribute("sdt", sdt); 
				response.sendRedirect(request.getContextPath() + "/ViewCart?sdt=" + URLEncoder.encode(sdt, "UTF-8"));
			}
		}catch(Exception ex) {
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
