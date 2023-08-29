<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../../common.jsp"%>
    <style>
    #tb1 { width:960px; margin:40px auto; }
    #tb1 th { background-color: #111; color:#fff; }
    .item1 { width:10%; }
    .item2 { width:70%; }
    .item3 { width:10%; }
    .item4 { width:10%; }
    #page-nation1 { width: 960px; margin:20px auto; }
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
                    <li class="breadcrumb-item active" aria-current="page">배송 관리</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">배송 관리</h2>
        <div class="container">
            <div class="box_wrap">
                <form action="${path }/AdminUpdateDeliveryPro.do" method="post">
                <table class="table table-secondary" id="tb1">
                    <tbody>
                    <tr>
                        <th>배송 번호</th>
                        <td>
                            <input type="text" name="dno" id="dno" class="indata" value="${del.dno }" readonly required/>
                        </td>
                    </tr>
                    <tr>
                        <th>결제 번호</th>
                        <td>
                            <input type="text" name="sno" id="sno" class="indata" value="${del.sno }" readonly required/>
                        </td>
                    </tr>
                    <tr>
                        <th>주문자</th>
                        <td>
                            <input type="text" name="cid" id="cid" class="indata" value="${del.cid }" readonly required/>
                        </td>
                    </tr>
                    <tr>
                        <th>배송지</th>
                        <td>
                            <input type="text" name="daddr" id="daddr" class="indata" value="${del.daddr }" readonly required/>
                        </td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>
                            <input type="text" name="custel" id="custel" class="indata" value="${del.custel }" readonly required/>
                        </td>
                    </tr>
                    <tr>
                        <th>배송회사</th>
                        <td>
                            <input type="text" name="pcom" id="pcom" class="indata" value="${del.pcom }" required/>
                        </td>
                    </tr>
                    <tr>
                        <th>배송기사 연락처</th>
                        <td>
                            <input type="text" name="ptel" id="ptel" class="indata" value="${del.ptel }" required/>
                        </td>
                    </tr>
                    <tr>
                        <th>처리 상태</th>
                        <td>
                            <input type="text" name="pstate" id="pstate" class="indata" value="${del.pstate }"  required/>
                        </td>
                    </tr>
                    <tr>
                        <th>배송 시작일</th>
                        <td>
                            <input type="text" name="sdate" id="sdate" class="indata" value="${del.sdate }" required/>
                            <input type="hidden" value="${del.rdate }" name="rdate" id="rdate" class="indata"/>
                        </td>
                    </tr>
                    <tr>
                        <th>화물코드</th>
                        <td>
                            <input type="text" name="bcode" id="bcode" class="indata" value="${del.bcode }" required/>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-group">
                    <input type="submit" value="로그인" class="btn btn-primary">
                    <a href="${path }" class="btn btn-primary">메인으로</a>
                </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>
