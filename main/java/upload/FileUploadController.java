package upload;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
public class FileUploadController {

	@ResponseBody
    @PostMapping("/upload")
    public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file) {
        try {
            if (file.isEmpty()) {
                return new ResponseEntity<>("파일을 선택해주세요.", HttpStatus.BAD_REQUEST);
            }

            String uploadDir = "/img";  // 업로드할 디렉토리 경로 설정
            String fileName = "uploaded_image.jpg";
            String filePath = uploadDir + File.separator + fileName;
            File dest = new File(filePath);

            // 디렉토리가 없으면 생성
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }

            file.transferTo(dest);

            return new ResponseEntity<>("파일 업로드에 성공했습니다.", HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
            return new ResponseEntity<>("파일 업로드에 실패했습니다. 원인: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
