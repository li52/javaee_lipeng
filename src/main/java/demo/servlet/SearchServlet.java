package demo.servlet;
import com.mysql.jdbc.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by ${李朋}
 * on 2017/6/10.
 */
@WebServlet(urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ip = req.getParameter("ip");
        if (ip.length() == 0) {
            req.setAttribute("geo","IP地址不能为空");
            req.getRequestDispatcher("index.jsp").forward(req,resp);//如果为空  转发回index页面
        }
        String URL = "jdbc:mysql:///?user=root&password=lipeng";
        String sql = "SELECT * FROM db_1702.ip WHERE inet_aton(?) BETWEEN inet_aton(min) AND inet_aton(max)";
        try {
            new Driver();
            Connection connection = DriverManager.getConnection(URL);
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,ip);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String geo = resultSet.getString("geo");
                req.setAttribute("geo", geo);
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            } else {
                req.setAttribute("geo","IP地址有误，请重新输入!"); //数据库里面没有的话 说明输入地址有误  需要重新输入
                req.getRequestDispatcher("index.jsp").forward(req,resp);//通过转发的方式跳转到index页面
            }
            connection.close();
            preparedStatement.close();
            resultSet.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
