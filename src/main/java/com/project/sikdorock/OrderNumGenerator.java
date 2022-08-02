package com.project.sikdorock;

import com.project.sikdorock.service.OrderNumService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Component
@RequiredArgsConstructor
public class OrderNumGenerator {

    // 결제인 경우 ORD20220802-000001 형태의 주문번호 반환
    // 구독인 경우 SUB20220802-000001 형태의 주문번호 반환
    
    private final OrderNumService service;

    // 구독 번호 반환
    public String getSubscribeNum() {
        String num = "SUB";
        num += LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        num += "-";
        num += String.format("%06d", service.getSubSeq());
        
        return num;
    }

    // 결제 번호 반환
    public String getOrderNum() {
        String num = "ORD";
        num += LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        num += "-";
        num += String.format("%06d", service.getOrderSeq());
        
        return num;
    }

}
