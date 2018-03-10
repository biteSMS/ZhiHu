package answer;

import connectionpool.ConnectionPool;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Answer {
    private String answer_time;
    private String username;
    private int question_id;
    private int answer_id;
    private String question_title;//方便显示回答，避免刷新页面时查更多表
    private int toquestion_answeramount;//该回答所回答的问题的回答数量，见answerAdd()方法的问题回答数递增1步骤
    private String answer_content;
    private int answer_support_amount;
    private int answer_against_amount;

    public String getUsername() {
        return this.username;
    }

    public String getAnswer_content() {
        return this.answer_content;
    }

    public String getQuestion_title() {
        return this.question_title;
    }

    public int getAnswer_id() {
        return this.answer_id;
    }

    public int getAnswerAmount() throws Exception {
        int amount = 0;
        ConnectionPool connpool = ConnectionPool.getInstance();
        connpool.createPool();
        Connection conn = connpool.getPoolConnection();
        Statement stmt = conn.createStatement();
        String sql = "select answer_amount from amount where id = 1";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()){
            amount = rs.getInt(1);
        }
        connpool.returnConnection(conn);
        return amount;
    }

    public int againstAnswer(int answer_id) {//为回答添加赞数
        int judge = 0;
        int against_amount = 0;
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select answer_against_amount from answer_yn where answer_id=" + answer_id);
            while (rs.next()) {
                against_amount = rs.getInt(1) + 1;
            }
            stmt.executeUpdate("UPDATE answer_yn SET answer_against_amount=" + against_amount + "where answer_id=" + answer_id);
            stmt.close();
            connpool.returnConnection(conn);
            judge++;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return judge;
    }

    public int supportAnswer(int answer_id) {//为回答添加赞数
        int judge = 0;
        System.out.println(answer_id+"是传进来的");
        int support_amount = 0;
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select answer_support_amount from answer where answer_id=" + answer_id);
            while (rs.next()) {
                support_amount = rs.getInt(1) + 1;
                System.out.println(support_amount+"是更新后的赞数");
            }
            stmt.executeUpdate("UPDATE answer SET answer_support_amount=" + support_amount + " WHERE answer_id=" + answer_id);
            stmt.close();
            connpool.returnConnection(conn);
            judge++;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return judge;
    }

    //写入问题，写入成功返回1，写入失败返回0
    public int answerAdd(String username, String answer_content, String question_title) {
        int judge = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH-mm-ss");
        this.answer_time = df.format(new Date());
        System.out.println(question_title+"是该新增回答的问题标题");

        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT answer_amount FROM amount WHERE id=1");
            while (rs.next()) {
                rs.first();
                this.answer_id = rs.getInt(1) + 1;
            }
            stmt.executeUpdate("UPDATE amount SET answer_amount=" + this.answer_id + " WHERE id=1");//增加回答数
            rs = stmt.executeQuery("select answeramount, question_id from question where question_title = '" + question_title+"'");//获得该回答相关问题的回答数，将其加一并写回question表
            while (rs.next()) {
                rs.first();
                this.toquestion_answeramount = rs.getInt("answeramount") + 1;
                this.question_id = rs.getInt("question_id");
            }
            stmt.executeUpdate("update question set answeramount='"+ this.toquestion_answeramount+"'where question_title ='" + question_title+"'");
            stmt.executeUpdate("insert into answer(answer_time,username,question_id,answer_content,answer_id,question_title,answer_support_amount,answer_against_amount)"
                    + "values('" + this.answer_time + "','" + username + "','" + question_id + "','" + answer_content + "','" + this.answer_id + "','" + question_title + "',0,0)");//写入回答
            stmt.close();
            connpool.returnConnection(conn);
            judge = 1;// 问题写入成功，返回1
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return judge;
    }

    //获得某一问题的所有回答，传入该问题的id，返回包含该问题所有回答信息的List
    public List getAnswer(int question_id){
        List answerlist = new ArrayList();
        int count = 0;
        System.out.println("回答的id:"+question_id);
        String sql = "select username,answer_id,answer_content,answer_support_amount from answer where question_id="+question_id;
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int answer_support_amount;
            while(rs.next()){
                this.username = rs.getString("username");
                this.answer_id = rs.getInt("answer_id");
                this.answer_content = rs.getString("answer_content");
                answer_support_amount = rs.getInt("answer_support_amount");
                answerlist.add(this.username);
                answerlist.add(this.answer_id);
                answerlist.add(this.answer_content);
                answerlist.add(answer_support_amount);
                count++;
            }
            if(count != 0) answerlist.add(count);
            stmt.close();
            connpool.returnConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return answerlist;

    }

    //获得首页更新需要获得的回答,,传入目前刷新前页面最新回答的answer_id,最多刷出几个新回答的数量）
    public List getAnswer(int old_id,int refreshamount) {
        int judge = 0;
        System.out.println("传进来的refreshamount为"+refreshamount);
        System.out.println("传进来的old_id为"+old_id);
        String sql2 = "select username,question_title,answer_content from answer where answer_id>"+old_id;
        List answerlist = new ArrayList();
        String sql1 = "select answer_amount from amount where id=1";
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql1);
            while (rs.next()){
                if(rs.getInt("answer_amount") == 0 ){
                    judge = -1;
                }
            }
            if(judge == -1){
                stmt.close();
                connpool.returnConnection(conn);
                return null;//没有回答，返回null
            }
            rs = stmt.executeQuery(sql2);
            int i = 0;
            while(rs.next()){
                if(i==refreshamount){
                    break;
                }
                System.out.println(i);
                this.username = rs.getString("username");
                this.question_title = rs.getString("question_title");
                this.answer_content = rs.getString("answer_content");
                answerlist.add(this.username);
                answerlist.add(this.question_title);
                answerlist.add(this.answer_content);
                i++;
            }
            stmt.close();
            connpool.returnConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return answerlist;
    }

}
