<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송 관리 리스트</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../../common.jsp"%>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: #eb9362; color:#fff; }
        .item1 { width:10%; }
        .item2 { width:15%; }
        .item3 { width:30%; }
        .item4 { width:30%; }
        .item5 { width:15%; }
        #page-nation1 { width: 960px; margin:20px auto; }
        .btn btn-primary {
            background-color: #eb9362;
            border-color: #eb9362;
        }
        #tb1 td {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="${path }/Admin.do">관리자페이지</a></li>
                    <li class="breadcrumb-item active" aria-current="page">배송 관리 리스트</li>
                </ol>
            </div>
        </nav>
        <div class="container-fluid">
            <h2 class="title">배송 관리 리스트</h2>
            <div class="container">
                <div class="box_wrap">
                    <table class="table table-secondary" id="tb1">
                        <thead>
                        <tr>
                            <th class="item1">배송 번호</th>
                            <th class="item2">구매자</th>
                            <th class="item3">주문일</th>
                            <th class="item4">연락처</th>
                            <th class="item5">배송 관리</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="del" items="${deliveryList }" varStatus="status">
                            <tr>
                                    <td class="item1">${del.dno }</td>
                                    <td class="item2">${del.cid }</td>
                                    <td class="item3">${del.sdate }</td>
                                    <td class="item4">${del.custel }</td>
                                    <td class="item5">
                                        <a href="${path }/AdminGetDelivery.do?dno=${del.dno }" class="btn btn-primary">배송 관리</a>
                                    </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty deliveryList}">
                            <tr>
                                <td colspan="4">배송 관리 내역이 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>