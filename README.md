# 🍱 식도락

### ✨프로젝트 개요

Spring Framework를 이용한 도시락 구독 판매 사이트

<br>

### 📆개발기간

2022.07.26 ~ 2022.08.07 (12일간)

<br>

### 🛠기술 스택

<img alt="" src ="https://img.shields.io/badge/html5-E34F26.svg?&style=flat&logo=html5&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/css3-1572B6.svg?&style=flat&logo=css3&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/JavaScript-F7DF1E.svg?&style=flat&logo=JavaScript&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/java-2F2625.svg?&style=flat&logo=coffeescript&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/oracle-F80000.svg?&style=flat&logo=oracle&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/Bootstrap-7952B3.svg?&style=flat&logo=Bootstrap&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/jquery-0769AD.svg?&style=flat&logo=jquery&logoColor=white"/> <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/>

<br>

### 🌏개발환경

<img alt="" src ="https://img.shields.io/badge/windows-0078D6.svg?&style=flat&logo=windows&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/VSCode-007ACC.svg?&style=flat&logo=Visual Studio Code&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/IntelliJ-000000.svg?&style=flat&logo=IntelliJ IDEA&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/Oracle cloud-F80000.svg?&style=flat&logo=iCloud&logoColor=white"/> <img alt="" src ="https://img.shields.io/badge/
github-181717.svg?&style=flat&logo=GitHub&logoColor=white"/>

---

### 💻API

- 주소 검색API(도로명 주소 검색)
- 아임포트 API(카카오페이 결제)
- 소셜로그인 API

### 📚라이브러리

- bootstrap - 디자인 활용
- chart.js - 막대 그래프
- AOS.js - 동적 페이지 구현

---

<br>

### 👨‍👩‍👦👩‍👧참여인원 및 주요 역할

|  이름  |              역할              |
| :----: | :----------------------------: |
| 강지윤 |         이벤트 페이지          |
| 김영석 | 메뉴표, 장바구니, 리뷰, 찜하기 |
| 김찬진 |  메인페이지, 관리자, 결제하기  |
| 서주예 |           마이페이지           |
| 안수아 |   소셜 로그인, 소셜 회원가입   |

---

<br>

### 🎨ERD

![식도락 ERD](https://user-images.githubusercontent.com/97499271/183271738-aa662cbe-4c46-4cb2-95cd-e27725bddc03.png)

<br>

---

### 📺구동 화면

- 메인페이지, 회원가입, 로그인
  ![메인페이지](https://user-images.githubusercontent.com/97499271/183271986-16f81128-f996-4726-abac-111817eb95b7.gif)

- 메뉴표, 장바구니, 리뷰 작성
  ![메뉴표](https://user-images.githubusercontent.com/97499271/183271996-aadc7107-6555-4be5-b872-1db35914a59e.gif)

- 이벤트 참여
  ![이벤트 참여](https://user-images.githubusercontent.com/97499271/183272006-d4d36236-69c9-4292-9014-720d29919b4a.gif)

- 결제하기
  ![결제하기](https://user-images.githubusercontent.com/97499271/183272013-0ae1586a-db1c-49e8-bece-295536e2e735.gif)

- 마이페이지
  ![마이페이지](https://user-images.githubusercontent.com/97499271/183272024-101d1253-8faa-415e-96ed-2dbba0225452.gif)

- 관리자
  ![관리자](https://user-images.githubusercontent.com/97499271/183272035-1acb0216-e9ec-4866-beb6-14d1d047eff3.gif)

<br>

---

### 🚨프로젝트 피드백

- 저번 프로젝트에서는 JSP/Servlet을 사용했지만 이번 프로젝트는 Spring Framework를 사용하며 데이터베이스 같은 경우 Spring ORM 중 myBatis 기술을 활용하여 sql 관리를 좀더 효울적으로 할수 있었고, Interceptor를 사용하여 매번 로그인 확인을 하던걸 Controller를 실행시키기 전에 preHandle 메소드를 실행시켜 좀 더 깔끔한 코드가 완성되었다.

- 페이징, 파일업로드 같은 공통적으로 사용하는 코드를 따로 관리할 수 있게 클래스를 만들어서 코드의 중복성을 줄이고, 재사용성을 증가시켰다.

- 아임포트 API를 활용해 비록 테스트지만 결제하는걸 직접 구현해서 활용해보는 좋은 기회였다.

- 오라클 클라우드를 사용하여 팀원간의 데이터 공유가 원활하게 진행되어 작업이 용이하였다.

- 저번 프로젝트에 이어서 GitHub를 사용하면서 형상 관리 툴을 사용하는 방법에 좀 더 능숙해졌다.
