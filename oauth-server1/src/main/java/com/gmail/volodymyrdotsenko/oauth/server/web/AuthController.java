package com.gmail.volodymyrdotsenko.oauth.server.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Volodymyr Dotsenko on 06.07.16.
 */
@Controller
public class AuthController {

    @RequestMapping("home")
    public String home() {
        return "home";
    }

    @RequestMapping("login")
    public String login() {
        return "login";
    }

    @RequestMapping("logout")
    public String logout() {
        return "logout";
    }

    @RequestMapping("index")
    public String index() {
        return "index";
    }

    @RequestMapping("request_token_authorized")
    public String request_token_authorized() {
        return "request_token_authorized";
    }
}