package servlets;

import answer.Answer;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpSession;

public class AddAnswer extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        this.doPost(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String answer_content = request.getParameter("edit");
        String question_title = (String) session.getAttribute("question_title");
        System.out.println(answer_content +"是回答内容");
        System.out.println(question_title+"是回答标题");
        String username = (String) session.getAttribute("username");
        Answer ans = new Answer();
        int judge = ans.answerAdd(username,answer_content,question_title);
        if(judge == 0){
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'> alert('提交回答失败！');</script>");
            out.close();
        }else{
            response.setCharacterEncoding("UTF-8");
            response.sendRedirect("home.jsp");
        }
    }
}
