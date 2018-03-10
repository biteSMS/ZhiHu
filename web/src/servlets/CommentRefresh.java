package servlets;

import comment.Comment;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class CommentRefresh extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletRequest response) throws ServletException, IOException, ClassNotFoundException {
        this.doGet(request, (HttpServletResponse) response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int answer_id = Integer.parseInt(request.getParameter("answer_id"));
        System.out.println(answer_id+"是传入的回答id");
        Comment comment = new Comment();
        List commentlist = comment.getComment(answer_id);
        if (commentlist == null) {
            response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
            String jsonback = "0";//刷新失败，返回json 0
            PrintWriter out = null;
            out = response.getWriter();
            out.write(jsonback);
            out.close();
        } else {
            response.setContentType("application/json;charset=utf-8");//指定返回的格式为JSON格式
            String username = null;
            String comment_content = null;
            int n = 0, i, listsize = (commentlist.size() + 1) / 2;
            String jsonback = "{\"comment\":[";
            for (i = 0; i <= listsize - 1; i++) {
                n = i * 2;
                username = (String) commentlist.get(n);//username
                comment_content = (String) commentlist.get(n + 1);//comment_content
                jsonback += "{\"username\" : \"" + username + "\",\"comment_content\" : \"" + comment_content + "\"}";
                if (i < listsize - 1) {
                    jsonback += ",";
                }
            }
            jsonback += "]}";
            response.getWriter().write(jsonback);
        }
    }
}
