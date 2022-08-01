package com.lotte.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import com.lotte.dto.MemberDto;


public class IDfindDao {
	public ArrayList<MemberDto> getAllBoardList() throws Exception{

		Connection conn = DBC.getConnection();
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		String sql = "Select * from member ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String email = rs.getString("email");
			MemberDto dto = new MemberDto(email);
			list.add(dto);
		}
		pstmt.close();
		rs.close();
		return list;
	}
}	
	
