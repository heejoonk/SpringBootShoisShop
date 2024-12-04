package com.himedia.sp14.dao;

import com.himedia.sp14.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminDao {

    AdminVO getAdmin(String adminid);
    int getAllCount(String product, String name, String key);
    List<ProductVO> getProductList(Paging paging, String key);
    void insertProduct(ProductVO productvo);
    void updateProduct(ProductVO productvo);
    List<ProductVO> getOrderList(Paging paging, String key);
    void orderNext(int odseq);
    List<MemberVO> getMemberList(Paging paging, String key);

    List<QnaVO> getQnaList(Paging paging, String key);

    void adminQnaReplyUpdate(int qseq, String reply);
}
