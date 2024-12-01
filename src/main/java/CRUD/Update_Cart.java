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
 * Servlet implementation class Update_Cart
 */
@WebServlet("/UpdateCart")
public class Update_Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int soluong = Integer.parseInt(request.getParameter("soluong"));
		String sdt = request.getParameter("sdt");
		try {
			Connection conn = Database.getConnection();
			boolean check = DBUtils.UpdateCart(conn, id, soluong);
			if(check) {
				request.setAttribute("sdt", sdt); 
				response.sendRedirect(request.getContextPath() + "/ViewCart?sdt=" + URLEncoder.encode(sdt, "UTF-8"));
			}else {
				request.setAttribute("errorMessage", "Sửa không thành công!");
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
