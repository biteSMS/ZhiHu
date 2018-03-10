package picture;

import connectionpool.ConnectionPool;

import java.io.*;
import java.sql.Connection;
import java.sql.Statement;

public class Picture {
    private String userpicture_address;


    public String getUserpicture_address() {
        return this.userpicture_address;
    }

    public  void copy(String oldfile, String newfile) {
        {
            File oldfile1 = new File(oldfile);
            File newfile1 = new File(newfile);
            try {
                InputStream in = new FileInputStream(oldfile1);
                OutputStream out = new FileOutputStream(newfile1);
                byte[] bytes = new byte[1024];
                int len = -1;
                while((len=in.read(bytes))!=-1)
                {
                    out.write(bytes, 0, len);
                }
                in.close();
                out.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.println("文件复制成功");


        }

    }


    public int pictureInit(String username){
        String address = "C:\\Program Files\\apache-tomcat-9.0.1\\webapps\\zhihu\\web\\web\\images\\head-portrait.png";
        String newaddress = "C:\\Program Files\\apache-tomcat-9.0.1\\webapps\\zhihu\\web\\web\\images\\user_picture\\"+username+".png";
        this.copy(address,newaddress);
//        File file = new File(address);
//        file.renameTo(new File(newaddress));
//        file.renameTo(new File(address));
        return 1;
    }

    //将图片地址写入数据库,删除可能的用户已上传文件
    public int addressinput(String filename, String username) {
        String addressfirst = "C:\\Program Files\\apache-tomcat-9.0.1\\webapps\\zhihu\\web\\web\\images\\user_picture";//反斜被mysql吃了，换方法
        String address = addressfirst + "\\" + filename;
        try {
            ConnectionPool connpool = ConnectionPool.getInstance();
            connpool.createPool();
            Connection conn = connpool.getPoolConnection();
            Statement stmt = conn.createStatement();
            String sql = "update user_description set userpicture_address='" + address + "'where username ='" + username + "'";
            stmt.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        File file = new File(filename);//检查可能存在的用户头像，如果有，删除
        if(file.exists()){
            file.delete();
        }

        return 1;
    }
}



