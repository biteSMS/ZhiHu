package servlets;

import user.User;

import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class JumpPerson extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        this.doPost(req,resp);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        System.out.println(username);
        User user = new User();
        List<String> userlist = user.getUser(username);
        String userpicture_address = userlist.get(0);
        String selfdescription = userlist.get(1);
        if(userpicture_address != null) {
            request.setAttribute("userpicture_address",userpicture_address);
        }
        if(selfdescription != null) {
            request.setAttribute("selfdescription",selfdescription);
        }
        request.setAttribute("username",username);
        request.getRequestDispatcher("person.jsp").forward(request,response);
    }
}
