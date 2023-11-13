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
	  		conn.close();
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
            
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {}
        return list;
	}
	
	public boolean nextPage(int pageNumber) {
        String SQL = "SELECT * FROM board WHERE num < ? ORDER BY num DESC LIMIT 10";
        try {
        	conn = dataFactory.getConnection();
        	
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
            
            rs.close();
            pstmt.close();
            conn.close();
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
			
			rs.close();
            pstmt.close();
            conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int num, String title, String content) {
	    String SQL = "UPDATE board SET title = ?, content = ? WHERE num = ?";
	    try {
	    	conn = dataFactory.getConnection();
	    	
	    	PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, title);
	        pstmt.setString(2, content);
	        pstmt.setInt(3, num);
	        
            //pstmt.close();
            //conn.close();
            
	        return pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return -1; // 데이터베이스 오류
	}

	public int delete(int num) {
	    String SQL = "DELETE FROM board WHERE num = ?";
	    try {
	    	conn = dataFactory.getConnection();
	    	
	        PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setInt(1, num);
	        
	        //pstmt.close();
	        conn.close();
	        
	        return pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return -1; // 데이터베이스 오류
	}

	public List<BoardVO> getList2(int pageNumber) {
		List<BoardVO> list= new ArrayList<BoardVO>();
	      
	      try {
	         conn = dataFactory.getConnection();
	         
	         String sql = "SELECT * FROM board WHERE num < ? ORDER BY num DESC LIMIT 10";
	         //System.out.println(sql);
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
	         
	         ResultSet rs = pstmt.executeQuery();
	         while(rs.next()) {
	            int num = rs.getInt(1);
	            String title = rs.getString(2);
	            String content = rs.getString(3);
	            String id = rs.getString(4);
	            Date postDate  = rs.getDate(5);
	            int visitCount = rs.getInt(6);   
	            
	            BoardVO vo = new BoardVO();
	            vo.setNum(num);
	            vo.setTitle(title);
	            vo.setContent(content);
	            vo.setId(id);
	            vo.setPostDate(postDate);
	            vo.setVisitCount(visitCount);
	            
	            list.add(vo);
	         }
	         rs.close();
	         pstmt.close();
	         conn.close();
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	 }
}
