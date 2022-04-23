package org.javaboy.tienchin;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import org.junit.Test;

import java.util.Collections;

/**
 * @author 江南一点雨
 * @微信公众号 江南一点雨
 * @网站 http://www.itboyhub.com
 * @国际站 http://www.javaboy.org
 * @微信 a_java_boy
 * @GitHub https://github.com/lenve
 * @Gitee https://gitee.com/lenve
 */
public class Generator {
    @Test
    public void channelGenerator() {
        FastAutoGenerator.create("jdbc:mysql:///tienchin?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .disableOpenDir()
                            .fileOverride() // 覆盖已生成文件
                            .outputDir("/Users/sang/workspace/workspace02/tienchin/tienchin-channel/src/main/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy") // 设置父包名
                            .moduleName("channel") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, "/Users/sang/workspace/workspace02/tienchin/tienchin-channel/src/main/resources/mapper/channel")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("tienchin_channel") // 设置需要生成的表名
                            .addTablePrefix("tienchin_");
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
}
