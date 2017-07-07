package com.njgo.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnect {
	  public static void disConnect(PreparedStatement st, Connection con){
	      try {
	         st.close();
	         con.close();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	   }
	   
	   public static void disConnect(ResultSet rs, PreparedStatement st, Connection con){
	      try {
	         rs.close();
	         DBConnect.disConnect(st, con);
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	   }
}
