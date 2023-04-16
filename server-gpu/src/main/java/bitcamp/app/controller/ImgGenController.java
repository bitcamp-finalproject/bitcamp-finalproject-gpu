package bitcamp.app.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.app.NaverObjectStorageConfig;
import bitcamp.app.service.ObjectStorageService;
import bitcamp.util.CustomMultipartFile;

@RestController
public class ImgGenController {

  Logger log = LogManager.getLogger(getClass());

  {
    log.trace("ImgGenController 생성됨!");
  }

  @Autowired private ObjectStorageService objectStorageService;
  @Autowired private NaverObjectStorageConfig naverObjectStorageConfig;

  @PostMapping("generate")
  public Object generate(@RequestParam String transContent, String fileName) {

    log.info("transContent >>> " + transContent);
    log.info("fileName >>> " + fileName);

    // 오늘은 몰디브에서의 휴양 일정이었습니다. 아침 일찍 일어나 해변을 걸으며 몰디브의 아름다운 풍경을 감상했습니다. 해안가에서는 스노클링을 즐기는 사람들이 많았고, 내가 챙긴 노르딕 스타킹을 신고 바다 속으로 뛰어들었습니다. 투명한 바다속에서는 다양한 물고기들이 떠다니며 내게 귀엽게 다가와 함께 수영했습니다. 몰디브의 아름다운 자연환경과 더불어 즐거운 수상 스포츠를 즐길 수 있는 멋진 곳이라는 생각이 들었습니다.
    String bucketName = naverObjectStorageConfig.getBucketName();
    String baseDir = System.getProperty("user.dir");  // C:\Users\bitcamp\git\bitcamp-finalproject\total\back-end
    String scriptPath = "";
    String command = "";
    String osName = System.getProperty("os.name").toLowerCase();

    if (osName.contains("win")) {
      scriptPath = baseDir + File.separator + "src" + File.separator + "main" + File.separator + "pythonapp" + File.separator + "simple_cmd.py";
      command = "python \"" + scriptPath + "\" \"" + transContent + "\" " + fileName;

    } else {
      scriptPath = ".." + File.separator + ".." + File.separator + "pythonapp" + File.separator + "simple_cmd.py";
//      command = "python3.8 " + scriptPath + " \"" + transContent + "\" " + fileName;
      command = "pwd";

    }
    
    log.info("osName >>> " + osName);
    log.info("command >>> " + command);

    try {
      Process process = Runtime.getRuntime().exec(command);
      BufferedReader stdInput = new BufferedReader(new InputStreamReader(process.getInputStream()));
      BufferedReader stdError = new BufferedReader(new InputStreamReader(process.getErrorStream()));
      String s = null;

      while ((s = stdInput.readLine()) != null) {
        log.info("stdInput >>> " + s);
        //클라이언트에게 진행상태 바로 % 표시
      }

      while ((s = stdError.readLine()) != null) {
        log.info("stdError >>> " + s);
      }
      log.info("stable diffusion 이미지 생성 완료!");

      // 상대 경로를 사용하여 이미지 파일 디렉토리 경로를 설정합니다.
      String imageDir = "src" + File.separator + "main" + File.separator + "pythonapp" + File.separator + "results" + File.separator;
      //log.info("imageDir >>> " + imageDir); //imageDir >>> src\main\pythonapp\results\

      // 이미지 파일의 전체 경로를 생성합니다.
      String filePath = baseDir + File.separator + imageDir + fileName;
      //log.info("filePath >>> " + filePath); //filePath >>> C:\Users\bitcamp\git\bitcamp-finalproject\total\back-end\src\main\pythonapp\results\f2df4782-2720-4b5a-8e85-f6b512c0a465.png

      // 이미지 파일을 File 객체에 담습니다.
      File file = new File(filePath);

      // file 을 multipartFile 로 변환
      MultipartFile multipartFile = new CustomMultipartFile(file);

      String fileUrl = objectStorageService.uploadFile(bucketName, "board/", multipartFile);
      // log.info("fileUrl >>> " + fileUrl);  //fileUrl >>> https://project-bucket1.kr.object.ncloudstorage.com/board/8acfad7b-0ff4-46ca-b921-322133575836

      return fileUrl;

    } catch (IOException e) {
      log.error("명령 프롬프트 에러 발생!: " + command, e);

    }

    return null;

  }

}
