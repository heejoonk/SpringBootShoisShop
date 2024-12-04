package com.himedia.sp14.dao;

import com.himedia.sp14.dto.Paging;
import com.himedia.sp14.dto.QnaVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IQnaDao {

    List<QnaVO> getQnaList( Paging paging);
    int getAllCount();
    QnaVO getQna(int qseq);
    void insertQna(QnaVO qvo);
}