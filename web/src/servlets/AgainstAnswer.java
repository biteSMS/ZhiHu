package servlets;

import answer.Answer;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

public class AgainstAnswer extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        this.doPost(req,resp);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        int answer_id = Integer.valueOf(request.getParameter("")).intValue();
        Answer answer = new Answer();
        int judge = answer.againstAnswer(answer_id);
        if(judge == 1){

        }
    }
}