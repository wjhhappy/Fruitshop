package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBConnection;
import entity.User;

public class UserBusyness {

	//判断用户名是否可用
    public boolean nameIsExit(String name){
    	boolean b=true;
    	Connection con=DBConnection.getOneCon();
    	PreparedStatement ps=null;
    	ResultSet rs=null;
    	try{
    		ps=con.prepareStatement("select * from user where userName=?");
    		ps.setString(1, name);
    		rs=ps.executeQuery();
    		if(rs.next())
    		b=false;
    	}catch(SQLException e){
    		e.printStackTrace();
    	}finally{
    		DBConnection.close(rs);
    		DBConnection.close(ps);
    		DBConnection.close(con);
    	}
    	return b;
    }
    
  //实现注册功能
    public boolean regist(User u){
    	boolean b=false;
    	Connection con=DBConnection.getOneCon();
    	PreparedStatement ps=null;
    	try{
    		ps=con.prepareStatement("insert into user values(?,?)");
    		ps.setString(1, u.getUname());
    		ps.setString(2, u.getUpass());
    		int i=ps.executeUpdate();
    		if(i>0)
    		b=true;
    	}catch(SQLException e){
    		e.printStackTrace();
    	}finally{
    		DBConnection.close(ps);
    		DBConnection.close(con);
    	}
    	return b;
    }
    
  //实现登录功能
    public boolean login(User u){
    	boolean b=false;
    	Connection con=DBConnection.getOneCon();
    	PreparedStatement ps=null;
    	ResultSet rs=null;
    	try{
    		ps=con.prepareStatement("select * from user where userName=? and password=?");
    		ps.setString(1, u.getUname());
    		ps.setString(2, u.getUpass());
    		rs=ps.executeQuery();
    		if(rs.next())
    		b=true;
    	}catch(SQLException e){
    		e.printStackTrace();
    	}finally{
    		DBConnection.close(rs);
    		DBConnection.close(ps);
    		DBConnection.close(con);
    	}
    	return b;
    }
    
  //实现修改密码功能
    public boolean upadatePassword(User u){
    	boolean b=false;
    	Connection con=DBConnection.getOneCon();
    	PreparedStatement ps=null;
    	try{
    		ps=con.prepareStatement("update user set password=? where userName=?");
    		ps.setString(1, u.getUpass());
    		ps.setString(2, u.getUname());
    		int i=ps.executeUpdate();
    		if(i>0)
    		b=true;
    	}catch(SQLException e){
    		e.printStackTrace();
    	}finally{
    		DBConnection.close(ps);
    		DBConnection.close(con);
    	}
    	return b;
    }
}
