package com.project.sikdorock.dto;

import lombok.Data;

@Data
public class UserOrderDTO {
    private String oseq; //주문번호
    private String id;
    private String regdate;
    private String count;
    private String menuname;
    private String seq;
}
