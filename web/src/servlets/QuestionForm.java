package servlets;

import question.Question;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

public class QuestionForm extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        this.doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {//提交问题；失败向前台返回0，成功向前台返回1；
        request.setCharacterEncoding("UTF-8");
        String question_title = request.getParameter("question_title");
        String question_description = request.getParameter("question_description");
        String username = "默认用户";
        Question question = new Question(username,question_title,question_description);
        int judge = question.questionAdd();
        if(judge == 0){
            response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
            response.setCharacterEncoding("UTF-8");
            String jsonback ="0";//问题提交失败，返回的JSON是0
            PrintWriter out =null ;
            out = response.getWriter() ;
            out.write(jsonback);
            out.close();
        }
        if (judge == 1){
            response.sendRedirect("home.jsp");//问题提交成功转到主页
        }
    }
}
