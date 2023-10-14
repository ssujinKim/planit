package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberVO;

public class BoardDAO {
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	private DataSource dataFactory;
	
	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() { // 다음 글 가지고 오기.
	  	String SQL = "SELECT num FROM board ORDER BY num DESC";
	  	try {
	  		conn = dataFactory.getConnection();
	  		
	  		pstmt = conn.prepareStatement(SQL);
	  		rs = pstmt.executeQuery();
	  		if (rs.next()) {
	  			return rs.getInt(1) + 1;
	  		}
	  		pstmt.close();
	  		return 1; // 첫 번째 게시물인 경우
	  	} catch(Exception e) {
	  		e.printStackTrace();
	  	}
	  	return -1; // 데이터베이스 오류
	}

	public boolean write(String title, String content, String id) {
	  	String SQL = "INSERT INTO board(title,content,id) VALUES(?,?,?)";
	  	try {
	  		conn = dataFactory.getConnection();
	  		
	  		System.out.println("write(): "+SQL);
	  		
	  		pstmt = conn.prepareStatement(SQL);
	  		pstmt.setString(1, title);
	  		pstmt.setString(2, content);
	  		pstmt.setString(3, id);
	  		
	  		pstmt.executeUpdate();

			pstmt.close();
			conn.close();
			return true;
	  	} catch(Exception e) {
	  		e.printStackTrace();
	  	}
	  	return false;
	}
	
	public ArrayList<BoardVO> getList(int pageNumber) {
        String SQL = "SELECT * FROM board WHERE num < ? ORDER BY num DESC LIMIT 10";
        ArrayList<BoardVO> list = new ArrayList<BoardVO>();
        try {
        	conn = dataFactory.getConnection();
        	
        	PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            //pstmt.setInt(1, 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
            	BoardVO vo = new BoardVO();
                vo.setNum(rs.getInt(1));
                vo.setTitle(rs.getString(2));
                vo.setContent(rs.getString(3));
                vo.setId(rs.getString(4));
                vo.setPostDate(rs.getDate(5));
                vo.setVisitCount(rs.getInt(6));
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {}
        return list;
	}
	
	public boolean nextPage(int pageNumber) {
        String SQL = "SELECT * FROM board WHERE num < ? ORDER BY num DESC LIMIT 10";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
	}
	
	public BoardVO getContent(int num) {
		String sql = "SELECT * FROM board WHERE num=?";

		try {
			conn = dataFactory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNum(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setId(rs.getString(4));
				vo.setPostDate(rs.getDate(5));
				vo.setVisitCount(rs.getInt(6));
				return vo;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	  
}
