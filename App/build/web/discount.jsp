<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Discount</title>
</head>
<body>
    <h1>--Add Discount--</h1>
    <form action="applyDiscount.jsp" method="post">
        Product ID: <input type="text" name="productId"><br>
        Discount Percentage: <input type="text" name="discountPercentage"><br>
        <input type="submit" value="Apply Discount">
        <input type="reset" value="cancel">
    </form>
</body>
</html>
