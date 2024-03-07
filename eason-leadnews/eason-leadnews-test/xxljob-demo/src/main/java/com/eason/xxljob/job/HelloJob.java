package com.eason.xxljob.job;

import com.xxl.job.core.handler.annotation.XxlJob;
import org.springframework.stereotype.Component;

@Component
public class HelloJob {
    @XxlJob("demoJobHandle")
    public void helloJob() {
        System.out.println("简单任务执行了");
    }
}
