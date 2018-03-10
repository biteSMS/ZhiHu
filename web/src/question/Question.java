package question;

import connectionpool.ConnectionPool;


import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

public class Question {
    public String username;
    public String question_time;
    public String question_title;
    public String question_description;
    public int answeramount;
    public int question_id;

    public Question(){

    }

    public Question(String username,String question_title,String question_description){
        this.username = username;
        this.question_title = question_title;
        this.question_description = question_description;
        this.answeramount = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        this.question_time = df.format(new Date());
    }

   public List getQuestionList(int question_id){
       String sql = "select question_title from question where question_id>"+question_id;
       List questionlist = new ArrayList();
       int count = 0;
       try {
           ConnectionPool connpool = ConnectionPool.getInstance();
           connpool.createPool();
           Connection conn = connpool.getPoolConnection();
           Statement stmt = conn.createStatement();
           ResultSet rs = stmt.executeQuery(sql);
           while(rs.next()){
               String question_title = rs.getString("question_title");
               System.out.println(question_title+"eee");
               questionlist.add(question_title);
               count++;
           }
           stmt.close();
           connpool.returnConnection(conn);
       } catch (Exception e) {
           e.printStackTrace();
       }
       return questionlist;
   }

    public int getQuestion_id(String question_title){
        String sql = "select question_id from question where question_title='"+question_title+"'";
        int question_id = 0;
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                question_id = rs.getInt("question_id");
            }
            stmt.close();
            connpool.returnConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return question_id;

    }

    public int questionAdd(){//向question表中写入一个问题;
        String sql1 = "select question_amount from amount where id=1";
        try{
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs1 = stmt.executeQuery(sql1);
            while(rs1.next()){
                rs1.first();
                this.question_id = rs1.getInt(1)+1;
            }
            int id1 = this.question_id;
            stmt.executeUpdate("update amount set question_amount="+id1+" where id=1");
            String sql2 = "insert into question(username,question_time,question_title,question_description,answeramount,question_id)"
                         +"values('"+this.username+"','"+this.question_time+"','"+this.question_title+"','"+this.question_description+"',"+this.answeramount+","+this.question_id+");";
            stmt.executeUpdate(sql2);
            stmt.close();
            connpool.returnConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;//问题写入失败
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 1;//问题写入成功
    }

    public List getQuestion(int question_id){//传入问题id获得问题List
        System.out.println(question_id);
        System.out.println(question_id+"是传经来的question_id");
        List questionlist = new ArrayList();
        try{
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            String sql2 = "select username,question_title,question_description,answeramount from question where question_id="+question_id;
            ResultSet rs = stmt.executeQuery(sql2);
            while(rs.next()){
                questionlist.add(rs.getString("username"));
                questionlist.add(rs.getString("question_title"));
                questionlist.add(rs.getString("question_description"));
                String answeramount = Integer.toString(rs.getInt("answeramount"));
                System.out.println(questionlist.get(0)+"是问题username");
                questionlist.add(answeramount);
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
        return questionlist;
    }

    public List getQuestion(String question_title){//传入问题id获得问题List
        String sql1 = "select question_id from answer where question_title='"+question_title+"'";
        List questionlist = new ArrayList();
        int question_id = 0;
        try{
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql1);
            while (rs.next()){
                question_id = rs.getInt("1");
            }
            String sql2 = "select username,question_description,answeramount from question where question_id="+question_id;
            rs = stmt.executeQuery(sql2);
            while(rs.next()){
                rs.first();
                questionlist.add(rs.getString("username"));
                questionlist.add(rs.getString("question_description"));
                String answeramount = Integer.toString(rs.getInt("answeramount"));
                questionlist.add(answeramount);
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
        return questionlist;
    }
}
