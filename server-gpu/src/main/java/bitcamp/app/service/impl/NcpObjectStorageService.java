package bitcamp.app.service.impl;

import java.io.InputStream;
import java.util.UUID;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import bitcamp.app.NaverObjectStorageConfig;
import bitcamp.app.service.ObjectStorageService;

@Service
public class NcpObjectStorageService implements ObjectStorageService {

  Logger log = LogManager.getLogger(getClass());

  final AmazonS3 s3;

  public NcpObjectStorageService(NaverObjectStorageConfig naverConfig) {
    s3 = AmazonS3ClientBuilder.standard()
        .withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(
            naverConfig.getEndPoint(), naverConfig.getRegionName()))
        .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(
            naverConfig.getAccessKey(), naverConfig.getSecretKey())))
        .build();
  }

  @Override
  public String uploadFile(String bucketName, String directoryPath, MultipartFile file) {
    if (file.isEmpty()) {
      return null;
    }

    try (InputStream fileIn = file.getInputStream()) {
      String filename = UUID.randomUUID().toString();

      ObjectMetadata objectMetadata = new ObjectMetadata();
      objectMetadata.setContentType(file.getContentType());
      objectMetadata.setContentLength(file.getSize());

      PutObjectRequest objectRequest = new PutObjectRequest(
          bucketName,
          directoryPath + filename,
          fileIn,
          objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead);

      s3.putObject(objectRequest);

      // log.info("filename >>> " + filename);  ////filename >>> 8acfad7b-0ff4-46ca-b921-322133575836
      // return filename;

      // log.info("s3.getUrl >>> " + s3.getUrl(bucketName, directoryPath + filename).toString());  //s3.getUrl >>> https://project-bucket1.kr.object.ncloudstorage.com/board/8acfad7b-0ff4-46ca-b921-322133575836
      return s3.getUrl(bucketName, directoryPath + filename).toString();

    } catch (Exception e) {
      throw new RuntimeException("파일 업로드 오류", e);
    }
  }

  @Override
  public String deleteFile(String storageUrl) {
    String bucketName = "bitcamp-bucket04-member-photo";
    String fileName = storageUrl.split(bucketName + "/")[1];
    try {
      s3.deleteObject(bucketName, fileName);
    } catch (Exception e) {
      throw new RuntimeException("파일 삭제 오류", e);
    }
    return fileName;
  }

}
