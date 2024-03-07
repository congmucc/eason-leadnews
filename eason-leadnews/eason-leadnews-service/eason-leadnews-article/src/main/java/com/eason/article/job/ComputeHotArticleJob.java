package com.eason.article.job;

import com.eason.article.service.HotArticleService;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Log4j
public class ComputeHotArticleJob {
    @Autowired
    private HotArticleService hotArticleService;

    @XxlJob("computeHotArticleJob")
    public void handle() {
        log.info("热文章分值计算调度任务开始执行...");
        hotArticleService.computeHotArticle();
        log.info("热文章分值计算调度任务结束...");

    }
}
