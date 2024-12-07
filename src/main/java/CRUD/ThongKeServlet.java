package CRUD;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.Database;
import Model.ThongKeDonMua;

/**
 * Servlet implementation class ThongKeServlet
 */
@WebServlet("/thongKe")
public class ThongKeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThongKeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String yearParam = request.getParameter("nam");
		String monthParam = request.getParameter("month"); 
		System.out.println(yearParam);
	    int month = monthParam == null || monthParam.isEmpty() ? 0 : Integer.parseInt(monthParam);
	    int year = yearParam == null || yearParam.isEmpty() ? 0 : Integer.parseInt(yearParam);

	    List<ThongKeDonMua> thongKeList = new ArrayList<>();
	    
	    try (Connection conn = Database.getConnection(); // Sử dụng hàm getConnection() từ lớp Database
	         PreparedStatement stmt = conn.prepareStatement(
	                 "SELECT MONTH(NgayMua) AS Month, YEAR(NgayMua) AS Year, COUNT(*) AS TotalOrders, SUM(TriGiaDH) AS TotalValue " +
	                 "FROM DONMUA WHERE (? = 0 OR MONTH(NgayMua) = ?) AND (? = 0 OR YEAR(NgayMua) = ?) " +
	                 "GROUP BY MONTH(NgayMua), YEAR(NgayMua)")) {

	        stmt.setInt(1, month);
	        stmt.setInt(2, month);
	        stmt.setInt(3, year);
	        stmt.setInt(4, year);

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            ThongKeDonMua tk = new ThongKeDonMua();
	            tk.setMonth(rs.getInt("Month"));
	            tk.setYear(rs.getInt("Year"));
	            tk.setTotalOrders(rs.getInt("TotalOrders"));
	            tk.setTotalValue(rs.getDouble("TotalValue"));
	            thongKeList.add(tk);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    request.setAttribute("thongKeList", thongKeList);
	    request.setAttribute("nam", yearParam);
	    request.getRequestDispatcher("Views/Form_ThongKe.jsp").forward(request, response);
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
