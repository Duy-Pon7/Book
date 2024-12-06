package CRUD;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import DB.Database;
import Model.Book;
import Model.DBUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookList")
public class LoadBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = Database.getConnection()) {
            List<Book> bookList = DBUtils.getBooks(conn);
            request.setAttribute("bookList", bookList);
            request.getRequestDispatcher("/Views/Form_Book.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi: " + e.getMessage());
        }
    }
}
