<%@include file="user.jsp" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><%=siteName%>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="main_nav">
            <ul class="navbar-nav">
                <%
                    if (online) {
                %>
                <li class="nav-item active"><a class="nav-link"
                                               href="/profile"><%=currentUser.getName() +" "+ currentUser.getSurname()%>
                    </a></li>
                <li class="nav-item"><a class="nav-link" href="/home"> HOME </a></li>
                <li class="nav-item"><a class="nav-link" href="/profile"> PROFILE </a></li>
                <li class="nav-item"><a class="nav-link" href="/addFood"> ADD FOOD </a></li>
                <li class="nav-item"><a class="nav-link" href="/logOut"> Log out </a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link  dropdown-toggle" href="#" data-bs-toggle="dropdown"> Hover me </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#"> Submenu item 1</a></li>
                        <li><a class="dropdown-item" href="#"> Submenu item 2 </a></li>
                        <li><a class="dropdown-item" href="#"> Submenu item 3 </a></li>
                    </ul>
                </li>
                <%
                } else {
                %>

                <li class="nav-item active"><a class="nav-link" href="/home"> HOME </a></li>
                <li class="nav-item"><a class="nav-link" href="#"> Menu </a></li>
                <li class="nav-item"><a class="nav-link" href="/login"> Log In </a></li>
                <li class="nav-item"><a class="nav-link" href="/cart"> CART </a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link  dropdown-toggle" href="#" data-bs-toggle="dropdown"> Hover me </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#"> Submenu item 1</a></li>
                        <li><a class="dropdown-item" href="#"> Submenu item 2 </a></li>
                        <li><a class="dropdown-item" href="#"> Submenu item 3 </a></li>
                    </ul>
                </li>
                <%
                    }
                %>
            </ul>
        </div> <!-- navbar-collapse.// -->
    </div> <!-- container-fluid.// -->
</nav>