package org.javaboy.tienchin;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import org.junit.Test;
import oshi.jna.platform.mac.SystemB;

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
                    builder.parent("org.javaboy.tienchin") // 设置父包名
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

    @Test
    public void activityGenerator() {
        FastAutoGenerator.create("jdbc:mysql:///tienchin?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .disableOpenDir()
                            .fileOverride() // 覆盖已生成文件
                            .outputDir("/Users/sang/workspace/workspace02/tienchin/tienchin-activity/src/main/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy.tienchin") // 设置父包名
                            .moduleName("activity") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, "/Users/sang/workspace/workspace02/tienchin/tienchin-activity/src/main/resources/mapper/activity")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("tienchin_activity") // 设置需要生成的表名
                            .addTablePrefix("tienchin_");
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }

    @Test
    public void clueGenerator() {
        FastAutoGenerator.create("jdbc:mysql:///tienchin?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .disableOpenDir()
                            .fileOverride() // 覆盖已生成文件
                            .outputDir("/Users/sang/workspace/workspace02/tienchin/tienchin-clue/src/main/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy.tienchin") // 设置父包名
                            .moduleName("clue") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, "/Users/sang/workspace/workspace02/tienchin/tienchin-clue/src/main/resources/mapper/clue")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("tienchin_clue") // 设置需要生成的表名
                            .addTablePrefix("tienchin_");
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }

    @Test
    public void assignmentGenerator() {
        FastAutoGenerator.create("jdbc:mysql:///tienchin?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .disableOpenDir()
                            .fileOverride() // 覆盖已生成文件
                            .outputDir("/Users/sang/workspace/workspace02/tienchin/tienchin-assignment/src/main/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy.tienchin") // 设置父包名
                            .moduleName("assignment") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, "/Users/sang/workspace/workspace02/tienchin/tienchin-assignment/src/main/resources/mapper/assignment")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("tienchin_assignment") // 设置需要生成的表名
                            .addTablePrefix("tienchin_");
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }

    @Test
    public void ruleGenerator() {
        FastAutoGenerator.create("jdbc:mysql:///tienchin?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .disableOpenDir()
                            .fileOverride() // 覆盖已生成文件
                            .outputDir("/Users/sang/workspace/workspace02/tienchin/tienchin-rule/src/main/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy.tienchin") // 设置父包名
                            .moduleName("rule") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, "/Users/sang/workspace/workspace02/tienchin/tienchin-rule/src/main/resources/mapper/rule")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("tienchin_rule") // 设置需要生成的表名
                            .addTablePrefix("tienchin_");
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }

    @Test
    public void followRecordGenerator() {
        String moduleName = "followrecord";
        String tableName = "tienchin_follow_record";
        FastAutoGenerator.create("jdbc:mysql:///tienchin?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .disableOpenDir()
                            .fileOverride() // 覆盖已生成文件
                            .outputDir("/Users/sang/workspace/workspace02/tienchin/tienchin-"+moduleName+"/src/main/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy.tienchin") // 设置父包名
                            .moduleName(moduleName) // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, "/Users/sang/workspace/workspace02/tienchin/tienchin-"+moduleName+"/src/main/resources/mapper/"+moduleName)); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude(tableName) // 设置需要生成的表名
                            .addTablePrefix("tienchin_");
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
}
