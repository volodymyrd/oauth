package com.gmail.volodymyrdotsenko.oauth.client.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Volodymyr Dotsenko on 07.07.16.
 */
@Controller
public class MainController {
    @RequestMapping("home")
    public String home() {
        return "home";
    }
}