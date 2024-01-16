package model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Spring MVC Controller 예제
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Servlet implementation class PythonController2
 */
@WebServlet("/model/run-python2")
public class PythonController_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PythonController_2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @return 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
	         // 여기서 파이썬 스크립트를 실행하고 결과를 반환
	         // 예를 들어, ProcessBuilder를 사용하여 실행하는 코드를 작성
	         ProcessBuilder processBuilder = new ProcessBuilder("python", "C://Plan-it/example1.py");
	         Process process = processBuilder.start();

	         // 프로세스의 출력 가져오기
	         InputStream inputStream = process.getInputStream();
	         BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));

	         StringBuilder output = new StringBuilder();
	         String line;
	         while ((line = reader.readLine()) != null) {
	             output.append(line).append("\n");
	         }

	         System.out.println(output.toString());
	         //return output.toString();

	     } catch (IOException e) {
	         e.printStackTrace();
	         System.out.println("Error while running Python script.");
	         //return "Error while running Python script.";
	     }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
