<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 목록</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: #eb9362; color:#fff; }
        .item1 { width:10%; }
        .item2 { width:20%; }
        .item3 { width:55%; }
        .item4 { width:15%; }
        #tb1 td {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">주문 내역</a></li>
                    <li class="breadcrumb-item active" aria-current="page">List</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">주문 내역</h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table table-secondary" id="tb1">
                    <thead>
                    <tr>
                        <th class="item1">번호</th>
                        <th class="item2">결제상품</th>
                        <th class="item3">결제정보</th>
                        <th class="item4">작업</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="pay" items="${payList }" varStatus="status">
                        <tr>
                            <td class="item1">${status.count }</td>
                            <td class="item2">
                                <span title="${pay.pno }">${pay.pname }</span>
                            </td>
                            <td class="item3">
                                <p>구매 수량 : ${pay.amount }</p>
                                <p>결제 방법 : ${pay.pmethod }</p>
                                <p>결제 대행 : ${pay.pcom }</p>
                                <p>결제 번호 : ${pay.cnum }</p>
                                <p>결제 금액 : ${pay.payprice }</p>
                            </td>
                            <td class="item4">
                                <c:if test="${pay.pstate==0}">
                                    <a href="${path }/ReturnPayment.do?sno=${pay.sno }" class="btn btn-primary">반품 요청</a>
                                </c:if>
                                <c:if test="${pay.pstate==1}">
                                    <a href="${path }/Delivery.do?sno=${pay.sno }" class="btn btn-primary">배송 조회</a>
                                </c:if>
                                <c:if test="${pay.pstate==2}">
                                    <span class="btn btn-primary">배송 완료</span>
                                    <a href="${path }/AddReview.do?sno=${pay.sno }" class="btn btn-primary">구매 결정</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty payList}">
                        <tr>
                            <td colspan="4">결제된 상품이 존재하지 않습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>