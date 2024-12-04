package com.himedia.sp14.service;

import com.himedia.sp14.dao.IMemberDao;
import com.himedia.sp14.dto.MemberVO;
import jakarta.validation.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    IMemberDao mdao;

    public MemberVO getMember(String userid) {
        return mdao.getMember( userid );
    }

    public void insertMember(MemberVO mvo) {
        mdao.insertMember( mvo );
    }
}
