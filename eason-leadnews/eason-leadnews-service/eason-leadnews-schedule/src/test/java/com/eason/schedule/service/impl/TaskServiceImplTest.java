package com.eason.schedule.service.impl;

import com.eason.model.schedule.dto.Task;
import com.eason.common.constants.ScheduleConstants;
import com.eason.common.redis.CacheService;
import com.eason.schedule.ScheduleApplication;
import com.eason.schedule.service.TaskService;
import org.bouncycastle.pqc.jcajce.provider.qtesla.QTESLAKeyFactorySpi;
import org.junit.Test;
import org.junit.platform.commons.util.StringUtils;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Calendar;
import java.util.Date;
import java.util.Set;

@SpringBootTest(classes = ScheduleApplication.class)
@RunWith(SpringRunner.class)
public class TaskServiceImplTest {
    @Autowired
    private TaskService taskService;

    @Autowired
    private CacheService cacheService;

    @Test
    public void addTask() {

        for (int i = 0; i < 5; i++) {
            Task task = new Task();
            task.setTaskType(100 + i);
            task.setPriority(50);
            task.setParameters("task test".getBytes());
            task.setExecuteTime(new Date().getTime() + 500 * i);
            long l = taskService.addTask(task);
        }

    }

    @Test
    public void cancelTask() {
        taskService.cancelTask(1752659247377739778L);
    }




}
