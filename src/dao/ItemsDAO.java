package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBConnection;

import entity.Items;

//商品的业务逻辑类
public class ItemsDAO {



	// 获得分类商品信息
	public ArrayList<Items> getAllItems(String type) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Items> list = new ArrayList<Items>(); // 商品集合
		try {
			conn = DBConnection.getOneCon();
			String sql = "select * from items where type=?; "; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, type);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setCity(rs.getString("city"));
				item.setIntroduce(rs.getString("introduce"));
				item.setPrice(rs.getDouble("price"));
				item.setMatures(rs.getString("matures"));
				item.setSize(rs.getString("size"));
				item.setType(rs.getString("type"));
				item.setPicture(rs.getString("picture"));
				list.add(item);// 把一个商品加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}

	}

	// 根据商品编号获得商品资料
	public Items getItemsById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getOneCon();
			String sql = "select * from items where id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setCity(rs.getString("city"));
				item.setIntroduce(rs.getString("introduce"));
				item.setPrice(rs.getDouble("price"));
				item.setMatures(rs.getString("matures"));
				item.setSize(rs.getString("size"));
				item.setType(rs.getString("type"));
				item.setPicture(rs.getString("picture"));
				return item;
			} else {
				return null;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

		}
	}
	//获取最近浏览的前五条商品信息
	
}
