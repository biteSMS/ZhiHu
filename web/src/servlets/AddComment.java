package servlets;

import comment.Comment;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class AddComment extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletRequest response) throws ServletException, IOException, ClassNotFoundException {
        this.doPost(request, (HttpServletResponse) response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        int answer_id = Integer.parseInt(request.getParameter("answer_id"));
        String comment_content = request.getParameter("commentInput");
        Comment comment = new Comment(username, comment_content, answer_id);
        int judge = comment.writeComment();
        if (judge == 0) {
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'> alert('评论失败！');</script>");
            out.close();
        } else {
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'> alert('评论成功！');</script>");
            out.close();
        }
    }
}

