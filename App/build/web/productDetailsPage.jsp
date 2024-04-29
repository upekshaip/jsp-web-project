<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
</head>
<body>
    <h1>${product.name}</h1>
    <p>${product.description}</p>
    <form action="addToWishlist" method="post">
        <input type="hidden" name="productId" value="${product.id}">
        <input type="submit" value="Add to Wishlist">
    </form>
</body>
</html>
