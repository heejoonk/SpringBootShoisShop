package com.himedia.sp14.service;

import com.himedia.sp14.dao.IAdminDao;
import com.himedia.sp14.dto.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminService {

    @Autowired
    IAdminDao adao;

    public AdminVO getAdmin(String adminid) {
        return adao.getAdmin( adminid );
    }

    public HashMap<String, Object> adminProductList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        if( request.getParameter("first") != null ) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }
        int page = 1;
        if( request.getParameter("page") != null ) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        }else if( session.getAttribute("page") != null ) {
            page = Integer.parseInt((String)session.getAttribute("page"));
        }

        String key="";
        if( request.getParameter("key") != null ) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        }else if( session.getAttribute("key") != null ) {
            key = (String)session.getAttribute("key");
        }

        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(10);
        int count = adao.getAllCount( "product", "name", key );
        System.out.println( count );
        paging.setTotalCount(count);
        paging.calPaging();

        List<ProductVO> list = adao.getProductList( paging , key);
        result.put("productList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }

    public void insertProduct(ProductVO productvo) {
        adao.insertProduct( productvo );
    }

    public void updateUpdate(ProductVO productvo) {
        adao.updateProduct( productvo );
    }

    public HashMap<String, Object> adminOrderList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        if( request.getParameter("first") != null ) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }
        int page = 1;
        if( request.getParameter("page") != null ) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        }else if( session.getAttribute("page") != null ) {
            page = Integer.parseInt((String)session.getAttribute("page"));
        }
        String key="";
        if( request.getParameter("key") != null ) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        }else if( session.getAttribute("key") != null ) {
            key = (String)session.getAttribute("key");
        }
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(10);
        int count = adao.getAllCount( "order_view", "pname", key );
        System.out.println( count );
        paging.setTotalCount(count);
        paging.calPaging();

        List<ProductVO> list = adao.getOrderList( paging , key);
        result.put("orderList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }

    public void orderNext(int odseq ) {
        adao.orderNext( odseq );
    }

    public HashMap<String, Object> adminMemberList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        if( request.getParameter("first") != null ) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }
        int page = 1;
        if( request.getParameter("page") != null ) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        }else if( session.getAttribute("page") != null ) {
            page = Integer.parseInt((String)session.getAttribute("page"));
        }
        String key="";
        if( request.getParameter("key") != null ) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        }else if( session.getAttribute("key") != null ) {
            key = (String)session.getAttribute("key");
        }
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(10);
        int count = adao.getAllCount( "member", "name", key );
        System.out.println( count );
        paging.setTotalCount(count);
        paging.calPaging();

        List<MemberVO> list = adao.getMemberList( paging , key);
        result.put("memberList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }

    public HashMap<String, Object> adminQnaList(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        if( request.getParameter("first") != null ) {
            session.removeAttribute("page");
            session.removeAttribute("key");
        }
        int page = 1;
        if( request.getParameter("page") != null ) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        }else if( session.getAttribute("page") != null ) {
            page = Integer.parseInt((String)session.getAttribute("page"));
        }
        String key="";
        if( request.getParameter("key") != null ) {
            key = request.getParameter("key");
            session.setAttribute("key", key);
        }else if( session.getAttribute("key") != null ) {
            key = (String)session.getAttribute("key");
        }
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(10);
        paging.setDisplayRow(10);
        int count = adao.getAllCount( "qna", "subject", key );
        System.out.println( count );
        paging.setTotalCount(count);
        paging.calPaging();

        List<QnaVO> list = adao.getQnaList( paging , key);
        result.put("qnaList", list);
        result.put("paging", paging);
        result.put("key", key);

        return result;
    }

    public void adminQnaReplyUpdate(int qseq, String reply) {
        adao.adminQnaReplyUpdate( qseq, reply );
    }
}
