package com.eason.schedule.feign;

import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.schedule.dto.Task;
import com.eason.apis.schedule.IScheduleClient;
import com.eason.schedule.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ScheduleClient implements IScheduleClient {

    @Autowired
    private TaskService taskService;
    /**
     * 添加延迟任务
     * @param task
     * @return
     */
    @PostMapping("/api/v1/task/add")
    @Override
    public ResponseResult addTask(Task task) {
        return ResponseResult.okResult(taskService.addTask(task));
    }

    /**
     * 取消任务
     * @param taskId
     * @return
     */
    @GetMapping("/api/v1/task/{taskId}")
    @Override
    public ResponseResult cancelTask(long taskId) {
        return ResponseResult.okResult(taskService.cancelTask(taskId));
    }

    /**
     * 按照类型和优先级来拉取任务
     * @param type
     * @param priority
     * @return
     */
    @GetMapping("/api/v1/task/{type}/{priority}")
    @Override
    public ResponseResult poll(int type, int priority) {
        return ResponseResult.okResult(taskService.poll(type, priority));
    }
}
