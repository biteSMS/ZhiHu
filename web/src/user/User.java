package user;

import connectionpool.ConnectionPool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class User{
    public String user_name;
    public String userpicture;
    public String selfdescription;
    public String password;
    public int iflogin;
    public int user_amount;

    public int userLogin(String username1,String password){//传入的密码是密文
        int judge = 0;
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select password from user_register where username='"+username1+"'");
            while(rs.next()){
                rs.first();
                if(password.equals(rs.getString("password"))){
                    judge++;//登陆成功，judge记为1
                }
            }
            stmt.close();
            connpool.returnConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;//登录失败，返回-1
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return judge;
    }

    public int userRegister(String username1, String password1) {//传入的密码是密文

        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT user_id FROM user_register WHERE username = '"+username1+"'");
            if (rs.next()) {
                stmt.close();
                conn.close();
                return -1;//用户名重复，返回-1
            }
            connpool.returnConnection(conn);
        } catch(SQLException e){
            e.printStackTrace();
            return 0;//注册失败
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            int user_amount = 0;
            ResultSet rs = stmt.executeQuery("select user_amount from amount where id=1");
            while(rs.next()){
                rs.first();
                user_amount = rs.getInt(1)+1;
            }
            stmt.executeUpdate("UPDATE amount SET user_amount="+user_amount+" WHERE id=1");
            String sql1 = "insert into user_register(username,password,user_id)"+"values('"+username1+"','"+password1+"',"+user_amount+")";
            String sql2 = "insert into user_description(username)"+"values('"+username1+"')";//用户初始化
            stmt.executeUpdate(sql1);
            stmt.executeUpdate(sql2);
            stmt.close();
            connpool.returnConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;//注册失败
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 1;//成功注册,返回1
    }

    public int usernameJudge(String username) {
        String sql1 = "select user_id from user_register where username="+username;
        int judge = 0;
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql1);
            if(!rs.next()){ //用户名可以使用，返回1
                judge = 1;
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
        return judge;
    }

    public String getUserdescription(String username){
        String sql1 = "select userpicture,selfdescription from user_description where username='"+username+"'";
        String selfdescription = null;
        try{
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql1);
            while(rs.next()){
                selfdescription = rs.getString("selfdescription");
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
        return selfdescription;
    }

    public List<String> getUser(String username){
        String sql1 = "select userpicture_address,selfdescription from user_description where username='"+username+"'";
        List userlist = new ArrayList();
        try{
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql1);
            while(rs.next()){
                rs.first();
                userlist.add(rs.getString("userpicture_address"));
                userlist.add(rs.getString("selfdescription"));
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
        return userlist;
    }

    public int userEdit(String username,String selfdescription){
        String sql = "UPDATE user_description SET selfdescription='"+selfdescription+"' WHERE username='"+username+"'";
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
            connpool.returnConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 1;
    }

}

