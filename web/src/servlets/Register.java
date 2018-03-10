package servlets;

import com.ndktools.javamd5.Mademd5;
import picture.Picture;
import user.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


public class Register extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletRequest response) throws ServletException, IOException, ClassNotFoundException {
        this.doPost(request, (HttpServletResponse) response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        request.setCharacterEncoding("UTF-8");
        Mademd5 md = new Mademd5();
        String username = request.getParameter("username");
        String password = md.toMd5(request.getParameter("password"));//对传入的密码加密;
        User user = new User();
        int judge = user.userRegister(username,password);
        if(judge == -1 ){
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'> alert('用户名重复！');window.location.href='Login.jsp';</script>");
            out.close();
        }
        if(judge == 0){
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'> alert('注册失败！');window.location.href='Login.jsp';</script>");
            out.close();
        }
        if(judge == 1){
            Picture pic = new Picture();
            pic.pictureInit(username);
            HttpSession session = request.getSession();
            session.setAttribute("username",username);
            response.sendRedirect("registerJump.jsp");
        }
    }
}
