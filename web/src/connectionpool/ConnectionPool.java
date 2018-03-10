package connectionpool;

import java.util.Vector;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;


public class ConnectionPool {
    public String dbuser = "root";
    public String dbpassword = "cqupt-free";
    public String dburl = "jdbc:mysql://localhost:3306/zhihu?serverTimezone=UTC&characterEncoding=utf-8";
    public String driver = "com.mysql.cj.jdbc.Driver";
    private int minConnection = 2;
    private int maxConnection = 4;
    private int peraddConnection = 2;
    private Vector connections  = null;

    private static ConnectionPool instance = new ConnectionPool();
    private ConnectionPool(){}
    public static ConnectionPool getInstance(){
        return instance;
    }

    public void setminConnection(int minConnection){
        this.minConnection = minConnection;
    }
    public int getminConnection(){
        return this.minConnection;
    }


    public void setmaxConnection(int maxConnection){
        this.maxConnection = maxConnection;
    }
    public int getmaxConnection(){
        return this.maxConnection;
    }


    public void setPerAddConnection(int peraddConnection){
        this.peraddConnection = peraddConnection;
    }
    public int getPerAddConnection(){
        return this.peraddConnection;
    }

    public void createPool() throws Exception{//创建一个连接池，并调用初始化方法；
        if(this.connections != null){
            return;
        }
        Class.forName(this.driver);
        this.connections = new Vector();
        this.initPool();
    }

    public void initPool(){//初始化连接池
        try {
            for(int i=0;i<minConnection;i++) {
                PoolConnection conn = new PoolConnection(DriverManager.getConnection(dburl, dbuser, dbpassword));
                conn.setfree();
                connections.add(conn);
                System.out.println("成功添加第"+i+"个连接");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("连接池初始化失败");
        }
    }


    public int addConnection(){//连接池添加连接peraddConnection个；
        if(this.connections.size() > maxConnection){
            System.out.println("已达到连接池连接数量上限，无法添加");
            return 0;//达到上限，返回1；
        }
        try {
            for(int i=0;i<peraddConnection;i++) {
                PoolConnection conn = new PoolConnection( DriverManager.getConnection(dburl, dbuser, dbpassword));
                connections.add(conn);
                System.out.println("成功动态添加一个连接");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("连接池动态添加连接失败");
        }
        return 1;//添加成功，返回1；
    }

    public Connection getPoolConnection() throws InterruptedException {//获得一个可以使用的连接；
        if(connections == null){
            System.out.println("连接池未创建，无法获得连接");
            return null;
        }
        Connection conn = getFreeConnection();
        while(conn == null){
            wait(100);//连接池没有可用的连接，等待添加新的连接或者等待空闲的连接；
            conn = getFreeConnection();
        }
        return conn;
    }

    public Connection getFreeConnection(){
        Connection conn = this.findFreeConnection();
        if(conn == null){//找不到可用的连接，添加新的连接
            int judge = this.addConnection();
            conn  = this.findFreeConnection();
            if(judge == 0){
                return null;
            }
        }
        return conn;
    }

    public Connection findFreeConnection(){
        Connection conn = null;
        PoolConnection poolconn = null;
        Enumeration enumerate = connections.elements();
        while(enumerate.hasMoreElements()){
            poolconn = (PoolConnection) enumerate.nextElement();
            if(!poolconn.getifbusy()){
                System.out.print("这个连接是否繁忙:");
                System.out.println(poolconn.getifbusy());
                poolconn.setBusy();
                conn = poolconn.getConnection();
                break;
            }
            if(!enumerate.hasMoreElements()){
                return null;//找不到可用连接，返回null;
            }
        }
        return conn;//返回一个连接;
    }

    public void returnConnection(Connection conn){//释放用完的连接;
        PoolConnection poolconn = null;
        Enumeration enumerate = connections.elements();
        while(enumerate.hasMoreElements()){
            poolconn = (PoolConnection) enumerate.nextElement();
            if(conn == poolconn.getConnection()){
                poolconn.setfree();
                System.out.println("连接释放成功！");
                System.out.println(poolconn.getifbusy());
                break;
            }
        }
    }

    public synchronized void closeConnectionPool() throws InterruptedException {//关闭连接池
        PoolConnection poolconn = null;
        Enumeration enumerate = connections.elements();
        while(enumerate.hasMoreElements()){
            poolconn = (PoolConnection) enumerate.nextElement();
            if(poolconn.getifbusy()){//如果连接正在使用，续一秒;
                wait(1000);
            }
            try {
                poolconn.getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("连接池关闭出错");
            }
            connections.removeElement(poolconn);
        }
        connections = null;
    }


}
