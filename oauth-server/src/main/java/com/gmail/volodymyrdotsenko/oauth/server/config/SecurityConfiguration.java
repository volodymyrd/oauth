package com.gmail.volodymyrdotsenko.oauth.server.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/**
 * Created by Volodymyr Dotsenko on 06.07.16.
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, proxyTargetClass = true)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

//    @Autowired
//    public void globalUserDetails(AuthenticationManagerBuilder auth) throws Exception {
//        auth.inMemoryAuthentication().withUser("user").password("user").roles("USER").and().withUser("admin")
//                .password("admin").roles("ADMIN");
//    }

    @Bean
    public AuthenticationProvider daoAuthenticationProvider() {
        CustomAuthenticationProvider ap = new CustomAuthenticationProvider();

        return ap;
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(daoAuthenticationProvider());
    }


    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                    .antMatchers("/static/bootstrap").permitAll()
                    .antMatchers("/home").permitAll()
                    .antMatchers("/login").permitAll()
                    .antMatchers("/user/**").authenticated()
                    .and()
                .exceptionHandling()
                    .accessDeniedPage("/login.jsp?authorization_error=true")
                    .and()
                // TODO: put CSRF protection back into this endpoint
                .csrf()
                    .requireCsrfProtectionMatcher(new AntPathRequestMatcher("/oauth/authorize"))
                    .disable()
                .logout()
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/login")
                    .and()
                .formLogin()
                    .loginProcessingUrl("/login")
                    .failureUrl("/login?authentication_error=true")
                    .loginPage("/login");
    }
}