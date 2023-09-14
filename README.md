# project - EZENAT(이제낫) 쇼핑몰 사이트

  
![image](https://github.com/yaejiii/project/assets/138549230/7a991b6a-de58-4516-b102-d165acedf4b9)

- EZENAT(이제낫) 쇼핑몰 사이트는 국비학원에서 진행한 파이널 팀프로젝트입니다.
  
- 스프링 프레임워크를 이용하여 제작한 쇼핑몰 사이트입니다. 크게 관리자 페이지, 회원 페이지로 구성되어 있습니다.


# 개요
● 총 개발 기간 : 1개월 2주

    - 설계 및 분석 : 2023/05/19 - 2023/05/25 (ProtoType , UML 작성 , DB 설계)
    - 기능 구현 : 2023/05/25 - 2023/07/27
    
● 개발 인원

    - 5명

# 개발 환경, 툴
● OS

    - window10
    
● Kit

    - JDK
    
● Tool

    - eclipse
    - spring
    - oracle
    - S/W : oracle sqldeveloper

# 활용 라이브러리, API
● Library

    - MyBatis
    - jQuery
    - Json
    - Ajax
    - BootStrap/CSS
    
● Open Source

    - Naver developers (login)
    - kakao developers (login,address,map)

# 담당 기능
● 회원 소셜 로그인 1

    - 기능 : 카카오 로그인 API 활용
    - 설명 : 회원 카카오 계정으로 로그인, 로그아웃, 회원가입이 가능합니다. 카카오 로그인 API를 활용하여 로그인 기능을 구현하였습니다.
  
● 회원 소셜 로그인 2
  
    - 기능 : 네이버 로그인 API 활용
    - 설명 : 회원 네이버 계정으로 로그인이 가능합니다. 네이버 로그인 API를 활용하여 로그인 기능을 구현하였습니다.

● 관리자 재고 관리

    - 기능 : 온오프라인 상품 재고 수정, 상품명&코드명으로 검색하여 상품 조회
    - 설명 : 관리자 페이지에서 온라인 재고와 오프라인 매장 재고 목록을 조회할 수 있으며, 온오프라인 총 재고 수량과 지점별 재고 수량 수정이 가능합니다.
    
![image](https://github.com/yaejiii/project/assets/138549230/a9cd4a51-e073-4903-8d3f-fcb8de3a6c5b)

● 관리자 공지사항 관리

    - 기능 : 공지사항 등록, 목록, 수정, 삭제
    - 설명 : 관리자 페이지에서 공지사항을 등록하면 회원 공지사항 페이지에 작성일과 함께 등록이 되며, 관리자 페이지에서는 작성자 ip까지 보입니다. CKEditer를 이용하여 구현했습니다.

![image](https://github.com/yaejiii/project/assets/138549230/0f824c19-c824-4977-8e0d-5393fc12d977)


![image](https://github.com/yaejiii/project/assets/138549230/122ca611-7559-4db0-bc57-6c1a34d135c4)


# 회고/개선점
    - 초기 DB 구축의 완성도가 높지 않아 프로젝트를 하는 동안 지속적인 수정

    - 쿼리문 가독성 개선

    - Controller와 Service의 역할에 대한 고찰 필요

    - 클래스, 메소드, 함수명 정리 필요
