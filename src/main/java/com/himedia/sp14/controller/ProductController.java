package com.himedia.sp14.controller;

import com.himedia.sp14.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class ProductController {

    @Autowired
    ProductService ps;

    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();

        HashMap<String, Object> result = ps.selectNewBestList();

        mav.addObject("newList", result.get("newList") );
        mav.addObject( "bestList", result.get("bestList") );

        mav.setViewName("index");
        return mav;
    }



    @GetMapping("/category")
    public ModelAndView category(@RequestParam("category") int category ) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("categoryProduct", ps.selectCategory( category ) );
        mav.setViewName("product/categoryProduct");
        return mav;
    }



    @GetMapping("/productDetail")
    public ModelAndView productDetail(@RequestParam("pseq") int pseq) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("product", ps.getProduct(pseq) );
        mav.setViewName("product/productDetail");
        return mav;
    }

}
