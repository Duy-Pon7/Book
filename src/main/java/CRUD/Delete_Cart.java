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
 * Servlet implementation class Delete_Cart
 */
@WebServlet("/DeleteCart")
public class Delete_Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			Connection conn = Database.getConnection();
			boolean check = DBUtils.Delete1Cart(conn, id);
			if(check) {
				List<CartModel> list = DBUtils.LoadCart(conn, "0123456789");
				if(list == null) {
					System.out.print("khong co du lieu");
				}else {
					request.setAttribute("listCart", list);
					response.sendRedirect(request.getContextPath() + "/ViewCart");
				}
			}else {
				request.setAttribute("errorMessage", "Xoá không thành công!");
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
