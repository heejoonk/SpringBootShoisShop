package com.himedia.sp14.service;

import com.himedia.sp14.dao.ICartDao;
import com.himedia.sp14.dao.IOrderDao;
import com.himedia.sp14.dto.CartVO;
import com.himedia.sp14.dto.MemberVO;
import com.himedia.sp14.dto.OrderVO;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    IOrderDao odao;

    @Autowired
    ICartDao cdao;

    public HashMap<String, Object> makeCartList( String [] cseqs ) {
        HashMap<String, Object> result = new HashMap<>();
        ArrayList<CartVO> list = new ArrayList<>();
        int totalPrice = 0;
        for( String cseq : cseqs){
            CartVO cvo = odao.getCart( Integer.parseInt(cseq) );
            totalPrice += (cvo.getPrice2()*cvo.getQuantity());
            list.add(cvo);
        }
        result.put("totalPrice", totalPrice);
        result.put("cartList", list);
        return result;
    }


    @Transactional(rollbackFor = {RuntimeException.class, Error.class})
    public int insertOrder(String[] cseqs, OrderVO ovo) {
        int oseq = 0;

        // 0. Orders 테이블에 레코드 추가
        odao.insertOrders( ovo );

        // 1. 방금 추가한 레코드의 oseq 조회
        oseq = odao.lookupMaxOseq( ovo.getUserid() );

        // 2. cseq 들로 카트조회  &  order_detail 추가  & 카트 삭제
        for( String cseq : cseqs){
            CartVO cvo = odao.getCart( Integer.parseInt(cseq) );
            odao.insertOrderDetail( oseq, cvo );
            cdao.deleteCart( Integer.parseInt(cseq) );
        }

        // 4. oseq 주분번호 리턴
        return oseq;
    }

    public HashMap<String, Object> orderListByOseq(int oseq) {
        HashMap<String, Object> result = new HashMap<>();
        List<OrderVO> list = odao.orderListByOseq(oseq);
        result.put("orderList", list);
        int totalPrice = 0;
        for( OrderVO ovo : list)
            totalPrice += (ovo.getQuantity() * ovo.getPrice2() );
        result.put("totalPrice", totalPrice);
        return result;
    }

    @Transactional(rollbackFor = {RuntimeException.class, Error.class})
    public int insertOrderOne(OrderVO ordervo) {

        int oseq = 0;

        // 0. Orders 테이블에 레코드 추가
        odao.insertOrders( ordervo );

        // 1. 방금 추가한 레코드의 oseq 조회
        oseq = odao.lookupMaxOseq( ordervo.getUserid() );

        // 2. order_detail 추가
        odao.insertOrderDetailOne( oseq, ordervo.getPseq(), ordervo.getQuantity() );

        // 4. oseq 주분번호 리턴
        return oseq;

    }

    public List<OrderVO> orderIng(String userid) {
        // 최종 mypage.jsp 에 전달될 리스트
        ArrayList<OrderVO> finalList = new ArrayList<OrderVO>();

        // 아이디로 주문 번호(oseq)들을 조회
        List<Integer> oseqList = odao.getOseqListIng( userid );
        System.out.println( oseqList.size() );
        // 조회된 주문번호별로  최종 리스트 구성
        for( Integer oseq : oseqList){
            List<OrderVO> list = odao.orderListByOseq( oseq );
            OrderVO temp = list.get(0);
            temp.setPname( temp.getPname() + " 포함 " + list.size() + "건" );
            int totalPrice = 0;

            int cnt = 0;
            for( OrderVO ovo : list) {
                totalPrice += ovo.getPrice2() * ovo.getQuantity();
                if( ovo.getResult() == 4 ) cnt++;
            }
            if( list.size() == cnt ) temp.setResult(4);
            else temp.setResult(1);

            temp.setPrice2(totalPrice);
            finalList.add(temp);
        }
        return finalList;
    }

    public List<OrderVO> orderAll(@NotEmpty String userid) {
        ArrayList<OrderVO> finalList = new ArrayList<OrderVO>();
        List<Integer> oseqList = odao.getOseqListAll( userid );
        System.out.println( oseqList.size() );
        for( Integer oseq : oseqList){
            List<OrderVO> list = odao.orderListByOseq( oseq );
            OrderVO temp = list.get(0);
            temp.setPname( temp.getPname() + " 포함 " + list.size() + "건" );
            int totalPrice = 0;

            int cnt = 0;
            for( OrderVO ovo : list) {
                totalPrice += ovo.getPrice2() * ovo.getQuantity();
                if( ovo.getResult() == 4 ) cnt++;
            }
            if( list.size() == cnt ) temp.setResult(4);
            else temp.setResult(1);

            temp.setPrice2(totalPrice);
            finalList.add(temp);
        }
        return finalList;
    }

    public void updateResult(int odseq) {
        odao.updateResult(odseq);
    }

    public void updateMember(MemberVO membervo) {
        odao.updateMember( membervo );
    }

    public void deleteMember(String userid) {
        odao.deleteMember(userid);
    }
}
