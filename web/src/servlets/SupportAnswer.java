package servlets;

import answer.Answer;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

public class SupportAnswer extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        this.doPost(req,resp);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("1111111111");
        int answer_id = Integer.parseInt(request.getParameter("answer_id"));
        System.out.println(answer_id+"是answer_id");
        Answer answer = new Answer();
        int judge = answer.supportAnswer(answer_id);
        if(judge == 1){

        }
    }
}
