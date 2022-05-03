package org.javaboy.tienchin.clue.domain.vo;

import com.baomidou.mybatisplus.annotation.TableName;
import org.javaboy.tienchin.clue.domain.Clue;

import java.time.LocalDateTime;

/**
 * @author 江南一点雨
 * @微信公众号 江南一点雨
 * @网站 http://www.itboyhub.com
 * @国际站 http://www.javaboy.org
 * @微信 a_java_boy
 * @GitHub https://github.com/lenve
 * @Gitee https://gitee.com/lenve
 */
public class ClueVO extends Clue {

    private String userName;
    private LocalDateTime belongTime;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public LocalDateTime getBelongTime() {
        return belongTime;
    }

    public void setBelongTime(LocalDateTime belongTime) {
        this.belongTime = belongTime;
    }
}
