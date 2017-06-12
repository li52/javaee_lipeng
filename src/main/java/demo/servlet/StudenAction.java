package demo.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



/**
 * Created by ${李朋}
 * on 2017/6/12.
 */
@WebServlet(urlPatterns = "/student")
public class StudenAction extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            add(req,resp);
            return;
        }
        req.setAttribute("message","出了一点问题");
        req.getRequestDispatcher("index.jsp").forward(req,resp);

    }
    private void add(HttpServletRequest req,HttpServletResponse resp)throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
