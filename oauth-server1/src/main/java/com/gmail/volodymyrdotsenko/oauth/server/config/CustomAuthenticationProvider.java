package com.gmail.volodymyrdotsenko.oauth.server.config;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Created by Volodymyr Dotsenko on 7/6/16.
 */
public class CustomAuthenticationProvider implements AuthenticationProvider {
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String password = (String) authentication.getCredentials();

        //CustomUser user = userService.loadUserByUsername(username);

        //if (user == null || !user.getUsername().equalsIgnoreCase(username)) {
        //  throw new BadCredentialsException("Username not found.");
        //}

        //if (!password.equals(user.getPassword())) {
        //  throw new BadCredentialsException("Wrong password.");
        //}

        //Collection<? extends GrantedAuthority> authorities = user.getAuthorities();

        //User user = new User();


        return new UsernamePasswordAuthenticationToken(username, password,
                Stream.of(new SimpleGrantedAuthority("ROLE_USER")).collect(Collectors.toList()));
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }

}