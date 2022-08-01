package com.project.sikdorock.dto;

import lombok.Data;

@Data
public class Paging {
    private int page;       // 페이지 번호
    private int fetch; // 몇개 가져올지
    private int offset;     // 시작번호
    private int totalCount; // 총 갯수
    private int totalPage;  // 총 페이지
    private int startPage;  // 시작 페이지
    private int endPage;    // 종료 페이지
    private int block = 10; // 페이지 블록

    public Paging(int page, int totalCount, int fetch) {
        this.fetch = fetch;
        this.page = page;
        this.offset = (this.page - 1) * fetch + 1;
        this.totalCount = totalCount;
        this.totalPage = this.totalCount % this.fetch == 0 ? this.totalCount / this.fetch : (this.totalCount / this.fetch) + 1;
        this.endPage = Math.min((this.page / block + 1) * block, totalPage);
        this.startPage = this.page / block + 1;
    }


}
