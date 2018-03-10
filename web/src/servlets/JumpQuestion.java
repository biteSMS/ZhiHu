package servlets;

import question.Question;

import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class JumpQuestion extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        this.doPost(req,resp);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String question_title = request.getParameter("question_title");
        System.out.println("传进来的question_title是"+question_title);
        Question question = new Question();
        int question_id = question.getQuestion_id(question_title);
        List list = question.getQuestion(question_id);
        session.setAttribute("question_title",question_title);
        request.setAttribute("question_title",list.get(1));
        request.setAttribute("question_description",list.get(2));
        request.getRequestDispatcher("question.jsp").forward(request,response);
    }
}
