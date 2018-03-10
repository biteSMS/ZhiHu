package servlets;

import answer.Answer;
import question.Question;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;
import java.io.IOException;

public class AnswerRefresh1 extends HttpServlet {//用于问题页面刷新回答

    public void doPost(HttpServletRequest request, HttpServletRequest response) throws ServletException, IOException, ClassNotFoundException {
        this.doGet(request, (HttpServletResponse) response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {//传入question_title,获得该问题所有回答，将回答数保存在session中生成div块
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String question_title = request.getParameter("question_title");
        session.setAttribute("question_title",question_title);
        System.out.println(question_title+"是传入的问题标题");
        Question question = new Question();
        int question_id = question.getQuestion_id(question_title);
        Answer ans = new Answer();
        List answerlist = ans.getAnswer(question_id);
//        if (answerlist == null) {
//            response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
//            String jsonback = "0";//问题没有回答，返回json 0
//            PrintWriter out = null;
//            out = response.getWriter();
//            out.write(jsonback);
//            out.close();
//        }else if(answerlist.isEmpty()){
//            response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
//            String jsonback = "1";//问题没有回答，返回json 0
//            PrintWriter out = null;
//            out = response.getWriter();
//            out.write(jsonback);
//            out.close();

            response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
            String username = null;
            String answer_content = null;
            int answer_support_amount;
            int answer_id, n = 0, i, listsize = (answerlist.size() + 3) / 4;
            String jsonback = "{\"answer\":[";
            for (i = 0; i < listsize - 1; i++) {
                n = i * 4;
                System.out.println(n+"...."+i);
                username = (String) answerlist.get(n);//username
                System.out.println(username);
                answer_id = (int) answerlist.get(n + 1);//Question_title;
                answer_content = (String) answerlist.get(n + 2);//answer_content
                answer_support_amount = (int) answerlist.get(n + 3);//answer_support_amount
                jsonback += "{\"username\" : \"" + username + "\",\"answer_id\" : \"" + answer_id + "\",\"answer_content\" : \"" + answer_content + "\",\"answer_support_amount\" : \"" + answer_support_amount + "\"}";
                if (i < listsize - 2) {
                    jsonback += ",";
                }
            }
            jsonback += "]}";
            //int answer_amount = (int) answerlist.get(n + 4);
           // session.setAttribute("answer_amount", answer_amount);
            response.getWriter().write(jsonback);
    }
}