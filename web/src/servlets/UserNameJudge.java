package servlets;

import user.User;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


    public class UserNameJudge extends HttpServlet {
        public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            this.doPost(req, resp);
        }

        public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            response.setHeader("Access-Control-Allow-Origin", "*");
            request.setCharacterEncoding("UTF-8");
            String username = request.getParameter("username");
            User user = new User();
            int judge = user.usernameJudge(username);
            if(judge == 1){
                response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
                response.setCharacterEncoding("UTF-8");
                String jsonback ="1";//用户名可以使用，返回json 1
                PrintWriter out =null ;
                out = response.getWriter();
                out.write(jsonback);
                out.close();
            }else{
                response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
                response.setCharacterEncoding("UTF-8");
                String jsonback ="0";//用户名不可用，返回json 0；
                PrintWriter out =null ;
                out = response.getWriter() ;
                out.write(jsonback);
                out.close();
            }
        }
    }

