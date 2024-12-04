package com.himedia.sp14.controller;

import com.himedia.sp14.dto.MemberVO;
import com.himedia.sp14.dto.OrderVO;
import com.himedia.sp14.dto.ProductVO;
import com.himedia.sp14.service.OrderService;
import com.himedia.sp14.service.ProductService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    OrderService os;

    @PostMapping("orderForm")
    public ModelAndView orderForm(@RequestParam("cseq") String [] cseqs ) {
        ModelAndView mav = new ModelAndView();

        HashMap<String, Object> result = os.makeCartList( cseqs );
        mav.addObject("cartList", result.get("cartList"));
        mav.addObject("totalPrice", result.get("totalPrice"));
        mav.setViewName("mypage/orderForm");

        return mav;
    }

    @Autowired
    ProductService ps;

    @PostMapping("/orderFormOne")
    public ModelAndView orderFormOne(
            @RequestParam("pseq") int pseq ,
            @RequestParam("quantity") int quantity ) {
        ModelAndView mav = new ModelAndView();
        ProductVO pvo = ps.getProduct( pseq );
        mav.addObject("product", pvo);
        mav.addObject("quantity", quantity);
        mav.addObject("totalPrice", pvo.getPrice2()*quantity);
        mav.setViewName("mypage/orderFormOne");
        return mav;
    }


    @PostMapping("/orderInsert")
    public String orderInsert(
            OrderVO ordervo, @RequestParam("cseq") String [] cseqs,
            HttpSession session     ) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        String url="";
        int oseq = 0;
        if (loginUser == null)
            url = "member/loginForm";
        else {
            ordervo.setUserid( loginUser.getUserid() );
            oseq = os.insertOrder( cseqs, ordervo );
            url = "redirect:/orderList?oseq=" + oseq;
        }
        return url;
    }

    @GetMapping("/orderList")
    public ModelAndView orderList( @RequestParam("oseq") int oseq ) {
        ModelAndView mav = new ModelAndView();
        HashMap<String , Object > result = os.orderListByOseq(oseq);
        List<OrderVO> orderList = (List<OrderVO>) result.get("orderList");
        mav.addObject("orderList", orderList);
        mav.addObject("orderDetail", orderList.get(0));
        mav.addObject("totalPrice", result.get("totalPrice"));
        mav.setViewName("mypage/orderList");
        return mav;
    }


    @PostMapping("/orderInsertOne")
    public String orderInsertOne( OrderVO ordervo, HttpSession session ) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

        String url="";
        int oseq = 0;
        if (loginUser == null)
            url = "member/loginForm";
        else {
            ordervo.setUserid( loginUser.getUserid() );

            oseq = os.insertOrderOne(  ordervo );
            url = "redirect:/orderList?oseq=" + oseq;
        }
        return url;

    }



    @GetMapping("/mypage")
    public ModelAndView mypage( HttpSession session ) {
        ModelAndView mav = new ModelAndView();
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null)
            mav.setViewName("member/login");
        else {
            mav.addObject( "finalList" , os.orderIng( loginUser.getUserid() ) );
            mav.addObject("title", "진행중인 주문 내역");
            mav.setViewName("mypage/mypage");
        }
        return mav;
    }


    @GetMapping("/orderAll")
    public ModelAndView orderAll( HttpSession session ) {
        ModelAndView mav = new ModelAndView();
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null)
            mav.setViewName("member/login");
        else {
            mav.addObject( "finalList", os.orderAll( loginUser.getUserid() ) ) ;
            mav.addObject("title", "총 주문 내역");
            mav.setViewName("mypage/mypage");
        }
        return mav;
    }


    @GetMapping("/orderDetail")
    public ModelAndView orderDetail(@RequestParam("oseq") int oseq,  HttpSession session ) {
        ModelAndView mav = new ModelAndView();

        HashMap<String, Object> result = os.orderListByOseq(oseq);
        mav.addObject("orderList",  result.get("orderList") );
        mav.addObject("orderDetail",  ((List<OrderVO>) result.get("orderList")).get(0) );
        mav.addObject("totalPrice",  result.get("totalPrice") );

        mav.setViewName("mypage/orderDetail");
        return mav;
    }


    @GetMapping("/updateResult")
    public String updateResult( @RequestParam("odseq") int odseq, @RequestParam("oseq") int oseq ) {
        os.updateResult( odseq );
        return "redirect:/orderDetail?oseq=" + oseq;
    }


    @GetMapping("/updateMemberForm")
    public ModelAndView updateMemberForm( HttpSession session ) {
        ModelAndView mav = new ModelAndView();
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        mav.addObject("dto", loginUser);
        mav.setViewName("mypage/updateMember");
        return mav;
    }


    @PostMapping("updateMember")
    public String updateMember(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result ,
        @RequestParam(value="pwdCheck", required = false) String pwdCheck,
        HttpSession session, Model model  ) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        String url = "mypage/updateMember";
        if( !loginUser.getProvider().equals("kakao") &&  result.getFieldError("pwd") != null )
            model.addAttribute("message", "패스워드를 입력하세요");
        else if( !loginUser.getProvider().equals("kakao") &&  !membervo.getPwd().equals(pwdCheck) )
            model.addAttribute("message", "패스워드 확인이 일치하지 않습니다");
        else if( result.getFieldError("name") != null )
            model.addAttribute("message", "이름을 입력하세요");
        else if( result.getFieldError("phone") != null )
            model.addAttribute("message", "전화번호를 입력하세요");
        else if( result.getFieldError("email") != null )
            model.addAttribute("message", "이메일을 입력하세요");
        else{
            os.updateMember( membervo );
            session.setAttribute("loginUser", membervo);
            url = "redirect:/";
        }
        return url;
    }



    @GetMapping("/deleteMember")
    public String deleteMember( HttpSession session, Model model  ) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        os.deleteMember( loginUser.getUserid() );
        model.addAttribute("message", "회원탈퇴가 정상적으로 실행되었습니다");
        return "redirect:/loginForm";
    }
}
