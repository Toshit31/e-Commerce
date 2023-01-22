 
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");

%>


<nav class="navbar navbar-expand-lg navbar-dark navbar-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="img/Logo.svg" alt="alt"/>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav m-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="products.jsp">View Products <span class="sr-only">(current)</span></a>
                </li>




            </ul>

            <ul class="navbar-nav">


                <li class="nav-item active">
                    <a class="nav-link cart-container" href="#!" data-toggle="modal" data-target="#cart"><svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_9_1011)">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M7 21.5C7 20.3954 7.89543 19.5 9 19.5C10.1046 19.5 11 20.3954 11 21.5C11 22.6046 10.1046 23.5 9 23.5C7.89543 23.5 7 22.6046 7 21.5Z" fill="#253D4E"/>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M18 21.5C18 20.3954 18.8954 19.5 20 19.5C21.1046 19.5 22 20.3954 22 21.5C22 22.6046 21.1046 23.5 20 23.5C18.8954 23.5 18 22.6046 18 21.5Z" fill="#253D4E"/>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M0 1.5C0 0.947715 0.447715 0.5 1 0.5H5C5.47663 0.5 5.88701 0.836385 5.98055 1.30374L6.82043 5.5H23C23.298 5.5 23.5805 5.63293 23.7705 5.86256C23.9605 6.09218 24.0381 6.39458 23.9823 6.68733L22.3809 15.0848C22.2437 15.7754 21.868 16.3958 21.3195 16.8373C20.7738 17.2766 20.0916 17.511 19.3914 17.5H9.68864C8.98837 17.511 8.3062 17.2766 7.76048 16.8373C7.21225 16.3959 6.83664 15.7759 6.69933 15.0857C6.69927 15.0854 6.69939 15.0859 6.69933 15.0857L5.02879 6.7392C5.02201 6.71159 5.01638 6.68353 5.01195 6.65508L4.18032 2.5H1C0.447715 2.5 0 2.05228 0 1.5ZM7.22073 7.5L8.66084 14.6952C8.70656 14.9254 8.83179 15.1322 9.01461 15.2793C9.19743 15.4265 9.42619 15.5047 9.66084 15.5002L9.68 15.5H19.4L19.4192 15.5002C19.6538 15.5047 19.8826 15.4265 20.0654 15.2793C20.2474 15.1328 20.3723 14.9273 20.4185 14.6984L21.7913 7.5H7.22073Z" fill="#253D4E"/>
                            </g>
                            <defs>
                                <clipPath id="clip0_9_1011">
                                    <rect width="24" height="24" fill="white" transform="translate(0 0.5)"/>
                                </clipPath>
                            </defs>
                        </svg><span class="ml-0 cart-items">0</span> My cart</a>
                </li>



                <%                    if (user1 == null) {

                %>

                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login </a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register </a>
                </li>


                <%                        } else {


                %>
                <li class="nav-item active">
                    <a class="nav-link" href="<%=  user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>">Hi, <%= user1.getUserName()%> </a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout </a>
                </li>



                <%    }

                %>




            </ul>

        </div>

    </div>
</nav>