package com.eason.search.service.impl;

import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.common.enums.AppHttpCodeEnum;
import com.eason.model.search.dto.HistorySearchDto;
import com.eason.model.user.pojos.ApUser;
import com.eason.search.pojos.ApUserSearch;
import com.eason.search.service.ApUserSearchService;
import com.eason.utils.thread.AppThreadLocalUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@Slf4j
public class ApUserSearchServiceImpl implements ApUserSearchService {

    @Autowired
    private MongoTemplate mongoTemplate;

    /**
     * 保存用户搜索历史记录
     * @param keyword
     * @param userId
     */
    @Override
    @Async
    public void insert(String keyword, Integer userId) {
      // 1 查询当前用户的搜索关键词
        Query query = Query.query(Criteria.where("userId").is(userId).and("keyword").is(keyword));
        ApUserSearch one = mongoTemplate.findOne(query, ApUserSearch.class);
        // 2 存在 更新创建时间
        if (one != null) {
            one.setCreatedTime(new Date());
            mongoTemplate.save(one);
            return;
        }
      // 3 不存在 判断当前历史关键词总数量是否超过10个
        one = new ApUserSearch();
        one.setUserId(userId);
        one.setKeyword(keyword);
        one.setCreatedTime(new Date());

        Query query1 = Query.query(Criteria.where("userId").is(userId));
        query1.with(Sort.by(Sort.Direction.DESC, "createdTime"));
        List<ApUserSearch> apUserSearches = mongoTemplate.find(query1, ApUserSearch.class);
        if (apUserSearches == null || apUserSearches.size() < 10) {
            mongoTemplate.save(one);
        } else {
            // 如果大于10个，直接替换即可
            ApUserSearch lastUserSearch = apUserSearches.get(apUserSearches.size() - 1);
            mongoTemplate.findAndReplace(Query.query(Criteria.where("id").is(lastUserSearch.getUserId())), one);
        }
    }

    /**
     * 加载用户搜索历史记录
     * @return
     */
    @Override
    public ResponseResult findUserSearch() {
        //获取当前用户
        ApUser user = AppThreadLocalUtil.getUser();
        if(user == null){
            return ResponseResult.errorResult(AppHttpCodeEnum.NEED_LOGIN);
        }

        //根据用户查询数据，按照时间倒序
        List<ApUserSearch> apUserSearches = mongoTemplate.find(Query.query(Criteria.where("userId").is(user.getId())).with(Sort.by(Sort.Direction.DESC, "createdTime")), ApUserSearch.class);
        return ResponseResult.okResult(apUserSearches);
    }

    /**
     * 删除用户搜索记录
     * @param historySearchDto
     * @return
     */
    @Override
    public ResponseResult delUserSearch(HistorySearchDto dto) {
        //1.检查参数
        if(dto.getId() == null){
            return ResponseResult.errorResult(AppHttpCodeEnum.PARAM_INVALID);
        }

        //2.判断是否登录
        ApUser user = AppThreadLocalUtil.getUser();
        if(user == null){
            return ResponseResult.errorResult(AppHttpCodeEnum.NEED_LOGIN);
        }

        //3.删除
        mongoTemplate.remove(Query.query(Criteria.where("userId").is(user.getId()).and("id").is(dto.getId())),ApUserSearch.class);
        return ResponseResult.okResult(AppHttpCodeEnum.SUCCESS);
    }
}
