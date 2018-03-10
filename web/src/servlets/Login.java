package servlets;


import com.ndktools.javamd5.Mademd5;
import user.User;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class Login extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletRequest response) throws ServletException, IOException, ClassNotFoundException {
        this.doPost(request, (HttpServletResponse) response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        Mademd5 md = new Mademd5();
        String username = request.getParameter("username");
        String password = md.toMd5(request.getParameter("password"));//对传入的密码加密;
        User user = new User();
        int judge = user.userLogin(username,password);
        if(judge == -1){
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'> alert('登陆失败！');window.location.href='Login.jsp';</script>");
            out.close();
        }
        if (judge==1) {
            HttpSession session = request.getSession();
            session.setAttribute("username",username);
            List<String> userlist = user.getUser(username);
            String selfdescription = userlist.get(1);
            String userpicture_address = userlist.get(0);
            if(userpicture_address != null) {
                session.setAttribute("userpicture_address", userpicture_address);
            }
            if(selfdescription != null) {
                session.setAttribute("selfdescription", selfdescription);
            }
            response.sendRedirect("loginJump.jsp");//登陆成功转到主页
        }else{
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'> alert('用户名或密码错误！');window.location.href='Login.jsp';</script>");
            out.close();
        }
    }
}
