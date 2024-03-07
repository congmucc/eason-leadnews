package com.eason.article.listener;

import com.alibaba.fastjson.JSON;
import com.eason.article.service.ApArticleService;
import com.eason.model.mess.ArticleVisitStreamMess;
import com.eason.common.constants.HotArticleConstants;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class ArticleIncrHandleListener {

    @Autowired
    private ApArticleService apArticleService;

    @KafkaListener(topics = HotArticleConstants.HOT_ARTICLE_INCR_HANDLE_TOPIC)
    public void onMessage(String mess){
        if(StringUtils.isNotBlank(mess)){
            ArticleVisitStreamMess articleVisitStreamMess = JSON.parseObject(mess, ArticleVisitStreamMess.class);
            apArticleService.updateScore(articleVisitStreamMess);

        }
    }
}