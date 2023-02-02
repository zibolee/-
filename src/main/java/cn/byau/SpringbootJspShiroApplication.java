package cn.byau;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan({"cn.byau.system.mapper","cn.byau.modules.mapper"})
public class SpringbootJspShiroApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootJspShiroApplication.class, args);
    }

}
