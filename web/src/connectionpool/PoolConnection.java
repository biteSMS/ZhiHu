package connectionpool;

import java.sql.Connection;

public class PoolConnection {
    Connection connection = null;
    private boolean ifbusy;

    public PoolConnection(Connection connection) {
        this.connection = connection;
        this.ifbusy = false;
    }

    public Connection getConnection(){
        return this.connection;
    }

    public void setConnection(Connection conn){
        this.connection = conn;
    }

    public void setBusy(){
        this.ifbusy = true;
    }

    public void setfree(){
        this.ifbusy = false;
    }

    public boolean getifbusy(){
        return this.ifbusy;
    }


}
