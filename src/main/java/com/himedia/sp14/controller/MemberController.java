package com.himedia.sp14.controller;

import com.google.gson.Gson;
import com.himedia.sp14.dto.KakaoProfile;
import com.himedia.sp14.dto.MemberVO;
import com.himedia.sp14.dto.OAuthToken;
import com.himedia.sp14.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.lang.reflect.Member;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

@Controller
public class MemberController {

    @Autowired
    MemberService ms;

    @GetMapping("/loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result,
                        HttpServletRequest request,  Model model) {
        String url = "member/loginForm";
        if (result.getFieldError("userid")!=null)
            model.addAttribute("message", "아이디를 입력하세요");
        //else if( membervo.getPwd() == null || membervo.getPwd().equals("") )
        else if(  result.getFieldError("pwd")!=null )
            model.addAttribute("message", "패스워드를 입력하세요");
        else{
            MemberVO mvo = ms.getMember( membervo.getUserid() );
            if( mvo == null )
                model.addAttribute("message", "아이디 비번을 확인하세요");
            else if( !mvo.getPwd().equals(membervo.getPwd() )  )
                model.addAttribute("message", "아이디 비번을 확인하세요");
            else if( mvo.getPwd().equals(membervo.getPwd() ) ){
                HttpSession session = request.getSession();
                session.setAttribute("loginUser", mvo);
                url = "redirect:/";
            }
        }
        return url;
    }


    @GetMapping("/logout")
    public String logout( HttpSession session ) {
        session.removeAttribute("loginUser");
        return "redirect:/";
    }



//    @GetMapping("/kakaostart")
//    public @ResponseBody String kakaostart() {
//        String a = "<script type='text/javascript'>"
//                + "location.href='https://kauth.kakao.com/oauth/authorize?"
//                + "client_id=f67ebc2de23039bbce25c7d2583abd81"
//                + "&redirect_uri=http://localhost:8070/kakaoLogin"
//                + "&response_type=code'"
//                + "</script>";
//        return a;
//    }


    @GetMapping("/kakaoLogin")
    public String login( HttpServletRequest request  ) throws IOException {
        String code = request.getParameter("code");

        String endpoint="https://kauth.kakao.com/oauth/token";
        URL url =new URL(endpoint);
        String bodyData="grant_type=authorization_code";
        bodyData += "&client_id=f67ebc2de23039bbce25c7d2583abd81";
        bodyData += "&redirect_uri=http://localhost:8070/kakaoLogin";
        bodyData += "&code="+code;

        HttpURLConnection conn=(HttpURLConnection)url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        conn.setDoOutput(true);

        BufferedWriter bw=new BufferedWriter(
                new OutputStreamWriter(conn.getOutputStream(),"UTF-8")
        );
        bw.write(bodyData);
        bw.flush();
        BufferedReader br = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), "UTF-8")
        );

        String input="";
        StringBuilder sb=new StringBuilder();
        while((input=br.readLine())!=null){
            sb.append(input);
            System.out.println(input);
        }

        Gson gson=new Gson();
        OAuthToken oAuthToken=gson.fromJson(sb.toString(), OAuthToken.class);

        endpoint="https://kapi.kakao.com/v2/user/me";
        url =new URL(endpoint);
        conn=(HttpsURLConnection)url.openConnection();

        conn.setRequestProperty("Authorization", "Bearer "+oAuthToken.getAccess_token());
        conn.setDoOutput(true);

        br=new BufferedReader(
                new InputStreamReader(conn.getInputStream(),"UTF-8")
        );
        input="";
        sb=new StringBuilder();
        while((input=br.readLine())!=null) {
            sb.append(input);
            System.out.println(input);
        }

        gson=new Gson();
        KakaoProfile kakaoProfile=gson.fromJson(sb.toString(), KakaoProfile.class);

        System.out.println(kakaoProfile.getId());
        KakaoProfile.KakaoAccount ac = kakaoProfile.getAccount();
        System.out.println( ac.getEmail() );
        KakaoProfile.KakaoAccount.Profile pf = ac.getProfile();
        System.out.println( pf.getNickname() );

        MemberVO mvo = ms.getMember( kakaoProfile.getId() );
        if( mvo == null){
            mvo = new MemberVO();
            mvo.setUserid( kakaoProfile.getId() );
            mvo.setEmail( ac.getEmail() );
            // mvo.setEmail( "kakao" );
            mvo.setName( pf.getNickname() );
            mvo.setProvider("kakao");

            ms.insertMember( mvo );
        }
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", mvo);
        return "redirect:/";

    }



    @GetMapping("/contract")
    public String contract(Model model) {
        return "member/contract";
    }

    @PostMapping("/joinForm")
    public String joinForm(Model model) {
        return "member/joinForm";
    }


    @PostMapping("/idcheck")
    @ResponseBody  // 현재  response 가 있는 페이지로 이동
    public HashMap<String, Object> idcheck(@RequestParam("userid") String userid) {
        MemberVO mvo = ms.getMember(userid);
        HashMap<String, Object> result = new HashMap<>();
        if( mvo == null ){
            result.put("idmessage", 1);
            result.put("userid", userid);
        }else{
            result.put("idmessage", -1);
        }
        return result;
    }


    @PostMapping("/join")
    public String join(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, Model model, @RequestParam(value="reid", required = false) String reid, @RequestParam(value="pwdCheck", required = false) String pwdCheck ) {
        String url = "member/joinForm";
        model.addAttribute("reid", reid);
        if( result.getFieldError("userid")!=null)
            model.addAttribute("validmsg", "아이디를 입력하세요");
        else if( result.getFieldError("pwd")!=null)
            model.addAttribute("validmsg", "패스워드를 입력하세요");
        else if( result.getFieldError("name")!=null)
            model.addAttribute("validmsg", "이름을 입력하세요");
        else if( result.getFieldError("email")!=null)
            model.addAttribute("validmsg", "이메일을 입력하세요");
        else if( result.getFieldError("phone")!=null)
            model.addAttribute("validmsg", "전화번호를 입력하세요");
        else if( !membervo.getUserid().equals(reid) )
            model.addAttribute("validmsg", "아이디 중복검사를 실행하세요");
        else if( !membervo.getPwd().equals(pwdCheck) )
            model.addAttribute("validmsg", "비밀번호 확인이 일치하지 않습니다");
        else{
            url = "member/loginForm";
            model.addAttribute("message", "회원가입이 완료되었습니다. 로그인하세요");
            membervo.setProvider("1");
            ms.insertMember( membervo );
        }
        return url;
    }



}













