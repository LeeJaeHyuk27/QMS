package com.qms;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	//web root가 아닌 외부 경로에 있는 리소스를 url로 불러올 수 있도록 설정
    //현재 localhost:8090/images/1234.jpg
    //로 접속하면 C://workspace/uploadfile/images/1234.jpg 파일을 불러온다.
	 @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/files/**")
                .addResourceLocations("file:///c:/workspace/uploadfile/files/");
    }
}
