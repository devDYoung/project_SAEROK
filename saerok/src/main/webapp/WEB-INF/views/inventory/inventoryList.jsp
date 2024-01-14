<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Inventory List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Inventory List</h2>
    <table>
        <thead>
            <tr>
                <th>품목 번호</th>
                <th>카테고리</th>
                <th>품목 이름</th>
                <th>재고</th>
                <th>안전 재고</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${inventoryList}" var="inventory">
                <tr>
                    <td>${inventory.itemId}</td>
                    <td>${inventory.itemCategory}</td>
                    <td>${inventory.itemName}</td>
                    <td>${inventory.stock}</td>
                    <td>${inventory.bufferStock}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
