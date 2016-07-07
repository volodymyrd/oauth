package com.gmail.volodymyrdotsenko.oauth.server.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Volodymyr Dotsenko on 7/7/16.
 */
@Controller
public class DataController {

    @RequestMapping("info")
    @ResponseBody
    public String info() {
        return "Hello from your company!!!";
    }
}