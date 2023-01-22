<%@page import="com.learn.mycart.entities.User"%>

<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;

    } else {

        if (user.getUserType().equals("admin")) {

            session.setAttribute("message", "You are not normal user ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;

        }

    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal User Panel</title>
        <%@include file="components/common_css_js.jsp" %>


    </head>
    <body>
        <%@include  file="components/navbar.jsp" %>
        <div class="col-md-6 ml-auto mr-auto mt-5">
            <!--form details-->
            <!--card-->
            <div class="card" style="border: none">
                <div class="card-body">

                    <h3 class="text-center mb-5">Welcome, <%= user.getUserName()%></h3>
                    <p><b>Your Email Address:</b> <%= user.getUserEmail()%></p>
                    <p><b>Your Phone Number:</b> <%= user.getUserPhone()%></p>
                    <p><b>Your Address:</b> <%= user.getUserAddress()%></p>
                    <br/>
                    <h4 class="walletTitle">Wallet</h4>
                    <p class="current-balance"><b>Current Balance:</b> ₹</p>
                    <form id="walletForm" onsubmit="addBalance()">
                        <input required type="number" min="100" placeholder="₹ 2000" name="walletBalance">
                        <button type="submit" type="button" class="addcartbtn btn btn-secondary">Add to Wallet</button>
                    </form>


                </div>
            </div>
        </div>
                    <img src="img/normalpage.png" class="normaluserimage">
                    
                                <%@include  file="components/common_modals.jsp" %>

    </body>
</html>
