package servlets;




import picture.Picture;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.*;
import java.util.regex.Pattern;


@MultipartConfig(location = "C:\\Program Files\\apache-tomcat-9.0.1\\webapps\\zhihu\\web\\web\\images\\user_picture", maxFileSize = 1024 * 1024 * 10)
public class pictureEdit extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doPost(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        Part part = request.getPart("imgfile");
        //获取文件名称
        String filename = getFilename(part);
        System.out.println(filename+"是filename");
        String pat = "\\.";
        Pattern pattern = Pattern.compile(pat);
        String name[] = pattern.split(filename);
        if(name.length >2){//文件名中不能出现点,不然会被分成三段，这里要取出后缀和用户名
            response.setContentType("text/html;charset=utf-8");
            response.setCharacterEncoding("GBK");
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript'> alert('提交失败！文件名中含有.字符或者上传了非.png格式文件');window.location.href='people.jsp';</script>");
            out.close();
        }else{
            name[0] = username;//将文件名改为登陆用户min
        }
        filename = name[0]+"."+name[1];
        Picture pic = new Picture();
        pic.addressinput(filename,username);//路径保存到数据库中，删除原来已存在的用户头像
        part.write(filename);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("GBK");
        PrintWriter out = response.getWriter();
        out.print("<script type='text/javascript'> alert('提交成功！');window.location.href='people.jsp';</script>");
        out.close();
    }

    private String getFilename(Part part) {
        if (part == null) {
            return null;
        }
        String fileName = part.getHeader("content-disposition");
        if (isBlank(fileName)) {
            return null;
        }
        return substringBetween(fileName, "filename=\"", "\"");
    }

    public static boolean isBlank(String str) {
        int strLen;
        if (str == null || (strLen = str.length()) == 0)
            return true;
        for (int i = 0; i < strLen; i++) {
            if (!Character.isWhitespace(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static String substringBetween(String str, String open, String close) {
        if (str == null || open == null || close == null)
            return null;
        int start = str.indexOf(open);
        if (start != -1) {
            int end = str.indexOf(close, start + open.length());
            if (end != -1)
                return str.substring(start + open.length(), end);
        }
        return null;
    }

    public void init() throws ServletException {

    }

}




