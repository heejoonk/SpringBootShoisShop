package com.himedia.sp14.dao;

import com.himedia.sp14.dto.ProductVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IProductDao {

    List<ProductVO> selectNewList();
    List<ProductVO> selectBestList();
    List<ProductVO> selectCategory(int category);
    ProductVO getProduct(int pseq);
}
