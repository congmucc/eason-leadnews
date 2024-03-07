package com.eason;

import com.eason.minio.MinIOApplication;
import com.eason.file.service.FileStorageService;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

@SpringBootTest(classes = MinIOApplication.class)
@RunWith(SpringRunner.class)
public class MinIOApplicationTest {

    @Resource
    private FileStorageService fileStorageService;


    /**
     * 使用工具类上传到minio
     * @throws FileNotFoundException
     */
    @Test
    public void test() throws FileNotFoundException {
        FileInputStream fileInputStream = new FileInputStream("D:\\list.html");
        String s = fileStorageService.uploadHtmlFile("", "list.html", fileInputStream);
        System.out.println(s);
    }

    /**
     * 将list.html文件上传到mimio中
     * @param args
     */
    public static void main(String[] args) {

        try {
            FileInputStream fileInputStream = new FileInputStream("D:\\");
            // 1. 获取minio的链接信息，创建一个minio的客户端
            MinioClient build = MinioClient.builder().credentials("minioadmin", "minioadmin").endpoint("http://192.168.47.128:9000").build();

            // 2. 上传
            PutObjectArgs putObjectArgs = PutObjectArgs.builder()
                    .object("list.html") // 文件名称
                    .contentType("text/html") // 文件类型
                    .bucket("leadnews") // 桶名称
                    .stream(fileInputStream, fileInputStream.available(), -1).build();
            build.putObject(putObjectArgs);

            // 访问路径
            System.out.println("http://192.168.47.128:9000/leadnews/list.html");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
