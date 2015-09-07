package br.com.professores.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import br.com.professores.controller.HomeController;
import br.com.professores.viewresolver.JsonViewResolver;
import java.util.ArrayList;
import java.util.List;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;

@EnableWebMvc
@ComponentScan(basePackageClasses = {HomeController.class})
public class AppWebConfiguration {

    @Bean
    public InternalResourceViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Bean
    public ViewResolver contentNegotiatingViewResolver(
            ContentNegotiationManager manager) {
        List<ViewResolver> resolvers
                = new ArrayList<ViewResolver>();
        resolvers.add(internalResourceViewResolver());
        resolvers.add(new JsonViewResolver());
        ContentNegotiatingViewResolver resolver
                = new ContentNegotiatingViewResolver();
        resolver.setViewResolvers(resolvers);
        resolver.setContentNegotiationManager(manager);
        return resolver;
    }
}
