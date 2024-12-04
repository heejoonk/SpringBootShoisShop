package com.himedia.sp14.dao;

import com.himedia.sp14.dto.CartVO;
import com.himedia.sp14.dto.MemberVO;
import com.himedia.sp14.dto.OrderVO;
import jakarta.validation.constraints.NotEmpty;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IOrderDao {

    CartVO getCart(int i);
    void insertOrders(OrderVO ovo);
    int lookupMaxOseq(String userid);
    void insertOrderDetail(int oseq, CartVO cvo);
    List<OrderVO> orderListByOseq(int oseq);
    void insertOrderDetailOne(int oseq, int pseq, int quantity);
    List<Integer> getOseqListIng(String userid);
    List<Integer> getOseqListAll(String userid);
    void updateResult(int odseq);

    void updateMember(MemberVO membervo);

    void deleteMember(String userid);
}
