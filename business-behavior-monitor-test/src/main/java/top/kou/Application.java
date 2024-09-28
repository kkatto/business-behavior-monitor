package top.kou;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author KouJY
 * Date: 2024/9/26 15:21
 * Package: top.kou
 */
@SpringBootApplication
@Configurable
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class);
    }
}

