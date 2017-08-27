<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="container" style="width: 960px;margin: 0 auto;border-left: 0px solid #c0d3e8;border-right: 0px solid #c0d3e8;">

        <%--<div class="wrapper">--%>
            <%--<div id="wrapper">--%>

            <form method="POST" action="${contextPath}/login" name="Login_Form" class="form-signin">

                <p style="text-align:left;">
                    <h3 class="form-signin-heading">Real estate site - login page (Vika-sitemash)</h3>
                    <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                         alt="" >
                </p>

                <div class="form-group ${error != null ? 'has-error' : ''}">

                    <span>${message}</span>
                    <input name="username" type="text" class="form-control" placeholder="Username"
                           autofocus="true"/>
                    <input name="password" type="password" class="form-control" placeholder="Password"/>
                    <span>${error}</span>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
                    <h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>
                </div>

            </form>
        </div>
</div>

</br>
</br>
</br>
