package com.himedia.sp14.controller;

import com.himedia.sp14.dto.AdminVO;
import com.himedia.sp14.dto.ProductVO;
import com.himedia.sp14.service.AdminService;
import com.himedia.sp14.service.ProductService;
import com.himedia.sp14.service.QnaService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;

@Controller
public class AdminController {

    @Autowired
    AdminService as;

    @GetMapping("/admin")
    public String admin(Model model) {
        return "admin/adminLogin";
    }

    @PostMapping("/adminLogin")
    public String adminLogin(@ModelAttribute("dto") @Valid AdminVO adminvo, BindingResult result, Model model, HttpSession session) {
        String url = "admin/adminLogin";
        if (result.getFieldError("adminid") != null)
            model.addAttribute("message", "아이디를 입력하세요");
        else if (result.getFieldError("pwd") != null)
            model.addAttribute("message", "패스워드를 입력하세요");
        else {
            AdminVO avo = as.getAdmin(adminvo.getAdminid());
            if ((avo == null) || (!adminvo.getPwd().equals(avo.getPwd())))
                model.addAttribute("message", "아이디 패스워드를 확인하세요");
            else {
                session.setAttribute("adminUser", avo);
                url = "redirect:/adminProductList";
            }
        }
        return url;
    }


    @GetMapping("/adminProductList")
    public ModelAndView adminProductList(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = as.adminProductList(request);

        mav.addObject("productList", result.get("productList") );
        mav.addObject( "paging", result.get("paging") );
        mav.addObject( "key", result.get("key") );

        mav.setViewName("admin/product/productList");
        return mav;
    }



    @GetMapping("/adminProductWriteForm")
    public String adminProductWriteForm(Model model) {
        String categoryList[] = { "Heels", "Boots", "Sandals", "Snickers", "Slipers" };
        model.addAttribute("categoryList", categoryList);
        return "admin/product/productWrite";
    }


    @Autowired
    ServletContext context;

    @PostMapping("/fileup")
    @ResponseBody
    public HashMap<String, Object> fileup(    @RequestParam("fileimage")MultipartFile file        ){
        String path = context.getRealPath("/product_images");

        Calendar today = Calendar.getInstance();
        long t = today.getTimeInMillis();
        String filename = file.getOriginalFilename();
        String fn1 = filename.substring(0, filename.indexOf(".") );  // 파일이름과 확장자 분리
        String fn2 = filename.substring(filename.indexOf(".") );
        String savefilename = fn1 + t + fn2;
        String uploadPath = path + "/" + savefilename;

        HashMap<String, Object> result = new HashMap<String, Object>();
        try {
                file.transferTo( new File(uploadPath) );  // 파일의 업로드 + 저장
                result.put("image", filename );
                result.put("savefilename", savefilename );
        } catch (IllegalStateException e) {         e.printStackTrace();
        } catch (IOException e) {       e.printStackTrace();
        }
        return result;
    }



    @PostMapping("/adminProductWrite")
    public String adminProductWrite(@ModelAttribute("dto") @Valid ProductVO productvo, BindingResult result, Model model, HttpSession session) {
        String url = "admin/product/productWrite";
        String categoryList[] = { "Heels", "Boots", "Sandals", "Snickers", "Slipers"};
        model.addAttribute("categoryList", categoryList);

        if( result.getFieldError("name") != null )
            model.addAttribute("message", "이름을 입력하세요");
        else if( result.getFieldError("content") != null )
            model.addAttribute("message", "내용을 입력하세요");
        else if( (result.getFieldError("category") != null) )
            model.addAttribute("message", "상품종류를 선택하세요");
        else if( (result.getFieldError("image") != null) || (result.getFieldError("savefilename") != null)  )
            model.addAttribute("message", "파일을 선택하세요");

        else if( productvo.getPrice1() == null || productvo.getPrice1() <= 0)
            model.addAttribute("message", "원가를 입력하세요");
        else if( productvo.getPrice2() == null || productvo.getPrice2() <= 0)
            model.addAttribute("message", "판매가를 입력하세요");
        else if( productvo.getPrice3() == null || productvo.getPrice3() <= 0)
            model.addAttribute("message", "원가가 판매가보다 크거가 같을수 없습니다");

        else{
            as.insertProduct(productvo);
            url = "redirect:/adminProductList";
        }
        return url;
    }

    @Autowired
    ProductService ps;

    @GetMapping("/adminProductDetail")
    public ModelAndView adminProductDetail( @RequestParam("pseq") int pseq ) {
        ModelAndView mav = new ModelAndView();

        String categoryList[] = { "0", "Heels", "Boots", "Sandals", "Snickers", "Slipers" };

        mav.addObject("productVO", ps.getProduct(pseq));
        mav.addObject("category", categoryList[  Integer.parseInt( ps.getProduct(pseq).getCategory() ) ] );

        mav.setViewName("admin/product/productDetail");
        return mav;
    }




    @GetMapping("/adminProductUpdateForm")
    public ModelAndView adminProductUpdateForm( @RequestParam("pseq") int pseq ) {
        ModelAndView mav = new ModelAndView();

        mav.addObject("dto", ps.getProduct(pseq));

        String categoryList[] = { "Heels", "Boots", "Sandals", "Snickers", "Slipers"};
        mav.addObject("categoryList", categoryList);

        mav.setViewName("admin/product/productUpdate");
        return mav;
    }


    @PostMapping("/adminProductUpdate")
    public String adminProductUpdate( @ModelAttribute("dto") @Valid ProductVO productvo, BindingResult result, Model model, HttpSession session) {
        String url = "admin/product/productUpdate";
        String categoryList[] = { "Heels", "Boots", "Sandals", "Snickers", "Slipers",  "Sale" };
        model.addAttribute("categoryList", categoryList);
        if( result.getFieldError("name") != null)
            model.addAttribute("message", "상품명을 입력하세요");
        else if( result.getFieldError("category") != null)
            model.addAttribute("message", "상품종류를 선택하세요");
        else if( productvo.getPrice1() == null || productvo.getPrice1() <= 0)
            model.addAttribute("message", "원가를 입력하세요");
        else if( productvo.getPrice2() == null || productvo.getPrice2() <= 0)
            model.addAttribute("message", "판매가를 입력하세요");
        else if( productvo.getPrice3() == null || productvo.getPrice3() <= 0)
            model.addAttribute("message", "원가가 판매가보다 크거가 같을수 없습니다");
        else if( result.getFieldError("content") != null)
            model.addAttribute("message", "상품설명을 입력하세요");
        else if( result.getFieldError("image") != null  ||  result.getFieldError("savefilename") != null)
            model.addAttribute("message", "상품이미지를 선택하세요");
        else{
            as.updateUpdate(productvo);
            url = "redirect:/adminProductDetail?pseq=" + productvo.getPseq();
        }
        return url;
    }


    @GetMapping("/adminOrderList")
    public ModelAndView adminOrderList( HttpServletRequest request ) {
        HashMap<String, Object> result = as.adminOrderList( request );
        ModelAndView mav = new ModelAndView();
        mav.addObject("orderList", result.get("orderList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("key", result.get("key"));
        mav.setViewName( "admin/order/orderList" );
        return mav;
    }


    @GetMapping("/adminOrderNext")
    public String adminOrderNext( @RequestParam("result") String [] odseqs ) {
        for(String odseq :  odseqs ) {
            as.orderNext( Integer.parseInt(odseq) );
        }
        return "redirect:/adminOrderList";
    }




    @GetMapping("/adminMemberList")
    public ModelAndView adminMemberList( HttpServletRequest request ) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = as.adminMemberList( request );
        mav.addObject("memberList", result.get("memberList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("key", result.get("key"));
        mav.setViewName( "admin/member/memberList" );
        return mav;
    }


    @GetMapping("/adminQnaList")
    public ModelAndView adminQnaList( HttpServletRequest request ) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = as.adminQnaList( request );
        mav.addObject("qnaList", result.get("qnaList"));
        mav.addObject("paging", result.get("paging"));
        mav.addObject("key", result.get("key"));
        mav.setViewName( "admin/qna/qnaList" );
        return mav;
    }


    @Autowired
    QnaService qs;

    @GetMapping("/adminQnaDetail")
    public ModelAndView adminQnaDetail( @RequestParam("qseq") int qseq, HttpServletRequest request ) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("qnaVO", qs.getQna( qseq ));
        mav.setViewName("admin/qna/qnaView");
        return mav;
    }


    @PostMapping("/adminQnaReplyUpdate")
    public String adminQnaReplyUpdate(
            @RequestParam("qseq") int qseq,
            @RequestParam("reply") String reply,
            HttpServletRequest request ) {

        as.adminQnaReplyUpdate( qseq, reply );
        return "redirect:/adminQnaDetail?qseq=" + qseq;
    }

    @GetMapping("/adminLogout")
    public String adminLogout( HttpSession session ) {
        session.removeAttribute("adminUser");
        return "redirect:/admin";
    }

}
