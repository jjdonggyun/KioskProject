package view;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.productDAO;
import vo.ProductVO;


@WebServlet("/plus_product")
public class plus_product extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 요청 파라미터에서 상품 정보 추출
        String name = request.getParameter("name");
        String image_url = request.getParameter("image_url");
        int price = 0;
        int size_up_price = 0;
        int shot_price = 0;
        boolean shot_available = false;
        
        // 파라미터 값이 null이 아닌 경우에만 파싱
        if (request.getParameter("price") != null) {
            price = Integer.parseInt(request.getParameter("price"));
        }
        if (request.getParameter("size_up_price") != null) {
            size_up_price = Integer.parseInt(request.getParameter("size_up_price"));
        }
        if (request.getParameter("shot_price") != null) {
            shot_price = Integer.parseInt(request.getParameter("shot_price"));
        }
        if (request.getParameter("shot_available") != null) {
            shot_available = Boolean.parseBoolean(request.getParameter("shot_available"));
        }

        // 상품 정보 객체 생성
        ProductVO product = new ProductVO();
        product.setName(name);
        product.setImage_url(image_url);
        product.setPrice(price);
        product.setSize_up_price(size_up_price);
        product.setShot_price(shot_price);
        product.setShot_available(shot_available);

        // 상품 DAO를 통해 데이터베이스에 상품 추가
        productDAO dao = new productDAO();
        dao.addProduct(product);

        // 추가한 상품 목록을 다시 조회하여 모든 상품 정보를 가져옴
        // 가져온 상품 목록을 request 속성에 설정하여 index.jsp로 전달
        request.setAttribute("products", dao.getAllMenu());

        // index.jsp로 포워딩
        request.getRequestDispatcher("main_index.jsp").forward(request, response);
	}

}
