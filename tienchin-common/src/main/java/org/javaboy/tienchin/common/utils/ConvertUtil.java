package org.javaboy.tienchin.common.utils;

import net.sf.cglib.beans.BeanCopier;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author 江南一点雨
 * @微信公众号 江南一点雨
 * @网站 http://www.itboyhub.com
 * @国际站 http://www.javaboy.org
 * @微信 a_java_boy
 * @GitHub https://github.com/lenve
 * @Gitee https://gitee.com/lenve
 */
public class ConvertUtil {

    /**
     * 将原对象的属性值，拷贝到目标对象对应的属性中
     * @param source   原对象
     * @param target   目标对象
     * @param <S>
     * @param <T>
     * @return         属性拷贝完成的目标对象
     */
    public static <S,T> T convert(S source,T target){
        if(source == null || target == null){
            return null;
        }
        BeanCopier copier = BeanCopier.create(source.getClass(),target.getClass(),false);
        T result = target;
        copier.copy(source,result,null);
        return result;
    }

    public static <S,T> T convert(S source, Class<T> target) {
        try {
            return convert(source,target.newInstance());
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     *拷贝列表
     */
    public static <S,T> List<T> convertList(List<S> source, Class<T> target){
        if(source == null){
            return null;
        }
        return source.stream().map(item -> {
            T result = null;
            try {
                result = target.newInstance();
                convert(item,result);
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
            return result;
        }).collect(Collectors.toList());
    }
}
