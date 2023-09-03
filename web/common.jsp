<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!-- 메타포, 오픈그래프, 파비콘, 폰트 등 각 종 자원 로딩 -->

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Author" content="BUDDY교육 콘텐츠 제작팀">
<meta http-equiv="Publisher" content="BUDDY교육 이소윤">
<meta http-equiv="Copyright" content="copyright@buddy.co.kr">
<title>BUDDY</title>

<!-- 검색엔진 최적화(SEO) -->
<meta name="Subject" content="BUDDY, BUDDY교육센터">
<meta name="Keywords" content="BUDDY, BUDDY IT, 교육 교재, 교과서, 스마트 교육">
<meta name="Description" content="BUDDY은 교과서 제작, 교육 교재 제작, 초등, 중등, 고등 교육에 대한 교재와 교육을 실시하는 기관입니다.">
<!-- <meta name="Robots" content="noindex, nofllow"> -->
<meta name="robots" content="index,follow">

<!-- 오픈 그래프(Open graph)-->
<meta property="og:type" content="website">
<meta property="og:title" content="BUDDY">
<meta property="og:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta property="og:image" content="${path1 }/images/chunjae_logo.png">
<meta property="og:url" content="${path1 }">

<!-- 트위터 -->
<meta name="twitter:card" content="picture">
<meta name="twitter:title" content="BUDDY">
<meta name="twitter:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta name="twitter:image" content="https://kktlove.github.io/web01/images/chunjae_logo.png">

<!-- 모바일 앱의 iOS 인 경우
<meta property="al:ios:url" content="ios 앱 url">
<meta property="al:ios:app_store_id" content="ios 앱스토어 ID" />
<meta property="al:ios:app_name" content="ios 앱 이름" />
-->

<!-- 모바일 앱의 Android 인 경우
<meta property="al:android:url" content="안드로이드 앱 URL" />
<meta property="al:android:app_name" content="안드로이드 앱 이름" />
<meta property="al:android:package" content="안드로이드 패키지 이름" />
<meta property="al:web:url" content="안드로이드 앱 URL" />
-->

<!-- 파비콘 설정 -->
<!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="${path1 }/images/week_fab.ico">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="${path1 }/images/logo_64.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="${path1 }/images/logo_48.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="${path1 }/images/logo_16.png" sizes="16x16">
<link rel="icon" href="${path1 }/images/logo_32.png" sizes="32x32">
<link rel="icon" href="${path1 }/images/logo_48.png" sizes="48x48">
<link rel="icon" href="${path1 }/images/logo_64.png" sizes="64x64">
<script>
    document.oncontextmenu = function() { return false; }
    document.ondragstart = function() { return false; }
    document.onselectstart = function() { return false; }
    //document.onkeydown = function() { return false; }
</script>

<style>
    * { margin: 0;  padding: 0; }
    body, html { width: 100%; }
</style>
<script src="./js/jquery-1.10.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="./js/nav.js"></script>
<link rel="stylesheet" href="./css/nav.css">
<style>
    .title { text-align: center; padding-top: 3rem; }
    #hd { border-bottom:2px solid #333; }
    #ft { border-top:2px solid #333; margin-top: 20px; }
    .list { list-style: none; }
    .list li { margin-top: 24px; }
    .msg { text-align: center; }
    .section {
        margin-top: 100px;
    }
    .btn-primary {
        background-color: #eb9362;
        border-color: #eb9362;
    }
    .btn-primary:hover {
        background-color: #eb9362;
        border-color: #eb9362;
    }
    #tb1 th { background-color: #eb9362; color:#fff; }
    #tb1 td {
        background-color: #ffffff;
    }
</style>
