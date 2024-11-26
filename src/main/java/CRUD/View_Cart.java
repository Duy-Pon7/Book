package CRUD;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import DB.Database;
import Model.CartModel;
import Model.DBUtils;


/**
 * Servlet implementation class Cart
 */
@WebServlet("/ViewCart")
public class View_Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View_Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String phone = request.getParameter("phone");
			Connection conn = Database.getConnection();
			List<CartModel> list = DBUtils.LoadCart(conn, "0123456789");
			if(list == null){
				System.out.print("Khong co du lieu");
			}else {
		        request.setAttribute("listCart", list);
		        request.setAttribute("phone", "0123456789"); 
		        request.getRequestDispatcher("/Views/Form_Cart.jsp").forward(request, response);
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
