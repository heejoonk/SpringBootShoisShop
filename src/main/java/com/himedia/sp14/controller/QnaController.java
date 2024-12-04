package com.himedia.sp14.controller;

import com.himedia.sp14.dto.MemberVO;
import com.himedia.sp14.dto.QnaVO;
import com.himedia.sp14.service.QnaService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
public class QnaController {

    @Autowired
    QnaService qs;

    @GetMapping("/customer")
    public String customer() {
        return "customer/intro";
    }


    @GetMapping("/qnaList")
    public ModelAndView qnaList( HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HashMap<String , Object> result = qs.getQnaList( request );
        mav.addObject("qnaList", result.get("qnaList") );
        mav.addObject("paging", result.get("paging") );
        mav.setViewName("customer/qnaList");
        return mav;
    }


    @GetMapping("/qnaView")
    public ModelAndView qnaView(@RequestParam("qseq") int qseq) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("qnaVO",  qs.getQna(qseq) );
        mav.setViewName("customer/qnaView");
        return mav;
    }

    @GetMapping("/writeQnaForm")
    public String writeQnaForm() {
        return "customer/writeQna";
    }


    @PostMapping("/writeQna")
    public ModelAndView writeQna(
            @RequestParam(value="secret", required=false, defaultValue="N" ) String secret,
            @RequestParam(value="pass", required=false, defaultValue="" ) String pass,
            @RequestParam("subject") String subject,
            @RequestParam("content") String content  ,
            HttpSession session) {
        ModelAndView mav = new ModelAndView();
        MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
        if( loginUser == null )
            mav.setViewName("member/loginForm");
        else {
            QnaVO qvo = new QnaVO();
            qvo.setUserid(loginUser.getUserid());
            qvo.setSubject(subject);
            qvo.setContent(content);
            qvo.setPass(pass);
            qvo.setSecret(secret);
            qs.insertQna(qvo);
            mav.setViewName("redirect:/qnaList");
        }
        return mav;
    }
}
