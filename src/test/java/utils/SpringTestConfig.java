package utils;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;

// 설정 중복 제거
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface SpringTestConfig {

}
