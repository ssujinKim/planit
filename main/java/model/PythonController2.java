package model;

import java.io.IOException;
import java.io.InputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;

/*
//Spring MVC Controller
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
*/

public class PythonController2 {

 public String runPythonScript() {
     try {
         ProcessBuilder processBuilder = new ProcessBuilder("python", "C:\\JavaProgram\\planit\\src\\main\\java\\model\\6_Recommend.py");
         processBuilder.environment().put("PYTHONIOENCODING", "UTF-8");
         Process process = processBuilder.start();
         
         InputStream inputStream = process.getInputStream();
         BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "utf-8"));

         // 특정 값을 찾을 문자열
         String targetValue = "카테고리";
         String targetValue2 = "다른 사진";
         
         // 스트림에서 특정 문자열이 발견되면 해당 줄부터 끝까지 출력        
         StringBuilder output = new StringBuilder();
         String line;
         boolean foundTarget = false;
         while ((line = reader.readLine()) != null) {
        	 if(line.contains(targetValue2)) {
        		 output.append(line).append("\n");
        		 break;
        	 }
        	 
        	 if(foundTarget) {
        		 output.append(line).append("\n");
        	 }
        	 if (line.contains(targetValue)) {
                 // 특정 문자열이 발견되면 foundTarget을 true로 설정
                 foundTarget = true;
                 output.append(line).append("\n");
                 System.out.println(line);
             }
         }
         
         // 에러 메시지
         BufferedReader errorReader = new BufferedReader(new InputStreamReader(process.getErrorStream(), "utf-8"));
         StringBuilder errors = new StringBuilder();

         String errorLine;
         while ((errorLine = errorReader.readLine()) != null) {
             errors.append(errorLine).append("\n");
         }

         if (errors.length() > 0) {
             System.err.println("Error in Python script:\n" + errors.toString());
         }

         // 문자열 출력 & 전송
         System.out.println(output.toString());
         return output.toString();

     } catch (IOException e) {
         e.printStackTrace();
         return "Error while running Python script.";
     }
 }
}
