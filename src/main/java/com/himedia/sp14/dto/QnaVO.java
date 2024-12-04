package com.himedia.sp14.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class QnaVO {
    private Integer qseq;
    private String secret;
    private String pass;
    @NotEmpty
    private String subject;
    @NotEmpty
    private String content;
    private String reply;
    @NotEmpty
    private String userid;
    private Timestamp indate;

}
