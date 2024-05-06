package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.ProductVO;

public class productDAO {
	// 커넥션 풀 사용 오라클 DB 접속 메서드
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
    
    public void dbConn() {       	
    	try{
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		conn=DriverManager.getConnection(
    				"jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC", // DB URL
    				"root", "1111");  // USER_NAME과 PASSWORD
    		System.out.println("Success");
    	}
    	catch(SQLException ex){ 
    		System.out.println("SQLException" + ex);
    		ex.printStackTrace();
    	}
    	catch(Exception ex){
    		System.out.println("Exception:" + ex);
    		ex.printStackTrace();
    	}
    }	// end of dbconn()
    
	// 상품 등록하기
	public void addProduct(ProductVO bean) {
	   // 0. DB접속
	   dbConn();
	   try {
	      // 1. SQL
		  String sql = "INSERT INTO Menu (name, image_url, price, size_up_price, shot_price, shot_available)\r\n"
		      		+ "VALUES (?, ?, ?, ?, ?, ?)";

	      // 2. pstmt
	      pstmt = conn.prepareStatement(sql);
	      // ? 매핑
	      pstmt.setString(1, bean.getName());
	      pstmt.setString(2, bean.getImage_url());
	      pstmt.setInt(3, bean.getPrice());
	      pstmt.setInt(4, bean.getSize_up_price());
	      pstmt.setInt(5, bean.getShot_price());
	      pstmt.setBoolean(6, bean.isShot_available());
	      // 3. 실행
	      pstmt.executeUpdate();
	      // 4. 자원반납
	      pstmt.close();
	      conn.close();
	         
	   } catch (Exception e) {
	      e.printStackTrace();
	   }
	}	// end of  addProduct()
	
	// 모든 메뉴 가져오기
    public List<ProductVO> getAllMenu() {
        List<ProductVO> menuList = new ArrayList<>();
        dbConn(); // DB 연결

        try {
            String sql = "SELECT * FROM Menu";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            // 결과 처리
            while (rs.next()) {
                ProductVO product = new ProductVO();
                product.setName(rs.getString("name"));
                product.setImage_url(rs.getString("image_url"));
                product.setPrice(rs.getInt("price"));
                product.setSize_up_price(rs.getInt("size_up_price"));
                product.setShot_price(rs.getInt("shot_price"));
                product.setShot_available(rs.getBoolean("shot_available"));

                menuList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 자원 반납
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return menuList;
    }	// end of getAllMenu()
}
