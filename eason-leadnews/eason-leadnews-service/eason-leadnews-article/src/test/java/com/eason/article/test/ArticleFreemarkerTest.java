package com.eason.article.test;

import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.eason.article.ArticleApplication;
import com.eason.article.mapper.ApArticleContentMapper;
import com.eason.article.service.ApArticleService;
import com.eason.model.article.pojos.ApArticle;
import com.eason.model.article.pojos.ApArticleContent;
import com.eason.file.service.FileStorageService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

@SpringBootTest(classes = ArticleApplication.class)
@RunWith(SpringRunner.class)
public class ArticleFreemarkerTest {

    @Autowired
    private ApArticleContentMapper apArticleContentMapper;

    @Autowired
    private Configuration configuration;

    @Autowired
    private FileStorageService fileStorageService;

    @Autowired
    private ApArticleService apArticleService;

    @Test
    public void createStaticUrlTest() throws IOException, TemplateException {
        // 1 获取文章内容
        ApArticleContent apArticleContent = apArticleContentMapper.selectOne(Wrappers.<ApArticleContent>lambdaQuery().eq(ApArticleContent::getArticleId, "1302977754114826243L"));
        if (apArticleContent != null && StringUtils.isNotBlank(apArticleContent.getContent())) {
            // 2 文章内容通过freemarker生成html文件
            Template template = configuration.getTemplate("article.ftl");

            // 数据模型
            Map<String, Object> content = new HashMap<>();
            content.put("content", JSONArray.parseArray(apArticleContent.getContent()));
            StringWriter out = new StringWriter();
            // 合成
            template.process(content, out);

            // 3 把html文件上传到minio中
            InputStream in = new ByteArrayInputStream(out.toString().getBytes());
            String path = fileStorageService.uploadHtmlFile("", apArticleContent.getArticleId() + ".html", in);
            // 4 修改ap_article表，保存static_url字段
            apArticleService.update(Wrappers.<ApArticle>lambdaUpdate().eq(ApArticle::getId, apArticleContent.getArticleId())
                    .set(ApArticle::getStaticUrl, path));
        }
    }
}
