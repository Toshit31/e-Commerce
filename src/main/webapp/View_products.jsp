<%-- 
    Document   : View_products
    Created on : Dec 2, 2022, 3:50:33 PM
    Author     : Evangelina
--%>

<%@page import="com.learn.mycart.entities.User"%>
<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;

    } else {

        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;

        }

    }


%>

  <%  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();


// getting count 


Map<String,Long> m= Helper.getCounts(FactoryProvider.getFactory());


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel-Products Page</title>
        <%@include file="components/common_css_js.jsp" %>


    </head>
    <body>
        <%@include  file="components/navbar.jsp" %>
        <%@include  file="components/common_modals.jsp" %>
        <h1>Hello World!</h1>
    </body>
</html>
