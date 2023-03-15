package org.javaboy.tienchin;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

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
@SpringBootTest
public class GenerateCode {
    @Test
    void generateContractCode() {

        String path = "/Users/sang/workspace/tienchin-video/code/tienchin/tienchin-contract/src/main";

        FastAutoGenerator.create("jdbc:mysql:///tienchin-video?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .fileOverride() // 覆盖已生成文件
                            .outputDir(path + "/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy.tienchin") // 设置父包名
                            .moduleName("contract") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, path + "/resources/mapper")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("tienchin_contract") // 设置需要生成的表名
                            .addTablePrefix("tienchin_"); // 设置过滤表前缀
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
    @Test
    void generateBusinessCode() {

        String path = "/Users/sang/workspace/tienchin-video/code/tienchin/tienchin-business/src/main";

        FastAutoGenerator.create("jdbc:mysql:///tienchin-video?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .fileOverride() // 覆盖已生成文件
                            .outputDir(path + "/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy.tienchin") // 设置父包名
                            .moduleName("business") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, path + "/resources/mapper")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("tienchin_business") // 设置需要生成的表名
                            .addTablePrefix("tienchin_"); // 设置过滤表前缀
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }

    @Test
    void generateClueCode() {

        String path = "/Users/sang/workspace/tienchin-video/code/tienchin/tienchin-clue/src/main";

        FastAutoGenerator.create("jdbc:mysql:///tienchin-video?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .fileOverride() // 覆盖已生成文件
                            .outputDir(path + "/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy.tienchin") // 设置父包名
                            .moduleName("clue") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, path + "/resources/mapper")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("tienchin_clue", "tienchin_assignment", "tienchin_follow_record") // 设置需要生成的表名
                            .addTablePrefix("tienchin_"); // 设置过滤表前缀
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }

    @Test
    void generateCourseCode() {

        String path = "/Users/sang/workspace/tienchin-video/code/tienchin/tienchin-course/src/main";

        FastAutoGenerator.create("jdbc:mysql:///tienchin-video?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .fileOverride() // 覆盖已生成文件
                            .outputDir(path + "/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy.tienchin") // 设置父包名
                            .moduleName("course") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, path + "/resources/mapper")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("tienchin_course") // 设置需要生成的表名
                            .addTablePrefix("tienchin_"); // 设置过滤表前缀
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }

    @Test
    void generateActivityCode() {

        String path = "/Users/sang/workspace/tienchin-video/code/tienchin/tienchin-activity/src/main";

        FastAutoGenerator.create("jdbc:mysql:///tienchin-video?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .fileOverride() // 覆盖已生成文件
                            .outputDir(path + "/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy.tienchin") // 设置父包名
                            .moduleName("activity") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, path + "/resources/mapper")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("tienchin_activity") // 设置需要生成的表名
                            .addTablePrefix("tienchin_"); // 设置过滤表前缀
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }

    @Test
    void generateChannelCode() {

        String path = "/Users/sang/workspace/tienchin-video/code/tienchin/tienchin-channel/src/main/";

        FastAutoGenerator.create("jdbc:mysql:///tienchin-video?serverTimezone=Asia/Shanghai&useSSL=false", "root", "123")
                .globalConfig(builder -> {
                    builder.author("javaboy") // 设置作者
                            .fileOverride() // 覆盖已生成文件
                            .outputDir(path + "/java"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("org.javaboy.tienchin") // 设置父包名
                            .moduleName("channel") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, path + "/resources/mapper")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.addInclude("tienchin_channel") // 设置需要生成的表名
                            .addTablePrefix("tienchin_"); // 设置过滤表前缀
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
}
