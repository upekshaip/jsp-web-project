<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wishlist</title>
</head>
<body>
    <h1>My Wishlist</h1>
    <c:if test="${empty wishlist}">
        <p>Your Wishlist is empty.</p>
    </c:if>
    <c:forEach var="items" items="${wishlist}">
        <div>
            <h2>${product.name}</h2>
            <p>${product.description}</p>
            <form action="removeFromWishlist" method="post">
                <input type="" name="productId" value="${product.id}">
                <input type="" value="Remove from Wishlist">
            </form>
        </div>
    </c:forEach>
</body>
</html>
