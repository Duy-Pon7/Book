package CRUD;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
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
		float total = Float.parseFloat(request.getParameter("total"));
		String phone = request.getParameter("phone");
		try {
			Connection conn = Database.getConnection();
			int maDon = DBUtils.Add_bill(conn, phone, total);
			boolean check = false;
			if(maDon != -1) {
				check = DBUtils.Add_InfBill(conn, phone, maDon);
				if(check) {
					check = DBUtils.DeleteAllCart(conn, phone);
				}
			}
			if(check) {
				List<CartModel> list = DBUtils.LoadCart(conn, phone);
				if(list == null) {
					System.out.print("khong co du lieu");
				}else {
					request.setAttribute("listCart", list);
					response.sendRedirect(request.getContextPath() + "/ViewCart");
				}
			}else {
				request.setAttribute("errorMessage", "Thanh toán không thành công!");
				response.sendRedirect(request.getContextPath() + "/ViewCart");
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
