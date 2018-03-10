package servlets;

import answer.Answer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AnswerRefresh extends HttpServlet{//用于首页刷新回答
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        this.doPost(req,resp);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int old_id = 0;
        if (!(old_id >= 0)) {
            System.out.println("未传入old_id");
        }
        Answer ans = new Answer();//用来调用getAnswer方法
        int refreshamount = 5 ;//每次刷新回答的数量;
        try {
            refreshamount = ans.getAnswerAmount();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(refreshamount+"是刷新回答的数量");
        List answerlist = null;
        try {
            answerlist = ans.getAnswer(old_id, refreshamount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (answerlist == null) {
            response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
            String jsonback = "0";//刷新失败，返回json 0
            PrintWriter out = null;
            out = response.getWriter();
            out.write(jsonback);
            out.close();
        } else {//将回答信息转json
            response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
            String username = null;
            String answer_content = null;
            String question_title = null;
            int n;
            String jsonback = "{\"answer\":[";
            for (int i = 0; i < refreshamount; i++) {
                n = i * 3;
                username = (String) answerlist.get(n);//username
                question_title = (String) answerlist.get(n + 1);//Question_title;
                answer_content = (String) answerlist.get(n + 2);//answer_content
                jsonback += "{\"username\":\"" + username + "\",\"question_title\" : \"" + question_title + "\",\"answer_content\" : \"" + answer_content + "\"}";
                if(i != refreshamount -1){
                    jsonback += ",";
                }
            }
            jsonback += "]}";
            response.getWriter().write(jsonback);
        }
    }
}
