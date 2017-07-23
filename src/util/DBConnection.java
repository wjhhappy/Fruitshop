package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DBConnection {
		 //存放Connection对象的数组，数组被看成连接池
	static ArrayList<Connection>list=new ArrayList<Connection>();
		//从连接池中取出一个连接对象
	public synchronized static Connection getOneCon(){
		//如果连接池中有对象
		if(list.size()>0){
			return list.remove(0);
		}
		//连接池没有连接对象创建连接放到连接池中
		else{
			for(int i=0;i<5;i++){
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase?useUnicode=true&characterEncoding=UTF-8","root","root");
					list.add(con);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return list.remove(0);
	}

//关闭结果集对象
public static void close(ResultSet rs ){
	try{
		if(rs!=null)
			rs.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
}
//关闭预处理语句
public static void close(PreparedStatement ps ){
	try{
		if(ps!=null)
			ps.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
}
//把连接对象放回连接池中
public synchronized static  void close(Connection con ){
		if(con!=null)
			list.add(con);
  }	
}
