package com.himedia.sp14.controller;

import com.himedia.sp14.dto.CartVO;
import com.himedia.sp14.dto.MemberVO;
import com.himedia.sp14.service.CartService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class CartController {

    @Autowired
    CartService cs;

    @GetMapping("/cartList")
    public ModelAndView cartList(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if( loginUser == null )
            mav.setViewName("member/loginForm");
        else{
            HashMap<String, Object> result = cs.selectCart( loginUser.getUserid() );

            mav.addObject("cartList", result.get("cartList") );
            mav.addObject("totalPrice", result.get("totalPrice"));

            mav.setViewName("mypage/cartList");
        }
        return mav;
    }


    @PostMapping("/cartInsert")
    public ModelAndView cartInsert( @RequestParam("pseq") int pseq, @RequestParam("quantity") int quantity, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if( loginUser == null )
            mav.setViewName("member/loginForm");
        else{
            CartVO cvo = new CartVO();
            cvo.setPseq(pseq);
            cvo.setQuantity(quantity);
            cvo.setUserid(loginUser.getUserid());
            cs.insertCart( cvo );
            mav.addObject("pseq", pseq);
            mav.setViewName("mypage/cartInsertComplete");
        }
        return mav;
    }

    @PostMapping("/cartDelete")
    public String cartDelete( @RequestParam("cseq") String [] cseqs) {
            cs.deleteCart( cseqs );
            return "redirect:/cartList";
    }
}
