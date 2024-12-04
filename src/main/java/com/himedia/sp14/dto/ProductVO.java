package com.himedia.sp14.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class ProductVO {
    private Integer pseq;
    @NotNull   @NotEmpty
    private String name;
    @NotNull @NotEmpty
    private String category;
    private Integer price1;
    private Integer price2;
    private Integer price3;
    @NotNull @NotEmpty
    private String content;
    @NotNull @NotEmpty
    private String image;
    private String useyn;
    private String bestyn;
    private Timestamp indate;
    @NotNull @NotEmpty
    private String savefilename;
}
