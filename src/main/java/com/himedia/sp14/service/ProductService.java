package com.himedia.sp14.service;

import com.himedia.sp14.dao.IProductDao;
import com.himedia.sp14.dto.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ProductService {

    @Autowired
    IProductDao pdao;

    public HashMap<String, Object> selectNewBestList() {
        HashMap<String, Object> result = new HashMap<>();

        List<ProductVO> newList = pdao.selectNewList();
        List<ProductVO> bestList = pdao.selectBestList();
        result.put("newList", newList);
        result.put("bestList", bestList);
        return result;
    }

    public List<ProductVO> selectCategory(int category) {
        return pdao.selectCategory(category);
    }

    public ProductVO getProduct(int pseq) {
        return pdao.getProduct( pseq);
    }
}
