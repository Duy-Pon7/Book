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
import Model.AddressModel;
import Model.CartModel;
import Model.DBUtils;

/**
 * Servlet implementation class View_Pay
 */
@WebServlet("/ViewPay")
public class View_Pay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View_Pay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String sdt = request.getParameter("sdt");
			String tongGia = request.getParameter("tongGia");
			Connection conn = Database.getConnection();
			List<AddressModel> list1 = DBUtils.LoadAdress(conn, sdt);
			List<CartModel> list = DBUtils.LoadCart(conn, sdt);
			if(list == null || list1 == null){
				System.out.print("Khong co du lieu");
			}else {
		        request.setAttribute("listAddress", list1);
		        request.setAttribute("listCart", list);
		        request.setAttribute("sdt", sdt); 
		        request.setAttribute("tongGia", tongGia); 
		        request.getRequestDispatcher("/Views/Form_Pay.jsp").forward(request, response);
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
