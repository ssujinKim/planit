package member;

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

public class MemberDAO {
	private PreparedStatement pstmt;
	private Connection conn;
	private DataSource dataFactory;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/mysqlpool");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberVO userLogin(String id, String pw) {
		MemberVO vo = null;
		
		try {
			conn = dataFactory.getConnection();
			
			String sql = "SELECT * FROM member WHERE id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new MemberVO();
				
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
			}
			if(rs != null) {
				try {
					rs.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public int loginCheck(String id, String pw) {
		System.out.println("login 정보 확인");
		int ok = 0;
		try {
			conn = dataFactory.getConnection();
			
			String sql = "SELECT pw FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pw").equals(pw)) {
					System.out.println("login success");
					ok = 1;
				} else {
					System.out.println("비번 불일치");
					ok = 2;
				}
			} else {
				System.out.println("아이디 불일치");
				ok = 3;
			}
			
			if (rs != null) {
	            try {
	                rs.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return ok;
	}
	
	public boolean addMember(MemberVO vo) {
		try {
			conn = dataFactory.getConnection();

			String sql = "insert into `member`(id, pw, name, gender, birth, phone, email) "+
					"values(?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getBirth());
			pstmt.setString(6, vo.getPhone());
			pstmt.setString(7, vo.getEmail());
			
			System.out.println("addMember(): "+sql);
			
			pstmt.executeUpdate();

			pstmt.close();
			conn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int isDuplicateID(String id) {
		System.out.println("Received id: " + id);

		try {
			conn = dataFactory.getConnection();

			String sql = "select COUNT(*) from `member` where id='" + id + "'";
			System.out.println("isDuplicate(): " + sql);

			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int count = rs.getInt(1);
				return count;
			}
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public List<MemberVO> memInfo(String id) {
		List<MemberVO> list= new ArrayList<MemberVO>();
		try {
			conn = dataFactory.getConnection();
			
			String sql = "SELECT * FROM member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String m_id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				String birth = rs.getString("birth");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				
				MemberVO vo = new MemberVO();
				vo.setId(m_id);
				vo.setPw(pw);
				vo.setName(name);
				vo.setGender(gender);
				vo.setBirth(birth);
				vo.setPhone(phone);
				vo.setEmail(email);
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
	
	public boolean update(MemberVO vo) {
		try {
	         conn = dataFactory.getConnection();
	         
	         String sql = "UPDATE member SET phone=?, email=? where id=?"; 
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, vo.getPhone());
	         pstmt.setString(2, vo.getEmail());
	         pstmt.setString(3, vo.getId());   
	         
	         pstmt.executeUpdate();
	         System.out.println("정보 등록 완료");
	         
	         pstmt.close();
	         return true;
	    } catch(Exception e) {
	    	 e.printStackTrace();
	    }
		return false;
	}
	
	public boolean updatePw(MemberVO vo) {
		try {
	         conn = dataFactory.getConnection();
	         
	         String sql = "UPDATE member SET pw=? where id=?"; 
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, vo.getPw());
	         pstmt.setString(2, vo.getId());
	         
	         pstmt.executeUpdate();
	         System.out.println(sql);
	         System.out.println("비밀번호 변경 완료");

	         pstmt.close();
	         return true;
	    } catch(Exception e) {
	    	 e.printStackTrace();
	    }
		return false;
	}
	
	public String findId(String name, String phone) {
		String find_id = null;
		
		try {
			conn = dataFactory.getConnection();
				
			String sql = "SELECT id FROM member WHERE name=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				find_id = rs.getString("id");
				System.out.println(find_id);
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
		        }
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
		        }
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return find_id;
	}
	
	public String findPw(String id, String name, String phone) {
		String find_pw = null;
		
		try {
			conn = dataFactory.getConnection();
				
			String sql = "SELECT pw FROM member WHERE id=? and name=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				find_pw = rs.getString("pw");
				System.out.println(find_pw);
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
		        }
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
		        }
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return find_pw;
	}
}
