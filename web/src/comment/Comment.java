package comment;

import connectionpool.ConnectionPool;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {
    private String username;
    private int answer_id;
    private String comment_content;
    private String comment_time;

    public Comment(String username,String comment_content,int answer_id){
        this.username = username;
        this.comment_content = comment_content;
        this.answer_id = answer_id;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.comment_time = df.format(new Date());
    }
    public Comment(){

    }

    public List getComment(int answer_id){
        System.out.println(answer_id+"是传入的answer_id");
        String sql = "select username,comment_content from comment where answer_id="+answer_id;
        List commentlist = new ArrayList();
        int count = 0;
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                this.username = rs.getString("username");
                this.comment_content = rs.getString("comment_content");
                commentlist.add(this.username);
                commentlist.add(this.comment_content);
                count ++;
            }
            stmt.close();
            connpool.returnConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return commentlist;
    }

    public int writeComment(){//写入评论
        int judge = 0;
        String sql = "insert into comment(comment_username,comment_content,answer_id,comment_time)"
                     +"values('"+this.username+"','"+this.comment_content+"','"+this.answer_id+"','"+this.comment_time+"')";
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
            connpool.returnConnection(conn);
            judge = 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return judge;
    }
}
