package com.himedia.sp14.dao;

import com.himedia.sp14.dto.CartVO;
import jakarta.validation.constraints.NotEmpty;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ICartDao {

    List<CartVO> selectCart(String userid);
    void insertCart(CartVO cvo);
    void deleteCart(int i);
}
