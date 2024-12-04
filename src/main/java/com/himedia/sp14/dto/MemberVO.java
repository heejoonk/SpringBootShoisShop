package com.himedia.sp14.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class MemberVO {
    @NotEmpty
    private String userid;
    @NotEmpty
    private String pwd;
    @NotEmpty
    private String name;
    @NotEmpty
    private String email;
    @NotEmpty
    private String phone;
    private String zip_num;
    private String address1;
    private String address2;
    private String address3;
    private Timestamp indate;
    private String provider;
}
