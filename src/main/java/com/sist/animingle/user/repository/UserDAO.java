package com.sist.animingle.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class UserDAO {
   
   private Connection conn;
   private Statement stat;
   private PreparedStatement pstat;
   private ResultSet rs;
   
   public UserDAO() {
      this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
   }

   public UserDTO getUserInfo(String id) {
      
      try {

         String sql = "select * from tblUser where user_id = ?";

         pstat = conn.prepareStatement(sql);

         pstat.setString(1, id);

         rs = pstat.executeQuery();

         if (rs.next()) {
            UserDTO dto = new UserDTO();

            dto.setUser_pw(rs.getString("user_pw"));
            dto.setUser_name(rs.getString("user_name"));
            dto.setUser_address(rs.getString("user_address"));
            dto.setUser_addressdetail(rs.getString("user_addressdetail"));
            dto.setUser_tel(rs.getString("user_tel"));
            dto.setUser_email(rs.getString("user_email"));
            dto.setUser_nickname(rs.getString("user_nickname"));
            dto.setUser_animalnum(rs.getString("user_animalnum"));
            dto.setUser_birth(rs.getString("user_birth"));
            dto.setUser_pic(rs.getString("user_pic"));

            return dto;
         }

      } catch (Exception e) {
         e.printStackTrace();
      }

      
      return null;
   }
   
   
   
   
}