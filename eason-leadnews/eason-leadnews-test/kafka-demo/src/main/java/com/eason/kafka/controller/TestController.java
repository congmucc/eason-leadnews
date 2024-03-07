package com.eason.kafka.controller;

import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @Autowired
    private KafkaTemplate kafkaTemplate;

    @GetMapping("/test")
    public String hello() {
        kafkaTemplate.send("topic", "测试");
        return "ok";
    }
}
