
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Basket - Home </title>  
        <%@include file="components/common_css_js.jsp" %>

    </head></head>
<body id="Home">

    <%@include  file="components/navbar.jsp" %>

    <div class="HeroSection wrapper">
        <h1>Insanely Fresh Grocery, Delivered.</h1>
        <p>Buy Groceries from the comfort of your Home.</p>
        <a class="nav-link" href="products.jsp">View Products</a>
    </div>

    <% String cat = request.getParameter("category");
        //out.println(cat);

        ProductDao dao = new ProductDao(FactoryProvider.getFactory());
        List<Product> list = null;

        if (cat == null || cat.trim().equals("all")) {
            list = dao.getAllProducts();

        } else {

            int cid = Integer.parseInt(cat.trim());
            list = dao.getAllProductsById(cid);

        }

        CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
        List<Category> clist = cdao.getCategories();

    %>

    <!--show categories-->
    <div class="categories-section wrapper">
        <p class="categories-title">Explore Categories</p>
        <div class="categories-list">

            <a href="products.jsp?category=all" class="list-group-item list-group-item-action">
                <img src="img/all.png" class="card-image" alt="">
                <h1>All Products</h1>
                <p><%= list.size()%> items</p>
            </a>

            <% for (Category c : clist) {
            %>

            <a href="products.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action">
                <% if (c.getProducts().size() > 0) {%>
                <img src="img/products/<%= c.getProducts().get(0).getpPhoto()%>" class="card-image" alt="">
                <% } else {%>
                <img src="img/notfound.png" class="card-image" alt="">
                <% }%>

                <h1><%= c.getCategoryTitle()%></h1>
                <p><%= c.getProducts().size()%> items</p>
            </a>


            <%    }
            %>

        </div>

    </div>

    <!--show products-->
    <div class="featured-products wrapper">
        <%
            String CategoryName = "All Products";
            if (!(request.getParameter("category") == null || request.getParameter("category").trim().equals("all"))) {
                CategoryName = cdao.getCategoryById(Integer.parseInt((request.getParameter("category")))).getCategoryTitle();
            }
        %>
        <p class="categories-title">Featured Products</p>

        <div class="cards">

            <!--traversing products-->

            <%
                for (Product p : list) {

            %>

            <!--product card-->
            <% if (p.getpDiscount() > 0) {%>

            <div class="card">
                <span class="card-discount">Save <%= p.getpDiscount()%>%</span>
                <img src="img/products/<%= p.getpPhoto()%>" class="card-image" alt="">
                <div class="card-content">
                    <p class="card-category"><%= p.getCategory().getCategoryTitle()%></p>

                    <h5 class="card-title"><%= p.getpName()%></h5>

                    <!--                        <p class="card-desc">
                    <%= Helper.get10Words(p.getpDesc())%>

                </p>-->

                    <% if (p.getpDiscount() > 0) {%>
                    <p class="card-price">  &#8377; <%= p.getPriceAfterApplyingDiscount()%>/-  <span class="text-secondary discount-label">  &#8377; <%= p.getpPrice()%> </span></p>
                    <% } else {%>

                    <p class="card-price">  &#8377; <%= p.getPriceAfterApplyingDiscount()%>/-</p>
                    <% }%>
                    <div class="cart-full-btn">
                        <a style="display: none; cursor: pointer;" class="card-subtract" onclick="sub_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)"><svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="0.411883" y="0.411883" width="29.1772" height="29.1762" rx="13.5921" stroke="#F0F0F0" stroke-width="0.823767"/>
                            <path d="M20.5842 15.0001C20.5842 15.247 20.4895 15.4857 20.3125 15.6585C20.1396 15.8354 19.9009 15.9342 19.6539 15.9342H15.9328H14.0681H10.347C10.1 15.9342 9.86131 15.8354 9.68842 15.6585C9.51554 15.4857 9.41675 15.247 9.41675 15.0001C9.41675 14.7532 9.51554 14.5187 9.68842 14.3418C9.86131 14.1689 10.1 14.0702 10.347 14.0702H14.0681H15.9328H19.6539C19.9009 14.0702 20.1396 14.1689 20.3125 14.3418C20.4895 14.5187 20.5842 14.7532 20.5842 15.0001Z" fill="#B3B3B3"/>
                            </svg>
                        </a>
                        <span class="cart-quantity" style="display: none;">0</span>
                        <a class="card-btn" style="cursor: pointer;" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)"><svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_57_1285)">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M3.5 10.5C3.5 9.94772 3.94772 9.5 4.5 9.5C5.05228 9.5 5.5 9.94772 5.5 10.5C5.5 11.0523 5.05228 11.5 4.5 11.5C3.94772 11.5 3.5 11.0523 3.5 10.5Z" fill="white"/>
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M9 10.5C9 9.94772 9.44772 9.5 10 9.5C10.5523 9.5 11 9.94772 11 10.5C11 11.0523 10.5523 11.5 10 11.5C9.44772 11.5 9 11.0523 9 10.5Z" fill="white"/>
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M0 0.5C0 0.223858 0.223858 0 0.5 0H2.5C2.73831 0 2.94351 0.168193 2.99028 0.401872L3.41022 2.5H11.5C11.649 2.5 11.7903 2.56646 11.8852 2.68128C11.9802 2.79609 12.0191 2.94729 11.9911 3.09366L11.1904 7.29241C11.1219 7.63771 10.934 7.94788 10.6598 8.16863C10.3869 8.38829 10.0458 8.50548 9.69568 8.5H4.84432C4.49419 8.50548 4.1531 8.38829 3.88024 8.16863C3.60612 7.94797 3.41832 7.63796 3.34966 7.29283C3.34964 7.29269 3.34969 7.29297 3.34966 7.29283L2.51439 3.1196C2.51101 3.1058 2.50819 3.09177 2.50598 3.07754L2.09016 1H0.5C0.223858 1 0 0.776142 0 0.5ZM3.61036 3.5L4.33042 7.09759C4.35328 7.21269 4.4159 7.31608 4.50731 7.38967C4.59872 7.46325 4.71309 7.50234 4.83042 7.50009L4.84 7.5H9.7L9.70958 7.50009C9.82691 7.50234 9.94129 7.46325 10.0327 7.38967C10.1237 7.31642 10.1861 7.21365 10.2093 7.0992L10.8956 3.5H3.61036Z" fill="white"/>
                            </g>
                            <defs>
                            <clipPath id="clip0_57_1285">
                                <rect width="12" height="12" fill="white"/>
                            </clipPath>
                            </defs>
                            </svg>
                            Add to Cart</a>
                    </div>
                </div>
            </div>
            <% }%>


            <%}

                if (list.size() == 0) {
                    out.println("<h3>No item in this category.</h3>");
                }


            %>

        </div>                     

    </div>

    <div class="main-category wrapper">
        <div class="inner-card left">
            <span>Organic</span>
            <h1>Fresh Vegetables</h1>
            <p>Our freshly harvested veggies curated selection</p>
            <a href="products.jsp?category=14">Order Now <svg width="19" height="18" viewBox="0 0 19 18" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M3.5 9C3.5 8.58579 3.83579 8.25 4.25 8.25H14.75C15.1642 8.25 15.5 8.58579 15.5 9C15.5 9.41421 15.1642 9.75 14.75 9.75H4.25C3.83579 9.75 3.5 9.41421 3.5 9Z" fill="white"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M8.96967 3.21967C9.26256 2.92678 9.73744 2.92678 10.0303 3.21967L15.2803 8.46967C15.5732 8.76256 15.5732 9.23744 15.2803 9.53033L10.0303 14.7803C9.73744 15.0732 9.26256 15.0732 8.96967 14.7803C8.67678 14.4874 8.67678 14.0126 8.96967 13.7197L13.6893 9L8.96967 4.28033C8.67678 3.98744 8.67678 3.51256 8.96967 3.21967Z" fill="white"/>
</svg>
</a>
        </div>
        <div class="inner-card right">
            <span>Organic</span>
            <h1>Fresh Fruits</h1>
            <p>Organic fruits which are directly brought from farms</p>
            <a href="products.jsp?category=20">Order Now <svg width="19" height="18" viewBox="0 0 19 18" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M3.5 9C3.5 8.58579 3.83579 8.25 4.25 8.25H14.75C15.1642 8.25 15.5 8.58579 15.5 9C15.5 9.41421 15.1642 9.75 14.75 9.75H4.25C3.83579 9.75 3.5 9.41421 3.5 9Z" fill="white"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M8.96967 3.21967C9.26256 2.92678 9.73744 2.92678 10.0303 3.21967L15.2803 8.46967C15.5732 8.76256 15.5732 9.23744 15.2803 9.53033L10.0303 14.7803C9.73744 15.0732 9.26256 15.0732 8.96967 14.7803C8.67678 14.4874 8.67678 14.0126 8.96967 13.7197L13.6893 9L8.96967 4.28033C8.67678 3.98744 8.67678 3.51256 8.96967 3.21967Z" fill="white"/>
</svg>
</a>
        </div>
    </div>
            
    <img class="wrapper benefits" src="img/Benefits.png"/>

    <%@include  file="components/footer.jsp" %>

    <%@include  file="components/common_modals.jsp" %>
</body>
</html>
