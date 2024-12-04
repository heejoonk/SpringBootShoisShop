package com.himedia.sp14.service;

import com.himedia.sp14.dao.ICartDao;
import com.himedia.sp14.dto.CartVO;
import jakarta.validation.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CartService {

    @Autowired
    ICartDao cdao;

    public HashMap<String , Object> selectCart(String userid) {
        HashMap<String , Object> result = new HashMap<>();
        List<CartVO> list = cdao.selectCart(userid);
        int totalPrice = 0;
        for( CartVO cvo : list){
            totalPrice += (cvo.getPrice2()*cvo.getQuantity());
        }
        result.put("cartList", list);
        result.put("totalPrice", totalPrice);
        return result;
    }

    public void insertCart(CartVO cvo) {
        cdao.insertCart(cvo);
    }

    public void deleteCart(String[] cseqs) {

        for( String cseq : cseqs )
             cdao.deleteCart( Integer.parseInt(cseq) );

    }
}
