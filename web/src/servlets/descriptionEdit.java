package servlets;


import user.User;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

public class descriptionEdit extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        this.doPost(req,resp);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String selfdescription = request.getParameter("selfdescription");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        User user = new User();
        int judge = user.userEdit(username,selfdescription);
        if(judge == 1){
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            session.setAttribute("selfdescription",selfdescription);
            out.print("<script type='text/javascript'> alert('编辑成功！');window.location.href='edit.jsp';</script>");
            out.close();
        }else {
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'> alert('编辑失败！');window.location.href='edit.jsp';</script>");
            out.close();
        }
    }
}
