package servlets;

import question.Question;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class QuestionRefresh extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletRequest response) throws ServletException, IOException, ClassNotFoundException {
        this.doPost(request, (HttpServletResponse) response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        int old_id = 0;//刷新出的问题要比哪一个问题更新//old_id为零代表刷出所有问题
        Question question = new Question();
        System.out.println("执行了这一步1");
        List questionlist = question.getQuestionList(old_id);
        System.out.println("执行了这一步1");
        response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
        String jsonback ="";
        jsonback += "{\"question\":[";
        int i = 0;
        for (i = 0; i < questionlist.size(); i++) {
            String question_title = (String) questionlist.get(i);
            jsonback += "{\"question_title\" : \"" + question_title + "\"}";
            if (i < questionlist.size() - 1)
                jsonback += ",";
        }
        jsonback += "]}";
        System.out.println(jsonback);
        response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
        response.getWriter().write(jsonback);
    }
}




