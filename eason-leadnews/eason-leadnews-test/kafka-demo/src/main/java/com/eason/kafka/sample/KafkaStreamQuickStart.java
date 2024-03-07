package com.eason.kafka.sample;

import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.KeyValue;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.kstream.KStream;
import org.apache.kafka.streams.kstream.TimeWindows;
import org.apache.kafka.streams.kstream.ValueMapper;

import java.time.Duration;
import java.util.Arrays;
import java.util.Properties;

/**
 * 流式处理
 */
public class KafkaStreamQuickStart {
    public static void main(String[] args) {
        // kafka配置中心
        Properties prop = new Properties();
        prop.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, "192.168.47.128:9092");
        prop.put(StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        prop.put(StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        prop.put(StreamsConfig.APPLICATION_ID_CONFIG,"streams-quickstart");

        // stream 构建器
        StreamsBuilder streamsBuilder = new StreamsBuilder();

        streamProcessor(streamsBuilder);


        // 创建kafkaStream对象
        KafkaStreams kafkaStream = new KafkaStreams(streamsBuilder.build(),prop);

        // 开启流式处理
        kafkaStream.start();


    }

    /**
     * 流式处理
     * @param streamsBuilder
     */
    private static void streamProcessor(StreamsBuilder streamsBuilder) {
        //创建kstream对象，同时指定从那个topic中接收消息
        KStream<String, String> stream = streamsBuilder.stream("itcast-topic-input");
        /**
         * 消息处理的value
         */
        stream.flatMapValues(new ValueMapper<String, Iterable<?>>() {
            @Override
            public Iterable<String> apply(String s) {
                String[] s1 = s.split(" ");
                return Arrays.asList(s1);
            }
        })
                // 按照value进行聚合处理
                .groupBy((key,value) -> value)
                // 时间窗口
                .windowedBy(TimeWindows.of(Duration.ofSeconds(10)))
                // 统计单词的个数
                .count()
                // 转换为流式
                .toStream()
                // 进行流式处理
                .map((key,value) ->{
                    System.out.println("key" + key + "   value" + value);
                    return new KeyValue<>(key.key().toString(), value.toString());
                })
                // 发送消息
                .to("itcast-topic-output");

    }
}
